# Documentación Técnica de Atelier

## 1. Visión General de Atelier (Product Overview)

**Atelier** es una plataforma ecosistémica B2B2C operando bajo un modelo de Software como Servicio (SaaS). Ha sido diseñada bajo una arquitectura moderna para revolucionar la industria de los talleres mecánicos y centros de servicio automotriz. 

A diferencia de los sistemas tradicionales, Atelier no es solo un software de facturación o gestión de inventario; es una solución de espectro completo que fusiona un **ERP** (Enterprise Resource Planning), un sistema **MRO** (Mantenimiento, Reparación y Operaciones), y un núcleo de **Telemetría IoT** con Inteligencia Artificial. Esto permite a los talleres administrar todos los aspectos de su negocio de manera digital, desde la llegada del vehículo y el seguimiento en tiempo real del trabajo de los mecánicos, hasta la predicción temprana de fallas mecánicas utilizando dispositivos de escaneo en los vehículos de sus clientes.

---

## 2. Características Clave (Core Features)

El sistema ha sido subdividido estratégicamente para cubrir cada arista del negocio automotriz:

* **Módulo de Mantenimiento, Reparación y Operaciones (MRO):** Trazabilidad física del vehículo en el taller, control de bahías/elevadores en tiempo real (Kanban), y asignación de tiempos de mano de obra a mecánicos específicos.
* **Telemetría IoT y Mantenimiento Predictivo (Core Diferenciador):** Integración con escáneres físicos (OBD2) para capturar telemetría (RPM, temperatura, códigos de fallo DTC) directamente de los sensores de los vehículos. Mediante algoritmos predictivos, el sistema alerta al taller para vender servicios proactivos al cliente antes de que ocurra una falla catastrófica.
* **ERP Integral (Inventario, Asistencia y Planillas):** Control estricto de repuestos con metodología de costos FIFO (First-In, First-Out), gestión de compras a proveedores, control de asistencia mediante geocercas GPS, y cálculo automatizado de nóminas (sueldos).
* **Autorización y Multi-tenancy (RBAC):** Arquitectura Multi-tenant pura con propagación de `tenant_id` y control de acceso basado en roles (Role-Based Access Control), asegurando un aislamiento total de la data entre diferentes talleres que usan el sistema.
* **Facturación SaaS y Cumplimiento Tributario:** Motor dual de facturación; por un lado, cobra a los talleres la suscripción por usar la plataforma de forma automatizada, y por el otro, emite facturas electrónicas válidas por la SUNAT para los clientes finales del taller.

---

## 3. Tech Stack y Ecosistema Tecnológico

La arquitectura de Atelier ha sido seleccionada cuidadosamente para cumplir con estándares empresariales de alta disponibilidad, seguridad y resiliencia.

### 3.1. Arquitectura Backend (Java & Spring Boot)
El backend emplea **Spring Boot 3.5.5** (la última versión estable compatible con **Java 24** a agosto de 2025), utilizando **Spring MVC** para la creación de endpoints RESTFul escalables, **Spring Data JPA** para las interacciones seguras con la base de datos relacional, y **Maven** para la gestión estricta de dependencias (incluyendo bibliotecas centrales como `spring-boot-starter-web` y `spring-boot-starter-data-jpa`).

Aprovechando las características más modernas de **Java 24** (tales como *records* para el transporte inmutable de datos y *pattern matching* para lógicas de control eficientes) y las mejoras estructurales de Spring Boot 3.5.5 (como el soporte mejorado para compilación nativa con **GraalVM** y características avanzadas de **observabilidad** para el monitoreo de microservicios), el backend garantiza un procesamiento robusto y de muy baja latencia. Se ha integrado adicionalmente **Caffeine Cache (L1)** a nivel de aplicación para reducir drásticamente las consultas repetitivas a la base de datos en catálogos y permisos estáticos.

### 3.2. Integración de Pagos (Stripe) y Reutilización (KMM)
El equipo busca integrar **Stripe** utilizando la dependencia oficial `stripe-java` (versión 26.x.x, la cual es nativamente compatible con Java 24) para habilitar un procesamiento de pagos seguro y elásticamente escalable para reparaciones vehiculares, suscripciones SaaS o pagos únicos en plataformas web y móviles. 

