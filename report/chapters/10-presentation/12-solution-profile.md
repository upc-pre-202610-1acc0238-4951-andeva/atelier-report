## 1.2. Solution Profile

### 1.2.1. *Antecedentes y Problemática*

Para poder establecer de manera precisa la problemática que nuestro ecosistema de software busca resolver, hemos aplicado la técnica de análisis de problemas **5W's y 2H's**. Esta metodología nos permite focalizarnos en las causas y en el problema real:

**What (¿QUÉ?)**
El problema radica en la gestión reactiva y carente de tecnología en los talleres mecánicos tradicionales, lo que ocasiona costosas reparaciones correctivas por averías graves y una deficiente administración interna que imposibilita la fidelización del cliente.

**When (¿CUÁNDO?)**
Este problema se manifiesta de forma crítica en dos momentos clave. Por parte del cliente final, se evidencia en el momento exacto en que el vehículo sufre una falla mecánica inesperada o una avería grave durante su trayecto y uso diario, interrumpiendo abruptamente su rutina. Por parte del negocio, el problema está presente constantemente durante la operativa diaria del taller, especialmente al intentar gestionar los cuellos de botella generados por ingresos imprevistos de vehículos, la falta de repuestos adecuados debido a un mal manejo de inventario y la ausencia de un flujo automatizado para coordinar las reparaciones y las citas de manera eficiente.

**Where (¿DÓNDE?)**
La problemática tiene un impacto dual que afecta a dos entornos distintos pero interconectados. Físicamente, el problema se materializa en las vías públicas, carreteras o zonas de tránsito cotidiano donde los conductores particulares o las flotas comerciales experimentan las averías vehiculares. A nivel administrativo y estructural, el problema reside en el entorno operativo interno de los propios talleres mecánicos, afectando directamente sus áreas de recepción de vehículos (gestión de citas), sus zonas de trabajo (asignación ineficiente de mano de obra en las bahías) y sus almacenes (falta de control de stock bajo métodos estandarizados como FIFO).

**Who (¿QUIÉN?)**
La problemática impacta directamente a dos segmentos principales de la industria. En primer lugar, afecta a los dueños, administradores y empleados de los talleres mecánicos, cuyas habilidades técnicas y operativas se ven limitadas por la falta de herramientas digitales, lo que resulta en un descontrol de los procesos, pérdida de ventas cruzadas y fuga de clientes. En segundo lugar, afecta de manera severa a los usuarios finales, conformados tanto por conductores particulares como por gestores de flotas empresariales, quienes carecen de visibilidad sobre el estado de salud real de sus vehículos y terminan siendo las principales víctimas de los altos costos y la pérdida de tiempo.

**Why (¿POR QUÉ?)**
El origen estructural del problema se debe a la total desconexión tecnológica y de comunicación entre el estado de salud interno del vehículo y la capacidad de monitoreo del taller. Al no contar con sistemas de telemetría IoT (como dispositivos OBD2) integrados a un ecosistema unificado en la nube (ERP/MRO), los talleres operan "a ciegas". Esta ausencia de datos en tiempo real (PIDs) y alertas de códigos de falla (DTCs) hace que sea técnicamente imposible aplicar un modelo de mantenimiento predictivo, forzando a todo el ecosistema automotriz a reaccionar únicamente cuando el componente físico ya ha fallado por completo de manera catastrófica.

**How (¿CÓMO?)**
En un escenario óptimo e ideal, la tendencia debería ser proactiva: el taller lograría monitorear el vehículo de manera remota y alertaría al cliente preventivamente antes de que la falla crítica se concrete, automatizando al mismo tiempo la reserva de repuestos y la cita. Sin embargo, la tendencia actual en el mercado sigue un patrón completamente reactivo y aleatorio para el conductor. La avería aparece de forma sorpresiva, desencadenando un proceso de diagnóstico artesanal que resulta excesivamente lento, manual y propenso a errores, alejándose totalmente de la eficiencia y exactitud que brindaría un servicio apoyado en el análisis de datos telemétricos.

**How Much (¿CUÁNTO?)**
El impacto económico y operativo es sustancial para ambas partes. Para el conductor o la empresa dueña de la flota, esperar a que el vehículo se descomponga implica asumir gastos de reparación correctiva que pueden llegar a ser entre 3 y 4 veces superiores al costo que habría tenido un mantenimiento preventivo a tiempo, sumado a los días de inactividad del vehículo que paralizan sus operaciones. Para el taller mecánico, la ineficiencia logística, el mal manejo de inventario sin costeo FIFO y la falta de estrategias de retención basadas en la prevención, se traducen sistemáticamente en miles de dólares mensuales en oportunidades de rentabilidad desperdiciadas y pérdida de competitividad en el sector.

