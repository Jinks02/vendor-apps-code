-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 30, 2022 at 01:26 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mv2.5`
--

-- --------------------------------------------------------

--
-- Table structure for table `addon`
--

CREATE TABLE `addon` (
  `addon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(150) CHARACTER SET utf8 NOT NULL,
  `sales_price` double NOT NULL,
  `tax` double DEFAULT NULL,
  `type` int(11) NOT NULL,
  `food_type` varchar(15) DEFAULT NULL,
  `min_purchase` int(11) DEFAULT '0',
  `max_purchase` int(11) DEFAULT '0',
  `stock` int(11) DEFAULT '0',
  `vendor_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `name` longtext,
  `phone` longtext,
  `address` longtext,
  `email` longtext,
  `password` longtext,
  `token` longtext NOT NULL,
  `role` varchar(10) DEFAULT NULL,
  `timestamp` varchar(20) DEFAULT NULL,
  `image` varchar(10) DEFAULT NULL,
  `cover_image` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `name`, `phone`, `address`, `email`, `password`, `token`, `role`, `timestamp`, `image`, `cover_image`) VALUES
(1, 'Admin', '123', 'gbroad', 'admin@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '356a192b7913b04c54574d18c28d46e6395428ab', '1', '1556085124', 'vendor_1.p', 'cover_1.jpg'),
(2, 'Mr. Accountant', '017', 'Dhaka', 'accountant@shop.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '', '4', '1430737266', NULL, ''),
(3, 'Mr Manager', '021525566', 'Niketon Dhaka', 'manager@shop.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '', '6', '1433682938', NULL, ''),
(68, 'jack', '123', '123', 'jack@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'b4c96d80854dd27e76d8cc9e21960eebda52e962', '11', '1616506426', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `admin_permission`
--

CREATE TABLE `admin_permission` (
  `admin_permission_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `codename` varchar(30) DEFAULT NULL,
  `parent_status` varchar(30) DEFAULT NULL,
  `description` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin_permission`
--

INSERT INTO `admin_permission` (`admin_permission_id`, `name`, `codename`, `parent_status`, `description`) VALUES
(1, 'Home', 'home', 'parent', NULL),
(2, 'Banner', 'banner', 'parent', NULL),
(3, 'Coupon', 'coupon', 'parent', NULL),
(4, 'Super Category', 'super_category', 'parent', NULL),
(5, 'Zone', 'zone', 'parent', NULL),
(6, 'D reccomendation', 'd_reccomendation', 'parent', NULL),
(7, 'Membership', 'membership', 'parent', NULL),
(8, 'Shop Type', 'shop_type', 'parent', NULL),
(9, 'Vendor', 'vendor', 'parent', NULL),
(10, 'Order', 'order', 'parent', NULL),
(11, 'take Away', 'take_away', 'parent', NULL),
(12, 'Payment', 'payment', 'parent', NULL),
(13, 'Settlement', 'settlement', 'parent', NULL),
(14, 'Users', 'users', 'parent', NULL),
(15, 'Membership History', 'membership_history', 'parent', NULL),
(16, 'Cash On Hand', 'cash_on_hand', 'parent', NULL),
(17, 'Category', 'category', 'parent', NULL),
(18, 'Sub Category', 'sub_category', 'parent', NULL),
(19, 'Provider', 'provider', 'parent', NULL),
(20, 'Tax', 'tax', 'parent', NULL),
(22, 'Booking Details', 'booking_details', 'parent', NULL),
(23, 'Payment Details', 'payment_details', 'parent', NULL),
(24, 'Delivery Boy', 'delivery_boy', 'parent', NULL),
(25, 'Delivery Tips', 'delivery_tips', 'parent', NULL),
(26, 'Fees', 'fees', 'parent', NULL),
(27, 'Notification', 'notification', 'parent', NULL),
(28, 'Policy', 'policy', 'parent', NULL),
(29, 'Manage Payment Gateway', 'manage_payment_gateway', 'parent', NULL),
(30, 'Currency', 'currency', 'parent', NULL),
(31, 'General settings', 'general_settings', 'parent', NULL),
(32, 'Manage Profile', 'manage_profile', 'parent', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `auto_suggesion`
--

CREATE TABLE `auto_suggesion` (
  `auto_suggesion_id` int(100) NOT NULL,
  `search_text` varchar(200) CHARACTER SET utf8 NOT NULL,
  `date` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auto_suggesion`
--

INSERT INTO `auto_suggesion` (`auto_suggesion_id`, `search_text`, `date`) VALUES
(1, 'lays', '1614925918'),
(2, 'chips', '2'),
(3, 'soap', '4'),
(5, 'chips2', '10');

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE `banner` (
  `banner_id` int(11) NOT NULL,
  `type` varchar(15) DEFAULT NULL,
  `title` varchar(150) DEFAULT NULL,
  `redirect_type` varchar(20) DEFAULT NULL,
  `category_id` varchar(11) DEFAULT NULL,
  `para` varchar(50) DEFAULT NULL,
  `image` varchar(50) DEFAULT NULL,
  `date` int(30) DEFAULT NULL,
  `vendor` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`banner_id`, `type`, `title`, `redirect_type`, `category_id`, `para`, `image`, `date`, `vendor`) VALUES
(120, '1', 'we serve for u', 'discount_upto', '241', '0', 'banner_120.png', 1641382139, 160),
(122, '1', 'yadav electronics', 'discount_upto', NULL, '20', 'banner_122.png', 1643557557, 176),
(124, '1', 'Sports', 'discount_upto', '261', '1', 'banner_124.png', 1644301928, 169),
(125, '1', 'Healthy vegetables', 'discount_upto', '251', '1', 'banner_1644308414125.png', 1644304374, 163),
(127, '1', 'hghjg', 'discount_upto', '309', '55', 'banner_127.png', 1648586654, 185),
(128, '1', 'Veggies & Fruits Store', 'discount_upto', '312', '1', 'banner_128.png', 1648788258, 234);

-- --------------------------------------------------------

--
-- Table structure for table `banner_master`
--

CREATE TABLE `banner_master` (
  `banner_master_id` int(11) NOT NULL,
  `type` varchar(15) DEFAULT NULL,
  `title` varchar(150) DEFAULT NULL,
  `superCategoryId` int(11) NOT NULL,
  `redirect_type` varchar(20) NOT NULL,
  `shop_type_id` int(20) DEFAULT NULL,
  `para` varchar(50) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `date` int(30) DEFAULT NULL,
  `admin` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `banner_master`
--

INSERT INTO `banner_master` (`banner_master_id`, `type`, `title`, `superCategoryId`, `redirect_type`, `shop_type_id`, `para`, `image`, `date`, `admin`) VALUES
(24, '3', 'test', 11, 'discount_upto', 48, '11', 'banner_master_1644310680.png', 1605086803, 1),
(50, '3', 'banner', 11, 'discount_upto', 43, 'para', 'banner_master_1647417099.png', 1605086803, 1),
(52, '2', 'Super Offer', 1, 'discount_upto', 42, '10', 'banner_master_1648158413.png', 1643993535, 1),
(53, '2', 'New rest', 1, 'discount_upto', 45, '0', 'banner_master_53.png', 1646725447, 1),
(54, '1', 'Sjellin', 1, 'discount_upto', 42, '5', 'banner_master_1648278697.png', 1647193194, 1),
(56, '1', 'sdfsdf', 1, 'discount_upto', 45, '5', 'banner_master_1647608886.png', 1647261661, 1),
(57, '1', 'Flash Offer', 1, 'discount_upto', 45, '25', 'banner_master_57.png', 1647416149, 1),
(58, '2', 'offer', 1, 'discount_upto', 45, '50', 'banner_master_58.png', 1647416233, 1),
(59, '1', 'Offer', 1, 'discount_upto', 45, '50', 'banner_master_59.png', 1647416775, 1),
(61, '2', 'ordinary', 1, 'discount_upto', 48, '10', 'banner_master_61.png', 1648588416, 0),
(62, '2', 'test', 1, 'discount_upto', 43, '0', 'banner_master_62.png', 1648647632, 1),
(63, '1', 'Fresh Veggies and Fruits', 1, 'discount_upto', 44, '1', 'banner_master_63.png', 1648743450, 1),
(64, '1', 'sri fashion', 1, 'discount_upto', 69, '5', 'banner_master_64.png', 1648798999, 1),
(65, '2', 'sri fashion', 1, 'discount_upto', 69, '5', 'banner_master_65.png', 1648799023, 1),
(66, '2', 'test', 1, 'discount_upto', 46, 'test', 'banner_master_66.png', 1649836882, 1),
(67, '1', 'pizza1', 1, 'discount_upto', 47, '20%', 'banner_master_67.png', 1650348975, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bestof`
--

CREATE TABLE `bestof` (
  `bestof_id` int(11) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `date` int(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bestof`
--

INSERT INTO `bestof` (`bestof_id`, `categoryid`, `date`) VALUES
(6, 61, 1614846161);

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL,
  `user_id` int(12) NOT NULL,
  `provider_id` int(12) NOT NULL,
  `detail` longtext NOT NULL,
  `phone` varchar(40) NOT NULL,
  `date` int(30) NOT NULL,
  `status` varchar(30) NOT NULL,
  `bookid` varchar(20) NOT NULL,
  `statusmanage` longtext,
  `totalamount` varchar(11) DEFAULT NULL,
  `commission_amount` varchar(11) DEFAULT NULL,
  `settlement_value` double NOT NULL DEFAULT '0',
  `commission_status` varchar(11) DEFAULT NULL,
  `payment` longtext,
  `transaction_id` varchar(15) DEFAULT NULL,
  `category_id` int(7) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`booking_id`, `user_id`, `provider_id`, `detail`, `phone`, `date`, `status`, `bookid`, `statusmanage`, `totalamount`, `commission_amount`, `settlement_value`, `commission_status`, `payment`, `transaction_id`, `category_id`) VALUES
(190, 244, 65, '[{\"userid\":\"244\",\"providerId\":\"65\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":78.19519277662,\"latitude\":11.667743740354,\"time\":\"All STANDARD TIME\",\"date\":\"2022-01-11\",\"address\":\"222, 4th Cross Rd, S.K Twp, Thathampatty, Salem, Tamil Nadu 636014, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"200\",\"bookingTime\":1641885511770,\"subcategoryImg\":\"http:\\/\\/192.168.1.6\\/multigrocerystore\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"vasanth\",\"providerMobile\":\"6380217994\",\"providerImage\":\"http:\\/\\/192.168.1.6\\/multigrocerystore\\/uploads\\/provider_image\\/provider_65.jpg\",\"status\":\"pending\",\"username\":\"Promake notification\",\"bookId\":\"U244D1641885511770\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":null,\"popStatus\":false}]', '6380217994', 1641885508, 'pending', 'U244D1641885511770', '[{\"status\":\"pending\",\"time\":1641885508}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(191, 236, 65, '[{\"userid\":\"236\",\"providerId\":\"65\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":78.167841956019,\"latitude\":11.219384788818,\"time\":\"All STANDARD TIME\",\"date\":\"2022-01-12\",\"address\":\"Clock Tower, SH 94, Kamaraj Nagar, Namakkal, Tamil Nadu 637001, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"200\",\"bookingTime\":1641986943650,\"subcategoryImg\":\"http:\\/\\/192.168.74.236\\/multigrocerystore\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"vasanth\",\"providerMobile\":\"6380217994\",\"providerImage\":\"http:\\/\\/192.168.74.236\\/multigrocerystore\\/uploads\\/provider_image\\/provider_65.jpg\",\"status\":\"pending\",\"username\":\"Promake notification\",\"bookId\":\"U236D1641986943650\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":null,\"popStatus\":false}]', '6380217994', 1641986942, 'pending', 'U236D1641986943650', '[{\"status\":\"pending\",\"time\":1641986942}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(192, 236, 65, '[{\"userid\":\"236\",\"providerId\":\"65\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":78.195200487971,\"latitude\":11.667746695488,\"time\":\"All STANDARD TIME\",\"date\":\"2022-01-12\",\"address\":\"222, 4th Cross Rd, S.K Twp, Thathampatty, Salem, Tamil Nadu 636014, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"200\",\"bookingTime\":1641987805350,\"subcategoryImg\":\"http:\\/\\/192.168.74.236\\/multigrocerystore\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"vasanth\",\"providerMobile\":\"6380217994\",\"providerImage\":\"http:\\/\\/192.168.74.236\\/multigrocerystore\\/uploads\\/provider_image\\/provider_65.jpg\",\"status\":\"pending\",\"username\":\"Promake notification\",\"bookId\":\"U236D1641987805350\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":null,\"popStatus\":false}]', '6380217994', 1641987804, 'pending', 'U236D1641987805350', '[{\"status\":\"pending\",\"time\":1641987804}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(193, 236, 65, '[{\"userid\":\"236\",\"providerId\":\"65\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":78.195200487971,\"latitude\":11.667746695488,\"time\":\"All STANDARD TIME\",\"date\":\"2022-01-12\",\"address\":\"222, 4th Cross Rd, S.K Twp, Thathampatty, Salem, Tamil Nadu 636014, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"200\",\"bookingTime\":1641987806975,\"subcategoryImg\":\"http:\\/\\/192.168.74.236\\/multigrocerystore\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"vasanth\",\"providerMobile\":\"6380217994\",\"providerImage\":\"http:\\/\\/192.168.74.236\\/multigrocerystore\\/uploads\\/provider_image\\/provider_65.jpg\",\"status\":\"pending\",\"username\":\"Promake notification\",\"bookId\":\"U236D1641987806975\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":null,\"popStatus\":false}]', '6380217994', 1641987806, 'pending', 'U236D1641987806975', '[{\"status\":\"pending\",\"time\":1641987806}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(194, 236, 65, '[{\"userid\":\"236\",\"providerId\":\"65\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":78.195200487971,\"latitude\":11.667746695488,\"time\":\"All STANDARD TIME\",\"date\":\"2022-01-12\",\"address\":\"222, 4th Cross Rd, S.K Twp, Thathampatty, Salem, Tamil Nadu 636014, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"200\",\"bookingTime\":1641988191369,\"subcategoryImg\":\"http:\\/\\/192.168.74.236\\/multigrocerystore\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"vasanth\",\"providerMobile\":\"6380217994\",\"providerImage\":\"http:\\/\\/192.168.74.236\\/multigrocerystore\\/uploads\\/provider_image\\/provider_65.jpg\",\"status\":\"pending\",\"username\":\"Promake notification\",\"bookId\":\"U236D1641988191369\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":null,\"popStatus\":false}]', '6380217994', 1641988190, 'pending', 'U236D1641988191369', '[{\"status\":\"pending\",\"time\":1641988190}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(195, 245, 65, '[{\"userid\":\"245\",\"providerId\":\"65\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":78.195053301752,\"latitude\":11.667796604418,\"time\":\"All STANDARD TIME\",\"date\":\"2022-01-15\",\"address\":\"222, 4th Cross Rd, S.K Twp, Thathampatty, Salem, Tamil Nadu 636014, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"200\",\"bookingTime\":1642239240123,\"subcategoryImg\":\"http:\\/\\/192.168.1.5\\/multigrocerystore\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"vasanth\",\"providerMobile\":\"6380217994\",\"providerImage\":\"http:\\/\\/192.168.1.5\\/multigrocerystore\\/uploads\\/provider_image\\/provider_65.jpg\",\"status\":\"pending\",\"username\":\"paramasiva Balaji\",\"bookId\":\"U245D1642239240123\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":null,\"popStatus\":false}]', '6380217994', 1642239234, 'pending', 'U245D1642239240123', '[{\"status\":\"pending\",\"time\":1642239234}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(196, 245, 65, '[{\"userid\":\"245\",\"providerId\":\"65\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":78.195053301752,\"latitude\":11.667796604418,\"time\":\"All STANDARD TIME\",\"date\":\"2022-01-15\",\"address\":\"222, 4th Cross Rd, S.K Twp, Thathampatty, Salem, Tamil Nadu 636014, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"200\",\"bookingTime\":1642239241365,\"subcategoryImg\":\"http:\\/\\/192.168.1.5\\/multigrocerystore\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"vasanth\",\"providerMobile\":\"6380217994\",\"providerImage\":\"http:\\/\\/192.168.1.5\\/multigrocerystore\\/uploads\\/provider_image\\/provider_65.jpg\",\"status\":\"pending\",\"username\":\"paramasiva Balaji\",\"bookId\":\"U245D1642239241365\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":null,\"popStatus\":false}]', '6380217994', 1642239235, 'pending', 'U245D1642239241365', '[{\"status\":\"pending\",\"time\":1642239235}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(197, 245, 65, '[{\"userid\":\"245\",\"providerId\":\"65\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":78.195053301752,\"latitude\":11.667796604418,\"time\":\"All STANDARD TIME\",\"date\":\"2022-01-15\",\"address\":\"222, 4th Cross Rd, S.K Twp, Thathampatty, Salem, Tamil Nadu 636014, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"200\",\"bookingTime\":1642239281303,\"subcategoryImg\":\"http:\\/\\/192.168.1.5\\/multigrocerystore\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"vasanth\",\"providerMobile\":\"6380217994\",\"providerImage\":\"http:\\/\\/192.168.1.5\\/multigrocerystore\\/uploads\\/provider_image\\/provider_65.jpg\",\"status\":\"pending\",\"username\":\"paramasiva Balaji\",\"bookId\":\"U245D1642239281303\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":null,\"popStatus\":false}]', '6380217994', 1642239275, 'pending', 'U245D1642239281303', '[{\"status\":\"pending\",\"time\":1642239275}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(198, 245, 65, '[{\"userid\":\"245\",\"providerId\":\"65\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":78.195053301752,\"latitude\":11.667796604418,\"time\":\"All STANDARD TIME\",\"date\":\"2022-01-15\",\"address\":\"222, 4th Cross Rd, S.K Twp, Thathampatty, Salem, Tamil Nadu 636014, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"200\",\"bookingTime\":1642239282455,\"subcategoryImg\":\"http:\\/\\/192.168.1.5\\/multigrocerystore\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"vasanth\",\"providerMobile\":\"6380217994\",\"providerImage\":\"http:\\/\\/192.168.1.5\\/multigrocerystore\\/uploads\\/provider_image\\/provider_65.jpg\",\"status\":\"pending\",\"username\":\"paramasiva Balaji\",\"bookId\":\"U245D1642239282455\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":null,\"popStatus\":false}]', '6380217994', 1642239277, 'pending', 'U245D1642239282455', '[{\"status\":\"pending\",\"time\":1642239277}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(199, 245, 65, '[{\"userid\":\"245\",\"providerId\":\"65\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":78.195053301752,\"latitude\":11.667796604418,\"time\":\"STD TIME 2.00 PM TO 4.00PM\",\"date\":\"2022-01-15\",\"address\":\"222, 4th Cross Rd, S.K Twp, Thathampatty, Salem, Tamil Nadu 636014, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"200\",\"bookingTime\":1642239351110,\"subcategoryImg\":\"http:\\/\\/192.168.1.5\\/multigrocerystore\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"vasanth\",\"providerMobile\":\"6380217994\",\"providerImage\":\"http:\\/\\/192.168.1.5\\/multigrocerystore\\/uploads\\/provider_image\\/provider_65.jpg\",\"status\":\"pending\",\"username\":\"paramasiva Balaji\",\"bookId\":\"U245D1642239351110\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":null,\"popStatus\":false}]', '6380217994', 1642239345, 'pending', 'U245D1642239351110', '[{\"status\":\"pending\",\"time\":1642239345}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(200, 246, 65, '[{\"userid\":\"246\",\"providerId\":\"65\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":78.195039890707,\"latitude\":11.66775194906,\"time\":\"All STANDARD TIME\",\"date\":\"2022-01-15\",\"address\":\"222, 4th Cross Rd, S.K Twp, Thathampatty, Salem, Tamil Nadu 636014, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"200\",\"bookingTime\":1642239919025,\"subcategoryImg\":\"http:\\/\\/192.168.1.5\\/multigrocerystore\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"vasanth\",\"providerMobile\":\"6380217994\",\"providerImage\":\"http:\\/\\/192.168.1.5\\/multigrocerystore\\/uploads\\/provider_image\\/provider_65.jpg\",\"status\":\"pending\",\"username\":\"optima protech\",\"bookId\":\"U246D1642239919025\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":null,\"popStatus\":false}]', '6380217994', 1642239913, 'jobCompleted', 'U246D1642239919025', '[{\"status\":\"pending\",\"time\":1642239913},{\"status\":\"accepted\",\"time\":1645681286747,\"bookId\":\"U246D1642239919025\"},{\"status\":\"ontheway\",\"time\":1645682486154,\"bookId\":\"U246D1642239919025\"},{\"status\":\"processing\",\"time\":1645682831580,\"bookId\":\"U246D1642239919025\"},{\"status\":\"jobCompleted\",\"time\":1645683162014,\"bookId\":\"U246D1642239919025\"}]', '18.32', '1.67', 16.65, 'due', '[{\"providerName\":\"vasanth\",\"providerId\":\"65\",\"billingName\":\"optima protech\",\"bookingId\":\"U246D1642239919025\",\"date\":\"Jan 15, 2022\",\"workedHours\":\"00Hrs:05Min\",\"time\":\"All STANDARD TIME\",\"paymentType\":null,\"paymentStatus\":\"paymentPending\",\"chargeperhrs\":200,\"discount\":0,\"total\":16.65,\"grandTotal\":18.32,\"commission\":10,\"tax\":10,\"miscellaneous\":[],\"miscellaneousAmount\":0,\"totalMin\":5,\"taxAmount\":1.67,\"commissionAmount\":1.67}]', NULL, 20),
(201, 251, 67, '[{\"userid\":\"251\",\"providerId\":\"67\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":78.195189759135,\"latitude\":11.667734546603,\"time\":\"All STANDARD TIME\",\"date\":\"2022-03-05\",\"address\":\"222, 4th Cross Rd, S.K Twp, Thathampatty, Salem, Tamil Nadu 636014, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"595\",\"bookingTime\":1646385508387,\"subcategoryImg\":\"http:\\/\\/192.168.1.4\\/multigrocerystore\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"hdhd\",\"providerMobile\":\"123\",\"providerImage\":\"http:\\/\\/192.168.1.4\\/multigrocerystore\\/uploads\\/provider_image\\/provider_67.jpg\",\"status\":\"pending\",\"username\":\"paramasiva Balaji\",\"bookId\":\"U251D1646385508387\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"73987668998\",\"popStatus\":false}]', '123', 1646385477, 'rejected', 'U251D1646385508387', '[{\"status\":\"pending\",\"time\":1646385477},{\"status\":\"rejected\",\"time\":1646385537924,\"bookId\":\"U251D1646385508387\"}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(202, 251, 67, '[{\"userid\":\"251\",\"providerId\":\"67\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":78.342291153967,\"latitude\":12.746113061703,\"time\":\"STD TIME 2.00 PM TO 4.00PM\",\"date\":\"2022-03-04\",\"address\":\"28, Kuppam, Andhra Pradesh 517425, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"595\",\"bookingTime\":1646386101194,\"subcategoryImg\":\"http:\\/\\/192.168.1.4\\/multigrocerystore\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"hdhd\",\"providerMobile\":\"123\",\"providerImage\":\"http:\\/\\/192.168.1.4\\/multigrocerystore\\/uploads\\/provider_image\\/provider_67.jpg\",\"status\":\"pending\",\"username\":\"paramasiva Balaji\",\"bookId\":\"U251D1646386101194\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"73987668998\",\"popStatus\":false}]', '123', 1646386070, 'Success', 'U251D1646386101194', '[{\"status\":\"pending\",\"time\":1646386070},{\"status\":\"accepted\",\"time\":1646386120435,\"bookId\":\"U251D1646386101194\"},{\"status\":\"ontheway\",\"time\":1646386140512,\"bookId\":\"U251D1646386101194\"},{\"status\":\"processing\",\"time\":1646386146323,\"bookId\":\"U251D1646386101194\"},{\"status\":\"jobCompleted\",\"time\":1646386150295,\"bookId\":\"U251D1646386101194\"},{\"status\":\"Success\",\"time\":1646386165030,\"bookId\":\"U251D1646386101194\"}]', '0', '0', 0, 'due', '[{\"providerName\":\"hdhd\",\"providerId\":\"67\",\"billingName\":\"paramasiva Balaji\",\"bookingId\":\"U251D1646386101194\",\"date\":\"Mar 4, 2022\",\"workedHours\":\"00Hrs:00Min\",\"time\":\"STD TIME 2.00 PM TO 4.00PM\",\"paymentType\":null,\"paymentStatus\":\"paymentPending\",\"chargeperhrs\":595,\"discount\":0,\"total\":0,\"grandTotal\":0,\"commission\":10,\"tax\":10,\"miscellaneous\":[],\"miscellaneousAmount\":0,\"totalMin\":0,\"taxAmount\":0,\"commissionAmount\":0}]', NULL, 20),
(203, 251, 67, '[{\"userid\":\"251\",\"providerId\":\"67\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":78.195189759135,\"latitude\":11.667734546603,\"time\":\"STD TIME 2.00 PM TO 4.00PM\",\"date\":\"2022-03-04\",\"address\":\"222, 4th Cross Rd, S.K Twp, Thathampatty, Salem, Tamil Nadu 636014, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"595\",\"bookingTime\":1646386459814,\"subcategoryImg\":\"http:\\/\\/192.168.1.4\\/multigrocerystore\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"hdhd\",\"providerMobile\":\"123\",\"providerImage\":\"http:\\/\\/192.168.1.4\\/multigrocerystore\\/uploads\\/provider_image\\/provider_67.jpg\",\"status\":\"pending\",\"username\":\"paramasiva Balaji\",\"bookId\":\"U251D1646386459814\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"73987668998\",\"popStatus\":false}]', '123', 1646386428, 'accepted', 'U251D1646386459814', '[{\"status\":\"pending\",\"time\":1646386428},{\"status\":\"accepted\",\"time\":1646386492683,\"bookId\":\"U251D1646386459814\"}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(204, 251, 67, '[{\"userid\":\"251\",\"providerId\":\"67\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":78.195189759135,\"latitude\":11.667734546603,\"time\":\"STD TIME 2.00 PM TO 4.00PM\",\"date\":\"2022-03-04\",\"address\":\"222, 4th Cross Rd, S.K Twp, Thathampatty, Salem, Tamil Nadu 636014, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"595\",\"bookingTime\":1646387921329,\"subcategoryImg\":\"http:\\/\\/192.168.1.4\\/multigrocerystore\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"hdhd\",\"providerMobile\":\"123\",\"providerImage\":\"http:\\/\\/192.168.1.4\\/multigrocerystore\\/uploads\\/provider_image\\/provider_67.jpg\",\"status\":\"pending\",\"username\":\"paramasiva Balaji\",\"bookId\":\"U251D1646387921329\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"73987668998\",\"popStatus\":false}]', '123', 1646387890, 'rejected', 'U251D1646387921329', '[{\"status\":\"pending\",\"time\":1646387890},{\"status\":\"rejected\",\"time\":1646389269899,\"bookId\":\"U251D1646387921329\"},{\"status\":\"rejected\",\"time\":1646389270695,\"bookId\":\"U251D1646387921329\"}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(205, 251, 67, '[{\"userid\":\"251\",\"providerId\":\"67\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":78.195189759135,\"latitude\":11.667734546603,\"time\":\"STD TIME 2.00 PM TO 4.00PM\",\"date\":\"2022-03-04\",\"address\":\"222, 4th Cross Rd, S.K Twp, Thathampatty, Salem, Tamil Nadu 636014, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"595\",\"bookingTime\":1646387923055,\"subcategoryImg\":\"http:\\/\\/192.168.1.4\\/multigrocerystore\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"hdhd\",\"providerMobile\":\"123\",\"providerImage\":\"http:\\/\\/192.168.1.4\\/multigrocerystore\\/uploads\\/provider_image\\/provider_67.jpg\",\"status\":\"pending\",\"username\":\"paramasiva Balaji\",\"bookId\":\"U251D1646387923055\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"73987668998\",\"popStatus\":false}]', '123', 1646387891, 'rejected', 'U251D1646387923055', '[{\"status\":\"pending\",\"time\":1646387891},{\"status\":\"rejected\",\"time\":1646389268709,\"bookId\":\"U251D1646387923055\"}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(206, 251, 67, '[{\"userid\":\"251\",\"providerId\":\"67\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":78.195189759135,\"latitude\":11.667734546603,\"time\":\"STD TIME 2.00 PM TO 4.00PM\",\"date\":\"2022-03-04\",\"address\":\"222, 4th Cross Rd, S.K Twp, Thathampatty, Salem, Tamil Nadu 636014, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"595\",\"bookingTime\":1646389634525,\"subcategoryImg\":\"http:\\/\\/192.168.1.4\\/multigrocerystore\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"hdhd\",\"providerMobile\":\"123\",\"providerImage\":\"http:\\/\\/192.168.1.4\\/multigrocerystore\\/uploads\\/provider_image\\/provider_67.jpg\",\"status\":\"pending\",\"username\":\"paramasiva Balaji\",\"bookId\":\"U251D1646389634525\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"73987668998\",\"popStatus\":false}]', '123', 1646389603, 'Success', 'U251D1646389634525', '[{\"status\":\"pending\",\"time\":1646389603},{\"status\":\"accepted\",\"time\":1646390006937,\"bookId\":\"U251D1646389634525\"},{\"status\":\"ontheway\",\"time\":1646390008660,\"bookId\":\"U251D1646389634525\"},{\"status\":\"processing\",\"time\":1646390318730,\"bookId\":\"U251D1646389634525\"},{\"status\":\"jobCompleted\",\"time\":1646390376221,\"bookId\":\"U251D1646389634525\"},{\"status\":\"Success\",\"time\":1646390827184,\"bookId\":\"U251D1646389634525\"},{\"status\":\"Success\",\"time\":1646390828343,\"bookId\":\"U251D1646389634525\"},{\"status\":\"Success\",\"time\":1646390831794,\"bookId\":\"U251D1646389634525\"}]', '10.91', '0.99', 9.92, 'due', '[{\"providerName\":\"hdhd\",\"providerId\":\"67\",\"billingName\":\"paramasiva Balaji\",\"bookingId\":\"U251D1646389634525\",\"date\":\"Mar 4, 2022\",\"workedHours\":\"00Hrs:01Min\",\"time\":\"STD TIME 2.00 PM TO 4.00PM\",\"paymentType\":null,\"paymentStatus\":\"paymentPending\",\"chargeperhrs\":595,\"discount\":0,\"total\":9.92,\"grandTotal\":10.91,\"commission\":10,\"tax\":10,\"miscellaneous\":[],\"miscellaneousAmount\":0,\"totalMin\":1,\"taxAmount\":0.99,\"commissionAmount\":0.99}]', NULL, 20),
(207, 276, 67, '[{\"userid\":\"276\",\"providerId\":\"67\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":78.1952496,\"latitude\":11.6676216,\"time\":\"All STANDARD TIME\",\"date\":\"2022-03-05\",\"address\":\"222, 4th Cross Rd, S.K Twp, Thathampatty, Salem, Tamil Nadu 636014, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"595\",\"bookingTime\":1646461347789,\"subcategoryImg\":\"http:\\/\\/192.168.1.4\\/multigrocerystore\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"hdhd\",\"providerMobile\":\"123\",\"providerImage\":\"http:\\/\\/192.168.1.4\\/multigrocerystore\\/uploads\\/provider_image\\/provider_67.jpg\",\"status\":\"pending\",\"username\":\"Promake notification\",\"bookId\":\"U276D1646461347789\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"88666\",\"popStatus\":false}]', '123', 1646461315, 'accepted', 'U276D1646461347789', '[{\"status\":\"pending\",\"time\":1646461315},{\"status\":\"accepted\",\"time\":1646466728116,\"bookId\":\"U276D1646461347789\"},{\"status\":\"accepted\",\"time\":1646466728623,\"bookId\":\"U276D1646461347789\"}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(208, 276, 67, '[{\"userid\":\"276\",\"providerId\":\"67\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":78.1952496,\"latitude\":11.6676216,\"time\":\"All STANDARD TIME\",\"date\":\"2022-03-05\",\"address\":\"222, 4th Cross Rd, S.K Twp, Thathampatty, Salem, Tamil Nadu 636014, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"595\",\"bookingTime\":1646461349657,\"subcategoryImg\":\"http:\\/\\/192.168.1.4\\/multigrocerystore\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"hdhd\",\"providerMobile\":\"123\",\"providerImage\":\"http:\\/\\/192.168.1.4\\/multigrocerystore\\/uploads\\/provider_image\\/provider_67.jpg\",\"status\":\"pending\",\"username\":\"Promake notification\",\"bookId\":\"U276D1646461349657\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"88666\",\"popStatus\":false}]', '123', 1646461317, 'accepted', 'U276D1646461349657', '[{\"status\":\"pending\",\"time\":1646461317},{\"status\":\"accepted\",\"time\":1646466726344,\"bookId\":\"U276D1646461349657\"}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(209, 251, 67, '[{\"userid\":\"251\",\"providerId\":\"67\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":78.342291153967,\"latitude\":12.746113061703,\"time\":\"STD TIME 2.00 PM TO 4.00PM\",\"date\":\"2022-03-05\",\"address\":\"28, Kuppam, Andhra Pradesh 517425, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"595\",\"bookingTime\":1646473099525,\"subcategoryImg\":\"http:\\/\\/192.168.1.4\\/multigrocerystore\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"hdhd\",\"providerMobile\":\"123\",\"providerImage\":\"http:\\/\\/192.168.1.4\\/multigrocerystore\\/uploads\\/provider_image\\/provider_67.jpg\",\"status\":\"pending\",\"username\":\"paramasiva Balaji\",\"bookId\":\"U251D1646473099525\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"73987668998\",\"popStatus\":false}]', '123', 1646473067, 'Success', 'U251D1646473099525', '[{\"status\":\"pending\",\"time\":1646473067},{\"status\":\"accepted\",\"time\":1646486421068,\"bookId\":\"U251D1646473099525\"},{\"status\":\"ontheway\",\"time\":1646487263111,\"bookId\":\"U251D1646473099525\"},{\"status\":\"processing\",\"time\":1646487277386,\"bookId\":\"U251D1646473099525\"},{\"status\":\"jobCompleted\",\"time\":1646487422346,\"bookId\":\"U251D1646473099525\"},{\"status\":\"Success\",\"time\":1646488587231,\"bookId\":\"U251D1646473099525\"},{\"status\":\"Success\",\"time\":1646543559834,\"bookId\":\"U251D1646473099525\"},{\"status\":\"Success\",\"time\":1646543560793,\"bookId\":\"U251D1646473099525\"}]', '0', '0', 0, 'due', '[{\"providerName\":\"hdhd\",\"providerId\":\"67\",\"billingName\":\"paramasiva Balaji\",\"bookingId\":\"U251D1646473099525\",\"date\":\"Mar 5, 2022\",\"workedHours\":\"00Hrs:00Min\",\"time\":\"STD TIME 2.00 PM TO 4.00PM\",\"paymentType\":null,\"paymentStatus\":\"paymentPending\",\"chargeperhrs\":595,\"discount\":0,\"total\":0,\"grandTotal\":0,\"commission\":10,\"tax\":10,\"miscellaneous\":[],\"miscellaneousAmount\":0,\"totalMin\":0,\"taxAmount\":0,\"commissionAmount\":0}]', NULL, 20),
(210, 251, 67, '[{\"userid\":\"251\",\"providerId\":\"67\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":78.195189759135,\"latitude\":11.667734546603,\"time\":\"All STANDARD TIME\",\"date\":\"2022-03-05\",\"address\":\"222, 4th Cross Rd, S.K Twp, Thathampatty, Salem, Tamil Nadu 636014, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"595\",\"bookingTime\":1646499387589,\"subcategoryImg\":\"http:\\/\\/192.168.1.4\\/multigrocerystore\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"hdhd\",\"providerMobile\":\"123\",\"providerImage\":\"http:\\/\\/192.168.1.4\\/multigrocerystore\\/uploads\\/provider_image\\/provider_67.jpg\",\"status\":\"pending\",\"username\":\"paramasiva Balaji\",\"bookId\":\"U251D1646499387589\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"73987668998\",\"popStatus\":false}]', '123', 1646499353, 'Success', 'U251D1646499387589', '[{\"status\":\"pending\",\"time\":1646499353},{\"status\":\"accepted\",\"time\":1646540156372,\"bookId\":\"U251D1646499387589\"},{\"status\":\"ontheway\",\"time\":1646540178064,\"bookId\":\"U251D1646499387589\"},{\"status\":\"processing\",\"time\":1646540248963,\"bookId\":\"U251D1646499387589\"},{\"status\":\"jobCompleted\",\"time\":1646540280383,\"bookId\":\"U251D1646499387589\"},{\"status\":\"Success\",\"time\":1646542195002,\"bookId\":\"U251D1646499387589\"},{\"status\":\"Success\",\"time\":1646542196472,\"bookId\":\"U251D1646499387589\"},{\"status\":\"Success\",\"time\":1646542197950,\"bookId\":\"U251D1646499387589\"}]', '10', '0', 10, 'due', '[{\"providerName\":\"hdhd\",\"providerId\":\"67\",\"billingName\":\"paramasiva Balaji\",\"bookingId\":\"U251D1646499387589\",\"date\":\"Mar 5, 2022\",\"workedHours\":\"00Hrs:00Min\",\"time\":\"All STANDARD TIME\",\"paymentType\":null,\"paymentStatus\":\"paymentPending\",\"chargeperhrs\":595,\"discount\":0,\"total\":0,\"grandTotal\":10,\"commission\":10,\"tax\":10,\"miscellaneous\":[{\"name\":\"ft\",\"price\":10}],\"miscellaneousAmount\":10,\"totalMin\":0,\"taxAmount\":0,\"commissionAmount\":0}]', NULL, 20),
(211, 251, 67, '[{\"userid\":\"251\",\"providerId\":\"67\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":78.342291153967,\"latitude\":12.746113061703,\"time\":\"STD TIME 10.00 AM TO 12.00PM\",\"date\":\"2022-03-06\",\"address\":\"28, Kuppam, Andhra Pradesh 517425, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"595\",\"bookingTime\":1646543443470,\"subcategoryImg\":\"http:\\/\\/192.168.1.4\\/multigrocerystore\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"hdhd\",\"providerMobile\":\"123\",\"providerImage\":\"http:\\/\\/192.168.1.4\\/multigrocerystore\\/uploads\\/provider_image\\/provider_67.jpg\",\"status\":\"pending\",\"username\":\"paramasiva Balaji\",\"bookId\":\"U251D1646543443470\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"73987668998\",\"popStatus\":false}]', '123', 1646543408, 'Success', 'U251D1646543443470', '[{\"status\":\"pending\",\"time\":1646543408},{\"status\":\"accepted\",\"time\":1646543549459,\"bookId\":\"U251D1646543443470\"},{\"status\":\"ontheway\",\"time\":1646543563639,\"bookId\":\"U251D1646543443470\"},{\"status\":\"processing\",\"time\":1646543566517,\"bookId\":\"U251D1646543443470\"},{\"status\":\"jobCompleted\",\"time\":1646543582525,\"bookId\":\"U251D1646543443470\"},{\"status\":\"Success\",\"time\":1646543596323,\"bookId\":\"U251D1646543443470\"}]', '0', '0', 0, 'due', '[{\"providerName\":\"hdhd\",\"providerId\":\"67\",\"billingName\":\"paramasiva Balaji\",\"bookingId\":\"U251D1646543443470\",\"date\":\"Mar 6, 2022\",\"workedHours\":\"00Hrs:00Min\",\"time\":\"STD TIME 10.00 AM TO 12.00PM\",\"paymentType\":null,\"paymentStatus\":\"paymentPending\",\"chargeperhrs\":595,\"discount\":0,\"total\":0,\"grandTotal\":0,\"commission\":10,\"tax\":10,\"miscellaneous\":[],\"miscellaneousAmount\":0,\"totalMin\":0,\"taxAmount\":0,\"commissionAmount\":0}]', NULL, 20),
(212, 251, 67, '[{\"userid\":\"251\",\"providerId\":\"67\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":78.342291153967,\"latitude\":12.746113061703,\"time\":\"STD TIME 10.00 AM TO 12.00PM\",\"date\":\"2022-03-06\",\"address\":\"28, Kuppam, Andhra Pradesh 517425, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"595\",\"bookingTime\":1646546908330,\"subcategoryImg\":\"http:\\/\\/192.168.1.4\\/multigrocerystore\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"hdhd\",\"providerMobile\":\"123\",\"providerImage\":\"http:\\/\\/192.168.1.4\\/multigrocerystore\\/uploads\\/provider_image\\/provider_67.jpg\",\"status\":\"pending\",\"username\":\"paramasiva Balaji\",\"bookId\":\"U251D1646546908330\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"73987668998\",\"popStatus\":false}]', '123', 1646546873, 'Success', 'U251D1646546908330', '[{\"status\":\"pending\",\"time\":1646546873},{\"status\":\"accepted\",\"time\":1646547011475,\"bookId\":\"U251D1646546908330\"},{\"status\":\"ontheway\",\"time\":1646547239527,\"bookId\":\"U251D1646546908330\"},{\"status\":\"processing\",\"time\":1646547248868,\"bookId\":\"U251D1646546908330\"},{\"status\":\"jobCompleted\",\"time\":1646547251989,\"bookId\":\"U251D1646546908330\"},{\"status\":\"Success\",\"time\":1646547736310,\"bookId\":\"U251D1646546908330\"}]', '0', '0', 0, 'due', '[{\"providerName\":\"hdhd\",\"providerId\":\"67\",\"billingName\":\"paramasiva Balaji\",\"bookingId\":\"U251D1646546908330\",\"date\":\"Mar 6, 2022\",\"workedHours\":\"00Hrs:00Min\",\"time\":\"STD TIME 10.00 AM TO 12.00PM\",\"paymentType\":null,\"paymentStatus\":\"paymentPending\",\"chargeperhrs\":595,\"discount\":0,\"total\":0,\"grandTotal\":0,\"commission\":10,\"tax\":10,\"miscellaneous\":[],\"miscellaneousAmount\":0,\"totalMin\":0,\"taxAmount\":0,\"commissionAmount\":0}]', NULL, 20),
(213, 251, 67, '[{\"userid\":\"251\",\"providerId\":\"67\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":78.342291153967,\"latitude\":12.746113061703,\"time\":\"STD TIME 12.00 PM TO 2.00PM\",\"date\":\"2022-03-06\",\"address\":\"28, Kuppam, Andhra Pradesh 517425, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"595\",\"bookingTime\":1646549733361,\"subcategoryImg\":\"http:\\/\\/192.168.1.4\\/multigrocerystore\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"hdhd\",\"providerMobile\":\"123\",\"providerImage\":\"http:\\/\\/192.168.1.4\\/multigrocerystore\\/uploads\\/provider_image\\/provider_67.jpg\",\"status\":\"pending\",\"username\":\"paramasiva Balaji\",\"bookId\":\"U251D1646549733361\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"73987668998\",\"popStatus\":false}]', '123', 1646549698, 'Success', 'U251D1646549733361', '[{\"status\":\"pending\",\"time\":1646549698},{\"status\":\"accepted\",\"time\":1646549770718,\"bookId\":\"U251D1646549733361\"},{\"status\":\"ontheway\",\"time\":1646549776641,\"bookId\":\"U251D1646549733361\"},{\"status\":\"processing\",\"time\":1646549779297,\"bookId\":\"U251D1646549733361\"},{\"status\":\"jobCompleted\",\"time\":1646549787546,\"bookId\":\"U251D1646549733361\"},{\"status\":\"Success\",\"time\":1646549813432,\"bookId\":\"U251D1646549733361\"}]', '0', '0', 0, 'due', '[{\"providerName\":\"hdhd\",\"providerId\":\"67\",\"billingName\":\"paramasiva Balaji\",\"bookingId\":\"U251D1646549733361\",\"date\":\"Mar 6, 2022\",\"workedHours\":\"00Hrs:00Min\",\"time\":\"STD TIME 12.00 PM TO 2.00PM\",\"paymentType\":null,\"paymentStatus\":\"paymentPending\",\"chargeperhrs\":595,\"discount\":0,\"total\":0,\"grandTotal\":0,\"commission\":10,\"tax\":10,\"miscellaneous\":[],\"miscellaneousAmount\":0,\"totalMin\":0,\"taxAmount\":0,\"commissionAmount\":0}]', NULL, 20),
(214, 251, 67, '[{\"userid\":\"251\",\"providerId\":\"67\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":78.342291153967,\"latitude\":12.746113061703,\"time\":\"STD TIME 12.00 PM TO 2.00PM\",\"date\":\"2022-03-06\",\"address\":\"28, Kuppam, Andhra Pradesh 517425, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"595\",\"bookingTime\":1646549852559,\"subcategoryImg\":\"http:\\/\\/192.168.1.4\\/multigrocerystore\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"hdhd\",\"providerMobile\":\"123\",\"providerImage\":\"http:\\/\\/192.168.1.4\\/multigrocerystore\\/uploads\\/provider_image\\/provider_67.jpg\",\"status\":\"pending\",\"username\":\"paramasiva Balaji\",\"bookId\":\"U251D1646549852559\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"73987668998\",\"popStatus\":false}]', '123', 1646549817, 'accepted', 'U251D1646549852559', '[{\"status\":\"pending\",\"time\":1646549817},{\"status\":\"accepted\",\"time\":1646549860832,\"bookId\":\"U251D1646549852559\"},{\"status\":\"accepted\",\"time\":1646549861652,\"bookId\":\"U251D1646549852559\"},{\"status\":\"accepted\",\"time\":1646549862563,\"bookId\":\"U251D1646549852559\"}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(215, 251, 67, '[{\"userid\":\"251\",\"providerId\":\"67\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":78.342291153967,\"latitude\":12.746113061703,\"time\":\"STD TIME 12.00 PM TO 2.00PM\",\"date\":\"2022-03-06\",\"address\":\"28, Kuppam, Andhra Pradesh 517425, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"595\",\"bookingTime\":1646549854431,\"subcategoryImg\":\"http:\\/\\/192.168.1.4\\/multigrocerystore\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"hdhd\",\"providerMobile\":\"123\",\"providerImage\":\"http:\\/\\/192.168.1.4\\/multigrocerystore\\/uploads\\/provider_image\\/provider_67.jpg\",\"status\":\"pending\",\"username\":\"paramasiva Balaji\",\"bookId\":\"U251D1646549854431\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"73987668998\",\"popStatus\":false}]', '123', 1646549819, 'accepted', 'U251D1646549854431', '[{\"status\":\"pending\",\"time\":1646549819},{\"status\":\"accepted\",\"time\":1646549860081,\"bookId\":\"U251D1646549854431\"}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(216, 251, 67, '[{\"userid\":\"251\",\"providerId\":\"67\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":78.342291153967,\"latitude\":12.746113061703,\"time\":\"All STANDARD TIME\",\"date\":\"2022-03-06\",\"address\":\"28, Kuppam, Andhra Pradesh 517425, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"595\",\"bookingTime\":1646549896372,\"subcategoryImg\":\"http:\\/\\/192.168.1.4\\/multigrocerystore\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"hdhd\",\"providerMobile\":\"123\",\"providerImage\":\"http:\\/\\/192.168.1.4\\/multigrocerystore\\/uploads\\/provider_image\\/provider_67.jpg\",\"status\":\"pending\",\"username\":\"paramasiva Balaji\",\"bookId\":\"U251D1646549896372\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"73987668998\",\"popStatus\":false}]', '123', 1646549861, 'rejected', 'U251D1646549896372', '[{\"status\":\"pending\",\"time\":1646549861},{\"status\":\"rejected\",\"time\":1646549908964,\"bookId\":\"U251D1646549896372\"},{\"status\":\"rejected\",\"time\":1646549909839,\"bookId\":\"U251D1646549896372\"},{\"status\":\"rejected\",\"time\":1646549911246,\"bookId\":\"U251D1646549896372\"}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(217, 251, 67, '[{\"userid\":\"251\",\"providerId\":\"67\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":78.342291153967,\"latitude\":12.746113061703,\"time\":\"All STANDARD TIME\",\"date\":\"2022-03-06\",\"address\":\"28, Kuppam, Andhra Pradesh 517425, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"595\",\"bookingTime\":1646549897299,\"subcategoryImg\":\"http:\\/\\/192.168.1.4\\/multigrocerystore\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"hdhd\",\"providerMobile\":\"123\",\"providerImage\":\"http:\\/\\/192.168.1.4\\/multigrocerystore\\/uploads\\/provider_image\\/provider_67.jpg\",\"status\":\"pending\",\"username\":\"paramasiva Balaji\",\"bookId\":\"U251D1646549897299\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"73987668998\",\"popStatus\":false}]', '123', 1646549862, 'accepted', 'U251D1646549897299', '[{\"status\":\"pending\",\"time\":1646549862},{\"status\":\"accepted\",\"time\":1646549907706,\"bookId\":\"U251D1646549897299\"}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(218, 251, 67, '[{\"userid\":\"251\",\"providerId\":\"67\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":78.342291153967,\"latitude\":12.746113061703,\"time\":\"STD TIME 12.00 PM TO 2.00PM\",\"date\":\"2022-03-06\",\"address\":\"28, Kuppam, Andhra Pradesh 517425, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"595\",\"bookingTime\":1646550295894,\"subcategoryImg\":\"http:\\/\\/192.168.1.4\\/multigrocerystore\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"hdhd\",\"providerMobile\":\"123\",\"providerImage\":\"http:\\/\\/192.168.1.4\\/multigrocerystore\\/uploads\\/provider_image\\/provider_67.jpg\",\"status\":\"pending\",\"username\":\"paramasiva Balaji\",\"bookId\":\"U251D1646550295894\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"73987668998\",\"popStatus\":false}]', '123', 1646550260, 'pending', 'U251D1646550295894', '[{\"status\":\"pending\",\"time\":1646550260}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(219, 251, 67, '[{\"userid\":\"251\",\"providerId\":\"67\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":78.342291153967,\"latitude\":12.746113061703,\"time\":\"All STANDARD TIME\",\"date\":\"2022-03-06\",\"address\":\"28, Kuppam, Andhra Pradesh 517425, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"595\",\"bookingTime\":1646550400235,\"subcategoryImg\":\"http:\\/\\/192.168.1.4\\/multigrocerystore\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"hdhd\",\"providerMobile\":\"123\",\"providerImage\":\"http:\\/\\/192.168.1.4\\/multigrocerystore\\/uploads\\/provider_image\\/provider_67.jpg\",\"status\":\"pending\",\"username\":\"paramasiva Balaji\",\"bookId\":\"U251D1646550400235\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"73987668998\",\"popStatus\":false}]', '123', 1646550365, 'pending', 'U251D1646550400235', '[{\"status\":\"pending\",\"time\":1646550365}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(220, 251, 67, '[{\"userid\":\"251\",\"providerId\":\"67\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":78.342291153967,\"latitude\":12.746113061703,\"time\":\"STD TIME 12.00 PM TO 2.00PM\",\"date\":\"2022-03-06\",\"address\":\"28, Kuppam, Andhra Pradesh 517425, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"595\",\"bookingTime\":1646550532249,\"subcategoryImg\":\"http:\\/\\/192.168.1.4\\/multigrocerystore\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"hdhd\",\"providerMobile\":\"123\",\"providerImage\":\"http:\\/\\/192.168.1.4\\/multigrocerystore\\/uploads\\/provider_image\\/provider_67.jpg\",\"status\":\"pending\",\"username\":\"paramasiva Balaji\",\"bookId\":\"U251D1646550532249\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"73987668998\",\"popStatus\":false}]', '123', 1646550497, 'rejected', 'U251D1646550532249', '[{\"status\":\"pending\",\"time\":1646550497},{\"status\":\"rejected\",\"time\":1646550737863,\"bookId\":\"U251D1646550532249\"},{\"status\":\"rejected\",\"time\":1646550739483,\"bookId\":\"U251D1646550532249\"}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(221, 251, 67, '[{\"userid\":\"251\",\"providerId\":\"67\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":78.342291153967,\"latitude\":12.746113061703,\"time\":\"STD TIME 12.00 PM TO 2.00PM\",\"date\":\"2022-03-06\",\"address\":\"28, Kuppam, Andhra Pradesh 517425, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"595\",\"bookingTime\":1646550790398,\"subcategoryImg\":\"http:\\/\\/192.168.1.4\\/multigrocerystore\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"hdhd\",\"providerMobile\":\"123\",\"providerImage\":\"http:\\/\\/192.168.1.4\\/multigrocerystore\\/uploads\\/provider_image\\/provider_67.jpg\",\"status\":\"pending\",\"username\":\"paramasiva Balaji\",\"bookId\":\"U251D1646550790398\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"73987668998\",\"popStatus\":false}]', '123', 1646550755, 'Success', 'U251D1646550790398', '[{\"status\":\"pending\",\"time\":1646550755},{\"status\":\"accepted\",\"time\":1646550958001,\"bookId\":\"U251D1646550790398\"},{\"status\":\"ontheway\",\"time\":1646550972015,\"bookId\":\"U251D1646550790398\"},{\"status\":\"processing\",\"time\":1646550986992,\"bookId\":\"U251D1646550790398\"},{\"status\":\"jobCompleted\",\"time\":1646550994849,\"bookId\":\"U251D1646550790398\"},{\"status\":\"Success\",\"time\":1646551025056,\"bookId\":\"U251D1646550790398\"}]', '0', '0', 0, 'due', '[{\"providerName\":\"hdhd\",\"providerId\":\"67\",\"billingName\":\"paramasiva Balaji\",\"bookingId\":\"U251D1646550790398\",\"date\":\"Mar 6, 2022\",\"workedHours\":\"00Hrs:00Min\",\"time\":\"STD TIME 12.00 PM TO 2.00PM\",\"paymentType\":null,\"paymentStatus\":\"paymentPending\",\"chargeperhrs\":595,\"discount\":0,\"total\":0,\"grandTotal\":0,\"commission\":10,\"tax\":10,\"miscellaneous\":[],\"miscellaneousAmount\":0,\"totalMin\":0,\"taxAmount\":0,\"commissionAmount\":0}]', NULL, 20),
(222, 278, 66, '[{\"userid\":\"278\",\"providerId\":\"66\",\"categoryId\":\"7\",\"categoryName\":\"Womens care\",\"subcategoryId\":\"20\",\"subcategoryName\":\"Facial\",\"longitude\":78.3406178,\"latitude\":12.7469087,\"time\":\"All STANDARD TIME\",\"date\":\"2022-03-07\",\"address\":\"P8WR+Q69, RS Pet, Kuppam, Andhra Pradesh 517425, India\",\"description\":null,\"service\":\"Womens care\",\"chargeperhrs\":\"500\",\"bookingTime\":1646676229598,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_20.png\",\"providerName\":\"suji\",\"providerMobile\":\"6349769592\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_66.jpg\",\"status\":\"pending\",\"username\":\"\",\"bookId\":\"U278D1646676229598\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"+917906357738\",\"popStatus\":false}]', '6349769592', 1646676226, 'pending', 'U278D1646676229598', '[{\"status\":\"pending\",\"time\":1646676226}]', NULL, NULL, 0, NULL, NULL, NULL, 7),
(223, 276, 66, '[{\"userid\":\"276\",\"providerId\":\"66\",\"categoryId\":\"7\",\"categoryName\":\"Womens care\",\"subcategoryId\":\"20\",\"subcategoryName\":\"Facial\",\"longitude\":77.628249,\"latitude\":12.9043705,\"time\":\"All STANDARD TIME\",\"date\":\"2022-03-09\",\"address\":\"9C, 17\\/4C, Bommanahalli, Bengaluru, Karnataka 560068, India\",\"description\":null,\"service\":\"Womens care\",\"chargeperhrs\":\"500\",\"bookingTime\":1646680966864,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_20.png\",\"providerName\":\"suji\",\"providerMobile\":\"6349769592\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_66.jpg\",\"status\":\"pending\",\"username\":\"Rimorav Shorts\",\"bookId\":\"U276D1646680966864\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":null,\"popStatus\":false}]', '6349769592', 1646680969, 'pending', 'U276D1646680966864', '[{\"status\":\"pending\",\"time\":1646680969}]', NULL, NULL, 0, NULL, NULL, NULL, 7),
(224, 289, 67, '[{\"userid\":\"289\",\"providerId\":\"67\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":78.1917374,\"latitude\":11.6660321,\"time\":\"All STANDARD TIME\",\"date\":\"2022-03-09\",\"address\":\"Thathampatty, Salem, Tamil Nadu 636014, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"595\",\"bookingTime\":1646726735368,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"hdhd\",\"providerMobile\":\"123\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_67.jpg\",\"status\":\"pending\",\"username\":\"\",\"bookId\":\"U289D1646726735368\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"+917000338061\",\"popStatus\":false}]', '123', 1646726735, 'accepted', 'U289D1646726735368', '[{\"status\":\"pending\",\"time\":1646726735},{\"status\":\"accepted\",\"time\":1647007236763,\"bookId\":\"U289D1646726735368\"},{\"status\":\"accepted\",\"time\":1647007238183,\"bookId\":\"U289D1646726735368\"},{\"status\":\"accepted\",\"time\":1647007238696,\"bookId\":\"U289D1646726735368\"},{\"status\":\"accepted\",\"time\":1647007239373,\"bookId\":\"U289D1646726735368\"},{\"status\":\"accepted\",\"time\":1647007241248,\"bookId\":\"U289D1646726735368\"}]', NULL, NULL, 0, NULL, NULL, NULL, 20);
INSERT INTO `booking` (`booking_id`, `user_id`, `provider_id`, `detail`, `phone`, `date`, `status`, `bookid`, `statusmanage`, `totalamount`, `commission_amount`, `settlement_value`, `commission_status`, `payment`, `transaction_id`, `category_id`) VALUES
(225, 292, 67, '[{\"userid\":\"292\",\"providerId\":\"67\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":78.7743722,\"latitude\":10.0733476,\"time\":\"All STANDARD TIME\",\"date\":\"2022-03-10\",\"address\":\"28,church Street, New Town Rd, Sekkalai, Karaikudi, Tamil Nadu 630001, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"595\",\"bookingTime\":1646745561571,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"hdhd\",\"providerMobile\":\"123\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_67.jpg\",\"status\":\"pending\",\"username\":\"\",\"bookId\":\"U292D1646745561571\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"+917871452671\",\"popStatus\":false}]', '123', 1646745560, 'accepted', 'U292D1646745561571', '[{\"status\":\"pending\",\"time\":1646745560},{\"status\":\"accepted\",\"time\":1647007235953,\"bookId\":\"U292D1646745561571\"},{\"status\":\"accepted\",\"time\":1647007238514,\"bookId\":\"U292D1646745561571\"},{\"status\":\"accepted\",\"time\":1647007239203,\"bookId\":\"U292D1646745561571\"},{\"status\":\"accepted\",\"time\":1647007240606,\"bookId\":\"U292D1646745561571\"}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(226, 299, 67, '[{\"userid\":\"299\",\"providerId\":\"67\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":80.2432839,\"latitude\":13.0697174,\"time\":\"All STANDARD TIME\",\"date\":\"2022-03-08\",\"address\":\"Chennai Central, Tamil Nadu\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"595\",\"bookingTime\":1646759719918,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"hdhd\",\"providerMobile\":\"123\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_67.jpg\",\"status\":\"pending\",\"username\":\"\",\"bookId\":\"U299D1646759719918\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"+917772020869\",\"popStatus\":false}]', '123', 1646759721, 'accepted', 'U299D1646759719918', '[{\"status\":\"pending\",\"time\":1646759721},{\"status\":\"accepted\",\"time\":1647007234833,\"bookId\":\"U299D1646759719918\"},{\"status\":\"accepted\",\"time\":1647007239038,\"bookId\":\"U299D1646759719918\"},{\"status\":\"accepted\",\"time\":1647007239914,\"bookId\":\"U299D1646759719918\"}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(227, 299, 67, '[{\"userid\":\"299\",\"providerId\":\"67\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":80.2432839,\"latitude\":13.0697174,\"time\":\"STD TIME 10.00 PM TO 12.00PM\",\"date\":\"2022-03-09\",\"address\":\"Chennai Central, Tamil Nadu\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"595\",\"bookingTime\":1646828072324,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"hdhd\",\"providerMobile\":\"123\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_67.jpg\",\"status\":\"pending\",\"username\":\"\",\"bookId\":\"U299D1646828072324\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"+917772020869\",\"popStatus\":false}]', '123', 1646828073, 'accepted', 'U299D1646828072324', '[{\"status\":\"pending\",\"time\":1646828073},{\"status\":\"accepted\",\"time\":1647007233455,\"bookId\":\"U299D1646828072324\"},{\"status\":\"accepted\",\"time\":1647007239721,\"bookId\":\"U299D1646828072324\"}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(228, 309, 67, '[{\"userid\":\"309\",\"providerId\":\"67\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":76.7243968,\"latitude\":23.0167543,\"time\":\"All STANDARD TIME\",\"date\":\"2022-03-09\",\"address\":\"2P8F+PQ7, Ashta, Madhya Pradesh 466116, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"595\",\"bookingTime\":1646849498445,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"hdhd\",\"providerMobile\":\"123\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_67.jpg\",\"status\":\"pending\",\"username\":\"\",\"bookId\":\"U309D1646849498445\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"+917648940600\",\"popStatus\":false}]', '123', 1646849499, 'accepted', 'U309D1646849498445', '[{\"status\":\"pending\",\"time\":1646849499},{\"status\":\"accepted\",\"time\":1646996444558,\"bookId\":\"U309D1646849498445\"}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(229, 299, 67, '[{\"userid\":\"299\",\"providerId\":\"67\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":80.2432839,\"latitude\":13.0697174,\"time\":\"All STANDARD TIME\",\"date\":\"2022-03-11\",\"address\":\"Chennai Central, Tamil Nadu\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"595\",\"bookingTime\":1646898358120,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"hdhd\",\"providerMobile\":\"123\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_67.jpg\",\"status\":\"pending\",\"username\":\"\",\"bookId\":\"U299D1646898358120\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"+917772020869\",\"popStatus\":false}]', '123', 1646898359, 'jobCompleted', 'U299D1646898358120', '[{\"status\":\"pending\",\"time\":1646898359},{\"status\":\"accepted\",\"time\":1646999502264,\"bookId\":\"U299D1646898358120\"},{\"status\":\"ontheway\",\"time\":1646999503383,\"bookId\":\"U299D1646898358120\"},{\"status\":\"processing\",\"time\":1646999694286,\"bookId\":\"U299D1646898358120\"},{\"status\":\"jobCompleted\",\"time\":1647000202296,\"bookId\":\"U299D1646898358120\"}]', '0', '0', 0, 'due', '[{\"providerName\":\"hdhd\",\"providerId\":\"67\",\"billingName\":\"\",\"bookingId\":\"U299D1646898358120\",\"date\":\"Mar 10, 2022\",\"workedHours\":\"00Hrs:00Min\",\"time\":\"All STANDARD TIME\",\"paymentType\":null,\"paymentStatus\":\"paymentPending\",\"chargeperhrs\":595,\"discount\":0,\"total\":0,\"grandTotal\":0,\"commission\":10,\"tax\":10,\"miscellaneous\":[],\"miscellaneousAmount\":0,\"totalMin\":0,\"taxAmount\":0,\"commissionAmount\":0}]', NULL, 20),
(230, 308, 67, '[{\"userid\":\"308\",\"providerId\":\"67\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":80.6697765,\"latitude\":16.5067576,\"time\":\"All STANDARD TIME\",\"date\":\"2022-03-11\",\"address\":\"2\\/11, 1st Cross Rd, Subbarao Colony, Bharathi Nagar, Vijayawada, Andhra Pradesh 520008, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"595\",\"bookingTime\":1646910130524,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"hdhd\",\"providerMobile\":\"123\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_67.jpg\",\"status\":\"pending\",\"username\":\"SV Soft Solutions Pvt Ltd\",\"bookId\":\"U308D1646910130524\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":null,\"popStatus\":false}]', '123', 1646910130, 'accepted', 'U308D1646910130524', '[{\"status\":\"pending\",\"time\":1646910130},{\"status\":\"accepted\",\"time\":1647007230854,\"bookId\":\"U308D1646910130524\"}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(231, 255, 67, '[{\"userid\":\"255\",\"providerId\":\"67\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":78.342291153967,\"latitude\":12.746113061703,\"time\":\"All STANDARD TIME\",\"date\":\"2022-03-10\",\"address\":\"28, Kuppam, Andhra Pradesh 517425, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"595\",\"bookingTime\":1646916815499,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"hdhd\",\"providerMobile\":\"123\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_67.jpg\",\"status\":\"pending\",\"username\":\"\",\"bookId\":\"U255D1646916815499\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"+917397750111\",\"popStatus\":false}]', '123', 1646916818, 'accepted', 'U255D1646916815499', '[{\"status\":\"pending\",\"time\":1646916818},{\"status\":\"accepted\",\"time\":1647007237178,\"bookId\":\"U255D1646916815499\"},{\"status\":\"accepted\",\"time\":1647007237355,\"bookId\":\"U255D1646916815499\"},{\"status\":\"accepted\",\"time\":1647007238370,\"bookId\":\"U255D1646916815499\"},{\"status\":\"accepted\",\"time\":1647007238890,\"bookId\":\"U255D1646916815499\"},{\"status\":\"accepted\",\"time\":1647007239559,\"bookId\":\"U255D1646916815499\"},{\"status\":\"accepted\",\"time\":1647007241915,\"bookId\":\"U255D1646916815499\"}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(232, 332, 67, '[{\"userid\":\"332\",\"providerId\":\"67\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":73.250035411639,\"latitude\":17.743280604491,\"time\":\"All STANDARD TIME\",\"date\":\"2022-03-11\",\"address\":\"Parijat Agro Farm Rd, Maharashtra 415711, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"595\",\"bookingTime\":1646998796580,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"hdhd\",\"providerMobile\":\"123\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_67.jpg\",\"status\":\"pending\",\"username\":\"\",\"bookId\":\"U332D1646998796580\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"+918888317868\",\"popStatus\":false}]', '123', 1646998798, 'jobCompleted', 'U332D1646998796580', '[{\"status\":\"pending\",\"time\":1646998798},{\"status\":\"accepted\",\"time\":1646999379582,\"bookId\":\"U332D1646998796580\"},{\"status\":\"ontheway\",\"time\":1646999384854,\"bookId\":\"U332D1646998796580\"},{\"status\":\"processing\",\"time\":1646999413284,\"bookId\":\"U332D1646998796580\"},{\"status\":\"jobCompleted\",\"time\":1646999440001,\"bookId\":\"U332D1646998796580\"}]', '0', '0', 0, 'due', '[{\"providerName\":\"hdhd\",\"providerId\":\"67\",\"billingName\":\"\",\"bookingId\":\"U332D1646998796580\",\"date\":\"Mar 11, 2022\",\"workedHours\":\"00Hrs:00Min\",\"time\":\"All STANDARD TIME\",\"paymentType\":null,\"paymentStatus\":\"paymentPending\",\"chargeperhrs\":595,\"discount\":0,\"total\":0,\"grandTotal\":0,\"commission\":10,\"tax\":10,\"miscellaneous\":[],\"miscellaneousAmount\":0,\"totalMin\":0,\"taxAmount\":0,\"commissionAmount\":0}]', NULL, 20),
(233, 335, 67, '[{\"userid\":\"335\",\"providerId\":\"67\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":75.948189519476,\"latitude\":11.145235467304,\"time\":\"All STANDARD TIME\",\"date\":\"2022-03-11\",\"address\":\"4WWX+37F, Padinharathara, Karipur, Kerala 673647, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"595\",\"bookingTime\":1647007982109,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"hdhd\",\"providerMobile\":\"123\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_67.jpg\",\"status\":\"pending\",\"username\":\"\",\"bookId\":\"U335D1647007982109\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"+917591916458\",\"popStatus\":false}]', '123', 1647007975, 'pending', 'U335D1647007982109', '[{\"status\":\"pending\",\"time\":1647007975}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(234, 276, 67, '[{\"userid\":\"276\",\"providerId\":\"67\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":80.2707184,\"latitude\":13.0826802,\"time\":\"STD TIME 10.00 PM TO 12.00PM\",\"date\":\"2022-03-12\",\"address\":\"Chennai, Tamil Nadu, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"595\",\"bookingTime\":1647060546701,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"hdhd\",\"providerMobile\":\"123\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_67.jpg\",\"status\":\"pending\",\"username\":\"Rimorav Shorts\",\"bookId\":\"U276D1647060546701\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"669686699\",\"popStatus\":false}]', '123', 1647060548, 'pending', 'U276D1647060546701', '[{\"status\":\"pending\",\"time\":1647060548}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(235, 352, 67, '[{\"userid\":\"352\",\"providerId\":\"67\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":73.1137307,\"latitude\":19.1605125,\"time\":\"All STANDARD TIME\",\"date\":\"2022-03-14\",\"address\":\"5467+6F5, Antarli, Maharashtra 421204, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"595\",\"bookingTime\":1647112743721,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"hdhd\",\"providerMobile\":\"123\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_67.jpg\",\"status\":\"pending\",\"username\":\"Pio Mumbai\",\"bookId\":\"U352D1647112743721\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":null,\"popStatus\":false}]', '123', 1647112744, 'pending', 'U352D1647112743721', '[{\"status\":\"pending\",\"time\":1647112744}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(236, 352, 74, '[{\"userid\":\"352\",\"providerId\":\"74\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"25\",\"subcategoryName\":\"House\",\"longitude\":73.1137307,\"latitude\":19.1605125,\"time\":\"All STANDARD TIME\",\"date\":\"2022-03-13\",\"address\":\"5467+6F5, Antarli, Maharashtra 421204, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"50\",\"bookingTime\":1647112966507,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_25.png\",\"providerName\":\"dfgg\",\"providerMobile\":\"9987518019\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_74.jpg\",\"status\":\"pending\",\"username\":\"Pio Mumbai\",\"bookId\":\"U352D1647112966507\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":null,\"popStatus\":false}]', '9987518019', 1647112967, 'jobCompleted', 'U352D1647112966507', '[{\"status\":\"pending\",\"time\":1647112967},{\"status\":\"accepted\",\"time\":1647113000480,\"bookId\":\"U352D1647112966507\"},{\"status\":\"ontheway\",\"time\":1647113003208,\"bookId\":\"U352D1647112966507\"},{\"status\":\"processing\",\"time\":1647113200781,\"bookId\":\"U352D1647112966507\"},{\"status\":\"jobCompleted\",\"time\":1647113219501,\"bookId\":\"U352D1647112966507\"}]', '500', '0', 500, 'due', '[{\"providerName\":\"dfgg\",\"providerId\":\"74\",\"billingName\":\"Pio Mumbai\",\"bookingId\":\"U352D1647112966507\",\"date\":\"Mar 13, 2022\",\"workedHours\":\"00Hrs:00Min\",\"time\":\"All STANDARD TIME\",\"paymentType\":null,\"paymentStatus\":\"paymentPending\",\"chargeperhrs\":50,\"discount\":0,\"total\":0,\"grandTotal\":500,\"commission\":10,\"tax\":10,\"miscellaneous\":[{\"name\":\"fan\",\"price\":500}],\"miscellaneousAmount\":500,\"totalMin\":0,\"taxAmount\":0,\"commissionAmount\":0}]', NULL, 20),
(237, 354, 74, '[{\"userid\":\"354\",\"providerId\":\"74\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"25\",\"subcategoryName\":\"House\",\"longitude\":80.2707184,\"latitude\":13.0826802,\"time\":\"All STANDARD TIME\",\"date\":\"2022-03-13\",\"address\":\"Chennai, Tamil Nadu, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"50\",\"bookingTime\":1647115762503,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_25.png\",\"providerName\":\"dfgg\",\"providerMobile\":\"9987518019\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_74.jpg\",\"status\":\"pending\",\"username\":\"SHAUKAT Ali\",\"bookId\":\"U354D1647115762503\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":null,\"popStatus\":false}]', '9987518019', 1647115763, 'jobCompleted', 'U354D1647115762503', '[{\"status\":\"pending\",\"time\":1647115763},{\"status\":\"accepted\",\"time\":1647116150582,\"bookId\":\"U354D1647115762503\"},{\"status\":\"ontheway\",\"time\":1647116160896,\"bookId\":\"U354D1647115762503\"},{\"status\":\"processing\",\"time\":1647116209649,\"bookId\":\"U354D1647115762503\"},{\"status\":\"jobCompleted\",\"time\":1647116216605,\"bookId\":\"U354D1647115762503\"}]', '0', '0', 0, 'due', '[{\"providerName\":\"dfgg\",\"providerId\":\"74\",\"billingName\":\"SHAUKAT Ali\",\"bookingId\":\"U354D1647115762503\",\"date\":\"Mar 13, 2022\",\"workedHours\":\"00Hrs:00Min\",\"time\":\"All STANDARD TIME\",\"paymentType\":null,\"paymentStatus\":\"paymentPending\",\"chargeperhrs\":50,\"discount\":0,\"total\":0,\"grandTotal\":0,\"commission\":10,\"tax\":10,\"miscellaneous\":[],\"miscellaneousAmount\":0,\"totalMin\":0,\"taxAmount\":0,\"commissionAmount\":0}]', NULL, 20),
(238, 278, 74, '[{\"userid\":\"278\",\"providerId\":\"74\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"25\",\"subcategoryName\":\"House\",\"longitude\":78.3406178,\"latitude\":12.7469087,\"time\":\"All STANDARD TIME\",\"date\":\"2022-03-13\",\"address\":\"P8WR+Q69, RS Pet, Kuppam, Andhra Pradesh 517425, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"50\",\"bookingTime\":1647139665695,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_25.png\",\"providerName\":\"dfgg\",\"providerMobile\":\"9987518019\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_74.jpg\",\"status\":\"pending\",\"username\":\"\",\"bookId\":\"U278D1647139665695\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"+917906357738\",\"popStatus\":false}]', '9987518019', 1647139663, 'jobCompleted', 'U278D1647139665695', '[{\"status\":\"pending\",\"time\":1647139663},{\"status\":\"accepted\",\"time\":1647150950696,\"bookId\":\"U278D1647139665695\"},{\"status\":\"ontheway\",\"time\":1647150956815,\"bookId\":\"U278D1647139665695\"},{\"status\":\"processing\",\"time\":1647150959887,\"bookId\":\"U278D1647139665695\"},{\"status\":\"jobCompleted\",\"time\":1647150973329,\"bookId\":\"U278D1647139665695\"}]', '0', '0', 0, 'due', '[{\"providerName\":\"dfgg\",\"providerId\":\"74\",\"billingName\":\"\",\"bookingId\":\"U278D1647139665695\",\"date\":\"Mar 13, 2022\",\"workedHours\":\"00Hrs:00Min\",\"time\":\"All STANDARD TIME\",\"paymentType\":null,\"paymentStatus\":\"paymentPending\",\"chargeperhrs\":50,\"discount\":0,\"total\":0,\"grandTotal\":0,\"commission\":10,\"tax\":10,\"miscellaneous\":[],\"miscellaneousAmount\":0,\"totalMin\":0,\"taxAmount\":0,\"commissionAmount\":0}]', NULL, 20),
(239, 359, 73, '[{\"userid\":\"359\",\"providerId\":\"73\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":91.7949587,\"latitude\":26.1373166,\"time\":\"All STANDARD TIME\",\"date\":\"2022-03-13\",\"address\":\"12, Kalpataru Path, Rukmini Gaon, Guwahati, Assam 781036, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"1\",\"bookingTime\":1647186653509,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"manish\",\"providerMobile\":\"8076762410\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_73.jpg\",\"status\":\"pending\",\"username\":\"\",\"bookId\":\"U359D1647186653509\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"+919706215257\",\"popStatus\":false}]', '8076762410', 1647186654, 'pending', 'U359D1647186653509', '[{\"status\":\"pending\",\"time\":1647186654}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(240, 359, 73, '[{\"userid\":\"359\",\"providerId\":\"73\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":91.7949587,\"latitude\":26.1373166,\"time\":\"All STANDARD TIME\",\"date\":\"2022-03-13\",\"address\":\"12, Kalpataru Path, Rukmini Gaon, Guwahati, Assam 781036, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"1\",\"bookingTime\":1647187672064,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"manish\",\"providerMobile\":\"8076762410\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_73.jpg\",\"status\":\"pending\",\"username\":\"\",\"bookId\":\"U359D1647187672064\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"+919706215257\",\"popStatus\":false}]', '8076762410', 1647187672, 'pending', 'U359D1647187672064', '[{\"status\":\"pending\",\"time\":1647187672}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(241, 337, 75, '[{\"userid\":\"337\",\"providerId\":\"75\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"25\",\"subcategoryName\":\"House\",\"longitude\":91.798084318023,\"latitude\":26.136829409912,\"time\":\"All STANDARD TIME\",\"date\":\"2022-03-13\",\"address\":\"4QPX+Q73, Rukmini Gaon, Guwahati, Assam 781036, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"200\",\"bookingTime\":1647193448937,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_25.png\",\"providerName\":\"Kamal\",\"providerMobile\":\"1234567890\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_75.jpg\",\"status\":\"pending\",\"username\":\"\",\"bookId\":\"U337D1647193448937\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"+918471928455\",\"popStatus\":false}]', '1234567890', 1647193137, 'Success', 'U337D1647193448937', '[{\"status\":\"pending\",\"time\":1647193137},{\"status\":\"accepted\",\"time\":1647193576674,\"bookId\":\"U337D1647193448937\"},{\"status\":\"ontheway\",\"time\":1647193959596,\"bookId\":\"U337D1647193448937\"},{\"status\":\"processing\",\"time\":1647194063585,\"bookId\":\"U337D1647193448937\"},{\"status\":\"jobCompleted\",\"time\":1647194111023,\"bookId\":\"U337D1647193448937\"},{\"status\":\"Success\",\"time\":1647194309234,\"bookId\":\"U337D1647193448937\"}]', '500', '0', 500, 'due', '[{\"providerName\":\"Kamal\",\"providerId\":\"75\",\"billingName\":\"\",\"bookingId\":\"U337D1647193448937\",\"date\":\"Mar 13, 2022\",\"workedHours\":\"00Hrs:00Min\",\"time\":\"All STANDARD TIME\",\"paymentType\":null,\"paymentStatus\":\"paymentPending\",\"chargeperhrs\":200,\"discount\":0,\"total\":0,\"grandTotal\":500,\"commission\":10,\"tax\":10,\"miscellaneous\":[{\"name\":\"tv remote IC\",\"price\":500}],\"miscellaneousAmount\":500,\"totalMin\":0,\"taxAmount\":0,\"commissionAmount\":0}]', NULL, 20),
(242, 337, 75, '[{\"userid\":\"337\",\"providerId\":\"75\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"25\",\"subcategoryName\":\"House\",\"longitude\":91.798084318023,\"latitude\":26.136829409912,\"time\":\"All STANDARD TIME\",\"date\":\"2022-03-13\",\"address\":\"4QPX+Q73, Rukmini Gaon, Guwahati, Assam 781036, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"200\",\"bookingTime\":1647194379518,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_25.png\",\"providerName\":\"Kamal\",\"providerMobile\":\"1234567890\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_75.jpg\",\"status\":\"pending\",\"username\":\"\",\"bookId\":\"U337D1647194379518\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"+918471928455\",\"popStatus\":false}]', '1234567890', 1647194067, 'Success', 'U337D1647194379518', '[{\"status\":\"pending\",\"time\":1647194067},{\"status\":\"accepted\",\"time\":1647194385327,\"bookId\":\"U337D1647194379518\"},{\"status\":\"ontheway\",\"time\":1647194389220,\"bookId\":\"U337D1647194379518\"},{\"status\":\"processing\",\"time\":1647194394307,\"bookId\":\"U337D1647194379518\"},{\"status\":\"jobCompleted\",\"time\":1647194468040,\"bookId\":\"U337D1647194379518\"},{\"status\":\"Success\",\"time\":1647194810597,\"bookId\":\"U337D1647194379518\"}]', '3.66', '0.33', 3.33, 'due', '[{\"providerName\":\"Kamal\",\"providerId\":\"75\",\"billingName\":\"\",\"bookingId\":\"U337D1647194379518\",\"date\":\"Mar 13, 2022\",\"workedHours\":\"00Hrs:01Min\",\"time\":\"All STANDARD TIME\",\"paymentType\":null,\"paymentStatus\":\"paymentPending\",\"chargeperhrs\":200,\"discount\":0,\"total\":3.33,\"grandTotal\":3.66,\"commission\":10,\"tax\":10,\"miscellaneous\":[],\"miscellaneousAmount\":0,\"totalMin\":1,\"taxAmount\":0.33,\"commissionAmount\":0.33}]', NULL, 20),
(243, 294, 67, '[{\"userid\":\"294\",\"providerId\":\"67\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":80.2707184,\"latitude\":13.0826802,\"time\":\"All STANDARD TIME\",\"date\":\"2022-03-14\",\"address\":\"Chennai, Tamil Nadu, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"595\",\"bookingTime\":1647232940346,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"hdhd\",\"providerMobile\":\"123\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_67.jpg\",\"status\":\"pending\",\"username\":\"\",\"bookId\":\"U294D1647232940346\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"+601169915142\",\"popStatus\":false}]', '123', 1647232941, 'pending', 'U294D1647232940346', '[{\"status\":\"pending\",\"time\":1647232941}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(244, 368, 73, '[{\"userid\":\"368\",\"providerId\":\"73\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":88.363895,\"latitude\":22.572646,\"time\":\"All STANDARD TIME\",\"date\":\"2022-03-16\",\"address\":\"Kolkata, West Bengal, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"1\",\"bookingTime\":1647252335429,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"manish\",\"providerMobile\":\"8076762410\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_73.jpg\",\"status\":\"pending\",\"username\":\"Apu Sarkar\",\"bookId\":\"U368D1647252335429\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":null,\"popStatus\":false}]', '8076762410', 1647252335, 'pending', 'U368D1647252335429', '[{\"status\":\"pending\",\"time\":1647252335}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(245, 362, 78, '[{\"userid\":\"362\",\"providerId\":\"78\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"25\",\"subcategoryName\":\"House\",\"longitude\":58.5110338,\"latitude\":23.6094894,\"time\":\"All STANDARD TIME\",\"date\":\"\\u0662\\u0660\\u0662\\u0662-\\u0660\\u0663-\\u0661\\u0665\",\"address\":\"JG56+QCV, Muscat, Oman\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"10\",\"bookingTime\":1647324694840,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_25.png\",\"providerName\":\"ahmed\",\"providerMobile\":\"95947909\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_78.jpg\",\"status\":\"pending\",\"username\":\"Ahmed\",\"bookId\":\"U362D1647324694840\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"+96895947909\",\"popStatus\":false}]', '95947909', 1647324696, 'Success', 'U362D1647324694840', '[{\"status\":\"pending\",\"time\":1647324696},{\"status\":\"accepted\",\"time\":1647324763349,\"bookId\":\"U362D1647324694840\"},{\"status\":\"ontheway\",\"time\":1647324786011,\"bookId\":\"U362D1647324694840\"},{\"status\":\"processing\",\"time\":1647324807373,\"bookId\":\"U362D1647324694840\"},{\"status\":\"jobCompleted\",\"time\":1647324896816,\"bookId\":\"U362D1647324694840\"},{\"status\":\"Success\",\"time\":1647324971079,\"bookId\":\"U362D1647324694840\"}]', '15.19', '0.02', 15.17, 'due', '[{\"providerName\":\"ahmed\",\"providerId\":\"78\",\"billingName\":\"Ahmed\",\"bookingId\":\"U362D1647324694840\",\"date\":\"Mar 15, 2022\",\"workedHours\":\"00Hrs:01Min\",\"time\":\"All STANDARD TIME\",\"paymentType\":null,\"paymentStatus\":\"paymentPending\",\"chargeperhrs\":10,\"discount\":0,\"total\":0.17,\"grandTotal\":15.19,\"commission\":10,\"tax\":10,\"miscellaneous\":[{\"name\":\"clean\",\"price\":10},{\"name\":\"ok\",\"price\":5}],\"miscellaneousAmount\":15,\"totalMin\":1,\"taxAmount\":0.02,\"commissionAmount\":0.02}]', NULL, 20),
(246, 322, 74, '[{\"userid\":\"322\",\"providerId\":\"74\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"25\",\"subcategoryName\":\"House\",\"longitude\":79.5976783,\"latitude\":17.9673258,\"time\":\"All STANDARD TIME\",\"date\":\"2022-03-19\",\"address\":\"mahesh EKASHIL NAGAR 83330 81117, Ekashila Nagar, Warangal, Telangana 506002, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"50\",\"bookingTime\":1647342928880,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_25.png\",\"providerName\":\"dfgg\",\"providerMobile\":\"9987518019\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_74.jpg\",\"status\":\"pending\",\"username\":\"\",\"bookId\":\"U322D1647342928880\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"+919291561844\",\"popStatus\":false}]', '9987518019', 1647342929, 'accepted', 'U322D1647342928880', '[{\"status\":\"pending\",\"time\":1647342929},{\"status\":\"accepted\",\"time\":1647360808597,\"bookId\":\"U322D1647342928880\"},{\"status\":\"accepted\",\"time\":1647360813023,\"bookId\":\"U322D1647342928880\"}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(247, 323, 74, '[{\"userid\":\"323\",\"providerId\":\"74\",\"categoryId\":\"20\",\"categoryName\":\"Electrician\",\"subcategoryId\":\"25\",\"subcategoryName\":\"House\",\"longitude\":80.2707184,\"latitude\":13.0826802,\"time\":\"All STANDARD TIME\",\"date\":\"2022-03-16\",\"address\":\"Chennai, Tamil Nadu, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"50\",\"bookingTime\":1647360584082,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_25.png\",\"providerName\":\"dfgg\",\"providerMobile\":\"9987518019\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_74.jpg\",\"status\":\"pending\",\"username\":\"Amani\",\"bookId\":\"U323D1647360584082\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"8825245586\",\"popStatus\":false}]', '9987518019', 1647360583, 'accepted', 'U323D1647360584082', '[{\"status\":\"pending\",\"time\":1647360583},{\"status\":\"accepted\",\"time\":1647360807576,\"bookId\":\"U323D1647360584082\"}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(248, 368, 73, '[{\"userid\":\"368\",\"providerId\":\"73\",\"categoryId\":\"20\",\"categoryName\":\"MCR\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":88.363895,\"latitude\":22.572646,\"time\":\"All STANDARD TIME\",\"date\":\"2022-03-16\",\"address\":\"Kolkata, West Bengal, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"1\",\"bookingTime\":1647408845313,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"manish\",\"providerMobile\":\"8076762410\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_73.jpg\",\"status\":\"pending\",\"username\":\"Apu Sarkar\",\"bookId\":\"U368D1647408845313\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"9800885546\",\"popStatus\":false}]', '8076762410', 1647408847, 'pending', 'U368D1647408845313', '[{\"status\":\"pending\",\"time\":1647408847}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(249, 407, 73, '[{\"userid\":\"407\",\"providerId\":\"73\",\"categoryId\":\"20\",\"categoryName\":\"MCR\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":77.2217831,\"latitude\":28.6862738,\"time\":\"All STANDARD TIME\",\"date\":\"2022-03-19\",\"address\":\"M6PC+GP3, Khyber Pass, Civil Lines, Delhi, 110054, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"1\",\"bookingTime\":1647513014895,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"manish\",\"providerMobile\":\"8076762410\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_73.jpg\",\"status\":\"pending\",\"username\":\"ibrahim ismail\",\"bookId\":\"U407D1647513014895\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"254720860643\",\"popStatus\":false}]', '8076762410', 1647513018, 'pending', 'U407D1647513014895', '[{\"status\":\"pending\",\"time\":1647513018}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(250, 366, 82, '[{\"userid\":\"366\",\"providerId\":\"82\",\"categoryId\":\"29\",\"categoryName\":\"ISP\",\"subcategoryId\":\"28\",\"subcategoryName\":\"alliance\",\"longitude\":87.2128088,\"latitude\":24.8184867,\"time\":\"All STANDARD TIME\",\"date\":\"2022-03-20\",\"address\":\"R697+94Q, Fasia Dangal, Godda, Jharkhand 814133, India\",\"description\":null,\"service\":\"ISP\",\"chargeperhrs\":\"500\",\"bookingTime\":1647716082183,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_28.png\",\"providerName\":\"raj\",\"providerMobile\":\"9987518019\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_82.jpg\",\"status\":\"pending\",\"username\":\"madhukar\",\"bookId\":\"U366D1647716082183\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"+917004367237\",\"popStatus\":false}]', '9987518019', 1647716083, 'pending', 'U366D1647716082183', '[{\"status\":\"pending\",\"time\":1647716083}]', NULL, NULL, 0, NULL, NULL, NULL, 29),
(251, 437, 75, '[{\"userid\":\"437\",\"providerId\":\"75\",\"categoryId\":\"20\",\"categoryName\":\"MCR\",\"subcategoryId\":\"25\",\"subcategoryName\":\"House\",\"longitude\":90.4596998,\"latitude\":23.6726385,\"time\":\"All STANDARD TIME\",\"date\":\"2022-03-20\",\"address\":\"MFF5+3V5, Dhaka, Bangladesh\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"200\",\"bookingTime\":1647794902060,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_25.png\",\"providerName\":\"Kamal\",\"providerMobile\":\"1234567890\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_75.jpg\",\"status\":\"pending\",\"username\":\"Rasif\",\"bookId\":\"U437D1647794902060\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"+8801580800743\",\"popStatus\":false}]', '1234567890', 1647794903, 'pending', 'U437D1647794902060', '[{\"status\":\"pending\",\"time\":1647794903}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(252, 437, 90, '[{\"userid\":\"437\",\"providerId\":\"90\",\"categoryId\":\"20\",\"categoryName\":\"MCR\",\"subcategoryId\":\"25\",\"subcategoryName\":\"House\",\"longitude\":90.4596998,\"latitude\":23.6726385,\"time\":\"All STANDARD TIME\",\"date\":\"2022-03-20\",\"address\":\"MFF5+3V5, Dhaka, Bangladesh\",\"description\":null,\"service\":\"MCR\",\"chargeperhrs\":\"200\",\"bookingTime\":1647795680255,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_25.png\",\"providerName\":\"Md Siddikur\",\"providerMobile\":\"1580800743\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_90.jpg\",\"status\":\"pending\",\"username\":\"Rasif\",\"bookId\":\"U437D1647795680255\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"+8801580800743\",\"popStatus\":false}]', '1580800743', 1647795682, 'Success', 'U437D1647795680255', '[{\"status\":\"pending\",\"time\":1647795682},{\"status\":\"accepted\",\"time\":1647795710273,\"bookId\":\"U437D1647795680255\"},{\"status\":\"ontheway\",\"time\":1647795755578,\"bookId\":\"U437D1647795680255\"},{\"status\":\"processing\",\"time\":1647795770589,\"bookId\":\"U437D1647795680255\"},{\"status\":\"jobCompleted\",\"time\":1647795909871,\"bookId\":\"U437D1647795680255\"},{\"status\":\"Success\",\"time\":1647796163738,\"bookId\":\"U437D1647795680255\"}]', '307.33', '0.67', 306.66, 'due', '[{\"providerName\":\"Md Siddikur\",\"providerId\":\"90\",\"billingName\":\"Rasif\",\"bookingId\":\"U437D1647795680255\",\"date\":\"Mar 20, 2022\",\"workedHours\":\"00Hrs:02Min\",\"time\":\"All STANDARD TIME\",\"paymentType\":null,\"paymentStatus\":\"paymentPending\",\"chargeperhrs\":200,\"discount\":0,\"total\":6.66,\"grandTotal\":307.33,\"commission\":10,\"tax\":10,\"miscellaneous\":[{\"name\":\"pipe\",\"price\":200},{\"name\":\"tab\",\"price\":100}],\"miscellaneousAmount\":300,\"totalMin\":2,\"taxAmount\":0.67,\"commissionAmount\":0.67}]', NULL, 20),
(253, 437, 90, '[{\"userid\":\"437\",\"providerId\":\"90\",\"categoryId\":\"20\",\"categoryName\":\"MCR\",\"subcategoryId\":\"25\",\"subcategoryName\":\"House\",\"longitude\":90.4596998,\"latitude\":23.6726385,\"time\":\"STD TIME 2.00 AM TO 4.00AM\",\"date\":\"2022-03-22\",\"address\":\"MFF5+3V5, Dhaka, Bangladesh\",\"description\":null,\"service\":\"MCR\",\"chargeperhrs\":\"200\",\"bookingTime\":1647796360003,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_25.png\",\"providerName\":\"Md Siddikur\",\"providerMobile\":\"1580800743\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_90.jpg\",\"status\":\"pending\",\"username\":\"Rasif\",\"bookId\":\"U437D1647796360003\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"+8801580800743\",\"popStatus\":false}]', '1580800743', 1647796361, 'rejected', 'U437D1647796360003', '[{\"status\":\"pending\",\"time\":1647796361},{\"status\":\"rejected\",\"time\":1647796440941,\"bookId\":\"U437D1647796360003\"},{\"status\":\"rejected\",\"time\":1647796444415,\"bookId\":\"U437D1647796360003\"}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(254, 393, 67, '[{\"userid\":\"393\",\"providerId\":\"67\",\"categoryId\":\"20\",\"categoryName\":\"MCR\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":77.7764443,\"latitude\":12.7566682,\"time\":\"All STANDARD TIME\",\"date\":\"2022-03-21\",\"address\":\"QQ4G+MH8 Arehalli, Karnataka, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"595\",\"bookingTime\":1647875801258,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"hdhd\",\"providerMobile\":\"123\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_67.jpg\",\"status\":\"pending\",\"username\":\"Vao Toeun\",\"bookId\":\"U393D1647875801258\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"588970\",\"popStatus\":false}]', '123', 1647875804, 'pending', 'U393D1647875801258', '[{\"status\":\"pending\",\"time\":1647875804}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(255, 370, 67, '[{\"userid\":\"370\",\"providerId\":\"67\",\"categoryId\":\"20\",\"categoryName\":\"MCR\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":78.484962,\"latitude\":11.2060053,\"time\":\"All STANDARD TIME\",\"date\":\"2022-03-23\",\"address\":\"R.K.C Farm, Tamil Nadu 621001\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"595\",\"bookingTime\":1647999565325,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"hdhd\",\"providerMobile\":\"123\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_67.jpg\",\"status\":\"pending\",\"username\":\"\",\"bookId\":\"U370D1647999565325\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"+919824252619\",\"popStatus\":false}]', '123', 1647999565, 'pending', 'U370D1647999565325', '[{\"status\":\"pending\",\"time\":1647999565}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(256, 445, 67, '[{\"userid\":\"445\",\"providerId\":\"67\",\"categoryId\":\"20\",\"categoryName\":\"MCR\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":78.3440638,\"latitude\":12.7513305,\"time\":\"All STANDARD TIME\",\"date\":\"2022-03-23\",\"address\":\"RVM Street, Kuppam, Andhra Pradesh 517425, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"595\",\"bookingTime\":1648000122096,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"hdhd\",\"providerMobile\":\"123\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_67.jpg\",\"status\":\"pending\",\"username\":\"Emin Kokalari\",\"bookId\":\"U445D1648000122096\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"00355692155083\",\"popStatus\":false}]', '123', 1648000124, 'pending', 'U445D1648000122096', '[{\"status\":\"pending\",\"time\":1648000124}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(257, 445, 67, '[{\"userid\":\"445\",\"providerId\":\"67\",\"categoryId\":\"20\",\"categoryName\":\"MCR\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":78.3440638,\"latitude\":12.7513305,\"time\":\"All STANDARD TIME\",\"date\":\"2022-03-23\",\"address\":\"RVM Street, Kuppam, Andhra Pradesh 517425, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"595\",\"bookingTime\":1648072699609,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"hdhd\",\"providerMobile\":\"123\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_67.jpg\",\"status\":\"pending\",\"username\":\"Emin Kokalari\",\"bookId\":\"U445D1648072699609\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"00355692155083\",\"popStatus\":false}]', '123', 1648072701, 'pending', 'U445D1648072699609', '[{\"status\":\"pending\",\"time\":1648072701}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(258, 437, 90, '[{\"userid\":\"437\",\"providerId\":\"90\",\"categoryId\":\"20\",\"categoryName\":\"MCR\",\"subcategoryId\":\"25\",\"subcategoryName\":\"House\",\"longitude\":90.4114696,\"latitude\":23.7227649,\"time\":\"STD TIME 4.00 AM TO 6.00AM\",\"date\":\"2022-03-26\",\"address\":\"177\\/1, Sundarban Square Super Market, \\u09a2\\u09be\\u0995\\u09be, Bangladesh\",\"description\":null,\"service\":\"MCR\",\"chargeperhrs\":\"200\",\"bookingTime\":1648115369580,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_25.png\",\"providerName\":\"Md Siddikur\",\"providerMobile\":\"1580800743\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_90.jpg\",\"status\":\"pending\",\"username\":\"Rasif\",\"bookId\":\"U437D1648115369580\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"+8801580800743\",\"popStatus\":false}]', '1580800743', 1648115370, 'jobCompleted', 'U437D1648115369580', '[{\"status\":\"pending\",\"time\":1648115370},{\"status\":\"accepted\",\"time\":1648115402878,\"bookId\":\"U437D1648115369580\"},{\"status\":\"ontheway\",\"time\":1648115427778,\"bookId\":\"U437D1648115369580\"},{\"status\":\"processing\",\"time\":1648115486292,\"bookId\":\"U437D1648115369580\"},{\"status\":\"jobCompleted\",\"time\":1648115523862,\"bookId\":\"U437D1648115369580\"}]', '3.66', '0.33', 3.33, 'due', '[{\"providerName\":\"Md Siddikur\",\"providerId\":\"90\",\"billingName\":\"Rasif\",\"bookingId\":\"U437D1648115369580\",\"date\":\"Mar 24, 2022\",\"workedHours\":\"00Hrs:01Min\",\"time\":\"STD TIME 4.00 AM TO 6.00AM\",\"paymentType\":null,\"paymentStatus\":\"paymentPending\",\"chargeperhrs\":200,\"discount\":0,\"total\":3.33,\"grandTotal\":3.66,\"commission\":10,\"tax\":10,\"miscellaneous\":[],\"miscellaneousAmount\":0,\"totalMin\":1,\"taxAmount\":0.33,\"commissionAmount\":0.33}]', NULL, 20),
(259, 480, 75, '[{\"userid\":\"480\",\"providerId\":\"75\",\"categoryId\":\"20\",\"categoryName\":\"MCR\",\"subcategoryId\":\"25\",\"subcategoryName\":\"House\",\"longitude\":94.4616891,\"latitude\":27.3670176,\"time\":\"All STANDARD TIME\",\"date\":\"2022-03-24\",\"address\":\"9F86+RM4 Dhubabari, Assam, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"200\",\"bookingTime\":1648144194030,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_25.png\",\"providerName\":\"Kamal\",\"providerMobile\":\"1234567890\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_75.jpg\",\"status\":\"pending\",\"username\":\"DGggg\",\"bookId\":\"U480D1648144194030\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"+919706409806\",\"popStatus\":false}]', '1234567890', 1648144204, 'pending', 'U480D1648144194030', '[{\"status\":\"pending\",\"time\":1648144204}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(260, 482, 70, '[{\"userid\":\"482\",\"providerId\":\"70\",\"categoryId\":\"20\",\"categoryName\":\"MCR\",\"subcategoryId\":\"25\",\"subcategoryName\":\"House\",\"longitude\":77.8693131,\"latitude\":13.3824025,\"time\":\"All STANDARD TIME\",\"date\":\"2022-03-26\",\"address\":\"9VJ9+XP8 Sidlaghatta, Karnataka, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"10\",\"bookingTime\":1648157654295,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_25.png\",\"providerName\":\"hyhyy\",\"providerMobile\":\"2222222222\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_70.jpg\",\"status\":\"pending\",\"username\":\"hehdjdjdj\",\"bookId\":\"U482D1648157654295\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"+62816292062\",\"popStatus\":false}]', '2222222222', 1648157654, 'pending', 'U482D1648157654295', '[{\"status\":\"pending\",\"time\":1648157654}]', NULL, NULL, 0, NULL, NULL, NULL, 20);
INSERT INTO `booking` (`booking_id`, `user_id`, `provider_id`, `detail`, `phone`, `date`, `status`, `bookid`, `statusmanage`, `totalamount`, `commission_amount`, `settlement_value`, `commission_status`, `payment`, `transaction_id`, `category_id`) VALUES
(261, 383, 73, '[{\"userid\":\"383\",\"providerId\":\"73\",\"categoryId\":\"20\",\"categoryName\":\"MCR\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":85.1828867,\"latitude\":25.6149213,\"time\":\"All STANDARD TIME\",\"date\":\"2022-03-27\",\"address\":\"J57M+X4H, Sultanganj, Muhammadpur, Patna, Bihar 800006, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"1\",\"bookingTime\":1648297642590,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"manish\",\"providerMobile\":\"8076762410\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_73.jpg\",\"status\":\"pending\",\"username\":\"amani\",\"bookId\":\"U383D1648297642590\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"+918825245586\",\"popStatus\":false}]', '8076762410', 1648297643, 'pending', 'U383D1648297642590', '[{\"status\":\"pending\",\"time\":1648297643}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(262, 383, 90, '[{\"userid\":\"383\",\"providerId\":\"90\",\"categoryId\":\"20\",\"categoryName\":\"MCR\",\"subcategoryId\":\"25\",\"subcategoryName\":\"House\",\"longitude\":85.1828867,\"latitude\":25.6149213,\"time\":\"All STANDARD TIME\",\"date\":\"2022-03-27\",\"address\":\"J57M+X4H, Sultanganj, Muhammadpur, Patna, Bihar 800006, India\",\"description\":null,\"service\":\"MCR\",\"chargeperhrs\":\"200\",\"bookingTime\":1648297727720,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_25.png\",\"providerName\":\"Md Siddikur\",\"providerMobile\":\"1580800743\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_90.jpg\",\"status\":\"pending\",\"username\":\"amani\",\"bookId\":\"U383D1648297727720\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"+918825245586\",\"popStatus\":false}]', '1580800743', 1648297728, 'jobCompleted', 'U383D1648297727720', '[{\"status\":\"pending\",\"time\":1648297728},{\"status\":\"accepted\",\"time\":1648412248946,\"bookId\":\"U383D1648297727720\"},{\"status\":\"ontheway\",\"time\":1648412290070,\"bookId\":\"U383D1648297727720\"},{\"status\":\"processing\",\"time\":1648412292969,\"bookId\":\"U383D1648297727720\"},{\"status\":\"jobCompleted\",\"time\":1648412301435,\"bookId\":\"U383D1648297727720\"}]', '0', '0', 0, 'due', '[{\"providerName\":\"Md Siddikur\",\"providerId\":\"90\",\"billingName\":\"amani\",\"bookingId\":\"U383D1648297727720\",\"date\":\"Mar 26, 2022\",\"workedHours\":\"00Hrs:00Min\",\"time\":\"All STANDARD TIME\",\"paymentType\":null,\"paymentStatus\":\"paymentPending\",\"chargeperhrs\":200,\"discount\":0,\"total\":0,\"grandTotal\":0,\"commission\":10,\"tax\":10,\"miscellaneous\":[],\"miscellaneousAmount\":0,\"totalMin\":0,\"taxAmount\":0,\"commissionAmount\":0}]', NULL, 20),
(263, 477, 70, '[{\"userid\":\"477\",\"providerId\":\"70\",\"categoryId\":\"20\",\"categoryName\":\"MCR\",\"subcategoryId\":\"25\",\"subcategoryName\":\"House\",\"longitude\":78.183405216361,\"latitude\":11.669555620847,\"time\":\"All STANDARD TIME\",\"date\":\"2022-03-28\",\"address\":\"M59M+R8H, Vaikal Patrai, Salem, Tamil Nadu 636014, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"10\",\"bookingTime\":1648455186152,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_25.png\",\"providerName\":\"hyhyy\",\"providerMobile\":\"2222222222\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_70.jpg\",\"status\":\"pending\",\"username\":\"pradeep\",\"bookId\":\"U477D1648455186152\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"+918668192813\",\"popStatus\":false}]', '2222222222', 1648455187, 'pending', 'U477D1648455186152', '[{\"status\":\"pending\",\"time\":1648455187}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(264, 477, 70, '[{\"userid\":\"477\",\"providerId\":\"70\",\"categoryId\":\"20\",\"categoryName\":\"MCR\",\"subcategoryId\":\"25\",\"subcategoryName\":\"House\",\"longitude\":78.183405216361,\"latitude\":11.669555620847,\"time\":\"All STANDARD TIME\",\"date\":\"2022-03-28\",\"address\":\"M59M+R8H, Vaikal Patrai, Salem, Tamil Nadu 636014, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"10\",\"bookingTime\":1648457230160,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_25.png\",\"providerName\":\"hyhyy\",\"providerMobile\":\"2222222222\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_70.jpg\",\"status\":\"pending\",\"username\":\"pradeep\",\"bookId\":\"U477D1648457230160\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"+918668192813\",\"popStatus\":false}]', '2222222222', 1648457231, 'pending', 'U477D1648457230160', '[{\"status\":\"pending\",\"time\":1648457231}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(265, 521, 82, '[{\"userid\":\"521\",\"providerId\":\"82\",\"categoryId\":\"29\",\"categoryName\":\"ISP\",\"subcategoryId\":\"28\",\"subcategoryName\":\"alliance\",\"longitude\":80.2707184,\"latitude\":13.0826802,\"time\":\"STD TIME 10.00 AM TO 12.00PM\",\"date\":\"2022-03-30\",\"address\":\"7, 1st St, Chinnaiyan Colony, State Bank Colony, Perambur, Chennai, Tamil Nadu 600012, India\",\"description\":null,\"service\":\"ISP\",\"chargeperhrs\":\"500\",\"bookingTime\":1648652817969,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_28.png\",\"providerName\":\"raj\",\"providerMobile\":\"9987518019\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_82.jpg\",\"status\":\"pending\",\"username\":\"kkkk\",\"bookId\":\"U521D1648652817969\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"+16467893474\",\"popStatus\":false}]', '9987518019', 1648652818, 'pending', 'U521D1648652817969', '[{\"status\":\"pending\",\"time\":1648652818}]', NULL, NULL, 0, NULL, NULL, NULL, 29),
(266, 521, 71, '[{\"userid\":\"521\",\"providerId\":\"71\",\"categoryId\":\"20\",\"categoryName\":\"MCR\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":80.2707184,\"latitude\":13.0826802,\"time\":\"STD TIME 0.00 AM TO 2.00AM\",\"date\":\"2022-04-05\",\"address\":\"Chennai, Tamil Nadu, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"500\",\"bookingTime\":1648683607018,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"art\",\"providerMobile\":\"9987518019\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_71.jpg\",\"status\":\"pending\",\"username\":\"kkkk\",\"bookId\":\"U521D1648683607018\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"+16467893474\",\"popStatus\":false}]', '9987518019', 1648683607, 'pending', 'U521D1648683607018', '[{\"status\":\"pending\",\"time\":1648683607}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(267, 383, 73, '[{\"userid\":\"383\",\"providerId\":\"73\",\"categoryId\":\"20\",\"categoryName\":\"MCR\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":85.1828867,\"latitude\":25.6149213,\"time\":\"All STANDARD TIME\",\"date\":\"2022-04-01\",\"address\":\"J57M+X4H, Sultanganj, Muhammadpur, Patna, Bihar 800006, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"1\",\"bookingTime\":1648709396405,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"manish\",\"providerMobile\":\"8076762410\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_73.jpg\",\"status\":\"pending\",\"username\":\"amani\",\"bookId\":\"U383D1648709396405\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"+918825245586\",\"popStatus\":false}]', '8076762410', 1648709397, 'pending', 'U383D1648709396405', '[{\"status\":\"pending\",\"time\":1648709397}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(268, 494, 81, '[{\"userid\":\"494\",\"providerId\":\"81\",\"categoryId\":\"59\",\"categoryName\":\"PANDIT JI\",\"subcategoryId\":\"31\",\"subcategoryName\":\"pandit ji\",\"longitude\":29.9599807,\"latitude\":31.1973621,\"time\":\"All STANDARD TIME\",\"date\":\"2022-04-01\",\"address\":\"90 Street 4, Abis, El Raml 2, Alexandria Governorate, Egypt\",\"description\":null,\"service\":\"PANDIT JI\",\"chargeperhrs\":\"200\",\"bookingTime\":1648790376197,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_31.png\",\"providerName\":\"fhhh\",\"providerMobile\":\"9987518019\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_81.jpg\",\"status\":\"pending\",\"username\":\"Vao Teurn\",\"bookId\":\"U494D1648790376197\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"91114667999522\",\"popStatus\":false}]', '9987518019', 1648790379, 'pending', 'U494D1648790376197', '[{\"status\":\"pending\",\"time\":1648790379}]', NULL, NULL, 0, NULL, NULL, NULL, 59),
(269, 506, 90, '[{\"userid\":\"506\",\"providerId\":\"90\",\"categoryId\":\"20\",\"categoryName\":\"MCR\",\"subcategoryId\":\"25\",\"subcategoryName\":\"House\",\"longitude\":76.100833276099,\"latitude\":28.054388211913,\"time\":\"All STANDARD TIME\",\"date\":\"2022-04-05\",\"address\":\"3432+P7X, Industrial Area, Keshav Nagar, Narnaul, Haryana 123001, India\",\"description\":null,\"service\":\"MCR\",\"chargeperhrs\":\"200\",\"bookingTime\":1648813733419,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_25.png\",\"providerName\":\"Md Siddikur\",\"providerMobile\":\"1580800743\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_90.jpg\",\"status\":\"pending\",\"username\":\"OnlineExam360\",\"bookId\":\"U506D1648813733419\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"899999986\",\"popStatus\":false}]', '1580800743', 1648813734, 'pending', 'U506D1648813733419', '[{\"status\":\"pending\",\"time\":1648813734}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(270, 514, 67, '[{\"userid\":\"514\",\"providerId\":\"67\",\"categoryId\":\"20\",\"categoryName\":\"MCR\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":78.342291,\"latitude\":12.7461129,\"time\":\"All STANDARD TIME\",\"date\":\"2022-04-01\",\"address\":\"Kuppam, Andhra Pradesh 517425, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"55\",\"bookingTime\":1648817306879,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"hdhd\",\"providerMobile\":\"123\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_67.jpg\",\"status\":\"pending\",\"username\":\"Kamal J Singh\",\"bookId\":\"U514D1648817306879\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"9706215257\",\"popStatus\":false}]', '123', 1648817308, 'pending', 'U514D1648817306879', '[{\"status\":\"pending\",\"time\":1648817308}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(271, 300, 67, '[{\"userid\":\"300\",\"providerId\":\"67\",\"categoryId\":\"20\",\"categoryName\":\"MCR\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":76.9354212,\"latitude\":11.0121706,\"time\":\"All STANDARD TIME\",\"date\":\"2022-04-02\",\"address\":\"TNAU - RI Block, Tamil Nadu Agricultural University, Lawley Rd, P N Pudur, Tamil Nadu 641003, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"595\",\"bookingTime\":1648842517260,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"hdhd\",\"providerMobile\":\"123\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_67.jpg\",\"status\":\"pending\",\"username\":\"sam\",\"bookId\":\"U300D1648842517260\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"+918169444762\",\"popStatus\":false}]', '123', 1648842518, 'pending', 'U300D1648842517260', '[{\"status\":\"pending\",\"time\":1648842518}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(272, 543, 71, '[{\"userid\":\"543\",\"providerId\":\"71\",\"categoryId\":\"20\",\"categoryName\":\"MCR\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":80.2707184,\"latitude\":13.0826802,\"time\":\"STD TIME 12.00 PM TO 2.00PM\",\"date\":\"2022-04-05\",\"address\":\"Chennai, Tamil Nadu, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"500\",\"bookingTime\":1648846849788,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"art\",\"providerMobile\":\"9987518019\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_71.jpg\",\"status\":\"pending\",\"username\":\"Victor Olofin\",\"bookId\":\"U543D1648846849788\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"919951442258\",\"popStatus\":false}]', '9987518019', 1648846851, 'pending', 'U543D1648846849788', '[{\"status\":\"pending\",\"time\":1648846851}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(273, 547, 76, '[{\"userid\":\"547\",\"providerId\":\"76\",\"categoryId\":\"20\",\"categoryName\":\"MCR\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":79.8103928,\"latitude\":11.9503316,\"time\":\"All STANDARD TIME\",\"date\":\"2022-04-03\",\"address\":\"No.37, Airport Road, Rajaji Nagar, Pakkamudayanpet, Lawspet, Puducherry, 605008, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"250\",\"bookingTime\":1648923111135,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"Murali\",\"providerMobile\":\"7871452671\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_76.jpg\",\"status\":\"pending\",\"username\":\"Mani\",\"bookId\":\"U547D1648923111135\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"+918056538494\",\"popStatus\":false}]', '7871452671', 1648923112, 'pending', 'U547D1648923111135', '[{\"status\":\"pending\",\"time\":1648923112}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(274, 548, 106, '[{\"userid\":\"548\",\"providerId\":\"106\",\"categoryId\":\"62\",\"categoryName\":\"Building Materials\",\"subcategoryId\":\"32\",\"subcategoryName\":\"Strucural Stage\",\"longitude\":57.0703851,\"latitude\":30.2797057,\"time\":\"All STANDARD TIME\",\"date\":\"2022-04-03\",\"address\":\"Kerman, \\u0627\\u0633\\u062a\\u0627\\u0646 \\u06a9\\u0631\\u0645\\u0627\\u0646\\u060c \\u06a9\\u0631\\u0645\\u0627\\u0646\\u060c \\u062e\\u06cc\\u0627\\u0628\\u0627\\u0646 \\u0645\\u0637\\u0647\\u0631\\u06cc\\u060c\\u060c Iran\",\"description\":null,\"service\":\"Building Materials\",\"chargeperhrs\":\"6\",\"bookingTime\":1648955424543,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_32.png\",\"providerName\":\"absnsn\",\"providerMobile\":\"606868\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_106.jp\",\"status\":\"pending\",\"username\":\"mohamad MZ\",\"bookId\":\"U548D1648955424543\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":null,\"popStatus\":false}]', '606868', 1648955425, 'pending', 'U548D1648955424543', '[{\"status\":\"pending\",\"time\":1648955425}]', NULL, NULL, 0, NULL, NULL, NULL, 62),
(275, 551, 74, '[{\"userid\":\"551\",\"providerId\":\"74\",\"categoryId\":\"20\",\"categoryName\":\"MCR\",\"subcategoryId\":\"25\",\"subcategoryName\":\"House\",\"longitude\":78.6553408,\"latitude\":11.128738,\"time\":\"All STANDARD TIME\",\"date\":\"2022-04-04\",\"address\":\"4MH4+F4W Keelakunupatti, Tamil Nadu, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"50\",\"bookingTime\":1649014443979,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_25.png\",\"providerName\":\"dfgg\",\"providerMobile\":\"9987518019\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_74.jpg\",\"status\":\"pending\",\"username\":\"Momin Shahid\",\"bookId\":\"U551D1649014443979\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":null,\"popStatus\":false}]', '9987518019', 1649014443, 'pending', 'U551D1649014443979', '[{\"status\":\"pending\",\"time\":1649014443}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(276, 585, 74, '[{\"userid\":\"585\",\"providerId\":\"74\",\"categoryId\":\"20\",\"categoryName\":\"MCR\",\"subcategoryId\":\"25\",\"subcategoryName\":\"House\",\"longitude\":80.2707184,\"latitude\":13.0826802,\"time\":\"All STANDARD TIME\",\"date\":\"2022-04-07\",\"address\":\"Chennai, Tamil Nadu, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"50\",\"bookingTime\":1649280103796,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_25.png\",\"providerName\":\"dfgg\",\"providerMobile\":\"9987518019\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_74.jpg\",\"status\":\"pending\",\"username\":\"Madalin Darkness\",\"bookId\":\"U585D1649280103796\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":null,\"popStatus\":false}]', '9987518019', 1649280106, 'pending', 'U585D1649280103796', '[{\"status\":\"pending\",\"time\":1649280106}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(277, 566, 80, '[{\"userid\":\"566\",\"providerId\":\"80\",\"categoryId\":\"29\",\"categoryName\":\"Doctor\",\"subcategoryId\":\"28\",\"subcategoryName\":\"alliance\",\"longitude\":77.86989428697,\"latitude\":9.1729469104513,\"time\":\"All STANDARD TIME\",\"date\":\"2022-04-09\",\"address\":\"5VF9+5X8, Iluppaiyurani, Kovilpatti, Tamil Nadu 628501, India\",\"description\":null,\"service\":\"ISP\",\"chargeperhrs\":\"250\",\"bookingTime\":1649478974273,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_28.png\",\"providerName\":\"sam\",\"providerMobile\":\"6358465959\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_80.jpg\",\"status\":\"pending\",\"username\":\"ontimefoods\",\"bookId\":\"U566D1649478974273\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"+917094803065\",\"popStatus\":false}]', '6358465959', 1649478975, 'pending', 'U566D1649478974273', '[{\"status\":\"pending\",\"time\":1649478975}]', NULL, NULL, 0, NULL, NULL, NULL, 29),
(278, 609, 70, '[{\"userid\":\"609\",\"providerId\":\"70\",\"categoryId\":\"20\",\"categoryName\":\"MCR\",\"subcategoryId\":\"25\",\"subcategoryName\":\"House\",\"longitude\":86.1311245,\"latitude\":25.4013617,\"time\":\"All STANDARD TIME\",\"date\":\"2022-04-12\",\"address\":\"C42J+GCX, Ratanpur, Ramnagar, Bihar 851101, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"10\",\"bookingTime\":1649732850296,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_25.png\",\"providerName\":\"hyhyy\",\"providerMobile\":\"2222222222\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_70.jpg\",\"status\":\"pending\",\"username\":\"Dem \",\"bookId\":\"U609D1649732850296\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"+919104422601\",\"popStatus\":false}]', '2222222222', 1649732852, 'pending', 'U609D1649732850296', '[{\"status\":\"pending\",\"time\":1649732852}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(279, 622, 70, '[{\"userid\":\"622\",\"providerId\":\"70\",\"categoryId\":\"20\",\"categoryName\":\"MCR\",\"subcategoryId\":\"25\",\"subcategoryName\":\"House\",\"longitude\":77.2295097,\"latitude\":28.612912,\"time\":\"All STANDARD TIME\",\"date\":\"2022-04-12\",\"address\":\"Rajpath, India Gate, New Delhi, Delhi 110001, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"10\",\"bookingTime\":1649794245518,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_25.png\",\"providerName\":\"hyhyy\",\"providerMobile\":\"2222222222\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_70.jpg\",\"status\":\"pending\",\"username\":\"Edwin Villanueva\",\"bookId\":\"U622D1649794245518\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":null,\"popStatus\":false}]', '2222222222', 1649794246, 'pending', 'U622D1649794245518', '[{\"status\":\"pending\",\"time\":1649794246}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(280, 629, 67, '[{\"userid\":\"629\",\"providerId\":\"67\",\"categoryId\":\"20\",\"categoryName\":\"MCR\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":78.995312585968,\"latitude\":11.735104846918,\"time\":\"All STANDARD TIME\",\"date\":\"2022-04-13\",\"address\":\"PXPW+248, Kallakkurichi, Tamil Nadu 606213, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"595\",\"bookingTime\":1649859498858,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"hdhd\",\"providerMobile\":\"123\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_67.jpg\",\"status\":\"pending\",\"username\":\"Haricharan M\",\"bookId\":\"U629D1649859498858\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"9663525652\",\"popStatus\":false}]', '123', 1649859500, 'pending', 'U629D1649859498858', '[{\"status\":\"pending\",\"time\":1649859500}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(281, 636, 73, '[{\"userid\":\"636\",\"providerId\":\"73\",\"categoryId\":\"20\",\"categoryName\":\"MCR\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":76.8260642,\"latitude\":27.9939713,\"time\":\"All STANDARD TIME\",\"date\":\"2022-04-14\",\"address\":\"XRVG+HCP Isroda, Rajasthan, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"1\",\"bookingTime\":1649919859956,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"manish\",\"providerMobile\":\"8076762410\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_73.jpg\",\"status\":\"pending\",\"username\":\"\",\"bookId\":\"U636D1649919859956\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"+919799428685\",\"popStatus\":false}]', '8076762410', 1649919860, 'pending', 'U636D1649919859956', '[{\"status\":\"pending\",\"time\":1649919860}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(282, 637, 70, '[{\"userid\":\"637\",\"providerId\":\"70\",\"categoryId\":\"20\",\"categoryName\":\"MCR\",\"subcategoryId\":\"25\",\"subcategoryName\":\"House\",\"longitude\":76.6345735,\"latitude\":27.5529907,\"time\":\"All STANDARD TIME\",\"date\":\"2022-04-14\",\"address\":\"Alwar, Rajasthan, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"10\",\"bookingTime\":1649943924293,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_25.png\",\"providerName\":\"hyhyy\",\"providerMobile\":\"2222222222\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_70.jpg\",\"status\":\"pending\",\"username\":\"dinesh\",\"bookId\":\"U637D1649943924293\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"+919529141538\",\"popStatus\":false}]', '2222222222', 1649943925, 'pending', 'U637D1649943924293', '[{\"status\":\"pending\",\"time\":1649943925}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(283, 622, 73, '[{\"userid\":\"622\",\"providerId\":\"73\",\"categoryId\":\"20\",\"categoryName\":\"MCR\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":77.2295102,\"latitude\":28.6129072,\"time\":\"All STANDARD TIME\",\"date\":\"2022-04-15\",\"address\":\"India Gate, Rajpath, India Gate, New Delhi, Delhi 110001, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"1\",\"bookingTime\":1650000236559,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"manish\",\"providerMobile\":\"8076762410\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_73.jpg\",\"status\":\"pending\",\"username\":\"Edwin Villanueva\",\"bookId\":\"U622D1650000236559\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"00000000000\",\"popStatus\":false}]', '8076762410', 1650000239, 'pending', 'U622D1650000236559', '[{\"status\":\"pending\",\"time\":1650000239}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(284, 427, 67, '[{\"userid\":\"427\",\"providerId\":\"67\",\"categoryId\":\"20\",\"categoryName\":\"MCR\",\"subcategoryId\":\"24\",\"subcategoryName\":\"Construction Electrician\",\"longitude\":73.114441649162,\"latitude\":19.159114943838,\"time\":\"All STANDARD TIME\",\"date\":\"2022-04-22\",\"address\":\"5457+JRC Casa Apartment, Antarli, Maharashtra 421204, India\",\"description\":null,\"service\":\"Electrician\",\"chargeperhrs\":\"595\",\"bookingTime\":1650568517733,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_24.png\",\"providerName\":\"hdhd\",\"providerMobile\":\"123\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_67.jpg\",\"status\":\"pending\",\"username\":\"amit\",\"bookId\":\"U427D1650568517733\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"+919987518019\",\"popStatus\":false}]', '123', 1650568517, 'pending', 'U427D1650568517733', '[{\"status\":\"pending\",\"time\":1650568517}]', NULL, NULL, 0, NULL, NULL, NULL, 20),
(285, 383, 82, '[{\"userid\":\"383\",\"providerId\":\"82\",\"categoryId\":\"29\",\"categoryName\":\"Doctor\",\"subcategoryId\":\"28\",\"subcategoryName\":\"alliance\",\"longitude\":85.1828867,\"latitude\":25.6149213,\"time\":\"All STANDARD TIME\",\"date\":\"2022-04-25\",\"address\":\"J57M+X4H, Sultanganj, Muhammadpur, Patna, Bihar 800006, India\",\"description\":null,\"service\":\"ISP\",\"chargeperhrs\":\"500\",\"bookingTime\":1650754751397,\"subcategoryImg\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/h_sub_category_image\\/h_sub_category_28.png\",\"providerName\":\"raj\",\"providerMobile\":\"9987518019\",\"providerImage\":\"https:\\/\\/optimaprotech.com\\/test\\/uploads\\/provider_image\\/provider_82.jpg\",\"status\":\"pending\",\"username\":\"amani\",\"bookId\":\"U383D1650754751397\",\"userRatingStatus\":\"no\",\"providerRatingStatus\":\"no\",\"userMobile\":\"+918825245586\",\"popStatus\":false}]', '9987518019', 1650754752, 'pending', 'U383D1650754751397', '[{\"status\":\"pending\",\"time\":1650754752}]', NULL, NULL, 0, NULL, NULL, NULL, 29);

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `brand_id` int(11) NOT NULL,
  `name` longtext,
  `description` longtext,
  `logo` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`brand_id`, `name`, `description`, `logo`) VALUES
(322, '12', NULL, 'brand_322.png');

-- --------------------------------------------------------

--
-- Table structure for table `bundle_stock`
--

CREATE TABLE `bundle_stock` (
  `stock_id` int(11) NOT NULL,
  `type` longtext,
  `product_bundle` longtext,
  `quantity` longtext,
  `rate` longtext,
  `total` longtext,
  `reason_note` longtext,
  `datetime` longtext,
  `sale_id` varchar(30) DEFAULT NULL,
  `added_by` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bundle_stock`
--

INSERT INTO `bundle_stock` (`stock_id`, `type`, `product_bundle`, `quantity`, `rate`, `total`, `reason_note`, `datetime`, `sale_id`, `added_by`) VALUES
(1, 'add', '101', '4', '999.00', '3996', '', '1521357279', NULL, NULL),
(2, 'destroy', '101', '5', NULL, '4995', '', '1521357287', NULL, NULL),
(3, 'add', '102', '9', '120.00', '1080', '', '1521606561', NULL, NULL),
(4, 'destroy', '102', '2', NULL, '240', '', '1521610522', NULL, NULL),
(5, 'add', '102', '12', '120.00', '1440', '', '1521616802', NULL, NULL),
(6, 'add', '123', '30', '14.99', '449.7', '', '1522921498', NULL, NULL),
(7, 'add', '122', '20', '80.00', '1600', '', '1522921821', NULL, NULL),
(8, 'add', '121', '15', '499.00', '7485', '', '1522922093', NULL, NULL),
(9, 'add', '120', '11', '1199.00', '13189', '', '1522922900', NULL, NULL),
(10, 'add', '118', '29', '39.99', '1159.71', '', '1522923029', NULL, NULL),
(11, 'add', '117', '39', '249.99', '9749.61', '', '1522923088', NULL, NULL),
(12, 'add', '116', '11', '15.99', '175.89000000000001', '', '1522923244', NULL, NULL),
(13, 'add', '119', '30', '1099.00', '32970', '', '1522923499', NULL, NULL),
(14, 'add', '115', '49', '25.59', '1253.91', '', '1522923556', NULL, NULL),
(15, 'add', '114', '49', '139.00', '6811', '', '1522923574', NULL, NULL),
(16, 'add', '102', '80', '24.99', '1999.1999999999998', '', '1522923749', NULL, NULL),
(17, 'add', '113', '30', '15.00', '450', '', '1522923771', NULL, NULL),
(18, 'add', '126', '50', '23.00', '1150', '', '1523942068', NULL, NULL),
(19, 'add', '163', '20', '7000.00', '140000', '', '1524845958', NULL, NULL),
(20, 'add', '163', '22', '7000.00', '154000', 'nothing', '1524904062', NULL, NULL),
(21, 'destroy', '163', '2', NULL, '14000', '', '1524905432', NULL, NULL),
(22, 'destroy', '163', '2', NULL, '14000', '', '1524910766', NULL, NULL),
(23, 'add', '179', '500', '99.00', '49500', '', '1530436948', NULL, NULL),
(24, 'add', '123', '500', '300.00', '150000', '', '1531643194', NULL, NULL),
(25, 'add', '122', '500', '80.00', '40000', '', '1531643204', NULL, NULL),
(26, 'add', '121', '100', '499.00', '49900', '', '1531643213', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `business_settings`
--

CREATE TABLE `business_settings` (
  `business_settings_id` int(11) NOT NULL,
  `type` longtext,
  `status` varchar(10) DEFAULT NULL,
  `value` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `business_settings`
--

INSERT INTO `business_settings` (`business_settings_id`, `type`, `status`, `value`) VALUES
(1, 'paypal_email', 'ok', 'paypal@mail.com'),
(2, 'shipping_cost', 'ok', '10'),
(3, 'shipping_cost_type', '', 'product_wise'),
(4, 'currency', '', '27'),
(6, 'shipment_info', '', '<p><span style=\"line-height: 17.1429px;\">&nbsp;</span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod</p><p>tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,</p><p>quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo</p><p>consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse</p><p>cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non</p><p>proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>'),
(7, 'currency_name', '', 'Dollar'),
(8, 'exchange', '', '80'),
(9, 'paypal_set', '', 'ok'),
(10, 'paypal_type', '', 'sandbox'),
(11, 'faqs', '', '[{\"question\":\"What is a seed bomb or a seed ball?\",\"answer\":\"<p>Seed bombs or seed balls are nothing but a ball of various varieties of seeds rolled with vermicide or cow dung manure. The balls ready to be planted anywhere.<\\/p>\"},{\"question\":\"How it saves the mother nature?\",\"answer\":\"<p>Forest is the respiratory organ of earth. And due to deforestation its getting diseased. To treat and heal the world, create your own forest.<\\/p>\"},{\"question\":\"Where to use seed bombs?\",\"answer\":\"<p>Just through it anywhere you like and water it, or plant it on a damp soil. Once your bomb bursts it forms your own tiny forest. Give it some care and join the green community.<\\/p>\"},{\"question\":\"How to use the seed bombs?\",\"answer\":\"<span id=\\\"docs-internal-guid-124e708a-7fff-7c17-6098-c961ede07ad1\\\" style=\\\"\\\"><div style=\\\"text-align: justify;\\\"><div>1. A gift or a customized pack of seed bombs can be presented in a wedding<\\/div><div>ceremony as a return gift or on a baby shower ceremony.<\\/div><div>2. It would be a great gift in a house warming function.<\\/div><div>3.Can also be insisted by political leaders to give the seed bombs in a gathering to become an political icon.<\\/div><div>4.Otherwise seed bomb a best birthday gift for your best friend.<\\/div><div>5. A perfect gift for your valentine by planting it as representing your love for<\\/div><div>years.<\\/div><div>6.Many gifts you buy in a shop may fade away in a mean time. But your gift as a seed bomb will always remind you for your loved ones for many decades as<\\/div><div>trees.<\\/div><\\/div><\\/span>\"},{\"question\":\"Why we promote seed bombs?\",\"answer\":\"<p>Are you a lover of mother nature, and like to save it from being destroyed? But in this busy world you may not have time to spend for this. So we are presenting you with a power to create your own forest. What? My own forest? How is it possible? Everything is possible in this world. Yes. When there is a will, then there is a way! Create your own forest with an advanced technique called seed bomb or otherwise it is also known as seed balls. You can also insist people to join green community by gifting seed bombs to create green nature. Bombs generally destroy the nature, but join hands to change it, by planting seed bombs.<\\/p>\"}]'),
(12, 'cash_set', '', 'ok'),
(13, 'stripe_set', '', 'ok'),
(14, 'stripe_secret', '', 'sk_test_NYIpPjs6gbmuogdwUuJ8She4'),
(15, 'stripe_publishable', '', 'pk_test_SuCjGKYkw5J5c0ZXvCfvX3zx'),
(16, 'home_def_currency', '', '27'),
(17, 'c2_set', NULL, 'ok'),
(18, 'c2_user', NULL, '901378053'),
(19, 'c2_secret', NULL, '8677E1C0-7CB9-4D35-A513-05CA089B5E70'),
(20, 'c2_type', NULL, 'demo'),
(21, 'currency_format', NULL, 'us'),
(22, 'symbol_format', NULL, 's_amount'),
(23, 'no_of_decimals', NULL, '2'),
(24, 'vp_set', NULL, 'ok'),
(25, 'vp_merchant_id', NULL, 'DEMO'),
(26, 'pum_set', NULL, 'ok'),
(27, 'pum_merchant_key', NULL, 'RR2LThlB'),
(28, 'pum_merchant_salt', NULL, '3M85o3dezx'),
(29, 'pum_account_type', NULL, 'sandbox'),
(30, 'commission_set', NULL, 'yes'),
(31, 'commission_amount', NULL, '30'),
(32, 'ssl_store_id', NULL, 'techr5affa68a7602c'),
(33, 'ssl_store_passwd', NULL, 'techr5affa68a7602c@ssl'),
(34, 'ssl_type', NULL, 'sandbox'),
(35, 'ssl_set', NULL, 'ok');

-- --------------------------------------------------------

--
-- Table structure for table `cancelled_order`
--

CREATE TABLE `cancelled_order` (
  `cancelled_order_id` int(11) NOT NULL,
  `order_id` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `message` longtext CHARACTER SET utf8 NOT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `date` int(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cancelled_order`
--

INSERT INTO `cancelled_order` (`cancelled_order_id`, `order_id`, `user_id`, `shop_id`, `message`, `amount`, `date`) VALUES
(1, '162572275631295', 95, 43, 'I ordered the wrong items', 400, 1625723054),
(2, '162572275631295', 95, 43, 'I ordered the wrong items', 400, 1625723077),
(3, '162572314009695', 95, 43, 'I choose a wrong delivery address', 200, 1625723197),
(4, '162575133911195', 95, 43, 'I forgot to apply coupon', 725, 1625751350),
(5, '162589446973595', 95, 43, 'I ordered the wrong items', 279, 1625894516),
(6, '162589486379795', 95, 43, 'I forgot to apply coupon', 279, 1625894918),
(7, '1626336417534106', 106, 58, 'I ordered the wrong items', 786, 1626336428),
(8, '1633510450884107', 107, 77, 'I ordered the wrong items', 1944, 1633510466),
(9, '1633541727360107', 107, 82, 'I changed my mind', 690, 1633541744),
(10, '1633542353899107', 107, 88, 'I changed my mind', 211, 1633543376),
(11, '1633546688885152', 152, 90, 'I choose a wrong delivery address', 201, 1633546782),
(12, '1633556047271155', 155, 79, 'Other reasons', 235, 1633556071),
(13, '1633573133331107', 107, 75, 'Other reasons', 397.62, 1633573460),
(14, '1633590302555107', 107, 90, 'I choose a wrong delivery address', 1804, 1633590342),
(15, '1633590413440160', 160, 88, 'Other reasons', 201, 1633590431),
(16, '1633590699968160', 160, 76, 'I changed my mind', 395, 1633590710),
(17, '1633590890489160', 160, 76, 'I choose a wrong delivery address', 216, 1633591526),
(18, '1633591967002160', 160, 76, 'I ordered the wrong items', 5295, 1633591987),
(19, '163445288365494', 94, 75, 'I ordered the wrong items', 397.62, 1634453045),
(20, '163445341328094', 94, 75, 'I ordered the wrong items', 397.62, 1634453535),
(21, '1634735843800165', 165, 80, 'Other reasons', 71, 1634735965),
(22, '1634735885193165', 165, 80, 'I changed my mind', 0, 1634735993),
(23, '163514817324595', 95, 76, 'I ordered the wrong items', 0, 1635137856),
(24, '163517167644495', 95, 80, 'I choose a wrong delivery address', 96, 1635161367),
(25, '1635785104567173', 173, 77, 'I choose a wrong delivery address', 72, 1635785232),
(26, '163581938693295', 95, 80, 'I ordered the wrong items', 116, 1635819397),
(27, '1635856748918107', 107, 76, 'Other reasons', 144, 1635856764),
(28, '1635874104875167', 167, 80, 'I ordered the wrong items', 116, 1635874122),
(29, '1635939825863187', 187, 82, 'I choose a wrong delivery address', 556, 1635939844),
(30, '1635960445271189', 189, 112, 'Other reasons', 58.4, 1635960401),
(31, '1636088010260107', 107, 76, 'I choose a wrong delivery address', 602, 1636088027),
(32, '1636088056891107', 107, 108, 'I ordered the wrong items', 71, 1636088076),
(33, '1636114265545107', 107, 85, 'I forgot to apply coupon', 109, 1636114318),
(34, '1636136946458107', 107, 115, 'I ordered the wrong items', 114, 1636136963),
(35, '1636185628507194', 194, 85, 'I choose a wrong delivery address', 99, 1636185639),
(36, '1636213941390201', 201, 80, 'Other reasons', 116, 1636213955),
(37, '1636464590465206', 206, 83, 'I choose a wrong delivery address', 3293.7, 1636464603),
(38, '1636604120591211', 211, 82, 'I choose a wrong delivery address', 4150, 1636609060),
(39, '1636713956344107', 107, 82, 'I ordered the wrong items', 622, 1636713975),
(40, '1637017346452107', 107, 121, 'I changed my mind', 66, 1637017363),
(41, '1639125511211136', 136, 75, 'I ordered the wrong items', 476.62, 1639125222),
(42, '1639573643321231', 231, 147, 'I choose a wrong delivery address', 0, 1639573369),
(43, '1642752188374258', 258, 156, 'Other reasons', 120, 1642752260),
(44, '1645523435987255', 255, 159, 'I choose a wrong delivery address', 450, 1645523449),
(45, '1645529561707255', 255, 159, 'I choose a wrong delivery address', 90, 1645529656),
(46, '1645779212465255', 255, 159, 'I choose a wrong delivery address', 0, 1645779222),
(47, '1646486464177251', 251, 159, 'I choose a wrong delivery address', 80, 1646486443),
(48, '1646486974524251', 251, 159, 'I choose a wrong delivery address', 80, 1646486953),
(49, '1646672926996275', 275, 159, 'I forgot to apply coupon', 60, 1646672935),
(50, '1646758329657297', 297, 185, 'I choose a wrong delivery address', 228, 1646758341),
(51, '1646819904970275', 275, 156, 'I forgot to apply coupon', 90, 1646819918),
(52, '1646833668149308', 308, 156, 'I choose a wrong delivery address', 90, 1646833684),
(53, '1646839252141289', 289, 159, 'I choose a wrong delivery address', 260, 1646839262),
(54, '1646891412302312', 312, 164, 'I choose a wrong delivery address', 88, 1646891429),
(55, '1646990711397329', 329, 185, 'I choose a wrong delivery address', 250.78, 1646990735),
(56, '1647016452352337', 337, 185, 'I forgot to apply coupon', 222.78, 1647016176),
(57, '1647028762139337', 337, 185, 'I ordered the wrong items', 415.64, 1647028460),
(58, '1647152269215294', 294, 163, 'I choose a wrong delivery address', 89.4, 1647152285),
(59, '1647167228796353', 353, 200, 'I ordered the wrong items', 144.32, 1647167266),
(60, '1647242608580255', 255, 185, 'I choose a wrong delivery address', 170.52, 1647242623),
(61, '1647258892354368', 368, 185, 'I forgot to apply coupon', 170.52, 1647258911),
(62, '1647267601902371', 371, 172, 'I changed my mind', 148.6, 1647267617),
(63, '1647269349484251', 251, 159, 'I choose a wrong delivery address', 170, 1647269358),
(64, '1647270900957251', 251, 159, 'I forgot to apply coupon', 190, 1647270914),
(65, '1647271424820359', 359, 164, 'I ordered the wrong items', 188, 1647271455),
(66, '1647280569793251', 251, 159, 'I choose a wrong delivery address', 190, 1647280583),
(67, '1647320832749294', 294, 200, 'I choose a wrong delivery address', 138.64, 1647320840),
(68, '1647320874576294', 294, 163, 'I choose a wrong delivery address', 193.2, 1647320881),
(69, '1647348069747275', 275, 172, 'I ordered the wrong items', 207.9, 1647348080),
(70, '1647366478650323', 323, 200, 'I changed my mind', 217.28, 1647366514),
(71, '1647450068782377', 377, 200, 'I choose a wrong delivery address', 218.64, 1647450086),
(72, '1647456046467361', 361, 200, 'I changed my mind', 154.9, 1647456069),
(73, '1647513449412407', 407, 187, 'I changed my mind', 697, 1647513476),
(74, '1647554374254343', 343, 164, 'I ordered the wrong items', 726, 1647554401),
(75, '1647657845772401', 401, 164, 'I changed my mind', 302, 1647657871),
(76, '1647743218283435', 435, 200, 'I choose a wrong delivery address', 108.64, 1647743234),
(77, '1647752510637436', 436, 185, 'Other reasons', 144.28, 1647752525),
(78, '1647847684057371', 371, 156, 'I choose a wrong delivery address', 260, 1647847696),
(79, '1647864431634276', 276, 159, 'I changed my mind', 0, 1647864471),
(80, '1647951090536464', 464, 159, 'I choose a wrong delivery address', 270, 1647951107),
(81, '1648087332971472', 472, 156, 'Other reasons', 200, 1648087355),
(82, '1648124015076418', 418, 164, 'I choose a wrong delivery address', 158, 1648124030),
(83, '1648457658972477', 477, 164, 'I choose a wrong delivery address', 4266, 1648457666),
(84, '1648660664702525', 525, 172, 'I ordered the wrong items', 273.5, 1648660685),
(85, '1648708791669514', 514, 159, 'I choose a wrong delivery address', 115, 1648708827),
(86, '1648709344064459', 459, 164, 'I choose a wrong delivery address', 137, 1648709354),
(87, '1648725969522533', 533, 156, 'I ordered the wrong items', 240, 1648725989),
(88, '1648733651872529', 529, 200, 'Other reasons', 128.64, 1648733720),
(89, '1648747340349529', 529, 156, 'I changed my mind', 161, 1648747359),
(90, '1648817576371514', 514, 200, 'I choose a wrong delivery address', 128.64, 1648817592),
(91, '1648888147347537', 537, 164, 'I ordered the wrong items', 268, 1648888186),
(92, '1648898923057300', 300, 200, 'Other reasons', 129.2, 1648898940),
(93, '1649015669418551', 551, 185, 'Other reasons', 316, 1649015691),
(94, '1649032566394540', 540, 159, 'I choose a wrong delivery address', 180, 1649032587),
(95, '1649058384380554', 554, 165, 'I choose a wrong delivery address', 1086, 1649058398),
(96, '1649058929309554', 554, 159, 'I choose a wrong delivery address', 1060, 1649058941),
(97, '1649067589785529', 529, 185, 'I ordered the wrong items', 161.52, 1649067647),
(98, '1649157199470560', 560, 159, 'I ordered the wrong items', 880, 1649157219),
(99, '1649206618025529', 529, 172, 'I ordered the wrong items', 199, 1649206696),
(100, '1649390585355595', 595, 185, 'I changed my mind', 144, 1649390614),
(101, '1649456186175598', 598, 163, 'I ordered the wrong items', 128.7, 1649456198),
(102, '1649456278294598', 598, 163, 'I choose a wrong delivery address', 128.7, 1649456290),
(103, '1649536177264300', 300, 163, 'I choose a wrong delivery address', 192.3, 1649536189),
(104, '1649588432971603', 603, 200, 'I ordered the wrong items', 878, 1649588448),
(105, '1649599719752603', 603, 200, 'Other reasons', 162.96, 1649599739),
(106, '1649737774129603', 603, 159, 'I choose a wrong delivery address', 1080, 1649737786),
(107, '1649773426129619', 619, 156, 'I forgot to apply coupon', 580, 1649773443),
(108, '1649773475183619', 619, 159, 'I choose a wrong delivery address', 580, 1649773490),
(109, '1649980024055646', 646, 156, 'I ordered the wrong items', 110, 1649980062),
(110, '1649994367157377', 377, 200, 'I choose a wrong delivery address', 84.32, 1649994381),
(111, '1650024361164377', 377, 200, 'I choose a wrong delivery address', 84.32, 1650024372),
(112, '1650181930485436', 436, 163, 'I choose a wrong delivery address', 1217, 1650181940),
(113, '1650360574903670', 670, 185, 'I choose a wrong delivery address', 85.26, 1650360589),
(114, '1650362805455500', 500, 159, 'I choose a wrong delivery address', 2750, 1650362821),
(115, '1650522271459676', 676, 159, 'I ordered the wrong items', 680, 1650522290),
(116, '1650732588839657', 657, 185, 'I forgot to apply coupon', 227.06, 1650732610);

-- --------------------------------------------------------

--
-- Table structure for table `car_type`
--

CREATE TABLE `car_type` (
  `car_type_id` int(11) NOT NULL,
  `car_type` varchar(70) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `base_fare` double NOT NULL,
  `minimum_fare` double NOT NULL,
  `distance` double NOT NULL,
  `right_minute` double NOT NULL,
  `convenience_fees` double NOT NULL,
  `cancelation_fees` double NOT NULL,
  `image` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `car_type`
--

INSERT INTO `car_type` (`car_type_id`, `car_type`, `base_fare`, `minimum_fare`, `distance`, `right_minute`, `convenience_fees`, `cancelation_fees`, `image`) VALUES
(1, 'seden', 150, 150, 1000, 10, 20, 30, 'car_type_1.png');

-- --------------------------------------------------------

--
-- Table structure for table `categories_wise_offer`
--

CREATE TABLE `categories_wise_offer` (
  `categories_wise_offer_id` int(11) NOT NULL,
  `offer` int(100) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `short_description` varchar(500) NOT NULL,
  `image` varchar(250) NOT NULL,
  `date` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories_wise_offer`
--

INSERT INTO `categories_wise_offer` (`categories_wise_offer_id`, `offer`, `categoryid`, `title`, `short_description`, `image`, `date`) VALUES
(4, 30, 64, 'Vegetables & Fruits', ' Vegetables, Fruits, Vegetables & Fruits Cleaners', 'categories_wise_offer_4.png', '1615274728'),
(3, 20, 61, 'Biscuits, Snacks & Chocolates', 'Best offers, Chocolates, Biscuits & Cookies, Namkeen & Snacks, Chips & Crips, Sweets', 'categories_wise_offer_3.png', '1615272738');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` longtext,
  `banner` longtext,
  `data_vendors` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `categoryads`
--

CREATE TABLE `categoryads` (
  `categoryads_id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `image` varchar(30) DEFAULT NULL,
  `date` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categoryads`
--

INSERT INTO `categoryads` (`categoryads_id`, `category`, `image`, `date`) VALUES
(2, 31, 'categoryads_2.jpg', '1611764448');

-- --------------------------------------------------------

--
-- Table structure for table `cin_history`
--

CREATE TABLE `cin_history` (
  `cin_history_id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `cash_collected` int(50) NOT NULL,
  `collected_time` int(50) NOT NULL,
  `type` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cin_history`
--

INSERT INTO `cin_history` (`cin_history_id`, `driver_id`, `cash_collected`, `collected_time`, `type`) VALUES
(26, 50, 271, 1646393376, 'driver'),
(27, 50, 190, 1646633847, 'driver'),
(28, 50, 545, 1646831674, 'driver'),
(29, 50, 290, 1646980266, 'driver'),
(30, 50, 90, 1647177134, 'driver'),
(31, 50, 581, 1647230877, 'driver'),
(32, 50, 144, 1647241326, 'driver'),
(33, 50, 1406, 1647345212, 'driver'),
(34, 50, 290, 1647360005, 'driver'),
(35, 50, 502, 1647549798, 'driver'),
(36, 85, 490, 1648417482, 'driver'),
(37, 50, 665, 1649159929, 'driver'),
(38, 85, 144, 1649254314, 'driver'),
(39, 50, 159, 1649324263, 'driver'),
(40, 50, 180, 1649623898, 'driver'),
(41, 103, 1540, 1650267275, 'driver'),
(42, 103, 80, 1650267991, 'driver'),
(43, 103, 815, 1650268841, 'driver'),
(44, 84, 354, 1650606905, 'driver'),
(45, 50, 186, 1650707713, 'driver');

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('95ajncmckevfhcpt717ient3kq42h20e', '::1', 1560855574, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536303834383632303b63757272656e63797c733a313a2231223b636f6d706172657c733a323a225b5d223b757365725f6c6f67696e7c733a333a22796573223b757365725f69647c733a323a223234223b757365725f6e616d657c733a313a2248223b636f75706f6e65727c733a303a22223b),
('9armo3vkgq8rjmo9gtaalpvkf86rtg29', '::1', 1560856272, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536303835303834303b6c6f67696e7c733a333a22796573223b61646d696e5f6c6f67696e7c733a333a22796573223b61646d696e5f69647c733a313a2231223b61646d696e5f6e616d657c733a31363a224d722e204d61737465722041646d696e223b7469746c657c733a353a2261646d696e223b63757272656e63797c733a313a2231223b);

-- --------------------------------------------------------

--
-- Table structure for table `color`
--

CREATE TABLE `color` (
  `color_id` int(200) NOT NULL,
  `code` varchar(200) NOT NULL,
  `color_name` varchar(200) NOT NULL,
  `form_id` longtext,
  `vendor_id` longtext
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `color`
--

INSERT INTO `color` (`color_id`, `code`, `color_name`, `form_id`, `vendor_id`) VALUES
(3, 'EFDECD', 'Almond', '[2448]', '[115]'),
(4, '00FFFF', 'Aqua Blue', '[]', '[]'),
(5, '800020', 'burgundy', '[]', '[]'),
(6, '8EC5B0', 'Caribbean Blue', '[]', '[]'),
(7, '008080', 'Teal', '[]', '[]'),
(8, 'FFB7C5', 'Cherry blossom', '[]', '[]'),
(9, 'FFFACD', 'Lemon Chiffon', '[]', '[]'),
(10, 'B87333', 'Copper', '[2448]', '[114]'),
(11, 'FF7F50', 'Coral', '[]', '[]'),
(12, 'FF00FF', 'Fuchsia', '[]', '[]'),
(13, '50c878', 'Emerald', '[]', '[]'),
(14, '00FF00', 'Lime', '[]', '[]'),
(15, 'D8BFD8', 'Thistle', '[]', '[]'),
(16, 'DC143C', 'Crimson', '[]', '[]'),
(17, 'E5C7BC', 'Popsicle', '[]', '[]'),
(18, 'F5F5DC', 'Beige', '[]', '[]'),
(19, '000000', 'Black', '[2517,2622,2623]', '[114]'),
(20, 'D2691E', 'Chocolate', '[]', '[]'),
(21, '36454F', 'Charcoal', '[]', '[]'),
(22, '00FF00', 'Blue', '[2517]', '[114]'),
(23, 'DDA0DD', 'Plum', '[]', '[]'),
(24, '5F9EA0', 'Cadet', '[]', '[]'),
(25, 'DA70D6', 'Orchid', '[]', '[]'),
(26, 'A52A2A', 'Brown', '[]', '[]'),
(27, 'FFD700', 'Gold', '[]', '[]'),
(28, '008000', 'Green', '[2448,2503]', '[114]'),
(29, 'F0E68C', 'Khaki', '[]', '[]'),
(30, '800000', 'Maroon', '[]', '[]'),
(31, '000080', 'Navy', '[]', '[]'),
(32, 'FFA500', 'Orange', '[2448]', '[114]'),
(33, '808000', 'Olive', '[]', '[]'),
(34, 'FFC0CB', 'Pink', '[2448]', '[114]'),
(35, '800080', 'Purple', '[]', '[]'),
(36, 'FF0000', 'Red', '[2448,2515,1695,2517]', '[114]'),
(37, 'C0C0C0', 'Silver', '[]', '[]'),
(38, '87CEEB', 'Sky blue', '[]', '[]'),
(39, 'D2B48C', 'Tan', '[]', '[]'),
(40, '40E0D0', 'Turquoise', '[]', '[]'),
(41, 'FFFFFF', 'White', '[]', '[]'),
(42, 'FFFF00', 'Yellow', '[2448]', '[114]'),
(43, 'FFFFF0', 'Ivory', '[]', '[]'),
(44, 'FFE4E1', 'Lavender blush', '[]', '[]'),
(45, 'FFDAB9', 'Peach Puff', '[]', '[]'),
(46, '808080', 'Gray', '[]', '[]'),
(47, 'B7410E', 'Rust', '[]', '[]'),
(48, 'B22222', 'Firebrick', '[]', '[]'),
(49, 'FFDB58', 'mustard', '[]', '[]'),
(50, 'EE82EE', 'Violet', '[2448]', '[114]'),
(51, '5B6065', 'Gun metal', '[]', '[]'),
(52, 'FFEFD5', 'Papaya Whip', '[]', '[]');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comments_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ratings` varchar(20) DEFAULT NULL,
  `comments` longtext CHARACTER SET utf8,
  `date` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comments_id`, `product_id`, `user_id`, `ratings`, `comments`, `date`) VALUES
(39, 237, 30, '4.5', 'bdnd', '1607084549'),
(38, 236, 30, '5', 'very good product', '1607083175'),
(37, 238, 30, '2', 'very good product', '1607080274'),
(36, 238, 28, '5', 'this is product very good', '1607079586'),
(35, 231, 36, '5', 'rajd', '1607078149'),
(34, 241, 28, '3.5', 'hdhdj', '1607009791'),
(33, 228, 28, '5', 'bhdhdn', '1607009624'),
(40, 235, 30, '5', 'vgh', '1607084750'),
(41, 243, 46, '3.5', 'bxbx', '1607332985'),
(42, 612, 72, '5', 'worth buying this product\ngreat installation with trained executive great service', '1611155589'),
(43, 481, 46, '4', 'hhfd', '1611643717'),
(44, 286, 86, '3', 'bxbxnd', '1611818263'),
(45, 288, 86, '4', 'bxnxkx', '1611818296');

-- --------------------------------------------------------

--
-- Table structure for table `coupon`
--

CREATE TABLE `coupon` (
  `coupon_id` int(11) NOT NULL,
  `code` varchar(30) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `couponType` varchar(20) NOT NULL,
  `zone_id` int(10) DEFAULT NULL,
  `shop_id` int(10) DEFAULT NULL,
  `discountType` varchar(10) DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `minimumPurchasedAmount` double NOT NULL,
  `limitUser` int(11) NOT NULL,
  `maximum_limit` int(11) DEFAULT '0',
  `current_applied` int(11) DEFAULT '0',
  `start_timestamp` varchar(30) DEFAULT NULL,
  `expired_timestamp` varchar(50) DEFAULT NULL,
  `terms` longtext NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `added_by` varchar(300) DEFAULT NULL,
  `added_id` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `coupon`
--

INSERT INTO `coupon` (`coupon_id`, `code`, `title`, `couponType`, `zone_id`, `shop_id`, `discountType`, `discount`, `minimumPurchasedAmount`, `limitUser`, `maximum_limit`, `current_applied`, `start_timestamp`, `expired_timestamp`, `terms`, `status`, `image`, `added_by`, `added_id`) VALUES
(35, '1234', 'Super Offer', '4', 93, NULL, 'amount', NULL, 100, 100, 10, 3, '1649635200', '1649808000', 'Minimum purchase amount 100', NULL, 'coupon_35.png', 'admin', 'null'),
(36, 'A123', 'Super Free Delivery', '4', 93, NULL, 'amount', NULL, 100, 100, 10, 1, '1649721600', '1649721600', 'Free Deluvery', NULL, 'coupon_36.png', 'admin', 'null'),
(37, 'A432', 'Deepavali ', '1', 93, NULL, 'amount', 100, 1000, 100, 100, 2, '1649721600', '1659225600', 'You need to purchase minimum 1000', NULL, 'coupon_37.png', 'admin', 'null'),
(38, 'Welcome2022', 'Welcome Offer', '3', 93, NULL, 'amount', 100, 150, 1, 1, 1, '1649808000', '1649980800', '10', NULL, 'coupon_38.png', 'admin', 'null');

-- --------------------------------------------------------

--
-- Table structure for table `currency_method`
--

CREATE TABLE `currency_method` (
  `currency_method_id` int(30) NOT NULL,
  `currency_symbol` varchar(30) CHARACTER SET utf8 NOT NULL,
  `currency_name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `country` varchar(100) CHARACTER SET utf8 NOT NULL,
  `image` varchar(15) DEFAULT NULL,
  `date` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `currency_method`
--

INSERT INTO `currency_method` (`currency_method_id`, `currency_symbol`, `currency_name`, `country`, `image`, `date`) VALUES
(28, 'Rupee', '₹', 'India', 'currency_28.png', '1646749241'),
(27, 'Rp', 'Rupiah', 'indonesia', 'currency_27.png', '1646736762'),
(29, 'R$', 'Real Brasileiro', 'BR', 'currency_29.png', '1646873047'),
(30, 'Q', 'Quetzales', 'Guatemala', 'currency_30.png', '1647295697'),
(31, 'Q', 'Quetzales', 'Guatemala', 'currency_31.png', '1647296050'),
(32, '₦', 'Naira', 'Nigeria', 'currency_32.png', '1647296617'),
(33, 'Naira', '₦', 'Nigeria', 'currency_33.png', '1647296756'),
(34, 'MAD', 'Morocco dirham', 'morocco', 'currency_34.png', '1647512654'),
(35, 'Euro', '€', 'Kosova', 'currency_35.png', '1647637069'),
(36, 'EGP', 'EG', 'Egypt', 'currency_36.png', '1647727550'),
(37, 'Jordanian Dinar', 'JOD', 'JOD', 'currency_37.png', '1647765697'),
(38, 'Taka', 'Tk', 'Bangladesh', 'currency_38.png', '1647766675'),
(39, 'USD', '$', 'United State', 'currency_39.png', '1647911356'),
(40, 'Kenya Shillings', 'KSH', 'Kenya', 'currency_40.png', '1647951651'),
(41, 'le', 'sierra leone leone', 'sierra leone', 'currency_41.png', '1647967859'),
(42, 'S/.', 'SOL', 'PERU', 'currency_42.png', '1648432452'),
(43, 'Tsh', 'Tanzania Shillings', 'Tanzania', 'currency_43.png', '1648890831'),
(44, 'RS', 'pkr', 'Pakistan', 'currency_44.png', '1649117012'),
(45, '$', 'DOP', 'Dominican Republic ', 'currency_45.png', '1649535758'),
(46, '$', 'COP', 'Colombia', 'currency_46.png', '1649870073'),
(47, 'PKR', 'Pakistani Rupee', 'Pakistan', 'currency_47.png', '1650121900'),
(48, '€', 'Euro', 'España', 'currency_48.png', '1650564212');

-- --------------------------------------------------------

--
-- Table structure for table `deliverytimeslot`
--

CREATE TABLE `deliverytimeslot` (
  `deliverytimeslot_id` int(11) NOT NULL,
  `fromTime` varchar(15) NOT NULL,
  `toTime` varchar(15) NOT NULL,
  `time_id` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `date` int(30) DEFAULT NULL,
  `vendor` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `deliverytimeslot`
--

INSERT INTO `deliverytimeslot` (`deliverytimeslot_id`, `fromTime`, `toTime`, `time_id`, `status`, `date`, `vendor`) VALUES
(26, '4:52 PM', '8:25 PM', 16, 'ok', 1624188948, 34),
(27, '5:14 PM', '5:14 PM', 17, 'ok', 1624189468, 34),
(28, '5:30 PM', '5:30 PM', 17, 'ok', 1624190414, 34),
(29, '8:30 PM', '7:30 PM', 17, 'ok', 1624190435, 34),
(30, '9:47 PM', '9:47 PM', 21, 'ok', 1624897075, 38),
(36, '1:42 PM', '7:42 PM', 13, 'ok', 1625386338, 41),
(33, '9:00 AM', '9:00 PM', 21, 'success', 1625132295, 41),
(37, '1:43 PM', '6:43 PM', 13, 'ok', 1625386394, 41),
(38, '2:47 PM', '7:47 PM', 14, 'ok', 1625390281, 41),
(39, '9:00 AM', '9:00 PM', 21, 'success', 1625414411, 0),
(40, '9:00 AM', '9:00 PM', 21, 'success', 1625414414, 42),
(41, '9:00 AM', '9:00 PM', 21, 'success', 1625679091, 0),
(42, '9:00 AM', '9:00 PM', 21, 'success', 1625679094, 43),
(43, '9:00 AM', '9:00 PM', 21, 'success', 1625820722, 0),
(44, '9:00 AM', '9:00 PM', 21, 'success', 1625820725, 44),
(45, '9:10 PM', '8:11 PM', 21, 'ok', 1625845264, 43),
(46, '9:00 AM', '9:00 PM', 21, 'success', 1625845392, 45),
(47, '9:00 AM', '9:00 PM', 21, 'success', 1625846333, 46),
(49, '10:05 PM', '6:05 PM', 22, 'ok', 1625848532, 43),
(50, '9:00 AM', '9:00 PM', 21, 'success', 1625912408, 47),
(51, '9:00 AM', '9:00 PM', 21, 'success', 1625915425, 48),
(52, '9:00 AM', '9:00 PM', 21, 'success', 1625919278, 49),
(53, '9:00 AM', '9:00 PM', 21, 'success', 1625919340, 50),
(54, '9:00 AM', '9:00 PM', 21, 'success', 1625930081, 51),
(55, '9:00 AM', '9:00 PM', 21, 'success', 1625980308, 52),
(56, '9:00 AM', '9:00 PM', 21, 'success', 1625982537, 53),
(57, '9:00 AM', '9:00 PM', 21, 'success', 1626066638, 54),
(58, '9:00 AM', '9:00 PM', 21, 'success', 1626071746, 55),
(59, '9:00 AM', '9:00 PM', 21, 'success', 1626155173, 56),
(60, '9:00 AM', '9:00 PM', 21, 'success', 1626160823, 57),
(61, '9:00 AM', '9:00 PM', 21, 'success', 1629043540, 0),
(62, '9:00 AM', '9:00 PM', 21, 'success', 1629043542, 59),
(63, '9:00 AM', '9:00 PM', 21, 'success', 1632610504, 0),
(64, '9:00 AM', '9:00 PM', 21, 'success', 1632610506, 0),
(65, '9:00 AM', '9:00 PM', 21, 'success', 1632610669, 0),
(66, '9:00 AM', '9:00 PM', 21, 'success', 1632610671, 0),
(67, '9:00 AM', '9:00 PM', 21, 'success', 1632610853, 0),
(68, '9:00 AM', '9:00 PM', 21, 'success', 1632610855, 0),
(69, '9:00 AM', '9:00 PM', 21, 'success', 1632610969, 0),
(70, '9:00 AM', '9:00 PM', 21, 'success', 1632610971, 0),
(71, '9:00 AM', '9:00 PM', 21, 'success', 1632611025, 0),
(72, '9:00 AM', '9:00 PM', 21, 'success', 1632611027, 0),
(73, '9:00 AM', '9:00 PM', 21, 'success', 1632611132, 0),
(74, '9:00 AM', '9:00 PM', 21, 'success', 1632611225, 0),
(75, '9:00 AM', '9:00 PM', 21, 'success', 1632611227, 0),
(76, '9:00 AM', '9:00 PM', 21, 'success', 1632611272, 0),
(77, '9:00 AM', '9:00 PM', 21, 'success', 1632611357, 0),
(78, '9:00 AM', '9:00 PM', 21, 'success', 1632611360, 0),
(79, '9:00 AM', '9:00 PM', 21, 'success', 1632611475, 0),
(80, '9:00 AM', '9:00 PM', 21, 'success', 1632611478, 60),
(81, '9:00 AM', '9:00 PM', 21, 'success', 1632741891, 0),
(82, '9:00 AM', '9:00 PM', 21, 'success', 1632741893, 61),
(83, '9:00 AM', '9:00 PM', 21, 'success', 1632773185, 62),
(84, '9:00 AM', '9:00 PM', 21, 'success', 1632901002, 0),
(85, '9:00 AM', '9:00 PM', 21, 'success', 1632901005, 63),
(86, '9:00 AM', '9:00 PM', 21, 'success', 1632935077, 0),
(87, '9:00 AM', '9:00 PM', 21, 'success', 1632935079, 64),
(88, '9:00 AM', '9:00 PM', 21, 'success', 1632946783, 0),
(89, '9:00 AM', '9:00 PM', 21, 'success', 1632946785, 65),
(90, '9:00 AM', '9:00 PM', 21, 'success', 1633000177, 0),
(91, '9:00 AM', '9:00 PM', 21, 'success', 1633000188, 0),
(92, '9:00 AM', '9:00 PM', 21, 'success', 1633000191, 66),
(93, '9:00 AM', '9:00 PM', 21, 'success', 1633139773, 0),
(94, '9:00 AM', '9:00 PM', 21, 'success', 1633139775, 67),
(95, '9:00 AM', '9:00 PM', 21, 'success', 1633212890, 0),
(96, '9:00 AM', '9:00 PM', 21, 'success', 1633212892, 68),
(97, '9:00 AM', '9:00 PM', 21, 'success', 1633217399, 0),
(98, '9:00 AM', '9:00 PM', 21, 'success', 1633217431, 0),
(99, '9:00 AM', '9:00 PM', 21, 'success', 1633217458, 0),
(100, '9:00 AM', '9:00 PM', 21, 'success', 1633217476, 0),
(101, '9:00 AM', '9:00 PM', 21, 'success', 1633217478, 69),
(102, '4:02 PM', '6:02 PM', 16, 'ok', 1633220024, 69),
(103, '9:00 AM', '9:00 PM', 21, 'success', 1633221266, 0),
(104, '9:00 AM', '9:00 PM', 21, 'success', 1633221268, 70),
(105, '9:00 AM', '9:00 PM', 21, 'success', 1633225986, 0),
(106, '9:00 AM', '9:00 PM', 21, 'success', 1633225988, 71),
(107, '9:00 AM', '9:00 PM', 21, 'success', 1633276056, 0),
(108, '9:00 AM', '9:00 PM', 21, 'success', 1633276057, 72),
(109, '9:00 AM', '9:00 PM', 21, 'success', 1633276108, 0),
(110, '9:00 AM', '9:00 PM', 21, 'success', 1633276172, 0),
(111, '9:00 AM', '9:00 PM', 21, 'success', 1633276172, 73),
(112, '12:12 PM', '6:55 PM', 22, 'ok', 1633279382, 73),
(113, '9:00 AM', '9:00 PM', 21, 'success', 1633305100, 0),
(114, '9:00 AM', '9:00 PM', 21, 'success', 1633344126, 74),
(115, '9:00 AM', '9:00 PM', 21, 'success', 1633362738, 0),
(116, '9:00 AM', '9:00 PM', 21, 'success', 1633362738, 75),
(117, '9:00 AM', '9:00 PM', 21, 'success', 1633367803, 0),
(212, '9:00 AM', '9:00 PM', 21, 'success', 1636035060, 122),
(119, '9:00 AM', '9:00 PM', 21, 'success', 1633369069, 0),
(120, '9:00 AM', '9:00 PM', 21, 'success', 1633369128, 0),
(121, '9:00 AM', '9:00 PM', 21, 'success', 1633369129, 77),
(122, '9:00 AM', '9:00 PM', 21, 'success', 1633369475, 0),
(123, '9:00 AM', '9:00 PM', 21, 'success', 1633369475, 78),
(124, '9:00 AM', '9:00 PM', 21, 'success', 1633370176, 0),
(125, '9:00 AM', '9:00 PM', 21, 'success', 1633370176, 79),
(126, '9:00 AM', '9:00 PM', 21, 'success', 1633370345, 0),
(127, '9:00 AM', '9:00 PM', 21, 'success', 1633370345, 80),
(128, '9:00 AM', '9:00 PM', 21, 'success', 1633371057, 0),
(129, '9:00 AM', '9:00 PM', 21, 'success', 1633371057, 81),
(130, '9:00 AM', '9:00 PM', 21, 'success', 1633371680, 0),
(131, '9:00 AM', '9:00 PM', 21, 'success', 1633371680, 82),
(132, '9:00 AM', '9:00 PM', 21, 'success', 1633372692, 0),
(133, '9:00 AM', '9:00 PM', 21, 'success', 1633372693, 83),
(134, '9:00 AM', '9:00 PM', 21, 'success', 1633504901, 0),
(135, '9:00 AM', '9:00 PM', 21, 'success', 1633504901, 84),
(136, '9:00 AM', '9:00 PM', 21, 'success', 1633515095, 0),
(150, '2:00 PM', '4:00 PM', 10, 'ok', 1633581250, 85),
(138, '9:00 AM', '9:00 PM', 21, 'success', 1633521582, 86),
(139, '9:00 AM', '9:00 PM', 21, 'success', 1633530064, 0),
(140, '9:00 AM', '9:00 PM', 21, 'success', 1633530425, 0),
(141, '9:00 AM', '9:00 PM', 21, 'success', 1633532950, 87),
(142, '9:00 AM', '9:00 PM', 21, 'success', 1633534907, 88),
(143, '9:00 AM', '9:00 PM', 21, 'success', 1633541523, 89),
(146, '7:49 PM', '11:49 AM', 23, 'ok', 1633544387, 90),
(145, '12:00 AM', '12:00 PM', 23, 'ok', 1633543827, 90),
(147, '2:16 PM', '10:16 PM', 24, 'ok', 1633562196, 75),
(148, '9:00 AM', '9:00 PM', 21, 'success', 1633574176, 91),
(149, '10:00 AM', '12:00 PM', 10, 'ok', 1633581203, 85),
(151, '6:00 PM', '4:00 PM', 10, 'ok', 1633581266, 85),
(152, '9:00 AM', '9:00 PM', 21, 'success', 1634455929, 0),
(153, '9:00 AM', '9:00 PM', 21, 'success', 1634455932, 92),
(154, '9:00 AM', '9:00 PM', 21, 'success', 1634468486, 0),
(155, '9:00 AM', '9:00 PM', 21, 'success', 1634468488, 93),
(156, '9:00 AM', '9:00 PM', 21, 'success', 1634543561, 0),
(157, '9:00 AM', '9:00 PM', 21, 'success', 1634543563, 94),
(158, '9:00 AM', '9:00 PM', 21, 'success', 1634565768, 0),
(159, '9:00 AM', '9:00 PM', 21, 'success', 1634565770, 95),
(160, '9:00 AM', '9:00 PM', 21, 'success', 1634593782, 0),
(161, '9:00 AM', '9:00 PM', 21, 'success', 1634593784, 96),
(162, '9:00 AM', '9:00 PM', 21, 'success', 1635340013, 0),
(163, '9:00 AM', '9:00 PM', 21, 'success', 1635340015, 0),
(164, '9:00 AM', '9:00 PM', 21, 'success', 1635340153, 0),
(165, '9:00 AM', '9:00 PM', 21, 'success', 1635340155, 97),
(166, '9:00 AM', '9:00 PM', 21, 'success', 1635391582, 98),
(167, '9:00 AM', '9:00 PM', 21, 'success', 1635489041, 0),
(168, '9:00 AM', '9:00 PM', 21, 'success', 1635489043, 99),
(169, '9:00 AM', '9:00 PM', 21, 'success', 1635532207, 0),
(170, '9:00 AM', '9:00 PM', 21, 'success', 1635532209, 100),
(171, '9:00 AM', '9:00 PM', 21, 'success', 1635548007, 0),
(172, '9:00 AM', '9:00 PM', 21, 'success', 1635548010, 101),
(173, '9:00 AM', '9:00 PM', 21, 'success', 1635550308, 0),
(174, '9:00 AM', '9:00 PM', 21, 'success', 1635550310, 102),
(175, '9:00 AM', '9:00 PM', 21, 'success', 1635608860, 103),
(176, '9:00 AM', '9:00 PM', 21, 'success', 1635614612, 104),
(177, '9:00 AM', '9:00 PM', 21, 'success', 1635755659, 0),
(178, '9:00 AM', '9:00 PM', 21, 'success', 1635786515, 0),
(179, '9:00 AM', '9:00 PM', 21, 'success', 1635837853, 0),
(180, '9:00 AM', '9:00 PM', 21, 'success', 1635838508, 0),
(181, '9:00 AM', '9:00 PM', 21, 'success', 1635852642, 105),
(182, '9:00 AM', '9:00 PM', 21, 'success', 1635856914, 106),
(183, '9:00 AM', '9:00 PM', 21, 'success', 1635859977, 107),
(184, '9:00 AM', '9:00 PM', 21, 'success', 1635860326, 108),
(185, '9:00 AM', '9:00 PM', 21, 'success', 1635861202, 109),
(195, '11:00 AM', '11:00 PM', 22, 'ok', 1635871742, 111),
(192, '11:59 AM', '11:59 PM', 22, 'ok', 1635871085, 110),
(194, '5:00 PM', '5:00 AM', 22, 'ok', 1635871524, 111),
(196, '9:00 AM', '9:00 PM', 21, 'success', 1635872196, 0),
(203, '12:00 PM', '3:00 PM', 12, 'ok', 1635928045, 112),
(198, '9:00 AM', '9:00 PM', 21, 'success', 1635887631, 113),
(199, '9:00 AM', '9:00 PM', 21, 'success', 1635894241, 114),
(200, '9:00 AM', '9:00 PM', 21, 'success', 1635914484, 115),
(201, '9:00 AM', '9:00 PM', 21, 'success', 1635918081, 116),
(202, '9:00 AM', '12:00 PM', 12, 'ok', 1635928020, 112),
(204, '3:00 PM', '6:00 PM', 12, 'ok', 1635928062, 112),
(205, '9:00 AM', '9:00 PM', 21, 'success', 1635938481, 117),
(206, '9:00 AM', '9:00 PM', 21, 'success', 1635944401, 118),
(207, '9:00 AM', '9:00 PM', 21, 'success', 1635945320, 0),
(208, '9:00 AM', '9:00 PM', 21, 'success', 1635952036, 119),
(209, '9:00 AM', '9:00 PM', 21, 'success', 1635953000, 120),
(210, '9:00 AM', '9:00 PM', 21, 'success', 1635965644, 121),
(211, '21:00', '0:30', 21, 'ok', 1635996126, 76),
(213, '9:00 AM', '9:00 PM', 21, 'success', 1636039123, 123),
(214, '9:00 AM', '9:00 PM', 21, 'success', 1636043780, 124),
(215, '9:00 AM', '9:00 PM', 21, 'success', 1636096849, 0),
(216, '9:00 AM', '9:00 PM', 21, 'success', 1636096901, 0),
(217, '9:00 AM', '9:00 PM', 21, 'success', 1636097237, 125),
(218, '9:00 AM', '9:00 PM', 21, 'success', 1636193391, 0),
(219, '9:00 AM', '9:00 PM', 21, 'success', 1636193391, 126),
(220, '9:00 AM', '9:00 PM', 21, 'success', 1636288911, 0),
(221, '9:00 AM', '9:00 PM', 21, 'success', 1636288912, 127),
(222, '9:00 AM', '9:00 PM', 21, 'success', 1636308887, 128),
(223, '9:00 AM', '9:00 PM', 21, 'success', 1636309966, 129),
(224, '9:00 AM', '9:00 PM', 21, 'success', 1636362991, 0),
(225, '9:00 AM', '9:00 PM', 21, 'success', 1636363065, 0),
(226, '9:00 AM', '9:00 PM', 21, 'success', 1636382443, 0),
(227, '9:00 AM', '9:00 PM', 21, 'success', 1636382472, 0),
(228, '9:00 AM', '9:00 PM', 21, 'success', 1636382498, 0),
(229, '9:00 AM', '9:00 PM', 21, 'success', 1636382514, 0),
(230, '9:00 AM', '9:00 PM', 21, 'success', 1636433542, 130),
(231, '9:00 AM', '9:00 PM', 21, 'success', 1636436281, 0),
(232, '9:00 AM', '9:00 PM', 21, 'success', 1636436281, 131),
(233, '9:00 AM', '9:00 PM', 21, 'success', 1636544373, 0),
(234, '9:00 AM', '9:00 PM', 21, 'success', 1636565936, 132),
(235, '9:00 AM', '9:00 PM', 21, 'success', 1636698818, 0),
(236, '9:00 AM', '9:00 PM', 21, 'success', 1636748101, 0),
(237, '9:00 AM', '9:00 PM', 21, 'success', 1636748162, 133),
(238, '9:00 AM', '9:00 PM', 21, 'success', 1636823082, 0),
(239, '9:00 AM', '9:00 PM', 21, 'success', 1636823102, 0),
(240, '9:00 AM', '9:00 PM', 21, 'success', 1636823146, 134),
(241, '9:00 AM', '9:00 PM', 21, 'success', 1636874003, 0),
(242, '9:00 AM', '9:00 PM', 21, 'success', 1636874003, 0),
(243, '9:00 AM', '9:00 PM', 21, 'success', 1636880442, 0),
(244, '9:00 AM', '9:00 PM', 21, 'success', 1636880442, 0),
(245, '9:00 AM', '9:00 PM', 21, 'success', 1636980304, 0),
(246, '9:00 AM', '9:00 PM', 21, 'success', 1636980324, 0),
(247, '9:00 AM', '9:00 PM', 21, 'success', 1637017977, 135),
(248, '9:00 AM', '9:00 PM', 21, 'success', 1637059048, 136),
(249, '9:00 AM', '9:00 PM', 21, 'success', 1637072213, 137),
(250, '9:00 AM', '9:00 PM', 21, 'success', 1637316200, 0),
(251, '9:00 AM', '9:00 PM', 21, 'success', 1637316202, 138),
(252, '9:00 AM', '9:00 PM', 21, 'success', 1637722154, 0),
(253, '9:00 AM', '9:00 PM', 21, 'success', 1637722156, 0),
(254, '9:00 AM', '9:00 PM', 21, 'success', 1637722205, 0),
(255, '9:00 AM', '9:00 PM', 21, 'success', 1637722207, 0),
(256, '9:00 AM', '9:00 PM', 21, 'success', 1637722330, 0),
(257, '9:00 AM', '9:00 PM', 21, 'success', 1637722332, 139),
(258, '9:00 AM', '9:00 PM', 21, 'success', 1637943130, 140),
(259, '9:00 AM', '9:00 PM', 21, 'success', 1638783021, 0),
(260, '9:00 AM', '9:00 PM', 21, 'success', 1638783023, 141),
(261, '9:00 AM', '9:00 PM', 21, 'success', 1638787090, 142),
(262, '9:00 AM', '9:00 PM', 21, 'success', 1638929683, 0),
(263, '9:00 AM', '9:00 PM', 21, 'success', 1638929694, 0),
(264, '9:00 AM', '9:00 PM', 21, 'success', 1638929696, 143),
(265, '9:00 AM', '9:00 PM', 21, 'success', 1638931277, 0),
(266, '9:00 AM', '9:00 PM', 21, 'success', 1638931290, 0),
(267, '9:00 AM', '9:00 PM', 21, 'success', 1638931292, 144),
(268, '9:00 AM', '9:00 PM', 21, 'success', 1638937372, 0),
(269, '9:00 AM', '9:00 PM', 21, 'success', 1638937375, 145),
(270, '9:00 AM', '9:00 PM', 21, 'success', 1638938061, 0),
(271, '9:00 AM', '9:00 PM', 21, 'success', 1638938063, 146),
(272, '9:00 AM', '9:00 PM', 21, 'success', 1638952318, 147),
(273, '9:00 AM', '9:00 PM', 21, 'success', 1639565115, 0),
(274, '9:00 AM', '9:00 PM', 21, 'success', 1639565117, 147),
(275, '9:00 AM', '9:00 PM', 21, 'success', 1639626214, 0),
(276, '9:00 AM', '9:00 PM', 21, 'success', 1639626217, 148),
(277, '9:00 AM', '9:00 PM', 21, 'success', 1639657708, 0),
(278, '9:00 AM', '9:00 PM', 21, 'success', 1639657710, 149),
(279, '9:00 AM', '9:00 PM', 21, 'success', 1639730853, 0),
(280, '9:00 AM', '9:00 PM', 21, 'success', 1639730856, 150),
(295, '12:30 PM', '3:30 PM', 22, 'ok', 1641314145, 151),
(282, '9:00 AM', '9:00 PM', 21, 'success', 1641309843, 152),
(283, '9:00 AM', '9:00 PM', 21, 'success', 1641310239, 0),
(284, '9:00 AM', '9:00 PM', 21, 'success', 1641310454, 0),
(285, '9:00 AM', '9:00 PM', 21, 'success', 1641310693, 0),
(286, '9:00 AM', '9:00 PM', 21, 'success', 1641310785, 153),
(287, '9:00 AM', '9:00 PM', 21, 'success', 1641310931, 0),
(288, '9:00 AM', '9:00 PM', 21, 'success', 1641311211, 154),
(289, '9:00 AM', '9:00 PM', 21, 'success', 1641311267, 155),
(290, '9:00 AM', '9:00 PM', 21, 'success', 1641311312, 156),
(291, '9:00 AM', '9:00 PM', 21, 'success', 1641311422, 157),
(292, '9:00 AM', '9:00 PM', 21, 'success', 1641311860, 158),
(402, '9:00 AM', '9:00 PM', 21, 'success', 1648013770, 223),
(294, '8:30 AM', '11:30 AM', 22, 'ok', 1641314112, 151),
(296, '8:00 PM', '11:00 PM', 22, 'ok', 1641314177, 151),
(297, '9:00 AM', '9:00 PM', 21, 'success', 1641377152, 160),
(298, '9:00 AM', '9:00 PM', 21, 'success', 1641378538, 161),
(299, '9:00 AM', '9:00 PM', 21, 'success', 1641408667, 162),
(300, '9:00 AM', '9:00 PM', 21, 'success', 1642401678, 0),
(301, '9:00 AM', '9:00 PM', 21, 'success', 1642401678, 163),
(302, '9:00 AM', '9:00 PM', 21, 'success', 1642404783, 0),
(303, '9:00 AM', '9:00 PM', 21, 'success', 1642404783, 164),
(304, '9:00 AM', '9:00 PM', 21, 'success', 1642415456, 0),
(305, '9:00 AM', '9:00 PM', 21, 'success', 1642415456, 165),
(306, '9:00 AM', '9:00 PM', 21, 'success', 1642418424, 0),
(307, '9:00 AM', '9:00 PM', 21, 'success', 1642418424, 166),
(308, '9:00 AM', '9:00 PM', 21, 'success', 1642421585, 0),
(309, '9:00 AM', '9:00 PM', 21, 'success', 1642421705, 167),
(310, '9:00 AM', '9:00 PM', 21, 'success', 1642474942, 0),
(311, '9:00 AM', '9:00 PM', 21, 'success', 1642474943, 168),
(312, '9:00 AM', '9:00 PM', 21, 'success', 1642484020, 0),
(313, '9:00 AM', '9:00 PM', 21, 'success', 1642484020, 169),
(314, '9:00 AM', '9:00 PM', 21, 'success', 1642487964, 0),
(315, '9:00 AM', '9:00 PM', 21, 'success', 1642487964, 170),
(316, '9:00 AM', '9:00 PM', 21, 'success', 1642491779, 0),
(317, '9:00 AM', '9:00 PM', 21, 'success', 1642491779, 171),
(318, '9:00 AM', '9:00 PM', 21, 'success', 1642493577, 0),
(319, '9:00 AM', '9:00 PM', 21, 'success', 1642493577, 172),
(320, '9:00 AM', '9:00 PM', 21, 'success', 1642494713, 173),
(321, '9:00 AM', '9:00 PM', 21, 'success', 1642584563, 174),
(322, '9:00 AM', '9:00 PM', 21, 'success', 1642586575, 175),
(323, '9:00 AM', '9:00 PM', 21, 'success', 1642600389, 0),
(324, '9:00 AM', '9:00 PM', 21, 'success', 1642836446, 0),
(325, '9:00 AM', '9:00 PM', 21, 'success', 1643133724, 0),
(326, '9:00 AM', '9:00 PM', 21, 'success', 1643556310, 176),
(327, '9:31 AM', '9:31 AM', 9, 'ok', 1643947299, 162),
(328, '9:00 AM', '9:00 PM', 21, 'success', 1644214718, 0),
(329, '9:00 AM', '9:00 PM', 21, 'success', 1644214719, 177),
(330, '9:00 AM', '9:00 PM', 21, 'success', 1644531910, 0),
(331, '9:00 AM', '9:00 PM', 21, 'success', 1644531910, 0),
(332, '9:00 AM', '9:00 PM', 21, 'success', 1644532015, 0),
(333, '9:00 AM', '9:00 PM', 21, 'success', 1644532016, 178),
(334, '9:00 AM', '9:00 PM', 21, 'success', 1645066763, 179),
(335, '9:00 AM', '9:00 PM', 21, 'success', 1645453006, 0),
(336, '9:00 AM', '9:00 PM', 21, 'success', 1645453006, 180),
(337, '9:00 AM', '9:00 PM', 21, 'success', 1645516616, 181),
(338, '9:00 AM', '9:00 PM', 21, 'success', 1645516658, 182),
(339, '9:00 AM', '9:00 PM', 21, 'success', 1645649242, 183),
(340, '9:00 AM', '9:00 PM', 21, 'success', 1645887475, 0),
(341, '9:00 AM', '9:00 PM', 21, 'success', 1645887475, 184),
(343, '9:00 AM', '9:00 PM', 21, 'success', 1646643877, 0),
(344, '9:00 AM', '9:00 PM', 21, 'success', 1646643877, 186),
(433, '9:00 AM', '9:00 PM', 21, 'success', 1649074552, 240),
(346, '9:00 AM', '9:00 PM', 21, 'success', 1646698366, 188),
(350, '9:00 AM', '11:58 PM', 22, 'ok', 1646844994, 189),
(353, '9:00 AM', '9:00 PM', 21, 'success', 1646948463, 191),
(352, '12:02 AM', '11:58 PM', 23, 'ok', 1646848574, 190),
(354, '9:00 AM', '9:00 PM', 21, 'success', 1646985360, 0),
(355, '9:00 AM', '9:00 PM', 21, 'success', 1646985390, 0),
(356, '9:00 AM', '9:00 PM', 21, 'success', 1647020482, 0),
(357, '9:00 AM', '9:00 PM', 21, 'success', 1647020829, 192),
(358, '9:00 AM', '9:00 PM', 21, 'success', 1647076296, 0),
(359, '9:00 AM', '9:00 PM', 21, 'success', 1647076686, 193),
(360, '9:00 AM', '9:00 PM', 21, 'success', 1647097225, 194),
(361, '9:00 AM', '9:00 PM', 21, 'success', 1647097293, 195),
(362, '9:00 AM', '9:00 PM', 21, 'success', 1647099463, 196),
(363, '9:00 AM', '9:00 PM', 21, 'success', 1647109424, 197),
(364, '9:00 AM', '9:00 PM', 21, 'success', 1647113081, 198),
(365, '9:00 AM', '9:00 PM', 21, 'success', 1647154526, 199),
(368, '9:00 AM', '9:00 PM', 21, 'success', 1647166449, 200),
(369, '7:21 PM', '4:21 PM', 19, 'ok', 1647170517, 200),
(370, '9:00 AM', '9:00 PM', 21, 'success', 1647254786, 0),
(371, '9:00 AM', '9:00 PM', 21, 'success', 1647255005, 201),
(372, '9:00 AM', '9:00 PM', 21, 'success', 1647325634, 202),
(373, '9:00 AM', '9:00 PM', 21, 'success', 1647375010, 0),
(374, '9:00 AM', '9:00 PM', 21, 'success', 1647375120, 203),
(375, '9:00 AM', '9:00 PM', 21, 'success', 1647378338, 204),
(376, '9:00 AM', '9:00 PM', 21, 'success', 1647378901, 205),
(377, '9:00 AM', '9:00 PM', 21, 'success', 1647394557, 206),
(378, '9:00 AM', '9:00 PM', 21, 'success', 1647467649, 207),
(380, '9:00 AM', '9:00 PM', 21, 'success', 1647548741, 208),
(399, '9:00 AM', '9:00 PM', 21, 'success', 1647981557, 221),
(384, '9:00 AM', '9:00 PM', 21, 'success', 1647624038, 209),
(385, '9:00 AM', '9:00 PM', 21, 'success', 1647709688, 210),
(386, '9:00 AM', '9:00 PM', 21, 'success', 1647719068, 211),
(387, '9:00 AM', '9:00 PM', 21, 'success', 1647729249, 212),
(388, '9:00 AM', '9:00 PM', 21, 'success', 1647732129, 213),
(389, '9:00 AM', '9:00 PM', 21, 'success', 1647734050, 214),
(390, '9:00 AM', '9:00 PM', 21, 'success', 1647766684, 215),
(391, '9:00 AM', '9:00 PM', 21, 'success', 1647860822, 216),
(392, '9:00 AM', '9:00 PM', 21, 'success', 1647864019, 217),
(393, '9:00 AM', '9:00 PM', 21, 'success', 1647864737, 218),
(432, '9:00 AM', '9:00 PM', 21, 'success', 1649068184, 239),
(395, '9:00 AM', '9:00 PM', 21, 'success', 1647893784, 219),
(396, '9:00 AM', '9:00 PM', 21, 'success', 1647941105, 0),
(397, '9:00 AM', '9:00 PM', 21, 'success', 1647965397, 220),
(427, '9:00 AM', '9:00 PM', 21, 'success', 1648825686, 235),
(400, '9:00 AM', '9:00 PM', 21, 'success', 1647981639, 222),
(449, '9:00 AM', '9:00 PM', 21, 'success', 1649541872, 0),
(403, '10:47 AM', '6:47 PM', 14, 'ok', 1648025242, 159),
(404, '9:00 AM', '9:00 PM', 21, 'success', 1648054176, 0),
(405, '9:00 AM', '9:00 PM', 21, 'success', 1648103353, 224),
(406, '9:00 AM', '9:00 PM', 21, 'success', 1648185355, 225),
(407, '9:00 AM', '9:00 PM', 21, 'success', 1648201178, 226),
(408, '9:00 AM', '9:00 PM', 21, 'success', 1648269309, 227),
(409, '9:00 AM', '9:00 PM', 21, 'success', 1648301702, 228),
(410, '9:00 AM', '9:00 PM', 21, 'success', 1648418449, 229),
(411, '9:00 AM', '9:00 PM', 21, 'success', 1648418563, 230),
(412, '9:00 AM', '9:00 PM', 21, 'success', 1648504395, 231),
(413, '9:00 AM', '9:00 PM', 21, 'success', 1648571519, 0),
(414, '9:00 AM', '9:00 PM', 21, 'success', 1648571571, 0),
(415, '9:00 AM', '9:00 PM', 21, 'success', 1648635465, 0),
(416, '9:00 AM', '9:00 PM', 21, 'success', 1648635465, 0),
(417, '9:00 AM', '9:00 PM', 21, 'success', 1648640781, 0),
(418, '9:00 AM', '9:00 PM', 21, 'success', 1648640781, 232),
(419, '9:00 AM', '9:00 PM', 21, 'success', 1648665183, 233),
(424, '11:30 AM', '12:30 PM', 10, 'ok', 1648788127, 234),
(425, '12:30 PM', '1:30 PM', 10, 'ok', 1648788171, 234),
(423, '9:00 AM', '9:00 PM', 21, 'success', 1648757820, 0),
(436, '9:00 AM', '9:00 PM', 21, 'success', 1649158855, 242),
(428, '9:00 AM', '9:00 PM', 21, 'success', 1648840048, 236),
(429, '9:00 AM', '9:00 PM', 21, 'success', 1648849847, 237),
(430, '9:00 AM', '9:00 PM', 21, 'success', 1648914162, 238),
(431, '1:16 AM', '5:15 AM', 1, 'ok', 1649015231, 187),
(434, '9:00 AM', '9:00 PM', 21, 'success', 1649095068, 241),
(465, '9:00 AM', '9:00 PM', 21, 'success', 1650175646, 246),
(437, '9:00 AM', '9:00 PM', 21, 'success', 1649173870, 243),
(438, '12:14 AM', '4:14 AM', 1, 'ok', 1649187905, 172),
(439, '9:00 AM', '9:00 PM', 21, 'success', 1649264619, 244),
(440, '9:00 AM', '9:00 PM', 21, 'success', 1649265368, 245),
(441, '9:00 AM', '9:00 PM', 21, 'success', 1649265497, 246),
(442, '9:00 AM', '9:00 PM', 21, 'success', 1649265781, 247),
(443, '9:00 AM', '9:00 PM', 21, 'success', 1649325165, 248),
(444, '9:00 AM', '9:00 PM', 21, 'success', 1649387590, 249),
(445, '9:00 AM', '9:00 PM', 21, 'success', 1649415978, 0),
(446, '9:00 AM', '9:00 PM', 21, 'success', 1649468599, 250),
(447, '9:00 AM', '9:00 PM', 21, 'success', 1649471049, 251),
(448, '12:58', '7:58', 22, 'ok', 1649473138, 251),
(450, '9:00 AM', '9:00 PM', 21, 'success', 1649573088, 0),
(451, '9:00 AM', '9:00 PM', 21, 'success', 1649583670, 252),
(452, '9:00 AM', '9:00 PM', 21, 'success', 1649631321, 253),
(453, '9:00 AM', '9:00 PM', 21, 'success', 1649676466, 254),
(454, '9:00 AM', '9:00 PM', 21, 'success', 1649712672, 0),
(455, '9:00 AM', '9:00 PM', 21, 'success', 1649712740, 255),
(456, '9:00 AM', '9:00 PM', 21, 'success', 1649734801, 256),
(457, '9:00 AM', '9:00 PM', 21, 'success', 1649774362, 0),
(458, '9:00 AM', '9:00 PM', 21, 'success', 1649775048, 257),
(480, '10:06 AM', '9:06 PM', 22, 'ok', 1653842205, 185),
(460, '9:00 AM', '9:00 PM', 21, 'success', 1649828887, 0),
(461, '9:00 AM', '9:00 PM', 21, 'success', 1649828944, 258),
(462, '9:00 AM', '9:00 PM', 21, 'success', 1649938411, 244),
(463, '9:00 AM', '9:00 PM', 21, 'success', 1650019747, 244),
(464, '9:00 AM', '9:00 PM', 21, 'success', 1650023196, 245),
(466, '9:00 AM', '9:00 PM', 21, 'success', 1650176849, 247),
(467, '9:00 AM', '9:00 PM', 21, 'success', 1650197035, 248),
(468, '9:00 AM', '9:00 PM', 21, 'success', 1650331479, 249),
(469, '9:00 AM', '9:00 PM', 21, 'success', 1650440899, 250),
(470, '9:00 AM', '9:00 PM', 21, 'success', 1650441414, 251),
(471, '9:00 AM', '9:00 PM', 21, 'success', 1650445305, 252),
(472, '9:00 AM', '9:00 PM', 21, 'success', 1650470377, 253),
(473, '9:00 AM', '9:00 PM', 21, 'success', 1650582836, 0),
(474, '9:00 AM', '9:00 PM', 21, 'success', 1650598498, 254),
(475, '9:00 AM', '9:00 PM', 21, 'success', 1650629227, 255),
(476, '9:00 AM', '9:00 PM', 21, 'success', 1651903258, 0),
(481, '9:00 AM', '9:00 PM', 21, 'success', 1653905993, 257);

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `driver_id` int(11) NOT NULL,
  `name` varchar(150) CHARACTER SET utf8 DEFAULT NULL,
  `rating_num` int(11) NOT NULL DEFAULT '0',
  `rating_total` decimal(20,0) NOT NULL DEFAULT '0',
  `last_name` varchar(150) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(150) CHARACTER SET utf8 DEFAULT NULL,
  `password` longtext CHARACTER SET utf8,
  `gender` varchar(15) CHARACTER SET utf8 DEFAULT NULL,
  `age` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `address` longtext CHARACTER SET utf8,
  `proof_image` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `image` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `livestatus` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `token` longtext,
  `device_id` longtext,
  `status` varchar(15) NOT NULL,
  `date` int(11) NOT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `drivingMode` int(10) DEFAULT NULL,
  `block` varchar(10) DEFAULT NULL,
  `general_details` longtext CHARACTER SET utf8,
  `cin` double DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `licence` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `vehicle_type` varchar(150) DEFAULT NULL,
  `vehicle_model` varchar(150) CHARACTER SET utf8 DEFAULT NULL,
  `vehicle_color` varchar(150) CHARACTER SET utf8 NOT NULL,
  `kyc_details` longtext CHARACTER SET utf8
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `driver_rating`
--

CREATE TABLE `driver_rating` (
  `driver_rating_id` int(11) NOT NULL,
  `rating` decimal(20,0) NOT NULL DEFAULT '0',
  `message` longtext CHARACTER SET utf8,
  `buyer_id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `order_id` varchar(150) NOT NULL,
  `date` int(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `d_recommendation`
--

CREATE TABLE `d_recommendation` (
  `d_recommendation_id` int(11) NOT NULL,
  `super_id` int(11) NOT NULL,
  `shoptype_id` int(11) NOT NULL,
  `focustype_id` int(11) NOT NULL,
  `sortby` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `email_template`
--

CREATE TABLE `email_template` (
  `email_template_id` int(11) NOT NULL,
  `title` longtext,
  `subject` longtext,
  `body` longtext
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `email_template`
--

INSERT INTO `email_template` (`email_template_id`, `title`, `subject`, `body`) VALUES
(1, 'Password Reset Email', 'Password Reset Successful', '<p><span [removed]=\"font-weight: bold;\">Hi [[to]],</span></p><p><span [removed]=\"font-weight: bold;\">You recently requested a new password. We\'ve received the request and your password has been changed.</span></p><p><span [removed]=\"font-weight: bold;\">Your account type is : [[account_type]]<br></span></p><p><span [removed]=\"font-weight: bold;\">Your new password is : [[password]]</span></p><p><span [removed]=\"font-weight: bold;\">Thanks,</span></p><p><span [removed]=\"\" bold;\"=\"\">[[from]]</span></p>'),
(2, 'Account Approval Email', 'Account Approval Status', '<p><span [removed]=\"font-weight: bold;\">Hi [[to]],</span></p><p><span [removed]=\"font-weight: bold;\">Your account type is : [[account_type]]</span></p><p><span [removed]=\"font-weight: bold;\">Email : [[email]]</span></p><p><span [removed]=\"font-weight: bold;\">Thank you for registering at our site. Your account&nbsp;has been [[status]]. Please contact with the&nbsp;</span>administration&nbsp;team if you have any further question. Best wishes.</p><p><span [removed]=\"font-weight: bold;\"><br></span></p><p><span [removed]=\"font-weight: bold;\">Thanks,</span></p><p><span [removed]=\"\" bold;\"=\"\">[[from]]</span></p>'),
(7, 'Vendor Registration Email To Admin', 'Vendor Registration', '<p>Congratulation!</p><p>You have a new Registered Vendor in your sytem.</p><p><span [removed]=\"font-weight: bold;\">Vendor Name : [[vendor_name]]</span></p><p><span [removed]=\"font-weight: bold;\">Email is : [[email]]</span></p><p><span [removed]=\"font-weight: bold;\">Please login to the admin panel to approve the vendor.</span></p><p><span [removed]=\"font-weight: bold;\"><br></span></p><p><span [removed]=\"font-weight: bold;\">Thanks,</span></p><p><span [removed]=\"\" bold;\"=\"\">[[from]]</span></p>'),
(3, 'Membership Upgrade Email', 'Membership Upgraded', '<p><span [removed]=\"font-weight: bold;\">Hi [[to]],</span></p><p><span [removed]=\"font-weight: bold;\">Your account type is : [[account_type]]</span></p><p><span [removed]=\"font-weight: bold;\">Email : [[email]]</span></p><p><span [removed]=\"font-weight: bold;\">Your Membership Type is [[package]]. </span></p><p><span [removed]=\"font-weight: bold;\">Please contact with the </span>administrator team if you have any further question. Best wishes.</p><p><span [removed]=\"font-weight: bold;\"><br></span></p><p><span [removed]=\"font-weight: bold;\">Thanks,</span></p><p><span [removed]=\"\" bold;\"=\"\">[[from]]</span></p>'),
(4, 'Vendors Account Opening', 'Account Opening', '<p><span [removed]=\"font-weight: bold;\">Hi [[to]],</span></p><p><span [removed]=\"font-weight: bold;\">Thank you for registering at our site </span>[[sitename]]<span [removed]=\"font-weight: bold;\">. </span></p><p><span [removed]=\"font-weight: bold;\">Your account type is : [[account_type]]</span></p><p><span [removed]=\"font-weight: bold;\">Email is : [[email]]</span></p><p><span [removed]=\"font-weight: bold;\"></span></p><p><span [removed]=\"font-weight: bold;\">Password is : [[password]]</span></p><p><span [removed]=\"font-weight: bold;\">Your account is now being reviewed by </span>administration team. Please wait for Admin approval. You will get a  confirmation email soon and after that you will be able to login from here : [[url]]</p><p><span [removed]=\"font-weight: bold;\">Please contact with the </span>administration team if you have any further question. Best wishes.<br></p><p><span [removed]=\"font-weight: bold;\"><br></span></p><p><span [removed]=\"font-weight: bold;\">Thanks,</span></p><p><span [removed]=\"\" bold;\"=\"\">[[from]]</span></p>'),
(5, 'Users Account Opening', 'Account Opening', '<p><span [removed]=\"font-weight: bold;\">Hi [[to]],</span></p><p><span [removed]=\"font-weight: bold;\">Thank you for registering at our site&nbsp;</span>[[sitename]]<span [removed]=\"font-weight: bold;\">.</span></p><p><span [removed]=\"font-weight: bold;\">Your account type is : [[account_type]]</span></p><p><span [removed]=\"font-weight: bold;\">Email is : [[email]]</span></p><p><span [removed]=\"font-weight: bold;\"></span></p><p><span [removed]=\"font-weight: bold;\">Password is : [[password]]</span></p><p>Login from here : [[url]]</p><p><span [removed]=\"font-weight: bold;\">Please contact with the&nbsp;</span>administration&nbsp;team if you have any further question. Best wishes.<br></p><p><span [removed]=\"font-weight: bold;\"><br></span></p><p><span [removed]=\"font-weight: bold;\">Thanks,</span></p><p><span [removed]=\"\" bold;\"=\"\">[[from]]</span></p>'),
(6, 'Admins Account Opening', 'Account Opening', '<p><span [removed]=\"font-weight: bold;\">Hi [[to]],</span></p><p><span [removed]=\"font-weight: bold;\">Thank you for joining at our site&nbsp;</span>[[sitename]]<span [removed]=\"font-weight: bold;\">.</span></p><p><span [removed]=\"font-weight: bold;\">Your account type is : [[account_type]]</span></p><p><span [removed]=\"font-weight: bold;\">Email is : [[email]]</span></p><p><span [removed]=\"font-weight: bold;\"></span></p><p><span [removed]=\"font-weight: bold;\">Password is : [[password]]</span></p><p>Login from here : [[url]]</p><p>&nbsp;Best wishes.</p><p><br></p><p><span [removed]=\"font-weight: bold;\">Thanks,</span></p><p><span [removed]=\"\" bold;\"=\"\">[[from]]</span></p>'),
(9, 'Vendor Payment', 'Admin to Vendor Payment', '<p>Dear <span> [[vendor_name]] ,<br></span></p><p>You have received a new payment from <span>[[from]].</span></p><p><span [removed]=\"font-weight: bold;\">The Amount is : [[amount]].</span></p><p><span [removed]=\"font-weight: bold;\">Thanks,</span></p><p><span [removed]=\"\" bold;\"=\"\">[[from]]</span></p>'),
(8, 'Vendor Package Upgrade', 'Vendor Package Upgrade ', '<p>A vendor has updated their package. Details are given below.<br></p><p><span [removed]=\"font-weight: bold;\">Vendor Name : [[vendor_name]]</span></p><p><span [removed]=\"font-weight: bold;\">Email is : [[email]]</span><br><span [removed]=\"font-weight: bold;\"><span>Package Name is : [[vendor_package]]</span></span></p><p><span [removed]=\"font-weight: bold;\"><span><span>Package Amount&nbsp; is : [[package_amount]]</span></span></span></p><p><span [removed]=\"font-weight: bold;\">Please login to the admin panel to approve the vendor.</span></p><p><span [removed]=\"font-weight: bold;\">Thanks,</span></p><p><span [removed]=\"\" bold;\"=\"\">[[from]]</span></p>');

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `general_settings_id` int(11) NOT NULL,
  `type` longtext,
  `value` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`general_settings_id`, `type`, `value`) VALUES
(1, 'system_name', 'Orgon'),
(2, 'system_email', 'admin@gmail.com'),
(3, 'system_title', 'FARMAR'),
(4, 'address', '12321'),
(5, 'phone', '123'),
(6, 'language', 'english'),
(9, 'terms_conditions', '<p>terms and conditions</p>'),
(29, 'application_name', ''),
(47, 'privacy_policy', '<p>Privacy Policy</p>'),
(48, 'discus_id', ''),
(53, 'slider', 'no'),
(54, 'revisit_after', '2'),
(83, 'right_postition', '1'),
(84, 'razorpay', 'rzp_live_FjzDHNyZd4m6Ha'),
(82, 'currency', '35'),
(80, 'short_description', '2312'),
(81, 'logo', 'logo_81.'),
(67, 'google_api_key', 'AIzaSyC2mimdtwb9ZpqAI1E5jSOmSTr3HIx25v0'),
(96, 'cancel_timer', '10'),
(95, 'driver_commission', '10'),
(93, 'radius', '3000000000'),
(94, 'instant_delivery', '1'),
(72, 'smtp_host', 'fabnet.in'),
(73, 'smtp_port', '465'),
(74, 'smtp_user', 'nasir@fabnet.in'),
(75, 'smtp_pass', 'Baskaran@2408'),
(76, 'mail_status', 'mail'),
(89, 'address', '12321'),
(78, 'version', '1.5.5'),
(88, 'phone', '123'),
(87, 'googlemap_api', 'AIzaSyC2mimdtwb9ZpqAI1E5jSOmSTr3HIx25v0'),
(86, 'minimum_purchase', '100'),
(85, 'strip', NULL),
(90, 'out_of_delivery', '1'),
(92, 'delivery_tips', '1'),
(91, 'autoassing', '1'),
(97, 'driver_radius', '3000000000'),
(98, 'paypalClientID', 'AWjWH9Yp1crq7wNSCyYncOFxAvo1dUJopEDlsyf81RC8X78hrtKtEm3qdZQp2fE_49Ens_W4RZR3LRqK'),
(99, 'fwpbfPublickey', 'FLWPUBK-2ba0a5a10a09915cb5fcbab9881c8626-X'),
(100, 'stripe_p_key', 'pk_test_51JJuZaSCzXhOINgBPtVtgzzhcrasV3kXPK6WLmhF0SchNwafg8bQVeGKJkQWpZIuxOHeKQNe5kttT2DF9Txj4Fua00aIJb9IW6'),
(101, 'stripe_s_key', 'sk_test_51JJuZaSCzXhOINgBPI0GvDcv7wWLV4gyEvOcmExxediDVHoZOXrwYBZz3Ur2PkTe83bAw00vgTxp6YNFX7ornZ3T00oNlE0IOz'),
(102, 'rayzorPay', '1'),
(103, 'upiID', '1'),
(104, 'paypal', '1'),
(106, 'flutterwave', '0'),
(107, 'stripe', '1'),
(108, 'UpiIdk', '9521727558@ybl'),
(109, 'time_zone', '10'),
(110, 'default_language', 'en'),
(111, 'decimal_points', '2'),
(112, 'distance_type', 'km'),
(113, 'handy_service_tax ', '10'),
(114, 'handy_service_commission', '21'),
(115, 'dail_code', '+506'),
(116, 'country_code', 'CR'),
(117, 'customer_support', '123'),
(118, 'mpesa', '1'),
(119, 'mpesaConsumerKey', 'qTNmiZt21oYnRTndv32i4lTkU4LXAUm2'),
(120, 'mpesaConsumerSecret', 'zICKJbR3cWRDzhUZ'),
(121, 'mpesaPasskey', '4'),
(122, 'driver_order_limit', '10'),
(123, 'paystack_secret', 'sk_test_5f926d7e94a4210d846f26e54ff9bede1f6a6211'),
(124, 'paystack_public', 'pk_test_67cc7c0cf83ba2d7159e3ae555b6a097e2843166'),
(125, 'paystack', '1'),
(126, 'cod_mode', '0');

-- --------------------------------------------------------

--
-- Table structure for table `h_category`
--

CREATE TABLE `h_category` (
  `h_category_id` int(11) NOT NULL,
  `category_name` varchar(200) CHARACTER SET utf8 NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `date` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `h_sub_category`
--

CREATE TABLE `h_sub_category` (
  `h_sub_category_id` int(30) NOT NULL,
  `h_category_id` int(11) NOT NULL,
  `sub_category_name` varchar(200) NOT NULL,
  `image` varchar(2000) DEFAULT NULL,
  `date` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `inter_short_view`
--

CREATE TABLE `inter_short_view` (
  `inter_short_view_id` int(100) NOT NULL,
  `image` varchar(250) NOT NULL,
  `title` varchar(250) CHARACTER SET utf8 NOT NULL,
  `short` varchar(250) CHARACTER SET utf8 NOT NULL,
  `date` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inter_short_view`
--

INSERT INTO `inter_short_view` (`inter_short_view_id`, `image`, `title`, `short`, `date`) VALUES
(4, 'inter_short_view_4.jpg', 'Best product of market', '3', '1615885140'),
(5, 'inter_short_view_5.jpg', 'Buy 2 KG grapes & get 1 KG', '2', '1615885207'),
(6, 'inter_short_view_6.jpg', 'Buy 1 KG Banana & get 1/2 KG', '4', '1615885256');

-- --------------------------------------------------------

--
-- Table structure for table `item_delivery_bookings`
--

CREATE TABLE `item_delivery_bookings` (
  `item_delivery_bookings_id` int(11) NOT NULL,
  `pickup_address` varchar(150) NOT NULL,
  `delivery_address` varchar(150) NOT NULL,
  `item` varchar(100) NOT NULL,
  `notes` varchar(150) NOT NULL,
  `total_km` double NOT NULL,
  `driver_fees` double NOT NULL,
  `comision` double NOT NULL,
  `total_amount` double NOT NULL,
  `date` timestamp(4) NULL DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_delivery_bookings`
--

INSERT INTO `item_delivery_bookings` (`item_delivery_bookings_id`, `pickup_address`, `delivery_address`, `item`, `notes`, `total_km`, `driver_fees`, `comision`, `total_amount`, `date`, `status`, `user_id`, `driver_id`) VALUES
(1, 'erode', 'cbe', 'book', 'delivery', 98, 2000, 200, 2200, NULL, 'ontheway', 12, 12);

-- --------------------------------------------------------

--
-- Table structure for table `logistics_pricing`
--

CREATE TABLE `logistics_pricing` (
  `logistics_pricing_id` int(11) NOT NULL,
  `from_range` varchar(10) NOT NULL,
  `to_range` varchar(10) NOT NULL,
  `amount` varchar(15) NOT NULL,
  `name` varchar(25) CHARACTER SET utf8 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logistics_pricing`
--

INSERT INTO `logistics_pricing` (`logistics_pricing_id`, `from_range`, `to_range`, `amount`, `name`) VALUES
(2, '9', '12', '75', 'Metro Mode'),
(5, '13', '20', '85', 'oeiuf'),
(14, '3', '12', '45', 'best'),
(12, '3', '6', '15', 'sdfsdf'),
(13, '0', '2', '0', 'Short Distance'),
(15, '0', '1000', '500', '6'),
(16, '0', '1', '30', 'Free'),
(17, '1', '5', '3', 'Express');

-- --------------------------------------------------------

--
-- Table structure for table `logo`
--

CREATE TABLE `logo` (
  `logo_id` int(11) NOT NULL,
  `name` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `logo`
--

INSERT INTO `logo` (`logo_id`, `name`) VALUES
(2, ''),
(3, ''),
(46, ''),
(62, ''),
(70, ''),
(71, ''),
(74, ''),
(75, ''),
(76, ''),
(77, ''),
(78, '');

-- --------------------------------------------------------

--
-- Table structure for table `packageitem`
--

CREATE TABLE `packageitem` (
  `packageitem_id` int(11) NOT NULL,
  `name` varchar(150) CHARACTER SET utf8 NOT NULL,
  `banner` varchar(45) DEFAULT NULL,
  `status` varchar(15) NOT NULL,
  `date` int(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `packageitem`
--

INSERT INTO `packageitem` (`packageitem_id`, `name`, `banner`, `status`, `date`) VALUES
(1, 'Documents | Books', 'packageitem_image_1.png', 'success', 0),
(2, 'Clothes | Accessories', 'packageitem_image_2.png', 'success', 0),
(3, 'kjbdkjfds', NULL, 'success', 1630771724),
(4, 'jdsfjds iusi', NULL, 'success', 1630771776);

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE `permission` (
  `permission_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `codename` varchar(30) DEFAULT NULL,
  `parent_status` varchar(30) DEFAULT NULL,
  `description` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`permission_id`, `name`, `codename`, `parent_status`, `description`) VALUES
(1, 'staff', 'admin', 'parent', ''),
(2, 'edit', 'admin_edit', '1', ''),
(3, 'view', 'admin_view', '1', ''),
(4, 'delete', 'admin_delete', '1', ''),
(5, 'display settings', 'banner', 'parent', ''),
(6, 'edit', 'banner_edit', '5', ''),
(7, 'view', 'banner_view', '5', ''),
(8, 'delete', 'banner_delete', '5', ''),
(9, 'brand', 'brand', 'parent', ''),
(10, 'edit', 'brand_edit', '9', ''),
(11, 'view', 'brand_view', '9', ''),
(12, 'delete', 'brand_delete', '9', ''),
(13, 'business settings', 'business_settings', 'parent', ''),
(14, 'edit', 'business_settings_edit', '13', ''),
(15, 'view', 'business_settings_view', '13', ''),
(16, 'delete', 'business_settings_delete', '13', ''),
(17, 'category', 'category', 'parent', ''),
(18, 'edit', 'category_edit', '17', ''),
(19, 'view', 'category_view', '17', ''),
(20, 'delete', 'category_delete', '17', ''),
(25, 'site settings', 'site_settings', 'parent', ''),
(26, 'edit', 'site_settings_edit', '25', ''),
(27, 'view', 'site_settings_view', '25', ''),
(28, 'delete', 'site_settings_delete', '25', ''),
(29, 'product', 'product', 'parent', ''),
(30, 'edit', 'product_edit', '29', ''),
(31, 'view', 'product_view', '29', ''),
(32, 'delete', 'product_delete', '29', ''),
(33, 'currency', 'report', 'parent', ''),
(34, 'edit', 'report_edit', '33', ''),
(35, 'view', 'report_view', '33', ''),
(36, 'delete', 'report_delete', '33', ''),
(37, 'role', 'role', 'parent', ''),
(38, 'edit', 'role_edit', '37', ''),
(39, 'view', 'role_view', '37', ''),
(40, 'delete', 'role_delete', '37', ''),
(41, 'sale', 'sale', 'parent', ''),
(42, 'edit', 'sale_edit', '92', ''),
(43, 'view', 'sale_view', '92', ''),
(44, 'delete', 'sale_delete', '92', ''),
(49, 'stock', 'stock', 'parent', ''),
(50, 'edit', 'stock_edit', '49', ''),
(51, 'view', 'stock_view', '49', ''),
(52, 'delete', 'stock_delete', '49', ''),
(53, 'sub category', 'sub_category', 'parent', ''),
(54, 'edit', 'sub_category_edit', '53', ''),
(55, 'view', 'sub_category_view', '53', ''),
(56, 'delete', 'sub_category_delete', '53', ''),
(57, 'user', 'user', 'parent', ''),
(58, 'edit', 'user_edit', '57', ''),
(59, 'view', 'user_view', '57', ''),
(60, 'delete', 'user_delete', '57', ''),
(64, 'Discount Coupon', 'coupon', 'parent', ''),
(75, 'sub-category', 'sub_category', 'parent', NULL),
(77, 'edit', 'sub_category_edit', '75', NULL),
(78, 'delete', 'sub_category_delete', '75', NULL),
(79, 'view', 'sub_category_view', '75', NULL),
(88, 'product', 'product', 'parent', NULL),
(89, 'edit', 'product_edit', '88', NULL),
(90, 'delete', 'product_delete', '88', NULL),
(91, 'view', 'product_view', '88', NULL),
(92, 'sale', 'sale', 'parent', NULL),
(93, 'general', 'general', 'parent', NULL),
(98, 'business settings', 'business_settings', 'parent', NULL),
(100, 'auto_suggestion', 'auto_suggestion', 'parent', NULL),
(102, 'email template', 'email_template', 'parent', NULL),
(107, 'bundle_stock', 'bundle_stock', '103', NULL),
(111, 'Driver', 'driver', 'parent', NULL),
(112, 'edit', 'driver_edit', '111', NULL),
(113, 'delete', 'driver_delete', '111', NULL),
(114, 'view', 'driver_view', '111', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `policy`
--

CREATE TABLE `policy` (
  `policy_id` int(11) NOT NULL,
  `policy` longtext CHARACTER SET utf8,
  `value` longtext CHARACTER SET utf8 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `policy`
--

INSERT INTO `policy` (`policy_id`, `policy`, `value`) VALUES
(1, 'Terms & Condition', 'Terms and Conditions'),
(2, 'Privacy Policy', 'Privacy Policy for DD2U\nAt DD2U, one of our main priorities is the privacy of our visitors. This Privacy Policy document contains types of information that is collected and recorded by DD2U and how we use it.\n\nIf you have additional questions or require more information about our Privacy Policy, do not hesitate to contact us.\n\nLog Files\nDD2U follows a standard procedure of using log files. These files log visitors when they use app. The information collected by log files include internet protocol (IP) addresses, browser type, Internet Service Provider (ISP), date and time stamp, referring/exit pages, and possibly the number of clicks. These are not linked to any information that is personally identifiable. The purpose of the information is for analyzing trends, administering the app, tracking users\' movement on the app, and gathering demographic information.\n\nOur Advertising Partners\nSome of advertisers in our app may use cookies and web beacons. Our advertising partners are listed below. Each of our advertising partners has their own Privacy Policy for their policies on user data. For easier access, we hyperlinked to their Privacy Policies below.\n\nGoogle\n\nhttps://policies.google.com/technologies/ads\n\nPrivacy Policies\nYou may consult this list to find the Privacy Policy for each of the advertising partners of DD2U.\n\nThird-party ad servers or ad networks uses technologies like cookies, JavaScript, or Beacons that are used in their respective advertisements and links that appear on DD2U. They automatically receive your IP address when this occurs. These technologies are used to measure the effectiveness of their advertising campaigns and/or to personalize the advertising content that you see on this app or other apps or websites.\n\nNote that DD2U has no access to or control over these cookies that are used by third-party advertisers.\n\nThird Party Privacy Policies\nDD2U\'s Privacy Policy does not apply to other advertisers or websites. Thus, we are advising you to consult the respective Privacy Policies of these third-party ad servers for more detailed information. It may include their practices and instructions about how to opt-out of certain options.\n\nChildren\'s Information\nAnother part of our priority is adding protection for children while using the internet. We encourage parents and guardians to observe, participate in, and/or monitor and guide their online activity.\n\nDD2U does not knowingly collect any Personal Identifiable Information from children under the age of 13. If you think that your child provided this kind of information on our App, we strongly encourage you to contact us immediately and we will do our best efforts to promptly remove such information from our records.\n\nOnline Privacy Policy Only\nThis Privacy Policy applies only to our online activities and is valid for visitors to our App with regards to the information that they shared and/or collect in DD2U. This policy is not applicable to any information collected offline or via channels other than this app. Our Privacy Policy was created with the help of the App Privacy Policy Generator from App-Privacy-Policy.com\n\nConsent\nBy using our app, you hereby consent to our Privacy Policy and agree to its Terms and Conditions.'),
(3, 'Return Policy', 'Refund policy\n\nWe’re so convinced you’ll absolutely love our services, that we’re willing to offer a 14 day risk-free money back guarantee. If you are not satisfied with the service for any reason you can get a refund within 14 days of making a purchase. Please keep in mind that even though we offer a full money back guarantee, we will issue a refund only for the unused portion of the service.\n\nContacting us\n\nIf you have any questions, concerns, or complaints regarding this refund policy, we encourage you to contact us using the details below:\n\nhttp://www.doordrop2u.in\nsupport@doordrop2u.in\n\nThis document was last updated on December 20, 2021'),
(4, 'About us', 'Privacy Policy for DD2U\nAt DD2U, one of our main priorities is the privacy of our visitors. This Privacy Policy document contains types of information that is collected and recorded by DD2U and how we use it.\n\nIf you have additional questions or require more information about our Privacy Policy, do not hesitate to contact us.\n\nLog Files\nDD2U follows a standard procedure of using log files. These files log visitors when they use app. The information collected by log files include internet protocol (IP) addresses, browser type, Internet Service Provider (ISP), date and time stamp, referring/exit pages, and possibly the number of clicks. These are not linked to any information that is personally identifiable. The purpose of the information is for analyzing trends, administering the app, tracking users\' movement on the app, and gathering demographic information.\n\nOur Advertising Partners\nSome of advertisers in our app may use cookies and web beacons. Our advertising partners are listed below. Each of our advertising partners has their own Privacy Policy for their policies on user data. For easier access, we hyperlinked to their Privacy Policies below.\n\nGoogle\n\nhttps://policies.google.com/technologies/ads\n\nPrivacy Policies\nYou may consult this list to find the Privacy Policy for each of the advertising partners of DD2U.\n\nThird-party ad servers or ad networks uses technologies like cookies, JavaScript, or Beacons that are used in their respective advertisements and links that appear on DD2U. They automatically receive your IP address when this occurs. These technologies are used to measure the effectiveness of their advertising campaigns and/or to personalize the advertising content that you see on this app or other apps or websites.\n\nNote that DD2U has no access to or control over these cookies that are used by third-party advertisers.\n\nThird Party Privacy Policies\nDD2U\'s Privacy Policy does not apply to other advertisers or websites. Thus, we are advising you to consult the respective Privacy Policies of these third-party ad servers for more detailed information. It may include their practices and instructions about how to opt-out of certain options.\n\nChildren\'s Information\nAnother part of our priority is adding protection for children while using the internet. We encourage parents and guardians to observe, participate in, and/or monitor and guide their online activity.\n\nDD2U does not knowingly collect any Personal Identifiable Information from children under the age of 13. If you think that your child provided this kind of information on our App, we strongly encourage you to contact us immediately and we will do our best efforts to promptly remove such information from our records.\n\nOnline Privacy Policy Only\nThis Privacy Policy applies only to our online activities and is valid for visitors to our App with regards to the information that they shared and/or collect in DD2U. This policy is not applicable to any information collected offline or via channels other than this app. Our Privacy Policy was created with the help of the App Privacy Policy Generator from App-Privacy-Policy.com\n\nConsent\nBy using our app, you hereby consent to our Privacy Policy and agree to its Terms and Conditions.'),
(5, 'Vendor Policy', 'Welcome to DD2U!');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `rating_num` int(11) NOT NULL DEFAULT '0',
  `rating_total` decimal(20,2) NOT NULL DEFAULT '0.00',
  `rating_user` longtext,
  `title` longtext,
  `added_by` varchar(30) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `sub_category` int(11) DEFAULT NULL,
  `add_timestamp` longtext,
  `status` longtext,
  `front_image` longtext,
  `product_type` varchar(30) DEFAULT NULL,
  `variant_status` tinyint(10) DEFAULT NULL,
  `featured` varchar(10) DEFAULT NULL,
  `today_deals` tinyint(1) DEFAULT '0',
  `sales_count` int(50) DEFAULT '0',
  `vendor` int(11) DEFAULT NULL,
  `tag` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `provider`
--

CREATE TABLE `provider` (
  `provider_id` int(150) NOT NULL,
  `username` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `rating_num` int(11) NOT NULL DEFAULT '0',
  `rating_total` decimal(20,0) NOT NULL DEFAULT '0',
  `lastname` varchar(150) DEFAULT NULL,
  `dob` varchar(15) DEFAULT NULL,
  `gender` varchar(11) DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  `password` longtext NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `address1` longtext CHARACTER SET utf8 NOT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `city` longtext CHARACTER SET utf8,
  `state` longtext CHARACTER SET utf8,
  `zipcode` int(20) DEFAULT NULL,
  `aboutyou` longtext,
  `work_exp` varchar(50) NOT NULL,
  `date` int(20) NOT NULL,
  `status` varchar(15) NOT NULL,
  `image` varchar(25) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `token` longtext,
  `device_id` longtext,
  `livestatus` varchar(15) DEFAULT NULL,
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `cin` double DEFAULT '0',
  `kyc_details` longtext CHARACTER SET utf8
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `provider_databook`
--

CREATE TABLE `provider_databook` (
  `provider_databook_id` int(11) NOT NULL,
  `categoryName` varchar(150) NOT NULL,
  `categoryId` int(11) NOT NULL,
  `subcategoryName` varchar(150) NOT NULL,
  `subcategoryId` int(11) NOT NULL,
  `experience` varchar(150) NOT NULL,
  `chargePreHrs` int(11) NOT NULL,
  `quickPitch` int(11) NOT NULL,
  `userid` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `push_notification`
--

CREATE TABLE `push_notification` (
  `push_notification_id` int(11) NOT NULL,
  `title` varchar(150) CHARACTER SET utf8 NOT NULL,
  `subtitle` varchar(150) CHARACTER SET utf8 DEFAULT NULL,
  `image` int(150) DEFAULT NULL,
  `user_type` varchar(50) NOT NULL,
  `date` int(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `restaurantproduct`
--

CREATE TABLE `restaurantproduct` (
  `restaurantproduct_id` int(11) NOT NULL,
  `rating_num` int(11) NOT NULL DEFAULT '0',
  `rating_total` decimal(20,2) NOT NULL DEFAULT '0.00',
  `rating_user` longtext,
  `title` longtext,
  `added_by` varchar(30) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `description` longtext,
  `add_timestamp` longtext,
  `from_avaliable_time` varchar(150) DEFAULT NULL,
  `to_avaliable_time` varchar(150) DEFAULT NULL,
  `status` longtext,
  `current_stock` int(11) DEFAULT '0',
  `product_type` int(11) NOT NULL,
  `variant_status` tinyint(1) DEFAULT NULL,
  `today_deals` tinyint(1) DEFAULT '0',
  `sales_count` int(50) DEFAULT '0',
  `vendor` int(11) NOT NULL DEFAULT '0',
  `tag` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `permission` longtext,
  `description` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `name`, `permission`, `description`) VALUES
(1, 'master', '', 'Master Admin. Adds Admin. Provides account roles.'),
(11, 'Product Manager', '[\"1\",\"5\",\"9\",\"13\",\"17\",\"25\",\"29\",\"33\",\"37\",\"41\",\"49\",\"53\",\"57\",\"64\",\"75\",\"88\",\"92\",\"111\"]', 'Manage Product details'),
(4, 'Accountant', '[\"9\",\"13\",\"17\",\"21\"]', 'Accountancy and Support');

-- --------------------------------------------------------

--
-- Table structure for table `role_permission`
--

CREATE TABLE `role_permission` (
  `role_permission_id` int(11) NOT NULL,
  `primary_roll` int(11) NOT NULL,
  `secondary_roll` longtext NOT NULL,
  `date` int(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role_permission`
--

INSERT INTO `role_permission` (`role_permission_id`, `primary_roll`, `secondary_roll`, `date`) VALUES
(6, 8, '[\"9\",\"10\"]', 1608268711),
(7, 10, '[\"9\"]', 1608268726);

-- --------------------------------------------------------

--
-- Table structure for table `role_vendor`
--

CREATE TABLE `role_vendor` (
  `role_vendor_id` int(11) NOT NULL,
  `name` varchar(150) CHARACTER SET utf8 NOT NULL,
  `permission` longtext CHARACTER SET utf8 NOT NULL,
  `description` longtext CHARACTER SET utf8 NOT NULL,
  `vendor` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sale`
--

CREATE TABLE `sale` (
  `sale_id` int(11) NOT NULL,
  `sale_code` longtext,
  `buyer` longtext,
  `product_details` longtext,
  `shipping_address` longtext,
  `payment_details` longtext,
  `shipping` longtext,
  `payment_type` varchar(100) DEFAULT NULL,
  `payment_status` longtext,
  `payment_timestamp` longtext,
  `grand_total` longtext,
  `sale_datetime` longtext,
  `delivary_datetime` longtext,
  `delivery_status` longtext,
  `viewed` longtext,
  `delivery_assigned` int(15) DEFAULT NULL,
  `delivery_state` varchar(20) DEFAULT NULL,
  `deliver_assignedtime` varchar(20) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  `otp` varchar(14) DEFAULT NULL,
  `delivery_slot` varchar(40) DEFAULT NULL,
  `vendor` int(11) NOT NULL,
  `driver_charge` varchar(11) NOT NULL,
  `order_type` int(5) DEFAULT NULL,
  `focus_id` int(11) DEFAULT NULL,
  `p_image` varchar(50) DEFAULT NULL,
  `rating` int(4) DEFAULT '0',
  `driver_rating` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) DEFAULT '0',
  `coupon_code` varchar(255) DEFAULT NULL,
  `coupon_details` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `secondary_wallet`
--

CREATE TABLE `secondary_wallet` (
  `secondary_wallet_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `balance` varchar(15) NOT NULL,
  `last_update` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `last_amount` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `secondary_wallet`
--

INSERT INTO `secondary_wallet` (`secondary_wallet_id`, `vendor_id`, `balance`, `last_update`, `type`, `last_amount`) VALUES
(33, 50, '13', 1650723253, 'driver', 12),
(32, 84, '27', 1650570276, 'driver', 27),
(31, 103, '1', 1650268749, 'driver', 0);

-- --------------------------------------------------------

--
-- Table structure for table `shop_focus`
--

CREATE TABLE `shop_focus` (
  `shop_focus_id` int(11) NOT NULL,
  `title` varchar(100) CHARACTER SET utf8 NOT NULL,
  `color_code` varchar(20) NOT NULL,
  `commission` varchar(15) NOT NULL,
  `preview_image` varchar(40) DEFAULT NULL,
  `cover_image` varchar(40) DEFAULT NULL,
  `shop_type` int(11) NOT NULL,
  `date` int(15) NOT NULL,
  `supercatgeory_id` int(11) NOT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shop_rating`
--

CREATE TABLE `shop_rating` (
  `shop_rating_id` int(11) NOT NULL,
  `rating` decimal(20,0) NOT NULL DEFAULT '0',
  `taste` tinyint(1) DEFAULT NULL,
  `packing` tinyint(1) DEFAULT NULL,
  `portion` tinyint(1) DEFAULT NULL,
  `message` longtext CHARACTER SET utf8,
  `buyer_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shop_the_offer`
--

CREATE TABLE `shop_the_offer` (
  `shop_the_offer_id` int(100) NOT NULL,
  `image` varchar(250) NOT NULL,
  `offer` int(100) NOT NULL,
  `date` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shop_the_offer`
--

INSERT INTO `shop_the_offer` (`shop_the_offer_id`, `image`, `offer`, `date`) VALUES
(7, 'shop_the_offer_7.png', 20, '1615886424'),
(6, 'shop_the_offer_6.png', 10, '1615886364'),
(8, 'shop_the_offer_8.png', 15, '1615886441');

-- --------------------------------------------------------

--
-- Table structure for table `shop_type`
--

CREATE TABLE `shop_type` (
  `shop_type_id` int(11) NOT NULL,
  `type` varchar(150) CHARACTER SET utf8 NOT NULL,
  `image` varchar(15) NOT NULL,
  `cover_image` varchar(30) DEFAULT NULL,
  `status` varchar(15) NOT NULL,
  `commission` int(11) DEFAULT NULL,
  `date` int(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shop_type`
--

INSERT INTO `shop_type` (`shop_type_id`, `type`, `image`, `cover_image`, `status`, `commission`, `date`) VALUES
(1, 'Single Variant Eg: Grocery', 'shoptype_1.png', 'shoptypecover_1.png', 'success', 10, 23),
(2, 'Variant+Addon Eg: Restaurant', 'shoptype_2.png', 'shoptypecover_2.png', 'success', 5, 3),
(3, 'Variant+Upload Eg:Pharmacy', 'shoptype_3.png', 'shoptypecover_3.png', 'success', 10, 3);

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `slider_id` int(50) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `slider_text` varchar(50) NOT NULL,
  `button_text` varchar(50) NOT NULL,
  `button_color` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`slider_id`, `image`, `slider_text`, `button_text`, `button_color`) VALUES
(53, 'slider_53.jpg', 'test', 'promake', '43'),
(54, 'slider_54.jpg', 'Ultimate Job Offer! Click apply now', 'Apply', '21');

-- --------------------------------------------------------

--
-- Table structure for table `slides`
--

CREATE TABLE `slides` (
  `slides_id` int(11) NOT NULL,
  `button_color` longtext,
  `text_color` longtext,
  `button_text` varchar(300) DEFAULT NULL,
  `button_link` varchar(500) DEFAULT NULL,
  `uploaded_by` longtext,
  `added_by` longtext,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `slides`
--

INSERT INTO `slides` (`slides_id`, `button_color`, `text_color`, `button_text`, `button_link`, `uploaded_by`, `added_by`, `status`) VALUES
(15, '', '', '', '', 'vendor', '{\"type\":\"vendor\",\"id\":\"3\"}', 'ok'),
(16, 'rgba(0,0,0,1)', 'rgba(0,0,0,1)', '', '', 'vendor', '{\"type\":\"vendor\",\"id\":\"3\"}', 'ok'),
(19, 'rgba(0,0,0,1)', 'rgba(0,0,0,1)', '', '', 'admin', '{\"type\":\"admin\",\"id\":\"1\"}', '0'),
(20, 'rgba(0,0,0,1)', 'rgba(0,0,0,1)', '', '', 'admin', '{\"type\":\"admin\",\"id\":\"1\"}', '0'),
(21, 'rgba(0,0,0,1)', 'rgba(0,0,0,1)', '', '', 'admin', '{\"type\":\"admin\",\"id\":\"1\"}', '0'),
(22, 'rgba(0,0,0,1)', 'rgba(0,0,0,1)', '', '', 'admin', '{\"type\":\"admin\",\"id\":\"1\"}', '0'),
(23, 'rgba(0,0,0,1)', 'rgba(0,0,0,1)', '', '', 'admin', '{\"type\":\"admin\",\"id\":\"1\"}', '0'),
(24, 'rgba(0,0,0,1)', 'rgba(0,0,0,1)', '', '', 'admin', '{\"type\":\"admin\",\"id\":\"1\"}', '0'),
(25, 'rgba(0,0,0,1)', 'rgba(0,0,0,1)', '', '', 'vendor', '{\"type\":\"vendor\",\"id\":\"3\"}', 'ok'),
(26, 'rgba(255,0,0,1)', 'rgba(255,255,255,1)', 'Demo', '', 'vendor', '{\"type\":\"vendor\",\"id\":\"12\"}', '0'),
(27, 'rgba(134,217,29,1)', 'rgba(29,92,214,1)', 'link', 'www.google.com', 'vendor', '{\"type\":\"vendor\",\"id\":\"13\"}', 'ok'),
(28, 'rgba(0,0,0,1)', 'rgba(0,0,0,1)', '', '', 'admin', '{\"type\":\"admin\",\"id\":\"1\"}', '0'),
(29, 'rgba(0,0,0,1)', 'rgba(0,0,0,1)', '', '', 'admin', '{\"type\":\"admin\",\"id\":\"1\"}', 'ok'),
(30, 'rgba(0,0,0,1)', 'rgba(0,0,0,1)', '', '', 'vendor', '{\"type\":\"vendor\",\"id\":\"5\"}', 'ok'),
(31, 'rgba(0,0,0,1)', 'rgba(0,0,0,1)', '', '', 'vendor', '{\"type\":\"vendor\",\"id\":\"5\"}', 'ok'),
(32, 'rgba(0,0,0,1)', 'rgba(0,0,0,1)', '', '', 'vendor', '{\"type\":\"vendor\",\"id\":\"5\"}', 'ok'),
(33, 'rgba(0,0,0,1)', 'rgba(0,0,0,1)', '', '', 'vendor', '{\"type\":\"vendor\",\"id\":\"5\"}', 'ok'),
(34, 'rgba(245,233,233,1)', 'rgba(18,17,17,1)', 'Demo', 'https://www.google.com', 'vendor', '{\"type\":\"vendor\",\"id\":\"17\"}', 'ok');

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `stock_id` int(11) NOT NULL,
  `type` longtext,
  `category` longtext,
  `sub_category` longtext,
  `product` longtext,
  `quantity` longtext,
  `rate` longtext,
  `total` longtext,
  `reason_note` longtext,
  `datetime` longtext,
  `sale_id` varchar(30) DEFAULT NULL,
  `added_by` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`stock_id`, `type`, `category`, `sub_category`, `product`, `quantity`, `rate`, `total`, `reason_note`, `datetime`, `sale_id`, `added_by`) VALUES
(2, 'add', '6', '13', '41', '80', '220.00', '17600', '', '1474205403', NULL, NULL),
(3, 'add', '3', '19', '45', '10', '400.00', '4000', '', '1474273237', NULL, '{\"type\":\"vendor\",\"id\":\"2\"}'),
(4, 'destroy', '3', '19', '45', '3', NULL, '3', '', '1474273259', NULL, '{\"type\":\"vendor\",\"id\":\"2\"}'),
(5, 'add', '7', '24', '46', '50', '170.00', '8500', '', '1474279907', NULL, '{\"type\":\"vendor\",\"id\":\"3\"}'),
(6, 'add', '7', '23', '47', '25', '8.00', '200', '', '1474283137', NULL, '{\"type\":\"vendor\",\"id\":\"3\"}'),
(7, 'add', '7', '25', '48', '35', '6.00', '210', '', '1474284193', NULL, '{\"type\":\"vendor\",\"id\":\"3\"}'),
(8, 'add', '5', '29', '50', '50', '15.25', '762.5', '', '1474485138', NULL, '{\"type\":\"vendor\",\"id\":\"3\"}'),
(9, 'add', '5', '29', '49', '45', '34.35', '1545.75', '', '1474485156', NULL, '{\"type\":\"vendor\",\"id\":\"3\"}'),
(10, 'add', '5', '29', '51', '25', '11.11', '277.75', '', '1474485808', NULL, '{\"type\":\"vendor\",\"id\":\"3\"}'),
(11, 'add', '5', '29', '52', '18', '9.56', '172.08', '', '1474487386', NULL, '{\"type\":\"vendor\",\"id\":\"3\"}'),
(12, 'add', '5', '27', '53', '10', '85.00', '850', '', '1474488421', NULL, '{\"type\":\"vendor\",\"id\":\"3\"}'),
(13, 'add', '5', '27', '55', '15', '101.00', '1515', '', '1474489704', NULL, '{\"type\":\"vendor\",\"id\":\"3\"}'),
(14, 'add', '5', '27', '54', '15', '100.00', '1500', '', '1474489715', NULL, '{\"type\":\"vendor\",\"id\":\"3\"}'),
(15, 'add', '5', '27', '56', '25', '85.00', '2125', '', '1474490017', NULL, '{\"type\":\"vendor\",\"id\":\"3\"}'),
(16, 'add', '5', '28', '57', '20', '65.00', '1300', '', '1474490674', NULL, '{\"type\":\"vendor\",\"id\":\"3\"}'),
(17, 'add', '5', '28', '58', '25', '60.00', '1500', '', '1474491530', NULL, '{\"type\":\"vendor\",\"id\":\"3\"}'),
(18, 'add', '5', '28', '59', '20', '65.00', '1300', '', '1474492165', NULL, '{\"type\":\"vendor\",\"id\":\"3\"}'),
(19, 'add', '5', '30', '61', '100', '41.00', '4100', '', '1474493210', NULL, '{\"type\":\"vendor\",\"id\":\"3\"}'),
(20, 'add', '5', '28', '60', '20', '75.00', '1500', '', '1474493219', NULL, '{\"type\":\"vendor\",\"id\":\"3\"}'),
(21, 'add', '5', '30', '62', '80', '620.00', '49600', '', '1474493510', NULL, '{\"type\":\"vendor\",\"id\":\"3\"}'),
(22, 'add', '5', '30', '63', '50', '650.00', '32500', '', '1474493879', NULL, '{\"type\":\"vendor\",\"id\":\"3\"}'),
(23, 'add', '4', '9', '65', '30', '11.26', '337.8', '', '1474572304', NULL, '{\"type\":\"vendor\",\"id\":\"5\"}'),
(24, 'add', '4', '9', '66', '35', '15.35', '537.25', '', '1474572782', NULL, '{\"type\":\"vendor\",\"id\":\"5\"}'),
(25, 'add', '4', '9', '67', '30', '13.20', '396', '', '1474574151', NULL, '{\"type\":\"vendor\",\"id\":\"5\"}'),
(26, 'add', '4', '10', '68', '20', '12.36', '247.2', '', '1474575119', NULL, '{\"type\":\"vendor\",\"id\":\"5\"}'),
(27, 'add', '4', '10', '69', '30', '8.20', '245.99999999999997', '', '1474575712', NULL, '{\"type\":\"vendor\",\"id\":\"5\"}'),
(28, 'add', '4', '11', '70', '25', '3.35', '83.75', '', '1474576989', NULL, '{\"type\":\"vendor\",\"id\":\"5\"}'),
(29, 'add', '4', '11', '71', '50', '2.88', '144', '', '1474577860', NULL, '{\"type\":\"vendor\",\"id\":\"5\"}'),
(30, 'add', '4', '11', '72', '10', '8.90', '89', '', '1474578795', NULL, '{\"type\":\"vendor\",\"id\":\"5\"}'),
(31, 'add', '4', '36', '73', '15', '38.32', '574.8', '', '1474580033', NULL, '{\"type\":\"vendor\",\"id\":\"5\"}'),
(32, 'add', '4', '36', '74', '20', '41.38', '827.6', '', '1474580235', NULL, '{\"type\":\"vendor\",\"id\":\"5\"}'),
(33, 'add', '4', '36', '75', '20', '39.63', '792.6', '', '1474580993', NULL, NULL),
(34, 'add', '1', '3', '76', '10', '43567.00', '435670', '', '1474721288', NULL, '{\"type\":\"vendor\",\"id\":\"3\"}'),
(35, 'add', '1', '3', '77', '15', '58378.00', '875670', '', '1474722264', NULL, '{\"type\":\"vendor\",\"id\":\"3\"}'),
(36, 'add', '1', '3', '78', '20', '131772.00', '2635440', '', '1474722788', NULL, '{\"type\":\"vendor\",\"id\":\"3\"}'),
(37, 'add', '1', '63', '79', '5', '1734589.00', '8672945', '', '1474790400', NULL, '{\"type\":\"vendor\",\"id\":\"3\"}'),
(38, 'add', '1', '63', '80', '10', '558900.00', '5589000', '', '1474792233', NULL, NULL),
(39, 'add', '1', '63', '81', '5', '3234690.00', '16173450', '', '1474792382', NULL, NULL),
(40, 'add', '1', '63', '82', '8', '4467490.00', '35739920', '', '1474792879', NULL, NULL),
(41, 'add', '1', '5', '83', '12', '11670.00', '140040', '', '1474793757', NULL, NULL),
(42, 'add', '1', '5', '84', '25', '42879.00', '1071975', '', '1474796354', NULL, NULL),
(43, 'add', '1', '5', '85', '18', '74590.00', '1342620', '', '1474796688', NULL, NULL),
(44, 'add', '1', '2', '86', '16', '45000.00', '720000', '', '1474799085', NULL, NULL),
(45, 'add', '1', '6', '87', '10', '41000.00', '410000', '', '1474800049', NULL, NULL),
(46, 'add', '1', '6', '88', '25', '33890.00', '847250', '', '1474800332', NULL, NULL),
(47, 'add', '1', '6', '89', '10', '42000.00', '420000', '', '1474801376', NULL, NULL),
(48, 'add', '2', '62', '90', '45', '61897.00', '2785365', '', '1474802601', NULL, NULL),
(49, 'add', '2', '17', '92', '55', '42000.00', '2310000', '', '1474803009', NULL, '{\"type\":\"vendor\",\"id\":\"3\"}'),
(50, 'add', '2', '62', '91', '10', '65000.00', '650000', '', '1474889590', NULL, NULL),
(52, 'add', '4', '10', '69', '0', '8.20', '0', '', '1475390469', NULL, NULL),
(53, 'add', '2', '18', '93', '10', '350.00', '3500', '', '1475483558', NULL, NULL),
(54, 'add', '2', '18', '94', '10', '350.00', '3500', '', '1475485603', NULL, NULL),
(56, 'add', '2', '18', '96', '100', '350.00', '35000', '', '1475498670', NULL, NULL),
(59, 'add', '1', '3', '4', '100', '88000.00', '8800000', '', '1476007723', NULL, NULL),
(60, 'add', '1', '2', '1', '50', '120000.00', '6000000', '', '1476007803', NULL, NULL),
(61, 'destroy', '4', '36', '74', '2', NULL, '0', 'sale', '1517725191', '5', NULL),
(62, 'destroy', '4', '36', '73', '1', NULL, '0', 'sale', '1517732450', '6', NULL),
(63, 'destroy', '4', '36', '73', '1', NULL, '0', 'sale', '1517732639', '7', NULL),
(64, 'add', '4', '10', '37', '100', '150.00', '15000', '', '1517942532', NULL, NULL),
(65, 'add', '4', '8', '36', '100', '210.00', '0', '', '1517942542', NULL, NULL),
(66, 'add', '4', '35', '35', '100', '240.00', '24000', '', '1517942553', NULL, NULL),
(67, 'add', '4', '9', '26', '100', '10.00', '1000', '', '1517942563', NULL, NULL),
(68, 'add', '4', '37', '25', '100', '250.00', '25000', '', '1517942574', NULL, NULL),
(69, 'add', '4', '37', '24', '100', '400.00', '40000', '', '1517942585', NULL, NULL),
(70, 'add', '4', '37', '23', '100', '210.00', '21000', '', '1517942598', NULL, NULL),
(71, 'add', '4', '40', '18', '200', '100.00', '20000', '', '1517942609', NULL, NULL),
(72, 'add', '4', '35', '17', '150', '120.00', '18000', '', '1517942624', NULL, NULL),
(73, 'add', '4', '39', '16', '200', '110.00', '22000', '', '1517942637', NULL, NULL),
(74, 'add', '4', '37', '15', '200', '130.00', '0', '', '1517942647', NULL, NULL),
(75, 'add', '4', '34', '14', '100', '320.00', '32000', '', '1517942656', NULL, NULL),
(76, 'add', '4', '8', '12', '200', '180.00', '36000', '', '1517942666', NULL, NULL),
(77, 'add', '4', '11', '11', '100', '6500.00', '650000', '', '1517942677', NULL, NULL),
(78, 'add', '1', '5', '2', '100', '18000.00', '1800000', '', '1517942691', NULL, NULL),
(79, 'add', '4', '10', '7', '500', '35.00', '17500', '', '1517942704', NULL, NULL),
(80, 'add', '5', '30', '8', '300', '650.00', '195000', '', '1517942726', NULL, NULL),
(81, 'add', '5', '28', '9', '500', '120.00', '60000', '', '1517942751', NULL, NULL),
(82, 'add', '16', '78', '101', '10', '95.00', '950', '', '1518078812', NULL, NULL),
(83, 'add', '16', '78', '103', '20', '125.00', '2500', '', '1518079324', NULL, NULL),
(84, 'add', '16', '78', '102', '15', '125.00', '1875', '', '1518079332', NULL, NULL),
(85, 'add', '16', '78', '104', '15', '125.00', '1875', '', '1518079423', NULL, NULL),
(86, 'add', '16', '78', '104', '100', '125.00', '12500', '', '1518079433', NULL, NULL),
(87, 'add', '16', '78', '103', '150', '125.00', '18750', '', '1518079443', NULL, NULL),
(88, 'add', '16', '78', '102', '90', '125.00', '11250', '', '1518079453', NULL, NULL),
(89, 'add', '16', '78', '101', '120', '95.00', '11400', '', '1518079464', NULL, NULL),
(90, 'add', '1', '6', '89', '50', '42000.00', '2100000', '', '1518079474', NULL, NULL),
(91, 'add', '1', '6', '88', '50', '33890.00', '1694500', '', '1518079483', NULL, NULL),
(92, 'add', '1', '6', '87', '80', '41000.00', '3280000', '', '1518079495', NULL, NULL),
(93, 'add', '1', '6', '86', '80', '45000.00', '3600000', '', '1518079507', NULL, NULL),
(94, 'add', '16', '78', '105', '120', '110.00', '13200', '', '1518079727', NULL, NULL),
(95, 'add', '16', '78', '106', '150', '122.00', '18300', '', '1518079898', NULL, NULL),
(96, 'add', '16', '79', '107', '120', '145.00', '17400', '', '1518080173', NULL, NULL),
(97, 'add', '16', '79', '108', '80', '144.00', '11520', '', '1518080359', NULL, NULL),
(98, 'add', '16', '79', '110', '50', '75.00', '3750', '', '1518081142', NULL, NULL),
(99, 'add', '16', '79', '109', '60', '140.00', '8400', '', '1518081151', NULL, NULL),
(100, 'add', '16', '79', '111', '100', '95.00', '9500', '', '1518081235', NULL, NULL),
(101, 'add', '16', '79', '112', '150', '50.00', '7500', '', '1518081346', NULL, NULL),
(102, 'add', '16', '80', '113', '150', '95.00', '14250', '', '1518081575', NULL, NULL),
(103, 'add', '16', '80', '114', '130', '98.00', '12740', '', '1518081650', NULL, NULL),
(104, 'add', '16', '80', '115', '200', '100.00', '20000', '', '1518081994', NULL, NULL),
(105, 'add', '5', '27', '117', '85', '45.00', '3825', '', '1518082666', NULL, NULL),
(106, 'add', '16', '80', '116', '100', '92.00', '9200', '', '1518082674', NULL, NULL),
(107, 'add', '5', '27', '118', '80', '56.00', '4480', '', '1518082825', NULL, NULL),
(108, 'add', '5', '27', '120', '80', '65.00', '5200', '', '1518083101', NULL, NULL),
(109, 'add', '5', '27', '119', '80', '65.00', '5200', '', '1518083110', NULL, NULL),
(110, 'add', '5', '28', '121', '50', '79.00', '3950', '', '1518083320', NULL, NULL),
(111, 'add', '5', '28', '122', '60', '55.00', '3300', '', '1518083433', NULL, NULL),
(112, 'add', '5', '28', '123', '60', '66.00', '3960', '', '1518083632', NULL, NULL),
(113, 'add', '5', '29', '124', '82', '45.00', '3690', '', '1518083830', NULL, NULL),
(114, 'add', '5', '29', '124', '56', '45.00', '2520', '', '1518084168', NULL, NULL),
(115, 'add', '5', '30', '126', '55', '90.00', '4950', '', '1518084178', NULL, NULL),
(116, 'add', '5', '30', '127', '80', '125.00', '10000', '', '1518084186', NULL, NULL),
(117, 'add', '5', '29', '125', '50', '56.00', '2800', '', '1518084194', NULL, NULL),
(118, 'add', '4', '37', '128', '80', '120.00', '9600', '', '1518086137', NULL, NULL),
(119, 'add', '4', '37', '129', '100', '145.00', '14500', '', '1518086245', NULL, NULL),
(120, 'add', '1', '2', '130', '50', '32000.00', '1600000', '', '1518091220', NULL, NULL),
(121, 'destroy', '4', '36', '75', '1', NULL, '0', 'sale', '1518760022', '11', NULL),
(122, 'destroy', '5', '28', '58', '1', NULL, '0', 'sale', '1518760022', '11', NULL),
(123, 'destroy', '5', '28', '57', '1', NULL, '0', 'sale', '1518760022', '11', NULL),
(124, 'destroy', '5', '27', '54', '1', NULL, '0', 'sale', '1518760022', '11', NULL),
(125, 'destroy', '5', '29', '50', '1', NULL, '0', 'sale', '1518760022', '11', NULL),
(126, 'destroy', '12', '66', '98', '1', NULL, '0', 'sale', '1519796196', '12', NULL),
(127, 'destroy', '0', '0', '101', '1', NULL, '0', 'sale', '1521374128', '15', NULL),
(128, 'destroy', '0', '0', '101', '1', NULL, '0', 'sale', '1521430987', '16', NULL),
(129, 'destroy', '13', '75', '99', '1', NULL, '0', 'sale', '1521541152', '17', NULL),
(130, 'destroy', '0', '0', '102', '1', NULL, '0', 'sale', '1521616455', '18', NULL),
(131, 'destroy', '0', '0', '102', '7', NULL, '0', 'sale', '1521616557', '19', NULL),
(132, 'destroy', '0', '0', '102', '1', NULL, '0', 'sale', '1521616913', '20', NULL),
(133, 'add', '4', '10', '37', '500', '150.00', '75000', '', '1522827326', NULL, NULL),
(134, 'add', '1', '5', '2', '100', '18000.00', '1800000', '', '1522827360', NULL, NULL),
(135, 'add', '4', '10', '7', '1000', '35.00', '35000', '', '1522827390', NULL, NULL),
(136, 'add', '4', '34', '14', '150', '320.00', '0', '', '1522827433', NULL, NULL),
(137, 'add', '4', '37', '15', '200', '130.00', '0', '', '1522827463', NULL, NULL),
(138, 'add', '4', '39', '16', '200', '110.00', '0', '', '1522827488', NULL, NULL),
(139, 'add', '4', '35', '17', '100', '120.00', '12000', '', '1522827994', NULL, NULL),
(140, 'add', '4', '40', '18', '150', '100.00', '15000', '', '1522828021', NULL, NULL),
(141, 'add', '4', '35', '35', '200', '240.00', '0', '', '1522828073', NULL, NULL),
(142, 'add', '4', '9', '26', '200', '10.00', '0', '', '1522828105', NULL, NULL),
(143, 'add', '4', '37', '25', '200', '250.00', '50000', '', '1522828132', NULL, NULL),
(144, 'add', '4', '37', '24', '200', '400.00', '0', '', '1522828163', NULL, NULL),
(145, 'add', '4', '37', '23', '300', '210.00', '0', '', '1522828256', NULL, NULL),
(146, 'add', '4', '8', '36', '400', '210.00', '0', '', '1522828286', NULL, NULL),
(147, 'add', '4', '8', '12', '300', '180.00', '0', '', '1522828328', NULL, NULL),
(148, 'add', '4', '11', '11', '250', '6500.00', '0', '', '1522828413', NULL, NULL),
(149, 'add', '5', '28', '9', '250', '120.00', '0', '', '1522828467', NULL, NULL),
(150, 'add', '5', '30', '8', '300', '650.00', '195000', '', '1522828488', NULL, NULL),
(151, 'add', '17', '78', '103', '30', '4.40', '132', '', '1522837440', NULL, NULL),
(152, 'add', '17', '78', '104', '50', '4.72', '236', '', '1522837706', NULL, NULL),
(153, 'add', '17', '78', '105', '20', '5.50', '110', '', '1522837862', NULL, NULL),
(154, 'add', '18', '79', '106', '15', '18.30', '274.5', '', '1522838553', NULL, NULL),
(155, 'add', '18', '79', '107', '12', '22.63', '271.56', '', '1522838928', NULL, NULL),
(156, 'add', '21', '80', '108', '5', '57.53', '287.65', '', '1522841201', NULL, NULL),
(157, 'add', '21', '80', '109', '1', '58.77', '58.77', '', '1522841562', NULL, NULL),
(158, 'add', '16', '81', '110', '5', '719.99', '3599.95', '', '1522842237', NULL, NULL),
(159, 'add', '16', '81', '111', '3', '209.99', '629.97', '', '1522842721', NULL, NULL),
(160, 'add', '16', '81', '112', '2', '629.99', '1259.98', '', '1522842852', NULL, NULL),
(161, 'add', '1', '3', '124', '200', '54000.00', '10800000', '', '1522922112', NULL, NULL),
(162, 'add', '1', '3', '125', '300', '59000.00', '17700000', '', '1522922301', NULL, NULL),
(163, 'add', '5', '27', '127', '25', '169.99', '4249.75', '', '1522925860', NULL, NULL),
(164, 'add', '5', '27', '127', '75', '169.99', '12749.25', '', '1522925881', NULL, NULL),
(165, 'add', '5', '27', '128', '100', '372.06', '37206', '', '1522926055', NULL, NULL),
(166, 'add', '5', '27', '130', '500', '79.20', '0', '', '1522930929', NULL, NULL),
(167, 'add', '5', '28', '129', '500', '50.00', '0', '', '1522930942', NULL, NULL),
(168, 'destroy', '5', '27', '130', '1', NULL, '0', 'sale', '1523524543', '21', NULL),
(169, 'destroy', '1', '3', '125', '1', NULL, '0', 'sale', '1523535450', '22', NULL),
(170, 'destroy', '5', '27', '130', '1', NULL, '0', 'sale', '1523535591', '23', NULL),
(171, 'destroy', '5', '27', '128', '1', NULL, '0', 'sale', '1523535591', '23', NULL),
(172, 'destroy', '0', '0', '126', '1', NULL, '0', 'sale', '1523852571', '24', NULL),
(173, 'destroy', '0', '0', '119', '1', NULL, '0', 'sale', '1523852571', '24', NULL),
(174, 'add', '1', '6', '131', '25', '26999.00', '674975', '', '1523857079', NULL, NULL),
(175, 'add', '1', '6', '132', '10', '4999.00', '49990', '', '1523861112', NULL, NULL),
(176, 'add', '1', '63', '133', '5', '117139.33', '585696.65', '', '1523863280', NULL, NULL),
(177, 'add', '1', '63', '134', '10', '794782.29', '7947822.9', '', '1523863576', NULL, NULL),
(178, 'add', '5', '28', '135', '200', '63.75', '12750', '', '1523867199', NULL, NULL),
(179, 'add', '5', '28', '136', '150', '44.99', '6748.5', '', '1523867819', NULL, NULL),
(180, 'add', '5', '29', '137', '500', '52.99', '26495', '', '1523868841', NULL, NULL),
(181, 'add', '5', '29', '138', '300', '31.80', '9540', '', '1523869110', NULL, NULL),
(182, 'add', '5', '29', '139', '300', '45.99', '13797', '', '1523869336', NULL, NULL),
(183, 'add', '5', '30', '140', '50', '26724.99', '1336249.5', '', '1523870296', NULL, NULL),
(184, 'add', '5', '30', '141', '100', '664.99', '66499', '', '1523870578', NULL, NULL),
(185, 'add', '16', '81', '142', '100', '794.00', '79400', '', '1523871020', NULL, NULL),
(186, 'add', '16', '81', '143', '100', '625.00', '62500', '', '1523871351', NULL, NULL),
(187, 'add', '16', '81', '144', '200', '409.00', '81800', '', '1523871782', NULL, NULL),
(188, 'add', '16', '83', '145', '50', '70.72', '3536', '', '1523872591', NULL, NULL),
(189, 'add', '16', '83', '146', '100', '11.58', '1158', '', '1523872944', NULL, NULL),
(190, 'add', '16', '83', '147', '140', '91.97', '12875.8', '', '1523873194', NULL, NULL),
(191, 'add', '16', '83', '148', '200', '96.28', '19256', '', '1523873449', NULL, NULL),
(192, 'add', '16', '83', '149', '50', '105.97', '5298.5', '', '1523873845', NULL, NULL),
(193, 'add', '16', '83', '150', '200', '36.43', '7286', '', '1523874195', NULL, NULL),
(194, 'add', '4', '9', '151', '300', '43.98', '13193.999999999998', '', '1523874895', NULL, NULL),
(195, 'add', '4', '10', '152', '250', '13.59', '3397.5', '', '1523875175', NULL, NULL),
(196, 'add', '4', '9', '153', '300', '19.99', '5996.999999999999', '', '1523875678', NULL, NULL),
(197, 'add', '4', '10', '154', '200', '16.29', '3258', '', '1523875974', NULL, NULL),
(198, 'add', '4', '11', '155', '50', '18.99', '949.4999999999999', '', '1523876663', NULL, NULL),
(199, 'add', '4', '11', '156', '10', '4530.00', '45300', '', '1523876990', NULL, NULL),
(200, 'add', '4', '37', '157', '100', '51.00', '5100', '', '1523877983', NULL, NULL),
(201, 'add', '4', '37', '158', '120', '158.99', '19078.800000000003', '', '1523878181', NULL, NULL),
(202, 'destroy', '4', '37', '158', '1', NULL, '0', 'sale', '1524471441', '29', NULL),
(203, 'add', '16', '87', '159', '500', '4500.00', '2250000', '', '1524784507', NULL, NULL),
(204, 'add', '16', '85', '160', '500', '1000.00', '0', '', '1524784752', NULL, NULL),
(205, 'add', '16', '88', '161', '500', '800.00', '0', '', '1524784866', NULL, NULL),
(206, 'add', '16', '86', '162', '500', '900.00', '450000', '', '1524845655', NULL, NULL),
(207, 'add', '16', '81', '166', '12', '125.00', '1500', '', '1524911159', NULL, '{\"type\":\"vendor\",\"id\":\"9\"}'),
(208, 'add', '16', '81', '168', '5', '1190.00', '5950', '', '1524984498', NULL, '{\"type\":\"vendor\",\"id\":\"10\"}'),
(209, 'add', '16', '83', '169', '5', '800.00', '4000', '', '1524984850', NULL, '{\"type\":\"vendor\",\"id\":\"10\"}'),
(210, 'add', '16', '81', '170', '25', '1195.00', '29875', '', '1524984898', NULL, '{\"type\":\"vendor\",\"id\":\"10\"}'),
(211, 'add', '16', '81', '171', '25', '1190.00', '29750', '', '1524985905', NULL, '{\"type\":\"vendor\",\"id\":\"10\"}'),
(212, 'destroy', '16', '81', '171', '1', NULL, '0', 'sale', '1525079391', '38', NULL),
(213, 'destroy', '1', '3', '125', '1', NULL, '0', 'sale', '1526119327', '39', NULL),
(214, 'destroy', '1', '5', '2', '2', NULL, '0', 'sale', '1527064445', '44', NULL),
(215, 'destroy', '16', '85', '160', '1', NULL, '0', 'sale', '1528016175', '45', NULL),
(216, 'add', '4', '11', '172', '50', '40.00', '2000', '', '1528779289', NULL, NULL),
(217, 'add', '4', '11', '173', '50', '62.00', '3100', '', '1528779815', NULL, NULL),
(218, 'add', '4', '11', '174', '50', '30.00', '1500', '', '1528780266', NULL, NULL),
(219, 'add', '5', '89', '175', '100', '68.00', '6800', '', '1528785307', NULL, NULL),
(220, 'add', '5', '89', '176', '120', '12.00', '1440', '', '1528785411', NULL, NULL),
(221, 'add', '5', '89', '177', '45', '10.00', '450', '', '1528785743', NULL, NULL),
(222, 'add', '5', '89', '178', '60', '74.80', '4488', '', '1528786064', NULL, NULL),
(223, 'add', '16', '88', '180', '10', '3500.00', '35000', '', '1528787255', NULL, NULL),
(224, 'destroy', '13', '74', '182', '1', NULL, '0', 'sale', '1529556702', '56', NULL),
(225, 'destroy', '16', '81', '144', '1', NULL, '0', 'sale', '1530089371', '62', NULL),
(226, 'add', '4', '8', '183', '25', '180.00', '4500', '', '1530166850', NULL, '{\"type\":\"vendor\",\"id\":\"16\"}'),
(227, 'destroy', '4', '8', '183', '1', NULL, '0', 'sale', '1530166970', '63', NULL),
(228, 'destroy', '5', '89', '175', '1', NULL, '0', 'sale', '1530174197', '64', NULL),
(229, 'destroy', '0', '0', '179', '1', NULL, '0', 'sale', '1530174441', '65', NULL),
(230, 'destroy', '5', '89', '178', '1', NULL, '0', 'sale', '1530176426', '67', NULL),
(231, 'destroy', '5', '89', '175', '1', NULL, '0', 'sale', '1530177758', '68', NULL),
(232, 'destroy', '4', '11', '174', '1', NULL, '0', 'sale', '1530177758', '68', NULL),
(233, 'destroy', '16', '88', '180', '1', NULL, '0', 'sale', '1530177758', '68', NULL),
(234, 'destroy', '4', '11', '174', '1', NULL, '0', 'sale', '1530177969', '69', NULL),
(235, 'destroy', '5', '89', '175', '1', NULL, '0', 'sale', '1530177969', '69', NULL),
(236, 'destroy', '4', '11', '174', '1', NULL, '0', 'sale', '1530178305', '70', NULL),
(237, 'destroy', '16', '88', '180', '1', NULL, '0', 'sale', '1530178305', '70', NULL),
(238, 'destroy', '5', '89', '178', '1', NULL, '0', 'sale', '1530178457', '71', NULL),
(239, 'destroy', '5', '89', '175', '1', NULL, '0', 'sale', '1530178457', '71', NULL),
(240, 'destroy', '4', '8', '183', '1', NULL, '0', 'sale', '1530178654', '72', NULL),
(241, 'destroy', '0', '0', '123', '1', NULL, '0', 'sale', '1530178654', '72', NULL),
(242, 'destroy', '16', '88', '180', '1', NULL, '0', 'sale', '1530178654', '72', NULL),
(243, 'destroy', '4', '8', '183', '1', NULL, '0', 'sale', '1530178827', '73', NULL),
(244, 'destroy', '4', '11', '174', '1', NULL, '0', 'sale', '1530179102', '74', NULL),
(245, 'destroy', '4', '11', '172', '1', NULL, '0', 'sale', '1530179102', '74', NULL),
(246, 'destroy', '4', '8', '183', '1', NULL, '0', 'sale', '1530180438', '75', NULL),
(247, 'destroy', '0', '0', '163', '1', NULL, '0', 'sale', '1530181282', '76', NULL),
(248, 'destroy', '4', '8', '183', '1', NULL, '0', 'sale', '1530181282', '76', NULL),
(249, 'destroy', '4', '8', '183', '1', NULL, '0', 'sale', '1530181401', '77', NULL),
(250, 'destroy', '4', '8', '183', '1', NULL, '0', 'sale', '1530181508', '78', NULL),
(251, 'destroy', '4', '8', '183', '2', NULL, '0', 'sale', '1530182283', '79', NULL),
(252, 'destroy', '4', '8', '183', '1', NULL, '0', 'sale', '1530182577', '80', NULL),
(253, 'destroy', '4', '8', '183', '1', NULL, '0', 'sale', '1530182891', '81', NULL),
(254, 'destroy', '4', '8', '183', '1', NULL, '0', 'sale', '1530183079', '82', NULL),
(255, 'destroy', '16', '81', '171', '1', NULL, '0', 'sale', '1530421619', '83', NULL),
(256, 'destroy', '16', '81', '171', '1', NULL, '0', 'sale', '1530422129', '84', NULL),
(257, 'destroy', '5', '89', '178', '1', NULL, '0', 'sale', '1530422501', '85', NULL),
(258, 'destroy', '16', '81', '171', '1', NULL, '0', 'sale', '1530423355', '86', NULL),
(259, 'destroy', '5', '27', '130', '1', NULL, '0', 'sale', '1530423355', '86', NULL),
(260, 'destroy', '16', '81', '171', '1', NULL, '0', 'sale', '1530423911', '87', NULL),
(261, 'add', '21', '80', '184', '500', '189.99', '94995', '', '1530427971', NULL, '{\"type\":\"vendor\",\"id\":\"16\"}'),
(262, 'add', '21', '80', '185', '50', '40.99', '2049.5', '', '1530428579', NULL, '{\"type\":\"vendor\",\"id\":\"16\"}'),
(263, 'add', '16', '83', '186', '300', '249.00', '74700', '', '1530428936', NULL, '{\"type\":\"vendor\",\"id\":\"16\"}'),
(264, 'add', '16', '86', '187', '50', '1049.00', '52450', '', '1530429328', NULL, '{\"type\":\"vendor\",\"id\":\"16\"}'),
(265, 'add', '5', '90', '188', '100', '154.99', '15499', '', '1530429645', NULL, '{\"type\":\"vendor\",\"id\":\"16\"}'),
(266, 'add', '5', '90', '189', '500', '38.98', '19490', '', '1530431736', NULL, '{\"type\":\"vendor\",\"id\":\"16\"}'),
(267, 'add', '5', '30', '190', '500', '99.84', '49920', '', '1530434062', NULL, '{\"type\":\"vendor\",\"id\":\"16\"}'),
(268, 'add', '5', '28', '191', '100', '56.99', '5699', '', '1530434437', NULL, '{\"type\":\"vendor\",\"id\":\"16\"}'),
(269, 'add', '21', '80', '192', '200', '385.00', '77000', '', '1530435423', NULL, '{\"type\":\"vendor\",\"id\":\"12\"}'),
(270, 'add', '21', '80', '193', '300', '80.00', '24000', '', '1530435832', NULL, '{\"type\":\"vendor\",\"id\":\"12\"}'),
(271, 'add', '21', '80', '194', '50', '199.99', '9999.5', '', '1530436258', NULL, '{\"type\":\"vendor\",\"id\":\"12\"}'),
(272, 'add', '21', '80', '195', '400', '39.99', '15996', '', '1530436731', NULL, '{\"type\":\"vendor\",\"id\":\"12\"}'),
(273, 'add', '21', '80', '196', '100', '230.97', '23097', '', '1530437119', NULL, '{\"type\":\"vendor\",\"id\":\"12\"}'),
(274, 'add', '4', '40', '197', '200', '23.99', '4798', '', '1530437673', NULL, '{\"type\":\"vendor\",\"id\":\"1\"}'),
(275, 'add', '4', '35', '198', '500', '34.99', '17495', '', '1530438201', NULL, '{\"type\":\"vendor\",\"id\":\"1\"}'),
(276, 'add', '4', '36', '199', '140', '34.98', '4897.2', '', '1530438511', NULL, '{\"type\":\"vendor\",\"id\":\"1\"}'),
(277, 'add', '4', '11', '200', '600', '12.97', '7782', '', '1530439263', NULL, '{\"type\":\"vendor\",\"id\":\"1\"}'),
(278, 'add', '16', '87', '201', '50', '1049.00', '52450', '', '1530440570', NULL, '{\"type\":\"vendor\",\"id\":\"7\"}'),
(279, 'add', '16', '87', '202', '300', '28.99', '8697', '', '1530441002', NULL, '{\"type\":\"vendor\",\"id\":\"7\"}'),
(280, 'add', '16', '86', '203', '100', '49.34', '4934', '', '1530441771', NULL, '{\"type\":\"vendor\",\"id\":\"7\"}'),
(281, 'add', '16', '81', '204', '200', '249.99', '49998', '', '1530442235', NULL, '{\"type\":\"vendor\",\"id\":\"7\"}'),
(282, 'add', '16', '81', '205', '500', '49.99', '24995', '', '1530442480', NULL, '{\"type\":\"vendor\",\"id\":\"7\"}'),
(283, 'add', '16', '85', '206', '100', '399.00', '39900', '', '1530444192', NULL, '{\"type\":\"vendor\",\"id\":\"16\"}'),
(284, 'add', '17', '93', '207', '500', '39.00', '19500', '', '1530509804', NULL, '{\"type\":\"vendor\",\"id\":\"9\"}'),
(285, 'add', '17', '78', '208', '500', '40.00', '20000', '', '1530511789', NULL, '{\"type\":\"vendor\",\"id\":\"9\"}'),
(286, 'add', '17', '91', '209', '400', '28.50', '11400', '', '1530512382', NULL, '{\"type\":\"vendor\",\"id\":\"9\"}'),
(287, 'add', '17', '96', '210', '100', '75.00', '7500', '', '1530512762', NULL, '{\"type\":\"vendor\",\"id\":\"9\"}'),
(288, 'add', '17', '93', '211', '500', '28.00', '14000', '', '1530513333', NULL, '{\"type\":\"vendor\",\"id\":\"9\"}'),
(289, 'add', '1', '1', '212', '50', '63750.00', '3187500', '', '1530514188', NULL, '{\"type\":\"vendor\",\"id\":\"10\"}'),
(290, 'add', '1', '1', '213', '150', '39190.00', '5878500', '', '1530514879', NULL, '{\"type\":\"vendor\",\"id\":\"10\"}'),
(291, 'add', '1', '2', '214', '1000', '535500.00', '535500000', '', '1530515357', NULL, '{\"type\":\"vendor\",\"id\":\"10\"}'),
(292, 'add', '1', '1', '215', '100', '15350.00', '1535000', '', '1530523300', NULL, '{\"type\":\"vendor\",\"id\":\"10\"}'),
(293, 'add', '1', '1', '216', '100', '44100.00', '4410000', '', '1530523869', NULL, '{\"type\":\"vendor\",\"id\":\"10\"}'),
(294, 'destroy', '0', '0', '123', '1', NULL, '0', 'sale', '1530605298', '89', NULL),
(295, 'destroy', '16', '88', '180', '6', NULL, '0', 'sale', '1530703163', '90', NULL),
(296, 'destroy', '5', '89', '175', '95', NULL, '0', 'sale', '1530708356', '91', NULL),
(297, 'destroy', '4', '11', '172', '1', NULL, '0', 'sale', '1530764395', '93', NULL),
(298, 'destroy', '0', '0', '123', '1', NULL, '0', 'sale', '1530764928', '94', NULL),
(299, 'destroy', '4', '11', '174', '1', NULL, '0', 'sale', '1530765068', '95', NULL),
(300, 'destroy', '5', '89', '178', '1', NULL, '0', 'sale', '1530765242', '96', NULL),
(301, 'destroy', '4', '11', '172', '1', NULL, '0', 'sale', '1530779882', '99', NULL),
(302, 'destroy', '0', '0', '179', '1', NULL, '0', 'sale', '1530780344', '100', NULL),
(303, 'destroy', '5', '30', '190', '1', NULL, '0', 'sale', '1530780876', '103', NULL),
(304, 'destroy', '0', '0', '122', '1', NULL, '0', 'sale', '1530781627', '104', NULL),
(305, 'destroy', '4', '11', '172', '1', NULL, '0', 'sale', '1531038537', '107', NULL),
(306, 'destroy', '4', '11', '172', '1', NULL, '0', 'sale', '1531038756', '108', NULL),
(307, 'destroy', '1', '2', '214', '1', NULL, '0', 'sale', '1531629840', '134', NULL),
(308, 'destroy', '4', '11', '173', '1', NULL, '0', 'sale', '1531633208', '142', NULL),
(309, 'destroy', '4', '11', '172', '1', NULL, '0', 'sale', '1531633208', '142', NULL),
(310, 'destroy', '16', '81', '142', '1', NULL, '0', 'sale', '1531633431', '147', NULL),
(311, 'destroy', '16', '86', '162', '1', NULL, '0', 'sale', '1531633712', '148', NULL),
(312, 'destroy', '5', '29', '138', '1', NULL, '0', 'sale', '1531633810', '149', NULL),
(313, 'destroy', '0', '0', '121', '16', NULL, '0', 'sale', '1531636774', '150', NULL),
(314, 'add', '5', '28', '217', '200', '88.95', '17790', '', '1531637332', NULL, '{\"type\":\"vendor\",\"id\":\"17\"}'),
(315, 'add', '5', '28', '217', '100', '88.95', '8895', '', '1531637661', NULL, '{\"type\":\"vendor\",\"id\":\"17\"}'),
(316, 'destroy', '4', '11', '172', '44', NULL, '0', 'sale', '1531638155', '151', NULL),
(317, 'destroy', '4', '11', '155', '50', NULL, '0', 'sale', '1531638276', '152', NULL),
(318, 'destroy', '4', '11', '174', '45', NULL, '0', 'sale', '1531638403', '153', NULL),
(319, 'destroy', '4', '11', '200', '600', NULL, '0', 'sale', '1531638867', '154', NULL),
(320, 'destroy', '5', '28', '217', '1', NULL, '0', 'sale', '1531638930', '155', NULL),
(321, 'destroy', '5', '89', '178', '56', NULL, '0', 'sale', '1531639886', '156', NULL),
(322, 'destroy', '0', '0', '123', '2', NULL, '0', 'sale', '1531640276', '157', NULL),
(323, 'destroy', '0', '0', '123', '26', NULL, '0', 'sale', '1531640427', '158', NULL),
(324, 'destroy', '4', '11', '173', '49', NULL, '0', 'sale', '1531640653', '159', NULL),
(325, 'destroy', '0', '0', '122', '20', NULL, '0', 'sale', '1531640792', '160', NULL),
(326, 'destroy', '5', '28', '191', '100', NULL, '0', 'sale', '1531641121', '161', NULL),
(327, 'add', '16', '88', '180', '500', '3500.00', '1750000', '', '1531642809', NULL, NULL),
(328, 'add', '4', '11', '200', '500', '12.97', '6485', '', '1531642840', NULL, NULL),
(329, 'add', '4', '11', '174', '500', '30.00', '15000', '', '1531642856', NULL, NULL),
(330, 'add', '4', '11', '172', '500', '40.00', '20000', '', '1531642878', NULL, NULL),
(331, 'add', '4', '11', '155', '500', '18.99', '9495', '', '1531642899', NULL, NULL),
(332, 'destroy', '4', '11', '174', '500', NULL, '0', 'sale', '1531733208', '165', NULL),
(333, 'destroy', '16', '85', '206', '1', NULL, '0', 'sale', '1532334222', '168', NULL),
(334, 'destroy', '5', '90', '189', '1', NULL, '0', 'sale', '1532409777', '170', NULL),
(335, 'add', '5', '27', '220', '125', '110.00', '13750', '', '1554029932', NULL, '{\"type\":\"vendor\",\"id\":\"18\"}'),
(336, 'destroy', '5', '27', '220', '1', NULL, '0', 'sale', '1554030325', '185', NULL),
(337, 'destroy', '13', '75', '221', '1', NULL, '0', 'sale', '1554033364', '186', NULL),
(338, 'destroy', '13', '75', '221', '1', NULL, '0', 'sale', '1554033644', '187', NULL),
(339, 'destroy', '12', '66', '98', '1', NULL, '0', 'sale', '1554103346', '188', NULL),
(340, 'destroy', '12', '66', '98', '1', NULL, '0', 'sale', '1554103474', '189', NULL),
(391, 'add', '54', '168', '465', '25', '1000', '25000', '', '1609405004', NULL, NULL),
(342, 'destroy', '4', '11', '172', '1', NULL, '0', 'sale', '1560848821', '193', NULL),
(343, 'destroy', '13', '73', '100', '1', NULL, '0', 'sale', '1560853989', '194', NULL),
(344, 'add', '24', '114', '241', '10', '20.00', '200', 'available', '1576917506', NULL, NULL),
(345, 'destroy', '24', '114', '241', '2', NULL, '0', 'sale', '1576917603', '195', NULL),
(346, 'add', '24', '114', '240', '100', '20.00', '2000', '', '1577177464', NULL, NULL),
(347, 'add', '24', '114', '241', '4', '20', '80', '3', '1606107670', NULL, NULL),
(348, 'destroy', '24', '114', '241', '4', NULL, '0', '34', '1606107692', NULL, NULL),
(357, 'add', '31', '117', '246', '8', '80', '640', '', '1606214505', NULL, NULL),
(355, 'add', '31', '117', '243', '9', '80', '720', '', '1606214017', NULL, NULL),
(356, 'add', '31', '117', '245', '6', '80', '480', '', '1606214335', NULL, NULL),
(358, 'add', '31', '117', '247', '7', '80', '560', '', '1606214658', NULL, NULL),
(359, 'add', '32', '150', '248', '9', '36', '324', '', '1606216080', NULL, NULL),
(360, 'add', '32', '152', '249', '9', '42', '378', '', '1606216273', NULL, NULL),
(361, 'add', '32', '151', '250', '9', '48', '432', '', '1606216416', NULL, NULL),
(393, 'add', '54', '168', '470', '2', '100', '200', '', '1609571409', NULL, NULL),
(392, 'add', '54', '169', '466', '25', '1000', '25000', '', '1609407069', NULL, NULL),
(364, 'add', '31', '117', '252', '10', '20', '200', '', '1606218405', NULL, NULL),
(365, 'add', '31', '117', '253', '10', '20', '200', '', '1606218532', NULL, NULL),
(366, 'add', '41', '132', '254', '10', '1', '10', '', '1606218772', NULL, NULL),
(367, 'add', '33', '153', '255', '10', '7', '70', '', '1606219984', NULL, NULL),
(368, 'add', '33', '153', '256', '10', '7', '70', '', '1606220125', NULL, NULL),
(369, 'add', '33', '153', '257', '10', '7', '70', '', '1606220265', NULL, NULL),
(370, 'add', '33', '153', '258', '10', '7', '70', '', '1606220380', NULL, NULL),
(371, 'add', '33', '153', '259', '10', '7', '70', '', '1606220487', NULL, NULL),
(372, 'add', '33', '154', '260', '10', '15', '150', '', '1606220836', NULL, NULL),
(373, 'add', '33', '154', '261', '10', '15', '150', '', '1606220914', NULL, NULL),
(374, 'add', '33', '155', '262', '10', '25', '250', '', '1606221022', NULL, NULL),
(375, 'add', '41', '132', '263', '10', '10', '100', '', '1606300359', NULL, NULL),
(376, 'add', '31', '118', '264', '10', '10', '100', '', '1606300641', NULL, NULL),
(377, 'add', '31', '118', '265', '10', '5', '50', '', '1606300745', NULL, NULL),
(378, 'add', '31', '118', '266', '10', '10', '100', '', '1606300871', NULL, NULL),
(379, 'add', '31', '118', '267', '10', '10', '100', '', '1606301000', NULL, NULL),
(380, 'add', '31', '118', '268', '10', '10', '100', '', '1606301134', NULL, NULL),
(381, 'add', '31', '118', '269', '10', '10', '100', '', '1606301468', NULL, NULL),
(382, 'add', '31', '118', '270', '10', '10', '100', '', '1606301613', NULL, NULL),
(383, 'add', '35', '156', '271', '10', '75', '750', '', '1606302541', NULL, NULL),
(384, 'add', '35', '156', '272', '10', '75', '750', '', '1606302669', NULL, NULL),
(385, 'add', '35', '156', '273', '10', '35', '350', '', '1606302781', NULL, NULL),
(386, 'add', '35', '156', '274', '10', '30', '300', '', '1606302972', NULL, NULL),
(387, 'add', '35', '156', '275', '10', '17', '170', '', '1606303082', NULL, NULL),
(388, 'add', '37', '122', '276', '10', '23', '230', '', '1606562379', NULL, NULL),
(389, 'add', '37', '124', '277', '10', '23', '230', '', '1606562582', NULL, NULL),
(394, 'add', '56', '171', '471', '10', '4500', '45000', '', '1609646895', NULL, NULL),
(395, 'add', '56', '171', '471', '11', '4500', '49500', '', '1609657577', NULL, NULL),
(396, 'add', '55', '170', '472', '25', '200', '5000', '', '1609658054', NULL, NULL),
(397, 'add', '55', '170', '473', '25', '200', '5000', '', '1609658309', NULL, NULL),
(398, 'add', '55', '170', '474', '25', '210', '5250', '', '1609658474', NULL, NULL),
(399, 'add', '55', '170', '475', '25', '150', '3750', '', '1609658767', NULL, NULL),
(400, 'add', '55', '170', '476', '25', '599', '14975', '', '1609659849', NULL, NULL),
(401, 'add', '55', '170', '477', '25', '200', '5000', '', '1609660194', NULL, NULL),
(402, 'add', '55', '170', '478', '20', '110', '2200', '', '1609660410', NULL, NULL),
(403, 'add', '55', '170', '479', '20', '100', '2000', '', '1609660590', NULL, NULL),
(404, 'add', '55', '170', '480', '10', '175', '1750', '', '1609662672', NULL, NULL),
(405, 'add', '55', '170', '481', '10', '150', '1500', '', '1609662852', NULL, NULL),
(406, 'add', '57', '173', '482', '10', '200', '2000', '', '1610791490', NULL, NULL),
(407, 'add', '57', '173', '483', '10', '200', '2000', '', '1610791965', NULL, NULL),
(408, 'add', '57', '173', '484', '10', '600', '6000', '', '1610796255', NULL, NULL),
(409, 'add', '57', '173', '485', '10', '400', '4000', '', '1610796887', NULL, NULL),
(410, 'add', '57', '173', '486', '10', '400', '4000', '', '1610797120', NULL, NULL),
(411, 'add', '57', '173', '504', '10', '250', '2500', '', '1610959020', NULL, NULL),
(412, 'add', '57', '173', '503', '10', '400', '4000', '', '1610959034', NULL, NULL),
(413, 'add', '57', '173', '502', '10', '250', '2500', '', '1610959048', NULL, NULL),
(414, 'add', '57', '173', '501', '10', '300', '3000', '', '1610959059', NULL, NULL),
(415, 'add', '57', '173', '500', '10', '400', '4000', '', '1610959074', NULL, NULL),
(416, 'add', '57', '173', '499', '10', '300', '3000', '', '1610959090', NULL, NULL),
(417, 'add', '57', '173', '498', '10', '300', '3000', '', '1610959104', NULL, NULL),
(418, 'add', '57', '173', '497', '10', '300', '3000', '', '1610959115', NULL, NULL),
(419, 'add', '57', '173', '496', '10', '250', '2500', '', '1610959125', NULL, NULL),
(420, 'add', '57', '173', '495', '10', '300', '3000', '', '1610959137', NULL, NULL),
(421, 'add', '57', '173', '487', '10', '300', '3000', '', '1610959157', NULL, NULL),
(422, 'add', '57', '173', '493', '10', '250', '2500', '', '1610959172', NULL, NULL),
(423, 'add', '57', '173', '492', '10', '300', '3000', '', '1610959189', NULL, NULL),
(424, 'add', '57', '173', '491', '10', '250', '2500', '', '1610959205', NULL, NULL),
(425, 'add', '57', '173', '488', '10', '300', '3000', '', '1610959227', NULL, NULL),
(426, 'add', '57', '173', '490', '10', '250', '2500', '', '1610959242', NULL, NULL),
(427, 'add', '57', '173', '489', '10', '300', '3000', '', '1610959262', NULL, NULL),
(428, 'add', '57', '173', '518', '10', '275', '2750', '', '1610966027', NULL, NULL),
(429, 'add', '57', '173', '517', '10', '250', '2500', '', '1610966051', NULL, NULL),
(430, 'add', '57', '173', '519', '10', '250', '2500', '', '1610966110', NULL, NULL),
(431, 'add', '57', '173', '510', '10', '250', '2500', '', '1610966152', NULL, NULL),
(432, 'add', '57', '173', '516', '10', '300', '3000', '', '1610966167', NULL, NULL),
(433, 'add', '57', '173', '515', '10', '250', '2500', '', '1610966182', NULL, NULL),
(434, 'add', '57', '173', '514', '10', '250', '2500', '', '1610966198', NULL, NULL),
(435, 'add', '57', '173', '511', '10', '250', '2500', '', '1610966211', NULL, NULL),
(436, 'add', '57', '173', '512', '10', '350', '3500', '', '1610966222', NULL, NULL),
(437, 'add', '57', '173', '513', '10', '250', '2500', '', '1610966236', NULL, NULL),
(438, 'add', '57', '173', '509', '10', '150', '1500', '', '1610966263', NULL, NULL),
(439, 'add', '57', '173', '520', '10', '300', '3000', '', '1610966277', NULL, NULL),
(440, 'add', '57', '173', '525', '10', '300', '3000', '', '1610970333', NULL, NULL),
(441, 'add', '57', '173', '524', '10', '400', '4000', '', '1610970340', NULL, NULL),
(442, 'add', '57', '173', '523', '10', '250', '2500', '', '1610970349', NULL, NULL),
(443, 'add', '57', '173', '522', '10', '300', '3000', '', '1610970358', NULL, NULL),
(444, 'add', '57', '173', '521', '10', '300', '3000', '', '1610970368', NULL, NULL),
(445, 'add', '57', '174', '540', '10', '150', '1500', '', '1611043477', NULL, NULL),
(446, 'add', '57', '174', '541', '22', '200', '4400', '', '1611043515', NULL, NULL),
(447, 'add', '57', '174', '539', '12', '150', '1800', '', '1611043548', NULL, NULL),
(448, 'add', '57', '175', '538', '5', '200', '1000', '', '1611043583', NULL, NULL),
(449, 'add', '57', '174', '537', '6', '100', '600', '', '1611043648', NULL, NULL),
(450, 'add', '57', '174', '536', '9', '100', '900', '', '1611043678', NULL, NULL),
(451, 'add', '57', '174', '535', '10', '100', '1000', '', '1611043700', NULL, NULL),
(452, 'add', '57', '174', '534', '12', '150', '1800', '', '1611043770', NULL, NULL),
(453, 'add', '57', '174', '533', '10', '100', '1000', '', '1611043802', NULL, NULL),
(454, 'add', '57', '174', '532', '5', '100', '500', '', '1611043858', NULL, NULL),
(455, 'add', '57', '175', '542', '10', '300', '3000', '', '1611043881', NULL, NULL),
(456, 'add', '57', '175', '531', '10', '100', '1000', '', '1611043953', NULL, NULL),
(457, 'add', '57', '174', '530', '10', '100', '1000', '', '1611044001', NULL, NULL),
(458, 'add', '57', '175', '543', '10', '350', '3500', '', '1611044063', NULL, NULL),
(459, 'add', '57', '175', '529', '12', '300', '3600', '', '1611044094', NULL, NULL),
(460, 'add', '57', '174', '544', '10', '300', '3000', '', '1611044120', NULL, NULL),
(461, 'add', '57', '174', '528', '10', '150', '1500', '', '1611044163', NULL, NULL),
(462, 'add', '57', '175', '527', '12', '200', '2400', '', '1611044200', NULL, NULL),
(463, 'add', '57', '174', '526', '33', '100', '3300', '', '1611044277', NULL, NULL),
(464, 'add', '59', '176', '549', '5', '12990', '64950', '', '1611045420', NULL, NULL),
(465, 'add', '59', '176', '552', '5', '12000', '60000', '', '1611045957', NULL, NULL),
(466, 'add', '57', '174', '553', '10', '100', '1000', '', '1611045979', NULL, NULL),
(467, 'add', '57', '174', '551', '5', '150', '750', '', '1611046013', NULL, NULL),
(468, 'destroy', '57', '174', '550', '10', NULL, '0', '', '1611046032', NULL, NULL),
(469, 'add', '57', '174', '550', '10', '150', '1500', '', '1611046054', NULL, NULL),
(470, 'add', '57', '174', '548', '10', '150', '1500', '', '1611046091', NULL, NULL),
(471, 'add', '57', '174', '547', '10', '100', '1000', '', '1611046149', NULL, NULL),
(472, 'add', '57', '174', '546', '10', '100', '1000', '', '1611046181', NULL, NULL),
(473, 'add', '57', '174', '545', '12', '150', '1800', '', '1611046218', NULL, NULL),
(474, 'add', '57', '174', '554', '5', '100', '500', '', '1611046242', NULL, NULL),
(475, 'add', '59', '176', '560', '10', '11000', '110000', '', '1611046981', NULL, NULL),
(476, 'add', '57', '174', '559', '10', '85', '850', '', '1611047007', NULL, NULL),
(477, 'add', '57', '174', '558', '10', '125', '1250', '', '1611047023', NULL, NULL),
(478, 'add', '57', '174', '557', '15', '150', '2250', '', '1611047066', NULL, NULL),
(479, 'add', '57', '174', '556', '10', '100', '1000', '', '1611047087', NULL, NULL),
(480, 'add', '57', '174', '555', '15', '100', '1500', '', '1611047103', NULL, NULL),
(481, 'add', '57', '174', '561', '10', '75', '750', '', '1611047224', NULL, NULL),
(482, 'add', '57', '174', '562', '10', '75', '750', '', '1611047264', NULL, NULL),
(483, 'add', '57', '174', '565', '10', '200', '2000', '', '1611047714', NULL, NULL),
(484, 'add', '57', '175', '564', '15', '75', '1125', '', '1611047743', NULL, NULL),
(485, 'add', '57', '174', '563', '5', '150', '750', '', '1611047759', NULL, NULL),
(486, 'add', '57', '175', '572', '10', '400', '4000', '', '1611049377', NULL, NULL),
(487, 'add', '59', '176', '584', '5', '12000', '60000', '', '1611051039', NULL, NULL),
(488, 'add', '57', '174', '566', '10', '100', '1000', '', '1611051110', NULL, NULL),
(489, 'add', '57', '174', '576', '10', '75', '750', '', '1611051121', NULL, NULL),
(490, 'add', '57', '174', '577', '10', '100', '1000', '', '1611051132', NULL, NULL),
(491, 'add', '57', '174', '578', '10', '100', '1000', '', '1611051142', NULL, NULL),
(492, 'add', '57', '174', '579', '10', '150', '1500', '', '1611051157', NULL, NULL),
(493, 'add', '57', '174', '580', '5', '100', '500', '', '1611051171', NULL, NULL),
(494, 'add', '57', '174', '581', '5', '75', '375', '', '1611051183', NULL, NULL),
(495, 'add', '57', '174', '582', '5', '100', '500', '', '1611051194', NULL, NULL),
(496, 'add', '57', '174', '583', '5', '300', '1500', '', '1611051204', NULL, NULL),
(497, 'add', '57', '174', '575', '10', '100', '1000', '', '1611051219', NULL, NULL),
(498, 'add', '57', '174', '567', '5', '150', '750', '', '1611051242', NULL, NULL),
(499, 'add', '57', '174', '568', '10', '120', '1200', '', '1611051266', NULL, NULL),
(500, 'add', '57', '174', '571', '10', '150', '1500', '', '1611051283', NULL, NULL),
(501, 'add', '59', '177', '597', '5', '45000', '225000', '', '1611053380', NULL, NULL),
(502, 'add', '57', '174', '585', '10', '100', '1000', '', '1611053405', NULL, NULL),
(503, 'add', '59', '177', '599', '5', '19990', '99950', '', '1611053849', NULL, NULL),
(504, 'add', '57', '174', '586', '10', '150', '1500', '', '1611053866', NULL, NULL),
(505, 'add', '57', '173', '598', '10', '500', '5000', '', '1611053881', NULL, NULL),
(506, 'add', '57', '173', '596', '10', '400', '4000', '', '1611053893', NULL, NULL),
(507, 'add', '57', '173', '595', '10', '400', '4000', '', '1611053925', NULL, NULL),
(508, 'add', '57', '174', '594', '10', '150', '1500', '', '1611053945', NULL, NULL),
(509, 'add', '57', '174', '593', '10', '150', '1500', '', '1611053959', NULL, NULL),
(510, 'add', '57', '174', '592', '10', '300', '3000', '', '1611053970', NULL, NULL),
(511, 'add', '57', '174', '591', '10', '400', '4000', '', '1611053985', NULL, NULL),
(512, 'add', '57', '174', '590', '10', '300', '3000', '', '1611053998', NULL, NULL),
(513, 'add', '57', '174', '589', '5', '300', '1500', '', '1611054024', NULL, NULL),
(514, 'add', '57', '174', '588', '5', '150', '750', '', '1611054061', NULL, NULL),
(515, 'add', '57', '174', '587', '5', '150', '750', '', '1611054088', NULL, NULL),
(516, 'add', '59', '177', '600', '5', '9999', '49995', '', '1611054586', NULL, NULL),
(517, 'add', '55', '178', '601', '5', '450', '2250', '', '1611122271', NULL, NULL),
(518, 'add', '55', '178', '602', '4', '240', '960', '', '1611122823', NULL, NULL),
(519, 'add', '55', '178', '603', '7', '270', '1890', '', '1611123207', NULL, NULL),
(520, 'add', '55', '178', '604', '4', '300', '1200', '', '1611126324', NULL, NULL),
(521, 'add', '55', '178', '605', '5', '300', '1500', '', '1611130889', NULL, NULL),
(522, 'add', '55', '178', '606', '5', '300', '1500', '', '1611131711', NULL, NULL),
(523, 'add', '55', '178', '607', '5', '250', '1250', '', '1611132091', NULL, NULL),
(524, 'add', '55', '178', '610', '10', '400', '4000', '', '1611139174', NULL, NULL),
(525, 'add', '59', '176', '612', '15', '13999', '209985', '', '1611142022', NULL, NULL),
(526, 'add', '59', '176', '611', '15', '13999', '209985', '', '1611142032', NULL, NULL),
(527, 'add', '59', '176', '614', '15', '14999', '224985', '', '1611142510', NULL, NULL),
(528, 'add', '59', '176', '616', '15', '14999', '224985', '', '1611142836', NULL, NULL),
(529, 'add', '55', '178', '608', '10', '240', '2400', '', '1611142872', NULL, NULL),
(530, 'add', '55', '178', '615', '5', '350', '1750', '', '1611142891', NULL, NULL),
(531, 'add', '55', '178', '613', '5', '350', '1750', '', '1611142919', NULL, NULL),
(532, 'add', '55', '178', '609', '5', '240', '1200', '', '1611142933', NULL, NULL),
(533, 'destroy', '59', '176', '584', '5', NULL, '0', 'Not Avaliable', '1611143044', NULL, NULL),
(534, 'add', '55', '178', '617', '5', '350', '1750', '', '1611213330', NULL, NULL),
(535, 'add', '55', '178', '618', '5', '355', '1775', '', '1611213644', NULL, NULL),
(536, 'add', '55', '178', '620', '10', '950', '9500', '', '1611215958', NULL, NULL),
(537, 'add', '57', '175', '574', '10', '300', '3000', '', '1611216094', NULL, NULL),
(538, 'add', '57', '174', '569', '10', '75', '750', '', '1611216147', NULL, NULL),
(539, 'add', '57', '174', '573', '10', '100', '1000', '', '1611216193', NULL, NULL),
(540, 'add', '57', '174', '570', '10', '100', '1000', '', '1611216235', NULL, NULL),
(541, 'add', '55', '178', '621', '10', '400', '4000', '', '1611226642', NULL, NULL),
(542, 'add', '55', '178', '622', '15', '450', '6750', '', '1611226993', NULL, NULL),
(543, 'add', '55', '178', '623', '5', '450', '2250', '', '1611227840', NULL, NULL),
(544, 'add', '60', '179', '625', '5', '30000', '150000', '', '1611295438', NULL, NULL),
(545, 'add', '60', '179', '626', '5', '29000', '145000', '', '1611296513', NULL, NULL),
(546, 'add', '60', '179', '627', '4', '29000', '116000', '', '1611297502', NULL, NULL),
(547, 'add', '60', '179', '628', '4', '15522', '62088', '', '1611297959', NULL, NULL),
(548, 'add', '60', '179', '629', '5', '45000', '225000', '', '1611300425', NULL, NULL),
(549, 'add', '60', '179', '630', '4', '27000', '108000', '', '1611739079', NULL, NULL),
(550, 'add', '46', '158', '632', '100', '100', '10000', '', '1611753087', NULL, NULL),
(551, 'add', '46', '158', '632', '1000', '100', '100000', '', '1611902108', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sub_category`
--

CREATE TABLE `sub_category` (
  `sub_category_id` int(11) NOT NULL,
  `sub_category_name` longtext,
  `category` longtext,
  `digital` varchar(10) DEFAULT NULL,
  `banner` longtext,
  `data_vendor` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sub_category`
--

INSERT INTO `sub_category` (`sub_category_id`, `sub_category_name`, `category`, `digital`, `banner`, `data_vendor`) VALUES
(242, 'Fruits', '199', NULL, 'sub_category_1633414361242.png', 81),
(258, 'Sports Supplements', '179', NULL, 'sub_category_258.png', 77),
(259, 'Pain Relief', '205', NULL, 'sub_category_259.png', 77),
(260, 'Skin & Footcare', '205', NULL, 'sub_category_260.png', 77),
(243, 'Body care & Soap', '176', NULL, 'sub_category_1633027335243.png', 56),
(244, 'Vitamins & Minerals', '179', NULL, 'sub_category_1633434664244.png', 77),
(245, 'Cone Ice', '180', NULL, 'sub_category_245.png', 51),
(246, 'Cup Ice cream', '180', NULL, 'sub_category_246.png', 51),
(247, 'Tandoori Chicken', '181', NULL, 'sub_category_247.png', 82),
(248, 'german shepherd', '184', NULL, 'sub_category_248.png', 55),
(249, 'Floor Cleaner and Detergents', '202', NULL, 'sub_category_1639408453249.png', 75),
(257, 'Chocolates & Biscuits', '203', NULL, 'sub_category_257.png', 75),
(261, 'cookes', '203', NULL, 'sub_category_261.png', 75),
(262, 'Baby Care', '208', NULL, 'sub_category_262.png', 79),
(263, 'Personal & Home Essential', '209', NULL, 'sub_category_263.png', 79),
(265, 'Fitness Equipments', '211', NULL, 'sub_category_265.png', 83),
(266, 'Cricket & Football', '212', NULL, 'sub_category_266.png', 83),
(267, 'Hair ', '215', NULL, 'sub_category_267.png', 90),
(268, 'Baby Toiletries', '216', NULL, 'sub_category_268.png', 85),
(269, 'Milk', '217', NULL, 'sub_category_269.png', 80),
(270, 'Panner', '218', NULL, 'sub_category_270.png', 80),
(271, 'Curd', '218', NULL, 'sub_category_271.png', 80),
(272, 'Underwear ', '219', NULL, 'sub_category_272.png', 75),
(273, 'حبوب ', '205', NULL, 'sub_category_273.png', 77),
(274, 'Vegetables', '223', NULL, 'sub_category_274.png', 112),
(275, 'lunette', '226', NULL, 'sub_category_275.png', 75),
(276, 'hear oile', '227', NULL, 'sub_category_276.png', 115),
(277, 'Biscay', '230', NULL, 'sub_category_277.png', 115),
(278, 'Rask', '230', NULL, 'sub_category_278.png', 115),
(279, 'vitamin', '232', NULL, 'sub_category_279.png', 128),
(280, 'kjefes', '238', NULL, 'sub_category_280.png', 150),
(281, 'DRINKING WATER', '241', NULL, 'sub_category_281.png', 160),
(282, 'oil', '245', NULL, 'sub_category_282.png', 162),
(284, 'Haircare', '250', NULL, 'sub_category_1644217720284.png', 162),
(285, 'Healthy vegetables', '251', NULL, 'sub_category_1644232985285.png', 163),
(286, 'Organic Fruits', '252', NULL, 'sub_category_1644309867286.png', 164),
(287, 'Cricket', '261', NULL, 'sub_category_1644217785287.png', 169),
(288, 'Chess', '262', NULL, 'sub_category_1644217135288.png', 169),
(291, 'Balance Training', '263', NULL, 'sub_category_291.png', 170),
(290, 'Strength Building', '263', NULL, 'sub_category_290.png', 170),
(294, 'Milk', '266', NULL, 'sub_category_1644237847294.png', 172),
(293, 'Cookies', '267', NULL, 'sub_category_1644237964293.png', 172),
(295, 'milk', '268', NULL, 'sub_category_295.png', 167),
(296, 'Antibiotic ', '269', NULL, 'sub_category_296.png', 174),
(297, 'bulb', '271', NULL, 'sub_category_297.png', 176),
(298, 'Snacks', '272', NULL, 'sub_category_298.png', 162),
(299, 'Chocolates', '272', NULL, 'sub_category_299.png', 162),
(300, 'Biscuits', '272', NULL, 'sub_category_300.png', 162),
(301, 'water', '274', NULL, 'sub_category_1644221392301.png', 177),
(302, 'Laundry and Detergents', '273', NULL, 'sub_category_1644384392302.png', 162),
(303, 'Floor & Other Cleaners', '273', NULL, 'sub_category_303.png', 162),
(304, 'Dishwash Liquids', '273', NULL, 'sub_category_304.png', 162),
(333, 'Blocks', '319', NULL, 'sub_category_333.png', 252),
(306, 'Spices', '309', NULL, 'sub_category_306.png', 185),
(307, 'nuts & dhals', '318', NULL, 'sub_category_307.png', 185),
(308, 'indian vegetables', '318', NULL, 'sub_category_308.png', 185),
(309, 'Indian fruits', '309', NULL, 'sub_category_309.png', 185),
(334, 'Cement', '319', NULL, 'sub_category_334.png', 252),
(310, 'house cleaning', '280', NULL, 'sub_category_310.png', 185),
(311, 'cloth washing', '302', NULL, 'sub_category_311.png', 185),
(312, 'medical equipments', '282', NULL, 'sub_category_312.png', 187),
(313, 'Bio-medical instruments', '282', NULL, 'sub_category_313.png', 187),
(314, 'Headache', '281', NULL, 'sub_category_314.png', 187),
(315, 'Heart problems', '281', NULL, 'sub_category_315.png', 187),
(316, 'sub cat 15', '283', NULL, 'sub_category_316.png', 188),
(317, 'Veg', '285', NULL, 'sub_category_317.png', 189),
(318, 'Veg', '286', NULL, 'sub_category_318.png', 190),
(319, 'yyyy', '290', NULL, 'sub_category_319.png', 200),
(321, 'test2', '296', NULL, 'sub_category_321.png', 212),
(322, 'test11', '297', NULL, 'sub_category_1647733143322.png', 213),
(323, 'gfh', '298', NULL, 'sub_category_323.png', 214),
(330, 'Ready Mix Concrete', '319', NULL, 'sub_category_1649588290330.png', 252),
(325, 'sho', '306', NULL, 'sub_category_325.png', 222),
(326, 'Atta', '309', NULL, 'sub_category_326.png', 185),
(335, 'test', '305', NULL, 'sub_category_335.png', 222),
(329, 'Fresh Vegetabls & Fruits', '312', NULL, 'sub_category_329.png', 234),
(336, 'fish', '328', NULL, 'sub_category_336.png', 255);

-- --------------------------------------------------------

--
-- Table structure for table `supercategory`
--

CREATE TABLE `supercategory` (
  `supercategory_id` int(11) NOT NULL,
  `name` varchar(150) CHARACTER SET utf8 NOT NULL,
  `image` varchar(11) NOT NULL,
  `shop_type` int(11) NOT NULL,
  `short_by` int(11) NOT NULL,
  `date` int(15) NOT NULL,
  `status` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tax`
--

CREATE TABLE `tax` (
  `tax_id` int(11) NOT NULL,
  `tax` varchar(20) NOT NULL,
  `date` int(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tax`
--

INSERT INTO `tax` (`tax_id`, `tax`, `date`) VALUES
(13, '0', 1636979632),
(15, '5', 1646809514),
(16, '18', 1647292461),
(17, '34', 1648390475),
(18, '9', 1648790856),
(19, '5', 1649846029),
(20, '50', 1649874933),
(21, '9.', 1650736471);

-- --------------------------------------------------------

--
-- Table structure for table `timezone`
--

CREATE TABLE `timezone` (
  `timezone_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `time_zone` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `timezone`
--

INSERT INTO `timezone` (`timezone_id`, `name`, `time_zone`) VALUES
(1, 'US/Samoa', '(GMT-11:00) Samoa'),
(2, 'US/Hawaii', '(GMT-10:00) Hawaii'),
(3, 'US/Alaska', '(GMT-09:00) Alaska'),
(4, 'US/Pacific', '(GMT-08:00) Pacific Time (US &amp; Canada)'),
(5, 'America/Tijuana', '(GMT-08:00) Tijuana'),
(6, 'US/Arizona', '(GMT-07:00) Arizona'),
(7, 'US/Mountain', '(GMT-07:00) Mountain Time (US &amp; Canada)'),
(8, 'America/Chihuahua', '(GMT-07:00) Chihuahua'),
(9, 'America/Mazatlan', '(GMT-07:00) Mazatlan'),
(10, 'America/Mexico_City', '(GMT-06:00) Mexico City'),
(11, 'America/Monterrey', '(GMT-06:00) Monterrey'),
(12, 'Canada/Saskatchewan', '(GMT-06:00) Saskatchewan'),
(13, 'US/Central', '(GMT-06:00) Central Time (US &amp; Canada)'),
(14, 'US/Eastern', '(GMT-05:00) Eastern Time (US &amp; Canada)'),
(15, 'US/East-Indiana', '(GMT-05:00) Indiana (East)'),
(16, 'America/Bogota', '(GMT-05:00) Bogota'),
(17, 'America/Lima', '(GMT-05:00) Lima'),
(18, 'America/Caracas', '(GMT-04:30) Caracas'),
(19, 'Canada/Atlantic', '(GMT-04:00) Atlantic Time (Canada)'),
(20, 'America/La_Paz', '(GMT-04:00) La Paz'),
(21, 'America/Santiago', '(GMT-04:00) Santiago'),
(22, 'Canada/Newfoundland', '(GMT-03:30) Newfoundland'),
(23, 'America/Buenos_Aires', '(GMT-03:00) Buenos Aires'),
(24, 'Greenland', '(GMT-03:00) Greenland'),
(25, 'Atlantic/Stanley', '(GMT-02:00) Stanley'),
(26, 'Atlantic/Azores', '(GMT-01:00) Azores'),
(27, 'Atlantic/Cape_Verde', '(GMT-01:00) Cape Verde Is'),
(28, 'Africa/Casablanca', '(GMT) Casablanca'),
(29, 'Europe/Dublin', '(GMT) Dublin'),
(30, 'Europe/Lisbon', '(GMT) Lisbon'),
(31, 'Europe/London', '(GMT) London'),
(32, 'Africa/Monrovia', '(GMT) Monrovia'),
(33, 'Europe/Amsterdam', '(GMT+01:00) Amsterdam'),
(34, 'Europe/Belgrade', '(GMT+01:00) Belgrade'),
(35, 'Europe/Berlin', '(GMT+01:00) Berlin'),
(36, 'Europe/Bratislava', '(GMT+01:00) Bratislava'),
(37, 'Europe/Brussels', '(GMT+01:00) Brussels'),
(38, 'Europe/Budapest', '(GMT+01:00) Budapest'),
(39, 'Europe/Copenhagen', '(GMT+01:00) Copenhagen'),
(40, 'Europe/Ljubljana', '(GMT+01:00) Ljubljana'),
(41, 'Europe/Madrid', '(GMT+01:00) Madrid'),
(42, 'Europe/Paris', '(GMT+01:00) Paris'),
(43, 'Europe/Prague', '(GMT+01:00) Prague'),
(44, 'Europe/Rome', '(GMT+01:00) Rome'),
(45, 'Europe/Sarajevo', '(GMT+01:00) Sarajevo'),
(46, 'Europe/Skopje', '(GMT+01:00) Skopje'),
(47, 'Europe/Stockholm', '(GMT+01:00) Stockholm'),
(48, 'Europe/Vienna', '(GMT+01:00) Vienna'),
(49, 'Europe/Warsaw', '(GMT+01:00) Warsaw'),
(50, 'Europe/Zagreb', '(GMT+01:00) Zagreb'),
(51, 'Europe/Athens', '(GMT+02:00) Athens'),
(52, 'Europe/Bucharest', '(GMT+02:00) Bucharest'),
(53, 'Africa/Cairo', '(GMT+02:00) Cairo'),
(54, 'Africa/Harare', '(GMT+02:00) Harare'),
(55, 'Europe/Helsinki', '(GMT+02:00) Helsinki'),
(56, 'Europe/Istanbul', '(GMT+02:00) Istanbul'),
(57, 'Asia/Jerusalem', '(GMT+02:00) Jerusalem'),
(58, 'Europe/Kiev', '(GMT+02:00) Kyiv'),
(59, 'Europe/Minsk', '(GMT+02:00) Minsk'),
(60, 'Europe/Riga', '(GMT+02:00) Riga'),
(61, 'Europe/Sofia', '(GMT+02:00) Sofia'),
(62, 'Europe/Tallinn', '(GMT+02:00) Tallinn'),
(63, 'Europe/Vilnius', '(GMT+02:00) Vilnius'),
(64, 'Asia/Baghdad', '(GMT+03:00) Baghdad'),
(65, 'Asia/Kuwait', '(GMT+03:00) Kuwait'),
(66, 'Africa/Nairobi', '(GMT+03:00) Nairobi'),
(67, 'Asia/Riyadh', '(GMT+03:00) Riyadh'),
(68, 'Europe/Moscow', '(GMT+03:00) Moscow'),
(69, 'Asia/Tehran', '(GMT+03:30) Tehran'),
(70, 'Asia/Baku', '(GMT+04:00) Baku'),
(71, 'Europe/Volgograd', '(GMT+04:00) Volgograd'),
(72, 'Asia/Muscat', '(GMT+04:00) Muscat'),
(73, 'Asia/Tbilisi', '(GMT+04:00) Tbilisi'),
(74, 'Asia/Yerevan', '(GMT+04:00) Yerevan'),
(75, 'Asia/Kabul', '(GMT+04:30) Kabul'),
(76, 'Asia/Karachi', '(GMT+05:00) Karachi'),
(77, 'Asia/Tashkent', '(GMT+05:00) Tashkent'),
(78, 'Asia/Kolkata', '(GMT+05:30) Kolkata'),
(79, 'Asia/Kathmandu', '(GMT+05:45) Kathmandu'),
(80, 'Asia/Yekaterinburg', '(GMT+06:00) Ekaterinburg'),
(81, 'Asia/Almaty', '(GMT+06:00) Almaty'),
(82, 'Asia/Dhaka', '(GMT+06:00) Dhaka'),
(83, 'Asia/Novosibirsk', '(GMT+07:00) Novosibirsk'),
(84, 'Asia/Bangkok', '(GMT+07:00) Bangkok'),
(85, 'Asia/Jakarta', '(GMT+07:00) Jakarta'),
(86, 'Asia/Krasnoyarsk', '(GMT+08:00) Krasnoyarsk'),
(87, 'Asia/Chongqing', '(GMT+08:00) Chongqing'),
(88, 'Asia/Hong_Kong', '(GMT+08:00) Hong Kong'),
(89, 'Asia/Kuala_Lumpur', '(GMT+08:00) Kuala Lumpur'),
(90, 'Australia/Perth', '(GMT+08:00) Perth'),
(91, 'Asia/Singapore', '(GMT+08:00) Singapore'),
(92, 'Asia/Taipei', '(GMT+08:00) Taipei'),
(93, 'Asia/Ulaanbaatar', '(GMT+08:00) Ulaan Bataar'),
(94, 'Asia/Urumqi', '(GMT+08:00) Urumqi'),
(95, 'Asia/Irkutsk', '(GMT+09:00) Irkutsk'),
(96, 'Asia/Seoul', '(GMT+09:00) Seoul'),
(97, 'Asia/Tokyo', '(GMT+09:00) Tokyo'),
(98, 'Australia/Adelaide', '(GMT+09:30) Adelaide'),
(99, 'Australia/Darwin', '(GMT+09:30) Darwin'),
(100, 'Asia/Yakutsk', '(GMT+10:00) Yakutsk'),
(101, 'Australia/Brisbane', '(GMT+10:00) Brisbane'),
(102, 'Australia/Canberra', '(GMT+10:00) Canberra'),
(103, 'Pacific/Guam', '(GMT+10:00) Guam'),
(104, 'Australia/Hobart', '(GMT+10:00) Hobart'),
(105, 'Australia/Melbourne', '(GMT+10:00) Melbourne'),
(106, 'Pacific/Port_Moresby', '(GMT+10:00) Port Moresby'),
(107, 'Australia/Sydney', '(GMT+10:00) Sydney'),
(108, 'Asia/Vladivostok', '(GMT+11:00) Vladivostok'),
(109, 'Asia/Magadan', '(GMT+12:00) Magadan'),
(110, 'Pacific/Auckland', '(GMT+12:00) Auckland'),
(111, 'Pacific/Fiji', '(GMT+12:00) Fiji'),
(112, 'Pacific/Midway', '(GMT-11:00) Midway Island');

-- --------------------------------------------------------

--
-- Table structure for table `tips`
--

CREATE TABLE `tips` (
  `tips_id` int(11) NOT NULL,
  `amount` varchar(50) NOT NULL,
  `name` varchar(150) CHARACTER SET utf8 NOT NULL,
  `date` int(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tips`
--

INSERT INTO `tips` (`tips_id`, `amount`, `name`, `date`) VALUES
(3, '5', 'tea', 1625075303),
(6, '10', 'juse', 1633224056),
(7, '15', 'tet', 1633230696),
(8, '20', 'just', 1641445059),
(9, '1', 'tuos', 1648738122);

-- --------------------------------------------------------

--
-- Table structure for table `transport&logistics`
--

CREATE TABLE `transport&logistics` (
  `transport&logistics_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `image` varchar(150) NOT NULL,
  `minumum_fare` double NOT NULL,
  `base_fare` double NOT NULL,
  `ratekm_upto_50` double NOT NULL,
  `ratekm_above_50` double NOT NULL,
  `canellation_fee` double NOT NULL,
  `date` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transport&logistics`
--

INSERT INTO `transport&logistics` (`transport&logistics_id`, `name`, `image`, `minumum_fare`, `base_fare`, `ratekm_upto_50`, `ratekm_above_50`, `canellation_fee`, `date`) VALUES
(1, 'Taxi', 'transport&logistics_image_1.png', 10, 40, 50, 12, 1, 1),
(2, 'Bike Taxi', 'transport&logistics_image_2.png', 10, 40, 50, 50, 1, 3),
(3, 'Item Delivery', 'transport&logistics_image_1.png', 10, 40, 50, 12, 1, 12);

-- --------------------------------------------------------

--
-- Table structure for table `trends`
--

CREATE TABLE `trends` (
  `trends_id` int(11) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `title` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trends`
--

INSERT INTO `trends` (`trends_id`, `image`, `title`) VALUES
(11, 'trends_11.jpg', 'trends1'),
(12, 'trends_12.jpg', 'slide3'),
(13, 'trends_13.png', 'Job ');

-- --------------------------------------------------------

--
-- Table structure for table `ui_settings`
--

CREATE TABLE `ui_settings` (
  `ui_settings_id` int(11) NOT NULL,
  `type` longtext,
  `value` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ui_settings`
--

INSERT INTO `ui_settings` (`ui_settings_id`, `type`, `value`) VALUES
(5, 'filter_div', 'on'),
(6, 'admin_login_logo', '46'),
(7, 'admin_nav_logo', '18'),
(8, 'home_top_logo', '78'),
(9, 'home_bottom_logo', '78'),
(11, 'fav_ext', 'png'),
(12, 'side_bar_pos_category', 'right'),
(14, 'footer_color', 'green-2'),
(15, 'header_color', 'green-2'),
(19, 'parallax_blog_title', 'LATEST BLOGS'),
(16, 'font', 'Roboto'),
(17, 'parallax_vendor_title', 'OUR VENDOR'),
(18, 'home_page_style', '3'),
(20, 'no_of_featured_products', '6'),
(21, 'no_of_vendor', '10'),
(22, 'no_of_brands', '12'),
(23, 'brand_show', 'ok'),
(24, 'featured_show', 'ok'),
(25, 'vandors_show', 'ok'),
(26, 'blog_show', 'ok'),
(27, 'parallax_search_title', 'Search Products'),
(28, 'no_of_blog', '3'),
(29, 'featured_product_box_style', '1'),
(30, 'no_of_todays_deal', '6'),
(31, 'special_products_show', 'ok'),
(32, 'category_slides', 'ok'),
(33, 'home_categories', '[{\"category\":\"24\",\"sub_category\":[\"114\",\"115\"],\"color_back\":\"rgba(153,222,42,1)\",\"color_text\":\"rgba(255,255,255,1)\"}]'),
(34, 'category_product_box_style', '2'),
(35, 'top_slide_categories', '[\"1\",\"4\",\"5\",\"16\",\"17\",\"18\",\"23\",\"12\",\"13\",\"21\"]'),
(36, 'email_theme_style', 'style_1'),
(37, 'email_theme_style_2', '<div style=\"margin: 0px 10px; background: #45a9b9; padding: 30px;\"><div style=\"margin: 0px auto; background: #eff7ff; padding: 30px;\">[[body]]</div></div>'),
(38, 'email_theme_style_3', '<div style=\"margin: 0px 10px; background: repeating-linear-gradient(-45deg, red 0, red 1em, #fffdeb 0, #fffdeb 2em, #58a 0, #58a 3em, #fffdeb 0, #fffdeb 4em); padding: 15px;\"><div style=\"margin: 0px auto; background: #fffdeb; padding: 30px;\">[[body]]</div></div>'),
(39, 'email_theme_style_4', '<div style=\"margin: 0px 10px; background: #f7f7f7; padding: 30px;\"><div style=\"padding: 30px; background: #76cece; border-radius:5px 5px 0px 0px; box-shadow: 0px -1px 7px #616565; display:block;\"><div style=\"background-image:url([[logo]]); background-repeat:no-repeat; height:80px; width:auto; display:block;\"></div></div><div style=\"margin: 0px auto; background: rgba(255, 255, 255, 0.91); padding: 30px; box-shadow: 0px 3px 7px #616565; border-radius:0px 0px 5x 5px;\">[[body]]</div></div>'),
(40, 'product_bundle_show', 'ok'),
(41, 'no_of_product_bundle', '6'),
(42, 'product_bundle_box_style', '2'),
(43, 'customer_product_show', 'ok'),
(44, 'no_of_customer_product', '5'),
(45, 'header_homepage_status', 'yes'),
(46, 'header_all_categories_status', 'yes'),
(47, 'header_featured_products_status', 'no'),
(48, 'header_todays_deal_status', 'no'),
(49, 'header_bundled_product_status', 'no'),
(50, 'header_classifieds_status', 'no'),
(51, 'header_latest_products_status', 'no'),
(52, 'header_all_brands_status', 'no'),
(53, 'header_all_vendors_status', 'no'),
(54, 'header_blogs_status', 'yes'),
(55, 'header_store_locator_status', 'no'),
(56, 'header_contact_status', 'yes'),
(57, 'header_more_status', 'yes'),
(58, 'home3_categories', '[{\\\"category\\\":\\\"4\\\",\\\"sub_category\\\":[\\\"8\\\",\\\"11\\\",\\\"34\\\",\\\"35\\\",\\\"36\\\",\\\"37\\\",\\\"39\\\",\\\"40\\\"],\\\"color_back\\\":null,\\\"color_text\\\":null},{\\\"category\\\":\\\"5\\\",\\\"sub_category\\\":[\\\"27\\\",\\\"28\\\",\\\"29\\\",\\\"30\\\",\\\"89\\\",\\\"90\\\"],\\\"color_back\\\":null,\\\"color_text\\\":null}]'),
(59, 'todays_deal_show', 'ok'),
(60, 'todays_deal_product_box_style', '4'),
(61, 'no_of_deal_products', '8');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` longtext,
  `email` longtext,
  `phone` longtext,
  `password` longtext,
  `token` longtext,
  `faviourt` longtext,
  `date` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `address` longtext,
  `image` varchar(200) DEFAULT NULL,
  `selected_address` longtext,
  `latitude` varchar(20) DEFAULT '0',
  `longitude` varchar(20) DEFAULT '0',
  `regVia` varchar(15) DEFAULT NULL,
  `favorite_store` longtext,
  `description` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_rating`
--

CREATE TABLE `user_rating` (
  `rating_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` decimal(10,2) NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variant`
--

CREATE TABLE `variant` (
  `variant_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` varchar(150) NOT NULL,
  `name` varchar(150) CHARACTER SET utf8 DEFAULT NULL,
  `unit` varchar(150) NOT NULL,
  `sale_price` float NOT NULL,
  `strike_price` float NOT NULL,
  `packing_charges` float NOT NULL DEFAULT '0',
  `type` varchar(1) DEFAULT NULL,
  `food_type` varchar(10) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `image` longtext CHARACTER SET utf8,
  `image_type` varchar(50) DEFAULT NULL,
  `tax` double DEFAULT NULL,
  `tax_percent` double DEFAULT NULL,
  `discount` decimal(10,0) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `variant_2`
--

CREATE TABLE `variant_2` (
  `variant_2_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` varchar(150) NOT NULL,
  `name` varchar(150) CHARACTER SET utf8 DEFAULT NULL,
  `unit` varchar(150) NOT NULL,
  `sale_price` float NOT NULL,
  `strike_price` float NOT NULL,
  `min_purchase` int(11) DEFAULT NULL,
  `max_purchase` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `discount` decimal(11,0) DEFAULT '0',
  `tax` double DEFAULT NULL,
  `tax_percent` float DEFAULT NULL,
  `type` varchar(1) NOT NULL,
  `image` longtext CHARACTER SET utf8,
  `image_type` varchar(50) DEFAULT NULL,
  `vendor_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE `vendor` (
  `vendor_id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `rating_num` int(11) NOT NULL DEFAULT '0',
  `rating_total` decimal(20,0) NOT NULL DEFAULT '0',
  `email` varchar(70) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `display_name` varchar(100) DEFAULT NULL,
  `address1` longtext,
  `status` varchar(10) DEFAULT NULL,
  `create_timestamp` int(20) DEFAULT NULL,
  `approve_timestamp` int(20) DEFAULT NULL,
  `member_expire_timestamp` varchar(20) DEFAULT NULL,
  `details` longtext,
  `last_login` int(20) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `description` longtext,
  `latitude` varchar(100) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `country` longtext,
  `general_detail` longtext,
  `bank_details` longtext NOT NULL,
  `kyc_seller` longtext,
  `setting_agreement` longtext,
  `social_setting` longtext,
  `logo` varchar(15) DEFAULT NULL,
  `subtitle` varchar(60) DEFAULT NULL,
  `livestatus` varchar(20) DEFAULT NULL,
  `cover_image` varchar(15) DEFAULT NULL,
  `token` longtext,
  `image` varchar(30) DEFAULT NULL,
  `type` int(10) NOT NULL,
  `driver_assign` tinyint(1) DEFAULT NULL,
  `auto_assign` tinyint(1) DEFAULT NULL,
  `focus_id` int(11) NOT NULL,
  `profile_complete` int(10) NOT NULL,
  `market_camping_value` varchar(10) DEFAULT NULL,
  `market_camping_key` varchar(11) DEFAULT NULL,
  `instant` tinyint(1) DEFAULT NULL,
  `takeaway` tinyint(1) DEFAULT NULL,
  `schedule` tinyint(1) DEFAULT NULL,
  `plan` varchar(10) DEFAULT NULL,
  `payment_type` varchar(150) DEFAULT NULL,
  `payment_status` varchar(10) DEFAULT NULL,
  `purchasekey` longtext,
  `zone_id` varchar(11) DEFAULT NULL,
  `handover_time` int(11) DEFAULT NULL,
  `best_seller` tinyint(1) NOT NULL DEFAULT '0',
  `proof` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vendor_invoice`
--

CREATE TABLE `vendor_invoice` (
  `vendor_invoice_id` int(11) NOT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `invoice_id` varchar(100) DEFAULT NULL,
  `order_date` int(70) DEFAULT NULL,
  `order_amount` double DEFAULT '0',
  `commission` double DEFAULT '0',
  `settlement_value` varchar(100) DEFAULT NULL,
  `driver_fees` double DEFAULT '0',
  `driver_tips` double DEFAULT '0',
  `driver_comission` double DEFAULT '0',
  `driver_settlement_value` double DEFAULT NULL,
  `km` varchar(15) DEFAULT NULL,
  `paid_date` varchar(100) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `method` varchar(100) DEFAULT NULL,
  `payment_details` longtext,
  `transaction_id` varchar(50) DEFAULT NULL,
  `drivertransaction_id` varchar(150) DEFAULT NULL,
  `cus_trans` int(10) DEFAULT NULL,
  `buyer_id` int(11) NOT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `deliver_assignedtime` int(30) DEFAULT NULL,
  `deliverycompleted_time` int(30) DEFAULT NULL,
  `grand_status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vendor_membership`
--

CREATE TABLE `vendor_membership` (
  `vendor_membership_id` int(11) NOT NULL,
  `plan_name` varchar(200) CHARACTER SET utf8 NOT NULL,
  `price` double NOT NULL,
  `commision` double NOT NULL,
  `product_upload_limit` double NOT NULL,
  `validity` double NOT NULL,
  `focus_id` varchar(70) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `defaut` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendor_membership`
--

INSERT INTO `vendor_membership` (`vendor_membership_id`, `plan_name`, `price`, `commision`, `product_upload_limit`, `validity`, `focus_id`, `image`, `defaut`) VALUES
(23, 'Ice & juice', 100, 10, 1000, 365, '55', 'vendor_membership_164130851723.png', NULL),
(24, 'Bronze-Fruits and vegetables', 100, 10, 10000, 365, '53', 'vendor_membership_164130847924.png', NULL),
(25, 'Silver-Fruits and vegetables', 100, 15, 100, 365, '52', 'vendor_membership_164130833825.png', NULL),
(26, 'Gold-Briyani Shop', 100, 10, 1000, 365, '51', 'vendor_membership_26.png', NULL),
(27, 'Diamond-300', 100, 10, 10000, 365, '50', 'vendor_membership_27.png', NULL),
(28, 'Bronze-Gym Equipments', 100, 10, 1000, 365, '49', 'vendor_membership_28.png', NULL),
(29, 'Copper-Gym Equipements', 100, 10, 10000, 365, '49', 'vendor_membership_29.png', NULL),
(33, 'Silver-Sports Shop', 105, 10, 10000, 365, '46', 'vendor_membership_33.png', NULL),
(34, 'Restaurant', 100, 10, 10000, 365, '45', 'vendor_membership_164130842334.png', NULL),
(32, 'Gold-Sports Shop', 100, 10, 10000, 365, '47', 'vendor_membership_32.png', NULL),
(35, 'Fruits', 100, 10, 10000, 365, '44', 'vendor_membership_164130840035.png', NULL),
(36, 'always', 1000, 10, 10000, 365, '43', 'vendor_membership_164130835636.png', NULL),
(39, 'Super plan', 100, 50, 10000, 365, '42', 'vendor_membership_164130806539.png', NULL),
(40, 'proxiii', 0, 10, 10000, 360, '42', 'vendor_membership_40.png', NULL),
(41, 'stratup', 50, 10, 800, 365, '51', 'vendor_membership_41.png', NULL),
(42, 'jjjj', 8999, 999, 0, 999, '47', 'vendor_membership_42.png', NULL),
(43, 'new', 50, 10, 200, 5, '66', 'vendor_membership_43.png', NULL),
(44, 'Bike', 100, 10, 100, 365, '59', 'vendor_membership_44.png', NULL),
(45, 'Shop Type', 2000, 5, 500000, 365, '42', 'vendor_membership_45.png', NULL),
(46, 'testing', 50, 10, 1000, 365, '45', 'vendor_membership_46.png', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_membership_history`
--

CREATE TABLE `vendor_membership_history` (
  `vendor_membership_history_id` int(12) NOT NULL,
  `plan_id` int(12) NOT NULL,
  `vendor_id` int(12) NOT NULL,
  `plan_amount` int(50) NOT NULL,
  `created_date` int(50) NOT NULL,
  `expire_date` int(50) DEFAULT NULL,
  `gateway` varchar(150) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendor_membership_history`
--

INSERT INTO `vendor_membership_history` (`vendor_membership_history_id`, `plan_id`, `vendor_id`, `plan_amount`, `created_date`, `expire_date`, `gateway`) VALUES
(49, 34, 151, 100, 1641310129, NULL, 'Offline'),
(50, 34, 159, 100, 1641370860, NULL, 'Offline'),
(51, 39, 160, 100, 1641377442, NULL, 'Offline'),
(52, 39, 161, 100, 1641378891, NULL, 'Offline'),
(53, 39, 162, 100, 1641408814, NULL, 'Offline'),
(54, 26, 163, 100, 1642402948, NULL, 'Offline'),
(55, 35, 164, 100, 1642406898, NULL, 'Offline'),
(56, 24, 165, 100, 1642416507, NULL, 'Offline'),
(57, 32, 166, 100, 1642419251, NULL, 'Offline'),
(58, 33, 168, 100, 1642475771, NULL, 'Offline'),
(59, 27, 169, 100, 1642485095, NULL, 'Offline'),
(60, 28, 170, 100, 1642489529, NULL, 'Offline'),
(61, 23, 171, 100, 1642492532, NULL, 'Offline'),
(62, 36, 172, 1000, 1642495582, NULL, 'Offline'),
(63, 29, 174, 100, 1642584742, NULL, 'Offline'),
(64, 39, 173, 100, 1642584776, NULL, 'Offline'),
(65, 25, 176, 100, 1643557000, NULL, 'Offline'),
(66, 25, 177, 100, 1644216204, NULL, 'Offline'),
(67, 39, 178, 100, 1644532182, NULL, 'Offline'),
(68, 39, 185, 100, 1646632110, NULL, 'Offline'),
(69, 29, 187, 100, 1646645874, NULL, 'Offline'),
(70, 39, 188, 100, 1646698721, NULL, 'Offline'),
(71, 34, 189, 100, 1646844071, NULL, 'Offline'),
(72, 34, 190, 100, 1646847939, NULL, 'Offline'),
(73, 34, 195, 100, 1647098501, NULL, 'Offline'),
(74, 34, 196, 100, 1647099755, NULL, 'Offline'),
(75, 40, 199, 0, 1647154757, 1678258757, NULL),
(76, 39, 200, 100, 1647166770, NULL, 'Offline'),
(77, 34, 201, 100, 1647256626, NULL, 'Offline'),
(78, 40, 202, 0, 1647325943, 1678429943, NULL),
(79, 34, 204, 100, 1647378519, NULL, 'Offline'),
(80, 26, 208, 100, 1647548899, NULL, 'Offline'),
(81, 40, 75, 0, 1647613453, 1678717453, NULL),
(82, 35, 210, 100, 1647709886, NULL, 'Offline'),
(83, 41, 212, 50, 1647730089, NULL, 'Offline'),
(84, 41, 213, 50, 1647732257, NULL, 'Offline'),
(85, 41, 214, 50, 1647734156, NULL, 'Offline'),
(86, 40, 219, 0, 1647894123, 1678998123, NULL),
(87, 40, 222, 0, 1647982303, 1679086303, NULL),
(88, 34, 223, 100, 1648014014, NULL, 'Offline'),
(89, 40, 225, 0, 1648185521, 1679289521, NULL),
(90, 24, 232, 100, 1648640933, NULL, 'Offline'),
(91, 34, 233, 100, 1648665457, NULL, 'Offline'),
(92, 35, 234, 100, 1648742318, NULL, 'Offline'),
(93, 40, 235, 0, 1648825881, 1679929881, NULL),
(94, 34, 236, 100, 1648841588, NULL, 'Offline'),
(95, 34, 251, 100, 1649471492, NULL, 'Offline'),
(96, 45, 252, 2000, 1649583885, NULL, 'Offline'),
(97, 34, 253, 100, 1649631665, NULL, 'Offline'),
(98, 34, 254, 100, 1649676658, NULL, 'Offline'),
(99, 34, 258, 100, 1649829163, 1681365163, 'Offline'),
(100, 34, 244, 100, 1649938752, NULL, 'Offline'),
(101, 46, 244, 0, 1650020373, 1681556373, NULL),
(102, 39, 75, 100, 1650108316, 1681644316, 'Offline'),
(103, 46, 246, 0, 1650175928, 1681711928, NULL),
(104, 40, 247, 0, 1650177117, 1681281117, NULL),
(105, 34, 248, 100, 1650197216, 1681733216, 'Offline'),
(106, 46, 249, 0, 1650331782, 1681867782, NULL),
(107, 32, 252, 100, 1650445904, 1681981904, 'Offline'),
(108, 39, 255, 100, 1650791578, 1682327578, 'Offline');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_permission`
--

CREATE TABLE `vendor_permission` (
  `vendor_permission_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `codename` varchar(30) DEFAULT NULL,
  `parent_status` varchar(30) DEFAULT NULL,
  `description` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vendor_permission`
--

INSERT INTO `vendor_permission` (`vendor_permission_id`, `name`, `codename`, `parent_status`, `description`) VALUES
(1, 'Home', 'home', 'parent', NULL),
(2, 'Banner', 'banner', 'parent', NULL),
(3, 'Category', 'category', 'parent', NULL),
(4, 'Sub category', 'sub_category', 'parent', NULL),
(5, 'Product', 'product', 'parent', NULL),
(6, 'Order', 'order', 'parent', NULL),
(7, 'Takeaway', 'takeaway', 'parent', NULL),
(8, 'Wallet', 'wallet', 'parent', NULL),
(9, 'Bulk upload', 'bulk_upload', 'parent', NULL),
(10, 'Sales', 'sales', 'parent', NULL),
(11, 'Deliver time slot', 'delivery_time_slot', 'parent', NULL),
(12, 'Profile', 'profile', 'parent', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_wallet`
--

CREATE TABLE `vendor_wallet` (
  `vendor_wallet_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `balance` varchar(15) NOT NULL,
  `last_update` int(11) NOT NULL,
  `totalamount` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `version_control`
--

CREATE TABLE `version_control` (
  `version_control_id` int(11) NOT NULL,
  `app` varchar(100) NOT NULL,
  `app_name` varchar(150) CHARACTER SET utf8 NOT NULL,
  `version` varchar(150) NOT NULL,
  `app_link` longtext CHARACTER SET utf16 NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `version_control`
--

INSERT INTO `version_control` (`version_control_id`, `app`, `app_name`, `version`, `app_link`, `status`) VALUES
(1, 'user', 'Super User', '2.5', 'https://play.google.com/store/apps/details?id=com.multisuperstore21.protech', 1),
(2, 'driver', '', '2.2.10', 'https://play.google.com/store/apps/details?id=com.doordrop.user', 0),
(3, 'vendor', '', '2.2.10', 'https://play.google.com/store/apps/details?id=com.doordrop.user', 0),
(4, 'provider', '', '2.2.10', 'https://play.google.com/store/apps/details?id=com.doordrop.user', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wallet`
--

CREATE TABLE `wallet` (
  `wallet_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `balance` varchar(15) NOT NULL,
  `last_update` int(11) NOT NULL,
  `lastamount` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wallet_transactions`
--

CREATE TABLE `wallet_transactions` (
  `wallet_transactions_id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `amount` varchar(20) NOT NULL,
  `balance` varchar(20) NOT NULL,
  `status` varchar(30) NOT NULL,
  `date` int(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wallet_vendor_transactions`
--

CREATE TABLE `wallet_vendor_transactions` (
  `wallet_vendor_transactions_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `status` varchar(15) NOT NULL,
  `notes` longtext CHARACTER SET utf8,
  `type` varchar(50) NOT NULL,
  `requested_date` int(20) NOT NULL,
  `process_date` int(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zone`
--

CREATE TABLE `zone` (
  `zone_id` int(11) NOT NULL,
  `title` varchar(200) CHARACTER SET utf8 NOT NULL,
  `positions` longtext CHARACTER SET utf8 NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `original_position` longtext,
  `position_array` longtext NOT NULL,
  `date` int(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zone`
--

INSERT INTO `zone` (`zone_id`, `title`, `positions`, `status`, `original_position`, `position_array`, `date`) VALUES
(93, 'World', '[\"61.751004 169.769418\",\"78.962439 72.035043\",\"61.078188 -35.543082\",\"72.698005 -152.964957\",\"48.193518 -142.418082\",\"-12.943056 -84.058707\",\"-57.540922 -69.996207\",\"5.919255 -14.449332\",\"-48.721812 17.191293\",\"8.012938 92.425668\",\"-43.86824 119.144418\",\"-41.279914 161.331918\"]', 0, '\"61.751004,169.769418,78.962439,72.035043,61.078188,-35.543082,72.698005,-152.964957,48.193518,-142.418082,-12.943056,-84.058707,-57.540922,-69.996207,5.919255,-14.449332,-48.721812,17.191293,8.012938,92.425668,-43.86824,119.144418,-41.279914,161.331918\"', '[ 61.751004,169.769418 , 78.962439,72.035043 , 61.078188,-35.543082 , 72.698005,-152.964957 , 48.193518,-142.418082 , -12.943056,-84.058707 , -57.540922,-69.996207 , 5.919255,-14.449332 , -48.721812,17.191293 , 8.012938,92.425668 , -43.86824,119.144418 , -41.279914,161.331918 , ]', 1647002651);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addon`
--
ALTER TABLE `addon`
  ADD PRIMARY KEY (`addon_id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `admin_permission`
--
ALTER TABLE `admin_permission`
  ADD PRIMARY KEY (`admin_permission_id`);

--
-- Indexes for table `auto_suggesion`
--
ALTER TABLE `auto_suggesion`
  ADD PRIMARY KEY (`auto_suggesion_id`),
  ADD UNIQUE KEY `search` (`search_text`);

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`banner_id`);

--
-- Indexes for table `banner_master`
--
ALTER TABLE `banner_master`
  ADD PRIMARY KEY (`banner_master_id`);

--
-- Indexes for table `bestof`
--
ALTER TABLE `bestof`
  ADD PRIMARY KEY (`bestof_id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `bundle_stock`
--
ALTER TABLE `bundle_stock`
  ADD PRIMARY KEY (`stock_id`);

--
-- Indexes for table `business_settings`
--
ALTER TABLE `business_settings`
  ADD PRIMARY KEY (`business_settings_id`);

--
-- Indexes for table `cancelled_order`
--
ALTER TABLE `cancelled_order`
  ADD PRIMARY KEY (`cancelled_order_id`);

--
-- Indexes for table `car_type`
--
ALTER TABLE `car_type`
  ADD PRIMARY KEY (`car_type_id`);

--
-- Indexes for table `categories_wise_offer`
--
ALTER TABLE `categories_wise_offer`
  ADD PRIMARY KEY (`categories_wise_offer_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `categoryads`
--
ALTER TABLE `categoryads`
  ADD PRIMARY KEY (`categoryads_id`);

--
-- Indexes for table `cin_history`
--
ALTER TABLE `cin_history`
  ADD PRIMARY KEY (`cin_history_id`);

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`color_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comments_id`);

--
-- Indexes for table `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`coupon_id`);

--
-- Indexes for table `currency_method`
--
ALTER TABLE `currency_method`
  ADD PRIMARY KEY (`currency_method_id`);

--
-- Indexes for table `deliverytimeslot`
--
ALTER TABLE `deliverytimeslot`
  ADD PRIMARY KEY (`deliverytimeslot_id`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`driver_id`);

--
-- Indexes for table `driver_rating`
--
ALTER TABLE `driver_rating`
  ADD PRIMARY KEY (`driver_rating_id`);

--
-- Indexes for table `d_recommendation`
--
ALTER TABLE `d_recommendation`
  ADD PRIMARY KEY (`d_recommendation_id`);

--
-- Indexes for table `email_template`
--
ALTER TABLE `email_template`
  ADD PRIMARY KEY (`email_template_id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`general_settings_id`);

--
-- Indexes for table `h_category`
--
ALTER TABLE `h_category`
  ADD PRIMARY KEY (`h_category_id`);

--
-- Indexes for table `h_sub_category`
--
ALTER TABLE `h_sub_category`
  ADD PRIMARY KEY (`h_sub_category_id`);

--
-- Indexes for table `inter_short_view`
--
ALTER TABLE `inter_short_view`
  ADD PRIMARY KEY (`inter_short_view_id`);

--
-- Indexes for table `item_delivery_bookings`
--
ALTER TABLE `item_delivery_bookings`
  ADD PRIMARY KEY (`item_delivery_bookings_id`);

--
-- Indexes for table `logistics_pricing`
--
ALTER TABLE `logistics_pricing`
  ADD PRIMARY KEY (`logistics_pricing_id`);

--
-- Indexes for table `logo`
--
ALTER TABLE `logo`
  ADD PRIMARY KEY (`logo_id`);

--
-- Indexes for table `packageitem`
--
ALTER TABLE `packageitem`
  ADD PRIMARY KEY (`packageitem_id`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`permission_id`);

--
-- Indexes for table `policy`
--
ALTER TABLE `policy`
  ADD PRIMARY KEY (`policy_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `provider`
--
ALTER TABLE `provider`
  ADD PRIMARY KEY (`provider_id`);

--
-- Indexes for table `provider_databook`
--
ALTER TABLE `provider_databook`
  ADD PRIMARY KEY (`provider_databook_id`);

--
-- Indexes for table `push_notification`
--
ALTER TABLE `push_notification`
  ADD PRIMARY KEY (`push_notification_id`);

--
-- Indexes for table `restaurantproduct`
--
ALTER TABLE `restaurantproduct`
  ADD PRIMARY KEY (`restaurantproduct_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `role_permission`
--
ALTER TABLE `role_permission`
  ADD PRIMARY KEY (`role_permission_id`);

--
-- Indexes for table `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`sale_id`);

--
-- Indexes for table `secondary_wallet`
--
ALTER TABLE `secondary_wallet`
  ADD PRIMARY KEY (`secondary_wallet_id`);

--
-- Indexes for table `shop_focus`
--
ALTER TABLE `shop_focus`
  ADD PRIMARY KEY (`shop_focus_id`);

--
-- Indexes for table `shop_rating`
--
ALTER TABLE `shop_rating`
  ADD PRIMARY KEY (`shop_rating_id`);

--
-- Indexes for table `shop_the_offer`
--
ALTER TABLE `shop_the_offer`
  ADD PRIMARY KEY (`shop_the_offer_id`);

--
-- Indexes for table `shop_type`
--
ALTER TABLE `shop_type`
  ADD PRIMARY KEY (`shop_type_id`),
  ADD KEY `shop_type_id` (`shop_type_id`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`slider_id`);

--
-- Indexes for table `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`slides_id`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`stock_id`);

--
-- Indexes for table `sub_category`
--
ALTER TABLE `sub_category`
  ADD PRIMARY KEY (`sub_category_id`);

--
-- Indexes for table `supercategory`
--
ALTER TABLE `supercategory`
  ADD PRIMARY KEY (`supercategory_id`);

--
-- Indexes for table `tax`
--
ALTER TABLE `tax`
  ADD PRIMARY KEY (`tax_id`);

--
-- Indexes for table `timezone`
--
ALTER TABLE `timezone`
  ADD PRIMARY KEY (`timezone_id`);

--
-- Indexes for table `tips`
--
ALTER TABLE `tips`
  ADD PRIMARY KEY (`tips_id`);

--
-- Indexes for table `transport&logistics`
--
ALTER TABLE `transport&logistics`
  ADD PRIMARY KEY (`transport&logistics_id`);

--
-- Indexes for table `trends`
--
ALTER TABLE `trends`
  ADD PRIMARY KEY (`trends_id`);

--
-- Indexes for table `ui_settings`
--
ALTER TABLE `ui_settings`
  ADD PRIMARY KEY (`ui_settings_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_rating`
--
ALTER TABLE `user_rating`
  ADD PRIMARY KEY (`rating_id`);

--
-- Indexes for table `variant`
--
ALTER TABLE `variant`
  ADD PRIMARY KEY (`variant_id`);

--
-- Indexes for table `variant_2`
--
ALTER TABLE `variant_2`
  ADD PRIMARY KEY (`variant_2_id`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`vendor_id`),
  ADD KEY `vendor_id` (`vendor_id`);

--
-- Indexes for table `vendor_invoice`
--
ALTER TABLE `vendor_invoice`
  ADD PRIMARY KEY (`vendor_invoice_id`);

--
-- Indexes for table `vendor_membership`
--
ALTER TABLE `vendor_membership`
  ADD PRIMARY KEY (`vendor_membership_id`);

--
-- Indexes for table `vendor_membership_history`
--
ALTER TABLE `vendor_membership_history`
  ADD PRIMARY KEY (`vendor_membership_history_id`);

--
-- Indexes for table `vendor_permission`
--
ALTER TABLE `vendor_permission`
  ADD PRIMARY KEY (`vendor_permission_id`);

--
-- Indexes for table `vendor_wallet`
--
ALTER TABLE `vendor_wallet`
  ADD PRIMARY KEY (`vendor_wallet_id`);

--
-- Indexes for table `version_control`
--
ALTER TABLE `version_control`
  ADD PRIMARY KEY (`version_control_id`);

--
-- Indexes for table `wallet`
--
ALTER TABLE `wallet`
  ADD PRIMARY KEY (`wallet_id`);

--
-- Indexes for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  ADD PRIMARY KEY (`wallet_transactions_id`);

--
-- Indexes for table `wallet_vendor_transactions`
--
ALTER TABLE `wallet_vendor_transactions`
  ADD PRIMARY KEY (`wallet_vendor_transactions_id`);

--
-- Indexes for table `zone`
--
ALTER TABLE `zone`
  ADD PRIMARY KEY (`zone_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addon`
--
ALTER TABLE `addon`
  MODIFY `addon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `admin_permission`
--
ALTER TABLE `admin_permission`
  MODIFY `admin_permission_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `auto_suggesion`
--
ALTER TABLE `auto_suggesion`
  MODIFY `auto_suggesion_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `banner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for table `banner_master`
--
ALTER TABLE `banner_master`
  MODIFY `banner_master_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `bestof`
--
ALTER TABLE `bestof`
  MODIFY `bestof_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=286;

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=323;

--
-- AUTO_INCREMENT for table `bundle_stock`
--
ALTER TABLE `bundle_stock`
  MODIFY `stock_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `business_settings`
--
ALTER TABLE `business_settings`
  MODIFY `business_settings_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `cancelled_order`
--
ALTER TABLE `cancelled_order`
  MODIFY `cancelled_order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `car_type`
--
ALTER TABLE `car_type`
  MODIFY `car_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories_wise_offer`
--
ALTER TABLE `categories_wise_offer`
  MODIFY `categories_wise_offer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=331;

--
-- AUTO_INCREMENT for table `categoryads`
--
ALTER TABLE `categoryads`
  MODIFY `categoryads_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cin_history`
--
ALTER TABLE `cin_history`
  MODIFY `cin_history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `color`
--
ALTER TABLE `color`
  MODIFY `color_id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comments_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `coupon`
--
ALTER TABLE `coupon`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `currency_method`
--
ALTER TABLE `currency_method`
  MODIFY `currency_method_id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `deliverytimeslot`
--
ALTER TABLE `deliverytimeslot`
  MODIFY `deliverytimeslot_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=482;

--
-- AUTO_INCREMENT for table `driver`
--
ALTER TABLE `driver`
  MODIFY `driver_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `driver_rating`
--
ALTER TABLE `driver_rating`
  MODIFY `driver_rating_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `d_recommendation`
--
ALTER TABLE `d_recommendation`
  MODIFY `d_recommendation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `email_template`
--
ALTER TABLE `email_template`
  MODIFY `email_template_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `general_settings_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `h_category`
--
ALTER TABLE `h_category`
  MODIFY `h_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `h_sub_category`
--
ALTER TABLE `h_sub_category`
  MODIFY `h_sub_category_id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `inter_short_view`
--
ALTER TABLE `inter_short_view`
  MODIFY `inter_short_view_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `item_delivery_bookings`
--
ALTER TABLE `item_delivery_bookings`
  MODIFY `item_delivery_bookings_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `logistics_pricing`
--
ALTER TABLE `logistics_pricing`
  MODIFY `logistics_pricing_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `logo`
--
ALTER TABLE `logo`
  MODIFY `logo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `packageitem`
--
ALTER TABLE `packageitem`
  MODIFY `packageitem_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `permission`
--
ALTER TABLE `permission`
  MODIFY `permission_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `policy`
--
ALTER TABLE `policy`
  MODIFY `policy_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1054;

--
-- AUTO_INCREMENT for table `provider`
--
ALTER TABLE `provider`
  MODIFY `provider_id` int(150) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `provider_databook`
--
ALTER TABLE `provider_databook`
  MODIFY `provider_databook_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `push_notification`
--
ALTER TABLE `push_notification`
  MODIFY `push_notification_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restaurantproduct`
--
ALTER TABLE `restaurantproduct`
  MODIFY `restaurantproduct_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `role_permission`
--
ALTER TABLE `role_permission`
  MODIFY `role_permission_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sale`
--
ALTER TABLE `sale`
  MODIFY `sale_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1731;

--
-- AUTO_INCREMENT for table `secondary_wallet`
--
ALTER TABLE `secondary_wallet`
  MODIFY `secondary_wallet_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `shop_focus`
--
ALTER TABLE `shop_focus`
  MODIFY `shop_focus_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `shop_rating`
--
ALTER TABLE `shop_rating`
  MODIFY `shop_rating_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `shop_the_offer`
--
ALTER TABLE `shop_the_offer`
  MODIFY `shop_the_offer_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `shop_type`
--
ALTER TABLE `shop_type`
  MODIFY `shop_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `slider_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `slides`
--
ALTER TABLE `slides`
  MODIFY `slides_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `stock`
--
ALTER TABLE `stock`
  MODIFY `stock_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=552;

--
-- AUTO_INCREMENT for table `sub_category`
--
ALTER TABLE `sub_category`
  MODIFY `sub_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=343;

--
-- AUTO_INCREMENT for table `supercategory`
--
ALTER TABLE `supercategory`
  MODIFY `supercategory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `tax`
--
ALTER TABLE `tax`
  MODIFY `tax_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `timezone`
--
ALTER TABLE `timezone`
  MODIFY `timezone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `tips`
--
ALTER TABLE `tips`
  MODIFY `tips_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `transport&logistics`
--
ALTER TABLE `transport&logistics`
  MODIFY `transport&logistics_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `trends`
--
ALTER TABLE `trends`
  MODIFY `trends_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `ui_settings`
--
ALTER TABLE `ui_settings`
  MODIFY `ui_settings_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=697;

--
-- AUTO_INCREMENT for table `user_rating`
--
ALTER TABLE `user_rating`
  MODIFY `rating_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variant`
--
ALTER TABLE `variant`
  MODIFY `variant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT for table `variant_2`
--
ALTER TABLE `variant_2`
  MODIFY `variant_2_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=560;

--
-- AUTO_INCREMENT for table `vendor`
--
ALTER TABLE `vendor`
  MODIFY `vendor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=258;

--
-- AUTO_INCREMENT for table `vendor_invoice`
--
ALTER TABLE `vendor_invoice`
  MODIFY `vendor_invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1685;

--
-- AUTO_INCREMENT for table `vendor_membership`
--
ALTER TABLE `vendor_membership`
  MODIFY `vendor_membership_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `vendor_membership_history`
--
ALTER TABLE `vendor_membership_history`
  MODIFY `vendor_membership_history_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `vendor_permission`
--
ALTER TABLE `vendor_permission`
  MODIFY `vendor_permission_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `vendor_wallet`
--
ALTER TABLE `vendor_wallet`
  MODIFY `vendor_wallet_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `version_control`
--
ALTER TABLE `version_control`
  MODIFY `version_control_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `wallet`
--
ALTER TABLE `wallet`
  MODIFY `wallet_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  MODIFY `wallet_transactions_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `wallet_vendor_transactions`
--
ALTER TABLE `wallet_vendor_transactions`
  MODIFY `wallet_vendor_transactions_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `zone`
--
ALTER TABLE `zone`
  MODIFY `zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
