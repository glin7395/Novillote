-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 02-12-2018 a las 22:57:55
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idcategoria`, `tipo_categoria`) VALUES
(1, 'carnes'),
(2, 'bebidas');

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
  `tipo_documento_cliente` int(11) NOT NULL,
  `genero_idgenero` int(11) NOT NULL,
  PRIMARY KEY (`idclientes`,`tipo_documento_cliente`,`genero_idgenero`),
  KEY `fk_clientes_tipodocumento1_idx` (`tipo_documento_cliente`),
  KEY `fk_clientes_genero1_idx` (`genero_idgenero`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idclientes`, `nombre_cliente`, `apellido_cliente`, `celular`, `email_cliente`, `contrasena_cliente`, `tipo_documento_cliente`, `genero_idgenero`) VALUES
(1, 'angie', 'palacios', '3202023354', '1236@gmail.com', '123456', 1, 1),
(2, 'El Cliente', 'crack', '314', 'dlcabezas2@gmail.com', 'ZaARdNrQ', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

DROP TABLE IF EXISTS `detalle_pedido`;
CREATE TABLE IF NOT EXISTS `detalle_pedido` (
  `iddetalle_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `pedidos_idpedidos` int(11) NOT NULL,
  `plato_idplato` int(11) NOT NULL,
  `cantidad_pedido` int(50) NOT NULL,
  `precio_pedido` float(10,3) NOT NULL,
  PRIMARY KEY (`iddetalle_pedido`,`pedidos_idpedidos`,`plato_idplato`),
  KEY `fk_detalle_pedido_pedidos1_idx` (`pedidos_idpedidos`),
  KEY `fk_detalle_pedido_plato1_idx` (`plato_idplato`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detalle_pedido`
--

INSERT INTO `detalle_pedido` (`iddetalle_pedido`, `pedidos_idpedidos`, `plato_idplato`, `cantidad_pedido`, `precio_pedido`) VALUES
(1, 1, 2, 1, 15.000),
(2, 2, 1, 1, 10.000),
(3, 2, 2, 1, 15.000),
(4, 3, 2, 1, 15.000),
(5, 4, 1, 10, 10.000),
(6, 5, 1, 1, 10.000),
(7, 6, 2, 1, 15.000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
CREATE TABLE IF NOT EXISTS `detalle_venta` (
  `iddetalle_venta` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad_venta` varchar(45) NOT NULL,
  `formadepago_idformadepago` int(11) NOT NULL,
  `venta_idventa` int(11) NOT NULL,
  `producto_idproducto` int(11) NOT NULL,
  PRIMARY KEY (`iddetalle_venta`),
  KEY `fk_detalle_venta_formadepago1_idx` (`formadepago_idformadepago`),
  KEY `fk_detalle_venta_venta1_idx` (`venta_idventa`),
  KEY `fk_detalle_venta_producto1_idx` (`producto_idproducto`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_venta`
--

INSERT INTO `detalle_venta` (`iddetalle_venta`, `cantidad_venta`, `formadepago_idformadepago`, `venta_idventa`, `producto_idproducto`) VALUES
(1, '10', 1, 1, 1),
(2, '2', 1, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

DROP TABLE IF EXISTS `estados`;
CREATE TABLE IF NOT EXISTS `estados` (
  `idestados` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_estado` varchar(45) NOT NULL,
  PRIMARY KEY (`idestados`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`idestados`, `nombre_estado`) VALUES
(1, 'En espera'),
(2, 'Aceptado'),
(3, 'Terminado');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `formadepago`
--

INSERT INTO `formadepago` (`idformadepago`, `tipo_de_pago`) VALUES
(1, 'efectivo'),
(2, 'cheque');

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
-- Estructura de tabla para la tabla `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE IF NOT EXISTS `pedidos` (
  `idpedidos` int(11) NOT NULL AUTO_INCREMENT,
  `clientes_idclientes` int(11) NOT NULL,
  `fecha_pedido` datetime NOT NULL,
  `total_pedido` float(10,3) NOT NULL,
  `estados_idestados` int(11) NOT NULL,
  PRIMARY KEY (`idpedidos`,`clientes_idclientes`,`estados_idestados`),
  KEY `fk_pedidos_clientes1_idx` (`clientes_idclientes`),
  KEY `fk_pedidos_estados1_idx` (`estados_idestados`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`idpedidos`, `clientes_idclientes`, `fecha_pedido`, `total_pedido`, `estados_idestados`) VALUES
(1, 1, '2018-12-02 19:11:36', 15.000, 1),
(2, 1, '2018-12-02 20:15:54', 25.000, 1),
(3, 1, '2018-12-02 21:29:35', 15.000, 1),
(4, 2, '2018-12-02 22:01:34', 100.000, 1),
(5, 1, '2018-12-02 22:06:19', 10.000, 1),
(6, 1, '2018-12-02 22:54:06', 15.000, 1);

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
  PRIMARY KEY (`idpersona`),
  KEY `fk_persona_genero2_idx` (`genero_idgenero`),
  KEY `fk_persona_fk_id_rol2_idx` (`fk_id_rol_idrol`),
  KEY `fk_persona_tipodocumento1_idx` (`tipodocumento_iddocumento`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`idpersona`, `nombre`, `apellido`, `telefono`, `direccion`, `email`, `numerodocumento`, `contrasena`, `genero_idgenero`, `fk_id_rol_idrol`, `tipodocumento_iddocumento`) VALUES
(1, 'andres ', 'chavez', '10', 'calle 20', 'afchavez99@misena.edu.co', 1023959599, '7395', 1, 1, 1),
(2, 'Hector', 'Vallejo', '3514789', 'cll 10 sur mini mordor', 'germangal1996@gmail.com', 1000, '1200', 1, 1, 1),
(3, 'El Admin', 'cabezas', '319', 'calle', 'dlcabezas2@gmail.com', 123, '123', 1, 1, 1),
(4, 'Angie ', 'Palacios ', '3202023354', 'calle 6', 'angie.stefania10@gmail.com', 1000802537, 'v5YULVU5', 2, 1, 1),
(5, 'david', 'diaz', '719565', 'dsadsadsa', 'davidesteban.1319@gmail.com', 789, '987', 1, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plato`
--

DROP TABLE IF EXISTS `plato`;
CREATE TABLE IF NOT EXISTS `plato` (
  `idplato` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_plato` varchar(45) NOT NULL,
  `descripcion_plato` varchar(45) NOT NULL,
  `imagen_plato` varchar(45) NOT NULL,
  `fecha_plato` datetime NOT NULL,
  `precio_plato` float(10,3) NOT NULL,
  `categoria_idcategoria` int(11) NOT NULL,
  PRIMARY KEY (`idplato`,`categoria_idcategoria`),
  KEY `fk_plato_categoria1_idx` (`categoria_idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `plato`
--

INSERT INTO `plato` (`idplato`, `nombre_plato`, `descripcion_plato`, `imagen_plato`, `fecha_plato`, `precio_plato`, `categoria_idcategoria`) VALUES
(1, 'Carne', 'con papas', '1.jpg', '2018-12-01 05:35:17', 10.000, 1),
(2, 'pollo', 'en salsa', '2.jpg', '2018-12-01 06:29:19', 15.000, 1);

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
  PRIMARY KEY (`idproducto`),
  KEY `fk_producto_categoria1_idx` (`categoria_idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idproducto`, `nombre_producto`, `precio_producto`, `categoria_idcategoria`) VALUES
(1, 'coca cola', '2000.00', 2),
(2, 'carne a la parrilla', '12000.00', 1);

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
  PRIMARY KEY (`idproveedor`),
  KEY `fk_proveedor_tipodocumento1_idx` (`tipodocumento_iddocumento`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`idproveedor`, `representante`, `empresa`, `contrasena_pro`, `numerodocumento_pro`, `tipodocumento_iddocumento`) VALUES
(1, 'rodrigo', 'cocacola', '1234', 5178946, 3),
(2, 'carlos ', 'pepsi', '852', 321456, 3),
(3, 'el proveedor', 'sena', '123', 123, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock`
--

DROP TABLE IF EXISTS `stock`;
CREATE TABLE IF NOT EXISTS `stock` (
  `idstock` int(11) NOT NULL AUTO_INCREMENT,
  `entrada` varchar(45) NOT NULL,
  `salida` varchar(45) NOT NULL,
  `cantidad` varchar(45) NOT NULL,
  `proveedor_idproveedor` int(11) NOT NULL,
  PRIMARY KEY (`idstock`),
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipodocumento`
--

INSERT INTO `tipodocumento` (`iddocumento`, `tipo_de_documento`) VALUES
(1, 'cedula de ciudadania'),
(2, 'tarjeta de identidad'),
(3, 'NIT');

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
  PRIMARY KEY (`idventa`),
  KEY `fk_venta_clientes1_idx` (`clientes_idclientes`),
  KEY `fk_venta_persona1_idx` (`persona_idpersona`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`idventa`, `fecha`, `clientes_idclientes`, `persona_idpersona`) VALUES
(1, '2018-10-31', 1, 1),
(2, '2018-10-31', 1, 2),
(3, '2018-11-13', 1, 1);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `fk_clientes_genero1` FOREIGN KEY (`genero_idgenero`) REFERENCES `genero` (`idgenero`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_clientes_tipodocumento1` FOREIGN KEY (`tipo_documento_cliente`) REFERENCES `tipodocumento` (`iddocumento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `fk_detalle_pedido_pedidos1` FOREIGN KEY (`pedidos_idpedidos`) REFERENCES `pedidos` (`idpedidos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalle_pedido_plato1` FOREIGN KEY (`plato_idplato`) REFERENCES `plato` (`idplato`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `fk_detalle_venta_formadepago1` FOREIGN KEY (`formadepago_idformadepago`) REFERENCES `formadepago` (`idformadepago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalle_venta_producto1` FOREIGN KEY (`producto_idproducto`) REFERENCES `producto` (`idproducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalle_venta_venta1` FOREIGN KEY (`venta_idventa`) REFERENCES `venta` (`idventa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `fk_pedidos_clientes1` FOREIGN KEY (`clientes_idclientes`) REFERENCES `clientes` (`idclientes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedidos_estados1` FOREIGN KEY (`estados_idestados`) REFERENCES `estados` (`idestados`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `fk_persona_fk_id_rol2` FOREIGN KEY (`fk_id_rol_idrol`) REFERENCES `fk_id_rol` (`idrol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_persona_genero2` FOREIGN KEY (`genero_idgenero`) REFERENCES `genero` (`idgenero`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_persona_tipodocumento1` FOREIGN KEY (`tipodocumento_iddocumento`) REFERENCES `tipodocumento` (`iddocumento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `plato`
--
ALTER TABLE `plato`
  ADD CONSTRAINT `fk_plato_categoria1` FOREIGN KEY (`categoria_idcategoria`) REFERENCES `categoria` (`idcategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
  ADD CONSTRAINT `fk_venta_persona1` FOREIGN KEY (`persona_idpersona`) REFERENCES `persona` (`idpersona`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
