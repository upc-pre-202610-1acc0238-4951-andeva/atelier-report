# Ecosistema Atelier: Desglose del Producto

## 1. El Problema y Nuestra Solución Core
Atelier nace con el propósito de **transformar radicalmente el modelo operativo tradicional de los talleres automotrices**, evolucionándolo de un enfoque puramente **reactivo** (reparar cuando el vehículo ya está averiado) a un modelo **preventivo e inteligente**.

Este salto tecnológico se logra a través de la integración de nuestro software con dispositivos **OBD2**. Nuestro *feature* principal es el **mantenimiento preventivo**, el cual genera un impacto directo en dos frentes:

* **Para los Talleres Mecánicos (B2B):** Logra la fidelización absoluta del cliente al ofrecer un servicio proactivo. Además, Atelier funciona como un potente sistema ERP y MRO que otorga control total del negocio, abarcando ámbitos administrativos (control de personal, inventario, gestión de citas, órdenes de trabajo) y económicos (módulos de facturación y cobranza).
* **Para los Conductores/Clientes (B2C / B2B2C):** Representa una reducción drástica en costos, al evitar y prevenir averías graves que terminarían siendo reparaciones costosas.

## 2. Modelo de Negocio y Hardware
Es imperativo aclarar que **Andeva NO vende hardware**. 
* **El Software:** Nosotros ofrecemos Atelier como un **Software as a Service (SaaS)** a través de modelos de suscripción mensual o anual con diferentes planes para el taller.
* **El Hardware (OBD2):** El taller es responsable de adquirir el modelo de dispositivo OBD2 que prefiera del mercado. Atelier está construido para **reconocer y anclarse a cualquier dispositivo OBD2**.
* **Instalación y Telemetría:** Proveemos los manuales de instrucción al taller para que puedan instalar los dispositivos en los vehículos de los clientes que contraten el servicio de telemetría. 

**Tipos de conexión OBD2 soportados:**
1. **Con tarjeta SIM:** Los datos del vehículo se mandan directamente a nuestro servidor de manera independiente.
2. **Con Bluetooth (BLE) / WiFi:** Los datos son enviados a través de la aplicación móvil del conductor, la cual actúa como *gateway* o puerta de enlace hacia nuestro servidor.

---

## 3. Arquitectura del Producto: Las Dos Caras de Atelier
Similar a plataformas de ecosistemas bilaterales (como Uber o Rappi), Atelier se divide en dos grandes aplicaciones para conectar a los talleres con sus clientes.

### Fase 1: Atelier Workshop
Es el pilar operativo del ecosistema, diseñado específicamente para los **dos segmentos B2B: Personal de Gestión** (dueños, administradores) y **Personal Operativo** (mecánicos, recepcionistas, asesores de servicio).

* **Aplicación Web:** Un portal de gestión integral donde converge toda la administración del taller.
  * **RBAC y Multi-tenant:** Está diseñado con una arquitectura segura basada en el control de acceso por roles (RBAC). Las vistas y permisos están estrictamente segmentados: el personal operativo (ej. un mecánico) no tiene acceso al módulo de *billing* o control de personal; un administrador de sucursal (gestión) tiene visión y control solo sobre el local asignado; y el dueño de la franquicia o taller posee el control maestro y la vista de todas sus sucursales.
* **Aplicación Móvil Cross-Platform:** Una versión optimizada del ecosistema diseñada para smartphones y tablets que unifica a ambos segmentos mediante RBAC. Permite al Personal de Gestión supervisar el patio, aprobar presupuestos y revisar métricas de rentabilidad desde cualquier lugar, mientras brinda al Personal Operativo la movilidad necesaria para interactuar con escáneres OBD2 por Bluetooth y registrar tareas de mantenimiento.
  * **Soporte Offline-First:** Las tareas asignadas y la recolección de evidencia fotográfica están diseñadas para funcionar sin conexión en las fosas o áreas de baja cobertura del taller, apoyándose en bases de datos relacionales locales sobre **SQLite** (implementadas mediante **Room Database** en la app nativa de Android/Kotlin y mediante **`sqflite`** en la versión de Flutter), que se sincronizan con la nube cuando el dispositivo se re-conecta a la red.

### Fase 2: Atelier Driver
Es la aplicación orientada al **Segmento 3: Propietarios de Vehículos (Particulares y Flotas)** (es decir, personas particulares con un vehículo o empresas con una flota de vehículos).
* **NOTA PARA DOCUMENTACIÓN (Regla AI):** Al igual que se especifica en la documentación principal, este tercer segmento de clientes finales pertenece a la Fase 2 y **NO SE CONTEMPLA** en la documentación de negocio del proyecto (historias de usuario, diseño UX, problem statement, etc.). **Sin embargo, sí se contempla y se modela explícitamente** en las secciones de Arquitectura de Software (2.5.3) y Tactical-Level Domain-Driven Design (2.6) para asegurar que el backend y los modelos escalen correctamente.

* **Aplicación Móvil Cross-Platform:** El canal de comunicación y control del cliente.
* **Para vehículos CON el servicio OBD2 activo:**
  * El conductor puede visualizar el estado de salud de su carro en tiempo real gracias a los datos enviados por el OBD2.
  * Recibe las alertas preventivas generadas por el sistema.
  * Si el OBD2 es Bluetooth/WiFi, la app de Atelier Driver permanece en segundo plano funcionando como *gateway* hacia el servidor.
  * **Telemetría Offline (Batching):** Entendiendo que el 49.1% de usuarios carece de datos móviles constantes, la app en modo offline lee los datos Bluetooth y los guarda localmente. Al detectar Wi-Fi, los empaqueta y los dispara en bloque hacia los servidores predictivos.
  * Capacidad de agendar citas en el taller de manera automatizada.
* **Para vehículos SIN el servicio OBD2 activo (o no vinculados):**
  * Un conductor puede registrar cualquier vehículo, incluso si no desea pagar por el servicio de OBD2 y las alertas preventivas.
  * En este escenario, la app sigue siendo sumamente útil: permite agendar citas con el taller, visualizar estimaciones de costos para las órdenes de trabajo, y acceder al historial completo del vehículo (registros pasados, citas, órdenes de trabajo finalizadas, e incluso alertas pasadas en caso de que el vehículo alguna vez haya gozado del servicio de telemetría).
  * En conclusión, la app Driver funciona como la interfaz de usuario del ERP del taller, fidelizando al cliente a través de la transparencia y la facilidad de gestión de su propio vehículo.
