-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 24, 2022 at 10:53 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel_restaurant_pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `sma_addresses`
--

CREATE TABLE `sma_addresses` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `line1` varchar(50) NOT NULL,
  `line2` varchar(50) DEFAULT NULL,
  `city` varchar(25) NOT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `state` varchar(25) NOT NULL,
  `country` varchar(50) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_adjustments`
--

CREATE TABLE `sma_adjustments` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reference_no` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `count_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_adjustments`
--

INSERT INTO `sma_adjustments` (`id`, `date`, `reference_no`, `warehouse_id`, `note`, `attachment`, `created_by`, `updated_by`, `updated_at`, `count_id`) VALUES
(1, '2021-08-18 08:12:00', '2021/08/0001', 1, '', NULL, 1, NULL, NULL, NULL),
(2, '2021-08-26 06:44:00', '2021/08/0002', 1, '', NULL, 1, NULL, NULL, NULL),
(3, '2021-09-14 01:54:00', '2021/09/0003', 1, '', NULL, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_adjustment_items`
--

CREATE TABLE `sma_adjustment_items` (
  `id` int(11) NOT NULL,
  `adjustment_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_adjustment_items`
--

INSERT INTO `sma_adjustment_items` (`id`, `adjustment_id`, `product_id`, `option_id`, `quantity`, `warehouse_id`, `serial_no`, `type`) VALUES
(1, 1, 1, NULL, '100.0000', 1, '', 'addition'),
(2, 2, 4, NULL, '100.0000', 1, '', 'addition'),
(3, 3, 5, NULL, '100.0000', 1, '', 'addition');

-- --------------------------------------------------------

--
-- Table structure for table `sma_brands`
--

CREATE TABLE `sma_brands` (
  `id` int(11) NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_calendar`
--

CREATE TABLE `sma_calendar` (
  `id` int(11) NOT NULL,
  `title` varchar(55) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `color` varchar(7) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_captcha`
--

CREATE TABLE `sma_captcha` (
  `captcha_id` bigint(13) UNSIGNED NOT NULL,
  `captcha_time` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(16) CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `word` varchar(20) CHARACTER SET latin1 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_categories`
--

CREATE TABLE `sma_categories` (
  `id` int(11) NOT NULL,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL,
  `image` varchar(55) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_categories`
--

INSERT INTO `sma_categories` (`id`, `code`, `name`, `image`, `parent_id`, `slug`, `description`) VALUES
(1, 'C1', 'Category 1', NULL, NULL, NULL, NULL),
(2, 'Cat', 'Cat', NULL, 1, 'cat', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `sma_combo_items`
--

CREATE TABLE `sma_combo_items` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `item_code` varchar(20) NOT NULL,
  `quantity` decimal(12,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_combo_items`
--

INSERT INTO `sma_combo_items` (`id`, `product_id`, `item_code`, `quantity`, `unit_price`) VALUES
(1, 3, 'test', '1.0000', '3.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_companies`
--

CREATE TABLE `sma_companies` (
  `id` int(11) NOT NULL,
  `group_id` int(10) UNSIGNED DEFAULT NULL,
  `group_name` varchar(20) NOT NULL,
  `customer_group_id` int(11) DEFAULT NULL,
  `customer_group_name` varchar(100) DEFAULT NULL,
  `name` varchar(55) NOT NULL,
  `company` varchar(255) NOT NULL,
  `vat_no` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(55) DEFAULT NULL,
  `state` varchar(55) DEFAULT NULL,
  `postal_code` varchar(8) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `cf1` varchar(100) DEFAULT NULL,
  `cf2` varchar(100) DEFAULT NULL,
  `cf3` varchar(100) DEFAULT NULL,
  `cf4` varchar(100) DEFAULT NULL,
  `cf5` varchar(100) DEFAULT NULL,
  `cf6` varchar(100) DEFAULT NULL,
  `invoice_footer` text DEFAULT NULL,
  `payment_term` int(11) DEFAULT 0,
  `logo` varchar(255) DEFAULT 'logo.png',
  `award_points` int(11) DEFAULT 0,
  `deposit_amount` decimal(25,4) DEFAULT NULL,
  `price_group_id` int(11) DEFAULT NULL,
  `price_group_name` varchar(50) DEFAULT NULL,
  `gst_no` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_companies`
--

INSERT INTO `sma_companies` (`id`, `group_id`, `group_name`, `customer_group_id`, `customer_group_name`, `name`, `company`, `vat_no`, `address`, `city`, `state`, `postal_code`, `country`, `phone`, `email`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `invoice_footer`, `payment_term`, `logo`, `award_points`, `deposit_amount`, `price_group_id`, `price_group_name`, `gst_no`) VALUES
(1, 3, 'customer', 1, 'General', 'Walk-in Customer', 'Walk-in Customer', '', 'Customer Address', 'Petaling Jaya', 'Selangor', '46000', 'Malaysia', '0123456789', 'customer@tecdiary.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, NULL),
(2, 4, 'supplier', NULL, NULL, 'Test Supplier', 'Supplier Company Name', NULL, 'Supplier Address', 'Petaling Jaya', 'Selangor', '46050', 'Malaysia', '0123456789', 'supplier@tecdiary.com', '-', '-', '-', '-', '-', '-', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, NULL),
(3, NULL, 'biller', NULL, NULL, 'Mian Saleem', 'Test Biller', '5555', 'Biller adddress', 'City', '', '', 'Country', '012345678', 'saleem@tecdiary.com', '', '', '', '', '', '', ' Thank you for shopping with us. Please come again', 0, 'logo1.png', 0, NULL, NULL, NULL, NULL),
(4, 3, 'customer', 1, 'General', 'David', 'Anakut', '', 'Phnom Penh', 'Phnom Penh', '', '', '', '085693579', 'david@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, 2, 'Chinese Customer', '');

-- --------------------------------------------------------

--
-- Table structure for table `sma_costing`
--

CREATE TABLE `sma_costing` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `sale_item_id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `purchase_item_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `purchase_net_unit_cost` decimal(25,4) DEFAULT NULL,
  `purchase_unit_cost` decimal(25,4) DEFAULT NULL,
  `sale_net_unit_price` decimal(25,4) NOT NULL,
  `sale_unit_price` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT NULL,
  `inventory` tinyint(1) DEFAULT 0,
  `overselling` tinyint(1) DEFAULT 0,
  `option_id` int(11) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_costing`
--

INSERT INTO `sma_costing` (`id`, `date`, `product_id`, `sale_item_id`, `sale_id`, `purchase_item_id`, `quantity`, `purchase_net_unit_cost`, `purchase_unit_cost`, `sale_net_unit_price`, `sale_unit_price`, `quantity_balance`, `inventory`, `overselling`, `option_id`, `purchase_id`) VALUES
(1, '2021-08-18', 1, 1, 1, 1, '1.0000', '0.0000', '0.0000', '12.0000', '12.0000', '99.0000', 1, 0, NULL, NULL),
(2, '2021-08-18', 1, 2, 1, 1, '1.0000', '0.0000', '0.0000', '12.0000', '12.0000', '99.0000', 1, 0, NULL, NULL),
(3, '2021-08-18', 1, 3, 1, 1, '1.0000', '0.0000', '0.0000', '12.0000', '12.0000', '99.0000', 1, 0, NULL, NULL),
(4, '2021-08-18', 1, 4, 1, 1, '1.0000', '0.0000', '0.0000', '12.0000', '12.0000', '99.0000', 1, 0, NULL, NULL),
(5, '2021-08-18', 1, 5, 2, 1, '10.0000', '0.0000', '0.0000', '12.0000', '12.0000', '86.0000', 1, 0, NULL, NULL),
(6, '2021-08-19', 2, 6, 3, 3, '3.0000', '1.0000', '1.0000', '1.5000', '1.5000', '17.0000', 1, 0, 1, 2),
(7, '2021-08-30', 2, 7, 4, 3, '1.0000', '1.0000', '1.0000', '2.0000', '2.0000', '16.0000', 1, 0, 1, 2),
(8, '2021-08-30', 1, 8, 4, 1, '1.0000', '0.0000', '0.0000', '12.0000', '12.0000', '85.0000', 1, 0, NULL, NULL),
(10, '2021-09-14', 5, 11, 7, 6, '1.0000', '1.0000', '1.0000', '4.0000', '4.0000', '99.0000', 1, 0, NULL, NULL),
(21, '2021-09-14', 5, 22, 8, 6, '2.0000', '1.0202', '1.0202', '4.0000', '4.0000', '96.0000', 1, 0, NULL, NULL),
(22, '2021-09-14', 1, 23, 8, 1, '2.0000', '1.6981', '1.6981', '0.0000', '0.0000', '78.0000', 1, 0, NULL, NULL),
(13, '2021-09-14', 1, 14, 9, 1, '1.0000', '0.0000', '0.0000', '3.0000', '3.0000', '83.0000', 1, 0, NULL, NULL),
(14, '2021-09-14', 2, 15, 9, 3, '1.0000', '1.0000', '1.0000', '2.0000', '2.0000', '15.0000', 1, 0, 1, 2),
(15, '2021-09-14', 1, 16, 9, 1, '1.0000', '0.0000', '0.0000', '12.0000', '12.0000', '83.0000', 1, 0, NULL, NULL),
(16, '2021-09-14', 1, 17, 9, 1, '1.0000', '0.0000', '0.0000', '3.0000', '3.0000', '83.0000', 1, 0, NULL, NULL),
(17, '2021-09-14', 4, 18, 9, 5, '1.0000', '0.0000', '0.0000', '12.0000', '12.0000', '99.0000', 1, 0, NULL, NULL),
(18, '2021-09-14', 5, 19, 9, 6, '1.0000', '1.0000', '1.0000', '4.0000', '4.0000', '96.0000', 1, 0, NULL, NULL),
(19, '2021-09-14', 1, 20, 9, 1, '1.0000', '0.0000', '0.0000', '0.0000', '0.0000', '83.0000', 1, 0, NULL, NULL),
(20, '2021-09-14', 1, 21, 9, 1, '1.0000', '0.0000', '0.0000', '3.0000', '3.0000', '83.0000', 1, 0, NULL, NULL),
(23, '2021-10-23', 1, 24, 10, 1, '1.0000', '0.0000', '0.0000', '12.0000', '12.0000', '77.0000', 1, 0, NULL, NULL),
(24, '2021-10-23', 2, 25, 11, 3, '1.0000', '1.0000', '1.0000', '2.0000', '2.0000', '14.0000', 1, 0, 1, 2),
(25, '2021-10-23', 1, 26, 11, 1, '1.0000', '0.0000', '0.0000', '12.0000', '12.0000', '76.0000', 1, 0, NULL, NULL),
(26, '2021-10-23', 2, 27, 12, 3, '1.0000', '1.0000', '1.0000', '2.0000', '2.0000', '13.0000', 1, 0, 1, 2),
(27, '2021-10-23', 1, 28, 13, 1, '1.0000', '0.0000', '0.0000', '12.0000', '12.0000', '75.0000', 1, 0, NULL, NULL),
(28, '2021-10-23', 2, 29, 13, 3, '1.0000', '1.0000', '1.0000', '2.0000', '2.0000', '12.0000', 1, 0, 1, 2),
(29, '2021-10-23', 1, 30, 14, 1, '1.0000', '0.0000', '0.0000', '12.0000', '12.0000', '74.0000', 1, 0, NULL, NULL),
(30, '2021-10-23', 1, 31, 14, 1, '1.0000', '0.0000', '0.0000', '3.0000', '3.0000', '74.0000', 1, 0, NULL, NULL),
(31, '2021-10-24', 2, 32, 1, 3, '1.0000', '1.0000', '1.0000', '2.0000', '2.0000', '11.0000', 1, 0, 1, 2),
(32, '2021-10-24', 2, 33, 2, 3, '1.0000', '1.0000', '1.0000', '2.0000', '2.0000', '10.0000', 1, 0, 1, 2),
(33, '2021-10-25', 2, 34, 3, 3, '1.0000', '1.0000', '1.0000', '2.0000', '2.0000', '9.0000', 1, 0, 1, 2),
(34, '2021-10-25', 1, 35, 3, 1, '1.0000', '0.0000', '0.0000', '12.0000', '12.0000', '72.0000', 1, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_currencies`
--

CREATE TABLE `sma_currencies` (
  `id` int(11) NOT NULL,
  `code` varchar(5) NOT NULL,
  `name` varchar(55) NOT NULL,
  `rate` decimal(12,4) NOT NULL,
  `auto_update` tinyint(1) NOT NULL DEFAULT 0,
  `symbol` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_currencies`
--

INSERT INTO `sma_currencies` (`id`, `code`, `name`, `rate`, `auto_update`, `symbol`) VALUES
(1, 'USD', 'US Dollar', '1.0000', 0, '$'),
(2, 'EUR', 'EURO', '0.7340', 0, NULL),
(3, 'REL', 'REL', '4000.0000', 1, '៛');

-- --------------------------------------------------------

--
-- Table structure for table `sma_customer_groups`
--

CREATE TABLE `sma_customer_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `percent` int(11) NOT NULL,
  `discount` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_customer_groups`
--

INSERT INTO `sma_customer_groups` (`id`, `name`, `percent`, `discount`) VALUES
(1, 'General', 0, NULL),
(2, 'Reseller', -5, NULL),
(3, 'Distributor', -15, NULL),
(4, 'New Customer (+10)', 10, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_date_format`
--

CREATE TABLE `sma_date_format` (
  `id` int(11) NOT NULL,
  `js` varchar(20) NOT NULL,
  `php` varchar(20) NOT NULL,
  `sql` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_date_format`
--

INSERT INTO `sma_date_format` (`id`, `js`, `php`, `sql`) VALUES
(1, 'mm-dd-yyyy', 'm-d-Y', '%m-%d-%Y'),
(2, 'mm/dd/yyyy', 'm/d/Y', '%m/%d/%Y'),
(3, 'mm.dd.yyyy', 'm.d.Y', '%m.%d.%Y'),
(4, 'dd-mm-yyyy', 'd-m-Y', '%d-%m-%Y'),
(5, 'dd/mm/yyyy', 'd/m/Y', '%d/%m/%Y'),
(6, 'dd.mm.yyyy', 'd.m.Y', '%d.%m.%Y');

-- --------------------------------------------------------

--
-- Table structure for table `sma_deliveries`
--

CREATE TABLE `sma_deliveries` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `sale_id` int(11) NOT NULL,
  `do_reference_no` varchar(50) NOT NULL,
  `sale_reference_no` varchar(50) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `attachment` varchar(50) DEFAULT NULL,
  `delivered_by` varchar(50) DEFAULT NULL,
  `received_by` varchar(50) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_deliveries`
--

INSERT INTO `sma_deliveries` (`id`, `date`, `sale_id`, `do_reference_no`, `sale_reference_no`, `customer`, `address`, `note`, `status`, `attachment`, `delivered_by`, `received_by`, `created_by`, `updated_by`, `updated_at`) VALUES
(1, '2021-08-18 08:20:00', 1, 'DO2021/08/0001', 'SALE/POS2021/08/0001', 'Walk-in Customer', '<p>Customer Address Petaling Jaya Selangor 46000 Malaysia<br>Tel: 0123456789 Email: customer@tecdiary.com</p>', '', 'packing', NULL, 'វិរៈបុនថាំ', 'Test', 1, NULL, NULL),
(2, '2021-10-23 14:10:00', 12, 'DO0002', 'SALE/POS0010', 'Walk-in Customer', '<p>Customer Address Petaling Jaya Selangor 46000 Malaysia<br>Tel: 0123456789 Email: customer@tecdiary.com</p>', '', 'packing', NULL, '', '', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_deposits`
--

CREATE TABLE `sma_deposits` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `company_id` int(11) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `paid_by` varchar(50) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_expenses`
--

CREATE TABLE `sma_expenses` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `reference` varchar(50) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_by` varchar(55) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_expenses`
--

INSERT INTO `sma_expenses` (`id`, `date`, `reference`, `amount`, `note`, `created_by`, `attachment`, `category_id`, `warehouse_id`) VALUES
(1, '2021-09-05 06:33:00', '2021/09/0001', '10.0000', '', '1', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sma_expense_categories`
--

CREATE TABLE `sma_expense_categories` (
  `id` int(11) NOT NULL,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_expense_categories`
--

INSERT INTO `sma_expense_categories` (`id`, `code`, `name`) VALUES
(1, 'others', 'others');

-- --------------------------------------------------------

--
-- Table structure for table `sma_gift_cards`
--

CREATE TABLE `sma_gift_cards` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `card_no` varchar(20) NOT NULL,
  `value` decimal(25,4) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer` varchar(255) DEFAULT NULL,
  `balance` decimal(25,4) NOT NULL,
  `expiry` date DEFAULT NULL,
  `created_by` varchar(55) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_gift_cards`
--

INSERT INTO `sma_gift_cards` (`id`, `date`, `card_no`, `value`, `customer_id`, `customer`, `balance`, `expiry`, `created_by`) VALUES
(1, '2021-08-30 04:48:04', '1324844764646977', '100.0000', 1, 'Walk-in Customer', '100.0000', '2023-08-30', '1');

-- --------------------------------------------------------

--
-- Table structure for table `sma_gift_card_topups`
--

CREATE TABLE `sma_gift_card_topups` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `card_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `created_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_groups`
--

CREATE TABLE `sma_groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_groups`
--

INSERT INTO `sma_groups` (`id`, `name`, `description`) VALUES
(1, 'owner', 'Owner'),
(2, 'admin', 'Administrator'),
(3, 'customer', 'Customer'),
(4, 'supplier', 'Supplier'),
(5, 'sales', 'Sales Staff'),
(6, 'stock', 'stock');

-- --------------------------------------------------------

--
-- Table structure for table `sma_login_attempts`
--

CREATE TABLE `sma_login_attempts` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_logs`
--

CREATE TABLE `sma_logs` (
  `id` int(11) NOT NULL,
  `detail` varchar(190) NOT NULL,
  `model` longtext DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_logs`
--

INSERT INTO `sma_logs` (`id`, `detail`, `model`, `date`) VALUES
(1, 'POS Bill is being deleted by owner (User Id: 1)', '{\"model\":{\"id\":\"3\",\"date\":\"2021-08-23 10:11:39\",\"customer_id\":\"4\",\"customer\":\"Anakut\",\"count\":\"1\",\"order_discount_id\":\"\",\"order_tax_id\":\"1\",\"total\":\"1.5000\",\"biller_id\":\"3\",\"warehouse_id\":\"1\",\"created_by\":\"1\",\"suspend_note\":\"001\",\"shipping\":\"0.0000\",\"cgst\":null,\"sgst\":null,\"igst\":null},\"items\":[{\"id\":\"3\",\"suspend_id\":\"3\",\"product_id\":\"2\",\"product_code\":\"Product\",\"product_name\":\"Product\",\"net_unit_price\":\"1.5000\",\"unit_price\":\"1.5000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"1\",\"item_tax\":\"0.0000\",\"tax_rate_id\":\"1\",\"tax\":\"0\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"1.5000\",\"serial_no\":\"\",\"option_id\":\"1\",\"product_type\":\"standard\",\"real_unit_price\":\"1.5000\",\"product_unit_id\":\"1\",\"product_unit_code\":\"unit\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null}]}', '2021-08-23 03:12:06'),
(2, 'POS Bill is being deleted by owner (User Id: 1)', '{\"model\":{\"id\":\"4\",\"date\":\"2021-09-02 16:29:42\",\"customer_id\":\"4\",\"customer\":\"Anakut\",\"count\":\"2\",\"order_discount_id\":\"\",\"order_tax_id\":\"1\",\"total\":\"14.0000\",\"biller_id\":\"3\",\"warehouse_id\":\"1\",\"created_by\":\"1\",\"suspend_note\":\"001\",\"shipping\":\"0.0000\",\"cgst\":null,\"sgst\":null,\"igst\":null},\"items\":[{\"id\":\"9\",\"suspend_id\":\"4\",\"product_id\":\"2\",\"product_code\":\"Product\",\"product_name\":\"Product\",\"net_unit_price\":\"2.0000\",\"unit_price\":\"2.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"1\",\"item_tax\":\"0.0000\",\"tax_rate_id\":\"1\",\"tax\":\"0\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"2.0000\",\"serial_no\":\"\",\"option_id\":\"1\",\"product_type\":\"standard\",\"real_unit_price\":\"2.0000\",\"product_unit_id\":\"1\",\"product_unit_code\":\"unit\",\"unit_quantity\":\"1.0000\",\"comment\":\"sdfs\",\"ordered\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null},{\"id\":\"8\",\"suspend_id\":\"4\",\"product_id\":\"1\",\"product_code\":\"test\",\"product_name\":\"test\",\"net_unit_price\":\"12.0000\",\"unit_price\":\"12.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"1\",\"item_tax\":\"0.0000\",\"tax_rate_id\":\"1\",\"tax\":\"0\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"12.0000\",\"serial_no\":\"\",\"option_id\":\"0\",\"product_type\":\"standard\",\"real_unit_price\":\"12.0000\",\"product_unit_id\":\"1\",\"product_unit_code\":\"unit\",\"unit_quantity\":\"1.0000\",\"comment\":\"ghjjkkkk\",\"ordered\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null}]}', '2021-09-02 09:38:16'),
(3, 'POS Bill is being deleted by owner (User Id: 1)', '{\"model\":{\"id\":\"5\",\"date\":\"2021-09-02 16:43:53\",\"customer_id\":\"4\",\"customer\":\"Anakut\",\"count\":\"2\",\"order_discount_id\":\"\",\"order_tax_id\":\"1\",\"total\":\"14.0000\",\"biller_id\":\"3\",\"warehouse_id\":\"1\",\"created_by\":\"1\",\"suspend_note\":\"1\",\"shipping\":\"0.0000\",\"cgst\":null,\"sgst\":null,\"igst\":null},\"items\":[{\"id\":\"11\",\"suspend_id\":\"5\",\"product_id\":\"1\",\"product_code\":\"test\",\"product_name\":\"test\",\"net_unit_price\":\"12.0000\",\"unit_price\":\"12.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"1\",\"item_tax\":\"0.0000\",\"tax_rate_id\":\"1\",\"tax\":\"0\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"12.0000\",\"serial_no\":\"\",\"option_id\":null,\"product_type\":\"standard\",\"real_unit_price\":\"12.0000\",\"product_unit_id\":\"1\",\"product_unit_code\":\"unit\",\"unit_quantity\":\"1.0000\",\"comment\":\"12\",\"ordered\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null},{\"id\":\"10\",\"suspend_id\":\"5\",\"product_id\":\"2\",\"product_code\":\"Product\",\"product_name\":\"Product\",\"net_unit_price\":\"2.0000\",\"unit_price\":\"2.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"1\",\"item_tax\":\"0.0000\",\"tax_rate_id\":\"1\",\"tax\":\"0\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"2.0000\",\"serial_no\":\"\",\"option_id\":\"1\",\"product_type\":\"standard\",\"real_unit_price\":\"2.0000\",\"product_unit_id\":\"1\",\"product_unit_code\":\"unit\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"ordered\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null}]}', '2021-09-03 02:23:35'),
(4, 'POS Bill is being deleted by owner (User Id: 1)', '{\"model\":{\"id\":\"8\",\"date\":\"2021-09-13 15:50:59\",\"customer_id\":\"4\",\"customer\":\"Anakut\",\"count\":\"2\",\"order_discount_id\":\"\",\"order_tax_id\":\"1\",\"total\":\"20.0000\",\"biller_id\":\"3\",\"warehouse_id\":\"1\",\"created_by\":\"1\",\"suspend_note\":\"1\",\"shipping\":\"0.0000\",\"cgst\":null,\"sgst\":null,\"igst\":null},\"items\":[{\"id\":\"16\",\"suspend_id\":\"8\",\"product_id\":\"2\",\"product_code\":\"Product\",\"product_name\":\"Product\",\"net_unit_price\":\"10.0000\",\"unit_price\":\"10.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"1\",\"item_tax\":\"0.0000\",\"tax_rate_id\":\"1\",\"tax\":\"0\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"10.0000\",\"serial_no\":\"\",\"option_id\":\"1\",\"product_type\":\"standard\",\"real_unit_price\":\"10.0000\",\"product_unit_id\":\"1\",\"product_unit_code\":\"unit\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"ordered\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null},{\"id\":\"17\",\"suspend_id\":\"8\",\"product_id\":\"1\",\"product_code\":\"test\",\"product_name\":\"test\",\"net_unit_price\":\"10.0000\",\"unit_price\":\"10.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"1\",\"item_tax\":\"0.0000\",\"tax_rate_id\":\"1\",\"tax\":\"0\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"10.0000\",\"serial_no\":\"\",\"option_id\":null,\"product_type\":\"standard\",\"real_unit_price\":\"10.0000\",\"product_unit_id\":\"1\",\"product_unit_code\":\"unit\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"ordered\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null}]}', '2021-09-13 08:51:14'),
(5, 'POS Bill is being deleted by owner (User Id: 1)', '{\"model\":{\"id\":\"6\",\"date\":\"2021-09-03 09:25:33\",\"customer_id\":\"4\",\"customer\":\"Anakut\",\"count\":\"2\",\"order_discount_id\":\"\",\"order_tax_id\":\"1\",\"total\":\"15.0000\",\"biller_id\":\"3\",\"warehouse_id\":\"1\",\"created_by\":\"1\",\"suspend_note\":\"1\",\"shipping\":\"0.0000\",\"cgst\":null,\"sgst\":null,\"igst\":null},\"items\":[{\"id\":\"12\",\"suspend_id\":\"6\",\"product_id\":\"3\",\"product_code\":\"test1234\",\"product_name\":\"test1231\",\"net_unit_price\":\"3.0000\",\"unit_price\":\"3.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"1\",\"item_tax\":\"0.0000\",\"tax_rate_id\":\"1\",\"tax\":\"0\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"3.0000\",\"serial_no\":\"\",\"option_id\":null,\"product_type\":\"combo\",\"real_unit_price\":\"3.0000\",\"product_unit_id\":null,\"product_unit_code\":null,\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"ordered\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null},{\"id\":\"13\",\"suspend_id\":\"6\",\"product_id\":\"4\",\"product_code\":\"testing\",\"product_name\":\"testing\",\"net_unit_price\":\"12.0000\",\"unit_price\":\"12.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"1\",\"item_tax\":\"0.0000\",\"tax_rate_id\":\"1\",\"tax\":\"0\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"12.0000\",\"serial_no\":\"\",\"option_id\":null,\"product_type\":\"standard\",\"real_unit_price\":\"12.0000\",\"product_unit_id\":\"2\",\"product_unit_code\":\"Pcs\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"ordered\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null}]}', '2021-09-13 08:51:17'),
(6, 'POS Bill is being deleted by owner (User Id: 1)', '{\"model\":{\"id\":\"7\",\"date\":\"2021-09-11 11:58:28\",\"customer_id\":\"4\",\"customer\":\"Anakut\",\"count\":\"2\",\"order_discount_id\":\"10%\",\"order_tax_id\":\"1\",\"total\":\"18.0000\",\"biller_id\":\"3\",\"warehouse_id\":\"1\",\"created_by\":\"1\",\"suspend_note\":\"1\",\"shipping\":\"0.0000\",\"cgst\":null,\"sgst\":null,\"igst\":null},\"items\":[{\"id\":\"14\",\"suspend_id\":\"7\",\"product_id\":\"2\",\"product_code\":\"Product\",\"product_name\":\"Product\",\"net_unit_price\":\"10.0000\",\"unit_price\":\"10.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"1\",\"item_tax\":\"0.0000\",\"tax_rate_id\":\"1\",\"tax\":\"0\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"10.0000\",\"serial_no\":\"\",\"option_id\":\"1\",\"product_type\":\"standard\",\"real_unit_price\":\"10.0000\",\"product_unit_id\":\"1\",\"product_unit_code\":\"unit\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"ordered\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null},{\"id\":\"15\",\"suspend_id\":\"7\",\"product_id\":\"1\",\"product_code\":\"test\",\"product_name\":\"test\",\"net_unit_price\":\"10.0000\",\"unit_price\":\"10.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"1\",\"item_tax\":\"0.0000\",\"tax_rate_id\":\"1\",\"tax\":\"0\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"10.0000\",\"serial_no\":\"\",\"option_id\":null,\"product_type\":\"standard\",\"real_unit_price\":\"10.0000\",\"product_unit_id\":\"1\",\"product_unit_code\":\"unit\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"ordered\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null}]}', '2021-09-13 08:51:19'),
(7, 'POS Bill is being deleted by owner (User Id: 1)', '{\"model\":{\"id\":\"9\",\"date\":\"2021-09-13 15:51:56\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"count\":\"2\",\"order_discount_id\":\"\",\"order_tax_id\":\"1\",\"total\":\"14.0000\",\"biller_id\":\"3\",\"warehouse_id\":\"1\",\"created_by\":\"1\",\"suspend_note\":\"1\",\"shipping\":\"0.0000\",\"cgst\":null,\"sgst\":null,\"igst\":null},\"items\":[{\"id\":\"18\",\"suspend_id\":\"9\",\"product_id\":\"2\",\"product_code\":\"Product\",\"product_name\":\"Product\",\"net_unit_price\":\"2.0000\",\"unit_price\":\"2.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"1\",\"item_tax\":\"0.0000\",\"tax_rate_id\":\"1\",\"tax\":\"0\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"2.0000\",\"serial_no\":\"\",\"option_id\":\"1\",\"product_type\":\"standard\",\"real_unit_price\":\"2.0000\",\"product_unit_id\":\"1\",\"product_unit_code\":\"unit\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"ordered\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null},{\"id\":\"19\",\"suspend_id\":\"9\",\"product_id\":\"1\",\"product_code\":\"test\",\"product_name\":\"test\",\"net_unit_price\":\"12.0000\",\"unit_price\":\"12.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"1\",\"item_tax\":\"0.0000\",\"tax_rate_id\":\"1\",\"tax\":\"0\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"12.0000\",\"serial_no\":\"\",\"option_id\":null,\"product_type\":\"standard\",\"real_unit_price\":\"12.0000\",\"product_unit_id\":\"1\",\"product_unit_code\":\"unit\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"ordered\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null}]}', '2021-09-13 08:52:32'),
(8, 'POS Bill is being deleted by owner (User Id: 1)', '{\"model\":{\"id\":\"10\",\"date\":\"2021-09-13 15:52:07\",\"customer_id\":\"4\",\"customer\":\"Anakut\",\"count\":\"2\",\"order_discount_id\":\"\",\"order_tax_id\":\"1\",\"total\":\"20.0000\",\"biller_id\":\"3\",\"warehouse_id\":\"1\",\"created_by\":\"1\",\"suspend_note\":\"1\",\"shipping\":\"0.0000\",\"cgst\":null,\"sgst\":null,\"igst\":null},\"items\":[{\"id\":\"21\",\"suspend_id\":\"10\",\"product_id\":\"3\",\"product_code\":\"test1234\",\"product_name\":\"test1231\",\"net_unit_price\":\"10.0000\",\"unit_price\":\"10.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"1\",\"item_tax\":\"0.0000\",\"tax_rate_id\":\"1\",\"tax\":\"0\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"10.0000\",\"serial_no\":\"\",\"option_id\":null,\"product_type\":\"combo\",\"real_unit_price\":\"10.0000\",\"product_unit_id\":null,\"product_unit_code\":null,\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"ordered\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null},{\"id\":\"20\",\"suspend_id\":\"10\",\"product_id\":\"2\",\"product_code\":\"Product\",\"product_name\":\"Product\",\"net_unit_price\":\"10.0000\",\"unit_price\":\"10.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"1\",\"item_tax\":\"0.0000\",\"tax_rate_id\":\"1\",\"tax\":\"0\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"10.0000\",\"serial_no\":\"\",\"option_id\":\"1\",\"product_type\":\"standard\",\"real_unit_price\":\"10.0000\",\"product_unit_id\":\"1\",\"product_unit_code\":\"unit\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"ordered\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null}]}', '2021-09-13 08:52:35');

-- --------------------------------------------------------

--
-- Table structure for table `sma_migrations`
--

CREATE TABLE `sma_migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_migrations`
--

INSERT INTO `sma_migrations` (`version`) VALUES
(315);

-- --------------------------------------------------------

--
-- Table structure for table `sma_notifications`
--

CREATE TABLE `sma_notifications` (
  `id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `from_date` datetime DEFAULT NULL,
  `till_date` datetime DEFAULT NULL,
  `scope` tinyint(1) NOT NULL DEFAULT 3
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_notifications`
--

INSERT INTO `sma_notifications` (`id`, `comment`, `date`, `from_date`, `till_date`, `scope`) VALUES
(1, '<p>Thank you for purchasing Stock Manager Advance. Please do not forget to check the documentation in help folder. If you find any error/bug, please email to support@tecdiary.com with details. You can send us your valued suggestions/feedback too.</p><p>Please rate Stock Manager Advance on your download page of codecanyon.net</p>', '2014-08-14 23:00:57', '2015-01-01 00:00:00', '2017-01-01 00:00:00', 3);

-- --------------------------------------------------------

--
-- Table structure for table `sma_order_ref`
--

CREATE TABLE `sma_order_ref` (
  `ref_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `so` int(11) NOT NULL DEFAULT 1,
  `qu` int(11) NOT NULL DEFAULT 1,
  `po` int(11) NOT NULL DEFAULT 1,
  `to` int(11) NOT NULL DEFAULT 1,
  `pos` int(11) NOT NULL DEFAULT 1,
  `do` int(11) NOT NULL DEFAULT 1,
  `pay` int(11) NOT NULL DEFAULT 1,
  `re` int(11) NOT NULL DEFAULT 1,
  `rep` int(11) NOT NULL DEFAULT 1,
  `ex` int(11) NOT NULL DEFAULT 1,
  `ppay` int(11) NOT NULL DEFAULT 1,
  `qa` int(11) DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_order_ref`
--

INSERT INTO `sma_order_ref` (`ref_id`, `date`, `so`, `qu`, `po`, `to`, `pos`, `do`, `pay`, `re`, `rep`, `ex`, `ppay`, `qa`) VALUES
(1, '2015-03-01', 2, 2, 6, 1, 16, 3, 16, 1, 1, 2, 5, 4);

-- --------------------------------------------------------

--
-- Table structure for table `sma_payments`
--

CREATE TABLE `sma_payments` (
  `id` int(11) NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `sale_id` int(11) DEFAULT NULL,
  `return_id` int(11) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `reference_no` varchar(50) NOT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `paid_by` varchar(20) NOT NULL,
  `cheque_no` varchar(20) DEFAULT NULL,
  `cc_no` varchar(20) DEFAULT NULL,
  `cc_holder` varchar(25) DEFAULT NULL,
  `cc_month` varchar(2) DEFAULT NULL,
  `cc_year` varchar(4) DEFAULT NULL,
  `cc_type` varchar(20) DEFAULT NULL,
  `amount` decimal(25,4) NOT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `pos_paid` decimal(25,4) DEFAULT 0.0000,
  `pos_balance` decimal(25,4) DEFAULT 0.0000,
  `approval_code` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_payments`
--

INSERT INTO `sma_payments` (`id`, `date`, `sale_id`, `return_id`, `purchase_id`, `reference_no`, `transaction_id`, `paid_by`, `cheque_no`, `cc_no`, `cc_holder`, `cc_month`, `cc_year`, `cc_type`, `amount`, `currency`, `created_by`, `attachment`, `type`, `note`, `pos_paid`, `pos_balance`, `approval_code`) VALUES
(1, '2021-08-18 08:18:29', 1, NULL, NULL, 'IPAY2021/08/0001', NULL, 'cash', '', '', '', '', '', '', '48.0000', NULL, 1, NULL, 'received', '', '48.0000', '0.0000', NULL),
(2, '2021-08-18 08:22:00', NULL, NULL, 1, 'POP2021/08/0001', NULL, 'cash', '', '', '', '', '', 'Visa', '180.0000', NULL, 1, NULL, 'sent', '', '0.0000', '0.0000', NULL),
(3, '2021-08-19 03:00:00', NULL, NULL, 3, 'POP2021/08/0002', NULL, 'cash', '', '', '', '', '', 'Visa', '15.0000', NULL, 1, NULL, 'sent', '', '0.0000', '0.0000', NULL),
(4, '2021-08-19 03:00:00', NULL, NULL, 2, 'POP2021/08/0003', NULL, 'cash', '', '', '', '', '', 'Visa', '20.0000', NULL, 1, NULL, 'sent', '', '0.0000', '0.0000', NULL),
(5, '2021-08-19 07:22:11', 3, NULL, NULL, 'IPAY2021/08/0002', NULL, 'cash', '', '', '', '', '', '', '4.5000', NULL, 1, NULL, 'received', '', '4.5000', '0.0000', NULL),
(6, '2021-08-30 04:44:03', 4, NULL, NULL, 'IPAY2021/08/0003', NULL, 'cash', '', '', '', '', '', '', '14.0000', NULL, 1, NULL, 'received', '', '14.0000', '0.0000', NULL),
(7, '2021-09-14 02:01:37', 5, NULL, NULL, 'IPAY2021/09/0004', NULL, 'cash', '', '', '', '', '', '', '4.0000', NULL, 1, NULL, 'received', '', '4.0000', '0.0000', NULL),
(8, '2021-09-14 02:03:00', 6, NULL, NULL, 'IPAY2021/09/0005', NULL, 'cash', '', '', '', '', '', 'Visa', '-4.0000', NULL, 1, NULL, 'returned', NULL, '0.0000', '0.0000', NULL),
(9, '2021-09-14 02:31:12', 7, NULL, NULL, 'IPAY0006', NULL, 'cash', '', '', '', '', '', '', '4.0000', NULL, 1, NULL, 'received', '', '4.0000', '0.0000', NULL),
(10, '2021-09-14 02:35:33', 8, NULL, NULL, 'IPAY0007', NULL, 'cash', '', '', '', '', '', '', '8.0000', NULL, 1, NULL, 'received', '', '8.0000', '0.0000', NULL),
(11, '2021-09-14 02:54:00', NULL, NULL, 5, 'POP0004', NULL, 'cash', '', '', '', '', '', 'Visa', '2.0000', NULL, 1, NULL, 'sent', '', '0.0000', '0.0000', NULL),
(12, '2021-09-14 04:09:06', 9, NULL, NULL, 'IPAY0008', NULL, 'cash', '', '', '', '', '', '', '39.0000', NULL, 1, NULL, 'received', '', '39.0000', '0.0000', NULL),
(13, '2021-10-23 03:46:46', 10, NULL, NULL, 'IPAY0009', NULL, 'cash', '', '', '', '', '', '', '12.0000', NULL, 1, NULL, 'received', '', '12.0000', '0.0000', NULL),
(14, '2021-10-23 13:57:10', 11, NULL, NULL, 'IPAY0010', NULL, 'cash', '', '', '', '', '', '', '14.0000', NULL, 1, NULL, 'received', '', '14.0000', '0.0000', NULL),
(15, '2021-10-23 13:57:39', 12, NULL, NULL, 'IPAY0011', NULL, 'cash', '', '', '', '', '', '', '2.0000', NULL, 1, NULL, 'received', '', '2.0000', '0.0000', NULL),
(16, '2021-10-23 14:30:57', 13, NULL, NULL, 'IPAY0012', NULL, 'cash', '', '', '', '', '', '', '14.0000', NULL, 1, NULL, 'received', '', '14.0000', '0.0000', NULL),
(17, '2021-10-23 15:10:41', 14, NULL, NULL, 'IPAY0013', NULL, 'cash', '', '', '', '', '', '', '15.0000', NULL, 1, NULL, 'received', '', '15.0000', '0.0000', NULL),
(18, '2021-10-24 05:05:57', 1, NULL, NULL, 'IPAY0014', NULL, 'cash', '', '', '', '', '', '', '2.0000', NULL, 1, NULL, 'received', '', '2.0000', '0.0000', NULL),
(19, '2021-10-24 05:06:07', 2, NULL, NULL, 'IPAY0015', NULL, 'cash', '', '', '', '', '', '', '2.0000', NULL, 1, NULL, 'received', '', '2.0000', '0.0000', NULL),
(20, '2021-10-24 19:38:05', 3, NULL, NULL, 'HOTEL/1635147485', NULL, 'cash', NULL, NULL, NULL, NULL, NULL, NULL, '14.0000', NULL, 1, '', 'received', 'Payment From Hotel', '0.0000', '0.0000', NULL),
(21, '2021-10-24 19:38:47', 3, NULL, NULL, 'HOTEL/1635147527', NULL, 'cash', NULL, NULL, NULL, NULL, NULL, NULL, '14.0000', NULL, 1, '', 'received', 'Payment From Hotel', '14.0000', '0.0000', NULL),
(22, '2021-10-24 19:39:05', 3, NULL, NULL, 'HOTEL/1635147545', NULL, 'cash', NULL, NULL, NULL, NULL, NULL, NULL, '14.0000', NULL, 1, '', 'received', 'Payment From Hotel', '14.0000', '0.0000', NULL),
(23, '2021-10-24 19:42:11', 3, NULL, NULL, 'HOTEL/1635147731', NULL, 'cash', NULL, NULL, NULL, NULL, NULL, NULL, '14.0000', NULL, 1, '', 'received', 'Payment From Hotel', '14.0000', '0.0000', NULL),
(24, '2021-10-24 19:43:20', 3, NULL, NULL, 'HOTEL/1635147800', NULL, 'cash', NULL, NULL, NULL, NULL, NULL, NULL, '14.0000', NULL, 1, '', 'received', 'Payment From Hotel', '14.0000', '0.0000', NULL),
(25, '2021-10-24 19:43:37', 3, NULL, NULL, 'HOTEL/1635147817', NULL, 'cash', NULL, NULL, NULL, NULL, NULL, NULL, '14.0000', NULL, 1, '', 'received', 'Payment From Hotel', '14.0000', '0.0000', NULL),
(26, '2021-10-24 19:48:24', 3, NULL, NULL, 'HOTEL/1635148104', NULL, 'cash', NULL, NULL, NULL, NULL, NULL, NULL, '14.0000', NULL, 1, '', 'received', 'Payment From Hotel', '14.0000', '0.0000', NULL),
(27, '2021-10-24 19:49:18', 3, NULL, NULL, 'HOTEL/1635148158', NULL, 'cash', NULL, NULL, NULL, NULL, NULL, NULL, '14.0000', NULL, 1, '', 'received', 'Payment From Hotel', '14.0000', '0.0000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_paypal`
--

CREATE TABLE `sma_paypal` (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `account_email` varchar(255) NOT NULL,
  `paypal_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT 2.0000,
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT 3.9000,
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT 4.4000
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_paypal`
--

INSERT INTO `sma_paypal` (`id`, `active`, `account_email`, `paypal_currency`, `fixed_charges`, `extra_charges_my`, `extra_charges_other`) VALUES
(1, 1, 'mypaypal@paypal.com', 'USD', '0.0000', '0.0000', '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_permissions`
--

CREATE TABLE `sma_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `products-index` tinyint(1) DEFAULT 0,
  `products-add` tinyint(1) DEFAULT 0,
  `products-edit` tinyint(1) DEFAULT 0,
  `products-delete` tinyint(1) DEFAULT 0,
  `products-cost` tinyint(1) DEFAULT 0,
  `products-price` tinyint(1) DEFAULT 0,
  `quotes-index` tinyint(1) DEFAULT 0,
  `quotes-add` tinyint(1) DEFAULT 0,
  `quotes-edit` tinyint(1) DEFAULT 0,
  `quotes-pdf` tinyint(1) DEFAULT 0,
  `quotes-email` tinyint(1) DEFAULT 0,
  `quotes-delete` tinyint(1) DEFAULT 0,
  `sales-index` tinyint(1) DEFAULT 0,
  `sales-add` tinyint(1) DEFAULT 0,
  `sales-edit` tinyint(1) DEFAULT 0,
  `sales-pdf` tinyint(1) DEFAULT 0,
  `sales-email` tinyint(1) DEFAULT 0,
  `sales-delete` tinyint(1) DEFAULT 0,
  `purchases-index` tinyint(1) DEFAULT 0,
  `purchases-add` tinyint(1) DEFAULT 0,
  `purchases-edit` tinyint(1) DEFAULT 0,
  `purchases-pdf` tinyint(1) DEFAULT 0,
  `purchases-email` tinyint(1) DEFAULT 0,
  `purchases-delete` tinyint(1) DEFAULT 0,
  `transfers-index` tinyint(1) DEFAULT 0,
  `transfers-add` tinyint(1) DEFAULT 0,
  `transfers-edit` tinyint(1) DEFAULT 0,
  `transfers-pdf` tinyint(1) DEFAULT 0,
  `transfers-email` tinyint(1) DEFAULT 0,
  `transfers-delete` tinyint(1) DEFAULT 0,
  `customers-index` tinyint(1) DEFAULT 0,
  `customers-add` tinyint(1) DEFAULT 0,
  `customers-edit` tinyint(1) DEFAULT 0,
  `customers-delete` tinyint(1) DEFAULT 0,
  `suppliers-index` tinyint(1) DEFAULT 0,
  `suppliers-add` tinyint(1) DEFAULT 0,
  `suppliers-edit` tinyint(1) DEFAULT 0,
  `suppliers-delete` tinyint(1) DEFAULT 0,
  `sales-deliveries` tinyint(1) DEFAULT 0,
  `sales-add_delivery` tinyint(1) DEFAULT 0,
  `sales-edit_delivery` tinyint(1) DEFAULT 0,
  `sales-delete_delivery` tinyint(1) DEFAULT 0,
  `sales-email_delivery` tinyint(1) DEFAULT 0,
  `sales-pdf_delivery` tinyint(1) DEFAULT 0,
  `sales-gift_cards` tinyint(1) DEFAULT 0,
  `sales-add_gift_card` tinyint(1) DEFAULT 0,
  `sales-edit_gift_card` tinyint(1) DEFAULT 0,
  `sales-delete_gift_card` tinyint(1) DEFAULT 0,
  `pos-index` tinyint(1) DEFAULT 0,
  `sales-return_sales` tinyint(1) DEFAULT 0,
  `reports-index` tinyint(1) DEFAULT 0,
  `reports-warehouse_stock` tinyint(1) DEFAULT 0,
  `reports-quantity_alerts` tinyint(1) DEFAULT 0,
  `reports-expiry_alerts` tinyint(1) DEFAULT 0,
  `reports-products` tinyint(1) DEFAULT 0,
  `reports-daily_sales` tinyint(1) DEFAULT 0,
  `reports-monthly_sales` tinyint(1) DEFAULT 0,
  `reports-sales` tinyint(1) DEFAULT 0,
  `reports-payments` tinyint(1) DEFAULT 0,
  `reports-purchases` tinyint(1) DEFAULT 0,
  `reports-profit_loss` tinyint(1) DEFAULT 0,
  `reports-customers` tinyint(1) DEFAULT 0,
  `reports-suppliers` tinyint(1) DEFAULT 0,
  `reports-staff` tinyint(1) DEFAULT 0,
  `reports-register` tinyint(1) DEFAULT 0,
  `sales-payments` tinyint(1) DEFAULT 0,
  `purchases-payments` tinyint(1) DEFAULT 0,
  `purchases-expenses` tinyint(1) DEFAULT 0,
  `products-adjustments` tinyint(1) NOT NULL DEFAULT 0,
  `bulk_actions` tinyint(1) NOT NULL DEFAULT 0,
  `customers-deposits` tinyint(1) NOT NULL DEFAULT 0,
  `customers-delete_deposit` tinyint(1) NOT NULL DEFAULT 0,
  `products-barcode` tinyint(1) NOT NULL DEFAULT 0,
  `purchases-return_purchases` tinyint(1) NOT NULL DEFAULT 0,
  `reports-expenses` tinyint(1) NOT NULL DEFAULT 0,
  `reports-daily_purchases` tinyint(1) DEFAULT 0,
  `reports-monthly_purchases` tinyint(1) DEFAULT 0,
  `products-stock_count` tinyint(1) DEFAULT 0,
  `edit_price` tinyint(1) DEFAULT 0,
  `returns-index` tinyint(1) DEFAULT 0,
  `returns-add` tinyint(1) DEFAULT 0,
  `returns-edit` tinyint(1) DEFAULT 0,
  `returns-delete` tinyint(1) DEFAULT 0,
  `returns-email` tinyint(1) DEFAULT 0,
  `returns-pdf` tinyint(1) DEFAULT 0,
  `reports-tax` tinyint(1) DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_permissions`
--

INSERT INTO `sma_permissions` (`id`, `group_id`, `products-index`, `products-add`, `products-edit`, `products-delete`, `products-cost`, `products-price`, `quotes-index`, `quotes-add`, `quotes-edit`, `quotes-pdf`, `quotes-email`, `quotes-delete`, `sales-index`, `sales-add`, `sales-edit`, `sales-pdf`, `sales-email`, `sales-delete`, `purchases-index`, `purchases-add`, `purchases-edit`, `purchases-pdf`, `purchases-email`, `purchases-delete`, `transfers-index`, `transfers-add`, `transfers-edit`, `transfers-pdf`, `transfers-email`, `transfers-delete`, `customers-index`, `customers-add`, `customers-edit`, `customers-delete`, `suppliers-index`, `suppliers-add`, `suppliers-edit`, `suppliers-delete`, `sales-deliveries`, `sales-add_delivery`, `sales-edit_delivery`, `sales-delete_delivery`, `sales-email_delivery`, `sales-pdf_delivery`, `sales-gift_cards`, `sales-add_gift_card`, `sales-edit_gift_card`, `sales-delete_gift_card`, `pos-index`, `sales-return_sales`, `reports-index`, `reports-warehouse_stock`, `reports-quantity_alerts`, `reports-expiry_alerts`, `reports-products`, `reports-daily_sales`, `reports-monthly_sales`, `reports-sales`, `reports-payments`, `reports-purchases`, `reports-profit_loss`, `reports-customers`, `reports-suppliers`, `reports-staff`, `reports-register`, `sales-payments`, `purchases-payments`, `purchases-expenses`, `products-adjustments`, `bulk_actions`, `customers-deposits`, `customers-delete_deposit`, `products-barcode`, `purchases-return_purchases`, `reports-expenses`, `reports-daily_purchases`, `reports-monthly_purchases`, `products-stock_count`, `edit_price`, `returns-index`, `returns-add`, `returns-edit`, `returns-delete`, `returns-email`, `returns-pdf`, `reports-tax`) VALUES
(1, 5, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 6, 1, 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 1, 1, 1, 1, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, 1, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_pos_register`
--

CREATE TABLE `sma_pos_register` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL,
  `cash_in_hand` decimal(25,4) NOT NULL,
  `status` varchar(10) NOT NULL,
  `total_cash` decimal(25,4) DEFAULT NULL,
  `total_cheques` int(11) DEFAULT NULL,
  `total_cc_slips` int(11) DEFAULT NULL,
  `total_cash_submitted` decimal(25,4) DEFAULT NULL,
  `total_cheques_submitted` int(11) DEFAULT NULL,
  `total_cc_slips_submitted` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `closed_at` timestamp NULL DEFAULT NULL,
  `transfer_opened_bills` varchar(50) DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_pos_register`
--

INSERT INTO `sma_pos_register` (`id`, `date`, `user_id`, `cash_in_hand`, `status`, `total_cash`, `total_cheques`, `total_cc_slips`, `total_cash_submitted`, `total_cheques_submitted`, `total_cc_slips_submitted`, `note`, `closed_at`, `transfer_opened_bills`, `closed_by`) VALUES
(1, '2021-08-18 08:09:42', 1, '10.0000', 'close', '58.0000', 0, 0, '58.0000', 0, 0, '', '2021-08-18 20:22:01', '0', 1),
(2, '2021-08-19 00:58:29', 1, '10.0000', 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, '2021-09-15 02:01:56', 3, '0.0000', 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_pos_settings`
--

CREATE TABLE `sma_pos_settings` (
  `pos_id` int(1) NOT NULL,
  `cat_limit` int(11) NOT NULL,
  `pro_limit` int(11) NOT NULL,
  `default_category` int(11) NOT NULL,
  `default_customer` int(11) NOT NULL,
  `default_biller` int(11) NOT NULL,
  `display_time` varchar(3) NOT NULL DEFAULT 'yes',
  `cf_title1` varchar(255) DEFAULT NULL,
  `cf_title2` varchar(255) DEFAULT NULL,
  `cf_value1` varchar(255) DEFAULT NULL,
  `cf_value2` varchar(255) DEFAULT NULL,
  `receipt_printer` varchar(55) DEFAULT NULL,
  `cash_drawer_codes` varchar(55) DEFAULT NULL,
  `focus_add_item` varchar(55) DEFAULT NULL,
  `add_manual_product` varchar(55) DEFAULT NULL,
  `customer_selection` varchar(55) DEFAULT NULL,
  `add_customer` varchar(55) DEFAULT NULL,
  `toggle_category_slider` varchar(55) DEFAULT NULL,
  `toggle_subcategory_slider` varchar(55) DEFAULT NULL,
  `cancel_sale` varchar(55) DEFAULT NULL,
  `suspend_sale` varchar(55) DEFAULT NULL,
  `print_items_list` varchar(55) DEFAULT NULL,
  `finalize_sale` varchar(55) DEFAULT NULL,
  `today_sale` varchar(55) DEFAULT NULL,
  `open_hold_bills` varchar(55) DEFAULT NULL,
  `close_register` varchar(55) DEFAULT NULL,
  `keyboard` tinyint(1) NOT NULL,
  `pos_printers` varchar(255) DEFAULT NULL,
  `java_applet` tinyint(1) NOT NULL,
  `product_button_color` varchar(20) NOT NULL DEFAULT 'default',
  `tooltips` tinyint(1) DEFAULT 1,
  `paypal_pro` tinyint(1) DEFAULT 0,
  `stripe` tinyint(1) DEFAULT 0,
  `rounding` tinyint(1) DEFAULT 0,
  `char_per_line` tinyint(4) DEFAULT 42,
  `pin_code` varchar(20) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT 'purchase_code',
  `envato_username` varchar(50) DEFAULT 'envato_username',
  `version` varchar(10) DEFAULT '3.4.38',
  `after_sale_page` tinyint(1) DEFAULT 0,
  `item_order` tinyint(1) DEFAULT 0,
  `authorize` tinyint(1) DEFAULT 0,
  `toggle_brands_slider` varchar(55) DEFAULT NULL,
  `remote_printing` tinyint(1) DEFAULT 1,
  `printer` int(11) DEFAULT NULL,
  `order_printers` varchar(55) DEFAULT NULL,
  `auto_print` tinyint(1) DEFAULT 0,
  `customer_details` tinyint(1) DEFAULT NULL,
  `local_printers` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_pos_settings`
--

INSERT INTO `sma_pos_settings` (`pos_id`, `cat_limit`, `pro_limit`, `default_category`, `default_customer`, `default_biller`, `display_time`, `cf_title1`, `cf_title2`, `cf_value1`, `cf_value2`, `receipt_printer`, `cash_drawer_codes`, `focus_add_item`, `add_manual_product`, `customer_selection`, `add_customer`, `toggle_category_slider`, `toggle_subcategory_slider`, `cancel_sale`, `suspend_sale`, `print_items_list`, `finalize_sale`, `today_sale`, `open_hold_bills`, `close_register`, `keyboard`, `pos_printers`, `java_applet`, `product_button_color`, `tooltips`, `paypal_pro`, `stripe`, `rounding`, `char_per_line`, `pin_code`, `purchase_code`, `envato_username`, `version`, `after_sale_page`, `item_order`, `authorize`, `toggle_brands_slider`, `remote_printing`, `printer`, `order_printers`, `auto_print`, `customer_details`, `local_printers`) VALUES
(1, 22, 20, 1, 1, 3, '1', 'GST Reg', 'VAT Reg', '123456789', '987654321', NULL, 'x1C', 'Ctrl+F3', 'Ctrl+Shift+M', 'Ctrl+Shift+C', 'Ctrl+Shift+A', 'Ctrl+F11', 'Ctrl+F12', 'F4', 'F7', 'F9', 'F8', 'Ctrl+F1', 'Ctrl+F2', 'Ctrl+F10', 1, NULL, 0, 'default', 1, 0, 0, 0, 42, NULL, 'purchase_code', 'envato_username', '3.4.38', 0, 0, 0, '', 1, NULL, 'null', 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sma_price_groups`
--

CREATE TABLE `sma_price_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_price_groups`
--

INSERT INTO `sma_price_groups` (`id`, `name`) VALUES
(1, 'Default'),
(2, 'Chinese Customer');

-- --------------------------------------------------------

--
-- Table structure for table `sma_printers`
--

CREATE TABLE `sma_printers` (
  `id` int(11) NOT NULL,
  `title` varchar(55) NOT NULL,
  `type` varchar(25) NOT NULL,
  `profile` varchar(25) NOT NULL,
  `char_per_line` tinyint(3) UNSIGNED DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `ip_address` varbinary(45) DEFAULT NULL,
  `port` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_products`
--

CREATE TABLE `sma_products` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `unit` int(11) DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) NOT NULL,
  `alert_quantity` decimal(15,4) DEFAULT 20.0000,
  `image` varchar(255) DEFAULT 'no_image.png',
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `cf1` varchar(255) DEFAULT NULL,
  `cf2` varchar(255) DEFAULT NULL,
  `cf3` varchar(255) DEFAULT NULL,
  `cf4` varchar(255) DEFAULT NULL,
  `cf5` varchar(255) DEFAULT NULL,
  `cf6` varchar(255) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT 0.0000,
  `tax_rate` int(11) DEFAULT NULL,
  `track_quantity` tinyint(1) DEFAULT 1,
  `details` varchar(1000) DEFAULT NULL,
  `warehouse` int(11) DEFAULT NULL,
  `barcode_symbology` varchar(55) NOT NULL DEFAULT 'code128',
  `file` varchar(100) DEFAULT NULL,
  `product_details` text DEFAULT NULL,
  `tax_method` tinyint(1) DEFAULT 0,
  `type` varchar(55) NOT NULL DEFAULT 'standard',
  `supplier1` int(11) DEFAULT NULL,
  `supplier1price` decimal(25,4) DEFAULT NULL,
  `supplier2` int(11) DEFAULT NULL,
  `supplier2price` decimal(25,4) DEFAULT NULL,
  `supplier3` int(11) DEFAULT NULL,
  `supplier3price` decimal(25,4) DEFAULT NULL,
  `supplier4` int(11) DEFAULT NULL,
  `supplier4price` decimal(25,4) DEFAULT NULL,
  `supplier5` int(11) DEFAULT NULL,
  `supplier5price` decimal(25,4) DEFAULT NULL,
  `promotion` tinyint(1) DEFAULT 0,
  `promo_price` decimal(25,4) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `supplier1_part_no` varchar(50) DEFAULT NULL,
  `supplier2_part_no` varchar(50) DEFAULT NULL,
  `supplier3_part_no` varchar(50) DEFAULT NULL,
  `supplier4_part_no` varchar(50) DEFAULT NULL,
  `supplier5_part_no` varchar(50) DEFAULT NULL,
  `sale_unit` int(11) DEFAULT NULL,
  `purchase_unit` int(11) DEFAULT NULL,
  `brand` int(11) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `weight` decimal(10,4) DEFAULT NULL,
  `hsn_code` int(11) DEFAULT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `hide` tinyint(1) NOT NULL DEFAULT 0,
  `second_name` varchar(255) DEFAULT NULL,
  `hide_pos` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_products`
--

INSERT INTO `sma_products` (`id`, `code`, `name`, `unit`, `cost`, `price`, `alert_quantity`, `image`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `quantity`, `tax_rate`, `track_quantity`, `details`, `warehouse`, `barcode_symbology`, `file`, `product_details`, `tax_method`, `type`, `supplier1`, `supplier1price`, `supplier2`, `supplier2price`, `supplier3`, `supplier3price`, `supplier4`, `supplier4price`, `supplier5`, `supplier5price`, `promotion`, `promo_price`, `start_date`, `end_date`, `supplier1_part_no`, `supplier2_part_no`, `supplier3_part_no`, `supplier4_part_no`, `supplier5_part_no`, `sale_unit`, `purchase_unit`, `brand`, `slug`, `featured`, `weight`, `hsn_code`, `views`, `hide`, `second_name`, `hide_pos`) VALUES
(1, 'test', 'test', 1, '8.0000', '12.0000', '0.0000', 'no_image.png', 1, 2, '', '', '', '', '', '', '92.0000', 1, 1, '', NULL, 'code128', '', '', 1, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 0, 'test', NULL, '10.0000', NULL, 0, 0, 'test test', 0),
(2, 'Product', 'Product', 1, '1.0000', '2.0000', '20.0000', 'no_image.png', 1, NULL, '', '', '', '', '', '', '24.0000', 1, 1, '', NULL, 'code128', '', '', 1, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '1.5000', '2021-08-19', '2021-08-23', '', NULL, NULL, NULL, NULL, 1, 1, 0, 'product', NULL, '4.0000', NULL, 0, 0, '', 0),
(3, 'test1234', 'test1231', NULL, NULL, '3.0000', '0.0000', 'no_image.png', 1, NULL, '', '', '', '', '', '', NULL, 1, 0, '', NULL, 'code128', '', '', 1, 'combo', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 0, 0, 0, 'test1231', NULL, '0.0000', NULL, 0, 0, '', 0),
(4, 'testing', 'testing', 2, '0.0000', '12.0000', '0.0000', 'no_image.png', 1, NULL, '', '', '', '', '', '', '99.0000', 1, 1, '', NULL, 'code128', '', '', 1, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 0, 0, 0, 'testing', NULL, '0.0000', NULL, 0, 0, 'T', 0),
(5, '49234040', 'With Supplier', 1, '2.0000', '4.0000', '0.0000', 'no_image.png', 1, NULL, '', '', '', '', '', '', '98.0000', 1, 1, '<p>I am cute.</p>', NULL, 'code128', '', '<p>Fresh and cool</p>', 1, 'standard', 2, '2.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ID001', NULL, NULL, NULL, NULL, 1, 1, 0, '49234040', NULL, '2.0000', NULL, 0, 0, 'WS', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_photos`
--

CREATE TABLE `sma_product_photos` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `photo` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_prices`
--

CREATE TABLE `sma_product_prices` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price_group_id` int(11) NOT NULL,
  `price` decimal(25,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_product_prices`
--

INSERT INTO `sma_product_prices` (`id`, `product_id`, `price_group_id`, `price`) VALUES
(1, 4, 2, '10.0000'),
(2, 3, 2, '10.0000'),
(3, 1, 2, '10.0000'),
(4, 2, 2, '10.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_variants`
--

CREATE TABLE `sma_product_variants` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_product_variants`
--

INSERT INTO `sma_product_variants` (`id`, `product_id`, `name`, `cost`, `price`, `quantity`) VALUES
(1, 2, 'White', '1.0000', '0.0000', '24.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_promos`
--

CREATE TABLE `sma_promos` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `product2buy` int(11) NOT NULL,
  `product2get` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_promos`
--

INSERT INTO `sma_promos` (`id`, `name`, `product2buy`, `product2get`, `start_date`, `end_date`, `description`) VALUES
(1, 'test', 5, 1, '2021-09-14', '2021-10-09', 'Promosc With Supplier');

-- --------------------------------------------------------

--
-- Table structure for table `sma_purchases`
--

CREATE TABLE `sma_purchases` (
  `id` int(11) NOT NULL,
  `reference_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `supplier_id` int(11) NOT NULL,
  `supplier` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` varchar(1000) NOT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `product_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_discount` decimal(25,4) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT NULL,
  `product_tax` decimal(25,4) DEFAULT NULL,
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT 0.0000,
  `shipping` decimal(25,4) DEFAULT 0.0000,
  `grand_total` decimal(25,4) NOT NULL,
  `paid` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `status` varchar(55) DEFAULT '',
  `payment_status` varchar(20) DEFAULT 'pending',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `payment_term` tinyint(4) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `return_id` int(11) DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `return_purchase_ref` varchar(55) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `return_purchase_total` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_purchases`
--

INSERT INTO `sma_purchases` (`id`, `reference_no`, `date`, `supplier_id`, `supplier`, `warehouse_id`, `note`, `total`, `product_discount`, `order_discount_id`, `order_discount`, `total_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `shipping`, `grand_total`, `paid`, `status`, `payment_status`, `created_by`, `updated_by`, `updated_at`, `attachment`, `payment_term`, `due_date`, `return_id`, `surcharge`, `return_purchase_ref`, `purchase_id`, `return_purchase_total`, `cgst`, `sgst`, `igst`) VALUES
(1, 'PO2021/08/0001', '2021-08-18 08:22:00', 2, 'Supplier Company Name', 1, '', '180.0000', '0.0000', '', '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '180.0000', '180.0000', 'received', 'paid', 1, NULL, NULL, NULL, 0, NULL, NULL, '0.0000', NULL, NULL, '0.0000', NULL, NULL, NULL),
(2, 'PO2021/08/0002', '2021-08-19 02:58:00', 2, 'Supplier Company Name', 1, '', '20.0000', '0.0000', '', '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '20.0000', '20.0000', 'received', 'paid', 1, NULL, NULL, NULL, 0, NULL, NULL, '0.0000', NULL, NULL, '0.0000', NULL, NULL, NULL),
(3, 'PO2021/08/0003', '2021-08-19 02:58:00', 2, 'Supplier Company Name', 1, '', '15.0000', '0.0000', '', '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '15.0000', '15.0000', 'received', 'paid', 1, NULL, NULL, NULL, 0, NULL, NULL, '0.0000', NULL, NULL, '0.0000', NULL, NULL, NULL),
(4, 'PO0004', '2021-09-14 02:51:00', 2, 'Supplier Company Name', 1, '', '2.0000', '0.0000', '', '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '2.0000', '0.0000', 'received', 'pending', 1, NULL, NULL, NULL, 0, NULL, NULL, '0.0000', NULL, NULL, '0.0000', NULL, NULL, NULL),
(5, 'PO0005', '2021-09-14 02:53:00', 2, 'Supplier Company Name', 1, '', '2.0000', '0.0000', '', '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '2.0000', '2.0000', 'received', 'paid', 1, NULL, NULL, NULL, 0, NULL, NULL, '0.0000', NULL, NULL, '0.0000', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_purchase_items`
--

CREATE TABLE `sma_purchase_items` (
  `id` int(11) NOT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `transfer_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(20) DEFAULT NULL,
  `discount` varchar(20) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT 0.0000,
  `date` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `unit_cost` decimal(25,4) DEFAULT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL,
  `quantity_received` decimal(15,4) DEFAULT NULL,
  `supplier_part_no` varchar(50) DEFAULT NULL,
  `purchase_item_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `base_unit_cost` decimal(25,4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_purchase_items`
--

INSERT INTO `sma_purchase_items` (`id`, `purchase_id`, `transfer_id`, `product_id`, `product_code`, `product_name`, `option_id`, `net_unit_cost`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `expiry`, `subtotal`, `quantity_balance`, `date`, `status`, `unit_cost`, `real_unit_cost`, `quantity_received`, `supplier_part_no`, `purchase_item_id`, `product_unit_id`, `product_unit_code`, `unit_quantity`, `gst`, `cgst`, `sgst`, `igst`, `base_unit_cost`) VALUES
(1, NULL, NULL, 1, 'test', 'test', NULL, '0.0000', '100.0000', 1, '0.0000', 1, '0', NULL, NULL, NULL, '0.0000', '72.0000', '2021-08-18', 'received', '0.0000', '0.0000', '100.0000', NULL, NULL, 1, 'unit', '100.0000', NULL, NULL, NULL, NULL, NULL),
(2, 1, NULL, 1, 'test', 'test', NULL, '9.0000', '20.0000', 1, '0.0000', 1, '0', '0', '0.0000', NULL, '180.0000', '20.0000', '2021-08-18', 'received', '9.0000', '9.0000', '20.0000', NULL, NULL, 1, 'unit', '20.0000', NULL, NULL, NULL, NULL, '9.0000'),
(3, 2, NULL, 2, 'Product', 'Product', 1, '1.0000', '20.0000', 1, '0.0000', 1, '0', '0', '0.0000', '2021-08-22', '20.0000', '9.0000', '2021-08-19', 'received', '1.0000', '1.0000', '20.0000', NULL, NULL, 1, 'unit', '20.0000', NULL, NULL, NULL, NULL, '1.0000'),
(4, 3, NULL, 2, 'Product', 'Product', 1, '1.0000', '15.0000', 1, '0.0000', 1, '0', '0', '0.0000', '2021-08-31', '15.0000', '15.0000', '2021-08-19', 'received', '1.0000', '1.0000', '15.0000', NULL, NULL, 1, 'unit', '15.0000', NULL, NULL, NULL, NULL, '1.0000'),
(5, NULL, NULL, 4, 'testing', 'testing', NULL, '0.0000', '100.0000', 1, '0.0000', 1, '0', NULL, NULL, NULL, '0.0000', '99.0000', '2021-08-26', 'received', '0.0000', '0.0000', '100.0000', NULL, NULL, 2, 'Pcs', '100.0000', NULL, NULL, NULL, NULL, NULL),
(6, NULL, NULL, 5, '49234040', 'With Supplier', NULL, '1.0000', '100.0000', 1, '0.0000', 1, '0', NULL, NULL, NULL, '100.0000', '96.0000', '2021-09-14', 'received', '1.0000', '1.0000', '100.0000', NULL, NULL, 1, 'unit', '100.0000', NULL, NULL, NULL, NULL, NULL),
(7, 4, NULL, 5, '49234040', 'With Supplier', NULL, '2.0000', '1.0000', 1, '0.0000', 1, '0', '0', '0.0000', NULL, '2.0000', '1.0000', '2021-09-14', 'received', '2.0000', '2.0000', '1.0000', 'ID001', NULL, 1, 'unit', '1.0000', NULL, NULL, NULL, NULL, '2.0000'),
(8, 5, NULL, 5, '49234040', 'With Supplier', NULL, '2.0000', '1.0000', 1, '0.0000', 1, '0', '0', '0.0000', NULL, '2.0000', '1.0000', '2021-09-14', 'received', '2.0000', '2.0000', '1.0000', 'ID001', NULL, 1, 'unit', '1.0000', NULL, NULL, NULL, NULL, '2.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_quotes`
--

CREATE TABLE `sma_quotes` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `internal_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT 0.0000,
  `order_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT 0.0000,
  `product_tax` decimal(25,4) DEFAULT 0.0000,
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `shipping` decimal(25,4) DEFAULT 0.0000,
  `grand_total` decimal(25,4) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `supplier` varchar(55) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_quotes`
--

INSERT INTO `sma_quotes` (`id`, `date`, `reference_no`, `customer_id`, `customer`, `warehouse_id`, `biller_id`, `biller`, `note`, `internal_note`, `total`, `product_discount`, `order_discount`, `order_discount_id`, `total_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `shipping`, `grand_total`, `status`, `created_by`, `updated_by`, `updated_at`, `attachment`, `supplier_id`, `supplier`, `hash`, `cgst`, `sgst`, `igst`) VALUES
(1, '2021-08-19 02:23:00', 'QUOTE2021/08/0001', 1, 'Walk-in Customer', 1, 3, 'Test Biller', '', NULL, '120.0000', '0.0000', '0.0000', '', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '120.0000', 'completed', 1, NULL, NULL, NULL, 2, 'Supplier Company Name', '608da23b4e3d77ba6622fab328ebcfeec02bc64357e19160ed11df50d1c82df0', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_quote_items`
--

CREATE TABLE `sma_quote_items` (
  `id` int(11) NOT NULL,
  `quote_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_quote_items`
--

INSERT INTO `sma_quote_items` (`id`, `quote_id`, `product_id`, `product_code`, `product_name`, `product_type`, `option_id`, `net_unit_price`, `unit_price`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `subtotal`, `serial_no`, `real_unit_price`, `product_unit_id`, `product_unit_code`, `unit_quantity`, `gst`, `cgst`, `sgst`, `igst`) VALUES
(1, 1, 1, 'test', 'test', 'standard', 0, '12.0000', '12.0000', '10.0000', 1, '0.0000', 1, '0', '0', '0.0000', '120.0000', NULL, '12.0000', 1, 'unit', '10.0000', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_returns`
--

CREATE TABLE `sma_returns` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `staff_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT 0.0000,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT 0.0000,
  `order_discount` decimal(25,4) DEFAULT 0.0000,
  `product_tax` decimal(25,4) DEFAULT 0.0000,
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT 0.0000,
  `total_tax` decimal(25,4) DEFAULT 0.0000,
  `grand_total` decimal(25,4) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_items` smallint(6) DEFAULT NULL,
  `paid` decimal(25,4) DEFAULT 0.0000,
  `surcharge` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `attachment` varchar(55) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `shipping` decimal(25,4) DEFAULT 0.0000
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_return_items`
--

CREATE TABLE `sma_return_items` (
  `id` int(11) NOT NULL,
  `return_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_sales`
--

CREATE TABLE `sma_sales` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `staff_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT 0.0000,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT 0.0000,
  `order_discount` decimal(25,4) DEFAULT 0.0000,
  `product_tax` decimal(25,4) DEFAULT 0.0000,
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT 0.0000,
  `total_tax` decimal(25,4) DEFAULT 0.0000,
  `shipping` decimal(25,4) DEFAULT 0.0000,
  `grand_total` decimal(25,4) NOT NULL,
  `sale_status` varchar(20) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `payment_term` tinyint(4) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_items` smallint(6) DEFAULT NULL,
  `pos` tinyint(1) NOT NULL DEFAULT 0,
  `paid` decimal(25,4) DEFAULT 0.0000,
  `return_id` int(11) DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `attachment` varchar(55) DEFAULT NULL,
  `return_sale_ref` varchar(55) DEFAULT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `return_sale_total` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `rounding` decimal(10,4) DEFAULT NULL,
  `suspend_note` varchar(255) DEFAULT NULL,
  `api` tinyint(1) DEFAULT 0,
  `shop` tinyint(1) DEFAULT 0,
  `address_id` int(11) DEFAULT NULL,
  `reserve_id` int(11) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `manual_payment` varchar(55) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `payment_method` varchar(55) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `customer_contact` varchar(200) DEFAULT NULL,
  `room_number` varchar(200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_sales`
--

INSERT INTO `sma_sales` (`id`, `date`, `reference_no`, `customer_id`, `customer`, `biller_id`, `biller`, `warehouse_id`, `note`, `staff_note`, `total`, `product_discount`, `order_discount_id`, `total_discount`, `order_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `shipping`, `grand_total`, `sale_status`, `payment_status`, `payment_term`, `due_date`, `created_by`, `updated_by`, `updated_at`, `total_items`, `pos`, `paid`, `return_id`, `surcharge`, `attachment`, `return_sale_ref`, `sale_id`, `return_sale_total`, `rounding`, `suspend_note`, `api`, `shop`, `address_id`, `reserve_id`, `hash`, `manual_payment`, `cgst`, `sgst`, `igst`, `payment_method`, `room_id`, `customer_contact`, `room_number`) VALUES
(1, '2021-10-24 05:05:57', 'SALE/POS0013', 1, 'Walk-in Customer', 3, 'Test Biller', 1, '', '', '2.0000', '0.0000', '', '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '2.0000', 'completed', 'paid', 0, NULL, 1, NULL, NULL, 1, 1, '50.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', NULL, 0, 0, NULL, NULL, '1d6dbed4615d4ac004f88e7a9d146da1079c6cf407d0550fc334cdab816465e6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, '2021-10-24 05:06:07', 'SALE/POS0014', 1, 'Walk-in Customer', 3, 'Test Biller', 1, '', '', '2.0000', '0.0000', '', '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '2.0000', 'completed', 'paid', 0, NULL, 1, NULL, NULL, 1, 1, '2.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', NULL, 0, 0, NULL, NULL, '8cf932ad4cb7bb1c72e0a6b2a0136ad0006df0b5b86e177e22b2ca65293c63ed', NULL, NULL, NULL, NULL, NULL, 975, '0968420939', 'D-01'),
(3, '2021-10-25 07:34:19', 'SALE/POS0015', 1, 'Walk-in Customer', 3, 'Test Biller', 1, '', '', '14.0000', '0.0000', '', '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '14.0000', 'completed', 'paid', 0, NULL, 1, NULL, NULL, 2, 1, '14.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', NULL, 0, 0, NULL, NULL, 'ba2a67defaeb1f9a68c9d0461e690352b7cb1e6fc748925bfa2d05e92087dbbb', NULL, NULL, NULL, NULL, NULL, 975, '0968420939', 'D-01');

-- --------------------------------------------------------

--
-- Table structure for table `sma_sale_items`
--

CREATE TABLE `sma_sale_items` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `sale_item_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_sale_items`
--

INSERT INTO `sma_sale_items` (`id`, `sale_id`, `product_id`, `product_code`, `product_name`, `product_type`, `option_id`, `net_unit_price`, `unit_price`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `subtotal`, `serial_no`, `real_unit_price`, `sale_item_id`, `product_unit_id`, `product_unit_code`, `unit_quantity`, `comment`, `gst`, `cgst`, `sgst`, `igst`) VALUES
(1, 1, 1, 'test', 'test', 'standard', 0, '12.0000', '12.0000', '1.0000', 1, '0.0000', 1, '0', '0', '0.0000', '12.0000', '', '12.0000', NULL, 1, 'unit', '1.0000', '', NULL, NULL, NULL, NULL),
(2, 1, 1, 'test', 'test', 'standard', NULL, '12.0000', '12.0000', '1.0000', 1, '0.0000', 1, '0', '0', '0.0000', '12.0000', '', '12.0000', NULL, 1, 'unit', '1.0000', '', NULL, NULL, NULL, NULL),
(3, 1, 1, 'test', 'test', 'standard', NULL, '12.0000', '12.0000', '1.0000', 1, '0.0000', 1, '0', '0', '0.0000', '12.0000', '', '12.0000', NULL, 1, 'unit', '1.0000', '', NULL, NULL, NULL, NULL),
(4, 1, 1, 'test', 'test', 'standard', NULL, '12.0000', '12.0000', '1.0000', 1, '0.0000', 1, '0', '0', '0.0000', '12.0000', '', '12.0000', NULL, 1, 'unit', '1.0000', '', NULL, NULL, NULL, NULL),
(5, 2, 1, 'test', 'test', 'standard', NULL, '12.0000', '12.0000', '10.0000', 1, '0.0000', 1, '0', '0', '0.0000', '120.0000', '', '12.0000', NULL, 1, 'unit', '10.0000', NULL, NULL, NULL, NULL, NULL),
(6, 3, 2, 'Product', 'Product', 'standard', 1, '1.5000', '1.5000', '3.0000', 1, '0.0000', 1, '0', '0', '0.0000', '4.5000', '', '1.5000', NULL, 1, 'unit', '3.0000', '', NULL, NULL, NULL, NULL),
(7, 4, 2, 'Product', 'Product', 'standard', 1, '2.0000', '2.0000', '1.0000', 1, '0.0000', 1, '0', '0', '0.0000', '2.0000', '', '2.0000', NULL, 1, 'unit', '1.0000', '', NULL, NULL, NULL, NULL),
(8, 4, 1, 'test', 'test', 'standard', NULL, '12.0000', '12.0000', '1.0000', 1, '0.0000', 1, '0', '0', '0.0000', '12.0000', '', '12.0000', NULL, 1, 'unit', '1.0000', '', NULL, NULL, NULL, NULL),
(9, 5, 5, '49234040', 'With Supplier', 'standard', NULL, '4.0000', '4.0000', '1.0000', 1, '0.0000', 1, '0', '0', '0.0000', '4.0000', '', '4.0000', NULL, 1, 'unit', '1.0000', '', NULL, NULL, NULL, NULL),
(10, 6, 5, '49234040', 'With Supplier', 'standard', NULL, '4.0000', '4.0000', '-1.0000', 1, '0.0000', 1, '0', '0', '0.0000', '-4.0000', '', '4.0000', 9, 1, 'unit', '-1.0000', NULL, NULL, NULL, NULL, NULL),
(11, 7, 5, '49234040', 'With Supplier', 'standard', NULL, '4.0000', '4.0000', '1.0000', 1, '0.0000', 1, '0', '0', '0.0000', '4.0000', '', '4.0000', NULL, 1, 'unit', '1.0000', '', NULL, NULL, NULL, NULL),
(23, 8, 1, 'test', 'test', 'standard', NULL, '0.0000', '0.0000', '2.0000', 1, '0.0000', 0, '', '0', '0.0000', '0.0000', '', '0.0000', NULL, 1, 'unit', '2.0000', NULL, NULL, NULL, NULL, NULL),
(22, 8, 5, '49234040', 'With Supplier', 'standard', NULL, '4.0000', '4.0000', '2.0000', 1, '0.0000', 1, '0', '0', '0.0000', '8.0000', '', '4.0000', NULL, 1, 'unit', '2.0000', NULL, NULL, NULL, NULL, NULL),
(14, 9, 3, 'test1234', 'test1231', 'combo', NULL, '3.0000', '3.0000', '1.0000', 1, '0.0000', 1, '0', '0', '0.0000', '3.0000', '', '3.0000', NULL, NULL, NULL, '1.0000', '', NULL, NULL, NULL, NULL),
(15, 9, 2, 'Product', 'Product', 'standard', 1, '2.0000', '2.0000', '1.0000', 1, '0.0000', 1, '0', '0', '0.0000', '2.0000', '', '2.0000', NULL, 1, 'unit', '1.0000', '', NULL, NULL, NULL, NULL),
(16, 9, 1, 'test', 'test', 'standard', NULL, '12.0000', '12.0000', '1.0000', 1, '0.0000', 1, '0', '0', '0.0000', '12.0000', '', '12.0000', NULL, 1, 'unit', '1.0000', '', NULL, NULL, NULL, NULL),
(17, 9, 3, 'test1234', 'test1231', 'combo', NULL, '3.0000', '3.0000', '1.0000', 1, '0.0000', 1, '0', '0', '0.0000', '3.0000', '', '3.0000', NULL, NULL, NULL, '1.0000', '', NULL, NULL, NULL, NULL),
(18, 9, 4, 'testing', 'testing', 'standard', NULL, '12.0000', '12.0000', '1.0000', 1, '0.0000', 1, '0', '0', '0.0000', '12.0000', '', '12.0000', NULL, 2, 'Pcs', '1.0000', '', NULL, NULL, NULL, NULL),
(19, 9, 5, '49234040', 'With Supplier', 'standard', NULL, '4.0000', '4.0000', '1.0000', 1, '0.0000', 1, '0', '0', '0.0000', '4.0000', '', '4.0000', NULL, 1, 'unit', '1.0000', '', NULL, NULL, NULL, NULL),
(20, 9, 1, 'test', 'test', 'standard', NULL, '0.0000', '0.0000', '1.0000', 1, '0.0000', 0, '', '0', '0.0000', '0.0000', '', '0.0000', NULL, 1, 'unit', '1.0000', '', NULL, NULL, NULL, NULL),
(21, 9, 3, 'test1234', 'test1231', 'combo', NULL, '3.0000', '3.0000', '1.0000', 1, '0.0000', 1, '0', '0', '0.0000', '3.0000', '', '3.0000', NULL, NULL, NULL, '1.0000', '', NULL, NULL, NULL, NULL),
(24, 10, 1, 'test', 'test', 'standard', NULL, '12.0000', '12.0000', '1.0000', 1, '0.0000', 1, '0', '0', '0.0000', '12.0000', '', '12.0000', NULL, 1, 'unit', '1.0000', 'Test', NULL, NULL, NULL, NULL),
(25, 11, 2, 'Product', 'Product', 'standard', 1, '2.0000', '2.0000', '1.0000', 1, '0.0000', 1, '0', '0', '0.0000', '2.0000', '', '2.0000', NULL, 1, 'unit', '1.0000', '', NULL, NULL, NULL, NULL),
(26, 11, 1, 'test', 'test', 'standard', NULL, '12.0000', '12.0000', '1.0000', 1, '0.0000', 1, '0', '0', '0.0000', '12.0000', '', '12.0000', NULL, 1, 'unit', '1.0000', '', NULL, NULL, NULL, NULL),
(27, 12, 2, 'Product', 'Product', 'standard', 1, '2.0000', '2.0000', '1.0000', 1, '0.0000', 1, '0', '0', '0.0000', '2.0000', '', '2.0000', NULL, 1, 'unit', '1.0000', '', NULL, NULL, NULL, NULL),
(28, 13, 1, 'test', 'test', 'standard', NULL, '12.0000', '12.0000', '1.0000', 1, '0.0000', 1, '0', '0', '0.0000', '12.0000', '', '12.0000', NULL, 1, 'unit', '1.0000', '', NULL, NULL, NULL, NULL),
(29, 13, 2, 'Product', 'Product', 'standard', 1, '2.0000', '2.0000', '1.0000', 1, '0.0000', 1, '0', '0', '0.0000', '2.0000', '', '2.0000', NULL, 1, 'unit', '1.0000', '', NULL, NULL, NULL, NULL),
(30, 14, 1, 'test', 'test', 'standard', NULL, '12.0000', '12.0000', '1.0000', 1, '0.0000', 1, '0', '0', '0.0000', '12.0000', '', '12.0000', NULL, 1, 'unit', '1.0000', '', NULL, NULL, NULL, NULL),
(31, 14, 3, 'test1234', 'test1231', 'combo', NULL, '3.0000', '3.0000', '1.0000', 1, '0.0000', 1, '0', '0', '0.0000', '3.0000', '', '3.0000', NULL, NULL, NULL, '1.0000', '', NULL, NULL, NULL, NULL),
(32, 1, 2, 'Product', 'Product', 'standard', 1, '2.0000', '2.0000', '1.0000', 1, '0.0000', 1, '0', '0', '0.0000', '2.0000', '', '2.0000', NULL, 1, 'unit', '1.0000', '', NULL, NULL, NULL, NULL),
(33, 2, 2, 'Product', 'Product', 'standard', 1, '2.0000', '2.0000', '1.0000', 1, '0.0000', 1, '0', '0', '0.0000', '2.0000', '', '2.0000', NULL, 1, 'unit', '1.0000', '', NULL, NULL, NULL, NULL),
(34, 3, 2, 'Product', 'Product', 'standard', 1, '2.0000', '2.0000', '1.0000', 1, '0.0000', 1, '0', '0', '0.0000', '2.0000', '', '2.0000', NULL, 1, 'unit', '1.0000', '', NULL, NULL, NULL, NULL),
(35, 3, 1, 'test', 'test', 'standard', NULL, '12.0000', '12.0000', '1.0000', 1, '0.0000', 1, '0', '0', '0.0000', '12.0000', '', '12.0000', NULL, 1, 'unit', '1.0000', '', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_sessions`
--

CREATE TABLE `sma_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_sessions`
--

INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('6qcemvflnicmfko7ei4l3ggovp3ohtr3', '127.0.0.1', 1643017943, 0x5f5f63695f6c6173745f726567656e65726174657c693a313634333031373639323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a343a2264656d6f223b757365726e616d657c733a343a2264656d6f223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363335313437323436223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313634333031373934313b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31392030373a35383a3239223b),
('ij8h8hi2nj80k1huua9dlc9474bl4vbq', '127.0.0.1', 1643017692, 0x5f5f63695f6c6173745f726567656e65726174657c693a313634333031373639323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a343a2264656d6f223b757365726e616d657c733a343a2264656d6f223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363335313437323436223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313634333031373235343b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31392030373a35383a3239223b),
('omtokqte6sa11nuh8viasbefjuic1h2h', '127.0.0.1', 1635147262, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633353134373135313b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a343a2264656d6f223b757365726e616d657c733a343a2264656d6f223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363335303531393531223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313633353134373236323b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31392030373a35383a3239223b),
('65fiumprqmlc6pfuvt88fcgno5bjaq81', '127.0.0.1', 1635051967, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633353035313930393b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a343a2264656d6f223b757365726e616d657c733a343a2264656d6f223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363334393937343231223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313633353035313936373b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31392030373a35383a3239223b72656d6f76655f706f736c737c693a313b),
('nq0ek5pcfklbn35s5b5au4reiplbk3dj', '127.0.0.1', 1635000767, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633353030303736363b7265717565737465645f706167657c733a353a2261646d696e223b),
('1ksponvndmfbgh5k1amqbsnmf7hlv95u', '::1', 1635002127, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633353030313833353b7265717565737465645f706167657c733a393a2261646d696e2f706f73223b6964656e746974797c733a343a2264656d6f223b757365726e616d657c733a343a2264656d6f223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363334393630363837223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313633353030313834383b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31392030373a35383a3239223b),
('miqoh1r0keilap7u0ml4iv58gsfo89r8', '::1', 1635001835, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633353030313833353b7265717565737465645f706167657c733a393a2261646d696e2f706f73223b6964656e746974797c733a343a2264656d6f223b757365726e616d657c733a343a2264656d6f223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363334393630363837223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313633343939393439313b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31392030373a35383a3239223b),
('sv7c0eipvj7go55h4a0itav2qnrpovdf', '::1', 1635000583, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633353030303538333b7265717565737465645f706167657c733a393a2261646d696e2f706f73223b6964656e746974797c733a343a2264656d6f223b757365726e616d657c733a343a2264656d6f223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363334393630363837223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313633343939393439313b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31392030373a35383a3239223b),
('8csemn3e97it205vqkgmnbthm7oep5j7', '::1', 1634999486, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633343939393438363b7265717565737465645f706167657c733a393a2261646d696e2f706f73223b6964656e746974797c733a343a2264656d6f223b757365726e616d657c733a343a2264656d6f223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363334393630363837223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313633343939393438343b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31392030373a35383a3239223b),
('tc80npmop53ig0mvqjlsr3hmfjpcnpb6', '::1', 1634999184, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633343939393138343b7265717565737465645f706167657c733a393a2261646d696e2f706f73223b6964656e746974797c733a343a2264656d6f223b757365726e616d657c733a343a2264656d6f223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363334393630363837223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313633343939383339303b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31392030373a35383a3239223b),
('ahvqhf6ek0t2euovtreu7bo95q8cb7rt', '::1', 1634998521, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633343939383532313b7265717565737465645f706167657c733a393a2261646d696e2f706f73223b6964656e746974797c733a343a2264656d6f223b757365726e616d657c733a343a2264656d6f223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363334393630363837223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313633343939383339303b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31392030373a35383a3239223b),
('fbpmmpqhg7f3hro3b5p3n72krsbu15i7', '::1', 1634998880, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633343939383838303b7265717565737465645f706167657c733a393a2261646d696e2f706f73223b6964656e746974797c733a343a2264656d6f223b757365726e616d657c733a343a2264656d6f223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363334393630363837223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313633343939383339303b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31392030373a35383a3239223b),
('3o6f5dns705lb0q38bovnphb3hqgctlt', '::1', 1634998204, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633343939383230343b7265717565737465645f706167657c733a393a2261646d696e2f706f73223b6964656e746974797c733a343a2264656d6f223b757365726e616d657c733a343a2264656d6f223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363334393630363837223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313633343939373438303b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31392030373a35383a3239223b),
('7t5tp92dla16t0e3jfej67vhm8gqkc9q', '::1', 1634997777, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633343939373737373b7265717565737465645f706167657c733a393a2261646d696e2f706f73223b6964656e746974797c733a343a2264656d6f223b757365726e616d657c733a343a2264656d6f223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363334393630363837223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313633343939373438303b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31392030373a35383a3239223b);

-- --------------------------------------------------------

--
-- Table structure for table `sma_settings`
--

CREATE TABLE `sma_settings` (
  `setting_id` int(1) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `logo2` varchar(255) NOT NULL,
  `site_name` varchar(55) NOT NULL,
  `language` varchar(20) NOT NULL,
  `default_warehouse` int(2) NOT NULL,
  `accounting_method` tinyint(4) NOT NULL DEFAULT 0,
  `default_currency` varchar(3) NOT NULL,
  `default_tax_rate` int(2) NOT NULL,
  `rows_per_page` int(2) NOT NULL,
  `version` varchar(10) NOT NULL DEFAULT '1.0',
  `default_tax_rate2` int(11) NOT NULL DEFAULT 0,
  `dateformat` int(11) NOT NULL,
  `sales_prefix` varchar(20) DEFAULT NULL,
  `quote_prefix` varchar(20) DEFAULT NULL,
  `purchase_prefix` varchar(20) DEFAULT NULL,
  `transfer_prefix` varchar(20) DEFAULT NULL,
  `delivery_prefix` varchar(20) DEFAULT NULL,
  `payment_prefix` varchar(20) DEFAULT NULL,
  `return_prefix` varchar(20) DEFAULT NULL,
  `returnp_prefix` varchar(20) DEFAULT NULL,
  `expense_prefix` varchar(20) DEFAULT NULL,
  `item_addition` tinyint(1) NOT NULL DEFAULT 0,
  `theme` varchar(20) NOT NULL,
  `product_serial` tinyint(4) NOT NULL,
  `default_discount` int(11) NOT NULL,
  `product_discount` tinyint(1) NOT NULL DEFAULT 0,
  `discount_method` tinyint(4) NOT NULL,
  `tax1` tinyint(4) NOT NULL,
  `tax2` tinyint(4) NOT NULL,
  `overselling` tinyint(1) NOT NULL DEFAULT 0,
  `restrict_user` tinyint(4) NOT NULL DEFAULT 0,
  `restrict_calendar` tinyint(4) NOT NULL DEFAULT 0,
  `timezone` varchar(100) DEFAULT NULL,
  `iwidth` int(11) NOT NULL DEFAULT 0,
  `iheight` int(11) NOT NULL,
  `twidth` int(11) NOT NULL,
  `theight` int(11) NOT NULL,
  `watermark` tinyint(1) DEFAULT NULL,
  `reg_ver` tinyint(1) DEFAULT NULL,
  `allow_reg` tinyint(1) DEFAULT NULL,
  `reg_notification` tinyint(1) DEFAULT NULL,
  `auto_reg` tinyint(1) DEFAULT NULL,
  `protocol` varchar(20) NOT NULL DEFAULT 'mail',
  `mailpath` varchar(55) DEFAULT '/usr/sbin/sendmail',
  `smtp_host` varchar(100) DEFAULT NULL,
  `smtp_user` varchar(100) DEFAULT NULL,
  `smtp_pass` varchar(255) DEFAULT NULL,
  `smtp_port` varchar(10) DEFAULT '25',
  `smtp_crypto` varchar(10) DEFAULT NULL,
  `corn` datetime DEFAULT NULL,
  `customer_group` int(11) NOT NULL,
  `default_email` varchar(100) NOT NULL,
  `mmode` tinyint(1) NOT NULL,
  `bc_fix` tinyint(4) NOT NULL DEFAULT 0,
  `auto_detect_barcode` tinyint(1) NOT NULL DEFAULT 0,
  `captcha` tinyint(1) NOT NULL DEFAULT 1,
  `reference_format` tinyint(1) NOT NULL DEFAULT 1,
  `racks` tinyint(1) DEFAULT 0,
  `attributes` tinyint(1) NOT NULL DEFAULT 0,
  `product_expiry` tinyint(1) NOT NULL DEFAULT 0,
  `decimals` tinyint(2) NOT NULL DEFAULT 2,
  `qty_decimals` tinyint(2) NOT NULL DEFAULT 2,
  `decimals_sep` varchar(2) NOT NULL DEFAULT '.',
  `thousands_sep` varchar(2) NOT NULL DEFAULT ',',
  `invoice_view` tinyint(1) DEFAULT 0,
  `default_biller` int(11) DEFAULT NULL,
  `envato_username` varchar(50) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT NULL,
  `rtl` tinyint(1) DEFAULT 0,
  `each_spent` decimal(15,4) DEFAULT NULL,
  `ca_point` tinyint(4) DEFAULT NULL,
  `each_sale` decimal(15,4) DEFAULT NULL,
  `sa_point` tinyint(4) DEFAULT NULL,
  `update` tinyint(1) DEFAULT 0,
  `sac` tinyint(1) DEFAULT 0,
  `display_all_products` tinyint(1) DEFAULT 0,
  `display_symbol` tinyint(1) DEFAULT NULL,
  `symbol` varchar(50) DEFAULT NULL,
  `remove_expired` tinyint(1) DEFAULT 0,
  `barcode_separator` varchar(2) NOT NULL DEFAULT '-',
  `set_focus` tinyint(1) NOT NULL DEFAULT 0,
  `price_group` int(11) DEFAULT NULL,
  `barcode_img` tinyint(1) NOT NULL DEFAULT 1,
  `ppayment_prefix` varchar(20) DEFAULT 'POP',
  `disable_editing` smallint(6) DEFAULT 90,
  `qa_prefix` varchar(55) DEFAULT NULL,
  `update_cost` tinyint(1) DEFAULT NULL,
  `apis` tinyint(1) NOT NULL DEFAULT 0,
  `state` varchar(100) DEFAULT NULL,
  `pdf_lib` varchar(20) DEFAULT 'dompdf',
  `use_code_for_slug` tinyint(1) DEFAULT NULL,
  `ws_barcode_type` varchar(10) DEFAULT 'weight',
  `ws_barcode_chars` tinyint(4) DEFAULT NULL,
  `flag_chars` tinyint(4) DEFAULT NULL,
  `item_code_start` tinyint(4) DEFAULT NULL,
  `item_code_chars` tinyint(4) DEFAULT NULL,
  `price_start` tinyint(4) DEFAULT NULL,
  `price_chars` tinyint(4) DEFAULT NULL,
  `price_divide_by` int(11) DEFAULT NULL,
  `weight_start` tinyint(4) DEFAULT NULL,
  `weight_chars` tinyint(4) DEFAULT NULL,
  `weight_divide_by` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_settings`
--

INSERT INTO `sma_settings` (`setting_id`, `logo`, `logo2`, `site_name`, `language`, `default_warehouse`, `accounting_method`, `default_currency`, `default_tax_rate`, `rows_per_page`, `version`, `default_tax_rate2`, `dateformat`, `sales_prefix`, `quote_prefix`, `purchase_prefix`, `transfer_prefix`, `delivery_prefix`, `payment_prefix`, `return_prefix`, `returnp_prefix`, `expense_prefix`, `item_addition`, `theme`, `product_serial`, `default_discount`, `product_discount`, `discount_method`, `tax1`, `tax2`, `overselling`, `restrict_user`, `restrict_calendar`, `timezone`, `iwidth`, `iheight`, `twidth`, `theight`, `watermark`, `reg_ver`, `allow_reg`, `reg_notification`, `auto_reg`, `protocol`, `mailpath`, `smtp_host`, `smtp_user`, `smtp_pass`, `smtp_port`, `smtp_crypto`, `corn`, `customer_group`, `default_email`, `mmode`, `bc_fix`, `auto_detect_barcode`, `captcha`, `reference_format`, `racks`, `attributes`, `product_expiry`, `decimals`, `qty_decimals`, `decimals_sep`, `thousands_sep`, `invoice_view`, `default_biller`, `envato_username`, `purchase_code`, `rtl`, `each_spent`, `ca_point`, `each_sale`, `sa_point`, `update`, `sac`, `display_all_products`, `display_symbol`, `symbol`, `remove_expired`, `barcode_separator`, `set_focus`, `price_group`, `barcode_img`, `ppayment_prefix`, `disable_editing`, `qa_prefix`, `update_cost`, `apis`, `state`, `pdf_lib`, `use_code_for_slug`, `ws_barcode_type`, `ws_barcode_chars`, `flag_chars`, `item_code_start`, `item_code_chars`, `price_start`, `price_chars`, `price_divide_by`, `weight_start`, `weight_chars`, `weight_divide_by`) VALUES
(1, 'logo2.png', 'logo3.png', 'Stock Manager Advance', 'english', 1, 0, 'USD', 1, 10, '3.4.40', 1, 5, 'SALE', 'QUOTE', 'PO', 'TR', 'DO', 'IPAY', 'SR', 'PR', '', 0, 'default', 1, 1, 1, 1, 1, 1, 0, 1, 1, 'Asia/Jakarta', 800, 800, 150, 150, 0, 0, 0, 0, NULL, 'mail', '/usr/sbin/sendmail', 'pop.gmail.com', 'contact@sma.tecdiary.org', 'jEFTM4T63AiQ9dsidxhPKt9CIg4HQjCN58n/RW9vmdC/UDXCzRLR469ziZ0jjpFlbOg43LyoSmpJLBkcAHh0Yw==', '25', NULL, NULL, 1, 'contact@tecdiary.com', 0, 4, 1, 0, 3, 1, 1, 1, 2, 2, '.', ',', 0, 3, 'sdfs', 'sdfsdf', 0, NULL, NULL, NULL, NULL, 0, 0, 1, 0, '', 0, '-', 0, 1, 1, 'POP', 90, '', 1, 0, 'AN', 'dompdf', 0, 'weight', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_skrill`
--

CREATE TABLE `sma_skrill` (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `account_email` varchar(255) NOT NULL DEFAULT 'testaccount2@moneybookers.com',
  `secret_word` varchar(20) NOT NULL DEFAULT 'mbtest',
  `skrill_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT 0.0000
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_skrill`
--

INSERT INTO `sma_skrill` (`id`, `active`, `account_email`, `secret_word`, `skrill_currency`, `fixed_charges`, `extra_charges_my`, `extra_charges_other`) VALUES
(1, 1, 'testaccount2@moneybookers.com', 'mbtest', 'USD', '0.0000', '0.0000', '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_stock_counts`
--

CREATE TABLE `sma_stock_counts` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reference_no` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `initial_file` varchar(50) NOT NULL,
  `final_file` varchar(50) DEFAULT NULL,
  `brands` varchar(50) DEFAULT NULL,
  `brand_names` varchar(100) DEFAULT NULL,
  `categories` varchar(50) DEFAULT NULL,
  `category_names` varchar(100) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `products` int(11) DEFAULT NULL,
  `rows` int(11) DEFAULT NULL,
  `differences` int(11) DEFAULT NULL,
  `matches` int(11) DEFAULT NULL,
  `missing` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `finalized` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_stock_count_items`
--

CREATE TABLE `sma_stock_count_items` (
  `id` int(11) NOT NULL,
  `stock_count_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_variant` varchar(55) DEFAULT NULL,
  `product_variant_id` int(11) DEFAULT NULL,
  `expected` decimal(15,4) NOT NULL,
  `counted` decimal(15,4) NOT NULL,
  `cost` decimal(25,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_suspended_bills`
--

CREATE TABLE `sma_suspended_bills` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) DEFAULT NULL,
  `count` int(11) NOT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_tax_id` int(11) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `biller_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `suspend_note` varchar(255) DEFAULT NULL,
  `shipping` decimal(15,4) DEFAULT 0.0000,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_suspended_bills`
--

INSERT INTO `sma_suspended_bills` (`id`, `date`, `customer_id`, `customer`, `count`, `order_discount_id`, `order_tax_id`, `total`, `biller_id`, `warehouse_id`, `created_by`, `suspend_note`, `shipping`, `cgst`, `sgst`, `igst`) VALUES
(11, '2021-09-15 02:01:05', 1, 'Walk-in Customer', 5, '', 1, '31.0000', 3, 1, 1, '1', '0.0000', NULL, NULL, NULL),
(12, '2021-09-15 02:02:18', 4, 'Anakut', 4, '', 1, '19.0000', 3, 1, 3, '2', '0.0000', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_suspended_items`
--

CREATE TABLE `sma_suspended_items` (
  `id` int(11) NOT NULL,
  `suspend_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) DEFAULT 0.0000,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `ordered` varchar(3) NOT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_suspended_items`
--

INSERT INTO `sma_suspended_items` (`id`, `suspend_id`, `product_id`, `product_code`, `product_name`, `net_unit_price`, `unit_price`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `subtotal`, `serial_no`, `option_id`, `product_type`, `real_unit_price`, `product_unit_id`, `product_unit_code`, `unit_quantity`, `comment`, `ordered`, `gst`, `cgst`, `sgst`, `igst`) VALUES
(29, 11, 1, 'test', 'test', '0.0000', '0.0000', '1.0000', 1, '0.0000', 0, '', '0', '0.0000', '0.0000', '', NULL, 'standard', '0.0000', 1, 'unit', '1.0000', '', '', NULL, NULL, NULL, NULL),
(30, 12, 3, 'test1234', 'test1231', '3.0000', '3.0000', '1.0000', 1, '0.0000', 1, '0', '0', '0.0000', '3.0000', '', NULL, 'combo', '3.0000', NULL, NULL, '1.0000', '', '', NULL, NULL, NULL, NULL),
(28, 11, 5, '49234040', 'With Supplier', '4.0000', '4.0000', '1.0000', 1, '0.0000', 1, '0', '0', '0.0000', '4.0000', '', NULL, 'standard', '4.0000', 1, 'unit', '1.0000', '', '', NULL, NULL, NULL, NULL),
(27, 11, 3, 'test1234', 'test1231', '3.0000', '3.0000', '1.0000', 1, '0.0000', 1, '0', '0', '0.0000', '3.0000', '', 0, 'combo', '3.0000', NULL, NULL, '1.0000', '', '', NULL, NULL, NULL, NULL),
(25, 11, 1, 'test', 'test', '12.0000', '12.0000', '1.0000', 1, '0.0000', 1, '0', '0', '0.0000', '12.0000', '', 0, 'standard', '12.0000', 1, 'unit', '1.0000', '', '', NULL, NULL, NULL, NULL),
(26, 11, 4, 'testing', 'testing', '12.0000', '12.0000', '1.0000', 1, '0.0000', 1, '0', '0', '0.0000', '12.0000', '', 0, 'standard', '12.0000', 2, 'Pcs', '1.0000', '', '', NULL, NULL, NULL, NULL),
(31, 12, 4, 'testing', 'testing', '12.0000', '12.0000', '1.0000', 1, '0.0000', 1, '0', '0', '0.0000', '12.0000', '', NULL, 'standard', '12.0000', 2, 'Pcs', '1.0000', '', '', NULL, NULL, NULL, NULL),
(32, 12, 5, '49234040', 'With Supplier', '4.0000', '4.0000', '1.0000', 1, '0.0000', 1, '0', '0', '0.0000', '4.0000', '', NULL, 'standard', '4.0000', 1, 'unit', '1.0000', '', '', NULL, NULL, NULL, NULL),
(33, 12, 1, 'test', 'test', '0.0000', '0.0000', '1.0000', 1, '0.0000', 0, '', '0', '0.0000', '0.0000', '', NULL, 'standard', '0.0000', 1, 'unit', '1.0000', '', '', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_tax_rates`
--

CREATE TABLE `sma_tax_rates` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `rate` decimal(12,4) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_tax_rates`
--

INSERT INTO `sma_tax_rates` (`id`, `name`, `code`, `rate`, `type`) VALUES
(1, 'No Tax', 'NT', '0.0000', '2'),
(2, 'VAT @10%', 'VAT10', '10.0000', '1'),
(3, 'GST @6%', 'GST', '6.0000', '1'),
(4, 'VAT @20%', 'VT20', '20.0000', '1');

-- --------------------------------------------------------

--
-- Table structure for table `sma_transfers`
--

CREATE TABLE `sma_transfers` (
  `id` int(11) NOT NULL,
  `transfer_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `from_warehouse_id` int(11) NOT NULL,
  `from_warehouse_code` varchar(55) NOT NULL,
  `from_warehouse_name` varchar(55) NOT NULL,
  `to_warehouse_id` int(11) NOT NULL,
  `to_warehouse_code` varchar(55) NOT NULL,
  `to_warehouse_name` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `grand_total` decimal(25,4) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `status` varchar(55) NOT NULL DEFAULT 'pending',
  `shipping` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `attachment` varchar(55) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_transfer_items`
--

CREATE TABLE `sma_transfer_items` (
  `id` int(11) NOT NULL,
  `transfer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) DEFAULT NULL,
  `quantity_balance` decimal(15,4) NOT NULL,
  `unit_cost` decimal(25,4) DEFAULT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_units`
--

CREATE TABLE `sma_units` (
  `id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(55) NOT NULL,
  `base_unit` int(11) DEFAULT NULL,
  `operator` varchar(1) DEFAULT NULL,
  `unit_value` varchar(55) DEFAULT NULL,
  `operation_value` varchar(55) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_units`
--

INSERT INTO `sma_units` (`id`, `code`, `name`, `base_unit`, `operator`, `unit_value`, `operation_value`) VALUES
(1, 'unit', 'unit', NULL, NULL, NULL, NULL),
(2, 'Pcs', 'Pcs', NULL, NULL, NULL, NULL),
(3, 'Box', 'Box', 2, '*', NULL, '16');

-- --------------------------------------------------------

--
-- Table structure for table `sma_users`
--

CREATE TABLE `sma_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `last_ip_address` varbinary(45) DEFAULT NULL,
  `ip_address` varbinary(45) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `avatar` varchar(55) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `warehouse_id` int(10) UNSIGNED DEFAULT NULL,
  `biller_id` int(10) UNSIGNED DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `show_cost` tinyint(1) DEFAULT 0,
  `show_price` tinyint(1) DEFAULT 0,
  `award_points` int(11) DEFAULT 0,
  `view_right` tinyint(1) NOT NULL DEFAULT 0,
  `edit_right` tinyint(1) NOT NULL DEFAULT 0,
  `allow_discount` tinyint(1) DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_users`
--

INSERT INTO `sma_users` (`id`, `last_ip_address`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `avatar`, `gender`, `group_id`, `warehouse_id`, `biller_id`, `company_id`, `show_cost`, `show_price`, `award_points`, `view_right`, `edit_right`, `allow_discount`) VALUES
(1, 0x3132372e302e302e31, 0x0000, 'demo', 'e3f985fc64fa97687abff634b7c26dd9d9754b28', NULL, 'owner@tecdiary.com', NULL, NULL, NULL, NULL, 1351661704, 1643017156, 1, 'Owner', 'Owner', 'Stock Manager', '012345678', NULL, 'male', 1, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0),
(2, 0x3a3a31, 0x3a3a31, 'david', 'fe6f2176813e96dd3246dd2bce9ba9155fee19ed', NULL, 'david@gmail.com', NULL, NULL, NULL, NULL, 1629340801, 1629340823, 1, 'David', 'Long', 'Walk-in Customer', '085693579', NULL, 'male', 3, NULL, NULL, 1, 0, 0, 0, 0, 0, 0),
(3, 0x3132372e302e302e31, 0x3a3a31, 'test', 'e3f985fc64fa97687abff634b7c26dd9d9754b28', NULL, '123@gmail.com', NULL, NULL, NULL, NULL, 1629341033, 1634960653, 1, 'test', 'test', 'Anakut', '010601168', NULL, 'male', 6, 1, 3, NULL, 1, 1, 0, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sma_user_logins`
--

CREATE TABLE `sma_user_logins` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` timestamp NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_user_logins`
--

INSERT INTO `sma_user_logins` (`id`, `user_id`, `company_id`, `ip_address`, `login`, `time`) VALUES
(1, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2021-08-18 08:08:27'),
(2, 1, NULL, 0x3132372e302e302e31, 'owner@tecdiary.com', '2021-08-19 02:21:20'),
(3, 1, NULL, 0x3a3a31, 'owner', '2021-08-19 02:33:01'),
(4, 2, NULL, 0x3a3a31, 'david', '2021-08-19 02:40:23'),
(5, 1, NULL, 0x3a3a31, 'owner', '2021-08-19 02:40:36'),
(6, 3, NULL, 0x3a3a31, 'test', '2021-08-19 02:44:17'),
(7, 1, NULL, 0x3a3a31, 'owner', '2021-08-19 02:55:00'),
(8, 1, NULL, 0x3132372e302e302e31, 'owner', '2021-08-19 06:58:22'),
(9, 1, NULL, 0x3a3a31, 'owner', '2021-08-19 07:21:40'),
(10, 1, NULL, 0x3a3a31, 'owner', '2021-08-21 04:07:33'),
(11, 1, NULL, 0x3a3a31, 'owner', '2021-08-23 02:22:53'),
(12, 1, NULL, 0x3a3a31, 'owner', '2021-08-23 07:10:51'),
(13, 1, NULL, 0x3a3a31, 'owner', '2021-08-26 04:29:27'),
(14, 1, NULL, 0x3a3a31, 'owner', '2021-08-26 06:38:41'),
(15, 1, NULL, 0x3a3a31, 'owner', '2021-08-27 03:06:13'),
(16, 1, NULL, 0x3a3a31, 'owner', '2021-08-30 04:20:35'),
(17, 1, NULL, 0x3a3a31, 'owner', '2021-08-30 07:16:27'),
(18, 1, NULL, 0x3a3a31, 'owner', '2021-09-02 08:54:35'),
(19, 1, NULL, 0x3a3a31, 'owner', '2021-09-02 09:36:47'),
(20, 1, NULL, 0x3a3a31, 'owner', '2021-09-03 02:18:47'),
(21, 1, NULL, 0x3a3a31, 'owner', '2021-09-05 06:33:02'),
(22, 1, NULL, 0x3a3a31, 'owner', '2021-09-07 09:21:28'),
(23, 1, NULL, 0x3a3a31, 'owner', '2021-09-08 06:34:02'),
(24, 1, NULL, 0x3a3a31, 'owner', '2021-09-11 04:52:11'),
(25, 1, NULL, 0x3a3a31, 'owner', '2021-09-13 08:11:09'),
(26, 1, NULL, 0x3a3a31, 'owner', '2021-09-14 01:45:02'),
(27, 3, NULL, 0x3a3a31, 'test', '2021-09-14 01:59:30'),
(28, 1, NULL, 0x3a3a31, 'owner', '2021-09-14 01:59:47'),
(29, 1, NULL, 0x3a3a31, 'owner', '2021-09-15 01:59:11'),
(30, 3, NULL, 0x3a3a31, 'test', '2021-09-15 01:59:47'),
(31, 1, NULL, 0x3a3a31, 'owner', '2021-09-15 02:00:06'),
(32, 3, NULL, 0x3a3a31, 'test', '2021-09-15 02:01:50'),
(33, 1, NULL, 0x3a3a31, 'owner', '2021-09-15 02:02:46'),
(34, 1, NULL, 0x3132372e302e302e31, 'owner', '2021-09-21 10:27:38'),
(35, 3, NULL, 0x3132372e302e302e31, 'test', '2021-10-23 03:44:13'),
(36, 1, NULL, 0x3132372e302e302e31, 'demo', '2021-10-23 03:44:47'),
(37, 1, NULL, 0x3a3a31, 'demo', '2021-10-23 13:57:01'),
(38, 1, NULL, 0x3132372e302e302e31, 'demo', '2021-10-24 05:05:51'),
(39, 1, NULL, 0x3132372e302e302e31, 'demo', '2021-10-25 07:34:06'),
(40, 1, NULL, 0x3132372e302e302e31, 'demo', '2022-01-24 09:39:16');

-- --------------------------------------------------------

--
-- Table structure for table `sma_variants`
--

CREATE TABLE `sma_variants` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses`
--

CREATE TABLE `sma_warehouses` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `map` varchar(255) DEFAULT NULL,
  `phone` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `price_group_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_warehouses`
--

INSERT INTO `sma_warehouses` (`id`, `code`, `name`, `address`, `map`, `phone`, `email`, `price_group_id`) VALUES
(1, 'WHI', 'Warehouse 1', '<p>Address, City</p>', NULL, '012345678', 'whi@tecdiary.com', NULL),
(2, 'WHII', 'Warehouse 2', '<p>Warehouse 2, Jalan Sultan Ismail, 54000, Kuala Lumpur</p>', NULL, '0105292122', 'whii@tecdiary.com', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses_products`
--

CREATE TABLE `sma_warehouses_products` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL,
  `avg_cost` decimal(25,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_warehouses_products`
--

INSERT INTO `sma_warehouses_products` (`id`, `product_id`, `warehouse_id`, `quantity`, `rack`, `avg_cost`) VALUES
(1, 1, 1, '92.0000', NULL, '1.6981'),
(2, 1, 2, '0.0000', NULL, '0.0000'),
(3, 2, 1, '24.0000', NULL, '1.0000'),
(4, 2, 2, '0.0000', NULL, '0.0000'),
(5, 3, 1, '0.0000', NULL, '0.0000'),
(6, 3, 2, '0.0000', NULL, '0.0000'),
(7, 4, 1, '99.0000', NULL, '0.0000'),
(8, 4, 2, '0.0000', NULL, '0.0000'),
(9, 5, 1, '98.0000', NULL, '1.0202'),
(10, 5, 2, '0.0000', NULL, '1.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses_products_variants`
--

CREATE TABLE `sma_warehouses_products_variants` (
  `id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_warehouses_products_variants`
--

INSERT INTO `sma_warehouses_products_variants` (`id`, `option_id`, `product_id`, `warehouse_id`, `quantity`, `rack`) VALUES
(1, 1, 2, 1, '24.0000', NULL),
(2, 1, 2, 2, '0.0000', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sma_addresses`
--
ALTER TABLE `sma_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `sma_adjustments`
--
ALTER TABLE `sma_adjustments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `sma_adjustment_items`
--
ALTER TABLE `sma_adjustment_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adjustment_id` (`adjustment_id`);

--
-- Indexes for table `sma_brands`
--
ALTER TABLE `sma_brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `sma_calendar`
--
ALTER TABLE `sma_calendar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_captcha`
--
ALTER TABLE `sma_captcha`
  ADD PRIMARY KEY (`captcha_id`),
  ADD KEY `word` (`word`);

--
-- Indexes for table `sma_categories`
--
ALTER TABLE `sma_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_combo_items`
--
ALTER TABLE `sma_combo_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_companies`
--
ALTER TABLE `sma_companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `group_id_2` (`group_id`);

--
-- Indexes for table `sma_costing`
--
ALTER TABLE `sma_costing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_currencies`
--
ALTER TABLE `sma_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_customer_groups`
--
ALTER TABLE `sma_customer_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_date_format`
--
ALTER TABLE `sma_date_format`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_deliveries`
--
ALTER TABLE `sma_deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_deposits`
--
ALTER TABLE `sma_deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_expenses`
--
ALTER TABLE `sma_expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_expense_categories`
--
ALTER TABLE `sma_expense_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_gift_cards`
--
ALTER TABLE `sma_gift_cards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `card_no` (`card_no`);

--
-- Indexes for table `sma_gift_card_topups`
--
ALTER TABLE `sma_gift_card_topups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `card_id` (`card_id`);

--
-- Indexes for table `sma_groups`
--
ALTER TABLE `sma_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_login_attempts`
--
ALTER TABLE `sma_login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_logs`
--
ALTER TABLE `sma_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_notifications`
--
ALTER TABLE `sma_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_order_ref`
--
ALTER TABLE `sma_order_ref`
  ADD PRIMARY KEY (`ref_id`);

--
-- Indexes for table `sma_payments`
--
ALTER TABLE `sma_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_paypal`
--
ALTER TABLE `sma_paypal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_permissions`
--
ALTER TABLE `sma_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_pos_register`
--
ALTER TABLE `sma_pos_register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_pos_settings`
--
ALTER TABLE `sma_pos_settings`
  ADD PRIMARY KEY (`pos_id`);

--
-- Indexes for table `sma_price_groups`
--
ALTER TABLE `sma_price_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `sma_printers`
--
ALTER TABLE `sma_printers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_products`
--
ALTER TABLE `sma_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`),
  ADD KEY `category_id_2` (`category_id`),
  ADD KEY `unit` (`unit`),
  ADD KEY `brand` (`brand`);

--
-- Indexes for table `sma_product_photos`
--
ALTER TABLE `sma_product_photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_product_prices`
--
ALTER TABLE `sma_product_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `price_group_id` (`price_group_id`);

--
-- Indexes for table `sma_product_variants`
--
ALTER TABLE `sma_product_variants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_product_id_name` (`product_id`,`name`);

--
-- Indexes for table `sma_promos`
--
ALTER TABLE `sma_promos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_purchases`
--
ALTER TABLE `sma_purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_purchase_items`
--
ALTER TABLE `sma_purchase_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_id` (`purchase_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_quotes`
--
ALTER TABLE `sma_quotes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_quote_items`
--
ALTER TABLE `sma_quote_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quote_id` (`quote_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_returns`
--
ALTER TABLE `sma_returns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_return_items`
--
ALTER TABLE `sma_return_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `return_id` (`return_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `product_id_2` (`product_id`,`return_id`),
  ADD KEY `return_id_2` (`return_id`,`product_id`);

--
-- Indexes for table `sma_sales`
--
ALTER TABLE `sma_sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_sale_items`
--
ALTER TABLE `sma_sale_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `product_id_2` (`product_id`,`sale_id`),
  ADD KEY `sale_id_2` (`sale_id`,`product_id`);

--
-- Indexes for table `sma_sessions`
--
ALTER TABLE `sma_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `sma_settings`
--
ALTER TABLE `sma_settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `sma_skrill`
--
ALTER TABLE `sma_skrill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_stock_counts`
--
ALTER TABLE `sma_stock_counts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `sma_stock_count_items`
--
ALTER TABLE `sma_stock_count_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_count_id` (`stock_count_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_suspended_bills`
--
ALTER TABLE `sma_suspended_bills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_suspended_items`
--
ALTER TABLE `sma_suspended_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_tax_rates`
--
ALTER TABLE `sma_tax_rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_transfers`
--
ALTER TABLE `sma_transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_transfer_items`
--
ALTER TABLE `sma_transfer_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfer_id` (`transfer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_units`
--
ALTER TABLE `sma_units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `base_unit` (`base_unit`);

--
-- Indexes for table `sma_users`
--
ALTER TABLE `sma_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`,`warehouse_id`,`biller_id`),
  ADD KEY `group_id_2` (`group_id`,`company_id`);

--
-- Indexes for table `sma_user_logins`
--
ALTER TABLE `sma_user_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_variants`
--
ALTER TABLE `sma_variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_warehouses`
--
ALTER TABLE `sma_warehouses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_warehouses_products`
--
ALTER TABLE `sma_warehouses_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `sma_warehouses_products_variants`
--
ALTER TABLE `sma_warehouses_products_variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `option_id` (`option_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sma_addresses`
--
ALTER TABLE `sma_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_adjustments`
--
ALTER TABLE `sma_adjustments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sma_adjustment_items`
--
ALTER TABLE `sma_adjustment_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sma_brands`
--
ALTER TABLE `sma_brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_calendar`
--
ALTER TABLE `sma_calendar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_captcha`
--
ALTER TABLE `sma_captcha`
  MODIFY `captcha_id` bigint(13) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_categories`
--
ALTER TABLE `sma_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sma_combo_items`
--
ALTER TABLE `sma_combo_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_companies`
--
ALTER TABLE `sma_companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sma_costing`
--
ALTER TABLE `sma_costing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `sma_currencies`
--
ALTER TABLE `sma_currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sma_customer_groups`
--
ALTER TABLE `sma_customer_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sma_date_format`
--
ALTER TABLE `sma_date_format`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sma_deliveries`
--
ALTER TABLE `sma_deliveries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sma_deposits`
--
ALTER TABLE `sma_deposits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_expenses`
--
ALTER TABLE `sma_expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_expense_categories`
--
ALTER TABLE `sma_expense_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_gift_cards`
--
ALTER TABLE `sma_gift_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_gift_card_topups`
--
ALTER TABLE `sma_gift_card_topups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_groups`
--
ALTER TABLE `sma_groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sma_login_attempts`
--
ALTER TABLE `sma_login_attempts`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `sma_logs`
--
ALTER TABLE `sma_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sma_notifications`
--
ALTER TABLE `sma_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_order_ref`
--
ALTER TABLE `sma_order_ref`
  MODIFY `ref_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_payments`
--
ALTER TABLE `sma_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `sma_permissions`
--
ALTER TABLE `sma_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sma_pos_register`
--
ALTER TABLE `sma_pos_register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sma_price_groups`
--
ALTER TABLE `sma_price_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sma_printers`
--
ALTER TABLE `sma_printers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_products`
--
ALTER TABLE `sma_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sma_product_photos`
--
ALTER TABLE `sma_product_photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_product_prices`
--
ALTER TABLE `sma_product_prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sma_product_variants`
--
ALTER TABLE `sma_product_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_promos`
--
ALTER TABLE `sma_promos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_purchases`
--
ALTER TABLE `sma_purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sma_purchase_items`
--
ALTER TABLE `sma_purchase_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sma_quotes`
--
ALTER TABLE `sma_quotes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_quote_items`
--
ALTER TABLE `sma_quote_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_returns`
--
ALTER TABLE `sma_returns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_return_items`
--
ALTER TABLE `sma_return_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_sales`
--
ALTER TABLE `sma_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sma_sale_items`
--
ALTER TABLE `sma_sale_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `sma_stock_counts`
--
ALTER TABLE `sma_stock_counts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_stock_count_items`
--
ALTER TABLE `sma_stock_count_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_suspended_bills`
--
ALTER TABLE `sma_suspended_bills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `sma_suspended_items`
--
ALTER TABLE `sma_suspended_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `sma_tax_rates`
--
ALTER TABLE `sma_tax_rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sma_transfers`
--
ALTER TABLE `sma_transfers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_transfer_items`
--
ALTER TABLE `sma_transfer_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_units`
--
ALTER TABLE `sma_units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sma_users`
--
ALTER TABLE `sma_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sma_user_logins`
--
ALTER TABLE `sma_user_logins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `sma_variants`
--
ALTER TABLE `sma_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_warehouses`
--
ALTER TABLE `sma_warehouses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sma_warehouses_products`
--
ALTER TABLE `sma_warehouses_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sma_warehouses_products_variants`
--
ALTER TABLE `sma_warehouses_products_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
