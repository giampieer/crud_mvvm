-- phpMyAdmin SQL Dump
-- version 2.11.11.3
-- http://www.phpmyadmin.net
--
-- Host: 45.40.164.19
-- Generation Time: Jul 11, 2018 at 10:25 AM
-- Server version: 5.5.43
-- PHP Version: 5.1.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bdavansys`
--

-- --------------------------------------------------------

--
-- Table structure for table `Administrador`
--

CREATE TABLE `Administrador` (
  `idadmin` int(11) NOT NULL AUTO_INCREMENT,
  `nombres_apellidos` varchar(100) NOT NULL,
  `celular` varchar(9) NOT NULL,
  `password` int(11) DEFAULT NULL,
  `fecha_nacimiento` datetime DEFAULT NULL,
  `domicilio` varchar(100) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `estado` char(1) DEFAULT 'A' COMMENT 'A= ACTIVO | I = INACTIVO',
  `dni` char(8) DEFAULT NULL,
  `telefono_casa` char(7) DEFAULT NULL,
  PRIMARY KEY (`idadmin`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `Administrador`
--

INSERT INTO `Administrador` VALUES(1, 'Josue Durand', '944472569', 1234, '1996-08-24 00:00:00', 'Av. Alcazar cdra 4', 'josue@gmail.com', 'A', '74894179', NULL);
INSERT INTO `Administrador` VALUES(2, 'Allison Berrocal', '955572569', 1234, NULL, 'Av. Alcazar cdra 5', 'allison@gmail.com', 'A', '78451278', NULL);
INSERT INTO `Administrador` VALUES(3, 'Haydee Durand', '966672569', 1234, NULL, 'Av. Alcazar cdra 4', 'josue@gmail.com', 'A', '74894179', NULL);
INSERT INTO `Administrador` VALUES(4, 'Ximena Torres', '977772569', 1234, NULL, 'Av. Alcazar cdra 5', 'allison@gmail.com', 'A', '78451278', NULL);
INSERT INTO `Administrador` VALUES(5, 'Jorge Durand', '988872569', 1234, NULL, 'Av. Alcazar cdra 5', 'jorge@gmail.com', 'A', '75784512', NULL);
INSERT INTO `Administrador` VALUES(17, 'Andrea Durand', '922272569', 1234, NULL, NULL, 'andrea@avansys', 'A', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Anulacion_pago_realizados`
--

