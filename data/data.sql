# ************************************************************
# Host: localhost (MySQL 5.6.13)
# Database: onboarding_development
# Generation Time: 2014-01-28 17:07:36 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table applicants
# ------------------------------------------------------------

DROP TABLE IF EXISTS `applicants`;

CREATE TABLE `applicants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cover_letter` text COLLATE utf8_unicode_ci,
  `job_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_applicants_on_job_id` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `applicants` WRITE;
/*!40000 ALTER TABLE `applicants` DISABLE KEYS */;

INSERT INTO `applicants` (`id`, `name`, `email`, `website`, `cover_letter`, `job_id`, `created_at`, `updated_at`)
VALUES
	(1,'Russ Waters','torrance@brekke.co.uk','http://kihn.info','Vel magnam ut reprehenderit molestiae maiores tempore enim ea. Ad est ut amet explicabo debitis consectetur sapiente. Aut quis enim magni eum ab quaerat.',1,'2014-01-08 17:13:29','2014-01-08 17:13:29'),
	(2,'Dakota Kautzer','stella.cartwright@quitzonmarquardt.info','http://oconnellboyer.ca','Fuga fugit quasi ut error culpa dolor id necessitatibus. Aperiam expedita ab adipisci. Laborum labore tenetur et autem in praesentium officia. Occaecati rerum autem recusandae eaque nam. Eaque corporis quis praesentium.',1,'2014-01-08 17:13:29','2014-01-08 17:13:29'),
	(3,'Miss Cortez Hilpert','adan@dooleykshlerin.co.uk','http://wisozk.us','Pariatur molestias harum molestiae nihil voluptatibus totam. Repudiandae ut explicabo enim. Quae illo voluptatem eum. Dolor hic explicabo rem. Dolores sequi et id nesciunt tempora quae.',1,'2014-01-08 17:13:29','2014-01-08 17:13:29'),
	(4,'Katarina Mills','cathrine@leschhettinger.ca','http://feestrempel.ca','Sed ea aut pariatur ad assumenda. Est libero quo veritatis cupiditate. Voluptatem non qui sed velit ipsum delectus aut eligendi. Dolorem eos et et ipsum sit facilis.',1,'2014-01-08 17:13:29','2014-01-08 17:13:29'),
	(5,'Jordane Hilll IV','meredith@morarprice.uk','http://kriskuhlman.us','Ab porro nemo quam nesciunt. Necessitatibus asperiores labore quos. Veritatis recusandae omnis asperiores velit et consectetur est. Eligendi reprehenderit eius earum sed ratione asperiores quis. Accusamus rem asperiores aut autem.',2,'2014-01-08 17:13:29','2014-01-08 17:13:29'),
	(6,'Kraig Oga','maribel@kochstrosin.name','http://kassulke.ca','Aliquid aspernatur dolores sequi eum dignissimos sit ea. Et incidunt eveniet consequatur eligendi et aut. Nihil voluptas iusto enim recusandae. Suscipit iste facere placeat et ducimus. Distinctio ut adipisci rerum optio officia.',2,'2014-01-08 17:13:29','2014-01-08 17:13:29'),
	(7,'Hilbert Price','yasmine.hoppe@mclaughlin.biz','http://beahan.info','Omnis ut assumenda voluptates quisquam. Sed eum quia non culpa rem accusantium. Reiciendis sunt aut magnam. Adipisci repellat dicta consequatur sapiente non iste qui dolor.',2,'2014-01-08 17:13:29','2014-01-08 17:13:29'),
	(8,'Mikel Murazik','aletha@schowalter.info','http://nitzsche.uk','Quidem saepe consequatur qui ex vero officia unde rem. Aut quas veniam dolorem. Eligendi fugit harum aut delectus ad dolorem maiores. Qui labore praesentium consequuntur eum ut modi. Et animi asperiores quo reprehenderit sint excepturi.',2,'2014-01-08 17:13:29','2014-01-08 17:13:29');

/*!40000 ALTER TABLE `applicants` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `jobs`;

CREATE TABLE `jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;

INSERT INTO `jobs` (`id`, `name`, `created_at`, `updated_at`)
VALUES
	(1,'Web Developer','2014-01-08 17:13:29','2014-01-08 17:13:29'),
	(2,'Designer','2014-01-08 17:13:29','2014-01-08 17:13:29');

/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table skills
# ------------------------------------------------------------

DROP TABLE IF EXISTS `skills`;

CREATE TABLE `skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `applicant_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_skills_on_applicant_id` (`applicant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;

INSERT INTO `skills` (`id`, `name`, `applicant_id`, `created_at`, `updated_at`)
VALUES
	(1,'Java',1,'2014-01-08 17:13:29','2014-01-08 17:13:29'),
	(2,'C',1,'2014-01-08 17:13:29','2014-01-08 17:13:29'),
	(3,'C++',1,'2014-01-08 17:13:29','2014-01-08 17:13:29'),
	(4,'Javascript',2,'2014-01-08 17:13:29','2014-01-08 17:13:29'),
	(5,'C',2,'2014-01-08 17:13:29','2014-01-08 17:13:29'),
	(6,'PHP',3,'2014-01-08 17:13:29','2014-01-08 17:13:29'),
	(7,'C',4,'2014-01-08 17:13:29','2014-01-08 17:13:29'),
	(8,'Python',4,'2014-01-08 17:13:29','2014-01-08 17:13:29'),
	(9,'HTML',4,'2014-01-08 17:13:29','2014-01-08 17:13:29'),
	(10,'Fireworks',5,'2014-01-08 17:13:29','2014-01-08 17:13:29'),
	(11,'Fireworks',6,'2014-01-08 17:13:29','2014-01-08 17:13:29'),
	(12,'Illustrator',7,'2014-01-08 17:13:29','2014-01-08 17:13:29'),
	(13,'Fireworks',8,'2014-01-08 17:13:29','2014-01-08 17:13:29');

/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
