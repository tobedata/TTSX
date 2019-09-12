-- MySQL dump 10.13  Distrib 5.7.25, for linux-glibc2.12 (x86_64)
--
-- Host: localhost    Database: ttsx
-- ------------------------------------------------------
-- Server version	5.7.25

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add group',4,'add_group'),(11,'Can change group',4,'change_group'),(12,'Can delete group',4,'delete_group'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add user info',7,'add_userinfo'),(20,'Can change user info',7,'change_userinfo'),(21,'Can delete user info',7,'delete_userinfo'),(22,'Can add goods type',8,'add_goodstype'),(23,'Can change goods type',8,'change_goodstype'),(24,'Can delete goods type',8,'delete_goodstype'),(25,'Can add goods info',9,'add_goodsinfo'),(26,'Can change goods info',9,'change_goodsinfo'),(27,'Can delete goods info',9,'delete_goodsinfo'),(28,'Can add cart info',10,'add_cartinfo'),(29,'Can change cart info',10,'change_cartinfo'),(30,'Can delete cart info',10,'delete_cartinfo');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$100000$AF35F0sZApZu$2qAjsEuE9RCE3V+oopSygTXPwy4wpn5Tt8U/77IxzJ8=','2019-08-28 15:52:22.881245',1,'python','','','',1,1,'2019-05-30 08:01:19.525911');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_cart_cartinfo`
--

DROP TABLE IF EXISTS `df_cart_cartinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `df_cart_cartinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_cart_cartinfo_goods_id_4357294f_fk_df_goods_goodsinfo_id` (`goods_id`),
  KEY `df_cart_cartinfo_user_id_db76e708_fk_df_user_userinfo_id` (`user_id`),
  CONSTRAINT `df_cart_cartinfo_goods_id_4357294f_fk_df_goods_goodsinfo_id` FOREIGN KEY (`goods_id`) REFERENCES `df_goods_goodsinfo` (`id`),
  CONSTRAINT `df_cart_cartinfo_user_id_db76e708_fk_df_user_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `df_user_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_cart_cartinfo`
--

