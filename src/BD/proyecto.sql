-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 15-01-2022 a las 10:28:15
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto`
--

DROP DATABASE IF EXISTS proyecto;
CREATE DATABASE IF NOT EXISTS proyecto;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juego`
--

CREATE TABLE `juego` (
  `idJuego` int(2) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `juego`
--

INSERT INTO `juego` (`idJuego`, `nombre`) VALUES
(1, 'Practica las operaciones'),
(2, 'Vamos a la compra'),
(3, 'A contar'),
(4, 'Series numericas'),
(5, 'Escucha el numero'),
(6, 'Que hora es');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugador`
--

CREATE TABLE `jugador` (
  `idJugador` int(5) NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `contrasenya` varchar(20) NOT NULL,
  `nombreNinyo` varchar(30) NOT NULL,
  `edadNinyo` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `jugador`
--

INSERT INTO `jugador` (`idJugador`, `usuario`, `correo`, `contrasenya`, `nombreNinyo`, `edadNinyo`) VALUES
(1, 'mmar', 'mmar@gmail.com', 'mmar', 'mmar', 5),
(2, 'jorge', 'jorge@gmail.com', 'jorge', 'jorge', 9),
(3, 'carmen', 'carmen@gmail.com', 'carmen', 'carmen', 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partida`
--

CREATE TABLE `partida` (
  `idJugador` int(11) NOT NULL,
  `idJuego` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `puntuacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `partida`
--

INSERT INTO `partida` (`idJugador`, `idJuego`, `fecha`, `puntuacion`) VALUES
(1, 1, '2022-03-27', 5),
(1, 1, '2022-04-02', 3),
(1, 1, '2022-04-09', 1),
(1, 2, '2022-03-19', 5),
(1, 2, '2022-03-22', 7),
(1, 2, '2022-04-03', 2),
(1, 2, '2022-04-09', 3),
(1, 2, '2022-04-10', 6),
(1, 3, '2022-03-10', 2),
(1, 3, '2022-03-19', 8),
(1, 3, '2022-04-10', 5),
(1, 4, '2022-03-27', 6),
(1, 4, '2022-03-29', 2),
(1, 4, '2022-03-30', 3),
(1, 4, '2022-03-02', 9),
(1, 4, '2022-04-02', 4),
(1, 4, '2022-04-09', 1),
(1, 4, '2022-04-13', 5),
(1, 5, '2022-04-02', 2),
(1, 5, '2022-04-03', 1),
(1, 5, '2022-04-09', 3),
(1, 5, '2022-04-10', 6),
(1, 6, '2022-03-18', 6),
(1, 6, '2022-03-19', 2),
(1, 6, '2022-03-22', 8),
(1, 6, '2022-03-27', 4),
(1, 6, '2022-04-09', 3),
(1, 6, '2022-04-10', 5),
(2, 1, '2022-03-08', 9),
(2, 1, '2022-03-15', 10),
(2, 1, '2022-04-06', 3),
(2, 1, '2022-04-08', 6),
(2, 2, '2022-03-10', 4),
(2, 2, '2022-03-11', 5),
(2, 2, '2022-03-12', 8),
(2, 2, '2022-03-26', 6),
(2, 2, '2022-04-03', 2),
(2, 2, '2022-04-09', 1),
(2, 2, '2022-04-10', 3),
(2, 3, '2022-03-04', 10),
(2, 3, '2022-03-09', 6),
(2, 3, '2022-03-11', 8),
(2, 3, '2022-03-12', 4),
(2, 3, '2022-03-16', 4),
(2, 3, '2022-03-27', 6),
(2, 3, '2022-04-03', 4),
(2, 3, '2022-04-09', 4),
(2, 3, '2022-04-10', 1),
(2, 4, '2022-03-13', 13),
(2, 4, '2022-03-19', 4),
(2, 4, '2022-03-23', 1),
(2, 4, '2022-04-01', 7),
(2, 4, '2022-04-04', 2),
(2, 5, '2022-03-01', 2),
(2, 5, '2022-03-03', 4),
(2, 5, '2022-03-08', 8),
(2, 5, '2022-04-02', 1),
(2, 5, '2022-04-09', 3),
(2, 5, '2022-04-12', 7),
(2, 6, '2022-03-06', 3),
(2, 6, '2022-03-07', 7),
(2, 6, '2022-03-12', 1),
(2, 6, '2022-03-17', 4),
(2, 6, '2022-03-23', 4),
(2, 6, '2022-04-01', 6),
(2, 6, '2022-04-09', 1),
(3, 1, '2022-03-19', 8),
(3, 1, '2022-03-22', 2),
(3, 1, '2022-03-25', 12),
(3, 1, '2022-04-02', 5),
(3, 2, '2022-03-22', 2),
(3, 2, '2022-03-24', 1),
(3, 2, '2022-03-27', 8),
(3, 2, '2022-03-29', 5),
(3, 2, '2022-03-30', 11),
(3, 2, '2022-04-02', 7),
(3, 3, '2022-03-26', 2),
(3, 3, '2022-04-03', 4),
(3, 3, '2022-04-05', 1),
(3, 4, '2022-03-23', 7),
(3, 4, '2022-03-24', 9),
(3, 4, '2022-03-27', 5),
(3, 4, '2022-03-19', 2),
(3, 4, '2022-04-01', 1),
(3, 5, '2022-03-02', 8),
(3, 5, '2022-03-06', 6),
(3, 5, '2022-03-08', 4),
(3, 5, '2022-03-12', 6),
(3, 5, '2022-03-15', 8),
(3, 5, '2022-04-03', 3),
(3, 5, '2022-04-04', 1),
(3, 5, '2022-04-06', 6),
(3, 5, '2022-04-11', 10),
(3, 6, '2022-04-03', 9),
(3, 6, '2022-04-05', 3),
(3, 6, '2022-04-06', 6),
(3, 6, '2022-04-09', 5);

-- --------------------------------------------------------


--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `juego`
--
ALTER TABLE `juego`
  ADD PRIMARY KEY (`idJuego`);

--
-- Indices de la tabla `jugador`
--
ALTER TABLE `jugador`
  ADD PRIMARY KEY (`idJugador`);

--
-- Indices de la tabla `partida`
--
ALTER TABLE `partida`
  ADD PRIMARY KEY (`idJugador`,`idJuego`,`fecha`),
  ADD KEY `part_jue_FK` (`idJuego`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `juego`
--
ALTER TABLE `juego`
  MODIFY `idJuego` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `jugador`
--
ALTER TABLE `jugador`
  MODIFY `idJugador` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;



--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `partida`
--
ALTER TABLE `partida`
  ADD CONSTRAINT `part_jue_FK` FOREIGN KEY (`idJuego`) REFERENCES `juego` (`idJuego`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `part_jug_FK` FOREIGN KEY (`idJugador`) REFERENCES `jugador` (`idJugador`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
