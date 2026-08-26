# Arquitectura y Estrategia de Implementación de "Atelier" (SaaS)

## 1. Visión Comercial: Modelo "Hardware Agnostic" (SaaS Puro)

Atelier es una plataforma SaaS (Software as a Service) pura. **No vende, no ensambla y no distribuye hardware.** El modelo de negocio se basa en el principio **BYOD** (Bring Your Own Device). El cliente (dueño del taller o flota) adquiere su propio hardware y Atelier proporciona la plataforma en la nube, las aplicaciones y el manual de configuración.

### Los Dos Tipos de Dispositivos Soportados

Para abarcar todo el mercado, Atelier soporta los dos ecosistemas de telemetría existentes:

1. **OBD2 con SIM (Standalone / Independientes):**
   - **Cómo funcionan:** Tienen un módem GSM/4G interno. Envían datos de telemetría directo al backend de Atelier sin pasar por un celular.
   - **Planes de Datos:** Requieren una tarjeta SIM. **El cliente (dueño del taller/flota) es quien compra la SIM y paga el plan de datos mensual.** Al ser solo texto, consumen unos ~30MB al mes (planes M2M muy económicos).
   - **Configuración:** Mediante un manual provisto por Atelier, el cliente envía un SMS al dispositivo para indicarle la IP/Dominio de nuestro servidor.
   - **Uso ideal:** Flotas empresariales o talleres grandes que requieren rastreo 24/7 sin depender del teléfono del chofer.

2. **OBD2 Bluetooth / WiFi (Dependientes):**
   - **Cómo funcionan:** Escáneres económicos (aprox. $10, con chip ELM327) que se conectan por Bluetooth al celular del mecánico o conductor.
   - **Planes de Datos:** No requieren SIM propia. Utilizan el internet del celular del usuario (la App Móvil sirve de puente).
   - **Uso ideal:** Talleres pequeños, inspecciones rápidas, o consumidores finales que no quieren pagar mensualidades de líneas telefónicas extra.

---

## 2. Fase 1: Curso de Dispositivos Móviles

Para cumplir con el requerimiento académico de usar **Kotlin y Flutter**, el equipo aplicará una estrategia de **"Clonación Académica"**. Se desarrollará exactamente la misma aplicación ("Atelier Workshop") en ambas tecnologías, permitiendo evaluar al final del curso cuál se queda para producción.

### App: "Atelier Workshop"

La aplicación unificará al Dueño y al Mecánico utilizando Control de Acceso Basado en Roles (RBAC), evitando el doble desarrollo a nivel de producto.

1. **Login y Backend (Java):** El servidor (Spring Boot) devuelve un token JWT con el rol del usuario (`MANAGER` o `MECHANIC`).
2. **Vista de MANAGER (Dueño):** Muestra dashboards financieros, control de inventario, lista de vehículos y gestión de mecánicos.
3. **Vista de MECHANIC (Empleado):** Oculta finanzas. Muestra autos asignados y una interfaz para conectarse al OBD2 Bluetooth, escanear errores y enviar telemetría a la nube.

### A. Implementación en Flutter (Multiplataforma)

- **Alcance:** iOS, Android, y opcionalmente Web (perfecto para que el Manager vea todo en su computadora).
- **Módulo Bluetooth:** Se usarán paquetes como `flutter_bluetooth_serial` o `flutter_blue_plus`.
- **Procesamiento OBD2:** El código enviará PIDs estándar en hexadecimal (ej. `010C` para RPM) al dispositivo, parseará la respuesta y la enviará al backend Java como JSON.

### B. Implementación en Kotlin (Android Nativo)

- **Alcance:** Android (Ideal para las tablets de trabajo rudo dentro de los talleres).
- **Módulo Bluetooth:** Uso de `BluetoothAdapter` y `BluetoothSocket` junto con **Coroutines** y **Flows** para lograr una lectura asíncrona altamente estable.
- **Procesamiento OBD2:** Background Services (Servicios en segundo plano) muy estables que mantienen la conexión con el vehículo aunque la app se minimice.

---

## 3. Fase 2: Curso de IoT

En el curso de IoT, demostrarás la ingesta de los dispositivos **OBD2 con SIM (Tipo A)**.

### Emulador de Hardware Comercial (Prueba de Concepto)

Para no comprar un equipo costoso, ensamblarás un hardware que simulará ser un equipo de rastreo comercial.

1. **Componentes:** Microcontrolador (ej. ESP32), un módulo GSM (ej. SIM800L) y un transceptor CAN Bus para leer un motor (o potenciómetros para simularlo en clase).
2. **Firmware (C/C++):** Escribirás un programa que recopile datos, los pase a JSON y utilice el módem SIM para hacer un HTTP POST directamente a la IP del backend en Java (`/api/v1/telemetry`).
3. **Logro:** Demostrarás que el backend de Atelier es verdaderamente "Hardware Agnostic" y está listo para producción B2B.

---

## 4. Fase 3:

Una vez terminada se desarrollará el tercer pilar del negocio para expandir el mercado al consumidor final.

### App: "Atelier Driver" (Para clientes/dueños de los autos)

- **Funciones:** El cliente final descarga la app para ver el historial clínico de su auto, agendar citas en el taller, aprobar presupuestos, y recibir notificaciones IoT predictivas (ej. "Tu OBD2 detecta fallo en cilindro 3, agenda aquí").
- **Recomendación Tecnológica:** **Flutter**.
  - _¿Por qué no React Native?_ Tras la Fase 1, el equipo ya dominará Flutter. Podrán **reutilizar código** (paquetes compartidos de modelos, autenticación, y conexión al backend Java) entre "Atelier Workshop" y "Atelier Driver". Además, Flutter garantiza despliegue inmediato y de alta calidad tanto en iPhone como en Android sin curva de aprendizaje adicional.