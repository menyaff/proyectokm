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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulos`
--

LOCK TABLES `articulos` WRITE;
/*!40000 ALTER TABLE `articulos` DISABLE KEYS */;
INSERT INTO `articulos` VALUES (1,'lounge001','Sala lounge perla',NULL,'Troncoso','2000','Sala para toda ocación, sale con Chavelo',1,'123456009',NULL,'pza',3,3,NULL,7000.00,5000.00,6300.00),(2,'lounge002','Sala lounge negra',NULL,'Troncoso','2000','Sala para toda ocación, sale con Chavelo',1,'123456009',NULL,'pza',1,3,NULL,7000.00,5000.00,6300.00),(4,'msk001','Sonido sorround',NULL,'Phillips','Negro1','Sonido envolvente para salones grandes',1,'78945613',NULL,'pza',7,2,NULL,10000.00,7000.00,9000.00),(5,'msk002','Sonido sorround2',NULL,'Phillips','Negro1','Sonido envolvente para salones grandes',1,'78945613',NULL,'pza',7,2,NULL,10000.00,7000.00,9000.00),(6,'msk003','Sonido sorround x2',NULL,'Phillips','Negro1','Sonido envolvente para salones grandes',1,'78945613',NULL,'pza',7,2,NULL,10000.00,7000.00,9000.00),(9,'XXX','Dummy','','','','',0,'150','','pza',0,0,NULL,0.00,0.00,0.00);
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
  `articulo` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT '1',
  `evento` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `IDX_articulosEventos_1` (`articulo`),
  KEY `IDX_articulosEventos_2` (`evento`),
  CONSTRAINT `FK_articulosEventos_1` FOREIGN KEY (`articulo`) REFERENCES `articulos` (`id`),
  CONSTRAINT `FK_articulosEventos_2` FOREIGN KEY (`evento`) REFERENCES `eventos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articuloseventos`
--

LOCK TABLES `articuloseventos` WRITE;
/*!40000 ALTER TABLE `articuloseventos` DISABLE KEYS */;
INSERT INTO `articuloseventos` VALUES (7,1,5,1,'2016-07-17 09:48:00'),(8,2,3,1,'2016-07-17 09:48:00'),(10,4,1,1,'2016-07-17 09:48:00'),(11,1,2,2,'2016-07-17 09:48:00'),(12,1,5,3,'2016-07-17 09:48:00'),(44,4,7,6,'2016-07-24 11:53:56'),(45,6,2,6,'2016-07-24 11:54:10');
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
  `nombre` varchar(100) DEFAULT NULL,
  `familia` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_areas_1` (`familia`),
  CONSTRAINT `FK_areas_1` FOREIGN KEY (`familia`) REFERENCES `cat_familias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_areas`
--