Las motivaciones para esta arquitectura unificada incluyen:
1. **Garantizar el cumplimiento normativo PCI-DSS**, delegando la tokenización de tarjetas a la infraestructura de Stripe.
2. **Maximizar la reutilización de código mediante Kotlin Multiplatform Mobile (KMM)**, permitiendo compartir lógicas de negocio, validaciones y modelos de datos entre las aplicaciones móviles (Android/iOS) y el ecosistema web.
3. Ofrecer experiencias de usuario altamente fluidas y consistentes tanto en web como en móvil.
4. Mantener un procesamiento robusto en el backend para webhook idempotency.
5. Alinear con los requisitos comerciales para desplegar soluciones de pago rentables, fiables y conformes a los estándares internacionales.

---

## 4. Integración de Servicios Externos de Bajo Costo

Para construir el ecosistema de Atelier manteniendo la rentabilidad y un alto estándar de calidad, el equipo ha orquestado la integración de múltiples APIs de terceros utilizando capas gratuitas (Free Tiers) o esquemas de pago por uso (Pay-as-you-go). 

### 4.1. Despliegue en la Nube y Base de Datos (Render & Aiven)
* **El Reto:** Alojamiento de la API RESTFul construida en Spring Boot 3.5.5 y gestión masiva de datos IoT sin incurrir en costos masivos.
* **La Solución:** El código fuente activará un pipeline CI/CD hacia **Render**. Para la base de datos PostgreSQL, se utilizará una instancia administrada en **Aiven**, aprovechando su soporte nativo para la extensión **TimescaleDB**. Esto permitirá manejar altas frecuencias de telemetría manteniendo la capacidad de hacer JOINs con el ERP relacional.

### 4.2. Geolocalización y Geocercas (Google Maps Platform)
* **El Reto:** Validar físicamente la asistencia de los empleados del taller mediante GPS.
* **La Solución:** En el Frontend se integrará **Google Places API** para autocompletar direcciones. En el Backend, durante el marcaje de asistencia, se utilizará la **Fórmula del Haversine** para calcular la distancia en metros. Si el empleado excede la *Geocerca* (ej. 50m), el sistema rechazará la entrada. 

### 4.3. Correos Transaccionales (SendGrid / Resend)
* **La Solución:** Uso del Free Tier de **SendGrid** o **Resend**. Spring Boot utilizará eventos asíncronos (`@Async`) y un `WebClient` para inyectar el cuerpo HTML del correo sin bloquear el hilo de respuesta principal.

### 4.4. Notificaciones Push y Alertas (Firebase Cloud Messaging - FCM)
* **La Solución:** La App móvil obtendrá un `fcm_token`. Cuando la IA detecte un riesgo mecánico, Spring Boot buscará el token del propietario y ejecutará una llamada HTTP mediante el **Firebase Admin SDK for Java** (gratuito) haciendo sonar la alerta en el celular del cliente.

### 4.5. Facturación Electrónica SUNAT (Nubefact - PSE)
* **La Solución:** Atelier delegará la firma de archivos UBL 2.1 mediante la API JSON V1 de **Nubefact** (Entorno Beta/Demo). Nubefact responderá inmediatamente con URLs (`sunat_pdf_url`, `sunat_xml_url`), las cuales Atelier guardará en la base de datos para mostrarlas en la interfaz.

---

## 5. Arquitectura de Software y Patrones Tácticos

Atelier está estructurado como un **Monolito Modular** impulsado por los principios del **Domain-Driven Design (DDD)**. 

