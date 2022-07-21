-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-07-2022 a las 05:50:20
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `usmpizza`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `base_pizza`
--

CREATE TABLE `base_pizza` (
  `id_base` int(11) NOT NULL,
  `tipo_base` varchar(10) NOT NULL,
  `precio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `base_pizza`
--

INSERT INTO `base_pizza` (`id_base`, `tipo_base`, `precio`) VALUES
(1, 'MASA GRUES', 1500),
(2, 'MASA DELGA', 900);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `id_pedido` int(11) NOT NULL,
  `id_pizza` int(11) NOT NULL,
  `precio_pizza` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalle_pedido`
--

INSERT INTO `detalle_pedido` (`id_pedido`, `id_pizza`, `precio_pizza`, `cantidad`) VALUES
(2, 4, 8000, 1),
(3, 2, 50000, 1),
(3, 3, 50000, 1),
(3, 4, 50000, 1),
(3, 5, 50000, 1),
(3, 6, 50000, 1),
(4, 1, 56000, 2),
(4, 3, 56000, 3),
(4, 5, 56000, 1),
(5, 5, 10000, 1),
(6, 2, 24000, 2),
(7, 1, 30000, 1),
(7, 2, 30000, 1),
(7, 3, 30000, 1),
(8, 1, 8000, 1),
(9, 2, 12000, 1),
(10, 3, 10000, 1),
(11, 2, 12000, 1),
(12, 2, 12000, 1),
(13, 1, 24000, 3),
(14, 1, 48000, 3),
(14, 2, 48000, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredientes`
--

CREATE TABLE `ingredientes` (
  `id_ingrediente` int(2) UNSIGNED NOT NULL,
  `nombre_ingrediente` varchar(20) DEFAULT NULL,
  `precio_ingrediente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ingredientes`
--

INSERT INTO `ingredientes` (`id_ingrediente`, `nombre_ingrediente`, `precio_ingrediente`) VALUES
(1, 'TOMATE', 700),
(2, 'JAMON', 900),
(3, 'PEPERONI', 900),
(4, 'ALBAHACA', 700),
(5, 'CHOCLO', 700),
(6, 'PIÑA', 900),
(7, 'CAMARONES', 900),
(8, 'TOCINO', 900),
(9, 'SEITAN', 900),
(10, 'TOFU', 900),
(11, 'ALBACORA', 900);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int(10) UNSIGNED NOT NULL,
  `id_user` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `medio_pago` tinyint(4) NOT NULL,
  `precio_total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id_pedido`, `id_user`, `fecha`, `medio_pago`, `precio_total`) VALUES
(3, 5, '2022-07-20 07:30:47', 1, 50000),
(5, 5, '2022-07-20 09:55:05', 1, 10000),
(6, 5, '2022-07-20 10:02:00', 1, 24000),
(7, 5, '2022-07-20 10:23:20', 1, 30000),
(10, 5, '2022-07-20 10:25:48', 1, 10000),
(12, 4, '2022-07-21 08:53:03', 1, 12000),
(13, 4, '2022-07-21 09:37:51', 1, 24000),
(14, 5, '2022-07-21 09:41:29', 1, 48000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pizza`
--

CREATE TABLE `pizza` (
  `id_pizza` int(11) NOT NULL,
  `tipo_pizza` tinyint(1) UNSIGNED NOT NULL,
  `precio_total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pizza_armada`
--

CREATE TABLE `pizza_armada` (
  `id_pizza` int(11) NOT NULL,
  `id_ingrediente` int(11) NOT NULL,
  `id_base` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pizza_preparada`
--

CREATE TABLE `pizza_preparada` (
  `id_pizza` int(10) UNSIGNED NOT NULL,
  `nombre_pizza` varchar(50) NOT NULL,
  `precio_pizza` int(6) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `Img` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pizza_preparada`
--

INSERT INTO `pizza_preparada` (`id_pizza`, `nombre_pizza`, `precio_pizza`, `descripcion`, `Img`) VALUES
(1, 'Napolitana', 8000, 'Una Pizza Napolitana', './Imagenes/Peperoni.png'),
(2, 'Marinera', 12000, 'Una Pizza Marinera', './Imagenes/Pepverdura.png'),
(3, 'Española', 10000, 'Una Pizza Española', './Imagenes/española.png'),
(4, 'Peperonni', 8000, 'Una Pizza Peperonni', './Imagenes/Peperonii.png'),
(5, 'Margarita', 10000, 'Una Pizza Margarita', './Imagenes/margarita.png'),
(6, 'Hawaiiana', 10000, 'Una Pizza Hawaiiana', './Imagenes/hawaii.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_user` int(10) UNSIGNED NOT NULL,
  `rol` int(1) UNSIGNED NOT NULL DEFAULT 2,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nombre_user` varchar(50) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `direccion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_user`, `rol`, `username`, `password`, `nombre_user`, `telefono`, `correo`, `direccion`) VALUES
(2, 2, 'asdf', '123456', 'asdf', 'asdf', 'asdf', 'asdf'),
(3, 1, 'qwerty', '$2y$10$FMniMAIIpVCf3BBDbJ/TGOcO/jStNeyISkRyfvT/QKoCM7pXbxdu2', 'qwerty', '999023406', 'leksamg@gmail.com', 'qwerty direccion'),
(4, 2, 'qwerty1', '$2y$10$Q6kLh1MVKFAh7osNVwke1esriy6yd2PCFU2m7C.aPkk/9On6.K8AS', 'asdfe', '999023406', 'leksamg2@gmail.com', 'qwerty direccion'),
(5, 1, 'Admin', '$2y$10$Ru2xvR/nu3/yMpRQiqIf5.kFwhE4s8Ct3LYs3YQWRmS1HV8tgjmVu', 'Admin', '98639645', 'admin@gmail.com', 'admin addresss'),
(6, 2, 'leksam', '$2y$10$pBHP9WAqc4eQYeBeBwP9uegYZJT.VHKdnUVa46FTeNSvL/k5o9MUC', 'William', '968329645', 'leksamg3@gmail.com', ''),
(7, 2, 'leksam1', '$2y$10$mPsmD7.jmYSaJLpmNw28wuQxwMP79bFFdMkrX7NYOLgR9JzSHM2yG', 'William', '968329645', 'leksamg4@gmail.com', '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `base_pizza`
--
ALTER TABLE `base_pizza`
  ADD PRIMARY KEY (`id_base`);

--
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`id_pedido`,`id_pizza`);

--
-- Indices de la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
  ADD PRIMARY KEY (`id_ingrediente`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`,`id_user`);

--
-- Indices de la tabla `pizza`
--
ALTER TABLE `pizza`
  ADD PRIMARY KEY (`id_pizza`);

--
-- Indices de la tabla `pizza_armada`
--
ALTER TABLE `pizza_armada`
  ADD PRIMARY KEY (`id_pizza`,`id_ingrediente`,`id_base`);

--
-- Indices de la tabla `pizza_preparada`
--
ALTER TABLE `pizza_preparada`
  ADD PRIMARY KEY (`id_pizza`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `correo` (`correo`) USING BTREE;

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `base_pizza`
--
ALTER TABLE `base_pizza`
  MODIFY `id_base` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
  MODIFY `id_ingrediente` int(2) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `pizza_preparada`
--
ALTER TABLE `pizza_preparada`
  MODIFY `id_pizza` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_user` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