LOCK TABLES `cat_areas` WRITE;
/*!40000 ALTER TABLE `cat_areas` DISABLE KEYS */;
INSERT INTO `cat_areas` VALUES (0,NULL,0),(1,'Area 1',1),(2,'Area 2',1),(3,'Area 3',1),(4,'Area 4',1),(5,'Area 5',1),(6,'Area 6',5),(8,'Area ocho',3),(9,'Area Dumy',7);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_bancos`
--

LOCK TABLES `cat_bancos` WRITE;
/*!40000 ALTER TABLE `cat_bancos` DISABLE KEYS */;
INSERT INTO `cat_bancos` VALUES (1,'Bancomer'),(2,'Banorte'),(4,'HSBC'),(3,'Serfín');
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
  `nombre` varchar(100) DEFAULT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_cat_ciudades_1` (`nombre`),
  KEY `IDX_cat_ciudades_2` (`estado`),
  CONSTRAINT `FK_cat_ciudades_1` FOREIGN KEY (`estado`) REFERENCES `cat_estados` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2453 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_ciudades`
--

LOCK TABLES `cat_ciudades` WRITE;
/*!40000 ALTER TABLE `cat_ciudades` DISABLE KEYS */;
INSERT INTO `cat_ciudades` VALUES (0,NULL,0),(1,'Aguascalientes',1),(2,'Asientos',1),(3,'Calvillo',1),(4,'Cosío',1),(5,'El Llano',1),(6,'Jesús María',1),(7,'Pabellón de Arteaga',1),(8,'Rincón de Romos',1),(9,'San Francisco de los Romo',1),(10,'San José de Gracia',1),(11,'Tepezalá',1),(12,'Ensenada',2),(13,'Mexicali',2),(14,'Playas de Rosarito',2),(15,'Tecate',2),(16,'Tijuana',2),(17,'Comodú',3),(18,'La Paz',3),(19,'Loreto',3),(20,'Los Cabos',3),(21,'Mulegé',3),(22,'Calakmul',4),(23,'Calkiní',4),(24,'Campeche',4),(25,'Candelaria',4),(26,'Carmen',4),(27,'Champotón',4),(28,'Escárcega',4),(29,'Hecelchakán',4),(30,'Hopelchén',4),(31,'Palizada',4),(32,'Tenabo',4),(33,'Acacoyagua',5),(34,'Acala',5),(35,'Acapetahua',5),(36,'Aldama',5),(37,'Altamirano',5),(38,'Amatán',5),(39,'Amatenango de la Frontera',5),(40,'Amatenango del Valle',5),(41,'Angel Albino Corzo',5),(42,'Arriaga',5),(43,'Bejucal de Ocampo',5),(44,'Bella Vista',5),(45,'Benemérito de las Américas',5),(46,'Berriozábal',5),(47,'Bochil',5),(48,'Cacahoatán',5),(49,'Catazajá',5),(50,'Chalchihuitán',5),(51,'Chamula',5),(52,'Chanal',5),(53,'Chapultenango',5),(54,'Chenalhó',5),(55,'Chiapa de Corzo',5),(56,'Chiapilla',5),(57,'Chicoasén',5),(58,'Chicomuselo',5),(59,'Chilón',5),(60,'Cintalapa',5),(61,'Coapilla',5),(62,'Comitán de Domínguez',5),(63,'Copainalá',5),(64,'El Bosque',5),(65,'El Porvenir',5),(66,'Escuintla',5),(67,'Francisco León',5),(68,'Frontera Comalapa',5),(69,'Frontera Hidalgo',5),(70,'Huehuetán',5),(71,'Huitiupán',5),(72,'Huixtán',5),(73,'Huixtla',5),(74,'Ixhuatán',5),(75,'Ixtacomitán',5),(76,'Ixtapa',5),(77,'Ixtapangajoya',5),(78,'Jiquipilas',5),(79,'Jitotol',5),(80,'Juárez',5),(81,'La Concordia',5),(82,'La Grandeza',5),(83,'La Independencia',5),(84,'La Libertad',5),(85,'La Trinitaria',5),(86,'Larráinzar',5),(87,'Las Margaritas',5),(88,'Las Rosas',5),(89,'Mapastepec',5),(90,'Maravilla Tenejapa',5),(91,'Marqués de Comillas',5),(92,'Mazapa de Madero',5),(93,'Mazatán',5),(94,'Metapa',5),(95,'Mitontic',5),(96,'Montecristo de Guerrero',5),(97,'Motozintla',5),(98,'Nicolás Ruíz',5),(99,'Ocosingo',5),(100,'Ocotepec',5),(101,'Ocozocoautla de Espinosa',5),(102,'Ostuacán',5),(103,'Osumacinta',5),(104,'Oxchuc',5),(105,'Palenque',5),(106,'Pantelhó',5),(107,'Pantepec',5),(108,'Pichucalco',5),(109,'Pijijiapan',5),(110,'Pueblo Nuevo Solistahuacán',5),(111,'Rayón',5),(112,'Reforma',5),(113,'Sabanilla',5),(114,'Salto de Agua',5),(115,'San Andrés Duraznal',5),(116,'San Cristóbal de las Casas',5),(117,'San Fernando',5),(118,'San Juan Cancuc',5),(119,'San Lucas',5),(120,'Santiago el Pinar',5),(121,'Siltepec',5),(122,'Simojovel',5),(123,'Sitalá',5),(124,'Socoltenango',5),(125,'Solosuchiapa',5),(126,'Soyaló',5),(127,'Suchiapa',5),(128,'Suchiate',5),(129,'Sunuapa',5),(130,'Tapachula',5),(131,'Tapalapa',5),(132,'Tapilula',5),(133,'Tecpatán',5),(134,'Tenejapa',5),(135,'Teopisca',5),(136,'Tila',5),(137,'Tonalá',5),(138,'Totolapa',5),(139,'Tumbalá',5),(140,'Tuxtla Chico',5),(141,'Tuxtla Gutiérrez',5),(142,'Tuzantán',5),(143,'Tzimol',5),(144,'Unión Juárez',5),(145,'Venustiano Carranza',5),(146,'Villa Comaltitlán',5),(147,'Villa Corzo',5),(148,'Villaflores',5),(149,'Yajalón',5),(150,'Zinacantán',5),(151,'Ahumada',6),(152,'Aldama',6),(153,'Allende',6),(154,'Aquiles Serdán',6),(155,'Ascensión',6),(156,'Bachíniva',6),(157,'Balleza',6),(158,'Batopilas',6),(159,'Bocoyna',6),(160,'Buenaventura',6),(161,'Camargo',6),(162,'Carichí',6),(163,'Casas Grandes',6),(164,'Chihuahua',6),(165,'Chínipas',6),(166,'Coronado',6),(167,'Coyame del Sotol',6),(168,'Cuauhtémoc',6),(169,'Cusihuiriachi',6),(170,'Delicias',6),(171,'Dr. Belisario Domínguez',6),(172,'El Tule',6),(173,'Galeana',6),(174,'Gómez Farías',6),(175,'Gran Morelos',6),(176,'Guachochi',6),(177,'Guadalupe',6),(178,'Guadalupe y Calvo',6),(179,'Guazapares',6),(180,'Guerrero',6),(181,'Hidalgo del Parral',6),(182,'Huejotitán',6),(183,'Ignacio Zaragoza',6),(184,'Janos',6),(185,'Jiménez',6),(186,'Juárez',6),(187,'Julimes',6),(188,'La Cruz',6),(189,'López',6),(190,'Madera',6),(191,'Maguarichi',6),(192,'Manuel Benavides',6),(193,'Matachí',6),(194,'Matamoros',6),(195,'Meoqui',6),(196,'Morelos',6),(197,'Moris',6),(198,'Namiquipa',6),(199,'Nonoava',6),(200,'Nuevo Casas Grandes',6),(201,'Ocampo',6),(202,'Ojinaga',6),(203,'Praxedis G. Guerrero',6),(204,'Riva Palacio',6),(205,'Rosales',6),(206,'Rosario',6),(207,'San Francisco de Borja',6),(208,'San Francisco de Conchos',6),(209,'San Francisco del Oro',6),(210,'Santa Bárbara',6),(211,'Santa Isabel',6),(212,'Satevó',6),(213,'Saucillo',6),(214,'Temósachi',6),(215,'Urique',6),(216,'Uruachi',6),(217,'Valle de Zaragoza',6),(218,'Abasolo',7),(219,'Acuña',7),(220,'Allende',7),(221,'Arteaga',7),(222,'Candela',7),(223,'Castaños',7),(224,'Cuatrociénegas',7),(225,'Escobedo',7),(226,'Francisco I. Madero',7),(227,'Frontera',7),(228,'General Cepeda',7),(229,'Guerrero',7),(230,'Hidalgo',7),(231,'Jiménez',7),(232,'Juárez',7),(233,'Lamadrid',7),(234,'Matamoros',7),(235,'Monclova',7),(236,'Morelos',7),(237,'Múzquiz',7),(238,'Nadadores',7),(239,'Nava',7),(240,'Ocampo',7),(241,'Parras',7),(242,'Piedras Negras',7),(243,'Progreso',7),(244,'Ramos Arizpe',7),(245,'Sabinas',7),(246,'Sacramento',7),(247,'Saltillo',7),(248,'San Buenaventura',7),(249,'San Juan de Sabinas',7),(250,'San Pedro',7),(251,'Sierra Mojada',7),(252,'Torreón',7),(253,'Viesca',7),(254,'Villa Unión',7),(255,'Zaragoza',7),(256,'Armería',8),(257,'Colima',8),(258,'Comala',8),(259,'Coquimatlán',8),(260,'Cuauhtémoc',8),(261,'Ixtlahuacán',8),(262,'Manzanillo',8),(263,'Minatitlán',8),(264,'Tecomán',8),(265,'Villa de Alvarez',8),(266,'Alvaro Obregón',9),(267,'Azcapotzalco',9),(268,'Benito Juárez',9),(269,'Coyoacán',9),(270,'Cuajimalpa de Morelos',9),(271,'Cuauhtémoc',9),(272,'Gustavo A. Madero',9),(273,'Iztacalco',9),(274,'Iztapalapa',9),(275,'La Magdalena Contreras',9),(276,'Miguel Hidalgo',9),(277,'Milpa Alta',9),(278,'Tláhuac',9),(279,'Tlalpan',9),(280,'Venustiano Carranza',9),(281,'Xochimilco',9),(282,'Canatlán',10),(283,'Canelas',10),(284,'Coneto de Comonfort',10),(285,'Cuencamé',10),(286,'Durango',10),(287,'El Oro',10),(288,'Gómez Palacio',10),(289,'Gral. Simón Boívar',10),(290,'Guadalupe Victoria',10),(291,'Guanaceví',10),(292,'Hidalgo',10),(293,'Indé',10),(294,'Lerdo',10),(295,'Mapimí',10),(296,'Mezquital',10),(297,'Nazas',10),(298,'Nombre de Dios',10),(299,'Nuevo Ideal',10),(300,'Ocampo',10),(301,'Otáez',10),(302,'Pánuco de Coronado',10),(303,'Peñón Blanco',10),(304,'Poanas',10),(305,'Pueblo Nuevo',10),(306,'Rodeo',10),(307,'San Bernardo',10),(308,'San Dimas',10),(309,'San Juan de Guadalupe',10),(310,'San Juan del Río',10),(311,'San Luis del Cordero',10),(312,'San Pedro del Gallo',10),(313,'Santa Clara',10),(314,'Santiago Papasquiaro',10),(315,'Súchil',10),(316,'Tamazula',10),(317,'Tepehuanes',10),(318,'Tlahualilo',10),(319,'Topia',10),(320,'Vicente Guerrero',10),(321,'Acambay',11),(322,'Acolman',11),(323,'Aculco',11),(324,'Almoloya de Alquisiras',11),(325,'Almoloya de Juárez',11),(326,'Almoloya del Río',11),(327,'Amanalco',11),(328,'Amatepec',11),(329,'Amecameca',11),(330,'Apaxco',11),(331,'Atenco',11),(332,'Atizapán',11),(333,'Atizapán de Zaragoza',11),(334,'Atlacomulco',11),(335,'Atlautla',11),(336,'Axapusco',11),(337,'Ayapango',11),(338,'Calimaya',11),(339,'Capulhuac',11),(340,'Chalco',11),(341,'Chapa de Mota',11),(342,'Chapultepec',11),(343,'Chiautla',11),(344,'Chicoloapan',11),(345,'Chiconcuac',11),(346,'Chimalhuacán',11),(347,'Coacalco de Berriozábal',11),(348,'Coatepec Harinas',11),(349,'Cocotitlán',11),(350,'Coyotepec',11),(351,'Cuautitlán',11),(352,'Cuautitlán Izcalli',11),(353,'Donato Guerra',11),(354,'Ecatepec de Morelos',11),(355,'Ecatzingo',11),(356,'El Oro',11),(357,'Huehuetoca',11),(358,'Hueypoxtla',11),(359,'Huixquilucan',11),(360,'Isidro Fabela',11),(361,'Ixtapaluca',11),(362,'Ixtapan de la Sal',11),(363,'Ixtapan del Oro',11),(364,'Ixtlahuaca',11),(365,'Jaltenco',11),(366,'Jilotepec',11),(367,'Jilotzingo',11),(368,'Jiquipilco',11),(369,'Jocotitlán',11),(370,'Joquicingo',11),(371,'Juchitepec',11),(372,'La Paz',11),(373,'Lerma',11),(374,'Luvianos',11),(375,'Malinalco',11),(376,'Melchor Ocampo',11),(377,'Metepec',11),(378,'Mexicaltzingo',11),(379,'Morelos',11),(380,'Naucalpan de Juárez',11),(381,'Nextlalpan',11),(382,'Nezahualcóyotl',11),(383,'Nicolás Romero',11),(384,'Nopaltepec',11),(385,'Ocoyoacac',11),(386,'Ocuilan',11),(387,'Otumba',11),(388,'Otzoloapan',11),(389,'Otzolotepec',11),(390,'Ozumba',11),(391,'Papalotla',11),(392,'Polotitlán',11),(393,'Rayón',11),(394,'San Antonio la Isla',11),(395,'San Felipe del Progreso',11),(396,'San José del Rincón',11),(397,'San Martín de las Pirámides',11),(398,'San Mateo Atenco',11),(399,'San Simón de Guerrero',11),(400,'Santo Tomás',11),(401,'Soyaniquilpan de Juárez',11),(402,'Sultepec',11),(403,'Tecámac',11),(404,'Tejupilco',11),(405,'Temamatla',11),(406,'Temascalapa',11),(407,'Temascalcingo',11),(408,'Temascaltepec',11),(409,'Temoaya',11),(410,'Tenancingo',11),(411,'Tenango del Aire',11),(412,'Tenango del Valle',11),(413,'Teoloyucán',11),(414,'Teotihuacán',11),(415,'Tepetlaoxtoc',11),(416,'Tepetlixpa',11),(417,'Tepotzotlán',11),(418,'Tequixquiac',11),(419,'Texcaltitlán',11),(420,'Texcalyacac',11),(421,'Texcoco',11),(422,'Tezoyuca',11),(423,'Tianguistenco',11),(424,'Timilpan',11),(425,'Tlalmanalco',11),(426,'Tlalnepantla de Baz',11),(427,'Tlatlaya',11),(428,'Toluca',11),(429,'Tonanitla',11),(430,'Tonatico',11),(431,'Tultepec',11),(432,'Tultitlán',11),(433,'Valle de Bravo',11),(434,'Valle de Chalco Solidaridad',11),(435,'Villa de Allende',11),(436,'Villa del Carbón',11),(437,'Villa Guerrero',11),(438,'Villa Victoria',11),(439,'Xalatlaco',11),(440,'Xonacatlán',11),(441,'Zacazonapan',11),(442,'Zacualpan',11),(443,'Zinacantepec',11),(444,'Zumpahuacán',11),(445,'Zumpango',11),(446,'Abasolo',12),(447,'Acámbaro',12),(448,'Allende',12),(449,'Apaseo el Alto',12),(450,'Apaseo el Grande',12),(451,'Atarjea',12),(452,'Celaya',12),(453,'Comonfort',12),(454,'Coroneo',12),(455,'Cortazar',12),(456,'Cuerámaro',12),(457,'Doctor Mora',12),(458,'Dolores Hidalgo',12),(459,'Guanajuato',12),(460,'Huanímaro',12),(461,'Irapuato',12),(462,'Jaral del Progreso',12),(463,'Jerécuaro',12),(464,'León',12),(465,'Manuel Doblado',12),(466,'Moroleón',12),(467,'Ocampo',12),(468,'Pénjamo',12),(469,'Pueblo Nuevo',12),(470,'Purísima del Rincón',12),(471,'Romita',12),(472,'Salamanca',12),(473,'Salvatierra',12),(474,'San Diego de la Unión',12),(475,'San Felipe',12),(476,'San Francisco del Rincón',12),(477,'San José Iturbide',12),(478,'San Luis de la Paz',12),(479,'Santa Catarina',12),(480,'Santa Cruz de Juventino Rosas',12),(481,'Santiago Maravatío',12),(482,'Silao',12),(483,'Tarandacuao',12),(484,'Tarimoro',12),(485,'Tierra Blanca',12),(486,'Uriangato',12),(487,'Valle de Santiago',12),(488,'Victoria',12),(489,'Villagrán',12),(490,'Xichú',12),(491,'Yuriria',12),(492,'Acapulco de Juárez',13),(493,'Acatepec',13),(494,'Ahuacuotzingo',13),(495,'Ajuchitlán del Progreso',13),(496,'Alcozauca de Guerrero',13),(497,'Alpoyeca',13),(498,'Apaxtla',13),(499,'Arcelia',13),(500,'Atenango del Río',13),(501,'Atlamajalcingo del Monte',13),(502,'Atlixtac',13),(503,'Atoyac de Alvarez',13),(504,'Ayutla de los Libres',13),(505,'Azoyú',13),(506,'Benito Juárez',13),(507,'Buenavista de Cuéllar',13),(508,'Chilapa de Alvarez',13),(509,'Chilpancingo de los Bravo',13),(510,'Coahuayutla de José María Izazaga',13),(511,'Cochoapa el Grande',13),(512,'Cocula',13),(513,'Copala',13),(514,'Copalillo',13),(515,'Copanatoyac',13),(516,'Coyuca de Benítez',13),(517,'Coyuca de Catalán',13),(518,'Cuajinicuilapa',13),(519,'Cualác',13),(520,'Cuautepec',13),(521,'Cuetzala del Progreso',13),(522,'Cutzamala de Pinzón',13),(523,'Eduardo Neri',13),(524,'Florencio Villarreal',13),(525,'General Canuto A. Neri',13),(526,'General Heliodoro Castillo',13),(527,'Huamuxtitlán',13),(528,'Huitzuco de los Figueroa',13),(529,'Iguala de la Independencia',13),(530,'Igualapa',13),(531,'Ixcateopan de Cuauhtémoc',13),(532,'José Azueta',13),(533,'José Joaquin de Herrera',13),(534,'Juan R. Escudero',13),(535,'La Unión de Isidoro Montes de Oca',13),(536,'Leonardo Bravo',13),(537,'Malinaltepec',13),(538,'Marquelia',13),(539,'Mártir de Cuilapan',13),(540,'Metlatónoc',13),(541,'Mochitlán',13),(542,'Olinalá',13),(543,'Ometepec',13),(544,'Pedro Ascencio Alquisiras',13),(545,'Petatlán',13),(546,'Pilcaya',13),(547,'Pungarabato',13),(548,'Quechultenango',13),(549,'San Luis Acatlán',13),(550,'San Marcos',13),(551,'San Miguel Totolapan',13),(552,'Taxco de Alarcón',13),(553,'Tecoanapa',13),(554,'Técpan de Galeana',13),(555,'Teloloapan',13),(556,'Tepecoacuilco de Trujano',13),(557,'Tetipac',13),(558,'Tixtla de Guerrero',13),(559,'Tlacoachistlahuaca',13),(560,'Tlacoapa',13),(561,'Tlalchapa',13),(562,'Tlalixtaquilla de Maldonado',13),(563,'Tlapa de Comonfort',13),(564,'Tlapehuala',13),(565,'Xalpatláhuac',13),(566,'Xochihuehuetlán',13),(567,'Xochistlahuaca',13),(568,'Zapotitlán Tablas',13),(569,'Zirándaro',13),(570,'Zitlala',13),(571,'Acatlán',14),(572,'Acaxochitlán',14),(573,'Actopan',14),(574,'Agua Blanca de Iturbide',14),(575,'Ajacuba',14),(576,'Alfajayucan',14),(577,'Almoloya',14),(578,'Apan',14),(579,'Atitalaquia',14),(580,'Atlapexco',14),(581,'Atotonilco de Tula',14),(582,'Atotonilco el Grande',14),(583,'Calnali',14),(584,'Cardonal',14),(585,'Chapantongo',14),(586,'Chapulhuacán',14),(587,'Chilcuautla',14),(588,'Cuautepec de Hinojosa',14),(589,'El Arenal',14),(590,'Eloxochitlán',14),(591,'Emiliano Zapata',14),(592,'Epazoyucan',14),(593,'Francisco I. Madero',14),(594,'Huasca de Ocampo',14),(595,'Huautla',14),(596,'Huazalingo',14),(597,'Huehuetla',14),(598,'Huejutla de Reyes',14),(599,'Huichapan',14),(600,'Ixmiquilpan',14),(601,'Jacala de Ledezma',14),(602,'Jaltocán',14),(603,'Juárez Hidalgo',14),(604,'La Misión',14),(605,'Lolotla',14),(606,'Metepec',14),(607,'Metztitlán',14),(608,'Mineral de la Reforma',14),(609,'Mineral del Chico',14),(610,'Mineral del Monte',14),(611,'Mixquiahuala de Juárez',14),(612,'Molango de Escamilla',14),(613,'Nicolás Flores',14),(614,'Nopala de Villagrán',14),(615,'Omitlán de Juárez',14),(616,'Pachuca de Soto',14),(617,'Pacula',14),(618,'Pisaflores',14),(619,'Progreso de Obregón',14),(620,'San Agustín Metzquititlán',14),(621,'San Agustín Tlaxiaca',14),(622,'San Bartolo Tutotepec',14),(623,'San Felipe Orizatlán',14),(624,'San Salvador',14),(625,'Santiago de Anaya',14),(626,'Santiago Tulantepec de Lugo Guerre',14),(627,'Singuilucan',14),(628,'Tasquillo',14),(629,'Tecozautla',14),(630,'Tenango de Doria',14),(631,'Tepeapulco',14),(632,'Tepehuacán de Guerrero',14),(633,'Tepeji del Río de Ocampo',14),(634,'Tepetitlán',14),(635,'Tetepango',14),(636,'Tezontepec de Aldama',14),(637,'Tianguistengo',14),(638,'Tizayuca',14),(639,'Tlahuelilpan',14),(640,'Tlahuiltepa',14),(641,'Tlanalapa',14),(642,'Tlanchinol',14),(643,'Tlaxcoapan',14),(644,'Tolcayuca',14),(645,'Tula de Allende',14),(646,'Tulancingo de Bravo',14),(647,'Villa de Tezontepec',14),(648,'Xochiatipan',14),(649,'Xochicoatlán',14),(650,'Yahualica',14),(651,'Zacualtipán de ?ngeles',14),(652,'Zapotlán de Juárez',14),(653,'Zempoala',14),(654,'Zimapán',14),(655,'Acatic',15),(656,'Acatlán de Juárez',15),(657,'Ahualulco de Mercado',15),(658,'Amacueca',15),(659,'Amatitán',15),(660,'Ameca',15),(661,'Arandas',15),(662,'Atemajac de Brizuela',15),(663,'Atengo',15),(664,'Atenguillo',15),(665,'Atotonilco el Alto',15),(666,'Atoyac',15),(667,'Autlán de Navarro',15),(668,'Ayotlán',15),(669,'Ayutla',15),(670,'Bolaños',15),(671,'Cabo Corrientes',15),(672,'Cañadas de Obregón',15),(673,'Casimiro Castillo',15),(674,'Chapala',15),(675,'Chimaltitán',15),(676,'Chiquilistlán',15),(677,'Cihuatlán',15),(678,'Cocula',15),(679,'Colotlán',15),(680,'Concepción de Buenos Aires',15),(681,'Cuautitlán de García Barragán',15),(682,'Cuautla',15),(683,'Cuquío',15),(684,'Degollado',15),(685,'Ejutla',15),(686,'EL Arenal',15),(687,'El Grullo',15),(688,'El Limón',15),(689,'El Salto',15),(690,'Encarnación de Díaz',15),(691,'Etzatlán',15),(692,'Gómez Farías',15),(693,'Guachinango',15),(694,'Guadalajara',15),(695,'Hostotipaquillo',15),(696,'Huejúcar',15),(697,'Huejuquilla el Alto',15),(698,'Ixtlahuacán de los Membrillos',15),(699,'Ixtlahuacán del Río',15),(700,'Jalostotitlán',15),(701,'Jamay',15),(702,'Jesús María',15),(703,'Jilotlán de los Dolores',15),(704,'Jocotepec',15),(705,'Juanacatlán',15),(706,'Juchitlán',15),(707,'La Barca',15),(708,'La Huerta',15),(709,'La Manzanilla de la Paz',15),(710,'Lagos de Moreno',15),(711,'Magdalena',15),(712,'Mascota',15),(713,'Mazamitla',15),(714,'Mexticacán',15),(715,'Mezquitic',15),(716,'Mixtlán',15),(717,'Ocotlán',15),(718,'Ojuelos de Jalisco',15),(719,'Pihuamo',15),(720,'Poncitlán',15),(721,'Puerto Vallarta',15),(722,'Quitupan',15),(723,'San Cristóbal de la Barranca',15),(724,'San Diego de Alejandría',15),(725,'San Gabriel',15),(726,'San Juan de los Lagos',15),(727,'San Juanito de Escobedo',15),(728,'San Julián',15),(729,'San Marcos',15),(730,'San Martín de Bolaños',15),(731,'San Martín Hidalgo',15),(732,'San Miguel el Alto',15),(733,'San Sebastián del Oeste',15),(734,'Santa María de los ?ngeles',15),(735,'Santa María del Oro',15),(736,'Sayula',15),(737,'Tala',15),(738,'Talpa de Allende',15),(739,'Tamazula de Gordiano',15),(740,'Tapalpa',15),(741,'Tecalitlán',15),(742,'Techaluta de Montenegro',15),(743,'Tecolotlán',15),(744,'Tenamaxtlán',15),(745,'Teocaltiche',15),(746,'Teocuitatlán de Corona',15),(747,'Tepatitlán de Morelos',15),(748,'Tequila',15),(749,'Teuchitlán',15),(750,'Tizapán el Alto',15),(751,'Tlajomulco de Zúñiga',15),(752,'Tlaquepaque',15),(753,'Tolimán',15),(754,'Tomatlán',15),(755,'Tonalá',15),(756,'Tonaya',15),(757,'Tonila',15),(758,'Totatiche',15),(759,'Tototlán',15),(760,'Tuxcacuesco',15),(761,'Tuxcueca',15),(762,'Tuxpan',15),(763,'Unión de San Antonio',15),(764,'Unión de Tula',15),(765,'Valle de Guadalupe',15),(766,'Valle de Juárez',15),(767,'Villa Corona',15),(768,'Villa Guerrero',15),(769,'Villa Hidalgo',15),(770,'Villa Purificación',15),(771,'Yahualica de González Gallo',15),(772,'Zacoalco de Torres',15),(773,'Zapopan',15),(774,'Zapotiltic',15),(775,'Zapotitlán de Vadillo',15),(776,'Zapotlán del Rey',15),(777,'Zapotlán el Grande',15),(778,'Zapotlanejo',15),(779,'Acuitzio',16),(780,'Aguililla',16),(781,'Alvaro Obregón',16),(782,'Angamacutiro',16),(783,'Angangueo',16),(784,'Apatzingán',16),(785,'Aporo',16),(786,'Aquila',16),(787,'Ario',16),(788,'Arteaga',16),(789,'Briseñas',16),(790,'Buenavista',16),(791,'Carácuaro',16),(792,'Charapan',16),(793,'Charo',16),(794,'Chavinda',16),(795,'Cherán',16),(796,'Chilchota',16),(797,'Chinicuila',16),(798,'Chucándiro',16),(799,'Churintzio',16),(800,'Churumuco',16),(801,'Coahuayana',16),(802,'Coalcomán de Vázquez Pallares',16),(803,'Coeneo',16),(804,'Cojumatlán de Régules',16),(805,'Contepec',16),(806,'Copándaro',16),(807,'Cotija',16),(808,'Cuitzeo',16),(809,'Ecuandureo',16),(810,'Epitacio Huerta',16),(811,'Erongarícuaro',16),(812,'Gabriel Zamora',16),(813,'Hidalgo',16),(814,'Huandacareo',16),(815,'Huaniqueo',16),(816,'Huetamo',16),(817,'Huiramba',16),(818,'Indaparapeo',16),(819,'Irimbo',16),(820,'Ixtlán',16),(821,'Jacona',16),(822,'Jiménez',16),(823,'Jiquilpan',16),(824,'José Sixto Verduzco',16),(825,'Juárez',16),(826,'Jungapeo',16),(827,'La Huacana',16),(828,'La Piedad',16),(829,'Lagunillas',16),(830,'Lázaro Cárdenas',16),(831,'Los Reyes',16),(832,'Madero',16),(833,'Maravatío',16),(834,'Marcos Castellanos',16),(835,'Morelia',16),(836,'Morelos',16),(837,'Múgica',16),(838,'Nahuatzen',16),(839,'Nocupétaro',16),(840,'Nuevo Parangaricutiro',16),(841,'Nuevo Urecho',16),(842,'Numarán',16),(843,'Ocampo',16),(844,'Pajacuarán',16),(845,'Panindícuaro',16),(846,'Paracho',16),(847,'Parácuaro',16),(848,'Pátzcuaro',16),(849,'Penjamillo',16),(850,'Peribán',16),(851,'Purépero',16),(852,'Puruándiro',16),(853,'Queréndaro',16),(854,'Quiroga',16),(855,'Sahuayo',16),(856,'Salvador Escalante',16),(857,'San Lucas',16),(858,'Santa Ana Maya',16),(859,'Senguio',16),(860,'Susupuato',16),(861,'Tacámbaro',16),(862,'Tancítaro',16),(863,'Tangamandapio',16),(864,'Tangancícuaro',16),(865,'Tanhuato',16),(866,'Taretan',16),(867,'Tarímbaro',16),(868,'Tepalcatepec',16),(869,'Ting?indín',16),(870,'Tingambato',16),(871,'Tiquicheo de Nicolás Romero',16),(872,'Tlalpujahua',16),(873,'Tlazazalca',16),(874,'Tocumbo',16),(875,'Tumbiscatío',16),(876,'Turicato',16),(877,'Tuxpan',16),(878,'Tuzantla',16),(879,'Tzintzuntzan',16),(880,'Tzitzio',16),(881,'Uruapan',16),(882,'Venustiano Carranza',16),(883,'Villamar',16),(884,'Vista Hermosa',16),(885,'Yurécuaro',16),(886,'Zacapu',16),(887,'Zamora',16),(888,'Zináparo',16),(889,'Zinapécuaro',16),(890,'Ziracuaretiro',16),(891,'Zitácuaro',16),(892,'Amacuzac',17),(893,'Atlatlahucan',17),(894,'Axochiapan',17),(895,'Ayala',17),(896,'Coatlán del Río',17),(897,'Cuautla',17),(898,'Cuernavaca',17),(899,'Emiliano Zapata',17),(900,'Huitzilac',17),(901,'Jantetelco',17),(902,'Jiutepec',17),(903,'Jojutla',17),(904,'Jonacatepec',17),(905,'Mazatepec',17),(906,'Miacatlán',17),(907,'Ocuituco',17),(908,'Puente de Ixtla',17),(909,'Temixco',17),(910,'Temoac',17),(911,'Tepalcingo',17),(912,'Tepoztlán',17),(913,'Tetecala',17),(914,'Tetela del Volcán',17),(915,'Tlalnepantla',17),(916,'Tlaltizapán',17),(917,'Tlaquiltenango',17),(918,'Tlayacapan',17),(919,'Totolapan',17),(920,'Xochitepec',17),(921,'Yautepec',17),(922,'Yecapixtla',17),(923,'Zacatepec de Hidalgo',17),(924,'Zacualpan de Amilpas',17),(925,'Acaponeta',18),(926,'Ahuacatlán',18),(927,'Amatlán de Cañas',18),(928,'Bahía de Banderas',18),(929,'Compostela',18),(930,'Del Nayar',18),(931,'Huajicori',18),(932,'Ixtlán del Río',18),(933,'Jala',18),(934,'La Yesca',18),(935,'Rosamorada',18),(936,'Ruíz',18),(937,'San Blas',18),(938,'San Pedro Lagunillas',18),(939,'Santa María del Oro',18),(940,'Santiago Ixcuintla',18),(941,'Tecuala',18),(942,'Tepic',18),(943,'Tuxpan',18),(944,'Xalisco',18),(945,'Abasolo',19),(946,'Agualeguas',19),(947,'Allende',19),(948,'Anáhuac',19),(949,'Apodaca',19),(950,'Aramberri',19),(951,'Bustamante',19),(952,'Cadereyta Jiménez',19),(953,'Carmen',19),(954,'Cerralvo',19),(955,'China',19),(956,'Ciénega de Flores',19),(957,'Dr. Coss',19),(958,'Dr. Arroyo',19),(959,'Dr. González',19),(960,'Galeana',19),(961,'García',19),(962,'Gral. Escobedo',19),(963,'Gral. Terán',19),(964,'Gral. Treviño',19),(965,'Gral. Zaragoza',19),(966,'Gral. Zuazua',19),(967,'Gral. Bravo',19),(968,'Guadalupe',19),(969,'Hidalgo',19),(970,'Higueras',19),(971,'Hualahuises',19),(972,'Iturbide',19),(973,'Juárez',19),(974,'Lampazos de Naranjo',19),(975,'Linares',19),(976,'Los Aldamas',19),(977,'Los Herreras',19),(978,'Los Ramones',19),(979,'Marín',19),(980,'Melchor Ocampo',19),(981,'Mier y Noriega',19),(982,'Mina',19),(983,'Montemorelos',19),(984,'Monterrey',19),(985,'Parás',19),(986,'Pesquería',19),(987,'Rayones',19),(988,'Sabinas Hidalgo',19),(989,'Salinas Victoria',19),(990,'San Nicolás de los Garza',19),(991,'San Pedro Garza García',19),(992,'Santa Catarina',19),(993,'Santiago',19),(994,'Vallecillo',19),(995,'Villaldama',19),(996,'Abejones',20),(997,'Acatlán de Pérez Figueroa',20),(998,'Animas Trujano',20),(999,'Asunción Cacalotepec',20),(1000,'Asunción Cuyotepeji',20),(1001,'Asunción Ixtaltepec',20),(1002,'Asunción Nochixtlán',20),(1003,'Asunción Ocotlán',20),(1004,'Asunción Tlacolulita',20),(1005,'Ayoquezco de Aldama',20),(1006,'Ayotzintepec',20),(1007,'Calihualá',20),(1008,'Candelaria Loxicha',20),(1009,'Capulálpam de Méndez',20),(1010,'Chahuites',20),(1011,'Chalcatongo de Hidalgo',20),(1012,'Chiquihuitlán de Benito Juárez',20),(1013,'Ciénega de Zimatlán',20),(1014,'Ciudad Ixtepec',20),(1015,'Coatecas Altas',20),(1016,'Coicoyán de las Flores',20),(1017,'Concepción Buenavista',20),(1018,'Concepción Pápalo',20),(1019,'Constancia del Rosario',20),(1020,'Cosolapa',20),(1021,'Cosoltepec',20),(1022,'Cuilápam de Guerrero',20),(1023,'Cuyamecalco Villa de Zaragoza',20),(1024,'El Barrio de la Soledad',20),(1025,'El Espinal',20),(1026,'Eloxochitlán de Flores Magón',20),(1027,'Fresnillo de Trujano',20),(1028,'Guadalupe de Ramírez',20),(1029,'Guadalupe Etla',20),(1030,'Guelatao de Juárez',20),(1031,'Guevea de Humboldt',20),(1032,'Heroica Ciudad de Ejutla de Crespo',20),(1033,'Heroica Ciudad de Huajuapan de Leó',20),(1034,'Heroica Ciudad de Tlaxiaco',20),(1035,'Huautepec',20),(1036,'Huautla de Jiménez',20),(1037,'Ixpantepec Nieves',20),(1038,'Ixtlán de Juárez',20),(1039,'Juchitán de Zaragoza',20),(1040,'La Compañía',20),(1041,'La Pe',20),(1042,'La Reforma',20),(1043,'La Trinidad Vista Hermosa',20),(1044,'Loma Bonita',20),(1045,'Magdalena Apasco',20),(1046,'Magdalena Jaltepec',20),(1047,'Magdalena Mixtepec',20),(1048,'Magdalena Ocotlán',20),(1049,'Magdalena Peñasco',20),(1050,'Magdalena Teitipac',20),(1051,'Magdalena Tequisistlán',20),(1052,'Magdalena Tlacotepec',20),(1053,'Magdalena Yodocono de Porfirio Día',20),(1054,'Magdalena Zahuatlán',20),(1055,'Mariscala de Juárez',20),(1056,'Mártires de Tacubaya',20),(1057,'Matías Romero Avendaño',20),(1058,'Mazatlán Villa de Flores',20),(1059,'Mesones Hidalgo',20),(1060,'Miahuatlán de Porfirio Díaz',20),(1061,'Mixistlán de la Reforma',20),(1062,'Monjas',20),(1063,'Natividad',20),(1064,'Nazareno Etla',20),(1065,'Nejapa de Madero',20),(1066,'Nuevo Zoquiapam',20),(1067,'Oaxaca de Juárez',20),(1068,'Ocotlán de Morelos',20),(1069,'Pinotepa de Don Luis',20),(1070,'Pluma Hidalgo',20),(1071,'Putla Villa de Guerrero',20),(1072,'Reforma de Pineda',20),(1073,'Reyes Etla',20),(1074,'Rojas de Cuauhtémoc',20),(1075,'Salina Cruz',20),(1076,'San Agustín Amatengo',20),(1077,'San Agustín Atenango',20),(1078,'San Agustín Chayuco',20),(1079,'San Agustín de las Juntas',20),(1080,'San Agustín Etla',20),(1081,'San Agustín Loxicha',20),(1082,'San Agustín Tlacotepec',20),(1083,'San Agustín Yatareni',20),(1084,'San Andrés Cabecera Nueva',20),(1085,'San Andrés Dinicuiti',20),(1086,'San Andrés Huaxpaltepec',20),(1087,'San Andrés Huayapam',20),(1088,'San Andrés Ixtlahuaca',20),(1089,'San Andrés Lagunas',20),(1090,'San Andrés Nuxiño',20),(1091,'San Andrés Paxtlán',20),(1092,'San Andrés Sinaxtla',20),(1093,'San Andrés Solaga',20),(1094,'San Andrés Teotilalpam',20),(1095,'San Andrés Tepetlapa',20),(1096,'San Andrés Yaá',20),(1097,'San Andrés Zabache',20),(1098,'San Andrés Zautla',20),(1099,'San Antonino Castillo Velasco',20),(1100,'San Antonino el Alto',20),(1101,'San Antonino Monte Verde',20),(1102,'San Antonio Acutla',20),(1103,'San Antonio de la Cal',20),(1104,'San Antonio Huitepec',20),(1105,'San Antonio Nanahuatípam',20),(1106,'San Antonio Sinicahua',20),(1107,'San Antonio Tepetlapa',20),(1108,'San Baltazar Chichicápam',20),(1109,'San Baltazar Loxicha',20),(1110,'San Baltazar Yatzachi el Bajo',20),(1111,'San Bartolo Coyotepec',20),(1112,'San Bartolo Soyaltepec',20),(1113,'San Bartolo Yautepec',20),(1114,'San Bartolomé Ayautla',20),(1115,'San Bartolomé Loxicha',20),(1116,'San Bartolomé Quialana',20),(1117,'San Bartolomé Yucuañe',20),(1118,'San Bartolomé Zoogocho',20),(1119,'San Bernardo Mixtepec',20),(1120,'San Blas Atempa',20),(1121,'San Carlos Yautepec',20),(1122,'San Cristóbal Amatlán',20),(1123,'San Cristóbal Amoltepec',20),(1124,'San Cristóbal Lachirioag',20),(1125,'San Cristóbal Suchixtlahuaca',20),(1126,'San Dionisio del Mar',20),(1127,'San Dionisio Ocotepec',20),(1128,'San Dionisio Ocotlán',20),(1129,'San Esteban Atatlahuca',20),(1130,'San Felipe Jalapa de Díaz',20),(1131,'San Felipe Tejalapam',20),(1132,'San Felipe Usila',20),(1133,'San Francisco Cahuacuá',20),(1134,'San Francisco Cajonos',20),(1135,'San Francisco Chapulapa',20),(1136,'San Francisco Chindúa',20),(1137,'San Francisco del Mar',20),(1138,'San Francisco Huehuetlán',20),(1139,'San Francisco Ixhuatán',20),(1140,'San Francisco Jaltepetongo',20),(1141,'San Francisco Lachigoló',20),(1142,'San Francisco Logueche',20),(1143,'San Francisco Nuxaño',20),(1144,'San Francisco Ozolotepec',20),(1145,'San Francisco Sola',20),(1146,'San Francisco Telixtlahuaca',20),(1147,'San Francisco Teopan',20),(1148,'San Francisco Tlapancingo',20),(1149,'San Gabriel Mixtepec',20),(1150,'San Ildefonso Amatlán',20),(1151,'San Ildefonso Sola',20),(1152,'San Ildefonso Villa Alta',20),(1153,'San Jacinto Amilpas',20),(1154,'San Jacinto Tlacotepec',20),(1155,'San Jerónimo Coatlán',20),(1156,'San Jerónimo Silacayoapilla',20),(1157,'San Jerónimo Sosola',20),(1158,'San Jerónimo Taviche',20),(1159,'San Jerónimo Tecoátl',20),(1160,'San Jerónimo Tlacochahuaya',20),(1161,'San Jorge Nuchita',20),(1162,'San José Ayuquila',20),(1163,'San José Chiltepec',20),(1164,'San José del Peñasco',20),(1165,'San José del Progreso',20),(1166,'San José Estancia Grande',20),(1167,'San José Independencia',20),(1168,'San José Lachiguiri',20),(1169,'San José Tenango',20),(1170,'San Juan ?umí',20),(1171,'San Juan Achiutla',20),(1172,'San Juan Atepec',20),(1173,'San Juan Bautista Atatlahuca',20),(1174,'San Juan Bautista Coixtlahuaca',20),(1175,'San Juan Bautista Cuicatlán',20),(1176,'San Juan Bautista Guelache',20),(1177,'San Juan Bautista Jayacatlán',20),(1178,'San Juan Bautista Lo de Soto',20),(1179,'San Juan Bautista Suchitepec',20),(1180,'San Juan Bautista Tlachichilco',20),(1181,'San Juan Bautista Tlacoatzintepec',20),(1182,'San Juan Bautista Tuxtepec',20),(1183,'San Juan Bautista Valle Nacional',20),(1184,'San Juan Cacahuatepec',20),(1185,'San Juan Chicomezúchil',20),(1186,'San Juan Chilateca',20),(1187,'San Juan Cieneguilla',20),(1188,'San Juan Coatzóspam',20),(1189,'San Juan Colorado',20),(1190,'San Juan Comaltepec',20),(1191,'San Juan Cotzocón',20),(1192,'San Juan de los Cués',20),(1193,'San Juan del Estado',20),(1194,'San Juan del Río',20),(1195,'San Juan Diuxi',20),(1196,'San Juan Evangelista Analco',20),(1197,'San Juan Guelavía',20),(1198,'San Juan Guichicovi',20),(1199,'San Juan Ihualtepec',20),(1200,'San Juan Juquila Mixes',20),(1201,'San Juan Juquila Vijanos',20),(1202,'San Juan Lachao',20),(1203,'San Juan Lachigalla',20),(1204,'San Juan Lajarcia',20),(1205,'San Juan Lalana',20),(1206,'San Juan Mazatlán',20),(1207,'San Juan Mixtepec',20),(1208,'San Juan Mixtepec',20),(1209,'San Juan Ozolotepec',20),(1210,'San Juan Petlapa',20),(1211,'San Juan Quiahije',20),(1212,'San Juan Quiotepec',20),(1213,'San Juan Sayultepec',20),(1214,'San Juan Tabaá',20),(1215,'San Juan Tamazola',20),(1216,'San Juan Teita',20),(1217,'San Juan Teitipac',20),(1218,'San Juan Tepeuxila',20),(1219,'San Juan Teposcolula',20),(1220,'San Juan Yaeé',20),(1221,'San Juan Yatzona',20),(1222,'San Juan Yucuita',20),(1223,'San Lorenzo',20),(1224,'San Lorenzo Albarradas',20),(1225,'San Lorenzo Cacaotepec',20),(1226,'San Lorenzo Cuaunecuiltitla',20),(1227,'San Lorenzo Texmelucan',20),(1228,'San Lorenzo Victoria',20),(1229,'San Lucas Camotlán',20),(1230,'San Lucas Ojitlán',20),(1231,'San Lucas Quiaviní',20),(1232,'San Lucas Zoquiápam',20),(1233,'San Luis Amatlán',20),(1234,'San Marcial Ozolotepec',20),(1235,'San Marcos Arteaga',20),(1236,'San Martín de los Cansecos',20),(1237,'San Martín Huamelúlpam',20),(1238,'San Martín Itunyoso',20),(1239,'San Martín Lachilá',20),(1240,'San Martín Peras',20),(1241,'San Martín Tilcajete',20),(1242,'San Martín Toxpalan',20),(1243,'San Martín Zacatepec',20),(1244,'San Mateo Cajonos',20),(1245,'San Mateo del Mar',20),(1246,'San Mateo Etlatongo',20),(1247,'San Mateo Nejápam',20),(1248,'San Mateo Peñasco',20),(1249,'San Mateo Piñas',20),(1250,'San Mateo Río Hondo',20),(1251,'San Mateo Sindihui',20),(1252,'San Mateo Tlapiltepec',20),(1253,'San Mateo Yoloxochitlán',20),(1254,'San Melchor Betaza',20),(1255,'San Miguel Achiutla',20),(1256,'San Miguel Ahuehuetitlán',20),(1257,'San Miguel Aloápam',20),(1258,'San Miguel Amatitlán',20),(1259,'San Miguel Amatlán',20),(1260,'San Miguel Chicahua',20),(1261,'San Miguel Chimalapa',20),(1262,'San Miguel Coatlán',20),(1263,'San Miguel del Puerto',20),(1264,'San Miguel del Río',20),(1265,'San Miguel Ejutla',20),(1266,'San Miguel el Grande',20),(1267,'San Miguel Huautla',20),(1268,'San Miguel Mixtepec',20),(1269,'San Miguel Panixtlahuaca',20),(1270,'San Miguel Peras',20),(1271,'San Miguel Piedras',20),(1272,'San Miguel Quetzaltepec',20),(1273,'San Miguel Santa Flor',20),(1274,'San Miguel Soyaltepec',20),(1275,'San Miguel Suchixtepec',20),(1276,'San Miguel Tecomatlán',20),(1277,'San Miguel Tenango',20),(1278,'San Miguel Tequixtepec',20),(1279,'San Miguel Tilquiápam',20),(1280,'San Miguel Tlacamama',20),(1281,'San Miguel Tlacotepec',20),(1282,'San Miguel Tulancingo',20),(1283,'San Miguel Yotao',20),(1284,'San Nicolás',20),(1285,'San Nicolás Hidalgo',20),(1286,'San Pablo Coatlán',20),(1287,'San Pablo Cuatro Venados',20),(1288,'San Pablo Etla',20),(1289,'San Pablo Huitzo',20),(1290,'San Pablo Huixtepec',20),(1291,'San Pablo Macuiltianguis',20),(1292,'San Pablo Tijaltepec',20),(1293,'San Pablo Villa de Mitla',20),(1294,'San Pablo Yaganiza',20),(1295,'San Pedro Amuzgos',20),(1296,'San Pedro Apóstol',20),(1297,'San Pedro Atoyac',20),(1298,'San Pedro Cajonos',20),(1299,'San Pedro Comitancillo',20),(1300,'San Pedro Coxcaltepec Cántaros',20),(1301,'San Pedro el Alto',20),(1302,'San Pedro Huamelula',20),(1303,'San Pedro Huilotepec',20),(1304,'San Pedro Ixcatlán',20),(1305,'San Pedro Ixtlahuaca',20),(1306,'San Pedro Jaltepetongo',20),(1307,'San Pedro Jicayán',20),(1308,'San Pedro Jocotipac',20),(1309,'San Pedro Juchatengo',20),(1310,'San Pedro Mártir',20),(1311,'San Pedro Mártir Quiechapa',20),(1312,'San Pedro Mártir Yucuxaco',20),(1313,'San Pedro Mixtepec',20),(1314,'San Pedro Mixtepec',20),(1315,'San Pedro Molinos',20),(1316,'San Pedro Nopala',20),(1317,'San Pedro Ocopetatillo',20),(1318,'San Pedro Ocotepec',20),(1319,'San Pedro Pochutla',20),(1320,'San Pedro Quiatoni',20),(1321,'San Pedro Sochiapam',20),(1322,'San Pedro Tapanatepec',20),(1323,'San Pedro Taviche',20),(1324,'San Pedro Teozacoalco',20),(1325,'San Pedro Teutila',20),(1326,'San Pedro Tidaá',20),(1327,'San Pedro Topiltepec',20),(1328,'San Pedro Totolapa',20),(1329,'San Pedro y San Pablo Ayutla',20),(1330,'San Pedro y San Pablo Teposcolula',20),(1331,'San Pedro y San Pablo Tequixtepec',20),(1332,'San Pedro Yaneri',20),(1333,'San Pedro Yólox',20),(1334,'San Pedro Yucunama',20),(1335,'San Raymundo Jalpan',20),(1336,'San Sebastián Abasolo',20),(1337,'San Sebastián Coatlán',20),(1338,'San Sebastián Ixcapa',20),(1339,'San Sebastián Nicananduta',20),(1340,'San Sebastián Río Hondo',20),(1341,'San Sebastián Tecomaxtlahuaca',20),(1342,'San Sebastián Teitipac',20),(1343,'San Sebastián Tutla',20),(1344,'San Simón Almolongas',20),(1345,'San Simón Zahuatlán',20),(1346,'San Vicente Coatlán',20),(1347,'San Vicente Lachixío',20),(1348,'San Vicente Nuñú',20),(1349,'Santa Ana',20),(1350,'Santa Ana Ateixtlahuaca',20),(1351,'Santa Ana Cuauhtémoc',20),(1352,'Santa Ana del Valle',20),(1353,'Santa Ana Tavela',20),(1354,'Santa Ana Tlapacoyan',20),(1355,'Santa Ana Yareni',20),(1356,'Santa Ana Zegache',20),(1357,'Santa Catalina Quierí',20),(1358,'Santa Catarina Cuixtla',20),(1359,'Santa Catarina Ixtepeji',20),(1360,'Santa Catarina Juquila',20),(1361,'Santa Catarina Lachatao',20),(1362,'Santa Catarina Loxicha',20),(1363,'Santa Catarina Mechoacán',20),(1364,'Santa Catarina Minas',20),(1365,'Santa Catarina Quiané',20),(1366,'Santa Catarina Quioquitani',20),(1367,'Santa Catarina Tayata',20),(1368,'Santa Catarina Ticuá',20),(1369,'Santa Catarina Yosonotú',20),(1370,'Santa Catarina Zapoquila',20),(1371,'Santa Cruz Acatepec',20),(1372,'Santa Cruz Amilpas',20),(1373,'Santa Cruz de Bravo',20),(1374,'Santa Cruz Itundujia',20),(1375,'Santa Cruz Mixtepec',20),(1376,'Santa Cruz Nundaco',20),(1377,'Santa Cruz Papalutla',20),(1378,'Santa Cruz Tacache de Mina',20),(1379,'Santa Cruz Tacahua',20),(1380,'Santa Cruz Tayata',20),(1381,'Santa Cruz Xitla',20),(1382,'Santa Cruz Xoxocotlán',20),(1383,'Santa Cruz Zenzontepec',20),(1384,'Santa Gertrudis',20),(1385,'Santa Inés de Zaragoza',20),(1386,'Santa Inés del Monte',20),(1387,'Santa Inés Yatzeche',20),(1388,'Santa Lucía del Camino',20),(1389,'Santa Lucía Miahuatlán',20),(1390,'Santa Lucía Monteverde',20),(1391,'Santa Lucía Ocotlán',20),(1392,'Santa Magdalena Jicotlán',20),(1393,'Santa María Alotepec',20),(1394,'Santa María Apazco',20),(1395,'Santa María Atzompa',20),(1396,'Santa María Camotlán',20),(1397,'Santa María Chachoápam',20),(1398,'Santa María Chilchotla',20),(1399,'Santa María Chimalapa',20),(1400,'Santa María Colotepec',20),(1401,'Santa María Cortijo',20),(1402,'Santa María Coyotepec',20),(1403,'Santa María del Rosario',20),(1404,'Santa María del Tule',20),(1405,'Santa María Ecatepec',20),(1406,'Santa María Guelacé',20),(1407,'Santa María Guienagati',20),(1408,'Santa María Huatulco',20),(1409,'Santa María Huazolotitlán',20),(1410,'Santa María Ipalapa',20),(1411,'Santa María Ixcatlán',20),(1412,'Santa María Jacatepec',20),(1413,'Santa María Jalapa del Marqués',20),(1414,'Santa María Jaltianguis',20),(1415,'Santa María la Asunción',20),(1416,'Santa María Lachixío',20),(1417,'Santa María Mixtequilla',20),(1418,'Santa María Nativitas',20),(1419,'Santa María Nduayaco',20),(1420,'Santa María Ozolotepec',20),(1421,'Santa María Pápalo',20),(1422,'Santa María Peñoles',20),(1423,'Santa María Petapa',20),(1424,'Santa María Quiegolani',20),(1425,'Santa María Sola',20),(1426,'Santa María Tataltepec',20),(1427,'Santa María Tecomavaca',20),(1428,'Santa María Temaxcalapa',20),(1429,'Santa María Temaxcaltepec',20),(1430,'Santa María Teopoxco',20),(1431,'Santa María Tepantlali',20),(1432,'Santa María Texcatitlán',20),(1433,'Santa María Tlahuitoltepec',20),(1434,'Santa María Tlalixtac',20),(1435,'Santa María Tonameca',20),(1436,'Santa María Totolapilla',20),(1437,'Santa María Xadani',20),(1438,'Santa María Yalina',20),(1439,'Santa María Yavesía',20),(1440,'Santa María Yolotepec',20),(1441,'Santa María Yosoyúa',20),(1442,'Santa María Yucuhiti',20),(1443,'Santa María Zacatepec',20),(1444,'Santa María Zaniza',20),(1445,'Santa María Zoquitlán',20),(1446,'Santiago Amoltepec',20),(1447,'Santiago Apoala',20),(1448,'Santiago Apóstol',20),(1449,'Santiago Astata',20),(1450,'Santiago Atitlán',20),(1451,'Santiago Ayuquililla',20),(1452,'Santiago Cacaloxtepec',20),(1453,'Santiago Camotlán',20),(1454,'Santiago Chazumba',20),(1455,'Santiago Choapam',20),(1456,'Santiago Comaltepec',20),(1457,'Santiago del Río',20),(1458,'Santiago Huajolotitlán',20),(1459,'Santiago Huauclilla',20),(1460,'Santiago Ihuitlán Plumas',20),(1461,'Santiago Ixcuintepec',20),(1462,'Santiago Ixtayutla',20),(1463,'Santiago Jamiltepec',20),(1464,'Santiago Jocotepec',20),(1465,'Santiago Juxtlahuaca',20),(1466,'Santiago Lachiguiri',20),(1467,'Santiago Lalopa',20),(1468,'Santiago Laollaga',20),(1469,'Santiago Laxopa',20),(1470,'Santiago Llano Grande',20),(1471,'Santiago Matatlán',20),(1472,'Santiago Miltepec',20),(1473,'Santiago Minas',20),(1474,'Santiago Nacaltepec',20),(1475,'Santiago Nejapilla',20),(1476,'Santiago Niltepec',20),(1477,'Santiago Nundiche',20),(1478,'Santiago Nuyoó',20),(1479,'Santiago Pinotepa Nacional',20),(1480,'Santiago Suchilquitongo',20),(1481,'Santiago Tamazola',20),(1482,'Santiago Tapextla',20),(1483,'Santiago Tenango',20),(1484,'Santiago Tepetlapa',20),(1485,'Santiago Tetepec',20),(1486,'Santiago Texcalcingo',20),(1487,'Santiago Textitlán',20),(1488,'Santiago Tilantongo',20),(1489,'Santiago Tillo',20),(1490,'Santiago Tlazoyaltepec',20),(1491,'Santiago Xanica',20),(1492,'Santiago Xiacuí',20),(1493,'Santiago Yaitepec',20),(1494,'Santiago Yaveo',20),(1495,'Santiago Yolomécatl',20),(1496,'Santiago Yosondúa',20),(1497,'Santiago Yucuyachi',20),(1498,'Santiago Zacatepec',20),(1499,'Santiago Zoochila',20),(1500,'Santo Domingo Albarradas',20),(1501,'Santo Domingo Armenta',20),(1502,'Santo Domingo Chihuitán',20),(1503,'Santo Domingo de Morelos',20),(1504,'Santo Domingo Ingenio',20),(1505,'Santo Domingo Ixcatlán',20),(1506,'Santo Domingo Nuxaá',20),(1507,'Santo Domingo Ozolotepec',20),(1508,'Santo Domingo Petapa',20),(1509,'Santo Domingo Roayaga',20),(1510,'Santo Domingo Tehuantepec',20),(1511,'Santo Domingo Teojomulco',20),(1512,'Santo Domingo Tepuxtepec',20),(1513,'Santo Domingo Tlatayápam',20),(1514,'Santo Domingo Tomaltepec',20),(1515,'Santo Domingo Tonalá',20),(1516,'Santo Domingo Tonaltepec',20),(1517,'Santo Domingo Xagacía',20),(1518,'Santo Domingo Yanhuitlán',20),(1519,'Santo Domingo Yodohino',20),(1520,'Santo Domingo Zanatepec',20),(1521,'Santo Tomás Jalieza',20),(1522,'Santo Tomás Mazaltepec',20),(1523,'Santo Tomás Ocotepec',20),(1524,'Santo Tomás Tamazulapan',20),(1525,'Santos Reyes Nopala',20),(1526,'Santos Reyes Pápalo',20),(1527,'Santos Reyes Tepejillo',20),(1528,'Santos Reyes Yucuná',20),(1529,'Silacayoápam',20),(1530,'Sitio de Xitlapehua',20),(1531,'Soledad Etla',20),(1532,'Tamazulapam del Espíritu Santo',20),(1533,'Tanetze de Zaragoza',20),(1534,'Taniche',20),(1535,'Tataltepec de Valdés',20),(1536,'Teococuilco de Marcos Pérez',20),(1537,'Teotitlán de Flores Magón',20),(1538,'Teotitlán del Valle',20),(1539,'Teotongo',20),(1540,'Tepelmeme Villa de Morelos',20),(1541,'Tezoatlán de Segura y Luna',20),(1542,'Tlacolula de Matamoros',20),(1543,'Tlacotepec Plumas',20),(1544,'Tlalixtac de Cabrera',20),(1545,'Totontepec Villa de Morelos',20),(1546,'Trinidad Zaachila',20),(1547,'Unión Hidalgo',20),(1548,'Valerio Trujano',20),(1549,'Villa de Chilapa de Díaz',20),(1550,'Villa de Etla',20),(1551,'Villa de Tamazulápam del Progreso',20),(1552,'Villa de Tututepec de Melchor Ocam',20),(1553,'Villa de Zaachila',20),(1554,'Villa Díaz Ordaz',20),(1555,'Villa Hidalgo',20),(1556,'Villa Sola de Vega',20),(1557,'Villa Talea de Castro',20),(1558,'Villa Tejúpam de la Unión',20),(1559,'Yaxe',20),(1560,'Yogana',20),(1561,'Yutanduchi de Guerrero',20),(1562,'Zapotitlán del Río',20),(1563,'Zapotitlán Lagunas',20),(1564,'Zapotitlán Palmas',20),(1565,'Zimatlán de Alvarez',20),(1566,'Acajete',21),(1567,'Acateno',21),(1568,'Acatlán',21),(1569,'Acatzingo',21),(1570,'Acteopan',21),(1571,'Ahuacatlán',21),(1572,'Ahuatlán',21),(1573,'Ahuazotepec',21),(1574,'Ahuehuetitla',21),(1575,'Ajalpan',21),(1576,'Albino Zertuche',21),(1577,'Aljojuca',21),(1578,'Altepexi',21),(1579,'Amixtlán',21),(1580,'Amozoc',21),(1581,'Aquixtla',21),(1582,'Atempan',21),(1583,'Atexcal',21),(1584,'Atlequizayan',21),(1585,'Atlixco',21),(1586,'Atoyatempan',21),(1587,'Atzala',21),(1588,'Atzitzihuacán',21),(1589,'Atzitzintla',21),(1590,'Axutla',21),(1591,'Ayotoxco de Guerrero',21),(1592,'Calpan',21),(1593,'Caltepec',21),(1594,'Camocuautla',21),(1595,'Cañada Morelos',21),(1596,'Caxhuacan',21),(1597,'Chalchicomula de Sesma',21),(1598,'Chapulco',21),(1599,'Chiautla',21),(1600,'Chiautzingo',21),(1601,'Chichiquila',21),(1602,'Chiconcuautla',21),(1603,'Chietla',21),(1604,'Chigmecatitlán',21),(1605,'Chignahuapan',21),(1606,'Chignautla',21),(1607,'Chila',21),(1608,'Chila de la Sal',21),(1609,'Chilchotla',21),(1610,'Chinantla',21),(1611,'Coatepec',21),(1612,'Coatzingo',21),(1613,'Cohetzala',21),(1614,'Cohuecán',21),(1615,'Coronango',21),(1616,'Coxcatlán',21),(1617,'Coyomeapan',21),(1618,'Coyotepec',21),(1619,'Cuapiaxtla de Madero',21),(1620,'Cuautempan',21),(1621,'Cuautinchán',21),(1622,'Cuautlancingo',21),(1623,'Cuayuca de Andrade',21),(1624,'Cuetzalan del Progreso',21),(1625,'Cuyoaco',21),(1626,'Domingo Arenas',21),(1627,'Eloxochitlán',21),(1628,'Epatlán',21),(1629,'Esperanza',21),(1630,'Francisco Z. Mena',21),(1631,'General Felipe ?ngeles',21),(1632,'Guadalupe',21),(1633,'Guadalupe Victoria',21),(1634,'Hermenegildo Galeana',21),(1635,'Honey',21),(1636,'Huaquechula',21),(1637,'Huatlatlauca',21),(1638,'Huauchinango',21),(1639,'Huehuetla',21),(1640,'Huehuetlán el Chico',21),(1641,'Huehuetlán el Grande',21),(1642,'Huejotzingo',21),(1643,'Hueyapan',21),(1644,'Hueytamalco',21),(1645,'Hueytlalpan',21),(1646,'Huitzilan de Serdán',21),(1647,'Huitziltepec',21),(1648,'Ixcamilpa de Guerrero',21),(1649,'Ixcaquixtla',21),(1650,'Ixtacamaxtitlán',21),(1651,'Ixtepec',21),(1652,'Izúcar de Matamoros',21),(1653,'Jalpan',21),(1654,'Jolalpan',21),(1655,'Jonotla',21),(1656,'Jopala',21),(1657,'Juan C. Bonilla',21),(1658,'Juan Galindo',21),(1659,'Juan N. Méndez',21),(1660,'La Magdalena Tlatlauquitepec',21),(1661,'Lafragua',21),(1662,'Libres',21),(1663,'Los Reyes de Juárez',21),(1664,'Mazapiltepec de Juárez',21),(1665,'Mixtla',21),(1666,'Molcaxac',21),(1667,'Naupan',21),(1668,'Nauzontla',21),(1669,'Nealtican',21),(1670,'Nicolás Bravo',21),(1671,'Nopalucan',21),(1672,'Ocotepec',21),(1673,'Ocoyucan',21),(1674,'Olintla',21),(1675,'Oriental',21),(1676,'Pahuatlán',21),(1677,'Palmar de Bravo',21),(1678,'Pantepec',21),(1679,'Petlalcingo',21),(1680,'Piaxtla',21),(1681,'Puebla',21),(1682,'Quecholac',21),(1683,'Quimixtlán',21),(1684,'Rafael Lara Grajales',21),(1685,'San Andrés Cholula',21),(1686,'San Antonio Cañada',21),(1687,'San Diego la Mesa Tochimiltzingo',21),(1688,'San Felipe Teotlalcingo',21),(1689,'San Felipe Tepatlán',21),(1690,'San Gabriel Chilac',21),(1691,'San Gregorio Atzompa',21),(1692,'San Jerónimo Tecuanipan',21),(1693,'San Jerónimo Xayacatlán',21),(1694,'San José Chiapa',21),(1695,'San José Miahuatlán',21),(1696,'San Juan Atenco',21),(1697,'San Juan Atzompa',21),(1698,'San Martín Texmelucan',21),(1699,'San Martín Totoltepec',21),(1700,'San Matías Tlalancaleca',21),(1701,'San Miguel Ixitlán',21),(1702,'San Miguel Xoxtla',21),(1703,'San Nicolás Buenos Aires',21),(1704,'San Nicolás de los Ranchos',21),(1705,'San Pablo Anicano',21),(1706,'San Pedro Cholula',21),(1707,'San Pedro Yeloixtlahuaca',21),(1708,'San Salvador el Seco',21),(1709,'San Salvador el Verde',21),(1710,'San Salvador Huixcolotla',21),(1711,'San Sebastián Tlacotepec',21),(1712,'Santa Catarina Tlaltempan',21),(1713,'Santa Inés Ahuatempan',21),(1714,'Santa Isabel Cholula',21),(1715,'Santiago Miahuatlán',21),(1716,'Santo Tomás Hueyotlipan',21),(1717,'Soltepec',21),(1718,'Tecali de Herrera',21),(1719,'Tecamachalco',21),(1720,'Tecomatlán',21),(1721,'Tehuacán',21),(1722,'Tehuitzingo',21),(1723,'Tenampulco',21),(1724,'Teopantlán',21),(1725,'Teotlalco',21),(1726,'Tepanco de López',21),(1727,'Tepango de Rodríguez',21),(1728,'Tepatlaxco de Hidalgo',21),(1729,'Tepeaca',21),(1730,'Tepemaxalco',21),(1731,'Tepeojuma',21),(1732,'Tepetzintla',21),(1733,'Tepexco',21),(1734,'Tepexi de Rodríguez',21),(1735,'Tepeyahualco',21),(1736,'Tepeyahualco de Cuauhtémoc',21),(1737,'Tetela de Ocampo',21),(1738,'Teteles de Avila Castillo',21),(1739,'Teziutlán',21),(1740,'Tianguismanalco',21),(1741,'Tilapa',21),(1742,'Tlachichuca',21),(1743,'Tlacotepec de Benito Juárez',21),(1744,'Tlacuilotepec',21),(1745,'Tlahuapan',21),(1746,'Tlaltenango',21),(1747,'Tlanepantla',21),(1748,'Tlaola',21),(1749,'Tlapacoya',21),(1750,'Tlapanalá',21),(1751,'Tlatlauquitepec',21),(1752,'Tlaxco',21),(1753,'Tochimilco',21),(1754,'Tochtepec',21),(1755,'Totoltepec de Guerrero',21),(1756,'Tulcingo',21),(1757,'Tuzamapan de Galeana',21),(1758,'Tzicatlacoyan',21),(1759,'Venustiano Carranza',21),(1760,'Vicente Guerrero',21),(1761,'Xayacatlán de Bravo',21),(1762,'Xicotepec',21),(1763,'Xicotlán',21),(1764,'Xiutetelco',21),(1765,'Xochiapulco',21),(1766,'Xochiltepec',21),(1767,'Xochitlán de Vicente Suárez',21),(1768,'Xochitlán Todos Santos',21),(1769,'Yaonáhuac',21),(1770,'Yehualtepec',21),(1771,'Zacapala',21),(1772,'Zacapoaxtla',21),(1773,'Zacatlán',21),(1774,'Zapotitlán',21),(1775,'Zapotitlán de Méndez',21),(1776,'Zaragoza',21),(1777,'Zautla',21),(1778,'Zihuateutla',21),(1779,'Zinacatepec',21),(1780,'Zongozotla',21),(1781,'Zoquiapan',21),(1782,'Zoquitlán',21),(1783,'Amealco de Bonfil',22),(1784,'Arroyo Seco',22),(1785,'Cadereyta de Montes',22),(1786,'Colón',22),(1787,'Corregidora',22),(1788,'El Marqués',22),(1789,'Ezequiel Montes',22),(1790,'Huimilpan',22),(1791,'Jalpan de Serra',22),(1792,'Landa de Matamoros',22),(1793,'Pedro Escobedo',22),(1794,'Peñamiller',22),(1795,'Pinal de Amoles',22),(1796,'Querétaro',22),(1797,'San Joaquín',22),(1798,'San Juan del Río',22),(1799,'Tequisquiapan',22),(1800,'Tolimán',22),(1801,'Benito Juárez',23),(1802,'Cozumel',23),(1803,'Felipe Carrillo Puerto',23),(1804,'Isla Mujeres',23),(1805,'José María Morelos',23),(1806,'Lázaro Cárdenas',23),(1807,'Othón P. Blanco',23),(1808,'Solidaridad',23),(1809,'Ahualulco',24),(1810,'Alaquines',24),(1811,'Aquismón',24),(1812,'Armadillo de los Infante',24),(1813,'Axtla de Terrazas',24),(1814,'Cárdenas',24),(1815,'Catorce',24),(1816,'Cedral',24),(1817,'Cerritos',24),(1818,'Cerro de San Pedro',24),(1819,'Charcas',24),(1820,'Ciudad del Maíz',24),(1821,'Ciudad Fernández',24),(1822,'Ciudad Valles',24),(1823,'Coxcatlán',24),(1824,'Ebano',24),(1825,'El Naranjo',24),(1826,'Guadalcázar',24),(1827,'Huehuetlán',24),(1828,'Lagunillas',24),(1829,'Matehuala',24),(1830,'Matlapa',24),(1831,'Mexquitic de Carmona',24),(1832,'Moctezuma',24),(1833,'Rayón',24),(1834,'Rioverde',24),(1835,'Salinas',24),(1836,'San Antonio',24),(1837,'San Ciro de Acosta',24),(1838,'San Luis Potosí',24),(1839,'San Martín Chalchicuautla',24),(1840,'San Nicolás Tolentino',24),(1841,'San Vicente Tancuayalab',24),(1842,'Santa Catarina',24),(1843,'Santa María del Río',24),(1844,'Santo Domingo',24),(1845,'Soledad de Graciano Sánchez',24),(1846,'Tamasopo',24),(1847,'Tamazunchale',24),(1848,'Tampacán',24),(1849,'Tampamolón Corona',24),(1850,'Tamuín',24),(1851,'Tancanhuitz',24),(1852,'Tanlajás',24),(1853,'Tanquián de Escobedo',24),(1854,'Tierra Nueva',24),(1855,'Vanegas',24),(1856,'Venado',24),(1857,'Villa de Arista',24),(1858,'Villa de Arriaga',24),(1859,'Villa de Guadalupe',24),(1860,'Villa de la Paz',24),(1861,'Villa de Ramos',24),(1862,'Villa de Reyes',24),(1863,'Villa Hidalgo',24),(1864,'Villa Juárez',24),(1865,'Xilitla',24),(1866,'Zaragoza',24),(1867,'Ahome',25),(1868,'Angostura',25),(1869,'Badiraguato',25),(1870,'Choix',25),(1871,'Concordia',25),(1872,'Cosalá',25),(1873,'Culiacán',25),(1874,'El Fuerte',25),(1875,'Elota',25),(1876,'Escuinapa',25),(1877,'Guasave',25),(1878,'Mazatlán',25),(1879,'Mocorito',25),(1880,'Navolato',25),(1881,'Rosario',25),(1882,'Salvador Alvarado',25),(1883,'San Ignacio',25),(1884,'Sinaloa',25),(1885,'Aconchi',26),(1886,'Agua Prieta',26),(1887,'Alamos',26),(1888,'Altar',26),(1889,'Arivechi',26),(1890,'Arizpe',26),(1891,'Atil',26),(1892,'Bacadéhuachi',26),(1893,'Bacanora',26),(1894,'Bacerac',26),(1895,'Bacoachi',26),(1896,'Bácum',26),(1897,'Banámichi',26),(1898,'Baviácora',26),(1899,'Bavispe',26),(1900,'Benito Juárez',26),(1901,'Benjamín Hill',26),(1902,'Caborca',26),(1903,'Cajeme',26),(1904,'Cananea',26),(1905,'Carbó',26),(1906,'Cucurpe',26),(1907,'Cumpas',26),(1908,'Divisaderos',26),(1909,'Empalme',26),(1910,'Etchojoa',26),(1911,'Fronteras',26),(1912,'General Plutarco Elías Calles',26),(1913,'Granados',26),(1914,'Guaymas',26),(1915,'Hermosillo',26),(1916,'Heroica Nogales',26),(1917,'Huachinera',26),(1918,'Huásabas',26),(1919,'Huatabampo',26),(1920,'Huépac',26),(1921,'Imuris',26),(1922,'La Colorada',26),(1923,'Magdalena',26),(1924,'Mazatán',26),(1925,'Moctezuma',26),(1926,'Naco',26),(1927,'Nácori Chico',26),(1928,'Nacozari de García',26),(1929,'Navojoa',26),(1930,'Onavas',26),(1931,'Opodepe',26),(1932,'Oquitoa',26),(1933,'Pitiquito',26),(1934,'Puerto Peñasco',26),(1935,'Quiriego',26),(1936,'Rayón',26),(1937,'Rosario',26),(1938,'Sahuaripa',26),(1939,'San Felipe de Jesús',26),(1940,'San Ignacio Río Muerto',26),(1941,'San Javier',26),(1942,'San Luis Río Colorado',26),(1943,'San Miguel de Horcasitas',26),(1944,'San Pedro de la Cueva',26),(1945,'Santa Ana',26),(1946,'Santa Cruz',26),(1947,'Sáric',26),(1948,'Soyopa',26),(1949,'Suaqui Grande',26),(1950,'Tepache',26),(1951,'Trincheras',26),(1952,'Tubutama',26),(1953,'Ures',26),(1954,'Villa Hidalgo',26),(1955,'Villa Pesqueira',26),(1956,'Yécora',26),(1957,'Balancán',27),(1958,'Cárdenas',27),(1959,'Centla',27),(1960,'Centro',27),(1961,'Comalcalco',27),(1962,'Cunduacán',27),(1963,'Emiliano Zapata',27),(1964,'Huimanguillo',27),(1965,'Jalapa',27),(1966,'Jalpa de Méndez',27),(1967,'Jonuta',27),(1968,'Macuspana',27),(1969,'Nacajuca',27),(1970,'Paraíso',27),(1971,'Tacotalpa',27),(1972,'Teapa',27),(1973,'Tenosique',27),(1974,'Abasolo',28),(1975,'Aldama',28),(1976,'Altamira',28),(1977,'Antiguo Morelos',28),(1978,'Burgos',28),(1979,'Bustamante',28),(1980,'Camargo',28),(1981,'Casas',28),(1982,'Ciudad Madero',28),(1983,'Cruillas',28),(1984,'El Mante',28),(1985,'G?émez',28),(1986,'Gómez Farías',28),(1987,'González',28),(1988,'Guerrero',28),(1989,'Gustavo Díaz Ordaz',28),(1990,'Hidalgo',28),(1991,'Jaumave',28),(1992,'Jiménez',28),(1993,'Llera',28),(1994,'Mainero',28),(1995,'Matamoros',28),(1996,'Méndez',28),(1997,'Mier',28),(1998,'Miguel Alemán',28),(1999,'Miquihuana',28),(2000,'Nuevo Laredo',28),(2001,'Nuevo Morelos',28),(2002,'Ocampo',28),(2003,'Padilla',28),(2004,'Palmillas',28),(2005,'Reynosa',28),(2006,'Río Bravo',28),(2007,'San Carlos',28),(2008,'San Fernando',28),(2009,'San Nicolás',28),(2010,'Soto la Marina',28),(2011,'Tampico',28),(2012,'Tula',28),(2013,'Valle Hermoso',28),(2014,'Victoria',28),(2015,'Villagrán',28),(2016,'Xicoténcatl',28),(2017,'Acuamanala de Miguel Hidalgo',29),(2018,'Altzayanca',29),(2019,'Amaxac de Guerrero',29),(2020,'Apetatitlán de Antonio Carvajal',29),(2021,'Apizaco',29),(2022,'Atlangatepec',29),(2023,'Benito Juárez',29),(2024,'Calpulalpan',29),(2025,'Chiautempan',29),(2026,'Contla de Juan Cuamatzi',29),(2027,'Cuapiaxtla',29),(2028,'Cuaxomulco',29),(2029,'El Carmen Tequexquitla',29),(2030,'Emiliano Zapata',29),(2031,'Españita',29),(2032,'Huamantla',29),(2033,'Hueyotlipan',29),(2034,'Ixtacuixtla de Mariano Matamoros',29),(2035,'Ixtenco',29),(2036,'La Magdalena Tlaltelulco',29),(2037,'Lázaro Cárdenas',29),(2038,'Mazatecochco de José María Morelos',29),(2039,'Muñoz de Domingo Arenas',29),(2040,'Nanacamilpa de Mariano Arista',29),(2041,'Natívitas',29),(2042,'Panotla',29),(2043,'Papalotla de Xicohténcatl',29),(2044,'San Damián Texoloc',29),(2045,'San Francisco Tetlanohcan',29),(2046,'San Jerónimo Zacualpan',29),(2047,'San José Teacalco',29),(2048,'San Juan Huactzinco',29),(2049,'San Lorenzo Axocomanitla',29),(2050,'San Lucas Tecopilco',29),(2051,'San Pablo del Monte',29),(2052,'Sanctórum de Lázaro Cárdenas',29),(2053,'Santa Ana Nopalucan',29),(2054,'Santa Apolonia Teacalco',29),(2055,'Santa Catarina Ayometla',29),(2056,'Santa Cruz Quilehtla',29),(2057,'Santa Cruz Tlaxcala',29),(2058,'Santa Isabel Xiloxoxtla',29),(2059,'Tenancingo',29),(2060,'Teolocholco',29),(2061,'Tepetitla de Lardizábal',29),(2062,'Tepeyanco',29),(2063,'Terrenate',29),(2064,'Tetla de la Solidaridad',29),(2065,'Tetlatlahuca',29),(2066,'Tlaxcala',29),(2067,'Tlaxco',29),(2068,'Tocatlán',29),(2069,'Totolac',29),(2070,'Tzompantepec',29),(2071,'Xaloztoc',29),(2072,'Xaltocan',29),(2073,'Xicohtzinco',29),(2074,'Yauhquemecan',29),(2075,'Zacatelco',29),(2076,'Zitlaltepec de Trinidad Sánchez Santos',29),(2077,'Acajete',30),(2078,'Acatlán',30),(2079,'Acayucan',30),(2080,'Actopan',30),(2081,'Acula',30),(2082,'Acultzingo',30),(2083,'Agua Dulce',30),(2084,'Alpatláhuac',30),(2085,'Alto Lucero de Gutiérrez Barrios',30),(2086,'Altotonga',30),(2087,'Alvarado',30),(2088,'Amatitlán',30),(2089,'Amatlán de los Reyes',30),(2090,'Angel R. Cabada',30),(2091,'Apazapan',30),(2092,'Aquila',30),(2093,'Astacinga',30),(2094,'Atlahuilco',30),(2095,'Atoyac',30),(2096,'Atzacan',30),(2097,'Atzalan',30),(2098,'Ayahualulco',30),(2099,'Banderilla',30),(2100,'Benito Juárez',30),(2101,'Boca del Río',30),(2102,'Calcahualco',30),(2103,'Camarón de Tejeda',30),(2104,'Camerino Z. Mendoza',30),(2105,'Carlos A. Carrillo',30),(2106,'Carrillo Puerto',30),(2107,'Castillo de Teayo',30),(2108,'Catemaco',30),(2109,'Cazones',30),(2110,'Cerro Azul',30),(2111,'Chacaltianguis',30),(2112,'Chalma',30),(2113,'Chiconamel',30),(2114,'Chiconquiaco',30),(2115,'Chicontepec',30),(2116,'Chinameca',30),(2117,'Chinampa de Gorostiza',30),(2118,'Chocamán',30),(2119,'Chontla',30),(2120,'Chumatlán',30),(2121,'Citlaltépetl',30),(2122,'Coacoatzintla',30),(2123,'Coahuitlán',30),(2124,'Coatepec',30),(2125,'Coatzacoalcos',30),(2126,'Coatzintla',30),(2127,'Coetzala',30),(2128,'Colipa',30),(2129,'Comapa',30),(2130,'Córdoba',30),(2131,'Cosamaloapan de Carpio',30),(2132,'Cosautlán de Carvajal',30),(2133,'Coscomatepec',30),(2134,'Cosoleacaque',30),(2135,'Cotaxtla',30),(2136,'Coxquihui',30),(2137,'Coyutla',30),(2138,'Cuichapa',30),(2139,'Cuitláhuac',30),(2140,'El Higo',30),(2141,'Emiliano Zapata',30),(2142,'Espinal',30),(2143,'Filomeno Mata',30),(2144,'Fortín',30),(2145,'Gutiérrez Zamora',30),(2146,'Hidalgotitlán',30),(2147,'Huatusco',30),(2148,'Huayacocotla',30),(2149,'Hueyapan de Ocampo',30),(2150,'Huiloapan',30),(2151,'Ignacio de la Llave',30),(2152,'Ilamatlán',30),(2153,'Isla',30),(2154,'Ixcatepec',30),(2155,'Ixhuacán de los Reyes',30),(2156,'Ixhuatlán de Madero',30),(2157,'Ixhuatlán del Café',30),(2158,'Ixhuatlán del Sureste',30),(2159,'Ixhuatlancillo',30),(2160,'Ixmatlahuacan',30),(2161,'Ixtaczoquitlán',30),(2162,'Jalacingo',30),(2163,'Jalcomulco',30),(2164,'Jáltipan',30),(2165,'Jamapa',30),(2166,'Jesús Carranza',30),(2167,'Jilotepec',30),(2168,'José Azueta',30),(2169,'Juan Rodríguez Clara',30),(2170,'Juchique de Ferrer',30),(2171,'La Antigua',30),(2172,'La Perla',30),(2173,'Landero y Coss',30),(2174,'Las Choapas',30),(2175,'Las Minas',30),(2176,'Las Vigas de Ramírez',30),(2177,'Lerdo de Tejada',30),(2178,'Los Reyes',30),(2179,'Magdalena',30),(2180,'Maltrata',30),(2181,'Manlio Fabio Altamirano',30),(2182,'Mariano Escobedo',30),(2183,'Martínez de la Torre',30),(2184,'Mecatlán',30),(2185,'Mecayapan',30),(2186,'Medellín',30),(2187,'Miahuatlán',30),(2188,'Minatitlán',30),(2189,'Misantla',30),(2190,'Mixtla de Altamirano',30),(2191,'Moloacán',30),(2192,'Nanchital de Lázaro Cárdenas del R',30),(2193,'Naolinco',30),(2194,'Naranjal',30),(2195,'Naranjos Amatlán',30),(2196,'Nautla',30),(2197,'Nogales',30),(2198,'Oluta',30),(2199,'Omealca',30),(2200,'Orizaba',30),(2201,'Otatitlán',30),(2202,'Oteapan',30),(2203,'Ozuluama de Mascareñas',30),(2204,'Pajapan',30),(2205,'Pánuco',30),(2206,'Papantla',30),(2207,'Paso de Ovejas',30),(2208,'Paso del Macho',30),(2209,'Perote',30),(2210,'Platón Sánchez',30),(2211,'Playa Vicente',30),(2212,'Poza Rica de Hidalgo',30),(2213,'Pueblo Viejo',30),(2214,'Puente Nacional',30),(2215,'Rafael Delgado',30),(2216,'Rafael Lucio',30),(2217,'Río Blanco',30),(2218,'Saltabarranca',30),(2219,'San Andrés Tenejapan',30),(2220,'San Andrés Tuxtla',30),(2221,'San Juan Evangelista',30),(2222,'San Rafael',30),(2223,'Santiago Sochiapan',30),(2224,'Santiago Tuxtla',30),(2225,'Sayula de Alemán',30),(2226,'Sochiapa',30),(2227,'Soconusco',30),(2228,'Soledad Atzompa',30),(2229,'Soledad de Doblado',30),(2230,'Soteapan',30),(2231,'Tamalín',30),(2232,'Tamiahua',30),(2233,'Tampico Alto',30),(2234,'Tancoco',30),(2235,'Tantima',30),(2236,'Tantoyuca',30),(2237,'Tatahuicapan de Juárez',30),(2238,'Tatatila',30),(2239,'Tecolutla',30),(2240,'Tehuipango',30),(2241,'Temapache',30),(2242,'Tempoal',30),(2243,'Tenampa',30),(2244,'Tenochtitlán',30),(2245,'Teocelo',30),(2246,'Tepatlaxco',30),(2247,'Tepetlán',30),(2248,'Tepetzintla',30),(2249,'Tequila',30),(2250,'Texcatepec',30),(2251,'Texhuacán',30),(2252,'Texistepec',30),(2253,'Tezonapa',30),(2254,'Tierra Blanca',30),(2255,'Tihuatlán',30),(2256,'Tlachichilco',30),(2257,'Tlacojalpan',30),(2258,'Tlacolulan',30),(2259,'Tlacotalpan',30),(2260,'Tlacotepec de Mejía',30),(2261,'Tlalixcoyan',30),(2262,'Tlalnelhuayocan',30),(2263,'Tlaltetela',30),(2264,'Tlapacoyan',30),(2265,'Tlaquilpa',30),(2266,'Tlilapan',30),(2267,'Tomatlán',30),(2268,'Tonayán',30),(2269,'Totutla',30),(2270,'Tres Valles',30),(2271,'Túxpam',30),(2272,'Tuxtilla',30),(2273,'Ursulo Galván',30),(2274,'Uxpanapa',30),(2275,'Vega de Alatorre',30),(2276,'Veracruz',30),(2277,'Villa Aldama',30),(2278,'Xalapa',30),(2279,'Xico',30),(2280,'Xoxocotla',30),(2281,'Yanga',30),(2282,'Yecuatla',30),(2283,'Zacualpan',30),(2284,'Zaragoza',30),(2285,'Zentla',30),(2286,'Zongolica',30),(2287,'Zontecomatlán de López y Fuentes',30),(2288,'Zozocolco de Hidalgo',30),(2289,'Abalá',31),(2290,'Acanceh',31),(2291,'Akil',31),(2292,'Baca',31),(2293,'Bokobá',31),(2294,'Buctzotz',31),(2295,'Cacalchén',31),(2296,'Calotmul',31),(2297,'Cansahcab',31),(2298,'Cantamayec',31),(2299,'Celestún',31),(2300,'Cenotillo',31),(2301,'Chacsinkín',31),(2302,'Chankom',31),(2303,'Chapab',31),(2304,'Chemax',31),(2305,'Chichimilá',31),(2306,'Chicxulub Pueblo',31),(2307,'Chikindzonot',31),(2308,'Chocholá',31),(2309,'Chumayel',31),(2310,'Conkal',31),(2311,'Cuncunul',31),(2312,'Cuzamá',31),(2313,'Dzán',31),(2314,'Dzemul',31),(2315,'Dzidzantún',31),(2316,'Dzilam de Bravo',31),(2317,'Dzilam González',31),(2318,'Dzitás',31),(2319,'Dzoncauich',31),(2320,'Espita',31),(2321,'Halachó',31),(2322,'Hocabá',31),(2323,'Hoctún',31),(2324,'Homún',31),(2325,'Huhí',31),(2326,'Hunucmá',31),(2327,'Ixil',31),(2328,'Izamal',31),(2329,'Kanasín',31),(2330,'Kantunil',31),(2331,'Kaua',31),(2332,'Kinchil',31),(2333,'Kopomá',31),(2334,'Mama',31),(2335,'Maní',31),(2336,'Maxcanú',31),(2337,'Mayapán',31),(2338,'Mérida',31),(2339,'Mocochá',31),(2340,'Motul',31),(2341,'Muna',31),(2342,'Muxupip',31),(2343,'Opichén',31),(2344,'Oxkutzcab',31),(2345,'Panabá',31),(2346,'Peto',31),(2347,'Progreso',31),(2348,'Quintana Roo',31),(2349,'Río Lagartos',31),(2350,'Sacalum',31),(2351,'Samahil',31),(2352,'San Felipe',31),(2353,'Sanahcat',31),(2354,'Santa Elena',31),(2355,'Seyé',31),(2356,'Sinanché',31),(2357,'Sotuta',31),(2358,'Sucilá',31),(2359,'Sudzal',31),(2360,'Suma',31),(2361,'Tahdziú',31),(2362,'Tahmek',31),(2363,'Teabo',31),(2364,'Tecoh',31),(2365,'Tekal de Venegas',31),(2366,'Tekantó',31),(2367,'Tekax',31),(2368,'Tekit',31),(2369,'Tekom',31),(2370,'Telchac Pueblo',31),(2371,'Telchac Puerto',31),(2372,'Temax',31),(2373,'Temozón',31),(2374,'Tepakán',31),(2375,'Tetiz',31),(2376,'Teya',31),(2377,'Ticul',31),(2378,'Timucuy',31),(2379,'Tinum',31),(2380,'Tixcacalcupul',31),(2381,'Tixkokob',31),(2382,'Tixmehuac',31),(2383,'Tixpéhual',31),(2384,'Tizimín',31),(2385,'Tunkás',31),(2386,'Tzucacab',31),(2387,'Uayma',31),(2388,'Ucú',31),(2389,'Umán',31),(2390,'Valladolid',31),(2391,'Xocchel',31),(2392,'Yaxcabá',31),(2393,'Yaxkukul',31),(2394,'Yobaín',31),(2395,'Apozol',32),(2396,'Apulco',32),(2397,'Atolinga',32),(2398,'Benito Juárez',32),(2399,'Calera',32),(2400,'Cañitas de Felipe Pescador',32),(2401,'Chalchihuites',32),(2402,'Concepción del Oro',32),(2403,'Cuauhtémoc',32),(2404,'El Plateado de Joaquín Amaro',32),(2405,'El Salvador',32),(2406,'Fresnillo',32),(2407,'Genaro Codina',32),(2408,'General Enrique Estrada',32),(2409,'General Francisco R. Murguía',32),(2410,'General Pánfilo Natera',32),(2411,'Guadalupe',32),(2412,'Huanusco',32),(2413,'Jalpa',32),(2414,'Jerez',32),(2415,'Jiménez del Teul',32),(2416,'Juan Aldama',32),(2417,'Juchipila',32),(2418,'Loreto',32),(2419,'Luis Moya',32),(2420,'Mazapil',32),(2421,'Melchor Ocampo',32),(2422,'Mezquital del Oro',32),(2423,'Miguel Auza',32),(2424,'Momax',32),(2425,'Monte Escobedo',32),(2426,'Morelos',32),(2427,'Moyahua de Estrada',32),(2428,'Nochistlán de Mejía',32),(2429,'Noria de ?ngeles',32),(2430,'Ojocaliente',32),(2431,'Pánuco',32),(2432,'Pinos',32),(2433,'Río Grande',32),(2434,'Sain Alto',32),(2435,'Santa María de la Paz',32),(2436,'Sombrerete',32),(2437,'Susticacán',32),(2438,'Tabasco',32),(2439,'Tepechitlán',32),(2440,'Tepetongo',32),(2441,'Teul de González Ortega',32),(2442,'Tlaltenango de Sánchez Román',32),(2443,'Trancoso',32),(2444,'Trinidad García de la Cadena',32),(2445,'Valparaíso',32),(2446,'Vetagrande',32),(2447,'Villa de Cos',32),(2448,'Villa García',32),(2449,'Villa González Ortega',32),(2450,'Villa Hidalgo',32),(2451,'Villanueva',32),(2452,'Zacatecas',32);
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
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_cat_estados_1` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_estados`
--

LOCK TABLES `cat_estados` WRITE;
/*!40000 ALTER TABLE `cat_estados` DISABLE KEYS */;
INSERT INTO `cat_estados` VALUES (0,NULL),(1,'Aguascalientes'),(2,'Baja California'),(3,'Baja California Sur'),(4,'Campeche'),(5,'Chiapas'),(6,'Chihuahua'),(7,'Coahuila'),(8,'Colima'),(9,'Distrito Federal'),(10,'Durango'),(11,'Estado de México'),(12,'Guanajuato'),(13,'Guerrero'),(14,'Hidalgo'),(15,'Jalisco'),(16,'Michoacán'),(17,'Morelos'),(18,'Nayarit'),(19,'Nuevo León'),(20,'Oaxaca'),(21,'Puebla'),(22,'Querétaro'),(23,'Quintana Roo'),(24,'San Luis Potosí'),(25,'Sinaloa'),(26,'Sonora'),(27,'Tabasco'),(28,'Tamaulipas'),(29,'Tlaxcala'),(30,'Veracruz'),(31,'Yucatán'),(32,'Zacatecas');
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
  `nombre` varchar(100) DEFAULT NULL,
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
INSERT INTO `cat_familias` VALUES (0,NULL,0),(1,'Familia 1',2),(2,'Familia 2',2),(3,'Familia 3',2),(4,'Familia 4',3),(5,'Familia 5',3),(6,'Familia 6',4),(7,'Familia 7',5);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_guardias`
--

