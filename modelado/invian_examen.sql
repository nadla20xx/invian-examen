-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 03-10-2019 a las 14:55:19
-- Versión del servidor: 5.7.27-0ubuntu0.19.04.1
-- Versión de PHP: 7.3.9-1+ubuntu19.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `invian_examen`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `nombre_categoria` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `id_empresa`, `nombre_categoria`) VALUES
(1, 1, 'Desarrollador'),
(2, 1, 'Analista'),
(5, 1, 'Administrador'),
(6, 1, 'Gerente'),
(7, 2, 'DB designer'),
(8, 2, 'Administrador de servidores');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE `empresas` (
  `id_empresa` int(11) NOT NULL,
  `ruc` varchar(11) NOT NULL,
  `razon_social` varchar(250) NOT NULL,
  `nombre_comercial` varchar(250) NOT NULL,
  `direccion` text,
  `gerente_general` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empresas`
--

INSERT INTO `empresas` (`id_empresa`, `ruc`, `razon_social`, `nombre_comercial`, `direccion`, `gerente_general`, `created_at`, `updated_at`) VALUES
(1, '20272209325', 'PESCA PERU MOLLENDO S.A.', 'PESCA PERU MOLLENDO S.A.', NULL, NULL, '2019-10-03 17:40:29', NULL),
(2, '20330791412', 'ENEL GENERACION PERU S.A.A.', 'ENEL GENERACION PERU S.A.A.', NULL, NULL, '2019-10-03 17:40:29', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `id_empresa` int(10) UNSIGNED NOT NULL,
  `nombres` varchar(200) NOT NULL,
  `apellido_paterno` varchar(200) NOT NULL,
  `apellido_materno` varchar(200) NOT NULL,
  `tipo_documento_identidad` tinyint(3) UNSIGNED NOT NULL,
  `numero_documento_identidad` varchar(15) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `direccion` text,
  `correo` varchar(200) NOT NULL,
  `sexo` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `id_empresa`, `nombres`, `apellido_paterno`, `apellido_materno`, `tipo_documento_identidad`, `numero_documento_identidad`, `fecha_nacimiento`, `direccion`, `correo`, `sexo`, `created_at`, `updated_at`) VALUES
(3, 1, 'ADRIAN LUCIANO', 'GOMES', 'YUPANQUI', 2, 'Z2480100', '2019-10-06', NULL, '', 1, '2019-10-03 18:09:40', NULL),
(4, 1, 'CARLOS', 'ZEVALLOS', 'HERENCIA', 2, 'Z2913110', '2010-06-11', NULL, '', 1, '2019-10-03 18:09:40', NULL),
(5, 2, 'GABRIEL', 'RODRIGUES', 'HINOSTROZA', 2, 'YC411483', '2001-07-23', NULL, '', 1, '2019-10-03 18:11:21', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_categorias`
--

CREATE TABLE `usuarios_categorias` (
  `id_usuario_categoria` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios_categorias`
--

INSERT INTO `usuarios_categorias` (`id_usuario_categoria`, `id_usuario`, `id_categoria`) VALUES
(1, 3, 1),
(2, 3, 2),
(3, 5, 7);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`),
  ADD KEY `categorias_id_empresa` (`id_empresa`);

--
-- Indices de la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`id_empresa`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `usuarios_id_empresa` (`id_empresa`);

--
-- Indices de la tabla `usuarios_categorias`
--
ALTER TABLE `usuarios_categorias`
  ADD PRIMARY KEY (`id_usuario_categoria`),
  ADD KEY `usuarios_categorias_id_usuario` (`id_usuario`),
  ADD KEY `usuarios_categorias_id_categoria` (`id_categoria`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `empresas`
--
ALTER TABLE `empresas`
  MODIFY `id_empresa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuarios_categorias`
--
ALTER TABLE `usuarios_categorias`
  MODIFY `id_usuario_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD CONSTRAINT `categorias_id_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
