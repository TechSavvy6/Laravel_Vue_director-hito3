-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: appdb15
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.24-MariaDB

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
-- Table structure for table `ana_integrantes`
--

DROP TABLE IF EXISTS `ana_integrantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ana_integrantes` (
  `codProyecto` bigint(20) NOT NULL,
  `codAnaRes` bigint(20) NOT NULL,
  `codEstado` int(11) DEFAULT NULL,
  `dayFechaCreacion` datetime DEFAULT NULL,
  `desUsuarioCreacion` varchar(255) DEFAULT NULL,
  `codProyIntegrante` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ana_integrantes`
--

LOCK TABLES `ana_integrantes` WRITE;
/*!40000 ALTER TABLE `ana_integrantes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ana_integrantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anares_actividad`
--

DROP TABLE IF EXISTS `anares_actividad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anares_actividad` (
  `codAnaResActividad` bigint(20) NOT NULL AUTO_INCREMENT,
  `desActividad` varchar(255) DEFAULT NULL,
  `desRestriccion` varchar(255) DEFAULT NULL,
  `codTipoRestriccion` int(11) DEFAULT NULL,
  `dayFechaRequerida` datetime DEFAULT NULL,
  `idUsuarioResponsable` bigint(20) DEFAULT NULL,
  `desAreaResponsable` char(18) DEFAULT NULL,
  `codEstadoActividad` char(18) DEFAULT NULL,
  `codUsuarioSolicitante` char(18) DEFAULT NULL,
  `codAnaResFase` bigint(20) NOT NULL,
  `codAnaResFrente` bigint(20) NOT NULL,
  `codProyecto` bigint(20) NOT NULL,
  `codAnaRes` bigint(20) NOT NULL,
  PRIMARY KEY (`codAnaResActividad`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anares_actividad`
--

LOCK TABLES `anares_actividad` WRITE;
/*!40000 ALTER TABLE `anares_actividad` DISABLE KEYS */;
INSERT INTO `anares_actividad` VALUES (1,'veremos','',0,'2022-12-19 06:15:57',NULL,NULL,NULL,NULL,6,4,112,24),(2,'prueba2','',0,'2022-12-19 06:22:24',NULL,NULL,NULL,NULL,6,4,112,24),(3,'prueba','',0,'2022-12-19 06:28:20',NULL,NULL,NULL,NULL,1,1,113,25),(4,'1','',0,'2022-12-19 15:23:36',NULL,NULL,NULL,NULL,6,4,112,24);
/*!40000 ALTER TABLE `anares_actividad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anares_analisis_tiporestricciones`
--

DROP TABLE IF EXISTS `anares_analisis_tiporestricciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anares_analisis_tiporestricciones` (
  `codAnalisisTipoRestricciones` bigint(20) NOT NULL,
  `codAnaRes` bigint(20) NOT NULL,
  `desTipoRestricciones` varchar(250) DEFAULT NULL,
  KEY `AnaRes_Analisis_TipoRestricciones_R_01` (`codAnaRes`),
  CONSTRAINT `AnaRes_Analisis_TipoRestricciones_R_01` FOREIGN KEY (`codAnaRes`) REFERENCES `anares_analisisrestricciones` (`codAnaRes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anares_analisis_tiporestricciones`
--

LOCK TABLES `anares_analisis_tiporestricciones` WRITE;
/*!40000 ALTER TABLE `anares_analisis_tiporestricciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `anares_analisis_tiporestricciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anares_analisisrestricciones`
--

DROP TABLE IF EXISTS `anares_analisisrestricciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anares_analisisrestricciones` (
  `codProyecto` bigint(20) NOT NULL,
  `codEstado` int(11) DEFAULT NULL,
  `dayFechaCreacion` datetime DEFAULT NULL,
  `desUsuarioCreacion` varchar(255) DEFAULT NULL,
  `indNoRetrasados` int(11) DEFAULT NULL,
  `indRetrasados` int(11) DEFAULT NULL,
  `codAnaRes` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`codAnaRes`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anares_analisisrestricciones`
--

LOCK TABLES `anares_analisisrestricciones` WRITE;
/*!40000 ALTER TABLE `anares_analisisrestricciones` DISABLE KEYS */;
INSERT INTO `anares_analisisrestricciones` VALUES (112,1,'2022-12-18 09:38:54','diego@gmail.com',55,40,24),(113,1,'2022-12-19 06:25:17','juan@gmail.com',55,40,25);
/*!40000 ALTER TABLE `anares_analisisrestricciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anares_fase`
--

DROP TABLE IF EXISTS `anares_fase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anares_fase` (
  `codAnaResFase` bigint(20) NOT NULL AUTO_INCREMENT,
  `desAnaResFase` varchar(255) DEFAULT NULL,
  `dayFechaCreacion` datetime DEFAULT NULL,
  `desUsuarioCreacion` varchar(255) DEFAULT NULL,
  `codAnaResFrente` bigint(20) NOT NULL,
  `codProyecto` bigint(20) NOT NULL,
  `codAnaRes` bigint(20) NOT NULL,
  PRIMARY KEY (`codAnaResFase`) USING BTREE,
  UNIQUE KEY `XPKAnaRes_Fase` (`codAnaResFase`,`codAnaResFrente`,`codProyecto`,`codAnaRes`) USING BTREE,
  KEY `XIF1AnaRes_Fase` (`codAnaResFrente`,`codProyecto`,`codAnaRes`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anares_fase`
--

LOCK TABLES `anares_fase` WRITE;
/*!40000 ALTER TABLE `anares_fase` DISABLE KEYS */;
INSERT INTO `anares_fase` VALUES (4,'FASE PRUEBA1','2022-12-18 09:39:46','',1,112,24),(5,'FASE 001','2022-12-19 05:47:47','',2,112,24),(6,'FASE 002','2022-12-19 06:07:09','',4,112,24),(7,'FASE T001','2022-12-19 06:25:53','',1,113,25),(8,'FASE 002','2022-12-22 10:57:11','',4,112,24),(9,'FASE DE MUESTRA','2022-12-22 10:57:22','',3,112,24);
/*!40000 ALTER TABLE `anares_fase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anares_frente`
--

DROP TABLE IF EXISTS `anares_frente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anares_frente` (
  `codAnaResFrente` bigint(20) NOT NULL AUTO_INCREMENT,
  `desAnaResFrente` varchar(255) DEFAULT NULL,
  `dayFechaCreacion` datetime DEFAULT NULL,
  `desUsuarioCreacion` varchar(255) DEFAULT NULL,
  `codProyecto` bigint(20) NOT NULL,
  `codAnaRes` bigint(20) NOT NULL,
  PRIMARY KEY (`codAnaResFrente`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anares_frente`
--

LOCK TABLES `anares_frente` WRITE;
/*!40000 ALTER TABLE `anares_frente` DISABLE KEYS */;
INSERT INTO `anares_frente` VALUES (3,'FRENTE PRUEBA1','2022-12-18 09:39:30','',112,24),(4,'FRENTE001','2022-12-19 05:47:37','',112,24),(5,'FRENTE T001','2022-12-19 06:25:44','',113,25);
/*!40000 ALTER TABLE `anares_frente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anares_tiporestricciones`
--

DROP TABLE IF EXISTS `anares_tiporestricciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anares_tiporestricciones` (
  `codTipoRestricciones` bigint(20) NOT NULL,
  `desTipoRestricciones` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anares_tiporestricciones`
--

LOCK TABLES `anares_tiporestricciones` WRITE;
/*!40000 ALTER TABLE `anares_tiporestricciones` DISABLE KEYS */;
INSERT INTO `anares_tiporestricciones` VALUES (1,'ARQUITECTURA'),(2,'LLENADO');
/*!40000 ALTER TABLE `anares_tiporestricciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `animals`
--

DROP TABLE IF EXISTS `animals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `animals` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` char(30) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animals`
--

LOCK TABLES `animals` WRITE;
/*!40000 ALTER TABLE `animals` DISABLE KEYS */;
/*!40000 ALTER TABLE `animals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conf_estado`
--

DROP TABLE IF EXISTS `conf_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conf_estado` (
  `codEstado` int(11) NOT NULL,
  `desEstado` varchar(255) DEFAULT NULL,
  `desModule` varchar(255) DEFAULT NULL,
  UNIQUE KEY `XPKConf_Estado` (`codEstado`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conf_estado`
--

LOCK TABLES `conf_estado` WRITE;
/*!40000 ALTER TABLE `conf_estado` DISABLE KEYS */;
/*!40000 ALTER TABLE `conf_estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conf_ubigeo`
--

DROP TABLE IF EXISTS `conf_ubigeo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conf_ubigeo` (
  `codUbigeo` int(11) NOT NULL,
  `desUbigeo` varchar(255) DEFAULT NULL,
  `Departamento` varchar(255) DEFAULT NULL,
  `Provincia` varchar(255) DEFAULT NULL,
  `Distrito` varchar(255) DEFAULT NULL,
  UNIQUE KEY `XPKConf_Ubigeo` (`codUbigeo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conf_ubigeo`
--

LOCK TABLES `conf_ubigeo` WRITE;
/*!40000 ALTER TABLE `conf_ubigeo` DISABLE KEYS */;
/*!40000 ALTER TABLE `conf_ubigeo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `other_notificaciones`
--

DROP TABLE IF EXISTS `other_notificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `other_notificaciones` (
  `codNotificacion` int(11) NOT NULL,
  `desNombre` varchar(255) DEFAULT NULL,
  `desDescripción` varchar(255) DEFAULT NULL,
  `desPersonalizar` varchar(255) DEFAULT NULL,
  UNIQUE KEY `XPKother_Notificaciones` (`codNotificacion`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `other_notificaciones`
--

LOCK TABLES `other_notificaciones` WRITE;
/*!40000 ALTER TABLE `other_notificaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `other_notificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `other_notificaciones_usuario`
--

DROP TABLE IF EXISTS `other_notificaciones_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `other_notificaciones_usuario` (
  `id` bigint(20) NOT NULL,
  `codNotificacion` int(11) NOT NULL,
  `codEstado` int(11) DEFAULT NULL,
  `dayFechaCreacion` datetime DEFAULT NULL,
  `desUsuarioCreación` varchar(255) DEFAULT NULL,
  UNIQUE KEY `XPKother_Notificaciones_Usuario` (`id`,`codNotificacion`) USING BTREE,
  KEY `XIF1other_Notificaciones_Usuario` (`id`) USING BTREE,
  KEY `XIF2other_Notificaciones_Usuario` (`codNotificacion`) USING BTREE,
  CONSTRAINT `other_notificaciones_usuario_ibfk_1` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `other_notificaciones_usuario_ibfk_2` FOREIGN KEY (`codNotificacion`) REFERENCES `other_notificaciones` (`codNotificacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `other_notificaciones_usuario`
--

LOCK TABLES `other_notificaciones_usuario` WRITE;
/*!40000 ALTER TABLE `other_notificaciones_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `other_notificaciones_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`) USING BTREE,
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (2,'App\\Models\\User',4,'main','fad423794c19b2fcafa97ea7b3df90432ae38f84feb04d7876ae77e8c43749fd','[\"*\"]',NULL,'2022-11-08 11:00:02','2022-11-08 11:00:02'),(3,'App\\Models\\User',4,'main','8b23b8515d0c16fa55307ada01558e8daa544f2cb148764486e7252fbcf40502','[\"*\"]',NULL,'2022-11-08 11:00:25','2022-11-08 11:00:25'),(4,'App\\Models\\User',4,'main','c7bf9c90bb85f93b443baf3ee8ead0f3da3de473fe798a3786ec450988c45b76','[\"*\"]',NULL,'2022-11-08 21:38:39','2022-11-08 21:38:39'),(5,'App\\Models\\User',5,'main','0aa1e989c6969e6d10c6646cf74b3ab944df69d6152044c171a4d936288972a6','[\"*\"]',NULL,'2022-11-11 00:18:15','2022-11-11 00:18:15'),(6,'App\\Models\\User',5,'main','da842488d492df963f2820a0e4897de5a30e3d05b27d84150e4e1f83928e9133','[\"*\"]',NULL,'2022-11-11 00:18:50','2022-11-11 00:18:50'),(7,'App\\Models\\User',5,'main','8e92ab3a7a4ad4da42c52fd6f1400095c016bfd9ec3bb302b18d363fda7bc889','[\"*\"]',NULL,'2022-11-11 04:49:37','2022-11-11 04:49:37'),(8,'App\\Models\\User',5,'main','2a7a97c651cd5fb2fcf4d9c1dfd1d8d944a95193103303c141aac0982812dd91','[\"*\"]',NULL,'2022-11-11 10:06:35','2022-11-11 10:06:35'),(9,'App\\Models\\User',5,'main','c7d95e0a2148e561747b204d7154d1f40c44b17549aae17a8da6512c1903bdd9','[\"*\"]',NULL,'2022-11-11 10:07:51','2022-11-11 10:07:51'),(10,'App\\Models\\User',5,'main','37d04b5f734555c1ac0da48ab605c44ed3a49aa5ec59c2cb18cf0087ec0dc768','[\"*\"]',NULL,'2022-11-11 10:10:00','2022-11-11 10:10:00'),(11,'App\\Models\\User',5,'main','2f11262c47a6795de590094b52168449bf37ca353d13c68c5b3dbd70d2d8a671','[\"*\"]',NULL,'2022-11-11 10:33:09','2022-11-11 10:33:09'),(12,'App\\Models\\User',5,'main','33f056e3e511f56ef8530326a2799d10b530b4273eaab0d593ea1a9e66bec7f4','[\"*\"]',NULL,'2022-11-11 10:34:46','2022-11-11 10:34:46'),(13,'App\\Models\\User',5,'main','1d3e0128edeed25fe49c1b7f32234649909b225b54554749eb47e4c562bd5a9b','[\"*\"]',NULL,'2022-11-11 10:39:32','2022-11-11 10:39:32'),(14,'App\\Models\\User',5,'main','4cab016e278c88a1e141cf1ad363d619f851475f4c1f2511c987bebc43970d41','[\"*\"]',NULL,'2022-11-11 10:44:52','2022-11-11 10:44:52'),(15,'App\\Models\\User',5,'main','a085b1189ee5434876835bc0e356830e26b446c54a442fec5b4f096b26f7756c','[\"*\"]',NULL,'2022-11-11 18:20:13','2022-11-11 18:20:13'),(16,'App\\Models\\User',5,'main','ec3da1d0dbbdfc1685ac78de7417e56226ba7f13df5cdd07b1de011d4f91fd58','[\"*\"]',NULL,'2022-11-13 16:34:48','2022-11-13 16:34:48'),(17,'App\\Models\\User',6,'main','c35d81587d6679cad0d462941e8b3d24f6057f4e7a1a539a0a2c664301d5a971','[\"*\"]',NULL,'2022-11-15 09:22:22','2022-11-15 09:22:22'),(18,'App\\Models\\User',6,'main','ce117f6577de5997021a35e2d05a8e9669bab2f744c97f435cec16968503bb04','[\"*\"]',NULL,'2022-11-15 09:22:34','2022-11-15 09:22:34'),(19,'App\\Models\\User',7,'main','002d96e3164c3ace78cca5670d336dde247293a7771cd6c00c74256dcc84372e','[\"*\"]',NULL,'2022-11-15 18:38:01','2022-11-15 18:38:01'),(20,'App\\Models\\User',7,'main','c633a7156756adc12e54def5ddffdd27828e529de86e94b9b1806f575d386453','[\"*\"]',NULL,'2022-11-15 18:38:16','2022-11-15 18:38:16'),(21,'App\\Models\\User',5,'main','066711ee3b2bc6ac0f388e03b56d3c8ce5e09ae6a81179bbce6afd86df179071','[\"*\"]',NULL,'2022-11-17 05:03:26','2022-11-17 05:03:26'),(22,'App\\Models\\User',5,'main','dbd3138ad438933d85d12b92d4afc21e95f30f04c2f97cfaba31e1f020b939e9','[\"*\"]',NULL,'2022-11-17 21:40:30','2022-11-17 21:40:30'),(23,'App\\Models\\User',5,'main','dc9f6f75376cdc7a6e887698f15c21ba08c5db28a52e327766b1e1273cc291c5','[\"*\"]',NULL,'2022-11-18 06:49:24','2022-11-18 06:49:24'),(24,'App\\Models\\User',5,'main','4823fb622e5f1d691bac582faa0faf3043dd0a0554f4339d3010c18159a8deb6','[\"*\"]',NULL,'2022-11-18 10:47:11','2022-11-18 10:47:11'),(25,'App\\Models\\User',6,'main','f32a736b9f58fc341538407297f67141cf36bad581fcf9e19f45cef6676ec6bf','[\"*\"]',NULL,'2022-11-18 10:47:49','2022-11-18 10:47:49'),(26,'App\\Models\\User',6,'main','5941cfbfc163e40db4a6b3f753aabad233ade3feaced5b2327bb6259c4773156','[\"*\"]',NULL,'2022-11-18 10:49:06','2022-11-18 10:49:06'),(27,'App\\Models\\User',5,'main','355bcb5ced91a3e77b83b325968688a12fd7205dc70ddf62f969830417c0752a','[\"*\"]',NULL,'2022-11-20 14:45:09','2022-11-20 14:45:09'),(28,'App\\Models\\User',6,'main','8193094a022a19d00c06774ec8ae0f089d5c0a57a2b5bd95fa62cc72764d5c36','[\"*\"]',NULL,'2022-11-20 18:44:49','2022-11-20 18:44:49'),(29,'App\\Models\\User',6,'main','def93eb74e74d92ea16f10fcaf0ebcc1496f753963fc17cdcd7442fee9323386','[\"*\"]',NULL,'2022-11-21 20:25:03','2022-11-21 20:25:03'),(30,'App\\Models\\User',6,'main','93c913260bd3a10edefdd0d2cc3e1a8ba95f7bbccd8e868672013c4a8f12ccae','[\"*\"]',NULL,'2022-11-22 14:16:17','2022-11-22 14:16:17'),(31,'App\\Models\\User',7,'main','1262a10de8a9ba54ff00c207791834275f013b4d05b5d9a1c46a789d87d142a3','[\"*\"]',NULL,'2022-11-22 19:38:09','2022-11-22 19:38:09'),(32,'App\\Models\\User',5,'main','7b21d51c7031b2bcb03f59665900fc2b1c35f0b1a2103d152f684bf7bed4449c','[\"*\"]',NULL,'2022-11-22 21:14:02','2022-11-22 21:14:02'),(33,'App\\Models\\User',6,'main','7c20ac3ce0b178133ac2666a10eacaa6a7bf0e35ea592e942abab05709eff183','[\"*\"]',NULL,'2022-11-22 21:16:44','2022-11-22 21:16:44'),(34,'App\\Models\\User',6,'main','360f4e14c5fb61c24f3c017f8fd41ad4a2d460627b42feaf44fae3e9c470b5cc','[\"*\"]',NULL,'2022-11-23 18:38:56','2022-11-23 18:38:56'),(35,'App\\Models\\User',8,'main','b18722012bec8d32da5a01ed7599fec0c7bc2e63bd55e23d75c51c52b09a1d4f','[\"*\"]',NULL,'2022-11-23 21:33:01','2022-11-23 21:33:01'),(36,'App\\Models\\User',8,'main','b8deacf012d2afbea9729c6f42873d1af2e052e68172aa167a31a32314a22060','[\"*\"]',NULL,'2022-11-23 21:33:19','2022-11-23 21:33:19'),(37,'App\\Models\\User',8,'main','17843f3bb8358b7cc59edf54484ed4cbe5236612885268e38961a326b4ca31bd','[\"*\"]','2022-11-24 01:27:21','2022-11-24 01:23:23','2022-11-24 01:27:21'),(38,'App\\Models\\User',8,'main','fbf99bf0f64788cc17d79c697feb4ed0d5f085a44ed05c7b2e2b2cf777d974f4','[\"*\"]',NULL,'2022-11-24 01:45:02','2022-11-24 01:45:02'),(39,'App\\Models\\User',8,'main','50945625730f6994b69d25f168a94d3477107eb117587ab4d8820fb76772597e','[\"*\"]',NULL,'2022-11-24 01:50:18','2022-11-24 01:50:18'),(40,'App\\Models\\User',8,'main','3565443e7ea98126f57ff7d5b76dc1c6e348af1173a0ba90c4124683d59d1511','[\"*\"]',NULL,'2022-11-24 01:51:38','2022-11-24 01:51:38'),(41,'App\\Models\\User',8,'main','e2c2dd0e587f95aa9d55c62a04e746345aed67ed34e3b6fef4cee0774e5d9e1f','[\"*\"]',NULL,'2022-11-24 01:54:49','2022-11-24 01:54:49'),(42,'App\\Models\\User',8,'main','475b88901b90a2b31e61ef7b8bd8e5be2d5326912c7c6b396fc60a4c74142c62','[\"*\"]',NULL,'2022-11-24 01:55:31','2022-11-24 01:55:31'),(43,'App\\Models\\User',8,'main','911c89bfdf0d83dab85e5f2e24584e77a7213334259be8291faa3047865d2f11','[\"*\"]',NULL,'2022-11-24 01:55:58','2022-11-24 01:55:58'),(44,'App\\Models\\User',8,'main','79910f6bbdc548d92cbe2371bb6868f24ef5ed980adb3e66f3ddad06422d5a61','[\"*\"]',NULL,'2022-11-24 01:56:53','2022-11-24 01:56:53'),(45,'App\\Models\\User',8,'main','ef74dba917d7f74fee9587931fd2e9a1c249c6a4a54f6c4d05e336e66024b1ea','[\"*\"]',NULL,'2022-11-24 02:05:40','2022-11-24 02:05:40'),(46,'App\\Models\\User',8,'main','858ee43fb1e289be220f0b7575c044ef125f6b6cb553176a9a1971c6f5f6ef76','[\"*\"]',NULL,'2022-11-24 02:08:03','2022-11-24 02:08:03'),(47,'App\\Models\\User',8,'main','b9e5ada0950bcb76c1ded852c0df0a8a9879463b207a95be589915f250a39402','[\"*\"]',NULL,'2022-11-24 02:08:51','2022-11-24 02:08:51'),(48,'App\\Models\\User',8,'main','86103f8733fec3ea7506c2ee8850297d6c83a7b674566dc0a402f88e8b6838cf','[\"*\"]',NULL,'2022-11-24 02:09:33','2022-11-24 02:09:33'),(49,'App\\Models\\User',8,'main','4fed75e11efeeee26ce2193beb991c38d56968d481368314752d8dd9921a0953','[\"*\"]',NULL,'2022-11-24 02:09:49','2022-11-24 02:09:49'),(50,'App\\Models\\User',8,'main','c9c0e0d4daa5f627e26c900067ef107bcaf51bf830303a6913316ede35e5b54c','[\"*\"]',NULL,'2022-11-24 02:09:52','2022-11-24 02:09:52'),(51,'App\\Models\\User',8,'main','d3b3dc80bccaaf768e131562ebb14b7dfcf9bcfbd1a1f9758775bcc8ec1a3284','[\"*\"]',NULL,'2022-11-24 02:10:12','2022-11-24 02:10:12'),(52,'App\\Models\\User',8,'main','f36a237cac578f7ae6ca36b3b5ad0cd50f7ece8ae982ff9e94981a53086a8e5a','[\"*\"]',NULL,'2022-11-24 02:19:52','2022-11-24 02:19:52'),(53,'App\\Models\\User',8,'main','b7ad94643e881a08d365ac3354f1bbaead37fe0809e9cbd3f924efba8294c16d','[\"*\"]',NULL,'2022-11-24 02:21:06','2022-11-24 02:21:06'),(54,'App\\Models\\User',8,'main','d1d33b481079b2367adcd077f0ea9cebc46047bf71b632231b8487cf73f1d417','[\"*\"]',NULL,'2022-11-24 02:36:47','2022-11-24 02:36:47'),(55,'App\\Models\\User',8,'main','f0ae1002035411f563a739b2f44a65472567d0b3b8390efb812bcab66a5914a8','[\"*\"]',NULL,'2022-11-24 09:37:24','2022-11-24 09:37:24'),(56,'App\\Models\\User',8,'main','c4731f02b9370fcda95b2f00eb15530316d46540768a4bfc04f1eb0ea24d904b','[\"*\"]',NULL,'2022-11-24 18:23:36','2022-11-24 18:23:36'),(57,'App\\Models\\User',8,'main','a465a694e4c6447798353b2a6de54dfc9d96a9b05417beeaf4bdf32c72deeb28','[\"*\"]',NULL,'2022-11-24 21:15:46','2022-11-24 21:15:46'),(58,'App\\Models\\User',8,'main','f65f0311e2e2872f9bee90c601e57881c870bc7bc5ef52efa59b6a7a22cd835a','[\"*\"]',NULL,'2022-11-25 00:33:42','2022-11-25 00:33:42'),(59,'App\\Models\\User',8,'main','691f32db8d5961f94b70ed3982037c0e5353bcdb333eaf05d6ab55f2b1a44289','[\"*\"]',NULL,'2022-11-28 21:35:31','2022-11-28 21:35:31'),(60,'App\\Models\\User',8,'main','f5272698a019d122e2a8e1978e2f806f40611bdedd9b76fe828ff0649fe7d1d3','[\"*\"]',NULL,'2022-11-29 18:12:18','2022-11-29 18:12:18'),(61,'App\\Models\\User',8,'main','2e03998469315e6fe17dcf9f584c20349bf002d2d7632e101c6ca7be3796f686','[\"*\"]',NULL,'2022-11-29 18:15:21','2022-11-29 18:15:21'),(62,'App\\Models\\User',8,'main','7484c83a92b479cd0f05edfdbb698a412d3783a4466529edb7258e83375b87f1','[\"*\"]',NULL,'2022-11-29 18:16:27','2022-11-29 18:16:27'),(63,'App\\Models\\User',8,'main','4d1b2d8fae9a5a0e553319582b372b547de32a2ead615e65760f40759c8ae16f','[\"*\"]',NULL,'2022-11-29 18:18:52','2022-11-29 18:18:52'),(64,'App\\Models\\User',8,'main','82e3f2f5ba3f8bc4e433bb36e775826feb1a02e913ef3c230a3ba2b645640339','[\"*\"]',NULL,'2022-11-29 18:26:11','2022-11-29 18:26:11'),(65,'App\\Models\\User',8,'main','01457f4f4d05dc104ed3c581615822a192e83fbe500cc5868651c58892c3aaa6','[\"*\"]',NULL,'2022-11-29 18:27:14','2022-11-29 18:27:14'),(66,'App\\Models\\User',8,'main','4e4bf5e09363b4ad9d88d1e54abc2d32c4cde6441df350f4a6547ff78ae46934','[\"*\"]',NULL,'2022-11-29 18:28:29','2022-11-29 18:28:29'),(67,'App\\Models\\User',8,'main','ffc7ed1f829c1e1845cab8499d6fad0189a933dd84f932441e131eb64dfb3ff7','[\"*\"]',NULL,'2022-11-29 18:28:33','2022-11-29 18:28:33'),(68,'App\\Models\\User',8,'main','31120f2219d960882283db6f8cce6ca758dbed4fcc66872f053cbac2afb14993','[\"*\"]',NULL,'2022-11-29 18:29:07','2022-11-29 18:29:07'),(69,'App\\Models\\User',8,'main','aa3c83f058fad39b4220c6617c1d67427bc75029c7dba5d6e1cc08b3730d3804','[\"*\"]',NULL,'2022-11-29 18:32:59','2022-11-29 18:32:59'),(70,'App\\Models\\User',8,'main','65ccede432c55f784758d356aca64ffaadc5497a76e8cb754f0ddc3ea3f37325','[\"*\"]',NULL,'2022-11-29 18:33:51','2022-11-29 18:33:51'),(71,'App\\Models\\User',8,'main','43d5275e8bbcb5b36cc05c6bc65e59cbe574c23b27de94e5cbef2efc0d6f13c9','[\"*\"]',NULL,'2022-11-29 18:36:46','2022-11-29 18:36:46'),(72,'App\\Models\\User',9,'main','a55ec71c207b847b9b1c50e266b866aadf59e689f69009f509136d909b47f7a2','[\"*\"]',NULL,'2022-12-01 07:16:59','2022-12-01 07:16:59'),(73,'App\\Models\\User',9,'main','395fb6e7763604c303fc2f1085fbfee2a85eeecd524dbd2e1e14e6bf70b52fd4','[\"*\"]',NULL,'2022-12-01 07:17:14','2022-12-01 07:17:14'),(74,'App\\Models\\User',9,'main','91ba39beb3e11a58b543f215a3f43a7e698367e1c402fbfbaaf5e2bbd448b5e7','[\"*\"]','2022-12-14 16:37:59','2022-12-14 16:11:31','2022-12-14 16:37:59'),(75,'App\\Models\\User',10,'main','a9f944386716a20f3bc7056b4c7f667486caf60e42f4c0c1d7f2197f464ed8f5','[\"*\"]',NULL,'2022-12-14 17:22:35','2022-12-14 17:22:35'),(76,'App\\Models\\User',11,'main','aa1f88e0f62fbd72b8f58bbf51176e8b8dc3a93034a9d0bbf8e14c00a846c56a','[\"*\"]',NULL,'2022-12-14 17:25:15','2022-12-14 17:25:15'),(77,'App\\Models\\User',11,'main','4eedda9bf43726c6d32ad0ade9911eadb0feec6dc8b57ddaf1865d1cbe24a13f','[\"*\"]',NULL,'2022-12-14 17:26:01','2022-12-14 17:26:01'),(78,'App\\Models\\User',12,'main','4332155ee88d50e07427c860f207c957a4f4fbfbad9918eca48230fc28ae979a','[\"*\"]',NULL,'2022-12-19 16:24:06','2022-12-19 16:24:06'),(79,'App\\Models\\User',12,'main','e54cebba854a2a418c1156c70ac6aaa5231f371aaa8b4590aa4b21d29c3e39ea','[\"*\"]',NULL,'2022-12-19 16:24:16','2022-12-19 16:24:16'),(80,'App\\Models\\User',9,'main','defddba4ad3948c8d24f8fe38529df66bb09a01a3c39c996a301e749cd935f91','[\"*\"]',NULL,'2022-12-19 16:28:59','2022-12-19 16:28:59'),(81,'App\\Models\\User',9,'main','981adf2becf5e96440cf409ad5c5c284fc7acb4ab89b248ed98ffb5182eab5f3','[\"*\"]',NULL,'2022-12-20 01:20:59','2022-12-20 01:20:59'),(82,'App\\Models\\User',9,'main','2ae20387645f9c36d746629cc407169ad20ed85b0999e515853c7f5f568bcaaf','[\"*\"]',NULL,'2022-12-21 19:34:10','2022-12-21 19:34:10'),(83,'App\\Models\\User',9,'main','bac54a702e79943ab8abd22d4b817c9cf17531922256169154357f8d08032ac5','[\"*\"]',NULL,'2022-12-22 18:08:38','2022-12-22 18:08:38'),(84,'App\\Models\\User',9,'main','77c6d95e6094b913e60ffc09e31dba15391488c61ede91dde8dea50c50397cab','[\"*\"]',NULL,'2022-12-22 20:54:41','2022-12-22 20:54:41');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proy_integrantes`
--

DROP TABLE IF EXISTS `proy_integrantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proy_integrantes` (
  `codProyIntegrante` bigint(20) NOT NULL AUTO_INCREMENT,
  `codProyecto` bigint(20) NOT NULL,
  `id` bigint(20) NOT NULL,
  `codEstadoInvitacion` varchar(255) DEFAULT NULL,
  `desArea` varchar(255) DEFAULT NULL,
  `dayFechaInvitacion` datetime DEFAULT NULL,
  `dayFechaInvitacionConfirmacion` datetime DEFAULT NULL,
  `codRolIntegrante` int(11) DEFAULT NULL,
  `desCorreo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codProyIntegrante`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proy_integrantes`
--

LOCK TABLES `proy_integrantes` WRITE;
/*!40000 ALTER TABLE `proy_integrantes` DISABLE KEYS */;
INSERT INTO `proy_integrantes` VALUES (28,112,9,'1','CARGO','2022-12-18 09:38:54',NULL,1,'juan@gmail.com'),(29,113,12,'1','CARGO','2022-12-19 06:25:17',NULL,1,'prueba@gmail.com');
/*!40000 ALTER TABLE `proy_integrantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proy_proyecto`
--

DROP TABLE IF EXISTS `proy_proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proy_proyecto` (
  `codProyecto` bigint(20) NOT NULL AUTO_INCREMENT,
  `desNombreProyecto` varchar(250) DEFAULT NULL,
  `codEstado` int(11) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `desEmpresa` varchar(100) DEFAULT NULL,
  `numPlazo` int(11) DEFAULT NULL,
  `numAreaTechado` decimal(25,2) DEFAULT NULL,
  `desTipoProyecto` varchar(255) DEFAULT NULL,
  `codUbigeo` int(11) DEFAULT NULL,
  `dayFechaInicio` datetime DEFAULT NULL,
  `numMontoReferencial` decimal(25,2) DEFAULT NULL,
  `numAreaTechada` decimal(25,2) DEFAULT NULL,
  `numAreaConstruida` decimal(25,2) DEFAULT NULL,
  `desPais` varchar(255) DEFAULT NULL,
  `desDireccion` varchar(255) DEFAULT NULL,
  `dayFechaCreacion` datetime DEFAULT NULL,
  `desUsuarioCreacion` varchar(255) DEFAULT NULL,
  UNIQUE KEY `XPKProy_Proyecto` (`codProyecto`) USING BTREE,
  KEY `XIF1Proy_Proyecto` (`id`) USING BTREE,
  KEY `XIF2Proy_Proyecto` (`codUbigeo`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proy_proyecto`
--

LOCK TABLES `proy_proyecto` WRITE;
/*!40000 ALTER TABLE `proy_proyecto` DISABLE KEYS */;
INSERT INTO `proy_proyecto` VALUES (112,'PROYECTO PRUEBA',1,9,'SODIMAC',1,1.00,'3',23,'2022-11-20 10:23:25',45.00,10.00,10.00,'peru','villa veremos','2022-12-18 09:38:54','juan@gmail.com,'),(113,'PROYECTO JUAN',1,12,'SODIMAC',1,2.00,'NADSA',23,'2022-11-20 10:23:25',454.00,451.00,12.00,'PERO','ADSASA','2022-12-19 06:25:17','prueba@gmail.com,');
/*!40000 ALTER TABLE `proy_proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proy_proyectoreportes`
--

DROP TABLE IF EXISTS `proy_proyectoreportes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proy_proyectoreportes` (
  `codUtilReportes` int(11) NOT NULL,
  `codProyecto` bigint(20) NOT NULL,
  `flagReporteMasivo` int(11) DEFAULT NULL,
  `codTipoFrecuencia` char(2) DEFAULT NULL,
  `dayFechaCreacion` datetime DEFAULT NULL,
  `desUsuarioCreacion` varchar(255) DEFAULT NULL,
  `desCorreoEnvios` varchar(255) DEFAULT NULL,
  `codfrecuenciaenvioreporte` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proy_proyectoreportes`
--

LOCK TABLES `proy_proyectoreportes` WRITE;
/*!40000 ALTER TABLE `proy_proyectoreportes` DISABLE KEYS */;
INSERT INTO `proy_proyectoreportes` VALUES (44,112,1,'LV','2022-12-18 09:38:54','','',1),(45,113,1,'LV','2022-12-19 06:25:17','','',1);
/*!40000 ALTER TABLE `proy_proyectoreportes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proy_rolintegrante`
--

DROP TABLE IF EXISTS `proy_rolintegrante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proy_rolintegrante` (
  `codRolIntegrante` int(11) NOT NULL,
  `desRolIntegrante` varchar(255) DEFAULT NULL,
  UNIQUE KEY `XPKProy_RolIntegrante` (`codRolIntegrante`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proy_rolintegrante`
--

LOCK TABLES `proy_rolintegrante` WRITE;
/*!40000 ALTER TABLE `proy_rolintegrante` DISABLE KEYS */;
INSERT INTO `proy_rolintegrante` VALUES (1,'Editor'),(2,'Visualizor');
/*!40000 ALTER TABLE `proy_rolintegrante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_cargo`
--

DROP TABLE IF EXISTS `sec_cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_cargo` (
  `codCargo` int(11) NOT NULL,
  `nameCargo` varchar(255) DEFAULT NULL,
  UNIQUE KEY `XPKSec_Cargo` (`codCargo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_cargo`
--

LOCK TABLES `sec_cargo` WRITE;
/*!40000 ALTER TABLE `sec_cargo` DISABLE KEYS */;
INSERT INTO `sec_cargo` VALUES (1,'Encargado'),(2,'Trabajador');
/*!40000 ALTER TABLE `sec_cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_membresia`
--

DROP TABLE IF EXISTS `sec_membresia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_membresia` (
  `codMembresia` bigint(20) NOT NULL,
  `desMembresia` varchar(255) DEFAULT NULL,
  `canDiasPrueba` int(11) DEFAULT NULL,
  `desMonto` varchar(255) DEFAULT NULL,
  `canProyectos` int(11) DEFAULT NULL,
  `desFrecuencia` varchar(255) DEFAULT NULL,
  UNIQUE KEY `XPKSec_Membresia` (`codMembresia`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_membresia`
--

LOCK TABLES `sec_membresia` WRITE;
/*!40000 ALTER TABLE `sec_membresia` DISABLE KEYS */;
/*!40000 ALTER TABLE `sec_membresia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_membresiausuario`
--

DROP TABLE IF EXISTS `sec_membresiausuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_membresiausuario` (
  `codMembresiaUsuario` bigint(20) NOT NULL,
  `id` bigint(20) NOT NULL,
  `codMembresia` bigint(20) NOT NULL,
  `dayFechaInicio` datetime DEFAULT NULL,
  `dayFechaFin` datetime DEFAULT NULL,
  `codEstado` int(11) DEFAULT NULL,
  `des_PagoVerificado` varchar(100) DEFAULT NULL,
  UNIQUE KEY `XPKSec_MembresiaUsuario` (`codMembresiaUsuario`,`id`,`codMembresia`) USING BTREE,
  KEY `XIF1Sec_MembresiaUsuario` (`id`) USING BTREE,
  KEY `XIF2Sec_MembresiaUsuario` (`codMembresia`) USING BTREE,
  CONSTRAINT `sec_membresiausuario_ibfk_1` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sec_membresiausuario_ibfk_2` FOREIGN KEY (`codMembresia`) REFERENCES `sec_membresia` (`codMembresia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_membresiausuario`
--

LOCK TABLES `sec_membresiausuario` WRITE;
/*!40000 ALTER TABLE `sec_membresiausuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `sec_membresiausuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `celular` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `nombreempresa` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `codCargo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `XPKusersidunique` (`id`) USING BTREE,
  UNIQUE KEY `users_email_unique` (`email`) USING BTREE,
  UNIQUE KEY `XPKuseremailunique` (`email`) USING BTREE,
  KEY `XIF1users` (`codCargo`) USING BTREE,
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`codCargo`) REFERENCES `sec_cargo` (`codCargo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (4,'AB','1234567890','CD','Free','abcd@abcd.com',NULL,'$2y$10$fYcUrydJqze3tPW9b37u7OTpjcHRJQvUXfjXYMVMEEBaN9DJV/1NO',NULL,'2022-11-08 11:00:02','2022-11-08 11:00:02',NULL),(5,'peter','123123123','peter','free','peter@p.com',NULL,'$2y$10$GueBt.76Dks1GaW.WNGlSuiBMSJTR.9OKn9t6bT6w0ihyg5.hcXYq',NULL,'2022-11-11 00:18:14','2022-11-11 00:18:14',NULL),(6,'James','1234567890','David','Free','james@d.com',NULL,'$2y$10$ffdn5MwekjzF3QM8jQATlefu4/TjY0/GdSPIbrCbk0.Y3BDLYd5Yu',NULL,'2022-11-15 09:22:22','2022-11-15 09:22:22',NULL),(7,'Peter','1231231231','Fawzy','Free','peter@peter.com',NULL,'$2y$10$YixvPeyUEGgbD1Nukz6MM.KuvlLUSMzYyGBF6OSWlcIoS6.G2e.iy',NULL,'2022-11-15 18:38:00','2022-11-15 18:38:00',NULL),(8,'Daniel Johnson','1234567890','Daniel','Free','Daniel@gmail.com',NULL,'$2y$10$8s5xke.qjVoqTrdhdyZgne6mlRNGCPGZ7fR5npayZlWeyZjR6a0Jy',NULL,'2022-11-23 21:33:01','2022-11-23 21:33:01',NULL),(9,'diego','9284232','warthon','sodimac','diego@gmail.com',NULL,'$2y$10$eYOuZbGzbvwbQwl8/L6vh./VDlzd2i.vVU5iZjh7/i4bQAS0Fa2a6',NULL,'2022-12-01 07:16:59','2022-12-01 07:16:59',NULL),(10,'pedro','6456455','veremo','sodimca','pedro@gmail.com',NULL,'$2y$10$kYxEEtzFJlJ.X.vU8ZRMau92a0iGJvRnqCQz3gu7kEBI445fxSORK',NULL,'2022-12-14 17:22:35','2022-12-14 17:22:35',NULL),(11,'cristina','64841111','veremo','sodimac','cristina@gmail.com',NULL,'$2y$10$vmQBbwYxmSup.KC0gLvbYOrDMMqbHP2SDf/sB16TB7qgK2Mu2A24u',NULL,'2022-12-14 17:25:15','2022-12-14 17:25:15',2),(12,'uan','9855652','sotomayot','sodimac','juan@gmail.com',NULL,'$2y$10$RSTpc6k3.Dv.StS73.RZg.8BwHbxX30zEXQtz9wzdYhu3BzlkOyd.',NULL,'2022-12-19 16:24:06','2022-12-19 16:24:06',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `util_reportes`
--

DROP TABLE IF EXISTS `util_reportes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `util_reportes` (
  `codUtilReportes` int(11) NOT NULL AUTO_INCREMENT,
  `desUtilReportes` varchar(255) DEFAULT NULL,
  `desDirReporte` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codUtilReportes`) USING BTREE,
  UNIQUE KEY `XPKUtil_Reportes` (`codUtilReportes`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `util_reportes`
--

LOCK TABLES `util_reportes` WRITE;
/*!40000 ALTER TABLE `util_reportes` DISABLE KEYS */;
INSERT INTO `util_reportes` VALUES (1,'Reporte de análisis de restricciones',NULL),(5,'Reporte de análisis de restricciones',NULL),(10,'Reporte de análisis de restricciones',NULL),(11,'Reporte de avance gráfico',NULL),(12,'Reporte de análisis de restricciones',NULL),(13,'Reporte de avance gráfico',NULL),(14,'Reporte de análisis de restricciones',NULL),(15,'Reporte de avance gráfico',NULL),(16,'Reporte de análisis de restricciones',NULL),(17,'Reporte de análisis de restricciones',NULL),(18,'Reporte de avance gráfico',NULL),(19,'Reporte de análisis de restricciones',NULL),(36,'Reporte de análisis de restricciones',NULL),(37,'Reporte de análisis de restricciones',NULL),(38,'Reporte de análisis de restricciones',NULL),(39,'Reporte de avance gráfico',NULL),(40,'Reporte de análisis de restricciones',NULL),(41,'Reporte de análisis de restricciones',NULL),(42,'Reporte de análisis de restricciones',NULL),(43,'Reporte de análisis de restricciones',NULL),(44,'Reporte de análisis de restricciones',NULL),(45,'Reporte de análisis de restricciones',NULL);
/*!40000 ALTER TABLE `util_reportes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'appdb15'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-22 12:11:17
