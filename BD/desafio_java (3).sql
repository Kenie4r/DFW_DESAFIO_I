-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-09-2022 a las 05:31:40
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.0.19

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `desafio_java`
--
CREATE DATABASE IF NOT EXISTS `desafio_java` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `desafio_java`;

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `aprobacion_rechazoOferta`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `aprobacion_rechazoOferta` (IN `id` INT, IN `observaciones` VARCHAR(100), IN `estado` VARCHAR(30))   UPDATE oferta SET oferta.observaciones = observaciones, oferta.Estado = estado WHERE oferta.idOferta = id$$

DROP PROCEDURE IF EXISTS `crearCupon`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `crearCupon` (IN `usuario` INT, IN `oferta` INT, IN `codigoCupon` VARCHAR(45))   BEGIN
    INSERT INTO cupon(Usuarios_idUsuario, Oferta_idOferta, CodigoCupon, FechaCompra) VALUES ( usuario,oferta,codigoCupon,NOW());
    UPDATE oferta SET limite = limite-1 WHERE idOferta = oferta;
END$$

DROP PROCEDURE IF EXISTS `eliminarOferta`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarOferta` (IN `id` INT)   DELETE FROM oferta WHERE oferta.idOferta = id$$

DROP PROCEDURE IF EXISTS `eliminarRubro`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarRubro` (IN `id` INT(11))   DELETE FROM rubros WHERE idRubros = id$$

DROP PROCEDURE IF EXISTS `eliminarUsuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarUsuario` (IN `id` INT)   DELETE FROM usuarios WHERE usuarios.idUsuario = id$$

DROP PROCEDURE IF EXISTS `insertarOferta`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarOferta` (IN `nombre` VARCHAR(30), IN `descripcion` VARCHAR(100), IN `precioRe` FLOAT, IN `precioOf` FLOAT, IN `inicio` VARCHAR(10), IN `fin` VARCHAR(10), IN `fechaLim` VARCHAR(10), IN `cupones` INT, IN `estado` VARCHAR(30), IN `idEmp` VARCHAR(6))   INSERT INTO oferta(oferta.NombreOferta, oferta.Descripicon, oferta.PrecioRegular, oferta.PrecioOfertado, oferta.inicio, oferta.Fin, oferta.fechaLimite, oferta.limite, oferta.Estado, oferta.Empresa_IdEmpresa) VALUES(nombre, descripcion, precioRe, precioOf, inicio, fin, fechaLim, cupones, estado, idEmp)$$

DROP PROCEDURE IF EXISTS `insertarRubro`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarRubro` (IN `nombre` VARCHAR(30), IN `descripcion` VARCHAR(100))   INSERT INTO rubros(Nombre, Descripcion) VALUES(nombre, descripcion)$$

DROP PROCEDURE IF EXISTS `insertarUsuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarUsuario` (IN `usuario` VARCHAR(10), IN `nombre` VARCHAR(30), IN `apellido` VARCHAR(30), IN `contrasena` VARCHAR(100), IN `correo` VARCHAR(50), IN `rol` INT, IN `empresa` VARCHAR(6), IN `dui` VARCHAR(9), IN `codigoV` VARCHAR(5))   INSERT INTO usuarios(usuarios.Username, usuarios.Nombre, usuarios.Apellidos, usuarios.Pass, usuarios.Email, usuarios.Roles_idRoles, usuarios.Empresa_IdEmpresa, usuarios.DUI, usuarios.passinit) VALUES(usuario, nombre, apellido, contrasena, correo, rol, empresa, dui, codigoV)$$

DROP PROCEDURE IF EXISTS `listarEmpresas`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listarEmpresas` ()   SELECT * FROM empresa$$

DROP PROCEDURE IF EXISTS `listarOfertas`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listarOfertas` ()   SELECT * FROM oferta INNER JOIN empresa ON oferta.Empresa_IdEmpresa = empresa.IdEmpresa$$

DROP PROCEDURE IF EXISTS `listarRubros`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listarRubros` ()   SELECT * FROM rubros$$

DROP PROCEDURE IF EXISTS `listarUsuarios`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listarUsuarios` ()   SELECT * FROM usuarios INNER JOIN roles ON roles.idRoles = usuarios.Roles_idRoles INNER JOIN empresa ON empresa.IdEmpresa = usuarios.Empresa_IdEmpresa$$