LOCK TABLES `df_cart_cartinfo` WRITE;
/*!40000 ALTER TABLE `df_cart_cartinfo` DISABLE KEYS */;
INSERT INTO `df_cart_cartinfo` VALUES (4,1,9,1),(7,8,8,1),(8,2,11,1);
/*!40000 ALTER TABLE `df_cart_cartinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_goods_goodsinfo`
--

DROP TABLE IF EXISTS `df_goods_goodsinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `df_goods_goodsinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gtitle` varchar(32) NOT NULL,
  `gprice` decimal(5,2) NOT NULL,
  `gunit` varchar(32) NOT NULL,
  `gstock` int(11) NOT NULL,
  `gsummary` varchar(100) NOT NULL,
  `gdetail` varchar(200) NOT NULL,
  `gclick` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `gtype_id` int(11) NOT NULL,
  `gpic` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_goods_goodsinfo_gtype_id_63a02cef_fk_df_goods_goodstype_id` (`gtype_id`),
  CONSTRAINT `df_goods_goodsinfo_gtype_id_63a02cef_fk_df_goods_goodstype_id` FOREIGN KEY (`gtype_id`) REFERENCES `df_goods_goodstype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_goods_goodsinfo`
--

LOCK TABLES `df_goods_goodsinfo` WRITE;
/*!40000 ALTER TABLE `df_goods_goodsinfo` DISABLE KEYS */;
INSERT INTO `df_goods_goodsinfo` VALUES (7,'红玫瑰苹果',71.90,'500g',50,'优选大果8个 单果约190-240g 进口水果','吃苹果既能减肥，又能帮助消化，另外老人吃苹果会有一定的帮助。苹果含有多种维生素、矿物质、糖类、脂肪等，构成大脑所必须的营养成分。苹果中的纤维，对儿童的生长发育有益，能促进生长和发育。苹果中的锌对儿童的记忆有益，能增强儿童的记忆力。但苹果中的酸能腐蚀牙齿，吃完苹果后最好漱漱口。',4,0,1,'images/df_goods/goods001.jpg'),(8,'鲜橙子',59.90,'500g',40,'约4kg装 生鲜榨汁夏橙 进口水果','橙子具有宽肠、理气、化痰、消食、开胃、止呕、止痛、止咳等功效，可用于治疗胸闷、腹胀、呕吐、便秘、小便不畅、痔疮出血，解酒、鱼、蟹毒等。',10,0,1,'images/df_goods/goods002.jpg'),(9,'牛油果',29.90,'500g',30,'4粒装（2生2熟）单果重约140-180g 新鲜水果','果实为一种营养价值很高的水果，含多种维生素、丰富的脂肪和蛋白质，钠、钾、镁、钙等含量也高，除作生果食用外也可作菜肴和罐头。',17,0,1,'images/df_goods/goods003.jpg'),(10,'葡萄柚',42.80,'500g',55,'优选大果4个 单果约320-380g 进口水果 海外直采','葡萄柚又叫西柚、朱栾。因挂果时果实密集，呈簇生状，似葡萄成串垂吊，故称葡萄柚。',10,0,1,'images/df_goods/goods004.jpg'),(11,'黄金油桃',38.70,'500g',66,'大果1kg 单果100-150g 新鲜水果','中国的油桃生产起步较晚，早期的品种多引自欧美，味道较酸，由于不太符合东方人的消费习惯，在生产上的影响有限，也给人们留下了“油桃是酸的”的印象。但油桃的营养价值高，富含维生素，有很高的食用价值。',52,0,1,'images/df_goods/goods005.jpg'),(12,'多宝鱼',88.00,'500g',30,'袋装 鲜活冷冻 可溯源海鱼 BAP认证 海鲜水产','胶质蛋白含量高，味道鲜美，营养丰富，具有很好的滋润皮肤和美容的作用，且能补肾健脑，助阳提神；经常食用，可以滋补健身，提高人的抗病能力。',0,0,2,'images/df_goods/goods006.jpg'),(13,'白虾',109.00,'500g',32,'400g 16-20只/盒 原装进口 火锅烧烤食材','虾类营养丰富，且肉质松软，易消化，对身体虚弱以及病后需要调养的人是好的食物',5,0,2,'images/df_goods/goods007.jpg'),(14,'金鲳鱼',39.00,'500g',54,'BAP认证 700g 2条 袋装 海鲜水产','金鲳鱼具有益气养血、补胃益精、滑利关节、柔筋利骨之功效，对消化不良、脾虚泄泻、贫血、筋骨酸痛等很有效。',4,0,2,'images/df_goods/goods008.jpg'),(15,'三文鱼',38.90,'500g',49,'250g/袋 1片装 海鲜水产','三文鱼营养丰富，富含不饱和脂肪酸，鱼肉中的蛋白质含 三文鱼片 三文鱼片(10张)  有18种氨基酸（其中包括人体必需的8种氨基酸），且蛋白质含量明显高于其他鱼类',11,0,2,'images/df_goods/goods009.jpg'),(16,'海鲈鱼',44.20,'500g',66,'400~500g 袋装 海鲜水产','海鲈鱼蛋白质丰富，肉质鲜美，是常见的海洋经济鱼类 海鲈鱼 海鲈鱼(6张)  之一。比较著名的菜肴有宫保海鲈球。',8,0,2,'images/df_goods/goods010.jpg');
/*!40000 ALTER TABLE `df_goods_goodsinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_goods_goodstype`
--

DROP TABLE IF EXISTS `df_goods_goodstype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `df_goods_goodstype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gtype` varchar(32) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_goods_goodstype`
--

LOCK TABLES `df_goods_goodstype` WRITE;
/*!40000 ALTER TABLE `df_goods_goodstype` DISABLE KEYS */;
INSERT INTO `df_goods_goodstype` VALUES (1,'新鲜水果',0),(2,'海鲜水产',0),(3,'猪牛羊肉',0),(4,'禽类蛋品',0),(5,'新鲜蔬菜',0),(6,'速冻食品',0);
/*!40000 ALTER TABLE `df_goods_goodstype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_user_userinfo`
--

DROP TABLE IF EXISTS `df_user_userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `df_user_userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(32) NOT NULL,
  `upwd` varchar(40) NOT NULL,
  `uemail` varchar(32) NOT NULL,
  `uphone` varchar(11) NOT NULL,
  `recv_name` varchar(32) NOT NULL,
  `recv_addr` varchar(100) NOT NULL,
  `recv_code` varchar(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_user_userinfo`
--

LOCK TABLES `df_user_userinfo` WRITE;
/*!40000 ALTER TABLE `df_user_userinfo` DISABLE KEYS */;
INSERT INTO `df_user_userinfo` VALUES (1,'python','88ea39439e74fa27c09a4fc0bc8ebe6d00978392','python@163.com','18899977787','python','3rd, 11street','610000',0);
/*!40000 ALTER TABLE `df_user_userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-05-30 08:03:12.550634','1','Fruit',1,'[{\"added\": {}}]',8,1),(2,'2019-05-30 08:03:20.522452','2','Seafood',1,'[{\"added\": {}}]',8,1),(3,'2019-05-30 08:03:25.087654','3','Meat',1,'[{\"added\": {}}]',8,1),(4,'2019-05-30 08:03:39.025546','4','Egg',1,'[{\"added\": {}}]',8,1),(5,'2019-05-30 08:03:48.638700','5','Vegetable',1,'[{\"added\": {}}]',8,1),(6,'2019-05-30 08:03:55.148447','6','Frozen',1,'[{\"added\": {}}]',8,1),(7,'2019-05-30 08:05:09.321232','1','红玫瑰苹果',1,'[{\"added\": {}}]',9,1),(8,'2019-05-30 08:06:40.350536','1','红玫瑰苹果',3,'',9,1),(9,'2019-05-30 08:07:22.032491','2','apple',1,'[{\"added\": {}}]',9,1),(10,'2019-05-30 08:08:48.018392','3','新西兰皇后红玫瑰苹果',1,'[{\"added\": {}}]',9,1),(11,'2019-05-30 08:11:06.754556','4','埃及鲜橙子',1,'[{\"added\": {}}]',9,1),(12,'2019-05-30 08:12:07.261635','5','生熟搭配牛油果',1,'[{\"added\": {}}]',9,1),(13,'2019-05-30 08:14:09.058607','6','南非红西柚葡萄柚',1,'[{\"added\": {}}]',9,1),(14,'2019-05-31 05:00:55.274173','6','南非红西柚葡萄柚',3,'',9,1),(15,'2019-05-31 05:00:55.285207','5','生熟搭配牛油果',3,'',9,1),(16,'2019-05-31 05:00:55.287054','4','埃及鲜橙子',3,'',9,1),(17,'2019-05-31 05:00:55.290310','3','新西兰皇后红玫瑰苹果',3,'',9,1),(18,'2019-05-31 05:00:55.292171','2','apple',3,'',9,1),(19,'2019-05-31 05:02:45.012822','7','红玫瑰苹果',1,'[{\"added\": {}}]',9,1),(20,'2019-05-31 05:05:13.559109','8','鲜橙子',1,'[{\"added\": {}}]',9,1),(21,'2019-05-31 05:06:43.431590','9','牛油果',1,'[{\"added\": {}}]',9,1),(22,'2019-05-31 05:07:37.502417','10','葡萄柚',1,'[{\"added\": {}}]',9,1),(23,'2019-05-31 05:09:09.457821','10','葡萄柚',2,'[{\"changed\": {\"fields\": [\"gdetail\"]}}]',9,1),(24,'2019-05-31 05:09:43.363760','11','黄金油桃',1,'[{\"added\": {}}]',9,1),(25,'2019-05-31 05:10:38.963638','12','多宝鱼',1,'[{\"added\": {}}]',9,1),(26,'2019-05-31 05:11:25.419295','13','白虾',1,'[{\"added\": {}}]',9,1),(27,'2019-05-31 05:12:21.082074','14','金鲳鱼',1,'[{\"added\": {}}]',9,1),(28,'2019-05-31 05:13:13.053679','15','三文鱼',1,'[{\"added\": {}}]',9,1),(29,'2019-05-31 05:13:55.489149','16','海鲈鱼',1,'[{\"added\": {}}]',9,1),(30,'2019-05-31 05:28:47.285240','6','速冻食品',2,'[{\"changed\": {\"fields\": [\"gtype\"]}}]',8,1),(31,'2019-05-31 05:28:55.394697','5','新鲜蔬菜',2,'[{\"changed\": {\"fields\": [\"gtype\"]}}]',8,1),(32,'2019-05-31 05:29:03.748050','4','禽类蛋品',2,'[{\"changed\": {\"fields\": [\"gtype\"]}}]',8,1),(33,'2019-05-31 05:29:11.187831','3','猪牛羊肉',2,'[{\"changed\": {\"fields\": [\"gtype\"]}}]',8,1),(34,'2019-05-31 05:29:19.033192','2','海鲜水产',2,'[{\"changed\": {\"fields\": [\"gtype\"]}}]',8,1),(35,'2019-05-31 05:29:25.905887','1','新鲜水果',2,'[{\"changed\": {\"fields\": [\"gtype\"]}}]',8,1),(36,'2019-05-31 08:39:55.394350','7','红玫瑰苹果',2,'[{\"changed\": {\"fields\": [\"gpic\"]}}]',9,1),(37,'2019-05-31 08:40:03.274294','8','鲜橙子',2,'[{\"changed\": {\"fields\": [\"gpic\"]}}]',9,1),(38,'2019-05-31 08:40:09.946231','9','牛油果',2,'[{\"changed\": {\"fields\": [\"gpic\"]}}]',9,1),(39,'2019-05-31 08:40:17.337900','10','葡萄柚',2,'[{\"changed\": {\"fields\": [\"gpic\"]}}]',9,1),(40,'2019-05-31 08:40:24.404463','11','黄金油桃',2,'[{\"changed\": {\"fields\": [\"gpic\"]}}]',9,1),(41,'2019-05-31 08:40:31.887928','12','多宝鱼',2,'[{\"changed\": {\"fields\": [\"gpic\"]}}]',9,1),(42,'2019-05-31 08:40:40.631361','13','白虾',2,'[{\"changed\": {\"fields\": [\"gpic\"]}}]',9,1),(43,'2019-05-31 08:40:52.284043','14','金鲳鱼',2,'[{\"changed\": {\"fields\": [\"gpic\"]}}]',9,1),(44,'2019-05-31 08:41:04.251443','15','三文鱼',2,'[{\"changed\": {\"fields\": [\"gpic\"]}}]',9,1),(45,'2019-05-31 08:41:15.874010','16','海鲈鱼',2,'[{\"changed\": {\"fields\": [\"gpic\"]}}]',9,1),(46,'2019-05-31 09:00:35.974113','7','红玫瑰苹果',2,'[{\"changed\": {\"fields\": [\"gpic\"]}}]',9,1),(47,'2019-05-31 09:03:46.978912','7','红玫瑰苹果',2,'[{\"changed\": {\"fields\": [\"gpic\"]}}]',9,1),(48,'2019-05-31 09:06:33.900034','7','红玫瑰苹果',2,'[{\"changed\": {\"fields\": [\"gpic\"]}}]',9,1),(49,'2019-05-31 09:09:57.245310','8','鲜橙子',2,'[{\"changed\": {\"fields\": [\"gpic\"]}}]',9,1),(50,'2019-06-03 06:02:58.013421','7','红玫瑰苹果',2,'[{\"changed\": {\"fields\": [\"gpic\"]}}]',9,1),(51,'2019-06-03 06:03:05.086506','8','鲜橙子',2,'[{\"changed\": {\"fields\": [\"gpic\"]}}]',9,1),(52,'2019-06-03 06:03:10.917798','9','牛油果',2,'[{\"changed\": {\"fields\": [\"gpic\"]}}]',9,1),(53,'2019-06-03 06:03:16.347466','10','葡萄柚',2,'[{\"changed\": {\"fields\": [\"gpic\"]}}]',9,1),(54,'2019-06-03 06:03:24.233729','11','黄金油桃',2,'[{\"changed\": {\"fields\": [\"gpic\"]}}]',9,1),(55,'2019-06-03 06:03:30.137716','12','多宝鱼',2,'[{\"changed\": {\"fields\": [\"gpic\"]}}]',9,1),(56,'2019-06-03 06:03:35.145260','13','白虾',2,'[{\"changed\": {\"fields\": [\"gpic\"]}}]',9,1),(57,'2019-06-03 06:03:40.688206','14','金鲳鱼',2,'[{\"changed\": {\"fields\": [\"gpic\"]}}]',9,1),(58,'2019-06-03 06:03:46.389532','15','三文鱼',2,'[{\"changed\": {\"fields\": [\"gpic\"]}}]',9,1),(59,'2019-06-03 06:03:50.975301','16','海鲈鱼',2,'[{\"changed\": {\"fields\": [\"gpic\"]}}]',9,1),(60,'2019-09-03 03:03:43.398094','16','海鲈鱼',2,'[{\"changed\": {\"fields\": [\"gstock\"]}}]',9,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(4,'auth','group'),(2,'auth','permission'),(3,'auth','user'),(5,'contenttypes','contenttype'),(10,'df_cart','cartinfo'),(9,'df_goods','goodsinfo'),(8,'df_goods','goodstype'),(7,'df_user','userinfo'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-05-30 07:35:23.896888'),(2,'auth','0001_initial','2019-05-30 07:35:24.508363'),(3,'admin','0001_initial','2019-05-30 07:35:24.665343'),(4,'admin','0002_logentry_remove_auto_add','2019-05-30 07:35:24.685611'),(5,'contenttypes','0002_remove_content_type_name','2019-05-30 07:35:24.790999'),(6,'auth','0002_alter_permission_name_max_length','2019-05-30 07:35:24.844798'),(7,'auth','0003_alter_user_email_max_length','2019-05-30 07:35:24.903790'),(8,'auth','0004_alter_user_username_opts','2019-05-30 07:35:24.922840'),(9,'auth','0005_alter_user_last_login_null','2019-05-30 07:35:24.977863'),(10,'auth','0006_require_contenttypes_0002','2019-05-30 07:35:24.987007'),(11,'auth','0007_alter_validators_add_error_messages','2019-05-30 07:35:25.004975'),(12,'auth','0008_alter_user_username_max_length','2019-05-30 07:35:25.117897'),(13,'auth','0009_alter_user_last_name_max_length','2019-05-30 07:35:25.183787'),(14,'df_goods','0001_initial','2019-05-30 07:35:25.348224'),(15,'df_user','0001_initial','2019-05-30 07:35:25.409597'),(16,'sessions','0001_initial','2019-05-30 07:35:25.459556'),(17,'df_goods','0002_goodsinfo_gpic','2019-05-31 08:30:52.422055'),(18,'df_goods','0003_auto_20190906_1419','2019-09-06 06:20:50.204343'),(19,'df_cart','0001_initial','2019-09-06 06:20:51.589568');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('2b40qax0tbxr59vs2zammci1t6k3gxb0','YjNhY2ZiOGNlYzFiNWM0YjkyNTgxY2FkMDY4MTIyNWU1ZjQ0OGU5Mjp7InVzZXJfaWQiOjEsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkMmE0MjhiN2E0YTY3MDE4ODBmMzNmNWFkOWQ5MDE1ZWMwNTQzZmVlIiwidXNlcl9uYW1lIjoicHl0aG9uIn0=','2019-06-13 08:02:52.304383'),('ivtyfb4ljn6oo4vh028diwwf1k5eab76','MzQwYWQwZTg3NTFmOTMwMjcwMjNlMmVmZGY4NzlmNzQ4OTY2YTFjYzp7InVzZXJfaWQiOjEsInVzZXJfbmFtZSI6InB5dGhvbiJ9','2019-09-26 03:37:01.760591'),('nhty7ezlmoq111cpzdm2kmg9vtkp9l5e','MzVlZTc3NjgzOTZmNzA1ZjA1MjI0NTE1MGY2YWFhZWY2NzAzMWUyYzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDJhNDI4YjdhNGE2NzAxODgwZjMzZjVhZDlkOTAxNWVjMDU0M2ZlZSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2019-09-08 15:17:20.813531'),('wolf1uw06me0ca78pr1h5fup6do5ns3l','YTc5YTU4NTA5OGY2NmNkNDYxOWM1YTQ5MjkyNzAzZDQ4MDA4YjMzMTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwidXNlcl9uYW1lIjoicHl0aG9uIiwidXNlcl9pZCI6MSwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJkMmE0MjhiN2E0YTY3MDE4ODBmMzNmNWFkOWQ5MDE1ZWMwNTQzZmVlIn0=','2019-06-28 08:54:27.339323'),('yvkmv1ex4gp5cq7tg9th7y97hc66nlz2','MzVlZTc3NjgzOTZmNzA1ZjA1MjI0NTE1MGY2YWFhZWY2NzAzMWUyYzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDJhNDI4YjdhNGE2NzAxODgwZjMzZjVhZDlkOTAxNWVjMDU0M2ZlZSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2019-06-14 09:03:35.009190');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-12 11:47:02