CREATE TABLE `Anulacion_pago_realizados` (
  `idanulacion` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cabecera_pedido_id_num_pedido` int(11) NOT NULL,
  `cabecera_pedido_cliente_idcliente` int(11) NOT NULL,
  `cabecera_pedido_vendedor_idvendedor` int(11) NOT NULL,
  `cabecera_pedido_tipo_pago_idtipo_pago` int(11) NOT NULL,
  `administrador_idvendedor` int(11) NOT NULL,
  PRIMARY KEY (`idanulacion`,`cabecera_pedido_id_num_pedido`,`cabecera_pedido_cliente_idcliente`,`cabecera_pedido_vendedor_idvendedor`,`cabecera_pedido_tipo_pago_idtipo_pago`,`administrador_idvendedor`),
  KEY `fk_anulacion_pago_realizados_cabecera_pedido1_idx` (`cabecera_pedido_id_num_pedido`,`cabecera_pedido_cliente_idcliente`,`cabecera_pedido_vendedor_idvendedor`,`cabecera_pedido_tipo_pago_idtipo_pago`),
  KEY `fk_anulacion_pago_realizados_administrador1_idx` (`administrador_idvendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Anulacion_pago_realizados`
--


-- --------------------------------------------------------

--
-- Table structure for table `Cabecera_pedido`
--

CREATE TABLE `Cabecera_pedido` (
  `id_num_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_pedido` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `imagen` varchar(45) NOT NULL,
  `fecha_recibir_pos` datetime NOT NULL,
  `fecha_recibir_efectivo` datetime DEFAULT NULL,
  `fecha_anulado` datetime DEFAULT NULL,
  `fecha_entrega_producto` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fecha_pago` datetime NOT NULL,
  `anulador` char(1) DEFAULT 'A' COMMENT 'A= ACTIVO | N = ANULADO',
  `cliente_idcliente` int(11) NOT NULL,
  `vendedor_idvendedor` int(11) NOT NULL DEFAULT '0',
  `tipo_pago_idtipo_pago` int(11) NOT NULL DEFAULT '0',
  `Estado_pedido_idestado_pedido` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_num_pedido`,`cliente_idcliente`,`vendedor_idvendedor`,`tipo_pago_idtipo_pago`,`Estado_pedido_idestado_pedido`),
  KEY `fk_cabecera_pedido_cliente_idx` (`cliente_idcliente`),
  KEY `fk_cabecera_pedido_vendedor1_idx` (`vendedor_idvendedor`),
  KEY `fk_cabecera_pedido_tipo_pago1_idx` (`tipo_pago_idtipo_pago`),
  KEY `fk_Cabecera_pedido_Estado_pedido1_idx` (`Estado_pedido_idestado_pedido`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=176 ;

--
-- Dumping data for table `Cabecera_pedido`
--


-- --------------------------------------------------------

--
-- Table structure for table `Carrito`
--

CREATE TABLE `Carrito` (
  `idcarrito` int(11) NOT NULL AUTO_INCREMENT,
  `nombreCarrito` varchar(100) NOT NULL,
  `stock` int(11) NOT NULL,
  `precio` float(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `cliente_idcliente` int(11) NOT NULL,
  `producto_idproducto` int(11) NOT NULL,
  PRIMARY KEY (`idcarrito`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=196 ;

--
-- Dumping data for table `Carrito`
--


-- --------------------------------------------------------

--
-- Table structure for table `Categoria`
--

CREATE TABLE `Categoria` (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombreCate` varchar(100) NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `estado` char(1) NOT NULL DEFAULT 'A' COMMENT 'A= ACTIVO | N = ANULADO',
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=67 ;

--
-- Dumping data for table `Categoria`
--

INSERT INTO `Categoria` VALUES(1, 'Bebidas', 'bebidas.jpg', 'A');
INSERT INTO `Categoria` VALUES(2, 'Galletas', 'gallejas.jpg', 'A');
INSERT INTO `Categoria` VALUES(3, 'Piqueos', 'piqueos.jpg', 'A');
INSERT INTO `Categoria` VALUES(4, 'Desayuno', 'desayuno.jpg', 'A');
INSERT INTO `Categoria` VALUES(5, 'Menu', 'menu.jpg', 'A');
INSERT INTO `Categoria` VALUES(6, 'Postres', 'postres.jpg', 'A');
INSERT INTO `Categoria` VALUES(7, 'Cena', 'cena.jpg', 'A');
INSERT INTO `Categoria` VALUES(8, 'FRUTAS', '28.jpg', 'A');
INSERT INTO `Categoria` VALUES(9, 'FRUTA 1', '29.jpg', 'A');


-- --------------------------------------------------------

--
-- Table structure for table `Cliente`
--

CREATE TABLE `Cliente` (
  `idcliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombres_apellidos` varchar(100) NOT NULL,
  `celular` varchar(9) NOT NULL,
  `password` int(11) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `domicilio` varchar(100) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `estado` char(1) DEFAULT 'A' COMMENT '1= ACTIVO | I 0 = INACTIVO',
  `dni` char(8) DEFAULT NULL,
  `telefono_casa` char(7) DEFAULT NULL,
  PRIMARY KEY (`idcliente`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `Cliente`
--

INSERT INTO `Cliente` VALUES(1, 'Haydee Pebe Villagaray', '955572569', 1234, '1996-08-24', 'Av. Alcazar cdra 4', 'josue@gmail.com', '0', '74894179', 'null');
INSERT INTO `Cliente` VALUES(2, 'Josue Durand Pebe', '967672569', 1234, '0000-00-00', 'Av. Alcazar cdra 5', 'allison@gmail.com', '0', '78451278', '4814305');
INSERT INTO `Cliente` VALUES(3, 'Elizabeth Durand', '944472569', 1234, '1996-08-24', 'Av. Alcazar cdra 4 ', 'josue.durand8@gmail.com', 'A', '74894179', '4814305');
INSERT INTO `Cliente` VALUES(4, 'Josue Durand Pebe', '967672569', 1234, '0000-00-00', 'Av. Alcazar cdra 5', 'allison@gmail.com', '0', '78451278', '4814305');
INSERT INTO `Cliente` VALUES(5, 'Jorge Durand', '947772569', 1234, '1996-08-24', 'Av. Alcazar cdra 4 ', 'josue.durand8@gmail.com', 'A', '74894179', '4814305');

-- --------------------------------------------------------

--
-- Table structure for table `Detalle_pedido`
--

CREATE TABLE `Detalle_pedido` (
  `iddetalle_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(6,2) NOT NULL,
  `subtotal` decimal(8,2) NOT NULL,
  `cabecera_pedido_id_num_pedido` int(11) NOT NULL,
  `cabecera_pedido_cliente_idcliente` int(11) NOT NULL,
  `cabecera_pedido_vendedor_idvendedor` int(11) NOT NULL DEFAULT '0',
  `cabecera_pedido_tipo_pago_idtipo_pago` int(11) NOT NULL DEFAULT '0',
  `producto_idproducto` int(11) NOT NULL,
  PRIMARY KEY (`iddetalle_pedido`,`cabecera_pedido_id_num_pedido`,`cabecera_pedido_cliente_idcliente`,`cabecera_pedido_vendedor_idvendedor`,`cabecera_pedido_tipo_pago_idtipo_pago`,`producto_idproducto`),
  KEY `fk_detalle_pedido_cabecera_pedido1_idx` (`cabecera_pedido_id_num_pedido`,`cabecera_pedido_cliente_idcliente`,`cabecera_pedido_vendedor_idvendedor`,`cabecera_pedido_tipo_pago_idtipo_pago`),
  KEY `fk_detalle_pedido_producto1_idx` (`producto_idproducto`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=212 ;

--
-- Dumping data for table `Detalle_pedido`
--


-- --------------------------------------------------------

--
-- Table structure for table `Estado_pedido`
--

CREATE TABLE `Estado_pedido` (
  `idestado_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`idestado_pedido`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `Estado_pedido`
--

INSERT INTO `Estado_pedido` VALUES(1, 'Pendiente');
INSERT INTO `Estado_pedido` VALUES(2, 'anulado');
INSERT INTO `Estado_pedido` VALUES(3, 'entregado');
INSERT INTO `Estado_pedido` VALUES(4, 'pagado');

-- --------------------------------------------------------

--
-- Table structure for table `frutas`
--

CREATE TABLE `frutas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foto` varchar(400) NOT NULL,
  `nombreIma` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `frutas`
--

INSERT INTO `frutas` VALUES(1, 'www.capacitasoft.com/site/Administrador/imagenes/0.png', 'ws');
INSERT INTO `frutas` VALUES(2, 'www.capacitasoft.com/site/Administrador/imagenes/1.png', 'aaaa');
INSERT INTO `frutas` VALUES(3, 'www.capacitasoft.com/site/Administrador/imagenes/2.png', '');
INSERT INTO `frutas` VALUES(4, 'www.capacitasoft.com/site/Administrador/imagenes/3.png', '');

-- --------------------------------------------------------

--
-- Table structure for table `Movimiento_stock`
--

CREATE TABLE `Movimiento_stock` (
  `idmovimiento_stock` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cantidad` decimal(8,2) NOT NULL,
  `observacion` varchar(100) DEFAULT NULL,
  `producto_idproducto` int(11) NOT NULL,
  `tipo_movimiento_idtipo_movimiento` int(11) NOT NULL,
  PRIMARY KEY (`idmovimiento_stock`,`producto_idproducto`,`tipo_movimiento_idtipo_movimiento`),
  KEY `fk_movimiento_stock_producto1_idx` (`producto_idproducto`),
  KEY `fk_movimiento_stock_tipo_movimiento1_idx` (`tipo_movimiento_idtipo_movimiento`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=104 ;

--
-- Dumping data for table `Movimiento_stock`
--

INSERT INTO `Movimiento_stock` VALUES(1, '2018-07-04 22:59:04', 60.00, 'aaa', 1, 3);
INSERT INTO `Movimiento_stock` VALUES(2, '2018-07-04 23:00:25', 60.00, '111', 1, 1);
INSERT INTO `Movimiento_stock` VALUES(3, '2018-07-04 23:00:35', 60.00, '111', 1, 3);
INSERT INTO `Movimiento_stock` VALUES(4, '2018-07-04 23:02:04', 60.00, '111', 1, 2);
INSERT INTO `Movimiento_stock` VALUES(5, '2018-07-04 23:02:16', 60.00, 'ssss', 2, 1);
INSERT INTO `Movimiento_stock` VALUES(6, '2018-07-04 23:02:25', 60.00, 'ssss', 2, 3);
INSERT INTO `Movimiento_stock` VALUES(7, '2018-07-06 18:15:56', 40.00, 'ss', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Notificacion`
--

CREATE TABLE `Notificacion` (
  `idNotificacion` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) NOT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `administrador_idvendedor` int(11) NOT NULL,
  PRIMARY KEY (`idNotificacion`,`administrador_idvendedor`),
  KEY `fk_Notificacion_administrador1_idx` (`administrador_idvendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Notificacion`
--


-- --------------------------------------------------------

--
-- Table structure for table `Producto`
--

CREATE TABLE `Producto` (
  `idproducto` int(11) NOT NULL AUTO_INCREMENT,
  `estado` char(1) CHARACTER SET utf8 NOT NULL DEFAULT 'A',
  `nombreProducto` varchar(100) NOT NULL,
  `imagen` varchar(500) NOT NULL,
  `stock` int(11) NOT NULL,
  `precio` float(10,2) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `stock_minimo` int(11) DEFAULT NULL,
  `categoria_idcategoria` int(11) NOT NULL,
  `SubCategoria_idcategoria` int(11) NOT NULL,
  PRIMARY KEY (`idproducto`,`categoria_idcategoria`,`SubCategoria_idcategoria`),
  KEY `fk_Producto_SubCategoria1_idx` (`SubCategoria_idcategoria`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `Producto`
--

INSERT INTO `Producto` VALUES(1, 'A', 'coca cola 500 ml', 'cocacola.jpg', 4876, 2.50, 'rica coca cola', 30, 1, 1);
INSERT INTO `Producto` VALUES(2, 'A', 'Inca Cola 500 ml', 'inkacola.jpg', 367, 2.50, 'ss', 40, 1, 1);
INSERT INTO `Producto` VALUES(3, 'A', 'Inca Cola 1 litro', 'inkacola.jpg', 476, 3.20, 'ss', 66, 1, 1);
INSERT INTO `Producto` VALUES(8, 'A', 'pera', 'peritafoto', -62, 5.00, 'frutitas', 20, 1, 1);
INSERT INTO `Producto` VALUES(10, 'a', 'naranja', '8.jpg', 110, 1.00, 'aa', 23, 1, 1);
INSERT INTO `Producto` VALUES(11, 'a', 'aa', '10.jpg', 222, 22.00, 'sa', 3, 40, 57);
INSERT INTO `Producto` VALUES(12, 'A', 'mandarina', '11.jpg', 10, 2.00, 'aaa', 20, 1, 1);
INSERT INTO `Producto` VALUES(13, '', 'aa', '12.jpg', -27, 23.00, 'qq', 23, 1, 48);

-- --------------------------------------------------------

--
-- Table structure for table `SubCategoria`
--

CREATE TABLE `SubCategoria` (
  `idsubcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `namesub` varchar(100) NOT NULL,
  `imagen` varchar(400) DEFAULT NULL,
  `estado` char(1) NOT NULL DEFAULT 'A' COMMENT 'A= ACTIVO | N = ANULADO',
  `Categoria_idcategoria` int(11) NOT NULL,
  PRIMARY KEY (`idsubcategoria`,`Categoria_idcategoria`),
  KEY `fk_SubCategoria_Categoria1_idx` (`Categoria_idcategoria`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=59 ;

--
-- Dumping data for table `SubCategoria`
--

INSERT INTO `SubCategoria` VALUES(1, 'GASEOSAS', 'gaseosa.jpg', 'A', 1);
INSERT INTO `SubCategoria` VALUES(2, 'AGUA MINERAL', 'aguamineral.jpg', 'A', 1);
INSERT INTO `SubCategoria` VALUES(3, 'FRUGOS', 'frugos.jpg', 'A', 1);
INSERT INTO `SubCategoria` VALUES(4, 'YOGURT', 'yogurt.jpg', 'A', 1);
INSERT INTO `SubCategoria` VALUES(6, 'AGUA ENERGIZANTE', 'energizante.jpg', 'A', 1);
INSERT INTO `SubCategoria` VALUES(7, 'REFRESCOS', 'refrescos.jpg', 'A', 1);
INSERT INTO `SubCategoria` VALUES(8, 'OREO', 'oreo.jpg', 'A', 2);
INSERT INTO `SubCategoria` VALUES(9, 'MOROCHA', 'morocha.jpg', 'A', 2);
INSERT INTO `SubCategoria` VALUES(10, 'RITZ', 'ritz.jpg', 'A', 2);
INSERT INTO `SubCategoria` VALUES(11, 'DORITOS', 'doritos.jpg', 'A', 3);
INSERT INTO `SubCategoria` VALUES(12, 'PAPAS LAYS', 'lays.jpg', 'A', 3);
INSERT INTO `SubCategoria` VALUES(13, 'CHEESE TRIS', 'chesetris.jpg', 'A', 3);
INSERT INTO `SubCategoria` VALUES(14, 'CUATES', 'cuates.jpg', 'A', 3);
INSERT INTO `SubCategoria` VALUES(15, 'PIQUEOS SNACK', 'piqueossnack.jpg', 'A', 3);
INSERT INTO `SubCategoria` VALUES(16, 'BEBIDAS CALIENTES', 'bebidascalientes.jpg', 'A', 4);
INSERT INTO `SubCategoria` VALUES(17, 'PANES', 'panes.jpg', 'A', 4);
INSERT INTO `SubCategoria` VALUES(18, 'JUGOS', 'jugos.jpg', 'A', 4);
INSERT INTO `SubCategoria` VALUES(19, 'ENSALADA DE FRUTA', 'ensaladadefruta.jpg', 'A', 4);
INSERT INTO `SubCategoria` VALUES(20, 'MENU CLASICO', 'clasico.jpg', 'A', 5);
INSERT INTO `SubCategoria` VALUES(21, 'MENU EJECUTIVO', 'ejecutivo.jpg', 'A', 5);
INSERT INTO `SubCategoria` VALUES(22, 'MAZAMORRA', 'mazamorra.jpg', 'A', 6);
INSERT INTO `SubCategoria` VALUES(23, 'TORTA', 'torta.jpg', 'A', 6);
INSERT INTO `SubCategoria` VALUES(24, 'GELATINA', 'gelatina.jpg', 'A', 6);
INSERT INTO `SubCategoria` VALUES(25, 'BEBIDA CALIENTE', 'bebidacaliente.jpg', 'A', 7);
INSERT INTO `SubCategoria` VALUES(26, 'JOSUE', 'josue.png', 'A', 1);
INSERT INTO `SubCategoria` VALUES(27, 'aaa', '48.png', 'a', 1);
INSERT INTO `SubCategoria` VALUES(28, 'galleta', '49.png', 'A', 2);
INSERT INTO `SubCategoria` VALUES(29, 'AAA', '50.png', 'A', 1);
INSERT INTO `SubCategoria` VALUES(30, 'AAA', '55.png', 'A', 5);
INSERT INTO `SubCategoria` VALUES(31, '595', '56.png', '', 40);
INSERT INTO `SubCategoria` VALUES(32, 'cate 12', '57.png', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Sugerencia`
--

CREATE TABLE `Sugerencia` (
  `idsugerencia` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `cliente_idcliente` int(11) NOT NULL,
  PRIMARY KEY (`idsugerencia`,`cliente_idcliente`),
  KEY `fk_sugerencia_cliente1_idx` (`cliente_idcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Sugerencia`
--


-- --------------------------------------------------------

--
-- Table structure for table `Tipo_movimiento`
--

CREATE TABLE `Tipo_movimiento` (
  `idtipo_movimiento` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idtipo_movimiento`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `Tipo_movimiento`
--

INSERT INTO `Tipo_movimiento` VALUES(1, 'Ingreso por compra (IC)');
INSERT INTO `Tipo_movimiento` VALUES(2, 'Ingreso por ajuste de cantidad (IAC)');
INSERT INTO `Tipo_movimiento` VALUES(3, 'Egreso por ajuste de cantidad(EAC)');

-- --------------------------------------------------------

--
-- Table structure for table `Tipo_pago`
--

CREATE TABLE `Tipo_pago` (
  `idtipo_pago` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtipo_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Tipo_pago`
--

INSERT INTO `Tipo_pago` VALUES(0, 'sin estado');
INSERT INTO `Tipo_pago` VALUES(1, 'POS');
INSERT INTO `Tipo_pago` VALUES(2, 'efectivo');

-- --------------------------------------------------------

--
-- Table structure for table `Vendedor`
--

CREATE TABLE `Vendedor` (
  `idvendedor` int(11) NOT NULL AUTO_INCREMENT,
  `nombres_apellidos` varchar(100) NOT NULL,
  `celular` varchar(9) NOT NULL,
  `password` int(11) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `domicilio` varchar(100) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `estado` char(1) DEFAULT 'A' COMMENT 'A= ACTIVO | I = INACTIVO',
  `dni` char(8) DEFAULT NULL,
  `telefono_casa` char(7) DEFAULT NULL,
  PRIMARY KEY (`idvendedor`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `Vendedor`
--

INSERT INTO `Vendedor` VALUES(1, 'Josue Durand', '977227420', 1234, '1996-08-24', 'San Juan', 'alex@gmail.com', 'A', '74894179', 'null');
INSERT INTO `Vendedor` VALUES(2, 'Haydee Pebe Villagaray', '988872569', 1234, '1995-05-02', 'Av. Alcazar cdra 4 ', 'jorge@gmail.com', 'L', '74894179', '9910624');
INSERT INTO `Vendedor` VALUES(3, 'Allison Berrocal Chipana', '946318806', 1234, '1993-10-13', 'San Juan de Luriganshington ', 'Allisong18@hotmail.com', 'L', '78458956', '9910624');
INSERT INTO `Vendedor` VALUES(4, 'Damarix Durand', '966672569', 1234, NULL, NULL, 'damarix@gmail.com', 'A', NULL, NULL);
INSERT INTO `Vendedor` VALUES(5, 'Damarix Durand', '966672569', 1234, NULL, NULL, 'ss', 'A', NULL, NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Anulacion_pago_realizados`
--
ALTER TABLE `Anulacion_pago_realizados`
  ADD CONSTRAINT `fk_anulacion_pago_realizados_cabecera_pedido1` FOREIGN KEY (`cabecera_pedido_id_num_pedido`, `cabecera_pedido_cliente_idcliente`, `cabecera_pedido_vendedor_idvendedor`, `cabecera_pedido_tipo_pago_idtipo_pago`) REFERENCES `Cabecera_pedido` (`id_num_pedido`, `cliente_idcliente`, `vendedor_idvendedor`, `tipo_pago_idtipo_pago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_anulacion_pago_realizados_administrador1` FOREIGN KEY (`administrador_idvendedor`) REFERENCES `Administrador` (`idadmin`) ON DELETE NO ACTION ON UPDATE NO ACTION;
