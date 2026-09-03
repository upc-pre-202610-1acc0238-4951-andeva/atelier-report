workspace "Atelier Architecture" "Diagramas de Arquitectura C4 para el Proyecto Atelier" {

    model {
        !include model/actors.dsl
        !include model/external-systems.dsl
        !include model/systems/atelier-core.dsl

        // Relaciones entre actores y el sistema
        manager -> atelier "Administra su taller, inventario y personal usando"
        mechanic -> atelier "Ejecuta órdenes de trabajo y actualiza estado usando"
        driver -> atelier "Visualiza histórico clínico, alertas predictivas y reserva citas usando"
        
        // Relaciones IoT
        obd2_sim -> atelier "Envía telemetría masiva (PIDs y DTCs) por red celular a" "TCP/IP"
        
        // Relaciones del sistema hacia sistemas externos
        atelier -> stripe "Procesa cobros recurrentes de suscripciones SaaS usando" "HTTPS/API"
        atelier -> nubefact "Delega la emisión de comprobantes electrónicos a" "HTTPS/API"
        atelier -> fcm "Envía notificaciones push predictivas a móviles vía" "HTTPS/API"
        atelier -> firebase_storage "Delega el almacenamiento de imágenes a" "HTTPS/API"
        atelier -> sendgrid "Envía invitaciones asíncronas de onboarding vía" "HTTPS/API"
        atelier -> google_maps "Normaliza direcciones y resuelve coordenadas GPS de asistencia usando" "HTTPS/API"
        
        // Relaciones directas (Direct-to-Cloud)
        mechanic -> firebase_storage "Sube fotos de reparación directamente a" "HTTPS"
        manager -> firebase_storage "Sube fotos de comprobantes directamente a" "HTTPS"
    }

    views {
        !include views/context-views.dsl

        styles {
            element "Person" {
                shape Person
                background #08427b
                color #ffffff
            }
            element "Software System" {
                background #1168bd
                color #ffffff
            }
            element "External" {
                background #999999
                color #ffffff
            }
        }
    }
}