DROP PROCEDURE IF EXISTS `modificarOferta`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `modificarOferta` (IN `id` INT, IN `nombre` VARCHAR(30), IN `descripcion` VARCHAR(100), IN `precioRe` FLOAT, IN `precioOf` FLOAT, IN `inicio` VARCHAR(10), IN `fin` VARCHAR(10), IN `fechaLim` VARCHAR(10), IN `cupones` INT, IN `estado` VARCHAR(30), IN `idEmp` VARCHAR(6))   UPDATE oferta SET oferta.NombreOferta = nombre, oferta.Descripicon = descripcion, oferta.PrecioRegular = precioRe, oferta.PrecioOfertado = precioOf, oferta.inicio = inicio, oferta.Fin = fin, oferta.fechaLimite = fechaLim, oferta.limite = cupones, oferta.Estado = estado, oferta.Empresa_IdEmpresa = idEmp WHERE oferta.idOferta = id$$

DROP PROCEDURE IF EXISTS `modificarRubro`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `modificarRubro` (IN `id` INT(11), IN `nombre` VARCHAR(30), IN `descripcion` VARCHAR(100))   UPDATE rubros r SET r.Nombre = nombre, r.Descripcion = descripcion WHERE r.IdRubros = id$$

DROP PROCEDURE IF EXISTS `modificarUsuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `modificarUsuario` (IN `id` INT, IN `usuario` VARCHAR(10), IN `nombre` VARCHAR(30), IN `apellido` VARCHAR(30), IN `dui` VARCHAR(9))   UPDATE usuarios SET usuarios.Username = usuario, usuarios.Nombre = nombre, usuarios.Apellidos = apellido, usuarios.DUI = dui WHERE usuarios.idUsuario = id$$

DROP PROCEDURE IF EXISTS `obtenerCuponesUser`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerCuponesUser` (IN `iduser` INT)   SELECT c.* ,e.NombreEmpresa, o.NombreOferta, o.Descripicon, o.fechaLimite FROM cupon as c INNER JOIN oferta as o ON c.Oferta_idOferta = o.idOferta INNER JOIN empresa as e ON o.Empresa_IdEmpresa = e.IdEmpresa WHERE c.Usuarios_idUsuario = iduser ORDER BY c.FechaCompra DESC$$

DROP PROCEDURE IF EXISTS `obtenerCuponesUserF`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerCuponesUserF` (IN `iduser` INT, IN `estadoa` VARCHAR(45))   SELECT c.* ,e.NombreEmpresa, o.NombreOferta, o.Descripicon, o.fechaLimite FROM cupon as c INNER JOIN oferta as o ON c.Oferta_idOferta = o.idOferta INNER JOIN empresa as e ON o.Empresa_IdEmpresa = e.IdEmpresa WHERE c.Usuarios_idUsuario = iduser AND c.Estado = estadoa ORDER BY c.FechaCompra DESC$$

DROP PROCEDURE IF EXISTS `obtenerOferta`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerOferta` (IN `id` INT)   SELECT * FROM oferta INNER JOIN empresa ON oferta.Empresa_IdEmpresa = empresa.IdEmpresa WHERE oferta.idOferta = id$$

DROP PROCEDURE IF EXISTS `obtenerRubro`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerRubro` (IN `id` INT)   SELECT * FROM rubros WHERE rubros.IdRubros = id$$

DROP PROCEDURE IF EXISTS `pa_eliminarEmpresa`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_eliminarEmpresa` (IN `_idempresa` VARCHAR(6))  NO SQL DELETE FROM empresa WHERE IdEmpresa=_idempresa$$

