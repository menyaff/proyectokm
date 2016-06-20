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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulos`
--

LOCK TABLES `articulos` WRITE;
/*!40000 ALTER TABLE `articulos` DISABLE KEYS */;
INSERT INTO `articulos` VALUES (1,'lounge001','Sala lounge perla',NULL,'Troncoso','2000','Sala para toda ocación, sale con Chavelo',1,'123456009',NULL,'pza',3,3,NULL,7000.00,5000.00,6300.00),(2,'lounge002','Sala lounge negra',NULL,'Troncoso','2000','Sala para toda ocación, sale con Chavelo',1,'123456009',NULL,'pza',1,3,NULL,7000.00,5000.00,6300.00);
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
INSERT INTO `articuloseventos` VALUES (7,1,5,1),(8,2,3,1),(10,4,1,1),(11,1,2,2),(12,1,5,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=2246 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_ciudades`
--

LOCK TABLES `cat_ciudades` WRITE;
/*!40000 ALTER TABLE `cat_ciudades` DISABLE KEYS */;
INSERT INTO `cat_ciudades` VALUES (1,'Aguascalientes',1),(2,'Asientos',1),(3,'Calvillo',1),(4,'Cos├¡o',1),(5,'El Llano',1),(6,'Jes├║s Mar├¡a',1),(7,'Pabell├│n de Arteaga',1),(8,'Rinc├│n de Romos',1),(9,'San Francisco de los Romo',1),(10,'San Jos├® de Gracia',1),(11,'Tepezal├í',1),(12,'Ensenada',2),(13,'Mexicali',2),(14,'Playas de Rosarito',2),(15,'Tecate',2),(16,'Tijuana',2),(17,'Comod├║',3),(18,'La Paz',3),(19,'Loreto',3),(20,'Los Cabos',3),(21,'Muleg├®',3),(22,'Calakmul',4),(23,'Calkin├¡',4),(24,'Campeche',4),(25,'Candelaria',4),(26,'Carmen',4),(27,'Champot├│n',4),(28,'Esc├írcega',4),(29,'Hecelchak├ín',4),(30,'Hopelch├®n',4),(31,'Palizada',4),(32,'Tenabo',4),(33,'Acacoyagua',5),(34,'Acala',5),(35,'Acapetahua',5),(36,'Aldama',5),(37,'Altamirano',5),(38,'Amat├ín',5),(39,'Amatenango de la Frontera',5),(40,'Amatenango del Valle',5),(41,'Angel Albino Corzo',5),(42,'Arriaga',5),(43,'Bejucal de Ocampo',5),(44,'Bella Vista',5),(45,'Benem├®rito de las Am├®ricas',5),(46,'Berrioz├íbal',5),(47,'Bochil',5),(48,'Cacahoat├ín',5),(49,'Catazaj├í',5),(50,'Chalchihuit├ín',5),(51,'Chamula',5),(52,'Chanal',5),(53,'Chapultenango',5),(54,'Chenalh├│',5),(55,'Chiapa de Corzo',5),(56,'Chiapilla',5),(57,'Chicoas├®n',5),(58,'Chicomuselo',5),(59,'Chil├│n',5),(60,'Cintalapa',5),(61,'Coapilla',5),(62,'Comit├ín de Dom├¡nguez',5),(63,'Copainal├í',5),(64,'El Bosque',5),(65,'El Porvenir',5),(66,'Escuintla',5),(67,'Francisco Le├│n',5),(68,'Frontera Comalapa',5),(69,'Frontera Hidalgo',5),(70,'Huehuet├ín',5),(71,'Huitiup├ín',5),(72,'Huixt├ín',5),(73,'Huixtla',5),(74,'Ixhuat├ín',5),(75,'Ixtacomit├ín',5),(76,'Ixtapa',5),(77,'Ixtapangajoya',5),(78,'Jiquipilas',5),(79,'Jitotol',5),(80,'Ju├írez',5),(81,'La Concordia',5),(82,'La Grandeza',5),(83,'La Independencia',5),(84,'La Libertad',5),(85,'La Trinitaria',5),(86,'Larr├íinzar',5),(87,'Las Margaritas',5),(88,'Las Rosas',5),(89,'Mapastepec',5),(90,'Maravilla Tenejapa',5),(91,'Marqu├®s de Comillas',5),(92,'Mazapa de Madero',5),(93,'Mazat├ín',5),(94,'Metapa',5),(95,'Mitontic',5),(96,'Montecristo de Guerrero',5),(97,'Motozintla',5),(98,'Nicol├ís Ru├¡z',5),(99,'Ocosingo',5),(100,'Ocotepec',5),(101,'Ocozocoautla de Espinosa',5),(102,'Ostuac├ín',5),(103,'Osumacinta',5),(104,'Oxchuc',5),(105,'Palenque',5),(106,'Pantelh├│',5),(107,'Pantepec',5),(108,'Pichucalco',5),(109,'Pijijiapan',5),(110,'Pueblo Nuevo Solistahuac├ín',5),(111,'Ray├│n',5),(112,'Reforma',5),(113,'Sabanilla',5),(114,'Salto de Agua',5),(115,'San Andr├®s Duraznal',5),(116,'San Crist├│bal de las Casas',5),(117,'San Fernando',5),(118,'San Juan Cancuc',5),(119,'San Lucas',5),(120,'Santiago el Pinar',5),(121,'Siltepec',5),(122,'Simojovel',5),(123,'Sital├í',5),(124,'Socoltenango',5),(125,'Solosuchiapa',5),(126,'Soyal├│',5),(127,'Suchiapa',5),(128,'Suchiate',5),(129,'Sunuapa',5),(130,'Tapachula',5),(131,'Tapalapa',5),(132,'Tapilula',5),(133,'Tecpat├ín',5),(134,'Tenejapa',5),(135,'Teopisca',5),(136,'Tila',5),(137,'Tonal├í',5),(138,'Totolapa',5),(139,'Tumbal├í',5),(140,'Tuxtla Chico',5),(141,'Tuxtla Guti├®rrez',5),(142,'Tuzant├ín',5),(143,'Tzimol',5),(144,'Uni├│n Ju├írez',5),(145,'Venustiano Carranza',5),(146,'Villa Comaltitl├ín',5),(147,'Villa Corzo',5),(148,'Villaflores',5),(149,'Yajal├│n',5),(150,'Zinacant├ín',5),(151,'Ahumada',6),(152,'Aldama',6),(153,'Allende',6),(154,'Aquiles Serd├ín',6),(155,'Ascensi├│n',6),(156,'Bach├¡niva',6),(157,'Balleza',6),(158,'Batopilas',6),(159,'Bocoyna',6),(160,'Buenaventura',6),(161,'Camargo',6),(162,'Carich├¡',6),(163,'Casas Grandes',6),(164,'Chihuahua',6),(165,'Ch├¡nipas',6),(166,'Coronado',6),(167,'Coyame del Sotol',6),(168,'Cuauht├®moc',6),(169,'Cusihuiriachi',6),(170,'Delicias',6),(171,'Dr. Belisario Dom├¡nguez',6),(172,'El Tule',6),(173,'Galeana',6),(174,'G├│mez Far├¡as',6),(175,'Gran Morelos',6),(176,'Guachochi',6),(177,'Guadalupe',6),(178,'Guadalupe y Calvo',6),(179,'Guazapares',6),(180,'Guerrero',6),(181,'Hidalgo del Parral',6),(182,'Huejotit├ín',6),(183,'Ignacio Zaragoza',6),(184,'Janos',6),(185,'Jim├®nez',6),(186,'Ju├írez',6),(187,'Julimes',6),(188,'La Cruz',6),(189,'L├│pez',6),(190,'Madera',6),(191,'Maguarichi',6),(192,'Manuel Benavides',6),(193,'Matach├¡',6),(194,'Matamoros',6),(195,'Meoqui',6),(196,'Morelos',6),(197,'Moris',6),(198,'Namiquipa',6),(199,'Nonoava',6),(200,'Nuevo Casas Grandes',6),(201,'Ocampo',6),(202,'Ojinaga',6),(203,'Praxedis G. Guerrero',6),(204,'Riva Palacio',6),(205,'Rosales',6),(206,'Rosario',6),(207,'San Francisco de Borja',6),(208,'San Francisco de Conchos',6),(209,'San Francisco del Oro',6),(210,'Santa B├írbara',6),(211,'Santa Isabel',6),(212,'Satev├│',6),(213,'Saucillo',6),(214,'Tem├│sachi',6),(215,'Urique',6),(216,'Uruachi',6),(217,'Valle de Zaragoza',6),(218,'Abasolo',7),(219,'Acu├▒a',7),(220,'Allende',7),(221,'Arteaga',7),(222,'Candela',7),(223,'Casta├▒os',7),(224,'Cuatroci├®negas',7),(225,'Escobedo',7),(226,'Francisco I. Madero',7),(227,'Frontera',7),(228,'General Cepeda',7),(229,'Guerrero',7),(230,'Hidalgo',7),(231,'Jim├®nez',7),(232,'Ju├írez',7),(233,'Lamadrid',7),(234,'Matamoros',7),(235,'Monclova',7),(236,'Morelos',7),(237,'M├║zquiz',7),(238,'Nadadores',7),(239,'Nava',7),(240,'Ocampo',7),(241,'Parras',7),(242,'Piedras Negras',7),(243,'Progreso',7),(244,'Ramos Arizpe',7),(245,'Sabinas',7),(246,'Sacramento',7),(247,'Saltillo',7),(248,'San Buenaventura',7),(249,'San Juan de Sabinas',7),(250,'San Pedro',7),(251,'Sierra Mojada',7),(252,'Torre├│n',7),(253,'Viesca',7),(254,'Villa Uni├│n',7),(255,'Zaragoza',7),(256,'Armer├¡a',8),(257,'Colima',8),(258,'Comala',8),(259,'Coquimatl├ín',8),(260,'Cuauht├®moc',8),(261,'Ixtlahuac├ín',8),(262,'Manzanillo',8),(263,'Minatitl├ín',8),(264,'Tecom├ín',8),(265,'Villa de Alvarez',8),(266,'Alvaro Obreg├│n',9),(267,'Azcapotzalco',9),(268,'Benito Ju├írez',9),(269,'Coyoac├ín',9),(270,'Cuajimalpa de Morelos',9),(271,'Cuauht├®moc',9),(272,'Gustavo A. Madero',9),(273,'Iztacalco',9),(274,'Iztapalapa',9),(275,'La Magdalena Contreras',9),(276,'Miguel Hidalgo',9),(277,'Milpa Alta',9),(278,'Tl├íhuac',9),(279,'Tlalpan',9),(280,'Venustiano Carranza',9),(281,'Xochimilco',9),(282,'Canatl├ín',10),(283,'Canelas',10),(284,'Coneto de Comonfort',10),(285,'Cuencam├®',10),(286,'Durango',10),(287,'El Oro',10),(288,'G├│mez Palacio',10),(289,'Gral. Sim├│n Bo├¡var',10),(290,'Guadalupe Victoria',10),(291,'Guanacev├¡',10),(292,'Hidalgo',10),(293,'Ind├®',10),(294,'Lerdo',10),(295,'Mapim├¡',10),(296,'Mezquital',10),(297,'Nazas',10),(298,'Nombre de Dios',10),(299,'Nuevo Ideal',10),(300,'Ocampo',10),(301,'Ot├íez',10),(302,'P├ínuco de Coronado',10),(303,'Pe├▒├│n Blanco',10),(304,'Poanas',10),(305,'Pueblo Nuevo',10),(306,'Rodeo',10),(307,'San Bernardo',10),(308,'San Dimas',10),(309,'San Juan de Guadalupe',10),(310,'San Juan del R├¡o',10),(311,'San Luis del Cordero',10),(312,'San Pedro del Gallo',10),(313,'Santa Clara',10),(314,'Santiago Papasquiaro',10),(315,'S├║chil',10),(316,'Tamazula',10),(317,'Tepehuanes',10),(318,'Tlahualilo',10),(319,'Topia',10),(320,'Vicente Guerrero',10),(321,'Acambay',11),(322,'Acolman',11),(323,'Aculco',11),(324,'Almoloya de Alquisiras',11),(325,'Almoloya de Ju├írez',11),(326,'Almoloya del R├¡o',11),(327,'Amanalco',11),(328,'Amatepec',11),(329,'Amecameca',11),(330,'Apaxco',11),(331,'Atenco',11),(332,'Atizap├ín',11),(333,'Atizap├ín de Zaragoza',11),(334,'Atlacomulco',11),(335,'Atlautla',11),(336,'Axapusco',11),(337,'Ayapango',11),(338,'Calimaya',11),(339,'Capulhuac',11),(340,'Chalco',11),(341,'Chapa de Mota',11),(342,'Chapultepec',11),(343,'Chiautla',11),(344,'Chicoloapan',11),(345,'Chiconcuac',11),(346,'Chimalhuac├ín',11),(347,'Coacalco de Berrioz├íbal',11),(348,'Coatepec Harinas',11),(349,'Cocotitl├ín',11),(350,'Coyotepec',11),(351,'Cuautitl├ín',11),(352,'Cuautitl├ín Izcalli',11),(353,'Donato Guerra',11),(354,'Ecatepec de Morelos',11),(355,'Ecatzingo',11),(356,'El Oro',11),(357,'Huehuetoca',11),(358,'Hueypoxtla',11),(359,'Huixquilucan',11),(360,'Isidro Fabela',11),(361,'Ixtapaluca',11),(362,'Ixtapan de la Sal',11),(363,'Ixtapan del Oro',11),(364,'Ixtlahuaca',11),(365,'Jaltenco',11),(366,'Jilotepec',11),(367,'Jilotzingo',11),(368,'Jiquipilco',11),(369,'Jocotitl├ín',11),(370,'Joquicingo',11),(371,'Juchitepec',11),(372,'La Paz',11),(373,'Lerma',11),(374,'Luvianos',11),(375,'Malinalco',11),(376,'Melchor Ocampo',11),(377,'Metepec',11),(378,'Mexicaltzingo',11),(379,'Morelos',11),(380,'Naucalpan de Ju├írez',11),(381,'Nextlalpan',11),(382,'Nezahualc├│yotl',11),(383,'Nicol├ís Romero',11),(384,'Nopaltepec',11),(385,'Ocoyoacac',11),(386,'Ocuilan',11),(387,'Otumba',11),(388,'Otzoloapan',11),(389,'Otzolotepec',11),(390,'Ozumba',11),(391,'Papalotla',11),(392,'Polotitl├ín',11),(393,'Ray├│n',11),(394,'San Antonio la Isla',11),(395,'San Felipe del Progreso',11),(396,'San Jos├® del Rinc├│n',11),(397,'San Mart├¡n de las Pir├ímides',11),(398,'San Mateo Atenco',11),(399,'San Sim├│n de Guerrero',11),(400,'Santo Tom├ís',11),(401,'Soyaniquilpan de Ju├írez',11),(402,'Sultepec',11),(403,'Tec├ímac',11),(404,'Tejupilco',11),(405,'Temamatla',11),(406,'Temascalapa',11),(407,'Temascalcingo',11),(408,'Temascaltepec',11),(409,'Temoaya',11),(410,'Tenancingo',11),(411,'Tenango del Aire',11),(412,'Tenango del Valle',11),(413,'Teoloyuc├ín',11),(414,'Teotihuac├ín',11),(415,'Tepetlaoxtoc',11),(416,'Tepetlixpa',11),(417,'Tepotzotl├ín',11),(418,'Tequixquiac',11),(419,'Texcaltitl├ín',11),(420,'Texcalyacac',11),(421,'Texcoco',11),(422,'Tezoyuca',11),(423,'Tianguistenco',11),(424,'Timilpan',11),(425,'Tlalmanalco',11),(426,'Tlalnepantla de Baz',11),(427,'Tlatlaya',11),(428,'Toluca',11),(429,'Tonanitla',11),(430,'Tonatico',11),(431,'Tultepec',11),(432,'Tultitl├ín',11),(433,'Valle de Bravo',11),(434,'Valle de Chalco Solidaridad',11),(435,'Villa de Allende',11),(436,'Villa del Carb├│n',11),(437,'Villa Guerrero',11),(438,'Villa Victoria',11),(439,'Xalatlaco',11),(440,'Xonacatl├ín',11),(441,'Zacazonapan',11),(442,'Zacualpan',11),(443,'Zinacantepec',11),(444,'Zumpahuac├ín',11),(445,'Zumpango',11),(446,'Abasolo',12),(447,'Ac├ímbaro',12),(448,'Allende',12),(449,'Apaseo el Alto',12),(450,'Apaseo el Grande',12),(451,'Atarjea',12),(452,'Celaya',12),(453,'Comonfort',12),(454,'Coroneo',12),(455,'Cortazar',12),(456,'Cuer├ímaro',12),(457,'Doctor Mora',12),(458,'Dolores Hidalgo',12),(459,'Guanajuato',12),(460,'Huan├¡maro',12),(461,'Irapuato',12),(462,'Jaral del Progreso',12),(463,'Jer├®cuaro',12),(464,'Le├│n',12),(465,'Manuel Doblado',12),(466,'Morole├│n',12),(467,'Ocampo',12),(468,'P├®njamo',12),(469,'Pueblo Nuevo',12),(470,'Pur├¡sima del Rinc├│n',12),(471,'Romita',12),(472,'Salamanca',12),(473,'Salvatierra',12),(474,'San Diego de la Uni├│n',12),(475,'San Felipe',12),(476,'San Francisco del Rinc├│n',12),(477,'San Jos├® Iturbide',12),(478,'San Luis de la Paz',12),(479,'Santa Catarina',12),(480,'Santa Cruz de Juventino Rosas',12),(481,'Santiago Maravat├¡o',12),(482,'Silao',12),(483,'Tarandacuao',12),(484,'Tarimoro',12),(485,'Tierra Blanca',12),(486,'Uriangato',12),(487,'Valle de Santiago',12),(488,'Victoria',12),(489,'Villagr├ín',12),(490,'Xich├║',12),(491,'Yuriria',12),(492,'Acapulco de Ju├írez',13),(493,'Acatepec',13),(494,'Ahuacuotzingo',13),(495,'Ajuchitl├ín del Progreso',13),(496,'Alcozauca de Guerrero',13),(497,'Alpoyeca',13),(498,'Apaxtla',13),(499,'Arcelia',13),(500,'Atenango del R├¡o',13),(501,'Atlamajalcingo del Monte',13),(502,'Atlixtac',13),(503,'Atoyac de Alvarez',13),(504,'Ayutla de los Libres',13),(505,'Azoy├║',13),(506,'Benito Ju├írez',13),(507,'Buenavista de Cu├®llar',13),(508,'Chilapa de Alvarez',13),(509,'Chilpancingo de los Bravo',13),(510,'Coahuayutla de Jos├® Mar├¡a Izazaga',13),(511,'Cochoapa el Grande',13),(512,'Cocula',13),(513,'Copala',13),(514,'Copalillo',13),(515,'Copanatoyac',13),(516,'Coyuca de Ben├¡tez',13),(517,'Coyuca de Catal├ín',13),(518,'Cuajinicuilapa',13),(519,'Cual├íc',13),(520,'Cuautepec',13),(521,'Cuetzala del Progreso',13),(522,'Cutzamala de Pinz├│n',13),(523,'Eduardo Neri',13),(524,'Florencio Villarreal',13),(525,'General Canuto A. Neri',13),(526,'General Heliodoro Castillo',13),(527,'Huamuxtitl├ín',13),(528,'Huitzuco de los Figueroa',13),(529,'Iguala de la Independencia',13),(530,'Igualapa',13),(531,'Ixcateopan de Cuauht├®moc',13),(532,'Jos├® Azueta',13),(533,'Jos├® Joaquin de Herrera',13),(534,'Juan R. Escudero',13),(535,'La Uni├│n de Isidoro Montes de Oca',13),(536,'Leonardo Bravo',13),(537,'Malinaltepec',13),(538,'Marquelia',13),(539,'M├írtir de Cuilapan',13),(540,'Metlat├│noc',13),(541,'Mochitl├ín',13),(542,'Olinal├í',13),(543,'Ometepec',13),(544,'Pedro Ascencio Alquisiras',13),(545,'Petatl├ín',13),(546,'Pilcaya',13),(547,'Pungarabato',13),(548,'Quechultenango',13),(549,'San Luis Acatl├ín',13),(550,'San Marcos',13),(551,'San Miguel Totolapan',13),(552,'Taxco de Alarc├│n',13),(553,'Tecoanapa',13),(554,'T├®cpan de Galeana',13),(555,'Teloloapan',13),(556,'Tepecoacuilco de Trujano',13),(557,'Tetipac',13),(558,'Tixtla de Guerrero',13),(559,'Tlacoachistlahuaca',13),(560,'Tlacoapa',13),(561,'Tlalchapa',13),(562,'Tlalixtaquilla de Maldonado',13),(563,'Tlapa de Comonfort',13),(564,'Tlapehuala',13),(565,'Xalpatl├íhuac',13),(566,'Xochihuehuetl├ín',13),(567,'Xochistlahuaca',13),(568,'Zapotitl├ín Tablas',13),(569,'Zir├índaro',13),(570,'Zitlala',13),(571,'Acatl├ín',14),(572,'Acaxochitl├ín',14),(573,'Actopan',14),(574,'Agua Blanca de Iturbide',14),(575,'Ajacuba',14),(576,'Alfajayucan',14),(577,'Almoloya',14),(578,'Apan',14),(579,'Atitalaquia',14),(580,'Atlapexco',14),(581,'Atotonilco de Tula',14),(582,'Atotonilco el Grande',14),(583,'Calnali',14),(584,'Cardonal',14),(585,'Chapantongo',14),(586,'Chapulhuac├ín',14),(587,'Chilcuautla',14),(588,'Cuautepec de Hinojosa',14),(589,'El Arenal',14),(590,'Eloxochitl├ín',14),(591,'Emiliano Zapata',14),(592,'Epazoyucan',14),(593,'Francisco I. Madero',14),(594,'Huasca de Ocampo',14),(595,'Huautla',14),(596,'Huazalingo',14),(597,'Huehuetla',14),(598,'Huejutla de Reyes',14),(599,'Huichapan',14),(600,'Ixmiquilpan',14),(601,'Jacala de Ledezma',14),(602,'Jaltoc├ín',14),(603,'Ju├írez Hidalgo',14),(604,'La Misi├│n',14),(605,'Lolotla',14),(606,'Metepec',14),(607,'Metztitl├ín',14),(608,'Mineral de la Reforma',14),(609,'Mineral del Chico',14),(610,'Mineral del Monte',14),(611,'Mixquiahuala de Ju├írez',14),(612,'Molango de Escamilla',14),(613,'Nicol├ís Flores',14),(614,'Nopala de Villagr├ín',14),(615,'Omitl├ín de Ju├írez',14),(616,'Pachuca de Soto',14),(617,'Pacula',14),(618,'Pisaflores',14),(619,'Progreso de Obreg├│n',14),(620,'San Agust├¡n Metzquititl├ín',14),(621,'San Agust├¡n Tlaxiaca',14),(622,'San Bartolo Tutotepec',14),(623,'San Felipe Orizatl├ín',14),(624,'San Salvador',14),(625,'Santiago de Anaya',14),(626,'Santiago Tulantepec de Lugo Guerre',14),(627,'Singuilucan',14),(628,'Tasquillo',14),(629,'Tecozautla',14),(630,'Tenango de Doria',14),(631,'Tepeapulco',14),(632,'Tepehuac├ín de Guerrero',14),(633,'Tepeji del R├¡o de Ocampo',14),(634,'Tepetitl├ín',14),(635,'Tetepango',14),(636,'Tezontepec de Aldama',14),(637,'Tianguistengo',14),(638,'Tizayuca',14),(639,'Tlahuelilpan',14),(640,'Tlahuiltepa',14),(641,'Tlanalapa',14),(642,'Tlanchinol',14),(643,'Tlaxcoapan',14),(644,'Tolcayuca',14),(645,'Tula de Allende',14),(646,'Tulancingo de Bravo',14),(647,'Villa de Tezontepec',14),(648,'Xochiatipan',14),(649,'Xochicoatl├ín',14),(650,'Yahualica',14),(651,'Zacualtip├ín de ?ngeles',14),(652,'Zapotl├ín de Ju├írez',14),(653,'Zempoala',14),(654,'Zimap├ín',14),(655,'Acatic',15),(656,'Acatl├ín de Ju├írez',15),(657,'Ahualulco de Mercado',15),(658,'Amacueca',15),(659,'Amatit├ín',15),(660,'Ameca',15),(661,'Arandas',15),(662,'Atemajac de Brizuela',15),(663,'Atengo',15),(664,'Atenguillo',15),(665,'Atotonilco el Alto',15),(666,'Atoyac',15),(667,'Autl├ín de Navarro',15),(668,'Ayotl├ín',15),(669,'Ayutla',15),(670,'Bola├▒os',15),(671,'Cabo Corrientes',15),(672,'Ca├▒adas de Obreg├│n',15),(673,'Casimiro Castillo',15),(674,'Chapala',15),(675,'Chimaltit├ín',15),(676,'Chiquilistl├ín',15),(677,'Cihuatl├ín',15),(678,'Cocula',15),(679,'Colotl├ín',15),(680,'Concepci├│n de Buenos Aires',15),(681,'Cuautitl├ín de Garc├¡a Barrag├ín',15),(682,'Cuautla',15),(683,'Cuqu├¡o',15),(684,'Degollado',15),(685,'Ejutla',15),(686,'EL Arenal',15),(687,'El Grullo',15),(688,'El Lim├│n',15),(689,'El Salto',15),(690,'Encarnaci├│n de D├¡az',15),(691,'Etzatl├ín',15),(692,'G├│mez Far├¡as',15),(693,'Guachinango',15),(694,'Guadalajara',15),(695,'Hostotipaquillo',15),(696,'Huej├║car',15),(697,'Huejuquilla el Alto',15),(698,'Ixtlahuac├ín de los Membrillos',15),(699,'Ixtlahuac├ín del R├¡o',15),(700,'Jalostotitl├ín',15),(701,'Jamay',15),(702,'Jes├║s Mar├¡a',15),(703,'Jilotl├ín de los Dolores',15),(704,'Jocotepec',15),(705,'Juanacatl├ín',15),(706,'Juchitl├ín',15),(707,'La Barca',15),(708,'La Huerta',15),(709,'La Manzanilla de la Paz',15),(710,'Lagos de Moreno',15),(711,'Magdalena',15),(712,'Mascota',15),(713,'Mazamitla',15),(714,'Mexticac├ín',15),(715,'Mezquitic',15),(716,'Mixtl├ín',15),(717,'Ocotl├ín',15),(718,'Ojuelos de Jalisco',15),(719,'Pihuamo',15),(720,'Poncitl├ín',15),(721,'Puerto Vallarta',15),(722,'Quitupan',15),(723,'San Crist├│bal de la Barranca',15),(724,'San Diego de Alejandr├¡a',15),(725,'San Gabriel',15),(726,'San Juan de los Lagos',15),(727,'San Juanito de Escobedo',15),(728,'San Juli├ín',15),(729,'San Marcos',15),(730,'San Mart├¡n de Bola├▒os',15),(731,'San Mart├¡n Hidalgo',15),(732,'San Miguel el Alto',15),(733,'San Sebasti├ín del Oeste',15),(734,'Santa Mar├¡a de los ?ngeles',15),(735,'Santa Mar├¡a del Oro',15),(736,'Sayula',15),(737,'Tala',15),(738,'Talpa de Allende',15),(739,'Tamazula de Gordiano',15),(740,'Tapalpa',15),(741,'Tecalitl├ín',15),(742,'Techaluta de Montenegro',15),(743,'Tecolotl├ín',15),(744,'Tenamaxtl├ín',15),(745,'Teocaltiche',15),(746,'Teocuitatl├ín de Corona',15),(747,'Tepatitl├ín de Morelos',15),(748,'Tequila',15),(749,'Teuchitl├ín',15),(750,'Tizap├ín el Alto',15),(751,'Tlajomulco de Z├║├▒iga',15),(752,'Tlaquepaque',15),(753,'Tolim├ín',15),(754,'Tomatl├ín',15),(755,'Tonal├í',15),(756,'Tonaya',15),(757,'Tonila',15),(758,'Totatiche',15),(759,'Tototl├ín',15),(760,'Tuxcacuesco',15),(761,'Tuxcueca',15),(762,'Tuxpan',15),(763,'Uni├│n de San Antonio',15),(764,'Uni├│n de Tula',15),(765,'Valle de Guadalupe',15),(766,'Valle de Ju├írez',15),(767,'Villa Corona',15),(768,'Villa Guerrero',15),(769,'Villa Hidalgo',15),(770,'Villa Purificaci├│n',15),(771,'Yahualica de Gonz├ílez Gallo',15),(772,'Zacoalco de Torres',15),(773,'Zapopan',15),(774,'Zapotiltic',15),(775,'Zapotitl├ín de Vadillo',15),(776,'Zapotl├ín del Rey',15),(777,'Zapotl├ín el Grande',15),(778,'Zapotlanejo',15),(779,'Acuitzio',16),(780,'Aguililla',16),(781,'Alvaro Obreg├│n',16),(782,'Angamacutiro',16),(783,'Angangueo',16),(784,'Apatzing├ín',16),(785,'Aporo',16),(786,'Aquila',16),(787,'Ario',16),(788,'Arteaga',16),(789,'Brise├▒as',16),(790,'Buenavista',16),(791,'Car├ícuaro',16),(792,'Charapan',16),(793,'Charo',16),(794,'Chavinda',16),(795,'Cher├ín',16),(796,'Chilchota',16),(797,'Chinicuila',16),(798,'Chuc├índiro',16),(799,'Churintzio',16),(800,'Churumuco',16),(801,'Coahuayana',16),(802,'Coalcom├ín de V├ízquez Pallares',16),(803,'Coeneo',16),(804,'Cojumatl├ín de R├®gules',16),(805,'Contepec',16),(806,'Cop├índaro',16),(807,'Cotija',16),(808,'Cuitzeo',16),(809,'Ecuandureo',16),(810,'Epitacio Huerta',16),(811,'Erongar├¡cuaro',16),(812,'Gabriel Zamora',16),(813,'Hidalgo',16),(814,'Huandacareo',16),(815,'Huaniqueo',16),(816,'Huetamo',16),(817,'Huiramba',16),(818,'Indaparapeo',16),(819,'Irimbo',16),(820,'Ixtl├ín',16),(821,'Jacona',16),(822,'Jim├®nez',16),(823,'Jiquilpan',16),(824,'Jos├® Sixto Verduzco',16),(825,'Ju├írez',16),(826,'Jungapeo',16),(827,'La Huacana',16),(828,'La Piedad',16),(829,'Lagunillas',16),(830,'L├ízaro C├írdenas',16),(831,'Los Reyes',16),(832,'Madero',16),(833,'Maravat├¡o',16),(834,'Marcos Castellanos',16),(835,'Morelia',16),(836,'Morelos',16),(837,'M├║gica',16),(838,'Nahuatzen',16),(839,'Nocup├®taro',16),(840,'Nuevo Parangaricutiro',16),(841,'Nuevo Urecho',16),(842,'Numar├ín',16),(843,'Ocampo',16),(844,'Pajacuar├ín',16),(845,'Panind├¡cuaro',16),(846,'Paracho',16),(847,'Par├ícuaro',16),(848,'P├ítzcuaro',16),(849,'Penjamillo',16),(850,'Perib├ín',16),(851,'Pur├®pero',16),(852,'Puru├índiro',16),(853,'Quer├®ndaro',16),(854,'Quiroga',16),(855,'Sahuayo',16),(856,'Salvador Escalante',16),(857,'San Lucas',16),(858,'Santa Ana Maya',16),(859,'Senguio',16),(860,'Susupuato',16),(861,'Tac├ímbaro',16),(862,'Tanc├¡taro',16),(863,'Tangamandapio',16),(864,'Tanganc├¡cuaro',16),(865,'Tanhuato',16),(866,'Taretan',16),(867,'Tar├¡mbaro',16),(868,'Tepalcatepec',16),(869,'Ting?ind├¡n',16),(870,'Tingambato',16),(871,'Tiquicheo de Nicol├ís Romero',16),(872,'Tlalpujahua',16),(873,'Tlazazalca',16),(874,'Tocumbo',16),(875,'Tumbiscat├¡o',16),(876,'Turicato',16),(877,'Tuxpan',16),(878,'Tuzantla',16),(879,'Tzintzuntzan',16),(880,'Tzitzio',16),(881,'Uruapan',16),(882,'Venustiano Carranza',16),(883,'Villamar',16),(884,'Vista Hermosa',16),(885,'Yur├®cuaro',16),(886,'Zacapu',16),(887,'Zamora',16),(888,'Zin├íparo',16),(889,'Zinap├®cuaro',16),(890,'Ziracuaretiro',16),(891,'Zit├ícuaro',16),(892,'Amacuzac',17),(893,'Atlatlahucan',17),(894,'Axochiapan',17),(895,'Ayala',17),(896,'Coatl├ín del R├¡o',17),(897,'Cuautla',17),(898,'Cuernavaca',17),(899,'Emiliano Zapata',17),(900,'Huitzilac',17),(901,'Jantetelco',17),(902,'Jiutepec',17),(903,'Jojutla',17),(904,'Jonacatepec',17),(905,'Mazatepec',17),(906,'Miacatl├ín',17),(907,'Ocuituco',17),(908,'Puente de Ixtla',17),(909,'Temixco',17),(910,'Temoac',17),(911,'Tepalcingo',17),(912,'Tepoztl├ín',17),(913,'Tetecala',17),(914,'Tetela del Volc├ín',17),(915,'Tlalnepantla',17),(916,'Tlaltizap├ín',17),(917,'Tlaquiltenango',17),(918,'Tlayacapan',17),(919,'Totolapan',17),(920,'Xochitepec',17),(921,'Yautepec',17),(922,'Yecapixtla',17),(923,'Zacatepec de Hidalgo',17),(924,'Zacualpan de Amilpas',17),(925,'Acaponeta',18),(926,'Ahuacatl├ín',18),(927,'Amatl├ín de Ca├▒as',18),(928,'Bah├¡a de Banderas',18),(929,'Compostela',18),(930,'Del Nayar',18),(931,'Huajicori',18),(932,'Ixtl├ín del R├¡o',18),(933,'Jala',18),(934,'La Yesca',18),(935,'Rosamorada',18),(936,'Ru├¡z',18),(937,'San Blas',18),(938,'San Pedro Lagunillas',18),(939,'Santa Mar├¡a del Oro',18),(940,'Santiago Ixcuintla',18),(941,'Tecuala',18),(942,'Tepic',18),(943,'Tuxpan',18),(944,'Xalisco',18),(945,'Abasolo',19),(946,'Agualeguas',19),(947,'Allende',19),(948,'An├íhuac',19),(949,'Apodaca',19),(950,'Aramberri',19),(951,'Bustamante',19),(952,'Cadereyta Jim├®nez',19),(953,'Carmen',19),(954,'Cerralvo',19),(955,'China',19),(956,'Ci├®nega de Flores',19),(957,'Dr. Coss',19),(958,'Dr. Arroyo',19),(959,'Dr. Gonz├ílez',19),(960,'Galeana',19),(961,'Garc├¡a',19),(962,'Gral. Escobedo',19),(963,'Gral. Ter├ín',19),(964,'Gral. Trevi├▒o',19),(965,'Gral. Zaragoza',19),(966,'Gral. Zuazua',19),(967,'Gral. Bravo',19),(968,'Guadalupe',19),(969,'Hidalgo',19),(970,'Higueras',19),(971,'Hualahuises',19),(972,'Iturbide',19),(973,'Ju├írez',19),(974,'Lampazos de Naranjo',19),(975,'Linares',19),(976,'Los Aldamas',19),(977,'Los Herreras',19),(978,'Los Ramones',19),(979,'Mar├¡n',19),(980,'Melchor Ocampo',19),(981,'Mier y Noriega',19),(982,'Mina',19),(983,'Montemorelos',19),(984,'Monterrey',19),(985,'Par├ís',19),(986,'Pesquer├¡a',19),(987,'Rayones',19),(988,'Sabinas Hidalgo',19),(989,'Salinas Victoria',19),(990,'San Nicol├ís de los Garza',19),(991,'San Pedro Garza Garc├¡a',19),(992,'Santa Catarina',19),(993,'Santiago',19),(994,'Vallecillo',19),(995,'Villaldama',19),(996,'Abejones',20),(997,'Acatl├ín de P├®rez Figueroa',20),(998,'Animas Trujano',20),(999,'Asunci├│n Cacalotepec',20),(1000,'Asunci├│n Cuyotepeji',20),(1001,'Asunci├│n Ixtaltepec',20),(1002,'Asunci├│n Nochixtl├ín',20),(1003,'Asunci├│n Ocotl├ín',20),(1004,'Asunci├│n Tlacolulita',20),(1005,'Ayoquezco de Aldama',20),(1006,'Ayotzintepec',20),(1007,'Calihual├í',20),(1008,'Candelaria Loxicha',20),(1009,'Capul├ílpam de M├®ndez',20),(1010,'Chahuites',20),(1011,'Chalcatongo de Hidalgo',20),(1012,'Chiquihuitl├ín de Benito Ju├írez',20),(1013,'Ci├®nega de Zimatl├ín',20),(1014,'Ciudad Ixtepec',20),(1015,'Coatecas Altas',20),(1016,'Coicoy├ín de las Flores',20),(1017,'Concepci├│n Buenavista',20),(1018,'Concepci├│n P├ípalo',20),(1019,'Constancia del Rosario',20),(1020,'Cosolapa',20),(1021,'Cosoltepec',20),(1022,'Cuil├ípam de Guerrero',20),(1023,'Cuyamecalco Villa de Zaragoza',20),(1024,'El Barrio de la Soledad',20),(1025,'El Espinal',20),(1026,'Eloxochitl├ín de Flores Mag├│n',20),(1027,'Fresnillo de Trujano',20),(1028,'Guadalupe de Ram├¡rez',20),(1029,'Guadalupe Etla',20),(1030,'Guelatao de Ju├írez',20),(1031,'Guevea de Humboldt',20),(1032,'Heroica Ciudad de Ejutla de Crespo',20),(1033,'Heroica Ciudad de Huajuapan de Le├│',20),(1034,'Heroica Ciudad de Tlaxiaco',20),(1035,'Huautepec',20),(1036,'Huautla de Jim├®nez',20),(1037,'Ixpantepec Nieves',20),(1038,'Ixtl├ín de Ju├írez',20),(1039,'Juchit├ín de Zaragoza',20),(1040,'La Compa├▒├¡a',20),(1041,'La Pe',20),(1042,'La Reforma',20),(1043,'La Trinidad Vista Hermosa',20),(1044,'Loma Bonita',20),(1045,'Magdalena Apasco',20),(1046,'Magdalena Jaltepec',20),(1047,'Magdalena Mixtepec',20),(1048,'Magdalena Ocotl├ín',20),(1049,'Magdalena Pe├▒asco',20),(1050,'Magdalena Teitipac',20),(1051,'Magdalena Tequisistl├ín',20),(1052,'Magdalena Tlacotepec',20),(1053,'Magdalena Yodocono de Porfirio D├¡a',20),(1054,'Magdalena Zahuatl├ín',20),(1055,'Mariscala de Ju├írez',20),(1056,'M├írtires de Tacubaya',20),(1057,'Mat├¡as Romero Avenda├▒o',20),(1058,'Mazatl├ín Villa de Flores',20),(1059,'Mesones Hidalgo',20),(1060,'Miahuatl├ín de Porfirio D├¡az',20),(1061,'Mixistl├ín de la Reforma',20),(1062,'Monjas',20),(1063,'Natividad',20),(1064,'Nazareno Etla',20),(1065,'Nejapa de Madero',20),(1066,'Nuevo Zoquiapam',20),(1067,'Oaxaca de Ju├írez',20),(1068,'Ocotl├ín de Morelos',20),(1069,'Pinotepa de Don Luis',20),(1070,'Pluma Hidalgo',20),(1071,'Putla Villa de Guerrero',20),(1072,'Reforma de Pineda',20),(1073,'Reyes Etla',20),(1074,'Rojas de Cuauht├®moc',20),(1075,'Salina Cruz',20),(1076,'San Agust├¡n Amatengo',20),(1077,'San Agust├¡n Atenango',20),(1078,'San Agust├¡n Chayuco',20),(1079,'San Agust├¡n de las Juntas',20),(1080,'San Agust├¡n Etla',20),(1081,'San Agust├¡n Loxicha',20),(1082,'San Agust├¡n Tlacotepec',20),(1083,'San Agust├¡n Yatareni',20),(1084,'San Andr├®s Cabecera Nueva',20),(1085,'San Andr├®s Dinicuiti',20),(1086,'San Andr├®s Huaxpaltepec',20),(1087,'San Andr├®s Huayapam',20),(1088,'San Andr├®s Ixtlahuaca',20),(1089,'San Andr├®s Lagunas',20),(1090,'San Andr├®s Nuxi├▒o',20),(1091,'San Andr├®s Paxtl├ín',20),(1092,'San Andr├®s Sinaxtla',20),(1093,'San Andr├®s Solaga',20),(1094,'San Andr├®s Teotilalpam',20),(1095,'San Andr├®s Tepetlapa',20),(1096,'San Andr├®s Ya├í',20),(1097,'San Andr├®s Zabache',20),(1098,'San Andr├®s Zautla',20),(1099,'San Antonino Castillo Velasco',20),(1100,'San Antonino el Alto',20),(1101,'San Antonino Monte Verde',20),(1102,'San Antonio Acutla',20),(1103,'San Antonio de la Cal',20),(1104,'San Antonio Huitepec',20),(1105,'San Antonio Nanahuat├¡pam',20),(1106,'San Antonio Sinicahua',20),(1107,'San Antonio Tepetlapa',20),(1108,'San Baltazar Chichic├ípam',20),(1109,'San Baltazar Loxicha',20),(1110,'San Baltazar Yatzachi el Bajo',20),(1111,'San Bartolo Coyotepec',20),(1112,'San Bartolo Soyaltepec',20),(1113,'San Bartolo Yautepec',20),(1114,'San Bartolom├® Ayautla',20),(1115,'San Bartolom├® Loxicha',20),(1116,'San Bartolom├® Quialana',20),(1117,'San Bartolom├® Yucua├▒e',20),(1118,'San Bartolom├® Zoogocho',20),(1119,'San Bernardo Mixtepec',20),(1120,'San Blas Atempa',20),(1121,'San Carlos Yautepec',20),(1122,'San Crist├│bal Amatl├ín',20),(1123,'San Crist├│bal Amoltepec',20),(1124,'San Crist├│bal Lachirioag',20),(1125,'San Crist├│bal Suchixtlahuaca',20),(1126,'San Dionisio del Mar',20),(1127,'San Dionisio Ocotepec',20),(1128,'San Dionisio Ocotl├ín',20),(1129,'San Esteban Atatlahuca',20),(1130,'San Felipe Jalapa de D├¡az',20),(1131,'San Felipe Tejalapam',20),(1132,'San Felipe Usila',20),(1133,'San Francisco Cahuacu├í',20),(1134,'San Francisco Cajonos',20),(1135,'San Francisco Chapulapa',20),(1136,'San Francisco Chind├║a',20),(1137,'San Francisco del Mar',20),(1138,'San Francisco Huehuetl├ín',20),(1139,'San Francisco Ixhuat├ín',20),(1140,'San Francisco Jaltepetongo',20),(1141,'San Francisco Lachigol├│',20),(1142,'San Francisco Logueche',20),(1143,'San Francisco Nuxa├▒o',20),(1144,'San Francisco Ozolotepec',20),(1145,'San Francisco Sola',20),(1146,'San Francisco Telixtlahuaca',20),(1147,'San Francisco Teopan',20),(1148,'San Francisco Tlapancingo',20),(1149,'San Gabriel Mixtepec',20),(1150,'San Ildefonso Amatl├ín',20),(1151,'San Ildefonso Sola',20),(1152,'San Ildefonso Villa Alta',20),(1153,'San Jacinto Amilpas',20),(1154,'San Jacinto Tlacotepec',20),(1155,'San Jer├│nimo Coatl├ín',20),(1156,'San Jer├│nimo Silacayoapilla',20),(1157,'San Jer├│nimo Sosola',20),(1158,'San Jer├│nimo Taviche',20),(1159,'San Jer├│nimo Teco├ítl',20),(1160,'San Jer├│nimo Tlacochahuaya',20),(1161,'San Jorge Nuchita',20),(1162,'San Jos├® Ayuquila',20),(1163,'San Jos├® Chiltepec',20),(1164,'San Jos├® del Pe├▒asco',20),(1165,'San Jos├® del Progreso',20),(1166,'San Jos├® Estancia Grande',20),(1167,'San Jos├® Independencia',20),(1168,'San Jos├® Lachiguiri',20),(1169,'San Jos├® Tenango',20),(1170,'San Juan ?um├¡',20),(1171,'San Juan Achiutla',20),(1172,'San Juan Atepec',20),(1173,'San Juan Bautista Atatlahuca',20),(1174,'San Juan Bautista Coixtlahuaca',20),(1175,'San Juan Bautista Cuicatl├ín',20),(1176,'San Juan Bautista Guelache',20),(1177,'San Juan Bautista Jayacatl├ín',20),(1178,'San Juan Bautista Lo de Soto',20),(1179,'San Juan Bautista Suchitepec',20),(1180,'San Juan Bautista Tlachichilco',20),(1181,'San Juan Bautista Tlacoatzintepec',20),(1182,'San Juan Bautista Tuxtepec',20),(1183,'San Juan Bautista Valle Nacional',20),(1184,'San Juan Cacahuatepec',20),(1185,'San Juan Chicomez├║chil',20),(1186,'San Juan Chilateca',20),(1187,'San Juan Cieneguilla',20),(1188,'San Juan Coatz├│spam',20),(1189,'San Juan Colorado',20),(1190,'San Juan Comaltepec',20),(1191,'San Juan Cotzoc├│n',20),(1192,'San Juan de los Cu├®s',20),(1193,'San Juan del Estado',20),(1194,'San Juan del R├¡o',20),(1195,'San Juan Diuxi',20),(1196,'San Juan Evangelista Analco',20),(1197,'San Juan Guelav├¡a',20),(1198,'San Juan Guichicovi',20),(1199,'San Juan Ihualtepec',20),(1200,'San Juan Juquila Mixes',20),(1201,'San Juan Juquila Vijanos',20),(1202,'San Juan Lachao',20),(1203,'San Juan Lachigalla',20),(1204,'San Juan Lajarcia',20),(1205,'San Juan Lalana',20),(1206,'San Juan Mazatl├ín',20),(1207,'San Juan Mixtepec',20),(1208,'San Juan Mixtepec',20),(1209,'San Juan Ozolotepec',20),(1210,'San Juan Petlapa',20),(1211,'San Juan Quiahije',20),(1212,'San Juan Quiotepec',20),(1213,'San Juan Sayultepec',20),(1214,'San Juan Taba├í',20),(1215,'San Juan Tamazola',20),(1216,'San Juan Teita',20),(1217,'San Juan Teitipac',20),(1218,'San Juan Tepeuxila',20),(1219,'San Juan Teposcolula',20),(1220,'San Juan Yae├®',20),(1221,'San Juan Yatzona',20),(1222,'San Juan Yucuita',20),(1223,'San Lorenzo',20),(1224,'San Lorenzo Albarradas',20),(1225,'San Lorenzo Cacaotepec',20),(1226,'San Lorenzo Cuaunecuiltitla',20),(1227,'San Lorenzo Texmelucan',20),(1228,'San Lorenzo Victoria',20),(1229,'San Lucas Camotl├ín',20),(1230,'San Lucas Ojitl├ín',20),(1231,'San Lucas Quiavin├¡',20),(1232,'San Lucas Zoqui├ípam',20),(1233,'San Luis Amatl├ín',20),(1234,'San Marcial Ozolotepec',20),(1235,'San Marcos Arteaga',20),(1236,'San Mart├¡n de los Cansecos',20),(1237,'San Mart├¡n Huamel├║lpam',20),(1238,'San Mart├¡n Itunyoso',20),(1239,'San Mart├¡n Lachil├í',20),(1240,'San Mart├¡n Peras',20),(1241,'San Mart├¡n Tilcajete',20),(1242,'San Mart├¡n Toxpalan',20),(1243,'San Mart├¡n Zacatepec',20),(1244,'San Mateo Cajonos',20),(1245,'San Mateo del Mar',20),(1246,'San Mateo Etlatongo',20),(1247,'San Mateo Nej├ípam',20),(1248,'San Mateo Pe├▒asco',20),(1249,'San Mateo Pi├▒as',20),(1250,'San Mateo R├¡o Hondo',20),(1251,'San Mateo Sindihui',20),(1252,'San Mateo Tlapiltepec',20),(1253,'San Mateo Yoloxochitl├ín',20),(1254,'San Melchor Betaza',20),(1255,'San Miguel Achiutla',20),(1256,'San Miguel Ahuehuetitl├ín',20),(1257,'San Miguel Alo├ípam',20),(1258,'San Miguel Amatitl├ín',20),(1259,'San Miguel Amatl├ín',20),(1260,'San Miguel Chicahua',20),(1261,'San Miguel Chimalapa',20),(1262,'San Miguel Coatl├ín',20),(1263,'San Miguel del Puerto',20),(1264,'San Miguel del R├¡o',20),(1265,'San Miguel Ejutla',20),(1266,'San Miguel el Grande',20),(1267,'San Miguel Huautla',20),(1268,'San Miguel Mixtepec',20),(1269,'San Miguel Panixtlahuaca',20),(1270,'San Miguel Peras',20),(1271,'San Miguel Piedras',20),(1272,'San Miguel Quetzaltepec',20),(1273,'San Miguel Santa Flor',20),(1274,'San Miguel Soyaltepec',20),(1275,'San Miguel Suchixtepec',20),(1276,'San Miguel Tecomatl├ín',20),(1277,'San Miguel Tenango',20),(1278,'San Miguel Tequixtepec',20),(1279,'San Miguel Tilqui├ípam',20),(1280,'San Miguel Tlacamama',20),(1281,'San Miguel Tlacotepec',20),(1282,'San Miguel Tulancingo',20),(1283,'San Miguel Yotao',20),(1284,'San Nicol├ís',20),(1285,'San Nicol├ís Hidalgo',20),(1286,'San Pablo Coatl├ín',20),(1287,'San Pablo Cuatro Venados',20),(1288,'San Pablo Etla',20),(1289,'San Pablo Huitzo',20),(1290,'San Pablo Huixtepec',20),(1291,'San Pablo Macuiltianguis',20),(1292,'San Pablo Tijaltepec',20),(1293,'San Pablo Villa de Mitla',20),(1294,'San Pablo Yaganiza',20),(1295,'San Pedro Amuzgos',20),(1296,'San Pedro Ap├│stol',20),(1297,'San Pedro Atoyac',20),(1298,'San Pedro Cajonos',20),(1299,'San Pedro Comitancillo',20),(1300,'San Pedro Coxcaltepec C├íntaros',20),(1301,'San Pedro el Alto',20),(1302,'San Pedro Huamelula',20),(1303,'San Pedro Huilotepec',20),(1304,'San Pedro Ixcatl├ín',20),(1305,'San Pedro Ixtlahuaca',20),(1306,'San Pedro Jaltepetongo',20),(1307,'San Pedro Jicay├ín',20),(1308,'San Pedro Jocotipac',20),(1309,'San Pedro Juchatengo',20),(1310,'San Pedro M├írtir',20),(1311,'San Pedro M├írtir Quiechapa',20),(1312,'San Pedro M├írtir Yucuxaco',20),(1313,'San Pedro Mixtepec',20),(1314,'San Pedro Mixtepec',20),(1315,'San Pedro Molinos',20),(1316,'San Pedro Nopala',20),(1317,'San Pedro Ocopetatillo',20),(1318,'San Pedro Ocotepec',20),(1319,'San Pedro Pochutla',20),(1320,'San Pedro Quiatoni',20),(1321,'San Pedro Sochiapam',20),(1322,'San Pedro Tapanatepec',20),(1323,'San Pedro Taviche',20),(1324,'San Pedro Teozacoalco',20),(1325,'San Pedro Teutila',20),(1326,'San Pedro Tida├í',20),(1327,'San Pedro Topiltepec',20),(1328,'San Pedro Totolapa',20),(1329,'San Pedro y San Pablo Ayutla',20),(1330,'San Pedro y San Pablo Teposcolula',20),(1331,'San Pedro y San Pablo Tequixtepec',20),(1332,'San Pedro Yaneri',20),(1333,'San Pedro Y├│lox',20),(1334,'San Pedro Yucunama',20),(1335,'San Raymundo Jalpan',20),(1336,'San Sebasti├ín Abasolo',20),(1337,'San Sebasti├ín Coatl├ín',20),(1338,'San Sebasti├ín Ixcapa',20),(1339,'San Sebasti├ín Nicananduta',20),(1340,'San Sebasti├ín R├¡o Hondo',20),(1341,'San Sebasti├ín Tecomaxtlahuaca',20),(1342,'San Sebasti├ín Teitipac',20),(1343,'San Sebasti├ín Tutla',20),(1344,'San Sim├│n Almolongas',20),(1345,'San Sim├│n Zahuatl├ín',20),(1346,'San Vicente Coatl├ín',20),(1347,'San Vicente Lachix├¡o',20),(1348,'San Vicente Nu├▒├║',20),(1349,'Santa Ana',20),(1350,'Santa Ana Ateixtlahuaca',20),(1351,'Santa Ana Cuauht├®moc',20),(1352,'Santa Ana del Valle',20),(1353,'Santa Ana Tavela',20),(1354,'Santa Ana Tlapacoyan',20),(1355,'Santa Ana Yareni',20),(1356,'Santa Ana Zegache',20),(1357,'Santa Catalina Quier├¡',20),(1358,'Santa Catarina Cuixtla',20),(1359,'Santa Catarina Ixtepeji',20),(1360,'Santa Catarina Juquila',20),(1361,'Santa Catarina Lachatao',20),(1362,'Santa Catarina Loxicha',20),(1363,'Santa Catarina Mechoac├ín',20),(1364,'Santa Catarina Minas',20),(1365,'Santa Catarina Quian├®',20),(1366,'Santa Catarina Quioquitani',20),(1367,'Santa Catarina Tayata',20),(1368,'Santa Catarina Ticu├í',20),(1369,'Santa Catarina Yosonot├║',20),(1370,'Santa Catarina Zapoquila',20),(1371,'Santa Cruz Acatepec',20),(1372,'Santa Cruz Amilpas',20),(1373,'Santa Cruz de Bravo',20),(1374,'Santa Cruz Itundujia',20),(1375,'Santa Cruz Mixtepec',20),(1376,'Santa Cruz Nundaco',20),(1377,'Santa Cruz Papalutla',20),(1378,'Santa Cruz Tacache de Mina',20),(1379,'Santa Cruz Tacahua',20),(1380,'Santa Cruz Tayata',20),(1381,'Santa Cruz Xitla',20),(1382,'Santa Cruz Xoxocotl├ín',20),(1383,'Santa Cruz Zenzontepec',20),(1384,'Santa Gertrudis',20),(1385,'Santa In├®s de Zaragoza',20),(1386,'Santa In├®s del Monte',20),(1387,'Santa In├®s Yatzeche',20),(1388,'Santa Luc├¡a del Camino',20),(1389,'Santa Luc├¡a Miahuatl├ín',20),(1390,'Santa Luc├¡a Monteverde',20),(1391,'Santa Luc├¡a Ocotl├ín',20),(1392,'Santa Magdalena Jicotl├ín',20),(1393,'Santa Mar├¡a Alotepec',20),(1394,'Santa Mar├¡a Apazco',20),(1395,'Santa Mar├¡a Atzompa',20),(1396,'Santa Mar├¡a Camotl├ín',20),(1397,'Santa Mar├¡a Chacho├ípam',20),(1398,'Santa Mar├¡a Chilchotla',20),(1399,'Santa Mar├¡a Chimalapa',20),(1400,'Santa Mar├¡a Colotepec',20),(1401,'Santa Mar├¡a Cortijo',20),(1402,'Santa Mar├¡a Coyotepec',20),(1403,'Santa Mar├¡a del Rosario',20),(1404,'Santa Mar├¡a del Tule',20),(1405,'Santa Mar├¡a Ecatepec',20),(1406,'Santa Mar├¡a Guelac├®',20),(1407,'Santa Mar├¡a Guienagati',20),(1408,'Santa Mar├¡a Huatulco',20),(1409,'Santa Mar├¡a Huazolotitl├ín',20),(1410,'Santa Mar├¡a Ipalapa',20),(1411,'Santa Mar├¡a Ixcatl├ín',20),(1412,'Santa Mar├¡a Jacatepec',20),(1413,'Santa Mar├¡a Jalapa del Marqu├®s',20),(1414,'Santa Mar├¡a Jaltianguis',20),(1415,'Santa Mar├¡a la Asunci├│n',20),(1416,'Santa Mar├¡a Lachix├¡o',20),(1417,'Santa Mar├¡a Mixtequilla',20),(1418,'Santa Mar├¡a Nativitas',20),(1419,'Santa Mar├¡a Nduayaco',20),(1420,'Santa Mar├¡a Ozolotepec',20),(1421,'Santa Mar├¡a P├ípalo',20),(1422,'Santa Mar├¡a Pe├▒oles',20),(1423,'Santa Mar├¡a Petapa',20),(1424,'Santa Mar├¡a Quiegolani',20),(1425,'Santa Mar├¡a Sola',20),(1426,'Santa Mar├¡a Tataltepec',20),(1427,'Santa Mar├¡a Tecomavaca',20),(1428,'Santa Mar├¡a Temaxcalapa',20),(1429,'Santa Mar├¡a Temaxcaltepec',20),(1430,'Santa Mar├¡a Teopoxco',20),(1431,'Santa Mar├¡a Tepantlali',20),(1432,'Santa Mar├¡a Texcatitl├ín',20),(1433,'Santa Mar├¡a Tlahuitoltepec',20),(1434,'Santa Mar├¡a Tlalixtac',20),(1435,'Santa Mar├¡a Tonameca',20),(1436,'Santa Mar├¡a Totolapilla',20),(1437,'Santa Mar├¡a Xadani',20),(1438,'Santa Mar├¡a Yalina',20),(1439,'Santa Mar├¡a Yaves├¡a',20),(1440,'Santa Mar├¡a Yolotepec',20),(1441,'Santa Mar├¡a Yosoy├║a',20),(1442,'Santa Mar├¡a Yucuhiti',20),(1443,'Santa Mar├¡a Zacatepec',20),(1444,'Santa Mar├¡a Zaniza',20),(1445,'Santa Mar├¡a Zoquitl├ín',20),(1446,'Santiago Amoltepec',20),(1447,'Santiago Apoala',20),(1448,'Santiago Ap├│stol',20),(1449,'Santiago Astata',20),(1450,'Santiago Atitl├ín',20),(1451,'Santiago Ayuquililla',20),(1452,'Santiago Cacaloxtepec',20),(1453,'Santiago Camotl├ín',20),(1454,'Santiago Chazumba',20),(1455,'Santiago Choapam',20),(1456,'Santiago Comaltepec',20),(1457,'Santiago del R├¡o',20),(1458,'Santiago Huajolotitl├ín',20),(1459,'Santiago Huauclilla',20),(1460,'Santiago Ihuitl├ín Plumas',20),(1461,'Santiago Ixcuintepec',20),(1462,'Santiago Ixtayutla',20),(1463,'Santiago Jamiltepec',20),(1464,'Santiago Jocotepec',20),(1465,'Santiago Juxtlahuaca',20),(1466,'Santiago Lachiguiri',20),(1467,'Santiago Lalopa',20),(1468,'Santiago Laollaga',20),(1469,'Santiago Laxopa',20),(1470,'Santiago Llano Grande',20),(1471,'Santiago Matatl├ín',20),(1472,'Santiago Miltepec',20),(1473,'Santiago Minas',20),(1474,'Santiago Nacaltepec',20),(1475,'Santiago Nejapilla',20),(1476,'Santiago Niltepec',20),(1477,'Santiago Nundiche',20),(1478,'Santiago Nuyo├│',20),(1479,'Santiago Pinotepa Nacional',20),(1480,'Santiago Suchilquitongo',20),(1481,'Santiago Tamazola',20),(1482,'Santiago Tapextla',20),(1483,'Santiago Tenango',20),(1484,'Santiago Tepetlapa',20),(1485,'Santiago Tetepec',20),(1486,'Santiago Texcalcingo',20),(1487,'Santiago Textitl├ín',20),(1488,'Santiago Tilantongo',20),(1489,'Santiago Tillo',20),(1490,'Santiago Tlazoyaltepec',20),(1491,'Santiago Xanica',20),(1492,'Santiago Xiacu├¡',20),(1493,'Santiago Yaitepec',20),(1494,'Santiago Yaveo',20),(1495,'Santiago Yolom├®catl',20),(1496,'Santiago Yosond├║a',20),(1497,'Santiago Yucuyachi',20),(1498,'Santiago Zacatepec',20),(1499,'Santiago Zoochila',20),(1500,'Santo Domingo Albarradas',20),(1501,'Santo Domingo Armenta',20),(1502,'Santo Domingo Chihuit├ín',20),(1503,'Santo Domingo de Morelos',20),(1504,'Santo Domingo Ingenio',20),(1505,'Santo Domingo Ixcatl├ín',20),(1506,'Santo Domingo Nuxa├í',20),(1507,'Santo Domingo Ozolotepec',20),(1508,'Santo Domingo Petapa',20),(1509,'Santo Domingo Roayaga',20),(1510,'Santo Domingo Tehuantepec',20),(1511,'Santo Domingo Teojomulco',20),(1512,'Santo Domingo Tepuxtepec',20),(1513,'Santo Domingo Tlatay├ípam',20),(1514,'Santo Domingo Tomaltepec',20),(1515,'Santo Domingo Tonal├í',20),(1516,'Santo Domingo Tonaltepec',20),(1517,'Santo Domingo Xagac├¡a',20),(1518,'Santo Domingo Yanhuitl├ín',20),(1519,'Santo Domingo Yodohino',20),(1520,'Santo Domingo Zanatepec',20),(1521,'Santo Tom├ís Jalieza',20),(1522,'Santo Tom├ís Mazaltepec',20),(1523,'Santo Tom├ís Ocotepec',20),(1524,'Santo Tom├ís Tamazulapan',20),(1525,'Santos Reyes Nopala',20),(1526,'Santos Reyes P├ípalo',20),(1527,'Santos Reyes Tepejillo',20),(1528,'Santos Reyes Yucun├í',20),(1529,'Silacayo├ípam',20),(1530,'Sitio de Xitlapehua',20),(1531,'Soledad Etla',20),(1532,'Tamazulapam del Esp├¡ritu Santo',20),(1533,'Tanetze de Zaragoza',20),(1534,'Taniche',20),(1535,'Tataltepec de Vald├®s',20),(1536,'Teococuilco de Marcos P├®rez',20),(1537,'Teotitl├ín de Flores Mag├│n',20),(1538,'Teotitl├ín del Valle',20),(1539,'Teotongo',20),(1540,'Tepelmeme Villa de Morelos',20),(1541,'Tezoatl├ín de Segura y Luna',20),(1542,'Tlacolula de Matamoros',20),(1543,'Tlacotepec Plumas',20),(1544,'Tlalixtac de Cabrera',20),(1545,'Totontepec Villa de Morelos',20),(1546,'Trinidad Zaachila',20),(1547,'Uni├│n Hidalgo',20),(1548,'Valerio Trujano',20),(1549,'Villa de Chilapa de D├¡az',20),(1550,'Villa de Etla',20),(1551,'Villa de Tamazul├ípam del Progreso',20),(1552,'Villa de Tututepec de Melchor Ocam',20),(1553,'Villa de Zaachila',20),(1554,'Villa D├¡az Ordaz',20),(1555,'Villa Hidalgo',20),(1556,'Villa Sola de Vega',20),(1557,'Villa Talea de Castro',20),(1558,'Villa Tej├║pam de la Uni├│n',20),(1559,'Yaxe',20),(1560,'Yogana',20),(1561,'Yutanduchi de Guerrero',20),(1562,'Zapotitl├ín del R├¡o',20),(1563,'Zapotitl├ín Lagunas',20),(1564,'Zapotitl├ín Palmas',20),(1565,'Zimatl├ín de Alvarez',20),(1566,'Acajete',21),(1567,'Acateno',21),(1568,'Acatl├ín',21),(1569,'Acatzingo',21),(1570,'Acteopan',21),(1571,'Ahuacatl├ín',21),(1572,'Ahuatl├ín',21),(1573,'Ahuazotepec',21),(1574,'Ahuehuetitla',21),(1575,'Ajalpan',21),(1576,'Albino Zertuche',21),(1577,'Aljojuca',21),(1578,'Altepexi',21),(1579,'Amixtl├ín',21),(1580,'Amozoc',21),(1581,'Aquixtla',21),(1582,'Atempan',21),(1583,'Atexcal',21),(1584,'Atlequizayan',21),(1585,'Atlixco',21),(1586,'Atoyatempan',21),(1587,'Atzala',21),(1588,'Atzitzihuac├ín',21),(1589,'Atzitzintla',21),(1590,'Axutla',21),(1591,'Ayotoxco de Guerrero',21),(1592,'Calpan',21),(1593,'Caltepec',21),(1594,'Camocuautla',21),(1595,'Ca├▒ada Morelos',21),(1596,'Caxhuacan',21),(1597,'Chalchicomula de Sesma',21),(1598,'Chapulco',21),(1599,'Chiautla',21),(1600,'Chiautzingo',21),(1601,'Chichiquila',21),(1602,'Chiconcuautla',21),(1603,'Chietla',21),(1604,'Chigmecatitl├ín',21),(1605,'Chignahuapan',21),(1606,'Chignautla',21),(1607,'Chila',21),(1608,'Chila de la Sal',21),(1609,'Chilchotla',21),(1610,'Chinantla',21),(1611,'Coatepec',21),(1612,'Coatzingo',21),(1613,'Cohetzala',21),(1614,'Cohuec├ín',21),(1615,'Coronango',21),(1616,'Coxcatl├ín',21),(1617,'Coyomeapan',21),(1618,'Coyotepec',21),(1619,'Cuapiaxtla de Madero',21),(1620,'Cuautempan',21),(1621,'Cuautinch├ín',21),(1622,'Cuautlancingo',21),(1623,'Cuayuca de Andrade',21),(1624,'Cuetzalan del Progreso',21),(1625,'Cuyoaco',21),(1626,'Domingo Arenas',21),(1627,'Eloxochitl├ín',21),(1628,'Epatl├ín',21),(1629,'Esperanza',21),(1630,'Francisco Z. Mena',21),(1631,'General Felipe ?ngeles',21),(1632,'Guadalupe',21),(1633,'Guadalupe Victoria',21),(1634,'Hermenegildo Galeana',21),(1635,'Honey',21),(1636,'Huaquechula',21),(1637,'Huatlatlauca',21),(1638,'Huauchinango',21),(1639,'Huehuetla',21),(1640,'Huehuetl├ín el Chico',21),(1641,'Huehuetl├ín el Grande',21),(1642,'Huejotzingo',21),(1643,'Hueyapan',21),(1644,'Hueytamalco',21),(1645,'Hueytlalpan',21),(1646,'Huitzilan de Serd├ín',21),(1647,'Huitziltepec',21),(1648,'Ixcamilpa de Guerrero',21),(1649,'Ixcaquixtla',21),(1650,'Ixtacamaxtitl├ín',21),(1651,'Ixtepec',21),(1652,'Iz├║car de Matamoros',21),(1653,'Jalpan',21),(1654,'Jolalpan',21),(1655,'Jonotla',21),(1656,'Jopala',21),(1657,'Juan C. Bonilla',21),(1658,'Juan Galindo',21),(1659,'Juan N. M├®ndez',21),(1660,'La Magdalena Tlatlauquitepec',21),(1661,'Lafragua',21),(1662,'Libres',21),(1663,'Los Reyes de Ju├írez',21),(1664,'Mazapiltepec de Ju├írez',21),(1665,'Mixtla',21),(1666,'Molcaxac',21),(1667,'Naupan',21),(1668,'Nauzontla',21),(1669,'Nealtican',21),(1670,'Nicol├ís Bravo',21),(1671,'Nopalucan',21),(1672,'Ocotepec',21),(1673,'Ocoyucan',21),(1674,'Olintla',21),(1675,'Oriental',21),(1676,'Pahuatl├ín',21),(1677,'Palmar de Bravo',21),(1678,'Pantepec',21),(1679,'Petlalcingo',21),(1680,'Piaxtla',21),(1681,'Puebla',21),(1682,'Quecholac',21),(1683,'Quimixtl├ín',21),(1684,'Rafael Lara Grajales',21),(1685,'San Andr├®s Cholula',21),(1686,'San Antonio Ca├▒ada',21),(1687,'San Diego la Mesa Tochimiltzingo',21),(1688,'San Felipe Teotlalcingo',21),(1689,'San Felipe Tepatl├ín',21),(1690,'San Gabriel Chilac',21),(1691,'San Gregorio Atzompa',21),(1692,'San Jer├│nimo Tecuanipan',21),(1693,'San Jer├│nimo Xayacatl├ín',21),(1694,'San Jos├® Chiapa',21),(1695,'San Jos├® Miahuatl├ín',21),(1696,'San Juan Atenco',21),(1697,'San Juan Atzompa',21),(1698,'San Mart├¡n Texmelucan',21),(1699,'San Mart├¡n Totoltepec',21),(1700,'San Mat├¡as Tlalancaleca',21),(1701,'San Miguel Ixitl├ín',21),(1702,'San Miguel Xoxtla',21),(1703,'San Nicol├ís Buenos Aires',21),(1704,'San Nicol├ís de los Ranchos',21),(1705,'San Pablo Anicano',21),(1706,'San Pedro Cholula',21),(1707,'San Pedro Yeloixtlahuaca',21),(1708,'San Salvador el Seco',21),(1709,'San Salvador el Verde',21),(1710,'San Salvador Huixcolotla',21),(1711,'San Sebasti├ín Tlacotepec',21),(1712,'Santa Catarina Tlaltempan',21),(1713,'Santa In├®s Ahuatempan',21),(1714,'Santa Isabel Cholula',21),(1715,'Santiago Miahuatl├ín',21),(1716,'Santo Tom├ís Hueyotlipan',21),(1717,'Soltepec',21),(1718,'Tecali de Herrera',21),(1719,'Tecamachalco',21),(1720,'Tecomatl├ín',21),(1721,'Tehuac├ín',21),(1722,'Tehuitzingo',21),(1723,'Tenampulco',21),(1724,'Teopantl├ín',21),(1725,'Teotlalco',21),(1726,'Tepanco de L├│pez',21),(1727,'Tepango de Rodr├¡guez',21),(1728,'Tepatlaxco de Hidalgo',21),(1729,'Tepeaca',21),(1730,'Tepemaxalco',21),(1731,'Tepeojuma',21),(1732,'Tepetzintla',21),(1733,'Tepexco',21),(1734,'Tepexi de Rodr├¡guez',21),(1735,'Tepeyahualco',21),(1736,'Tepeyahualco de Cuauht├®moc',21),(1737,'Tetela de Ocampo',21),(1738,'Teteles de Avila Castillo',21),(1739,'Teziutl├ín',21),(1740,'Tianguismanalco',21),(1741,'Tilapa',21),(1742,'Tlachichuca',21),(1743,'Tlacotepec de Benito Ju├írez',21),(1744,'Tlacuilotepec',21),(1745,'Tlahuapan',21),(1746,'Tlaltenango',21),(1747,'Tlanepantla',21),(1748,'Tlaola',21),(1749,'Tlapacoya',21),(1750,'Tlapanal├í',21),(1751,'Tlatlauquitepec',21),(1752,'Tlaxco',21),(1753,'Tochimilco',21),(1754,'Tochtepec',21),(1755,'Totoltepec de Guerrero',21),(1756,'Tulcingo',21),(1757,'Tuzamapan de Galeana',21),(1758,'Tzicatlacoyan',21),(1759,'Venustiano Carranza',21),(1760,'Vicente Guerrero',21),(1761,'Xayacatl├ín de Bravo',21),(1762,'Xicotepec',21),(1763,'Xicotl├ín',21),(1764,'Xiutetelco',21),(1765,'Xochiapulco',21),(1766,'Xochiltepec',21),(1767,'Xochitl├ín de Vicente Su├írez',21),(1768,'Xochitl├ín Todos Santos',21),(1769,'Yaon├íhuac',21),(1770,'Yehualtepec',21),(1771,'Zacapala',21),(1772,'Zacapoaxtla',21),(1773,'Zacatl├ín',21),(1774,'Zapotitl├ín',21),(1775,'Zapotitl├ín de M├®ndez',21),(1776,'Zaragoza',21),(1777,'Zautla',21),(1778,'Zihuateutla',21),(1779,'Zinacatepec',21),(1780,'Zongozotla',21),(1781,'Zoquiapan',21),(1782,'Zoquitl├ín',21),(1783,'Amealco de Bonfil',22),(1784,'Arroyo Seco',22),(1785,'Cadereyta de Montes',22),(1786,'Col├│n',22),(1787,'Corregidora',22),(1788,'El Marqu├®s',22),(1789,'Ezequiel Montes',22),(1790,'Huimilpan',22),(1791,'Jalpan de Serra',22),(1792,'Landa de Matamoros',22),(1793,'Pedro Escobedo',22),(1794,'Pe├▒amiller',22),(1795,'Pinal de Amoles',22),(1796,'Quer├®taro',22),(1797,'San Joaqu├¡n',22),(1798,'San Juan del R├¡o',22),(1799,'Tequisquiapan',22),(1800,'Tolim├ín',22),(1801,'Benito Ju├írez',23),(1802,'Cozumel',23),(1803,'Felipe Carrillo Puerto',23),(1804,'Isla Mujeres',23),(1805,'Jos├® Mar├¡a Morelos',23),(1806,'L├ízaro C├írdenas',23),(1807,'Oth├│n P. Blanco',23),(1808,'Solidaridad',23),(1809,'Ahualulco',24),(1810,'Alaquines',24),(1811,'Aquism├│n',24),(1812,'Armadillo de los Infante',24),(1813,'Axtla de Terrazas',24),(1814,'C├írdenas',24),(1815,'Catorce',24),(1816,'Cedral',24),(1817,'Cerritos',24),(1818,'Cerro de San Pedro',24),(1819,'Charcas',24),(1820,'Ciudad del Ma├¡z',24),(1821,'Ciudad Fern├índez',24),(1822,'Ciudad Valles',24),(1823,'Coxcatl├ín',24),(1824,'Ebano',24),(1825,'El Naranjo',24),(1826,'Guadalc├ízar',24),(1827,'Huehuetl├ín',24),(1828,'Lagunillas',24),(1829,'Matehuala',24),(1830,'Matlapa',24),(1831,'Mexquitic de Carmona',24),(1832,'Moctezuma',24),(1833,'Ray├│n',24),(1834,'Rioverde',24),(1835,'Salinas',24),(1836,'San Antonio',24),(1837,'San Ciro de Acosta',24),(1838,'San Luis Potos├¡',24),(1839,'San Mart├¡n Chalchicuautla',24),(1840,'San Nicol├ís Tolentino',24),(1841,'San Vicente Tancuayalab',24),(1842,'Santa Catarina',24),(1843,'Santa Mar├¡a del R├¡o',24),(1844,'Santo Domingo',24),(1845,'Soledad de Graciano S├ínchez',24),(1846,'Tamasopo',24),(1847,'Tamazunchale',24),(1848,'Tampac├ín',24),(1849,'Tampamol├│n Corona',24),(1850,'Tamu├¡n',24),(1851,'Tancanhuitz',24),(1852,'Tanlaj├ís',24),(1853,'Tanqui├ín de Escobedo',24),(1854,'Tierra Nueva',24),(1855,'Vanegas',24),(1856,'Venado',24),(1857,'Villa de Arista',24),(1858,'Villa de Arriaga',24),(1859,'Villa de Guadalupe',24),(1860,'Villa de la Paz',24),(1861,'Villa de Ramos',24),(1862,'Villa de Reyes',24),(1863,'Villa Hidalgo',24),(1864,'Villa Ju├írez',24),(1865,'Xilitla',24),(1866,'Zaragoza',24),(1867,'Ahome',25),(1868,'Angostura',25),(1869,'Badiraguato',25),(1870,'Choix',25),(1871,'Concordia',25),(1872,'Cosal├í',25),(1873,'Culiac├ín',25),(1874,'El Fuerte',25),(1875,'Elota',25),(1876,'Escuinapa',25),(1877,'Guasave',25),(1878,'Mazatl├ín',25),(1879,'Mocorito',25),(1880,'Navolato',25),(1881,'Rosario',25),(1882,'Salvador Alvarado',25),(1883,'San Ignacio',25),(1884,'Sinaloa',25),(1885,'Aconchi',26),(1886,'Agua Prieta',26),(1887,'Alamos',26),(1888,'Altar',26),(1889,'Arivechi',26),(1890,'Arizpe',26),(1891,'Atil',26),(1892,'Bacad├®huachi',26),(1893,'Bacanora',26),(1894,'Bacerac',26),(1895,'Bacoachi',26),(1896,'B├ícum',26),(1897,'Ban├ímichi',26),(1898,'Bavi├ícora',26),(1899,'Bavispe',26),(1900,'Benito Ju├írez',26),(1901,'Benjam├¡n Hill',26),(1902,'Caborca',26),(1903,'Cajeme',26),(1904,'Cananea',26),(1905,'Carb├│',26),(1906,'Cucurpe',26),(1907,'Cumpas',26),(1908,'Divisaderos',26),(1909,'Empalme',26),(1910,'Etchojoa',26),(1911,'Fronteras',26),(1912,'General Plutarco El├¡as Calles',26),(1913,'Granados',26),(1914,'Guaymas',26),(1915,'Hermosillo',26),(1916,'Heroica Nogales',26),(1917,'Huachinera',26),(1918,'Hu├ísabas',26),(1919,'Huatabampo',26),(1920,'Hu├®pac',26),(1921,'Imuris',26),(1922,'La Colorada',26),(1923,'Magdalena',26),(1924,'Mazat├ín',26),(1925,'Moctezuma',26),(1926,'Naco',26),(1927,'N├ícori Chico',26),(1928,'Nacozari de Garc├¡a',26),(1929,'Navojoa',26),(1930,'Onavas',26),(1931,'Opodepe',26),(1932,'Oquitoa',26),(1933,'Pitiquito',26),(1934,'Puerto Pe├▒asco',26),(1935,'Quiriego',26),(1936,'Ray├│n',26),(1937,'Rosario',26),(1938,'Sahuaripa',26),(1939,'San Felipe de Jes├║s',26),(1940,'San Ignacio R├¡o Muerto',26),(1941,'San Javier',26),(1942,'San Luis R├¡o Colorado',26),(1943,'San Miguel de Horcasitas',26),(1944,'San Pedro de la Cueva',26),(1945,'Santa Ana',26),(1946,'Santa Cruz',26),(1947,'S├íric',26),(1948,'Soyopa',26),(1949,'Suaqui Grande',26),(1950,'Tepache',26),(1951,'Trincheras',26),(1952,'Tubutama',26),(1953,'Ures',26),(1954,'Villa Hidalgo',26),(1955,'Villa Pesqueira',26),(1956,'Y├®cora',26),(1957,'Balanc├ín',27),(1958,'C├írdenas',27),(1959,'Centla',27),(1960,'Centro',27),(1961,'Comalcalco',27),(1962,'Cunduac├ín',27),(1963,'Emiliano Zapata',27),(1964,'Huimanguillo',27),(1965,'Jalapa',27),(1966,'Jalpa de M├®ndez',27),(1967,'Jonuta',27),(1968,'Macuspana',27),(1969,'Nacajuca',27),(1970,'Para├¡so',27),(1971,'Tacotalpa',27),(1972,'Teapa',27),(1973,'Tenosique',27),(1974,'Abasolo',28),(1975,'Aldama',28),(1976,'Altamira',28),(1977,'Antiguo Morelos',28),(1978,'Burgos',28),(1979,'Bustamante',28),(1980,'Camargo',28),(1981,'Casas',28),(1982,'Ciudad Madero',28),(1983,'Cruillas',28),(1984,'El Mante',28),(1985,'G?├®mez',28),(1986,'G├│mez Far├¡as',28),(1987,'Gonz├ílez',28),(1988,'Guerrero',28),(1989,'Gustavo D├¡az Ordaz',28),(1990,'Hidalgo',28),(1991,'Jaumave',28),(1992,'Jim├®nez',28),(1993,'Llera',28),(1994,'Mainero',28),(1995,'Matamoros',28),(1996,'M├®ndez',28),(1997,'Mier',28),(1998,'Miguel Alem├ín',28),(1999,'Miquihuana',28),(2000,'Nuevo Laredo',28),(2001,'Nuevo Morelos',28),(2002,'Ocampo',28),(2003,'Padilla',28),(2004,'Palmillas',28),(2005,'Reynosa',28),(2006,'R├¡o Bravo',28),(2007,'San Carlos',28),(2008,'San Fernando',28),(2009,'San Nicol├ís',28),(2010,'Soto la Marina',28),(2011,'Tampico',28),(2012,'Tula',28),(2013,'Valle Hermoso',28),(2014,'Victoria',28),(2015,'Villagr├ín',28),(2016,'Xicot├®ncatl',28),(2017,'Acuamanala de Miguel Hidalgo',29),(2018,'Altzayanca',29),(2019,'Amaxac de Guerrero',29),(2020,'Apetatitl├ín de Antonio Carvajal',29),(2021,'Apizaco',29),(2022,'Atlangatepec',29),(2023,'Benito Ju├írez',29),(2024,'Calpulalpan',29),(2025,'Chiautempan',29),(2026,'Contla de Juan Cuamatzi',29),(2027,'Cuapiaxtla',29),(2028,'Cuaxomulco',29),(2029,'El Carmen Tequexquitla',29),(2030,'Emiliano Zapata',29),(2031,'Espa├▒ita',29),(2032,'Huamantla',29),(2033,'Hueyotlipan',29),(2034,'Ixtacuixtla de Mariano Matamoros',29),(2035,'Ixtenco',29),(2036,'La Magdalena Tlaltelulco',29),(2037,'L├ízaro C├írdenas',29),(2038,'Mazatecochco de Jos├® Mar├¡a Morelos',29),(2039,'Mu├▒oz de Domingo Arenas',29),(2040,'Nanacamilpa de Mariano Arista',29),(2041,'Nat├¡vitas',29),(2042,'Panotla',29),(2043,'Papalotla de Xicoht├®ncatl',29),(2044,'San Dami├ín Texoloc',29),(2045,'San Francisco Tetlanohcan',29),(2046,'San Jer├│nimo Zacualpan',29),(2047,'San Jos├® Teacalco',29),(2048,'San Juan Huactzinco',29),(2049,'San Lorenzo Axocomanitla',29),(2050,'San Lucas Tecopilco',29),(2051,'San Pablo del Monte',29),(2052,'Sanct├│rum de L├ízaro C├írdenas',29),(2053,'Santa Ana Nopalucan',29),(2054,'Santa Apolonia Teacalco',29),(2055,'Santa Catarina Ayometla',29),(2056,'Santa Cruz Quilehtla',29),(2057,'Santa Cruz Tlaxcala',29),(2058,'Santa Isabel Xiloxoxtla',29),(2059,'Tenancingo',29),(2060,'Teolocholco',29),(2061,'Tepetitla de Lardiz├íbal',29),(2062,'Tepeyanco',29),(2063,'Terrenate',29),(2064,'Tetla de la Solidaridad',29),(2065,'Tetlatlahuca',29),(2066,'Tlaxcala',29),(2067,'Tlaxco',29),(2068,'Tocatl├ín',29),(2069,'Totolac',29),(2070,'Tzompantepec',29),(2071,'Xaloztoc',29),(2072,'Xaltocan',29),(2073,'Xicohtzinco',29),(2074,'Yauhquemecan',29),(2075,'Zacatelco',29),(2076,'Zitlaltepec de Trinidad S├ínchez Santos',29),(2077,'Acajete',30),(2078,'Acatl├ín',30),(2079,'Acayucan',30),(2080,'Actopan',30),(2081,'Acula',30),(2082,'Acultzingo',30),(2083,'Agua Dulce',30),(2084,'Alpatl├íhuac',30),(2085,'Alto Lucero de Guti├®rrez Barrios',30),(2086,'Altotonga',30),(2087,'Alvarado',30),(2088,'Amatitl├ín',30),(2089,'Amatl├ín de los Reyes',30),(2090,'Angel R. Cabada',30),(2091,'Apazapan',30),(2092,'Aquila',30),(2093,'Astacinga',30),(2094,'Atlahuilco',30),(2095,'Atoyac',30),(2096,'Atzacan',30),(2097,'Atzalan',30),(2098,'Ayahualulco',30),(2099,'Banderilla',30),(2100,'Benito Ju├írez',30),(2101,'Boca del R├¡o',30),(2102,'Calcahualco',30),(2103,'Camar├│n de Tejeda',30),(2104,'Camerino Z. Mendoza',30),(2105,'Carlos A. Carrillo',30),(2106,'Carrillo Puerto',30),(2107,'Castillo de Teayo',30),(2108,'Catemaco',30),(2109,'Cazones',30),(2110,'Cerro Azul',30),(2111,'Chacaltianguis',30),(2112,'Chalma',30),(2113,'Chiconamel',30),(2114,'Chiconquiaco',30),(2115,'Chicontepec',30),(2116,'Chinameca',30),(2117,'Chinampa de Gorostiza',30),(2118,'Chocam├ín',30),(2119,'Chontla',30),(2120,'Chumatl├ín',30),(2121,'Citlalt├®petl',30),(2122,'Coacoatzintla',30),(2123,'Coahuitl├ín',30),(2124,'Coatepec',30),(2125,'Coatzacoalcos',30),(2126,'Coatzintla',30),(2127,'Coetzala',30),(2128,'Colipa',30),(2129,'Comapa',30),(2130,'C├│rdoba',30),(2131,'Cosamaloapan de Carpio',30),(2132,'Cosautl├ín de Carvajal',30),(2133,'Coscomatepec',30),(2134,'Cosoleacaque',30),(2135,'Cotaxtla',30),(2136,'Coxquihui',30),(2137,'Coyutla',30),(2138,'Cuichapa',30),(2139,'Cuitl├íhuac',30),(2140,'El Higo',30),(2141,'Emiliano Zapata',30),(2142,'Espinal',30),(2143,'Filomeno Mata',30),(2144,'Fort├¡n',30),(2145,'Guti├®rrez Zamora',30),(2146,'Hidalgotitl├ín',30),(2147,'Huatusco',30),(2148,'Huayacocotla',30),(2149,'Hueyapan de Ocampo',30),(2150,'Huiloapan',30),(2151,'Ignacio de la Llave',30),(2152,'Ilamatl├ín',30),(2153,'Isla',30),(2154,'Ixcatepec',30),(2155,'Ixhuac├ín de los Reyes',30),(2156,'Ixhuatl├ín de Madero',30),(2157,'Ixhuatl├ín del Caf├®',30),(2158,'Ixhuatl├ín del Sureste',30),(2159,'Ixhuatlancillo',30),(2160,'Ixmatlahuacan',30),(2161,'Ixtaczoquitl├ín',30),(2162,'Jalacingo',30),(2163,'Jalcomulco',30),(2164,'J├íltipan',30),(2165,'Jamapa',30),(2166,'Jes├║s Carranza',30),(2167,'Jilotepec',30),(2168,'Jos├® Azueta',30),(2169,'Juan Rodr├¡guez Clara',30),(2170,'Juchique de Ferrer',30),(2171,'La Antigua',30),(2172,'La Perla',30),(2173,'Landero y Coss',30),(2174,'Las Choapas',30),(2175,'Las Minas',30),(2176,'Las Vigas de Ram├¡rez',30),(2177,'Lerdo de Tejada',30),(2178,'Los Reyes',30),(2179,'Magdalena',30),(2180,'Maltrata',30),(2181,'Manlio Fabio Altamirano',30),(2182,'Mariano Escobedo',30),(2183,'Mart├¡nez de la Torre',30),(2184,'Mecatl├ín',30),(2185,'Mecayapan',30),(2186,'Medell├¡n',30),(2187,'Miahuatl├ín',30),(2188,'Minatitl├ín',30),(2189,'Misantla',30),(2190,'Mixtla de Altamirano',30),(2191,'Moloac├ín',30),(2192,'Nanchital de L├ízaro C├írdenas del R',30),(2193,'Naolinco',30),(2194,'Naranjal',30),(2195,'Naranjos Amatl├ín',30),(2196,'Nautla',30),(2197,'Nogales',30),(2198,'Oluta',30),(2199,'Omealca',30),(2200,'Orizaba',30),(2201,'Otatitl├ín',30),(2202,'Oteapan',30),(2203,'Ozuluama de Mascare├▒as',30),(2204,'Pajapan',30),(2205,'P├ínuco',30),(2206,'Papantla',30),(2207,'Paso de Ovejas',30),(2208,'Paso del Macho',30),(2209,'Perote',30),(2210,'Plat├│n S├ínchez',30),(2211,'Playa Vicente',30),(2212,'Poza Rica de Hidalgo',30),(2213,'Pueblo Viejo',30),(2214,'Puente Nacional',30),(2215,'Rafael Delgado',30),(2216,'Rafael Lucio',30),(2217,'R├¡o Blanco',30),(2218,'Saltabarranca',30),(2219,'San Andr├®s Tenejapan',30),(2220,'San Andr├®s Tuxtla',30),(2221,'San Juan Evangelista',30),(2222,'San Rafael',30),(2223,'Santiago Sochiapan',30),(2224,'Santiago Tuxtla',30),(2225,'Sayula de Alem├ín',30),(2226,'Sochiapa',30),(2227,'Soconusco',30),(2228,'Soledad Atzompa',30),(2229,'Soledad de Doblado',30),(2230,'Soteapan',30),(2231,'Tamal├¡n',30),(2232,'Tamiahua',30),(2233,'Tampico Alto',30),(2234,'Tancoco',30),(2235,'Tantima',30),(2236,'Tantoyuca',30),(2237,'Tatahuicapan de Ju├írez',30),(2238,'Tatatila',30),(2239,'Tecolutla',30),(2240,'Tehuipango',30),(2241,'Temapache',30),(2242,'Tempoal',30),(2243,'Tenampa',30),(2244,'Tenochtitl├ín',30),(2245,'Teocelo',30);
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_estados`
--

LOCK TABLES `cat_estados` WRITE;
/*!40000 ALTER TABLE `cat_estados` DISABLE KEYS */;
INSERT INTO `cat_estados` VALUES (1,'Aguascalientes'),(2,'Baja California'),(3,'Baja California Sur'),(4,'Campeche'),(5,'Chiapas'),(6,'Chihuahua'),(7,'Coahuila'),(8,'Colima'),(9,'Distrito Federal'),(10,'Durango'),(11,'Estado de México'),(12,'Guanajuato'),(13,'Guerrero'),(14,'Hidalgo'),(15,'Jalisco'),(16,'Michoacán'),(17,'Morelos'),(18,'Nayarit'),(19,'Nuevo León'),(20,'Oaxaca'),(21,'Puebla'),(22,'Querétaro'),(23,'Quintana Roo'),(24,'San Luis Potosí'),(25,'Sinaloa'),(26,'Sonora'),(27,'Tabasco'),(28,'Tamaulipas'),(29,'Tlaxcala'),(30,'Veracruz'),(31,'Yucatán'),(32,'Zacatecas');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_puestos`
--