### 5.1. Patrones Arquitectónicos Aplicados
* **Arquitectura Hexagonal (Ports and Adapters):** Cada módulo aísla su capa de Dominio (Entities, Value Objects, Domain Services) en el centro. Las interacciones hacia el exterior (Base de Datos, APIs externas) se realizan invirtiendo las dependencias a través de puertos (Interfaces) y adaptadores.
* **CQRS Lógico (Command Query Responsibility Segregation):** Las operaciones transaccionales de escritura utilizan entidades de dominio (JPA), mientras que las consultas de lectura pesadas utilizan proyecciones inmutables (Java Records) vía repositorios directos en la misma base de datos unificada, esquivando la sobrecarga de la caché de sesión de Hibernate.
* **Patrón Transactional Outbox:** Garantiza la consistencia eventual al integrar APIs (Stripe y Nubefact). Los eventos se guardan en la tabla local `outbox_messages` dentro de la transacción ACID del negocio, y un *worker* asíncrono los procesa con reintentos para asegurar entrega "Al menos una vez" (At-least-once).
* **Anticorruption Layer (ACL):** Se han implementado capas de anticorrupción estrictas al integrar pasarelas externas (Stripe y Nubefact) para evitar que los modelos de datos de estas empresas contaminen los modelos de dominio de Atelier.

### 5.2. Diseño Estratégico: Los 8 Bounded Contexts
El sistema se divide en **8 Bounded Contexts** (paquetes Java), cada uno agrupando un subconjunto específico de las 39 tablas de la base de datos.

1. **IAM & Multi-tenant Context** (`com.atelier.iam` | *Generic*)
   Gestiona RLS y RBAC. Tablas que lo conforman: `tenants`, `branches`, `users`, `profiles`, `user_devices`, `tenant_memberships`, `permissions`, `roles`, `role_permissions`, `membership_roles`, `audit_logs`, `notifications`.
2. **CRM & Fleet Reception Context** (`com.atelier.crm` | *Supporting*)
   Responsable del B2B2C. Tablas: `customers`, `vehicles`, `vehicle_ownerships`, `appointments`.
3. **MRO / Workshop Operations Context** (`com.atelier.mro` | *Core Subdomain*)
   Corazón operativo del taller. Tablas: `work_bays`, `work_orders`, `work_order_tasks`, `work_order_task_items`.
4. **Supply Chain & Inventory Context** (`com.atelier.inventory` | *Supporting*)
   Mini-ERP de logística FIFO. Tablas: `inventory_items`, `services`, `inventory_batches`, `supplier_invoices`, `purchase_lines`.
5. **Human Resources Context** (`com.atelier.hr` | *Generic*)
   Asistencia (Geocercas) y nóminas. Tablas: `work_shifts`, `attendance_records`, `payroll_payments`.
6. **Invoicing & SUNAT Context** (`com.atelier.invoicing` | *Supporting*)
   Capa ACL para comprobantes (Boletas/Facturas). Tablas: `electronic_vouchers`, `voucher_lines`.
7. **SaaS Subscriptions Context** (`com.atelier.subscriptions` | *Generic*)
   Capa ACL para la integración Stripe SaaS. Tablas: `plans`, `subscriptions`, `invoices`, `stripe_events`.
8. **IoT Telemetry Context** (`com.atelier.iot` | *Core Subdomain*)
   Núcleo diferenciador predictivo. Tablas: `obd2_devices`, `device_installations`, `telemetry_logs`, `vehicle_faults`, `predictive_alerts`.

---

## 6. Diseño Táctico: Esquema de Base de Datos (Parte 1)

El modelo de datos relacional de Atelier consta de **39 tablas** alojadas en PostgreSQL, estructuradas bajo un estricto diseño multi-tenant. A continuación, se detallan las tablas de los primeros 4 Bounded Contexts.

### Módulo 1: IAM & Multi-tenant (`com.atelier.iam`)

#### 1. `tenants` (El Taller / Empresa)
Identificador principal del workspace B2B.
* `id` (UUID, PK, NOT NULL): Identificador único.
* `name` (VARCHAR, NOT NULL): Nombre comercial.
* `legal_name` (VARCHAR, NOT NULL): Razón Social (Obligatorio para Facturación).
* `tax_id` (VARCHAR, UNIQUE): RUC de la empresa.
* `stripe_customer_id` (VARCHAR, NULL): ID mapeado para cobros SaaS en Stripe.
* `status` (VARCHAR, DEFAULT 'active'): Control de suscripción (`active`, `suspended`).

