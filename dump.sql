-- MySQL dump 10.13  Distrib 8.0.35, for Win64 (x86_64)
--
-- Host: localhost    Database: db_blogs
-- ------------------------------------------------------
-- Server version	8.0.35

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_usuarios'),(22,'Can change user',6,'change_usuarios'),(23,'Can delete user',6,'delete_usuarios'),(24,'Can view user',6,'view_usuarios'),(25,'Can add categoria',7,'add_categoria'),(26,'Can change categoria',7,'change_categoria'),(27,'Can delete categoria',7,'delete_categoria'),(28,'Can view categoria',7,'view_categoria'),(29,'Can add blogs',8,'add_blogs'),(30,'Can change blogs',8,'change_blogs'),(31,'Can delete blogs',8,'delete_blogs'),(32,'Can view blogs',8,'view_blogs'),(33,'Can add opinion',9,'add_opinion'),(34,'Can change opinion',9,'change_opinion'),(35,'Can delete opinion',9,'delete_opinion'),(36,'Can view opinion',9,'view_opinion');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogs_blogs`
--

DROP TABLE IF EXISTS `blogs_blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blogs_blogs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) NOT NULL,
  `texto` longtext NOT NULL,
  `fecha_agregado` datetime(6) NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `categoria_id` bigint DEFAULT NULL,
  `colaborador_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blogs_blogs_categoria_id_40cb13ba_fk_blogs_categoria_id` (`categoria_id`),
  KEY `blogs_blogs_colaborador_id_95fd3cbb_fk_usuarios_usuarios_id` (`colaborador_id`),
  CONSTRAINT `blogs_blogs_categoria_id_40cb13ba_fk_blogs_categoria_id` FOREIGN KEY (`categoria_id`) REFERENCES `blogs_categoria` (`id`),
  CONSTRAINT `blogs_blogs_colaborador_id_95fd3cbb_fk_usuarios_usuarios_id` FOREIGN KEY (`colaborador_id`) REFERENCES `usuarios_usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs_blogs`
--

LOCK TABLES `blogs_blogs` WRITE;
/*!40000 ALTER TABLE `blogs_blogs` DISABLE KEYS */;
INSERT INTO `blogs_blogs` VALUES (1,'Phyton','Python is an interpreted, object-oriented, high-level programming language with dynamic semantics. Its high-level built in data structures, combined with dynamic typing and dynamic binding, make it very attractive for Rapid Application Development, as well as for use as a scripting or glue language to connect existing components together. Python\'s simple, easy to learn syntax emphasizes readability and therefore reduces the cost of program maintenance. Python supports modules and packages, which encourages program modularity and code reuse. The Python interpreter and the extensive standard library are available in source or binary form without charge for all major platforms, and can be freely distributed.\r\n\r\nOften, programmers fall in love with Python because of the increased productivity it provides. Since there is no compilation step, the edit-test-debug cycle is incredibly fast. Debugging Python programs is easy: a bug or bad input will never cause a segmentation fault. Instead, when the interpreter discovers an error, it raises an exception. When the program doesn\'t catch the exception, the interpreter prints a stack trace. A source level debugger allows inspection of local and global variables, evaluation of arbitrary expressions, setting breakpoints, stepping through the code a line at a time, and so on. The debugger is written in Python itself, testifying to Python\'s introspective power. On the other hand, often the quickest way to debug a program is to add a few print statements to the source: the fast edit-test-debug cycle makes this simple approach very effective.','2023-12-22 01:53:46.243307','blogs/Python-logo.jpg',1,1),(2,'HTML','HTML (Lenguaje de Marcas de Hipertexto, del inglés HyperText Markup Language) es el componente más básico de la Web. Define el significado y la estructura del contenido web. Además de HTML, generalmente se utilizan otras tecnologías para describir la apariencia/presentación de una página web (CSS) o la funcionalidad/comportamiento (JavaScript).\r\n\r\n\"Hipertexto\" hace referencia a los enlaces que conectan páginas web entre sí, ya sea dentro de un único sitio web o entre sitios web. Los enlaces son un aspecto fundamental de la Web. Al subir contenido a Internet y vincularlo a las páginas creadas por otras personas, te conviertes en un participante activo en la «World Wide Web» (Red Informática Mundial).','2023-12-22 01:57:38.745045','blogs/html.png',1,1),(3,'Django','¿Qué es Django?\r\nDjango es un software que puede utilizar para desarrollar aplicaciones web de forma rápida y eficiente. La mayoría de las aplicaciones web tienen varias funciones comunes, como la autenticación, la recuperación de información de una base de datos y la administración de cookies. Los desarrolladores tienen que codificar una funcionalidad similar en cada aplicación web que escriban. Django facilita su trabajo al agrupar las diferentes funciones en una gran colección de módulos reutilizables, llamada marco de aplicación web. Los desarrolladores utilizan el marco web de Django para organizar y escribir su código de manera más eficiente y reducir significativamente el tiempo de desarrollo web.','2023-12-22 03:18:40.130899','blogs/django_7Y5iXWw.png',2,1),(4,'MySQL','MySQL es un sistema de gestión de bases de datos relacional desarrollado bajo licencia dual: Licencia pública general/Licencia comercial por Oracle Corporation y está considerada como la base de datos de código abierto más popular del mundo,​ y una de las más populares en general junto a Oracle y Microsoft SQL Server, todo para entornos de desarrollo web.\r\n\r\nMySQL fue inicialmente desarrollado por MySQL AB (empresa fundada por David Axmark, Allan Larsson y Michael Widenius). MySQL AB fue adquirida por Sun Microsystems en 2008, y ésta a su vez fue comprada por Oracle Corporation en 2010, la cual ya era dueña desde 2005 de Innobase Oy, empresa finlandesa desarrolladora del motor InnoDB para MySQL.\r\n\r\nAl contrario de proyectos como Apache, donde el software es desarrollado por una comunidad pública y los derechos de autor del código están en poder del autor individual, MySQL es patrocinado por una empresa privada, que posee el copyright de la mayor parte del código. Esto es lo que posibilita el esquema de doble licenciamiento anteriormente mencionado. La base de datos se distribuye en varias versiones, una Community, distribuida bajo la Licencia pública general de GNU, versión 2, y varias versiones Enterprise, para aquellas empresas que quieran incorporarlo en productos privativos. Las versiones Enterprise incluyen productos o servicios adicionales tales como herramientas de monitorización y asistencia técnica oficial. En 2009 se creó un fork denominado MariaDB por algunos desarrolladores (incluido algunos desarrolladores originales de MySQL) descontentos con el modelo de desarrollo y el hecho de que una misma empresa controle a la vez los productos MySQL y Oracle Database.','2023-12-23 20:02:01.410659','blogs/mysql.png',3,1),(15,'GitHub','Github es un portal creado para alojar el código de las aplicaciones de cualquier desarrollador, y que fue comprada por Microsoft en junio del 2018. La plataforma está creada para que los desarrolladores suban el código de sus aplicaciones y herramientas, y que como usuario no sólo puedas descargarte la aplicación, sino también entrar a su perfil para leer sobre ella o colaborar con su desarrollo.\r\n\r\nLa otra guerra entre Microsoft, Google y Amazon: la batalla por controlar los servicios en la nube para desarrolladores\r\n\r\nLa otra guerra entre Microsoft, Google y Amazon: la batalla por controlar los servicios en la nube para desarrolladores\r\nComo su nombre indica, la web utiliza el sistema de control de versiones Git diseñado por Linus Torvalds. Un sistema de gestión de versiones es ese con el que los desarrolladores pueden administrar su proyecto, ordenando el código de cada una de las nuevas versiones que sacan de sus aplicaciones para evitar confusiones. Así, al tener copias de cada una de las versiones de su aplicación, no se perderán los estados anteriores cuando se va a actualizar.\r\n\r\nAsí pues, Git es uno de estos sistemas de control, que permite comparar el código de un archivo para ver las diferencias entre las versiones, restaurar versiones antiguas si algo sale mal, y fusionar los cambios de distintas versiones. También permite trabajar con distintas ramas de un proyecto, como la de desarrollo para meter nuevas funciones al programa o la de producción para depurar los bugs.','2023-12-28 03:05:14.904064','blogs/github_g4PtiHm.png',4,1),(17,'GitLab','Mucho ha sonado GitLab últimamente, y es que posiblemente sea el competidor más fuerte que tiene GitHub desde hace tiempo.\r\n\r\nLa principal ventaja que tiene GitLab es el hecho de ser software libre, estando su código publicado bajo MIT. Esto permite que pueda ser bifurcado y reimplementado en un servidor propio. Por otro lado, su interfaz y forma de funcionar son similares a los de GitHub, aunque con el añadido de que permite crear repositorios privados de forma gratuita, algo que puede venir muy bien a esos desarrolladores que no estén interesados en exponer su código y no quieran pagar por ello.\r\n\r\nOtras características son la posibilidad de migrar fácilmente desde GitHub (algo que muy posiblemente sea potenciado a partir de ahora) y los planes de pago para aquellos que no quieran invertir en un servidor propio.\r\n\r\nNo podemos olvidar que recientemente GNOME ha completado su migración a GitLab, llevándose consigo a GIMP, lo que podría ayudar este servicio a ganar adeptos entre el público linuxero.','2023-12-29 00:14:54.723773','blogs/gitlab.jpg',4,1),(18,'SQLite','En términos generales, lo que es SQLite hace referencia a una base de datos relacional, la cual se considera de dominio público, debido a que es de código abierto u open source, aspecto que ayuda a que sea accesible para el desarrollo de aplicaciones.ca\r\n\r\nCabe resaltar que SQLite se considera una biblioteca que se encuentra en constante proceso y que implementa un motor de base de datos SQL, el cual se caracteriza por ser transaccional, no contar con un servidor y no necesitar una instalación previa para poder usarlo.','2023-12-29 00:18:59.217134','blogs/sqlite.jpeg',3,1),(19,'ASP.net','La evolución de ASP ha llevado hasta la nueva versión ASP.net, un auténtico entorno de programación web para el desarrollo de sitios web dinámicos, aplicaciones web que se ejecutan del lado del servidor y servicios web XML.\r\n\r\nSe trata de un marco que incorpora componentes importantes como Common Language Runtime y hay disponibles diferentes lenguajes de programación que admiten este entorno (C# o VB, por ejemplo).\r\n\r\nEl salto de ASP a su versión .net supuso un incremento en cuanto a las posibilidades del lenguaje y una gran mejora en el rendimiento de los sitios web y aplicaciones desarrollados. En cuanto a sintaxis, se aplicaron algunos cambios en esta última versión para adaptar mejor el entorno a las necesidades actuales de la programación web.\r\n\r\nHemos hablado de ASP programming language y cómo ha evolucionado hasta su versión actual. En lenguaje ASP para internet es la apuesta de Microsoft para crear sitios web dinámicos de forma eficiente y sencilla.','2023-12-29 00:22:25.678165','blogs/asp_net.png',2,1);
/*!40000 ALTER TABLE `blogs_blogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogs_categoria`
--

DROP TABLE IF EXISTS `blogs_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blogs_categoria` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs_categoria`
--