LOCK TABLES `cat_guardias` WRITE;
/*!40000 ALTER TABLE `cat_guardias` DISABLE KEYS */;
INSERT INTO `cat_guardias` VALUES (3,'Guardias de plata'),(2,'PanAmericanos'),(1,'UPS');
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
  `nombre` varchar(100) DEFAULT NULL,
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
INSERT INTO `cat_lugares` VALUES (0,NULL,NULL),(1,'Salón Santa María','Corporativo Santa María, torre 1 piso 10'),(2,'Jubilee','Andador Constitución, entre 20 de Noviembre y Negrete');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_metodospago`
--

LOCK TABLES `cat_metodospago` WRITE;
/*!40000 ALTER TABLE `cat_metodospago` DISABLE KEYS */;
INSERT INTO `cat_metodospago` VALUES (3,'Cheque'),(2,'Crédito'),(1,'Efectivo'),(4,'Transferencia');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_puestos`
--

LOCK TABLES `cat_puestos` WRITE;
/*!40000 ALTER TABLE `cat_puestos` DISABLE KEYS */;
INSERT INTO `cat_puestos` VALUES (2,'Auxiliar administrativo'),(1,'CEO'),(4,'Outsorcing'),(3,'Recepcionista');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_ranking`
--

LOCK TABLES `cat_ranking` WRITE;
/*!40000 ALTER TABLE `cat_ranking` DISABLE KEYS */;
INSERT INTO `cat_ranking` VALUES (3,'Deplorable'),(2,'Elite'),(4,'Excelente'),(5,'Malo'),(6,'Nuevo'),(1,'Promedio');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_roles`
--