DROP PROCEDURE IF EXISTS `pa_insertarEmpresa`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_insertarEmpresa` (IN `_idempresa` VARCHAR(6), IN `_nombre_empresa` VARCHAR(45), IN `_ubicacion` LONGTEXT, IN `_contacto` VARCHAR(50), IN `_telefono` VARCHAR(9), IN `_correo` VARCHAR(50), IN `_porcentaje_ganancias` FLOAT(10,2), IN `_rubros_idrubros` INT(11))  NO SQL INSERT INTO empresa
VALUES (_idempresa,_nombre_empresa,_ubicacion,_contacto,_telefono,_correo,_porcentaje_ganancias,_rubros_idrubros)$$

DROP PROCEDURE IF EXISTS `pa_listarEmpresas`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_listarEmpresas` ()  NO SQL BEGIN
SELECT e.IdEmpresa, e.NombreEmpresa, e.Ubicacion, e.Contacto, e.Telefono, e.Correo, e.PorcentajeGanancias, r.Nombre FROM empresa e 
INNER JOIN rubros r
ON e.Rubros_IdRubros = r.IdRubros;
END$$

DROP PROCEDURE IF EXISTS `pa_modificarEmpresa`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_modificarEmpresa` (IN `_idempresa` VARCHAR(6), IN `_nombre_empresa` VARCHAR(45), IN `_ubicacion` LONGTEXT, IN `_contacto` VARCHAR(50), IN `_telefono` VARCHAR(9), IN `_correo` VARCHAR(50), IN `_porcentaje_ganancias` FLOAT(10,2), IN `_rubros_idrubros` INT(11))  NO SQL UPDATE empresa e
SET
e.NombreEmpresa=_nombre_empresa, e.Ubicacion=_ubicacion, e.Contacto=_contacto, e.Telefono=_telefono, e.Correo=_correo, e.PorcentajeGanancias=_porcentaje_ganancias, e.Rubros_IdRubros=_rubros_idrubros
WHERE e.IdEmpresa=_idempresa$$

DROP PROCEDURE IF EXISTS `pa_obtenerEmpresa`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_obtenerEmpresa` (IN `_idempresa` VARCHAR(6))  NO SQL SELECT * FROM empresa WHERE IdEmpresa = _idempresa$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cupon`
--

DROP TABLE IF EXISTS `cupon`;
CREATE TABLE IF NOT EXISTS `cupon` (
  `Usuarios_idUsuario` int(11) NOT NULL,
  `Oferta_idOferta` int(11) NOT NULL,
  `CodigoCupon` varchar(45) NOT NULL,
  `FechaCompra` date DEFAULT NULL,
  `Estado` varchar(45) DEFAULT 'Disponible',
  `fechUso` date DEFAULT NULL,
  PRIMARY KEY (`CodigoCupon`),
  KEY `fk_Usuarios_has_Oferta_Oferta1_idx` (`Oferta_idOferta`),
  KEY `fk_Usuarios_has_Oferta_Usuarios1_idx` (`Usuarios_idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cupon`
--

INSERT INTO `cupon` (`Usuarios_idUsuario`, `Oferta_idOferta`, `CodigoCupon`, `FechaCompra`, `Estado`, `fechUso`) VALUES
(21, 4, 'CUP0010732027', '2022-09-01', 'Disponible', NULL),
(18, 4, 'CUP0013926009', '2022-09-02', 'Disponible', NULL),
(18, 3, 'CUP0014556517', '2022-09-02', 'Disponible', NULL),
(18, 4, 'CUP0015856388', '2022-09-02', 'Disponible', NULL),
(21, 4, 'CUP0016744945', '2022-09-01', 'Disponible', NULL),
(18, 4, 'CUP0018203829', '2022-09-02', 'Disponible', NULL),
(18, 6, 'DEE4232401466', '2022-09-02', 'Disponible', NULL),
(18, 8, 'SPO0011719694', '2022-08-31', 'Vencido', NULL),
(18, 7, 'SPO0013642147', '2022-09-02', 'Disponible', NULL),
(18, 7, 'SPO0014752045', '2022-08-31', 'Disponible', NULL),
(18, 7, 'SPO0015950593', '2022-09-02', 'Disponible', NULL),
(18, 7, 'SPO0019670404', '2022-09-02', 'Disponible', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

DROP TABLE IF EXISTS `empresa`;
CREATE TABLE IF NOT EXISTS `empresa` (
  `IdEmpresa` varchar(6) NOT NULL,
  `NombreEmpresa` varchar(45) DEFAULT NULL,
  `Ubicacion` longtext DEFAULT NULL,
  `Contacto` varchar(50) NOT NULL,
  `Telefono` varchar(9) NOT NULL,
  `Correo` varchar(50) NOT NULL,
  `PorcentajeGanancias` float DEFAULT NULL,
  `Rubros_IdRubros` int(11) NOT NULL,
  PRIMARY KEY (`IdEmpresa`),
  KEY `fk_Empresa_Rubros1_idx` (`Rubros_IdRubros`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`IdEmpresa`, `NombreEmpresa`, `Ubicacion`, `Contacto`, `Telefono`, `Correo`, `PorcentajeGanancias`, `Rubros_IdRubros`) VALUES
('CUP001', 'La Cuponera', 'El Salvador', '', '', '', 0, 1),
('DEE423', 'DEEZER', 'Estados Unidos de America', '', '', '', 10, 3),
('LLL112', 'EL LORO LOCO', 'EN SAN SALVADOR', 'WILLIAM', '7525-6212', 'william.jr@yopmail.com', 20, 1),
('NUL100', 'CLIENTES', 'ONLINE', '', '', '', 0, 2),
('SPO001', 'SPOTIFY', 'Estados Unidos de América', '', '', '', 15, 3),
('ZPO001', 'Ninite', 'Mexico', '', '', '', 20, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oferta`
--

