-- MySQL dump 10.10
--
-- Host: localhost    Database: ssmdb
-- ------------------------------------------------------
-- Server version	5.0.22-community-nt

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
-- Table structure for table `t_menu`
--

DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `menu_id` int(11) NOT NULL auto_increment,
  `menu_name` varchar(64) collate utf8_bin default NULL,
  `menu_url` varchar(200) collate utf8_bin default NULL,
  `ord` int(11) default NULL,
  `parent_id` int(11) default NULL,
  PRIMARY KEY  (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `t_menu`
--


/*!40000 ALTER TABLE `t_menu` DISABLE KEYS */;
LOCK TABLES `t_menu` WRITE;
INSERT INTO `t_menu` VALUES (1,'首页',NULL,NULL,NULL),(2,'系统管理',NULL,NULL,NULL),(3,'用户管理',NULL,1,2),(4,'角色管理',NULL,2,2),(5,'菜单管理',NULL,3,2),(6,'权限管理',NULL,4,2),(7,'素材管理',NULL,NULL,NULL),(8,'图片管理',NULL,1,7);
UNLOCK TABLES;
/*!40000 ALTER TABLE `t_menu` ENABLE KEYS */;

--
-- Table structure for table `t_person`
--

DROP TABLE IF EXISTS `t_person`;
CREATE TABLE `t_person` (
  `id` int(11) default NULL,
  `name` varchar(32) collate utf8_bin default NULL,
  `age` int(11) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `t_person`
--


/*!40000 ALTER TABLE `t_person` DISABLE KEYS */;
LOCK TABLES `t_person` WRITE;
INSERT INTO `t_person` VALUES (1,'zg',27),(2,'zg1',28);
UNLOCK TABLES;
/*!40000 ALTER TABLE `t_person` ENABLE KEYS */;

--
-- Table structure for table `t_privilege`
--

DROP TABLE IF EXISTS `t_privilege`;
CREATE TABLE `t_privilege` (
  `privilege_id` int(11) NOT NULL auto_increment,
  `privilege_name` varchar(64) collate utf8_bin default NULL,
  `remark` varchar(200) collate utf8_bin default NULL,
  PRIMARY KEY  (`privilege_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `t_privilege`
--


/*!40000 ALTER TABLE `t_privilege` DISABLE KEYS */;
LOCK TABLES `t_privilege` WRITE;
INSERT INTO `t_privilege` VALUES (1,'add','增加'),(2,'delete','删除'),(3,'update','修改'),(4,'view','查看');
UNLOCK TABLES;
/*!40000 ALTER TABLE `t_privilege` ENABLE KEYS */;

--
-- Table structure for table `t_r_role_menu_privilege`
--

DROP TABLE IF EXISTS `t_r_role_menu_privilege`;
CREATE TABLE `t_r_role_menu_privilege` (
  `role_id` int(11) default NULL,
  `menu_id` int(11) default NULL,
  `privilege_id` int(11) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `t_r_role_menu_privilege`
--


/*!40000 ALTER TABLE `t_r_role_menu_privilege` DISABLE KEYS */;
LOCK TABLES `t_r_role_menu_privilege` WRITE;
INSERT INTO `t_r_role_menu_privilege` VALUES (1,1,4),(1,2,4),(1,3,1),(1,3,2),(1,3,3),(1,3,4),(1,4,1),(1,4,2),(1,4,3),(1,4,4),(1,5,1),(1,5,2),(1,5,3),(1,5,4),(1,6,1),(1,6,2),(1,6,3),(1,6,4),(1,7,4),(1,8,1),(1,8,2),(1,8,3),(1,8,4),(2,1,4),(2,7,4),(2,8,1),(2,8,2),(2,8,3),(2,8,4);
UNLOCK TABLES;
/*!40000 ALTER TABLE `t_r_role_menu_privilege` ENABLE KEYS */;

--
-- Table structure for table `t_r_user_role`
--

DROP TABLE IF EXISTS `t_r_user_role`;
CREATE TABLE `t_r_user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY  (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `t_r_user_role`
--


/*!40000 ALTER TABLE `t_r_user_role` DISABLE KEYS */;
LOCK TABLES `t_r_user_role` WRITE;
INSERT INTO `t_r_user_role` VALUES (1,1),(2,2);
UNLOCK TABLES;
/*!40000 ALTER TABLE `t_r_user_role` ENABLE KEYS */;

--
-- Table structure for table `t_role`
--

DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `role_id` int(11) NOT NULL auto_increment,
  `role_name` varchar(64) collate utf8_bin default NULL,
  `remark` varchar(400) collate utf8_bin default NULL,
  PRIMARY KEY  (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `t_role`
--


/*!40000 ALTER TABLE `t_role` DISABLE KEYS */;
LOCK TABLES `t_role` WRITE;
INSERT INTO `t_role` VALUES (1,'manager','管理员'),(2,'normal','普通用户');
UNLOCK TABLES;
/*!40000 ALTER TABLE `t_role` ENABLE KEYS */;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `user_id` int(11) NOT NULL auto_increment,
  `user_name` varchar(64) collate utf8_bin default NULL,
  `gender` tinyint(1) default NULL,
  `address` varchar(200) collate utf8_bin default NULL,
  `email` varchar(200) collate utf8_bin default NULL,
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `t_user`
--


/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
LOCK TABLES `t_user` WRITE;
INSERT INTO `t_user` VALUES (1,'admin',1,'北京','admin@mss.com'),(2,'zhaogang',1,'北京','zg@mss.com');
UNLOCK TABLES;
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

