group "Andeva" {
    atelier = softwareSystem "Atelier Ecosystem" "Plataforma SaaS de ERP, MRO y telemetría predictiva automotriz." {
        landing = container "Landing Page" "Sitio web estático que expone la propuesta de valor, planes para talleres y accesos a la plataforma." "HTML5, CSS3, TypeScript" "WebBrowser"
        webapp = container "Web Application" "Portal web SPA para la administración general del taller, finanzas, inventario FIFO, RRHH y facturación." "Angular 20, TypeScript, Angular Material" "WebBrowser" {
            !include ../components/webapp-components.dsl
        }
        workshop_mobile = container "Mobile Workshop" "Aplicación móvil Offline-First para el personal del taller con soporte BLE para OBD2, supervisión MRO y métricas." "Flutter, Kotlin, SQLite, Room" "MobileDevicePortrait"
        driver_mobile = container "Mobile Driver" "Aplicación móvil para conductores y flotas para gestión de citas, histórico y telemetría en tiempo real." "Flutter" "MobileDevicePortrait"
        api = container "API Application" "Monolito modular con DDD, Clean Architecture, CQRS, ACL y Outbox Pattern para ERP, MRO, IoT y facturación." "Java 24, Spring Boot 3.5, Caffeine" "BackendApi" {
            !include ../components/api-components.dsl
        }
        db = container "Database" "Base de datos multi-tenant relacional y de series de tiempo para telemetría vehicular." "PostgreSQL 16, TimescaleDB" "Database"
    }
}
