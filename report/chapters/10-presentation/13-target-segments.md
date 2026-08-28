## 1.3. Segmentos Objetivo

En la fase inicial del proyecto, el ecosistema "Atelier Workshop" está circunscrito al modelo B2B (Business-to-Business). Por consiguiente, los segmentos objetivo se enfocan exclusivamente en los actores internos de la micro, pequeña y mediana empresa (MYPE) del sector de mantenimiento automotriz. Se ha excluido temporalmente a los conductores finales (B2C), quienes serán integrados en fases posteriores del producto (Atelier Driver).
Dentro del taller mecánico interactúan dos perfiles con características demográficas, tecnológicas y socioeconómicas diametralmente opuestas. El éxito de la adopción del software SaaS y la telemetría IoT depende de una interfaz que reconcilie estas diferencias. A continuación, se detalla el perfilamiento estadístico de ambos segmentos basado en estudios del mercado latinoamericano y peruano.

**Segmento 1: Gestores y Propietarios de Talleres Automotrices**

Este segmento está conformado por los dueños, administradores o gerentes de sucursal. Son los tomadores de decisiones de compra (*decision-makers*) y quienes asumen el riesgo financiero del negocio.

**Características Demográficas y Estructura:** El perfil predominante refleja a un "migrante digital". Según estudios del sector MYPE en el Perú, el 51% de los empleadores y dueños se ubican en el rango de 45 a 64 años. Existe una marcada predominancia masculina en cargos directivos industriales (62%), y el 60% de estas organizaciones opera bajo una estructura estrictamente familiar, lo que centraliza la toma de decisiones financieras (CEPAL, 2023; INEI, 2024). Muchos iniciaron su trayectoria como técnicos empíricos, por lo que carecen de educación formal en finanzas o ciencia de datos, priorizando la operatividad manual sobre la estrategia a largo plazo.

**Adopción Tecnológica y Madurez Digital:** Contrario a la creencia popular, el acceso a hardware no es una barrera: el 95.3% de los hogares a nivel nacional cuenta con acceso a telefonía móvil inteligente, y casi un 70% de las MYPEs urbanas utilizan aplicaciones de banca digital (billeteras electrónicas) para transacciones cotidianas (BCRP, 2024; INEI, 2024). Sin embargo, la madurez digital para tecnologías complejas (como sistemas ERP o IoT) es críticamente baja, ponderándose en apenas 1.75 sobre 5. Para el 57.6% de dueños que ha intentado usar un software de gestión, la percepción general es de frustración por la complejidad de la interfaz. Por ello, exigirán que el panel de administración de Atelier sea altamente intuitivo, demostrando retornos de inversión palpables.

**Contexto Económico y Laboral:** Operan en un sector asediado por la informalidad, la cual supera el 70% a nivel nacional en servicios y comercio (INEI, 2024). Muchos ven la evasión tributaria como método de supervivencia, lo que limita su capacidad de facturar y acceder a contratos lucrativos con flotas corporativas. Atelier representa para ellos una herramienta de transición para formalizarse bajo el Régimen MYPE Tributario (RMT), automatizar el control de almacenes (método FIFO) y maximizar márgenes de ganancia.

**Segmento 2: Técnicos Mecánicos Automotrices**

Este segmento está constituido por los mecánicos, operarios y asistentes técnicos. Actúan como los "usuarios intensivos" (*heavy users*) de la plataforma móvil, responsables de alimentar el ERP con datos físicos y gestionar el flujo MRO en las bahías de trabajo.

**Características Demográficas y Formación Académica:** Presentan un perfil de "nativo o migrante digital temprano". Se concentran mayoritariamente en cohortes de jóvenes (19 a 24 años) y adultos jóvenes (25 a 40 años). Debido a la sofisticación de los sistemas de inyección electrónica, el mecánico empírico está siendo desplazado por profesionales egresados de Educación Superior Técnica. Aunque el rubro sigue fuertemente masculinizado (sobre el 90%), su nivel de especialización es alto y en constante evolución.

**Adopción Tecnológica y Uso de Dispositivos Móviles:** La alfabetización digital es excepcional: el 96.4% de la población con educación superior técnica en el país utiliza activamente Internet, y más del 91% accede primariamente desde un smartphone (INEI, 2024). Los técnicos ya están habituados a interactuar con hardware complejo, como escáneres OBD-II multimarca. Sin embargo, un hallazgo crucial revela que el 49.1% de usuarios móviles en el país accede a internet sin un plan de datos activo constante, dependiendo de redes Wi-Fi. Esto exige de forma obligatoria que la aplicación móvil de Atelier aplique una arquitectura *Offline-First* para evitar interrupciones de uso en fosos o zonas del taller sin cobertura.

**Contexto Laboral y Económico:** Este grupo enfrenta condiciones laborales precarias y alta rotación. Los sueldos en el sector MYPE independiente promedian entre S/ 1,200 y S/ 2,800 mensuales (sujetos a estacionalidad y comisiones en efectivo), escalando a topes formales de S/ 4,000 solo en grandes concesionarias. La adopción de Atelier por este segmento está fuertemente incentivada si el sistema registra inmutablemente sus tiempos de reparación y órdenes finalizadas, permitiendo a la gerencia implementar esquemas de bonificaciones transparentes y meritocráticas.
\begin{table}[htpb]
    \centering
    \caption{Matriz Demográfica y Tecnológica de Segmentos Objetivo B2B en Talleres MYPE.}
    \label{tbl:target-segments-matrix}
    \renewcommand{\arraystretch}{1.5}
    \begin{tabularx}{\textwidth}{| X | X | X |}
        \hline
        \textbf{Criterio Analítico} & \textbf{Gestor y Propietario (Decisor)} & \textbf{Técnico Mecánico (Operario)} \\
        \hline
        \textbf{Rango Etario Dominante} & 45 a 64 años (Adultos maduros) & 19 a 40 años (Jóvenes / Adultos jóvenes) \\
        \hline
        \textbf{Nivel Educativo} & Empírico o Técnico Superior & Educación Superior Técnica (ej. SENATI) \\
        \hline
        \textbf{Rol en Atelier} & Consumo de datos (Dashboard ERP) & Generación de datos (Mobile App / IoT) \\
        \hline
        \textbf{Alfabetización Digital} & Baja para software complejo (ERP) & Alta (Nativos/migrantes digitales) \\
        \hline
        \textbf{Condicionante de Uso} & Retorno de Inversión y formalización tributaria & Interfaz ágil, funcionamiento \textit{Offline-First} \\
        \hline
        \textbf{Salario / Ingresos} & Rentabilidad global del negocio & S/ 1,200 a S/ 2,800 + Comisiones \\
        \hline
    \end{tabularx}
\end{table}

\newpage