LOCK TABLES `cat_puestos` WRITE;
/*!40000 ALTER TABLE `cat_puestos` DISABLE KEYS */;
INSERT INTO `cat_puestos` VALUES (2,'Auxiliar administrativo'),(1,'CEO'),(3,'Recepcionista');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_ranking`
--

LOCK TABLES `cat_ranking` WRITE;
/*!40000 ALTER TABLE `cat_ranking` DISABLE KEYS */;
INSERT INTO `cat_ranking` VALUES (3,'Deplorable'),(2,'Elite'),(4,'Excelente'),(5,'Malo'),(1,'Promedio');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_roles`
--

LOCK TABLES `cat_roles` WRITE;
/*!40000 ALTER TABLE `cat_roles` DISABLE KEYS */;
INSERT INTO `cat_roles` VALUES (1,'Rol 1'),(2,'Rol 2'),(3,'Rol 3'),(4,'Rol 4'),(5,'Rol extra');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_status`
--

LOCK TABLES `cat_status` WRITE;
/*!40000 ALTER TABLE `cat_status` DISABLE KEYS */;
INSERT INTO `cat_status` VALUES (1,'Activo'),(2,'Inactivo'),(3,'Pendiente');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_subfamilias`
--

LOCK TABLES `cat_subfamilias` WRITE;
/*!40000 ALTER TABLE `cat_subfamilias` DISABLE KEYS */;
INSERT INTO `cat_subfamilias` VALUES (9,'Alta nueva'),(1,'Subfamilia 1'),(2,'Subfamilia 2'),(3,'Subfamilia 3'),(4,'Subfamilia 4'),(5,'Subfamilia 5'),(6,'Subfamilia 6');
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
  `ciudadContacto` int(11) NOT NULL DEFAULT '0',
  `codigoPostalContacto` char(5) DEFAULT NULL,
  `telefonoContacto` varchar(14) DEFAULT NULL,
  `celularContacto` varchar(14) DEFAULT NULL,
  `emailContacto` varchar(70) DEFAULT NULL,
  `rfcFiscal` varchar(14) DEFAULT NULL,
  `razonSocialFiscal` varchar(100) DEFAULT NULL,
  `calleFiscal` varchar(50) DEFAULT NULL,
  `coloniaFiscal` varchar(100) DEFAULT NULL,
  `ciudadFiscal` int(11) NOT NULL DEFAULT '0',
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'123abc','Meny',1,'Domicilio conocido','Centro',286,'34227',NULL,'8110167264','ma2_f@hotmail.com',1,1,1,1,0,0);
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
  CONSTRAINT `FK_eventos_1` FOREIGN KEY (`cliente`) REFERENCES `clientes` (`id`),
  CONSTRAINT `FK_eventos_2` FOREIGN KEY (`lugar`) REFERENCES `cat_lugares` (`id`),
  CONSTRAINT `FK_eventos_3` FOREIGN KEY (`tipo`) REFERENCES `cat_tiposevento` (`id`),
  CONSTRAINT `FK_eventos_4` FOREIGN KEY (`guardias`) REFERENCES `cat_guardias` (`id`),
  CONSTRAINT `FK_eventos_5` FOREIGN KEY (`metodoPago`) REFERENCES `cat_metodospago` (`id`),
  CONSTRAINT `FK_eventos_6` FOREIGN KEY (`cuentaBancaria`) REFERENCES `cuentasbancarias` (`id`),
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
  `cuentaBancaria` int(11) DEFAULT NULL,
  `telefonoContacto` varchar(14) DEFAULT NULL,
  `fechaSolicitud` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fechaRequerido` timestamp NULL DEFAULT NULL,
  `fechaEntrega` timestamp NULL DEFAULT NULL,
  `area` int(11) NOT NULL,
  `monto` decimal(11,2) DEFAULT NULL,
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
  `codigoPostalFiscal` char(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_proveedores_1` (`nombre`),
  KEY `IDX_proveedores_2` (`coloniaFiscal`),
  KEY `proveedores_3` (`ciudadFiscal`),
  CONSTRAINT `FK_proveedores_3` FOREIGN KEY (`ciudadFiscal`) REFERENCES `cat_ciudades` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'admin','92a8d4da3dcdffe54ed5ea95e9024bc8e228d547','7d447b1d91202cf0709e9aa74f29f3bde4a55b16',0,0),(6,'Erika','4ab4deac881b05c4c3342022cd84d3cf537a7112','1a2b3c4d',8,2),(8,'MenyAFF','fb0a8929865016ba27349dbfeeaa31a699fb74d5','abcdEF01',1,2);
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
        
		SELECT 'TRUE' AS respuesta, 'Artículo asignado a evento, eliminado satisfactoriamente' AS 'mensaje';
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
	IF(P_id IS NULL OR P_id="")THEN
		SELECT * FROM cat_estados ORDER BY nombre;
	ELSE
		SET @estados=0;
        
        SELECT COUNT(*) INTO @estados FROM cat_estados WHERE id=P_id;
        
        IF(@estados=0)THEN
			SELECT 'FALSE' AS respuesta, 'No existe el estado' AS mensaje;
		ELSE
			SELECT * FROM cat_estados WHERE id=P_id;
		END IF;
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
		
		SET @sqlQuery = CONCAT("SELECT COUNT(*) INTO @dependencias FROM serviciosEventos WHERE articulo IN(",P_id,");");
		
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
					JOIN cat_areas ca ON a.area=ca.id
                    JOIN cat_familias cf ON ca.familia=cf.id
                    JOIN cat_subfamilias csf ON cf.subfamilia=csf.id
					JOIN cat_lugares cl ON a.lugar=cl.id";
	
	IF(P_id IS NOT NULL AND P_id!="")THEN
		SET @sqlQuery = CONCAT(@sqlQuery," WHERE a.id=",P_id);
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPQ_articulosEventos`(IN P_id INT, IN P_filtro VARCHAR(200), IN P_order VARCHAR(50))
BEGIN
	SET @sqlQuery = "SELECT ae.id, a.id AS id_articulo, a.nombre AS articulo, e.id AS id_evento, e.nombre AS evento, ae.cantidad
					FROM articulosEventos ae
						JOIN articulos a ON a.id=ae.articulo
						JOIN eventos e ON e.id=ae.evento";
	
    IF(P_id IS NOT NULL AND P_id!="")THEN
		SET @sqlQuery = CONCAT(@sqlQuery," WHERE ae.id=",P_id);
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
		IF(P_familia IS NULL OR P_familia="") THEN
			SELECT a.id, a.nombre, f.id AS id_familia, f.nombre AS familia 
            FROM cat_areas a
            JOIN cat_familias f
				ON a.familia=f.id
			ORDER BY a.nombre;
		ELSE
			SET @areas=0;
		
			SELECT COUNT(*) INTO @areas FROM cat_areas WHERE familia=P_familia;
			
			IF(@areas=0)THEN
				SELECT 'FALSE' AS respuesta, 'No hay areas relacionadas' AS mensaje;
			ELSE
				SELECT a.id, a.nombre, f.id AS id_familia, f.nombre AS familia 
            FROM cat_areas a
            JOIN cat_familias f
				ON a.familia=f.id
			WHERE a.familia=P_familia ORDER BY a.nombre;
			END IF;
		END IF;
	ELSE
		SET @areas=0;
        
		SELECT COUNT(*) INTO @areas FROM cat_areas WHERE id=P_id;
		
		IF(@areas=0)THEN
			SELECT 'FALSE' AS respuesta, 'No existe el área' AS mensaje;
		ELSE
			SELECT a.id, a.nombre, f.id AS id_familia, f.nombre AS familia 
            FROM cat_areas a
            JOIN cat_familias f
				ON a.familia=f.id
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
            JOIN cat_estados e
				ON c.estado=e.id
            ORDER BY c.nombre;
		ELSE
			SET @ciudades=0;
			
			SELECT COUNT(*) INTO @ciudades FROM cat_ciudades WHERE id=P_id;
			
			IF(@ciudades=0)THEN
				SELECT 'FALSE' AS respuesta, 'No existe la ciudad' AS mensaje;
			ELSE
				SELECT c.id, c.nombre, e.id AS id_estado, e.nombre AS estado
            FROM cat_ciudades c
            JOIN cat_estados e
				ON c.estado=e.id
			WHERE c.estado=P_estado ORDER BY c.nombre;
			END IF;
		END IF;
	ELSE
		SET @ciudades=0;
        
		SELECT COUNT(*) INTO @ciudades FROM cat_ciudades WHERE id=P_id;
		
		IF(@ciudades=0)THEN
			SELECT 'FALSE' AS respuesta, 'No existe la ciudades' AS mensaje;
		ELSE
			SELECT c.id, c.nombre, e.id AS id_estado, e.nombre AS estado
            FROM cat_ciudades c
            JOIN cat_estados e
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
		IF(P_subfamilia IS NULL OR P_subfamilia="") THEN
			SELECT f.id, f.nombre, s.id AS id_subfamilia, s.nombre AS subfamilia
                FROM cat_familias f
                JOIN cat_subfamilias s
					ON f.subfamilia=s.id
				ORDER BY f.nombre;
		ELSE
            SET @familias=0;
        
			SELECT COUNT(*) INTO @familias FROM cat_familias WHERE subfamilia=P_subfamilia;
			
			IF(@familias=0)THEN
				SELECT 'FALSE' AS respuesta, 'No hay familias relacionadas' AS mensaje;
			ELSE
				SELECT f.id, f.nombre, s.id AS id_subfamilia, s.nombre AS subfamilia
                FROM cat_familias f
                JOIN cat_subfamilias s
					ON f.subfamilia=s.id
                WHERE f.subfamilia=P_subfamilia ORDER BY nombre;
			END IF;
		END IF;
	ELSE
		SET @familias=0;
        
		SELECT COUNT(*) INTO @familias FROM cat_familias WHERE id=P_id;
		
		IF(@familias=0)THEN
			SELECT 'FALSE' AS respuesta, 'No existe la familia' AS mensaje;
		ELSE
			SELECT f.id, f.nombre, s.id AS id_subfamilia, s.nombre AS subfamilia
                FROM cat_familias f
                JOIN cat_subfamilias s
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
                            ec.nombre AS estadoContacto c.codigoPostalContacto, c.telefonoContacto, c.celularContacto, c.emailContacto, c.rfcFiscal, c.razonSocialFiscal,
                            c.calleFiscal, c.coloniaFiscal, cf.id AS id_ciudadFiscal, ef.id AS id_estadoFiscal, ef.nombre AS estadoFiscal, cf.nombre AS ciudadFiscal,
                            c.paisFiscal, c.codigoPostalFiscal, c.numeroInteriorFiscal, c.numeroExteriorFiscal, c.localidadFiscal, c.municipioFiscal	 
					FROM clientes c
					JOIN cat_ciudades cc ON c.ciudadContacto=cc.id
                    JOIN cat_estados ec ON cc.estado=ec.id
					JOIN cat_ciudades cf ON c.ciudadFiscal=cf.id
                    JOIN cat_estados ef ON cf.estado=ef.id";
	
	IF(P_id IS NOT NULL AND P_id!="")THEN
		SET @sqlQuery = CONCAT(@sqlQuery," WHERE c.id=",P_id);
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
					JOIN eventos e ON c.evento=e.id
					JOIN cuentasBancarias cb ON c.cuentaBancaria=cb.id";
	
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
					JOIN cat_bancos b ON cb.banco=b.id";
	
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
					JOIN cat_puestos p ON e.puesto=p.id
					JOIN cat_ciudades c ON e.ciudad=c.id
					JOIN cat_estados ce ON c.estado=ce.id";
	
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPQ_estadoDeCuenta`(IN P_banco INT, IN P_fechaIni VARCHAR(20), IN P_fechaFin VARCHAR(20))
BEGIN
	SET @sqlQuery = CONCAT("SELECT cbs.nombre, cb.nombre AS banco, cbs.noCuenta, cbs.clabe, g.fechaSolicitud AS fechaGasto, g.monto AS gasto, c.fecha AS fechaCobro, c.monto AS cobro 
					FROM cuentasBancarias cbs
					JOIN cat_bancos cb ON cb.id=cbs.banco
					RIGHT JOIN cobros c ON cbs.id=c.cuentaBancaria
					RIGHT JOIN gastos g ON cbs.id=g.cuentaBancaria 
                    WHERE cbs.banco=",P_banco);
	
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
							cl.id AS id_catLugares, cl.nombre AS lugar, cte.id AS id_catTiposEvento, cte.nombre AS tipo, e.fechaEntrega, 
							e.fechaSeguimiento, e.fechaFinal, e.invitados, e.salon, v.id AS id_vendedor, emp.nombre AS vendedor, e.utilidadCuenta, 
							e.cuenta, e.montoServicios, e.depositosEnGarantia, e.montoDepositosEnGarantia, cg.id AS id_catGuardias, cg.nombre AS guardias, 
							e.cantidadGuardias, e.montoGuardias, cmp.id AS id_catMetodosPago, cmp.nombre AS metodoPago, cb.id AS id_catBancos, cb.nombre AS banco, 
							e.totalEvento, e.anticipo
					FROM eventos e
					JOIN cat_status csc ON e.statusCotizacion=csc.id
					JOIN cat_status cse ON e.statusEvento=cse.id
					JOIN clientes c ON e.cliente=c.id
					JOIN cat_lugares cl ON e.lugar=cl.id
					JOIN cat_tiposevento cte ON e.tipo=cte.id
					JOIN vendedores v ON e.vendedor=v.id
					JOIN empleados emp ON v.empleado=emp.id
					JOIN cat_guardias cg ON e.guardias=cg.id
					JOIN cat_metodospago cmp ON e.metodoPago=cmp.id
					JOIN cuentasBancarias cb ON e.cuentaBancaria=cb.id
                    JOIN cat_bancos b ON cb.banco=b.id";
	
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
					JOIN empleados emp ON g.empleado=emp.id
					JOIN eventos ev ON g.evento=ev.id
					JOIN cat_areas ca ON g.area=ca.id";
	
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPQ_modulos`(IN P_prioridad INT, IN P_id INT, IN P_filtro VARCHAR(200), IN P_order VARCHAR(50))
BEGIN
	IF(P_prioridad IS NOT NULL AND P_prioridad!="") THEN
		SELECT * FROM modulos WHERE prioridad=P_prioridad ORDER BY nombre;
	ELSE
		SET @sqlQuery = "SELECT * FROM modulos";
        
        IF(P_id IS NOT NULL AND P_id!="")THEN
			SET @sqlQuery = CONCAT(@sqlQuery," WHERE id=",P_id);
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
	END IF;
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
					JOIN cat_ciudades cc ON p.ciudadFiscal=cc.id
					JOIN cat_estados ce ON cc.estado=ce.id";
	
	IF(P_id IS NOT NULL AND P_id!="")THEN
		SET @sqlQuery = CONCAT(@sqlQuery," WHERE p.id=",P_id);
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPQ_rolesModulos`(IN P_id INT, IN P_filtro VARCHAR(200), IN P_order VARCHAR(50))
BEGIN
	SET @sqlQuery = "SELECT rm.id AS id_modulo, m.nombre AS modulo, r.id AS id_rol, r.nombre AS rol, m.url, m.prioridad
					FROM rolesModulos rm
						JOIN cat_roles r ON r.id=rm.rol
						JOIN modulos m ON m.id=rm.modulo";
	
    IF(P_id IS NOT NULL AND P_id!="")THEN
		SET @sqlQuery = CONCAT(@sqlQuery," WHERE rm.id=",P_id);
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
	SET @sqlQuery = "SELECT s.id, s.clave, s.concepto, ca.id AS id_catArea, ca.nombre AS area, s.cantidad, s.precioUnitario
					FROM servicios s
					JOIN cat_areas ca ON s.area=ca.id";
	
	IF(P_id IS NOT NULL AND P_id!="")THEN
		SET @sqlQuery = CONCAT(@sqlQuery," WHERE s.id=",P_id);
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPQ_serviciosEventos`(IN P_id INT, IN P_filtro VARCHAR(200), IN P_order VARCHAR(50))
BEGIN
	SET @sqlQuery = "SELECT se.id, s.id AS id_servicio, s.nombre AS servicio, e.id AS id_evento, e.nombre AS evento
					FROM articulosEventos ae
						JOIN articulos a ON a.id=ae.articulo
						JOIN eventos e ON e.id=ae.evento";
	
    IF(P_id IS NOT NULL AND P_id!="")THEN
		SET @sqlQuery = CONCAT(@sqlQuery," WHERE se.id=",P_id);
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
	SET @sqlQuery = "SELECT v.id, emp.id AS id_empleado, emp.nombre AS empleado, cr.id AS id_ranking, cr.nombre AS ranking
					FROM vendedores v
					JOIN empleados emp ON v.empleado=emp.id
					JOIN cat_ranking cr ON v.ranking=cr.id";
	
	IF(P_id IS NOT NULL AND P_id!="")THEN
		SET @sqlQuery = CONCAT(@sqlQuery," WHERE v.id=",P_id);
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
		INSERT INTO articulosEventos VALUES (0,P_articulo,P_cantidad,P_evento);
            
		SELECT 'TRUE' AS respuesta, 'Artículos en eventos agregados satisfactoriamente' AS 'mensaje';
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_cobros`(IN P_id INT, IN P_evento INT, IN P_monto NUMERIC(11,2), IN P_cuentaBancaria INT)
BEGIN
	IF(P_id IS NULL OR P_id=0) THEN
		INSERT INTO clientes VALUES (0,CURRENT_TIMESTAMP,P_evento,P_monto,P_cuentaBancaria);
		
        SELECT 'TRUE' AS respuesta, 'Cobro agregado correctamente' AS 'mensaje';
	ELSE
		SET @coincidencias=0;
        
        SELECT COUNT(*) INTO @coincidencias FROM cobros WHERE id=P_id;
        
        IF(@coincidencias != 0)THEN       
			UPDATE articulos SET evento=P_evento, monto=P_monto, cuentaBancaria=P_cuentaBancaria WHERE id=P_id;
            
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
		INSERT INTO cat_bancos VALUES(0,P_clave,P_nombre,P_banco,P_noCuenta,P_clabe,P_saldo);
	
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
			
			UPDATE cat_bancos SET clave=P_clave, nombre=P_nombre, banco=P_banco, noCuenta=P_noCuenta, clabe=P_clabe, saldo=P_saldo WHERE id=P_id;
            
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_eventos`(IN P_id INT, IN P_nombre VARCHAR(200), IN P_cotizacion TINYINT(1), IN P_statusCotizacion INT, IN P_statusEvento INT, IN P_cliente INT, IN P_lugar INT, IN P_tipo INT, IN P_fechaEntrega TIMESTAMP, IN P_fechaSeguimiento TIMESTAMP, IN P_fechaFinal TIMESTAMP, IN P_invitados INT, IN P_salon TINYINT(1), IN P_vendedor INT, IN P_utilidadCuenta NUMERIC(5,2), IN P_cuenta VARCHAR(20), IN P_montoServicios NUMERIC(8,2), IN P_depositosEnGarantia INT, IN P_montoDepositosEnGarantia NUMERIC(8,2), IN P_guardias INT, IN P_cantidadGuardias INT, IN P_montoGuardias NUMERIC(8,2), IN P_metodoPago INT, IN P_banco INT, IN P_totalEvento NUMERIC(11,2), IN P_anticipo NUMERIC(11,2))
BEGIN
	IF(P_id IS NULL OR P_id=0) THEN
		INSERT INTO clientes VALUES (0,nombre,cotizacion,P_statusCotizacion,P_statusEvento,P_cliente,P_lugar,P_tipo,P_fechaEntrega,P_fechaSeguimiento,P_fechaFinal,P_invitados,P_salon,P_vendedor,P_utilidadCuenta,P_cuenta,P_montoServicios,P_depositosEnGarantia,P_montoDepositosEnGarantia,P_guardias,P_cantidadGuardias,P_montoGuardias,P_metodoPago,P_banco,P_totalEvento,P_anticipo);
	
        SELECT 'TRUE' AS respuesta, 'Evento agregado correctamente' AS 'mensaje';
	ELSE
		SET @coincidencias=0;
        
        SELECT COUNT(*) INTO @coincidencias FROM eventos WHERE id=P_id;
        
        IF(@coincidencias != 0)THEN       
			UPDATE articulos SET nombre=P_nombre, cotizacion=P_cotizacion, statusCotizacion=P_statusCotizacion, statusEvento=P_statusEvento, cliente=P_cliente, lugar=P_lugar, tipo=P_tipo, fechaEntrega=P_fechaEntrega, fechaSeguimiento=P_fechaSeguimiento, fechaFinal=P_fechaFinal, invitados=P_invitados, salon=P_salon, vendedor=P_vendedor, utilidadCuenta=P_utilidadCuenta, cuenta=P_cuenta, montoServicios=P_montoServicios, depositosEnGarantia=P_depositosEnGarantia, montoDepositosEnGarantia=P_montoDepositosEnGarantia, guardias=P_guardias, cantidadGuardias=P_cantidadGuardias, montoGuardias=P_montoGuardias, metodoPago=P_metodoPago, banco=P_banco, totalEvento=P_totalEvento, anticipo=P_anticipo WHERE id=P_id;
		
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_gastos`(IN P_id INT, IN P_empleado INT, IN P_evento INT, IN P_direccion VARCHAR(200), IN P_concepto VARCHAR(200), IN P_telefonoContacto VARCHAR(14), IN P_fechaSolicitud TIMESTAMP, IN P_fechaRequerido TIMESTAMP, IN P_fechaEntrega TIMESTAMP, IN P_area INT, IN P_monto NUMERIC(11,2))
BEGIN
	IF(P_id IS NULL OR P_id=0) THEN
		INSERT INTO clientes VALUES (0,P_empleado,P_evento,P_direccion,P_concepto,P_telefonoContacto,P_fechaSolicitud,P_fechaRequerido,P_fechaEntrega,P_area,P_monto);
	
        SELECT 'TRUE' AS respuesta, 'Gasto agregado correctamente' AS 'mensaje';
	ELSE
		SET @coincidencias=0;
        
        SELECT COUNT(*) INTO @coincidencias FROM gastos WHERE id=P_id;
        
        IF(@coincidencias != 0)THEN    
			UPDATE articulos SET empleado=P_empleado, evento=P_evento, direccion=P_direccion, concepto=P_concepto, telefonoContacto=P_telefonoContacto, fechaSolicitud=P_fechaSolicitud, fechaRequerido=P_fechaRequerido, fechaEntrega=P_fechaEntrega, area=P_area, monto=P_monto WHERE id=P_id;
		
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_modulos`(IN P_id INT, IN P_nombre VARCHAR(50), IN P_url VARCHAR(150), IN P_prioridad CHAR(1))
BEGIN
	IF(P_id IS NULL OR P_id=0) THEN
		INSERT INTO modulos VALUES(0,P_nombre,P_url,P_prioridad);
	
        SELECT 'TRUE' AS respuesta, 'Módulo agregado correctamente' AS 'mensaje';
	ELSE
		SET @coincidencias=0;
        
        SELECT COUNT(*) INTO @coincidencias FROM modulos WHERE id=P_id;
        
        IF(@coincidencias != 0)THEN   
			SELECT COUNT(*) INTO @coincidencias FROM modulos WHERE nombre=P_nombre AND prioridad=P_prioridad;
            
			IF(@coincidencias!=0)THEN    
				SELECT 'false' AS respuesta, 'Nombre del módulo ya existe en esta prioridad' AS 'mensaje';
			ELSE
				UPDATE modulos SET nombre=P_nombre, url=P_url, prioridad=P_prioridad WHERE id=P_id;
			
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_proveedores`(IN P_id INT, IN P_clave VARCHAR(20), IN P_nombre VARCHAR(100), IN P_nombreContacto VARCHAR(100), IN P_nombre2Contacto VARCHAR(100), IN P_nombreEmpresaContacto VARCHAR(100), IN P_telefonoContacto VARCHAR(14), IN P_celularContacto VARCHAR(14), IN P_emailContacto VARCHAR(70), IN P_webContacto VARCHAR(200), IN P_rfcFiscal VARCHAR(14), IN P_nombreComercialFiscal VARCHAR(100), IN P_calleFiscal VARCHAR(50), IN P_coloniaFiscal VARCHAR(100), IN P_ciudadFiscal INT(11), IN P_estadoFiscal INT(11), IN P_codigoPostalFiscal CHAR(5))
ThisSP:BEGIN
	IF(P_id IS NULL OR P_id=0) THEN
		INSERT INTO clientes VALUES (0,P_clave,P_nombre,P_nombreContacto,P_nombre2Contacto,P_nombreEmpresaContacto,P_telefonoContacto,P_celularContacto,P_emailContacto,P_webContacto,P_rfcFiscal,P_nombreComercialFiscal,P_calleFiscal,P_coloniaFiscal,P_ciudadFiscal,P_estadoFiscal,P_codigoPostalFiscal);
	
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
			
			UPDATE articulos SET clave=P_clave, nombre=P_nombre, nombreContacto=P_nombreContacto, nombre2Contacto=P_nombre2Contacto, nombreEmpresaContacto=P_nombreEmpresaContacto, telefonoContacto=P_telefonoContacto, celularContacto=P_celularContacto, emailContacto=P_emailContacto, webContacto=P_webContacto, rfcFiscal=P_rfcFiscal, nombreComercialFiscal=P_nombreComercialFiscal, calleFiscal=P_calleFiscal, coloniaFiscal=P_coloniaFiscal, ciudadFiscal=P_ciudadFiscal, estadoFiscal=P_estadoFiscal, codigoPostalFiscal=P_codigoPostalFiscal WHERE id=P_id;
			
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
		INSERT INTO clientes VALUES (0,P_clave,P_concepto,P_area,P_cantidad,P_precioUnitario);
	
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
			
			UPDATE articulos SET clave=P_clave, concepto=P_concepto, area=P_area, cantidad=P_cantidad, precioUnitario=P_precioUnitario WHERE id=P_id;
    
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

-- Dump completed on 2016-06-19 14:28:20