LOCK TABLES `cat_roles` WRITE;
/*!40000 ALTER TABLE `cat_roles` DISABLE KEYS */;
INSERT INTO `cat_roles` VALUES (1,'Administrador'),(2,'Usuario');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_status`
--

LOCK TABLES `cat_status` WRITE;
/*!40000 ALTER TABLE `cat_status` DISABLE KEYS */;
INSERT INTO `cat_status` VALUES (1,'Activo'),(2,'Inactivo'),(4,'Nuevo'),(0,'Nulo'),(3,'Pendiente');
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
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_subfamilias_1` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_subfamilias`
--

LOCK TABLES `cat_subfamilias` WRITE;
/*!40000 ALTER TABLE `cat_subfamilias` DISABLE KEYS */;
INSERT INTO `cat_subfamilias` VALUES (0,NULL),(9,'Alta nueva'),(1,'Subfamilia 1'),(2,'Subfamilia 2'),(3,'Subfamilia 3'),(4,'Subfamilia 4'),(5,'Subfamilia 5'),(6,'Subfamilia 6'),(10,'Subfamilia 7');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_tiposevento`
--

LOCK TABLES `cat_tiposevento` WRITE;
/*!40000 ALTER TABLE `cat_tiposevento` DISABLE KEYS */;
INSERT INTO `cat_tiposevento` VALUES (1,'0001XV','Quince años'),(2,'0002Grad','Graduación'),(3,'0003Boda','Boda');
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
  `ciudadContacto` int(11) DEFAULT NULL,
  `codigoPostalContacto` char(5) DEFAULT NULL,
  `telefonoContacto` varchar(14) DEFAULT NULL,
  `celularContacto` varchar(14) DEFAULT NULL,
  `emailContacto` varchar(70) DEFAULT NULL,
  `rfcFiscal` varchar(14) DEFAULT NULL,
  `razonSocialFiscal` varchar(100) DEFAULT NULL,
  `calleFiscal` varchar(50) DEFAULT NULL,
  `coloniaFiscal` varchar(100) DEFAULT NULL,
  `ciudadFiscal` int(11) DEFAULT NULL,
  `paisFiscal` varchar(50) DEFAULT NULL,
  `codigoPostalFiscal` char(5) DEFAULT NULL,
  `numeroInteriorFiscal` varchar(5) DEFAULT NULL,
  `numeroExteriorFiscal` varchar(5) DEFAULT NULL,
  `localidadFiscal` varchar(100) DEFAULT NULL,
  `municipioFiscal` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_clientes_1` (`nombre`),
  KEY `FK_clientes_1` (`ciudadContacto`),
  KEY `IDX_clientes_2` (`coloniaFiscal`),
  KEY `IDX_clientes_3` (`ciudadFiscal`),
  CONSTRAINT `FK_clientes_1` FOREIGN KEY (`ciudadContacto`) REFERENCES `cat_ciudades` (`id`),
  CONSTRAINT `FK_clientes_3` FOREIGN KEY (`ciudadFiscal`) REFERENCES `cat_ciudades` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (2,'PGeneral','Público en general','','',0.00,0,NULL,'','','','',0,'','','','','','','','',0,NULL,'','','','',NULL);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cobros`
--

DROP TABLE IF EXISTS `cobros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cobros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `evento` int(11) NOT NULL,
  `monto` decimal(11,2) DEFAULT NULL,
  `concepto` varchar(200) DEFAULT NULL,
  `cuentaBancaria` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_cobros_1` (`evento`),
  KEY `FK_cobros_2` (`cuentaBancaria`),
  CONSTRAINT `FK_cobros_1` FOREIGN KEY (`evento`) REFERENCES `eventos` (`id`),
  CONSTRAINT `FK_cobros_2` FOREIGN KEY (`cuentaBancaria`) REFERENCES `cuentasbancarias` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cobros`
--

LOCK TABLES `cobros` WRITE;
/*!40000 ALTER TABLE `cobros` DISABLE KEYS */;
/*!40000 ALTER TABLE `cobros` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuentasbancarias`
--

LOCK TABLES `cuentasbancarias` WRITE;
/*!40000 ALTER TABLE `cuentasbancarias` DISABLE KEYS */;
INSERT INTO `cuentasbancarias` VALUES (1,'Cta1','Ahorro',4,'123456007','123456789000',5000.00),(2,'Cta2','Caja chica',3,'4152745','741852963457',1000.00),(3,'HSBC2','Seguros',4,'671274500','762052981457',10000.00);
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
  KEY `IDX_empleados_5` (`puesto`),
  CONSTRAINT `FK_empleados_1` FOREIGN KEY (`puesto`) REFERENCES `cat_puestos` (`id`),
  CONSTRAINT `FK_empleados_2` FOREIGN KEY (`ciudad`) REFERENCES `cat_ciudades` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'123abc','Meny',1,'Domicilio conocido','Centro',286,'34227','81504081','8110167264','ma2_f@hotmail.com',1,1,1,1,0,0),(2,'123abc2','Erika F.',1,'Domicilio conocido','Centro',286,'34227',NULL,'8184644072','ma2_f@hotmail.com',0,1,1,1,0,0),(3,'EmpDumy3','Miguel Ángel',2,'centro','salsipuedes',984,'64000','','6481094970','miguel@localhost.me',0,1,0,0,1,1);
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
  `nombre` varchar(200) DEFAULT NULL,
  `cotizacion` tinyint(1) DEFAULT '1',
  `statusCotizacion` int(11) DEFAULT '0',
  `statusEvento` int(11) DEFAULT '0',
  `cliente` int(11) DEFAULT NULL,
  `lugar` int(11) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `fechaEntrega` timestamp NULL DEFAULT NULL,
  `fechaSeguimiento` timestamp NULL DEFAULT NULL,
  `fechaFinal` timestamp NULL DEFAULT NULL,
  `direccion` varchar(300) DEFAULT NULL,
  `invitados` int(11) DEFAULT '0',
  `salon` tinyint(1) DEFAULT '0',
  `vendedor` int(11) DEFAULT NULL,
  `utilidadCuenta` decimal(5,2) DEFAULT '0.00',
  `cuenta` varchar(20) DEFAULT NULL,
  `montoServicios` decimal(8,2) DEFAULT NULL,
  `depositosEnGarantia` decimal(5,2) DEFAULT '0.00',
  `montoDepositosEnGarantia` decimal(8,2) DEFAULT '0.00',
  `guardias` int(11) NOT NULL,
  `cantidadGuardias` int(11) DEFAULT '0',
  `montoGuardias` decimal(8,2) DEFAULT NULL,
  `metodoPago` int(11) DEFAULT NULL,
  `cuentaBancaria` int(11) DEFAULT NULL,
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
  KEY `FK_eventos_6_idx` (`statusCotizacion`),
  KEY `FK_eventos_8_idx` (`statusEvento`),
  KEY `IDX_eventos_9` (`vendedor`),
  KEY `FK_eventos_6` (`cuentaBancaria`),
  CONSTRAINT `FK_eventos_4` FOREIGN KEY (`guardias`) REFERENCES `cat_guardias` (`id`),
  CONSTRAINT `FK_eventos_6` FOREIGN KEY (`cuentaBancaria`) REFERENCES `cuentasbancarias` (`id`),
  CONSTRAINT `FK_eventos_7` FOREIGN KEY (`statusCotizacion`) REFERENCES `cat_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_eventos_8` FOREIGN KEY (`statusEvento`) REFERENCES `cat_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos`
--

LOCK TABLES `eventos` WRITE;
/*!40000 ALTER TABLE `eventos` DISABLE KEYS */;
INSERT INTO `eventos` VALUES (1,'Evento1',0,0,1,0,1,1,'2016-09-16 05:00:00','2016-09-16 05:00:00','2016-09-18 05:00:00','Domicilio conocido',200,0,1,1.00,NULL,0.00,0.00,0.00,0,0,0.00,1,0,500.00,0.00),(2,'Evento2',0,0,2,0,1,1,'2016-11-20 06:00:00','2016-11-20 06:00:00','2016-11-23 06:00:00',NULL,200,0,1,1.00,NULL,0.00,0.00,0.00,0,0,0.00,1,0,500.00,0.00),(3,'Evento3',0,0,2,0,1,1,'2016-11-20 06:00:00','2016-11-20 06:00:00','2016-11-23 06:00:00',NULL,200,0,1,1.00,NULL,0.00,0.00,0.00,0,0,0.00,1,0,500.00,0.00),(4,'Evento4',0,0,2,0,1,1,'2016-11-20 06:00:00','2016-11-20 06:00:00','2016-11-23 06:00:00',NULL,200,0,1,1.00,NULL,0.00,0.00,0.00,0,0,0.00,1,0,500.00,0.00),(5,'Evento5',0,0,2,0,1,1,'2016-11-25 06:00:00','2016-11-25 06:00:00','2016-12-01 06:00:00',NULL,200,0,1,1.00,NULL,0.00,0.00,0.00,0,0,0.00,1,0,500.00,0.00),(6,'Evento test',1,4,NULL,2,2,0,'2016-07-27 05:00:00','2016-07-28 05:00:00','2016-07-29 05:00:00','Zona centro',40,0,1,0.00,NULL,0.00,0.00,0.00,3,5,0.00,1,1,952.00,705.00);
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
  `monto` decimal(11,2) DEFAULT NULL,
  `concepto` varchar(200) DEFAULT NULL,
  `cuentaBancaria` int(11) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `telefonoContacto` varchar(14) DEFAULT NULL,
  `fechaSolicitud` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fechaRequerido` timestamp NULL DEFAULT NULL,
  `fechaEntrega` timestamp NULL DEFAULT NULL,
  `area` int(11) DEFAULT NULL,
  `realizado` tinyint(1) DEFAULT '0',
  `fechaRealizado` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_gastos_1` (`evento`),
  KEY `IDX_gastos_2` (`fechaSolicitud`),
  KEY `IDX_gastos_3` (`fechaRequerido`),
  KEY `IDX_gastos_4` (`fechaEntrega`),
  KEY `FK_gastos_3` (`area`),
  KEY `FK_gastos_1` (`empleado`),
  KEY `IDX_gastos_5` (`cuentaBancaria`),
  CONSTRAINT `FK_gastos_1` FOREIGN KEY (`empleado`) REFERENCES `empleados` (`id`),
  CONSTRAINT `FK_gastos_2` FOREIGN KEY (`evento`) REFERENCES `eventos` (`id`),
  CONSTRAINT `FK_gastos_3` FOREIGN KEY (`area`) REFERENCES `cat_areas` (`id`),
  CONSTRAINT `FK_gastos_4` FOREIGN KEY (`cuentaBancaria`) REFERENCES `cuentasbancarias` (`id`)
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
  `url` varchar(150) DEFAULT NULL,
  `claseAwesome` varchar(20) DEFAULT NULL,
  `prioridad` char(2) DEFAULT NULL,
  `orden` char(2) DEFAULT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IDX_modulos_1` (`prioridad`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulos`
