-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 24-10-2018 a las 19:21:49
-- Versión del servidor: 5.7.21
-- Versión de PHP: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `novillo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_categoria` varchar(45) NOT NULL,
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idcategoria`, `tipo_categoria`) VALUES
(7, 'carnes'),
(8, 'bebidas'),
(9, 'pescado'),
(10, 'granos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `idclientes` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_cliente` varchar(45) CHARACTER SET utf8 NOT NULL,
  `apellido_cliente` varchar(45) CHARACTER SET utf8 NOT NULL,
  `celular` varchar(45) CHARACTER SET utf8 NOT NULL,
  `email_cliente` varchar(45) CHARACTER SET utf8 NOT NULL,
  `contrasena_cliente` varchar(45) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`idclientes`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idclientes`, `nombre_cliente`, `apellido_cliente`, `celular`, `email_cliente`, `contrasena_cliente`) VALUES
(1, 'shirou', 'emiya', '3456', 'fate@hotmail.com', '9876'),
(2, 'nixon', 'pardo', '308759862', 'gardo@hoymail.rds', '4561'),
(3, 'angie', 'peralta', '789456', 'angie@hotmai.es', '1234');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
CREATE TABLE IF NOT EXISTS `detalle_venta` (
  `iddetalle_venta` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad_venta` varchar(45) NOT NULL,
  `formadepago_idformadepago` int(11) NOT NULL,
  `producto_idproducto` int(11) NOT NULL,
  `producto_categoria_idcategoria` int(11) NOT NULL,
  `venta_idventa` int(11) NOT NULL,
  PRIMARY KEY (`iddetalle_venta`,`formadepago_idformadepago`,`producto_idproducto`,`producto_categoria_idcategoria`,`venta_idventa`),
  KEY `fk_detalle_venta_formadepago1_idx` (`formadepago_idformadepago`),
  KEY `fk_detalle_venta_producto1_idx` (`producto_idproducto`,`producto_categoria_idcategoria`),
  KEY `fk_detalle_venta_venta1_idx` (`venta_idventa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fk_id_rol`
--

DROP TABLE IF EXISTS `fk_id_rol`;
CREATE TABLE IF NOT EXISTS `fk_id_rol` (
  `idrol` int(11) NOT NULL AUTO_INCREMENT,
  `des_rol` varchar(45) NOT NULL,
  PRIMARY KEY (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `fk_id_rol`
--

INSERT INTO `fk_id_rol` (`idrol`, `des_rol`) VALUES
(1, 'administrador'),
(2, 'usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formadepago`
--

DROP TABLE IF EXISTS `formadepago`;
CREATE TABLE IF NOT EXISTS `formadepago` (
  `idformadepago` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_de_pago` varchar(45) NOT NULL,
  PRIMARY KEY (`idformadepago`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `formadepago`
--

INSERT INTO `formadepago` (`idformadepago`, `tipo_de_pago`) VALUES
(3, 'efectivo'),
(4, 'tarjeta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

DROP TABLE IF EXISTS `genero`;
CREATE TABLE IF NOT EXISTS `genero` (
  `idgenero` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_de_genero` varchar(45) NOT NULL,
  PRIMARY KEY (`idgenero`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`idgenero`, `tipo_de_genero`) VALUES
(1, 'masculino'),
(2, 'femenino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

DROP TABLE IF EXISTS `persona`;
CREATE TABLE IF NOT EXISTS `persona` (
  `idpersona` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `numerodocumento` int(11) NOT NULL,
  `contrasena` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `genero_idgenero` int(11) NOT NULL,
  `fk_id_rol_idrol` int(11) NOT NULL,
  `tipodocumento_iddocumento` int(11) NOT NULL,
  PRIMARY KEY (`idpersona`,`genero_idgenero`,`fk_id_rol_idrol`,`tipodocumento_iddocumento`),
  KEY `fk_persona_genero2_idx` (`genero_idgenero`),
  KEY `fk_persona_fk_id_rol2_idx` (`fk_id_rol_idrol`),
  KEY `fk_persona_tipodocumento1_idx` (`tipodocumento_iddocumento`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`idpersona`, `nombre`, `apellido`, `telefono`, `direccion`, `email`, `numerodocumento`, `contrasena`, `genero_idgenero`, `fk_id_rol_idrol`, `tipodocumento_iddocumento`) VALUES
(8, 'andres felipe', 'chavez piñeros', '3103408895', 'cll 40 sur 49 -50', 'anfechapi@hotmail.es', 1023959599, '7395', 1, 1, 1),
(9, 'David', 'aaaaa', '123', 'dsadwcdcdf', 'yazocult@hotmail.com', 4862, '12345', 1, 1, 1),
(10, 'andres felipe', 'aaaaaaaa', '1264651263', 'David', 'juan-sarmiento@hotmail.com', 1012462411, '7531', 1, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE IF NOT EXISTS `producto` (
  `idproducto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_producto` varchar(45) NOT NULL,
  `precio_producto` decimal(10,2) NOT NULL,
  `categoria_idcategoria` int(11) NOT NULL,
  PRIMARY KEY (`idproducto`,`categoria_idcategoria`),
  KEY `fk_producto_categoria1_idx` (`categoria_idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idproducto`, `nombre_producto`, `precio_producto`, `categoria_idcategoria`) VALUES
(9, 'mojarra frita', '15000.00', 7),
(10, 'costillas', '12000.00', 7),
(11, 'arroz con carne', '10000.00', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
CREATE TABLE IF NOT EXISTS `proveedor` (
  `idproveedor` int(11) NOT NULL AUTO_INCREMENT,
  `representante` varchar(45) NOT NULL,
  `empresa` varchar(45) NOT NULL,
  `contrasena_pro` varchar(45) NOT NULL,
  `numerodocumento_pro` int(11) NOT NULL,
  `tipodocumento_iddocumento` int(11) NOT NULL,
  PRIMARY KEY (`idproveedor`,`tipodocumento_iddocumento`),
  KEY `fk_proveedor_tipodocumento1_idx` (`tipodocumento_iddocumento`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`idproveedor`, `representante`, `empresa`, `contrasena_pro`, `numerodocumento_pro`, `tipodocumento_iddocumento`) VALUES
(1, 'rodriguez', 'postobon', '1234', 1023, 1),
(2, 'cabezas', 'carnes', '4561', 10234, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock`
--

DROP TABLE IF EXISTS `stock`;
CREATE TABLE IF NOT EXISTS `stock` (
  `idstock` int(11) NOT NULL AUTO_INCREMENT,
  `entrada` varchar(45) DEFAULT NULL,
  `salida` varchar(45) DEFAULT NULL,
  `cantidad` varchar(45) NOT NULL,
  `proveedor_idproveedor` int(11) NOT NULL,
  PRIMARY KEY (`idstock`,`proveedor_idproveedor`),
  KEY `fk_Stock_proveedor1_idx` (`proveedor_idproveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodocumento`
--

DROP TABLE IF EXISTS `tipodocumento`;
CREATE TABLE IF NOT EXISTS `tipodocumento` (
  `iddocumento` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_de_documento` varchar(45) NOT NULL,
  PRIMARY KEY (`iddocumento`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipodocumento`
--

INSERT INTO `tipodocumento` (`iddocumento`, `tipo_de_documento`) VALUES
(1, 'cedula de ciudadania'),
(2, 'tarjeta de identidad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

DROP TABLE IF EXISTS `venta`;
CREATE TABLE IF NOT EXISTS `venta` (
  `idventa` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `clientes_idclientes` int(11) NOT NULL,
  `persona_idpersona` int(11) NOT NULL,
  `persona_genero_idgenero` int(11) NOT NULL,
  `persona_fk_id_rol_idrol` int(11) NOT NULL,
  `persona_tipodocumento_iddocumento` int(11) NOT NULL,
  PRIMARY KEY (`idventa`,`clientes_idclientes`,`persona_idpersona`,`persona_genero_idgenero`,`persona_fk_id_rol_idrol`,`persona_tipodocumento_iddocumento`),
  KEY `fk_venta_clientes1_idx` (`clientes_idclientes`),
  KEY `fk_venta_persona1_idx` (`persona_idpersona`,`persona_genero_idgenero`,`persona_fk_id_rol_idrol`,`persona_tipodocumento_iddocumento`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`idventa`, `fecha`, `clientes_idclientes`, `persona_idpersona`, `persona_genero_idgenero`, `persona_fk_id_rol_idrol`, `persona_tipodocumento_iddocumento`) VALUES
(11, '2018-10-31', 1, 9, 1, 1, 1),
(12, '2018-10-31', 1, 9, 1, 1, 1),
(13, '2018-10-26', 2, 8, 1, 1, 1);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `fk_detalle_venta_formadepago1` FOREIGN KEY (`formadepago_idformadepago`) REFERENCES `formadepago` (`idformadepago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalle_venta_producto1` FOREIGN KEY (`producto_idproducto`,`producto_categoria_idcategoria`) REFERENCES `producto` (`idproducto`, `categoria_idcategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalle_venta_venta1` FOREIGN KEY (`venta_idventa`) REFERENCES `venta` (`idventa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `fk_persona_fk_id_rol2` FOREIGN KEY (`fk_id_rol_idrol`) REFERENCES `fk_id_rol` (`idrol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_persona_genero2` FOREIGN KEY (`genero_idgenero`) REFERENCES `genero` (`idgenero`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_persona_tipodocumento1` FOREIGN KEY (`tipodocumento_iddocumento`) REFERENCES `tipodocumento` (`iddocumento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_producto_categoria1` FOREIGN KEY (`categoria_idcategoria`) REFERENCES `categoria` (`idcategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `fk_proveedor_tipodocumento1` FOREIGN KEY (`tipodocumento_iddocumento`) REFERENCES `tipodocumento` (`iddocumento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `fk_Stock_proveedor1` FOREIGN KEY (`proveedor_idproveedor`) REFERENCES `proveedor` (`idproveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `fk_venta_clientes1` FOREIGN KEY (`clientes_idclientes`) REFERENCES `clientes` (`idclientes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_venta_persona1` FOREIGN KEY (`persona_idpersona`,`persona_genero_idgenero`,`persona_fk_id_rol_idrol`,`persona_tipodocumento_iddocumento`) REFERENCES `persona` (`idpersona`, `genero_idgenero`, `fk_id_rol_idrol`, `tipodocumento_iddocumento`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