**Antecedentes del Dominio del Problema**

La disciplina del mantenimiento automotriz ha transitado históricamente por fases conceptuales diferenciadas: el mantenimiento reactivo (*run-to-failure*) y el mantenimiento preventivo basado en umbrales estáticos (kilometraje o tiempo). Sin embargo, la creciente complejidad electromecánica exige la transición hacia el **mantenimiento predictivo**. Investigaciones de frontera demuestran que la integración del estándar de diagnóstico a bordo (OBD-II) con arquitecturas de aprendizaje automático permite procesar series temporales generadas por sensores vehiculares (RPM, temperatura, presión), logrando clasificar estados de fallo inminentes con precisiones superiores al 95% (Hossain et al., 2024; Michailidis et al., 2025). 

A pesar de la madurez de estos modelos, en Perú el sector de reparación automotriz (compuesto en su mayoría por MYPEs) exhibe una inmadurez digital estructural. Aunque el 94% de las pymes declaran haber invertido en tecnología post-pandemia, la digitalización en talleres mecánicos suele limitarse a redes sociales o mensajería, dejando el núcleo operativo vulnerable y operando de forma empírica (Velásquez Chacón, 2025).

Para romper este ciclo, la adopción del Internet de las Cosas (IoT) aplicado a la telemetría vehicular es el habilitador indispensable. Esto se logra mediante *gateways* telemétricos: dispositivos OBD-II con tarjetas SIM autónomas, o dispositivos Bluetooth (BLE) que utilizan el teléfono inteligente del conductor como puente de transmisión de datos hacia la nube, democratizando el acceso a diagnósticos avanzados.

**Problemática Actual e Impacto Socioeconómico**

En el área metropolitana de Lima, esta desconexión tecnológica es crítica. Según los reportes oficiales de la Asociación Automotriz del Perú (AAP), la antigüedad promedio de la flota vehicular en circulación supera los 14 años, representando un riesgo exponencial de fallos y contaminación por gases de escape (AAP, 2025). Operar este parque bajo un modelo reactivo fuerza a los propietarios a asumir gastos de reparación correctiva que son, en promedio, entre el 300% y el 400% superiores a los costos de una intervención preventiva oportuna.

El costo de oportunidad por no digitalizar estos procesos es inmenso. El mercado global de aplicaciones de mantenimiento predictivo automotriz alcanzó los $4.8 mil millones de dólares en 2025, con proyecciones de escalar a $14.7 mil millones hacia 2034, y un ingreso promedio estimado de $112 dólares anuales por cada vehículo conectado (Dataintelo, 2025). Los talleres peruanos que no integren estas capacidades perderán competitividad rápidamente.

\begin{table}[htpb]
    \centering
    \caption{Síntesis de indicadores macroeconómicos y proyecciones del mercado de telemetría y mantenimiento predictivo.}
    \label{tbl:telemetry-market-indicators}
    \renewcommand{\arraystretch}{1.5}
    \begin{tabularx}{\textwidth}{| X | X | X |}
        \hline
        \textbf{Métrica del Mercado} & \textbf{Valor Registrado (Año 2025)} & \textbf{Proyección / Implicancia (Hacia 2034)} \\
        \hline
        Valoración del Mercado Global & \$4.8 Billones de USD & \$14.7 Billones de USD (CAGR 13.2\%) \\
        \hline
        Ingreso Promedio por Vehículo Conectado (ARPU) & \$52 USD / año & \$112 USD / año \\
        \hline
        Antigüedad del Parque Automotor en Perú & > 14 años promedio histórico & Riesgo exponencial de fallos y alta contaminación \\
        \hline
    \end{tabularx}
\end{table}

Para transformar este ecosistema obsoleto y revertir las ineficiencias operativas descritas, Atelier ha sido concebido para resolver de manera directa tres fronteras críticas del dominio mediante una arquitectura Monolítica Modular. Cada uno de estos puntos ataca una deficiencia específica que imposibilita la escalabilidad de los talleres mecánicos:

**Ausencia de Ingesta Telemática y Análisis Predictivo:** Se debe resolver la "ceguera" técnica del taller procesando los flujos masivos de telemetría temporal de los vehículos. Esto exige separar la base de datos relacional transaccional (PostgreSQL) de la carga analítica IoT, empleando estructuras de series temporales (TimescaleDB) para no degradar el rendimiento del ERP.

