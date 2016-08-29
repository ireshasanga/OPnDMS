/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.27 : Database - opdms_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`opdms_db` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `opdms_db`;

/*Table structure for table `address` */

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
  `id_address` int(11) NOT NULL AUTO_INCREMENT,
  `address_line_one` varchar(200) NOT NULL,
  `address_line_two` varchar(200) NOT NULL,
  `address_line_three` varchar(200) NOT NULL,
  `country` int(165) NOT NULL,
  `customer` int(200) NOT NULL,
  `address_type` int(200) NOT NULL,
  PRIMARY KEY (`id_address`),
  KEY `FK_address_customer` (`customer`),
  KEY `FK_address_add_type` (`address_type`),
  KEY `FK_address_country` (`country`),
  CONSTRAINT `FK_address_country` FOREIGN KEY (`country`) REFERENCES `country` (`id_country`) ON UPDATE CASCADE,
  CONSTRAINT `FK_address_add_type` FOREIGN KEY (`address_type`) REFERENCES `address_type` (`id_address_type`) ON UPDATE CASCADE,
  CONSTRAINT `FK_address_customer` FOREIGN KEY (`customer`) REFERENCES `customer` (`id_customer`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `address` */

insert  into `address`(`id_address`,`address_line_one`,`address_line_two`,`address_line_three`,`country`,`customer`,`address_type`) values (1,'Othara Kiruwampola,','Keppitiwalana,','Alawwa,',1,1,1),(2,'No.27','Janaraja Mawatha,','Alawwa,',1,1,2);

/*Table structure for table `address_type` */

DROP TABLE IF EXISTS `address_type`;

CREATE TABLE `address_type` (
  `id_address_type` int(11) NOT NULL AUTO_INCREMENT,
  `address_type_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_address_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `address_type` */

insert  into `address_type`(`id_address_type`,`address_type_name`) values (1,'Invoice'),(2,'Delivery');

/*Table structure for table `bin_card` */

DROP TABLE IF EXISTS `bin_card`;

CREATE TABLE `bin_card` (
  `id_bin_card` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_item` int(200) DEFAULT NULL,
  `grn_item` int(200) DEFAULT NULL,
  PRIMARY KEY (`id_bin_card`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bin_card` */

/*Table structure for table `cart` */

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `inventory_item` int(11) NOT NULL,
  `session_id` varchar(50) NOT NULL,
  `order_quantity` int(11) NOT NULL,
  `added_date` datetime NOT NULL,
  KEY `FK_inventory_item` (`inventory_item`),
  CONSTRAINT `FK_inventory_item` FOREIGN KEY (`inventory_item`) REFERENCES `inventory_item` (`inventry_item_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `cart` */

insert  into `cart`(`inventory_item`,`session_id`,`order_quantity`,`added_date`) values (3,'FCE1F093B13FD3A1FF5705EAD3851D78',8,'2016-05-04 00:00:00'),(4,'FCE1F093B13FD3A1FF5705EAD3851D78',30,'2016-05-04 00:00:00'),(2,'FCE1F093B13FD3A1FF5705EAD3851D78',45,'2016-05-04 00:00:00'),(1,'FCE1F093B13FD3A1FF5705EAD3851D78',34,'2016-05-04 00:00:00'),(4,'E36EEE22D2CDBCF4B877B576570F3414',100,'2016-05-04 00:00:00'),(2,'E36EEE22D2CDBCF4B877B576570F3414',200,'2016-05-04 00:00:00'),(4,'F126B185E8F28788453AABCA3C1B2D31',200,'2016-05-04 00:00:00'),(4,'092D4798F5CE3FD32E1E0B1778F55554',12,'2016-05-05 00:00:00'),(4,'6F5046005CCB8FC6176084B7E67DFE81',222,'2016-05-05 00:00:00'),(4,'50A0A4B2B1A2976D88FB8F27D145CE2E',-1,'2016-05-05 00:00:00'),(4,'50A0A4B2B1A2976D88FB8F27D145CE2E',67,'2016-05-05 00:00:00'),(4,'1ED1CF32421F45F1E937A91634869DB6',60,'2016-05-06 00:00:00'),(3,'1ED1CF32421F45F1E937A91634869DB6',100,'2016-05-06 00:00:00'),(2,'A6B263C378447E856F4956C4A98B91EC',1111,'2016-05-06 00:00:00'),(3,'A6B263C378447E856F4956C4A98B91EC',2333,'2016-05-06 00:00:00'),(4,'A6B263C378447E856F4956C4A98B91EC',1221,'2016-05-06 00:00:00'),(3,'9ED960666E02D1CB3DBA157CA54704E1',100,'2016-05-06 00:00:00'),(2,'9ED960666E02D1CB3DBA157CA54704E1',100,'2016-05-06 00:00:00'),(3,'DFBB38D515CC8E2D02B2AD52BB4CEE22',100,'2016-05-06 00:00:00'),(4,'2FEE70DA5B7385CA498C3221628CD6DF',100,'2016-05-06 00:00:00'),(4,'9B9629A7CEADA714DCE51D767AFD0F2C',100,'2016-05-06 00:00:00'),(4,'E20A4B848BEB94A57CA522CF2D2C6155',100,'2016-05-06 00:00:00'),(4,'1C0DD84A8E0978595FB6717937A92123',12,'2016-05-06 00:00:00'),(4,'90993406F208093D6BA71718F1A29EB3',100,'2016-05-06 00:00:00'),(4,'90993406F208093D6BA71718F1A29EB3',100,'2016-05-06 00:00:00'),(4,'315A76C76A69947D336AC336EDE715E7',12,'2016-05-06 00:00:00'),(4,'4ECFBF3EB4BB81A49499AB2CB95F2395',100,'2016-05-06 00:00:00'),(3,'4ECFBF3EB4BB81A49499AB2CB95F2395',100,'2016-05-06 00:00:00'),(4,'4ECFBF3EB4BB81A49499AB2CB95F2395',-1,'2016-05-06 00:00:00'),(2,'668BDBBBAF408B54D823A07F88E5E85F',100,'2016-05-06 00:00:00'),(4,'4195BD918BCC8471D986C0F96A0C0DAA',122,'2016-05-06 00:00:00'),(2,'4195BD918BCC8471D986C0F96A0C0DAA',11,'2016-05-06 00:00:00'),(3,'2B378FD4F0BAD601548B1A6D10AECF52',100,'2016-05-07 00:00:00'),(4,'595B3668142B12F9756ACD8AC7C8E5DA',1111,'2016-05-07 00:00:00'),(3,'595B3668142B12F9756ACD8AC7C8E5DA',-1,'2016-05-07 00:00:00'),(4,'595B3668142B12F9756ACD8AC7C8E5DA',120,'2016-05-07 00:00:00'),(4,'5D2E7461687A3C73A52B161F11694B7D',100,'2016-05-07 00:00:00'),(3,'5D2E7461687A3C73A52B161F11694B7D',100,'2016-05-07 00:00:00'),(4,'C547854860ADC1B6428E7BBCFBECF58C',100,'2016-07-04 00:00:00'),(3,'C547854860ADC1B6428E7BBCFBECF58C',100,'2016-07-04 00:00:00'),(2,'C547854860ADC1B6428E7BBCFBECF58C',100,'2016-07-04 00:00:00'),(2,'6D8634F8286EF95CC24BC936072303D5',100,'2016-07-23 00:00:00'),(3,'6D8634F8286EF95CC24BC936072303D5',100,'2016-07-23 00:00:00'),(4,'E19B5970ECCE41D2E5D52AF8F5EEBF70',1200,'2016-08-25 00:00:00'),(3,'E19B5970ECCE41D2E5D52AF8F5EEBF70',1000,'2016-08-25 00:00:00'),(3,'1CC2703A02098DC6C3646F7C78021647',12,'2016-08-27 00:00:00'),(4,'3066D21E533AA827EAEEE0D4B4239146',100,'2016-08-27 00:00:00'),(3,'3066D21E533AA827EAEEE0D4B4239146',120,'2016-08-27 00:00:00'),(4,'92EF37EDE636CB440AE66096E0E82369',12,'2016-08-27 00:00:00'),(3,'92EF37EDE636CB440AE66096E0E82369',12,'2016-08-27 00:00:00'),(4,'D684BEA62D882A427D90974F188A66FD',12,'2016-08-27 00:00:00'),(3,'D684BEA62D882A427D90974F188A66FD',13,'2016-08-27 00:00:00'),(4,'F3D42F70E8492BD9A202E138F4D95CD8',12,'2016-08-27 00:00:00'),(3,'F3D42F70E8492BD9A202E138F4D95CD8',12,'2016-08-27 00:00:00'),(4,'F3D42F70E8492BD9A202E138F4D95CD8',12,'2016-08-27 00:00:00'),(3,'F3D42F70E8492BD9A202E138F4D95CD8',12,'2016-08-27 00:00:00'),(4,'819EFF1520EE4BD210AA86A360B32141',12,'2016-08-27 00:00:00'),(3,'819EFF1520EE4BD210AA86A360B32141',12,'2016-08-27 00:00:00'),(4,'819EFF1520EE4BD210AA86A360B32141',12,'2016-08-27 00:00:00'),(3,'819EFF1520EE4BD210AA86A360B32141',12,'2016-08-27 00:00:00'),(3,'819EFF1520EE4BD210AA86A360B32141',12,'2016-08-27 00:00:00'),(4,'819EFF1520EE4BD210AA86A360B32141',12,'2016-08-27 00:00:00'),(4,'B4C0BD1181083BA84C8A697FD12C6CAB',100,'2016-08-27 00:00:00'),(3,'B4C0BD1181083BA84C8A697FD12C6CAB',100,'2016-08-27 00:00:00'),(4,'B95690AC5755E7616A4A5490101F2E2C',50,'2016-08-27 00:00:00'),(3,'B95690AC5755E7616A4A5490101F2E2C',50,'2016-08-27 00:00:00'),(4,'B95690AC5755E7616A4A5490101F2E2C',12,'2016-08-27 00:00:00'),(4,'098D7B678F43BF425CBA59CE070DDEFF',10,'2016-08-27 00:00:00'),(3,'098D7B678F43BF425CBA59CE070DDEFF',10,'2016-08-27 00:00:00'),(4,'02E55CC45FD78605FA0D2AE1298B61A6',122,'2016-08-29 00:00:00'),(3,'02E55CC45FD78605FA0D2AE1298B61A6',100,'2016-08-29 00:00:00'),(4,'BD6538B1DCEBC546B793524D984414E0',12,'2016-08-29 00:00:00'),(3,'BD6538B1DCEBC546B793524D984414E0',12,'2016-08-29 00:00:00'),(4,'BD6538B1DCEBC546B793524D984414E0',12,'2016-08-29 00:00:00'),(3,'BD6538B1DCEBC546B793524D984414E0',12,'2016-08-29 00:00:00'),(4,'A5D2E84BE69872682186B3F876984AB6',12,'2016-08-29 00:00:00'),(3,'A5D2E84BE69872682186B3F876984AB6',12,'2016-08-29 00:00:00'),(4,'A5D2E84BE69872682186B3F876984AB6',12,'2016-08-29 00:00:00'),(4,'E47A0BA192912B47AC539197F370F8DA',12,'2016-08-29 00:00:00'),(3,'E47A0BA192912B47AC539197F370F8DA',12,'2016-08-29 00:00:00'),(4,'7E975CBBB6FC79652FD5BC6A0234C6F3',12,'2016-08-29 00:00:00'),(3,'7E975CBBB6FC79652FD5BC6A0234C6F3',12,'2016-08-29 00:00:00'),(4,'C5BC0DE5F3D5CD3146466728EBF99A8D',12,'2016-08-29 00:00:00'),(4,'9DAB6A06CC5C7D0E27AB782B294248A9',12,'2016-08-29 00:00:00'),(4,'202EDCB45CFCA540369A06219667788E',10,'2016-08-29 00:00:00'),(3,'202EDCB45CFCA540369A06219667788E',10,'2016-08-29 00:00:00'),(4,'E00E16C68AEC4089266C12EFD172A722',12,'2016-08-29 00:00:00'),(3,'E00E16C68AEC4089266C12EFD172A722',12,'2016-08-29 00:00:00');

/*Table structure for table `country` */

DROP TABLE IF EXISTS `country`;

CREATE TABLE `country` (
  `id_country` int(11) NOT NULL AUTO_INCREMENT,
  `country_code` varchar(45) DEFAULT NULL,
  `country_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_country`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `country` */

insert  into `country`(`id_country`,`country_code`,`country_name`) values (1,'001','Sri Lanka');

/*Table structure for table `currency` */

DROP TABLE IF EXISTS `currency`;

CREATE TABLE `currency` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `currency_code` varchar(20) NOT NULL,
  `currency_name` varchar(45) NOT NULL,
  `exchnage_rate` double NOT NULL DEFAULT '1',
  `is_base_currency` int(11) DEFAULT NULL,
  PRIMARY KEY (`currency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `currency` */

insert  into `currency`(`currency_id`,`currency_code`,`currency_name`,`exchnage_rate`,`is_base_currency`) values (1,'LKR','Sri Lankan Rupees',1,NULL);

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `id_customer` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `c_first_name` varchar(45) NOT NULL,
  `c_last_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `tp_number` varchar(65) NOT NULL,
  `prefered_currency` varchar(45) NOT NULL,
  PRIMARY KEY (`id_customer`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `customer` */

insert  into `customer`(`id_customer`,`username`,`password`,`c_first_name`,`c_last_name`,`email`,`tp_number`,`prefered_currency`) values (1,'iresh','1234','Iresh','Asanga','ireshasanga@gmail.com','','LKR'),(2,'user','1234','sfsa','fsd','das','','dasas'),(3,'asd','123','ytytyt','ggh','hghg','','hghb'),(4,'asd','123','ytytyt','ggh','hghg','','hghb');

/*Table structure for table `customer_address` */

DROP TABLE IF EXISTS `customer_address`;

CREATE TABLE `customer_address` (
  `id_cus_address` int(11) NOT NULL AUTO_INCREMENT,
  `address_line_one` varchar(45) NOT NULL,
  `address_line_two` varchar(45) NOT NULL,
  `address_line_three` varchar(45) NOT NULL,
  `country` int(11) NOT NULL,
  `address_type` varchar(45) NOT NULL,
  `customer` int(11) NOT NULL,
  PRIMARY KEY (`id_cus_address`),
  KEY `FK_customer` (`customer`),
  KEY `FK_cus_country` (`country`),
  CONSTRAINT `FK_customer` FOREIGN KEY (`customer`) REFERENCES `customer` (`id_customer`) ON UPDATE CASCADE,
  CONSTRAINT `FK_cus_country` FOREIGN KEY (`country`) REFERENCES `country` (`id_country`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `customer_address` */

insert  into `customer_address`(`id_cus_address`,`address_line_one`,`address_line_two`,`address_line_three`,`country`,`address_type`,`customer`) values (1,'62/4','Ranala Road','Habarakada',1,'1',1);

/*Table structure for table `delivered_invoice` */

DROP TABLE IF EXISTS `delivered_invoice`;

CREATE TABLE `delivered_invoice` (
  `delivery` int(200) NOT NULL,
  `invoice` int(200) NOT NULL,
  KEY `FK_del_inv_delivery` (`delivery`),
  KEY `FK_del_inv_invoice` (`invoice`),
  CONSTRAINT `FK_del_inv_delivery` FOREIGN KEY (`delivery`) REFERENCES `delivery` (`id_delivery`) ON UPDATE CASCADE,
  CONSTRAINT `FK_del_inv_invoice` FOREIGN KEY (`invoice`) REFERENCES `invoice` (`id_invoice`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `delivered_invoice` */

/*Table structure for table `delivery` */

DROP TABLE IF EXISTS `delivery`;

CREATE TABLE `delivery` (
  `id_delivery` int(11) NOT NULL AUTO_INCREMENT,
  `delivery_date` datetime NOT NULL,
  `delivered_by` int(200) NOT NULL,
  `vehicle` int(200) NOT NULL,
  PRIMARY KEY (`id_delivery`),
  KEY `FK_delivered_by` (`delivered_by`),
  KEY `FK_vehicle` (`vehicle`),
  CONSTRAINT `FK_delivered_by` FOREIGN KEY (`delivered_by`) REFERENCES `employee` (`employee_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_vehicle` FOREIGN KEY (`vehicle`) REFERENCES `vehicle` (`id_vehicle`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `delivery` */

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_number` varchar(20) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `mid_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) NOT NULL,
  `work_title` int(11) NOT NULL COMMENT 'must be FK',
  `salutation` int(11) NOT NULL COMMENT 'must be FK',
  `emp_username` varchar(165) NOT NULL,
  `emp_password` varchar(165) NOT NULL,
  `is_active` int(11) NOT NULL,
  `emp_added_on` datetime NOT NULL,
  `supervised_by` int(11) DEFAULT NULL COMMENT '*',
  `emp_added_by` int(11) DEFAULT NULL COMMENT '*',
  `last_login_on` datetime DEFAULT NULL COMMENT '*',
  PRIMARY KEY (`employee_id`),
  KEY `FK_salutation` (`salutation`),
  KEY `FK_work_title` (`work_title`),
  KEY `FK_supervised_by` (`supervised_by`),
  KEY `FK_emp_added_by` (`emp_added_by`),
  CONSTRAINT `FK_emp_added_by` FOREIGN KEY (`emp_added_by`) REFERENCES `employee` (`employee_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_salutation` FOREIGN KEY (`salutation`) REFERENCES `salutation` (`salutation_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_supervised_by` FOREIGN KEY (`supervised_by`) REFERENCES `employee` (`employee_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_work_title` FOREIGN KEY (`work_title`) REFERENCES `work_title` (`work_title_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `employee` */

insert  into `employee`(`employee_id`,`employee_number`,`first_name`,`mid_name`,`last_name`,`work_title`,`salutation`,`emp_username`,`emp_password`,`is_active`,`emp_added_on`,`supervised_by`,`emp_added_by`,`last_login_on`) values (1,'001','as','df','fg',1,1,'aaa','bbb',1,'2016-08-27 23:48:38',1,1,'2016-08-27 23:48:52');

/*Table structure for table `grn` */

DROP TABLE IF EXISTS `grn`;

CREATE TABLE `grn` (
  `id_grn` int(11) NOT NULL AUTO_INCREMENT,
  `grn_number` varchar(200) NOT NULL COMMENT 'unique',
  `grn_date` datetime NOT NULL,
  `po` int(200) NOT NULL,
  `grn_by` int(200) NOT NULL,
  `grn_on` datetime NOT NULL,
  `supplier_reference` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_grn`),
  KEY `FK_grn_by` (`grn_by`),
  KEY `FK_grn_po` (`po`),
  CONSTRAINT `FK_grn_by` FOREIGN KEY (`grn_by`) REFERENCES `employee` (`employee_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_grn_po` FOREIGN KEY (`po`) REFERENCES `purchase_order` (`id_po`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `grn` */

/*Table structure for table `grn_item` */

DROP TABLE IF EXISTS `grn_item`;

CREATE TABLE `grn_item` (
  `id_grn_item` int(11) NOT NULL,
  `grn` int(200) NOT NULL,
  `grn_quantity` int(250) NOT NULL,
  `po_item` int(200) NOT NULL,
  PRIMARY KEY (`id_grn_item`),
  KEY `FK_grn` (`grn`),
  KEY `FK_po_item` (`po_item`),
  CONSTRAINT `FK_grn` FOREIGN KEY (`grn`) REFERENCES `grn` (`id_grn`) ON UPDATE CASCADE,
  CONSTRAINT `FK_po_item` FOREIGN KEY (`po_item`) REFERENCES `purchase_order_item` (`id_po_item`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `grn_item` */

/*Table structure for table `inventory_item` */

DROP TABLE IF EXISTS `inventory_item`;

CREATE TABLE `inventory_item` (
  `inventry_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `inventry_item_code` varchar(45) NOT NULL,
  `inventry_item_name` varchar(45) NOT NULL,
  `unit_of_handling` int(11) DEFAULT NULL,
  `quantity_on_hand` int(11) NOT NULL DEFAULT '0',
  `reorder_level` int(11) NOT NULL DEFAULT '0',
  `reorder_quantity` int(11) NOT NULL DEFAULT '0',
  `unit_price` decimal(20,2) NOT NULL DEFAULT '0.00',
  `img_url` varchar(45) DEFAULT NULL,
  `inventory_item_type` int(11) DEFAULT NULL,
  `inventory_item_group` int(11) DEFAULT NULL,
  `currency` int(11) NOT NULL,
  `inventory_item_desc` varchar(200) DEFAULT NULL,
  `inventry_item_added_by` int(11) DEFAULT NULL,
  `inventry_item_added_on` datetime DEFAULT NULL,
  PRIMARY KEY (`inventry_item_id`),
  KEY `FK_inventory_item_type` (`inventory_item_type`),
  KEY `FK_inventory_item_group` (`inventory_item_group`),
  KEY `FK_uoh` (`unit_of_handling`),
  KEY `FK_currency` (`currency`),
  KEY `FK_inventory_item_added_by` (`inventry_item_added_by`),
  CONSTRAINT `FK_currency` FOREIGN KEY (`currency`) REFERENCES `currency` (`currency_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_inventory_item_added_by` FOREIGN KEY (`inventry_item_added_by`) REFERENCES `employee` (`employee_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_inventory_item_group` FOREIGN KEY (`inventory_item_group`) REFERENCES `inventry_item_group` (`id_inventry_item_group`) ON UPDATE CASCADE,
  CONSTRAINT `FK_inventory_item_type` FOREIGN KEY (`inventory_item_type`) REFERENCES `inventry_item_type` (`id_inventry_item_type`) ON UPDATE CASCADE,
  CONSTRAINT `FK_uoh` FOREIGN KEY (`unit_of_handling`) REFERENCES `unit_of_handling` (`id_unit_of_handling`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `inventory_item` */

insert  into `inventory_item`(`inventry_item_id`,`inventry_item_code`,`inventry_item_name`,`unit_of_handling`,`quantity_on_hand`,`reorder_level`,`reorder_quantity`,`unit_price`,`img_url`,`inventory_item_type`,`inventory_item_group`,`currency`,`inventory_item_desc`,`inventry_item_added_by`,`inventry_item_added_on`) values (1,'0001','Yogurt',1,1050,100,500,35.00,'0001.jpg',NULL,NULL,1,NULL,NULL,NULL),(2,'0002','SunCrush',1,1000,100,200,40.00,'0002.jpg',NULL,NULL,1,NULL,NULL,NULL),(3,'0003','SunYogurtMilk',1,1100,100,100,50.00,'0003.jpg',NULL,NULL,1,NULL,NULL,NULL),(4,'0004','SunFreshMilk',1,1500,100,200,95.00,'0004.jpg',NULL,NULL,1,NULL,NULL,NULL);

/*Table structure for table `inventry_item_group` */

DROP TABLE IF EXISTS `inventry_item_group`;

CREATE TABLE `inventry_item_group` (
  `id_inventry_item_group` int(11) NOT NULL AUTO_INCREMENT,
  `inventry_item_group_code` varchar(45) NOT NULL,
  `inventry_item_group_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id_inventry_item_group`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `inventry_item_group` */

insert  into `inventry_item_group`(`id_inventry_item_group`,`inventry_item_group_code`,`inventry_item_group_name`) values (1,'DRINK','Drink'),(2,'YOGURT','Yogurt'),(3,'YOGURT_DRINK','Yogurt Drink');

/*Table structure for table `inventry_item_type` */

DROP TABLE IF EXISTS `inventry_item_type`;

CREATE TABLE `inventry_item_type` (
  `id_inventry_item_type` int(11) NOT NULL AUTO_INCREMENT,
  `inventry_item_type_code` varchar(45) NOT NULL,
  `inventry_item_type_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id_inventry_item_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `inventry_item_type` */

insert  into `inventry_item_type`(`id_inventry_item_type`,`inventry_item_type_code`,`inventry_item_type_name`) values (1,'RM','Raw Material'),(2,'FP','Final Product');

/*Table structure for table `invoice` */

DROP TABLE IF EXISTS `invoice`;

CREATE TABLE `invoice` (
  `id_invoice` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_number` varchar(45) DEFAULT NULL,
  `invoice_date` datetime NOT NULL,
  `so` int(200) DEFAULT NULL,
  `last_updated_by` int(45) DEFAULT NULL,
  `last_updated_date_time` datetime DEFAULT NULL,
  `invoice_added_by` int(200) DEFAULT NULL,
  `invoice_is_active` int(11) DEFAULT NULL,
  `invoice_currency` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_invoice`),
  KEY `FK_invoice_so` (`so`),
  KEY `FK_invoice_added_by` (`invoice_added_by`),
  KEY `FK_invoice_currency` (`invoice_currency`),
  KEY `FK_inv_last_updated_by` (`last_updated_by`),
  CONSTRAINT `FK_invoice_added_by` FOREIGN KEY (`invoice_added_by`) REFERENCES `employee` (`employee_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_invoice_currency` FOREIGN KEY (`invoice_currency`) REFERENCES `currency` (`currency_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_invoice_so` FOREIGN KEY (`so`) REFERENCES `sales_order` (`id_so`) ON UPDATE CASCADE,
  CONSTRAINT `FK_inv_last_updated_by` FOREIGN KEY (`last_updated_by`) REFERENCES `employee` (`employee_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `invoice` */

insert  into `invoice`(`id_invoice`,`invoice_number`,`invoice_date`,`so`,`last_updated_by`,`last_updated_date_time`,`invoice_added_by`,`invoice_is_active`,`invoice_currency`) values (1,'SUN2015_000001','2016-08-27 23:49:11',1,1,'2016-08-27 23:49:21',1,1,1);

/*Table structure for table `invoice_item` */

DROP TABLE IF EXISTS `invoice_item`;

CREATE TABLE `invoice_item` (
  `id_invoice_item` int(11) NOT NULL AUTO_INCREMENT,
  `invoice` int(200) NOT NULL,
  `so_item` int(200) NOT NULL,
  `invoice_quantity` int(200) NOT NULL,
  `invoice_unit_price` decimal(20,2) NOT NULL DEFAULT '0.00',
  `invoice_desc` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_invoice_item`),
  KEY `FK_inv_item_invoice` (`invoice`),
  KEY `FK_inv_item_sales_order` (`so_item`),
  CONSTRAINT `FK_inv_item_invoice` FOREIGN KEY (`invoice`) REFERENCES `invoice` (`id_invoice`) ON UPDATE CASCADE,
  CONSTRAINT `FK_inv_item_sales_order` FOREIGN KEY (`so_item`) REFERENCES `sales_order_item` (`id_so_item`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `invoice_item` */

/*Table structure for table `mrn` */

DROP TABLE IF EXISTS `mrn`;

CREATE TABLE `mrn` (
  `id_mrn` int(11) NOT NULL AUTO_INCREMENT,
  `mrn_number` varchar(200) NOT NULL,
  `mrn_date` datetime NOT NULL,
  `request_by` int(165) NOT NULL,
  `is_active` int(11) NOT NULL,
  PRIMARY KEY (`id_mrn`),
  KEY `FK_mrn_request_by` (`request_by`),
  CONSTRAINT `FK_mrn_request_by` FOREIGN KEY (`request_by`) REFERENCES `employee` (`employee_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `mrn` */

/*Table structure for table `mrn_item` */

DROP TABLE IF EXISTS `mrn_item`;

CREATE TABLE `mrn_item` (
  `id_mrn_item` int(11) NOT NULL AUTO_INCREMENT,
  `mrn` int(200) NOT NULL,
  `inventry_item` int(200) NOT NULL,
  `requested_quantity` int(200) NOT NULL,
  `issued-quantity` int(200) NOT NULL,
  `unit_price` decimal(20,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id_mrn_item`),
  KEY `FK_mrn_item_mrn` (`mrn`),
  KEY `FK_mrn_inventry_item` (`inventry_item`),
  CONSTRAINT `FK_mrn_inventry_item` FOREIGN KEY (`inventry_item`) REFERENCES `inventory_item` (`inventry_item_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_mrn_item_mrn` FOREIGN KEY (`mrn`) REFERENCES `mrn` (`id_mrn`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `mrn_item` */

/*Table structure for table `purchase_order` */

DROP TABLE IF EXISTS `purchase_order`;

CREATE TABLE `purchase_order` (
  `id_po` int(11) NOT NULL AUTO_INCREMENT,
  `po_number` varchar(265) NOT NULL COMMENT 'unique',
  `po_date` datetime NOT NULL,
  `supplier` int(11) NOT NULL,
  `po_added_by` int(11) NOT NULL,
  `po_added_on` datetime NOT NULL,
  `po_is_active` int(11) NOT NULL,
  `currency` int(11) NOT NULL,
  PRIMARY KEY (`id_po`),
  KEY `FK_po_supplier` (`supplier`),
  KEY `FK_po_added_by` (`po_added_by`),
  KEY `FK_po_currencty` (`currency`),
  CONSTRAINT `FK_po_added_by` FOREIGN KEY (`po_added_by`) REFERENCES `employee` (`employee_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_po_currencty` FOREIGN KEY (`currency`) REFERENCES `currency` (`currency_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_po_supplier` FOREIGN KEY (`supplier`) REFERENCES `supplier` (`id_supplier`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `purchase_order` */

/*Table structure for table `purchase_order_item` */

DROP TABLE IF EXISTS `purchase_order_item`;

CREATE TABLE `purchase_order_item` (
  `id_po_item` int(11) NOT NULL AUTO_INCREMENT,
  `po` int(200) NOT NULL,
  `inventory_item` int(200) NOT NULL,
  `order_quantity` int(200) NOT NULL,
  `po_unit_price` decimal(20,2) NOT NULL DEFAULT '0.00',
  `po_item_desc` varchar(265) DEFAULT NULL,
  PRIMARY KEY (`id_po_item`),
  KEY `FK_po_inventory_item` (`inventory_item`),
  CONSTRAINT `FK_po_inventory_item` FOREIGN KEY (`inventory_item`) REFERENCES `inventory_item` (`inventry_item_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `purchase_order_item` */

/*Table structure for table `reference` */

DROP TABLE IF EXISTS `reference`;

CREATE TABLE `reference` (
  `reference` int(11) NOT NULL AUTO_INCREMENT,
  `next_reference` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`reference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `reference` */

/*Table structure for table `sales_order` */

DROP TABLE IF EXISTS `sales_order`;

CREATE TABLE `sales_order` (
  `id_so` int(11) NOT NULL AUTO_INCREMENT,
  `so_reference` varchar(200) NOT NULL,
  `so_date` datetime NOT NULL,
  `so_customer` int(200) NOT NULL,
  `so_delivery_address` int(200) NOT NULL,
  `so_invoice_address` int(200) NOT NULL,
  `so_added_on` datetime NOT NULL,
  PRIMARY KEY (`id_so`),
  KEY `FK_so_customer` (`so_customer`),
  CONSTRAINT `FK_so_customer` FOREIGN KEY (`so_customer`) REFERENCES `customer` (`id_customer`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `sales_order` */

insert  into `sales_order`(`id_so`,`so_reference`,`so_date`,`so_customer`,`so_delivery_address`,`so_invoice_address`,`so_added_on`) values (1,'SUN2015_000001','2016-08-27 23:42:32',1,1234,1234,'2016-08-27 23:42:55');

/*Table structure for table `sales_order_item` */

DROP TABLE IF EXISTS `sales_order_item`;

CREATE TABLE `sales_order_item` (
  `id_so_item` int(11) NOT NULL,
  `so` int(200) NOT NULL,
  `inventry_item` int(200) NOT NULL,
  `order_quantity` int(200) NOT NULL,
  `so_item_unit_price` decimal(20,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id_so_item`),
  KEY `FK_sales_order` (`so`),
  KEY `FK_so_inventry_item` (`inventry_item`),
  CONSTRAINT `FK_sales_order` FOREIGN KEY (`so`) REFERENCES `sales_order` (`id_so`) ON UPDATE CASCADE,
  CONSTRAINT `FK_so_inventry_item` FOREIGN KEY (`inventry_item`) REFERENCES `inventory_item` (`inventry_item_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sales_order_item` */

/*Table structure for table `salutation` */

DROP TABLE IF EXISTS `salutation`;

CREATE TABLE `salutation` (
  `salutation_id` int(11) NOT NULL AUTO_INCREMENT,
  `salutation_name` varchar(20) NOT NULL,
  PRIMARY KEY (`salutation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `salutation` */

insert  into `salutation`(`salutation_id`,`salutation_name`) values (1,'Mr'),(2,'Mrs');

/*Table structure for table `supplier` */

DROP TABLE IF EXISTS `supplier`;

CREATE TABLE `supplier` (
  `id_supplier` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_code` varchar(255) NOT NULL,
  `supplier_name` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL,
  `added_by` varchar(165) NOT NULL COMMENT 'should be a FK to an employee',
  `added_on` datetime NOT NULL,
  PRIMARY KEY (`id_supplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `supplier` */

/*Table structure for table `supplier_address` */

DROP TABLE IF EXISTS `supplier_address`;

CREATE TABLE `supplier_address` (
  `id_sup_address` int(11) NOT NULL AUTO_INCREMENT,
  `address_line_one` varchar(255) NOT NULL,
  `address_line_two` varchar(255) NOT NULL,
  `address_line_three` varchar(255) NOT NULL,
  `country` int(11) NOT NULL,
  `address_type` varchar(65) NOT NULL,
  `supplier` int(11) NOT NULL,
  PRIMARY KEY (`id_sup_address`),
  KEY `FK_supplier` (`supplier`),
  KEY `FK_sup_country` (`country`),
  CONSTRAINT `FK_supplier` FOREIGN KEY (`supplier`) REFERENCES `supplier` (`id_supplier`) ON UPDATE CASCADE,
  CONSTRAINT `FK_sup_country` FOREIGN KEY (`country`) REFERENCES `country` (`id_country`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `supplier_address` */

/*Table structure for table `unit_of_handling` */

DROP TABLE IF EXISTS `unit_of_handling`;

CREATE TABLE `unit_of_handling` (
  `id_unit_of_handling` int(11) NOT NULL AUTO_INCREMENT,
  `unit_code` varchar(45) NOT NULL,
  `unite_name` varchar(45) NOT NULL,
  `unit_symbol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_unit_of_handling`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `unit_of_handling` */

insert  into `unit_of_handling`(`id_unit_of_handling`,`unit_code`,`unite_name`,`unit_symbol`) values (1,'g','gram','g'),(2,'kg','kilo gram','kg');

/*Table structure for table `vehicle` */

DROP TABLE IF EXISTS `vehicle`;

CREATE TABLE `vehicle` (
  `id_vehicle` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_type` int(200) NOT NULL,
  `vehicle_number` varchar(200) NOT NULL,
  `vehicle_added_on` datetime NOT NULL,
  `vehicle_added_by` int(200) NOT NULL,
  `vehicle_is_active` int(11) NOT NULL,
  PRIMARY KEY (`id_vehicle`),
  KEY `FK_vehicle_type` (`vehicle_type`),
  KEY `FK_vehicle_added_by` (`vehicle_added_by`),
  CONSTRAINT `FK_vehicle_added_by` FOREIGN KEY (`vehicle_added_by`) REFERENCES `employee` (`employee_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_vehicle_type` FOREIGN KEY (`vehicle_type`) REFERENCES `vehicle_type` (`id_vehicle_type`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vehicle` */

/*Table structure for table `vehicle_type` */

DROP TABLE IF EXISTS `vehicle_type`;

CREATE TABLE `vehicle_type` (
  `id_vehicle_type` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id_vehicle_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vehicle_type` */

/*Table structure for table `work_title` */

DROP TABLE IF EXISTS `work_title`;

CREATE TABLE `work_title` (
  `work_title_id` int(11) NOT NULL AUTO_INCREMENT,
  `work_title_name` varchar(45) NOT NULL,
  PRIMARY KEY (`work_title_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `work_title` */

insert  into `work_title`(`work_title_id`,`work_title_name`) values (1,'Admin'),(2,'Stores Manager'),(3,'Sales and Marketing Manager');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
