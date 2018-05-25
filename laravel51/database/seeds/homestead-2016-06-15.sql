/*
SQLyog Ultimate v8.71 
MySQL - 5.5.40 : Database - homestead
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`homestead` /*!40100 DEFAULT CHARACTER SET gbk */;

USE `homestead`;

/*Table structure for table `comments` */

DROP TABLE IF EXISTS `comments`;

CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `user_id` int(10) unsigned NOT NULL,
  `post_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `comments` */

/*Table structure for table `demos` */

DROP TABLE IF EXISTS `demos`;

CREATE TABLE `demos` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `route` varchar(255) NOT NULL COMMENT '关键词',
  `description` varchar(255) DEFAULT NULL COMMENT '摘要',
  `content` text COMMENT '内容',
  `order` int(5) DEFAULT '0',
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `demos` */

insert  into `demos`(`id`,`title`,`route`,`description`,`content`,`order`,`status`) values (1,'Restful','/post','Restful操作','1',1,1),(2,'认证','api/user','无状态的HTTP基本认证',NULL,3,1),(3,'普通','/group','普通操作','1',2,1),(4,'登录','/auth/login','Mail登录',NULL,0,1),(5,'登录','/authen/login','Name登录',NULL,0,1),(6,'JSON','/member','JSON返回',NULL,0,1),(7,'自动生成','/log','组件自动生成',NULL,0,1),(8,'Session','/test/session','Session',NULL,0,1),(9,'中间件','/test/mw?age=17','路由中间件',NULL,0,1);

/*Table structure for table `events` */

DROP TABLE IF EXISTS `events`;

CREATE TABLE `events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `location` text COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `events` */

/*Table structure for table `groups` */

DROP TABLE IF EXISTS `groups`;

CREATE TABLE `groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `groups_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `groups` */

/*Table structure for table `members` */

DROP TABLE IF EXISTS `members`;

CREATE TABLE `members` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `members` */

