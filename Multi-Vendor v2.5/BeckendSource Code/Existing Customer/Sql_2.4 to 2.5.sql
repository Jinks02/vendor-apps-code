-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 06, 2022 at 04:38 PM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";
--
-- Database: `mv2.5`
--

-- --------------------------------------------------------

--
-- Table structure for table `coupon`
--
ALTER TABLE driver
ADD kyc_details longtext DEFAULT NULL;
ALTER TABLE provider
ADD kyc_details longtext DEFAULT NULL;
UPDATE `version_control` SET version='2.5' WHERE version_control_id =1;
INSERT INTO `general_settings` (`general_settings_id`,`type`,`value`)
VALUES (122, 'driver_order_limit', 100),
(123,'paystack_secret','sk_test_5f926d7e94a4210d846f26e54ff9bede1f6a6211'),
(124, 'paystack_public', 'pk_test_67cc7c0cf83ba2d7159e3ae555b6a097e2843166'),
(125, 'paystack', '1'),
(126, 'cod_mode', '1');