#### 2. `branches` (Sucursales)
* `id` (UUID, PK, NOT NULL): Identificador de sede.
* `tenant_id` (UUID, FK, NOT NULL): Ref. a `tenants`.
* `name` (VARCHAR, NOT NULL): Ej. Sede Miraflores.
* `sunat_code` (VARCHAR, NOT NULL): Código de anexo SUNAT (Ej. `0000`).
* `latitude` (DECIMAL, NULL): Coordenada GPS Y.
* `longitude` (DECIMAL, NULL): Coordenada GPS X.
* `geofence_radius_meters` (INT, DEFAULT 50): Radio para control de asistencia.

#### 3. `users` & 4. `profiles`
Tablas separadas para aislar credenciales de datos públicos.
* `users.id` (UUID, PK): ID global.
* `users.email` (VARCHAR, UNIQUE): Correo de acceso.
* `users.password_hash` (VARCHAR): BCrypt hash.
* `profiles.first_name` / `last_name` (VARCHAR): Nombres completos.

#### 5. `user_devices`
* `fcm_token` (VARCHAR, UNIQUE): Token de Firebase para Push Notifications.

#### 6. `tenant_memberships` (Contratos de Empleados)
* `id` (UUID, PK, NOT NULL).
* `tenant_id` (UUID, FK, NOT NULL).
* `user_id` (UUID, FK, NOT NULL).
* `salary_type` (VARCHAR): `fixed`, `hourly`.
* `base_salary` (DECIMAL): Sueldo pactado.

#### 7 al 10. RBAC Tables (`roles`, `permissions`, `role_permissions`, `membership_roles`)
Estructura estándar de seguridad para asignar permisos granulares (ej. `inventory:delete`) a los roles (`Mecánico`, `Administrador`) y luego al `membership_id` del empleado.

### Módulo 2: CRM & Fleet Reception (`com.atelier.crm`)

#### 11. `customers` (Directorio)
* `id` (UUID, PK)
* `tenant_id` (UUID, FK)
* `type` (VARCHAR): `individual` (Persona) o `company` (Empresa).
* `tax_id` (VARCHAR): DNI o RUC.

#### 12. `vehicles` & 13. `vehicle_ownerships`
* `vehicles.plate` (VARCHAR, UNIQUE): Placa vehicular.
* `vehicles.vin` (VARCHAR, UNIQUE): Número de chasis.
* `vehicle_ownerships.customer_id` (UUID, FK): Mantiene el historial de dueños si el auto es vendido de un cliente a otro.

#### 14. `appointments` (Citas)
* `id`, `tenant_id`, `branch_id`, `customer_id`, `vehicle_id`.
* `scheduled_at` (TIMESTAMP): Fecha pactada.
* `status` (VARCHAR): `pending`, `confirmed`, `arrived`.

### Módulo 3: MRO / Workshop Operations (`com.atelier.mro`)

#### 15. `work_bays` (Bahías Físicas)
* `id`, `tenant_id`, `branch_id`.
* `type` (VARCHAR): `lift` (Elevador), `paint_booth` (Pintura).

#### 16. `work_orders` (Órdenes de Trabajo)
* `id` (UUID, PK, NOT NULL).
* `appointment_id` (UUID, FK): Derivada de una cita.
* `current_bay_id` (UUID, FK): Localización física en tiempo real.
* `odometer` (INT): Kilometraje de ingreso.
* `status` (VARCHAR): `diagnosing`, `in_progress`, `ready`.

#### 17. `work_order_tasks` (Asignación de Mano de Obra)
* `work_order_id` (UUID, FK).
* `service_id` (UUID, FK): Qué se va a hacer (ej. Cambio de Aceite).
* `mechanic_id` (UUID, FK ref. `tenant_memberships`): Quién lo va a hacer.

