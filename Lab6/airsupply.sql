SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

CREATE DATABASE AIRSUPPLY;

USE AIRSUPPLY;

CREATE TABLE IF NOT EXISTS `product` (
  `PRODUCT_ID` int NOT NULL DEFAULT 1000,
  `PRODUCT_NAME` varchar(30) DEFAULT NULL,
  `PRODUCT_DESCRIPTION` varchar(100) DEFAULT NULL,
  `PRODUCT_PRICE` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `vendor` (
  `VENDOR_ID` int NOT NULL auto_increment,
  `VENDOR_NAME` varchar(30) DEFAULT NULL,
  `ACCOUNTS_PAYABLE_TERMS` int DEFAULT NULL,
  PRIMARY KEY (`VENDOR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

alter table `vendor` auto_increment = 1001;

CREATE TABLE IF NOT EXISTS `orders` (
  `ORDER_ID` int NOT NULL auto_increment,
  `PRODUCT_ID` int DEFAULT NULL,
  `VENDOR_ID` int DEFAULT NULL,
  `ORDER_QUANTITY` int DEFAULT NULL,
  `ORDER_DATE` datetime DEFAULT NULL,
  `ARRIVAL_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ORDER_ID`),
  FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product`(`PRODUCT_ID`),
  FOREIGN KEY (`VENDOR_ID`) REFERENCES `vendor`(`VENDOR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

alter table `orders` auto_increment = 10001;

CREATE TABLE IF NOT EXISTS `joshuasteward` (
  `JOSH_ID` int NOT NULL DEFAULT 1,
  `VENDOR_NUM` int DEFAULT NULL,
  PRIMARY KEY (`JOSH_ID`),
  FOREIGN KEY (`VENDOR_NUM`) REFERENCES `vendor`(`VENDOR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


