-- 1. Corregir la FK rota
SET FOREIGN_KEY_CHECKS = 0;

ALTER TABLE `estacion_sensor` 
  DROP FOREIGN KEY `FK_Estacion_sensor_sensor`;

ALTER TABLE `estacion_sensor`
  ADD CONSTRAINT `FK_Estacion_sensor_sensor` 
  FOREIGN KEY (`sensor_id`) REFERENCES `sensores` (`id`) 
  ON DELETE NO ACTION ON UPDATE NO ACTION;

SET FOREIGN_KEY_CHECKS = 1;

-- 2. Agregar Potencia a Gesell
INSERT INTO `estacion_sensor` (`estacion_id`, `sensor_id`) VALUES (2, 3);

-- 3. Insertar mediciones de Gesell
INSERT INTO `medicion` (`id`, `esstacion_sensor_id`, `valor`, `fecha`, `hora`) VALUES
  (7,  4, 13050.000000, '2026-01-15', '08:35:00'),
  (8,  5,   142.800000, '2026-02-10', '14:20:00'),
  (9,  6,  1875.500000, '2026-03-05', '20:05:00'),
  (10, 4, 13100.000000, '2026-04-01', '09:05:00'),
  (11, 5,   148.600000, '2026-04-08', '10:30:00'),
  (12, 6,  1950.000000, '2026-04-08', '10:30:00');