#### 18. `work_order_task_items` (Consumo de Almacén)
* `task_id` (UUID, FK).
* `item_id` (UUID, FK ref. `inventory_items`): Qué repuesto físico usó el mecánico.
* `quantity` (DECIMAL): Cantidad utilizada.

### Módulo 4: Supply Chain & Inventory (`com.atelier.inventory`)

#### 19. `inventory_items` & 20. `services`
* Catálogo de productos físicos y mano de obra abstracta. `inventory_items` posee `total_stock` (Auto-calculado) y `base_sale_price`.

#### 21. `inventory_batches` (Lotes FIFO)
* `id`, `tenant_id`, `item_id`.
* `unit_cost` (DECIMAL): Costo exacto de compra de ese lote (Vital para saber la rentabilidad real).
* `initial_qty` / `remaining_qty` (DECIMAL): Control de cantidades.

#### 22. `supplier_invoices` & 23. `purchase_lines`
* Registra los gastos a proveedores mayoristas inyectando nuevas unidades a `inventory_batches`.
* `sunat_document` (VARCHAR): Tipo de comprobante de compra (Ej. `01` Factura).

---

## 7. Diseño Táctico: Esquema de Base de Datos (Parte 2)

A continuación, se detallan las tablas correspondientes a los módulos de Recursos Humanos, Facturación, Suscripciones e IoT.

### Módulo 5: Human Resources (`com.atelier.hr`)

#### 24. `work_shifts` (Turnos de Trabajo)
* `id` (UUID, PK, NOT NULL).
* `tenant_id` (UUID, FK).
* `name` (VARCHAR): Ej. "Turno Madrugada".
* `start_time` / `end_time` (TIME): Horario oficial.
* `grace_period_minutes` (INT): Tolerancia de tardanza (ej. 15).

#### 25. `attendance_records` (Marcaciones / Geocerca)
* `id` (UUID, PK).
* `membership_id` (UUID, FK): Empleado que marca.
* `clock_in` (TIMESTAMP): Hora exacta de validación GPS.
* `status` (VARCHAR): `on_time`, `late`, `absent`. (Calculado contra el `work_shift`).

#### 26. `payroll_payments` (Planillas / Nóminas)
* `id` (UUID, PK).
* `membership_id` (UUID, FK).
* `base_amount` (DECIMAL): Salario base del mes.
* `deductions` (DECIMAL): Descuentos generados automáticamente por tardanzas en `attendance_records`.
* `total_paid` (DECIMAL): Monto final a transferir.

### Módulo 6: Invoicing & SUNAT (`com.atelier.invoicing`)

#### 27. `electronic_vouchers` (Comprobantes de Pago)
* `id` (UUID, PK, NOT NULL).
* `tenant_id` (UUID, FK).
* `document_type` (VARCHAR): `01` (Factura) o `02` (Boleta).
* `serie` (VARCHAR): Ej. `F001`.
* `numero` (INT): Correlativo autoincremental de la serie (Ej. 1, 2, 3).
* `total_amount` (DECIMAL): Suma total + IGV.
* `sunat_pdf_url` / `sunat_xml_url` (VARCHAR): Enlaces proporcionados por Nubefact tras validar el JSON.

#### 28. `voucher_lines` (Detalle del Comprobante)
* `voucher_id` (UUID, FK).
* `quantity` (DECIMAL): Cantidad.
* `unit_price` (DECIMAL): Precio unitario sin IGV (Exigido por Nubefact).
* `total_line` (DECIMAL): Subtotal.

### Módulo 7: SaaS Subscriptions (`com.atelier.subscriptions`)

#### 29. `plans` & 30. `subscriptions`
* `plans.stripe_price_id` (VARCHAR): Identificador en Stripe (ej. `price_1N2M...`).
* `subscriptions.stripe_subscription_id` (VARCHAR): ID de la suscripción recurrente.
* `subscriptions.status` (VARCHAR): `active`, `past_due`, `canceled`.

#### 31. `invoices` & 32. `stripe_events`
* `invoices.amount_paid` (DECIMAL): Cobro a la tarjeta del Taller.
* `stripe_events.stripe_event_id` (VARCHAR, UNIQUE): Evita Webhook Idempotency (Si Stripe falla y manda el evento 2 veces, la base de datos rechaza el segundo).

