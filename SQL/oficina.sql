CREATE DATABASE  IF NOT EXISTS `oficina` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `oficina`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: oficina
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `sobrenome` varchar(255) NOT NULL,
  `rua` varchar(255) NOT NULL,
  `bairro` varchar(255) NOT NULL,
  `numero_casa` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero_casa` (`numero_casa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `carga_horaria` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_departamento` int DEFAULT NULL,
  `nome` varchar(255) NOT NULL,
  `sobrenome` varchar(255) NOT NULL,
  `rua` varchar(255) NOT NULL,
  `bairro` varchar(255) NOT NULL,
  `numero_casa` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero_casa` (`numero_casa`),
  KEY `id_departamento` (`id_departamento`),
  CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peca`
--

DROP TABLE IF EXISTS `peca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `peca` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `custo_unitario` varchar(255) NOT NULL,
  `veiculo_designado` varchar(255) NOT NULL,
  `quantidade` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peca`
--

LOCK TABLES `peca` WRITE;
/*!40000 ALTER TABLE `peca` DISABLE KEYS */;
/*!40000 ALTER TABLE `peca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reparacao`
--

DROP TABLE IF EXISTS `reparacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reparacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `preco_total_peca` varchar(255) NOT NULL,
  `preco_total` varchar(255) NOT NULL,
  `data` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reparacao`
--

LOCK TABLES `reparacao` WRITE;
/*!40000 ALTER TABLE `reparacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `reparacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reparacao_funcionario`
--

DROP TABLE IF EXISTS `reparacao_funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reparacao_funcionario` (
  `id_reparacao` int DEFAULT NULL,
  `id_funcionario` int DEFAULT NULL,
  `pecas_utilizadas` int NOT NULL,
  `tempo_gasto` varchar(255) NOT NULL,
  KEY `id_reparacao` (`id_reparacao`),
  KEY `id_funcionario` (`id_funcionario`),
  CONSTRAINT `reparacao_funcionario_ibfk_1` FOREIGN KEY (`id_reparacao`) REFERENCES `reparacao` (`id`),
  CONSTRAINT `reparacao_funcionario_ibfk_2` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reparacao_funcionario`
--

LOCK TABLES `reparacao_funcionario` WRITE;
/*!40000 ALTER TABLE `reparacao_funcionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `reparacao_funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reparacao_peca`
--

DROP TABLE IF EXISTS `reparacao_peca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reparacao_peca` (
  `id_reparacao` int DEFAULT NULL,
  `id_peca` int DEFAULT NULL,
  `id_veiculo` int DEFAULT NULL,
  KEY `id_reparacao` (`id_reparacao`),
  KEY `id_peca` (`id_peca`),
  KEY `id_veiculo` (`id_veiculo`),
  CONSTRAINT `reparacao_peca_ibfk_1` FOREIGN KEY (`id_reparacao`) REFERENCES `reparacao` (`id`),
  CONSTRAINT `reparacao_peca_ibfk_2` FOREIGN KEY (`id_peca`) REFERENCES `peca` (`id`),
  CONSTRAINT `reparacao_peca_ibfk_3` FOREIGN KEY (`id_veiculo`) REFERENCES `veiculo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reparacao_peca`
--

LOCK TABLES `reparacao_peca` WRITE;
/*!40000 ALTER TABLE `reparacao_peca` DISABLE KEYS */;
/*!40000 ALTER TABLE `reparacao_peca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reparacao_veiculo`
--

DROP TABLE IF EXISTS `reparacao_veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reparacao_veiculo` (
  `id_reparacao` int DEFAULT NULL,
  `id_veiculo` int DEFAULT NULL,
  KEY `id_reparacao` (`id_reparacao`),
  KEY `id_veiculo` (`id_veiculo`),
  CONSTRAINT `reparacao_veiculo_ibfk_1` FOREIGN KEY (`id_reparacao`) REFERENCES `reparacao` (`id`),
  CONSTRAINT `reparacao_veiculo_ibfk_2` FOREIGN KEY (`id_veiculo`) REFERENCES `veiculo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reparacao_veiculo`
--

LOCK TABLES `reparacao_veiculo` WRITE;
/*!40000 ALTER TABLE `reparacao_veiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `reparacao_veiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefone_cliente`
--

DROP TABLE IF EXISTS `telefone_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefone_cliente` (
  `id_cliente` int DEFAULT NULL,
  `telefone_residencial` varchar(255) DEFAULT NULL,
  `telefone_profissional` varchar(255) DEFAULT NULL,
  `telefone_pessoal` varchar(255) NOT NULL,
  UNIQUE KEY `telefone_pessoal` (`telefone_pessoal`),
  UNIQUE KEY `telefone_residencial` (`telefone_residencial`),
  UNIQUE KEY `telefone_profissional` (`telefone_profissional`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `telefone_cliente_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefone_cliente`
--

LOCK TABLES `telefone_cliente` WRITE;
/*!40000 ALTER TABLE `telefone_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `telefone_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefone_funcionario`
--

DROP TABLE IF EXISTS `telefone_funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefone_funcionario` (
  `id_funcionario` int DEFAULT NULL,
  `telefone_residencial` varchar(255) DEFAULT NULL,
  `telefone_profissional` varchar(255) DEFAULT NULL,
  `telefone_pessoal` varchar(255) NOT NULL,
  UNIQUE KEY `telefone_pessoal` (`telefone_pessoal`),
  UNIQUE KEY `telefone_residencial` (`telefone_residencial`),
  UNIQUE KEY `telefone_profissional` (`telefone_profissional`),
  KEY `id_funcionario` (`id_funcionario`),
  CONSTRAINT `telefone_funcionario_ibfk_1` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefone_funcionario`
--

LOCK TABLES `telefone_funcionario` WRITE;
/*!40000 ALTER TABLE `telefone_funcionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `telefone_funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veiculo`
--

DROP TABLE IF EXISTS `veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veiculo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int DEFAULT NULL,
  `modelo` varchar(255) NOT NULL,
  `marca` varchar(255) NOT NULL,
  `data_aquisicao` date NOT NULL,
  `ativo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `veiculo_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veiculo`
--

LOCK TABLES `veiculo` WRITE;
/*!40000 ALTER TABLE `veiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `veiculo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-11 20:12:41