--

LOCK TABLES `modulos` WRITE;
/*!40000 ALTER TABLE `modulos` DISABLE KEYS */;
INSERT INTO `modulos` VALUES (1,'Cat&aacute;logos',NULL,'book','0','4',1),(2,'&Aacute;reas','areas.php',NULL,'1','1',1),(3,'Familias','familias.php',NULL,'1','2',1),(4,'Subfamilias','subfamilias.php',NULL,'1','3',1),(5,'Bancos','bancos.php',NULL,'1','4',1),(6,'Cuentas bancarias','cuentasBancarias.php',NULL,'20','4',1),(9,'Roles','roles.php',NULL,NULL,NULL,0),(10,'Empleados','empleados.php',NULL,'20','1',1),(13,'Art&iacute;culos','articulos.php','shopping-cart','0','5',1),(14,'Externos',NULL,'group','0','2',1),(15,'Clientes','clientes.php',NULL,'14','1',1),(16,'Eventos','eventos.php',NULL,'29','2',1),(17,'Lugares','lugares.php',NULL,'1','5',1),(18,'M&eacute;todos de pago','metodosPago.php',NULL,'1','6',1),(19,'Proveedores','proveedores.php',NULL,'14','2',1),(20,'Administrativo',NULL,'folder-open','0','3',1),(21,'Puestos','puestos.php',NULL,'20','2',1),(22,'Ranking','ranking.php',NULL,'1','7',1),(23,'Servicios','servicios.php','tags','0','6',1),(24,'Status','status.php',NULL,'1','8',1),(25,'Tipos de evento','tiposEvento.php',NULL,'1','9',1),(26,'Vendedores','vendedores.php',NULL,'20','3',1),(28,'Registrar','registraEvento.php',NULL,'29','1',1),(29,'Eventos',NULL,'calendar-o','0','1',1),(30,'Cotizaciones','cotizaciones.php',NULL,'29','3',1);
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
  `codigoPostalFiscal` char(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_proveedores_1` (`nombre`),
  KEY `IDX_proveedores_2` (`coloniaFiscal`),
  KEY `proveedores_3` (`ciudadFiscal`),
  CONSTRAINT `FK_proveedores_3` FOREIGN KEY (`ciudadFiscal`) REFERENCES `cat_ciudades` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'PGeneral','Proveedor genérico','','','','','','','','','','','',0,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rolesmodulos`
--

LOCK TABLES `rolesmodulos` WRITE;
/*!40000 ALTER TABLE `rolesmodulos` DISABLE KEYS */;
INSERT INTO `rolesmodulos` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,2,1),(6,2,2),(7,2,3),(8,2,4),(9,1,5),(10,1,6),(15,1,9),(16,1,10),(19,1,13),(20,1,14),(21,1,15),(22,1,16),(23,1,17),(24,1,18),(25,1,19),(26,1,20),(27,1,21),(28,1,22),(29,1,23),(30,1,24),(31,1,25),(32,1,26),(34,1,28),(35,2,28),(36,1,29),(37,1,30);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'admin','c2c23c37fda1d113e9fe3de820bbd36a5c0be5d6','1e94dc565e37ea8edc3ab5495c070ebd21d48942',0,0),(6,'Erika','c35d8ce7350ab4dd0608ff3cbab811bda894adcc','b0f382de5e6085b6f7e454bc11685d64d5923459',2,2),(8,'MenyAFF','3f5eee14ee12b66aa16b37c0448a3a5c2487a44a','eb33415f3c1b4cf79b623158ecf5fec9444b6df4',1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedores`
--

LOCK TABLES `vendedores` WRITE;
/*!40000 ALTER TABLE `vendedores` DISABLE KEYS */;
INSERT INTO `vendedores` VALUES (1,3,6);
/*!40000 ALTER TABLE `vendedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'kmasociados'
--
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
	SET @coincidencias=0;
    
    SET @sqlQuery = CONCAT("SELECT COUNT(*) INTO @coincidencias FROM articulos WHERE id IN(",P_id,");");
		
	PREPARE execQuery FROM @sqlQuery;
	EXECUTE execQuery;
	DEALLOCATE PREPARE execQuery;
    
    IF(@coincidencias != 0)THEN
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
			
			SELECT 'TRUE' AS respuesta, 'Articulo eliminado satisfactoriamente' AS 'mensaje';
		ELSE
			SELECT 'FALSE' AS respuesta, 'Artículo asignado a eventos' AS 'mensaje';
		END IF;
	ELSE
		SELECT 'FALSE' AS respuesta, 'No existe el artículo' AS 'mensaje';
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
    DECLARE no_more_rows BOOLEAN;
    
    DECLARE cursorArticulos CURSOR FOR SELECT * FROM TMP_articulosEventos;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more_rows = TRUE;
    
    SET @coincidencias=0;
    
    SET @sqlQuery = CONCAT("SELECT COUNT(*) INTO @coincidencias FROM articulosEventos WHERE id IN(",P_id,");");

	PREPARE execQuery FROM @sqlQuery;
	EXECUTE execQuery;
	DEALLOCATE PREPARE execQuery;
    
    IF(@coincidencias != 0)THEN    
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
        
		SELECT 'TRUE' AS respuesta, 'Artículo desasignado satisfactoriamente' AS 'mensaje';
	ELSE
		SELECT 'FALSE' AS respuesta, 'No existe la relación entre artículos y eventos' AS 'mensaje';
    END IF;
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
	SET @coincidencias=0;
    
    SET @sqlQuery = CONCAT("SELECT COUNT(*) INTO @coincidencias FROM cat_areas WHERE id IN(",P_id,");");
	
	PREPARE execQuery FROM @sqlQuery;
	EXECUTE execQuery;
	DEALLOCATE PREPARE execQuery;    
    
    IF(@coincidencias != 0)THEN
		SET @dependencias = 0;
        SET @origenDependencia = '';
		
		SET @sqlQuery = CONCAT("SELECT SUM(info), GROUP_CONCAT(tabla SEPARATOR ', ') INTO @dependencias, @origenDependencia FROM (
										SELECT COUNT(*) AS info, CASE WHEN COUNT(*)>0 THEN 'articulos' END AS tabla FROM articulos WHERE area IN(",P_id,")
										UNION
										SELECT COUNT(*) AS info, CASE WHEN COUNT(*)>0 THEN 'gastos' END AS tabla FROM gastos WHERE area IN(",P_id,")
										UNION
										SELECT COUNT(*) AS info, CASE WHEN COUNT(*)>0 THEN 'servicios' END AS tabla FROM servicios WHERE area IN(",P_id,")
								) tmp");
		
		PREPARE execQuery FROM @sqlQuery;
		EXECUTE execQuery;
		DEALLOCATE PREPARE execQuery;
		
		IF(@dependencias=0) THEN         
			SET @sqlQuery = CONCAT("DELETE FROM cat_areas WHERE id IN(",P_id,");");
			
			PREPARE execQuery FROM @sqlQuery;
			EXECUTE execQuery;
			DEALLOCATE PREPARE execQuery;
			
			SELECT 'TRUE' AS respuesta, 'Área eliminada satisfactoriamente' AS 'mensaje';
		ELSE
			SELECT 'FALSE' AS respuesta, CONCAT('Área asignada a ',@origenDependencia) AS 'mensaje';
		END IF;
	ELSE
		SELECT 'FALSE' AS respuesta, 'No existe el área' AS 'mensaje';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPD_cobros` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPD_cobros`(IN P_id VARCHAR(200))
BEGIN    
	SET @coincidencias=0;
    
    SET @sqlQuery = CONCAT("SELECT COUNT(*) INTO @coincidencias FROM cobros WHERE id IN(",P_id,");");
	
	PREPARE execQuery FROM @sqlQuery;
	EXECUTE execQuery;
	DEALLOCATE PREPARE execQuery;
    
    IF(@coincidencias != 0)THEN    
		SET @sqlQuery = CONCAT("DELETE FROM cobros WHERE id IN(",P_id,");");
		
		PREPARE execQuery FROM @sqlQuery;
		EXECUTE execQuery;
		DEALLOCATE PREPARE execQuery;
		
		SELECT 'TRUE' AS respuesta, 'Cobro eliminado satisfactoriamente' AS 'mensaje';
	ELSE
		SELECT 'FALSE' AS respuesta, 'No existe el cobro' AS 'mensaje';
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
	SET @coincidencias=0;
    
    SET @sqlQuery = CONCAT("SELECT COUNT(*) INTO @coincidencias FROM gastos WHERE id IN(",P_id,");");
	
	PREPARE execQuery FROM @sqlQuery;
	EXECUTE execQuery;
	DEALLOCATE PREPARE execQuery;
    
    IF(@coincidencias != 0)THEN    
		SET @sqlQuery = CONCAT("DELETE FROM gastos WHERE id IN(",P_id,");");
		
		PREPARE execQuery FROM @sqlQuery;
		EXECUTE execQuery;
		DEALLOCATE PREPARE execQuery;
		
		SELECT 'TRUE' AS respuesta, 'Gasto eliminado satisfactoriamente' AS 'mensaje';
	ELSE
		SELECT 'FALSE' AS respuesta, 'No existe el gasto' AS 'mensaje';
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
	SET @coincidencias=0;
    
    SET @sqlQuery = CONCAT("SELECT COUNT(*) INTO @coincidencias FROM cat_bancos WHERE id IN(",P_id,");");
	
	PREPARE execQuery FROM @sqlQuery;
	EXECUTE execQuery;
	DEALLOCATE PREPARE execQuery;
    
    IF(@coincidencias != 0)THEN
		SET @dependencias = 0;
		
		SET @sqlQuery = CONCAT("SELECT COUNT(*) INTO @dependencias FROM cuentasBancarias WHERE banco IN(",P_id,");");
		
		PREPARE execQuery FROM @sqlQuery;
		EXECUTE execQuery;
		DEALLOCATE PREPARE execQuery;
		
		IF(@dependencias=0) THEN         
			SET @sqlQuery = CONCAT("DELETE FROM cat_bancos WHERE id IN(",P_id,");");
			
			PREPARE execQuery FROM @sqlQuery;
			EXECUTE execQuery;
			DEALLOCATE PREPARE execQuery;
			
			SELECT 'TRUE' AS respuesta, 'Banco eliminado correctamente' AS 'mensaje';
		ELSE
			SELECT 'FALSE' AS respuesta, 'Banco asignado a cuentas bancarias' AS 'mensaje';
		END IF;
	ELSE
		SELECT 'FALSE' AS respuesta, 'No existe el banco' AS 'mensaje';
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
	SET @coincidencias=0;
    
    SET @sqlQuery = CONCAT("SELECT COUNT(*) INTO @coincidencias FROM cat_familias WHERE id IN(",P_id,");");
	
	PREPARE execQuery FROM @sqlQuery;
	EXECUTE execQuery;
	DEALLOCATE PREPARE execQuery;
    
    IF(@coincidencias != 0)THEN 
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
			
			SELECT 'TRUE' AS respuesta, 'Familia eliminada satisfactoriamente' AS 'mensaje';
		ELSE
			SELECT 'FALSE' AS respuesta, 'Familia asignada a áreas' AS 'error';
		END IF;
	ELSE
		SELECT 'FALSE' AS respuesta, 'No existe la familia' AS 'mensaje';
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
	SET @coincidencias=0;
    
    SET @sqlQuery = CONCAT("SELECT COUNT(*) INTO @coincidencias FROM cat_lugares WHERE id IN(",P_id,");");
	
	PREPARE execQuery FROM @sqlQuery;
	EXECUTE execQuery;
	DEALLOCATE PREPARE execQuery;
    
    IF(@coincidencias != 0)THEN    
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
			
			SELECT 'TRUE' AS respuesta, 'Lugar eliminado satisfactoriamente' AS 'mensaje';
		ELSE
			SELECT 'FALSE' AS respuesta, 'Lugar asignado a eventos' AS 'mensaje';
		END IF;
	ELSE
		SELECT 'FALSE' AS respuesta, 'No existe el lugar' AS 'mensaje';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPD_cat_metodosPago` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPD_cat_metodosPago`(IN P_id VARCHAR(200))
BEGIN
	SET @coincidencias=0;
    
    SET @sqlQuery = CONCAT("SELECT COUNT(*) INTO @coincidencias FROM cat_metodosPago WHERE id IN(",P_id,");");
	
	PREPARE execQuery FROM @sqlQuery;
	EXECUTE execQuery;
	DEALLOCATE PREPARE execQuery;
    
    IF(@coincidencias != 0)THEN 
		SET @dependencias = 0;
		
		SET @sqlQuery = CONCAT("SELECT COUNT(*) INTO @dependencias FROM eventos WHERE metodoPago IN(",P_id,");");
		
		PREPARE execQuery FROM @sqlQuery;
		EXECUTE execQuery;
		DEALLOCATE PREPARE execQuery;
		
		IF(@dependencias=0) THEN         
			SET @sqlQuery = CONCAT("DELETE FROM cat_metodosPago WHERE id IN(",P_id,");");
			
			PREPARE execQuery FROM @sqlQuery;
			EXECUTE execQuery;
			DEALLOCATE PREPARE execQuery;
			
			SELECT 'TRUE' AS respuesta, 'Método de pago eliminado satisfactoriamente' AS 'mensaje';
		ELSE
			SELECT 'FALSE' AS respuesta, 'Método de pago asignado a vendedores' AS 'mensaje';
		END IF;
	ELSE
		SELECT 'FALSE' AS respuesta, 'No existe el método de pago' AS 'mensaje';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPD_cat_puestos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPD_cat_puestos`(IN P_id VARCHAR(200))
BEGIN
	SET @coincidencias=0;
    
    SET @sqlQuery = CONCAT("SELECT COUNT(*) INTO @coincidencias FROM cat_puestos WHERE id IN(",P_id,");");
	
	PREPARE execQuery FROM @sqlQuery;
	EXECUTE execQuery;
	DEALLOCATE PREPARE execQuery;
    
    IF(@coincidencias != 0)THEN
		SET @dependencias = 0;
		
		SET @sqlQuery = CONCAT("SELECT COUNT(*) INTO @dependencias FROM empleados WHERE puesto IN(",P_id,");");
		
		PREPARE execQuery FROM @sqlQuery;
		EXECUTE execQuery;
		DEALLOCATE PREPARE execQuery;
		
		IF(@dependencias=0) THEN  
			SET @sqlQuery = CONCAT("DELETE FROM puestos WHERE id IN(",P_id,");");
			
			PREPARE execQuery FROM @sqlQuery;
			EXECUTE execQuery;
			DEALLOCATE PREPARE execQuery;
			
			SELECT 'TRUE' AS respuesta, 'Puesto eliminado satisfactoriamente' AS 'mensaje';
		ELSE
			SELECT 'FALSE' AS respuesta, 'Puesto asignado a empleados' AS 'mensaje';
		END IF;
	ELSE
		SELECT 'FALSE' AS respuesta, 'No existe el puesto' AS 'mensaje';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPD_purgaArticulosEventos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPD_purgaArticulosEventos`()
BEGIN    
    DELETE FROM articulosEventos WHERE evento IS NULL;
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
	SET @coincidencias=0;
    
    SET @sqlQuery = CONCAT("SELECT COUNT(*) INTO @coincidencias FROM usuarios WHERE id IN(",P_id,");");
	
	PREPARE execQuery FROM @sqlQuery;
	EXECUTE execQuery;
	DEALLOCATE PREPARE execQuery;
    
    IF(@coincidencias != 0)THEN    
		SET @sqlQuery = CONCAT("DELETE FROM usuarios WHERE id IN(",P_id,");");
		
		PREPARE execQuery FROM @sqlQuery;
		EXECUTE execQuery;
		DEALLOCATE PREPARE execQuery;
		
		SELECT 'TRUE' AS respuesta, 'Usuario eliminado correctamente' AS 'mensaje';
	ELSE
		SELECT 'FALSE' AS respuesta, 'No existe el usuario' AS 'mensaje';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPI_articulosEventosMasivo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPI_articulosEventosMasivo`(IN P_valores TEXT)
BEGIN
	SET @sqlQuery = CONCAT("INSERT INTO articulosEventos (cantidad, articulo, evento) VALUES ",P_valores,";");
    
    PREPARE execQuery FROM @sqlQuery;
	EXECUTE execQuery;
	DEALLOCATE PREPARE execQuery;
    
    SELECT 'TRUE' AS respuesta, 'Artículos insertados correctamente' AS mensaje;
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
	SET @coincidencias=0;
    
    SET @sqlQuery = CONCAT("SELECT COUNT(*) INTO @coincidencias FROM cat_ranking WHERE id IN(",P_id,");");
	
	PREPARE execQuery FROM @sqlQuery;
	EXECUTE execQuery;
	DEALLOCATE PREPARE execQuery;
    
    IF(@coincidencias != 0)THEN 
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
			
			SELECT 'TRUE' AS respuesta, 'Ranking eliminado satisfactoriamente' AS 'mensaje';
		ELSE
			SELECT 'FALSE' AS respuesta, 'Ranking asignado a vendedores' AS 'mensaje';
		END IF;
	ELSE
		SELECT 'FALSE' AS respuesta, 'No existe el ranking' AS 'mensaje';
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
	SET @coincidencias=0;
    
    SET @sqlQuery = CONCAT("SELECT COUNT(*) INTO @coincidencias FROM cat_roles WHERE id IN(",P_id,");");
	
	PREPARE execQuery FROM @sqlQuery;
	EXECUTE execQuery;
	DEALLOCATE PREPARE execQuery;
    
    IF(@coincidencias != 0)THEN 
		SET @dependencias = 0;
        SET @origenDependencia = '';
		
		SET @sqlQuery = CONCAT("SELECT SUM(info), GROUP_CONCAT(tabla SEPARATOR ', ') INTO @dependencias, @origenDependencia FROM (
										SELECT COUNT(*) AS info, CASE WHEN COUNT(*)>0 THEN 'roles asignados a módulos' END AS tabla FROM rolesModulos WHERE rol IN(",P_id,")
										UNION
										SELECT COUNT(*) AS info, CASE WHEN COUNT(*)>0 THEN 'usuarios' END AS tabla FROM usuarios WHERE rol IN(",P_id,")
								) tmp");
		
		PREPARE execQuery FROM @sqlQuery;
		EXECUTE execQuery;
		DEALLOCATE PREPARE execQuery;
		
		IF(@dependencias=0) THEN  
			SET @sqlQuery = CONCAT("DELETE FROM cat_roles WHERE id IN(",P_id,");");
			
			PREPARE execQuery FROM @sqlQuery;
			EXECUTE execQuery;
			DEALLOCATE PREPARE execQuery;
			
			SELECT 'TRUE' AS respuesta, 'Rol eliminado satisfactoriamente' AS 'mensaje';
		ELSE
			SELECT 'FALSE' AS respuesta, CONCAT('Rol asignada a ',@origenDependencia) AS 'mensaje';
		END IF;
	ELSE
		SELECT 'FALSE' AS respuesta, 'No existe el rol' AS 'mensaje';
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
	SET @coincidencias=0;
    
    SET @sqlQuery = CONCAT("SELECT COUNT(*) INTO @coincidencias FROM cat_status WHERE id IN(",P_id,");");
	
	PREPARE execQuery FROM @sqlQuery;
	EXECUTE execQuery;
	DEALLOCATE PREPARE execQuery;
    
    IF(@coincidencias != 0)THEN    
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
			
			SELECT 'TRUE' AS respuesta, 'Status eliminado satisfactoriamente' AS 'mensaje';
		ELSE
			SELECT 'FALSE' AS respuesta, 'Status asignado a eventos' AS 'mensaje';
		END IF;
	ELSE
		SELECT 'FALSE' AS respuesta, 'No existe el status' AS 'mensaje';
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
	SET @coincidencias=0;
    
    SET @sqlQuery = CONCAT("SELECT COUNT(*) INTO @coincidencias FROM cat_subfamilias WHERE id IN(",P_id,");");
	
	PREPARE execQuery FROM @sqlQuery;
	EXECUTE execQuery;
	DEALLOCATE PREPARE execQuery;
    
    IF(@coincidencias != 0)THEN    
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
			
			SELECT 'TRUE' AS respuesta, 'Subfamilia eliminada satisfactoriamente' AS 'mensaje';
		ELSE
			SELECT 'FALSE' AS respuesta, 'Subfamilia asignada a familias' AS 'mensaje';
		END IF;
	ELSE
		SELECT 'FALSE' AS respuesta, 'No existe la subfamilia' AS 'mensaje';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPI_serviciosEventosMasivo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPI_serviciosEventosMasivo`(IN P_valores TEXT)
BEGIN
	SET @sqlQuery = CONCAT("INSERT INTO serviciosEventos (servicio, evento) VALUES ",P_valores,";");
    
    PREPARE execQuery FROM @sqlQuery;
	EXECUTE execQuery;
	DEALLOCATE PREPARE execQuery;
    
    SELECT 'TRUE' AS respuesta, 'Servicios insertados correctamente' AS mensaje;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPQ_cat_bancos`(IN P_id INT)
BEGIN
	IF(P_id IS NULL OR P_id="")THEN
		SELECT * FROM cat_bancos ORDER BY nombre;
	ELSE
		SET @bancos=0;
        
        SELECT COUNT(*) INTO @bancos FROM cat_bancos WHERE id=P_id;
        
        IF(@bancos=0)THEN
			SELECT 'FALSE' AS respuesta, 'No existe el banco' AS mensaje;
		ELSE
			SELECT * FROM cat_bancos WHERE id=P_id;
		END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPQ_cat_estados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPQ_cat_estados`(IN P_id INT)
BEGIN
	IF(P_id>=0)THEN
		SET @estados=0;
        
        SELECT COUNT(*) INTO @estados FROM cat_estados WHERE id=P_id;
        
        IF(@estados=0)THEN
			SELECT 'FALSE' AS respuesta, 'No existe el estado' AS mensaje;
		ELSE
			SELECT * FROM cat_estados WHERE id=P_id;
		END IF;
	ELSE
		SELECT * FROM cat_estados ORDER BY nombre;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPQ_cat_guardias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPQ_cat_guardias`(IN P_id INT)
BEGIN
	IF(P_id IS NULL OR P_id = "")THEN
		SELECT * FROM cat_guardias ORDER BY nombre;
	ELSE
		SET @guardias=0;
        
        SELECT COUNT(*) INTO @guardias FROM cat_guardias WHERE id=P_id;
        
		IF(@guardias=0)THEN
			SELECT 'FALSE' AS respuesta, 'No existe el guardia' AS mensaje;
		ELSE
			SELECT * FROM cat_guardias WHERE id=P_guardia;
		END IF;
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
	SET @coincidencias=0;
    
    SET @sqlQuery = CONCAT("SELECT COUNT(*) INTO @coincidencias FROM cat_tiposEvento WHERE id IN(",P_id,");");
	
	PREPARE execQuery FROM @sqlQuery;
	EXECUTE execQuery;
	DEALLOCATE PREPARE execQuery;
    
    IF(@coincidencias != 0)THEN    
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
			
			SELECT 'TRUE' AS respuesta, 'Tipo eliminado satisfactoriamente' AS 'mensaje';
		ELSE
			SELECT 'FALSE' AS respuesta, 'Tipo asignado a eventos' AS 'mensaje';
		END IF;
	ELSE
		SELECT 'FALSE' AS respuesta, 'No existe el tipo' AS 'mensaje';
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
	SET @coincidencias=0;
    
    SET @sqlQuery = CONCAT("SELECT COUNT(*) INTO @coincidencias FROM clientes WHERE id IN(",P_id,");");
	
	PREPARE execQuery FROM @sqlQuery;
	EXECUTE execQuery;
	DEALLOCATE PREPARE execQuery;
    
    IF(@coincidencias != 0)THEN    
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
			
			SELECT 'TRUE' AS respuesta, 'Cliente eliminado satisfactoriamente' AS 'mensaje';
		ELSE
			SELECT 'FALSE' AS respuesta, 'Cliente asignado a eventos' AS 'mensaje';
		END IF;
	ELSE
		SELECT 'FALSE' AS respuesta, 'No existe el cliente' AS 'mensaje';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPD_cuentasBancarias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPD_cuentasBancarias`(IN P_id VARCHAR(200))
BEGIN
	SET @coincidencias=0;
    
    SET @sqlQuery = CONCAT("SELECT COUNT(*) INTO @coincidencias FROM cuentasBancarias WHERE id IN(",P_id,");");
	
	PREPARE execQuery FROM @sqlQuery;
	EXECUTE execQuery;
	DEALLOCATE PREPARE execQuery;
    
    IF(@coincidencias != 0)THEN    
		SET @dependencias = 0;
        SET @origenDependencia = '';
		
		SET @sqlQuery = CONCAT("SELECT SUM(info), GROUP_CONCAT(tabla SEPARATOR ', ') INTO @dependencias, @origenDependencia FROM (
									SELECT COUNT(*) AS info, CASE WHEN COUNT(*)>0 THEN 'eventos' END AS tabla FROM eventos WHERE cuentaBancaria IN(",P_id,")
									UNION
									SELECT COUNT(*) AS info, CASE WHEN COUNT(*)>0 THEN 'gastos' END AS tabla FROM gastos WHERE cuentaBancaria IN(",P_id,")
									UNION
									SELECT COUNT(*) AS info, CASE WHEN COUNT(*)>0 THEN 'cobros' END AS tabla FROM cobros WHERE cuentaBancaria IN(",P_id,")
								) tmp;");
		
		PREPARE execQuery FROM @sqlQuery;
		EXECUTE execQuery;
		DEALLOCATE PREPARE execQuery;
		
		IF(@dependencias=0) THEN         
			SET @sqlQuery = CONCAT("DELETE FROM cuentasBancarias WHERE id IN(",P_id,");");
			
			PREPARE execQuery FROM @sqlQuery;
			EXECUTE execQuery;
			DEALLOCATE PREPARE execQuery;
			
			SELECT 'TRUE' AS respuesta, 'Cuenta bancaria eliminadasatisfactoriamente' AS 'mensaje';
		ELSE
			SELECT 'FALSE' AS respuesta, CONCAT('Cuenta bancaria asignada a ',@origenDependencia) AS 'mensaje';
		END IF;
	ELSE
		SELECT 'FALSE' AS respuesta, 'No existe la cuenta bancaria' AS 'mensaje';
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
	SET @coincidencias=0;
    
    SET @sqlQuery = CONCAT("SELECT COUNT(*) INTO @coincidencias FROM empleados WHERE id IN(",P_id,");");
	
	PREPARE execQuery FROM @sqlQuery;
	EXECUTE execQuery;
	DEALLOCATE PREPARE execQuery;
    
    IF(@coincidencias != 0)THEN    
		SET @dependencias = 0;
        SET @origenDependencia = '';
		
		SET @sqlQuery = CONCAT("SELECT SUM(info), GROUP_CONCAT(tabla SEPARATOR ', ') INTO @dependencias, @origenDependencia FROM (
										SELECT COUNT(*) AS info, CASE WHEN COUNT(*)>0 THEN 'gastos' END AS tabla FROM gastos WHERE empleado IN(",P_id,")
										UNION
										SELECT COUNT(*) AS info, CASE WHEN COUNT(*)>0 THEN 'usuarios' END AS tabla FROM usuarios WHERE empleado IN(",P_id,")
										UNION
										SELECT COUNT(*) AS info, CASE WHEN COUNT(*)>0 THEN 'vendedores' END AS tabla FROM vendedores WHERE empleado IN(",P_id,")
								) tmp");
		
		PREPARE execQuery FROM @sqlQuery;
		EXECUTE execQuery;
		DEALLOCATE PREPARE execQuery;
		
		IF(@dependencias=0) THEN        
			SET @sqlQuery = CONCAT("DELETE FROM empleados WHERE id IN(",P_id,");");
			
			PREPARE execQuery FROM @sqlQuery;
			EXECUTE execQuery;
			DEALLOCATE PREPARE execQuery;
			
			SELECT 'TRUE' AS respuesta, 'Empleado eliminado satisfactoriamente' AS 'mensaje';
		ELSE
			SELECT 'FALSE' AS respuesta, CONCAT('Empleado asignado a ',@origenDependencia) AS 'mensaje';
		END IF;
	ELSE
		SELECT 'FALSE' AS respuesta, 'No existe el empleado' AS 'mensaje';
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPQ_cat_lugares`(IN P_id INT)
BEGIN
	IF(P_id IS NULL OR P_id="")THEN
		SELECT * FROM cat_lugares ORDER BY nombre;
	ELSE
		SET @lugares=0;
        
        SELECT COUNT(*) INTO @lugares FROM cat_lugares WHERE id=P_id;
        
        IF(@lugares=0)THEN
			SELECT 'FALSE' AS respuesta, 'No existe el lugar' AS mensaje;
		ELSE
			SELECT * FROM cat_lugares WHERE id=P_id;
		END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPQ_cat_metodosPago` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPQ_cat_metodosPago`(IN P_id INT)
BEGIN
	IF(P_id IS NULL OR P_id="")THEN
		SELECT * FROM cat_metodosPago ORDER BY nombre;
	ELSE
		SET @metodosPago=0;
        
        SELECT COUNT(*) INTO @metodosPago FROM cat_metodosPago WHERE id=P_id;
        
        IF(@metodosPago=0)THEN
			SELECT 'FALSE' AS respuesta, 'No existe el método de pago' AS mensaje;
		ELSE
			SELECT * FROM cat_metodosPago WHERE id=P_id;
		END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPQ_cat_puestos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPQ_cat_puestos`(IN P_id INT)
BEGIN
	IF(P_id IS NULL OR P_id="")THEN
		SELECT * FROM cat_puestos ORDER BY nombre;
	ELSE
		SET @puestos=0;
        
        SELECT COUNT(*) INTO @puestos FROM cat_puestos WHERE id=P_id;
        
        IF(@puestos=0)THEN
			SELECT 'FALSE' AS respuesta, 'No existe el puesto' AS mensaje;
		ELSE
			SELECT * FROM cat_puestos WHERE id=P_id;
		END IF;
    END IF;
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
	SET @coincidencias=0;
    
    SET @sqlQuery = CONCAT("SELECT COUNT(*) INTO @coincidencias FROM eventos WHERE id IN(",P_id,");");
	
	PREPARE execQuery FROM @sqlQuery;
	EXECUTE execQuery;
	DEALLOCATE PREPARE execQuery;
    
    IF(@coincidencias != 0)THEN    
		SET @dependencias = 0;
		SET @origenDependencia = '';
		
		SET @sqlQuery = CONCAT("SELECT SUM(info), GROUP_CONCAT(tabla SEPARATOR ', ') INTO @dependencias, @origenDependencia FROM(
										SELECT COUNT(*) AS info, CASE WHEN COUNT(*)>0 THEN 'gastos' END AS tabla FROM gastos WHERE evento IN(",P_id,")
										UNION
										SELECT COUNT(*) AS info, CASE WHEN COUNT(*)>0 THEN 'cobros' END AS tabla FROM cobros WHERE evento IN(",P_id,")
								) tmp");
		
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
			
			SELECT 'TRUE' AS respuesta, 'Evento eliminado satisfactoriamente' AS 'mensaje';
		ELSE
			SELECT 'FALSE' AS respuesta, CONCAT('Evento asignado a ',@origenDependencia) AS 'mensaje';
		END IF;
	ELSE
		SELECT 'FALSE' AS respuesta, 'No existe el evento' AS 'mensaje';
	END IF;
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
	SET @coincidencias=0;
    
    SET @sqlQuery = CONCAT("SELECT COUNT(*) INTO @coincidencias FROM modulos WHERE id IN(",P_id,");");
	
	PREPARE execQuery FROM @sqlQuery;
	EXECUTE execQuery;
	DEALLOCATE PREPARE execQuery;
    
    IF(@coincidencias != 0)THEN    
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
			
			SELECT 'TRUE' AS respuesta, 'Módulo eliminado satisfactoriamente' AS 'mensaje';
		ELSE
			SELECT 'FALSE' AS respuesta, 'Módulo asignado a un rol' AS 'mensaje';
		END IF;
	ELSE
		SELECT 'FALSE' AS respuesta, 'No existe el módulo' AS 'mensaje';
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
	SET @coincidencias=0;
    
    SET @sqlQuery = CONCAT("SELECT COUNT(*) INTO @coincidencias FROM proveedores WHERE id IN(",P_id,");");
	
	PREPARE execQuery FROM @sqlQuery;
	EXECUTE execQuery;
	DEALLOCATE PREPARE execQuery;
    
    IF(@coincidencias != 0)THEN    
		SET @sqlQuery = CONCAT("DELETE FROM proveedores WHERE id IN(",P_id,");");
		
		PREPARE execQuery FROM @sqlQuery;
		EXECUTE execQuery;
		DEALLOCATE PREPARE execQuery;
		
		SELECT 'TRUE' AS respuesta, 'Proveedor eliminado satisfactoriamente' AS 'mensaje';
	ELSE
		SELECT 'FALSE' AS respuesta, 'No existe el proveedor' AS 'mensaje';
	END IF;
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
	SET @coincidencias=0;
    
    SET @sqlQuery = CONCAT("SELECT COUNT(*) INTO @coincidencias FROM rolesModulos WHERE id IN(",P_id,");");
	
	PREPARE execQuery FROM @sqlQuery;
	EXECUTE execQuery;
	DEALLOCATE PREPARE execQuery;
    
    IF(@coincidencias != 0)THEN    
		SET @sqlQuery = CONCAT("DELETE FROM rolesModulos WHERE id IN(",P_id,");");
		
		PREPARE execQuery FROM @sqlQuery;
		EXECUTE execQuery;
		DEALLOCATE PREPARE execQuery;
		
		SELECT 'TRUE' AS respuesta, 'Rol asignado a módulo, eliminado satisfactoriamente' AS 'mensaje';
	ELSE
		SELECT 'FALSE' AS respuesta, 'No existe el rol asignado a módulo' AS 'mensaje';
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
	SET @coincidencias=0;
    
    SET @sqlQuery = CONCAT("SELECT COUNT(*) INTO @coincidencias FROM servicios WHERE id IN(",P_id,");");
	
	PREPARE execQuery FROM @sqlQuery;
	EXECUTE execQuery;
	DEALLOCATE PREPARE execQuery;
    
    IF(@coincidencias != 0)THEN    
		SET @dependencias = 0;
		
		SET @sqlQuery = CONCAT("SELECT COUNT(*) INTO @dependencias FROM serviciosEventos WHERE servicio IN(",P_id,");");
		
		PREPARE execQuery FROM @sqlQuery;
		EXECUTE execQuery;
		DEALLOCATE PREPARE execQuery;
		
		IF(@dependencias=0) THEN          
			SET @sqlQuery = CONCAT("DELETE FROM servicios WHERE id IN(",P_id,");");
			
			PREPARE execQuery FROM @sqlQuery;
			EXECUTE execQuery;
			DEALLOCATE PREPARE execQuery;
			
			SELECT 'TRUE' AS respuesta, 'Servicio eliminado satisfactoriamente' AS 'mensaje';
		ELSE
			SELECT 'FALSE' AS respuesta, 'Servicio asignado a eventos' AS 'mensaje';
		END IF;
	ELSE
		SELECT 'FALSE' AS respuesta, 'No existe el servicio' AS 'mensaje';
	END IF;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPQ_cat_ranking`(IN P_id INT)
BEGIN
	IF(P_id IS NULL OR P_id="")THEN
		SELECT * FROM cat_ranking ORDER BY nombre;
	ELSE
		SET @ranking=0;
        
        SELECT COUNT(*) INTO @ranking FROM cat_ranking WHERE id=P_id;
        
        IF(@ranking=0)THEN
			SELECT 'FALSE' AS respuesta, 'No existe el ranking' AS mensaje;
		ELSE
			SELECT * FROM cat_ranking WHERE id=P_id;
		END IF;
    END IF;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPQ_cat_roles`(IN P_id INT)
BEGIN
	IF(P_id IS NULL OR P_id="")THEN
		SELECT * FROM cat_roles ORDER BY nombre;
	ELSE
		SET @roles=0;
        
        SELECT COUNT(*) INTO @roles FROM cat_roles WHERE id=P_id;
        
        IF(@roles=0)THEN
			SELECT 'FALSE' AS respuesta, 'No existe el rol' AS mensaje;
		ELSE
			SELECT * FROM cat_roles WHERE id=P_id;
		END IF;
    END IF;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPQ_cat_status`(IN P_id INT)
BEGIN
	IF(P_id IS NULL OR P_id="")THEN
		SELECT * FROM cat_status ORDER BY nombre;
	ELSE
		SET @estatus=0;
        
        SELECT COUNT(*) INTO @estatus FROM cat_status WHERE id=P_id;
        
        IF(@estatus=0)THEN
			SELECT 'FALSE' AS respuesta, 'No existe el status' AS mensaje;
		ELSE
			SELECT * FROM cat_status WHERE id=P_id;
		END IF;
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
	SET @coincidencias=0;
    
    SET @sqlQuery = CONCAT("SELECT COUNT(*) INTO @coincidencias FROM serviciosEventos WHERE id IN(",P_id,");");
	
	PREPARE execQuery FROM @sqlQuery;
	EXECUTE execQuery;
	DEALLOCATE PREPARE execQuery;
    
    IF(@coincidencias != 0)THEN  
		SET @sqlQuery = CONCAT("DELETE FROM serviciosEventos WHERE id IN(",P_id,");");
		
		PREPARE execQuery FROM @sqlQuery;
		EXECUTE execQuery;
		DEALLOCATE PREPARE execQuery;
			
		SELECT 'TRUE' AS respuesta, 'Servicio relacionado con eventos, eliminado satisfactoriamente' AS 'mensaje';
	ELSE
		SELECT 'FALSE' AS respuesta, 'No existe el servicio relacionado con eventos' AS 'mensaje';
	END IF;
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
	SET @coincidencias=0;
    
    SET @sqlQuery = CONCAT("SELECT COUNT(*) INTO @coincidencias FROM vendedores WHERE id IN(",P_id,");");
	
	PREPARE execQuery FROM @sqlQuery;
	EXECUTE execQuery;
	DEALLOCATE PREPARE execQuery;
    
    IF(@coincidencias != 0)THEN  
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
			
			SELECT 'TRUE' AS respuesta, 'Vendedor eliminado satisfactoriamente' AS 'mensaje';
		ELSE
			SELECT 'FALSE' AS respuesta, 'Vendedor asignado a eventos' AS 'mensaje';
		END IF;
	ELSE
		SELECT 'FALSE' AS respuesta, 'No existe el vendedor' AS 'mensaje';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPQ_articulos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPQ_articulos`(IN P_id INT, IN P_filtro VARCHAR(200), IN P_order VARCHAR(50))
BEGIN
	SET @sqlQuery = "SELECT a.id, a.clave, a.nombre, a.linea, a.marca, a.modelo, a.descripcion, cl.id AS id_lugar, cl.nombre AS lugar, a.codigoBarras, 
							a.sustituto, a.unidad, a.existencias, ca.id AS id_area, ca.nombre AS area, cf.id AS id_familia, cf.nombre AS familia,
                            csf.id AS id_subfamilia, csf.nombre AS subfamilia, a.archivo, a.precioRecuperacion, a.precioLista, a.precioMayoreo
					FROM articulos a
					LEFT JOIN cat_areas ca ON a.area=ca.id
                    LEFT JOIN cat_familias cf ON ca.familia=cf.id
                    LEFT JOIN cat_subfamilias csf ON cf.subfamilia=csf.id
					LEFT JOIN cat_lugares cl ON a.lugar=cl.id";
	
	IF(P_id IS NOT NULL AND P_id!="")THEN
		SET @sqlQuery = CONCAT(@sqlQuery," WHERE a.id=",P_id);
	ELSE
		IF(P_filtro IS NOT NULL AND P_filtro!="")THEN
			SET @sqlQuery = CONCAT(@sqlQuery," HAVING ",P_filtro);
		END IF;
		IF(P_order IS NOT NULL AND P_order!="")THEN
			SET @sqlQuery = CONCAT(@sqlQuery," ORDER BY ",P_order);
		END IF;
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
/*!50003 DROP PROCEDURE IF EXISTS `SPQ_articulosEventos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPQ_articulosEventos`(IN P_id INT, IN P_evento INT, IN P_order VARCHAR(50))
BEGIN
	IF((P_id!="" AND P_id IS NOT NULL) OR (P_evento!="" AND P_evento IS NOT NULL)) THEN
		SET @sqlQuery = "SELECT ae.id, a.id AS id_articulo, ca.id AS id_area, cf.id AS id_familia, cs.id AS id_subfamilia, a.nombre AS articulo, e.id AS id_evento, e.nombre AS evento, ae.cantidad, a.precioLista, (a.precioLista*ae.cantidad) AS total
						FROM articulosEventos ae
							LEFT JOIN articulos a ON a.id=ae.articulo
                            LEFT JOIN cat_areas ca ON ca.id=a.area
                            LEFT JOIN cat_familias cf ON cf.id=ca.familia
                            LEFT JOIN cat_subfamilias cs ON cs.id=cf.subfamilia
							LEFT JOIN eventos e ON e.id=ae.evento ";
		
		IF(P_id!="" AND P_id IS NOT NULL) THEN
			SET @sqlQuery = CONCAT(@sqlQuery," WHERE ae.id=",P_id,";");
		ELSE
			IF(P_evento!="" AND P_evento IS NOT NULL)THEN
				SET @sqlQuery = CONCAT(@sqlQuery," HAVING id_evento=",P_evento);
			END IF;
			IF(P_order IS NOT NULL AND P_order!="")THEN
				SET @sqlQuery = CONCAT(@sqlQuery," ORDER BY ",P_order);
			END IF;
		END IF;
		
		SET @sqlQuery = CONCAT(@sqlQuery,";");
		
		PREPARE execQuery FROM @sqlQuery;
		EXECUTE execQuery;
		DEALLOCATE PREPARE execQuery;
	ELSE
		SELECT ae.id, a.id AS id_articulo, a.nombre AS articulo, e.id AS id_evento, e.nombre AS evento, ae.cantidad, a.precioLista, (a.precioLista*ae.cantidad) AS total
		FROM articulosEventos ae
		LEFT JOIN articulos a 
			ON a.id=ae.articulo
		LEFT JOIN eventos e 
			ON e.id=ae.evento
		WHERE evento IS NULL;
	END IF;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPQ_cat_subfamilias`(IN P_id INT)
BEGIN
	IF(P_id IS NULL OR P_id = "")THEN
		SELECT * FROM cat_subfamilias ORDER BY nombre;
	ELSE
		SET @subfamilias=0;
        
        SELECT COUNT(*) INTO @subfamilias FROM cat_subfamilias WHERE id=P_id;
        
		IF(@subfamilias=0)THEN
			SELECT 'FALSE' AS respuesta, 'No existe la subfamilia' AS mensaje;
		ELSE
			SELECT * FROM cat_subfamilias WHERE id=P_id;
		END IF;
	END IF;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPQ_cat_tiposEvento`(IN P_id INT)
BEGIN
	IF(P_id IS NULL OR P_id="")THEN
		SELECT * FROM cat_tiposEvento ORDER BY nombre;
	ELSE
		SET @tiposEvento=0;
        
        SELECT COUNT(*) INTO @tiposEvento FROM cat_tiposEvento WHERE id=P_id;
        
        IF(@tiposEvento=0)THEN
			SELECT 'FALSE' AS respuesta, 'No existe el tipo de eventos' AS mensaje;
		ELSE
			SELECT * FROM cat_tiposEvento WHERE id=P_id;
		END IF;
    END IF;
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
	SELECT llave FROM usuarios WHERE BINARY nombre=P_Usuario;
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

	SELECT 'TRUE' AS respuesta, u.id, u.nombre AS usuario, e.nombre, u.rol 
	FROM usuarios u
	JOIN empleados e
		ON u.empleado=e.id
	WHERE u.id = @userID;
ELSE
  SELECT 'FALSE' AS respuesta, 'Contraseña incorrecta' AS mensaje;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPQ_cat_areas`(IN P_id INT, IN P_familia INT)
BEGIN
	IF(P_id IS NULL OR P_id="")THEN
		IF(P_familia>=0) THEN
			SET @areas=0;
		
			SELECT COUNT(*) INTO @areas FROM cat_areas WHERE familia=P_familia;
			
			IF(@areas=0)THEN
				SELECT 'FALSE' AS respuesta, 'No hay areas relacionadas' AS mensaje;
			ELSE
				SELECT a.id, a.nombre, f.id AS id_familia, f.nombre AS familia, sf.id AS id_subfamilia, sf.nombre AS subfamilia 
            FROM cat_areas a
            LEFT JOIN cat_familias f
				ON a.familia=f.id
			LEFT JOIN cat_subfamilias sf
				ON f.subfamilia=sf.id
			WHERE a.familia=P_familia ORDER BY a.nombre;
			END IF;
		ELSE
			SELECT a.id, a.nombre, f.id AS id_familia, f.nombre AS familia, sf.id AS id_subfamilia, sf.nombre AS subfamilia
            FROM cat_areas a
            LEFT JOIN cat_familias f
				ON a.familia=f.id
			LEFT JOIN cat_subfamilias sf
				ON f.subfamilia=sf.id
			ORDER BY a.nombre;
		END IF;
	ELSE
		SET @areas=0;
        
		SELECT COUNT(*) INTO @areas FROM cat_areas WHERE id=P_id;
		
		IF(@areas=0)THEN
			SELECT 'FALSE' AS respuesta, 'No existe el área' AS mensaje;
		ELSE
			SELECT a.id, a.nombre, f.id AS id_familia, f.nombre AS familia, sf.id AS id_subfamilia, sf.nombre AS subfamilia 
            FROM cat_areas a
            LEFT JOIN cat_familias f
				ON a.familia=f.id
			LEFT JOIN cat_subfamilias sf
				ON f.subfamilia=sf.id
			WHERE a.id=P_id;
		END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPQ_cat_ciudades` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPQ_cat_ciudades`(IN P_id INT, IN P_estado INT)
BEGIN
	IF(P_id IS NULL OR P_id="")THEN
		IF(P_estado IS NULL OR P_estado="") THEN
			SELECT c.id, c.nombre, e.id AS id_estado, e.nombre AS estado
            FROM cat_ciudades c
            LEFT JOIN cat_estados e
				ON c.estado=e.id
            ORDER BY c.nombre;
		ELSE
			SET @ciudades=0;
			
			SELECT COUNT(*) INTO @ciudades FROM cat_ciudades WHERE estado=P_estado;
			
			IF(@ciudades=0)THEN
				SELECT 'FALSE' AS respuesta, 'No existen ciudades en el estado' AS mensaje;
			ELSE
				SELECT c.id, c.nombre, e.id AS id_estado, e.nombre AS estado
            FROM cat_ciudades c
            LEFT JOIN cat_estados e
				ON c.estado=e.id
			WHERE c.estado=P_estado ORDER BY c.nombre;
			END IF;
		END IF;
	ELSE
		SET @ciudades=0;
        
		SELECT COUNT(*) INTO @ciudades FROM cat_ciudades WHERE id=P_id;
		
		IF(@ciudades=0)THEN
			SELECT 'FALSE' AS respuesta, 'No existe la ciudad' AS mensaje;
		ELSE
			SELECT c.id, c.nombre, e.id AS id_estado, e.nombre AS estado
            FROM cat_ciudades c
            LEFT JOIN cat_estados e
				ON c.estado=e.id
			WHERE c.id=P_id;
		END IF;
    END IF;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPQ_cat_familias`(IN P_id INT, IN P_subfamilia INT)
BEGIN
	IF(P_id IS NULL OR P_id="")THEN
		IF(P_subfamilia>=0) THEN
            SET @familias=0;
        
			SELECT COUNT(*) INTO @familias FROM cat_familias WHERE subfamilia=P_subfamilia;
			
			IF(@familias=0)THEN
				SELECT 'FALSE' AS respuesta, 'No hay familias relacionadas' AS mensaje;
			ELSE
				SELECT f.id, f.nombre, s.id AS id_subfamilia, s.nombre AS subfamilia
                FROM cat_familias f
                LEFT JOIN cat_subfamilias s
					ON f.subfamilia=s.id
                WHERE f.subfamilia=P_subfamilia ORDER BY nombre;
			END IF;
		ELSE
			SELECT f.id, f.nombre, s.id AS id_subfamilia, s.nombre AS subfamilia
                FROM cat_familias f
                LEFT JOIN cat_subfamilias s
					ON f.subfamilia=s.id
				ORDER BY f.nombre;
		END IF;
	ELSE
		SET @familias=0;
        
		SELECT COUNT(*) INTO @familias FROM cat_familias WHERE id=P_id;
		
		IF(@familias=0)THEN
			SELECT 'FALSE' AS respuesta, 'No existe la familia' AS mensaje;
		ELSE
			SELECT f.id, f.nombre, s.id AS id_subfamilia, s.nombre AS subfamilia
                FROM cat_familias f
                LEFT JOIN cat_subfamilias s
					ON f.subfamilia=s.id
				WHERE f.id=P_id;
		END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPQ_clientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPQ_clientes`(IN P_id INT, IN P_filtro VARCHAR(200), IN P_order VARCHAR(50))
BEGIN
	SET @sqlQuery = "SELECT c.id, c.clave, c.nombre, c.nombreComercial, c.cargo, c.montoCredito, c.diasCredito, c.tipoContacto, c.nombreContacto, c.webContacto, 
							c.direccionContacto, c.coloniaContacto, cc.id AS id_ciudadContacto, cc.nombre AS ciudadContacto, ec.id AS id_estadoContacto,
                            ec.nombre AS estadoContacto, c.codigoPostalContacto, c.telefonoContacto, c.celularContacto, c.emailContacto, c.rfcFiscal, c.razonSocialFiscal,
                            c.calleFiscal, c.coloniaFiscal, cf.id AS id_ciudadFiscal, ef.id AS id_estadoFiscal, ef.nombre AS estadoFiscal, cf.nombre AS ciudadFiscal,
                            c.paisFiscal, c.codigoPostalFiscal, c.numeroInteriorFiscal, c.numeroExteriorFiscal, c.localidadFiscal, c.municipioFiscal	 
					FROM clientes c
					LEFT JOIN cat_ciudades cc ON c.ciudadContacto=cc.id
                    LEFT JOIN cat_estados ec ON cc.estado=ec.id
					LEFT JOIN cat_ciudades cf ON c.ciudadFiscal=cf.id
                    LEFT JOIN cat_estados ef ON cf.estado=ef.id";
	
	IF(P_id IS NOT NULL AND P_id!="")THEN
		SET @sqlQuery = CONCAT(@sqlQuery," WHERE c.id=",P_id);
	ELSE
		IF(P_filtro IS NOT NULL AND P_filtro!="")THEN
			SET @sqlQuery = CONCAT(@sqlQuery," HAVING ",P_filtro);
		END IF;
		IF(P_order IS NOT NULL AND P_order!="")THEN
			SET @sqlQuery = CONCAT(@sqlQuery," ORDER BY ",P_order);
		END IF;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPQ_modulos`(IN P_id INT, IN P_filtro VARCHAR(200), IN P_order VARCHAR(50))
BEGIN
	SET @sqlQuery = "SELECT * FROM modulos";
	
	IF(P_id IS NOT NULL AND P_id!="")THEN
		SET @sqlQuery = CONCAT(@sqlQuery," WHERE id=",P_id);
	ELSE
		IF(P_filtro IS NOT NULL AND P_filtro!="")THEN
			SET @sqlQuery = CONCAT(@sqlQuery," WHERE ",P_filtro);
		END IF;
		IF(P_order IS NOT NULL AND P_order!="")THEN
			SET @sqlQuery = CONCAT(@sqlQuery," ORDER BY ",P_order);
		END IF;
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
	    
		SELECT 'TRUE' AS respuesta, 'Rol agregado correctamente' AS 'mensaje';
    ELSE
		SET @coincidencias=0;
        
        SELECT COUNT(*) INTO @coincidencias FROM cat_roles WHERE id=P_id;
        
        IF(@coincidencias != 0)THEN    
			UPDATE cat_roles SET nombre=P_nombre WHERE id=P_id;
			
			SELECT 'TRUE' AS respuesta, 'Rol actualizado correctamente' AS 'mensaje';
		ELSE
			SELECT 'FALSE' AS respuesta, 'No existe el rol' AS 'mensaje';
		END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPQ_cobros` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPQ_cobros`(IN P_id INT, IN P_filtro VARCHAR(200), IN P_order VARCHAR(50))
BEGIN
	SET @sqlQuery = "SELECT c.fecha, e.id AS id_evento, e.nombre AS evento, c.monto, cb.id AS id_cuentaBancaria, cb.nombre AS cuentaBancaria
					FROM cobros c
					LEFT JOIN eventos e ON c.evento=e.id
					LEFT JOIN cuentasBancarias cb ON c.cuentaBancaria=cb.id";
	
	IF(P_id IS NOT NULL AND P_id!="")THEN
		SET @sqlQuery = CONCAT(@sqlQuery," WHERE g.id=",P_id);
	END IF;
	IF((P_id IS NULL OR P_id="") AND P_filtro IS NOT NULL AND P_filtro!="")THEN
		SET @sqlQuery = CONCAT(@sqlQuery," HAVING ",P_filtro);
	END IF;
	IF(P_order IS NOT NULL AND P_order!="")THEN
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
/*!50003 DROP PROCEDURE IF EXISTS `SPQ_cuentasBancarias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPQ_cuentasBancarias`(IN P_id INT, IN P_filtro VARCHAR(200), IN P_order VARCHAR(50))
BEGIN
	SET @sqlQuery = "SELECT cb.id, cb.clave, cb.nombre, b.id AS id_banco, b.nombre AS banco, cb.noCuenta, cb.clabe, cb.saldo
					FROM cuentasBancarias cb
					LEFT JOIN cat_bancos b ON cb.banco=b.id";
	
	IF(P_id IS NOT NULL AND P_id!="")THEN
		SET @sqlQuery = CONCAT(@sqlQuery," WHERE cb.id=",P_id);
	END IF;
	IF((P_id IS NULL OR P_id="") AND P_filtro IS NOT NULL AND P_filtro!="")THEN
		SET @sqlQuery = CONCAT(@sqlQuery," HAVING ",P_filtro);
	END IF;
	IF(P_order IS NOT NULL AND P_order!="")THEN
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
/*!50003 DROP PROCEDURE IF EXISTS `SPQ_empleados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPQ_empleados`(IN P_id INT, IN P_filtro VARCHAR(200), IN P_order VARCHAR(50))
BEGIN
	SET @sqlQuery = "SELECT e.id, e.clave, e.nombre, p.id AS id_puesto, p.nombre AS puesto, e.domicilio, e.colonia, c.id AS id_ciudad, c.nombre AS ciudad, 
							ce.id AS id_estado, ce.nombre AS estado, e.codigoPostal, e.telefono, e.celular, e.email, e.lunes, e.martes, e.miercoles, e.jueves, e.viernes, e.sabado
					FROM empleados e
					LEFT JOIN cat_puestos p ON e.puesto=p.id
					LEFT JOIN cat_ciudades c ON e.ciudad=c.id
					LEFT JOIN cat_estados ce ON c.estado=ce.id";
	
	IF(P_id IS NOT NULL AND P_id!="")THEN
		SET @sqlQuery = CONCAT(@sqlQuery," WHERE e.id=",P_id);
	END IF;
	IF((P_id IS NULL OR P_id="") AND P_filtro IS NOT NULL AND P_filtro!="")THEN
		SET @sqlQuery = CONCAT(@sqlQuery," HAVING ",P_filtro);
	END IF;
	IF(P_order IS NOT NULL AND P_order!="")THEN
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
/*!50003 DROP PROCEDURE IF EXISTS `SPQ_estadoDeCuenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPQ_estadoDeCuenta`(IN P_id INT, IN P_fechaIni VARCHAR(20), IN P_fechaFin VARCHAR(20))
BEGIN
	SET @sqlQuery = CONCAT("SELECT cb.nombre AS cuentaBancaria, b.nombre AS banco, cb.noCuenta, cb.clabe, cb.saldo,
							g.fechaRealizado AS fechaGasto, g.monto AS montoGasto, g.concepto AS gasto, 
                            c.fecha AS fechaCobro, c.monto AS montoCobro, c.concepto AS cobro
							FROM cuentasBancarias cb
							LEFT JOIN cat_bancos b ON cb.banco=b.id
							LEFT JOIN cobros c ON c.cuentaBancaria = cb.id
							LEFT JOIN gastos g ON g.cuentaBancaria = cb.id
							WHERE cb.id=",P_id);
	
	IF(P_fechaIni IS NOT NULL AND P_fechaIni!="")THEN
		SET @sqlQuery = CONCAT(@sqlQuery," AND (g.fechaSolicitud>=",P_fechaIni," AND c.fecha>=",P_fechaIni,")");
	END IF;
	IF(P_fechaFin IS NOT NULL AND P_fechaFin!="")THEN
		SET @sqlQuery = CONCAT(@sqlQuery," AND (g.fechaSolicitud<=",P_fechaFin," AND c.fecha<=",P_fechaFin,")");
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
/*!50003 DROP PROCEDURE IF EXISTS `SPQ_eventos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPQ_eventos`(IN P_id INT, IN P_filtro VARCHAR(200), IN P_order VARCHAR(50))
BEGIN
	SET @sqlQuery = "SELECT e.id, e.nombre, e.cotizacion, csc.id AS id_catStatusCotizacion, csc.nombre AS statusCotizacion, 
							cse.id AS id_catStatusEvento, cse.nombre AS statusEvento, c.id AS id_cliente, c.nombre AS cliente,
							cl.id AS id_catLugares, cl.nombre AS lugar, cte.id AS id_catTiposEvento, cte.nombre AS tipo,
                            e.fechaEntrega, e.fechaSeguimiento, e.fechaFinal, e.direccion, e.invitados, e.salon,
                            v.id AS id_vendedor, emp.nombre AS vendedor, e.utilidadCuenta, e.cuenta, e.montoServicios,
                            e.depositosEnGarantia, e.montoDepositosEnGarantia, cg.id AS id_catGuardias, cg.nombre AS guardias,
                            e.cantidadGuardias, e.montoGuardias, cmp.id AS id_catMetodosPago, cmp.nombre AS metodoPago,
                            cb.id AS id_cuentaBancaria, cb.nombre AS cuentaBancaria, b.id AS id_banco, b.nombre AS banco,
                            e.totalEvento, e.anticipo
					FROM eventos e
					LEFT JOIN cat_status csc ON e.statusCotizacion=csc.id
					LEFT JOIN cat_status cse ON e.statusEvento=cse.id
					LEFT JOIN clientes c ON e.cliente=c.id
					LEFT JOIN cat_lugares cl ON e.lugar=cl.id
					LEFT JOIN cat_tiposevento cte ON e.tipo=cte.id
					LEFT JOIN vendedores v ON e.vendedor=v.id
					LEFT JOIN empleados emp ON v.empleado=emp.id
					LEFT JOIN cat_guardias cg ON e.guardias=cg.id
					LEFT JOIN cat_metodospago cmp ON e.metodoPago=cmp.id
					LEFT JOIN cuentasBancarias cb ON e.cuentaBancaria=cb.id
                    LEFT JOIN cat_bancos b ON cb.banco=b.id";
	
	IF(P_id IS NOT NULL AND P_id!="")THEN
		SET @sqlQuery = CONCAT(@sqlQuery," WHERE e.id=",P_id);
	ELSE
		IF(P_filtro IS NOT NULL AND P_filtro!="")THEN
			SET @sqlQuery = CONCAT(@sqlQuery," HAVING ",P_filtro);
		END IF;
		IF(P_order IS NOT NULL AND P_order!="")THEN
			SET @sqlQuery = CONCAT(@sqlQuery," ORDER BY ",P_order);
		END IF;
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
	    
		SELECT 'TRUE' AS respuesta, 'Status agregado correctamente' AS 'mensaje';
    ELSE
		SET @coincidencias=0;
        
        SELECT COUNT(*) INTO @coincidencias FROM cat_status WHERE id=P_id;
        
        IF(@coincidencias != 0)THEN        
			UPDATE cat_status SET nombre=P_nombre WHERE id=P_id;
			
			SELECT 'TRUE' AS respuesta, 'Status actualizado correctamente' AS 'mensaje';
		ELSE
			SELECT 'FALSE' AS respuesta, 'No existe el status' AS 'mensaje';
		END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPQ_gastos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPQ_gastos`(IN P_id INT, IN P_filtro VARCHAR(200), IN P_order VARCHAR(50))
BEGIN
	SET @sqlQuery = "SELECT g.id, emp.id AS id_empleado, emp.nombre AS empleado, ev.id AS id_evento, ev.nombre AS evento, g.direccion, g.concepto,
							g.telefonoContacto, g.fechaSolicitud, g.fechaRequerido, g.fechaEntrega,	ca.id AS id_area, ca.nombre AS area
					FROM gastos g
					LEFT JOIN empleados emp ON g.empleado=emp.id
					LEFT JOIN eventos ev ON g.evento=ev.id
					LEFT JOIN cat_areas ca ON g.area=ca.id";
	
	IF(P_id IS NOT NULL AND P_id!="")THEN
		SET @sqlQuery = CONCAT(@sqlQuery," WHERE g.id=",P_id);
	END IF;
	IF((P_id IS NULL OR P_id="") AND P_filtro IS NOT NULL AND P_filtro!="")THEN
		SET @sqlQuery = CONCAT(@sqlQuery," WHERE ",P_filtro);
	END IF;
	IF(P_order IS NOT NULL AND P_order!="")THEN
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
/*!50003 DROP PROCEDURE IF EXISTS `SPQ_proveedores` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPQ_proveedores`(IN P_id INT, IN P_filtro VARCHAR(200), IN P_order VARCHAR(50))
BEGIN
	SET @sqlQuery = "SELECT p.id, p.clave, p.nombre, p.nombreContacto, p.nombre2Contacto, p.nombreEmpresaContacto, p.telefonoContacto, p.celularContacto, 
							p.emailContacto, p.webContacto, p.rfcFiscal, p.nombreComercialFiscal, p.calleFiscal, p.coloniaFiscal, cc.id AS id_ciudadFiscal,
							cc.nombre AS ciudadFiscal, ce.id AS id_estadoFiscal, ce.nombre AS estadoFiscal, p.codigoPostalFiscal
					FROM proveedores p
					LEFT JOIN cat_ciudades cc ON p.ciudadFiscal=cc.id
					LEFT JOIN cat_estados ce ON cc.estado=ce.id";
	
	IF(P_id IS NOT NULL AND P_id!="")THEN
		SET @sqlQuery = CONCAT(@sqlQuery," WHERE p.id=",P_id);
	ELSE
		IF(P_filtro IS NOT NULL AND P_filtro!="")THEN
			SET @sqlQuery = CONCAT(@sqlQuery," HAVING ",P_filtro);
		END IF;
		IF(P_order IS NOT NULL AND P_order!="")THEN
			SET @sqlQuery = CONCAT(@sqlQuery," ORDER BY ",P_order);
		END IF;
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
/*!50003 DROP PROCEDURE IF EXISTS `SPQ_rolesModulos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPQ_rolesModulos`(IN P_id INT, IN P_filtro VARCHAR(200), IN P_order VARCHAR(200))
BEGIN
	SET @sqlQuery = "SELECT rm.id AS id_rolModulo, m.id AS id_modulo, m.nombre AS modulo, r.id AS id_rol, r.nombre AS rol, m.url, m.claseAwesome, m.prioridad, m.orden, m.visible
					FROM rolesModulos rm
						LEFT JOIN cat_roles r ON r.id=rm.rol
						LEFT JOIN modulos m ON m.id=rm.modulo";
	
    IF(P_id IS NOT NULL AND P_id!="")THEN
		SET @sqlQuery = CONCAT(@sqlQuery," WHERE rm.id=",P_id);
    END IF;
    IF((P_id IS NULL OR P_id="") AND P_filtro IS NOT NULL AND P_filtro!="")THEN
		SET @sqlQuery = CONCAT(@sqlQuery," HAVING ",P_filtro);
    END IF;
    IF(P_order IS NOT NULL AND P_order!="")THEN
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
/*!50003 DROP PROCEDURE IF EXISTS `SPQ_servicios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPQ_servicios`(IN P_id INT, IN P_filtro VARCHAR(200), IN P_order VARCHAR(50))
BEGIN
	SET @sqlQuery = "SELECT s.id, s.clave, 
							s.concepto, 
							cs.id AS id_catSubFamilia, cs.nombre AS subFamilia,
                            cf.id AS id_catFamilia, cf.nombre AS familia,
                            ca.id AS id_catArea, ca.nombre AS area,
                            s.cantidad, 
                            s.precioUnitario, 
                            (s.cantidad*s.precioUnitario) AS total
					 FROM servicios s
					 LEFT JOIN cat_areas ca ON s.area=ca.id
					 LEFT JOIN cat_familias cf ON ca.familia=cf.id
					 LEFT JOIN cat_subFamilias cs ON cf.subFamilia=cs.id";
	
	IF(P_id IS NOT NULL AND P_id!="")THEN
		SET @sqlQuery = CONCAT(@sqlQuery," WHERE s.id=",P_id);
	ELSE
		IF(P_filtro IS NOT NULL AND P_filtro!="")THEN
			SET @sqlQuery = CONCAT(@sqlQuery," HAVING ",P_filtro);
		END IF;
		IF(P_order IS NOT NULL AND P_order!="")THEN
			SET @sqlQuery = CONCAT(@sqlQuery," ORDER BY ",P_order);
		END IF;
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
/*!50003 DROP PROCEDURE IF EXISTS `SPQ_serviciosEventos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPQ_serviciosEventos`(IN P_filtro VARCHAR(200), IN P_order VARCHAR(50))
BEGIN
	IF(P_filtro!="" AND P_filtro IS NOT NULL) THEN
		SET @sqlQuery = "SELECT se.id, s.id AS id_servicio, s.nombre AS servicio, e.id AS id_evento, e.nombre AS evento
						FROM serviciosEventos se
							LEFT JOIN servicios a ON s.id=se.servicio
							LEFT JOIN eventos e ON e.id=ae.evento
						HAVING ";
		
		SET @sqlQuery = CONCAT(@sqlQuery,P_filtro);

		IF(P_order IS NOT NULL AND P_order!="")THEN
			SET @sqlQuery = CONCAT(@sqlQuery," ORDER BY ",P_order);
		END IF;
		
		SET @sqlQuery = CONCAT(@sqlQuery,";");
		
		PREPARE execQuery FROM @sqlQuery;
		EXECUTE execQuery;
		DEALLOCATE PREPARE execQuery;
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
		
	SELECT 'TRUE' AS respuesta, 'Rol asignado correctamente a módulo' AS 'mensaje';
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
		
	SELECT 'TRUE' AS respuesta, 'Servicio asignado correctamente a evento' AS 'mensaje';
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPQ_usuarios`(IN P_id INT, IN P_filtro VARCHAR(200), IN P_order VARCHAR(50))
BEGIN
	SET @sqlQuery = "SELECT u.id, u.nombre, e.id AS id_empleado, e.nombre AS empleado, r.id AS id_rol, r.nombre AS rol
					FROM usuarios u
					LEFT JOIN empleados e ON u.empleado=e.id
					LEFT JOIN cat_roles r ON u.rol=r.id";
	
	IF(P_id IS NOT NULL AND P_id!="")THEN
		SET @sqlQuery = CONCAT(@sqlQuery," WHERE u.id=",P_id);
	ELSE
		IF((P_id IS NULL OR P_id="") AND P_filtro IS NOT NULL AND P_filtro!="")THEN
			SET @sqlQuery = CONCAT(@sqlQuery," HAVING ",P_filtro);
		END IF;
		IF(P_order IS NOT NULL AND P_order!="")THEN
			SET @sqlQuery = CONCAT(@sqlQuery," ORDER BY ",P_order);
		END IF;
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
/*!50003 DROP PROCEDURE IF EXISTS `SPQ_vendedores` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPQ_vendedores`(IN P_id INT, IN P_filtro VARCHAR(200), IN P_order VARCHAR(50))
BEGIN
	SET @sqlQuery = "SELECT v.id, emp.id AS id_empleado, emp.nombre AS nombre, cr.id AS id_ranking, cr.nombre AS ranking
					FROM vendedores v
					LEFT JOIN empleados emp ON v.empleado=emp.id
					LEFT JOIN cat_ranking cr ON v.ranking=cr.id";
	
	IF(P_id IS NOT NULL AND P_id!="")THEN
		SET @sqlQuery = CONCAT(@sqlQuery," WHERE v.id=",P_id);
	ELSE
		IF(P_filtro IS NOT NULL AND P_filtro!="")THEN
			SET @sqlQuery = CONCAT(@sqlQuery," HAVING ",P_filtro);
		END IF;
		IF(P_order IS NOT NULL AND P_order!="")THEN
			SET @sqlQuery = CONCAT(@sqlQuery," ORDER BY ",P_order);
		END IF;
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
ThisSP:BEGIN
	IF(P_id IS NULL OR P_id=0) THEN
		INSERT INTO articulos VALUES(0, P_clave, P_nombre, P_linea, P_marca, P_modelo, P_descripcion, P_lugar, P_codigoBarras, P_sustituto, P_unidad, P_existencias, P_area, P_archivo, P_precioRecuperacion, P_precioLista, P_precioMayoreo);
		
        SELECT 'TRUE' AS respuesta, 'Artículo agregado correctamente' AS 'mensaje';
	ELSE
		SET @coincidencias=0;
        
        SELECT COUNT(*) INTO @coincidencias FROM articulos WHERE id=P_id;
        
        IF(@coincidencias != 0)THEN        
			SELECT COUNT(*) INTO @coincidencias FROM articulos WHERE nombre=P_nombre AND id!=P_id;
			IF(@coincidencias != 0)THEN
				SELECT 'FALSE' AS respuesta, 'Nombre de artículo ya existe' AS 'mensaje';
				
				LEAVE ThisSP;
			END IF;
			
			SELECT COUNT(*) INTO @coincidencias FROM articulos WHERE clave=P_clave AND id!=P_id;
			IF(@coincidencias != 0)THEN
				SELECT 'FALSE' AS respuesta, 'Clave de artículo ya existe' AS 'mensaje';
				
				LEAVE ThisSP;
			END IF;
			
			UPDATE articulos SET clave=P_clave, nombre=P_nombre, linea=P_linea, marca=P_marca, modelo=P_modelo, descripcion=P_descripcion, lugar=P_lugar, codigoBarras=P_codigoBarras, sustituto=P_sustituto, unidad=Punidad, existencias=P_existencias, area=P_area, archivo=P_archivo, precioRecuperacion=P_precioRecuperacion, precioLista=P_precioLista, precioMayoreo=P_precioMayoreo WHERE id=P_id;
			
			SELECT 'TRUE' AS respuesta, 'Artículo actualizado correctamente' AS 'mensaje';
		ELSE
			SELECT 'FALSE' AS respuesta, 'No existe el artículo' AS 'mensaje';
		END IF;
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
		IF(P_evento IS NULL OR P_evento=0) THEN
			INSERT INTO articulosEventos VALUES (0,P_articulo,P_cantidad,NULL,CURRENT_TIMESTAMP);
		ELSE
			UPDATE articulosEventos SET evento=P_evento WHERE evento IS NULL AND DATE(fecha)=DATE(CURRENT_TIMESTAMP);
        END IF;
            
		SELECT 'TRUE' AS respuesta, 'Artículos en eventos asignados satisfactoriamente' AS 'mensaje';
	ELSE
		SET @coincidencias=0;
        
        SELECT COUNT(*) INTO @coincidencias FROM articulosEventos WHERE id=P_id;
        
        IF(@coincidencias != 0)THEN   
			SET @articulos = 0;
			
			SELECT SUM(total) INTO @articulos FROM(
				SELECT existencias AS total FROM articulos WHERE id = P_articulo
				UNION
				SELECT cantidad AS total FROM articulosEventos WHERE id = P_id
			) tmp;
			
			IF(@articulos>=P_cantidad) THEN
				UPDATE articulosEventos SET cantidad = P_cantidad WHERE id = P_id;
				
				SELECT 'TRUE' AS respuesta, 'Artículos en eventos actualizados satisfactoriamente' AS 'mensaje';
			ELSE
				SELECT 'FALSE' AS respuesta, 'Cantidad solicitada no alcanza para existencias del artículo' AS 'mensaje';
			END IF;
		ELSE
			SELECT 'FALSE' AS respuesta, 'No existe la relación entre artículo y evento' AS 'mensaje';
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
		
        SELECT 'TRUE' AS respuesta, 'Área agregada correctamente' AS 'mensaje';
	ELSE
		SET @coincidencias=0;
        
        SELECT COUNT(*) INTO @coincidencias FROM cat_areas WHERE id=P_id;
        
        IF(@coincidencias != 0)THEN        
			SELECT COUNT(*) INTO @coincidencias FROM cat_areas WHERE nombre=P_nombre AND familia=P_familia AND id!=P_id;
            
			IF(@coincidencias!=0)THEN
				SELECT 'FALSE' AS respuesta, 'Nombre del área ya existe en esta familia' AS 'mensaje';
			ELSE			
				UPDATE cat_areas SET nombre=P_nombre, familia=P_familia WHERE id=P_id;
				
				SELECT 'TRUE' AS respuesta, 'Área actualizada correctamente' AS 'mensaje';
			END IF;
		ELSE
			SELECT 'FALSE' AS respuesta, 'No existe el área' AS 'mensaje';
		END IF;
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
		
        SELECT 'TRUE' AS respuesta, 'Banco agregado correctamente' AS 'mensaje';
	ELSE
		SET @coincidencias=0;
        
        SELECT COUNT(*) INTO @coincidencias FROM cat_bancos WHERE id=P_id;
        
        IF(@coincidencias != 0)THEN               
			SELECT COUNT(*) INTO @coincidencias FROM cat_bancos WHERE nombre=P_nombre AND id!=P_id;
			IF(@coincidencias != 0)THEN
				SELECT 'FALSE' AS respuesta, 'Nombre de banco ya existe' AS 'mensaje';
			ELSE			
				UPDATE cat_bancos SET nombre=P_nombre WHERE id=P_id;
				
				SELECT 'TRUE' AS respuesta, 'Banco actualizado correctamente' AS 'mensaje';
			END IF;
		ELSE
			SELECT 'FALSE' AS respuesta, 'No existe el banco' AS 'mensaje';
		END IF;
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
		
        SELECT 'TRUE' AS respuesta, 'Familia agregada correctamente' AS 'mensaje';
	ELSE
		SET @coincidencias=0;
        
        SELECT COUNT(*) INTO @coincidencias FROM cat_familias WHERE id=P_id;
        
        IF(@coincidencias != 0)THEN        
			SELECT COUNT(*) INTO @coincidencias FROM cat_familias WHERE nombre=P_nombre AND subfamilia=P_subfamilia AND id!=P_id;
            
			IF(@coincidencias != 0)THEN
				SELECT 'FALSE' AS respuesta, 'Nombre de familia ya existe en esta subfamilia' AS 'mensaje';
			ELSE			
				UPDATE cat_familias SET nombre=P_nombre, subfamilia=P_subfamilia WHERE id=P_id;
				
				SELECT 'TRUE' AS respuesta, 'Familia actualizada correctamente' AS 'mensaje';
			END IF;
		ELSE
			SELECT 'FALSE' AS respuesta, 'No existe la familia' AS 'mensaje';
		END IF;
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
		
        SELECT 'TRUE' AS respuesta, 'Lugar agregado correctamente' AS 'mensaje';
	ELSE
		SET @coincidencias=0;
        
        SELECT COUNT(*) INTO @coincidencias FROM cat_lugares WHERE id=P_id;
        
        IF(@coincidencias != 0)THEN        
			SELECT COUNT(*) INTO @coincidencias FROM cat_lugares WHERE nombre=P_nombre AND id!=P_id;
            
			IF(@coincidencias != 0)THEN
				SELECT 'FALSE' AS respuesta, 'Nombre de lugar ya existe' AS 'mensaje';
			ELSE			
				UPDATE cat_lugares SET nombre=P_nombre, direccion=P_direccion WHERE id=P_id;
				
				SELECT 'TRUE' AS respuesta, 'Lugar actualizado correctamente' AS 'mensaje';
			END IF;
		ELSE
			SELECT 'FALSE' AS respuesta, 'No existe el lugar' AS 'mensaje';
		END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPU_cat_metodosPago` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_cat_metodosPago`(IN P_id INT, IN P_nombre VARCHAR(100))
BEGIN
	IF(P_id IS NULL OR P_id=0) THEN
		INSERT INTO cat_metodosPago VALUES(0,P_nombre);
		
        SELECT 'TRUE' AS respuesta, 'Método de pago agregado correctamente' AS 'mensaje';
	ELSE
		SET @coincidencias=0;
        
        SELECT COUNT(*) INTO @coincidencias FROM cat_metodosPago WHERE id=P_id;
        
        IF(@coincidencias != 0)THEN               
			SELECT COUNT(*) INTO @coincidencias FROM cat_metodosPago WHERE nombre=P_nombre AND id!=P_id;
			IF(@coincidencias != 0)THEN
				SELECT 'FALSE' AS respuesta, 'Nombre de método ya existe' AS 'mensaje';
			ELSE			
				UPDATE cat_metodosPago SET nombre=P_nombre WHERE id=P_id;
				
				SELECT 'TRUE' AS respuesta, 'Método de pago actualizado correctamente' AS 'mensaje';
			END IF;
		ELSE
			SELECT 'FALSE' AS respuesta, 'No existe el método de pago' AS 'mensaje';
		END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPU_cat_puestos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_cat_puestos`(IN P_id INT, IN P_nombre VARCHAR(100))
BEGIN
	IF(P_id IS NULL OR P_id=0) THEN
		INSERT INTO cat_puestos VALUES(0,P_nombre);
	    
		SELECT 'TRUE' AS respuesta, 'Puesto actualizado correctamente' AS 'mensaje';
    ELSE
		SET @coincidencias=0;
        
        SELECT COUNT(*) INTO @coincidencias FROM cat_puestos WHERE id=P_id;
        
        IF(@coincidencias != 0)THEN        
			SELECT COUNT(*) INTO @coincidencias FROM cat_puestos WHERE nombre=P_nombre AND id!=P_id;
        
			IF(@coincidencias != 0)THEN
				SELECT 'FALSE' AS respuesta, 'Nombre de puesto ya existe' AS 'mensaje';
			ELSE
				UPDATE cat_puestos SET nombre=P_nombre WHERE id=P_id;
				
				SELECT 'TRUE' AS respuesta, 'Puesto actualizado correctamente' AS 'mensaje';
			END IF;
		ELSE
			SELECT 'FALSE' AS respuesta, 'No existe el puesto' AS 'mensaje';
		END IF;
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
	    
		SELECT 'TRUE' AS respuesta, 'Ranking agregado correctamente' AS 'mensaje';
    ELSE
		SET @coincidencias=0;
        
        SELECT COUNT(*) INTO @coincidencias FROM cat_ranking WHERE id=P_id;
        
        IF(@coincidencias != 0)THEN
			SELECT COUNT(*) INTO @coincidencias FROM cat_ranking WHERE nombre=P_nombre AND id!=P_id;
            
			IF(@coincidencias!=0)THEN
				SELECT 'FALSE' AS respuesta, 'Nombre de ranking ya existe' AS 'mensaje';
			ELSE			
				UPDATE cat_ranking SET nombre=P_nombre WHERE id=P_id;
				
				SELECT 'TRUE' AS respuesta, 'Usuario actualizado correctamente' AS 'mensaje';
			END IF;
		ELSE
			SELECT 'FALSE' AS respuesta, 'No existe el ranking' AS 'mensaje';
		END IF;
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
	    
		SELECT 'TRUE' AS respuesta, 'Subfamilia agregada correctamente' AS 'mensaje';
    ELSE
		SET @coincidencias=0;
        
        SELECT COUNT(*) INTO @coincidencias FROM cat_subfamilias WHERE id=P_id;
        
        IF(@coincidencias != 0)THEN     
			UPDATE cat_subfamilias SET nombre=P_nombre WHERE id=P_id;
			
			SELECT 'TRUE' AS respuesta, 'Subfamilia actualizada correctamente' AS 'mensaje';
		ELSE
			SELECT 'FALSE' AS respuesta, 'No existe la subfamilia' AS 'mensaje';
		END IF;
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
ThisSP:BEGIN
	IF(P_id IS NULL OR P_id=0) THEN
		INSERT INTO cat_tiposEvento VALUES(0,P_clave,P_nombre);
        
		SELECT 'TRUE' AS respuesta, 'Tipo de evento agregado correctamente' AS 'mensaje';
	ELSE
		SET @coincidencias=0;
        
        SELECT COUNT(*) INTO @coincidencias FROM cat_tiposEvento WHERE id=P_id;
        
        IF(@coincidencias != 0)THEN  
			SELECT COUNT(*) INTO @coincidencias FROM cat_tiposEvento WHERE nombre=P_nombre AND id!=P_id;
			IF(@coincidencias!=0)THEN
				SELECT 'FALSE' AS respuesta, 'Nombre de tipo de evento ya existe' AS 'mensaje';
				
				LEAVE ThisSP;
			END IF;
			
			SELECT COUNT(*) INTO @coincidencias FROM cat_tiposEvento WHERE clave=P_clave AND id!=P_id;
			IF(@coincidencias!=0)THEN
				SELECT 'FALSE' AS respuesta, 'Clave de tipo de evento ya existe' AS 'mensaje';
				
				LEAVE ThisSP;
			END IF;
            
			UPDATE cat_tiposEvento SET clave=P_clave, nombre=P_nombre WHERE id=P_id;
            
			SELECT 'TRUE' AS respuesta, 'Tipo de evento actualizado correctamente' AS 'mensaje';
		ELSE
			SELECT 'FALSE' AS respuesta, 'No existe el tipo de evento' AS 'mensaje';
		END IF;
	END IF;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_clientes`(IN P_id INT, IN P_clave VARCHAR(20), IN P_nombre VARCHAR(100), IN P_nombreComercial VARCHAR(200), IN P_cargo VARCHAR(100), IN P_montoCredito NUMERIC(10,2), IN P_diasCredito INT(4), IN P_tipoContacto VARCHAR(50), IN P_nombreContacto VARCHAR(100), IN P_webContacto VARCHAR(200), IN P_direccionContacto VARCHAR(200), IN P_coloniaContacto VARCHAR(100), IN P_ciudadContacto INT, IN P_codigoPostalContacto CHAR(5), IN P_telefonoContacto VARCHAR(14), IN P_celularContacto VARCHAR(14), IN P_emailContacto VARCHAR(70), IN P_rfcFiscal VARCHAR(14), IN P_razonSocialFiscal VARCHAR(100), IN P_calleFiscal VARCHAR(50), IN P_coloniaFiscal VARCHAR(100), IN P_ciudadFiscal INT, IN P_paisFiscal VARCHAR(50), IN P_codigoPostalFiscal CHAR(5), IN P_numeroInteriorFiscal VARCHAR(5), IN P_numeroExteriorFiscal VARCHAR(5), IN P_localidadFiscal VARCHAR(100), IN P_municipioFiscal VARCHAR(100))
ThisSP:BEGIN
	IF(P_id IS NULL OR P_id=0) THEN
		INSERT INTO clientes VALUES (0,P_clave,P_nombre,P_nombreComercial,P_cargo,P_montoCredito,P_diasCredito,P_tipoContacto,P_nombreContacto,P_webContacto,P_direccionContacto,P_coloniaContacto,P_ciudadContacto,P_codigoPostalContacto,P_telefonoContacto,P_celularContacto,P_emailContacto,P_rfcFiscal,P_razonSocialFiscal,P_calleFiscal,P_coloniaFiscal,P_ciudadFiscal,P_paisFiscal,P_codigoPostalFiscal,P_numeroInteriorFiscal,P_numeroExteriorFiscal,P_localidadFiscal,P_municipioFiscal);
        
		SELECT 'TRUE' AS respuesta, 'Cliente agregado correctamente' AS 'mensaje';
	ELSE
		SET @coincidencias=0;
        
        SELECT COUNT(*) INTO @coincidencias FROM clientes WHERE id=P_id;
        
        IF(@coincidencias != 0)THEN        
			SELECT COUNT(*) INTO @coincidencias FROM clientes WHERE nombre=P_nombre AND id!=P_id;
			IF(@coincidencias!=0)THEN
				SELECT 'FALSE' AS respuesta, 'Nombre de cliente ya existe' AS 'mensaje';
				
				LEAVE ThisSP;
			END IF;
			
			SELECT COUNT(*) INTO @coincidencias FROM clientes WHERE clave=P_clave AND id!=P_id;
			IF(@coincidencias!=0)THEN
				SELECT 'FALSE' AS respuesta, 'Clave de cliente ya existe' AS 'mensaje';
				
				LEAVE ThisSP;
			END IF;
			
			UPDATE articulos SET clave=P_clave, nombre=P_nombre, nombrecomercial=P_nombreComercial, cargo=P_cargo, montoCredito=P_montoCredito, diasCredito=P_diasCredito, tipoContacto=P_tipoContacto, nombreContacto=P_nombreContacto, webContacto=P_webContacto, direccionContacto=P_direccionContacto, coloniaContacto=P_coloniaContacto, ciudadContacto=P_ciudadContacto, codigoPostalContacto=P_codigoPostalcontacto, telefonoContacto=P_telefonoContacto, celularContacto=P_celularContacto, emailContacto=P_emailContacto, rfcFiscal=P_rfcFiscal, razonSocialFiscal=P_razonSocialFiscal, calleFiscal=P_calleFiscal, coloniaFiscal=P_coloniaFiscal, ciudadFiscal=P_ciudadFiscal, paisFiscal=P_paisFiscal, codigoPostalFiscal=P_codigoPostalFiscal, numeroInteriorFiscal=P_numeroInteriorFiscal, numeroExteriorFiscal=P_numeroExteriorFiscal, localidadFiscal=P_localidadFiscal, municipioFiscal=P_municipioFiscal WHERE id=P_id;
            
			SELECT 'TRUE' AS respuesta, 'Cliente actualizado correctamente' AS 'mensaje';
		ELSE
			SELECT 'FALSE' AS respuesta, 'No existe el cliente' AS 'mensaje';
		END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPU_cobros` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_cobros`(IN P_id INT, IN P_evento INT, IN P_monto NUMERIC(11,2), IN P_concepto VARCHAR(200), IN P_cuentaBancaria INT)
BEGIN
	IF(P_id IS NULL OR P_id=0) THEN
		INSERT INTO cobros VALUES (0,CURRENT_TIMESTAMP,P_evento,P_monto,P_concepto,P_cuentaBancaria);
		
        SELECT 'TRUE' AS respuesta, 'Cobro agregado correctamente' AS 'mensaje';
	ELSE
		SET @coincidencias=0;
        
        SELECT COUNT(*) INTO @coincidencias FROM cobros WHERE id=P_id;
        
        IF(@coincidencias != 0)THEN       
			UPDATE cobros SET evento=P_evento, monto=P_monto, concepto=P_concepto, cuentaBancaria=P_cuentaBancaria WHERE id=P_id;
            
			SELECT 'TRUE' AS respuesta, 'Cobro actualizado correctamente' AS 'mensaje';
		ELSE
			SELECT 'FALSE' AS respuesta, 'No existe el cobro' AS 'mensaje';
		END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPU_cuentasBancarias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_cuentasBancarias`(IN P_id INT, IN P_clave VARCHAR(10), IN P_nombre VARCHAR(50), IN P_banco INT, IN P_noCuenta VARCHAR(20), IN P_clabe VARCHAR(30), IN P_saldo NUMERIC(11,2))
ThisSP:BEGIN
	IF(P_id IS NULL OR P_id=0) THEN
		INSERT INTO cuentasBancarias VALUES(0,P_clave,P_nombre,P_banco,P_noCuenta,P_clabe,P_saldo);
	
        SELECT 'TRUE' AS respuesta, 'Cuenta bancaria agregada correctamente' AS 'mensaje';
	ELSE
		SET @coincidencias=0;
        
        SELECT COUNT(*) INTO @coincidencias FROM cuentasBancarias WHERE id=P_id;
        
        IF(@coincidencias != 0)THEN        
			SELECT COUNT(*) INTO @coincidencias FROM cuentasBancarias WHERE nombre=P_nombre AND id!=P_id;
			IF(@coincidencias!=0)THEN
				SELECT 'FALSE' AS respuesta, 'Nombre de cuenta bancaria ya existe' AS 'mensaje';
				
				LEAVE ThisSP;
			END IF;
			
			SELECT COUNT(*) INTO @coincidencias FROM cuentasBancarias WHERE clave=P_clave AND id!=P_id;
			IF(@coincidencias!=0)THEN
				SELECT 'FALSE' AS respuesta, 'Clave de cuenta bancaria ya existe' AS 'mensaje';
				
				LEAVE ThisSP;
			END IF;
			
			UPDATE cuentasBancarias SET clave=P_clave, nombre=P_nombre, banco=P_banco, noCuenta=P_noCuenta, clabe=P_clabe, saldo=P_saldo WHERE id=P_id;
            
			SELECT 'TRUE' AS respuesta, 'Cuenta bancaria actualizada correctamente' AS 'mensaje';
		ELSE
			SELECT 'FALSE' AS respuesta, 'No existe la cuenta bancaria' AS 'mensaje';
		END IF;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_empleados`(IN P_id INT, IN P_clave VARCHAR(50), IN P_nombre VARCHAR(100), IN P_puesto INT, IN P_domicilio VARCHAR(200), IN P_colonia VARCHAR(100), IN P_ciudad INT, IN P_codigoPostal CHAR(5), IN P_telefono VARCHAR(14), IN P_celular VARCHAR(14), IN P_email VARCHAR(100), IN P_lunes TINYINT(1), IN P_martes TINYINT(1), IN P_miercoles TINYINT(1), IN P_jueves TINYINT(1), IN P_viernes TINYINT(1), IN P_sabado TINYINT(1))
ThisSP:BEGIN
	IF(P_id IS NULL OR P_id=0) THEN
		INSERT INTO empleados VALUES (0,P_clave,P_nombre,P_puesto,P_domicilio,P_colonia,P_ciudad,P_codigoPostal,P_telefono,P_celular,P_email,P_lunes,P_martes,P_miercoles,P_jueves,P_viernes,P_sabado);
	
        SELECT 'TRUE' AS respuesta, 'Empleado agregado correctamente' AS 'mensaje';
	ELSE
		SET @coincidencias=0;
        
        SELECT COUNT(*) INTO @coincidencias FROM empleados WHERE id=P_id;
        
        IF(@coincidencias != 0)THEN        
			SELECT COUNT(*) INTO @coincidencias FROM empleados WHERE nombre=P_nombre AND id!=P_id;
			IF(@coincidencias!=0)THEN
				SELECT 'FALSE' AS respuesta, 'Nombre de empleado ya existe' AS 'mensaje';
				
				LEAVE ThisSP;
			END IF;
			
			SELECT COUNT(*) INTO @coincidencias FROM empleados WHERE clave=P_clave AND id!=P_id;
			IF(@coincidencias!=0)THEN
				SELECT 'FALSE' AS respuesta, 'Clave de empleado ya existe' AS 'mensaje';
				
				LEAVE ThisSP;
			END IF;
			
			UPDATE empleados SET clave=P_clave, nombre=P_nombre, puesto=P_puesto, domicilio=P_domicilio, colonia=P_colonia, ciudad=P_ciudad, codigoPostal=P_codigoPostal, telefono=P_telefono, celular=P_celular, email=P_email, lunes=P_lunes, martes=P_martes, miercoles=P_miercoles, jueves=P_jueves, viernes=P_viernes, sabado=P_sabado WHERE id=P_id;
    
			SELECT 'TRUE' AS respuesta, 'Empleado actualizado correctamente' AS 'mensaje';
		ELSE
			SELECT 'FALSE' AS respuesta, 'No existe el empleado' AS 'mensaje';
		END IF;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_eventos`(IN P_id INT, IN P_nombre VARCHAR(200), IN P_cotizacion TINYINT(1), IN P_statusCotizacion INT, IN P_statusEvento INT, IN P_cliente INT, IN P_lugar INT, IN P_tipo INT, IN P_fechaEntrega TIMESTAMP, IN P_fechaSeguimiento TIMESTAMP, IN P_fechaFinal TIMESTAMP, IN P_direccion VARCHAR(300), IN P_invitados INT, IN P_salon TINYINT(1), IN P_vendedor INT, IN P_utilidadCuenta NUMERIC(5,2), IN P_cuenta VARCHAR(20), IN P_montoServicios NUMERIC(8,2), IN P_depositosEnGarantia INT, IN P_montoDepositosEnGarantia NUMERIC(8,2), IN P_guardias INT, IN P_cantidadGuardias INT, IN P_montoGuardias NUMERIC(8,2), IN P_metodoPago INT, IN P_cuentaBancaria INT, IN P_totalEvento NUMERIC(11,2), IN P_anticipo NUMERIC(11,2))
BEGIN
	IF(P_id IS NULL OR P_id=0) THEN
		INSERT INTO eventos VALUES (0,P_nombre,P_cotizacion,P_statusCotizacion,P_statusEvento,P_cliente,P_lugar,P_tipo,P_fechaEntrega,P_fechaSeguimiento,P_fechaFinal,P_direccion,P_invitados,P_salon,P_vendedor,P_utilidadCuenta,P_cuenta,P_montoServicios,P_depositosEnGarantia,P_montoDepositosEnGarantia,P_guardias,P_cantidadGuardias,P_montoGuardias,P_metodoPago,P_cuentaBancaria,P_totalEvento,P_anticipo);
        SET @evento = LAST_INSERT_ID();
        UPDATE articulosEventoS SET evento=@evento WHERE evento IS NULL;
	
        SELECT 'TRUE' AS respuesta, 'Evento agregado correctamente' AS 'mensaje';
	ELSE
		SET @coincidencias=0;
        
        SELECT COUNT(*) INTO @coincidencias FROM eventos WHERE id=P_id;
        
        IF(@coincidencias != 0)THEN       
			UPDATE eventos SET nombre=P_nombre, cotizacion=P_cotizacion, statusCotizacion=P_statusCotizacion, statusEvento=P_statusEvento, cliente=P_cliente, lugar=P_lugar, tipo=P_tipo, fechaEntrega=P_fechaEntrega, fechaSeguimiento=P_fechaSeguimiento, fechaFinal=P_fechaFinal, direccion=P_direccion, invitados=P_invitados, salon=P_salon, vendedor=P_vendedor, utilidadCuenta=P_utilidadCuenta, cuenta=P_cuenta, montoServicios=P_montoServicios, depositosEnGarantia=P_depositosEnGarantia, montoDepositosEnGarantia=P_montoDepositosEnGarantia, guardias=P_guardias, cantidadGuardias=P_cantidadGuardias, montoGuardias=P_montoGuardias, metodoPago=P_metodoPago, cuentaBancaria=P_cuentaBancaria, totalEvento=P_totalEvento, anticipo=P_anticipo WHERE id=P_id;
		
			SELECT 'TRUE' AS respuesta, 'Evento actualizado correctamente' AS 'mensaje';
		ELSE
			SELECT 'FALSE' AS respuesta, 'No existe el evento' AS 'mensaje';
		END IF;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_gastos`(IN P_id INT, IN P_empleado INT, IN P_evento INT, IN P_monto NUMERIC(11,2), IN P_concepto VARCHAR(200), IN P_cuentaBancaria INT, IN P_direccion VARCHAR(200), IN P_telefonoContacto VARCHAR(14), IN P_fechaSolicitud TIMESTAMP, IN P_fechaRequerido TIMESTAMP, IN P_fechaEntrega TIMESTAMP, IN P_area INT, IN P_realizado TINYINT(1))
BEGIN
	DECLARE P_fechaRealizado DATE DEFAULT NULL;
		IF(P_realizado=1 OR P_realizado=TRUE) THEN
			SET P_fechaRealizado = CURRENT_TIMESTAMP;
		ELSE
			SET P_fechaRealizado = NULL;
		END IF;
    
	IF(P_id IS NULL OR P_id=0) THEN
		INSERT INTO gastos VALUES (0,P_empleado,P_evento,P_monto,P_concepto,P_cuentaBancaria,P_direccion,P_telefonoContacto,P_fechaSolicitud,P_fechaRequerido,P_fechaEntrega,P_area,P_realizado,P_fechaRealizado);
	
        SELECT 'TRUE' AS respuesta, 'Gasto agregado correctamente' AS 'mensaje';
	ELSE
		SET @coincidencias=0;
        
        SELECT COUNT(*) INTO @coincidencias FROM gastos WHERE id=P_id;
        
        IF(@coincidencias != 0)THEN    
			UPDATE gastos SET empleado=P_empleado, evento=P_evento, monto=P_monto, concepto=P_concepto, cuentaBancaria=P_cuentaBancaria, direccion=P_direccion, telefonoContacto=P_telefonoContacto, fechaSolicitud=P_fechaSolicitud, fechaRequerido=P_fechaRequerido, fechaEntrega=P_fechaEntrega, area=P_area, realizado=P_realizado, fechaRealizado=P_fechaRealizado WHERE id=P_id;
		
			SELECT 'TRUE' AS respuesta, 'Gasto actualizado correctamente' AS 'mensaje';
		ELSE
			SELECT 'FALSE' AS respuesta, 'No existe el gasto' AS 'mensaje';
		END IF;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_modulos`(IN P_id INT, IN P_nombre VARCHAR(50), IN P_url VARCHAR(150), IN P_claseAwesome VARCHAR(20), IN P_prioridad CHAR(2), IN P_orden CHAR(2))
BEGIN
	IF(P_id IS NULL OR P_id=0) THEN
		INSERT INTO modulos VALUES(0,P_nombre,P_url,P_claseAwesome,P_prioridad,P_orden);
	
        SELECT 'TRUE' AS respuesta, 'Módulo agregado correctamente' AS 'mensaje';
	ELSE
		SET @coincidencias=0;
        
        SELECT COUNT(*) INTO @coincidencias FROM modulos WHERE id=P_id;
        
        IF(@coincidencias != 0)THEN   
			SELECT COUNT(*) INTO @coincidencias FROM modulos WHERE nombre=P_nombre AND prioridad=P_prioridad AND id!=P_id;
            
			IF(@coincidencias!=0)THEN    
				SELECT 'false' AS respuesta, 'Nombre del módulo ya existe en esta prioridad' AS 'mensaje';
			ELSE
				UPDATE modulos SET nombre=P_nombre, url=P_url, claseAwesome=P_claseAwesome, prioridad=P_prioridad, orden=P_orden WHERE id=P_id;
			
				SELECT 'TRUE' AS respuesta, 'Módulo actualizado correctamente' AS 'mensaje';
            END IF;
		ELSE
			SELECT 'FALSE' AS respuesta, 'No existe el módulo' AS 'mensaje';
		END IF;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_proveedores`(IN P_id INT, IN P_clave VARCHAR(20), IN P_nombre VARCHAR(100), IN P_nombreContacto VARCHAR(100), IN P_nombre2Contacto VARCHAR(100), IN P_nombreEmpresaContacto VARCHAR(100), IN P_telefonoContacto VARCHAR(14), IN P_celularContacto VARCHAR(14), IN P_emailContacto VARCHAR(70), IN P_webContacto VARCHAR(200), IN P_rfcFiscal VARCHAR(14), IN P_nombreComercialFiscal VARCHAR(100), IN P_calleFiscal VARCHAR(50), IN P_coloniaFiscal VARCHAR(100), IN P_ciudadFiscal INT(11), IN P_codigoPostalFiscal CHAR(5))
ThisSP:BEGIN
	IF(P_id IS NULL OR P_id=0) THEN
		INSERT INTO proveedores VALUES (0,P_clave,P_nombre,P_nombreContacto,P_nombre2Contacto,P_nombreEmpresaContacto,P_telefonoContacto,P_celularContacto,P_emailContacto,P_webContacto,P_rfcFiscal,P_nombreComercialFiscal,P_calleFiscal,P_coloniaFiscal,P_ciudadFiscal,P_codigoPostalFiscal);
	
        SELECT 'TRUE' AS respuesta, 'Proveedor agregado correctamente' AS 'mensaje';
	ELSE
		SET @coincidencias=0;
        
        SELECT COUNT(*) INTO @coincidencias FROM proveedores WHERE id=P_id;
        
        IF(@coincidencias != 0)THEN        
			SELECT COUNT(*) INTO @coincidencias FROM proveedores WHERE nombre=P_nombre AND id!=P_id;
			IF(@coincidencias!=0)THEN
				SELECT 'FALSE' AS respuesta, 'Nombre de proveedor ya existe' AS 'mensaje';
				
				LEAVE ThisSP;
			END IF;
			
			SELECT COUNT(*) INTO @coincidencias FROM proveedores WHERE clave=P_clave AND id!=P_id;
			IF(@coincidencias!=0)THEN
				SELECT 'FALSE' AS respuesta, 'Clave de proveedor ya existe' AS 'mensaje';
				
				LEAVE ThisSP;
			END IF;
			
			UPDATE proveedores SET clave=P_clave, nombre=P_nombre, nombreContacto=P_nombreContacto, nombre2Contacto=P_nombre2Contacto, nombreEmpresaContacto=P_nombreEmpresaContacto, telefonoContacto=P_telefonoContacto, celularContacto=P_celularContacto, emailContacto=P_emailContacto, webContacto=P_webContacto, rfcFiscal=P_rfcFiscal, nombreComercialFiscal=P_nombreComercialFiscal, calleFiscal=P_calleFiscal, coloniaFiscal=P_coloniaFiscal, ciudadFiscal=P_ciudadFiscal, codigoPostalFiscal=P_codigoPostalFiscal WHERE id=P_id;
			
			SELECT 'TRUE' AS respuesta, 'Proveedor actualizado correctamente' AS 'mensaje';
		ELSE
			SELECT 'FALSE' AS respuesta, 'No existe el proveedor' AS 'mensaje';
		END IF;
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
ThisSP:BEGIN
	IF(P_id IS NULL OR P_id=0) THEN
		INSERT INTO servicios VALUES (0,P_clave,P_concepto,P_area,P_cantidad,P_precioUnitario);
	
        SELECT 'TRUE' AS respuesta, 'Servicio agregado correctamente' AS 'mensaje';
	ELSE
		SET @coincidencias=0;
        
        SELECT COUNT(*) INTO @coincidencias FROM servicios WHERE id=P_id;
        
        IF(@coincidencias != 0)THEN        
			SELECT COUNT(*) INTO @coincidencias FROM servicios WHERE nombre=P_nombre AND id!=P_id;
			IF(@coincidencias!=0)THEN
				SELECT 'FALSE' AS respuesta, 'Nombre de servicio ya existe' AS 'mensaje';
				
				LEAVE ThisSP;
			END IF;
			
			SELECT COUNT(*) INTO @coincidencias FROM servicios WHERE clave=P_clave AND id!=P_id;
			IF(@coincidencias!=0)THEN
				SELECT 'FALSE' AS respuesta, 'Clave de servicio ya existe' AS 'mensaje';
				
				LEAVE ThisSP;
			END IF;
			
			UPDATE servicios SET clave=P_clave, concepto=P_concepto, area=P_area, cantidad=P_cantidad, precioUnitario=P_precioUnitario WHERE id=P_id;
    
			SELECT 'TRUE' AS respuesta, 'Servicio actualizado correctamente' AS 'mensaje';
		ELSE
			SELECT 'FALSE' AS respuesta, 'No existe el servicio' AS 'mensaje';
		END IF;
    END IF;
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
ThisSP:BEGIN
    SET @error=FALSE;
    
	IF(P_id IS NULL OR P_id=0 OR P_id="") THEN
		SET @cantUsuarios = 0;
		SELECT COUNT(*) INTO @cantUsuarios FROM usuarios WHERE nombre=P_nombre;
		
		IF(@cantUsuarios > 0)THEN
			SELECT 'FALSE' AS respuesta, 'Usuario existente' AS 'mensaje';
		ELSE
			INSERT INTO usuarios VALUES (0,P_nombre,SHA1(P_pass),P_llave,P_empleado,P_rol);
            
            SELECT 'TRUE' AS respuesta, 'Usuario agregado correctamente' AS 'mensaje';
		END IF;
	ELSE
		SET @coincidencias=0;        
        SELECT COUNT(*) INTO @coincidencias FROM usuarios WHERE id=P_id;
        
        IF(@coincidencias != 0)THEN        
			SET @qlQuery="";		
			
			IF(P_nombre!="" OR P_nombre IS NOT NULL)THEN
				SELECT COUNT(*) INTO @coincidencias FROM usuarios WHERE nombre=P_nombre AND id!=P_id;
				
				IF(@coincidencias > 0)THEN
					SELECT 'FALSE' AS respuesta, 'Nombre de usuario existente' AS 'mensaje';
                    
					LEAVE ThisSP;
				ELSE
					SET @sqlQuery = CONCAT("nombre='",P_nombre,"'");
				END IF;
			END IF;
			IF(P_pass!="" OR P_pass IS NOT NULL) THEN
				IF(@sqlQuery!="")THEN
					SET @sqlQuery = CONCAT(@sqlQuery, ", ");
				END IF;
				
				SET @sqlQuery = CONCAT(@sqlQuery,"pass=SHA1('",P_pass,"')");
			END IF;
			IF(P_rol!="" OR P_rol IS NOT NULL)THEN
				IF(@sqlQuery!="")THEN
					SET @sqlQuery = CONCAT(@sqlQuery, ", ");
				END IF;
				
				SET @sqlQuery = CONCAT(@sqlQuery,"rol=",P_rol);
			END IF;
			
			SET @sqlQuery = CONCAT("UPDATE usuarios SET ",@sqlQuery," WHERE id=",P_id,";");
			
			PREPARE execQuery FROM @sqlQuery;
			EXECUTE execQuery;
			DEALLOCATE PREPARE execQuery;
            
			SELECT 'TRUE' AS respuesta, 'Usuario actualizado correctamente' AS 'mensaje';
		ELSE
			SELECT 'FALSE' AS respuesta, 'No existe el usuario' AS 'mensaje';
		END IF;
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
	
        SELECT 'TRUE' AS respuesta, 'Vendedor agregado correctamente' AS 'mensaje';
	ELSE
		SET @coincidencias=0;
        
        SELECT COUNT(*) INTO @coincidencias FROM articulos WHERE id=P_id;
        
        IF(@coincidencias != 0)THEN        
			UPDATE vendedores SET empleado=P_empleado, ranking=P_ranking WHERE id=P_id;
	
			SELECT 'TRUE' AS respuesta, 'Vendedor actualizado correctamente' AS 'mensaje';
		ELSE
			SELECT 'FALSE' AS respuesta, 'No existe el vendedor' AS 'mensaje';
		END IF;
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

-- Dump completed on 2016-07-31 15:18:27