### Módulo 8: IoT & Telemetría Predictiva (`com.atelier.iot`)

#### 33. `obd2_devices` & 34. `device_installations`
* `obd2_devices.id` (UUID, PK)
* `obd2_devices.tenant_id` (UUID, FK): Vital para Multi-tenant. Define qué taller es dueño del hardware.
* `obd2_devices.device_identifier` (VARCHAR, UNIQUE): IMEI (para equipos con SIM) o MAC Address (para Bluetooth).
* `obd2_devices.connection_type` (VARCHAR): `bluetooth`, `sim_cellular`.
* `device_installations.vehicle_id` (UUID, FK): Conecta el hardware al auto físico del cliente en un periodo de tiempo.

#### 35. `telemetry_logs` (TimescaleDB Hypertable)
* `id` (UUID, PK) *Nota: Optimizado para hiper-inserciones y compresión.*
* `tenant_id` (UUID, FK): Desnormalizado para agregaciones analíticas instantáneas por taller sin realizar JOINs masivos.
* `vehicle_id` (UUID, FK): Vehículo que generó la telemetría.
* `timestamp` (TIMESTAMP): **Utilizado como clave de partición (Time chunk) por TimescaleDB.**
* `latitude` (DECIMAL): Coordenada GPS Y (Crucial para rastreo de flotas).
* `longitude` (DECIMAL): Coordenada GPS X.
* `speed` (INT): Velocidad actual del vehículo.
* `engine_temp` (DECIMAL): Temperatura del motor en °C.
* `rpm` (INT): Revoluciones por minuto en tiempo real.

#### 36. `vehicle_faults` (Códigos de Error - DTC)
* `vehicle_id` (UUID, FK).
* `dtc_code` (VARCHAR): Ej. `P0420` (Fallo de convertidor catalítico).
* `severity` (VARCHAR): `low`, `critical`.

#### 37. `predictive_alerts` (Mantenimiento Proactivo IA)
* `vehicle_id` (UUID, FK).
* `confidence_score` (DECIMAL): Porcentaje de certeza del algoritmo (ej. `88.5%`).
* `recommended_service_id` (UUID, FK): Cruza directamente con el módulo de Inventario para enviarle una notificación Push al cliente sugiriendo comprar ese servicio específico preventivamente.

---

## 8. Consideraciones y Mejoras Arquitectónicas (Decisiones Recientes)

Tras una revisión arquitectónica del proyecto, se han incorporado las siguientes decisiones clave (ADR) para garantizar la viabilidad y resiliencia del sistema:

1. **Migración a Aiven PostgreSQL (TimescaleDB):** Se sustituye Neon Serverless por Aiven. Esto permite usar **TimescaleDB** como una extensión nativa, transformando `telemetry_logs` en una *Hypertable* optimizada para Time-Series, manteniendo la capacidad de hacer JOINs con las tablas del ERP sin requerir bases de datos políglotas como MongoDB.
2. **Patrón Transactional Outbox:** Para evitar inconsistencias entre cobros exitosos (Stripe) y facturas fallidas (Nubefact/SUNAT), se insertará un evento en una tabla común (`outbox_messages`) en la misma transacción de base de datos. Un *worker* asíncrono (`@Scheduled`) leerá y enviará estas peticiones garantizando entrega al menos una vez (At-least-once delivery).
3. **CQRS Lógico:** En lugar de implementar bases separadas para lectura y escritura, se usará la misma base de datos relacional. Las escrituras se harán a través de Spring Data JPA, mientras que las lecturas masivas usarán **Java 24 Records** y proyecciones SQL ligeras para esquivar la sobrecarga de Hibernate.
4. **Caffeine Cache (L1):** Se introduce una capa de caché en memoria para los Bounded Contexts de alta lectura estática (Roles de IAM, Planes de Suscripción, Catálogos de MRO). Esto mitiga los tiempos de respuesta y alivia los accesos a Aiven.