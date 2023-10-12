-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.33 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para guides-time-to-visit
CREATE DATABASE IF NOT EXISTS `guides-time-to-visit` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci */;
USE `guides-time-to-visit`;

-- Volcando estructura para tabla guides-time-to-visit.activities
CREATE TABLE IF NOT EXISTS `activities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `image` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `video` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `description` text COLLATE utf8_spanish2_ci NOT NULL,
  `sites_id` bigint(20) DEFAULT NULL,
  `sites_name` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `municipalities_id` bigint(20) DEFAULT NULL,
  `department_id` int(11) NOT NULL,
  `state` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `guide_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


-- Volcando estructura para tabla guides-time-to-visit.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `cover` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `state` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `section_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


-- Volcando estructura para tabla guides-time-to-visit.container_levels
CREATE TABLE IF NOT EXISTS `container_levels` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `type` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `container` text COLLATE utf8_spanish2_ci NOT NULL,
  `level_id` int(11) NOT NULL,
  `state` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=272 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando estructura para tabla guides-time-to-visit.guides
CREATE TABLE IF NOT EXISTS `guides` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name_guide` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `sites_id` int(11) NOT NULL,
  `sites_name` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `cover` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `state` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `municipalities_id` int(11) NOT NULL,
  `municipalities_name` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `department_id` int(11) NOT NULL,
  `deparment_name` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


-- Volcando estructura para tabla guides-time-to-visit.levels
CREATE TABLE IF NOT EXISTS `levels` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `title` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `state` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `cover` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


-- Volcando estructura para tabla guides-time-to-visit.objectives
CREATE TABLE IF NOT EXISTS `objectives` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `question` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `state` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `answer` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `levels_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


-- Volcando estructura para tabla guides-time-to-visit.questions
CREATE TABLE IF NOT EXISTS `questions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `type` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `request` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `is_true` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `objective_id` bigint(20) unsigned NOT NULL,
  `state` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_objectives_ques` (`objective_id`),
  CONSTRAINT `fk_objectives_ques` FOREIGN KEY (`objective_id`) REFERENCES `objectives` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


-- Volcando estructura para tabla guides-time-to-visit.sections
CREATE TABLE IF NOT EXISTS `sections` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `cover` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `state` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `guides_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


-- Volcando estructura para tabla guides-time-to-visit.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `nombres` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `apellidos` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `nombre_usuario` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `correo` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `clave` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `tipo_usuario` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `url_imagen` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla guides-time-to-visit.users: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;


-- Volcando estructura de base de datos para routes-time-to-visit
CREATE DATABASE IF NOT EXISTS `routes-time-to-visit` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci */;
USE `routes-time-to-visit`;

-- Volcando estructura para tabla routes-time-to-visit.comments
CREATE TABLE IF NOT EXISTS `comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `description` text COLLATE utf8_spanish2_ci NOT NULL,
  `star` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `name_user` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `state` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `routes_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


-- Volcando estructura para tabla routes-time-to-visit.resources
CREATE TABLE IF NOT EXISTS `resources` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `url_resource` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `state` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `step_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla routes-time-to-visit.resources: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `resources` ENABLE KEYS */;

-- Volcando estructura para tabla routes-time-to-visit.routes
CREATE TABLE IF NOT EXISTS `routes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `municipalities_id` int(11) NOT NULL,
  `municipalities_name` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `department_id` int(11) NOT NULL,
  `department_name` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `cover` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `state` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `description` text COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando estructura para tabla routes-time-to-visit.steps
CREATE TABLE IF NOT EXISTS `steps` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `sites_id` int(11) NOT NULL,
  `name_sites` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `cover` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `direction` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `latitud` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `longitud` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `description` text COLLATE utf8_spanish2_ci NOT NULL,
  `state` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `routes_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


-- Volcando estructura de base de datos para sites-time-to-visit
CREATE DATABASE IF NOT EXISTS `sites-time-to-visit` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci */;
USE `sites-time-to-visit`;

-- Volcando estructura para tabla sites-time-to-visit.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `nombre` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `url_imagen` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


-- Volcando estructura para tabla sites-time-to-visit.contacts
CREATE TABLE IF NOT EXISTS `contacts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_wp` tinyint(1) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `numero` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `sites_id` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


-- Volcando estructura para tabla sites-time-to-visit.departments
CREATE TABLE IF NOT EXISTS `departments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `nombre` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `bandera` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


-- Volcando estructura para tabla sites-time-to-visit.municipalities
CREATE TABLE IF NOT EXISTS `municipalities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `nombre` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `bandera` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `department_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando estructura para tabla sites-time-to-visit.resources
CREATE TABLE IF NOT EXISTS `resources` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `type_recursos` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `payload` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `sites_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


-- Volcando estructura para tabla sites-time-to-visit.reviews
CREATE TABLE IF NOT EXISTS `reviews` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_nombre` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `url_imagen_user` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `comment` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `valoracion` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `sites_id` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


-- Volcando estructura para tabla sites-time-to-visit.sites
CREATE TABLE IF NOT EXISTS `sites` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `category_id` int(11) NOT NULL,
  `municipalities_id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish2_ci NOT NULL,
  `dirrecion` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `puntuacion` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `latitud` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `longitud` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `numero_resena` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


-- Volcando estructura para tabla sites-time-to-visit.subcategories
CREATE TABLE IF NOT EXISTS `subcategories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `nombre` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `url_imagen` text COLLATE utf8_spanish2_ci NOT NULL,
  `desccripcion` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


-- Volcando estructura de base de datos para user-time-to-visit
CREATE DATABASE IF NOT EXISTS `user-time-to-visit` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci */;
USE `user-time-to-visit`;

-- Volcando estructura para tabla user-time-to-visit.progresses
CREATE TABLE IF NOT EXISTS `progresses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `score` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `primary_id` int(11) NOT NULL,
  `secondary_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


-- Volcando estructura para tabla user-time-to-visit.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `nombres` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `apellidos` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `nombre_usuario` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `correo` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `clave` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `tipo_usuario` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `url_imagen` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

