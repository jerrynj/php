/*
SQLyog Ultimate v8.71 
MySQL - 5.7.21-log : Database - typicms
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`typicms` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `typicms`;

/*Table structure for table `typicms_blocks` */

DROP TABLE IF EXISTS `typicms_blocks`;

CREATE TABLE `typicms_blocks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` json NOT NULL,
  `body` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `typicms_blocks` */

/*Table structure for table `typicms_files` */

DROP TABLE IF EXISTS `typicms_files`;

CREATE TABLE `typicms_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `folder_id` int(10) unsigned DEFAULT NULL,
  `type` enum('a','v','d','i','o','f') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extension` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mimetype` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `width` int(10) unsigned DEFAULT NULL,
  `height` int(10) unsigned DEFAULT NULL,
  `filesize` int(10) unsigned DEFAULT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  `description` json NOT NULL,
  `alt_attribute` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `files_folder_id_foreign` (`folder_id`),
  CONSTRAINT `files_folder_id_foreign` FOREIGN KEY (`folder_id`) REFERENCES `typicms_files` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `typicms_files` */

/*Table structure for table `typicms_history` */

DROP TABLE IF EXISTS `typicms_history`;

CREATE TABLE `typicms_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `historable_id` int(10) unsigned NOT NULL,
  `historable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `historable_table` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `old` json NOT NULL,
  `new` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `typicms_history` */

insert  into `typicms_history`(`id`,`historable_id`,`historable_type`,`user_id`,`title`,`icon_class`,`locale`,`historable_table`,`action`,`old`,`new`,`created_at`,`updated_at`) values (1,1,'TypiCMS\\Modules\\Users\\Models\\User',NULL,'Jerry Xu','fa-plus-circle',NULL,'users','created','[]','{\"id\": 1, \"email\": \"admin@admin.com\", \"token\": \"X60ocjgAhHS439sRyhNnFXoXpcBCtK\", \"activated\": 1, \"last_name\": \"Xu\", \"superuser\": 1, \"created_at\": \"2018-04-01 13:00:27\", \"first_name\": \"Jerry\", \"updated_at\": \"2018-04-01 13:00:27\"}','2018-04-01 13:00:27','2018-04-01 13:00:27');
insert  into `typicms_history`(`id`,`historable_id`,`historable_type`,`user_id`,`title`,`icon_class`,`locale`,`historable_table`,`action`,`old`,`new`,`created_at`,`updated_at`) values (2,1,'TypiCMS\\Modules\\News\\Models\\News',1,'test','fa-plus-circle',NULL,'news','created','[]','{\"id\": 1, \"body\": {\"en\": \"<p>Pages are nestable with drag and drop, on drop, URIs are generated and saved in the database. Each translation of a page has its own route. A page can be linked to a module. A page can have multiple sections.Pages are nestable with drag and drop, on drop, URIs are generated and saved in the database. Each translation of a page has its own route. A page can be linked to a module. A page can have multiple sections.Pages are nestable with drag and drop, on drop, URIs are generated and saved in the database. Each translation of a page has its own route. A page can be linked to a module. A page can have multiple sections.Pages are nestable with drag and drop, on drop, URIs are generated and saved in the database. Each translation of a page has its own route. A page can be linked to a module. A page can have multiple sections.</p>\", \"fr\": null, \"nl\": null}, \"date\": \"2018-04-01 00:00:00\", \"slug\": {\"en\": \"test\", \"fr\": null, \"nl\": null}, \"files\": [], \"image\": null, \"thumb\": \"\", \"title\": {\"en\": \"test\", \"fr\": null, \"nl\": null}, \"status\": {\"en\": \"0\", \"fr\": \"0\", \"nl\": \"0\"}, \"summary\": {\"en\": \"test\", \"fr\": null, \"nl\": null}, \"created_at\": \"2018-04-01 13:39:33\", \"updated_at\": \"2018-04-01 13:39:33\", \"title_translated\": \"test\", \"status_translated\": \"0\"}','2018-04-01 13:39:33','2018-04-01 13:39:33');
insert  into `typicms_history`(`id`,`historable_id`,`historable_type`,`user_id`,`title`,`icon_class`,`locale`,`historable_table`,`action`,`old`,`new`,`created_at`,`updated_at`) values (3,1,'TypiCMS\\Modules\\News\\Models\\News',1,'test','fa-edit',NULL,'news','updated','{\"status\": {\"en\": \"0\"}, \"updated_at\": \"2018-04-01 13:39:33\"}','{\"status\": {\"en\": \"1\"}, \"updated_at\": \"2018-04-01 13:39:40\"}','2018-04-01 13:39:40','2018-04-01 13:39:40');

/*Table structure for table `typicms_menulinks` */

DROP TABLE IF EXISTS `typicms_menulinks`;

CREATE TABLE `typicms_menulinks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned NOT NULL,
  `page_id` int(10) unsigned DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  `target` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `has_categories` tinyint(1) DEFAULT NULL,
  `status` json NOT NULL,
  `title` json NOT NULL,
  `url` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menulinks_menu_id_foreign` (`menu_id`),
  KEY `menulinks_parent_id_foreign` (`parent_id`),
  CONSTRAINT `menulinks_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `typicms_menus` (`id`) ON DELETE CASCADE,
  CONSTRAINT `menulinks_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `typicms_menulinks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `typicms_menulinks` */

