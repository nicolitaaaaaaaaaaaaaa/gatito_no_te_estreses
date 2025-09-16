-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.32-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.11.0.7065
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para atsanet
CREATE DATABASE IF NOT EXISTS `atsanet` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `atsanet`;

-- Volcando estructura para tabla atsanet.acudiente
CREATE TABLE IF NOT EXISTS `acudiente` (
  `idacudiente` int(4) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `nom1_acudiente` varchar(20) NOT NULL,
  `nom2_acudiente` varchar(20) DEFAULT NULL,
  `ape1_acudiente` varchar(20) NOT NULL,
  `ape2_acudiente` varchar(20) DEFAULT NULL,
  `tel_acudiente` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`idacudiente`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla atsanet.acudiente: ~48 rows (aproximadamente)
DELETE FROM `acudiente`;
INSERT INTO `acudiente` (`idacudiente`, `id`, `nom1_acudiente`, `nom2_acudiente`, `ape1_acudiente`, `ape2_acudiente`, `tel_acudiente`) VALUES
	(1, 4582913, 'Juan', 'Carlos', 'Pérez', 'Gómez', 3441234567),
	(2, 5291476, 'María', 'Fernanda', 'López', 'Rodríguez', 3452022233),
	(3, 6104528, 'José', NULL, 'Martínez', NULL, 3228901234),
	(4, 7928374, 'Ana', 'María', 'Torres', 'Sánchez', 3324567890),
	(5, 8317246, 'Luis', 'Alberto', 'García', 'Herrera', 3226789012),
	(6, 9612034, 'Laura', 'Elena', 'Díaz', NULL, 3442345678),
	(7, 4813905, 'Jorge', NULL, 'Castro', 'Romero', 3323033344),
	(8, 5476192, 'Patricia', 'Elena', 'Gómez', 'Ruiz', 3451112222),
	(9, 6801345, 'Carlos', 'Andrés', 'Jiménez', 'Suárez', 3225678901),
	(10, 7126489, 'Teresa', NULL, 'Morales', NULL, 3444567890),
	(11, 8934751, 'Eduardo', 'José', 'Salazar', 'Castañeda', 3322223333),
	(12, 9274512, 'Fernando', 'Antonio', 'Villanueva', 'Gutiérrez', 3451234567),
	(13, 5091734, 'Juliana', NULL, 'Mendoza', 'Cárdenas', 3321011122),
	(14, 6392847, 'Manuel', 'Antonio', 'Orozco', 'Pineda', 3446789012),
	(15, 7123940, 'Gabriela', 'Alejandra', 'Salcedo', 'Castro', 3455055566),
	(16, 4582160, 'Alberto', 'Miguel', 'Quiñones', NULL, 3322345678),
	(17, 8409276, 'Sandra', NULL, 'Alvarado', 'Pacheco', 3441011122),
	(18, 9283176, 'Oscar', 'Eduardo', 'Cárdenas', 'Medina', 3221234567),
	(19, 5802149, 'Diana', 'Carolina', 'Torres', 'Cuervo', 3453033344),
	(20, 7904237, 'Felipe', 'Andrés', 'Jaramillo', 'Zuluaga', 3447890123),
	(21, 4527183, 'Lucía', 'Isabel', 'Salazar', NULL, 3328901234),
	(22, 6928304, 'Miguel', NULL, 'Acosta', 'Medina', 3229012345),
	(23, 8613704, 'Clara', 'Inés', 'Pérez', 'Ríos', 3452022233),
	(24, 5271934, 'David', 'Alejandro', 'Caicedo', NULL, 3325678901),
	(25, 9172058, 'Adriana', 'Lucía', 'González', 'Salas', 3220123456),
	(26, 4710283, 'Ricardo', NULL, 'Barrera', 'Figueroa', 3443456789),
	(27, 6329185, 'Patricia', 'Sofía', 'Jiménez', 'Acuña', 3321234567),
	(28, 8712349, 'Juan', NULL, 'Ríos', 'González', 3456789012),
	(29, 5923140, 'Claudia', 'Patricia', 'Suárez', 'Alvarado', 3444044455),
	(30, 7512936, 'Manuel', 'Fernando', 'León', 'Téllez', 3224044455),
	(31, 4293187, 'Silvia', 'Elena', 'Morales', NULL, 3327890123),
	(32, 9140576, 'César', 'Augusto', 'Espinosa', 'Calderón', 3448901234),
	(33, 8439257, 'Laura', 'Catalina', 'Gutiérrez', 'Becerra', 3458901234),
	(34, 5623789, 'Luis', 'Fernando', 'Ruiz', 'Naranjo', 3225055566),
	(35, 6274918, 'Adriana', 'Carolina', 'Martínez', 'Romero', 3324567890),
	(36, 7982361, 'Ricardo', 'Andrés', 'Morales', 'Castro', 3442223333),
	(37, 4752194, 'Zulay', NULL, 'López', NULL, 3223033344),
	(38, 9375401, 'Juan', 'José', 'Cortés', 'Salazar', 3327890123),
	(39, 8162937, 'Angela', 'María', 'Rodríguez', NULL, 3454044455),
	(40, 6108294, 'Carlos', 'Alberto', 'López', 'Daza', 3440123456),
	(41, 7241308, 'Juliana', 'Sofía', 'Mendoza', 'Valenzuela', 3221112222),
	(42, 5489237, 'Roberto', NULL, 'Parra', NULL, 3326789012),
	(43, 8213746, 'Laura', 'Marcela', 'Salazar', 'Hernández', 3451011122),
	(44, 4519237, 'Edgar', 'Alberto', 'Ospina', 'Franco', 3445678901),
	(45, 9230415, 'Gabriela', NULL, 'Muñoz', 'Lozano', 3325055566),
	(46, 6531879, 'Miguel', 'Ángel', 'Rodríguez', 'Pérez', 3222022233),
	(47, 5193764, 'Marta', 'Lucía', 'Rodríguez', NULL, 3454567890),
	(48, 7829354, 'Juliana', NULL, 'Martinez', NULL, 3404325356);

-- Volcando estructura para tabla atsanet.alumno
CREATE TABLE IF NOT EXISTS `alumno` (
  `fk_persona_alumno` int(4) NOT NULL,
  `talla` varchar(3) NOT NULL,
  `calzado` tinyint(2) NOT NULL,
  `pie_domi` varchar(11) NOT NULL,
  `fk_acudiente` int(4) NOT NULL,
  `parentesco` varchar(10) NOT NULL,
  `fk_posicion` int(4) DEFAULT NULL,
  `foto` varchar(350) DEFAULT NULL,
  `fecha_ven_carnet` date DEFAULT NULL,
  `fk_categoria` int(4) DEFAULT NULL,
  `leyDatos` varchar(350) DEFAULT NULL,
  `autoMedica` varchar(350) DEFAULT NULL,
  `certificaEps` varchar(350) DEFAULT NULL,
  `estado_alumno` bit(1) NOT NULL,
  PRIMARY KEY (`fk_persona_alumno`),
  KEY `fk_acudiente` (`fk_acudiente`),
  KEY `fk_posicion` (`fk_posicion`),
  KEY `fk_categoria` (`fk_categoria`),
  CONSTRAINT `alumno_ibfk_1` FOREIGN KEY (`fk_persona_alumno`) REFERENCES `persona` (`id`),
  CONSTRAINT `alumno_ibfk_2` FOREIGN KEY (`fk_acudiente`) REFERENCES `acudiente` (`idacudiente`),
  CONSTRAINT `alumno_ibfk_3` FOREIGN KEY (`fk_posicion`) REFERENCES `posicion` (`idposicion`),
  CONSTRAINT `alumno_ibfk_4` FOREIGN KEY (`fk_categoria`) REFERENCES `categoria` (`idcategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla atsanet.alumno: ~50 rows (aproximadamente)
DELETE FROM `alumno`;
INSERT INTO `alumno` (`fk_persona_alumno`, `talla`, `calzado`, `pie_domi`, `fk_acudiente`, `parentesco`, `fk_posicion`, `foto`, `fecha_ven_carnet`, `fk_categoria`, `leyDatos`, `autoMedica`, `certificaEps`, `estado_alumno`) VALUES
	(1, 'XS', 38, 'Izquierdo', 1, 'Hermano', 1, 'foto1.png', '2025-09-20', 5, NULL, NULL, NULL, b'1'),
	(2, '4T', 14, 'Derecho', 2, 'Hermano', 3, 'foto2.png', '2025-09-20', 1, NULL, NULL, NULL, b'1'),
	(3, '8', 5, 'Derecho', 3, 'Hermano', 3, 'foto3.png', '2025-09-20', 2, NULL, NULL, NULL, b'1'),
	(4, '8', 5, 'Derecho', 4, 'Padre', 2, 'foto4.png', '2025-09-20', 2, NULL, NULL, NULL, b'1'),
	(5, 'L', 38, 'Derecho', 5, 'Hermano', 1, 'foto5.png', '2025-09-20', 5, NULL, NULL, NULL, b'1'),
	(6, 'XS', 30, 'Derecho', 11, 'Padre', 4, 'foto6.png', '2025-09-20', 5, NULL, NULL, NULL, b'1'),
	(7, 'S', 36, 'Izquierdo', 11, 'Padre', 3, 'foto7.png', '2025-09-20', 3, NULL, NULL, NULL, b'1'),
	(8, 'M', 40, 'Derecho', 6, 'Tio', 1, 'foto8.png', '2025-09-20', 5, NULL, NULL, NULL, b'1'),
	(9, 'M', 38, 'Izquierdo', 7, 'Tio', 4, 'foto9.png', '2025-09-20', 3, NULL, NULL, NULL, b'1'),
	(10, '4T', 5, 'Izquierdo', 8, 'Tio', 1, 'foto10.png', '2025-09-20', 1, NULL, NULL, NULL, b'1'),
	(11, 'S', 34, 'Izquierdo', 9, 'Abuelo', 4, 'foto11.png', '2025-09-20', 3, NULL, NULL, NULL, b'1'),
	(12, 'L', 36, 'Derecho', 10, 'Padre', 5, 'foto12.png', '2025-09-20', 4, NULL, NULL, NULL, b'1'),
	(13, 'M', 38, 'Derecho', 12, 'Hermano', 6, 'foto13.png', '2025-09-20', 5, NULL, NULL, NULL, b'1'),
	(14, '6T', 4, 'Izquierdo', 13, 'Madre', 6, 'foto14.png', '2025-09-20', 1, NULL, NULL, NULL, b'1'),
	(15, 'L', 40, 'Izquierdo', 14, 'Abuelo', 3, 'foto15.png', '2025-09-20', 3, NULL, NULL, NULL, b'1'),
	(16, '7', 26, 'Derecho', 15, 'Hermano', 6, 'foto16.png', '2025-09-20', 1, NULL, NULL, NULL, b'1'),
	(17, '6T', 15, 'Izquierdo', 16, 'Hermano', 5, 'foto17.png', '2025-09-20', 1, NULL, NULL, NULL, b'1'),
	(18, 'L', 37, 'Derecho', 17, 'Tio', 6, 'foto18.png', '2025-09-20', 4, NULL, NULL, NULL, b'1'),
	(19, 'M', 40, 'Izquierdo', 18, 'Hermano', 2, 'foto19.png', '2025-09-20', 5, NULL, NULL, NULL, b'1'),
	(20, 'M', 38, 'Izquierdo', 19, 'Abuelo', 7, 'foto20.png', '2025-09-20', 4, NULL, NULL, NULL, b'1'),
	(21, 'M', 36, 'Izquierdo', 22, 'Abuelo', 4, 'foto21.png', '2025-09-20', 3, NULL, NULL, NULL, b'1'),
	(22, '5T', 15, 'Derecho', 20, 'Madre', 7, 'foto22.png', '2025-09-20', 1, NULL, NULL, NULL, b'1'),
	(23, '8', 16, 'Derecho', 22, 'Hermano', 1, 'foto23.png', '2025-09-20', 2, NULL, NULL, NULL, b'1'),
	(24, 'L', 37, 'Izquierdo', 23, 'Tio', 4, 'foto24.png', '2025-09-20', 3, NULL, NULL, NULL, b'1'),
	(25, 'S', 40, 'Derecho', 24, 'Abuelo', 3, 'foto25.png', '2025-09-20', 5, NULL, NULL, NULL, b'0'),
	(26, 'M', 40, 'Derecho', 25, 'Abuelo', 4, 'foto26.png', '2025-09-20', 5, NULL, NULL, NULL, b'1'),
	(27, 'M', 39, 'Derecho', 26, 'Tio', 2, 'foto27.png', '2025-09-20', 3, NULL, NULL, NULL, b'1'),
	(28, '6T', 15, 'Izquierdo', 27, 'Hermano', 4, 'foto28.png', '2025-09-20', 1, NULL, NULL, NULL, b'0'),
	(29, 'M', 30, 'Izquierdo', 28, 'Abuelo', 3, 'foto29.png', '2025-09-20', 3, NULL, NULL, NULL, b'1'),
	(30, 'M', 40, 'Derecho', 29, 'Tio', 7, 'foto30.png', '2025-09-20', 5, NULL, NULL, NULL, b'1'),
	(31, 'L', 39, 'Izquierdo', 30, 'Hermano', 7, 'foto31.png', '2025-09-20', 3, NULL, NULL, NULL, b'0'),
	(32, '10', 30, 'Derecho', 31, 'Abuelo', 1, 'foto32.png', '2025-09-20', 2, NULL, NULL, NULL, b'1'),
	(33, 'S', 36, 'Izquierdo', 32, 'Hermano', 6, 'foto33.png', '2025-09-20', 3, NULL, NULL, NULL, b'1'),
	(34, '5T', 16, 'Izquierdo', 33, 'Padre', 6, 'foto34.png', '2025-09-20', 1, NULL, NULL, NULL, b'1'),
	(35, '11', 19, 'Izquierdo', 34, 'Tio', 3, 'foto35.png', '2025-09-20', 2, NULL, NULL, NULL, b'1'),
	(36, 'M', 23, 'Izquierdo', 35, 'Hermano', 4, 'foto36.png', '2025-09-20', 4, NULL, NULL, NULL, b'1'),
	(37, 'S', 30, 'Derecho', 36, 'Tio', 1, 'foto37.png', '2025-09-20', 3, NULL, NULL, NULL, b'1'),
	(38, '10', 28, 'Derecho', 37, 'Madre', 7, 'foto38.png', '2025-09-20', 2, NULL, NULL, NULL, b'0'),
	(39, 'L', 35, 'Derecho', 38, 'Tio', 2, 'foto39.png', '2025-09-20', 3, NULL, NULL, NULL, b'0'),
	(40, 'M', 39, 'Derecho', 39, 'Tio', 7, 'foto40.png', '2025-09-20', 5, NULL, NULL, NULL, b'1'),
	(41, 'L', 30, 'Izquierdo', 40, 'Tio', 7, 'foto41.png', '2025-09-20', 3, NULL, NULL, NULL, b'1'),
	(42, 'S', 35, 'Derecho', 41, 'Abuelo', 3, 'foto42.png', '2025-09-20', 4, NULL, NULL, NULL, b'1'),
	(43, 'M', 40, 'Izquierdo', 42, 'Hermano', 6, 'foto43.png', '2025-09-20', 5, NULL, NULL, NULL, b'0'),
	(44, '7', 27, 'Derecho', 43, 'Tio', 3, 'foto44.png', '2025-09-20', 1, NULL, NULL, NULL, b'1'),
	(45, 'M', 38, 'Derecho', 44, 'Tio', 1, 'foto45.png', '2025-09-20', 2, NULL, NULL, NULL, b'1'),
	(46, '10', 26, 'Izquierdo', 45, 'Tio', 2, 'foto46.png', '2025-09-20', 2, NULL, NULL, NULL, b'1'),
	(47, '4T', 14, 'Izquierdo', 46, 'Abuelo', 4, 'foto47.png', '2025-09-20', 1, NULL, NULL, NULL, b'1'),
	(48, '6T', 18, 'Izquierdo', 47, 'Tio', 4, 'foto48.png', '2025-09-20', 1, NULL, NULL, NULL, b'0'),
	(49, '6T', 18, 'Izquierdo', 48, 'Madre', 2, 'foto49.png', '2025-09-20', 1, NULL, NULL, NULL, b'1'),
	(50, '11', 23, 'Izquierdo', 48, 'Madre', 5, 'foto50.png', '2025-09-20', 2, NULL, NULL, NULL, b'0');

-- Volcando estructura para tabla atsanet.asistencia
CREATE TABLE IF NOT EXISTS `asistencia` (
  `idasistencia` int(4) NOT NULL AUTO_INCREMENT,
  `fk_alumno` int(4) DEFAULT NULL,
  `fecha_asistencia` date NOT NULL,
  `asistencia` bit(1) DEFAULT NULL,
  `observaciones_asistencia` text NOT NULL,
  PRIMARY KEY (`idasistencia`),
  KEY `fk_alumno` (`fk_alumno`),
  CONSTRAINT `asistencia_ibfk_1` FOREIGN KEY (`fk_alumno`) REFERENCES `alumno` (`fk_persona_alumno`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla atsanet.asistencia: ~96 rows (aproximadamente)
DELETE FROM `asistencia`;
INSERT INTO `asistencia` (`idasistencia`, `fk_alumno`, `fecha_asistencia`, `asistencia`, `observaciones_asistencia`) VALUES
	(1, 1, '2025-01-06', b'1', 'Asistió con 10 min de retraso'),
	(2, 1, '2025-01-07', b'1', 'Asistió puntual'),
	(3, 1, '2025-01-08', b'1', 'Asistió con 5 min de retraso'),
	(4, 1, '2025-01-09', b'1', 'Asistió puntual'),
	(5, 1, '2025-01-10', b'1', 'Asistió con 20 min de retraso'),
	(6, 2, '2025-01-06', b'1', 'Asistió puntual'),
	(7, 2, '2025-01-07', b'1', 'Asistió con 25 min de retraso'),
	(8, 2, '2025-01-08', b'1', 'Asistió puntual'),
	(9, 2, '2025-01-09', b'1', 'Asistió con 15 min de retraso'),
	(10, 2, '2025-01-10', b'1', 'Asistió puntual'),
	(11, 3, '2025-01-06', b'1', 'Asistió con 30 min de retraso'),
	(12, 3, '2025-01-07', b'1', 'Asistió puntual'),
	(13, 3, '2025-01-08', b'1', 'Asistió con 10 min de retraso'),
	(14, 3, '2025-01-09', b'1', 'Asistió puntual'),
	(15, 3, '2025-01-10', b'1', 'Asistió con 5 min de retraso'),
	(16, 4, '2025-01-06', b'1', 'Asistió puntual'),
	(17, 4, '2025-01-07', b'1', 'Asistió con 40 min de retraso'),
	(18, 4, '2025-01-08', b'1', 'Asistió puntual'),
	(19, 4, '2025-01-09', b'1', 'Asistió con 8 min de retraso'),
	(20, 4, '2025-01-10', b'1', 'Asistió puntual'),
	(21, 5, '2025-01-06', b'1', 'Asistió con 12 min de retraso'),
	(22, 5, '2025-01-07', b'1', 'Asistió puntual'),
	(23, 5, '2025-01-08', b'1', 'Asistió con 18 min de retraso'),
	(24, 5, '2025-01-09', b'1', 'Asistió puntual'),
	(25, 5, '2025-01-10', b'1', 'Asistió con 7 min de retraso'),
	(26, 6, '2025-01-06', b'1', 'Asistió con 22 min de retraso'),
	(27, 6, '2025-01-08', b'1', 'Asistió con 35 min de retraso'),
	(28, 6, '2025-01-10', b'0', 'Ausencia justificada se enfermo'),
	(29, 7, '2025-01-07', b'1', 'Asistió puntual'),
	(30, 7, '2025-01-09', b'1', 'Asistió con 50 min de retraso'),
	(31, 7, '2025-01-10', b'1', 'Asistió con 10 min de retraso'),
	(32, 8, '2025-01-06', b'1', 'Asistió con 15 min de retraso'),
	(33, 8, '2025-01-08', b'0', 'Ausencia sin justificar'),
	(34, 8, '2025-01-09', b'1', 'Asistió con 25 min de retraso'),
	(35, 9, '2025-01-07', b'1', 'Asistió puntual'),
	(36, 9, '2025-01-08', b'1', 'Asistió con 5 min de retraso'),
	(37, 9, '2025-01-10', b'0', 'Ausencia justificada por cita médica'),
	(38, 10, '2025-01-06', b'1', 'Asistió con 8 min de retraso'),
	(39, 10, '2025-01-07', b'1', 'Asistió puntual'),
	(40, 10, '2025-01-08', b'1', 'Asistió con 17 min de retraso'),
	(41, 10, '2025-01-09', b'1', 'Asistió con 3 min de retraso'),
	(42, 10, '2025-01-10', b'1', 'Asistió puntual'),
	(43, 10, '2025-01-11', b'1', 'Asistió con 30 min de retraso'),
	(44, 10, '2025-01-12', b'1', 'Asistió con 10 min de retraso'),
	(45, 11, '2025-01-06', b'1', 'Asistió puntual'),
	(46, 11, '2025-01-07', b'1', 'Asistió con 45 min de retraso'),
	(47, 11, '2025-01-08', b'1', 'Asistió puntual'),
	(48, 11, '2025-01-09', b'1', 'Asistió con 20 min de retraso'),
	(49, 11, '2025-01-10', b'1', 'Asistió puntual'),
	(50, 11, '2025-01-11', b'1', 'Asistió con 15 min de retraso'),
	(51, 11, '2025-01-12', b'1', 'Asistió con 5 min de retraso'),
	(52, 12, '2025-01-06', b'1', 'Asistió con 25 min de retraso'),
	(53, 12, '2025-01-09', b'0', 'Ausencia justificada problemas transporte'),
	(54, 13, '2025-01-07', b'1', 'Asistió con 10 min de retraso'),
	(55, 13, '2025-01-10', b'1', 'Asistió con 40 min de retraso'),
	(56, 14, '2025-01-06', b'1', 'Asistió puntual'),
	(57, 14, '2025-01-08', b'0', 'Ausencia sin justificar'),
	(58, 15, '2025-01-07', b'1', 'Asistió con 18 min de retraso'),
	(59, 15, '2025-01-09', b'0', 'Ausencia justificada problemas familiares'),
	(60, 16, '2025-01-08', b'1', 'Asistió con 22 min de retraso'),
	(61, 16, '2025-01-10', b'1', 'Asistió puntual'),
	(62, 17, '2025-01-06', b'0', 'Ausencia justificada se enfermo'),
	(63, 17, '2025-01-09', b'1', 'Asistió con 12 min de retraso'),
	(64, 18, '2025-01-08', b'1', 'Asistió con 30 min de retraso'),
	(65, 19, '2025-01-06', b'0', 'Ausencia sin justificar'),
	(66, 20, '2025-01-09', b'1', 'Asistió con 15 min de retraso'),
	(67, 21, '2025-01-07', b'0', 'Ausencia sin justificar'),
	(68, 22, '2025-01-10', b'1', 'Asistió puntual'),
	(69, 23, '2025-01-06', b'0', 'Ausencia sin justificar'),
	(70, 24, '2025-01-08', b'1', 'Asistió con 20 min de retraso'),
	(71, 25, '2025-01-07', b'0', 'Ausencia sin justificar'),
	(72, 26, '2025-01-09', b'1', 'Asistió con 50 min de retraso'),
	(73, 27, '2025-01-06', b'0', 'Ausencia sin justificar'),
	(74, 28, '2025-01-10', b'0', 'Ausencia sin justificar'),
	(75, 29, '2025-01-08', b'1', 'Asistió puntual'),
	(76, 30, '2025-01-07', b'0', 'Ausencia sin justificar'),
	(77, 31, '2025-01-09', b'0', 'Ausencia sin justificar'),
	(78, 32, '2025-01-06', b'1', 'Asistió con 25 min de retraso'),
	(79, 33, '2025-01-08', b'0', 'Ausencia sin justificar'),
	(80, 34, '2025-01-10', b'1', 'Asistió con 10 min de retraso'),
	(81, 35, '2025-01-07', b'0', 'Ausencia sin justificar'),
	(82, 36, '2025-01-09', b'0', 'Ausencia sin justificar'),
	(83, 37, '2025-01-06', b'1', 'Asistió puntual'),
	(84, 38, '2025-01-08', b'0', 'Ausencia sin justificar'),
	(85, 39, '2025-01-10', b'0', 'Ausencia sin justificar'),
	(86, 40, '2025-01-07', b'1', 'Asistió con 35 min de retraso'),
	(87, 41, '2025-01-09', b'0', 'Ausencia sin justificar'),
	(88, 42, '2025-01-06', b'0', 'Ausencia sin justificar'),
	(89, 43, '2025-01-08', b'0', 'Ausencia sin justificar'),
	(90, 44, '2025-01-10', b'1', 'Asistió con 5 min de retraso'),
	(91, 45, '2025-01-07', b'0', 'Ausencia sin justificar'),
	(92, 46, '2025-01-09', b'0', 'Ausencia sin justificar'),
	(93, 47, '2025-01-06', b'1', 'Asistió puntual'),
	(94, 48, '2025-01-08', b'0', 'Ausencia sin justificar'),
	(95, 49, '2025-01-10', b'0', 'Ausencia sin justificar'),
	(96, 50, '2025-01-07', b'1', 'Asistió con 8 min de retraso');

-- Volcando estructura para tabla atsanet.categoria
CREATE TABLE IF NOT EXISTS `categoria` (
  `idcategoria` int(4) NOT NULL AUTO_INCREMENT,
  `nom_categoria` varchar(20) NOT NULL,
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla atsanet.categoria: ~5 rows (aproximadamente)
DELETE FROM `categoria`;
INSERT INTO `categoria` (`idcategoria`, `nom_categoria`) VALUES
	(1, '4 a 7 años'),
	(2, '8 a 11 años'),
	(3, '12 a 15 años'),
	(4, '16 a 17 años'),
	(5, '18 años');

-- Volcando estructura para tabla atsanet.categoria_has_entrenamiento
CREATE TABLE IF NOT EXISTS `categoria_has_entrenamiento` (
  `fk_categoria` int(4) NOT NULL,
  `fk_entrenamiento` int(4) NOT NULL,
  PRIMARY KEY (`fk_categoria`,`fk_entrenamiento`),
  KEY `fk_entrenamiento` (`fk_entrenamiento`),
  CONSTRAINT `categoria_has_entrenamiento_ibfk_1` FOREIGN KEY (`fk_categoria`) REFERENCES `categoria` (`idcategoria`),
  CONSTRAINT `categoria_has_entrenamiento_ibfk_2` FOREIGN KEY (`fk_entrenamiento`) REFERENCES `entrenamiento` (`identrenamiento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla atsanet.categoria_has_entrenamiento: ~16 rows (aproximadamente)
DELETE FROM `categoria_has_entrenamiento`;
INSERT INTO `categoria_has_entrenamiento` (`fk_categoria`, `fk_entrenamiento`) VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(1, 4),
	(2, 5),
	(2, 6),
	(2, 7),
	(3, 8),
	(3, 9),
	(3, 10),
	(4, 11),
	(4, 12),
	(4, 13),
	(5, 14),
	(5, 15),
	(5, 16);

-- Volcando estructura para tabla atsanet.entrenamiento
CREATE TABLE IF NOT EXISTS `entrenamiento` (
  `identrenamiento` int(4) NOT NULL AUTO_INCREMENT,
  `nom_entrenamiento` varchar(30) NOT NULL,
  PRIMARY KEY (`identrenamiento`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla atsanet.entrenamiento: ~17 rows (aproximadamente)
DELETE FROM `entrenamiento`;
INSERT INTO `entrenamiento` (`identrenamiento`, `nom_entrenamiento`) VALUES
	(1, 'pases por Tríos'),
	(2, 'mete y corre'),
	(3, 'sucesion de pases'),
	(4, 'torpedos'),
	(5, '2 contra 1'),
	(6, 'linea imaginaria'),
	(7, 'cada uno en su espacio'),
	(8, 'pases de la muerte'),
	(9, 'pases y tiro a gol'),
	(10, 'cambios de Orientación'),
	(11, 'superioridad e incorporacion'),
	(12, 'doble pared y tiro'),
	(13, 'maniobra y pase'),
	(14, '6 Porterias pequeñas'),
	(15, 'partido con comodines'),
	(16, 'ejercicios de biometria'),
	(17, 'resistencia');

-- Volcando estructura para tabla atsanet.entrenamiento_has_objetivo
CREATE TABLE IF NOT EXISTS `entrenamiento_has_objetivo` (
  `fk_entrenamiento` int(4) NOT NULL,
  `fk_objetivo` int(4) NOT NULL,
  PRIMARY KEY (`fk_entrenamiento`,`fk_objetivo`),
  KEY `fk_objetivo` (`fk_objetivo`),
  CONSTRAINT `entrenamiento_has_objetivo_ibfk_1` FOREIGN KEY (`fk_entrenamiento`) REFERENCES `entrenamiento` (`identrenamiento`),
  CONSTRAINT `entrenamiento_has_objetivo_ibfk_2` FOREIGN KEY (`fk_objetivo`) REFERENCES `objetivos` (`idobjetivos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla atsanet.entrenamiento_has_objetivo: ~106 rows (aproximadamente)
DELETE FROM `entrenamiento_has_objetivo`;
INSERT INTO `entrenamiento_has_objetivo` (`fk_entrenamiento`, `fk_objetivo`) VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(1, 13),
	(1, 15),
	(2, 1),
	(2, 3),
	(3, 1),
	(3, 5),
	(3, 7),
	(4, 1),
	(4, 2),
	(4, 3),
	(4, 12),
	(4, 13),
	(4, 14),
	(4, 16),
	(5, 1),
	(5, 3),
	(5, 5),
	(5, 8),
	(5, 12),
	(5, 22),
	(5, 27),
	(5, 33),
	(6, 1),
	(6, 5),
	(6, 7),
	(6, 8),
	(6, 10),
	(6, 11),
	(6, 12),
	(6, 15),
	(6, 24),
	(6, 29),
	(6, 35),
	(7, 1),
	(7, 2),
	(7, 5),
	(7, 6),
	(7, 9),
	(7, 10),
	(7, 12),
	(7, 13),
	(7, 15),
	(7, 33),
	(8, 6),
	(8, 9),
	(8, 16),
	(8, 21),
	(8, 34),
	(9, 1),
	(9, 2),
	(9, 11),
	(9, 13),
	(9, 28),
	(10, 2),
	(10, 4),
	(10, 5),
	(10, 11),
	(10, 21),
	(11, 1),
	(11, 6),
	(11, 7),
	(11, 12),
	(11, 13),
	(11, 16),
	(11, 32),
	(11, 34),
	(12, 4),
	(12, 5),
	(12, 12),
	(12, 13),
	(12, 14),
	(12, 16),
	(13, 1),
	(13, 5),
	(13, 6),
	(13, 7),
	(13, 11),
	(13, 13),
	(13, 24),
	(14, 4),
	(14, 7),
	(14, 15),
	(14, 32),
	(15, 1),
	(15, 4),
	(15, 6),
	(15, 7),
	(15, 10),
	(15, 14),
	(15, 16),
	(16, 2),
	(16, 6),
	(16, 10),
	(16, 14),
	(16, 15),
	(16, 31),
	(16, 34),
	(17, 3),
	(17, 6),
	(17, 10),
	(17, 15),
	(17, 24),
	(17, 34);

-- Volcando estructura para tabla atsanet.eps
CREATE TABLE IF NOT EXISTS `eps` (
  `ideps` int(4) NOT NULL AUTO_INCREMENT,
  `nom_eps` varchar(15) NOT NULL,
  PRIMARY KEY (`ideps`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla atsanet.eps: ~8 rows (aproximadamente)
DELETE FROM `eps`;
INSERT INTO `eps` (`ideps`, `nom_eps`) VALUES
	(1, 'sanitas'),
	(2, 'sura'),
	(3, 'compensar'),
	(4, 'salud total'),
	(5, 'famisanar'),
	(6, 'capital salud'),
	(7, 'aliansalud'),
	(8, 'salud bolivar');

-- Volcando estructura para evento atsanet.evt_actualizar_edades_inicio
DELIMITER //
CREATE EVENT `evt_actualizar_edades_inicio` ON SCHEDULE AT '2025-06-29 22:33:12' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
    CALL pa_actualizar_edades();
END//
DELIMITER ;

-- Volcando estructura para tabla atsanet.genero
CREATE TABLE IF NOT EXISTS `genero` (
  `idgenero` int(4) NOT NULL AUTO_INCREMENT,
  `nom_genero` varchar(1) NOT NULL,
  PRIMARY KEY (`idgenero`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla atsanet.genero: ~2 rows (aproximadamente)
DELETE FROM `genero`;
INSERT INTO `genero` (`idgenero`, `nom_genero`) VALUES
	(1, 'M'),
	(2, 'F');

-- Volcando estructura para tabla atsanet.jornada
CREATE TABLE IF NOT EXISTS `jornada` (
  `idjornada` int(4) NOT NULL AUTO_INCREMENT,
  `dia_semana` varchar(10) NOT NULL,
  `hora_jornada` time NOT NULL,
  PRIMARY KEY (`idjornada`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla atsanet.jornada: ~10 rows (aproximadamente)
DELETE FROM `jornada`;
INSERT INTO `jornada` (`idjornada`, `dia_semana`, `hora_jornada`) VALUES
	(1, 'Lunes', '08:00:00'),
	(2, 'Lunes', '15:00:00'),
	(3, 'Martes', '08:00:00'),
	(4, 'Martes', '15:00:00'),
	(5, 'Miércoles', '08:00:00'),
	(6, 'Miércoles', '15:00:00'),
	(7, 'Jueves', '08:00:00'),
	(8, 'Jueves', '15:00:00'),
	(9, 'Viernes', '08:00:00'),
	(10, 'Viernes', '15:00:00');

-- Volcando estructura para tabla atsanet.matricula
CREATE TABLE IF NOT EXISTS `matricula` (
  `idmatricula` int(4) NOT NULL AUTO_INCREMENT,
  `fecha_inicio` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_alumno` int(4) DEFAULT NULL,
  PRIMARY KEY (`idmatricula`),
  KEY `fk_alumno` (`fk_alumno`),
  CONSTRAINT `matricula_ibfk_1` FOREIGN KEY (`fk_alumno`) REFERENCES `alumno` (`fk_persona_alumno`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla atsanet.matricula: ~51 rows (aproximadamente)
DELETE FROM `matricula`;
INSERT INTO `matricula` (`idmatricula`, `fecha_inicio`, `fk_alumno`) VALUES
	(1, '2023-12-26 05:00:00', 1),
	(2, '2023-11-26 05:00:00', 2),
	(3, '2023-11-20 05:00:00', 3),
	(4, '2023-11-15 05:00:00', 4),
	(5, '2023-11-15 05:00:00', 5),
	(6, '2023-11-20 05:00:00', 5),
	(7, '2023-11-25 05:00:00', 6),
	(8, '2023-11-15 05:00:00', 7),
	(9, '2023-11-23 05:00:00', 8),
	(10, '2023-11-23 05:00:00', 9),
	(11, '2023-11-18 05:00:00', 10),
	(12, '2023-11-20 05:00:00', 11),
	(13, '2023-11-28 05:00:00', 12),
	(14, '2023-11-22 05:00:00', 13),
	(15, '2023-11-18 05:00:00', 14),
	(16, '2023-11-20 05:00:00', 15),
	(17, '2023-11-19 05:00:00', 16),
	(18, '2023-11-17 05:00:00', 17),
	(19, '2023-11-25 05:00:00', 18),
	(20, '2023-11-26 05:00:00', 19),
	(21, '2023-11-18 05:00:00', 20),
	(22, '2023-11-20 05:00:00', 15),
	(23, '2023-11-26 05:00:00', 21),
	(24, '2023-11-15 05:00:00', 22),
	(25, '2023-11-22 05:00:00', 40),
	(26, '2023-11-23 05:00:00', 23),
	(27, '2023-11-18 05:00:00', 24),
	(28, '2023-11-15 05:00:00', 15),
	(29, '2023-11-19 05:00:00', 25),
	(30, '2023-11-22 05:00:00', 26),
	(31, '2023-11-28 05:00:00', 40),
	(32, '2023-11-15 05:00:00', 27),
	(33, '2023-11-20 05:00:00', 28),
	(34, '2023-12-20 05:00:00', 29),
	(35, '2023-12-22 05:00:00', 30),
	(36, '2023-12-15 05:00:00', 31),
	(37, '2023-12-16 05:00:00', 32),
	(38, '2023-12-16 05:00:00', 49),
	(39, '2023-12-25 05:00:00', 50),
	(40, '2023-12-17 05:00:00', 33),
	(41, '2022-11-28 05:00:00', 34),
	(42, '2022-11-23 05:00:00', 35),
	(43, '2022-11-17 05:00:00', 38),
	(44, '2021-11-15 05:00:00', 36),
	(45, '2021-11-15 05:00:00', 37),
	(46, '2020-11-20 05:00:00', 38),
	(47, '2022-12-14 05:00:00', 39),
	(48, '2020-11-15 05:00:00', 38),
	(49, '2019-11-15 05:00:00', 40),
	(50, '2022-11-20 05:00:00', 50),
	(51, '2022-11-26 05:00:00', 49);

-- Volcando estructura para tabla atsanet.medidas
CREATE TABLE IF NOT EXISTS `medidas` (
  `idmedidas` int(4) NOT NULL AUTO_INCREMENT,
  `fecha_medidas` date NOT NULL,
  `altura_cm` float NOT NULL,
  `peso_medidas` float NOT NULL,
  `imc_medidas` float NOT NULL,
  PRIMARY KEY (`idmedidas`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla atsanet.medidas: ~51 rows (aproximadamente)
DELETE FROM `medidas`;
INSERT INTO `medidas` (`idmedidas`, `fecha_medidas`, `altura_cm`, `peso_medidas`, `imc_medidas`) VALUES
	(1, '2024-01-01', 1.72, 73, 24.6755),
	(2, '2024-01-20', 1.04, 16, 14.7929),
	(3, '2024-01-14', 1.35, 28, 15.3635),
	(4, '2024-01-01', 1.31, 31, 18.0642),
	(5, '2024-01-23', 1.69, 68, 23.8087),
	(6, '2024-01-01', 1.58, 50, 20.0288),
	(7, '2024-01-14', 1.69, 68, 23.8087),
	(8, '2024-01-14', 1.63, 53, 19.9481),
	(9, '2024-01-25', 1.11, 18, 14.6092),
	(10, '2024-01-04', 1.53, 48, 20.5049),
	(11, '2024-01-23', 1.68, 70, 24.8016),
	(12, '2024-01-15', 1.83, 83, 24.7843),
	(13, '2024-01-16', 1.23, 23, 15.2026),
	(14, '2024-01-18', 1.65, 70, 25.7117),
	(15, '2024-01-23', 1.28, 30, 18.3105),
	(16, '2024-01-09', 1.16, 20, 14.8633),
	(17, '2024-01-09', 1.75, 70, 22.8571),
	(18, '2024-01-02', 1.73, 80, 26.7299),
	(19, '2024-01-12', 1.58, 55, 22.0317),
	(20, '2024-01-01', 1.53, 55, 23.4952),
	(21, '2024-01-14', 1.35, 32, 17.5583),
	(22, '2024-01-24', 1.53, 60, 25.6312),
	(23, '2024-01-24', 1.75, 80, 26.1224),
	(24, '2024-01-15', 1.65, 70, 25.7117),
	(25, '2024-01-06', 1.58, 63, 25.2363),
	(26, '2024-01-07', 1.81, 70, 21.3669),
	(27, '2024-01-15', 1.41, 35, 17.6047),
	(28, '2024-01-20', 1.47, 55, 25.4524),
	(29, '2024-01-25', 1.13, 23, 18.0124),
	(30, '2024-01-13', 1.47, 40, 18.5108),
	(31, '2024-01-02', 1.69, 60, 21.0077),
	(32, '2024-01-23', 1.55, 64, 26.6389),
	(33, '2024-01-23', 1.63, 65, 24.4646),
	(34, '2024-01-17', 1.52, 50, 21.6413),
	(35, '2024-01-15', 1.63, 70, 26.3465),
	(36, '2024-01-09', 1.28, 35, 21.3623),
	(37, '2024-01-08', 1.71, 60, 20.5191),
	(38, '2024-01-23', 1.38, 36, 18.9036),
	(39, '2024-01-02', 1.04, 18, 16.642),
	(40, '2024-01-04', 1.22, 20, 13.4372),
	(41, '2023-05-01', 1.62, 60, 22.8624),
	(42, '2023-01-01', 1.55, 58, 24.1415),
	(43, '2023-02-01', 1.47, 50, 23.1385),
	(44, '2022-01-10', 1.63, 55, 20.7008),
	(45, '2022-01-14', 1.52, 57, 24.6711),
	(46, '2021-01-15', 1.52, 55, 23.8054),
	(47, '2023-01-14', 1.35, 32, 17.5583),
	(48, '2021-01-02', 1.65, 56, 20.5693),
	(49, '2020-01-02', 1.51, 55, 24.1217),
	(50, '2023-01-03', 1.68, 65, 23.03),
	(51, '2023-01-03', 1.55, 65, 27.0552);

-- Volcando estructura para tabla atsanet.medidas_has_matricula
CREATE TABLE IF NOT EXISTS `medidas_has_matricula` (
  `fk_medidas` int(4) NOT NULL,
  `fk_matricula` int(4) NOT NULL,
  PRIMARY KEY (`fk_medidas`,`fk_matricula`),
  KEY `fk_matricula` (`fk_matricula`),
  CONSTRAINT `medidas_has_matricula_ibfk_1` FOREIGN KEY (`fk_medidas`) REFERENCES `medidas` (`idmedidas`),
  CONSTRAINT `medidas_has_matricula_ibfk_2` FOREIGN KEY (`fk_matricula`) REFERENCES `matricula` (`idmatricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla atsanet.medidas_has_matricula: ~51 rows (aproximadamente)
DELETE FROM `medidas_has_matricula`;
INSERT INTO `medidas_has_matricula` (`fk_medidas`, `fk_matricula`) VALUES
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5),
	(7, 6),
	(7, 41),
	(7, 44),
	(7, 48),
	(8, 7),
	(8, 50),
	(8, 51),
	(9, 8),
	(10, 9),
	(11, 10),
	(12, 11),
	(13, 12),
	(14, 13),
	(15, 14),
	(16, 15),
	(17, 16),
	(18, 17),
	(19, 18),
	(20, 19),
	(20, 42),
	(20, 45),
	(20, 46),
	(20, 49),
	(21, 20),
	(21, 43),
	(23, 21),
	(24, 22),
	(26, 23),
	(27, 24),
	(29, 25),
	(30, 26),
	(32, 27),
	(33, 28),
	(34, 29),
	(35, 30),
	(36, 31),
	(37, 32),
	(40, 33),
	(41, 34),
	(42, 35),
	(44, 36),
	(45, 37),
	(46, 38),
	(46, 47),
	(47, 39),
	(49, 40);

-- Volcando estructura para tabla atsanet.objetivos
CREATE TABLE IF NOT EXISTS `objetivos` (
  `idobjetivos` int(4) NOT NULL AUTO_INCREMENT,
  `nom_objetivo` varchar(70) NOT NULL,
  PRIMARY KEY (`idobjetivos`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla atsanet.objetivos: ~37 rows (aproximadamente)
DELETE FROM `objetivos`;
INSERT INTO `objetivos` (`idobjetivos`, `nom_objetivo`) VALUES
	(1, 'control'),
	(2, 'pase medio'),
	(3, 'calentamiento'),
	(4, 'coordinación'),
	(5, 'recuperación'),
	(6, 'pase corto'),
	(7, 'habilidad/Destreza'),
	(8, 'conducción'),
	(9, 'tiro'),
	(10, 'velocidad'),
	(11, 'fuerza tren superior'),
	(12, 'entrada'),
	(13, 'desmarques'),
	(14, 'coontrataque'),
	(15, 'resistencia'),
	(16, 'cambios de orientacion'),
	(17, 'competitividad'),
	(18, 'paredes'),
	(19, 'posesion / ritmo de juego'),
	(20, 'comunicación'),
	(21, 'regate'),
	(22, 'concentracion'),
	(23, 'agresividad'),
	(24, 'espacios libres'),
	(25, 'resistencia anaerobica'),
	(26, 'pressing'),
	(27, 'repliegues'),
	(28, 'pase largo'),
	(29, 'creatividad'),
	(30, 'cabeza'),
	(31, 'salidas'),
	(32, 'cohesion grupal'),
	(33, 'perfeccionamiento de Habilidades'),
	(34, 'acciones combinativas'),
	(35, 'resistencia Aerobica'),
	(36, 'coberturas'),
	(37, 'marcaje zonal');

-- Volcando estructura para procedimiento atsanet.pa_aceptarpostulante
DELIMITER //
CREATE PROCEDURE `pa_aceptarpostulante`(
    IN p_fk_persona INT
)
BEGIN
    -- Actualizar el registro del postulante
    UPDATE personal_t 
    SET persona_activa = b'1', 
        postulante = b'0' 
    WHERE fk_persona = p_fk_persona;
END//
DELIMITER ;

-- Volcando estructura para procedimiento atsanet.pa_actualizar_edades
DELIMITER //
CREATE PROCEDURE `pa_actualizar_edades`()
BEGIN
    UPDATE persona
    SET edad_persona = TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE())
    WHERE fecha_nacimiento IS NOT NULL;
    
    
END//
DELIMITER ;

-- Volcando estructura para procedimiento atsanet.pa_addpostulanteentrenador
DELIMITER //
CREATE PROCEDURE `pa_addpostulanteentrenador`(
    IN p_id_persona VARCHAR(20),
    IN p_tipo_id VARCHAR(10),
    IN p_nom1_persona VARCHAR(50),
    IN p_nom2_persona VARCHAR(50),
    IN p_ape1_persona VARCHAR(50),
    IN p_ape2_persona VARCHAR(50),
    IN p_fecha_nacimiento DATE,
    IN p_direc_persona VARCHAR(200),
    IN p_tel_persona BIGINT,
    IN p_email_persona VARCHAR(100),
    IN p_fk_genero INT,
    IN p_fk_eps INT,
    IN p_fk_rh INT,
    IN p_contrasena VARCHAR(255)
)
BEGIN
    DECLARE v_id INT;

    -- Insertar en persona (sin calcular la edad)
    INSERT INTO persona (
        id_persona, tipo_id, nom1_persona, nom2_persona, ape1_persona, ape2_persona,
        fecha_nacimiento, direc_persona, tel_persona, email_persona,
        fk_genero, fk_eps, fk_rh
    ) VALUES (
        p_id_persona, p_tipo_id, p_nom1_persona, p_nom2_persona, p_ape1_persona, p_ape2_persona,
        p_fecha_nacimiento, p_direc_persona, p_tel_persona, p_email_persona,
        p_fk_genero, p_fk_eps, p_fk_rh
    );

    -- Obtener el id autoincremental generado
    SET v_id = LAST_INSERT_ID();

    -- Insertar en personal_t
    INSERT INTO personal_t (
        fk_persona, contrasena, fk_tipo_personal, persona_activa, postulante
    ) VALUES (
        v_id, p_contrasena, 2, b'0', b'1'
    );
END//
DELIMITER ;

-- Volcando estructura para procedimiento atsanet.pa_updatepersonal
DELIMITER //
CREATE PROCEDURE `pa_updatepersonal`(
    IN p_id INT(4),
    IN p_tipo_id VARCHAR(5),
    IN p_id_persona INT,
    IN p_nom1_persona VARCHAR(20),
    IN p_nom2_persona VARCHAR(20),
    IN p_ape1_persona VARCHAR(20),
    IN p_ape2_persona VARCHAR(20),
    IN p_fecha_nacimiento DATE,
    IN p_direc_persona VARCHAR(100),
    IN p_tel_persona BIGINT(10),
    IN p_email_persona VARCHAR(100),
    IN p_fk_genero INT(4),
    IN p_fk_eps INT(4),
    IN p_fk_rh INT(4)
)
BEGIN
    -- Actualizar datos en la tabla persona
    UPDATE persona SET 
        tipo_id = p_tipo_id,
        id_persona = p_id_persona,
        nom1_persona = p_nom1_persona,
        nom2_persona = p_nom2_persona,
        ape1_persona = p_ape1_persona,
        ape2_persona = p_ape2_persona,
        fecha_nacimiento = p_fecha_nacimiento,
        direc_persona = p_direc_persona,
        tel_persona = p_tel_persona,
        email_persona = p_email_persona,
        fk_genero = p_fk_genero,
        fk_eps = p_fk_eps,
        fk_rh = p_fk_rh
    WHERE id = p_id;
END//
DELIMITER ;

-- Volcando estructura para tabla atsanet.persona
CREATE TABLE IF NOT EXISTS `persona` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `id_persona` int(11) NOT NULL,
  `tipo_id` varchar(12) NOT NULL,
  `nom1_persona` varchar(20) NOT NULL,
  `nom2_persona` varchar(20) DEFAULT NULL,
  `ape1_persona` varchar(20) NOT NULL,
  `ape2_persona` varchar(20) DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  `edad_persona` tinyint(2) DEFAULT NULL,
  `direc_persona` varchar(100) NOT NULL,
  `tel_persona` bigint(10) NOT NULL,
  `email_persona` varchar(100) NOT NULL,
  `fk_genero` int(11) DEFAULT NULL,
  `fk_eps` int(11) DEFAULT NULL,
  `fk_rh` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_genero` (`fk_genero`),
  KEY `fk_eps` (`fk_eps`),
  KEY `fk_rh` (`fk_rh`),
  CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`fk_genero`) REFERENCES `genero` (`idgenero`),
  CONSTRAINT `persona_ibfk_2` FOREIGN KEY (`fk_eps`) REFERENCES `eps` (`ideps`),
  CONSTRAINT `persona_ibfk_3` FOREIGN KEY (`fk_rh`) REFERENCES `rh` (`idrh`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla atsanet.persona: ~61 rows (aproximadamente)
DELETE FROM `persona`;
INSERT INTO `persona` (`id`, `id_persona`, `tipo_id`, `nom1_persona`, `nom2_persona`, `ape1_persona`, `ape2_persona`, `fecha_nacimiento`, `edad_persona`, `direc_persona`, `tel_persona`, `email_persona`, `fk_genero`, `fk_eps`, `fk_rh`) VALUES
	(1, 102455678, 'CC', 'Juan', 'Carlos', 'Rodríguez', 'Gómez', '2005-07-31', 19, 'Calle 1 #2-10 Barrio Centro', 3105678910, 'juancarlos.rodriguez85@gmail.com', 1, 1, 1),
	(2, 106737898, 'TI', 'Jorge', 'Enrique', 'Gómez', NULL, '2020-01-12', 4, 'Carrera 5 #4-12 Barrio El Carmen', 3122345678, 'enrique.gomez.jorge@gmail.com', 1, 2, 3),
	(3, 105858588, 'TI', 'Andrés', 'Felipe', 'Martínez', 'Ramírez', '2016-08-20', 8, 'Calle 3 #6-15 Barrio San Francisco', 3204567890, 'afmartinez.andres@outlook.com', 1, 4, 2),
	(4, 104488484, 'TI', 'Paula', NULL, 'Romero', 'Vargas', '2016-02-18', 8, 'Carrera 7 #5-17 Barrio La Esperanza', 3229876543, 'paula.andrea.romero98@yahoo.com', 2, 3, 2),
	(5, 107388484, 'CC', 'Sebastián', 'Alejandro', 'González', 'Torres', '2004-11-14', 20, 'Calle 8 #9-21 Barrio San Martín', 3211234567, 'sebastian.a.gonzalez@hotmail.com', 1, 5, 2),
	(6, 103737744, 'CC', 'Luis', NULL, 'Salazar', NULL, '2004-08-22', 20, 'Carrera 3 #8-13 Barrio La Inmaculada', 3106781234, 'luis.alberto.garcia@gmail.com', 1, 6, 1),
	(7, 100838484, 'TI', 'Nicolás', 'David', 'Salazar', NULL, '2010-10-19', 14, 'Calle 6 #7-14 Barrio La Paz', 3132345678, 'nicolas_david.jimenez@gmail.com', 1, 4, 3),
	(8, 105885858, 'CC', 'Oscar', 'Eduardo', 'Cárdenas', NULL, '2006-06-29', 18, 'Carrera 9 #3-11 Barrio La Merced', 3156789012, 'oscar.e.cardenas92@outlook.com', 1, 4, 2),
	(9, 102004955, 'TI', 'Daniel', 'Santiago', 'López', 'Castro', '2010-05-12', 14, 'Calle 2 #4-16 Barrio Las Palmas', 3173456789, 'dsl.lópez@gmail.com', 1, 4, 1),
	(10, 103588585, 'TI', 'Santiago', 'Andrés', 'Díaz', 'Muñoz', '2020-04-03', 4, 'Carrera 6 #2-10 Barrio San José', 3119871234, 'santiago.andres.diaz@gmail.com', 1, 2, 4),
	(11, 102488855, 'TI', 'José', NULL, 'Ortiz', NULL, '2011-03-15', 13, 'Calle 5 #3-19 Barrio El Porvenir', 3104567890, 'jose.l.ortiz@gmail.com', 1, 4, 2),
	(12, 102245858, 'TI', 'María', 'Fernanda', 'García', 'López', '2008-02-24', 16, 'Carrera 4 #5-20 Barrio Santa Teresa', 3127890123, 'maria.fernanda.garcia@hotmail.com', 2, 1, 1),
	(13, 105555443, 'CC', 'Camila', 'Andrea', 'Morales', 'Rojas', '2005-04-05', 19, 'Calle 9 #6-12 Barrio Mirador', 3181234567, 'camila.a.morales@yahoo.com', 2, 2, 1),
	(14, 103355856, 'TI', 'Juan', 'José', 'Torres', NULL, '2018-10-16', 6, 'Carrera 2 #7-21 Barrio Los Andes', 3206543210, 'juan.jose.torres@gmail.com', 1, 3, 1),
	(15, 105556435, 'TI', 'Alejandro', 'José', 'Rodríguez', 'Moreno', '2010-01-05', 14, 'Calle 7 #9-13 Barrio Los Pinos', 3227894561, 'aj_rodriguez@gmail.com', 1, 6, 4),
	(16, 103345467, 'TI', 'Alejandro', 'David', 'Morales', 'Ortega', '2017-03-15', 7, 'Carrera 10 #4-16 Barrio San Antonio', 3232109876, 'alejandro.d.morales@gmail.com', 1, 4, 1),
	(17, 107474474, 'TI', 'Juan', 'Sebastián', 'Torres', 'López', '2018-10-05', 6, 'Calle 4 #8-19 Barrio Santa Rosa', 3214321098, 'juan.sebastian.torres@gmail.com', 1, 2, 1),
	(18, 104384858, 'TI', 'Gabriela', NULL, 'Sánchez', 'Mendoza', '2007-03-04', 17, 'Carrera 8 #3-15 Barrio Bello Horizonte', 3143456789, 'gcamila.sanchez@yahoo.com', 2, 5, 6),
	(19, 102355866, 'CC', 'Santiago', 'David', 'Ramírez', NULL, '2006-03-25', 18, 'Calle 1 #6-14 Barrio El Triunfo', 3105678901, 's.david.ramirez@gmail.com', 1, 1, 1),
	(20, 104747757, 'TI', 'Fernando', 'Antonio', 'Villanueva', 'Gutiérrez', '2008-12-21', 16, 'Carrera 11 #2-17 Barrio El Refugio', 3128901234, 'fernando.a.villanueva@outlook.com', 1, 3, 7),
	(21, 104583902, 'TI', 'Diego', 'Fernando', 'Jiménez', 'Gómez', '2012-08-11', 12, 'Calle 10 #5-10 Barrio El Prado', 3191234560, 'diego.fernando.jimenez@hotmail.com', 1, 3, 2),
	(22, 104958430, 'TI', 'José', 'Luis', 'Martínez', NULL, '2019-12-20', 5, 'Carrera 12 #8-18 Barrio La Floresta', 3134567891, 'jose.luis.martinez@yahoo.com', 1, 4, 3),
	(23, 103845701, 'TI', 'Valeria', NULL, 'Pérez', 'Cárdenas', '2016-10-19', 8, 'Calle 2 #9-20 Barrio Altamira', 3175678902, 'v.lucia.perez@gmail.com', 2, 2, 1),
	(24, 103485044, 'TI', 'Andrés', 'Felipe', 'López', 'Rodríguez', '2009-10-15', 15, 'Carrera 3 #6-19 Barrio San Pedro', 3186781235, 'andres.f.lopez@gmail.com', 1, 1, 8),
	(25, 100485905, 'CC', 'Andrés', 'Mauricio', 'Ruiz', 'Torres', '2006-03-12', 18, 'Calle 8 #2-15 Barrio La Pradera', 3113456782, 'andres.mauricio.ruiz@gmail.com', 1, 2, 2),
	(26, 100559383, 'CC', 'Daniel', 'Felipe', 'Salazar', NULL, '2005-03-01', 19, 'Carrera 4 #9-14 Barrio Las Margaritas', 3148904561, 'daniel.felipe.salazar@yahoo.com', 1, 2, 1),
	(27, 100048348, 'TI', 'Samuel', 'Alejandro', 'Rodríguez', 'Pérez', '2010-07-30', 14, 'Calle 3 #7-21 Barrio Villa María', 3105674321, 's.alejandro.rodriguez@gmail.com', 1, 4, 8),
	(28, 100304395, 'TI', 'Cristian', 'Camilo', 'Salcedo', NULL, '2018-04-30', 6, 'Carrera 6 #10-18 Barrio San Miguel', 3123456780, 'cristian.camilo.salcedo@outlook.com', 1, 2, 1),
	(29, 103938244, 'TI', 'Miguel', NULL, 'Martínez', 'Gómez', '2010-09-05', 14, 'Calle 9 #3-17 Barrio Los Olivos', 3198765432, 'miguel.angel.martinez@hotmail.com', 1, 8, 7),
	(30, 103490595, 'CC', 'Isabella', 'Sofía', 'Romero', 'Vargas', '2004-02-17', 20, 'Carrera 7 #2-11 Barrio Los Nogales', 3202345671, 'isabella.sofia.romero@gmail.com', 2, 1, 1),
	(31, 104995667, 'TI', 'Juan', NULL, 'Ortiz', 'Ramírez', '2009-09-27', 15, 'Calle 5 #4-10 Barrio Jardines de Vélez', 3229871230, 'juan.d.ortiz@gmail.com', 1, 3, 7),
	(32, 100205004, 'TI', 'Mauricio', 'Alberto', 'Quiñones', 'López', '2014-08-17', 10, 'Carrera 1 #9-12 Barrio Santa Elena', 3214567894, 'mauricio.alberto.quinones@yahoo.com', 1, 3, 3),
	(33, 105884433, 'TI', 'Alejandro', 'Fernando', 'Pérez', 'Jiménez', '2010-12-31', 14, 'Calle 6 #5-19 Barrio Santa Bárbara', 3187654321, 'alejandro.f.perez@gmail.com', 1, 3, 1),
	(34, 100384585, 'TI', 'Nicolás', 'Eduardo', 'Vargas', 'Moreno', '2019-08-09', 5, 'Calle 4 #3-16 Barrio Villa Esperanza', 3136789012, 'nicolas.eduardo.vargas@yahoo.com', 1, 3, 1),
	(35, 100032394, 'TI', 'Martín', 'Santiago', 'Jiménez', 'López', '2013-09-27', 11, 'Calle 10 #7-18 Barrio San Sebastián', 3165678901, 'ms.jimenez@gmail.com', 1, 5, 8),
	(36, 104385656, 'TI', 'Carlos', 'Andrés', 'Castro', 'Romero', '2008-06-06', 16, 'Carrera 8 #6-11 Barrio Buenos Aires', 3123456789, 'carlos.a.castro@yahoo.com', 1, 3, 2),
	(37, 109458688, 'TI', 'Juan', NULL, 'Ríos', 'González', '2010-02-18', 14, 'Carrera 3 #5-12 Barrio El Mirador', 3192109873, 'juan.p.rios@hotmail.com', 1, 2, 1),
	(38, 104567756, 'TI', 'Mateo', NULL, 'Pérez', NULL, '2014-07-30', 10, 'Calle 2 #6-14 Barrio Villa Linda', 3236781239, 'mateo.a.perez@gmail.com', 1, 2, 8),
	(39, 104359385, 'TI', 'Paula', 'Fernanda', 'Ramírez', 'Martínez', '2011-12-23', 15, 'Carrera 4 #9-17 Barrio El Horizonte', 3182345678, 'paula.f.ramirez@yahoo.com', 2, 3, 1),
	(40, 100058584, 'CC', 'Miguel', 'Ángel', 'Jaramillo', 'Zuluaga', '2005-02-03', 19, 'Carrera 6 #3-15 Barrio Altos de Vélez', 3173456783, 'miguel.a.jaramillo@outlook.com', 1, 3, 1),
	(41, 103247555, 'TI', 'Samuel', 'Nicolás', 'Romero', 'Muñoz', '2012-12-21', 12, 'Calle 8 #4-11 Barrio La Ceiba', 3127890120, 'samuel.n.romero@gmail.com', 1, 6, 8),
	(42, 190034556, 'TI', 'Gabriela', 'Lucía', 'Torres', 'Ramírez', '2008-01-07', 16, 'Carrera 7 #5-20 Barrio La Loma', 3154567892, 'gabriela.lucia.torres@yahoo.com', 1, 1, 2),
	(43, 104585686, 'CC', 'Alejandro', 'Santiago', 'Jiménez', 'Ramírez', '2005-01-28', 19, 'Calle 3 #10-19 Barrio Bosques de Vélez', 3201236789, 'alejandro.s.jimenez@gmail.com', 1, 3, 1),
	(44, 103456040, 'TI', 'Juan', NULL, 'Vargas', 'Pérez', '2017-02-26', 7, 'Carrera 5 #4-16 Barrio Santa Lucía', 3145678902, 'juan.andres.vargas@gmail.com', 1, 4, 1),
	(45, 104055607, 'CC', 'Carlos', 'Eduardo', 'López', NULL, '2006-01-15', 18, 'Calle 1 #5-18 Barrio Los Laureles', 3113456784, 'carlos.e.lopez@yahoo.com', 1, 3, 4),
	(46, 100467586, 'TI', 'Mariana', 'Sofía', 'Torres', 'Muñoz', '2014-09-05', 10, 'Carrera 9 #6-10 Barrio Los Alpes', 3181234569, 'mariana.sofia.torres@correo.com', 2, 5, 4),
	(47, 105438355, 'TI', 'Juan', NULL, 'Hernández', 'Pérez', '2020-05-21', 4, 'Calle 6 #7-11 Barrio El Bosque', 3159873210, 'juan.j.hernandez@outlook.com', 1, 3, 4),
	(48, 104828566, 'TI', 'Ricardo', NULL, 'Barrera', 'Figueroa', '2018-07-22', 6, 'Carrera 11 #8-16 Barrio El Recuerdo', 3194321097, 'ricardo.a.barrera@gmail.com', 1, 2, 1),
	(49, 104588664, 'TI', 'Sebastián', 'Manuel', 'Martinez', NULL, '2018-08-11', 6, 'Calle 4 #9-13 Barrio Los Girasoles', 3232345673, 'sebastian.m.romero@yahoo.com', 1, 6, 7),
	(50, 103856586, 'TI', 'Martín', 'Nicolás', 'Martinez', NULL, '2013-09-27', 11, 'Calle 8 #5-17 Barrio El Vergel', 3101234568, 'martin.n.perez@hotmail.com', 1, 1, 1),
	(51, 1001001001, 'CC', 'Mateo', NULL, 'Pérez', 'López', '1990-05-12', 34, 'Calle 11 #23-15', 3105551234, 'mateo.perez@email.com', 1, 2, 4),
	(52, 1001001005, 'CC', 'Daniel', '', 'Castro', 'Morales', '1993-08-21', 31, 'Transv 4A #33-55', 3189991111, 'daniel.castro@email.com', 1, 4, 5),
	(53, 1001001006, 'CC', 'María', 'Camila', 'Torres', 'Salgado', '1996-03-10', 28, 'Calle 8A #19-22', 3166667777, 'maria.torres@email.com', 2, 4, 1),
	(54, 1001001008, 'CC', 'Tatiana', NULL, 'Rincón', 'Arias', '1992-12-05', 32, 'Carrera 3 #9-09', 3191234567, 'tatiana.rincon@email.com', 2, 2, 4),
	(55, 1001001009, 'CC', 'Julian', '', 'Martín', 'Suárez', '1985-04-01', 39, 'Calle 19 #7-11', 3170001112, 'julian.martin@email.com', 1, 3, 2),
	(56, 1031133469, 'CC', 'Martín', 'Andrés', 'Acevedo', '', '1991-08-09', 33, 'trvs 45 re 45 34', 3242499701, 'tin@live.com.ar', 1, 1, 1),
	(57, 1028662497, 'CC', 'Nicol', '', 'Martínez', '', '2005-12-01', 19, 'call 34 re 4534  sdsf', 3224456372, 'nicol@gm.com', 2, 3, 3),
	(58, 1035544987, 'CC', 'Marcos', 'Jaime', 'Vargas', 'Rojas', '2001-06-06', 24, 'calle siempre viva 123', 3245879564, 'marcos@gm.com', 1, 7, 1),
	(60, 1034455984, 'CC', 'Jaime', '', 'Vanegas', '', '2002-07-10', 22, 'tv det 23345 fghdf 657', 3284645346, 'jaime@gm.com', 1, 6, 2),
	(63, 1002546756, 'CC', 'Lionel', 'Andrés', 'Messi', 'Cuccittini', '1986-06-26', 39, 'sdfvdvs3452345sdf', 3254544654, 'messi@gm.com', 1, 6, 2),
	(64, 1019118564, 'CC', 'Luis', 'Alejandro', 'Acevedo', 'Acevedo', '1996-04-22', 29, 'fkjfdvjd 4456 435fd', 3209964504, 'ale@gmail.com', 1, 3, 7),
	(65, 1001002002, 'CC', 'Román', 'Andrés', 'Riquelme', '', '1979-08-06', 45, 'jdbfjhdsag 4654dsgsd', 3254686994, 'roman@gmail.com', 1, 1, 1),
	(66, 1034952215, 'CC', 'Rogers', '', 'Ramírez', '', '1966-03-15', 59, 'calle 65 con 45 sur ', 3452532718, 'rogers@gmail.com', 1, 3, 5);

-- Volcando estructura para tabla atsanet.personal_jornada
CREATE TABLE IF NOT EXISTS `personal_jornada` (
  `fk_idPersonalTec` int(4) NOT NULL,
  `fk_jornada` int(4) NOT NULL,
  `activa` bit(1) DEFAULT b'1',
  PRIMARY KEY (`fk_idPersonalTec`,`fk_jornada`),
  KEY `fk_jornada` (`fk_jornada`),
  CONSTRAINT `personal_jornada_ibfk_1` FOREIGN KEY (`fk_idPersonalTec`) REFERENCES `personal_t` (`fk_persona`),
  CONSTRAINT `personal_jornada_ibfk_2` FOREIGN KEY (`fk_jornada`) REFERENCES `jornada` (`idjornada`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla atsanet.personal_jornada: ~5 rows (aproximadamente)
DELETE FROM `personal_jornada`;
INSERT INTO `personal_jornada` (`fk_idPersonalTec`, `fk_jornada`, `activa`) VALUES
	(51, 2, b'1'),
	(52, 3, b'1'),
	(53, 1, b'1'),
	(54, 3, b'1'),
	(55, 2, b'1');

-- Volcando estructura para tabla atsanet.personal_t
CREATE TABLE IF NOT EXISTS `personal_t` (
  `fk_persona` int(4) NOT NULL,
  `contrasena` varchar(64) NOT NULL,
  `fk_tipo_personal` int(4) NOT NULL,
  `persona_activa` bit(1) NOT NULL,
  `postulante` bit(1) DEFAULT NULL,
  PRIMARY KEY (`fk_persona`),
  KEY `fk_tipo_personal` (`fk_tipo_personal`),
  CONSTRAINT `personal_t_ibfk_1` FOREIGN KEY (`fk_persona`) REFERENCES `persona` (`id`),
  CONSTRAINT `personal_t_ibfk_2` FOREIGN KEY (`fk_tipo_personal`) REFERENCES `tipo_personal` (`idtipopersonal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla atsanet.personal_t: ~13 rows (aproximadamente)
DELETE FROM `personal_t`;
INSERT INTO `personal_t` (`fk_persona`, `contrasena`, `fk_tipo_personal`, `persona_activa`, `postulante`) VALUES
	(51, 'a0ce84d37c3879f40a82a4cc54492f9122e39b9713605418e079c27e5d204171', 1, b'1', b'0'),
	(52, '31da895dff55475c8f24cc504ea9b2ceeceb4daf8446b12a2c113930d82ebf6c', 2, b'1', b'0'),
	(53, '626e3c805e77eeb472c42c6be607be2af7ac5c08fd7050f278e0330fe81abf57', 2, b'0', b'0'),
	(54, 'd38c2c2acd9c265fc74952282c367c58cd1e8cab74d092232a8adc32f3112c06', 2, b'1', b'0'),
	(55, '8f0914437cb5574896b681c4cb10f89c145cb36e08d5fb88b4bd44f24b148320', 1, b'0', b'0'),
	(56, 'bcef5502d9ba8d3e4856ef34be73e08c87edf2f9e7a6acbb55817487eb5b7fdd', 2, b'0', b'1'),
	(57, 'c78bd6f467e8775b6581c289e022f1d2f6232d953b4c674ff85e3f39b0e39449', 2, b'0', b'1'),
	(58, 'd52d73c7f98eaf8689eb9203765ff63c991ae2948d84ca348ab5d986ebeb6ff6', 2, b'1', b'0'),
	(60, '8ff49234ba0a2a9289d727aceb8acb2940a34e03497ee92ff7d1a205046b9951', 2, b'1', b'0'),
	(63, '1145fa52010bb26c17c6fc854beaa21fa41e7943c8b079e4d02671df03273214', 2, b'0', b'1'),
	(64, '9224bad05c7df15aa6deba13ff6e66172d0834604362ca34872d8e0d29d1768f', 1, b'0', b'0'),
	(65, '4d72990af17cc63c8240b1c28a62e9012799624639db07b5335b9d1cdafd6aac', 2, b'0', b'0'),
	(66, '8525a5fc97522bfa1dc6f78e8348889279cc44677db703561567888176439293', 1, b'0', b'0');

-- Volcando estructura para tabla atsanet.personal_t_has_categoria
CREATE TABLE IF NOT EXISTS `personal_t_has_categoria` (
  `fk_persona_personal_t` int(4) NOT NULL,
  `fk_categoria` int(4) NOT NULL,
  PRIMARY KEY (`fk_persona_personal_t`,`fk_categoria`),
  KEY `fk_categoria` (`fk_categoria`),
  CONSTRAINT `personal_t_has_categoria_ibfk_1` FOREIGN KEY (`fk_persona_personal_t`) REFERENCES `personal_t` (`fk_persona`),
  CONSTRAINT `personal_t_has_categoria_ibfk_2` FOREIGN KEY (`fk_categoria`) REFERENCES `categoria` (`idcategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla atsanet.personal_t_has_categoria: ~5 rows (aproximadamente)
DELETE FROM `personal_t_has_categoria`;
INSERT INTO `personal_t_has_categoria` (`fk_persona_personal_t`, `fk_categoria`) VALUES
	(52, 1),
	(52, 2),
	(53, 3),
	(54, 4),
	(54, 5);

-- Volcando estructura para tabla atsanet.posicion
CREATE TABLE IF NOT EXISTS `posicion` (
  `idposicion` int(4) NOT NULL AUTO_INCREMENT,
  `nom_posicion` varchar(5) NOT NULL,
  `desc_posicion` varchar(30) NOT NULL,
  `estado_posicion` bit(1) NOT NULL,
  `fechaCreacion` datetime NOT NULL,
  `fechaActualizacion` datetime NOT NULL,
  PRIMARY KEY (`idposicion`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla atsanet.posicion: ~7 rows (aproximadamente)
DELETE FROM `posicion`;
INSERT INTO `posicion` (`idposicion`, `nom_posicion`, `desc_posicion`, `estado_posicion`, `fechaCreacion`, `fechaActualizacion`) VALUES
	(1, '1-POR', 'portero', b'1', '2025-06-22 14:30:00', '2025-06-22 14:30:00'),
	(2, '1-DEF', 'defensor central', b'1', '2025-06-22 14:30:00', '2025-06-22 14:30:00'),
	(3, '2-DEF', 'defensor lateral', b'1', '2025-06-22 14:30:00', '2025-06-22 14:30:00'),
	(4, '1-CEN', 'centrocampista defensivo', b'1', '2025-06-22 14:30:00', '2025-06-22 14:30:00'),
	(5, '2-CEN', 'centrocampista Ofencivo', b'1', '2025-06-22 14:30:00', '2025-06-22 14:30:00'),
	(6, '1-DEL', 'delantero central', b'1', '2025-06-22 14:30:00', '2025-06-22 14:30:00'),
	(7, '2-DEL', 'delantero extremo', b'1', '2025-06-22 14:30:00', '2025-06-22 14:30:00');

-- Volcando estructura para procedimiento atsanet.Reportes
DELIMITER //
CREATE PROCEDURE `Reportes`(
    IN p_id_categoria INT,
    IN p_id_alumno INT,
    IN p_fecha_inicio DATE,
    IN p_fecha_fin DATE
)
BEGIN
    -- Obtener información de la categoría
    SELECT 
        idcategoria,
        nom_categoria
    FROM categoria
    WHERE idcategoria = p_id_categoria;

    -- Obtener alumnos de la categoría
    SELECT 
        p.id AS id_alumno,
        CONCAT(p.nom1_persona, 
               CASE WHEN p.nom2_persona IS NOT NULL THEN CONCAT(' ', p.nom2_persona) ELSE '' END,
               ' ', p.ape1_persona,
               CASE WHEN p.ape2_persona IS NOT NULL THEN CONCAT(' ', p.ape2_persona) ELSE '' END) AS nombre_completo,
        c.nom_categoria AS categoria
    FROM persona p
    INNER JOIN alumno a ON p.id = a.fk_persona_alumno
    INNER JOIN categoria c ON a.fk_categoria = c.idcategoria
    WHERE a.fk_categoria = p_id_categoria 
      AND a.estado_alumno = 1
    ORDER BY nombre_completo;

    -- Obtener sesiones de entrenamiento del alumno
    SELECT 
        se.fecha_entrenamiento AS fecha,
        CASE WHEN asi.asistencia = 1 THEN 'Sí' ELSE 'No' END AS asistencia,
        e.nom_entrenamiento AS tipo_entrenamiento,
        CASE WHEN se.valoracion_objetivo = 1 THEN 'Cumplido' ELSE 'No Cumplido' END AS objetivo_cumplido
    FROM sesion_entrenamiento se
    INNER JOIN entrenamiento e ON se.fk_entrenamiento = e.identrenamiento
    LEFT JOIN asistencia asi ON se.fk_alumno = asi.fk_alumno AND se.fecha_entrenamiento = asi.fecha_asistencia
    WHERE se.fk_alumno = p_id_alumno 
      AND se.fecha_entrenamiento BETWEEN p_fecha_inicio AND p_fecha_fin
    ORDER BY se.fecha_entrenamiento;
END//
DELIMITER ;

-- Volcando estructura para tabla atsanet.rh
CREATE TABLE IF NOT EXISTS `rh` (
  `idrh` int(4) NOT NULL AUTO_INCREMENT,
  `nom_rh` varchar(3) NOT NULL,
  PRIMARY KEY (`idrh`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla atsanet.rh: ~8 rows (aproximadamente)
DELETE FROM `rh`;
INSERT INTO `rh` (`idrh`, `nom_rh`) VALUES
	(1, 'A+'),
	(2, 'A-'),
	(3, 'B+'),
	(4, 'B-'),
	(5, 'AB+'),
	(6, 'AB-'),
	(7, 'O+'),
	(8, 'O-');

-- Volcando estructura para tabla atsanet.sesion_entrenamiento
CREATE TABLE IF NOT EXISTS `sesion_entrenamiento` (
  `idsesionentrenamiento` int(4) NOT NULL AUTO_INCREMENT,
  `fk_alumno` int(4) DEFAULT NULL,
  `fecha_entrenamiento` date NOT NULL,
  `valoracion_objetivo` bit(1) NOT NULL,
  `observaciones` text NOT NULL,
  `fk_entrenamiento` int(4) DEFAULT NULL,
  PRIMARY KEY (`idsesionentrenamiento`),
  KEY `fk_alumno` (`fk_alumno`),
  KEY `fk_entrenamiento` (`fk_entrenamiento`),
  CONSTRAINT `sesion_entrenamiento_ibfk_1` FOREIGN KEY (`fk_alumno`) REFERENCES `alumno` (`fk_persona_alumno`),
  CONSTRAINT `sesion_entrenamiento_ibfk_2` FOREIGN KEY (`fk_entrenamiento`) REFERENCES `entrenamiento` (`identrenamiento`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla atsanet.sesion_entrenamiento: ~96 rows (aproximadamente)
DELETE FROM `sesion_entrenamiento`;
INSERT INTO `sesion_entrenamiento` (`idsesionentrenamiento`, `fk_alumno`, `fecha_entrenamiento`, `valoracion_objetivo`, `observaciones`, `fk_entrenamiento`) VALUES
	(1, 1, '2025-01-06', b'1', 'Pases por Tríos: Buen control y precisión a pesar del ligero retraso.', 1),
	(2, 1, '2025-01-07', b'1', 'Mete y corre: Ejecución fluida y buen entendimiento táctico. Asistió puntual.', 2),
	(3, 1, '2025-01-08', b'1', 'Sucesión de pases: Buena coordinación grupal, ligero retraso.', 3),
	(4, 1, '2025-01-09', b'1', 'Torpedos: Potencia y dirección adecuadas. Asistió puntual.', 4),
	(5, 1, '2025-01-10', b'0', '2 contra 1: Retraso significativo, dificultó la participación completa en el ejercicio.', 5),
	(6, 2, '2025-01-06', b'1', 'Línea imaginaria: Mantenimiento correcto del posicionamiento. Asistió puntual.', 6),
	(7, 2, '2025-01-07', b'0', 'Cada uno en su espacio: Retraso significativo, no se pudo integrar en la dinámica del espacio.', 7),
	(8, 2, '2025-01-08', b'1', 'Pases de la muerte: Buena finalización y asistencias. Asistió puntual.', 8),
	(9, 2, '2025-01-09', b'0', 'Pases y tiro a gol: Retraso, afectó la concentración en la finalización.', 9),
	(10, 2, '2025-01-10', b'1', 'Cambios de Orientación: Excelente visión de juego y ejecución. Asistió puntual.', 10),
	(11, 3, '2025-01-06', b'0', 'Superioridad e incorporación: Retraso significativo, no participó en la fase principal del ejercicio.', 11),
	(12, 3, '2025-01-07', b'1', 'Doble pared y tiro: Excelente combinación y efectividad en el tiro. Asistió puntual.', 12),
	(13, 3, '2025-01-08', b'1', 'Maniobra y pase: Buena agilidad y precisión en los pases. Ligero retraso.', 13),
	(14, 3, '2025-01-09', b'1', '6 Porterías pequeñas: Gran capacidad de definición. Asistió puntual.', 14),
	(15, 3, '2025-01-10', b'1', 'Partido con comodines: Buena adaptación al juego y uso de los comodines. Ligero retraso.', 15),
	(16, 4, '2025-01-06', b'1', 'Ejercicios de biometría: Correcta ejecución de los movimientos. Asistió puntual.', 16),
	(17, 4, '2025-01-07', b'0', 'Resistencia: Retraso excesivo, no pudo completar la sesión de resistencia.', 17),
	(18, 4, '2025-01-08', b'1', 'Pases por Tríos: Buena fluidez en el ejercicio. Asistió puntual.', 1),
	(19, 4, '2025-01-09', b'1', 'Mete y corre: Buen ritmo y comprensión. Ligero retraso.', 2),
	(20, 4, '2025-01-10', b'1', 'Sucesión de pases: Excelente sincronización. Asistió puntual.', 3),
	(21, 5, '2025-01-06', b'1', 'Torpedos: Buena potencia a pesar del ligero retraso.', 4),
	(22, 5, '2025-01-07', b'1', '2 contra 1: Decisión y ejecución correctas. Asistió puntual.', 5),
	(23, 5, '2025-01-08', b'0', 'Línea imaginaria: Retraso, afectó el posicionamiento inicial del ejercicio.', 6),
	(24, 5, '2025-01-09', b'1', 'Cada uno en su espacio: Mantuvo bien su zona. Asistió puntual.', 7),
	(25, 5, '2025-01-10', b'1', 'Pases de la muerte: Muy buenas asistencias. Ligero retraso.', 8),
	(26, 6, '2025-01-06', b'0', 'Pases y tiro a gol: Retraso significativo, no logró participar en la fase principal.', 9),
	(27, 6, '2025-01-08', b'0', 'Cambios de Orientación: Retraso excesivo, no pudo adaptarse a los cambios de dirección.', 10),
	(28, 6, '2025-01-10', b'0', 'Superioridad e incorporación: Ausencia justificada. Sesión no realizada.', 11),
	(29, 7, '2025-01-07', b'1', 'Doble pared y tiro: Excelente coordinación y definición. Asistió puntual.', 12),
	(30, 7, '2025-01-09', b'0', 'Maniobra y pase: Retraso extremo, no se unió a la sesión.', 13),
	(31, 7, '2025-01-10', b'1', '6 Porterías pequeñas: Buena capacidad de adaptación y finalización. Ligero retraso.', 14),
	(32, 8, '2025-01-06', b'1', 'Partido con comodines: Buena integración y uso de las ventajas. Ligero retraso.', 15),
	(33, 8, '2025-01-08', b'0', 'Ejercicios de biometría: Ausencia sin justificar. Sesión no realizada.', 16),
	(34, 8, '2025-01-09', b'0', 'Resistencia: Retraso considerable, no pudo completar la rutina.', 17),
	(35, 9, '2025-01-07', b'1', 'Pases por Tríos: Buen control y ritmo. Asistió puntual.', 1),
	(36, 9, '2025-01-08', b'1', 'Mete y corre: Demostró buena velocidad y visión. Ligero retraso.', 2),
	(37, 9, '2025-01-10', b'0', 'Sucesión de pases: Ausencia justificada. Sesión no realizada.', 3),
	(38, 10, '2025-01-06', b'1', 'Torpedos: Buena potencia y precisión. Ligero retraso.', 4),
	(39, 10, '2025-01-07', b'1', '2 contra 1: Decisión rápida y efectiva. Asistió puntual.', 5),
	(40, 10, '2025-01-08', b'0', 'Línea imaginaria: Retraso, afectó la comprensión y el desarrollo del ejercicio.', 6),
	(41, 10, '2025-01-09', b'1', 'Cada uno en su espacio: Mantuvo su zona eficazmente. Ligero retraso.', 7),
	(42, 10, '2025-01-10', b'1', 'Pases de la muerte: Gran acierto en las asistencias. Asistió puntual.', 8),
	(43, 10, '2025-01-11', b'0', 'Pases y tiro a gol: Retraso significativo, no participó en los ejercicios de tiro.', 9),
	(44, 10, '2025-01-12', b'1', 'Cambios de Orientación: Excelente agilidad y coordinación. Ligero retraso.', 10),
	(45, 11, '2025-01-06', b'1', 'Superioridad e incorporación: Buena comprensión táctica. Asistió puntual.', 11),
	(46, 11, '2025-01-07', b'0', 'Doble pared y tiro: Retraso excesivo, no pudo realizar las combinaciones.', 12),
	(47, 11, '2025-01-08', b'1', 'Maniobra y pase: Demostró buen control y habilidad. Asistió puntual.', 13),
	(48, 11, '2025-01-09', b'0', '6 Porterías pequeñas: Retraso, no pudo involucrarse en la dinámica de juego.', 14),
	(49, 11, '2025-01-10', b'1', 'Partido con comodines: Participación activa y efectiva. Asistió puntual.', 15),
	(50, 11, '2025-01-11', b'1', 'Ejercicios de biometría: Buena respuesta física. Ligero retraso.', 16),
	(51, 11, '2025-01-12', b'1', 'Resistencia: Completó la sesión con buen esfuerzo. Ligero retraso.', 17),
	(52, 12, '2025-01-06', b'0', 'Pases por Tríos: Retraso considerable, afectó la coordinación del grupo.', 1),
	(53, 12, '2025-01-09', b'0', 'Mete y corre: Ausencia justificada. Sesión no realizada.', 2),
	(54, 13, '2025-01-07', b'1', 'Sucesión de pases: Buena integración en el ejercicio. Ligero retraso.', 3),
	(55, 13, '2025-01-10', b'0', 'Torpedos: Retraso muy significativo, no pudo realizar el ejercicio.', 4),
	(56, 14, '2025-01-06', b'1', '2 contra 1: Ejecución precisa. Asistió puntual.', 5),
	(57, 14, '2025-01-08', b'0', 'Línea imaginaria: Ausencia sin justificar. Sesión no realizada.', 6),
	(58, 15, '2025-01-07', b'0', 'Cada uno en su espacio: Retraso, no pudo mantener su posicionamiento.', 7),
	(59, 15, '2025-01-09', b'0', 'Pases de la muerte: Ausencia justificada. Sesión no realizada.', 8),
	(60, 16, '2025-01-08', b'0', 'Pases y tiro a gol: Retraso, no pudo participar activamente en el tiro.', 9),
	(61, 16, '2025-01-10', b'1', 'Cambios de Orientación: Excelente en los cambios. Asistió puntual.', 10),
	(62, 17, '2025-01-06', b'0', 'Superioridad e incorporación: Ausencia justificada. Sesión no realizada.', 11),
	(63, 17, '2025-01-09', b'1', 'Doble pared y tiro: Buena combinación a pesar del retraso.', 12),
	(64, 18, '2025-01-08', b'0', 'Maniobra y pase: Retraso excesivo, no pudo participar en el ejercicio.', 13),
	(65, 19, '2025-01-06', b'0', '6 Porterías pequeñas: Ausencia sin justificar. Sesión no realizada.', 14),
	(66, 20, '2025-01-09', b'1', 'Partido con comodines: Buen entendimiento del juego. Ligero retraso.', 15),
	(67, 21, '2025-01-07', b'0', 'Ejercicios de biometría: Ausencia sin justificar. Sesión no realizada.', 16),
	(68, 22, '2025-01-10', b'1', 'Resistencia: Demostró buena capacidad. Asistió puntual.', 17),
	(69, 23, '2025-01-06', b'0', 'Pases por Tríos: Ausencia sin justificar. Sesión no realizada.', 1),
	(70, 24, '2025-01-08', b'0', 'Mete y corre: Retraso, no logró integrarse en el ejercicio.', 2),
	(71, 25, '2025-01-07', b'0', 'Sucesión de pases: Ausencia sin justificar. Sesión no realizada.', 3),
	(72, 26, '2025-01-09', b'0', 'Torpedos: Retraso muy significativo, no pudo realizar el ejercicio.', 4),
	(73, 27, '2025-01-06', b'0', '2 contra 1: Ausencia sin justificar. Sesión no realizada.', 5),
	(74, 28, '2025-01-10', b'0', 'Línea imaginaria: Ausencia sin justificar. Sesión no realizada.', 6),
	(75, 29, '2025-01-08', b'1', 'Cada uno en su espacio: Mantuvo su posicionamiento correctamente. Asistió puntual.', 7),
	(76, 30, '2025-01-07', b'0', 'Pases de la muerte: Ausencia sin justificar. Sesión no realizada.', 8),
	(77, 31, '2025-01-09', b'0', 'Pases y tiro a gol: Ausencia sin justificar. Sesión no realizada.', 9),
	(78, 32, '2025-01-06', b'0', 'Cambios de Orientación: Retraso, no pudo ejecutar los cambios de ritmo.', 10),
	(79, 33, '2025-01-08', b'0', 'Superioridad e incorporación: Ausencia sin justificar. Sesión no realizada.', 11),
	(80, 34, '2025-01-10', b'1', 'Doble pared y tiro: Buen entendimiento de la jugada. Ligero retraso.', 12),
	(81, 35, '2025-01-07', b'0', 'Maniobra y pase: Ausencia sin justificar. Sesión no realizada.', 13),
	(82, 36, '2025-01-09', b'0', '6 Porterías pequeñas: Ausencia sin justificar. Sesión no realizada.', 14),
	(83, 37, '2025-01-06', b'1', 'Partido con comodines: Excelente participación. Asistió puntual.', 15),
	(84, 38, '2025-01-08', b'0', 'Ejercicios de biometría: Ausencia sin justificar. Sesión no realizada.', 16),
	(85, 39, '2025-01-10', b'0', 'Resistencia: Ausencia sin justificar. Sesión no realizada.', 17),
	(86, 40, '2025-01-07', b'0', 'Pases por Tríos: Retraso muy significativo, no participó activamente.', 1),
	(87, 41, '2025-01-09', b'0', 'Mete y corre: Ausencia sin justificar. Sesión no realizada.', 2),
	(88, 42, '2025-01-06', b'0', 'Sucesión de pases: Ausencia sin justificar. Sesión no realizada.', 3),
	(89, 43, '2025-01-08', b'0', 'Torpedos: Ausencia sin justificar. Sesión no realizada.', 4),
	(90, 44, '2025-01-10', b'1', '2 contra 1: Buena resolución de la situación. Ligero retraso.', 5),
	(91, 45, '2025-01-07', b'0', 'Línea imaginaria: Ausencia sin justificar. Sesión no realizada.', 6),
	(92, 46, '2025-01-09', b'0', 'Cada uno en su espacio: Ausencia sin justificar. Sesión no realizada.', 7),
	(93, 47, '2025-01-06', b'1', 'Pases de la muerte: Gran acierto en los pases. Asistió puntual.', 8),
	(94, 48, '2025-01-08', b'0', 'Pases y tiro a gol: Ausencia sin justificar. Sesión no realizada.', 9),
	(95, 49, '2025-01-10', b'0', 'Cambios de Orientación: Ausencia sin justificar. Sesión no realizada.', 10),
	(96, 50, '2025-01-07', b'1', 'Superioridad e incorporación: Buena lectura del juego. Ligero retraso.', 11);

-- Volcando estructura para tabla atsanet.tipo_personal
CREATE TABLE IF NOT EXISTS `tipo_personal` (
  `idtipopersonal` int(4) NOT NULL AUTO_INCREMENT,
  `nom_tipo_per` varchar(17) NOT NULL,
  PRIMARY KEY (`idtipopersonal`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla atsanet.tipo_personal: ~2 rows (aproximadamente)
DELETE FROM `tipo_personal`;
INSERT INTO `tipo_personal` (`idtipopersonal`, `nom_tipo_per`) VALUES
	(1, 'administrador'),
	(2, 'entrenador');

-- Volcando estructura para disparador atsanet.tr_actualizar_edad_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER tr_actualizar_edad_insert BEFORE INSERT ON persona
FOR EACH ROW
BEGIN
    IF NEW.fecha_nacimiento IS NOT NULL THEN
        SET NEW.edad_persona = TIMESTAMPDIFF(YEAR, NEW.fecha_nacimiento, CURDATE());
    END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador atsanet.tr_actualizar_edad_update
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER tr_actualizar_edad_update BEFORE UPDATE ON persona
FOR EACH ROW
BEGIN
    IF NEW.fecha_nacimiento IS NOT NULL AND (OLD.fecha_nacimiento IS NULL OR NEW.fecha_nacimiento != OLD.fecha_nacimiento) THEN
        SET NEW.edad_persona = TIMESTAMPDIFF(YEAR, NEW.fecha_nacimiento, CURDATE());
    END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
