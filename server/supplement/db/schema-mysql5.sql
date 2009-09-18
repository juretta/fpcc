-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.67


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema javaflexdemo
--

CREATE DATABASE IF NOT EXISTS javaflexdemo;
USE javaflexdemo;

--
-- Definition of table `javaflexdemo`.`category`
--

DROP TABLE IF EXISTS `javaflexdemo`.`category`;
CREATE TABLE  `javaflexdemo`.`category` (
  `id` int(11) NOT NULL auto_increment,
  `parent` int(11) NOT NULL,
  `label` varchar(255) character set latin1 NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `javaflexdemo`.`category`
--

--
-- Definition of table `javaflexdemo`.`product`
--

DROP TABLE IF EXISTS `javaflexdemo`.`product`;
CREATE TABLE  `javaflexdemo`.`product` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `vendor` varchar(255) NOT NULL,
  `weight` double NOT NULL,
  `volume` double NOT NULL,
  `stock_amount` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `categoryfk` (`category`),
  CONSTRAINT `categoryfk` FOREIGN KEY (`category`) REFERENCES `category` (`id`) ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `javaflexdemo`.`product`
--



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
