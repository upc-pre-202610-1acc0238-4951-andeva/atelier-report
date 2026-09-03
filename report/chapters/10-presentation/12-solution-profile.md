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

**El estado actual de** la industria del mantenimiento, reparación y operaciones automotrices (MRO) **se caracteriza principalmente por** un modelo puramente reactivo de *"reparar tras la avería"*, en el que dueños de talleres mecánicos tradicionales, técnicos y conductores de vehículos enfrentan diagnósticos manuales lentos y propensos a errores, descontrol de inventario de repuestos sin métodos de costeo estandarizados, ausencia total de trazabilidad operativa en las reparaciones y costos correctivos que superan entre un 300% y un 400% el valor de una intervención preventiva oportuna.

**Lo que los productos y servicios existentes no logran abordar es** la ausencia de un ecosistema accesible, unificado y nativo en la nube que integre telemetría vehicular IoT en tiempo real sin imponer la adquisición de hardware propietario costoso con una plataforma de gestión integral de taller que aplique costeo de inventario estricto por lotes (FIFO), evidencia fotográfica digital inmutable, control de asistencia laboral por geocercas y cumplimiento tributario electrónico automatizado.

**Nuestro producto abordará esta brecha mediante** **Atelier**, una plataforma SaaS bilateral y agnóstica en hardware, diseñada bajo Domain-Driven Design (DDD). Atelier conecta vehículos a través de escáneres OBD-II estándar del mercado (con SIM celular o vía Bluetooth usando el smartphone del conductor como *gateway*) para ingestar telemetría en series temporales y disparar alertas predictivas por notificaciones push. Simultáneamente, provee aplicaciones web y móviles especializadas por rol (*Atelier Workshop* para el taller y *Atelier Driver* para el conductor) que digitalizan el ciclo completo de órdenes de trabajo, automatizan el agendamiento de citas, protegen los márgenes de ganancia y entregan transparencia total al cliente final sobre el historial de su vehículo.

**Nuestro enfoque inicial estará en** talleres automotrices independientes de pequeña y mediana escala (MYPEs), administradores de flotas livianas comerciales y conductores particulares de Lima Metropolitana.

**¿Cómo podríamos** diseñar una plataforma que transforme la relación entre talleres y conductores, migrándola de un modelo correctivo y opaco hacia un ecosistema preventivo, transparente y basado en datos telemétricos en tiempo real, sin exigir inversiones prohibitivas en hardware propietario?

**Sabremos que tenemos éxito cuando observemos** los siguientes cambios medibles en el comportamiento de nuestro público objetivo:

1. Al menos el **35% de las citas de servicio** agendadas en los talleres afiliados se originen directamente a partir de alertas telemétricas predictivas automáticas (desviaciones de PIDs o códigos DTC).
2. Una **reducción de al menos el 40%** en el tiempo de recepción vehicular y diagnóstico preliminar, gracias a los datos telemétricos precargados y al flujo digital de órdenes de trabajo desde la aplicación móvil.
3. Una **tasa de retención mensual** de talleres suscritos **superior al 96%** (deserción mensual inferior al 4%).
4. Una **disminución del 30%** en pérdidas económicas por discrepancias de inventario mediante la aplicación automatizada del método de valorización FIFO por lotes de compra.

#### 1.2.2.2. Lean UX Assumptions

**Business Assumptions**

1. Creemos que existe una demanda insatisfecha en el mercado automotriz peruano por una plataforma SaaS integral que unifique la gestión operativa del taller con telemetría vehicular IoT en tiempo real.
2. Creemos que el modelo de suscripción mensual escalonado (por taller y por volumen de vehículos conectados) será viable y sostenible para MYPEs del sector automotriz.
3. Creemos que la estrategia de plataforma bilateral (B2B para talleres y B2C para conductores) generará efectos de red que incrementarán el valor del ecosistema a medida que crezcan ambos lados del mercado.
4. Creemos que la filosofía *Hardware Agnostic* (BYOD) eliminará la principal barrera de adopción tecnológica al no exigir la compra de dispositivos propietarios costosos.
5. Creemos que nuestra arquitectura Monolítica Modular bajo Domain-Driven Design nos permitirá evolucionar el producto de forma incremental sin incurrir en la complejidad operativa prematura de los microservicios.

**Business Outcome Assumptions**

1. Creemos que lograremos una tasa de retención mensual de talleres suscritos superior al 96% dentro de los primeros 12 meses de operación.
2. Creemos que al menos el 35% de las citas de servicio agendadas en los talleres afiliados se originarán directamente a partir de alertas telemétricas predictivas automáticas.
3. Creemos que reduciremos en al menos un 40% el tiempo de recepción vehicular y diagnóstico preliminar en los talleres que adopten la plataforma.
4. Creemos que disminuiremos en un 30% las pérdidas económicas por discrepancias de inventario en talleres que utilicen el módulo de costeo FIFO automatizado.
5. Creemos que el costo de adquisición de clientes (*Customer Acquisition Cost* - CAC) se reducirá progresivamente conforme los conductores satisfechos recomienden talleres afiliados dentro del ecosistema.

