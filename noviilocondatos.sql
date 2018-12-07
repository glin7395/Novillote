-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 07-12-2018 a las 20:16:41
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

--
-- Volcado de datos para la tabla `plato`
--

INSERT INTO `plato` (`idplato`, `nombre_plato`, `descripcion_plato`, `imagen_plato`, `fecha_plato`, `precio_plato`, `categoria_idcategoria`) VALUES
(1, 'carne', 'con papas', '1.jpg', '2018-12-01 00:00:00', 10.000, 1),
(2, 'pollo', 'en salsa', '2.jpg', '2018-12-01 00:00:00', 15.000, 2),
(3, 'Arroz con pollo', 'arroz amarillo con pollo y salsa', '3.jpg', '2018-12-02 03:20:00', 10.000, 1),
(4, 'Mondongo', 'Sopa de mondongo casera', '4.jpg', '2018-12-03 01:00:00', 8.000, 5),
(5, 'Carne ', 'Carne a la plancha ', '5.jpg', '2018-12-04 00:00:00', 15.000, 1),
(6, 'Coca-Cola', 'Coca-Cola 2.5 ml', 'cocacola.jpg', '2018-12-06 00:00:00', 3.500, 4),
(7, 'Pepsi', 'Pepsi 2.5 ml', 'pepsi.jpg', '2018-12-06 00:00:00', 4.000, 4),
(8, 'Parrilla Novillo', 'Parilla con deversos cortes de carne y pollo', 'parillanov.jpg', '2018-12-07 14:00:00', 18.500, 3),
(9, 'Churrasco', 'churrasco especial de la casa', 'churrasco.jpg', '2018-12-07 15:00:00', 15.000, 6),
(10, 'Chuleta Valluna', 'Deliosa chuleta valluna', 'chuletavl.jpg', '2018-12-07 00:00:00', 20.000, 6),
(11, 'Papas Francesas', 'Adición de papas a la francesa', 'papasfra.jpg', '2018-12-07 20:00:00', 5.000, 7),
(12, 'Porcion de arroz', 'Adicion de arroz', 'parroz.jpg', '2018-12-07 00:00:00', 3.000, 7),
(13, 'Pechuga Gratinada', 'Pechuga con cobertura de queso gratinado', 'pechugas.jpg', '2018-12-07 00:00:00', 17.500, 2),
(14, 'Parrillada Mixta', 'Parrilla combinada con diferentes porciones ', 'parillamx.jpg', '2018-12-07 00:00:00', 25.000, 3),
(15, 'Ajiaco', 'Sopa de ajiaco Casera', 'ajiaco.jpg', '2018-12-07 22:00:00', 9.000, 5);

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`idproveedor`, `representante`, `empresa`, `contrasena_pro`, `numerodocumento_pro`, `tipodocumento_iddocumento`) VALUES
(1, 'Andres trujillo ramirez', 'El buen res', '1234', 1048792108, 1),
(2, 'Jeyson camilo lopez', 'Pechugas Reales', '4321', 1000785421, 3),
(3, 'Gabriel Posada', 'Postobon.sa', '1904', 445152548, 3),
(4, 'Andres david feo', 'Cerveza del pueblo', '2018', 108754219, 1),
(5, 'Cristian lopez', 'Frutas y verduras', '1989', 1025478962, 1);

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
