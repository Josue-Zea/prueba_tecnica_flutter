# Prueba técnica - Vacante de Desarrollador Flutter

Prueba básica para aspirantes al equipo de desarrolladores
de Lomax Technologies.

## Descripción

Esta pequeña aplicación es el resultado de la realización de una prueba técnica para el puesto de Flutter Developer.

### Diseño de la aplicación

El diseño de de esta aplicación fue realizado en base a los requerimientos solicitados, minimalistas pero funcionales, cuenta con 2 páginas o vistas, una para manejar el inicio de sesión de los usuarios y otra para mostrar la información del usuario autenticado.

### Arquitectura de la aplicación

Para el manejo del estado se ha utilizado Provider, que permite centralizar la información de interés en un solo punto dentro de la aplicación.

Se opta por manejar una estructura de archivos y carpetas que mantenga cada módulo separado, de manera que, sea posible trabajar de manera ordenada, trabajando con widgets, modelos, providers, servicios y páginas de manera separada.

## Paquetes de terceros

* ### http:
    Utilizado para poder realizar solicitudes http dentro de la aplicación, fue necesaria su implementación para poder comunicar la aplicación con el servicio de autenticación.
* ### flutter_secure_storage:
    Utilizado para guardar y mantener la información sensible dentro del dispositivo, este paquete utiliza el mejor almacenamiento o estrategia de encriptación dependiendo del dispositivo que se esté utilizando.
* ### animate_do:
    Utilizada para realizar pequeñas    animaciones dentro de la aplicación, haciendola más interactiva y amigable al usuario final.

### Tiempo de desarrollo

| Tarea                     | Tiempo (Horas) |
|-------------------------------------|------|
| Desarrollo de vistas y navegación   | 2    |
| Desarrollo de funcionalidades       | 4    |
| Corrección de detalles estéticos    | 1    |
| Documentación para la entrega       | 0.5    |
| Total       | 7.5    |

El tiempo total para el desarrollo de la aplicación fue de 7 horas y 30 minutos aproximadamente.

Nota: Para ejecutar la aplicación es necesario tener una versión de flutter mayor a 3.2.4