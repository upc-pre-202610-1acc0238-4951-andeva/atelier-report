### 2.5.3. *Software Architecture*

En esta sección el equipo presenta y explica la representación, aplicando **C4 Model**, de la Arquitectura de Software para la solución del ecosistema **Atelier**, incluyendo todos los productos que forman parte de su alcance. **Atelier** es un ecosistema SaaS puro y **hardware agnostic** diseñado para transformar los talleres automotrices integrando capacidades de ERP, MRO y telemetría IoT predictiva.

El modelado arquitectónico abarca las aplicaciones principales del ecosistema:

**Atelier Workshop:** Aplicación orientada al segmento B2B (dueños y mecánicos), disponible en versión de aplicación web y aplicación móvil, provista de una sólida arquitectura multi-tenant y estricto control de acceso basado en roles.

**Atelier Driver:** Aplicación móvil B2C orientada a los clientes finales para la gestión de citas y recepción de alertas predictivas IoT.

Para lograr un sistema escalable, mantenible y resiliente ante las condiciones adversas de conectividad de los talleres, la arquitectura orquesta un robusto backend centralizado en Java 24 con Spring Boot y bases de datos híbridas. En el lado del cliente, las aplicaciones móviles implementan obligatoriamente un patrón offline first, apoyándose en cachés locales y colas de sincronización asíncrona gestionadas por **background workers** para evitar la pérdida de telemetría y garantizar la operatividad en fosos sin cobertura. Finalmente, el ecosistema delega operaciones de misión crítica a plataformas de terceros mediante patrones tácticos.

A continuación, se incluyen como subsecciones internas los diagramas a nivel de contexto (Context Level), a nivel de contenedores (Container Level) y los diagramas de despliegue (Deployment) que detallan las interacciones, las tecnologías y la infraestructura de nuestra plataforma tecnológica.


#### 2.5.3.1. Software Architecture Context Level Diagrams

En esta sección se presenta el diagrama de nivel de contexto (Context Level Diagram) para el ecosistema Atelier. Este diagrama modela al sistema en el centro, rodeado de sus usuarios principales y de los sistemas de software externos con los que colabora para proporcionar toda la funcionalidad requerida.

Como se puede observar, el sistema se integra de manera estratégica con hardware de telemetría IoT, procesadores de pago, sistemas de facturación electrónica y servicios en la nube clave de Firebase y Google. Esto permite delegar responsabilidades específicas y mantener un **core domain** altamente cohesivo.

![System Context Diagram for Atelier Ecosystem](report/assets/c4-diagrams/structurizr-SystemContext.png)

#### 2.5.3.2. Software Architecture Container Level Diagrams



#### 2.5.3.3. Software Architecture Deployment Diagrams



\newpage