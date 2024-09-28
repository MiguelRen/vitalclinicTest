-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-09-2024 a las 22:35:26
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `vitalclinic`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accounts`
--

CREATE TABLE `accounts` (
  `id_account` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `accounts`
--

INSERT INTO `accounts` (`id_account`, `id_empleado`, `username`, `password`, `role_id`) VALUES
(1, 1, 'mvblanco', '26532066', 1),
(2, 3, 'miguelr', '1234', 3),
(3, 4, 'flor', '3148', 2),
(5, 1, 'manu', '1234', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE `articulos` (
  `art` bigint(20) NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`art`, `descripcion`) VALUES
(123456, 'acetaminofen 20X10'),
(123789, 'Mebendazol 100ml');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id` int(11) NOT NULL,
  `cedula` varchar(15) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id`, `cedula`, `nombre`, `apellido`) VALUES
(1, '26532066', 'Manuel', 'Blanco'),
(3, '23896869', 'Miguel', 'Rengel'),
(4, '26689817', 'Floriana', 'Sucre');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrada_existencia_lotes_productos`
--

CREATE TABLE `entrada_existencia_lotes_productos` (
  `id` int(11) NOT NULL,
  `id_lote` int(11) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `cantidad` int(11) NOT NULL,
  `id_accounts` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fallas`
--

CREATE TABLE `fallas` (
  `id` bigint(20) NOT NULL,
  `id_pedido` bigint(100) NOT NULL,
  `id_despachador` int(11) NOT NULL,
  `id_rechequeador` int(11) NOT NULL,
  `motivo` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lotes`
--

CREATE TABLE `lotes` (
  `id` int(11) NOT NULL,
  `descripcion_lote` text NOT NULL,
  `art` bigint(20) NOT NULL,
  `fecha_venc` date NOT NULL,
  `existencia_total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesa_rechequeadores`
--

CREATE TABLE `mesa_rechequeadores` (
  `id` int(11) NOT NULL,
  `num_mesa` int(11) NOT NULL,
  `id_rechequeador` int(11) NOT NULL,
  `id_embalador` int(11) NOT NULL,
  `horario_almuerzo` varchar(8) NOT NULL,
  `dia_libre` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `mesa_rechequeadores`
--

INSERT INTO `mesa_rechequeadores` (`id`, `num_mesa`, `id_rechequeador`, `id_embalador`, `horario_almuerzo`, `dia_libre`) VALUES
(1, 1, 1, 3, '12pm', 'Viernes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `motivo_fallas`
--

CREATE TABLE `motivo_fallas` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `motivo_fallas`
--

INSERT INTO `motivo_fallas` (`id`, `descripcion`) VALUES
(1, 'Faltante'),
(2, 'Sobrante'),
(3, 'Invertido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedido` bigint(20) NOT NULL,
  `numero_pedido` varchar(100) NOT NULL,
  `id_ruta` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `fecha_rechequeo` datetime NOT NULL,
  `cantidad_unidades` int(11) NOT NULL,
  `distribuidor_pedidos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos_despachadores`
--

CREATE TABLE `pedidos_despachadores` (
  `id` bigint(20) NOT NULL,
  `id_pedido` bigint(20) NOT NULL,
  `id_despachador` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos_embaladores`
--

CREATE TABLE `pedidos_embaladores` (
  `id` bigint(20) NOT NULL,
  `id_pedido` bigint(20) NOT NULL,
  `id_embalador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos_rechequeadores`
--

CREATE TABLE `pedidos_rechequeadores` (
  `id` bigint(20) NOT NULL,
  `id_pedido` bigint(20) NOT NULL,
  `id_rechequeador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `privilegios`
--

CREATE TABLE `privilegios` (
  `id` int(11) NOT NULL,
  `accion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `privilegios`
--

INSERT INTO `privilegios` (`id`, `accion`) VALUES
(5, 'consultar_pedido'),
(12, 'eliminar_fallas_pedido'),
(4, 'eliminar_pedido'),
(3, 'modificar_pedido'),
(18, 'pedidos_por_despachador'),
(17, 'pedidos_por_fecha'),
(13, 'rechequear'),
(7, 'registar_lote'),
(6, 'registrar_articulo'),
(14, 'registrar_cuenta_sistema'),
(2, 'registrar_empleado'),
(8, 'registrar_entrada_articulo'),
(11, 'registrar_fallas_pedido'),
(1, 'registrar_pedido'),
(15, 'registrar_ruta'),
(9, 'registrar_salida_articulo'),
(10, 'registrar_salida_excepcional_articulos'),
(16, 'visualizar_estadisticas'),
(19, 'visualizar_estadisticas_fallas_despachador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `role` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `role`) VALUES
(1, 'Super'),
(2, 'Supervisor de almacen'),
(3, 'Supervisor de inventario'),
(4, 'Rechequeador'),
(5, 'Inventario'),
(6, 'Entrega de pedidos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles_privilegios`
--

CREATE TABLE `roles_privilegios` (
  `id` int(11) NOT NULL,
  `id_role` int(11) NOT NULL,
  `id_privilegio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `roles_privilegios`
--

INSERT INTO `roles_privilegios` (`id`, `id_role`, `id_privilegio`) VALUES
(1, 3, 14),
(2, 3, 9),
(3, 3, 10),
(4, 3, 7),
(5, 3, 8),
(6, 3, 6),
(7, 5, 6),
(8, 5, 7),
(9, 5, 8),
(10, 5, 9),
(11, 6, 2),
(12, 6, 1),
(13, 6, 3),
(14, 6, 4),
(15, 6, 5),
(16, 4, 13),
(17, 4, 11),
(18, 4, 12),
(19, 2, 14),
(20, 2, 15),
(21, 2, 16),
(22, 2, 17),
(25, 2, 2),
(26, 2, 18),
(27, 2, 19),
(28, 1, 1),
(29, 1, 2),
(30, 1, 3),
(31, 1, 4),
(32, 1, 5),
(33, 1, 6),
(34, 1, 7),
(35, 1, 8),
(36, 1, 9),
(37, 1, 10),
(38, 1, 11),
(39, 1, 12),
(40, 1, 13),
(41, 1, 14),
(42, 1, 15),
(43, 1, 17),
(44, 1, 18),
(45, 1, 19),
(46, 1, 16),
(47, 2, 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rutas`
--

CREATE TABLE `rutas` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `rutas`
--

INSERT INTO `rutas` (`id`, `name`) VALUES
(1, 'Maturin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salida_excepcional_articulos`
--

CREATE TABLE `salida_excepcional_articulos` (
  `id` int(11) NOT NULL,
  `id_lote` int(11) NOT NULL,
  `fecha_salida` datetime NOT NULL,
  `cantidad` int(11) NOT NULL,
  `motivo` text NOT NULL,
  `id_accounts` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salida_existencia_lotes_productos`
--

CREATE TABLE `salida_existencia_lotes_productos` (
  `id` int(11) NOT NULL,
  `id_lote` int(11) NOT NULL,
  `fecha_salida` date NOT NULL,
  `cantidad` int(11) NOT NULL,
  `id_accounts` int(11) NOT NULL,
  `pasillero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id_account`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `id_empleado` (`id_empleado`),
  ADD KEY `role_id` (`role_id`);

--
-- Indices de la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`art`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cedula` (`cedula`);

--
-- Indices de la tabla `entrada_existencia_lotes_productos`
--
ALTER TABLE `entrada_existencia_lotes_productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_lote` (`id_lote`),
  ADD KEY `id_accounts` (`id_accounts`);

--
-- Indices de la tabla `fallas`
--
ALTER TABLE `fallas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `motivo` (`motivo`),
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_despachador` (`id_despachador`),
  ADD KEY `id_rechequeador` (`id_rechequeador`);

--
-- Indices de la tabla `lotes`
--
ALTER TABLE `lotes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `art` (`art`);

--
-- Indices de la tabla `mesa_rechequeadores`
--
ALTER TABLE `mesa_rechequeadores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `num_mesa` (`num_mesa`),
  ADD KEY `id_rechequeador` (`id_rechequeador`),
  ADD KEY `id_embalador` (`id_embalador`);

--
-- Indices de la tabla `motivo_fallas`
--
ALTER TABLE `motivo_fallas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedido`),
  ADD UNIQUE KEY `numero_pedido` (`numero_pedido`),
  ADD KEY `id_ruta` (`id_ruta`),
  ADD KEY `distribuidor_pedidos` (`distribuidor_pedidos`);

--
-- Indices de la tabla `pedidos_despachadores`
--
ALTER TABLE `pedidos_despachadores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_despachador` (`id_despachador`);

--
-- Indices de la tabla `pedidos_embaladores`
--
ALTER TABLE `pedidos_embaladores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_embalador` (`id_embalador`);

--
-- Indices de la tabla `pedidos_rechequeadores`
--
ALTER TABLE `pedidos_rechequeadores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_rechequeador` (`id_rechequeador`);

--
-- Indices de la tabla `privilegios`
--
ALTER TABLE `privilegios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accion` (`accion`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles_privilegios`
--
ALTER TABLE `roles_privilegios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_priveilegio` (`id_privilegio`),
  ADD KEY `id_role` (`id_role`);

--
-- Indices de la tabla `rutas`
--
ALTER TABLE `rutas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `salida_excepcional_articulos`
--
ALTER TABLE `salida_excepcional_articulos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_lote` (`id_lote`),
  ADD KEY `id_accounts` (`id_accounts`);

--
-- Indices de la tabla `salida_existencia_lotes_productos`
--
ALTER TABLE `salida_existencia_lotes_productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_lote` (`id_lote`),
  ADD KEY `id_accounts` (`id_accounts`),
  ADD KEY `pasillero` (`pasillero`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id_account` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `articulos`
--
ALTER TABLE `articulos`
  MODIFY `art` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123790;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `entrada_existencia_lotes_productos`
--
ALTER TABLE `entrada_existencia_lotes_productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fallas`
--
ALTER TABLE `fallas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `lotes`
--
ALTER TABLE `lotes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mesa_rechequeadores`
--
ALTER TABLE `mesa_rechequeadores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `motivo_fallas`
--
ALTER TABLE `motivo_fallas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_pedido` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `pedidos_despachadores`
--
ALTER TABLE `pedidos_despachadores`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidos_embaladores`
--
ALTER TABLE `pedidos_embaladores`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidos_rechequeadores`
--
ALTER TABLE `pedidos_rechequeadores`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `privilegios`
--
ALTER TABLE `privilegios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `roles_privilegios`
--
ALTER TABLE `roles_privilegios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT de la tabla `rutas`
--
ALTER TABLE `rutas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `salida_excepcional_articulos`
--
ALTER TABLE `salida_excepcional_articulos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `salida_existencia_lotes_productos`
--
ALTER TABLE `salida_existencia_lotes_productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id`),
  ADD CONSTRAINT `accounts_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `entrada_existencia_lotes_productos`
--
ALTER TABLE `entrada_existencia_lotes_productos`
  ADD CONSTRAINT `entrada_existencia_lotes_productos_ibfk_1` FOREIGN KEY (`id_accounts`) REFERENCES `accounts` (`id_account`),
  ADD CONSTRAINT `entrada_existencia_lotes_productos_ibfk_2` FOREIGN KEY (`id_lote`) REFERENCES `lotes` (`id`);

--
-- Filtros para la tabla `fallas`
--
ALTER TABLE `fallas`
  ADD CONSTRAINT `fallas_ibfk_1` FOREIGN KEY (`motivo`) REFERENCES `motivo_fallas` (`id`),
  ADD CONSTRAINT `fallas_ibfk_4` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`),
  ADD CONSTRAINT `fallas_ibfk_5` FOREIGN KEY (`id_despachador`) REFERENCES `empleados` (`id`),
  ADD CONSTRAINT `fallas_ibfk_6` FOREIGN KEY (`id_rechequeador`) REFERENCES `accounts` (`id_account`);

--
-- Filtros para la tabla `lotes`
--
ALTER TABLE `lotes`
  ADD CONSTRAINT `lotes_ibfk_1` FOREIGN KEY (`art`) REFERENCES `articulos` (`art`);

--
-- Filtros para la tabla `mesa_rechequeadores`
--
ALTER TABLE `mesa_rechequeadores`
  ADD CONSTRAINT `mesa_rechequeadores_ibfk_1` FOREIGN KEY (`id_embalador`) REFERENCES `empleados` (`id`),
  ADD CONSTRAINT `mesa_rechequeadores_ibfk_2` FOREIGN KEY (`id_rechequeador`) REFERENCES `accounts` (`id_account`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_ruta`) REFERENCES `rutas` (`id`),
  ADD CONSTRAINT `pedidos_ibfk_5` FOREIGN KEY (`distribuidor_pedidos`) REFERENCES `accounts` (`id_account`);

--
-- Filtros para la tabla `pedidos_despachadores`
--
ALTER TABLE `pedidos_despachadores`
  ADD CONSTRAINT `pedidos_despachadores_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`),
  ADD CONSTRAINT `pedidos_despachadores_ibfk_2` FOREIGN KEY (`id_despachador`) REFERENCES `empleados` (`id`);

--
-- Filtros para la tabla `pedidos_embaladores`
--
ALTER TABLE `pedidos_embaladores`
  ADD CONSTRAINT `pedidos_embaladores_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`),
  ADD CONSTRAINT `pedidos_embaladores_ibfk_2` FOREIGN KEY (`id_embalador`) REFERENCES `empleados` (`id`);

--
-- Filtros para la tabla `pedidos_rechequeadores`
--
ALTER TABLE `pedidos_rechequeadores`
  ADD CONSTRAINT `pedidos_rechequeadores_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`),
  ADD CONSTRAINT `pedidos_rechequeadores_ibfk_2` FOREIGN KEY (`id_rechequeador`) REFERENCES `accounts` (`id_account`);

--
-- Filtros para la tabla `roles_privilegios`
--
ALTER TABLE `roles_privilegios`
  ADD CONSTRAINT `roles_privilegios_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `roles_privilegios_ibfk_2` FOREIGN KEY (`id_privilegio`) REFERENCES `privilegios` (`id`);

--
-- Filtros para la tabla `salida_excepcional_articulos`
--
ALTER TABLE `salida_excepcional_articulos`
  ADD CONSTRAINT `salida_excepcional_articulos_ibfk_1` FOREIGN KEY (`id_lote`) REFERENCES `lotes` (`id`);

--
-- Filtros para la tabla `salida_existencia_lotes_productos`
--
ALTER TABLE `salida_existencia_lotes_productos`
  ADD CONSTRAINT `salida_existencia_lotes_productos_ibfk_1` FOREIGN KEY (`id_accounts`) REFERENCES `accounts` (`id_account`),
  ADD CONSTRAINT `salida_existencia_lotes_productos_ibfk_2` FOREIGN KEY (`id_lote`) REFERENCES `lotes` (`id`),
  ADD CONSTRAINT `salida_existencia_lotes_productos_ibfk_3` FOREIGN KEY (`pasillero`) REFERENCES `empleados` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
