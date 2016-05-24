-- MySQL dump 10.15  Distrib 10.0.20-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: kmasociados
-- ------------------------------------------------------
-- Server version	10.0.20-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `kmasociados`
--

/*!40000 DROP DATABASE IF EXISTS `kmasociados`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `kmasociados` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `kmasociados`;

--
-- Table structure for table `articulos`
--

DROP TABLE IF EXISTS `articulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articulos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clave` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `linea` varchar(50) DEFAULT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `modelo` varchar(100) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `lugar` int(11) NOT NULL,
  `codigoBarras` varchar(20) NOT NULL,
  `sustituto` varchar(100) DEFAULT NULL,
  `unidad` varchar(50) NOT NULL,
  `existencias` int(11) NOT NULL DEFAULT '0',
  `area` int(11) NOT NULL,
  `archivo` varchar(500) DEFAULT NULL,
  `precioRecuperacion` decimal(8,2) NOT NULL DEFAULT '0.00',
  `precioLista` decimal(8,2) DEFAULT '0.00',
  `precioMayoreo` decimal(8,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_articulos_1` (`nombre`),
  KEY `IDX_articulos_2` (`marca`),
  KEY `IDX_articulos_3` (`existencias`),
  KEY `IDX_articulos_4` (`area`),
  KEY `FK_articulos_2` (`lugar`),
  CONSTRAINT `FK_articulos_1` FOREIGN KEY (`area`) REFERENCES `cat_areas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_articulos_2` FOREIGN KEY (`lugar`) REFERENCES `cat_lugares` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulos`
--

LOCK TABLES `articulos` WRITE;
/*!40000 ALTER TABLE `articulos` DISABLE KEYS */;
/*!40000 ALTER TABLE `articulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articuloseventos`
--

DROP TABLE IF EXISTS `articuloseventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articuloseventos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `articulo` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT '1',
  `evento` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_articulosEventos_1` (`articulo`),
  KEY `IDX_articulosEventos_2` (`evento`),
  CONSTRAINT `FK_articulosEventos_1` FOREIGN KEY (`articulo`) REFERENCES `articulos` (`id`),
  CONSTRAINT `FK_articulosEventos_2` FOREIGN KEY (`evento`) REFERENCES `eventos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articuloseventos`
--

LOCK TABLES `articuloseventos` WRITE;
/*!40000 ALTER TABLE `articuloseventos` DISABLE KEYS */;
INSERT INTO `articuloseventos` VALUES (7,1,5,1),(8,2,3,1),(9,3,2,1),(10,4,1,1),(11,1,2,2),(12,1,5,3);
/*!40000 ALTER TABLE `articuloseventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_areas`
--

DROP TABLE IF EXISTS `cat_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_areas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `familia` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_areas_1` (`familia`),
  CONSTRAINT `FK_areas_1` FOREIGN KEY (`familia`) REFERENCES `cat_familias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_areas`
--

LOCK TABLES `cat_areas` WRITE;
/*!40000 ALTER TABLE `cat_areas` DISABLE KEYS */;
INSERT INTO `cat_areas` VALUES (1,'Area 1',1),(2,'Area 2',1),(3,'Area 3',1),(4,'Area 4',1),(5,'Area 5',1),(6,'Area 6',5),(7,'Area 7',5);
/*!40000 ALTER TABLE `cat_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_bancos`
--

DROP TABLE IF EXISTS `cat_bancos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_bancos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_cat_bancos_1` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_bancos`
--

LOCK TABLES `cat_bancos` WRITE;
/*!40000 ALTER TABLE `cat_bancos` DISABLE KEYS */;
INSERT INTO `cat_bancos` VALUES (1,'Bancomer'),(2,'Banorte'),(3,'Serfin');
/*!40000 ALTER TABLE `cat_bancos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_ciudades`
--

DROP TABLE IF EXISTS `cat_ciudades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_ciudades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_cat_ciudades_1` (`nombre`),
  KEY `IDX_cat_ciudades_2` (`estado`),
  CONSTRAINT `FK_cat_ciudades_1` FOREIGN KEY (`estado`) REFERENCES `cat_estados` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_ciudades`
--

LOCK TABLES `cat_ciudades` WRITE;
/*!40000 ALTER TABLE `cat_ciudades` DISABLE KEYS */;
/*!40000 ALTER TABLE `cat_ciudades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_estados`
--

DROP TABLE IF EXISTS `cat_estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_estados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_cat_estados_1` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_estados`
--

LOCK TABLES `cat_estados` WRITE;
/*!40000 ALTER TABLE `cat_estados` DISABLE KEYS */;
/*!40000 ALTER TABLE `cat_estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_familias`
--

DROP TABLE IF EXISTS `cat_familias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_familias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `subfamilia` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_familias_1` (`subfamilia`),
  KEY `IDX_familias_2` (`nombre`),
  CONSTRAINT `FK_familias_1` FOREIGN KEY (`subfamilia`) REFERENCES `cat_subfamilias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_familias`
--

LOCK TABLES `cat_familias` WRITE;
/*!40000 ALTER TABLE `cat_familias` DISABLE KEYS */;
INSERT INTO `cat_familias` VALUES (1,'Familia 1',2),(2,'Familia 2',2),(3,'Familia 3',2),(4,'Familia 4',3),(5,'Familia 5',3),(6,'Familia 6',4),(7,'Familia 7',5);
/*!40000 ALTER TABLE `cat_familias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_guardias`
--

DROP TABLE IF EXISTS `cat_guardias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_guardias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_guardias_1` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_guardias`
--

LOCK TABLES `cat_guardias` WRITE;
/*!40000 ALTER TABLE `cat_guardias` DISABLE KEYS */;
/*!40000 ALTER TABLE `cat_guardias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_lugares`
--

DROP TABLE IF EXISTS `cat_lugares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_lugares` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_cat_lugares_1` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_lugares`
--

LOCK TABLES `cat_lugares` WRITE;
/*!40000 ALTER TABLE `cat_lugares` DISABLE KEYS */;
INSERT INTO `cat_lugares` VALUES (1,'Salón Santa María','Corporativo Santa María, torre 1 piso 10'),(2,'Jubilee','Andador Constitución, entre 20 de Noviembre y Negrete');
/*!40000 ALTER TABLE `cat_lugares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_metodospago`
--

DROP TABLE IF EXISTS `cat_metodospago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_metodospago` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_metodosPago_1` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_metodospago`
--

LOCK TABLES `cat_metodospago` WRITE;
/*!40000 ALTER TABLE `cat_metodospago` DISABLE KEYS */;
/*!40000 ALTER TABLE `cat_metodospago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_puestos`
--

DROP TABLE IF EXISTS `cat_puestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_puestos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_cat_puestos_1` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_puestos`
--

LOCK TABLES `cat_puestos` WRITE;
/*!40000 ALTER TABLE `cat_puestos` DISABLE KEYS */;
/*!40000 ALTER TABLE `cat_puestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_ranking`
--

DROP TABLE IF EXISTS `cat_ranking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_ranking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_cat_ranking_1` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_ranking`
--

LOCK TABLES `cat_ranking` WRITE;
/*!40000 ALTER TABLE `cat_ranking` DISABLE KEYS */;
INSERT INTO `cat_ranking` VALUES (3,'Deplorable'),(2,'Elite'),(1,'Promedio');
/*!40000 ALTER TABLE `cat_ranking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_roles`
--

DROP TABLE IF EXISTS `cat_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_cat_roles_1` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_roles`
--

LOCK TABLES `cat_roles` WRITE;
/*!40000 ALTER TABLE `cat_roles` DISABLE KEYS */;
INSERT INTO `cat_roles` VALUES (1,'Rol 1'),(2,'Rol 2'),(3,'Rol 3');
/*!40000 ALTER TABLE `cat_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_status`
--

DROP TABLE IF EXISTS `cat_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_cat_status_1` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_status`
--

LOCK TABLES `cat_status` WRITE;
/*!40000 ALTER TABLE `cat_status` DISABLE KEYS */;
INSERT INTO `cat_status` VALUES (1,'Activo'),(2,'Inactivo');
/*!40000 ALTER TABLE `cat_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_subfamilias`
--

DROP TABLE IF EXISTS `cat_subfamilias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_subfamilias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_subfamilias_1` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_subfamilias`
--

LOCK TABLES `cat_subfamilias` WRITE;
/*!40000 ALTER TABLE `cat_subfamilias` DISABLE KEYS */;
INSERT INTO `cat_subfamilias` VALUES (1,'Subfamilia 1'),(2,'Subfamilia 2'),(3,'Subfamilia 3'),(4,'Subfamilia 4'),(5,'Subfamilia 5'),(6,'Subfamilia 6');
/*!40000 ALTER TABLE `cat_subfamilias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_tiposevento`
--

DROP TABLE IF EXISTS `cat_tiposevento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_tiposevento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clave` varchar(20) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_cat_tiposEvento_1` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_tiposevento`
--

LOCK TABLES `cat_tiposevento` WRITE;
/*!40000 ALTER TABLE `cat_tiposevento` DISABLE KEYS */;
/*!40000 ALTER TABLE `cat_tiposevento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clave` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `nombreComercial` varchar(200) DEFAULT NULL,
  `cargo` varchar(100) DEFAULT NULL,
  `montoCredito` decimal(10,2) DEFAULT '0.00',
  `diasCredito` int(4) DEFAULT NULL,
  `tipoContacto` varchar(50) DEFAULT NULL,
  `nombreContacto` varchar(100) DEFAULT NULL,
  `webContacto` varchar(200) DEFAULT NULL,
  `direccionContacto` varchar(200) DEFAULT NULL,
  `coloniaContacto` varchar(100) DEFAULT NULL,
  `ciudadContacto` int(11) NOT NULL DEFAULT '0',
  `estadoContacto` int(11) NOT NULL DEFAULT '0',
  `codigoPostalContacto` char(5) DEFAULT NULL,
  `telefonoContacto` varchar(14) DEFAULT NULL,
  `celularContacto` varchar(14) DEFAULT NULL,
  `emailContacto` varchar(70) DEFAULT NULL,
  `rfcFiscal` varchar(14) DEFAULT NULL,
  `razonSocialFiscal` varchar(100) DEFAULT NULL,
  `calleFiscal` varchar(50) DEFAULT NULL,
  `coloniaFiscal` varchar(100) DEFAULT NULL,
  `ciudadFiscal` int(11) NOT NULL DEFAULT '0',
  `estadoFiscal` int(11) NOT NULL DEFAULT '0',
  `paisFiscal` varchar(50) DEFAULT NULL,
  `codigoPostalFiscal` char(5) DEFAULT NULL,
  `numeroInteriorFiscal` varchar(5) DEFAULT NULL,
  `numeroExteriorFiscal` varchar(5) DEFAULT NULL,
  `localidadFiscal` varchar(100) DEFAULT NULL,
  `municipioFiscal` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_clientes_1` (`nombre`),
  KEY `FK_clientes_1` (`ciudadContacto`),
  KEY `FK_clientes_2` (`estadoContacto`),
  KEY `IDX_clientes_2` (`coloniaFiscal`),
  KEY `IDX_clientes_3` (`ciudadFiscal`),
  KEY `IDX_clientes_4` (`estadoFiscal`),
  CONSTRAINT `FK_clientes_1` FOREIGN KEY (`ciudadContacto`) REFERENCES `cat_ciudades` (`id`),
  CONSTRAINT `FK_clientes_2` FOREIGN KEY (`estadoContacto`) REFERENCES `cat_estados` (`id`),
  CONSTRAINT `FK_clientes_3` FOREIGN KEY (`ciudadFiscal`) REFERENCES `cat_ciudades` (`id`),
  CONSTRAINT `FK_clientes_4` FOREIGN KEY (`estadoFiscal`) REFERENCES `cat_estados` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuentasbancarias`
--

DROP TABLE IF EXISTS `cuentasbancarias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuentasbancarias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clave` varchar(10) DEFAULT NULL,
  `nombre` varchar(50) NOT NULL,
  `banco` int(11) NOT NULL,
  `noCuenta` varchar(20) DEFAULT NULL,
  `clabe` varchar(30) DEFAULT NULL,
  `saldo` decimal(11,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `FK_cuentasBancarias_1` (`banco`),
  KEY `IDX_cuentasBancarias_1` (`nombre`),
  KEY `IDX_cuentasbancarias_2` (`saldo`),
  CONSTRAINT `FK_cuentasBancarias_1` FOREIGN KEY (`banco`) REFERENCES `cat_bancos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuentasbancarias`
--

LOCK TABLES `cuentasbancarias` WRITE;
/*!40000 ALTER TABLE `cuentasbancarias` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuentasbancarias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `depositosengarantia`
--

DROP TABLE IF EXISTS `depositosengarantia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `depositosengarantia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_depositosEnGarantia_1` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `depositosengarantia`
--

LOCK TABLES `depositosengarantia` WRITE;
/*!40000 ALTER TABLE `depositosengarantia` DISABLE KEYS */;
/*!40000 ALTER TABLE `depositosengarantia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clave` varchar(50) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `puesto` int(11) NOT NULL,
  `domicilio` varchar(200) DEFAULT NULL,
  `colonia` varchar(100) DEFAULT NULL,
  `ciudad` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `codigoPostal` char(5) DEFAULT NULL,
  `telefono` varchar(14) DEFAULT NULL,
  `celular` varchar(14) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `lunes` tinyint(1) DEFAULT '0',
  `martes` tinyint(1) DEFAULT '0',
  `miercoles` tinyint(1) DEFAULT '0',
  `jueves` tinyint(1) DEFAULT '0',
  `viernes` tinyint(1) DEFAULT '0',
  `sabado` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IDX_empleados_1` (`nombre`),
  KEY `IDX_empleados_2` (`colonia`),
  KEY `IDX_empleados_3` (`ciudad`),
  KEY `IDX_empleados_4` (`estado`),
  KEY `IDX_empleados_5` (`puesto`),
  CONSTRAINT `FK_empleados_1` FOREIGN KEY (`puesto`) REFERENCES `cat_puestos` (`id`),
  CONSTRAINT `FK_empleados_2` FOREIGN KEY (`ciudad`) REFERENCES `cat_ciudades` (`id`),
  CONSTRAINT `FK_empleados_3` FOREIGN KEY (`estado`) REFERENCES `cat_estados` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventos`
--

DROP TABLE IF EXISTS `eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cotizacion` tinyint(1) NOT NULL DEFAULT '1',
  `statusCotizacion` int(11) DEFAULT '0',
  `statusEvento` int(11) DEFAULT '0',
  `cliente` int(11) NOT NULL,
  `lugar` int(11) NOT NULL,
  `tipo` int(11) NOT NULL,
  `fechaEntrega` timestamp NULL DEFAULT NULL,
  `fechaSeguimiento` timestamp NULL DEFAULT NULL,
  `fechaFinal` timestamp NULL DEFAULT NULL,
  `invitados` int(11) DEFAULT '0',
  `salon` tinyint(1) DEFAULT NULL,
  `vendedor` int(11) NOT NULL,
  `utilidadCuenta` decimal(5,2) NOT NULL DEFAULT '0.00',
  `cuenta` varchar(20) DEFAULT NULL,
  `montoServicios` decimal(8,2) DEFAULT NULL,
  `depositosEnGarantia` int(11) NOT NULL,
  `montoDepositosEnGarantia` decimal(8,2) DEFAULT '0.00',
  `guardias` int(11) NOT NULL,
  `cantidadGuardias` int(11) DEFAULT '0',
  `montoGuardias` decimal(8,2) DEFAULT NULL,
  `metodoPago` int(11) NOT NULL,
  `banco` int(11) NOT NULL,
  `totalEvento` decimal(11,2) DEFAULT '0.00',
  `anticipo` decimal(11,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `IDX_eventos_1` (`cliente`),
  KEY `IDX_eventos_2` (`lugar`),
  KEY `IDX_eventos_3` (`fechaEntrega`),
  KEY `IDX_eventos_4` (`fechaSeguimiento`),
  KEY `IDX_eventos_5` (`fechaFinal`),
  KEY `IDX_eventos_6` (`totalEvento`),
  KEY `IDX_eventos_7` (`anticipo`),
  KEY `FK_eventos_3` (`tipo`),
  KEY `FK_eventos_4` (`guardias`),
  KEY `FK_eventos_5` (`metodoPago`),
  KEY `FK_eventos_6` (`banco`),
  KEY `FK_eventos_6_idx` (`statusCotizacion`),
  KEY `FK_eventos_8_idx` (`statusEvento`),
  KEY `IDX_eventos_9` (`vendedor`),
  CONSTRAINT `FK_eventos_1` FOREIGN KEY (`cliente`) REFERENCES `clientes` (`id`),
  CONSTRAINT `FK_eventos_2` FOREIGN KEY (`lugar`) REFERENCES `cat_lugares` (`id`),
  CONSTRAINT `FK_eventos_3` FOREIGN KEY (`tipo`) REFERENCES `cat_tiposevento` (`id`),
  CONSTRAINT `FK_eventos_4` FOREIGN KEY (`guardias`) REFERENCES `cat_guardias` (`id`),
  CONSTRAINT `FK_eventos_5` FOREIGN KEY (`metodoPago`) REFERENCES `cat_metodospago` (`id`),
  CONSTRAINT `FK_eventos_6` FOREIGN KEY (`banco`) REFERENCES `cat_bancos` (`id`),
  CONSTRAINT `FK_eventos_7` FOREIGN KEY (`statusCotizacion`) REFERENCES `cat_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_eventos_8` FOREIGN KEY (`statusEvento`) REFERENCES `cat_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_eventos_9` FOREIGN KEY (`vendedor`) REFERENCES `vendedores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos`
--

LOCK TABLES `eventos` WRITE;
/*!40000 ALTER TABLE `eventos` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gastos`
--

DROP TABLE IF EXISTS `gastos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gastos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empleado` int(11) NOT NULL,
  `evento` int(11) NOT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `concepto` varchar(200) DEFAULT NULL,
  `telefonoContacto` varchar(14) DEFAULT NULL,
  `fechaSolicitud` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fechaRequerido` timestamp NULL DEFAULT NULL,
  `fechaEntrega` timestamp NULL DEFAULT NULL,
  `area` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_gastos_1` (`evento`),
  KEY `IDX_gastos_2` (`fechaSolicitud`),
  KEY `IDX_gastos_3` (`fechaRequerido`),
  KEY `IDX_gastos_4` (`fechaEntrega`),
  KEY `FK_gastos_3` (`area`),
  KEY `FK_gastos_1` (`empleado`),
  CONSTRAINT `FK_gastos_1` FOREIGN KEY (`empleado`) REFERENCES `empleados` (`id`),
  CONSTRAINT `FK_gastos_2` FOREIGN KEY (`evento`) REFERENCES `eventos` (`id`),
  CONSTRAINT `FK_gastos_3` FOREIGN KEY (`area`) REFERENCES `cat_areas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gastos`
--

LOCK TABLES `gastos` WRITE;
/*!40000 ALTER TABLE `gastos` DISABLE KEYS */;
/*!40000 ALTER TABLE `gastos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulos`
--

DROP TABLE IF EXISTS `modulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modulos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `url` varchar(150) NOT NULL,
  `prioridad` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IDX_modulos_1` (`prioridad`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulos`
--

LOCK TABLES `modulos` WRITE;
/*!40000 ALTER TABLE `modulos` DISABLE KEYS */;
INSERT INTO `modulos` VALUES (1,'Administrar','localhost/admin?visitante=ok','0'),(2,'Servicios','localhost/servicios','0');
/*!40000 ALTER TABLE `modulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clave` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `nombreContacto` varchar(100) DEFAULT NULL,
  `nombre2Contacto` varchar(100) DEFAULT NULL,
  `nombreEmpresaContacto` varchar(100) DEFAULT NULL,
  `telefonoContacto` varchar(14) DEFAULT NULL,
  `celularContacto` varchar(14) DEFAULT NULL,
  `emailContacto` varchar(70) DEFAULT NULL,
  `webContacto` varchar(200) DEFAULT NULL,
  `rfcFiscal` varchar(14) DEFAULT NULL,
  `nombreComercialFiscal` varchar(100) DEFAULT NULL,
  `calleFiscal` varchar(50) DEFAULT NULL,
  `coloniaFiscal` varchar(100) DEFAULT NULL,
  `ciudadFiscal` int(11) NOT NULL DEFAULT '0',
  `estadoFiscal` int(11) NOT NULL DEFAULT '0',
  `codigoPostalFiscal` char(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_proveedores_1` (`nombre`),
  KEY `IDX_proveedores_2` (`coloniaFiscal`),
  KEY `proveedores_3` (`ciudadFiscal`),
  KEY `IDX_proveedores_4` (`estadoFiscal`),
  CONSTRAINT `FK_proveedores_3` FOREIGN KEY (`ciudadFiscal`) REFERENCES `cat_ciudades` (`id`),
  CONSTRAINT `FK_proveedores_4` FOREIGN KEY (`estadoFiscal`) REFERENCES `cat_estados` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rolesmodulos`
--

DROP TABLE IF EXISTS `rolesmodulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rolesmodulos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rol` int(11) NOT NULL,
  `modulo` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_rolesModulos_1` (`rol`),
  KEY `FK_rolesModulos_2` (`modulo`),
  CONSTRAINT `FK_rolesModulos_1` FOREIGN KEY (`rol`) REFERENCES `cat_roles` (`id`),
  CONSTRAINT `FK_rolesModulos_2` FOREIGN KEY (`modulo`) REFERENCES `modulos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rolesmodulos`
--

LOCK TABLES `rolesmodulos` WRITE;
/*!40000 ALTER TABLE `rolesmodulos` DISABLE KEYS */;
/*!40000 ALTER TABLE `rolesmodulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clave` varchar(20) NOT NULL,
  `concepto` varchar(200) DEFAULT NULL,
  `area` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT '0',
  `precioUnitario` decimal(11,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_servicios_1` (`concepto`),
  KEY `IDX_servicios_2` (`area`),
  KEY `IDX_servicios_3` (`cantidad`),
  KEY `IDX_servicios_43` (`precioUnitario`),
  CONSTRAINT `FK_servicios_1` FOREIGN KEY (`area`) REFERENCES `cat_areas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicioseventos`
--

DROP TABLE IF EXISTS `servicioseventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicioseventos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `servicio` int(11) NOT NULL,
  `evento` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_serviciosEventos_1` (`servicio`),
  KEY `IDX_serviciosEventos_2` (`evento`),
  CONSTRAINT `FK_serviciosEventos_1` FOREIGN KEY (`servicio`) REFERENCES `servicios` (`id`),
  CONSTRAINT `FK_serviciosEventos_2` FOREIGN KEY (`evento`) REFERENCES `eventos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicioseventos`
--

LOCK TABLES `servicioseventos` WRITE;
/*!40000 ALTER TABLE `servicioseventos` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicioseventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `llave` varchar(100) NOT NULL,
  `empleado` int(11) NOT NULL,
  `rol` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_usuarios_1` (`nombre`,`pass`),
  KEY `IDX_usuarios_2` (`rol`),
  KEY `FK_usuarios_1` (`empleado`),
  CONSTRAINT `FK_usuarios_1` FOREIGN KEY (`empleado`) REFERENCES `empleados` (`id`),
  CONSTRAINT `FK_usuarios_2` FOREIGN KEY (`rol`) REFERENCES `cat_roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'admin','38038196670473fe43cb9b26960fdf43a1e71152','dc3c52f17adb84a07278a8fda621985436e7fcc6',0,0);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedores`
--

DROP TABLE IF EXISTS `vendedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendedores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empleado` int(11) NOT NULL,
  `ranking` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_vendedores_1` (`ranking`),
  KEY `FK_vendedores_1` (`empleado`),
  CONSTRAINT `FK_vendedores_1` FOREIGN KEY (`empleado`) REFERENCES `empleados` (`id`),
  CONSTRAINT `FK_vendedores_2` FOREIGN KEY (`ranking`) REFERENCES `cat_ranking` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedores`
--

LOCK TABLES `vendedores` WRITE;
/*!40000 ALTER TABLE `vendedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'kmasociados'
--
/*!50003 DROP PROCEDURE IF EXISTS `cosa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cosa`(IN dato VARCHAR(100))
BEGIN
	SELECT* from articulosEventos WHERE id IN(select GROUP_CONCAT(dato,","));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPD_articulos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPD_articulos`(IN P_id VARCHAR(200))
BEGIN
	SET @dependencias = 0;
    
	SET @sqlQuery = CONCAT("SELECT COUNT(*) INTO @dependencias FROM articulosEventos WHERE articulo IN(",P_id,");");
    
    PREPARE execQuery FROM @sqlQuery;
    EXECUTE execQuery;
    DEALLOCATE PREPARE execQuery;
    
    IF(@dependencias=0) THEN          
		SET @sqlQuery = CONCAT("DELETE FROM articulos WHERE id IN(",P_id,");");
		
		PREPARE execQuery FROM @sqlQuery;
		EXECUTE execQuery;
		DEALLOCATE PREPARE execQuery;
		
		SELECT 'TRUE' AS respuesta, NULL AS 'error';
	ELSE
		SELECT 'FALSE' AS respuesta, 'Artículo asignado a un evento' AS 'error';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPD_articulosEventos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPD_articulosEventos`(IN P_id VARCHAR(200))
BEGIN    
    DECLARE cantidades INT;
    DECLARE articulos INT;
    DECLARE execQuery VARCHAR(1024);
    DECLARE no_more_rows BOOLEAN;
    
    DECLARE cursorArticulos CURSOR FOR SELECT * FROM TMP_articulosEventos;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more_rows = TRUE;
    
    DROP TABLE IF EXISTS TMP_articulosEventos;
    CREATE TABLE TMP_articulosEventos(articulo INT, cantidad INT);
    
    SET @sqlQuery = CONCAT("INSERT INTO TMP_articulosEventos (
								SELECT articulo, cantidad FROM articulosEventos 
								WHERE id IN(",P_id,")
							);");
	PREPARE execQuery FROM @sqlQuery;
	EXECUTE execQuery;
	DEALLOCATE PREPARE execQuery;
    
    OPEN cursorArticulos;
    
    getCantidades: LOOP
    
		FETCH cursorARticulos INTO articulos, cantidades;
        
        IF no_more_rows THEN
			CLOSE cursorArticulos;
			LEAVE getCantidades;
		END IF;
        
        UPDATE articulos SET existencias=existencias+cantidades WHERE id = articulos;
	END LOOP getCantidades;
     
	DROP TABLE TMP_articulosEventos;

	SET @sqlQuery = CONCAT("DELETE FROM articulosEventos WHERE id IN(",P_id,");");

	PREPARE execQuery FROM @sqlQuery;
	EXECUTE execQuery;
	DEALLOCATE PREPARE execQuery;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPD_cat_areas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPD_cat_areas`(IN P_id VARCHAR(200))
BEGIN
	SET @dependencias = 0;
    
	SET @sqlQuery = CONCAT("SELECT SUM(info) INTO @dependencias FROM (
									SELECT COUNT(*) AS info FROM articulos WHERE area IN(",P_id,")
                                    UNION
                                    SELECT COUNT(*) AS info FROM gastos WHERE area IN(",P_id,")
                                    UNION
                                    SELECT COUNT(*) AS info FROM servicios WHERE area IN(",P_id,")
							) tmp");
    
    PREPARE execQuery FROM @sqlQuery;
    EXECUTE execQuery;
    DEALLOCATE PREPARE execQuery;
    
    IF(@dependencias=0) THEN         
		SET @sqlQuery = CONCAT("DELETE FROM cat_areas WHERE id IN(",P_id,");");
		
		PREPARE execQuery FROM @sqlQuery;
		EXECUTE execQuery;
		DEALLOCATE PREPARE execQuery;
		
		SELECT 'TRUE' AS respuesta, NULL AS 'error';
	ELSE
		SELECT 'FALSE' AS respuesta, 'Area asignada a un artículo, gasto o servicio' AS 'error';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPD_cat_bancos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPD_cat_bancos`(IN P_id VARCHAR(200))
BEGIN
	SET @dependencias = 0;
    
	SET @sqlQuery = CONCAT("SELECT SUM(info) INTO @dependencias FROM (
									SELECT COUNT(*) AS info FROM cuentasBancarias WHERE banco IN(",P_id,")
                                    UNION
                                    SELECT COUNT(*) AS info FROM eventos WHERE banco IN(",P_id,")
							) tmp");
    
    PREPARE execQuery FROM @sqlQuery;
    EXECUTE execQuery;
    DEALLOCATE PREPARE execQuery;
    
    IF(@dependencias=0) THEN         
		SET @sqlQuery = CONCAT("DELETE FROM cat_bancos WHERE id IN(",P_id,");");
		
		PREPARE execQuery FROM @sqlQuery;
		EXECUTE execQuery;
		DEALLOCATE PREPARE execQuery;
		
		SELECT 'TRUE' AS respuesta, NULL AS 'error';
	ELSE
		SELECT 'FALSE' AS respuesta, 'Banco asignada a un cuenta bancaria o evento' AS 'error';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPD_cat_familias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPD_cat_familias`(IN P_id VARCHAR(200))
BEGIN
	SET @dependencias = 0;
    
	SET @sqlQuery = CONCAT("SELECT COUNT(*) INTO @dependencias FROM cat_areas WHERE familia IN(",P_id,");");
    
    PREPARE execQuery FROM @sqlQuery;
    EXECUTE execQuery;
    DEALLOCATE PREPARE execQuery;
    
    IF(@dependencias=0) THEN            
		SET @sqlQuery = CONCAT("DELETE FROM cat_familias WHERE id IN(",P_id,");");
		
		PREPARE execQuery FROM @sqlQuery;
		EXECUTE execQuery;
		DEALLOCATE PREPARE execQuery;
		
		SELECT 'TRUE' AS respuesta, NULL AS 'error';
	ELSE
		SELECT 'FALSE' AS respuesta, 'Familia asignada a un área' AS 'error';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPD_cat_lugares` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPD_cat_lugares`(IN P_id VARCHAR(200))
BEGIN
	SET @dependencias = 0;
    
	SET @sqlQuery = CONCAT("SELECT COUNT(*) INTO @dependencias FROM eventos WHERE lugar IN(",P_id,");");
    
    PREPARE execQuery FROM @sqlQuery;
    EXECUTE execQuery;
    DEALLOCATE PREPARE execQuery;
    
    IF(@dependencias=0) THEN        
		SET @sqlQuery = CONCAT("DELETE FROM cat_lugares WHERE id IN(",P_id,");");
		
		PREPARE execQuery FROM @sqlQuery;
		EXECUTE execQuery;
		DEALLOCATE PREPARE execQuery;
		
		SELECT 'TRUE' AS respuesta, NULL AS 'error';
	ELSE
		SELECT 'FALSE' AS respuesta, 'Lugar asignado a un evento' AS 'error';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPD_cat_ranking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPD_cat_ranking`(IN P_id VARCHAR(200))
BEGIN
	SET @dependencias = 0;
    
	SET @sqlQuery = CONCAT("SELECT COUNT(*) INTO @dependencias FROM vendedores WHERE ranking IN(",P_id,");");
    
    PREPARE execQuery FROM @sqlQuery;
    EXECUTE execQuery;
    DEALLOCATE PREPARE execQuery;
    
    IF(@dependencias=0) THEN         
		SET @sqlQuery = CONCAT("DELETE FROM cat_ranking WHERE id IN(",P_id,");");
		
		PREPARE execQuery FROM @sqlQuery;
		EXECUTE execQuery;
		DEALLOCATE PREPARE execQuery;
		
		SELECT 'TRUE' AS respuesta, NULL AS 'error';
	ELSE
		SELECT 'FALSE' AS respuesta, 'Ranking asignado a un vendedor' AS 'error';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPD_cat_roles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPD_cat_roles`(IN P_id VARCHAR(200))
BEGIN
	SET @dependencias = 0;
    
	SET @sqlQuery = CONCAT("SELECT SUM(info) INTO @dependencias FROM (
									SELECT COUNT(*) AS info FROM rolesModulos WHERE rol IN(",P_id,")
                                    UNION
                                    SELECT COUNT(*) AS info FROM usuarios WHERE rol IN(",P_id,")
							) tmp");
    
    PREPARE execQuery FROM @sqlQuery;
    EXECUTE execQuery;
    DEALLOCATE PREPARE execQuery;
    
    IF(@dependencias=0) THEN  
		SET @sqlQuery = CONCAT("DELETE FROM cat_roles WHERE id IN(",P_id,");");
		
		PREPARE execQuery FROM @sqlQuery;
		EXECUTE execQuery;
		DEALLOCATE PREPARE execQuery;
		
		SELECT 'TRUE' AS respuesta, NULL AS 'error';
	ELSE
		SELECT 'FALSE' AS respuesta, 'Rol asignada a un usuario o módulos' AS 'error';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPD_cat_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPD_cat_status`(IN P_id VARCHAR(200))
BEGIN
	SET @dependencias = 0;
    
	SET @sqlQuery = CONCAT("SELECT COUNT(*) INTO @dependencias FROM eventos WHERE statusEvento IN(",P_id,") OR statusCotizacion IN(",P_id,");");
    
    PREPARE execQuery FROM @sqlQuery;
    EXECUTE execQuery;
    DEALLOCATE PREPARE execQuery;
    
    IF(@dependencias=0) THEN     
		SET @sqlQuery = CONCAT("DELETE FROM cat_status WHERE id IN(",P_id,");");
		
		PREPARE execQuery FROM @sqlQuery;
		EXECUTE execQuery;
		DEALLOCATE PREPARE execQuery;
		
		SELECT 'TRUE' AS respuesta, NULL AS 'error';
	ELSE
		SELECT 'FALSE' AS respuesta, 'Status asignado' AS 'error';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPD_cat_subfamilias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPD_cat_subfamilias`(IN P_id VARCHAR(200))
BEGIN
	SET @dependencias = 0;
    
	SET @sqlDependencias = CONCAT("SELECT COUNT(*) INTO @dependencias FROM cat_familias WHERE subfamilia IN(",P_id,");");
    
    PREPARE execQuery FROM @sqlDependencias;
    EXECUTE execQuery;
    DEALLOCATE PREPARE execQuery;
    
    IF(@dependencias=0) THEN      
		SET @sqlQuery = CONCAT("DELETE FROM cat_subfamilias WHERE id IN(",P_id,");");
		
		PREPARE execQuery FROM @sqlQuery;
		EXECUTE execQuery;
		DEALLOCATE PREPARE execQuery;
		
		SELECT 'TRUE' AS respuesta, NULL AS 'error';
	ELSE
		SELECT 'FALSE' AS respuesta, 'Subfamilia asignada a una familia' AS 'error';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPD_cat_tiposEvento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPD_cat_tiposEvento`(IN P_id VARCHAR(200))
BEGIN
	SET @dependencias = 0;
    
	SET @sqlQuery = CONCAT("SELECT COUNT(*) INTO @dependencias FROM eventos WHERE tipo IN(",P_id,");");
    
    PREPARE execQuery FROM @sqlQuery;
    EXECUTE execQuery;
    DEALLOCATE PREPARE execQuery;
    
    IF(@dependencias=0) THEN    
		SET @sqlQuery = CONCAT("DELETE FROM cat_tiposEvento WHERE id IN(",P_id,");");
		
		PREPARE execQuery FROM @sqlQuery;
		EXECUTE execQuery;
		DEALLOCATE PREPARE execQuery;
		
		SELECT 'TRUE' AS respuesta, NULL AS 'error';
	ELSE
		SELECT 'FALSE' AS respuesta, 'Tipo asignado a un evento' AS 'error';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPD_clientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPD_clientes`(IN P_id VARCHAR(200))
BEGIN
	SET @dependencias = 0;
    
	SET @sqlQuery = CONCAT("SELECT COUNT(*) INTO @dependencias FROM eventos WHERE cliente IN(",P_id,");");
    
    PREPARE execQuery FROM @sqlQuery;
    EXECUTE execQuery;
    DEALLOCATE PREPARE execQuery;
    
    IF(@dependencias=0) THEN     
		SET @sqlQuery = CONCAT("DELETE FROM clientes WHERE id IN(",P_id,");");
		
		PREPARE execQuery FROM @sqlQuery;
		EXECUTE execQuery;
		DEALLOCATE PREPARE execQuery;
		
		SELECT 'TRUE' AS respuesta, NULL AS 'error';
	ELSE
		SELECT 'FALSE' AS respuesta, 'Cliente asignado a un evento' AS 'error';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPD_empleados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPD_empleados`(IN P_id VARCHAR(200))
BEGIN
	SET @dependencias = 0;
    
	SET @sqlQuery = CONCAT("SELECT SUM(info) INTO @dependencias FROM (
									SELECT COUNT(*) AS info FROM gastos WHERE empleado IN(",P_id,")
                                    UNION
                                    SELECT COUNT(*) AS info FROM usuarios WHERE empleado IN(",P_id,")
                                    UNION
                                    SELECT COUNT(*) AS info FROM vendedores WHERE empleado IN(",P_id,")
							) tmp");
    
    PREPARE execQuery FROM @sqlQuery;
    EXECUTE execQuery;
    DEALLOCATE PREPARE execQuery;
    
    IF(@dependencias=0) THEN        
		SET @sqlQuery = CONCAT("DELETE FROM empleados WHERE id IN(",P_id,");");
		
		PREPARE execQuery FROM @sqlQuery;
		EXECUTE execQuery;
		DEALLOCATE PREPARE execQuery;
		
		SELECT 'TRUE' AS respuesta, NULL AS 'error';
	ELSE
		SELECT 'FALSE' AS respuesta, 'Empleado asignado a gastos usuarios o vendedores' AS 'error';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPD_gastos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPD_gastos`(IN P_id VARCHAR(200))
BEGIN    
	SET @sqlQuery = CONCAT("DELETE FROM gastos WHERE id IN(",P_id,");");
	
	PREPARE execQuery FROM @sqlQuery;
	EXECUTE execQuery;
	DEALLOCATE PREPARE execQuery;
	
	SELECT 'TRUE' AS respuesta, NULL AS 'error';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPD_modulos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPD_modulos`(IN P_id VARCHAR(200))
BEGIN
	SET @dependencias = 0;
    
	SET @sqlQuery = CONCAT("SELECT COUNT(*) INTO @dependencias FROM rolesModulos WHERE modulo IN(",P_id,");");
    
    PREPARE execQuery FROM @sqlQuery;
    EXECUTE execQuery;
    DEALLOCATE PREPARE execQuery;
    
    IF(@dependencias=0) THEN  
		SET @sqlQuery = CONCAT("DELETE FROM modulos WHERE id IN(",P_id,");");
		
		PREPARE execQuery FROM @sqlQuery;
		EXECUTE execQuery;
		DEALLOCATE PREPARE execQuery;
		
		SELECT 'TRUE' AS respuesta, NULL AS 'error';
	ELSE
		SELECT 'FALSE' AS respuesta, 'Módulo asignado a un rol' AS 'error';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPD_proveedores` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPD_proveedores`(IN P_id VARCHAR(200))
BEGIN    
	SET @sqlQuery = CONCAT("DELETE FROM proveedores WHERE id IN(",P_id,");");
	
	PREPARE execQuery FROM @sqlQuery;
	EXECUTE execQuery;
	DEALLOCATE PREPARE execQuery;
	
	SELECT 'TRUE' AS respuesta, NULL AS 'error';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPD_rolesModulos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPD_rolesModulos`(IN P_id VARCHAR(200))
BEGIN    
	SET @sqlQuery = CONCAT("DELETE FROM rolesModulos WHERE id IN(",P_id,");");
	
	PREPARE execQuery FROM @sqlQuery;
	EXECUTE execQuery;
	DEALLOCATE PREPARE execQuery;
	
	SELECT 'TRUE' AS respuesta, NULL AS 'error';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPD_eventos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPD_eventos`(IN P_id VARCHAR(200))
BEGIN
	SET @dependencias = 0;
    
	SET @sqlQuery = CONCAT("SELECT COUNT(*) INTO @dependencias FROM gastos WHERE evento IN(",P_id,");");
    
    PREPARE execQuery FROM @sqlQuery;
    EXECUTE execQuery;
    DEALLOCATE PREPARE execQuery;
    
    IF(@dependencias=0) THEN                       
		SET @sqlQuery = CONCAT("DELETE FROM articulosEventos WHERE evento IN(",P_id,");");
		
		PREPARE execQuery FROM @sqlQuery;
		EXECUTE execQuery;
		DEALLOCATE PREPARE execQuery;
		
		SET @sqlQuery = CONCAT("DELETE FROM serviciosEventos WHERE evento IN(",P_id,");");
		
		PREPARE execQuery FROM @sqlQuery;
		EXECUTE execQuery;
		DEALLOCATE PREPARE execQuery;
		
		SET @sqlQuery = CONCAT("DELETE FROM eventos WHERE id IN(",P_id,");");
		
		PREPARE execQuery FROM @sqlQuery;
		EXECUTE execQuery;
		DEALLOCATE PREPARE execQuery;
		
		SELECT 'TRUE' AS respuesta, NULL AS 'error';
	ELSE
		SELECT 'FALSE' AS respuesta, 'Evento asignado a un gasto' AS 'error';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPD_servicios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPD_servicios`(IN P_id VARCHAR(200))
BEGIN
	SET @dependencias = 0;
    
	SET @sqlQuery = CONCAT("SELECT COUNT(*) INTO @dependencias FROM serviciosEventos WHERE articulo IN(",P_id,");");
    
    PREPARE execQuery FROM @sqlQuery;
    EXECUTE execQuery;
    DEALLOCATE PREPARE execQuery;
    
    IF(@dependencias=0) THEN          
		SET @sqlQuery = CONCAT("DELETE FROM servicios WHERE id IN(",P_id,");");
		
		PREPARE execQuery FROM @sqlQuery;
		EXECUTE execQuery;
		DEALLOCATE PREPARE execQuery;
		
		SELECT 'TRUE' AS respuesta, NULL AS 'error';
	ELSE
		SELECT 'FALSE' AS respuesta, 'Servicio asignado a un evento' AS 'error';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPD_serviciosEventos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPD_serviciosEventos`(IN P_id VARCHAR(200))
BEGIN    
	SET @sqlQuery = CONCAT("DELETE FROM serviciosEventos WHERE id IN(",P_id,");");
	
	PREPARE execQuery FROM @sqlQuery;
	EXECUTE execQuery;
	DEALLOCATE PREPARE execQuery;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPD_usuarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPD_usuarios`(IN P_id VARCHAR(200))
BEGIN    
	SET @sqlQuery = CONCAT("DELETE FROM usuarios WHERE id IN(",P_id,");");
	
	PREPARE execQuery FROM @sqlQuery;
	EXECUTE execQuery;
	DEALLOCATE PREPARE execQuery;
	
	SELECT 'TRUE' AS respuesta, NULL AS 'error';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPD_vendedores` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPD_vendedores`(IN P_id VARCHAR(200))
BEGIN
	SET @dependencias = 0;
    
	SET @sqlQuery = CONCAT("SELECT COUNT(*) INTO @dependencias FROM eventos WHERE vendedor IN(",P_id,");");
    
    PREPARE execQuery FROM @sqlQuery;
    EXECUTE execQuery;
    DEALLOCATE PREPARE execQuery;
    
    IF(@dependencias=0) THEN          
		SET @sqlQuery = CONCAT("DELETE FROM vendedores WHERE id IN(",P_id,");");
		
		PREPARE execQuery FROM @sqlQuery;
		EXECUTE execQuery;
		DEALLOCATE PREPARE execQuery;
		
		SELECT 'TRUE' AS respuesta, NULL AS 'error';
	ELSE
		SELECT 'FALSE' AS respuesta, 'Vendedor asignado a un evento' AS 'error';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPQ_cat_areas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPQ_cat_areas`(IN P_familia INT)
BEGIN
	IF(P_familia IS NULL) THEN
		SELECT * FROM cat_areas ORDER BY nombre;
	ELSE
		SELECT * FROM cat_areas WHERE familia=P_familia ORDER BY nombre;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPQ_cat_bancos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPQ_cat_bancos`()
BEGIN
	SELECT * FROM cat_bancos ORDER BY nombre;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPQ_cat_familias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPQ_cat_familias`(IN P_subfamilia INT)
BEGIN
	IF(P_subfamilia IS NULL) THEN
		SELECT * FROM cat_familias ORDER BY nombre;
	ELSE
		SELECT * FROM cat_familias WHERE subfamilia=P_subfamilia ORDER BY nombre;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPQ_cat_lugares` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPQ_cat_lugares`()
BEGIN
	SELECT * FROM cat_lugares ORDER BY nombre;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPQ_cat_ranking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPQ_cat_ranking`()
BEGIN
	SELECT * FROM cat_ranking ORDER BY nombre;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPQ_cat_roles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPQ_cat_roles`()
BEGIN
	SELECT * FROM cat_roles ORDER BY nombre;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPQ_cat_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPQ_cat_status`()
BEGIN
	SELECT * FROM cat_status ORDER BY nombre;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPQ_cat_subfamilias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPQ_cat_subfamilias`()
BEGIN
	SELECT * FROM cat_subfamilias ORDER BY nombre;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPQ_cat_tiposEvento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPQ_cat_tiposEvento`()
BEGIN
	SELECT * FROM cat_tiposEvento ORDER BY nombre;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPQ_llaveUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPQ_llaveUsuario`(IN P_usuario VARCHAR(50))
BEGIN
	SELECT llave FROM usuarios WHERE nombre=P_Usuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPQ_loginUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPQ_loginUsuario`(IN P_usuario VARCHAR(30),
                                          IN P_pass VARCHAR(200),
                                          IN P_npass VARCHAR(200),
                                          IN P_nllave VARCHAR(200))
BEGIN
SET @userID = NULL;

SELECT id INTO @userID FROM usuarios WHERE BINARY nombre=P_usuario AND BINARY pass=SHA1(P_pass);

IF @userID IS NOT NULL THEN
  UPDATE usuarios SET pass=SHA1(P_npass), llave=P_nllave WHERE BINARY nombre=P_usuario AND BINARY pass=SHA1(P_pass);
  SELECT @userID AS result;
ELSE
  SELECT 'FALSE' AS result;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPQ_modulos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPQ_modulos`(IN P_prioridad INT)
BEGIN
	IF(P_prioridad IS NULL) THEN
		SELECT * FROM modulos ORDER BY nombre;
	ELSE
		SELECT * FROM modulos WHERE prioridad=P_prioridad ORDER BY nombre;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPQ_usuarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPQ_usuarios`(IN P_order VARCHAR(50), IN P_rol VARCHAR(50))
BEGIN
	SET @sqlQuery = CONCAT("SELECT u.id, u.nombre, e.nombre AS empleado, r.nombre AS rol
								FROM usuarios u
								JOIN empleados e ON u.empleado=e.id
								JOIN cat_roles r ON u.rol=r.id
							");
	IF(P_rol IS NOT NULL AND P_rol!="") THEN
		SET @sqlQuery = CONCAT(@sqlQuery," WHERE u.rol=",P_rol);
	END IF;
    IF(P_order IS NOT NULL AND P_order!="") THEN
		SET @sqlQuery = CONCAT(@sqlQuery," ORDER BY ",P_order);
	END IF;
    
    SET @sqlQuery = CONCAT(@sqlQuery,";");
		
	PREPARE execQuery FROM @sqlQuery;
	EXECUTE execQuery;
	DEALLOCATE PREPARE execQuery;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPU_articulos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_articulos`(IN P_id INT, IN P_clave VARCHAR(20), IN P_nombre VARCHAR(100), IN P_linea VARCHAR(50), IN P_marca VARCHAR(50), IN P_modelo VARCHAR(100), IN P_descripcion VARCHAR(500), IN P_lugar INT, IN P_codigoBarras VARCHAR(20), IN P_sustituto VARCHAR(100), IN P_unidad VARCHAR(50), IN P_existencias INT, IN P_area INT, IN P_archivo VARCHAR(500), IN P_precioRecuperacion NUMERIC(8,2), IN P_precioLista NUMERIC(8,2), IN P_precioMayoreo NUMERIC(8,2))
BEGIN
	IF(P_id IS NULL OR P_id=0) THEN
		INSERT INTO articulos VALUES(0, P_clave, P_nombre, P_linea, P_marca, P_modelo, P_descripcion, P_lugar, P_codigoBarras, P_sustituto, P_unidad, P_existencias, P_area, P_archivo, P_precioRecuperacion, P_precioLista, P_precioMayoreo);
	ELSE
		UPDATE articulos SET clave=P_clave, nombre=P_nombre, linea=P_linea, marca=P_marca, modelo=P_modelo, descripcion=P_descripcion, lugar=P_lugar, codigoBarras=P_codigoBarras, sustituto=P_sustituto, unidad=Punidad, existencias=P_existencias, area=P_area, archivo=P_archivo, precioRecuperacion=P_precioRecuperacion, precioLista=P_precioLista, precioMayoreo=P_precioMayoreo WHERE id=P_id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPU_articulosEventos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_articulosEventos`(IN P_id INT, IN P_cantidad INT, IN P_articulo INT, IN P_evento INT)
BEGIN
	IF(P_id IS NULL OR P_id=0) THEN
		INSERT INTO articulosEventos VALUES (0,P_articulo,P_cantidad,P_evento);
	ELSE
		SET @articulos = 0;
        
        SELECT SUM(total) INTO @articulos FROM(
			SELECT existencias AS total FROM articulos WHERE id = P_articulo
			UNION
			SELECT cantidad AS total FROM articulosEventos WHERE id = P_id
		) tmp;
        
        IF(@articulos>=P_cantidad) THEN
			UPDATE articulosEventos SET cantidad = P_cantidad WHERE id = P_id;
            
            SELECT 'TRUE' AS respuesta, NULL AS 'error';
		ELSE
			SELECT 'FALSE' AS respuesta, 'Cantidad solicitada no alcanza para existencias del artículo' AS 'error';
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPU_cat_areas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_cat_areas`(IN P_id INT, IN P_nombre VARCHAR(100), IN P_familia INT)
BEGIN
	IF(P_id IS NULL OR P_id=0) THEN
		INSERT INTO cat_areas VALUES(0,P_nombre,P_familia);
	ELSE
		UPDATE cat_areas SET nombre=P_nombre, familia=P_familia WHERE id=P_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPU_cat_bancos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_cat_bancos`(IN P_id INT, IN P_nombre VARCHAR(100))
BEGIN
	IF(P_id IS NULL OR P_id=0) THEN
		INSERT INTO cat_bancos VALUES(0,P_nombre);
	ELSE
		UPDATE cat_bancos SET nombre=P_nombre WHERE id=P_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPU_cat_familias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_cat_familias`(IN P_id INT, IN P_nombre VARCHAR(100), IN P_subfamilia INT)
BEGIN
	IF(P_id IS NULL OR P_id=0) THEN
		INSERT INTO cat_familias VALUES(0,P_nombre,P_subfamilia);
	ELSE
		UPDATE cat_familias SET nombre=P_nombre, subfamilia=P_subfamilia WHERE id=P_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPU_cat_lugares` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_cat_lugares`(IN P_id INT, IN P_nombre VARCHAR(50), IN P_direccion VARCHAR(200))
BEGIN
	IF(P_id IS NULL OR P_id=0) THEN
		INSERT INTO cat_lugares VALUES(0,P_nombre,P_direccion);
	ELSE
		UPDATE cat_lugares SET nombre=P_nombre, direccion=P_direccion WHERE id=P_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPU_cat_ranking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_cat_ranking`(IN P_id INT, IN P_nombre VARCHAR(50))
BEGIN
	IF(P_id IS NULL OR P_id=0) THEN
		INSERT INTO cat_ranking VALUES(0,P_nombre);
	ELSE
		UPDATE cat_ranking SET nombre=P_nombre WHERE id=P_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPU_cat_roles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_cat_roles`(IN P_id INT, IN P_nombre VARCHAR(50))
BEGIN
	IF(P_id IS NULL OR P_id=0) THEN
		INSERT INTO cat_roles VALUES(0,P_nombre);
	ELSE
		UPDATE cat_roles SET nombre=P_nombre WHERE id=P_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPU_cat_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_cat_status`(IN P_id INT, IN P_nombre VARCHAR(50))
BEGIN
	IF(P_id IS NULL OR P_id=0) THEN
		INSERT INTO cat_status VALUES(0,P_nombre);
	ELSE
		UPDATE cat_status SET nombre=P_nombre WHERE id=P_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPU_cat_subfamilias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_cat_subfamilias`(IN P_id INT, IN P_nombre VARCHAR(100))
BEGIN
	IF(P_id IS NULL OR P_id=0) THEN
		INSERT INTO cat_subfamilias VALUES(0,P_nombre);
	ELSE
		UPDATE cat_subfamilias SET nombre=P_nombre WHERE id=P_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPU_cat_tiposEvento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_cat_tiposEvento`(IN P_id INT, IN P_clave VARCHAR(20), IN P_nombre VARCHAR(50))
BEGIN
	IF(P_id IS NULL OR P_id=0) THEN
		INSERT INTO cat_tiposEvento VALUES(0,P_clave,P_nombre);
	ELSE
		UPDATE cat_tiposEvento SET clave=P_clave, nombre=P_nombre WHERE id=P_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPU_gastos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_gastos`(IN P_id INT, IN P_empleado INT, IN P_evento INT, IN P_direccion VARCHAR(200), IN P_concepto VARCHAR(200), IN P_telefonoContacto VARCHAR(14), IN P_fechaSolicitud TIMESTAMP, IN P_fechaRequerido TIMESTAMP, IN P_fechaEntrega TIMESTAMP, IN P_area INT)
BEGIN
	IF(P_id IS NULL OR P_id=0) THEN
		INSERT INTO clientes VALUES (0,P_empleado,P_evento,P_direccion,P_concepto,P_telefonoContacto,P_fechaSolicitud,P_fechaRequerido,P_fechaEntrega,P_area);
	ELSE
		UPDATE articulos SET empleado=P_empleado, evento=P_evento, direccion=P_direccion, concepto=P_concepto, telefonoContacto=P_telefonoContacto, fechaSolicitud=P_fechaSolicitud, fechaRequerido=P_fechaRequerido, fechaEntrega=P_fechaEntrega, area=P_area WHERE id=P_id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPU_modulos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_modulos`(IN P_id INT, IN P_nombre VARCHAR(50), IN P_url VARCHAR(150), IN P_prioridad CHAR(1))
BEGIN
	IF(P_id IS NULL OR P_id=0) THEN
		INSERT INTO modulos VALUES(0,P_nombre,P_url,P_prioridad);
	ELSE
		UPDATE modulos SET nombre=P_nombre, url=P_url, prioridad=P_prioridad WHERE id=P_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPU_rolesModulos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_rolesModulos`(IN P_rol INT, IN P_modulo INT)
BEGIN
	INSERT INTO rolesModulos VALUES (0,P_rol,P_modulo);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPU_clientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_clientes`(IN P_id INT, IN P_clave VARCHAR(20), IN P_nombre VARCHAR(100), IN P_nombreComercial VARCHAR(200), IN P_cargo VARCHAR(100), IN P_montoCredito NUMERIC(10,2), IN P_diasCredito INT(4), IN P_tipoContacto VARCHAR(50), IN P_nombreContacto VARCHAR(100), IN P_webContacto VARCHAR(200), IN P_direccionContacto VARCHAR(200), IN P_coloniaContacto VARCHAR(100), IN P_ciudadContacto INT, IN P_estadoContacto INT, IN P_codigoPostalContacto CHAR(5), IN P_telefonoContacto VARCHAR(14), IN P_celularContacto VARCHAR(14), IN P_emailContacto VARCHAR(70), IN P_rfcFiscal VARCHAR(14), IN P_razonSocialFiscal VARCHAR(100), IN P_calleFiscal VARCHAR(50), IN P_coloniaFiscal VARCHAR(100), IN P_ciudadFiscal INT, IN P_estadoFiscal INT, IN P_paisFiscal VARCHAR(50), IN P_codigoPostalFiscal CHAR(5), IN P_numeroInteriorFiscal VARCHAR(5), IN P_numeroExteriorFiscal VARCHAR(5), IN P_localidadFiscal VARCHAR(100), IN P_municipioFiscal VARCHAR(100))
BEGIN
	IF(P_id IS NULL OR P_id=0) THEN
		INSERT INTO clientes VALUES (0,P_clave,P_nombre,P_nombreComercial,P_cargo,P_montoCredito,P_diasCredito,P_tipoContacto,P_nombreContacto,P_webContacto,P_direccionContacto,P_coloniaContacto,P_ciudadContacto,P_estadoContacto,P_codigoPostalContacto,P_telefonoContacto,P_celularContacto,P_emailContacto,P_rfcFiscal,P_razonSocialFiscal,P_calleFiscal,P_coloniaFiscal,P_ciudadFiscal,P_estadoFiscal,P_paisFiscal,P_codigoPostalFiscal,P_numeroInteriorFiscal,P_numeroExteriorFiscal,P_localidadFiscal,P_municipioFiscal);
	ELSE
		UPDATE articulos SET clave=P_clave, nombre=P_nombre, nombrecomercial=P_nombreComercial, cargo=P_cargo, montoCredito=P_montoCredito, diasCredito=P_diasCredito, tipoContacto=P_tipoContacto, nombreContacto=P_nombreContacto, webContacto=P_webContacto, direccionContacto=P_direccionContacto, coloniaContacto=P_coloniaContacto, ciudadContacto=P_ciudadContacto, estadoContacto=P_estadoContacto, codigoPostalContacto=P_codigoPostalcontacto, telefonoContacto=P_telefonoContacto, celularContacto=P_celularContacto, emailContacto=P_emailContacto, rfcFiscal=P_rfcFiscal, razonSocialFiscal=P_razonSocialFiscal, calleFiscal=P_calleFiscal, coloniaFiscal=P_coloniaFiscal, ciudadFiscal=P_ciudadFiscal, estadoFiscal=P_estadoFiscal, paisFiscal=P_paisFiscal, codigoPostalFiscal=P_codigoPostalFiscal, numeroInteriorFiscal=P_numeroInteriorFiscal, numeroExteriorFiscal=P_numeroExteriorFiscal, localidadFiscal=P_localidadFiscal, municipioFiscal=P_municipioFiscal WHERE id=P_id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPU_empleados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_empleados`(IN P_id INT, IN P_clave VARCHAR(50), IN P_nombre VARCHAR(100), IN P_puesto INT, IN P_domicilio VARCHAR(200), IN P_colonia VARCHAR(100), IN P_ciudad INT, IN P_estado INT, IN P_codigoPostal CHAR(5), IN P_telefono VARCHAR(14), IN P_celular VARCHAR(14), IN P_email VARCHAR(100), IN P_lunes TINYINT(1), IN P_martes TINYINT(1), IN P_miercoles TINYINT(1), IN P_jueves TINYINT(1), IN P_viernes TINYINT(1), IN P_sabado TINYINT(1))
BEGIN
	IF(P_id IS NULL OR P_id=0) THEN
		INSERT INTO clientes VALUES (0,P_clave,P_nombre,P_puesto,P_domicilio,P_colonia,P_ciudad,P_estado,P_codigoPostal,P_telefono,P_celular,P_email,P_lunes,P_martes,P_miercoles,P_jueves,P_viernes,P_sabado);
	ELSE
		UPDATE articulos SET clave=P_clave, nombre=P_nombre, puesto=P_puesto, domicilio=P_domicilio, colonia=P_colonia, ciudad=P_ciudad, estado=P_estado, codigoPostal=P_codigoPostal, telefono=P_telefono, celular=P_celular, email=P_email, lunes=P_lunes, martes=P_martes, miercoles=P_miercoles, jueves=P_jueves, viernes=P_viernes, sabado=P_sabado WHERE id=P_id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPU_eventos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_eventos`(IN P_id INT, IN P_cotizacion TINYINT(1), IN P_statusCotizacion INT, IN P_statusEvento INT, IN P_cliente INT, IN P_lugar INT, IN P_tipo INT, IN P_fechaEntrega TIMESTAMP, IN P_fechaSeguimiento TIMESTAMP, IN P_fechaFinal TIMESTAMP, IN P_invitados INT, IN P_salon TINYINT(1), IN P_vendedor INT, IN P_utilidadCuenta NUMERIC(5,2), IN P_cuenta VARCHAR(20), IN P_montoServicios NUMERIC(8,2), IN P_depositosEnGarantia INT, IN P_montoDepositosEnGarantia NUMERIC(8,2), IN P_guardias INT, IN P_cantidadGuardias INT, IN P_montoGuardias NUMERIC(8,2), IN P_metodoPago INT, IN P_banco INT, IN P_totalEvento NUMERIC(11,2), IN P_anticipo NUMERIC(11,2))
BEGIN
	IF(P_id IS NULL OR P_id=0) THEN
		INSERT INTO clientes VALUES (0,otizacion,P_statusCotizacion,P_statusEvento,P_cliente,P_lugar,P_tipo,P_fechaEntrega,P_fechaSeguimiento,P_fechaFinal,P_invitados,P_salon,P_vendedor,P_utilidadCuenta,P_cuenta,P_montoServicios,P_depositosEnGarantia,P_montoDepositosEnGarantia,P_guardias,P_cantidadGuardias,P_montoGuardias,P_metodoPago,P_banco,P_totalEvento,P_anticipo);
	ELSE
		UPDATE articulos SET cotizacion=P_cotizacion, statusCotizacion=P_statusCotizacion, statusEvento=P_statusEvento, cliente=P_cliente, lugar=P_lugar, tipo=P_tipo, fechaEntrega=P_fechaEntrega, fechaSeguimiento=P_fechaSeguimiento, fechaFinal=P_fechaFinal, invitados=P_invitados, salon=P_salon, vendedor=P_vendedor, utilidadCuenta=P_utilidadCuenta, cuenta=P_cuenta, montoServicios=P_montoServicios, depositosEnGarantia=P_depositosEnGarantia, montoDepositosEnGarantia=P_montoDepositosEnGarantia, guardias=P_guardias, cantidadGuardias=P_cantidadGuardias, montoGuardias=P_montoGuardias, metodoPago=P_metodoPago, banco=P_banco, totalEvento=P_totalEvento, anticipo=P_anticipo WHERE id=P_id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPU_proveedores` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_proveedores`(IN P_id INT, IN P_clave VARCHAR(20), IN P_nombre VARCHAR(100), IN P_nombreContacto VARCHAR(100), IN P_nombre2Contacto VARCHAR(100), IN P_nombreEmpresaContacto VARCHAR(100), IN P_telefonoContacto VARCHAR(14), IN P_celularContacto VARCHAR(14), IN P_emailContacto VARCHAR(70), IN P_webContacto VARCHAR(200), IN P_rfcFiscal VARCHAR(14), IN P_nombreComercialFiscal VARCHAR(100), IN P_calleFiscal VARCHAR(50), IN P_coloniaFiscal VARCHAR(100), IN P_ciudadFiscal INT(11), IN P_estadoFiscal INT(11), IN P_codigoPostalFiscal CHAR(5))
BEGIN
	IF(P_id IS NULL OR P_id=0) THEN
		INSERT INTO clientes VALUES (0,P_clave,P_nombre,P_nombreContacto,P_nombre2Contacto,P_nombreEmpresaContacto,P_telefonoContacto,P_celularContacto,P_emailContacto,P_webContacto,P_rfcFiscal,P_nombreComercialFiscal,P_calleFiscal,P_coloniaFiscal,P_ciudadFiscal,P_estadoFiscal,P_codigoPostalFiscal);
	ELSE
		UPDATE articulos SET clave=P_clave, nombre=P_nombre, nombreContacto=P_nombreContacto, nombre2Contacto=P_nombre2Contacto, nombreEmpresaContacto=P_nombreEmpresaContacto, telefonoContacto=P_telefonoContacto, celularContacto=P_celularContacto, emailContacto=P_emailContacto, webContacto=P_webContacto, rfcFiscal=P_rfcFiscal, nombreComercialFiscal=P_nombreComercialFiscal, calleFiscal=P_calleFiscal, coloniaFiscal=P_coloniaFiscal, ciudadFiscal=P_ciudadFiscal, estadoFiscal=P_estadoFiscal, codigoPostalFiscal=P_codigoPostalFiscal WHERE id=P_id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPU_servicios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_servicios`(IN P_id INT, IN P_clave VARCHAR(20), IN P_concepto VARCHAR(200), IN P_area INT(11), IN P_cantidad INT(11), IN P_precioUnitario NUMERIC(11,2))
BEGIN
	IF(P_id IS NULL OR P_id=0) THEN
		INSERT INTO clientes VALUES (0,P_clave,P_concepto,P_area,P_cantidad,P_precioUnitario);
	ELSE
		UPDATE articulos SET clave=P_clave, concepto=P_concepto, area=P_area, cantidad=P_cantidad, precioUnitario=P_precioUnitario WHERE id=P_id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPU_serviciosEventos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_serviciosEventos`(IN P_id INT, IN P_servicio INT, IN P_evento INT)
BEGIN
	INSERT INTO clientes VALUES (0,P_servicio,P_evento);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPU_usuarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_usuarios`(IN P_id INT, IN P_nombre VARCHAR(50), IN P_pass VARCHAR(100), IN P_llave VARCHAR(100), IN P_empleado INT, IN P_rol INT)
BEGIN
	IF(P_id IS NULL OR P_id=0) THEN
		INSERT INTO clientes VALUES (0,P_nombre,SHA1(P_pass),P_llave,P_empleado,P_rol);
	ELSE
		UPDATE articulos SET nombre=P_nombre, pass=SHA1(P_pass), llave=P_llave, rol=P_rol WHERE id=P_id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPU_vendedores` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_vendedores`(IN P_id INT, IN P_empleado INT, IN P_ranking INT)
BEGIN
	IF(P_id IS NULL OR P_id=0) THEN
		INSERT INTO vendedores VALUES(0,P_empleado,P_ranking);
	ELSE
		UPDATE vendedores SET empleado=P_empleado, ranking=P_ranking WHERE id=P_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-18 14:01:53
