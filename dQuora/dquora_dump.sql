-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: dQuora
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (3,'user_rights');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (7,3,9),(8,3,10),(9,3,11),(10,3,12);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add user',1,'add_customuser'),(2,'Can change user',1,'change_customuser'),(3,'Can delete user',1,'delete_customuser'),(4,'Can view user',1,'view_customuser'),(5,'Can add category',2,'add_category'),(6,'Can change category',2,'change_category'),(7,'Can delete category',2,'delete_category'),(8,'Can view category',2,'view_category'),(9,'Can add post',3,'add_post'),(10,'Can change post',3,'change_post'),(11,'Can delete post',3,'delete_post'),(12,'Can view post',3,'view_post'),(13,'Can add comment',4,'add_comment'),(14,'Can change comment',4,'change_comment'),(15,'Can delete comment',4,'delete_comment'),(16,'Can view comment',4,'view_comment'),(17,'Can add log entry',5,'add_logentry'),(18,'Can change log entry',5,'change_logentry'),(19,'Can delete log entry',5,'delete_logentry'),(20,'Can view log entry',5,'view_logentry'),(21,'Can add permission',6,'add_permission'),(22,'Can change permission',6,'change_permission'),(23,'Can delete permission',6,'delete_permission'),(24,'Can view permission',6,'view_permission'),(25,'Can add group',7,'add_group'),(26,'Can change group',7,'change_group'),(27,'Can delete group',7,'delete_group'),(28,'Can view group',7,'view_group'),(29,'Can add content type',8,'add_contenttype'),(30,'Can change content type',8,'change_contenttype'),(31,'Can delete content type',8,'delete_contenttype'),(32,'Can view content type',8,'view_contenttype'),(33,'Can add session',9,'add_session'),(34,'Can change session',9,'change_session'),(35,'Can delete session',9,'delete_session'),(36,'Can view session',9,'view_session'),(37,'Can add spaces',10,'add_spaces'),(38,'Can change spaces',10,'change_spaces'),(39,'Can delete spaces',10,'delete_spaces'),(40,'Can view spaces',10,'view_spaces'),(41,'Can add message',11,'add_message'),(42,'Can change message',11,'change_message'),(43,'Can delete message',11,'delete_message'),(44,'Can view message',11,'view_message');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_quora_customuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_quora_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `quora_customuser` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=263 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-06-02 09:23:52.965479','1','General',1,'[{\"added\": {}}]',2,1),(2,'2024-06-02 09:23:59.769936','2','Maths',1,'[{\"added\": {}}]',2,1),(3,'2024-06-02 09:27:52.056045','1','post object (1)',3,'',3,1),(4,'2024-06-02 10:42:58.855731','1','rudeus',2,'[{\"changed\": {\"fields\": [\"Avatar\"]}}]',1,1),(5,'2024-06-02 17:07:35.946918','2','post object (2)',3,'',3,1),(6,'2024-06-02 17:58:38.761488','14','post object (14)',1,'[{\"added\": {}}]',3,1),(7,'2024-06-02 18:09:51.723002','19','post object (19)',3,'',3,1),(8,'2024-06-02 18:09:51.730422','18','post object (18)',3,'',3,1),(9,'2024-06-02 18:09:51.733424','17','post object (17)',3,'',3,1),(10,'2024-06-02 18:09:51.737974','16','post object (16)',3,'',3,1),(11,'2024-06-02 18:09:51.741369','15','post object (15)',3,'',3,1),(12,'2024-06-02 18:09:51.744515','14','post object (14)',3,'',3,1),(13,'2024-06-02 18:09:51.747539','13','post object (13)',3,'',3,1),(14,'2024-06-02 18:09:51.749701','12','post object (12)',3,'',3,1),(15,'2024-06-02 18:09:51.751173','11','post object (11)',3,'',3,1),(16,'2024-06-02 18:09:51.751173','10','post object (10)',3,'',3,1),(17,'2024-06-02 18:09:51.751173','9','post object (9)',3,'',3,1),(18,'2024-06-03 14:29:58.934107','1','comment object (1)',1,'[{\"added\": {}}]',4,1),(19,'2024-06-05 06:56:15.280857','1','rudeus',2,'[{\"changed\": {\"fields\": [\"Bio\"]}}]',1,1),(20,'2024-06-05 06:56:47.425410','2','knucklehead',2,'[{\"changed\": {\"fields\": [\"Bio\"]}}]',1,1),(21,'2024-06-05 15:24:39.567973','3','levi',2,'[{\"changed\": {\"fields\": [\"User permissions\"]}}]',1,1),(22,'2024-06-05 15:26:01.413210','1','mod',3,'',7,1),(23,'2024-06-05 15:26:34.211636','2','user_rights',1,'[{\"added\": {}}]',7,1),(24,'2024-06-05 15:38:30.127970','4','Baki',2,'[{\"changed\": {\"fields\": [\"User permissions\"]}}]',1,1),(25,'2024-06-05 16:40:50.636516','2','user_rights',3,'',7,1),(26,'2024-06-05 17:07:10.216951','3','user_rights',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',7,1),(27,'2024-06-05 18:03:38.703608','3','levi',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',1,1),(28,'2024-06-06 18:55:46.591061','3','levi',2,'[{\"changed\": {\"fields\": [\"User permissions\"]}}]',1,1),(29,'2024-06-07 17:36:12.064333','1','spaces object (1)',1,'[{\"added\": {}}]',10,1),(30,'2024-06-08 13:22:02.389723','2','spaces object (2)',1,'[{\"added\": {}}]',10,1),(31,'2024-06-08 15:20:21.242237','53','Message object (53)',2,'[{\"changed\": {\"fields\": [\"Message\"]}}]',11,1),(32,'2024-06-08 15:36:17.190023','58','Message object (58)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',11,1),(33,'2024-06-08 18:24:23.416368','58','Message object (58)',2,'[{\"changed\": {\"fields\": [\"Message\"]}}]',11,1),(34,'2024-06-08 18:24:31.069833','78','Message object (78)',2,'[{\"changed\": {\"fields\": [\"Message\"]}}]',11,1),(35,'2024-06-08 18:24:44.383195','78','Message object (78)',2,'[{\"changed\": {\"fields\": [\"Message\"]}}]',11,1),(36,'2024-06-09 17:48:15.006547','1','spaces object (1)',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',10,1),(37,'2024-06-10 05:02:33.546969','27','post object (27)',3,'',3,1),(38,'2024-06-10 05:02:33.551742','24','post object (24)',3,'',3,1),(39,'2024-06-10 05:06:04.638868','33','post object (33)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,1),(40,'2024-06-10 05:06:52.933024','33','post object (33)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,1),(41,'2024-06-10 05:09:00.435161','33','post object (33)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,1),(42,'2024-06-10 05:09:12.884760','33','post object (33)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,1),(43,'2024-06-26 13:53:06.641835','3','spaces object (3)',1,'[{\"added\": {}}]',10,1),(44,'2024-06-26 14:35:32.480097','1','General',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',2,1),(45,'2024-06-26 14:35:37.580762','2','Maths',2,'[]',2,1),(46,'2024-06-26 14:35:46.849238','2','Maths',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',2,1),(47,'2024-06-26 14:59:32.759408','103','comment object (103)',3,'',4,1),(48,'2024-06-26 14:59:32.765385','102','comment object (102)',3,'',4,1),(49,'2024-06-26 14:59:32.769384','101','comment object (101)',3,'',4,1),(50,'2024-06-26 14:59:32.773383','100','comment object (100)',3,'',4,1),(51,'2024-06-26 14:59:32.777377','99','comment object (99)',3,'',4,1),(52,'2024-06-26 14:59:32.780375','98','comment object (98)',3,'',4,1),(53,'2024-06-26 14:59:44.936621','191','Message object (191)',3,'',11,1),(54,'2024-06-26 14:59:44.940931','190','Message object (190)',3,'',11,1),(55,'2024-06-26 14:59:44.944316','189','Message object (189)',3,'',11,1),(56,'2024-06-26 14:59:44.948319','188','Message object (188)',3,'',11,1),(57,'2024-06-26 14:59:44.954331','187','Message object (187)',3,'',11,1),(58,'2024-06-26 14:59:44.957439','186','Message object (186)',3,'',11,1),(59,'2024-06-26 14:59:44.960440','185','Message object (185)',3,'',11,1),(60,'2024-06-26 14:59:44.963041','184','Message object (184)',3,'',11,1),(61,'2024-06-26 14:59:44.968042','183','Message object (183)',3,'',11,1),(62,'2024-06-26 14:59:44.971279','182','Message object (182)',3,'',11,1),(63,'2024-06-26 14:59:44.975033','181','Message object (181)',3,'',11,1),(64,'2024-06-26 14:59:44.978030','180','Message object (180)',3,'',11,1),(65,'2024-06-26 14:59:44.981029','179','Message object (179)',3,'',11,1),(66,'2024-06-26 14:59:44.985025','178','Message object (178)',3,'',11,1),(67,'2024-06-26 14:59:44.988022','177','Message object (177)',3,'',11,1),(68,'2024-06-26 14:59:44.991042','176','Message object (176)',3,'',11,1),(69,'2024-06-26 14:59:44.995019','175','Message object (175)',3,'',11,1),(70,'2024-06-26 14:59:44.999018','174','Message object (174)',3,'',11,1),(71,'2024-06-26 14:59:45.002015','173','Message object (173)',3,'',11,1),(72,'2024-06-26 14:59:45.005013','172','Message object (172)',3,'',11,1),(73,'2024-06-26 14:59:45.008033','171','Message object (171)',3,'',11,1),(74,'2024-06-26 14:59:45.011011','170','Message object (170)',3,'',11,1),(75,'2024-06-26 14:59:45.015008','169','Message object (169)',3,'',11,1),(76,'2024-06-26 14:59:45.019006','168','Message object (168)',3,'',11,1),(77,'2024-06-26 14:59:45.022006','167','Message object (167)',3,'',11,1),(78,'2024-06-26 14:59:45.025001','166','Message object (166)',3,'',11,1),(79,'2024-06-26 14:59:45.027999','165','Message object (165)',3,'',11,1),(80,'2024-06-26 14:59:45.031998','164','Message object (164)',3,'',11,1),(81,'2024-06-26 14:59:45.036995','163','Message object (163)',3,'',11,1),(82,'2024-06-26 14:59:45.040993','162','Message object (162)',3,'',11,1),(83,'2024-06-26 14:59:45.044990','161','Message object (161)',3,'',11,1),(84,'2024-06-26 14:59:45.046989','160','Message object (160)',3,'',11,1),(85,'2024-06-26 14:59:45.052985','159','Message object (159)',3,'',11,1),(86,'2024-06-26 14:59:45.055985','158','Message object (158)',3,'',11,1),(87,'2024-06-26 14:59:45.058983','157','Message object (157)',3,'',11,1),(88,'2024-06-26 14:59:45.061982','156','Message object (156)',3,'',11,1),(89,'2024-06-26 14:59:45.065979','155','Message object (155)',3,'',11,1),(90,'2024-06-26 14:59:45.068977','154','Message object (154)',3,'',11,1),(91,'2024-06-26 14:59:45.071974','153','Message object (153)',3,'',11,1),(92,'2024-06-26 14:59:45.074973','152','Message object (152)',3,'',11,1),(93,'2024-06-26 14:59:45.077973','151','Message object (151)',3,'',11,1),(94,'2024-06-26 14:59:45.080971','150','Message object (150)',3,'',11,1),(95,'2024-06-26 14:59:45.084968','149','Message object (149)',3,'',11,1),(96,'2024-06-26 14:59:45.087967','148','Message object (148)',3,'',11,1),(97,'2024-06-26 14:59:45.089964','147','Message object (147)',3,'',11,1),(98,'2024-06-26 14:59:45.092965','146','Message object (146)',3,'',11,1),(99,'2024-06-26 14:59:45.095963','145','Message object (145)',3,'',11,1),(100,'2024-06-26 14:59:45.100959','144','Message object (144)',3,'',11,1),(101,'2024-06-26 14:59:45.103959','143','Message object (143)',3,'',11,1),(102,'2024-06-26 14:59:45.106956','142','Message object (142)',3,'',11,1),(103,'2024-06-26 14:59:45.109952','141','Message object (141)',3,'',11,1),(104,'2024-06-26 14:59:45.112951','140','Message object (140)',3,'',11,1),(105,'2024-06-26 14:59:45.115950','139','Message object (139)',3,'',11,1),(106,'2024-06-26 14:59:45.118951','138','Message object (138)',3,'',11,1),(107,'2024-06-26 14:59:45.121947','137','Message object (137)',3,'',11,1),(108,'2024-06-26 14:59:45.124944','136','Message object (136)',3,'',11,1),(109,'2024-06-26 14:59:45.126945','135','Message object (135)',3,'',11,1),(110,'2024-06-26 14:59:45.129941','134','Message object (134)',3,'',11,1),(111,'2024-06-26 14:59:45.132941','133','Message object (133)',3,'',11,1),(112,'2024-06-26 14:59:45.135938','132','Message object (132)',3,'',11,1),(113,'2024-06-26 14:59:45.138937','131','Message object (131)',3,'',11,1),(114,'2024-06-26 14:59:45.141935','130','Message object (130)',3,'',11,1),(115,'2024-06-26 14:59:45.144933','129','Message object (129)',3,'',11,1),(116,'2024-06-26 14:59:45.146933','128','Message object (128)',3,'',11,1),(117,'2024-06-26 14:59:45.151929','127','Message object (127)',3,'',11,1),(118,'2024-06-26 14:59:45.155927','126','Message object (126)',3,'',11,1),(119,'2024-06-26 14:59:45.159924','125','Message object (125)',3,'',11,1),(120,'2024-06-26 14:59:45.162924','124','Message object (124)',3,'',11,1),(121,'2024-06-26 14:59:45.167920','123','Message object (123)',3,'',11,1),(122,'2024-06-26 14:59:45.172917','122','Message object (122)',3,'',11,1),(123,'2024-06-26 14:59:45.177914','121','Message object (121)',3,'',11,1),(124,'2024-06-26 14:59:45.181912','120','Message object (120)',3,'',11,1),(125,'2024-06-26 14:59:45.186909','119','Message object (119)',3,'',11,1),(126,'2024-06-26 14:59:45.191907','118','Message object (118)',3,'',11,1),(127,'2024-06-26 14:59:45.196903','117','Message object (117)',3,'',11,1),(128,'2024-06-26 14:59:45.202899','116','Message object (116)',3,'',11,1),(129,'2024-06-26 14:59:45.206900','115','Message object (115)',3,'',11,1),(130,'2024-06-26 14:59:45.209897','114','Message object (114)',3,'',11,1),(131,'2024-06-26 14:59:45.212896','113','Message object (113)',3,'',11,1),(132,'2024-06-26 14:59:45.216893','112','Message object (112)',3,'',11,1),(133,'2024-06-26 14:59:45.219891','111','Message object (111)',3,'',11,1),(134,'2024-06-26 14:59:45.222890','110','Message object (110)',3,'',11,1),(135,'2024-06-26 14:59:45.225886','109','Message object (109)',3,'',11,1),(136,'2024-06-26 14:59:45.227887','108','Message object (108)',3,'',11,1),(137,'2024-06-26 14:59:45.230887','107','Message object (107)',3,'',11,1),(138,'2024-06-26 14:59:45.235884','106','Message object (106)',3,'',11,1),(139,'2024-06-26 14:59:45.237879','105','Message object (105)',3,'',11,1),(140,'2024-06-26 14:59:45.240877','104','Message object (104)',3,'',11,1),(141,'2024-06-26 14:59:45.243876','103','Message object (103)',3,'',11,1),(142,'2024-06-26 14:59:45.246877','102','Message object (102)',3,'',11,1),(143,'2024-06-26 14:59:45.249874','101','Message object (101)',3,'',11,1),(144,'2024-06-26 14:59:45.252873','100','Message object (100)',3,'',11,1),(145,'2024-06-26 14:59:45.255871','99','Message object (99)',3,'',11,1),(146,'2024-06-26 14:59:45.257871','98','Message object (98)',3,'',11,1),(147,'2024-06-26 14:59:45.260869','97','Message object (97)',3,'',11,1),(148,'2024-06-26 14:59:45.262868','96','Message object (96)',3,'',11,1),(149,'2024-06-26 14:59:45.266862','95','Message object (95)',3,'',11,1),(150,'2024-06-26 14:59:45.270862','94','Message object (94)',3,'',11,1),(151,'2024-06-26 14:59:45.272862','93','Message object (93)',3,'',11,1),(152,'2024-06-26 14:59:45.275861','92','Message object (92)',3,'',11,1),(153,'2024-06-26 15:00:01.238416','12','Drake',3,'',1,1),(154,'2024-06-26 15:00:01.242432','11','jyoung',3,'',1,1),(155,'2024-06-26 15:00:01.247430','10','Rudeus_Gr',3,'',1,1),(156,'2024-06-26 15:00:01.250438','9','asdasd',3,'',1,1),(157,'2024-06-26 15:00:01.253697','8','sfsdfsd',3,'',1,1),(158,'2024-06-26 15:00:01.255970','7','Paul',3,'',1,1),(159,'2024-06-26 15:00:01.259562','6','Miskasa',3,'',1,1),(160,'2024-06-26 15:00:01.264435','5','Rudeus_Greyrat',3,'',1,1),(161,'2024-06-26 15:00:01.267433','4','Baki',3,'',1,1),(162,'2024-06-26 15:00:01.270444','2','knucklehead',3,'',1,1),(163,'2024-06-26 15:00:06.510939','3','levi',3,'',1,1),(164,'2024-06-26 15:00:21.458429','91','Message object (91)',3,'',11,1),(165,'2024-06-26 15:00:21.462427','90','Message object (90)',3,'',11,1),(166,'2024-06-26 15:00:21.465442','89','Message object (89)',3,'',11,1),(167,'2024-06-26 15:00:21.468920','88','Message object (88)',3,'',11,1),(168,'2024-06-26 15:00:21.472595','87','Message object (87)',3,'',11,1),(169,'2024-06-26 15:00:21.475910','86','Message object (86)',3,'',11,1),(170,'2024-06-26 15:00:21.479075','85','Message object (85)',3,'',11,1),(171,'2024-06-26 15:00:21.481960','84','Message object (84)',3,'',11,1),(172,'2024-06-26 15:00:21.484930','83','Message object (83)',3,'',11,1),(173,'2024-06-26 15:00:21.488924','82','Message object (82)',3,'',11,1),(174,'2024-06-26 15:00:21.492242','81','Message object (81)',3,'',11,1),(175,'2024-06-26 15:00:21.495600','80','Message object (80)',3,'',11,1),(176,'2024-06-26 15:00:21.498628','79','Message object (79)',3,'',11,1),(177,'2024-06-26 15:00:21.501623','78','Message object (78)',3,'',11,1),(178,'2024-06-26 15:00:21.504633','77','Message object (77)',3,'',11,1),(179,'2024-06-26 15:00:21.509675','76','Message object (76)',3,'',11,1),(180,'2024-06-26 15:00:21.515370','75','Message object (75)',3,'',11,1),(181,'2024-06-26 15:00:21.517698','74','Message object (74)',3,'',11,1),(182,'2024-06-26 15:00:21.520870','73','Message object (73)',3,'',11,1),(183,'2024-06-26 15:00:21.524631','72','Message object (72)',3,'',11,1),(184,'2024-06-26 15:00:21.527955','71','Message object (71)',3,'',11,1),(185,'2024-06-26 15:00:21.529957','70','Message object (70)',3,'',11,1),(186,'2024-06-26 15:00:21.533056','69','Message object (69)',3,'',11,1),(187,'2024-06-26 15:00:21.535657','68','Message object (68)',3,'',11,1),(188,'2024-06-26 15:00:21.538660','67','Message object (67)',3,'',11,1),(189,'2024-06-26 15:00:21.542527','66','Message object (66)',3,'',11,1),(190,'2024-06-26 15:00:21.545642','65','Message object (65)',3,'',11,1),(191,'2024-06-26 15:00:21.548589','64','Message object (64)',3,'',11,1),(192,'2024-06-26 15:00:21.551607','63','Message object (63)',3,'',11,1),(193,'2024-06-26 15:00:21.555591','62','Message object (62)',3,'',11,1),(194,'2024-06-26 15:00:21.558535','61','Message object (61)',3,'',11,1),(195,'2024-06-26 15:00:21.561979','60','Message object (60)',3,'',11,1),(196,'2024-06-26 15:00:21.565080','59','Message object (59)',3,'',11,1),(197,'2024-06-26 15:00:21.568397','58','Message object (58)',3,'',11,1),(198,'2024-06-26 15:00:21.571152','57','Message object (57)',3,'',11,1),(199,'2024-06-26 15:00:21.575652','56','Message object (56)',3,'',11,1),(200,'2024-06-26 15:00:21.578719','55','Message object (55)',3,'',11,1),(201,'2024-06-26 15:00:21.581722','54','Message object (54)',3,'',11,1),(202,'2024-06-26 15:00:21.584829','53','Message object (53)',3,'',11,1),(203,'2024-06-26 15:00:21.587726','52','Message object (52)',3,'',11,1),(204,'2024-06-26 15:00:21.591568','51','Message object (51)',3,'',11,1),(205,'2024-06-26 15:00:21.594263','50','Message object (50)',3,'',11,1),(206,'2024-06-26 15:00:21.596533','49','Message object (49)',3,'',11,1),(207,'2024-06-26 15:00:21.599607','48','Message object (48)',3,'',11,1),(208,'2024-06-26 15:00:21.601609','47','Message object (47)',3,'',11,1),(209,'2024-06-26 15:00:21.605610','46','Message object (46)',3,'',11,1),(210,'2024-06-26 15:00:21.608605','45','Message object (45)',3,'',11,1),(211,'2024-06-26 15:00:21.614986','44','Message object (44)',3,'',11,1),(212,'2024-06-26 15:00:21.618288','43','Message object (43)',3,'',11,1),(213,'2024-06-26 15:00:21.622319','42','Message object (42)',3,'',11,1),(214,'2024-06-26 15:00:21.625326','41','Message object (41)',3,'',11,1),(215,'2024-06-26 15:00:21.628416','40','Message object (40)',3,'',11,1),(216,'2024-06-26 15:00:21.631838','39','Message object (39)',3,'',11,1),(217,'2024-06-26 15:00:21.634847','38','Message object (38)',3,'',11,1),(218,'2024-06-26 15:00:21.638783','37','Message object (37)',3,'',11,1),(219,'2024-06-26 15:00:21.642417','35','Message object (35)',3,'',11,1),(220,'2024-06-26 15:00:21.645524','33','Message object (33)',3,'',11,1),(221,'2024-06-26 15:00:21.648457','32','Message object (32)',3,'',11,1),(222,'2024-06-26 15:00:21.651636','31','Message object (31)',3,'',11,1),(223,'2024-06-26 15:00:21.655485','30','Message object (30)',3,'',11,1),(224,'2024-06-26 15:00:21.658658','29','Message object (29)',3,'',11,1),(225,'2024-06-26 15:00:21.661658','28','Message object (28)',3,'',11,1),(226,'2024-06-26 15:00:21.665655','27','Message object (27)',3,'',11,1),(227,'2024-06-26 15:00:21.668664','26','Message object (26)',3,'',11,1),(228,'2024-06-26 15:00:21.672666','25','Message object (25)',3,'',11,1),(229,'2024-06-26 15:00:21.676219','24','Message object (24)',3,'',11,1),(230,'2024-06-26 15:00:21.679482','23','Message object (23)',3,'',11,1),(231,'2024-06-26 15:00:21.682351','22','Message object (22)',3,'',11,1),(232,'2024-06-26 15:00:21.685581','21','Message object (21)',3,'',11,1),(233,'2024-06-26 15:00:21.690699','20','Message object (20)',3,'',11,1),(234,'2024-06-26 15:00:21.693692','19','Message object (19)',3,'',11,1),(235,'2024-06-26 15:00:21.697139','18','Message object (18)',3,'',11,1),(236,'2024-06-26 15:00:21.700138','17','Message object (17)',3,'',11,1),(237,'2024-06-26 15:00:21.703142','16','Message object (16)',3,'',11,1),(238,'2024-06-26 15:00:21.707134','15','Message object (15)',3,'',11,1),(239,'2024-06-26 15:00:21.711131','14','Message object (14)',3,'',11,1),(240,'2024-06-26 15:00:21.714129','13','Message object (13)',3,'',11,1),(241,'2024-06-26 15:00:21.717128','12','Message object (12)',3,'',11,1),(242,'2024-06-26 15:00:21.720129','11','Message object (11)',3,'',11,1),(243,'2024-06-26 15:00:21.724145','10','Message object (10)',3,'',11,1),(244,'2024-06-26 15:00:21.727144','9','Message object (9)',3,'',11,1),(245,'2024-06-26 15:00:21.730120','8','Message object (8)',3,'',11,1),(246,'2024-06-26 15:00:21.733119','7','Message object (7)',3,'',11,1),(247,'2024-06-26 15:00:21.736117','6','Message object (6)',3,'',11,1),(248,'2024-06-26 15:00:21.739116','3','Message object (3)',3,'',11,1),(249,'2024-06-26 15:00:21.742116','2','Message object (2)',3,'',11,1),(250,'2024-06-26 15:00:21.745113','1','Message object (1)',3,'',11,1),(251,'2024-06-26 15:00:32.679860','33','post object (33)',3,'',3,1),(252,'2024-06-26 15:00:32.683672','32','post object (32)',3,'',3,1),(253,'2024-06-26 15:00:32.689106','25','post object (25)',3,'',3,1),(254,'2024-06-26 15:03:55.500933','4','spaces object (4)',1,'[{\"added\": {}}]',10,1),(255,'2024-06-26 15:05:08.171314','5','spaces object (5)',1,'[{\"added\": {}}]',10,1),(256,'2024-06-26 15:06:05.776300','6','spaces object (6)',1,'[{\"added\": {}}]',10,1),(257,'2024-06-26 15:07:20.348427','5','spaces object (5)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',10,1),(258,'2024-06-26 15:07:52.704464','2','spaces object (2)',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',10,1),(259,'2024-06-26 17:54:29.899311','110','comment object (110)',3,'',4,1),(260,'2024-06-26 17:54:29.907328','109','comment object (109)',3,'',4,1),(261,'2024-06-26 17:54:29.907328','108','comment object (108)',3,'',4,1),(262,'2024-06-26 17:54:29.915325','107','comment object (107)',3,'',4,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (5,'admin','logentry'),(7,'auth','group'),(6,'auth','permission'),(8,'contenttypes','contenttype'),(2,'quora','category'),(4,'quora','comment'),(1,'quora','customuser'),(11,'quora','message'),(3,'quora','post'),(10,'quora','spaces'),(9,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-06-02 09:20:44.353646'),(2,'contenttypes','0002_remove_content_type_name','2024-06-02 09:20:44.456631'),(3,'auth','0001_initial','2024-06-02 09:20:44.818331'),(4,'auth','0002_alter_permission_name_max_length','2024-06-02 09:20:44.906642'),(5,'auth','0003_alter_user_email_max_length','2024-06-02 09:20:44.906642'),(6,'auth','0004_alter_user_username_opts','2024-06-02 09:20:44.926593'),(7,'auth','0005_alter_user_last_login_null','2024-06-02 09:20:44.936838'),(8,'auth','0006_require_contenttypes_0002','2024-06-02 09:20:44.942157'),(9,'auth','0007_alter_validators_add_error_messages','2024-06-02 09:20:44.953825'),(10,'auth','0008_alter_user_username_max_length','2024-06-02 09:20:44.969921'),(11,'auth','0009_alter_user_last_name_max_length','2024-06-02 09:20:44.980416'),(12,'auth','0010_alter_group_name_max_length','2024-06-02 09:20:45.006757'),(13,'auth','0011_update_proxy_permissions','2024-06-02 09:20:45.019269'),(14,'auth','0012_alter_user_first_name_max_length','2024-06-02 09:20:45.028254'),(15,'quora','0001_initial','2024-06-02 09:20:45.840995'),(16,'admin','0001_initial','2024-06-02 09:20:46.034948'),(17,'admin','0002_logentry_remove_auto_add','2024-06-02 09:20:46.050573'),(18,'admin','0003_logentry_add_action_flag_choices','2024-06-02 09:20:46.077876'),(19,'sessions','0001_initial','2024-06-02 09:20:46.131004'),(20,'quora','0002_alter_post_content','2024-06-02 17:43:08.996366'),(21,'quora','0003_alter_post_categories','2024-06-02 18:00:23.735793'),(22,'quora','0004_rename_post_comment_post','2024-06-03 17:33:17.873342'),(23,'quora','0005_customuser_bio_customuser_joined','2024-06-05 06:39:13.162421'),(24,'quora','0006_alter_customuser_bio','2024-06-05 06:57:01.137962'),(25,'quora','0007_spaces_message','2024-06-07 17:29:22.482165'),(26,'quora','0008_alter_message_image','2024-06-08 17:31:02.733493'),(27,'quora','0009_alter_post_image','2024-06-10 05:06:35.756643'),(28,'quora','0010_alter_post_image','2024-06-10 05:08:51.380646'),(29,'quora','0011_alter_category_image_alter_post_content','2024-06-26 16:49:21.977886'),(30,'quora','0012_alter_comment_content','2024-06-26 17:53:19.551600');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0iucb1iy0jqd4fnvkkerhrlmkx75lu29','.eJxVjDEOAiEQRe9CbQgwIGJp7xnIwAyyaiBZdivj3XWTLbT9773_EhHXpcZ18BwnEmehxeF3S5gf3DZAd2y3LnNvyzwluSlyp0NeO_Hzsrt_BxVH_dZZgU4YLMAxeMM2kTXACVCBswW1O2nnlSbGYnxxJQOZ7Ei5wCWE5MX7A9GpN8o:1sFAHk:vM4TTi2cXnCqq--2i2EESXVibsOKRanl-p0r3qKQKFg','2024-06-20 10:23:56.220908'),('1gdamyh52g2ca2a7by14s394ug3f85fa','.eJxVjEEOwiAQAP_C2RCgZQsevfcNZFm2UjWQlPZk_Lsh6UGvM5N5i4DHnsPReAtrElehxeWXRaQnly7SA8u9Sqpl39YoeyJP2-RcE79uZ_s3yNhy37K2CfzorUWjrGdkYyflozLe0zCMoIgjwgQE5EDH6IyjgRaD4NKixOcLwpk3eA:1sMXoi:wojJ33TJFUrwVqHKGO2w9D83tkhnAo1BKvZa2ZJTrBI','2024-07-10 18:56:28.559766'),('1ktx1qrara9z6j35wngf9r4b71id2jq2','.eJxVjM0OwiAQhN-FsyH8lLV49N5nIAu7laqBpLQn47srSQ96m8z3zbxEwH3LYW-8hoXERehBnH7LiOnBpRO6Y7lVmWrZ1iXKrsiDNjlV4uf1cP8OMrb8XdtRD5YZOWoHZ3Y9WALlEAx5mCMZM2hwFi0lGgGVseydY5V8NDOI9wcM3Tgp:1sMXpX:7fps67pK8uRCQMTrjLMZ8VrvcB-hbuCdJ0eHIrbYfBE','2024-07-10 18:57:19.490245'),('43geuqotcns2pv0pd8jr8z7qsjaeflqp','.eJxVjEEOwiAQAP_C2RCgZQsevfcNZFm2UjWQlPZk_Lsh6UGvM5N5i4DHnsPReAtrElehxeWXRaQnly7SA8u9Sqpl39YoeyJP2-RcE79uZ_s3yNhy37K2CfzorUWjrGdkYyflozLe0zCMoIgjwgQE5EDH6IyjgRaD4NKixOcLwpk3eA:1sMWqH:aQ0ADVW7RhmxrqczeMjgJBgmFumvSXB1JonnfBn28Y0','2024-07-10 17:54:01.636400'),('4wi9uyzxht9sycdj5jp61g85qqm9glii','.eJxVjDEOAiEQRe9CbQgwIGJp7xnIwAyyaiBZdivj3XWTLbT9773_EhHXpcZ18BwnEmehxeF3S5gf3DZAd2y3LnNvyzwluSlyp0NeO_Hzsrt_BxVH_dZZgU4YLMAxeMM2kTXACVCBswW1O2nnlSbGYnxxJQOZ7Ei5wCWE5MX7A9GpN8o:1sFETx:uI0vdKX7N8fjeBInug1JIpOz2MAD_g42WUyXlVAzfDk','2024-06-20 14:52:49.499121'),('58v8skeu1i7dhin10er6w39dvxqebqzi','.eJxVjEEOwiAQAP_C2RCgZQsevfcNZFm2UjWQlPZk_Lsh6UGvM5N5i4DHnsPReAtrElehxeWXRaQnly7SA8u9Sqpl39YoeyJP2-RcE79uZ_s3yNhy37K2CfzorUWjrGdkYyflozLe0zCMoIgjwgQE5EDH6IyjgRaD4NKixOcLwpk3eA:1sGZNP:c5yQe8urPzI5jKs57EpJzJZIxuz55yQj_VBu-nk3pzQ','2024-06-24 07:23:35.802018'),('8b8ce5d7dembv4iz1gs6fqe7mdbbfu0z','.eJxVjDEOAiEQRe9CbQgwIGJp7xnIwAyyaiBZdivj3XWTLbT9773_EhHXpcZ18BwnEmehxeF3S5gf3DZAd2y3LnNvyzwluSlyp0NeO_Hzsrt_BxVH_dZZgU4YLMAxeMM2kTXACVCBswW1O2nnlSbGYnxxJQOZ7Ei5wCWE5MX7A9GpN8o:1sFEWJ:MtIP0d_w7977mvJZINbqkt9Z1N0jTd_yCiVhfiBC53E','2024-06-20 14:55:15.842938'),('9cga3w5rqpji6n0px1b5lwyotiodsh2n','.eJxVjEEOwiAQRe_C2pDBaQVcuvcMZGAYqRpISrsy3l2bdKHb_977LxVoXUpYe57DxOqsUB1-t0jpkesG-E711nRqdZmnqDdF77Tra-P8vOzu30GhXr41eRwFvAC444nAWMORxTKKS96RZRloQATIowFjUgZEDwgS0SI7q94f1YY3MA:1sEuRZ:a8NdkqsPlHesmYgMp6ZIPP5cpVxNdGZK2eVGpmA4oXQ','2024-06-19 17:29:01.003047'),('a509307dhmtvrxk1i08pg09zlltxyqy8','.eJxVjEEOwiAQRe_C2pDBaQVcuvcMZGAYqRpISrsy3l2bdKHb_977LxVoXUpYe57DxOqsUB1-t0jpkesG-E711nRqdZmnqDdF77Tra-P8vOzu30GhXr41eRwFvAC444nAWMORxTKKS96RZRloQATIowFjUgZEDwgS0SI7q94f1YY3MA:1sFII0:eL5nrJN1mxCeu6u7Ms7hVlARIdWYQnCuUHcBEkUfqRE','2024-06-20 18:56:44.897676'),('ccbu1hq8bzqllkb93fmvx8aqru07ffd0','.eJxVjMEOwiAQBf-FsyHAAgWP3v0GAssiVQNJaU_Gf9cmPej1zcx7sRC3tYZt0BLmzM5MAjv9jinig9pO8j22W-fY27rMie8KP-jg157peTncv4MaR_3WIAoROq2tIuGNKc5AdpPHgqCVkuh1KZOwiUAZlUgrjxYk2eiEtGTZ-wP6zjeF:1sMXp3:O0NFL-4Uq9QSmrtbNZDEUANMzp9wJxHSUy-uvzyGx6M','2024-07-10 18:56:49.808774'),('cmpbrw6jd2cm0exls8ueetog7qa69ung','.eJxVjMEOwiAQBf-FsyHAAgWP3v0GAssiVQNJaU_Gf9cmPej1zcx7sRC3tYZt0BLmzM5MAjv9jinig9pO8j22W-fY27rMie8KP-jg157peTncv4MaR_3WIAoROq2tIuGNKc5AdpPHgqCVkuh1KZOwiUAZlUgrjxYk2eiEtGTZ-wP6zjeF:1sMWBp:IQpwigifFDgcn3EC_YX5eEktbcV0i9sF8bRxlOJkD1c','2024-07-10 17:12:13.304862'),('f00tug0fc42n092vommx8tg7sci6h6h5','.eJxVjDEOAiEQRe9CbQgwIGJp7xnIwAyyaiBZdivj3XWTLbT9773_EhHXpcZ18BwnEmehxeF3S5gf3DZAd2y3LnNvyzwluSlyp0NeO_Hzsrt_BxVH_dZZgU4YLMAxeMM2kTXACVCBswW1O2nnlSbGYnxxJQOZ7Ei5wCWE5MX7A9GpN8o:1sEvCu:1TeHBQRiJtAUjWNCNn26cxN3ixwE883z9sn9KPLCBVY','2024-06-19 18:17:56.244055'),('iek5y1i7v9qsr657ozxwe702rqst3kmu','.eJxVjEEOwiAQAP_C2RCgZQsevfcNZFm2UjWQlPZk_Lsh6UGvM5N5i4DHnsPReAtrElehxeWXRaQnly7SA8u9Sqpl39YoeyJP2-RcE79uZ_s3yNhy37K2CfzorUWjrGdkYyflozLe0zCMoIgjwgQE5EDH6IyjgRaD4NKixOcLwpk3eA:1sGeNQ:D6Ozamx7T7MYmIyc5nZhfT1omhM2L2o35XDNrxTph-c','2024-06-24 12:43:56.797713'),('kv7muffuicci7rf474h9249bo9cb830j','.eJxVjEEOwiAQAP_C2RCgZQsevfcNZFm2UjWQlPZk_Lsh6UGvM5N5i4DHnsPReAtrElehxeWXRaQnly7SA8u9Sqpl39YoeyJP2-RcE79uZ_s3yNhy37K2CfzorUWjrGdkYyflozLe0zCMoIgjwgQE5EDH6IyjgRaD4NKixOcLwpk3eA:1sMlwj:cJQhoeLUOML_uUV0EJTuWyasbcq-XxSSfzq9nvJb99g','2024-07-11 10:01:41.899914'),('or299gddir14arprogouinmtek9zqm22','.eJxVjMsOwiAQRf-FtSE8hsK4dO83EIaHVA0kpV0Z_12bdKHbe865L-bDtla_jbz4ObEz0-z0u1GIj9x2kO6h3TqPva3LTHxX-EEHv_aUn5fD_TuoYdRvPYFGpByFJpBgJFowBoUUaCdnrMOCUeoYRHGgEIEKgAqQlXFktUP2_gCfczYb:1sFwHX:K0heE1MSijzoUx8nK5mEqH68EmjOCGWpnfwsHV-y3EQ','2024-06-22 13:38:55.753692'),('t3dky0aylvw04pr671weer2qx6zodppu','.eJxVjEEOwiAQAP_C2RCgZQsevfcNZFm2UjWQlPZk_Lsh6UGvM5N5i4DHnsPReAtrElehxeWXRaQnly7SA8u9Sqpl39YoeyJP2-RcE79uZ_s3yNhy37K2CfzorUWjrGdkYyflozLe0zCMoIgjwgQE5EDH6IyjgRaD4NKixOcLwpk3eA:1sMT1D:OfRlccFKUOJqYcUcNBgMlERiBUQW8v4HLQ3DtCFIB0s','2024-07-10 13:49:03.130617'),('u93bx6i9c78v672cb1y1d72zw5p41is2','e30:1sMlwj:euaoz4jI4YyEcSvjgXWWzkyAO-ExyOMdgFsknPOywwI','2024-07-11 10:01:41.233247'),('uwyj96p0d4chiwjo4t393ibdv64j88c3','.eJxVjDEOAiEQRe9CbQgwIGJp7xnIwAyyaiBZdivj3XWTLbT9773_EhHXpcZ18BwnEmehxeF3S5gf3DZAd2y3LnNvyzwluSlyp0NeO_Hzsrt_BxVH_dZZgU4YLMAxeMM2kTXACVCBswW1O2nnlSbGYnxxJQOZ7Ei5wCWE5MX7A9GpN8o:1sFE1v:9spgNGNRhQ-Wv1XV3D9zm4FzqgECkj3f-3PE9V505gs','2024-06-20 14:23:51.258138');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quora_category`
--

DROP TABLE IF EXISTS `quora_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quora_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quora_category`
--

LOCK TABLES `quora_category` WRITE;
/*!40000 ALTER TABLE `quora_category` DISABLE KEYS */;
INSERT INTO `quora_category` VALUES (1,'General','static/category/knowledge.png'),(2,'Maths','static/category/maths.png');
/*!40000 ALTER TABLE `quora_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quora_comment`
--

DROP TABLE IF EXISTS `quora_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quora_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date NOT NULL,
  `Post_id` bigint DEFAULT NULL,
  `user_name_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quora_comment_user_name_id_f18fc609_fk_quora_customuser_id` (`user_name_id`),
  KEY `quora_comment_Post_id_f66a53c8_fk_quora_post_id` (`Post_id`),
  CONSTRAINT `quora_comment_Post_id_f66a53c8_fk_quora_post_id` FOREIGN KEY (`Post_id`) REFERENCES `quora_post` (`id`),
  CONSTRAINT `quora_comment_user_name_id_f18fc609_fk_quora_customuser_id` FOREIGN KEY (`user_name_id`) REFERENCES `quora_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quora_comment`
--

LOCK TABLES `quora_comment` WRITE;
/*!40000 ALTER TABLE `quora_comment` DISABLE KEYS */;
INSERT INTO `quora_comment` VALUES (104,'his is a fantastic overview of where AI is headed! I’m particularly excited about AI in healthcare. Imagine the possibilities of early diagnosis and tailored treatment plans! Here’s an article I found on the topic:','','2024-06-26',34,13),(105,'As an educator, I can see the huge potential of AI in transforming how we teach and learn. Personalized learning could help bridge gaps and cater to each student’s pace. I’d love to hear more about current AI tools in education. Great post!','','2024-06-26',34,13),(106,'It’s gotta be aliens!  Seriously though, the supernatural theories are the most fun. I love reading about lost civilizations.','','2024-06-26',35,13),(111,'Ah, the future of AI! I, for one, welcome our new robot overlords.  Imagine an AI that can predict when you’re about to run out of coffee and automatically orders a new batch for you. That’s the kind of future I can get behind! Just hope it doesn’t start giving me unsolicited advice on my fashion choices.','static/comments/Screenshot_2024-06-26_231449_6WBZ7VR.jpg','2024-06-26',34,14),(112,'Why do cats love boxes? Simple. They’re actually working on their teleportation skills!  You see, every box is a portal to a secret cat universe where they hold meetings on how to take over the internet. Ever wonder why your cat stares at you from a box? They\'re just assessing your potential as a loyal subject in the new cat world order.','static/comments/Screenshot_2024-06-26_235611.jpg','2024-06-26',36,1);
/*!40000 ALTER TABLE `quora_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quora_customuser`
--

DROP TABLE IF EXISTS `quora_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quora_customuser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `avatar` varchar(50) DEFAULT NULL,
  `bio` varchar(200) DEFAULT NULL,
  `joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quora_customuser`
--

LOCK TABLES `quora_customuser` WRITE;
/*!40000 ALTER TABLE `quora_customuser` DISABLE KEYS */;
INSERT INTO `quora_customuser` VALUES (1,'pbkdf2_sha256$720000$y2edc9Sk4OzPtOlidBGhAU$pv7NFIVGNxNfAcbXI7H2w6dfjxoK3/J7JcSC+7HsvKc=','2024-06-27 10:01:41.891406',1,'rudeus','','','',1,1,'2024-06-02 09:23:25.000000','/static/avatars/avatar5.png','The boy who got reincarnated as a magician','2024-06-05 06:56:15.264863'),(13,'pbkdf2_sha256$720000$uTLLji0F6QvXCe2GWNKiFl$HhamFAchj/QwgCDgHjFIb7fxSqrugOouKxhqQ5mdjNA=','2024-06-26 18:56:49.801775',0,'Elon_Must','','','elonmust@gmail.comm',0,1,'2024-06-26 16:45:55.923188','/static/avatars/avatar3.png','Hello! I\'m Elon Must','2024-06-26 16:45:56.900914'),(14,'pbkdf2_sha256$720000$ByM7TaGVREnMLdrULCqvbR$SPl61fRXP9SdfBNyWbmwjFVITg7JiQ92h9n2meE+Zvg=','2024-06-26 18:57:19.480140',0,'Xavier','','','xavier@gmai.in',0,1,'2024-06-26 16:47:13.657551','/static/avatars/avatar2.png','Masters in BTech from IIT Dholakpur.','2024-06-26 16:47:14.750175');
/*!40000 ALTER TABLE `quora_customuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quora_customuser_groups`
--

DROP TABLE IF EXISTS `quora_customuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quora_customuser_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `quora_customuser_groups_customuser_id_group_id_a53f8fdb_uniq` (`customuser_id`,`group_id`),
  KEY `quora_customuser_groups_group_id_b54071fb_fk_auth_group_id` (`group_id`),
  CONSTRAINT `quora_customuser_gro_customuser_id_36c30c48_fk_quora_cus` FOREIGN KEY (`customuser_id`) REFERENCES `quora_customuser` (`id`),
  CONSTRAINT `quora_customuser_groups_group_id_b54071fb_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quora_customuser_groups`
--

LOCK TABLES `quora_customuser_groups` WRITE;
/*!40000 ALTER TABLE `quora_customuser_groups` DISABLE KEYS */;
INSERT INTO `quora_customuser_groups` VALUES (4,13,3),(5,14,3);
/*!40000 ALTER TABLE `quora_customuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quora_customuser_user_permissions`
--

DROP TABLE IF EXISTS `quora_customuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quora_customuser_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `quora_customuser_user_pe_customuser_id_permission_a70ca087_uniq` (`customuser_id`,`permission_id`),
  KEY `quora_customuser_use_permission_id_78537186_fk_auth_perm` (`permission_id`),
  CONSTRAINT `quora_customuser_use_customuser_id_8b64f122_fk_quora_cus` FOREIGN KEY (`customuser_id`) REFERENCES `quora_customuser` (`id`),
  CONSTRAINT `quora_customuser_use_permission_id_78537186_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quora_customuser_user_permissions`
--

LOCK TABLES `quora_customuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `quora_customuser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `quora_customuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quora_message`
--

DROP TABLE IF EXISTS `quora_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quora_message` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `message` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_time` time(6) NOT NULL,
  `room_id_id` bigint DEFAULT NULL,
  `user_name_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quora_message_room_id_id_3f825b43_fk_quora_spaces_id` (`room_id_id`),
  KEY `quora_message_user_name_id_9d71b4c7_fk_quora_customuser_id` (`user_name_id`),
  CONSTRAINT `quora_message_room_id_id_3f825b43_fk_quora_spaces_id` FOREIGN KEY (`room_id_id`) REFERENCES `quora_spaces` (`id`),
  CONSTRAINT `quora_message_user_name_id_9d71b4c7_fk_quora_customuser_id` FOREIGN KEY (`user_name_id`) REFERENCES `quora_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quora_message`
--

LOCK TABLES `quora_message` WRITE;
/*!40000 ALTER TABLE `quora_message` DISABLE KEYS */;
INSERT INTO `quora_message` VALUES (192,'Hey everyone! What\'s your go-to workout routine to kickstart the day?','','00:29:30.833281',1,13),(193,'Share your biggest fitness accomplishment this week! Let\'s celebrate those gains together','','00:29:40.662627',1,14),(194,'Who\'s up for a plank challenge? Set your timer and let\'s see who can hold it the longest!','','00:29:58.821401',1,1),(195,'What\'s your favorite post-workout snack that keeps you energized?','','00:30:18.126753',1,1),(196,'Mine\'s is just: ','/media/uploads/Screenshot 2024-06-27 003042.jpg','00:31:06.604759',1,14),(197,'Drop your favorite workout jams! Let\'s create the ultimate fitness playlist.','','00:31:32.403870',1,13),(198,'What\'s the one book you\'d recommend to everyone in this room? Share the title and why it\'s a must-read!','','00:32:22.770998',2,1),(199,'Just stumbled upon this gem: God of wrath! Check out the cover—it\'s so inviting! Who\'s read it?','','00:34:04.888934',2,14),(200,'Yeah! But these are just pue Nostalgia','/media/uploads/Screenshot 2024-06-27 003505.jpg','00:35:45.417654',2,13),(201,'pure*','','00:36:06.660530',2,13),(202,'What\'s your current jam for anime openings? Share the title and why it pumps you up!','','00:37:04.353088',3,1),(203,'Anime are for kids','/media/uploads/Ripple.gif','00:43:10.692329',3,14),(204,'','/media/uploads/Screenshot 2024-06-27 004357.jpg','00:44:12.830152',3,13);
/*!40000 ALTER TABLE `quora_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quora_post`
--

DROP TABLE IF EXISTS `quora_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quora_post` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` datetime(6) NOT NULL,
  `query` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `categories_id` bigint NOT NULL,
  `user_name_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quora_post_categories_id_b55fcc91_fk_quora_category_id` (`categories_id`),
  KEY `quora_post_user_name_id_088291e6_fk_quora_customuser_id` (`user_name_id`),
  CONSTRAINT `quora_post_categories_id_b55fcc91_fk_quora_category_id` FOREIGN KEY (`categories_id`) REFERENCES `quora_category` (`id`),
  CONSTRAINT `quora_post_user_name_id_088291e6_fk_quora_customuser_id` FOREIGN KEY (`user_name_id`) REFERENCES `quora_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quora_post`
--

LOCK TABLES `quora_post` WRITE;
/*!40000 ALTER TABLE `quora_post` DISABLE KEYS */;
INSERT INTO `quora_post` VALUES (34,'','2024-06-26 16:50:30.698122','The Future of Artificial Intelligence: What\'s Next?','Artificial Intelligence (AI) has transformed the way we live, work, and interact with technology. From voice assistants like Siri and Alexa to autonomous vehicles, AI\'s applications are vast and continually evolving. But what does the future hold for AI?\r\n\r\n\r\nIn this post, we\'ll explore some exciting predictions and potential advancements in AI technology over the next decade.\r\n\r\nAI in Healthcare: Imagine a world where AI can accurately diagnose diseases, personalize treatment plans, and even predict outbreaks before they occur. AI-driven healthcare systems could revolutionize patient care.\r\n\r\nAI in Education: Personalized learning experiences powered by AI can adapt to each student\'s needs, making education more accessible and effective. Virtual tutors and AI-driven classrooms might become the norm.\r\n\r\nEthical AI: As AI becomes more integrated into our daily lives, ethical considerations will be paramount. How do we ensure AI systems are fair, transparent, and free from bias?\r\n\r\nAI and Creativity: AI-generated art, music, and literature are already a reality. The future might see even more sophisticated AI creatives, collaborating with humans to produce groundbreaking work.',1,1),(35,'','2024-06-27 06:26:16.061267','The Mystery of the Bermuda Triangle: Fact or Fiction??','The Bermuda Triangle has been a source of mystery and intrigue for decades. Ships and planes disappearing without a trace, strange magnetic anomalies, and ghostly tales have all contributed to its eerie reputation. But what’s the truth behind these stories?\r\n\r\n\r\nIn this post, let’s delve into the theories surrounding the Bermuda Triangle and separate fact from fiction.\r\n\r\nNatural Explanations: Some scientists suggest that the Bermuda Triangle’s mysteries can be explained by natural phenomena such as rogue waves, methane hydrates, and sudden weather changes. Could it be that simple?\r\n\r\nHuman Error: Pilot and navigator errors have been responsible for many accidents. Could the Bermuda Triangle’s reputation be largely due to human mistakes?\r\n\r\nSupernatural Theories: From alien abductions to lost civilizations like Atlantis, the more supernatural theories are certainly the most entertaining. But is there any truth to them?\r\n\r\nMagnetic Anomalies: Some believe the area’s unique magnetic properties interfere with navigation instruments. Could this explain some of the mysterious disappearances?\r\n\r\nWhat do you think? Are the mysteries of the Bermuda Triangle rooted in science, or is there something more otherworldly at play?',1,1),(36,'','2024-06-26 16:52:43.461739','Why Do Cats Love Boxes So Much? The Internet’s Funniest Theories','If you’ve ever owned a cat, you know their love for boxes is unparalleled. But why do cats love boxes so much? Here are some of the funniest theories from around the internet.\r\n\r\n\r\nSecret Agent Hideout: Cats are secretly training to be the next James Bond. Those boxes are their undercover hideouts!\r\n\r\nThermal Comfort: Boxes are the perfect size to retain a cat’s body heat. They’re basically furry hot water bottles.\r\n\r\nIt’s All a Game: Cats see boxes as the ultimate toy. They can hide, pounce, and pretend to be tiny box-dwelling predators.\r\n\r\nPrivacy Please: Sometimes, a cat just needs a break from the crazy world of humans. Boxes offer the perfect sanctuary.\r\n\r\nBecause Internet Says So: Cats have realized that humans find their box obsession hilarious, so they’re just playing along for the memes.\r\n\r\nWhat’s your theory on why cats love boxes? Share your funniest thoughts!',1,13),(37,'static/Screenshot_2024-06-26_222608.jpg','2024-06-26 16:56:18.657277','Rank inflation in JEE Advanced','All those who are crying over mass level Paper leak of NEET (that too through Telegram), here\'s the marks vs rank comparison of JEE Advanced exam of 2024 & 2023 !\r\n\r\nProblem hui hai NEET mei Kuchh kuchh Places mei and unk wajah thoda rank inflate v hua hai..\r\n\r\nBut this paper leak thing through Telegram seems so Unreal !!\r\n\r\nAb acche resources v easily available hai & Bacche ab pdh V rhe hain..& thus JEE Advance jaise hard yet limited attempt Wale paper mei v rank inflate ho rha hai year by year..\r\n\r\nAb competition linearly nhi bdh rhi- Let\'s accept this bitter truth now!\r\n\r\n~Hakuna matata',1,14),(38,'static/Screenshot_2024-06-26_223242.jpg','2024-06-26 17:02:49.038508','What was worse for the soldiers, WW1 or WW2?','Both wars had a devastating effect on the lives of soldiers; in both wars we could see the dark side of human cruelty.\r\n\r\nBut one thing which stands out from the time of World war 1 is:\r\n\r\nTRENCH WARFARE\r\n\r\nMilitaries adopted this method of digging trenches to secure thier location, and between two trenches there would be a no man\'s land where the actual fighting took place. Both sides continuously fired shells at each other and routinely try to infiltrate into the enemies’ area.\r\n\r\nNow just imagine yourself as one of the soldiers here; aware all the time that a shell may land near you and everything will be over, you cannot move much and surely not outside the trench but are just restricted to a small claustrophobic pit which is smelling with filth, full of rats and disease and see your comrades losing their sanity, stuck between suffering and death; this system of trenchs made sure that no matter whoever wins the war, both sides will be devastated equally.',1,14),(39,'static/Screenshot_2024-06-26_224145.jpg','2024-06-26 17:12:50.396556','Time to put this age old debate to rest','',1,13);
/*!40000 ALTER TABLE `quora_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quora_spaces`
--

DROP TABLE IF EXISTS `quora_spaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quora_spaces` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quora_spaces`
--

LOCK TABLES `quora_spaces` WRITE;
/*!40000 ALTER TABLE `quora_spaces` DISABLE KEYS */;
INSERT INTO `quora_spaces` VALUES (1,'Fitness_Freaks','static/spaces/Fitness_Freak.jpg','Share tips, routines, and motivation to keep up with your fitness goals.'),(2,'BookWorms','static/spaces/default_space.png','A cozy corner for book lovers. Discuss your favorite reads, discover new authors, and exchange book recommendations.'),(3,'Aniverse','static/spaces/anime.jpg','Welcome to ANiVERSE where no matter if u love anime or manga or u like to read stuff like Light Novels, U are most welcome to come and enjoy :)'),(4,'TechTalk','static/spaces/tech_talk.jpg','Dive into the latest trends, innovations, and developments in the tech world. From AI advancements to the newest gadgets, this is the place for tech enthusiasts to share and learn.'),(5,'GamingGuild','static/spaces/gamingguild.jpg','Whether you’re into console, PC, or mobile games, this is the place to discuss strategies, share game recommendations, and connect with fellow gamers.'),(6,'MovieMania','static/spaces/movie.jpg','Discuss the latest releases, classic films, and everything in between. Share reviews, movie trivia, and recommendations.');
/*!40000 ALTER TABLE `quora_spaces` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-27 15:35:53
