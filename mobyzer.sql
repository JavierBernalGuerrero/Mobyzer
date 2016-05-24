-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 24-05-2016 a las 09:48:03
-- Versión del servidor: 5.5.35-1ubuntu1
-- Versión de PHP: 5.5.9-1ubuntu4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `mobyzer`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `DISPOSITIVO`
--

CREATE TABLE IF NOT EXISTS `DISPOSITIVO` (
  `idDispositivo` int(4) NOT NULL,
  `modelo` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `marca` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `idCpu` int(4) DEFAULT NULL,
  PRIMARY KEY (`idDispositivo`),
  UNIQUE KEY `modelo` (`modelo`),
  UNIQUE KEY `modelo_2` (`modelo`),
  KEY `idCpu` (`idCpu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `DISPOSITIVO`
--

INSERT INTO `DISPOSITIVO` (`idDispositivo`, `modelo`, `marca`, `idCpu`) VALUES
(1, 'Galaxy Note5', 'Samsung', 1),
(2, 'Galaxy Note Edge', 'Samsung', 2),
(3, 'Galaxy S7 edge', 'Samsung', 4),
(4, '5X', 'Nexus', 6),
(5, 'Leon', 'LG', 5),
(6, 'G Flex 2', 'LG', NULL),
(7, '9', 'Neuxs', 7),
(10, 'PRUEBA', 'asd', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PROCESADOR`
--

CREATE TABLE IF NOT EXISTS `PROCESADOR` (
  `idCpu` int(4) NOT NULL,
  `nombre` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tipo` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `velocidad` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idCpu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `PROCESADOR`
--

INSERT INTO `PROCESADOR` (`idCpu`, `nombre`, `tipo`, `velocidad`) VALUES
(1, '', '1.5GHz Octa-Core', '2.1GHz'),
(2, NULL, 'Quad-Core Processor ', '2.7 GHz'),
(3, '', '1.6GHz, Quad-Core ', '2.15GHz'),
(4, 'Qualcomm', 'Dual-core ', '2.15 GHz '),
(5, NULL, '1.2GHz, Quad-core', '1.3GHz'),
(6, 'Snapdragon', 'Procesador Qualcomm', '1,8 GHz'),
(7, 'NVIDIA', 'Tegra K1', '2,3 GHz');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `USUARIO`
--

CREATE TABLE IF NOT EXISTS `USUARIO` (
  `idUsuario` int(4) NOT NULL,
  `usuario` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `contraseña` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `usuario` (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `USUARIO`
--

INSERT INTO `USUARIO` (`idUsuario`, `usuario`, `contraseña`) VALUES
(1, 'root', 'root'),
(2, 'alumno', 'alumno');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `DISPOSITIVO`
--
ALTER TABLE `DISPOSITIVO`
  ADD CONSTRAINT `FK_CPU` FOREIGN KEY (`idCpu`) REFERENCES `PROCESADOR` (`idCpu`) ON DELETE NO ACTION ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
