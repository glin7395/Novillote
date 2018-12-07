-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 07-12-2018 a las 19:17:25
-- Versión del servidor: 5.7.21
-- Versión de PHP: 7.0.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `alumnos`
--
CREATE DATABASE IF NOT EXISTS `alumnos` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `alumnos`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso5b`
--

DROP TABLE IF EXISTS `curso5b`;
CREATE TABLE IF NOT EXISTS `curso5b` (
  `TI` int(11) NOT NULL,
  `Nombre Estudiante` varchar(50) NOT NULL,
  `Telefono` bigint(20) NOT NULL,
  `Direccion` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `curso5b`
--

INSERT INTO `curso5b` (`TI`, `Nombre Estudiante`, `Telefono`, `Direccion`) VALUES
(14415644, 'Manuel Gomez', 26542123, 'Cll 41 #50-20 este'),
(65419451, 'Amanda Rojas', 65416515, 'CRA 50 #50-17 '),
(62419451, 'Raul Castro', 32164612, 'AV 15 #1-66 este');
--
-- Base de datos: `base de datos`
--
CREATE DATABASE IF NOT EXISTS `base de datos` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `base de datos`;
--
-- Base de datos: `carritocompras`
--
CREATE DATABASE IF NOT EXISTS `carritocompras` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `carritocompras`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

DROP TABLE IF EXISTS `compras`;
CREATE TABLE IF NOT EXISTS `compras` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `numeroventa` text COLLATE utf8_spanish_ci NOT NULL,
  `nombre` text COLLATE utf8_spanish_ci NOT NULL,
  `imagen` text COLLATE utf8_spanish_ci NOT NULL,
  `precio` text COLLATE utf8_spanish_ci NOT NULL,
  `cantidad` text COLLATE utf8_spanish_ci NOT NULL,
  `subtotal` text COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` text COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish_ci NOT NULL,
  `imagen` text COLLATE utf8_spanish_ci NOT NULL,
  `precio` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `imagen`, `precio`) VALUES
(1, 'cebolla', 'esta es una cebolla', 'cebolla.jpg', 10.25),
(2, 'camara', 'esta es una camara', 'camara.jpg', 2200),
(3, 'computadora', 'esta es una computadora', 'computadora.jpg', 2100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` text COLLATE utf8_spanish_ci NOT NULL,
  `Apellido` text COLLATE utf8_spanish_ci NOT NULL,
  `Usuario` text COLLATE utf8_spanish_ci NOT NULL,
  `Password` text COLLATE utf8_spanish_ci NOT NULL,
  `Imagen` text COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`Id`, `Nombre`, `Apellido`, `Usuario`, `Password`, `Imagen`) VALUES
(1, 'Luis', 'Grijalva', 'luis', '123', 'imagen.jpg');
--
-- Base de datos: `neslrjb`
--
CREATE DATABASE IF NOT EXISTS `neslrjb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `neslrjb`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `idCategoria` int(11) NOT NULL,
  `Descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idCategoria`, `Descripcion`) VALUES
