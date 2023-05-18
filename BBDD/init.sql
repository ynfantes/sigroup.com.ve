-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 02-02-2023 a las 14:56:38
-- Versión del servidor: 5.7.40-cll-lve
-- Versión de PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE TABLE `sesion` (
  `id` int(11) NOT NULL,
  `cedula` int(11) NOT NULL,
  `inicio` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fin` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
--
-- Estructura de tabla para la tabla `accion`
--

CREATE TABLE `accion` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Truncar tablas antes de insertar `accion`
--

TRUNCATE TABLE `accion`;
--
-- Volcado de datos para la tabla `accion`
--

INSERT INTO `accion` (`id`, `descripcion`) VALUES
(1, 'Consulta Estado de Cuenta'),
(2, 'Consulta Aviso de Cobro'),
(3, 'Consulta Datos Personales'),
(4, 'Consulta Junta de Condominio'),
(5, 'Consulta Mensajes Recibidos'),
(6, 'Consulta Estado Cuenta Inmueble'),
(7, 'Cambio de Clave'),
(8, 'Inicio Registro Pago'),
(9, 'Completar Registro Pago'),
(10, 'Autorizar Prerecibo'),
(11, 'Ver Cartelera'),
(12, 'Ver Cancelación de Gastos'),
(13, 'Consultar Histórico de Operaciones'),
(14, 'Actualización Datos Personales'),
(15, 'Consulta Soportes de Facturación');

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `bitacora`
--

CREATE TABLE `bitacora` (
  `id_sesion` int(11) NOT NULL,
  `id_accion` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Estructura de tabla para la tabla `caja`
--

CREATE TABLE `caja` (
  `id` int(11) NOT NULL,
  `id_inmueble` int(11) NOT NULL,
  `id_apto` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja_forma_pago`
--

CREATE TABLE `caja_forma_pago` (
  `id` int(11) NOT NULL,
  `id_caja` int(11) NOT NULL,
  `forma_pago` varchar(13) NOT NULL,
  `banco` varchar(20) NOT NULL,
  `cuenta` varchar(20) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `monto` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Estructura de tabla para la tabla `caja_recibo`
--

CREATE TABLE `caja_recibo` (
  `id` int(11) NOT NULL,
  `id_caja` int(11) NOT NULL,
  `id_recibo` int(11) NOT NULL,
  `monto` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Estructura de tabla para la tabla `cargo_jc`
--

CREATE TABLE `cargo_jc` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Truncar tablas antes de insertar `cargo_jc`
--

TRUNCATE TABLE `cargo_jc`;
--
-- Volcado de datos para la tabla `cargo_jc`
--

INSERT INTO `cargo_jc` (`id`, `descripcion`) VALUES
(0, 'PRESIDENTE'),
(1, 'VICEPRESIDENTE'),
(2, 'TESORERO'),
(3, 'SECRETARIO'),
(4, 'VOCAL 1'),
(5, 'VOCAL 2'),
(6, 'VOCAL 3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cartelera`
--

CREATE TABLE `cartelera` (
  `id` int(11) NOT NULL,
  `id_inmueble` varchar(4) NOT NULL,
  `detalle` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Truncar tablas antes de insertar `cartelera`
--

TRUNCATE TABLE `cartelera`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudades`
--

CREATE TABLE `ciudades` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncar tablas antes de insertar `ciudades`
--

TRUNCATE TABLE `ciudades`;
--
-- Volcado de datos para la tabla `ciudades`
--

INSERT INTO `ciudades` (`id`, `descripcion`) VALUES
(1, 'Todas las ciudades'),
(2, 'Caracas'),
(3, 'Valencia'),
(4, 'Maracaibo'),
(5, 'Ciudad Guayana'),
(6, 'Maturin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cobranza_mensual`
--

CREATE TABLE `cobranza_mensual` (
  `id` int(11) NOT NULL,
  `id_inmueble` varchar(10) NOT NULL,
  `periodo` date NOT NULL,
  `monto` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturacion_mensual`
--

CREATE TABLE `facturacion_mensual` (
  `id` int(11) NOT NULL,
  `id_inmueble` varchar(10) NOT NULL,
  `periodo` date NOT NULL,
  `facturado` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `id` int(11) NOT NULL,
  `apto` varchar(50) NOT NULL,
  `id_inmueble` varchar(4) NOT NULL,
  `numero_factura` varchar(15) NOT NULL,
  `periodo` datetime DEFAULT NULL,
  `facturado` double DEFAULT NULL,
  `abonado` double DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `facturado_usd` double DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


CREATE TABLE `factura_detalle` (
  `id` int(11) NOT NULL,
  `id_factura` int(11) NOT NULL,
  `detalle` varchar(100) DEFAULT NULL,
  `codigo_gasto` varchar(50) NOT NULL,
  `comun` double DEFAULT NULL,
  `monto` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fondos`
--

CREATE TABLE `fondos` (
  `id` int(1) NOT NULL,
  `id_inmueble` varchar(4) NOT NULL,
  `codigo_gasto` varchar(6) NOT NULL,
  `descripcion` varchar(80) NOT NULL,
  `saldo` double NOT NULL DEFAULT '0',
  `mostrar` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fondos_movimiento`
--

CREATE TABLE `fondos_movimiento` (
  `id` int(11) NOT NULL,
  `id_fondo` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tipo` varchar(2) NOT NULL,
  `concepto` varchar(100) NOT NULL,
  `debe` double NOT NULL DEFAULT '0',
  `haber` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inmueble`
--

CREATE TABLE `inmueble` (
  `id` varchar(4) NOT NULL,
  `nombre_inmueble` varchar(100) DEFAULT NULL,
  `deuda` double DEFAULT NULL,
  `fondo_reserva` double DEFAULT NULL,
  `beneficiario` varchar(100) DEFAULT NULL,
  `banco` varchar(50) DEFAULT NULL,
  `numero_cuenta` varchar(50) DEFAULT NULL,
  `supervision` tinyint(1) DEFAULT '0',
  `RIF` varchar(12) DEFAULT NULL,
  `meses_mora` int(11) DEFAULT '0',
  `porc_mora` double DEFAULT '0',
  `moneda` varchar(4) DEFAULT 'Bs',
  `unidad` varchar(30) DEFAULT 'UNIDAD FAMILIAR',
  `facturacion_usd` tinyint(4) DEFAULT '0',
  `redondea_usd` tinyint(4) DEFAULT '0',
  `tasa_cambio` double DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Estructura de tabla para la tabla `inmueble_cuenta`
--

CREATE TABLE `inmueble_cuenta` (
  `id` int(11) NOT NULL,
  `id_inmueble` varchar(4) NOT NULL,
  `banco` varchar(60) NOT NULL,
  `numero_cuenta` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
--
-- Estructura de tabla para la tabla `inmueble_deuda_confidencial`
--

CREATE TABLE `inmueble_deuda_confidencial` (
  `id_inmueble` varchar(4) NOT NULL,
  `apto` varchar(6) NOT NULL,
  `propietario` varchar(60) NOT NULL,
  `recibos` int(11) NOT NULL,
  `deuda` double NOT NULL,
  `deuda_usd` double DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `junta_condominio`
--

CREATE TABLE `junta_condominio` (
  `id` int(11) NOT NULL,
  `id_cargo` int(11) NOT NULL,
  `id_inmueble` varchar(4) NOT NULL DEFAULT '1',
  `cedula` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
CREATE TABLE `mensajes` (
  `id` int(11) NOT NULL,
  `cedula` int(11) NOT NULL,
  `asunto` varchar(60) NOT NULL,
  `contenido` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `leido` tinyint(1) NOT NULL,
  `eliminado` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Estructura de tabla para la tabla `operaciones`
--

CREATE TABLE `operaciones` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tipo_pago` enum('d','t') NOT NULL,
  `numero_documento` varchar(50) NOT NULL,
  `fecha_documento` datetime NOT NULL,
  `monto` double NOT NULL,
  `banco_origen` varchar(50) DEFAULT NULL,
  `banco_destino` varchar(50) NOT NULL,
  `numero_cuenta` varchar(50) NOT NULL,
  `estatus` enum('p','a','r') NOT NULL,
  `email` varchar(50) NOT NULL,
  `enviado` tinyint(1) NOT NULL DEFAULT '0',
  `telefono` varchar(50) NOT NULL,
  `confirmacion` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago_detalle`
--

CREATE TABLE `pago_detalle` (
  `id` int(11) NOT NULL,
  `id_pago` int(11) NOT NULL,
  `id_factura` varchar(15) NOT NULL,
  `periodo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_inmueble` varchar(4) NOT NULL,
  `id_apto` varchar(10) NOT NULL,
  `monto` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prerecibo`
--

CREATE TABLE `prerecibo` (
  `id` int(11) NOT NULL,
  `id_inmueble` varchar(4) NOT NULL,
  `documento` varchar(100) NOT NULL,
  `aprobado` tinyint(1) NOT NULL DEFAULT '0',
  `periodo` date NOT NULL,
  `aprobado_por` varchar(60) DEFAULT NULL,
  `fecha_aprobado` date DEFAULT NULL,
  `notificacion` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `propiedades` (
  `id` int(11) NOT NULL,
  `cedula` int(11) NOT NULL,
  `id_inmueble` varchar(4) NOT NULL,
  `apto` varchar(6) NOT NULL,
  `alicuota` float DEFAULT NULL,
  `meses_pendiente` int(11) DEFAULT NULL,
  `deuda_total` float DEFAULT NULL,
  `deuda_usd` double DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propietarios`
--

CREATE TABLE `propietarios` (
  `id` int(11) NOT NULL,
  `cedula` int(11) NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 NOT NULL,
  `telefono1` varchar(50) NOT NULL,
  `telefono2` varchar(50) DEFAULT NULL,
  `telefono3` varchar(50) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `email_alternativo` varchar(60) DEFAULT NULL,
  `direccion` varchar(300) DEFAULT NULL,
  `clave` varchar(7) NOT NULL,
  `modificado` tinyint(1) NOT NULL DEFAULT '0',
  `cambio_clave` tinyint(1) NOT NULL DEFAULT '0',
  `validate` tinyint(1) NOT NULL DEFAULT '0',
  `recibos` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE `movimiento_caja` (
  `id` int(11) NOT NULL,
  `fecha_movimiento` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `numero_recibo` varchar(20) NOT NULL,
  `forma_pago` varchar(20) NOT NULL,
  `monto` double NOT NULL DEFAULT 0,
  `cuenta` varchar(50) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `id_inmueble` varchar(4) NOT NULL,
  `id_apto` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
--
-- Índices para tablas volcadas
--

ALTER TABLE `movimiento_caja`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `accion`
--
ALTER TABLE `accion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD KEY `cedula` (`id_sesion`),
  ADD KEY `id_accion` (`id_accion`);

--
-- Indices de la tabla `caja`
--
ALTER TABLE `caja`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `caja_forma_pago`
--
ALTER TABLE `caja_forma_pago`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `caja_recibo`
--
ALTER TABLE `caja_recibo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cargo_jc`
--
ALTER TABLE `cargo_jc`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cartelera`
--
ALTER TABLE `cartelera`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cobranza_mensual`
--
ALTER TABLE `cobranza_mensual`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `inmueble_periodo` (`id_inmueble`,`periodo`);

--
-- Indices de la tabla `facturacion_mensual`
--
ALTER TABLE `facturacion_mensual`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `inmueble_periodo` (`id_inmueble`,`periodo`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_inmueble` (`id_inmueble`),
  ADD KEY `apto` (`apto`);

--
-- Indices de la tabla `factura_detalle`
--
ALTER TABLE `factura_detalle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_factura` (`id_factura`);

--
-- Indices de la tabla `fondos`
--
ALTER TABLE `fondos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `condominio_cuenta` (`id_inmueble`,`codigo_gasto`);

--
-- Indices de la tabla `inmueble`
--
ALTER TABLE `inmueble`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre_inmueble` (`nombre_inmueble`);

--
-- Indices de la tabla `inmueble_cuenta`
--
ALTER TABLE `inmueble_cuenta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_inmueble` (`id_inmueble`,`banco`,`numero_cuenta`);

--
-- Indices de la tabla `inmueble_deuda_confidencial`
--
ALTER TABLE `inmueble_deuda_confidencial`
  ADD PRIMARY KEY (`id_inmueble`,`apto`);

--
-- Indices de la tabla `junta_condominio`
--
ALTER TABLE `junta_condominio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cargo` (`id_cargo`),
  ADD KEY `cedula` (`cedula`),
  ADD KEY `id_inmueble` (`id_inmueble`);

--
-- Indices de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pago_detalle`
--
ALTER TABLE `pago_detalle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_factura` (`id_factura`),
  ADD KEY `id_inmueble` (`id_inmueble`),
  ADD KEY `id_apto` (`id_apto`);

--
-- Indices de la tabla `prerecibo`
--
ALTER TABLE `prerecibo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `inmueble_periodo` (`id_inmueble`,`periodo`);

--
-- Indices de la tabla `propiedades`
--
ALTER TABLE `propiedades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `propietarios`
--
ALTER TABLE `propietarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sesion`
--
ALTER TABLE `sesion`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de la tabla `movimiento_caja`
--
ALTER TABLE `movimiento_caja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `accion`
--
ALTER TABLE `accion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `caja`
--
ALTER TABLE `caja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `caja_forma_pago`
--
ALTER TABLE `caja_forma_pago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `caja_recibo`
--
ALTER TABLE `caja_recibo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cargo_jc`
--
ALTER TABLE `cargo_jc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT de la tabla `cartelera`
--
ALTER TABLE `cartelera`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cobranza_mensual`
--
ALTER TABLE `cobranza_mensual`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `facturacion_mensual`
--
ALTER TABLE `facturacion_mensual`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `factura_detalle`
--
ALTER TABLE `factura_detalle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fondos`
--
ALTER TABLE `fondos`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inmueble_cuenta`
--
ALTER TABLE `inmueble_cuenta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `junta_condominio`
--
ALTER TABLE `junta_condominio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pago_detalle`
--
ALTER TABLE `pago_detalle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `prerecibo`
--
ALTER TABLE `prerecibo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `propiedades`
--
ALTER TABLE `propiedades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `propietarios`
--
ALTER TABLE `propietarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sesion`
--
ALTER TABLE `sesion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Base de datos: `administ_sigroup`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bancos`
--

CREATE TABLE `bancos` (
  `nombre` text DEFAULT NULL,
  `codigo` text DEFAULT NULL,
  `id` int(11) NOT NULL,
  `inactivo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `bancos`
--

INSERT INTO `bancos` (`nombre`, `codigo`, `id`, `inactivo`) VALUES
('Central de Venezuela', '0001', 1, 0),
('Industrial de Venezuela', '0003', 2, 0),
('Venezuela ', '0102', 3, 0),
('Venezolano de Crédito', '0104', 4, 0),
('Mercantil', '0105', 5, 0),
('Provincial', '0108', 6, 0),
('Bancaribe', '0114', 7, 0),
('Exterior', '0115', 8, 0),
('Occidental de Descuento', '0116', 9, 0),
('Caroní', '0128', 10, 0),
('Banesco', '0134', 11, 0),
('Sofitasa', '0137', 12, 0),
('Plaza', '0138', 13, 0),
('Gente Emprendedora', '0146', 14, 0),
('Pueblo Soberano', '0149', 15, 0),
('BFC Banco Fondo Común', '0151', 16, 0),
('100% Banco', '0156', 17, 0),
('DelSur', '0157', 18, 0),
('Tesoro', '0163', 19, 0),
('Agrícola de Venezuela', '0166', 20, 0),
('Bancrecer', '0168', 21, 0),
('Mi Banco', '0169', 22, 0),
('Activo', '0171', 23, 0),
('Bancamiga', '0172', 24, 0),
('Internacional de Desarrollo', '0173', 25, 0),
('Banplus', '0174', 26, 0),
('Bicentenario', '0175', 27, 0),
('Espirito Santo', '0176', 28, 0),
('Fuerza Armada Nacional Bolivariana', '0177', 29, 0),
('Citibank', '0190', 30, 0),
('BNC', '0191', 31, 0),
('Instituto Municipal de Crédito Popular', '0601', 32, 0),
('Portal de pagos Mercantil', '9999', 33, -1),
('Ally Bank', 'ZELLE', 34, 0),
('Bank of America', 'ZELLE', 35, 0),
('Capital One', 'ZELLE', 36, 0),
('Chase Bank', 'ZELLE', 37, 0),
('Citibank', 'ZELLE', 38, 0),
('Fifth Third Bank', 'ZELLE', 39, 0),
('FirstBank', 'ZELLE', 40, 0),
('PNC Bank', 'ZELLE', 41, 0),
('TD Bank', 'ZELLE', 42, 0),
('U.S. Bank', 'ZELLE', 43, 0),
('Wells Fargo', 'ZELLE', 44, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bancos`
--
ALTER TABLE `bancos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bancos`
--
ALTER TABLE `bancos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
COMMIT;