insert  into `members`(`id`,`name`,`email`,`first_name`,`last_name`,`created_at`,`updated_at`,`deleted_at`,`status`) values (1,'xugp','admin@admin.com',NULL,NULL,'2016-05-13 09:15:57','2016-05-23 08:04:53',NULL,1),(2,'ping','ad@ad.com',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',NULL,0);

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `migrations` */

/*Table structure for table `pages` */

DROP TABLE IF EXISTS `pages`;

CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nav_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `css` text COLLATE utf8_unicode_ci,
  `js` text COLLATE utf8_unicode_ci,
  `show_title` tinyint(1) NOT NULL DEFAULT '1',
  `show_nav` tinyint(1) NOT NULL DEFAULT '1',
  `icon` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `pages` */

/*Table structure for table `photos` */

DROP TABLE IF EXISTS `photos`;

CREATE TABLE `photos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` int(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `photos` */

insert  into `photos`(`id`,`name`,`created_at`,`updated_at`) values (1,1,NULL,NULL),(5,5,NULL,NULL),(6,5,NULL,NULL),(7,7,NULL,NULL),(8,8,NULL,NULL),(9,6,NULL,NULL);

/*Table structure for table `posts` */

DROP TABLE IF EXISTS `posts`;

CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `summary` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `posts` */

insert  into `posts`(`id`,`title`,`summary`,`content`,`user_id`,`created_at`,`updated_at`,`deleted_at`,`status`) values (1,'1','','22\'',0,'2016-05-23 14:27:49','2016-05-24 01:30:03',NULL,1),(2,'2','','22\'',0,'2016-05-23 14:29:14','2016-06-02 16:04:33',NULL,1),(3,'3','','22\'',0,'2016-05-23 14:37:31','2016-05-24 01:28:28',NULL,1),(4,'4','','22',0,'2016-05-23 14:40:07','2016-05-24 01:28:26',NULL,1),(5,'5','6','7',0,'2016-05-23 15:06:42','2016-05-24 01:28:25',NULL,1),(6,'6','7','9',0,'2016-05-23 15:08:54','2016-05-24 01:28:13',NULL,1),(14,'7','7','999',0,'0000-00-00 00:00:00','2016-05-24 01:30:27',NULL,1),(15,'0','','0',0,'2016-05-24 01:30:12','2016-06-02 16:16:04','2016-06-02 16:16:04',1),(16,'1','','1',0,'2016-05-24 01:30:20','2016-05-24 01:30:20',NULL,1),(17,'8888888','','888888888888888',0,'2016-05-24 06:07:04','2016-06-02 15:37:31',NULL,1),(18,'9000','','90000',0,'2016-05-24 06:07:12','2016-06-02 15:50:53',NULL,1);

/*Table structure for table `qw_article` */

DROP TABLE IF EXISTS `qw_article`;

CREATE TABLE `qw_article` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) NOT NULL COMMENT '分类id',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `keywords` varchar(255) NOT NULL COMMENT '关键词',
  `description` varchar(255) NOT NULL COMMENT '摘要',
  `thumbnail` varchar(255) NOT NULL COMMENT '缩略图',
  `content` text NOT NULL COMMENT '内容',
  `t` int(10) unsigned NOT NULL COMMENT '时间',
  `n` int(10) unsigned NOT NULL COMMENT '点击',
  PRIMARY KEY (`aid`),
  KEY `sid` (`sid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `qw_article` */

insert  into `qw_article`(`aid`,`sid`,`title`,`keywords`,`description`,`thumbnail`,`content`,`t`,`n`) values (1,1,'tesgt','test','顶你一下吧，你的说明解决了我的问题，我修改default_group=\'admin\'，\r\n发现问题了，5.4的php参数不能写$POST ','','<span style=\"color:#323232;font-family:\'Century Gothic\', \'Microsoft yahei\';font-size:16px;line-height:25.6px;background-color:#FFFFFF;\">顶你一下吧，你的说明解决了我的问题，我修改default_group=\'admin\'，</span><br />\r\n<span style=\"color:#323232;font-family:\'Century Gothic\', \'Microsoft yahei\';font-size:16px;line-height:25.6px;background-color:#FFFFFF;\">发现问题了，5.4的php参数不能写$POST ,我吧参数名改成$POST1就行了</span><br />\r\n<span style=\"color:#323232;font-family:\'Century Gothic\', \'Microsoft yahei\';font-size:16px;line-height:25.6px;background-color:#FFFFFF;\">之前一直default_group=\'index\'，然后指向admin，一直空白也没报错</span><br />\r\n<span style=\"color:#323232;font-family:\'Century Gothic\', \'Microsoft yahei\';font-size:16px;line-height:25.6px;background-color:#FFFFFF;\">原来action/admin/Index.class.php的参数出错了</span><br />\r\n<span style=\"color:#323232;font-family:\'Century Gothic\', \'Microsoft yahei\';font-size:16px;line-height:25.6px;background-color:#FFFFFF;\">把参数改成$POST1，可能登陆后台了</span>',1460879800,0);

/*Table structure for table `qw_auth_group` */

DROP TABLE IF EXISTS `qw_auth_group`;

CREATE TABLE `qw_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` varchar(255) NOT NULL DEFAULT '',
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Data for the table `qw_auth_group` */

insert  into `qw_auth_group`(`id`,`title`,`status`,`rules`,`updated_at`,`created_at`,`deleted_at`) values (1,'超级管理员',1,'1,2,58,65,59,60,61,62,3,56,4,6,5,7,8,9,10,51,52,53,57,11,54,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,29,30,31,32,33,34,36,37,38,39,40,41,42,43,44,45,46,47,63,48,49,50,55','2016-05-20 23:06:42',NULL,NULL),(2,'管理员',1,'1,66,85,86,87,88,92,67,75,69,70,76,77,72,79,80,68,90,89,81,91,82,83,94,84,73,13,14,15,16,17,18,37,48,49,71,74,55,50','2016-05-20 23:10:16',NULL,NULL),(3,'普通用户',1,'1,66,85,86,87,88,92,67,75,69,70,76,77,72,79,80,68,90,89,91,94,73,37,63,48,49,71,74,55,50','2016-05-20 23:04:33',NULL,NULL),(8,'4-02-01---test',1,'','2016-05-22 13:47:45',NULL,NULL),(9,'5-test',1,'','2016-05-22 13:47:53',NULL,NULL),(10,'6-test',1,'','2016-05-22 13:50:30',NULL,NULL),(11,'7',1,'','2016-05-20 23:41:47',NULL,NULL),(12,'8',1,'','2016-05-20 23:11:08',NULL,NULL),(13,'10',1,'','2016-05-20 23:11:06',NULL,NULL),(14,'4-02-02----',0,'','2016-06-02 16:13:48','2016-05-22 03:59:01',NULL),(15,'4-0288',1,'','2016-05-22 06:47:39','2016-05-22 03:59:17',NULL),(16,'xugp',1,'','2016-05-22 13:50:37','2016-05-22 13:50:37',NULL),(17,'0000',1,'','2016-05-23 07:10:40','2016-05-23 07:10:40',NULL),(18,'0000',1,'','2016-06-02 16:10:01','2016-06-02 16:10:01',NULL),(19,'',0,'','2016-06-02 17:58:06','2016-06-02 17:57:59',NULL),(20,'0000',1,'','2016-06-02 18:24:36','2016-06-02 18:24:36',NULL),(21,'0000',1,'','2016-06-02 18:25:33','2016-06-02 18:25:33',NULL),(22,'',1,'','2016-06-02 18:28:46','2016-06-02 18:28:46',NULL),(23,'0000',1,'','2016-06-02 18:40:27','2016-06-02 18:40:27',NULL),(24,'xugp',1,'','2016-06-02 18:40:43','2016-06-02 18:40:43',NULL),(25,'0000',1,'','2016-06-02 18:42:02','2016-06-02 18:42:02',NULL),(26,'',1,'','2016-06-02 18:42:55','2016-06-02 18:42:55',NULL),(27,'',1,'','2016-06-02 18:43:45','2016-06-02 18:43:45',NULL),(28,'',1,'','2016-06-02 18:43:48','2016-06-02 18:43:48',NULL);

/*Table structure for table `qw_auth_group_access` */

DROP TABLE IF EXISTS `qw_auth_group_access`;

CREATE TABLE `qw_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `qw_auth_group_access` */

insert  into `qw_auth_group_access`(`uid`,`group_id`) values (1,1),(2,1),(3,3),(9,2),(10,2);

/*Table structure for table `qw_auth_rule` */

DROP TABLE IF EXISTS `qw_auth_rule`;

CREATE TABLE `qw_auth_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `name` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `icon` varchar(255) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `condition` char(100) NOT NULL DEFAULT '',
  `islink` tinyint(1) NOT NULL DEFAULT '1',
  `o` int(11) NOT NULL COMMENT '排序',
  `tips` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;

/*Data for the table `qw_auth_rule` */

insert  into `qw_auth_rule`(`id`,`pid`,`name`,`title`,`icon`,`type`,`status`,`condition`,`islink`,`o`,`tips`) values (1,0,'Index/index','控制台','menu-icon fa fa-tachometer',1,1,'',1,1,'友情提示：经常查看操作日志，发现异常以便及时追查原因。'),(2,0,'','系统设置','menu-icon fa fa-cog',1,1,'',1,2,''),(3,2,'Setting/setting','网站设置','menu-icon fa fa-caret-right',1,1,'',1,3,'这是网站设置的提示。'),(4,2,'Menu/index','后台菜单','menu-icon fa fa-caret-right',1,1,'',1,4,''),(5,2,'Menu/add','新增菜单','menu-icon fa fa-caret-right',1,1,'',1,5,''),(6,4,'Menu/edit','编辑菜单','',1,1,'',0,6,''),(7,2,'Menu/update','保存菜单','menu-icon fa fa-caret-right',1,1,'',0,7,''),(8,2,'Menu/del','删除菜单','menu-icon fa fa-caret-right',1,1,'',0,8,''),(9,2,'Database/backup','数据库备份','menu-icon fa fa-caret-right',1,1,'',1,9,''),(10,9,'Database/recovery','数据库还原','',1,1,'',0,10,''),(11,2,'Update/update','在线升级','menu-icon fa fa-caret-right',1,1,'',1,11,''),(12,2,'Update/devlog','开发日志','menu-icon fa fa-caret-right',1,1,'',1,12,''),(13,0,'','用户及组','menu-icon fa fa-users',1,1,'',1,13,''),(14,13,'Member/index','用户管理','menu-icon fa fa-caret-right',1,1,'',1,14,''),(15,13,'Member/add','新增用户','menu-icon fa fa-caret-right',1,1,'',1,15,''),(16,13,'Member/edit','编辑用户','menu-icon fa fa-caret-right',1,1,'',0,16,''),(17,13,'Member/update','保存用户','menu-icon fa fa-caret-right',1,1,'',0,17,''),(18,13,'Member/del','删除用户','',1,1,'',0,18,''),(19,13,'Group/index','用户组管理','menu-icon fa fa-caret-right',1,1,'',1,19,''),(20,13,'Group/add','新增用户组','menu-icon fa fa-caret-right',1,1,'',1,20,''),(21,13,'Group/edit','编辑用户组','menu-icon fa fa-caret-right',1,1,'',0,21,''),(22,13,'Group/update','保存用户组','menu-icon fa fa-caret-right',1,1,'',0,22,''),(23,13,'Group/del','删除用户组','',1,1,'',0,23,''),(24,0,'','网站内容','menu-icon fa fa-desktop',1,1,'',1,24,''),(25,24,'Article/index','文章管理','menu-icon fa fa-caret-right',1,1,'',1,25,'网站虽然重要，身体更重要，出去走走吧。'),(26,24,'Article/add','新增文章','menu-icon fa fa-caret-right',1,1,'',1,26,''),(27,24,'Article/edit','编辑文章','menu-icon fa fa-caret-right',1,1,'',0,27,''),(29,24,'Article/update','保存文章','menu-icon fa fa-caret-right',1,1,'',0,29,''),(30,24,'Article/del','删除文章','',1,1,'',0,30,''),(31,24,'Category/index','分类管理','menu-icon fa fa-caret-right',1,1,'',1,31,''),(32,24,'Category/add','新增分类','menu-icon fa fa-caret-right',1,1,'',1,32,''),(33,24,'Category/edit','编辑分类','menu-icon fa fa-caret-right',1,1,'',0,33,''),(34,24,'Category/update','保存分类','menu-icon fa fa-caret-right',1,1,'',0,34,''),(36,24,'Category/del','删除分类','',1,1,'',0,36,''),(37,0,'','其它功能','menu-icon fa fa-legal',1,1,'',1,37,''),(38,37,'Link/index','友情链接','menu-icon fa fa-caret-right',1,1,'',1,38,''),(39,37,'Link/add','增加链接','',1,1,'',1,39,''),(40,37,'Link/edit','编辑链接','',1,1,'',0,40,''),(41,37,'Link/update','保存链接','',1,1,'',0,41,''),(42,37,'Link/del','删除链接','',1,1,'',0,42,''),(43,37,'Flash/index','焦点图','menu-icon fa fa-desktop',1,1,'',1,43,''),(44,37,'Flash/add','新增焦点图','',1,1,'',1,44,''),(45,37,'Flash/update','保存焦点图','',1,1,'',0,45,''),(46,37,'Flash/edit','编辑焦点图','',1,1,'',0,46,''),(47,37,'Flash/del','删除焦点图','',1,1,'',0,47,''),(48,0,'Personal/index','个人中心','menu-icon fa fa-user',1,1,'',1,48,''),(49,48,'Personal/profile','个人资料','menu-icon fa fa-user',1,1,'',1,49,''),(50,48,'Logout/index','退出','',1,1,'',1,70,''),(51,9,'Database/export','备份','',1,1,'',0,51,''),(52,9,'Database/optimize','数据优化','',1,1,'',0,52,''),(53,9,'Database/repair','修复表','',1,1,'',0,53,''),(54,11,'Update/updating','升级安装','',1,1,'',0,54,''),(55,48,'Personal/update','资料保存','',1,1,'',0,60,''),(56,3,'Setting/update','设置保存','',1,1,'',0,56,''),(57,9,'Database/del','备份删除','',1,1,'',0,57,''),(58,2,'variable/index','自定义变量','',1,1,'',1,0,''),(59,58,'variable/add','新增变量','',1,1,'',0,0,''),(60,58,'variable/edit','编辑变量','',1,1,'',0,0,''),(61,58,'variable/update','保存变量','',1,1,'',0,0,''),(62,58,'variable/del','删除变量','',1,1,'',0,0,''),(63,37,'Facebook/add','用户反馈','',1,1,'',1,63,''),(66,0,'Flow/index','流量管理','menu-icon fa fa-desktop',1,1,'',1,2,'流量管理'),(67,66,'Subscriber/index','订单管理(省内)','menu-icon fa fa-caret-right ',1,1,'',1,1,''),(68,66,'Ship/index','订单预览(省内)','menu-icon fa fa-caret-right ',1,1,'',1,32,''),(69,66,'Subscriber/add','新增订单（省内）','menu-icon fa fa-caret-right ',1,1,'',0,3,''),(70,66,'Subscriber/edit','修改订单（省内）','menu-icon fa fa-caret-right ',1,1,'',0,5,''),(72,66,'Ship/order','订单分销','menu-icon fa fa-caret-right ',1,1,'',0,20,''),(71,48,'Personal/flow','我的流量','menu-icon fa fa-user',1,1,'',1,51,''),(73,66,'Ship/historyOrder','历史分销信息','menu-icon fa fa-caret-right ',1,1,'',1,40,''),(74,48,'Orderlog/index','订购日志','',1,1,'',1,55,''),(75,66,'Subscriberc/index','订单管理(全国)','menu-icon fa fa-caret-right ',1,1,'',1,2,''),(76,66,'ExcleSubscriber/imp','订单导入(省内)','menu-icon fa fa-caret-right ',1,1,'',0,13,''),(77,66,'ExcelSubscriberc/imp','订单导入(全国)','menu-icon fa fa-caret-right ',1,1,'',0,14,''),(79,66,'ExcelSubscriber/add','批量新增(省内)','menu-icon fa fa-caret-right ',1,1,'',1,30,''),(80,66,'ExcelSubscriberc/add','批量新增(全国)','menu-icon fa fa-caret-right ',1,1,'',1,31,''),(81,66,'Flowadvance/index','预分配流量(省内)','menu-icon fa fa-caret-right ',1,1,'',0,34,''),(82,66,'Flowadvance/edit','预分配流量(省内)','menu-icon fa fa-caret-right ',1,1,'',0,35,''),(83,66,'Flowadvancec/index','预分配流量(全国)','menu-icon fa fa-caret-right ',1,1,'',0,36,''),(84,66,'Flowadvancec/edit','预分配流量(全国)','menu-icon fa fa-caret-right ',1,1,'',0,37,''),(85,66,'Subscriber/update','订单保存（省内）','menu-icon fa fa-caret-right ',1,1,'',0,0,''),(86,66,'Subscriberc/add','新增订单（全国）','menu-icon fa fa-caret-right ',1,1,'',0,0,''),(87,66,'Subscriberc/update','保存订单（全国）','menu-icon fa fa-caret-right ',1,1,'',0,0,''),(88,66,'Subscriberc/edit','修改订单（全国）','menu-icon fa fa-caret-right ',1,1,'',0,0,''),(89,66,'ExcelSubscriber/imp','订单导入','',1,1,'',0,33,''),(90,66,'Shipc/index','订单预览(全国)','menu-icon fa fa-caret-right ',1,1,'',1,33,''),(91,66,'Member/info','流量包信息','',1,1,'',1,35,''),(92,66,'Member/flow','流量包信息','',1,1,'',0,0,''),(94,66,'Member/detail','流量包明细','',1,1,'',0,36,'');

/*Table structure for table `qw_category` */

DROP TABLE IF EXISTS `qw_category`;

CREATE TABLE `qw_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '父ID',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `keywords` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `o` int(11) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `fsid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `qw_category` */

insert  into `qw_category`(`id`,`pid`,`name`,`keywords`,`description`,`o`) values (1,0,'学习','','',1),(2,0,'生活','','',2);

/*Table structure for table `qw_devlog` */

DROP TABLE IF EXISTS `qw_devlog`;

CREATE TABLE `qw_devlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `v` varchar(225) NOT NULL COMMENT '版本号',
  `y` int(4) NOT NULL COMMENT '年分',
  `t` int(10) NOT NULL COMMENT '发布日期',
  `log` text NOT NULL COMMENT '更新日志',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `qw_devlog` */

insert  into `qw_devlog`(`id`,`v`,`y`,`t`,`log`) values (1,'1.0.0',2016,1440259200,'QWADMIN第一个版本发布。');

/*Table structure for table `qw_flash` */

DROP TABLE IF EXISTS `qw_flash`;

CREATE TABLE `qw_flash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `pic` varchar(255) NOT NULL,
  `o` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `o` (`o`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `qw_flash` */

insert  into `qw_flash`(`id`,`title`,`url`,`pic`,`o`) values (1,'111','11111','/Public/attached/201604/1460879870.jpg',0);

/*Table structure for table `qw_links` */

DROP TABLE IF EXISTS `qw_links`;

CREATE TABLE `qw_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `o` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `o` (`o`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `qw_links` */

/*Table structure for table `qw_log` */

DROP TABLE IF EXISTS `qw_log`;

CREATE TABLE `qw_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '登录用户的ID',
  `name` varchar(100) NOT NULL,
  `t` int(10) NOT NULL,
  `ip` varchar(16) NOT NULL,
  `log` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL COMMENT '销售品名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `qw_log` */

insert  into `qw_log`(`id`,`uid`,`name`,`t`,`ip`,`log`,`url`) values (1,0,'admin',2147483647,'127.0.0.1','登录失败.验证码错误',''),(2,0,'aa',1461858622,'127.0.0.1','登录失败.验证码错误',NULL),(3,0,'admin',1461858742,'127.0.0.1','登录成功。',NULL),(4,0,'admin',1461858764,'127.0.0.1','登录失败。',NULL),(5,0,'admin',1461858802,'127.0.0.1','登录失败。用户名或密码错误',NULL),(6,0,'test',1461858851,'127.0.0.1','登录失败。用户名或密码错误',NULL),(7,0,'admin',1461858992,'127.0.0.1','登录失败。用户名或密码错误',NULL),(8,0,'admin',1461859008,'127.0.0.1','登录成功.',NULL),(9,0,'test',1461859045,'127.0.0.1','登录成功.',NULL),(10,NULL,'test',1461859107,'127.0.0.1','登录成功.',NULL),(11,NULL,'test',1461859193,'127.0.0.1','登录成功.',NULL),(12,0,'test',1461859212,'127.0.0.1','登录失败.验证码错误',NULL),(13,10,'test',1461859224,'127.0.0.1','登录成功.',NULL),(14,1,'admin',1461859499,'127.0.0.1','登录成功.',NULL),(18,0,'',0,'','',''),(19,0,'',0,'','',''),(20,0,'111',0,'','',''),(17,10,'test',1461859519,'127.0.0.1','登录成功.',NULL),(21,0,'test1',0,'','',''),(22,0,'superuser@superuser.com',0,'','',''),(23,0,'ppp',0,'','',''),(24,0,'superuser@superuser.com',0,'','','uuuuuuuuuuuuu');

/*Table structure for table `qw_member` */

DROP TABLE IF EXISTS `qw_member`;

CREATE TABLE `qw_member` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(225) NOT NULL,
  `head` varchar(255) NOT NULL DEFAULT '/Public/attached/201601/1453389194.png' COMMENT '头像',
  `sex` tinyint(1) NOT NULL COMMENT '0保密1男，2女',
  `birthday` int(10) NOT NULL COMMENT '生日',
  `phone` varchar(20) NOT NULL COMMENT '协销工号ID  在分销平台注册的手机号',
  `qq` varchar(20) NOT NULL COMMENT 'QQ',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `password` varchar(32) NOT NULL,
  `t` int(10) unsigned NOT NULL COMMENT '注册时间',
  `actioncode` varchar(20) DEFAULT NULL COMMENT '接口编号',
  `intersource` varchar(20) DEFAULT NULL COMMENT '渠道号',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `pid` int(11) DEFAULT '0' COMMENT '创建人ID',
  `path` varchar(255) DEFAULT '0' COMMENT '创建人关系',
  `level` int(5) DEFAULT '0' COMMENT '层级',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `qw_member` */

insert  into `qw_member`(`uid`,`user`,`head`,`sex`,`birthday`,`phone`,`qq`,`email`,`password`,`t`,`actioncode`,`intersource`,`status`,`pid`,`path`,`level`) values (1,'admin','/Public/attached/201601/1453389194.png',1,1420128000,'phone','8688041','8688041@qq.com','3c31e87090716a4a34c7510c6624439d',1460877411,'jiekou','qudao',1,0,'0',0),(3,'xugp','/Public/attached/201601/1453389194.png',0,-28800,'111','','','0fa5933c7d220e1334ba99d6f751074c',1461423906,NULL,NULL,1,9,'0-1-9',2),(2,'duping','/Public/attached/201604/1461596799.jpg',0,-28800,'15251823848','','','0fa5933c7d220e1334ba99d6f751074c',1461423582,'order_qixin_001','200305',1,0,'0-1',1),(10,'test','/Public/attached/201601/1453389194.png',0,631123200,'15251823848','','','4b181e5bfd525679f9f52de3899eb519',1461725025,'order_qixin_001','200305',1,0,'0-1',1);

/*Table structure for table `qw_order` */

DROP TABLE IF EXISTS `qw_order`;

CREATE TABLE `qw_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` int(11) NOT NULL COMMENT '分销商ID',
  `user` varchar(50) NOT NULL COMMENT '用户名',
  `phone` varchar(20) NOT NULL COMMENT '用户电话',
  `flow` int(5) NOT NULL DEFAULT '0' COMMENT '流量，单位Mb',
  `goodsid` varchar(20) DEFAULT NULL COMMENT '商品ID',
  `goodsname` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `result` tinyint(1) DEFAULT NULL COMMENT '0已经发货,非0表示订购失败原因',
  `description` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) DEFAULT NULL COMMENT '修改时间',
  `ship_time` int(10) DEFAULT NULL COMMENT '发货时间',
  `actived` tinyint(1) DEFAULT '1' COMMENT '1:生效;0:无效',
  `reqid` varchar(64) DEFAULT NULL COMMENT '订单号',
  `parid` varchar(10) DEFAULT NULL COMMENT '上级ID',
  `province` tinyint(1) DEFAULT NULL COMMENT '1:省内;2:全国',
  `createdtype` tinyint(1) DEFAULT '1' COMMENT '1:手工录入;2:导入',
  `flowid` int(11) DEFAULT '0' COMMENT '对应流量包ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `qw_order` */

/*Table structure for table `qw_setting` */

DROP TABLE IF EXISTS `qw_setting`;

CREATE TABLE `qw_setting` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `k` varchar(100) NOT NULL COMMENT '变量',
  `v` varchar(255) NOT NULL COMMENT '值',
  `type` tinyint(1) NOT NULL COMMENT '0系统，1自定义',
  `name` varchar(255) NOT NULL COMMENT '说明',
  PRIMARY KEY (`id`,`k`),
  KEY `k` (`k`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `qw_setting` */

insert  into `qw_setting`(`id`,`k`,`v`,`type`,`name`) values (1,'sitename','培育科技',0,''),(2,'title','流量分销管理系统',0,''),(3,'keywords','关键词',0,''),(4,'description','网站描述',0,''),(5,'footer','2016©培育科技',0,''),(6,'test','测试',1,'测试变量');

/*Table structure for table `qw_subscriber` */

DROP TABLE IF EXISTS `qw_subscriber`;

CREATE TABLE `qw_subscriber` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` int(11) NOT NULL COMMENT '分销商ID',
  `user` varchar(50) NOT NULL COMMENT '用户名',
  `phone` varchar(20) NOT NULL COMMENT '用户电话',
  `flow` int(5) NOT NULL DEFAULT '0' COMMENT '流量，单位Mb',
  `goodsid` varchar(20) DEFAULT NULL COMMENT '商品ID',
  `goodsname` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `result` tinyint(1) DEFAULT NULL COMMENT '0已经发货,非0表示订购失败原因',
  `description` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) DEFAULT NULL COMMENT '修改时间',
  `ship_time` int(10) DEFAULT NULL COMMENT '发货时间',
  `actived` tinyint(1) DEFAULT '1' COMMENT '1:生效;0:无效',
  `reqid` varchar(64) DEFAULT NULL COMMENT '订单号',
  `parid` varchar(10) DEFAULT NULL COMMENT '上级ID',
  `province` tinyint(1) DEFAULT NULL COMMENT '1:省内;2:全国',
  `createdtype` tinyint(1) DEFAULT '1' COMMENT '1:手工录入;2:导入',
  `flowid` int(11) DEFAULT '0' COMMENT '对应流量包ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `qw_subscriber` */

/*Table structure for table `revisions` */

DROP TABLE IF EXISTS `revisions`;

CREATE TABLE `revisions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `revisionable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `revisionable_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `old_value` text COLLATE utf8_unicode_ci,
  `new_value` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `revisions` */

/*Table structure for table `tasks` */

DROP TABLE IF EXISTS `tasks`;

CREATE TABLE `tasks` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` int(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tasks` */

insert  into `tasks`(`id`,`name`,`created_at`,`updated_at`,`status`) values (8,0,'2016-05-19 15:31:04','2016-05-19 15:31:04',1);

/*Table structure for table `throttle` */

DROP TABLE IF EXISTS `throttle`;

CREATE TABLE `throttle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempts` int(11) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `banned` tinyint(1) NOT NULL DEFAULT '0',
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `suspended_at` timestamp NULL DEFAULT NULL,
  `banned_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `throttle_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `throttle` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `activated` tinyint(1) NOT NULL DEFAULT '0',
  `activation_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `persist_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `confirmation_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirmed` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `remember_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_activation_code_index` (`activation_code`),
  KEY `users_reset_password_code_index` (`reset_password_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`password`,`permissions`,`activated`,`activation_code`,`activated_at`,`last_login`,`persist_code`,`reset_password_code`,`first_name`,`last_name`,`created_at`,`updated_at`,`deleted_at`,`confirmation_code`,`confirmed`,`status`,`remember_token`) values (1,'xugp','xugp@xugp.com','$2y$10$25ofiVmkmFMlo5s7ERGCg.TYCGb2vpHw2AlUCkK7yLm8f4XtXFnZ2',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-05-13 09:15:57','2016-06-01 10:55:02',NULL,'082b0fa7d37702721219b41ab7c39400','1',1,'iohaYvKACLrK6TpsAzQ8bWz6Gqd2VKWMjWH8X8SnyGosVgxa09jZVlN1kWkO'),(2,'ping','admin@admin.com','$2Y$10$T9DqgU3OlGOHHBKRL/tS4.CXyx6VZ.HhlT.otvMWk55zQ3EZB8Sze',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',NULL,NULL,NULL,0,NULL),(3,'test','superuser@superuser.com','$2Y$10$1anMrU888G.Y6tft/hQ2aeDmRwtufrBjqqQv.1wvpOHflmdVtGweu',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `users_groups` */

DROP TABLE IF EXISTS `users_groups`;

CREATE TABLE `users_groups` (
  `user_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `users_groups` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
