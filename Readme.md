Marino RealTime S.A
Sistema de monitoreo de telemetría industrial en tiempo real para la supervisión de estaciones de energía entre Villa Ballester y Villa Gesell.

Funcionalidades
Visualización Geográfica: Mapa interactivo con Leaflet que muestra la ubicación de las estaciones y la ruta de conexión.

Gráficos en Tiempo Real: Análisis visual de tendencias de sensores (Tensión, Corriente, Potencia) utilizando Chart.js.

Reportes Técnicos: Generación de informes profesionales en formato PDF (A4) que incluyen gráficos y tablas de mediciones mediante html2canvas y jspdf.

Gestión de Datos: API interna en PHP para la consulta de bases de datos relacionales MariaDB/MySQL.

Tecnologías Utilizadas
Frontend: HTML5, CSS3 (Bootstrap 5), JavaScript (Vanilla).

Visualización: Chart.js, Leaflet.js.

Backend: PHP 8.x.

Base de Datos: MariaDB / MySQL.

Librerías de Exportación: html2canvas, jsPDF.

Estructura del Proyecto
index.html: Interfaz de usuario y lógica de presentación.

api.php: Endpoint que gestiona las consultas SQL y entrega datos en formato JSON.

db.sql: Script de creación de la base de datos estaciones y carga de datos iniciales.

Instalación y Configuración
Base de Datos:

Importar el archivo db.sql en tu servidor local (XAMPP/WAMP).

Asegurarse de que el servidor MySQL esté corriendo en el puerto por defecto (3306).

Servidor Web:

Colocar los archivos index.html y api.php en el directorio htdocs o www.

Verificar las credenciales de conexión en api.php (actualmente configuradas como root sin contraseña).

Acceso:

Abrir el navegador en http://localhost/nombre-de-tu-carpeta/.

 Modelo de Datos
La base de datos incluye una estructura normalizada con las siguientes tablas principales:

estaciones: Información geográfica de los puntos de monitoreo.

sensores: Catálogo de tipos de medición (Tensión, Corriente, etc.).

medicion: Registro histórico de valores capturados con fecha y hora.

Desarrollado para Marino RealTime S.A - Villa Ballester, Argentina.