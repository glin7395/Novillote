-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema novillo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema novillo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `novillo` DEFAULT CHARACTER SET utf8 ;
USE `novillo` ;

-- -----------------------------------------------------
-- Table `novillo`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `novillo`.`categoria` (
  `idcategoria` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `tipo_categoria` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`idcategoria`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `novillo`.`tipodocumento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `novillo`.`tipodocumento` (
  `iddocumento` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `tipo_de_documento` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`iddocumento`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `novillo`.`genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `novillo`.`genero` (
  `idgenero` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `tipo_de_genero` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`idgenero`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `novillo`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `novillo`.`clientes` (
  `idclientes` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `nombre_cliente` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL COMMENT '',
  `apellido_cliente` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL COMMENT '',
  `celular` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL COMMENT '',
  `email_cliente` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL COMMENT '',
  `contrasena_cliente` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL COMMENT '',
  `tipo_documento_cliente` INT(11) NOT NULL COMMENT '',
  `genero_idgenero` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`idclientes`, `tipo_documento_cliente`, `genero_idgenero`)  COMMENT '',
  INDEX `fk_clientes_tipodocumento1_idx` (`tipo_documento_cliente` ASC)  COMMENT '',
  INDEX `fk_clientes_genero1_idx` (`genero_idgenero` ASC)  COMMENT '',
  CONSTRAINT `fk_clientes_tipodocumento1`
    FOREIGN KEY (`tipo_documento_cliente`)
    REFERENCES `novillo`.`tipodocumento` (`iddocumento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_clientes_genero1`
    FOREIGN KEY (`genero_idgenero`)
    REFERENCES `novillo`.`genero` (`idgenero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `novillo`.`formadepago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `novillo`.`formadepago` (
  `idformadepago` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `tipo_de_pago` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`idformadepago`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `novillo`.`fk_id_rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `novillo`.`fk_id_rol` (
  `idrol` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `des_rol` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`idrol`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `novillo`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `novillo`.`persona` (
  `idpersona` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `nombre` VARCHAR(100) NOT NULL COMMENT '',
  `apellido` VARCHAR(100) NOT NULL COMMENT '',
  `telefono` VARCHAR(45) NOT NULL COMMENT '',
  `direccion` VARCHAR(100) NOT NULL COMMENT '',
  `email` VARCHAR(100) NOT NULL COMMENT '',
  `numerodocumento` INT(11) NOT NULL COMMENT '',
  `contrasena` VARCHAR(50) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL COMMENT '',
  `genero_idgenero` INT(11) NOT NULL COMMENT '',
  `fk_id_rol_idrol` INT(11) NOT NULL COMMENT '',
  `tipodocumento_iddocumento` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`idpersona`)  COMMENT '',
  INDEX `fk_persona_genero2_idx` (`genero_idgenero` ASC)  COMMENT '',
  INDEX `fk_persona_fk_id_rol2_idx` (`fk_id_rol_idrol` ASC)  COMMENT '',
  INDEX `fk_persona_tipodocumento1_idx` (`tipodocumento_iddocumento` ASC)  COMMENT '',
  CONSTRAINT `fk_persona_fk_id_rol2`
    FOREIGN KEY (`fk_id_rol_idrol`)
    REFERENCES `novillo`.`fk_id_rol` (`idrol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_persona_genero2`
    FOREIGN KEY (`genero_idgenero`)
    REFERENCES `novillo`.`genero` (`idgenero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_persona_tipodocumento1`
    FOREIGN KEY (`tipodocumento_iddocumento`)
    REFERENCES `novillo`.`tipodocumento` (`iddocumento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `novillo`.`venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `novillo`.`venta` (
  `idventa` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `fecha` DATE NOT NULL COMMENT '',
  `clientes_idclientes` INT(11) NOT NULL COMMENT '',
  `persona_idpersona` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`idventa`)  COMMENT '',
  INDEX `fk_venta_clientes1_idx` (`clientes_idclientes` ASC)  COMMENT '',
  INDEX `fk_venta_persona1_idx` (`persona_idpersona` ASC)  COMMENT '',
  CONSTRAINT `fk_venta_clientes1`
    FOREIGN KEY (`clientes_idclientes`)
    REFERENCES `novillo`.`clientes` (`idclientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venta_persona1`
    FOREIGN KEY (`persona_idpersona`)
    REFERENCES `novillo`.`persona` (`idpersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `novillo`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `novillo`.`producto` (
  `idproducto` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `nombre_producto` VARCHAR(45) NOT NULL COMMENT '',
  `precio_producto` DECIMAL(10,2) NOT NULL COMMENT '',
  `categoria_idcategoria` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`idproducto`)  COMMENT '',
  INDEX `fk_producto_categoria1_idx` (`categoria_idcategoria` ASC)  COMMENT '',
  CONSTRAINT `fk_producto_categoria1`
    FOREIGN KEY (`categoria_idcategoria`)
    REFERENCES `novillo`.`categoria` (`idcategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `novillo`.`detalle_venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `novillo`.`detalle_venta` (
  `iddetalle_venta` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `cantidad_venta` VARCHAR(45) NOT NULL COMMENT '',
  `formadepago_idformadepago` INT(11) NOT NULL COMMENT '',
  `venta_idventa` INT(11) NOT NULL COMMENT '',
  `producto_idproducto` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`iddetalle_venta`)  COMMENT '',
  INDEX `fk_detalle_venta_formadepago1_idx` (`formadepago_idformadepago` ASC)  COMMENT '',
  INDEX `fk_detalle_venta_venta1_idx` (`venta_idventa` ASC)  COMMENT '',
  INDEX `fk_detalle_venta_producto1_idx` (`producto_idproducto` ASC)  COMMENT '',
  CONSTRAINT `fk_detalle_venta_formadepago1`
    FOREIGN KEY (`formadepago_idformadepago`)
    REFERENCES `novillo`.`formadepago` (`idformadepago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_venta_venta1`
    FOREIGN KEY (`venta_idventa`)
    REFERENCES `novillo`.`venta` (`idventa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_venta_producto1`
    FOREIGN KEY (`producto_idproducto`)
    REFERENCES `novillo`.`producto` (`idproducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `novillo`.`proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `novillo`.`proveedor` (
  `idproveedor` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `representante` VARCHAR(45) NOT NULL COMMENT '',
  `empresa` VARCHAR(45) NOT NULL COMMENT '',
  `contrasena_pro` VARCHAR(45) NOT NULL COMMENT '',
  `numerodocumento_pro` INT(11) NOT NULL COMMENT '',
  `tipodocumento_iddocumento` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`idproveedor`)  COMMENT '',
  INDEX `fk_proveedor_tipodocumento1_idx` (`tipodocumento_iddocumento` ASC)  COMMENT '',
  CONSTRAINT `fk_proveedor_tipodocumento1`
    FOREIGN KEY (`tipodocumento_iddocumento`)
    REFERENCES `novillo`.`tipodocumento` (`iddocumento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `novillo`.`stock`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `novillo`.`stock` (
  `idstock` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `entrada` VARCHAR(45) NOT NULL COMMENT '',
  `salida` VARCHAR(45) NOT NULL COMMENT '',
  `cantidad` VARCHAR(45) NOT NULL COMMENT '',
  `proveedor_idproveedor` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`idstock`)  COMMENT '',
  INDEX `fk_Stock_proveedor1_idx` (`proveedor_idproveedor` ASC)  COMMENT '',
  CONSTRAINT `fk_Stock_proveedor1`
    FOREIGN KEY (`proveedor_idproveedor`)
    REFERENCES `novillo`.`proveedor` (`idproveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `novillo`.`plato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `novillo`.`plato` (
  `idplato` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `nombre_plato` VARCHAR(45) NOT NULL COMMENT '',
  `descripcion_plato` VARCHAR(45) NOT NULL COMMENT '',
  `imagen_plato` VARCHAR(45) NOT NULL COMMENT '',
  `fecha_plato` DATETIME NOT NULL COMMENT '',
  `precio_plato` FLOAT(10,3) NOT NULL COMMENT '',
  `categoria_idcategoria` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`idplato`, `categoria_idcategoria`)  COMMENT '',
  INDEX `fk_plato_categoria1_idx` (`categoria_idcategoria` ASC)  COMMENT '',
  CONSTRAINT `fk_plato_categoria1`
    FOREIGN KEY (`categoria_idcategoria`)
    REFERENCES `novillo`.`categoria` (`idcategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `novillo`.`estados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `novillo`.`estados` (
  `idestados` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `nombre_estado` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`idestados`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `novillo`.`pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `novillo`.`pedidos` (
  `idpedidos` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `clientes_idclientes` INT(11) NOT NULL COMMENT '',
  `fecha_pedido` DATETIME NOT NULL COMMENT '',
  `total_pedido` FLOAT(10,3) NOT NULL COMMENT '',
  `estados_idestados` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`idpedidos`, `clientes_idclientes`, `estados_idestados`)  COMMENT '',
  INDEX `fk_pedidos_clientes1_idx` (`clientes_idclientes` ASC)  COMMENT '',
  INDEX `fk_pedidos_estados1_idx` (`estados_idestados` ASC)  COMMENT '',
  CONSTRAINT `fk_pedidos_clientes1`
    FOREIGN KEY (`clientes_idclientes`)
    REFERENCES `novillo`.`clientes` (`idclientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedidos_estados1`
    FOREIGN KEY (`estados_idestados`)
    REFERENCES `novillo`.`estados` (`idestados`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `novillo`.`detalle_pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `novillo`.`detalle_pedido` (
  `iddetalle_pedido` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `pedidos_idpedidos` INT(11) NOT NULL COMMENT '',
  `plato_idplato` INT(11) NOT NULL COMMENT '',
  `cantidad_pedido` INT(50) NOT NULL COMMENT '',
  `precio_pedido` FLOAT(10,3) NOT NULL COMMENT '',
  PRIMARY KEY (`iddetalle_pedido`, `pedidos_idpedidos`, `plato_idplato`)  COMMENT '',
  INDEX `fk_detalle_pedido_pedidos1_idx` (`pedidos_idpedidos` ASC)  COMMENT '',
  INDEX `fk_detalle_pedido_plato1_idx` (`plato_idplato` ASC)  COMMENT '',
  CONSTRAINT `fk_detalle_pedido_pedidos1`
    FOREIGN KEY (`pedidos_idpedidos`)
    REFERENCES `novillo`.`pedidos` (`idpedidos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_pedido_plato1`
    FOREIGN KEY (`plato_idplato`)
    REFERENCES `novillo`.`plato` (`idplato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