DROP TABLE IF EXISTS `oferta`;
CREATE TABLE IF NOT EXISTS `oferta` (
  `idOferta` int(11) NOT NULL AUTO_INCREMENT,
  `NombreOferta` mediumtext NOT NULL,
  `Descripicon` longtext NOT NULL,
  `PrecioRegular` float NOT NULL,
  `PrecioOfertado` float NOT NULL,
  `inicio` date NOT NULL,
  `Fin` date NOT NULL,
  `fechaLimite` date NOT NULL,
  `limite` int(11) DEFAULT NULL,
  `Ofertacol` varchar(45) DEFAULT NULL,
  `Estado` varchar(100) DEFAULT 'PENDIENTE',
  `Empresa_IdEmpresa` varchar(6) NOT NULL,
  `observaciones` mediumtext NOT NULL,
  PRIMARY KEY (`idOferta`),
  KEY `fk_Oferta_Empresa1_idx` (`Empresa_IdEmpresa`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `oferta`
--

INSERT INTO `oferta` (`idOferta`, `NombreOferta`, `Descripicon`, `PrecioRegular`, `PrecioOfertado`, `inicio`, `Fin`, `fechaLimite`, `limite`, `Ofertacol`, `Estado`, `Empresa_IdEmpresa`, `observaciones`) VALUES
(2, 'Prueba de OFerta 1', 'Prueba de OFerta 1', 10, 2, '2022-08-10', '2022-08-27', '2022-08-28', 99, NULL, 'RECHAZADA', 'CUP001', 'No me gusto la oferta'),
(3, '10% de descuento en cada una de las compras en China Wok', 'Decide entre nuestros combos para poder obtener un 10% de descuento \r\nen en segundo combo seleccionado. Solo Aplica en compras de \r\nmás de 20$', 20, 18, '2022-08-16', '2022-09-22', '2022-09-23', 96, NULL, 'APROBADA', 'CUP001', ''),
(4, '50% de descuento en articulos XIAOMI en SIMAn', 'OFERTA PARA TODOS LOS FANS DE XIAOMI \r\nOBTEN EL 50% DE DESCUENTO EN TU COMPRAS DE SIMAN \r\nVALIDO EN EL SEGUNDO ARTICULO', 1.25, 0.25, '2022-08-29', '2022-09-05', '2022-09-08', 90, NULL, 'APROBADA', 'CUP001', ''),
(5, '2 Meses gratis de SPOTIFY Premiun en tu al registrarte', 'Consigue 2 meses de premiun en SPOTIFY al registrarte como \r\nusuario nuevo', 10, 2.5, '2022-08-23', '2022-09-15', '2022-08-31', 43, NULL, 'APROBADA', 'SPO001', ''),
(6, '2 Meses gratis de DEEZER en tu al registrarte', 'Descarga música de manera legal con deezer, se el primero en \r\nregistrarte y gana 2 mese de premiun gratis ', 7.55, 3.25, '2022-08-25', '2022-09-15', '2022-09-15', 94, NULL, 'APROBADA', 'DEE423', ''),
(7, 'SPOTIFY Premiun durante 1 año', 'Obten SPOTIFY premiun por medio de este cupon por 1 año completo en un plan familiar', 20.25, 13.25, '2022-08-31', '2022-09-20', '2022-09-21', 0, NULL, 'ACABADA', 'SPO001', 'Sin registros'),
(8, 'Green Day', 'Prueba de SPOTIFY', 200, 2.25, '2022-08-31', '2022-09-01', '2022-09-01', 11, NULL, 'APROBADA', 'SPO001', 'Sin registros'),
(9, 'OFERTA PARA ESTUDIANTES', 'OBTEN EL 10% DE DESCUENTO EN TODAS LAS PROMOCIONES', 10, 5, '2022-09-02', '2022-09-03', '2022-09-04', 15, NULL, 'APROBADA', 'SPO001', 'Sin registros');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

DROP TABLE IF EXISTS `pagos`;
CREATE TABLE IF NOT EXISTS `pagos` (
  `IdPagos` int(11) NOT NULL AUTO_INCREMENT,
  `Metodo` varchar(45) DEFAULT 'Tarjeta',
  `Codigo` varchar(200) DEFAULT NULL,
  `CV` varchar(200) DEFAULT NULL,
  `Usuarios_idUsuario` int(11) NOT NULL,
  `FechaVencimiento` date NOT NULL,
  `Estado` varchar(45) NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`IdPagos`),
  UNIQUE KEY `Codigo_UNIQUE` (`Codigo`),
  UNIQUE KEY `CV_UNIQUE` (`CV`),
  KEY `fk_Pagos_Usuarios1_idx` (`Usuarios_idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`IdPagos`, `Metodo`, `Codigo`, `CV`, `Usuarios_idUsuario`, `FechaVencimiento`, `Estado`) VALUES
(13, 'HOLA DIEGO', 'ZVW\\][\\\\VXZW\\WZX6142', '698d51a19d8a121ce581499d7b701668', 18, '2025-12-01', 'ACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `idRoles` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idRoles`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`idRoles`, `Nombre`) VALUES
(1, 'Administrador'),
(2, 'AdministradorE'),
(3, 'Cliente'),
(4, 'Dependiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rubros`
--

DROP TABLE IF EXISTS `rubros`;
CREATE TABLE IF NOT EXISTS `rubros` (
  `IdRubros` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `Descripcion` longtext DEFAULT NULL,
  PRIMARY KEY (`IdRubros`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `rubros`
--

INSERT INTO `rubros` (`IdRubros`, `Nombre`, `Descripcion`) VALUES
(1, 'Cupones', 'Sitio web para conseguir las mejores ofertas del país al mejor precio'),
(2, 'NINGUNO', ''),
(3, 'Musica', 'Rubro sobre empresas que buscan vender musica, discos, etc.'),
(4, 'Restaurante', 'Empresas de rubro de comida rÃ¡pida, etc.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(45) DEFAULT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Apellidos` varchar(45) DEFAULT NULL,
  `Pass` mediumtext DEFAULT NULL,
  `Email` mediumtext DEFAULT NULL,
  `Roles_idRoles` int(11) NOT NULL,
  `Empresa_IdEmpresa` varchar(6) NOT NULL,
  `DUI` varchar(9) NOT NULL,
  `passinit` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `DUI_UNIQUE` (`DUI`),
  UNIQUE KEY `Username_UNIQUE` (`Username`),
  KEY `fk_Usuarios_Roles_idx` (`Roles_idRoles`),
  KEY `fk_Usuarios_Empresa1_idx` (`Empresa_IdEmpresa`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `Username`, `Nombre`, `Apellidos`, `Pass`, `Email`, `Roles_idRoles`, `Empresa_IdEmpresa`, `DUI`, `passinit`) VALUES
(1, 'admin', 'La Cuponera', 'Admin', 'e10adc3949ba59abbe56e057f20f883e', 'cuponera2022@gmail.com', 1, 'CUP001', '000000000', NULL),
(18, 'Kenie4r', 'Keneth', 'Hernández', '97dc74abe4d78eacea4891e36cd3c8dc', 'knthnolasco@gmail.com', 3, 'NUL100', '063735054', NULL),
(19, 'DMancia12', 'Diego', 'Hernandez', 'e10adc3949ba59abbe56e057f20f883e', 'diego.mancia.03@gmail.com', 3, 'NUL100', '454578996', NULL),
(20, 'spotify admin', 'Spotify', 'ES LATAM', 'be718b2c4703af4c3662f18be369e655', 'knthnolasco@outlook.com', 2, 'SPO001', '454578663', NULL),
(21, 'Guiliam', 'William ', 'García', 'e10adc3949ba59abbe56e057f20f883e', 'jr.william.garcia@gmail.com', 3, 'NUL100', '787879933', NULL),
(22, 'kSano', 'Kevin ', 'Sanchez', 'e10adc3949ba59abbe56e057f20f883e', 'k.sanchezcano0805@gmail.com', 3, 'NUL100', '123456789', NULL);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cupon`
--
ALTER TABLE `cupon`
  ADD CONSTRAINT `fk_Usuarios_has_Oferta_Oferta1` FOREIGN KEY (`Oferta_idOferta`) REFERENCES `oferta` (`idOferta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Usuarios_has_Oferta_Usuarios1` FOREIGN KEY (`Usuarios_idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD CONSTRAINT `fk_Empresa_Rubros1` FOREIGN KEY (`Rubros_IdRubros`) REFERENCES `rubros` (`IdRubros`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `oferta`
--
ALTER TABLE `oferta`
  ADD CONSTRAINT `fk_Oferta_Empresa1` FOREIGN KEY (`Empresa_IdEmpresa`) REFERENCES `empresa` (`IdEmpresa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `fk_Pagos_Usuarios1` FOREIGN KEY (`Usuarios_idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_Usuarios_Empresa1` FOREIGN KEY (`Empresa_IdEmpresa`) REFERENCES `empresa` (`IdEmpresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Usuarios_Roles` FOREIGN KEY (`Roles_idRoles`) REFERENCES `roles` (`idRoles`) ON DELETE NO ACTION ON UPDATE NO ACTION;

DELIMITER $$
--
-- Eventos
--
DROP EVENT IF EXISTS `CUPONES_VENCIDOS`$$
CREATE DEFINER=`root`@`localhost` EVENT `CUPONES_VENCIDOS` ON SCHEDULE EVERY 1 MINUTE STARTS '2022-09-01 18:50:34' ENDS '2022-09-30 18:50:34' ON COMPLETION PRESERVE ENABLE DO UPDATE cupon SET Estado = 'Vencido' WHERE Estado = 'Disponible' AND CodigoCupon IN ((SELECT CodigoCupon FROM cupon INNER JOIN oferta ON oferta.idOferta = cupon.Oferta_idOferta WHERE oferta.fechaLimite <=NOW()))$$

DROP EVENT IF EXISTS `OFERTAS_ACABADAS`$$
CREATE DEFINER=`root`@`localhost` EVENT `OFERTAS_ACABADAS` ON SCHEDULE EVERY 1 MINUTE STARTS '2022-08-31 00:00:00' ENDS '2022-09-30 23:59:59' ON COMPLETION PRESERVE ENABLE DO UPDATE oferta SET oferta.Estado = "ACABADA" WHERE oferta.limite = 0$$

DROP EVENT IF EXISTS `OFERTAS_VENCIDAS`$$
CREATE DEFINER=`root`@`localhost` EVENT `OFERTAS_VENCIDAS` ON SCHEDULE EVERY 2 MINUTE STARTS '2022-08-31 00:00:00' ENDS '2022-09-02 00:00:00' ON COMPLETION PRESERVE DISABLE DO UPDATE oferta SET oferta.Estado = "VENCIDA" WHERE oferta.idOferta in ((SELECT idOferta FROM oferta WHERE Fin >= NOW()))$$

DELIMITER ;
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
