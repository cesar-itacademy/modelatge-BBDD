-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: culdampolla_db
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adreces`
--

DROP TABLE IF EXISTS `adreces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adreces` (
  `id_adreces` int NOT NULL AUTO_INCREMENT,
  `carrer` varchar(100) DEFAULT NULL,
  `numero` tinyint DEFAULT NULL,
  `pis` varchar(45) DEFAULT NULL,
  `porta` varchar(45) DEFAULT NULL,
  `ciutat` varchar(100) DEFAULT NULL,
  `codi_postal` varchar(10) DEFAULT NULL,
  `pais` varchar(100) DEFAULT 'Regne Unit',
  PRIMARY KEY (`id_adreces`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Taula d''adresses, es fa servir tant per Proveïdors com per Clients';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adreces`
--

LOCK TABLES `adreces` WRITE;
/*!40000 ALTER TABLE `adreces` DISABLE KEYS */;
INSERT INTO `adreces` VALUES (1,'Carrer Can Corb',33,'1','b','Cervera','08800','Regne Unit'),(2,'Poligon Vic',23,NULL,NULL,'Vic','00000','Regne Unit');
/*!40000 ALTER TABLE `adreces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id_clients` int NOT NULL DEFAULT '1',
  `nom` varchar(45) NOT NULL,
  `telefon` varchar(15) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `data_registre` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Adreces_id_adreces` int NOT NULL,
  `recomanat` char(1) DEFAULT NULL COMMENT 'Camp per definir si el client ha estat recomanat, valors posible ''S'' o ''N'' per sí o no.',
  `recomanatper` varchar(100) DEFAULT NULL COMMENT 'Nom del client que ha fet la recomanació.',
  PRIMARY KEY (`id_clients`),
  KEY `fk_Clients_Adreces1_idx` (`Adreces_id_adreces`),
  CONSTRAINT `fk_Clients_Adreces1` FOREIGN KEY (`Adreces_id_adreces`) REFERENCES `adreces` (`id_adreces`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Taula amb información dels clients';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Client_1','898888889','sjdfsdfjasdf@jfsakfjs.com','2020-07-12 19:14:02',1,'N',NULL);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colors`
--

DROP TABLE IF EXISTS `colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colors` (
  `id_colors` int NOT NULL AUTO_INCREMENT,
  `nom_color` varchar(45) NOT NULL COMMENT 'Color, el feim servir tant per indicar el color de la montura com dels vidres.',
  PRIMARY KEY (`id_colors`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colors`
--

LOCK TABLES `colors` WRITE;
/*!40000 ALTER TABLE `colors` DISABLE KEYS */;
INSERT INTO `colors` VALUES (1,'Negre'),(2,'Blau'),(3,'Blanc'),(4,'Groc'),(5,'Verd');
/*!40000 ALTER TABLE `colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleats`
--

DROP TABLE IF EXISTS `empleats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleats` (
  `id_empleats` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL COMMENT 'Nom del empleat per identificar-lo a la venta de les ulleres.',
  PRIMARY KEY (`id_empleats`),
  KEY `idx_nom` (`nom`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleats`
--

LOCK TABLES `empleats` WRITE;
/*!40000 ALTER TABLE `empleats` DISABLE KEYS */;
INSERT INTO `empleats` VALUES (1,'empleat1'),(2,'empleat2'),(3,'empleat3');
/*!40000 ALTER TABLE `empleats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graduacions`
--

DROP TABLE IF EXISTS `graduacions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `graduacions` (
  `id_graduacions` int NOT NULL AUTO_INCREMENT,
  `graduacio` decimal(3,2) NOT NULL,
  PRIMARY KEY (`id_graduacions`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graduacions`
--

LOCK TABLES `graduacions` WRITE;
/*!40000 ALTER TABLE `graduacions` DISABLE KEYS */;
INSERT INTO `graduacions` VALUES (1,1.00),(2,3.00),(3,1.20),(4,2.20),(5,2.50);
/*!40000 ALTER TABLE `graduacions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marques`
--

DROP TABLE IF EXISTS `marques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marques` (
  `id_marques` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `Proveidors_id_proveidors` int NOT NULL,
  PRIMARY KEY (`id_marques`,`Proveidors_id_proveidors`),
  UNIQUE KEY `id_marques_UNIQUE` (`id_marques`),
  KEY `fk_Marques_Proveidors1_idx` (`Proveidors_id_proveidors`),
  CONSTRAINT `fk_Marques_Proveidors1` FOREIGN KEY (`Proveidors_id_proveidors`) REFERENCES `proveidors` (`id_proveidors`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marques`
--

LOCK TABLES `marques` WRITE;
/*!40000 ALTER TABLE `marques` DISABLE KEYS */;
INSERT INTO `marques` VALUES (1,'Ray-Ban',1),(2,'Persol',2);
/*!40000 ALTER TABLE `marques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `montures`
--

DROP TABLE IF EXISTS `montures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `montures` (
  `id_montures` int NOT NULL AUTO_INCREMENT,
  `tipo` enum('flotant','pasta','metàlica') NOT NULL COMMENT 'Tipus de montura, 3 valors predefinits flotant, pasta i metàlica.',
  `Colors_id_colors` int NOT NULL COMMENT 'Id del color de la montura.',
  PRIMARY KEY (`id_montures`),
  KEY `fk_Montures_Colors1_idx` (`Colors_id_colors`),
  CONSTRAINT `fk_Montures_Colors1` FOREIGN KEY (`Colors_id_colors`) REFERENCES `colors` (`id_colors`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `montures`
--

LOCK TABLES `montures` WRITE;
/*!40000 ALTER TABLE `montures` DISABLE KEYS */;
INSERT INTO `montures` VALUES (1,'pasta',2),(2,'pasta',4),(3,'flotant',1),(4,'metàlica',2);
/*!40000 ALTER TABLE `montures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveidors`
--

DROP TABLE IF EXISTS `proveidors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveidors` (
  `id_proveidors` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `Adreces_id_adreces` int NOT NULL,
  `telefon` varchar(15) DEFAULT NULL,
  `fax` varchar(15) DEFAULT NULL,
  `nif` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`id_proveidors`),
  KEY `fk_Proveidors_Adreces_idx` (`Adreces_id_adreces`),
  CONSTRAINT `fk_Proveidors_Adreces` FOREIGN KEY (`Adreces_id_adreces`) REFERENCES `adreces` (`id_adreces`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Taula dels proveïdors';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveidors`
--

LOCK TABLES `proveidors` WRITE;
/*!40000 ALTER TABLE `proveidors` DISABLE KEYS */;
INSERT INTO `proveidors` VALUES (1,'General Optica',2,'600000','600000','B12345678'),(2,'Comercial Ernet',2,'600099940','6000090','b12345678');
/*!40000 ALTER TABLE `proveidors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipus_ulleres`
--

DROP TABLE IF EXISTS `tipus_ulleres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipus_ulleres` (
  `id_tipus_ulleres` int NOT NULL AUTO_INCREMENT,
  `model` varchar(50) NOT NULL COMMENT 'Nom del model de la ullera, per exemple Wayfarer.',
  `preu` decimal(15,2) NOT NULL COMMENT 'Preu de la ullera corresponent al model,  montura i vidres seleccionats.',
  `Vidre_Esquerra_id_vidre_esquerra` int NOT NULL COMMENT 'Id del vidre esquerra i les seves característiques.',
  `Vidre_Dreta_id_vidre_dreta` int NOT NULL COMMENT 'Id del vidre dreta i les seves característiques.',
  `Marques_id_marques` int NOT NULL COMMENT 'Id de la Marca de la ullera.',
  `Montures_id_montures` int NOT NULL COMMENT 'Id de la montura, podem coneixe tipus i color.',
  PRIMARY KEY (`id_tipus_ulleres`,`Marques_id_marques`,`Montures_id_montures`,`Vidre_Esquerra_id_vidre_esquerra`,`Vidre_Dreta_id_vidre_dreta`),
  KEY `fk_Tipus_ulleres_Vidre_Esquerra1_idx` (`Vidre_Esquerra_id_vidre_esquerra`),
  KEY `fk_Tipus_ulleres_Vidre_Dreta1_idx` (`Vidre_Dreta_id_vidre_dreta`),
  KEY `fk_Tipus_ulleres_Marques1_idx` (`Marques_id_marques`),
  KEY `fk_Tipus_ulleres_Montures1_idx` (`Montures_id_montures`),
  CONSTRAINT `fk_Tipus_ulleres_Marques1` FOREIGN KEY (`Marques_id_marques`) REFERENCES `marques` (`id_marques`),
  CONSTRAINT `fk_Tipus_ulleres_Montures1` FOREIGN KEY (`Montures_id_montures`) REFERENCES `montures` (`id_montures`),
  CONSTRAINT `fk_Tipus_ulleres_Vidre_Dreta1` FOREIGN KEY (`Vidre_Dreta_id_vidre_dreta`) REFERENCES `vidre_dreta` (`id_vidre_dreta`),
  CONSTRAINT `fk_Tipus_ulleres_Vidre_Esquerra1` FOREIGN KEY (`Vidre_Esquerra_id_vidre_esquerra`) REFERENCES `vidre_esquerra` (`id_vidre_esquerra`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipus_ulleres`
--

LOCK TABLES `tipus_ulleres` WRITE;
/*!40000 ALTER TABLE `tipus_ulleres` DISABLE KEYS */;
INSERT INTO `tipus_ulleres` VALUES (1,'Wayfarer',150.75,1,1,1,1),(2,'Clubmaster',230.00,2,2,2,2);
/*!40000 ALTER TABLE `tipus_ulleres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ulleres`
--

DROP TABLE IF EXISTS `ulleres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ulleres` (
  `id-ulleres` int NOT NULL AUTO_INCREMENT,
  `ulleres_ref` varchar(45) NOT NULL COMMENT 'Referéncia única de la ullera.',
  `Empleats_id_empleats` int NOT NULL COMMENT 'Identificador de l''empleat que ha venut la ullera.',
  `Tipus_ulleres_id_tipus_ulleres` int NOT NULL COMMENT 'Identificador per coneixer:  marca, model, preu, montura i vidres de la ullera.',
  PRIMARY KEY (`id-ulleres`),
  UNIQUE KEY `ulleres_ref_UNIQUE` (`ulleres_ref`),
  KEY `fk_Ulleres_Empleats1_idx` (`Empleats_id_empleats`),
  KEY `fk_Ulleres_Tipus_ulleres1_idx` (`Tipus_ulleres_id_tipus_ulleres`),
  CONSTRAINT `fk_Ulleres_Empleats1` FOREIGN KEY (`Empleats_id_empleats`) REFERENCES `empleats` (`id_empleats`),
  CONSTRAINT `fk_Ulleres_Tipus_ulleres1` FOREIGN KEY (`Tipus_ulleres_id_tipus_ulleres`) REFERENCES `tipus_ulleres` (`id_tipus_ulleres`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ulleres`
--

LOCK TABLES `ulleres` WRITE;
/*!40000 ALTER TABLE `ulleres` DISABLE KEYS */;
INSERT INTO `ulleres` VALUES (1,'3929993',1,1);
/*!40000 ALTER TABLE `ulleres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vidre_dreta`
--

DROP TABLE IF EXISTS `vidre_dreta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vidre_dreta` (
  `id_vidre_dreta` int NOT NULL AUTO_INCREMENT,
  `Colors_id_colors` int NOT NULL COMMENT 'Id del color del vidre.',
  `Graduacions_id_graduacions` int NOT NULL,
  PRIMARY KEY (`id_vidre_dreta`),
  KEY `fk_Vidre_Dreta_Colors1_idx` (`Colors_id_colors`),
  KEY `fk_Vidre_Dreta_Graduacions1_idx` (`Graduacions_id_graduacions`),
  CONSTRAINT `fk_Vidre_Dreta_Colors1` FOREIGN KEY (`Colors_id_colors`) REFERENCES `colors` (`id_colors`),
  CONSTRAINT `fk_Vidre_Dreta_Graduacions1` FOREIGN KEY (`Graduacions_id_graduacions`) REFERENCES `graduacions` (`id_graduacions`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vidre_dreta`
--

LOCK TABLES `vidre_dreta` WRITE;
/*!40000 ALTER TABLE `vidre_dreta` DISABLE KEYS */;
INSERT INTO `vidre_dreta` VALUES (1,1,1),(2,2,2),(3,2,3),(4,1,3),(5,4,2);
/*!40000 ALTER TABLE `vidre_dreta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vidre_esquerra`
--

DROP TABLE IF EXISTS `vidre_esquerra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vidre_esquerra` (
  `id_vidre_esquerra` int NOT NULL AUTO_INCREMENT,
  `Colors_id_colors` int NOT NULL COMMENT 'Id del color del vidre.',
  `Graduacions_id_graduacions` int NOT NULL,
  PRIMARY KEY (`id_vidre_esquerra`),
  KEY `fk_Vidre_Esquerra_Colors1_idx` (`Colors_id_colors`),
  KEY `fk_Vidre_Esquerra_Graduacions1_idx` (`Graduacions_id_graduacions`),
  CONSTRAINT `fk_Vidre_Esquerra_Colors1` FOREIGN KEY (`Colors_id_colors`) REFERENCES `colors` (`id_colors`),
  CONSTRAINT `fk_Vidre_Esquerra_Graduacions1` FOREIGN KEY (`Graduacions_id_graduacions`) REFERENCES `graduacions` (`id_graduacions`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vidre_esquerra`
--

LOCK TABLES `vidre_esquerra` WRITE;
/*!40000 ALTER TABLE `vidre_esquerra` DISABLE KEYS */;
INSERT INTO `vidre_esquerra` VALUES (1,1,1),(2,2,3),(3,1,2),(4,3,4),(5,1,1);
/*!40000 ALTER TABLE `vidre_esquerra` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-12 21:59:33