**User Assumptions**

1. Creemos que nuestro usuario principal del lado B2B es el dueño o administrador de un taller mecánico independiente de pequeña o mediana escala (MYPE), ubicado en Lima Metropolitana, con entre 2 y 15 empleados, que actualmente gestiona su operación de forma manual o con herramientas genéricas no especializadas.
2. Creemos que nuestro usuario secundario del lado B2B es el técnico mecánico de campo, quien requiere una interfaz móvil simplificada y de uso rudo para registrar diagnósticos, evidencia fotográfica y avances de órdenes de trabajo directamente desde la bahía de servicio.
3. Creemos que nuestro usuario principal del lado B2C es el conductor particular o administrador de flota liviana comercial que desea visibilidad en tiempo real sobre la salud mecánica de su vehículo y transparencia total sobre los servicios realizados en el taller.
4. Creemos que ambos segmentos de usuarios poseen teléfonos inteligentes con conectividad de datos y están familiarizados con aplicaciones móviles de uso cotidiano, aunque no necesariamente con software especializado de gestión automotriz.

**User Outcome and Benefit Assumptions**

1. Creemos que los dueños de taller desean proteger sus márgenes de ganancia mediante un control automatizado de costos de repuestos (FIFO por lote de compra) y la eliminación de fugas de capital por costeo empírico.
2. Creemos que los técnicos mecánicos desean reducir el tiempo y la incertidumbre del diagnóstico accediendo a datos telemétricos precargados del vehículo antes de su llegada física al taller.
3. Creemos que los conductores desean evitar averías catastróficas e imprevistas recibiendo alertas predictivas oportunas basadas en la telemetría de su vehículo, y poder agendar citas de mantenimiento preventivo directamente desde su aplicación móvil.
4. Creemos que los administradores de flotas desean trazabilidad operativa completa y reportes consolidados del estado de salud de todos sus vehículos para optimizar la planificación logística y reducir tiempos de inactividad.
5. Creemos que ambos segmentos valoran la transparencia: los conductores quieren un historial de servicio verificable con evidencia fotográfica inmutable, y los talleres quieren que esa transparencia fortalezca la confianza y la fidelización del cliente.

**Feature Assumptions**

1. Creemos que un módulo de ingesta telemática en tiempo real (procesamiento de PIDs OBD-II y códigos DTC mediante series temporales) permitirá al taller diagnosticar vehículos de forma remota antes de su recepción física.
2. Creemos que un sistema de alertas predictivas por notificaciones push, disparadas por desviaciones en los parámetros telemétricos, incentivará a los conductores a agendar citas de mantenimiento preventivo de forma proactiva.
3. Creemos que un módulo de gestión de órdenes de trabajo digitales con registro fotográfico inmutable (*Direct-to-Cloud*) eliminará la vulnerabilidad probatoria y aumentará la confianza del cliente en el servicio recibido.
4. Creemos que un sistema de costeo de inventario automatizado bajo el método FIFO por lote de compra protegerá los márgenes de ganancia del taller y reducirá las pérdidas por discrepancias de inventario.
5. Creemos que un módulo de agendamiento inteligente de citas, alimentado por datos telemétricos y disponibilidad del taller, reducirá la fricción en la coordinación entre conductor y taller.
6. Creemos que un mecanismo de registro de tiempos por técnico en cada orden de trabajo, complementado con validación de proximidad por geocerca al taller, optimizará el control de productividad operativa sin requerir un módulo de recursos humanos independiente. La expansión hacia un sistema integral de gestión de personal se considera una iteración de fase posterior.
7. Creemos que la implementación de aplicaciones móviles especializadas por rol (*Atelier Workshop* y *Atelier Driver*) mejorará la experiencia de usuario al ofrecer flujos de trabajo específicos para cada segmento.
8. Creemos que un módulo de cumplimiento tributario electrónico automatizado reducirá la carga administrativa del taller y asegurará la conformidad regulatoria con la normativa peruana vigente.

#### 1.2.2.3. Lean UX Hypothesis Statements

**Hypothesis Statement 1: Ingesta Telemática en Tiempo Real y Diagnóstico Remoto**

**Creemos que lograremos** una reducción de al menos el 40% en el tiempo promedio de recepción vehicular y diagnóstico preliminar en el taller,  
**si** los técnicos mecánicos  
**obtienen** acceso anticipado y en tiempo real a los parámetros de salud vehicular (PIDs en series temporales) y códigos de falla (DTCs) antes del ingreso físico del automóvil,  
**mediante** un módulo de ingesta telemática en la nube conectado a escáneres OBD-II estándar (*Hardware Agnostic*).

**Hypothesis Statement 2: Sistema de Alertas Predictivas por Notificaciones Push**

