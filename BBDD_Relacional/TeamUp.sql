-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: mysql
-- Tiempo de generación: 27-01-2025 a las 17:26:49
-- Versión del servidor: 9.2.0
-- Versión de PHP: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `TeamUp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Actividad`
--

CREATE TABLE `Actividad` (
  `ID_Actividad` int NOT NULL,
  `ID_Usuario` int NOT NULL,
  `Tipo_Actividad` varchar(200) DEFAULT NULL,
  `Fecha_Registro` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Chat`
--

CREATE TABLE `Chat` (
  `ID_Chat` int NOT NULL,
  `ID_Match` int DEFAULT NULL,
  `Fecha_creacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Juego`
--

CREATE TABLE `Juego` (
  `ID_Juego` int NOT NULL,
  `Nombre_Juego` varchar(70) DEFAULT NULL,
  `Genero` varchar(50) DEFAULT NULL,
  `Descripcion` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Juego_Usuario`
--

CREATE TABLE `Juego_Usuario` (
  `ID_Usuario` int NOT NULL,
  `ID_Juego` int NOT NULL,
  `Estadisticas` text,
  `Preferencias` text,
  `Nivel_Elo` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Match_Users`
--

CREATE TABLE `Match_Users` (
  `ID_Match` int NOT NULL,
  `ID_Usuario1` int NOT NULL,
  `ID_Usuario2` int NOT NULL,
  `Fecha_creacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Mensaje`
--

CREATE TABLE `Mensaje` (
  `ID_Mensaje` int NOT NULL,
  `ID_Chat` int NOT NULL,
  `ID_Usuario` int NOT NULL,
  `Tipo` varchar(100) DEFAULT NULL,
  `Fecha_envio` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuario`
--

CREATE TABLE `Usuario` (
  `ID_Usuario` int NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Correo` varchar(320) NOT NULL,
  `Contraseña` varchar(320) NOT NULL,
  `Foto_Perfil` text,
  `Edad` int DEFAULT NULL,
  `Region` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Actividad`
--
ALTER TABLE `Actividad`
  ADD PRIMARY KEY (`ID_Actividad`,`ID_Usuario`),
  ADD KEY `ID_Usuario` (`ID_Usuario`);

--
-- Indices de la tabla `Chat`
--
ALTER TABLE `Chat`
  ADD PRIMARY KEY (`ID_Chat`),
  ADD KEY `ID_Match` (`ID_Match`);

--
-- Indices de la tabla `Juego`
--
ALTER TABLE `Juego`
  ADD PRIMARY KEY (`ID_Juego`);

--
-- Indices de la tabla `Juego_Usuario`
--
ALTER TABLE `Juego_Usuario`
  ADD PRIMARY KEY (`ID_Usuario`,`ID_Juego`),
  ADD KEY `ID_Juego` (`ID_Juego`);

--
-- Indices de la tabla `Match_Users`
--
ALTER TABLE `Match_Users`
  ADD PRIMARY KEY (`ID_Match`),
  ADD KEY `ID_Usuario1` (`ID_Usuario1`),
  ADD KEY `ID_Usuario2` (`ID_Usuario2`);

--
-- Indices de la tabla `Mensaje`
--
ALTER TABLE `Mensaje`
  ADD PRIMARY KEY (`ID_Mensaje`,`ID_Chat`,`ID_Usuario`),
  ADD KEY `ID_Chat` (`ID_Chat`);

--
-- Indices de la tabla `Usuario`
--
ALTER TABLE `Usuario`
  ADD PRIMARY KEY (`ID_Usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Actividad`
--
ALTER TABLE `Actividad`
  MODIFY `ID_Actividad` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Chat`
--
ALTER TABLE `Chat`
  MODIFY `ID_Chat` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Juego`
--
ALTER TABLE `Juego`
  MODIFY `ID_Juego` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Match_Users`
--
ALTER TABLE `Match_Users`
  MODIFY `ID_Match` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Mensaje`
--
ALTER TABLE `Mensaje`
  MODIFY `ID_Mensaje` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Usuario`
--
ALTER TABLE `Usuario`
  MODIFY `ID_Usuario` int NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Actividad`
--
ALTER TABLE `Actividad`
  ADD CONSTRAINT `Actividad_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `Usuario` (`ID_Usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `Chat`
--
ALTER TABLE `Chat`
  ADD CONSTRAINT `Chat_ibfk_1` FOREIGN KEY (`ID_Match`) REFERENCES `Match_Users` (`ID_Match`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `Juego_Usuario`
--
ALTER TABLE `Juego_Usuario`
  ADD CONSTRAINT `Juego_Usuario_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `Usuario` (`ID_Usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Juego_Usuario_ibfk_2` FOREIGN KEY (`ID_Juego`) REFERENCES `Juego` (`ID_Juego`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `Match_Users`
--
ALTER TABLE `Match_Users`
  ADD CONSTRAINT `Match_Users_ibfk_1` FOREIGN KEY (`ID_Usuario1`) REFERENCES `Usuario` (`ID_Usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Match_Users_ibfk_2` FOREIGN KEY (`ID_Usuario2`) REFERENCES `Usuario` (`ID_Usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `Mensaje`
--
ALTER TABLE `Mensaje`
  ADD CONSTRAINT `Mensaje_ibfk_1` FOREIGN KEY (`ID_Chat`) REFERENCES `Chat` (`ID_Chat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Mensaje_ibfk_2` FOREIGN KEY (`ID_Chat`) REFERENCES `Usuario` (`ID_Usuario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