**Fricción en la Trazabilidad Operativa (MRO):** Es necesario digitalizar todo el ciclo de vida de la reparación, desde la cita hasta el ingreso a la bahía de trabajo. Con ello se erradica la vulnerabilidad probatoria al implementar un registro fotográfico inmutable directamente desde el móvil hacia la nube de almacenamiento (*Direct-to-Cloud*).

**Colapso Financiero por Descontrol de Inventarios:** Los talleres sufren constantes fugas de capital por aplicar costeos empíricos. Nuestra solución impone algorítmicamente el método de costeo FIFO, vinculando cada repuesto consumido a su lote de compra original para garantizar la rentabilidad real de la orden de trabajo.

Como respuesta a estas problemáticas, el proyecto persigue metas estratégicas enfocadas en revolucionar la forma en la que operan los negocios automotrices. A nivel macro, nuestros propósitos generales apuntan a una transformación integral y tecnológica del sector:

**Orquestar un ecosistema SaaS bilateral:** Consolidar toda la operatividad logística, de recursos humanos y administrativa del taller automotriz (B2B), habilitando al mismo tiempo el paradigma del mantenimiento predictivo inteligente a través de telemetría IoT orientada al consumidor final (B2C).

**Transformar el modelo de negocio automotriz:** Evolucionar la industria de un enfoque puramente reactivo (*run-to-failure*) a uno proactivo y predictivo. Esto se logra democratizando el acceso a diagnósticos avanzados mediante el uso de escáneres OBD-II bajo un modelo donde el taller o el cliente trae su propio dispositivo (*Hardware Agnostic*).

Para materializar esta visión global, nos hemos trazado acciones específicas y cuantificables que guiarán la construcción de la plataforma y asegurarán la viabilidad operativa del ecosistema:

**Garantizar la resiliencia en la ingesta telemática:** Soportar la captura y compresión de millones de datos temporales (PIDs OBD-II) mediante hipertablas, procesando códigos de fallos de motor (DTCs) para disparar alertas predictivas simultáneas (*Push*) hacia el taller y al conductor.

**Asegurar la trazabilidad financiera:** Lograr que la totalidad de las órdenes de trabajo operativas calculen su margen de ganancia descontando repuestos bajo un principio contable estricto (FIFO).

**Proveer herramientas multiplataforma especializadas:** Desplegar interfaces web gerenciales para dueños, y aplicaciones móviles de uso rudo para los mecánicos, aplicando un riguroso control de acceso basado en roles (RBAC).

El desarrollo de este ecosistema se encuentra delimitado por restricciones técnicas, académicas y presupuestales que moldean su alcance final durante la fase de despliegue:

**Alcance Tecnológico:** El backend se desarrollará obligatoriamente en Java (Spring Boot) siguiendo los lineamientos de diseño guiado por el dominio (*Domain-Driven Design*). Para el frontend, se utilizará simultáneamente Flutter y Kotlin (Nativo en Android) para evaluar su rendimiento frente a las conexiones Bluetooth con escáneres vehiculares.

**Infraestructura de Pruebas IoT (MVP):** Debido a los altos costos y normativas, el ecosistema no será validado sobre motores de combustión reales operando de forma continua. El sistema se probará inyectando telemetría simulada a través de microcontroladores y transceptores CAN Bus que actuarán como emuladores de hardware, validando así la resiliencia de los puntos de conexión (*endpoints*) del backend.

**Tolerancia y Cuotas de APIs Externas:** La integración con servicios de misión crítica (como pasarelas de pago y facturación electrónica) estará restringida a los límites de procesamiento de sus capas gratuitas (*Free Tier*). Esto obliga al sistema a implementar mecanismos de caché y patrones de consistencia asíncrona (*Transactional Outbox*) para evitar la saturación.

**Agnosticismo Predictivo:** El sistema proporcionará probabilidades de fallo basadas en datos, pero actuará exclusivamente como un sistema experto de recomendación. La responsabilidad legal y la validación técnica final recaerán indelegablemente en la pericia y criterio del técnico mecánico.

### 1.2.2. *Lean UX Process*



#### 1.2.2.1. Lean UX Problem Statements



#### 1.2.2.2. Lean UX Assumptions



#### 1.2.2.3. Lean UX Hypothesis Statements



#### 1.2.2.4. Lean UX Canvas



\newpage