insert  into `typicms_menulinks`(`id`,`menu_id`,`page_id`,`parent_id`,`position`,`target`,`class`,`icon_class`,`has_categories`,`status`,`title`,`url`,`created_at`,`updated_at`) values (1,1,1,NULL,1,'','',NULL,0,'{\"en\": \"1\", \"fr\": \"1\", \"nl\": \"1\"}','{\"en\": \"Home\", \"fr\": \"Accueil\", \"nl\": \"Home\"}','{\"en\": \"\", \"fr\": \"\", \"nl\": \"\"}','2014-03-28 22:08:05','2014-03-28 18:58:25');
insert  into `typicms_menulinks`(`id`,`menu_id`,`page_id`,`parent_id`,`position`,`target`,`class`,`icon_class`,`has_categories`,`status`,`title`,`url`,`created_at`,`updated_at`) values (2,1,2,NULL,2,'','',NULL,0,'{\"en\": \"1\", \"fr\": \"1\", \"nl\": \"1\"}','{\"en\": \"Contact\", \"fr\": \"Contact\", \"nl\": \"Contact\"}','{\"en\": \"\", \"fr\": \"\", \"nl\": \"\"}','2014-03-28 23:18:49','2014-03-28 18:58:25');
insert  into `typicms_menulinks`(`id`,`menu_id`,`page_id`,`parent_id`,`position`,`target`,`class`,`icon_class`,`has_categories`,`status`,`title`,`url`,`created_at`,`updated_at`) values (3,2,2,NULL,1,'','',NULL,0,'{\"en\": \"1\", \"fr\": \"1\", \"nl\": \"1\"}','{\"en\": \"Contact\", \"fr\": \"Contact\", \"nl\": \"Contact\"}','{\"en\": \"\", \"fr\": \"\", \"nl\": \"\"}','2014-03-28 17:20:16','2014-03-28 13:32:46');
insert  into `typicms_menulinks`(`id`,`menu_id`,`page_id`,`parent_id`,`position`,`target`,`class`,`icon_class`,`has_categories`,`status`,`title`,`url`,`created_at`,`updated_at`) values (4,2,3,NULL,2,'','',NULL,0,'{\"en\": \"1\", \"fr\": \"1\", \"nl\": \"1\"}','{\"en\": \"Terms of use\", \"fr\": \"Conditions d’utilisation\", \"nl\": \"Gebruiksvoorwaarden\"}','{\"fr\": \"\"}','2014-03-28 17:20:43','2014-03-28 17:31:37');
insert  into `typicms_menulinks`(`id`,`menu_id`,`page_id`,`parent_id`,`position`,`target`,`class`,`icon_class`,`has_categories`,`status`,`title`,`url`,`created_at`,`updated_at`) values (5,3,0,NULL,1,'_blank','btn-facebook','fa fa-facebook fa-fw',0,'{\"en\": \"1\", \"fr\": \"1\", \"nl\": \"1\"}','{\"en\": \"Facebook\", \"fr\": \"Facebook\", \"nl\": \"Facebook\"}','{\"en\": \"https://www.facebook.com\", \"fr\": \"https://www.facebook.com\", \"nl\": \"https://www.facebook.com\"}','2014-03-28 18:30:11','2014-03-28 18:30:17');
insert  into `typicms_menulinks`(`id`,`menu_id`,`page_id`,`parent_id`,`position`,`target`,`class`,`icon_class`,`has_categories`,`status`,`title`,`url`,`created_at`,`updated_at`) values (6,3,0,NULL,2,'_blank','btn-twitter','fa fa-twitter fa-fw',0,'{\"en\": \"1\", \"fr\": \"1\", \"nl\": \"1\"}','{\"en\": \"Twitter\", \"fr\": \"Twitter\", \"nl\": \"Twitter\"}','{\"en\": \"https://twitter.com\", \"fr\": \"https://twitter.com\", \"nl\": \"https://twitter.com\"}','2014-03-28 18:31:35','2014-03-28 18:31:47');

/*Table structure for table `typicms_menus` */

DROP TABLE IF EXISTS `typicms_menus`;

CREATE TABLE `typicms_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `typicms_menus` */

insert  into `typicms_menus`(`id`,`name`,`class`,`status`,`created_at`,`updated_at`) values (1,'main','','{\"en\": \"1\", \"fr\": \"1\", \"nl\": \"1\"}','2013-09-03 22:05:21','2014-02-17 16:00:00');
insert  into `typicms_menus`(`id`,`name`,`class`,`status`,`created_at`,`updated_at`) values (2,'footer','','{\"en\": \"1\", \"fr\": \"1\", \"nl\": \"1\"}','2013-09-03 22:05:42','2014-02-17 16:00:00');
insert  into `typicms_menus`(`id`,`name`,`class`,`status`,`created_at`,`updated_at`) values (3,'social','','{\"en\": \"1\", \"fr\": \"1\", \"nl\": \"1\"}','2014-02-04 18:27:18','2014-02-17 16:00:00');

/*Table structure for table `typicms_migrations` */

DROP TABLE IF EXISTS `typicms_migrations`;

CREATE TABLE `typicms_migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `typicms_migrations` */