(1, 'DEPORTIVOS'),
(2, 'MUSICALES'),
(3, 'HOGAR'),
(4, 'TECNOLOGIA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `clienteDocumento` varchar(12) NOT NULL,
  `clienteNombre` varchar(45) NOT NULL,
  `clienteApellido` varchar(45) NOT NULL,
  `clienteDireccion` varchar(45) NOT NULL,
  `clienteTelefono` varchar(12) NOT NULL,
  PRIMARY KEY (`clienteDocumento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleventa`
--

DROP TABLE IF EXISTS `detalleventa`;
CREATE TABLE IF NOT EXISTS `detalleventa` (
  `idDetallVenta` int(11) NOT NULL AUTO_INCREMENT,
  `clientesDocumento` varchar(12) NOT NULL,
  `productosCodigo` varchar(45) NOT NULL,
  `fecha` date NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`idDetallVenta`),
  KEY `fk_Clientes_has_Productos_Productos1_idx` (`productosCodigo`),
  KEY `fk_Clientes_has_Productos_Clientes1_idx` (`clientesDocumento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrada`
--

DROP TABLE IF EXISTS `entrada`;
CREATE TABLE IF NOT EXISTS `entrada` (
  `idEntrada` int(11) NOT NULL AUTO_INCREMENT,
  `entradaProveedorNit` varchar(20) NOT NULL,
  `entradaProductoCodigo` varchar(45) NOT NULL,
  PRIMARY KEY (`idEntrada`),
  KEY `FKproveedoresProductoIdx` (`entradaProductoCodigo`),
  KEY `FKproveedorProductoIdx` (`entradaProveedorNit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE IF NOT EXISTS `producto` (
  `productoCodigo` varchar(45) NOT NULL,
  `productoIdCategoria` int(11) NOT NULL,
  `productoDescripcion` varchar(50) NOT NULL,
  `productoPrecio` double NOT NULL,
  `productoExistencia` int(11) NOT NULL,
  PRIMARY KEY (`productoCodigo`),
  KEY `fk_Productos_Categoria1_idx` (`productoIdCategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`productoCodigo`, `productoIdCategoria`, `productoDescripcion`, `productoPrecio`, `productoExistencia`) VALUES
('CARLOS', 2, 'PIANO', 20000000, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
CREATE TABLE IF NOT EXISTS `proveedor` (
  `nproveedorNit` varchar(20) NOT NULL,
  `proveedorNombre` varchar(45) NOT NULL,
  `proveedorApellido` varchar(45) NOT NULL,
  `proveedorDireccion` varchar(45) NOT NULL,
  `proveedorCiudad` varchar(45) NOT NULL,
  `proveedorTelefono` varchar(12) NOT NULL,
  PRIMARY KEY (`nproveedorNit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD CONSTRAINT `FKclienteProducto` FOREIGN KEY (`clientesDocumento`) REFERENCES `cliente` (`clienteDocumento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Clientes_has_Productos_Productos1` FOREIGN KEY (`productosCodigo`) REFERENCES `producto` (`productoCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `entrada`
--
ALTER TABLE `entrada`
  ADD CONSTRAINT `FKentradaProveedorProducto` FOREIGN KEY (`entradaProveedorNit`) REFERENCES `proveedor` (`nproveedorNit`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fkentradaProveedoreProducto` FOREIGN KEY (`entradaProductoCodigo`) REFERENCES `producto` (`productoCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_Productos_Categoria1` FOREIGN KEY (`productoIdCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION;
--
-- Base de datos: `novillo`
--
CREATE DATABASE IF NOT EXISTS `novillo` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `novillo`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `idcategoria` int(11) NOT NULL COMMENT 'identificacion de la categoria\r',
  `tipo_categoria` varchar(45) NOT NULL COMMENT 'tipo de categorias implementados ene el pedido',
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idcategoria`, `tipo_categoria`) VALUES
(1, 'Carne'),
(2, 'Pollo'),
(3, 'Parrilla'),
(4, 'Bebidas'),
(5, 'Sopas'),
(6, 'Platos especiales'),
(7, 'Adiciones');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `idclientes` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificacion para los clientes',
  `nombre_cliente` varchar(45) CHARACTER SET utf8 NOT NULL COMMENT 'nombre del cliente',
  `apellido_cliente` varchar(45) CHARACTER SET utf8 NOT NULL COMMENT 'apellido del cliente',
  `celular` varchar(45) CHARACTER SET utf8 NOT NULL COMMENT 'numero de contacto cliente',
  `email_cliente` varchar(45) CHARACTER SET utf8 NOT NULL COMMENT 'correo de contacto con el cliente',
  `contrasena_cliente` varchar(45) CHARACTER SET utf8 NOT NULL COMMENT 'clave de acceso al sistema',
  `genero_idgenero` int(11) NOT NULL COMMENT 'asiganar genero al cliente',
  PRIMARY KEY (`idclientes`),
  KEY `fk_clientes_genero1_idx` (`genero_idgenero`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idclientes`, `nombre_cliente`, `apellido_cliente`, `celular`, `email_cliente`, `contrasena_cliente`, `genero_idgenero`) VALUES
(1, 'Jaime ', 'Bustos', '3008951362', 'jaimeb@gmail.com', '9752', 1),
(2, 'Rafael', 'Noboa', '3008989451', 'aR2018@gmail.com', '4320', 1),
(3, 'Gabriela', 'Arias', '3218536497', 'gaby.083@hotmail.com', '1999', 2),
(4, 'Velentina ', 'Mendoza', '3178974552', 'valerimend@gmail.com', '2019', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

DROP TABLE IF EXISTS `detalle_pedido`;
CREATE TABLE IF NOT EXISTS `detalle_pedido` (
  `iddetalle_pedido` int(11) NOT NULL,
  `pedidos_idpedidos` int(11) NOT NULL COMMENT 'numero del pedido para actualizar estados ',
  `plato_idplato` int(11) NOT NULL COMMENT 'identificacion de los platos seleccionados',
  `cantidad_pedido` int(50) NOT NULL COMMENT 'cantidad del pedido en su total',
  `precio_pedido` float(10,3) NOT NULL COMMENT 'valor del los platos total suma ',
  PRIMARY KEY (`iddetalle_pedido`,`pedidos_idpedidos`,`plato_idplato`),
  KEY `fk_detalle_pedido_pedidos1_idx` (`pedidos_idpedidos`),
  KEY `fk_detalle_pedido_plato1_idx` (`plato_idplato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

DROP TABLE IF EXISTS `estado`;
CREATE TABLE IF NOT EXISTS `estado` (
  `idestado` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id unico estado',
  `descripcion_estado` varchar(50) NOT NULL COMMENT 'tpos de estado inactivo - activo',
  PRIMARY KEY (`idestado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`idestado`, `descripcion_estado`) VALUES
(1, 'Activo'),
(2, 'Inactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

DROP TABLE IF EXISTS `estados`;
CREATE TABLE IF NOT EXISTS `estados` (
  `idestados` int(11) NOT NULL COMMENT 'defereancia los estados del pedido\n',
  `nombre_estado` varchar(45) NOT NULL COMMENT 'en espera- aceptado - terminado',
  PRIMARY KEY (`idestados`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`idestados`, `nombre_estado`) VALUES
(1, 'En Espera'),
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
(1, 'Admin'),
(2, 'Usuario');

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
(1, 'Tarjeta de credito'),
(2, 'Efectivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

DROP TABLE IF EXISTS `genero`;
CREATE TABLE IF NOT EXISTS `genero` (
  `idgenero` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_de_genero` varchar(45) NOT NULL,
  PRIMARY KEY (`idgenero`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`idgenero`, `tipo_de_genero`) VALUES
(1, 'Masculino'),
(2, 'Femenino'),
(3, 'Indeterminado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE IF NOT EXISTS `pedidos` (
  `idpedidos` int(11) NOT NULL,
  `fecha_pedido` datetime NOT NULL,
  `total_pedido` float(10,3) NOT NULL,
  `estados_idestados` int(11) NOT NULL,
  `formadepago_idformadepago` int(11) NOT NULL,
  `clientes_idclientes` int(11) NOT NULL,
  PRIMARY KEY (`idpedidos`,`estados_idestados`),
  KEY `fk_pedidos_estados1_idx` (`estados_idestados`),
  KEY `fk_pedidos_formadepago1_idx` (`formadepago_idformadepago`),
  KEY `fk_pedidos_clientes1_idx` (`clientes_idclientes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

DROP TABLE IF EXISTS `persona`;
CREATE TABLE IF NOT EXISTS `persona` (
  `idpersona` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificacion de persona\r',
  `nombre` varchar(100) NOT NULL COMMENT 'nombres de la persona\r',
  `apellido` varchar(100) NOT NULL COMMENT 'apellido de la personas\r',
  `telefono` varchar(45) NOT NULL COMMENT 'telefono de la persona',
  `direccion` varchar(100) NOT NULL COMMENT 'direccion de la persona',
  `email` varchar(100) NOT NULL COMMENT 'contacto por cooreo electronico',
  `numerodocumento` int(11) NOT NULL COMMENT 'numero de identificacion del usuario o cliente',
  `contrasena` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'pasword para poder acceder al sistemas',
  `genero_idgenero` int(11) NOT NULL COMMENT 'identificacion tipo de genero',
  `estado_idestado` int(11) NOT NULL COMMENT 'identifica si el usuario se encuantra en estado de unactivo',
  `fk_id_rol_idrol` int(11) NOT NULL COMMENT 'identifica el tipo de relos que hay en la aplicasion ',
  `tipodocumento_iddocumento` int(11) NOT NULL COMMENT 'identificacion tipo de documento\r',
  PRIMARY KEY (`idpersona`),
  KEY `fk_persona_genero2_idx` (`genero_idgenero`),
  KEY `fk_persona_estado1_idx` (`estado_idestado`),
  KEY `fk_persona_fk_id_rol1_idx` (`fk_id_rol_idrol`),
  KEY `fk_persona_tipodocumento1_idx` (`tipodocumento_iddocumento`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`idpersona`, `nombre`, `apellido`, `telefono`, `direccion`, `email`, `numerodocumento`, `contrasena`, `genero_idgenero`, `estado_idestado`, `fk_id_rol_idrol`, `tipodocumento_iddocumento`) VALUES
(1, 'Carlos yulliann', 'Castro', '3005858704', 'carrera 100 a', 'cycastro@misena.edu.co', 1013692109, '1234', 1, 1, 1, 1),
(2, 'Andres felipe', 'Chavez', '3125495120', 'Av 30 sur #20-14 ', 'afchavez@misena.edu.co', 1023959599, '7395', 1, 1, 1, 1),
(3, 'Hector julio', 'Vallejo', '3004875257', 'Ave 1 de mayo 68', 'hjvallejo@misena.edu.co', 1089475365, '54321', 1, 1, 1, 1),
(4, 'Angie sthefania', 'Palacios', '3118975846', '20 de julio (el roto)', 'afpalacios@misena.edu.co', 1000802537, 'uAxr250w', 2, 1, 2, 1),
(5, 'Andres Camilo', 'Gabona', '3125924603', 'Bosa la estacion ', 'acamilo@misena.edu.co', 1011762403, '2018', 3, 1, 2, 1),
(6, 'Juan carlos', 'Zapata', '7540696', 'villas del rosario', 'jczapata@gmail.com', 170049786, '0324', 1, 1, 2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plato`
--

DROP TABLE IF EXISTS `plato`;
CREATE TABLE IF NOT EXISTS `plato` (
  `idplato` int(11) NOT NULL COMMENT 'identificacion del plato',
  `nombre_plato` varchar(45) NOT NULL COMMENT 'nombre del plato ',
  `descripcion_plato` varchar(45) NOT NULL COMMENT 'breve descripcion del plato',
  `imagen_plato` varchar(45) NOT NULL COMMENT 'imagen alisiba al plato',
  `fecha_plato` datetime NOT NULL,
  `precio_plato` float(10,3) NOT NULL COMMENT 'valor en COP del plato',
  `categoria_idcategoria` int(11) NOT NULL COMMENT 'adicion de categorias para la divicion de los diferentes tipos de plato',
  PRIMARY KEY (`idplato`,`categoria_idcategoria`),
  KEY `fk_plato_categoria1_idx` (`categoria_idcategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
CREATE TABLE IF NOT EXISTS `proveedor` (
  `idproveedor` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificacion para los proveedorres',
  `representante` varchar(45) NOT NULL COMMENT 'personal de contacto directo ',
  `empresa` varchar(45) NOT NULL COMMENT 'nombre de la empresa asociada',
  `contrasena_pro` varchar(45) NOT NULL COMMENT 'clave para solicitudes en aplicativo ',
  `numerodocumento_pro` int(11) NOT NULL COMMENT 'numero de documento para acceso',
  `tipodocumento_iddocumento` int(11) NOT NULL,
  PRIMARY KEY (`idproveedor`),
  KEY `fk_proveedor_tipodocumento1_idx` (`tipodocumento_iddocumento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock`
--

DROP TABLE IF EXISTS `stock`;
CREATE TABLE IF NOT EXISTS `stock` (
  `idstock` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificacion productos en inventario',
  `entrada` varchar(45) NOT NULL COMMENT 'pedidos salientes ',
  `salida` varchar(45) NOT NULL COMMENT 'registro de la venta i actualisacion del stock',
  `cantidad` varchar(45) NOT NULL COMMENT 'cantidad de platos o pedidos a registrar ',
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
  `iddocumento` int(11) NOT NULL AUTO_INCREMENT COMMENT 'tipos de docuemtos',
  `tipo_de_documento` varchar(45) NOT NULL COMMENT 'escoger el tipo de documento apropiado',
  PRIMARY KEY (`iddocumento`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipodocumento`
--

INSERT INTO `tipodocumento` (`iddocumento`, `tipo_de_documento`) VALUES
(1, 'Cedula de ciudadania'),
(2, 'Tarjeta de identidad'),
(3, 'NIT'),
(4, 'RUT'),
(5, 'Pasaporte');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `fk_clientes_genero1` FOREIGN KEY (`genero_idgenero`) REFERENCES `genero` (`idgenero`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `fk_detalle_pedido_pedidos1` FOREIGN KEY (`pedidos_idpedidos`) REFERENCES `pedidos` (`idpedidos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalle_pedido_plato1` FOREIGN KEY (`plato_idplato`) REFERENCES `plato` (`idplato`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `fk_pedidos_clientes1` FOREIGN KEY (`clientes_idclientes`) REFERENCES `clientes` (`idclientes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedidos_estados1` FOREIGN KEY (`estados_idestados`) REFERENCES `estados` (`idestados`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedidos_formadepago1` FOREIGN KEY (`formadepago_idformadepago`) REFERENCES `formadepago` (`idformadepago`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `fk_persona_estado1` FOREIGN KEY (`estado_idestado`) REFERENCES `estado` (`idestado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_persona_fk_id_rol1` FOREIGN KEY (`fk_id_rol_idrol`) REFERENCES `fk_id_rol` (`idrol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_persona_genero2` FOREIGN KEY (`genero_idgenero`) REFERENCES `genero` (`idgenero`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_persona_tipodocumento1` FOREIGN KEY (`tipodocumento_iddocumento`) REFERENCES `tipodocumento` (`iddocumento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `plato`
--
ALTER TABLE `plato`
  ADD CONSTRAINT `fk_plato_categoria1` FOREIGN KEY (`categoria_idcategoria`) REFERENCES `categoria` (`idcategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
-- Base de datos: `parqueadero`
--
CREATE DATABASE IF NOT EXISTS `parqueadero` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `parqueadero`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `cedula` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `telefono1` varchar(45) DEFAULT NULL,
  `telefono2` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`cedula`, `nombre`, `apellido`, `telefono1`, `telefono2`) VALUES
(10, 'asdf', 'asdf', 'asdf', 'sadf'),
(11, 'fgds', 'adfg', 'agd', 'asdg'),
(12, 'sadf', 'sadf', 'sadf', 'sadf'),
(52869421, 'Luisa', 'Castillo', '465132', '312978'),
(93180402, 'petra', 'calva', '123', '654'),
(93180405, 'nelson', 'castillo', '3115787813', '2211137'),
(465464646, 'sdaf', 'sdf', 'sdf', 'adsf');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `costo`
--

DROP TABLE IF EXISTS `costo`;
CREATE TABLE IF NOT EXISTS `costo` (
  `id` int(11) NOT NULL,
  `vehiculo` varchar(45) DEFAULT NULL,
  `pmin` int(11) DEFAULT NULL,
  `phoras` int(11) DEFAULT NULL,
  `pdias` int(11) DEFAULT NULL,
  `pmensual` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `costo`
--

INSERT INTO `costo` (`id`, `vehiculo`, `pmin`, `phoras`, `pdias`, `pmensual`) VALUES
(1, 'moto', 60, 3000, 15000, 260000),
(2, 'bicicleta', 30, 1500, 8000, 130000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cupos`
--

DROP TABLE IF EXISTS `cupos`;
CREATE TABLE IF NOT EXISTS `cupos` (
  `id` int(11) NOT NULL,
  `vehiculo` varchar(45) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cupos`
--

INSERT INTO `cupos` (`id`, `vehiculo`, `cantidad`) VALUES
(1, 'moto', 60),
(2, 'bicicleta', 60);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallefactura`
--

DROP TABLE IF EXISTS `detallefactura`;
CREATE TABLE IF NOT EXISTS `detallefactura` (
  `fechafactura` datetime DEFAULT NULL,
  `horaingreso` datetime DEFAULT NULL,
  `horasalida` datetime DEFAULT NULL,
  `duracion` time DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  `iva` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `factura_idFactura` int(11) NOT NULL,
  PRIMARY KEY (`factura_idFactura`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detallefactura`
--

INSERT INTO `detallefactura` (`fechafactura`, `horaingreso`, `horasalida`, `duracion`, `precio`, `iva`, `total`, `factura_idFactura`) VALUES
('2018-08-31 10:45:19', '2018-08-31 10:30:05', '2018-08-31 10:45:19', '00:15:14', 3000, 145, 762, 10),
('2018-08-31 10:48:17', '2018-08-31 10:39:14', '2018-08-31 10:48:17', '00:09:03', 1500, 43, 226, 11),
('2018-08-31 10:48:08', '2018-08-31 10:41:42', '2018-08-31 10:48:08', '00:06:26', 260000, 7, 38, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estacionamiento`
--

DROP TABLE IF EXISTS `estacionamiento`;
CREATE TABLE IF NOT EXISTS `estacionamiento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) DEFAULT NULL,
  `cupos_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`cupos_id`),
  KEY `fk_estacionamiento_cupos2` (`cupos_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estacionamiento`
--

INSERT INTO `estacionamiento` (`id`, `numero`, `cupos_id`) VALUES
(13, NULL, 1),
(14, NULL, 2),
(15, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

DROP TABLE IF EXISTS `factura`;
CREATE TABLE IF NOT EXISTS `factura` (
  `idFactura` int(11) NOT NULL AUTO_INCREMENT,
  `vehiculo_cliente_cedula` int(11) NOT NULL,
  `usuario_cedula` int(11) NOT NULL,
  `usuario_rol_idrol` int(11) NOT NULL,
  `costo_id` int(11) NOT NULL,
  `estacionamiento_id` int(11) NOT NULL,
  PRIMARY KEY (`idFactura`,`vehiculo_cliente_cedula`,`usuario_cedula`,`usuario_rol_idrol`,`costo_id`,`estacionamiento_id`),
  KEY `fk_factura_vehiculo1` (`vehiculo_cliente_cedula`),
  KEY `fk_factura_usuario1` (`usuario_cedula`,`usuario_rol_idrol`),
  KEY `fk_factura_costo2` (`costo_id`),
  KEY `fk_factura_estacionamiento2` (`estacionamiento_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`idFactura`, `vehiculo_cliente_cedula`, `usuario_cedula`, `usuario_rol_idrol`, `costo_id`, `estacionamiento_id`) VALUES
(10, 10, 2, 2, 1, 13),
(11, 11, 2, 2, 2, 14),
(12, 12, 2, 2, 1, 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

DROP TABLE IF EXISTS `rol`;
CREATE TABLE IF NOT EXISTS `rol` (
  `idrol` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idrol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idrol`, `descripcion`) VALUES
(1, 'administrador'),
(2, 'usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo`
--

DROP TABLE IF EXISTS `tipo`;
CREATE TABLE IF NOT EXISTS `tipo` (
  `idtipo` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `vehiculo_cliente_cedula` int(11) NOT NULL,
  PRIMARY KEY (`idtipo`,`vehiculo_cliente_cedula`),
  KEY `fk_tipo_vehiculo2` (`vehiculo_cliente_cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo`
--

INSERT INTO `tipo` (`idtipo`, `tipo`, `descripcion`, `vehiculo_cliente_cedula`) VALUES
(11, 'moto', 'sadf', 10),
(12, 'bicicleta', 'asdgdsa', 11),
(13, 'moto', 'asdfas', 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `cedula` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `contrasena` varchar(255) DEFAULT NULL,
  `rol_idrol` int(11) NOT NULL,
  PRIMARY KEY (`cedula`,`rol_idrol`),
  KEY `fk_usuario_rol2` (`rol_idrol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`cedula`, `nombre`, `apellido`, `contrasena`, `rol_idrol`) VALUES
(1, 'administrador', 'parqueadero', 'adcd7048512e64b48da55b027577886ee5a36350', 1),
(2, 'usuario', 'parqueadero', 'adcd7048512e64b48da55b027577886ee5a36350', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

DROP TABLE IF EXISTS `vehiculo`;
CREATE TABLE IF NOT EXISTS `vehiculo` (
  `matricula` varchar(45) DEFAULT NULL,
  `marca` varchar(45) DEFAULT NULL,
  `modelo` varchar(45) DEFAULT NULL,
  `cliente_cedula` int(11) NOT NULL,
  PRIMARY KEY (`cliente_cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `vehiculo`
--

INSERT INTO `vehiculo` (`matricula`, `marca`, `modelo`, `cliente_cedula`) VALUES
('sadf', 'asdf', 'sadf', 10),
('asdg', 'sadg', 'asdg', 11),
('sadf', 'sadf', 'sadf', 12);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vistaparqueados`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `vistaparqueados`;
CREATE TABLE IF NOT EXISTS `vistaparqueados` (
`id` int(11)
,`numero` int(11)
,`cantidad` int(11)
,`vehiculo` varchar(45)
,`idFactura` int(11)
,`vehiculo_cliente_cedula` int(11)
,`usuario_cedula` int(11)
,`usuario_rol_idrol` int(11)
,`costo_id` int(11)
,`estacionamiento_id` int(11)
,`matricula` varchar(45)
,`marca` varchar(45)
,`modelo` varchar(45)
,`cliente_cedula` int(11)
,`fechafactura` datetime
,`horaingreso` datetime
,`horasalida` datetime
,`duracion` time
,`precio` int(11)
,`iva` int(11)
,`total` int(11)
,`factura_idFactura` int(11)
,`cedula` int(11)
,`nombre` varchar(45)
,`apellido` varchar(45)
,`telefono1` varchar(45)
,`telefono2` varchar(45)
,`idtipo` int(11)
,`tipo` varchar(45)
,`descripcion` varchar(45)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vistaparqueados`
--
DROP TABLE IF EXISTS `vistaparqueados`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vistaparqueados`  AS  select `estacionamiento`.`id` AS `id`,`estacionamiento`.`numero` AS `numero`,`cupos`.`cantidad` AS `cantidad`,`cupos`.`vehiculo` AS `vehiculo`,`factura`.`idFactura` AS `idFactura`,`factura`.`vehiculo_cliente_cedula` AS `vehiculo_cliente_cedula`,`factura`.`usuario_cedula` AS `usuario_cedula`,`factura`.`usuario_rol_idrol` AS `usuario_rol_idrol`,`factura`.`costo_id` AS `costo_id`,`factura`.`estacionamiento_id` AS `estacionamiento_id`,`vehiculo`.`matricula` AS `matricula`,`vehiculo`.`marca` AS `marca`,`vehiculo`.`modelo` AS `modelo`,`vehiculo`.`cliente_cedula` AS `cliente_cedula`,`detallefactura`.`fechafactura` AS `fechafactura`,`detallefactura`.`horaingreso` AS `horaingreso`,`detallefactura`.`horasalida` AS `horasalida`,`detallefactura`.`duracion` AS `duracion`,`detallefactura`.`precio` AS `precio`,`detallefactura`.`iva` AS `iva`,`detallefactura`.`total` AS `total`,`detallefactura`.`factura_idFactura` AS `factura_idFactura`,`cliente`.`cedula` AS `cedula`,`cliente`.`nombre` AS `nombre`,`cliente`.`apellido` AS `apellido`,`cliente`.`telefono1` AS `telefono1`,`cliente`.`telefono2` AS `telefono2`,`tipo`.`idtipo` AS `idtipo`,`tipo`.`tipo` AS `tipo`,`tipo`.`descripcion` AS `descripcion` from ((((((`estacionamiento` join `factura` on((`estacionamiento`.`id` = `factura`.`estacionamiento_id`))) join `vehiculo` on((`factura`.`vehiculo_cliente_cedula` = `vehiculo`.`cliente_cedula`))) join `tipo` on((`vehiculo`.`cliente_cedula` = `tipo`.`vehiculo_cliente_cedula`))) join `detallefactura` on((`factura`.`idFactura` = `detallefactura`.`factura_idFactura`))) join `cliente` on((`vehiculo`.`cliente_cedula` = `cliente`.`cedula`))) join `cupos` on((`estacionamiento`.`cupos_id` = `cupos`.`id`))) ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detallefactura`
--
ALTER TABLE `detallefactura`
  ADD CONSTRAINT `fk_detallefactura_factura1` FOREIGN KEY (`factura_idFactura`) REFERENCES `factura` (`idFactura`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `estacionamiento`
--
ALTER TABLE `estacionamiento`
  ADD CONSTRAINT `fk_estacionamiento_cupos2` FOREIGN KEY (`cupos_id`) REFERENCES `cupos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `fk_factura_costo2` FOREIGN KEY (`costo_id`) REFERENCES `costo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_factura_estacionamiento2` FOREIGN KEY (`estacionamiento_id`) REFERENCES `estacionamiento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_factura_usuario1` FOREIGN KEY (`usuario_cedula`,`usuario_rol_idrol`) REFERENCES `usuario` (`cedula`, `rol_idrol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_factura_vehiculo1` FOREIGN KEY (`vehiculo_cliente_cedula`) REFERENCES `vehiculo` (`cliente_cedula`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tipo`
--
ALTER TABLE `tipo`
  ADD CONSTRAINT `fk_tipo_vehiculo2` FOREIGN KEY (`vehiculo_cliente_cedula`) REFERENCES `vehiculo` (`cliente_cedula`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_rol2` FOREIGN KEY (`rol_idrol`) REFERENCES `rol` (`idrol`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD CONSTRAINT `fk_vehiculo_cliente2` FOREIGN KEY (`cliente_cedula`) REFERENCES `cliente` (`cedula`) ON DELETE NO ACTION ON UPDATE NO ACTION;
--
-- Base de datos: `proyect`
--
CREATE DATABASE IF NOT EXISTS `proyect` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `proyect`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idcategoria`, `nombre`) VALUES
(1, 'Carne'),
(2, 'Pollo'),
(3, 'Vegetales'),
(4, 'Frutas'),
(5, 'Arroz');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) NOT NULL,
  `apellido` varchar(40) NOT NULL,
  `tipodocu` int(11) NOT NULL,
  `documento` varchar(20) NOT NULL,
  `genero` int(11) NOT NULL,
  `direccion` varchar(30) NOT NULL,
  `ciudad` varchar(20) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `tipodocu` (`tipodocu`),
  KEY `genero` (`genero`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`Id`, `nombre`, `apellido`, `tipodocu`, `documento`, `genero`, `direccion`, `ciudad`, `telefono`) VALUES
(1, 'camilo', 'gaona', 2, '1231231', 2, 'asdasd', 'dadsa', '12332'),
(2, 'david', 'cabezas', 2, '131516', 2, 'basdkmbn', 'jbdnasbd', '123546');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleventa`
--

DROP TABLE IF EXISTS `detalleventa`;
CREATE TABLE IF NOT EXISTS `detalleventa` (
  `iddetalleventa` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) NOT NULL,
  `total` decimal(10,0) NOT NULL,
  `didventa` int(11) NOT NULL,
  `didproducto` int(11) NOT NULL,
  PRIMARY KEY (`iddetalleventa`),
  KEY `didventa` (`didventa`),
  KEY `detalleventa_ibfk_2` (`didproducto`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detalleventa`
--

INSERT INTO `detalleventa` (`iddetalleventa`, `cantidad`, `total`, `didventa`, `didproducto`) VALUES
(1, 2, '2000', 9, 3),
(2, 3, '3000', 9, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_factura`
--

DROP TABLE IF EXISTS `detalle_factura`;
CREATE TABLE IF NOT EXISTS `detalle_factura` (
  `iddetalle_factura` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `didfactura` int(11) NOT NULL,
  `didunidadmedida` int(11) NOT NULL,
  `tidinsumos` int(11) NOT NULL,
  PRIMARY KEY (`iddetalle_factura`),
  KEY `didfactura` (`didfactura`),
  KEY `dunidadmedida` (`didunidadmedida`),
  KEY `detalle_factura_ibfk_3` (`tidinsumos`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detalle_factura`
--

INSERT INTO `detalle_factura` (`iddetalle_factura`, `cantidad`, `valor`, `total`, `didfactura`, `didunidadmedida`, `tidinsumos`) VALUES
(3, 52, '200.00', '1000.00', 1, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distribuidor`
--

DROP TABLE IF EXISTS `distribuidor`;
CREATE TABLE IF NOT EXISTS `distribuidor` (
  `iddistribuidor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `nit` varchar(45) NOT NULL,
  PRIMARY KEY (`iddistribuidor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `distribuidor`
--

INSERT INTO `distribuidor` (`iddistribuidor`, `nombre`, `telefono`, `direccion`, `nit`) VALUES
(3, 'dcdss', '464654', 'dssd', '48'),
(4, 'mans', '1234', 'calle n5', '1032'),
(5, 'adasdsa', '151551', '56adadasdas', '11616');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

DROP TABLE IF EXISTS `empleado`;
CREATE TABLE IF NOT EXISTS `empleado` (
  `idempleado` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `documento` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `didtipoempleado` int(11) NOT NULL,
  PRIMARY KEY (`idempleado`),
  KEY `didtipoempleado` (`didtipoempleado`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`idempleado`, `nombre`, `documento`, `direccion`, `telefono`, `email`, `didtipoempleado`) VALUES
(4, 'Camilo', '1012462411', 'caracas', '3213113', 'ca@msienasd', 5),
(5, 'Juan', '1212121', 'bosa', '31315131', 'cascass@oasdas', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

DROP TABLE IF EXISTS `factura`;
CREATE TABLE IF NOT EXISTS `factura` (
  `idfactura` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_factura` date NOT NULL,
  `numero_factura` varchar(45) NOT NULL,
  `tiddistribuidor` int(11) NOT NULL,
  PRIMARY KEY (`idfactura`),
  KEY `tiddistribuidor` (`tiddistribuidor`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`idfactura`, `fecha_factura`, `numero_factura`, `tiddistribuidor`) VALUES
(1, '2017-11-08', '0121', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gennero`
--

DROP TABLE IF EXISTS `gennero`;
CREATE TABLE IF NOT EXISTS `gennero` (
  `Idgen` int(11) NOT NULL AUTO_INCREMENT,
  `descgenn` varchar(45) NOT NULL,
  PRIMARY KEY (`Idgen`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `gennero`
--

INSERT INTO `gennero` (`Idgen`, `descgenn`) VALUES
(1, 'femenino'),
(2, 'masculino'),
(3, 'Indeterminado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insumos`
--

DROP TABLE IF EXISTS `insumos`;
CREATE TABLE IF NOT EXISTS `insumos` (
  `idinsumos` int(11) NOT NULL AUTO_INCREMENT,
  `insumo` varchar(45) NOT NULL,
  `cantidad_insumos` int(11) NOT NULL,
  `tidunidadmedida` int(11) NOT NULL,
  `cidcategoria` int(11) NOT NULL,
  PRIMARY KEY (`idinsumos`),
  KEY `idunidad_medida` (`tidunidadmedida`),
  KEY `cidcategoria` (`cidcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `insumos`
--

INSERT INTO `insumos` (`idinsumos`, `insumo`, `cantidad_insumos`, `tidunidadmedida`, `cidcategoria`) VALUES
(2, 'Arroz Blanco', 20, 1, 3),
(3, 'Pollo', 25, 1, 2),
(5, 'Carne', 40, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metododepago`
--

DROP TABLE IF EXISTS `metododepago`;
CREATE TABLE IF NOT EXISTS `metododepago` (
  `idmetododepago` int(11) NOT NULL AUTO_INCREMENT,
  `metododepago` varchar(35) NOT NULL,
  PRIMARY KEY (`idmetododepago`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `metododepago`
--

INSERT INTO `metododepago` (`idmetododepago`, `metododepago`) VALUES
(1, 'tarjeta'),
(2, 'efectivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE IF NOT EXISTS `producto` (
  `idproducto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `preciounitario` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`idproducto`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idproducto`, `nombre`, `preciounitario`, `cantidad`) VALUES
(1, 'Pollo Asado', 20000, 5),
(2, 'Pollo Broaster', 1500000, 20),
(3, 'Arroz con Polllo', 50000, 15),
(4, 'Carne a la Plancha', 150000, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productohasinsumos`
--

DROP TABLE IF EXISTS `productohasinsumos`;
CREATE TABLE IF NOT EXISTS `productohasinsumos` (
  `idproductohas` int(11) NOT NULL AUTO_INCREMENT,
  `phinsumos` int(11) NOT NULL,
  `phproducto` int(11) NOT NULL,
  PRIMARY KEY (`idproductohas`,`phinsumos`,`phproducto`),
  KEY `phinsumos` (`phinsumos`),
  KEY `phproducto` (`phproducto`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productohasinsumos`
--

INSERT INTO `productohasinsumos` (`idproductohas`, `phinsumos`, `phproducto`) VALUES
(1, 2, 1),
(2, 3, 1),
(4, 3, 1),
(5, 3, 4),
(6, 5, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodocumento`
--

DROP TABLE IF EXISTS `tipodocumento`;
CREATE TABLE IF NOT EXISTS `tipodocumento` (
  `idtd` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtd`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipodocumento`
--

INSERT INTO `tipodocumento` (`idtd`, `descripcion`) VALUES
(2, 'Tarjeta'),
(3, 'Cedula Ciudadana'),
(4, 'Cedula Extrajera'),
(5, 'Libreta Militar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoempleado`
--

DROP TABLE IF EXISTS `tipoempleado`;
CREATE TABLE IF NOT EXISTS `tipoempleado` (
  `idtipoempleado` int(11) NOT NULL AUTO_INCREMENT,
  `cargo` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipoempleado`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipoempleado`
--

INSERT INTO `tipoempleado` (`idtipoempleado`, `cargo`) VALUES
(2, 'mesero'),
(3, 'cocinero'),
(4, 'Vendedor'),
(5, 'Hornero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoventa`
--

DROP TABLE IF EXISTS `tipoventa`;
CREATE TABLE IF NOT EXISTS `tipoventa` (
  `idtipoventa` int(11) NOT NULL AUTO_INCREMENT,
  `tipoventa` varchar(35) NOT NULL,
  PRIMARY KEY (`idtipoventa`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipoventa`
--

INSERT INTO `tipoventa` (`idtipoventa`, `tipoventa`) VALUES
(1, 'presencial'),
(2, 'domiciliaria2'),
(3, 'sadasd');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad_medida`
--

DROP TABLE IF EXISTS `unidad_medida`;
CREATE TABLE IF NOT EXISTS `unidad_medida` (
  `idunidad_medida` int(11) NOT NULL AUTO_INCREMENT,
  `medida` varchar(20) NOT NULL,
  PRIMARY KEY (`idunidad_medida`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `unidad_medida`
--

INSERT INTO `unidad_medida` (`idunidad_medida`, `medida`) VALUES
(1, 'Libras');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

DROP TABLE IF EXISTS `venta`;
CREATE TABLE IF NOT EXISTS `venta` (
  `idventa` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `vcliente` int(11) NOT NULL,
  `vtipoempleado` int(11) NOT NULL,
  `vtipoventa` int(11) NOT NULL,
  PRIMARY KEY (`idventa`),
  KEY `vcliente` (`vcliente`),
  KEY `vtipoempleado` (`vtipoempleado`),
  KEY `vtipoventa` (`vtipoventa`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`idventa`, `fecha`, `vcliente`, `vtipoempleado`, `vtipoventa`) VALUES
(9, '2017-11-24 00:00:00', 1, 2, 2),
(10, '2017-11-24 17:22:33', 2, 5, 3);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`tipodocu`) REFERENCES `tipodocumento` (`idtd`),
  ADD CONSTRAINT `cliente_ibfk_2` FOREIGN KEY (`genero`) REFERENCES `gennero` (`Idgen`);

--
-- Filtros para la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD CONSTRAINT `detalleventa_ibfk_1` FOREIGN KEY (`didventa`) REFERENCES `venta` (`idventa`),
  ADD CONSTRAINT `detalleventa_ibfk_2` FOREIGN KEY (`didproducto`) REFERENCES `producto` (`idproducto`);

--
-- Filtros para la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  ADD CONSTRAINT `detalle_factura_ibfk_1` FOREIGN KEY (`didfactura`) REFERENCES `factura` (`idfactura`),
  ADD CONSTRAINT `detalle_factura_ibfk_2` FOREIGN KEY (`didunidadmedida`) REFERENCES `unidad_medida` (`idunidad_medida`),
  ADD CONSTRAINT `detalle_factura_ibfk_3` FOREIGN KEY (`tidinsumos`) REFERENCES `insumos` (`idinsumos`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`didtipoempleado`) REFERENCES `tipoempleado` (`idtipoempleado`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`tiddistribuidor`) REFERENCES `distribuidor` (`iddistribuidor`);

--
-- Filtros para la tabla `insumos`
--
ALTER TABLE `insumos`
  ADD CONSTRAINT `insumos_ibfk_1` FOREIGN KEY (`tidunidadmedida`) REFERENCES `unidad_medida` (`idunidad_medida`),
  ADD CONSTRAINT `insumos_ibfk_2` FOREIGN KEY (`cidcategoria`) REFERENCES `categoria` (`idcategoria`);

--
-- Filtros para la tabla `productohasinsumos`
--
ALTER TABLE `productohasinsumos`
  ADD CONSTRAINT `productohasinsumos_ibfk_1` FOREIGN KEY (`phinsumos`) REFERENCES `insumos` (`idinsumos`),
  ADD CONSTRAINT `productohasinsumos_ibfk_2` FOREIGN KEY (`phproducto`) REFERENCES `producto` (`idproducto`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`vcliente`) REFERENCES `cliente` (`Id`),
  ADD CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`vtipoempleado`) REFERENCES `tipoempleado` (`idtipoempleado`),
  ADD CONSTRAINT `venta_ibfk_3` FOREIGN KEY (`vtipoventa`) REFERENCES `tipoventa` (`idtipoventa`);
--
-- Base de datos: `restaurante`
--
CREATE DATABASE IF NOT EXISTS `restaurante` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `restaurante`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoriainsumo`
--

DROP TABLE IF EXISTS `categoriainsumo`;
CREATE TABLE IF NOT EXISTS `categoriainsumo` (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador unico',
  `descripcion` varchar(45) NOT NULL COMMENT 'nombre o descripcion de las categorias de los insumos',
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `idcliente` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador unico',
  `nombre` varchar(45) NOT NULL COMMENT 'nombre del cliente',
  `apellido` varchar(45) NOT NULL COMMENT 'apellido del cliente',
  `documento` varchar(45) NOT NULL COMMENT 'numero de documento del cliente',
  `direccion` varchar(45) NOT NULL COMMENT 'direccion de residencia del cliente',
  `email` varchar(45) NOT NULL COMMENT 'correo electronico del cliente',
  `telefono` varchar(45) NOT NULL COMMENT 'numero de telefono del cliente',
  `contrasena` varchar(45) NOT NULL COMMENT 'contraseña de la cuenta del cliente',
  `tipodocumento_idtipodocumento` int(11) NOT NULL,
  PRIMARY KEY (`idcliente`),
  KEY `fk_cliente_tipodocumento1_idx` (`tipodocumento_idtipodocumento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

DROP TABLE IF EXISTS `compras`;
CREATE TABLE IF NOT EXISTS `compras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numeroventa` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `imagen` text NOT NULL,
  `precio` varchar(50) NOT NULL,
  `cantidad` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id`, `numeroventa`, `nombre`, `imagen`, `precio`, `cantidad`, `subtotal`) VALUES
(1, 1, 'camara', 'camara.jpg', '3211321', '1', '3211321'),
(2, 1, 'camara', 'camara.jpg', '3211321', '1', '3211321'),
(3, 2, 'cebolla', 'cebolla.jpg', '12222', '3', '36666'),
(4, 3, 'camara', 'camara.jpg', '3211321', '1', '3211321'),
(5, 3, 'cebolla', 'cebolla.jpg', '12222', '1', '12222'),
(6, 4, 'cebolla', 'cebolla.jpg', '12222', '6', '73332'),
(7, 4, 'camara', 'camara.jpg', '3211321', '6', '19267926'),
(8, 5, 'cebolla', 'cebolla.jpg', '12222', '1', '12222'),
(9, 6, 'cebolla', 'cebolla.jpg', '12222', '1', '12222'),
(10, 7, 'cebolla', 'cebolla.jpg', '12222', '1', '12222');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_presencial`
--

DROP TABLE IF EXISTS `detalle_presencial`;
CREATE TABLE IF NOT EXISTS `detalle_presencial` (
  `iddetalle_presencial` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_venta` date NOT NULL,
  `forma_pago_idforma_pago` int(11) NOT NULL,
  `mesas_idmesas` int(11) NOT NULL,
  PRIMARY KEY (`iddetalle_presencial`),
  KEY `fk_detalle_presencial_forma_pago_idx` (`forma_pago_idforma_pago`),
  KEY `fk_detalle_presencial_mesas1_idx` (`mesas_idmesas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_presencial_has_plato`
--

DROP TABLE IF EXISTS `detalle_presencial_has_plato`;
CREATE TABLE IF NOT EXISTS `detalle_presencial_has_plato` (
  `detalle_presencial_iddetalle_presencial` int(11) NOT NULL,
  `plato_idPlato` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `total` double NOT NULL,
  PRIMARY KEY (`detalle_presencial_iddetalle_presencial`,`plato_idPlato`),
  KEY `fk_detalle_presencial_has_plato_plato1_idx` (`plato_idPlato`),
  KEY `fk_detalle_presencial_has_plato_detalle_presencial1_idx` (`detalle_presencial_iddetalle_presencial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

DROP TABLE IF EXISTS `empleados`;
CREATE TABLE IF NOT EXISTS `empleados` (
  `idempleados` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador unico',
  `nombre` varchar(45) NOT NULL COMMENT 'nombre del empleado',
  `apellido` varchar(45) NOT NULL COMMENT 'apellido del empleado',
  `documento` varchar(45) NOT NULL COMMENT 'numero de documento del empleado',
  `direccion` varchar(45) NOT NULL COMMENT 'direccion residencia del empleado',
  `email` varchar(45) NOT NULL COMMENT 'correo electronico del empleado',
  `telefono` varchar(45) NOT NULL COMMENT 'numero de telefono del empleado',
  `contrasena` varchar(45) NOT NULL COMMENT 'contraseña con la que el empleado ingresara el sistema',
  `tipodocumento_idtipodocumento` int(11) NOT NULL,
  `genero_idgenero` int(11) NOT NULL,
  `roles_idroles` int(11) NOT NULL,
  PRIMARY KEY (`idempleados`),
  KEY `fk_empleados_tipodocumento1_idx` (`tipodocumento_idtipodocumento`),
  KEY `fk_empleados_genero1_idx` (`genero_idgenero`),
  KEY `fk_empleados_roles1_idx` (`roles_idroles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `forma_pago`
--

DROP TABLE IF EXISTS `forma_pago`;
CREATE TABLE IF NOT EXISTS `forma_pago` (
  `idforma_pago` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador unico',
  `descripcion` varchar(45) NOT NULL COMMENT 'forma de pago',
  PRIMARY KEY (`idforma_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

DROP TABLE IF EXISTS `genero`;
CREATE TABLE IF NOT EXISTS `genero` (
  `idgenero` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador unico',
  `descripcion` varchar(45) NOT NULL COMMENT 'nombre o descripcion del genero',
  PRIMARY KEY (`idgenero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesas`
--

DROP TABLE IF EXISTS `mesas`;
CREATE TABLE IF NOT EXISTS `mesas` (
  `idmesas` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador unico',
  `mesa` varchar(45) NOT NULL COMMENT 'numero de la mesa',
  PRIMARY KEY (`idmesas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `observacion`
--

DROP TABLE IF EXISTS `observacion`;
CREATE TABLE IF NOT EXISTS `observacion` (
  `idobservacion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador unico',
  `comentario` varchar(45) NOT NULL COMMENT 'un breve comentario acerca del estado del insumo pedido',
  `cliente_idcliente` int(11) NOT NULL,
  PRIMARY KEY (`idobservacion`),
  KEY `fk_observacion_cliente1_idx` (`cliente_idcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_insumos`
--

DROP TABLE IF EXISTS `pedido_insumos`;
CREATE TABLE IF NOT EXISTS `pedido_insumos` (
  `idpedidoInsumos` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador unico',
  `cantidad` varchar(45) NOT NULL COMMENT 'cantidad de insumos a pedir',
  `unidad_medida` varchar(45) NOT NULL COMMENT 'unidad de medida del insumo',
  `descripcion` varchar(45) NOT NULL COMMENT 'breve descripcion',
  `proveedor_idproveedor` int(11) NOT NULL,
  `categoriainsumo_idcategoria` int(11) NOT NULL,
  `empleados_idempleados` int(11) NOT NULL,
  PRIMARY KEY (`idpedidoInsumos`),
  KEY `fk_pedido_insumos_proveedor1_idx` (`proveedor_idproveedor`),
  KEY `fk_pedido_insumos_categoriainsumo1_idx` (`categoriainsumo_idcategoria`),
  KEY `fk_pedido_insumos_empleados1_idx` (`empleados_idempleados`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plato`
--

DROP TABLE IF EXISTS `plato`;
CREATE TABLE IF NOT EXISTS `plato` (
  `idPlato` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador unico',
  `nombre` varchar(45) NOT NULL COMMENT 'nombre del plato',
  `descripcion` varchar(45) NOT NULL COMMENT 'breve descripcion del plato',
  `imagen` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `precio` varchar(45) NOT NULL COMMENT 'precio del plato',
  PRIMARY KEY (`idPlato`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `plato`
--

INSERT INTO `plato` (`idPlato`, `nombre`, `descripcion`, `imagen`, `precio`) VALUES
(1, 'cebolla', 'gfgfgfgfgd', 'cebolla.jpg', '12222'),
(2, 'camara', 'gfgfdgdffddg', 'camara.jpg', '3211321');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
CREATE TABLE IF NOT EXISTS `proveedor` (
  `idproveedor` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador unico',
  `nombre` varchar(45) NOT NULL COMMENT 'nombre del proveedor',
  `categoriainsumo_idcategoria` int(11) NOT NULL,
  PRIMARY KEY (`idproveedor`),
  KEY `fk_proveedor_categoriainsumo1_idx` (`categoriainsumo_idcategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `idroles` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador unico',
  `rol` varchar(45) NOT NULL COMMENT 'nombre del rol',
  PRIMARY KEY (`idroles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodocumento`
--

DROP TABLE IF EXISTS `tipodocumento`;
CREATE TABLE IF NOT EXISTS `tipodocumento` (
  `idtipodocumento` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador unico',
  `descripcion` varchar(45) NOT NULL COMMENT 'nombre o descripcion del tippo de documento',
  PRIMARY KEY (`idtipodocumento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `fk_cliente_tipodocumento1` FOREIGN KEY (`tipodocumento_idtipodocumento`) REFERENCES `tipodocumento` (`idtipodocumento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_presencial`
--
ALTER TABLE `detalle_presencial`
  ADD CONSTRAINT `fk_detalle_presencial_forma_pago` FOREIGN KEY (`forma_pago_idforma_pago`) REFERENCES `forma_pago` (`idforma_pago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalle_presencial_mesas1` FOREIGN KEY (`mesas_idmesas`) REFERENCES `mesas` (`idmesas`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_presencial_has_plato`
--
ALTER TABLE `detalle_presencial_has_plato`
  ADD CONSTRAINT `fk_detalle_presencial_has_plato_detalle_presencial1` FOREIGN KEY (`detalle_presencial_iddetalle_presencial`) REFERENCES `detalle_presencial` (`iddetalle_presencial`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalle_presencial_has_plato_plato1` FOREIGN KEY (`plato_idPlato`) REFERENCES `plato` (`idPlato`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `fk_empleados_genero1` FOREIGN KEY (`genero_idgenero`) REFERENCES `genero` (`idgenero`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_empleados_roles1` FOREIGN KEY (`roles_idroles`) REFERENCES `roles` (`idroles`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_empleados_tipodocumento1` FOREIGN KEY (`tipodocumento_idtipodocumento`) REFERENCES `tipodocumento` (`idtipodocumento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `observacion`
--
ALTER TABLE `observacion`
  ADD CONSTRAINT `fk_observacion_cliente1` FOREIGN KEY (`cliente_idcliente`) REFERENCES `cliente` (`idcliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pedido_insumos`
--
ALTER TABLE `pedido_insumos`
  ADD CONSTRAINT `fk_pedido_insumos_categoriainsumo1` FOREIGN KEY (`categoriainsumo_idcategoria`) REFERENCES `categoriainsumo` (`idcategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedido_insumos_empleados1` FOREIGN KEY (`empleados_idempleados`) REFERENCES `empleados` (`idempleados`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedido_insumos_proveedor1` FOREIGN KEY (`proveedor_idproveedor`) REFERENCES `proveedor` (`idproveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `fk_proveedor_categoriainsumo1` FOREIGN KEY (`categoriainsumo_idcategoria`) REFERENCES `categoriainsumo` (`idcategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION;
--
-- Base de datos: `seleccion`
--
CREATE DATABASE IF NOT EXISTS `seleccion` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `seleccion`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

DROP TABLE IF EXISTS `equipo`;
CREATE TABLE IF NOT EXISTS `equipo` (
  `idEquipo` int(10) NOT NULL AUTO_INCREMENT,
  `NombreEquipo` varchar(50) DEFAULT NULL,
  `CiudadEquipo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idEquipo`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `equipo`
--

INSERT INTO `equipo` (`idEquipo`, `NombreEquipo`, `CiudadEquipo`) VALUES
(1, 'Atletico Huila', 'Huila'),
(2, 'America', 'Valle'),
(3, 'Deportes Tolima', 'Tolima'),
(4, 'Millonarios', 'Cundinamarca'),
(5, 'Junior', 'Atlantico'),
(6, 'Jaguares', 'Cordoba');
--
-- Base de datos: `sics`
--
CREATE DATABASE IF NOT EXISTS `sics` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `sics`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedidos`
--

DROP TABLE IF EXISTS `detalle_pedidos`;
CREATE TABLE IF NOT EXISTS `detalle_pedidos` (
  `iddetalle_pedidos` int(11) NOT NULL AUTO_INCREMENT,
  `pedidos_idPedidos` int(11) NOT NULL,
  `platos_idPlatos` int(11) NOT NULL,
  `cantidad` int(5) NOT NULL,
  `Precio` float(10,3) NOT NULL,
  PRIMARY KEY (`iddetalle_pedidos`,`pedidos_idPedidos`,`platos_idPlatos`),
  KEY `fk_detalle_pedidos_pedidos1_idx` (`pedidos_idPedidos`),
  KEY `fk_detalle_pedidos_platos1_idx` (`platos_idPlatos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
CREATE TABLE IF NOT EXISTS `detalle_venta` (
  `iddetalle_venta` int(11) NOT NULL AUTO_INCREMENT,
  `ventas_idVenta` int(11) NOT NULL,
  `platos_idPlatos` int(11) NOT NULL,
  `Cantidad` varchar(45) NOT NULL,
  PRIMARY KEY (`iddetalle_venta`,`platos_idPlatos`,`ventas_idVenta`),
  KEY `fk_detalle_venta_platos1_idx` (`platos_idPlatos`),
  KEY `fk_detalle_venta_ventas1_idx` (`ventas_idVenta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

DROP TABLE IF EXISTS `estados`;
CREATE TABLE IF NOT EXISTS `estados` (
  `idestados` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_estado` varchar(45) NOT NULL,
  PRIMARY KEY (`idestados`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesa`
--

DROP TABLE IF EXISTS `mesa`;
CREATE TABLE IF NOT EXISTS `mesa` (
  `idMesa` int(11) NOT NULL AUTO_INCREMENT,
  `Numero_mesa` varchar(45) NOT NULL,
  PRIMARY KEY (`idMesa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE IF NOT EXISTS `pedidos` (
  `idPedidos` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_idUsuario` int(11) NOT NULL,
  `Fecha_Pedido` datetime NOT NULL,
  `Total` float(10,3) NOT NULL,
  `Estado_pedido` int(11) NOT NULL,
  PRIMARY KEY (`idPedidos`,`usuario_idUsuario`,`Estado_pedido`),
  KEY `fk_pedidos_usuario1_idx` (`usuario_idUsuario`),
  KEY `fk_pedidos_estados1_idx` (`Estado_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

DROP TABLE IF EXISTS `permisos`;
CREATE TABLE IF NOT EXISTS `permisos` (
  `idPermisos` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_idUsuario` int(11) NOT NULL,
  `rol_idRol` int(11) NOT NULL,
  PRIMARY KEY (`idPermisos`,`rol_idRol`,`usuario_idUsuario`),
  KEY `fk_rol_has_usuario_usuario1_idx` (`usuario_idUsuario`),
  KEY `fk_rol_has_usuario_rol1_idx` (`rol_idRol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `platos`
--

DROP TABLE IF EXISTS `platos`;
CREATE TABLE IF NOT EXISTS `platos` (
  `idPlatos` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_plato` varchar(45) NOT NULL,
  `Descripcion_plato` varchar(150) NOT NULL,
  `Precio_plato` float(10,3) NOT NULL,
  `Fecha_plato` datetime NOT NULL,
  `Imagen_plato` varchar(45) NOT NULL,
  `Tipo_Plato_idTipo_Plato` int(11) NOT NULL,
  `Estado_plato` int(11) NOT NULL,
  PRIMARY KEY (`idPlatos`,`Tipo_Plato_idTipo_Plato`,`Estado_plato`),
  KEY `fk_Platos_Tipo_Plato1_idx` (`Tipo_Plato_idTipo_Plato`),
  KEY `fk_platos_estados1_idx` (`Estado_plato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE IF NOT EXISTS `producto` (
  `idProducto` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_producto` varchar(45) NOT NULL,
  `Codigo_producto` varchar(45) NOT NULL,
  `Descripcion_producto` varchar(45) NOT NULL,
  `Cantidad_producto` varchar(45) NOT NULL,
  `Fecha_producto` timestamp NOT NULL,
  `Precio_producto` varchar(45) NOT NULL,
  `Estado_producto` int(11) NOT NULL,
  PRIMARY KEY (`idProducto`,`Estado_producto`),
  KEY `fk_producto_estados1_idx` (`Estado_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `requerimientos`
--

DROP TABLE IF EXISTS `requerimientos`;
CREATE TABLE IF NOT EXISTS `requerimientos` (
  `idrequerimientos` int(11) NOT NULL AUTO_INCREMENT,
  `Codigo_requerimiento` varchar(45) NOT NULL,
  `Descripcion_requerimiento` varchar(45) NOT NULL,
  `Fecha_requerimiento` varchar(45) NOT NULL,
  `producto_idProducto` int(11) NOT NULL,
  `usuario_idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idrequerimientos`,`producto_idProducto`,`usuario_idUsuario`),
  KEY `fk_requerimientos_producto1_idx` (`producto_idProducto`),
  KEY `fk_requerimientos_usuario1_idx` (`usuario_idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

DROP TABLE IF EXISTS `rol`;
CREATE TABLE IF NOT EXISTS `rol` (
  `idRol` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion_rol` varchar(45) NOT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--

DROP TABLE IF EXISTS `tipo_documento`;
CREATE TABLE IF NOT EXISTS `tipo_documento` (
  `idTipo_Documento` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion_documento` varchar(45) NOT NULL,
  PRIMARY KEY (`idTipo_Documento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_plato`
--

DROP TABLE IF EXISTS `tipo_plato`;
CREATE TABLE IF NOT EXISTS `tipo_plato` (
  `idTipo_Plato` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_tipo_plato` varchar(45) NOT NULL,
  PRIMARY KEY (`idTipo_Plato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_usuario` varchar(45) NOT NULL,
  `Apellido_usuario` varchar(45) NOT NULL,
  `Tipo_Documento` int(11) NOT NULL,
  `Documento_usuario` varchar(45) NOT NULL,
  `Telefono_usuario` varchar(45) NOT NULL,
  `Direccion_usuario` varchar(45) NOT NULL,
  `Contrasena` varchar(45) NOT NULL,
  `Correo_usuario` varchar(40) NOT NULL,
  `Fecha_registro_usuario` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Estado_usuario` int(11) NOT NULL,
  PRIMARY KEY (`idUsuario`,`Tipo_Documento`,`Estado_usuario`),
  KEY `fk_usuario_Tipo_Documento1_idx` (`Tipo_Documento`),
  KEY `fk_usuario_estados1_idx` (`Estado_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

DROP TABLE IF EXISTS `ventas`;
CREATE TABLE IF NOT EXISTS `ventas` (
  `idVenta` int(11) NOT NULL AUTO_INCREMENT,
  `Usuario_idUsuario` int(11) NOT NULL,
  `Total_Pagar` varchar(45) NOT NULL,
  `mesa_idMesa` int(11) NOT NULL,
  `Fecha_venta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idVenta`,`Usuario_idUsuario`,`mesa_idMesa`),
  KEY `fk_Ventas_Usuario1_idx` (`Usuario_idUsuario`),
  KEY `fk_ventas_mesa1_idx` (`mesa_idMesa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD CONSTRAINT `fk_detalle_pedidos_pedidos1` FOREIGN KEY (`pedidos_idPedidos`) REFERENCES `pedidos` (`idPedidos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalle_pedidos_platos1` FOREIGN KEY (`platos_idPlatos`) REFERENCES `platos` (`idPlatos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `fk_detalle_venta_platos1` FOREIGN KEY (`platos_idPlatos`) REFERENCES `platos` (`idPlatos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalle_venta_ventas1` FOREIGN KEY (`ventas_idVenta`) REFERENCES `ventas` (`idVenta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `fk_pedidos_estados1` FOREIGN KEY (`Estado_pedido`) REFERENCES `estados` (`idestados`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedidos_usuario1` FOREIGN KEY (`usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `fk_rol_has_usuario_rol1` FOREIGN KEY (`rol_idRol`) REFERENCES `rol` (`idRol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_rol_has_usuario_usuario1` FOREIGN KEY (`usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `platos`
--
ALTER TABLE `platos`
  ADD CONSTRAINT `fk_Platos_Tipo_Plato1` FOREIGN KEY (`Tipo_Plato_idTipo_Plato`) REFERENCES `tipo_plato` (`idTipo_Plato`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_platos_estados1` FOREIGN KEY (`Estado_plato`) REFERENCES `estados` (`idestados`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_producto_estados1` FOREIGN KEY (`Estado_producto`) REFERENCES `estados` (`idestados`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `requerimientos`
--
ALTER TABLE `requerimientos`
  ADD CONSTRAINT `fk_requerimientos_producto1` FOREIGN KEY (`producto_idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_requerimientos_usuario1` FOREIGN KEY (`usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_Tipo_Documento1` FOREIGN KEY (`Tipo_Documento`) REFERENCES `tipo_documento` (`idTipo_Documento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_estados1` FOREIGN KEY (`Estado_usuario`) REFERENCES `estados` (`idestados`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `fk_Ventas_Usuario1` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ventas_mesa1` FOREIGN KEY (`mesa_idMesa`) REFERENCES `mesa` (`idMesa`) ON DELETE NO ACTION ON UPDATE NO ACTION;
--
-- Base de datos: `sics_nuevo`
--
CREATE DATABASE IF NOT EXISTS `sics_nuevo` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `sics_nuevo`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedidos`
--

DROP TABLE IF EXISTS `detalle_pedidos`;
CREATE TABLE IF NOT EXISTS `detalle_pedidos` (
  `iddetalle_pedidos` int(11) NOT NULL AUTO_INCREMENT,
  `pedidos_idPedidos` int(11) NOT NULL,
  `platos_idPlatos` int(11) NOT NULL,
  `cantidad` int(5) NOT NULL,
  `Precio` float(10,3) NOT NULL,
  PRIMARY KEY (`iddetalle_pedidos`,`pedidos_idPedidos`,`platos_idPlatos`),
  KEY `fk_detalle_pedidos_pedidos1_idx` (`pedidos_idPedidos`),
  KEY `fk_detalle_pedidos_platos1_idx` (`platos_idPlatos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
CREATE TABLE IF NOT EXISTS `detalle_venta` (
  `iddetalle_venta` int(11) NOT NULL AUTO_INCREMENT,
  `ventas_idVenta` int(11) NOT NULL,
  `platos_idPlatos` int(11) NOT NULL,
  `Cantidad` varchar(45) NOT NULL,
  PRIMARY KEY (`iddetalle_venta`,`platos_idPlatos`,`ventas_idVenta`),
  KEY `fk_detalle_venta_platos1_idx` (`platos_idPlatos`),
  KEY `fk_detalle_venta_ventas1_idx` (`ventas_idVenta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

DROP TABLE IF EXISTS `estados`;
CREATE TABLE IF NOT EXISTS `estados` (
  `idestados` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_estado` varchar(45) NOT NULL,
  PRIMARY KEY (`idestados`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesa`
--

DROP TABLE IF EXISTS `mesa`;
CREATE TABLE IF NOT EXISTS `mesa` (
  `idMesa` int(11) NOT NULL AUTO_INCREMENT,
  `Numero_mesa` varchar(45) NOT NULL,
  PRIMARY KEY (`idMesa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE IF NOT EXISTS `pedidos` (
  `idPedidos` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_idUsuario` int(11) NOT NULL,
  `Fecha_Pedido` datetime NOT NULL,
  `Total` float(10,3) NOT NULL,
  `Estado_pedido` int(11) NOT NULL,
  PRIMARY KEY (`idPedidos`,`usuario_idUsuario`,`Estado_pedido`),
  KEY `fk_pedidos_usuario1_idx` (`usuario_idUsuario`),
  KEY `fk_pedidos_estados1_idx` (`Estado_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

DROP TABLE IF EXISTS `permisos`;
CREATE TABLE IF NOT EXISTS `permisos` (
  `idPermisos` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_idUsuario` int(11) NOT NULL,
  `rol_idRol` int(11) NOT NULL,
  PRIMARY KEY (`idPermisos`,`rol_idRol`,`usuario_idUsuario`),
  KEY `fk_rol_has_usuario_usuario1_idx` (`usuario_idUsuario`),
  KEY `fk_rol_has_usuario_rol1_idx` (`rol_idRol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `platos`
--

DROP TABLE IF EXISTS `platos`;
CREATE TABLE IF NOT EXISTS `platos` (
  `idPlatos` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_plato` varchar(45) NOT NULL,
  `Descripcion_plato` varchar(150) NOT NULL,
  `Precio_plato` float(10,3) NOT NULL,
  `Fecha_plato` datetime NOT NULL,
  `Imagen_plato` varchar(45) NOT NULL,
  `Tipo_Plato_idTipo_Plato` int(11) NOT NULL,
  `Estado_plato` int(11) NOT NULL,
  PRIMARY KEY (`idPlatos`,`Tipo_Plato_idTipo_Plato`,`Estado_plato`),
  KEY `fk_Platos_Tipo_Plato1_idx` (`Tipo_Plato_idTipo_Plato`),
  KEY `fk_platos_estados1_idx` (`Estado_plato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE IF NOT EXISTS `producto` (
  `idProducto` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_producto` varchar(45) NOT NULL,
  `Codigo_producto` varchar(45) NOT NULL,
  `Descripcion_producto` varchar(45) NOT NULL,
  `Cantidad_producto` varchar(45) NOT NULL,
  `Fecha_producto` timestamp NOT NULL,
  `Precio_producto` varchar(45) NOT NULL,
  `Estado_producto` int(11) NOT NULL,
  PRIMARY KEY (`idProducto`,`Estado_producto`),
  KEY `fk_producto_estados1_idx` (`Estado_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `requerimientos`
--

DROP TABLE IF EXISTS `requerimientos`;
CREATE TABLE IF NOT EXISTS `requerimientos` (
  `idrequerimientos` int(11) NOT NULL AUTO_INCREMENT,
  `Codigo_requerimiento` varchar(45) NOT NULL,
  `Descripcion_requerimiento` varchar(45) NOT NULL,
  `Fecha_requerimiento` varchar(45) NOT NULL,
  `producto_idProducto` int(11) NOT NULL,
  `usuario_idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idrequerimientos`,`producto_idProducto`,`usuario_idUsuario`),
  KEY `fk_requerimientos_producto1_idx` (`producto_idProducto`),
  KEY `fk_requerimientos_usuario1_idx` (`usuario_idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

DROP TABLE IF EXISTS `rol`;
CREATE TABLE IF NOT EXISTS `rol` (
  `idRol` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion_rol` varchar(45) NOT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--

DROP TABLE IF EXISTS `tipo_documento`;
CREATE TABLE IF NOT EXISTS `tipo_documento` (
  `idTipo_Documento` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion_documento` varchar(45) NOT NULL,
  PRIMARY KEY (`idTipo_Documento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_plato`
--

DROP TABLE IF EXISTS `tipo_plato`;
CREATE TABLE IF NOT EXISTS `tipo_plato` (
  `idTipo_Plato` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_tipo_plato` varchar(45) NOT NULL,
  PRIMARY KEY (`idTipo_Plato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_usuario` varchar(45) NOT NULL,
  `Apellido_usuario` varchar(45) NOT NULL,
  `Tipo_Documento` int(11) NOT NULL,
  `Documento_usuario` varchar(45) NOT NULL,
  `Telefono_usuario` varchar(45) NOT NULL,
  `Direccion_usuario` varchar(45) NOT NULL,
  `Contrasena` varchar(45) NOT NULL,
  `Correo_usuario` varchar(40) NOT NULL,
  `Fecha_registro_usuario` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Estado_usuario` int(11) NOT NULL,
  PRIMARY KEY (`idUsuario`,`Tipo_Documento`,`Estado_usuario`),
  KEY `fk_usuario_Tipo_Documento1_idx` (`Tipo_Documento`),
  KEY `fk_usuario_estados1_idx` (`Estado_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

DROP TABLE IF EXISTS `ventas`;
CREATE TABLE IF NOT EXISTS `ventas` (
  `idVenta` int(11) NOT NULL AUTO_INCREMENT,
  `Usuario_idUsuario` int(11) NOT NULL,
  `Total_Pagar` varchar(45) NOT NULL,
  `mesa_idMesa` int(11) NOT NULL,
  `Fecha_venta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idVenta`,`Usuario_idUsuario`,`mesa_idMesa`),
  KEY `fk_Ventas_Usuario1_idx` (`Usuario_idUsuario`),
  KEY `fk_ventas_mesa1_idx` (`mesa_idMesa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD CONSTRAINT `fk_detalle_pedidos_pedidos1` FOREIGN KEY (`pedidos_idPedidos`) REFERENCES `pedidos` (`idPedidos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalle_pedidos_platos1` FOREIGN KEY (`platos_idPlatos`) REFERENCES `platos` (`idPlatos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `fk_detalle_venta_platos1` FOREIGN KEY (`platos_idPlatos`) REFERENCES `platos` (`idPlatos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalle_venta_ventas1` FOREIGN KEY (`ventas_idVenta`) REFERENCES `ventas` (`idVenta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `fk_pedidos_estados1` FOREIGN KEY (`Estado_pedido`) REFERENCES `estados` (`idestados`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedidos_usuario1` FOREIGN KEY (`usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `fk_rol_has_usuario_rol1` FOREIGN KEY (`rol_idRol`) REFERENCES `rol` (`idRol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_rol_has_usuario_usuario1` FOREIGN KEY (`usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `platos`
--
ALTER TABLE `platos`
  ADD CONSTRAINT `fk_Platos_Tipo_Plato1` FOREIGN KEY (`Tipo_Plato_idTipo_Plato`) REFERENCES `tipo_plato` (`idTipo_Plato`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_platos_estados1` FOREIGN KEY (`Estado_plato`) REFERENCES `estados` (`idestados`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_producto_estados1` FOREIGN KEY (`Estado_producto`) REFERENCES `estados` (`idestados`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `requerimientos`
--
ALTER TABLE `requerimientos`
  ADD CONSTRAINT `fk_requerimientos_producto1` FOREIGN KEY (`producto_idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_requerimientos_usuario1` FOREIGN KEY (`usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_Tipo_Documento1` FOREIGN KEY (`Tipo_Documento`) REFERENCES `tipo_documento` (`idTipo_Documento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_estados1` FOREIGN KEY (`Estado_usuario`) REFERENCES `estados` (`idestados`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `fk_Ventas_Usuario1` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ventas_mesa1` FOREIGN KEY (`mesa_idMesa`) REFERENCES `mesa` (`idMesa`) ON DELETE NO ACTION ON UPDATE NO ACTION;
--
-- Base de datos: `sisconpark`
--
CREATE DATABASE IF NOT EXISTS `sisconpark` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `sisconpark`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

DROP TABLE IF EXISTS `administrador`;
CREATE TABLE IF NOT EXISTS `administrador` (
  `documento` int(30) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `telefono` int(20) NOT NULL,
  `contrasena` varchar(60) NOT NULL,
  PRIMARY KEY (`documento`)
) ENGINE=MyISAM AUTO_INCREMENT=123457 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`documento`, `nombre`, `correo`, `telefono`, `contrasena`) VALUES
(123, 'fer', 'fer@fer.comdfg', 45555, 'doc123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cobrados`
--

DROP TABLE IF EXISTS `cobrados`;
CREATE TABLE IF NOT EXISTS `cobrados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `documento` varchar(45) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `vehiculo` varchar(20) NOT NULL,
  `placa` varchar(10) NOT NULL,
  `horaingreso` varchar(45) DEFAULT NULL,
  `horasalida` varchar(45) DEFAULT NULL,
  `duracion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cobrados`
--

INSERT INTO `cobrados` (`id`, `documento`, `nombre`, `vehiculo`, `placa`, `horaingreso`, `horasalida`, `duracion`) VALUES
(1, '123456', 'sadf', 'Moto', 'asdfasd', '2018-09-15 11:34:46', '2018-09-15 11:36:01', '00:01:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `novedades`
--

DROP TABLE IF EXISTS `novedades`;
CREATE TABLE IF NOT EXISTS `novedades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `observacion` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `documento` int(30) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `vehiculo` varchar(20) NOT NULL,
  `placa` varchar(10) NOT NULL,
  `horaingreso` datetime DEFAULT NULL,
  `horasalida` datetime DEFAULT NULL,
  `duracion` time DEFAULT NULL,
  PRIMARY KEY (`documento`)
) ENGINE=MyISAM AUTO_INCREMENT=123457 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vigilante`
--

DROP TABLE IF EXISTS `vigilante`;
CREATE TABLE IF NOT EXISTS `vigilante` (
  `documento` int(30) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `telefono` int(20) NOT NULL,
  `contrasena` varchar(60) NOT NULL,
  PRIMARY KEY (`documento`)
) ENGINE=MyISAM AUTO_INCREMENT=1181157 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `vigilante`
--

INSERT INTO `vigilante` (`documento`, `nombre`, `correo`, `telefono`, `contrasena`) VALUES
(1, 'vigilantes', 'correo@correos', 12345, '1234');
--
-- Base de datos: `tbl_product`
--
CREATE DATABASE IF NOT EXISTS `tbl_product` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `tbl_product`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_product`
--

DROP TABLE IF EXISTS `tbl_product`;
CREATE TABLE IF NOT EXISTS `tbl_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` double(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_product`
--

INSERT INTO `tbl_product` (`id`, `name`, `image`, `price`) VALUES
(1, 'Samsung J2 Pro', '1.jpg', 100.00),
(2, 'HP Notebook', '2.jpg', 299.00),
(3, 'Panasonic T44 Lite', '3.jpg', 125.00);
--
-- Base de datos: `ti`
--
CREATE DATABASE IF NOT EXISTS `ti` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `ti`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cartegoria`
--

DROP TABLE IF EXISTS `cartegoria`;
CREATE TABLE IF NOT EXISTS `cartegoria` (
  `categoriaID` int(11) NOT NULL,
  `descripcion` varchar(30) NOT NULL,
  PRIMARY KEY (`categoriaID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `clienteID` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `direccion` varchar(20) NOT NULL,
  `telefono` int(11) NOT NULL,
  PRIMARY KEY (`clienteID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`clienteID`, `nombre`, `apellido`, `direccion`, `telefono`) VALUES
(1020775856, 'carlos', 'tamayo', '121674asd', 6717130);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oporveedor`
--

DROP TABLE IF EXISTS `oporveedor`;
CREATE TABLE IF NOT EXISTS `oporveedor` (
  `OrderID` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `productoID` int(11) NOT NULL,
  `proveedorID` int(11) NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `productoID` (`productoID`),
  KEY `proveedorID` (`proveedorID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `OrderID` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `productoID` int(11) NOT NULL,
  `clienteID` int(11) NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `productoID` (`productoID`),
  KEY `clienteID` (`clienteID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE IF NOT EXISTS `producto` (
  `ProductoID` int(11) NOT NULL,
  `categoriaID` int(11) NOT NULL,
  `descripcion` varchar(30) NOT NULL,
  `precio` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`ProductoID`),
  KEY `categoriaID` (`categoriaID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
CREATE TABLE IF NOT EXISTS `proveedor` (
  `proveedorID` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `direccion` varchar(20) NOT NULL,
  `ciudad` varchar(20) NOT NULL,
  `telefono` int(11) NOT NULL,
  PRIMARY KEY (`proveedorID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `oporveedor`
--
ALTER TABLE `oporveedor`
  ADD CONSTRAINT `oporveedor_ibfk_1` FOREIGN KEY (`productoID`) REFERENCES `producto` (`ProductoID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `oporveedor_ibfk_2` FOREIGN KEY (`proveedorID`) REFERENCES `proveedor` (`proveedorID`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`productoID`) REFERENCES `producto` (`ProductoID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`clienteID`) REFERENCES `cliente` (`clienteID`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`categoriaID`) REFERENCES `cartegoria` (`categoriaID`) ON UPDATE CASCADE;
--
-- Base de datos: `tiendainformatica`
--
CREATE DATABASE IF NOT EXISTS `tiendainformatica` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `tiendainformatica`;
--
-- Base de datos: `usuarios5`
--
CREATE DATABASE IF NOT EXISTS `usuarios5` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `usuarios5`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `Telefono` int(11) DEFAULT NULL,
  `Direccion` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=651401565 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID`, `nombre`, `Telefono`, `Direccion`) VALUES
(216214564, 'BENITO ROJAS', NULL, NULL),
(651401564, 'LINA GARCIA', NULL, NULL),
(156165431, 'RAUL DUQUE', NULL, NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