**Creemos que lograremos** que al menos el 35% de las citas de servicio agendadas en los talleres afiliados se originen directamente a partir de alertas automáticas,  
**si** los conductores particulares y administradores de flotas livianas  
**obtienen** avisos preventivos tempranos y comprensibles sobre desviaciones mecánicas inminentes para evitar averías graves y sobrecostos,  
**mediante** un motor de reglas y notificaciones push automáticas disparadas por eventos telemétricos.

**Hypothesis Statement 3: Órdenes de Trabajo Digitales con Registro Fotográfico Inmutable**

**Creemos que lograremos** una tasa de retención mensual de talleres afiliados superior al 96% (deserción mensual inferior al 4%),  
**si** los dueños de taller y los clientes conductores  
**obtienen** máxima transparencia, trazabilidad probatoria y respaldo visual inmutable del estado del vehículo antes, durante y después de la reparación,  
**mediante** un módulo digital de órdenes de trabajo con captura y carga directa de evidencia fotográfica a la nube (*Direct-to-Cloud*).

**Hypothesis Statement 4: Control y Valorización de Inventario por Método FIFO**

**Creemos que lograremos** que el 100% de los repuestos consumidos en las reparaciones se registren y descuenten digitalmente vinculados a su lote de compra específico antes de liquidar la orden de trabajo,  
**si** los técnicos mecánicos y administradores de taller  
**obtienen** un mecanismo simple de escaneo y asignación de ítems que elimine la necesidad de anotaciones manuales o cálculos empíricos de costos,  
**mediante** un módulo de inventario automatizado que aplique estrictamente el método de valorización FIFO por lotes de compra.

**Hypothesis Statement 5: Agendamiento Inteligente de Citas Basado en Telemetría**

**Creemos que lograremos** elevar la tasa de ocupación efectiva de las bahías de trabajo al 85% y reducir los tiempos de espera no programados a menos de 15 minutos,  
**si** los conductores y el personal de recepción del taller  
**obtienen** un flujo ágil de reserva coordinado en función de la severidad del diagnóstico telemétrico y la disponibilidad horaria en tiempo real de los mecánicos,  
**mediante** un módulo de agendamiento inteligente integrado bidireccionalmente entre la telemetría vehicular y el calendario del taller.

**Hypothesis Statement 6: Registro de Tiempos por Técnico y Validación de Proximidad**

**Creemos que lograremos** reducir la brecha entre el tiempo estimado y el tiempo real de mano de obra a menos de un 10% por orden de trabajo,  
**si** los jefes de taller y técnicos mecánicos  
**obtienen** un control cronometrado de inicio y fin por etapa operativa sin fricción manual y con validación de presencia efectiva en el taller,  
**mediante** un mecanismo de registro de tiempos por técnico vinculado a la orden de trabajo y validado por geocerca perimetral.

**Hypothesis Statement 7: Aplicaciones Móviles Especializadas por Rol (*Workshop* y *Driver*)**

**Creemos que lograremos** que más del 80% de los técnicos activos y de los conductores registrados utilicen la aplicación móvil como su canal diario prioritario para la gestión y seguimiento vehicular,  
**si** ambos perfiles  
**obtienen** una experiencia de uso adaptada a su contexto real (interfaces de alto contraste y pocos toques para mecánicos en bahía; vistas claras de salud del auto y notificaciones directas para conductores),  
**mediante** dos aplicaciones móviles nativas y especializadas por rol (*Atelier Workshop* y *Atelier Driver*).

**Hypothesis Statement 8: Cumplimiento Tributario y Facturación Electrónica Integrada**

**Creemos que lograremos** una reducción del 75% en el tiempo de liquidación y cierre administrativo de las órdenes de trabajo (emisión de comprobante en menos de 2 minutos tras la aprobación),  
**si** los administradores de taller  
**obtienen** la emisión inmediata de comprobantes electrónicos válidos ante SUNAT generados automáticamente a partir de la liquidación de mano de obra y repuestos,  
**mediante** un módulo de facturación electrónica integrado que conecte directamente el cierre de la orden de trabajo con el servicio de comprobantes de pago digitales.

#### 1.2.2.4. Lean UX Canvas

![Matriz del Lean UX Canvas para el Ecosistema Atelier](../../assets/Lean%20UX.jpg){#fig:lean-ux-canvas}

**Enlace al tablero interactivo:** [Ver en Miro](https://miro.com/welcomeonboard/ZEZJcWF2dElmbVAwcG1VV2JxUEc2RHpsSkxHL25uNE9RcFBVaTdxekxqNTlxK2xmczRXTDVXTzNvS2NDMXdKUkRjQmxNMDZhUmpvQlZ0cEllS21yMHZZMDFnbHRlL0pwSHhNR2l0WmhaL0hYaDJpVUtNT0VlRWZscEt1Y3plNU5BS2NFMDFkcUNFSnM0d3FEN050ekl3PT0hdjE=?share_link_id=553176034482)

\newpage