insert  into `typicms_migrations`(`id`,`migration`,`batch`) values (1,'2012_12_06_225921_create_users_table',1);
insert  into `typicms_migrations`(`id`,`migration`,`batch`) values (2,'2012_12_06_225922_create_password_resets_table',1);
insert  into `typicms_migrations`(`id`,`migration`,`batch`) values (3,'2013_08_29_174626_create_pages_table',1);
insert  into `typicms_migrations`(`id`,`migration`,`batch`) values (4,'2013_09_03_084147_create_menus_tables',1);
insert  into `typicms_migrations`(`id`,`migration`,`batch`) values (5,'2013_09_03_084148_create_menulinks_tables',1);
insert  into `typicms_migrations`(`id`,`migration`,`batch`) values (6,'2013_10_29_224632_create_settings_table',1);
insert  into `typicms_migrations`(`id`,`migration`,`batch`) values (7,'2014_02_28_223553_create_translations_table',1);
insert  into `typicms_migrations`(`id`,`migration`,`batch`) values (8,'2014_05_09_110000_create_files_table',1);
insert  into `typicms_migrations`(`id`,`migration`,`batch`) values (9,'2014_06_19_090602_create_blocks_table',1);
insert  into `typicms_migrations`(`id`,`migration`,`batch`) values (10,'2014_11_03_151402_create_history_table',1);
insert  into `typicms_migrations`(`id`,`migration`,`batch`) values (11,'2017_05_01_172100_create_model_has_files_table',1);
insert  into `typicms_migrations`(`id`,`migration`,`batch`) values (12,'2017_05_22_132900_create_page_sections_table',1);
insert  into `typicms_migrations`(`id`,`migration`,`batch`) values (13,'2018_04_01_125846_create_permission_tables',1);
insert  into `typicms_migrations`(`id`,`migration`,`batch`) values (14,'2013_11_07_185433_create_news_table',2);

/*Table structure for table `typicms_model_has_files` */

DROP TABLE IF EXISTS `typicms_model_has_files`;