LOCK TABLES `blogs_categoria` WRITE;
/*!40000 ALTER TABLE `blogs_categoria` DISABLE KEYS */;
INSERT INTO `blogs_categoria` VALUES (1,'Lenguajes','categorias/lenguajes.png'),(2,'Frameworks','categorias/frameworks.png'),(3,'Bases de datos','categorias/bases_de_datos.jpeg'),(4,'Control de versiones','categorias/control.jpg');
/*!40000 ALTER TABLE `blogs_categoria` ENABLE KEYS */;
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
  KEY `django_admin_log_user_id_c564eba6_fk_usuarios_usuarios_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_usuarios_usuarios_id` FOREIGN KEY (`user_id`) REFERENCES `usuarios_usuarios` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-12-22 01:44:21.753280','1','Guido',2,'[{\"changed\": {\"fields\": [\"Es colaborador\"]}}]',6,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(8,'blogs','blogs'),(7,'blogs','categoria'),(4,'contenttypes','contenttype'),(9,'opiniones','opinion'),(5,'sessions','session'),(6,'usuarios','usuarios');
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-12-19 15:54:09.948316'),(2,'contenttypes','0002_remove_content_type_name','2023-12-19 15:54:10.014117'),(3,'auth','0001_initial','2023-12-19 15:54:10.228824'),(4,'auth','0002_alter_permission_name_max_length','2023-12-19 15:54:10.264777'),(5,'auth','0003_alter_user_email_max_length','2023-12-19 15:54:10.283801'),(6,'auth','0004_alter_user_username_opts','2023-12-19 15:54:10.286004'),(7,'auth','0005_alter_user_last_login_null','2023-12-19 15:54:10.286004'),(8,'auth','0006_require_contenttypes_0002','2023-12-19 15:54:10.297444'),(9,'auth','0007_alter_validators_add_error_messages','2023-12-19 15:54:10.302856'),(10,'auth','0008_alter_user_username_max_length','2023-12-19 15:54:10.302856'),(11,'auth','0009_alter_user_last_name_max_length','2023-12-19 15:54:10.314166'),(12,'auth','0010_alter_group_name_max_length','2023-12-19 15:54:10.318888'),(13,'auth','0011_update_proxy_permissions','2023-12-19 15:54:10.332785'),(14,'auth','0012_alter_user_first_name_max_length','2023-12-19 15:54:10.336733'),(15,'usuarios','0001_initial','2023-12-19 15:54:10.652397'),(16,'admin','0001_initial','2023-12-19 15:54:10.774183'),(17,'admin','0002_logentry_remove_auto_add','2023-12-19 15:54:10.780397'),(18,'admin','0003_logentry_add_action_flag_choices','2023-12-19 15:54:10.786989'),(19,'blogs','0001_initial','2023-12-19 15:54:10.914760'),(20,'opiniones','0001_initial','2023-12-19 15:54:11.033831'),(21,'sessions','0001_initial','2023-12-19 15:54:11.064778'),(22,'blogs','0002_remove_blogs_autor','2023-12-22 01:24:01.223911');
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
INSERT INTO `django_session` VALUES ('it6s1w5py2zs44zt17k16pil5ny762vs','.eJxVjMEOgjAQRP-lZ9PQZUvBo3e_odntVouaNqFwMvw7kHDQ22Tem_kqT8uc_FLj5EdRV2XU5bdjCu-YDyAvys-iQ8nzNLI-FH3Squ9F4ud2un8HiWra1xACisOHs0iWW-xYgvCeWh7YWZCGDBroiaHpqRMhh-CGyGA5Ihi1bvMROBU:1rIglb:zqJ3XByYiO1RmzO_xCD5xO3AEe-EBTwQuIj2zk8psdI','2024-01-11 03:09:03.007856'),('l5i8peha7z5mvgcgy7xmb04t26l16ni5','.eJxVjMEOgjAQRP-lZ9PQZUvBo3e_odntVouaNqFwMvw7kHDQ22Tem_kqT8uc_FLj5EdRV2XU5bdjCu-YDyAvys-iQ8nzNLI-FH3Squ9F4ud2un8HiWra1xACisOHs0iWW-xYgvCeWh7YWZCGDBroiaHpqRMhh-CGyGA5Ihi1bvMROBU:1rIM1a:P60mLnwPN6qNw_eN6ceptYHYcGNo6fWsGu_LZmIfWFQ','2024-01-10 05:00:10.752500'),('r58ygilyrlakz2ztza9kvyqie8rpkam7','.eJxVjMEOgjAQRP-lZ9PQZUvBo3e_odntVouaNqFwMvw7kHDQ22Tem_kqT8uc_FLj5EdRV2XU5bdjCu-YDyAvys-iQ8nzNLI-FH3Squ9F4ud2un8HiWra1xACisOHs0iWW-xYgvCeWh7YWZCGDBroiaHpqRMhh-CGyGA5Ihi1bvMROBU:1rJ0p7:sygmquipKbNaQwX--vQS4JXGdmAWCd-pzmyfs4V75UU','2024-01-12 00:34:01.321236'),('ya3nv2s004ia846wwagbiveh7ffl3nnd','.eJxVjMEOgjAQRP-lZ9PQZUvBo3e_odntVouaNqFwMvw7kHDQ22Tem_kqT8uc_FLj5EdRV2XU5bdjCu-YDyAvys-iQ8nzNLI-FH3Squ9F4ud2un8HiWra1xACisOHs0iWW-xYgvCeWh7YWZCGDBroiaHpqRMhh-CGyGA5Ihi1bvMROBU:1rIgfK:JvRUU-NSUWGy-VviHm7Ol2f_JXOC9jk6vm5jMx8-1-o','2024-01-11 03:02:34.956580');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opiniones_opinion`
--

DROP TABLE IF EXISTS `opiniones_opinion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opiniones_opinion` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `texto` longtext NOT NULL,
  `fecha` datetime(6) NOT NULL,
  `blog_id` bigint NOT NULL,
  `usuario_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `opiniones_opinion_blog_id_53c48c30_fk_blogs_blogs_id` (`blog_id`),
  KEY `opiniones_opinion_usuario_id_6c8a7eea_fk_usuarios_usuarios_id` (`usuario_id`),
  CONSTRAINT `opiniones_opinion_blog_id_53c48c30_fk_blogs_blogs_id` FOREIGN KEY (`blog_id`) REFERENCES `blogs_blogs` (`id`),
  CONSTRAINT `opiniones_opinion_usuario_id_6c8a7eea_fk_usuarios_usuarios_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios_usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opiniones_opinion`
--

LOCK TABLES `opiniones_opinion` WRITE;
/*!40000 ALTER TABLE `opiniones_opinion` DISABLE KEYS */;
INSERT INTO `opiniones_opinion` VALUES (3,'vamos yendo! lets goo','2023-12-23 20:28:19.214007',3,4),(5,'Nice! x2','2023-12-28 22:52:17.299514',15,2),(6,'good one','2023-12-28 22:53:19.145446',15,1),(7,'que lindo articulo!','2023-12-28 23:32:32.146868',4,1);
/*!40000 ALTER TABLE `opiniones_opinion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_usuarios`
--

DROP TABLE IF EXISTS `usuarios_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios_usuarios` (
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
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `es_colaborador` tinyint(1) NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_usuarios`
--

LOCK TABLES `usuarios_usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios_usuarios` DISABLE KEYS */;
INSERT INTO `usuarios_usuarios` VALUES (1,'pbkdf2_sha256$600000$zUHOTYBn5El7Ar4it1npN8$5KA86+k2xndQKgHhGmGdBO+T+yf2uWbS+vb03rXEHmU=','2023-12-29 00:34:01.318565',0,'Landers52','','','guido@gmail.com',0,1,'2023-12-19 23:41:30.000000','Guido','Landers','2000-01-01',1,'usuarios/mama.jpg'),(2,'pbkdf2_sha256$600000$GxHBkPBznLpoA2DiN2Yq44$Nd4/QV41Db82MI43ckUba8Nk8+UO1Cdcn+8iOVMZ3kM=','2023-12-28 22:51:51.314451',0,'land','','','guis@gmail.com',0,1,'2023-12-20 02:58:09.250677','Guido2','Fuens2','2000-01-01',0,'usuarios/images.png'),(3,'pbkdf2_sha256$600000$rN7F852aWR8WHe1RhR2tfE$sfmPQ+71f3Hua9c1NKWtiCDKG9euJvfluCyOwDBhcLY=','2023-12-22 01:43:48.460365',1,'admin','','','admin@gmail.com',1,1,'2023-12-22 01:43:21.043072','','','2000-01-01',0,'usuarios/default.png'),(4,'pbkdf2_sha256$600000$n8kLYFkrCPjdxJfyd2z8wR$GXhlODaMUejYSgvRw9nr4WMpfRQiFrd0Bwfh3lhxlh4=','2023-12-23 20:27:06.755148',0,'Maria','','','maria@gmail.com',0,1,'2023-12-23 20:26:54.625272','Maria','Nobara','2000-01-01',0,'usuarios/Timmy_vs_Jimmy.jpg');
/*!40000 ALTER TABLE `usuarios_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_usuarios_groups`
--

DROP TABLE IF EXISTS `usuarios_usuarios_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios_usuarios_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `usuarios_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuarios_usuarios_groups_usuarios_id_group_id_31056d4d_uniq` (`usuarios_id`,`group_id`),
  KEY `usuarios_usuarios_groups_group_id_1e265f46_fk_auth_group_id` (`group_id`),
  CONSTRAINT `usuarios_usuarios_gr_usuarios_id_65c166be_fk_usuarios_` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios_usuarios` (`id`),
  CONSTRAINT `usuarios_usuarios_groups_group_id_1e265f46_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_usuarios_groups`
--

LOCK TABLES `usuarios_usuarios_groups` WRITE;
/*!40000 ALTER TABLE `usuarios_usuarios_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios_usuarios_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_usuarios_user_permissions`
--

DROP TABLE IF EXISTS `usuarios_usuarios_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios_usuarios_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `usuarios_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuarios_usuarios_user_p_usuarios_id_permission_i_1fb72da5_uniq` (`usuarios_id`,`permission_id`),
  KEY `usuarios_usuarios_us_permission_id_394f07a6_fk_auth_perm` (`permission_id`),
  CONSTRAINT `usuarios_usuarios_us_permission_id_394f07a6_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `usuarios_usuarios_us_usuarios_id_d860a7b5_fk_usuarios_` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios_usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_usuarios_user_permissions`
--

LOCK TABLES `usuarios_usuarios_user_permissions` WRITE;
/*!40000 ALTER TABLE `usuarios_usuarios_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios_usuarios_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-29  0:15:36
