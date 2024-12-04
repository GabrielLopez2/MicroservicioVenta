CREATE DATABASE  IF NOT EXISTS `utpolis` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `utpolis`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: utpolis
-- ------------------------------------------------------
-- Server version	9.0.0

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
-- Table structure for table `asiento`
--

DROP TABLE IF EXISTS `asiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asiento` (
  `asiento_id` bigint NOT NULL AUTO_INCREMENT,
  `numero` varchar(255) NOT NULL,
  `ocupado` bit(1) NOT NULL,
  `sala_id` bigint NOT NULL,
  PRIMARY KEY (`asiento_id`),
  KEY `FKq1f7rh32b8ps4gy1ynoydgyag` (`sala_id`),
  CONSTRAINT `FKq1f7rh32b8ps4gy1ynoydgyag` FOREIGN KEY (`sala_id`) REFERENCES `sala` (`sala_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asiento`
--

LOCK TABLES `asiento` WRITE;
/*!40000 ALTER TABLE `asiento` DISABLE KEYS */;
INSERT INTO `asiento` VALUES (1,'A1',_binary '\0',4),(2,'A2',_binary '',4),(3,'B1',_binary '\0',5),(4,'B2',_binary '',5);
/*!40000 ALTER TABLE `asiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boleto`
--

DROP TABLE IF EXISTS `boleto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boleto` (
  `boleto_id` bigint NOT NULL AUTO_INCREMENT,
  `precio` double NOT NULL,
  `asiento_id` bigint NOT NULL,
  `funcion_id` bigint NOT NULL,
  PRIMARY KEY (`boleto_id`),
  KEY `FK4rf4xo58vs9khgogwq7412ved` (`asiento_id`),
  KEY `FKqj54t6xd8hq0edme8qsja0lwh` (`funcion_id`),
  CONSTRAINT `FK4rf4xo58vs9khgogwq7412ved` FOREIGN KEY (`asiento_id`) REFERENCES `asiento` (`asiento_id`),
  CONSTRAINT `FKqj54t6xd8hq0edme8qsja0lwh` FOREIGN KEY (`funcion_id`) REFERENCES `funcion` (`funcion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boleto`
--

LOCK TABLES `boleto` WRITE;
/*!40000 ALTER TABLE `boleto` DISABLE KEYS */;
/*!40000 ALTER TABLE `boleto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `categoria_id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`categoria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (5,'Dulces'),(6,'Bebidas'),(7,'Palomitas'),(8,'Snacks'),(9,'Dulces'),(10,'Bebidas'),(11,'Palomitas'),(12,'Snacks');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cupon`
--

DROP TABLE IF EXISTS `cupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cupon` (
  `cupon_id` bigint NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) NOT NULL,
  `descuento` double NOT NULL,
  `fecha_fin` datetime(6) NOT NULL,
  `fecha_inicio` datetime(6) NOT NULL,
  PRIMARY KEY (`cupon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cupon`
--

LOCK TABLES `cupon` WRITE;
/*!40000 ALTER TABLE `cupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `cupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_venta` (
  `detalle_venta_id` bigint NOT NULL AUTO_INCREMENT,
  `cantidad` int NOT NULL,
  `subtotal_detalle` float NOT NULL,
  `funcion_id` bigint DEFAULT NULL,
  `producto_id` bigint DEFAULT NULL,
  `venta_id` bigint NOT NULL,
  PRIMARY KEY (`detalle_venta_id`),
  KEY `FKijp0mvv76n5lxc7km9xqkse09` (`funcion_id`),
  KEY `FKmi06vmeg5th7wdow1mxcqg78e` (`producto_id`),
  KEY `FKhj0bf0515yg7equ11ab4xgq3f` (`venta_id`),
  CONSTRAINT `FKhj0bf0515yg7equ11ab4xgq3f` FOREIGN KEY (`venta_id`) REFERENCES `venta` (`venta_id`),
  CONSTRAINT `FKijp0mvv76n5lxc7km9xqkse09` FOREIGN KEY (`funcion_id`) REFERENCES `funcion` (`funcion_id`),
  CONSTRAINT `FKmi06vmeg5th7wdow1mxcqg78e` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`producto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_venta`
--

LOCK TABLES `detalle_venta` WRITE;
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_venta_asiento`
--

DROP TABLE IF EXISTS `detalle_venta_asiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_venta_asiento` (
  `detalle_venta_id` bigint NOT NULL,
  `asiento_id` bigint NOT NULL,
  UNIQUE KEY `UKrhuhbtdpk0saihm5yvc2nb15e` (`asiento_id`),
  KEY `FKob2dg9imj16yeg85viudyta36` (`detalle_venta_id`),
  CONSTRAINT `FK12olablqvubudh4rra3k4dqmr` FOREIGN KEY (`asiento_id`) REFERENCES `asiento` (`asiento_id`),
  CONSTRAINT `FKob2dg9imj16yeg85viudyta36` FOREIGN KEY (`detalle_venta_id`) REFERENCES `detalle_venta` (`detalle_venta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_venta_asiento`
--

LOCK TABLES `detalle_venta_asiento` WRITE;
/*!40000 ALTER TABLE `detalle_venta_asiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_venta_asiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcion`
--

DROP TABLE IF EXISTS `funcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcion` (
  `funcion_id` bigint NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `precio` float NOT NULL,
  `horario_id` bigint NOT NULL,
  `pelicula_id` bigint NOT NULL,
  `sala_id` bigint NOT NULL,
  PRIMARY KEY (`funcion_id`),
  KEY `FK7r68fwvrvqcc7mxmxe51c58w4` (`horario_id`),
  KEY `FKrg3moehotogvep1rxqgtb6swh` (`pelicula_id`),
  KEY `FKtduw4tg8j1ptlfh96j40mq988` (`sala_id`),
  CONSTRAINT `FK7r68fwvrvqcc7mxmxe51c58w4` FOREIGN KEY (`horario_id`) REFERENCES `horario` (`horario_id`),
  CONSTRAINT `FKrg3moehotogvep1rxqgtb6swh` FOREIGN KEY (`pelicula_id`) REFERENCES `pelicula` (`pelicula_id`),
  CONSTRAINT `FKtduw4tg8j1ptlfh96j40mq988` FOREIGN KEY (`sala_id`) REFERENCES `sala` (`sala_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcion`
--

LOCK TABLES `funcion` WRITE;
/*!40000 ALTER TABLE `funcion` DISABLE KEYS */;
INSERT INTO `funcion` VALUES (9,'2024-11-30',100,1,1,4),(10,'2024-12-01',120,2,2,5);
/*!40000 ALTER TABLE `funcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horario`
--

DROP TABLE IF EXISTS `horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horario` (
  `horario_id` bigint NOT NULL AUTO_INCREMENT,
  `hora` time NOT NULL,
  PRIMARY KEY (`horario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario`
--

LOCK TABLES `horario` WRITE;
/*!40000 ALTER TABLE `horario` DISABLE KEYS */;
INSERT INTO `horario` VALUES (1,'10:00:00'),(2,'14:00:00');
/*!40000 ALTER TABLE `horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `inventario_id` bigint NOT NULL AUTO_INCREMENT,
  `cantidad` int NOT NULL,
  `fecha` varchar(255) NOT NULL,
  `tipo_movimiento` varchar(255) NOT NULL,
  `producto_id` bigint DEFAULT NULL,
  `proveedor_id` bigint DEFAULT NULL,
  PRIMARY KEY (`inventario_id`),
  KEY `FK2jpmjsxwl42blfea24vda6fs6` (`producto_id`),
  KEY `FKghqc62fq03wcb1s9847prenrj` (`proveedor_id`),
  CONSTRAINT `FK2jpmjsxwl42blfea24vda6fs6` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`producto_id`),
  CONSTRAINT `FKghqc62fq03wcb1s9847prenrj` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`proveedor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
INSERT INTO `inventario` VALUES (5,50,'2024-12-01','Ingreso',5,1),(6,100,'2024-12-01','Ingreso',6,2);
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelicula`
--

DROP TABLE IF EXISTS `pelicula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelicula` (
  `pelicula_id` bigint NOT NULL AUTO_INCREMENT,
  `categoria` varchar(255) NOT NULL,
  `clasificacion` varchar(255) NOT NULL,
  `duracion` varchar(255) NOT NULL,
  `idioma` varchar(255) NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `sinopsis` varchar(255) NOT NULL,
  PRIMARY KEY (`pelicula_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula`
--

LOCK TABLES `pelicula` WRITE;
/*!40000 ALTER TABLE `pelicula` DISABLE KEYS */;
INSERT INTO `pelicula` VALUES (1,'Acción','A','120 min','Español','accion.jpg','Rápidos y Furiosos','Una historia de carreras y acción'),(2,'Comedia','B','90 min','Inglés','comedia.jpg','La Risa','Comedia para toda la familia');
/*!40000 ALTER TABLE `pelicula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `persona_id` bigint NOT NULL AUTO_INCREMENT,
  `apellidos` varchar(255) NOT NULL,
  `fecha_nacimiento` varchar(255) NOT NULL,
  `nombres` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  PRIMARY KEY (`persona_id`),
  UNIQUE KEY `UK19624pour0ky6k8m7oc9vnsrm` (`telefono`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,'Pérez','1990-06-15','Juan','5551234567'),(2,'Gómez','1985-12-01','Ana','5557654321');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `producto_id` bigint NOT NULL AUTO_INCREMENT,
  `estatus` bit(1) NOT NULL,
  `existencia` int NOT NULL,
  `nombre_producto` varchar(255) NOT NULL,
  `precio` float NOT NULL,
  `tamanio` varchar(255) NOT NULL,
  `unidad` varchar(255) NOT NULL,
  `categoria_id` bigint DEFAULT NULL,
  PRIMARY KEY (`producto_id`),
  KEY `FKodqr7965ok9rwquj1utiamt0m` (`categoria_id`),
  CONSTRAINT `FKodqr7965ok9rwquj1utiamt0m` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`categoria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (5,_binary '',100,'Palomitas',50,'Grande','Gramos',5),(6,_binary '',200,'Refresco',25,'Mediano','Litros',6),(7,_binary '',100,'Palomitas',50,'Grande','Gramos',5),(8,_binary '',200,'Refresco',25,'Mediano','Litros',6);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promocion`
--

DROP TABLE IF EXISTS `promocion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promocion` (
  `promocion_id` bigint NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  `descuento` double NOT NULL,
  `fecha_fin` datetime(6) NOT NULL,
  `fecha_inicio` datetime(6) NOT NULL,
  PRIMARY KEY (`promocion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promocion`
--

LOCK TABLES `promocion` WRITE;
/*!40000 ALTER TABLE `promocion` DISABLE KEYS */;
INSERT INTO `promocion` VALUES (1,'Descuento por el estreno',15,'2024-12-15 23:59:59.000000','2024-11-01 00:00:00.000000'),(2,'Descuento navideño',20,'2024-12-25 23:59:59.000000','2024-12-01 00:00:00.000000');
/*!40000 ALTER TABLE `promocion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `proveedor_id` bigint NOT NULL AUTO_INCREMENT,
  `correo` varchar(255) NOT NULL,
  `nombre_proveedor` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  PRIMARY KEY (`proveedor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'proveedor1@utpolis.com','Proveedor A','1234567890'),(2,'proveedor2@utpolis.com','Proveedor B','0987654321'),(3,'proveedor1@utpolis.com','Proveedor A','1234567890'),(4,'proveedor2@utpolis.com','Proveedor B','0987654321');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Cliente'),(2,'Empleado');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sala`
--

DROP TABLE IF EXISTS `sala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sala` (
  `sala_id` bigint NOT NULL AUTO_INCREMENT,
  `capacidad` smallint NOT NULL,
  `estatus` bit(1) NOT NULL,
  `numero` tinyint NOT NULL,
  `tipo` varchar(255) NOT NULL,
  PRIMARY KEY (`sala_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sala`
--

LOCK TABLES `sala` WRITE;
/*!40000 ALTER TABLE `sala` DISABLE KEYS */;
INSERT INTO `sala` VALUES (4,100,_binary '',1,'Normal'),(5,150,_binary '\0',2,'IMAX'),(6,100,_binary '',1,'Normal'),(7,150,_binary '\0',2,'IMAX');
/*!40000 ALTER TABLE `sala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `usuario_id` bigint NOT NULL AUTO_INCREMENT,
  `activo` bit(1) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `persona_id` bigint DEFAULT NULL,
  PRIMARY KEY (`usuario_id`),
  UNIQUE KEY `UK2mlfr087gb1ce55f2j87o74t` (`correo`),
  UNIQUE KEY `UK863n1y3x0jalatoir4325ehal` (`username`),
  UNIQUE KEY `UKc30a561f4mytkssjk76n0c1b3` (`persona_id`),
  CONSTRAINT `FKlse7lqghmt3r1sp298ss9s5bc` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`persona_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,_binary '','juanperez@utpolis.com','password123','juanp',1),(2,_binary '','anagomez@utpolis.com','password456','ana',2);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_rol`
--

DROP TABLE IF EXISTS `usuario_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_rol` (
  `rol_id` bigint DEFAULT NULL,
  `usuario_id` bigint NOT NULL,
  PRIMARY KEY (`usuario_id`),
  KEY `FK610kvhkwcqk2pxeewur4l7bd1` (`rol_id`),
  CONSTRAINT `FK610kvhkwcqk2pxeewur4l7bd1` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`),
  CONSTRAINT `FKbyfgloj439r9wr9smrms9u33r` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_rol`
--

LOCK TABLES `usuario_rol` WRITE;
/*!40000 ALTER TABLE `usuario_rol` DISABLE KEYS */;
INSERT INTO `usuario_rol` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `usuario_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `venta_id` bigint NOT NULL AUTO_INCREMENT,
  `fecha` datetime(6) NOT NULL,
  `cliente_id` bigint DEFAULT NULL,
  `empleado_id` bigint DEFAULT NULL,
  PRIMARY KEY (`venta_id`),
  KEY `FK3p1fca8phv5w0ac3aboi5cad7` (`cliente_id`),
  KEY `FKelkkirbh21dhjcgteidg27qdt` (`empleado_id`),
  CONSTRAINT `FK3p1fca8phv5w0ac3aboi5cad7` FOREIGN KEY (`cliente_id`) REFERENCES `usuario` (`usuario_id`),
  CONSTRAINT `FKelkkirbh21dhjcgteidg27qdt` FOREIGN KEY (`empleado_id`) REFERENCES `usuario` (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,'2024-11-30 10:00:00.000000',2,1),(2,'2024-11-30 14:30:00.000000',1,2),(3,'2024-12-01 15:00:00.000000',2,1);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-01 21:07:17