CREATE TABLE `typicms_model_has_files` (
  `file_id` int(10) unsigned NOT NULL,
  `model_id` int(10) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(10) unsigned NOT NULL,
  PRIMARY KEY (`file_id`,`model_id`,`model_type`),
  KEY `file` (`model_id`,`model_type`),
  CONSTRAINT `model_has_files_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `typicms_files` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `typicms_model_has_files` */

/*Table structure for table `typicms_news` */

DROP TABLE IF EXISTS `typicms_news`;

CREATE TABLE `typicms_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `image_id` int(10) unsigned DEFAULT NULL,
  `status` json NOT NULL,
  `title` json NOT NULL,
  `slug` json NOT NULL,
  `summary` json NOT NULL,
  `body` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `typicms_news` */

insert  into `typicms_news`(`id`,`date`,`image_id`,`status`,`title`,`slug`,`summary`,`body`,`created_at`,`updated_at`) values (1,'2018-04-01',NULL,'{\"en\": \"1\", \"fr\": \"0\", \"nl\": \"0\"}','{\"en\": \"test\", \"fr\": null, \"nl\": null}','{\"en\": \"test\", \"fr\": null, \"nl\": null}','{\"en\": \"test\", \"fr\": null, \"nl\": null}','{\"en\": \"<p>Pages are nestable with drag and drop, on drop, URIs are generated and saved in the database. Each translation of a page has its own route. A page can be linked to a module. A page can have multiple sections.Pages are nestable with drag and drop, on drop, URIs are generated and saved in the database. Each translation of a page has its own route. A page can be linked to a module. A page can have multiple sections.Pages are nestable with drag and drop, on drop, URIs are generated and saved in the database. Each translation of a page has its own route. A page can be linked to a module. A page can have multiple sections.Pages are nestable with drag and drop, on drop, URIs are generated and saved in the database. Each translation of a page has its own route. A page can be linked to a module. A page can have multiple sections.</p>\", \"fr\": null, \"nl\": null}','2018-04-01 13:39:33','2018-04-01 13:39:40');

/*Table structure for table `typicms_page_sections` */

DROP TABLE IF EXISTS `typicms_page_sections`;

CREATE TABLE `typicms_page_sections` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(10) unsigned NOT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  `status` json NOT NULL,
  `title` json NOT NULL,
  `slug` json NOT NULL,
  `body` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `page_sections_page_id_foreign` (`page_id`),
  CONSTRAINT `page_sections_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `typicms_pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `typicms_page_sections` */

/*Table structure for table `typicms_pages` */

DROP TABLE IF EXISTS `typicms_pages`;

CREATE TABLE `typicms_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` json NOT NULL,
  `uri` json NOT NULL,
  `image_id` int(10) unsigned DEFAULT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  `parent_id` int(10) unsigned DEFAULT NULL,
  `private` tinyint(1) NOT NULL DEFAULT '0',
  `is_home` tinyint(1) NOT NULL DEFAULT '0',
  `redirect` tinyint(1) NOT NULL DEFAULT '0',
  `css` text COLLATE utf8mb4_unicode_ci,
  `js` text COLLATE utf8mb4_unicode_ci,
  `module` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` json NOT NULL,
  `body` json NOT NULL,
  `status` json NOT NULL,
  `meta_keywords` json NOT NULL,
  `meta_description` json NOT NULL,
  `meta_robots_no_index` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `meta_robots_no_follow` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pages_parent_id_foreign` (`parent_id`),
  CONSTRAINT `pages_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `typicms_pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `typicms_pages` */

insert  into `typicms_pages`(`id`,`slug`,`uri`,`image_id`,`position`,`parent_id`,`private`,`is_home`,`redirect`,`css`,`js`,`module`,`template`,`title`,`body`,`status`,`meta_keywords`,`meta_description`,`meta_robots_no_index`,`meta_robots_no_follow`,`created_at`,`updated_at`) values (1,'{\"en\": \"\", \"fr\": \"\", \"nl\": \"\"}','{\"en\": \"\", \"fr\": \"\", \"nl\": \"\"}',NULL,0,NULL,0,1,0,'','',NULL,'home','{\"en\": \"Home\", \"fr\": \"Accueil\", \"nl\": \"Home\"}','{\"en\": \"<h1>Home</h1>\", \"fr\": \"<h1>Accueil</h1>\", \"nl\": \"<h1>Home</h1>\"}','{\"en\": \"1\", \"fr\": \"1\", \"nl\": \"1\"}','{\"en\": \"\", \"fr\": \"\", \"nl\": \"\"}','{\"en\": \"\", \"fr\": \"\", \"nl\": \"\"}','','','2014-03-28 21:57:44','2014-03-28 20:26:35');
insert  into `typicms_pages`(`id`,`slug`,`uri`,`image_id`,`position`,`parent_id`,`private`,`is_home`,`redirect`,`css`,`js`,`module`,`template`,`title`,`body`,`status`,`meta_keywords`,`meta_description`,`meta_robots_no_index`,`meta_robots_no_follow`,`created_at`,`updated_at`) values (2,'{\"en\": \"contact\", \"fr\": \"contact\", \"nl\": \"contact\"}','{\"en\": \"contact\", \"fr\": \"contact\", \"nl\": \"contact\"}',NULL,0,NULL,0,0,0,'','',NULL,'','{\"en\": \"Contact\", \"fr\": \"Contact\", \"nl\": \"Contact\"}','{\"en\": \"<h1>Contact</h1>\", \"fr\": \"<h1>Contact</h1>\", \"nl\": \"<h1>Contact</h1>\"}','{\"en\": \"1\", \"fr\": \"1\", \"nl\": \"1\"}','{\"en\": \"\", \"fr\": \"\", \"nl\": \"\"}','{\"en\": \"\", \"fr\": \"\", \"nl\": \"\"}','','','2014-03-28 21:52:13','2014-03-28 21:08:14');
insert  into `typicms_pages`(`id`,`slug`,`uri`,`image_id`,`position`,`parent_id`,`private`,`is_home`,`redirect`,`css`,`js`,`module`,`template`,`title`,`body`,`status`,`meta_keywords`,`meta_description`,`meta_robots_no_index`,`meta_robots_no_follow`,`created_at`,`updated_at`) values (3,'{\"en\": \"terms-of-use\", \"fr\": \"conditions-d-utilisation\", \"nl\": \"gebruiksvoorwaarden\"}','{\"en\": \"terms-of-use\", \"fr\": \"conditions-d-utilisation\", \"nl\": \"gebruiksvoorwaarden\"}',NULL,0,NULL,0,0,0,'','',NULL,'','{\"en\": \"Terms of use\", \"fr\": \"Conditions d’utilisation\", \"nl\": \"Gebruiksvoorwaarden\"}','{\"en\": \"<h1>Terms of use</h1>\", \"fr\": \"<h1>Conditions d’utilisation</h1>\", \"nl\": \"<h1>Gebruiksvoorwaarden</h1>\"}','{\"en\": \"1\", \"fr\": \"1\", \"nl\": \"1\"}','{\"en\": \"\", \"fr\": \"\", \"nl\": \"\"}','{\"en\": \"\", \"fr\": \"\", \"nl\": \"\"}','','','2014-03-28 21:58:30','2014-03-28 20:59:15');

/*Table structure for table `typicms_password_resets` */

DROP TABLE IF EXISTS `typicms_password_resets`;

CREATE TABLE `typicms_password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `typicms_password_resets` */

/*Table structure for table `typicms_permission_role` */

DROP TABLE IF EXISTS `typicms_permission_role`;

CREATE TABLE `typicms_permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_role_id_foreign` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `typicms_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `typicms_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `typicms_permission_role` */

insert  into `typicms_permission_role`(`permission_id`,`role_id`) values (1,1);
insert  into `typicms_permission_role`(`permission_id`,`role_id`) values (2,1);
insert  into `typicms_permission_role`(`permission_id`,`role_id`) values (3,1);
insert  into `typicms_permission_role`(`permission_id`,`role_id`) values (4,1);
insert  into `typicms_permission_role`(`permission_id`,`role_id`) values (5,1);
insert  into `typicms_permission_role`(`permission_id`,`role_id`) values (6,1);
insert  into `typicms_permission_role`(`permission_id`,`role_id`) values (7,1);
insert  into `typicms_permission_role`(`permission_id`,`role_id`) values (8,1);
insert  into `typicms_permission_role`(`permission_id`,`role_id`) values (9,1);
insert  into `typicms_permission_role`(`permission_id`,`role_id`) values (10,1);
insert  into `typicms_permission_role`(`permission_id`,`role_id`) values (11,1);
insert  into `typicms_permission_role`(`permission_id`,`role_id`) values (12,1);
insert  into `typicms_permission_role`(`permission_id`,`role_id`) values (13,1);
insert  into `typicms_permission_role`(`permission_id`,`role_id`) values (14,1);
insert  into `typicms_permission_role`(`permission_id`,`role_id`) values (15,1);
insert  into `typicms_permission_role`(`permission_id`,`role_id`) values (16,1);
insert  into `typicms_permission_role`(`permission_id`,`role_id`) values (17,1);
insert  into `typicms_permission_role`(`permission_id`,`role_id`) values (18,1);
insert  into `typicms_permission_role`(`permission_id`,`role_id`) values (19,1);
insert  into `typicms_permission_role`(`permission_id`,`role_id`) values (20,1);
insert  into `typicms_permission_role`(`permission_id`,`role_id`) values (21,1);
insert  into `typicms_permission_role`(`permission_id`,`role_id`) values (22,1);
insert  into `typicms_permission_role`(`permission_id`,`role_id`) values (23,1);
insert  into `typicms_permission_role`(`permission_id`,`role_id`) values (24,1);
insert  into `typicms_permission_role`(`permission_id`,`role_id`) values (25,1);
insert  into `typicms_permission_role`(`permission_id`,`role_id`) values (26,1);
insert  into `typicms_permission_role`(`permission_id`,`role_id`) values (27,1);
insert  into `typicms_permission_role`(`permission_id`,`role_id`) values (28,1);
insert  into `typicms_permission_role`(`permission_id`,`role_id`) values (29,1);
insert  into `typicms_permission_role`(`permission_id`,`role_id`) values (30,1);
insert  into `typicms_permission_role`(`permission_id`,`role_id`) values (31,1);
insert  into `typicms_permission_role`(`permission_id`,`role_id`) values (32,1);
insert  into `typicms_permission_role`(`permission_id`,`role_id`) values (33,1);
insert  into `typicms_permission_role`(`permission_id`,`role_id`) values (34,1);
insert  into `typicms_permission_role`(`permission_id`,`role_id`) values (35,1);
insert  into `typicms_permission_role`(`permission_id`,`role_id`) values (36,1);
insert  into `typicms_permission_role`(`permission_id`,`role_id`) values (37,1);
insert  into `typicms_permission_role`(`permission_id`,`role_id`) values (38,1);
insert  into `typicms_permission_role`(`permission_id`,`role_id`) values (39,1);
insert  into `typicms_permission_role`(`permission_id`,`role_id`) values (40,1);
insert  into `typicms_permission_role`(`permission_id`,`role_id`) values (41,1);

/*Table structure for table `typicms_permission_user` */

DROP TABLE IF EXISTS `typicms_permission_user`;

CREATE TABLE `typicms_permission_user` (
  `permission_id` int(10) unsigned NOT NULL,
  `model_id` int(10) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `permission_user_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `typicms_permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `typicms_permission_user` */

/*Table structure for table `typicms_permissions` */

DROP TABLE IF EXISTS `typicms_permissions`;

CREATE TABLE `typicms_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `typicms_permissions` */

insert  into `typicms_permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (1,'view-navbar','web',NULL,NULL);
insert  into `typicms_permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (2,'dashboard','web',NULL,NULL);
insert  into `typicms_permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (3,'see-history','web',NULL,NULL);
insert  into `typicms_permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (4,'see-settings','web',NULL,NULL);
insert  into `typicms_permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (5,'update-setting','web',NULL,NULL);
insert  into `typicms_permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (6,'delete-history','web',NULL,NULL);
insert  into `typicms_permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (7,'change-locale','web',NULL,NULL);
insert  into `typicms_permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (8,'update-preferences','web',NULL,NULL);
insert  into `typicms_permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (9,'clear-cache','web',NULL,NULL);
insert  into `typicms_permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (10,'see-all-blocks','web',NULL,NULL);
insert  into `typicms_permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (11,'create-block','web',NULL,NULL);
insert  into `typicms_permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (12,'update-block','web',NULL,NULL);
insert  into `typicms_permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (13,'delete-block','web',NULL,NULL);
insert  into `typicms_permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (14,'see-all-files','web',NULL,NULL);
insert  into `typicms_permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (15,'create-file','web',NULL,NULL);
insert  into `typicms_permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (16,'update-file','web',NULL,NULL);
insert  into `typicms_permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (17,'delete-file','web',NULL,NULL);
insert  into `typicms_permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (18,'see-all-galleries','web',NULL,NULL);
insert  into `typicms_permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (19,'create-gallery','web',NULL,NULL);
insert  into `typicms_permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (20,'update-gallery','web',NULL,NULL);
insert  into `typicms_permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (21,'delete-gallery','web',NULL,NULL);
insert  into `typicms_permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (22,'see-all-menus','web',NULL,NULL);
insert  into `typicms_permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (23,'create-menu','web',NULL,NULL);
insert  into `typicms_permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (24,'update-menu','web',NULL,NULL);
insert  into `typicms_permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (25,'delete-menu','web',NULL,NULL);
insert  into `typicms_permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (26,'see-all-pages','web',NULL,NULL);
insert  into `typicms_permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (27,'create-page','web',NULL,NULL);
insert  into `typicms_permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (28,'update-page','web',NULL,NULL);
insert  into `typicms_permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (29,'delete-page','web',NULL,NULL);
insert  into `typicms_permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (30,'see-all-roles','web',NULL,NULL);
insert  into `typicms_permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (31,'create-role','web',NULL,NULL);
insert  into `typicms_permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (32,'update-role','web',NULL,NULL);
insert  into `typicms_permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (33,'delete-role','web',NULL,NULL);
insert  into `typicms_permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (34,'see-all-translations','web',NULL,NULL);
insert  into `typicms_permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (35,'create-translation','web',NULL,NULL);
insert  into `typicms_permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (36,'update-translation','web',NULL,NULL);
insert  into `typicms_permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (37,'delete-translation','web',NULL,NULL);
insert  into `typicms_permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (38,'see-all-users','web',NULL,NULL);
insert  into `typicms_permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (39,'create-user','web',NULL,NULL);
insert  into `typicms_permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (40,'update-user','web',NULL,NULL);
insert  into `typicms_permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (41,'delete-user','web',NULL,NULL);

/*Table structure for table `typicms_role_user` */

DROP TABLE IF EXISTS `typicms_role_user`;

CREATE TABLE `typicms_role_user` (
  `role_id` int(10) unsigned NOT NULL,
  `model_id` int(10) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `role_user_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `typicms_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `typicms_role_user` */

/*Table structure for table `typicms_roles` */

DROP TABLE IF EXISTS `typicms_roles`;

CREATE TABLE `typicms_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `typicms_roles` */

insert  into `typicms_roles`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (1,'administrator','web',NULL,NULL);
insert  into `typicms_roles`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (2,'visitor','web',NULL,NULL);

/*Table structure for table `typicms_settings` */

DROP TABLE IF EXISTS `typicms_settings`;

CREATE TABLE `typicms_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'config',
  `key_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `typicms_settings` */

insert  into `typicms_settings`(`id`,`group_name`,`key_name`,`value`,`created_at`,`updated_at`) values (1,'config','webmaster_email','info@example.com','2013-11-20 20:06:24','2014-03-18 12:48:01');
insert  into `typicms_settings`(`id`,`group_name`,`key_name`,`value`,`created_at`,`updated_at`) values (2,'config','google_analytics_code',NULL,'2013-11-20 20:06:24','2013-11-20 20:06:24');
insert  into `typicms_settings`(`id`,`group_name`,`key_name`,`value`,`created_at`,`updated_at`) values (3,'config','lang_chooser','1','2013-11-20 20:06:24','2014-03-18 12:48:01');
insert  into `typicms_settings`(`id`,`group_name`,`key_name`,`value`,`created_at`,`updated_at`) values (4,'fr','website_title','Site web sans titre','2013-11-20 20:06:24','2014-03-18 12:48:01');
insert  into `typicms_settings`(`id`,`group_name`,`key_name`,`value`,`created_at`,`updated_at`) values (5,'fr','status','1','2013-11-20 20:06:24','2014-03-18 12:48:01');
insert  into `typicms_settings`(`id`,`group_name`,`key_name`,`value`,`created_at`,`updated_at`) values (6,'nl','website_title','Untitled website','2013-11-20 20:06:24','2014-03-18 12:48:01');
insert  into `typicms_settings`(`id`,`group_name`,`key_name`,`value`,`created_at`,`updated_at`) values (7,'nl','status','1','2013-11-20 20:06:24','2014-03-18 12:48:01');
insert  into `typicms_settings`(`id`,`group_name`,`key_name`,`value`,`created_at`,`updated_at`) values (8,'en','website_title','Untitled website','2013-11-20 20:06:24','2014-03-18 12:48:01');
insert  into `typicms_settings`(`id`,`group_name`,`key_name`,`value`,`created_at`,`updated_at`) values (9,'en','status','1','2013-11-20 20:06:24','2014-03-18 12:48:01');
insert  into `typicms_settings`(`id`,`group_name`,`key_name`,`value`,`created_at`,`updated_at`) values (10,'es','website_title','Website sin título','2013-11-20 20:06:24','2014-03-18 12:48:01');
insert  into `typicms_settings`(`id`,`group_name`,`key_name`,`value`,`created_at`,`updated_at`) values (11,'es','status','1','2013-11-20 20:06:24','2014-03-18 12:48:01');
insert  into `typicms_settings`(`id`,`group_name`,`key_name`,`value`,`created_at`,`updated_at`) values (12,'config','welcome_message','Welcome to the administration panel of TypiCMS.','2014-03-18 12:48:01','2014-03-18 12:48:01');
insert  into `typicms_settings`(`id`,`group_name`,`key_name`,`value`,`created_at`,`updated_at`) values (13,'config','auth_public','0','2014-03-18 12:48:01','2014-03-18 12:48:01');
insert  into `typicms_settings`(`id`,`group_name`,`key_name`,`value`,`created_at`,`updated_at`) values (14,'config','register','0','2014-03-18 12:48:01','2014-03-18 12:48:01');
insert  into `typicms_settings`(`id`,`group_name`,`key_name`,`value`,`created_at`,`updated_at`) values (15,'config','admin_locale','en','2014-03-22 12:48:01','2014-03-22 12:48:01');

/*Table structure for table `typicms_translations` */

DROP TABLE IF EXISTS `typicms_translations`;

CREATE TABLE `typicms_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `translation` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `typicms_translations` */

insert  into `typicms_translations`(`id`,`group`,`key`,`translation`,`created_at`,`updated_at`) values (1,'db','More','{\"en\": \"More\", \"fr\": \"En savoir plus\", \"nl\": \"Meer\"}','2014-02-28 22:50:19','2014-02-28 22:50:19');
insert  into `typicms_translations`(`id`,`group`,`key`,`translation`,`created_at`,`updated_at`) values (2,'db','Skip to content','{\"en\": \"Skip to content\", \"fr\": \"Aller au contenu\", \"nl\": \"Naar inhoud\"}','2014-02-28 22:50:19','2014-02-28 22:50:19');
insert  into `typicms_translations`(`id`,`group`,`key`,`translation`,`created_at`,`updated_at`) values (3,'db','languages.fr','{\"en\": \"Français\", \"fr\": \"Français\", \"nl\": \"Français\"}','2014-02-28 22:50:19','2014-02-28 22:50:19');
insert  into `typicms_translations`(`id`,`group`,`key`,`translation`,`created_at`,`updated_at`) values (4,'db','languages.en','{\"en\": \"English\", \"fr\": \"English\", \"nl\": \"English\"}','2014-02-28 22:50:19','2014-02-28 22:50:19');
insert  into `typicms_translations`(`id`,`group`,`key`,`translation`,`created_at`,`updated_at`) values (5,'db','languages.nl','{\"en\": \"Nederlands\", \"fr\": \"Nederlands\", \"nl\": \"Nederlands\"}','2014-02-28 22:50:19','2014-02-28 22:50:19');
insert  into `typicms_translations`(`id`,`group`,`key`,`translation`,`created_at`,`updated_at`) values (6,'db','Search','{\"en\": \"Search\", \"fr\": \"Chercher\", \"nl\": \"Zoeken\"}','2014-02-28 22:50:19','2014-02-28 22:50:19');
insert  into `typicms_translations`(`id`,`group`,`key`,`translation`,`created_at`,`updated_at`) values (7,'db','message when contact form is sent','{\"en\": \"Thank you for your contact request, it will be treated as soon as possible.\", \"fr\": \"Merci pour votre demande de contact, elle sera traitée dans les meilleurs délais.\", \"nl\": \"Bedankt voor uw contactaanvraag, het zal zo snel mogelijk worden behandeld.\"}','2014-02-28 22:50:19','2014-02-28 22:50:19');
insert  into `typicms_translations`(`id`,`group`,`key`,`translation`,`created_at`,`updated_at`) values (8,'db','message when errors in form','{\"en\": \"Please correct the errors below\", \"fr\": \"Veuillez s’il vous plaît corriger les erreurs ci-dessous\", \"nl\": \"Gelieve de onderstaande fouten te corrigeren\"}','2014-02-28 22:50:19','2014-02-28 22:50:19');
insert  into `typicms_translations`(`id`,`group`,`key`,`translation`,`created_at`,`updated_at`) values (9,'db','Add to calendar','{\"en\": \"Add to calendar\", \"fr\": \"Ajouter au calendrier\", \"nl\": \"Toevoegen aan Agenda\"}','2014-02-28 22:50:19','2014-02-28 22:50:19');
insert  into `typicms_translations`(`id`,`group`,`key`,`translation`,`created_at`,`updated_at`) values (10,'db','All news','{\"en\": \"All news\", \"fr\": \"Toutes les actualités\", \"nl\": \"Alle nieuws\"}','2014-02-28 15:39:28','2014-02-28 15:39:28');
insert  into `typicms_translations`(`id`,`group`,`key`,`translation`,`created_at`,`updated_at`) values (11,'db','All events','{\"en\": \"All events\", \"fr\": \"Tous les événements\", \"nl\": \"Alle evenementen\"}','2014-02-28 15:40:04','2014-02-28 15:40:04');
insert  into `typicms_translations`(`id`,`group`,`key`,`translation`,`created_at`,`updated_at`) values (12,'db','Partners','{\"en\": \"Partners\", \"fr\": \"Partenaires\", \"nl\": \"Partners\"}','2014-02-28 15:40:35','2014-02-28 15:40:35');
insert  into `typicms_translations`(`id`,`group`,`key`,`translation`,`created_at`,`updated_at`) values (13,'db','Latest news','{\"en\": \"Latest news\", \"fr\": \"Dernières actualités\", \"nl\": \"Laatste Nieuws\"}','2014-02-28 15:41:21','2014-02-28 15:41:21');
insert  into `typicms_translations`(`id`,`group`,`key`,`translation`,`created_at`,`updated_at`) values (14,'db','Incoming events','{\"en\": \"Incoming events\", \"fr\": \"Prochains événements\", \"nl\": \"Aankomende evenementen\"}','2014-02-28 15:41:54','2014-02-28 15:41:54');
insert  into `typicms_translations`(`id`,`group`,`key`,`translation`,`created_at`,`updated_at`) values (16,'db','Error :code','{\"en\": \"Error :code\", \"fr\": \"Erreur :code\", \"nl\": \"Error :code\"}','2014-02-28 16:35:45','2014-02-28 16:35:45');
insert  into `typicms_translations`(`id`,`group`,`key`,`translation`,`created_at`,`updated_at`) values (17,'db','Sorry, you are not authorized to view this page','{\"en\": \"Sorry, you are not authorized to view this page\", \"fr\": \"Désolé, vous n’êtes pas autorisé à voir cette page\", \"nl\": \"Sorry, u bent niet bevoegd om deze pagina te bekijken\"}','2014-02-28 16:38:43','2014-02-28 16:38:43');
insert  into `typicms_translations`(`id`,`group`,`key`,`translation`,`created_at`,`updated_at`) values (18,'db','Go to our homepage?','{\"en\": \"Go to our :a_openhomepage:a_close?\", \"fr\": \"Souhaitez-vous visiter notre :a_openpage d’accueil:a_close ?\", \"nl\": \"Wilt u onze :a_openhomepage:a_close te bezoeken?\"}','2014-02-28 16:40:40','2014-02-28 16:40:40');
insert  into `typicms_translations`(`id`,`group`,`key`,`translation`,`created_at`,`updated_at`) values (19,'db','Sorry, this page was not found','{\"en\": \"Sorry, this page was not found\", \"fr\": \"Désolé, cette page n’a pas été trouvée\", \"nl\": \"Sorry, deze pagina is niet gevonden\"}','2014-02-28 16:42:18','2014-02-28 16:42:18');
insert  into `typicms_translations`(`id`,`group`,`key`,`translation`,`created_at`,`updated_at`) values (20,'db','Sorry, a server error occurred','{\"en\": \"Sorry, a server error occurred\", \"fr\": \"Désolé, une erreur serveur est survenue\", \"nl\": \"Sorry, er is een serverfout opgetreden\"}','2014-02-28 16:44:46','2014-02-28 16:44:46');
insert  into `typicms_translations`(`id`,`group`,`key`,`translation`,`created_at`,`updated_at`) values (21,'db','Open navigation','{\"en\": \"Open navigation\", \"fr\": \"Aller à la navigation\", \"nl\": \"Open navigatie\"}','2016-02-15 16:44:46','2016-02-15 16:44:46');
insert  into `typicms_translations`(`id`,`group`,`key`,`translation`,`created_at`,`updated_at`) values (22,'db','Close navigation','{\"en\": \"Close navigation\", \"fr\": \"Fermer la navigation\", \"nl\": \"Sluiten navigatie\"}','2016-02-15 16:44:46','2016-02-15 16:44:46');

/*Table structure for table `typicms_users` */

DROP TABLE IF EXISTS `typicms_users`;

CREATE TABLE `typicms_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activated` tinyint(1) NOT NULL DEFAULT '0',
  `superuser` tinyint(1) NOT NULL DEFAULT '0',
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preferences` text COLLATE utf8mb4_unicode_ci,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `typicms_users` */

insert  into `typicms_users`(`id`,`email`,`password`,`activated`,`superuser`,`first_name`,`last_name`,`preferences`,`token`,`remember_token`,`created_at`,`updated_at`) values (1,'admin@admin.com','$2y$10$rqhK6tMVsGXFQTTKm5bM4uYpz7viS9mL9PSn.2qM9KBRTqjTqDTy.',1,1,'Jerry','Xu',NULL,'X60ocjgAhHS439sRyhNnFXoXpcBCtK',NULL,'2018-04-01 13:00:27','2018-04-01 13:00:27');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
