-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.32-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.16.0.7229
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para estaciones
CREATE DATABASE IF NOT EXISTS `estaciones` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `estaciones`;

-- Volcando estructura para tabla estaciones.estacion_sensor
CREATE TABLE IF NOT EXISTS `estacion_sensor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estacion_id` int(11) DEFAULT NULL,
  `sensor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Estacion_sensor_estaciones` (`estacion_id`),
  KEY `FK_Estacion_sensor_sensor` (`sensor_id`),
  CONSTRAINT `FK_Estacion_sensor_estaciones` FOREIGN KEY (`estacion_id`) REFERENCES `estaciones` (`id_estacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Estacion_sensor_sensor` FOREIGN KEY (`sensor_id`) REFERENCES `sensor` (`id_sensor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla estaciones.estacion_sensor: ~5 rows (aproximadamente)
INSERT INTO `estacion_sensor` (`id`, `estacion_id`, `sensor_id`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 1, 3),
	(4, 2, 1),
	(5, 2, 2);

-- Volcando estructura para tabla estaciones.estaciones
CREATE TABLE IF NOT EXISTS `estaciones` (
  `id_estacion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `latitud` decimal(20,6) DEFAULT NULL,
  `longitud` decimal(20,6) DEFAULT NULL,
  `localidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_estacion`),
  KEY `FK_estaciones_localidad` (`localidad`),
  CONSTRAINT `FK_estaciones_localidad` FOREIGN KEY (`localidad`) REFERENCES `localidad` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla estaciones.estaciones: ~2 rows (aproximadamente)
INSERT INTO `estaciones` (`id_estacion`, `nombre`, `latitud`, `longitud`, `localidad`) VALUES
	(1, 'Estación Ballester', 34.540037, -58.558841, 1),
	(2, 'Estación Gesell', -37.263900, -56.973000, 2);

-- Volcando estructura para tabla estaciones.localidad
CREATE TABLE IF NOT EXISTS `localidad` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `provincia.id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_localidad_provincia` (`provincia.id`),
  CONSTRAINT `FK_localidad_provincia` FOREIGN KEY (`provincia.id`) REFERENCES `provincia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla estaciones.localidad: ~2 rows (aproximadamente)
INSERT INTO `localidad` (`Id`, `nombre`, `provincia.id`) VALUES
	(1, 'Villa Ballester', 1),
	(2, 'Villa Gesell', 1);

-- Volcando estructura para tabla estaciones.medicion
CREATE TABLE IF NOT EXISTS `medicion` (
  `id` int(11) NOT NULL,
  `esstacion_sensor_id` int(11) DEFAULT NULL,
  `valor` decimal(20,6) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla estaciones.medicion: ~6 rows (aproximadamente)
INSERT INTO `medicion` (`id`, `esstacion_sensor_id`, `valor`, `fecha`, `hora`) VALUES
	(1, 1, 13200.000000, '2026-01-15', '08:30:00'),
	(2, 2, 145.500000, '2026-02-10', '14:15:00'),
	(3, 3, 1920.600000, '2026-03-05', '20:00:00'),
	(4, 1, 13180.000000, '2026-04-01', '09:00:00'),
	(5, 2, 150.200000, '2026-04-08', '10:26:00'),
	(6, 3, 1980.000000, '2026-04-08', '10:26:00');

-- Volcando estructura para tabla estaciones.pais
CREATE TABLE IF NOT EXISTS `pais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla estaciones.pais: ~1 rows (aproximadamente)
INSERT INTO `pais` (`id`, `nombre`) VALUES
	(1, 'Argentina');

-- Volcando estructura para tabla estaciones.provincia
CREATE TABLE IF NOT EXISTS `provincia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `pais_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_provincia_pais` (`pais_id`),
  CONSTRAINT `FK_provincia_pais` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla estaciones.provincia: ~1 rows (aproximadamente)
INSERT INTO `provincia` (`id`, `nombre`, `pais_id`) VALUES
	(1, 'Buenos Aires', 1);

-- Volcando estructura para tabla estaciones.sensores
CREATE TABLE IF NOT EXISTS `sensores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `unidad_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Sensor_estacion_sensor` (`unidad_id`),
  CONSTRAINT `FK_Sensor_estacion_sensor` FOREIGN KEY (`unidad_id`) REFERENCES `estacion_sensor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla estaciones.sensores: ~3 rows (aproximadamente)
INSERT INTO `sensores` (`id`, `nombre`, `unidad_id`) VALUES
	(1, 'Tensión', 1),
	(2, 'Corriente', 2),
	(3, 'Potencia', 3);

-- Volcando estructura para tabla estaciones.unidad
CREATE TABLE IF NOT EXISTS `unidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla estaciones.unidad: ~3 rows (aproximadamente)
INSERT INTO `unidad` (`id`, `nombre`) VALUES
	(1, 'Voltios'),
	(2, 'Amperios'),
	(3, 'kW');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
