-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.4.3 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table bagisto_db.addresses
CREATE TABLE IF NOT EXISTS `addresses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `address_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_address_id` int unsigned DEFAULT NULL,
  `customer_id` int unsigned DEFAULT NULL COMMENT 'null if guest checkout',
  `cart_id` int unsigned DEFAULT NULL COMMENT 'only for cart_addresses',
  `order_id` int unsigned DEFAULT NULL COMMENT 'only for order_addresses',
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_address` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'only for customer_addresses',
  `use_for_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addresses_customer_id_foreign` (`customer_id`),
  KEY `addresses_cart_id_foreign` (`cart_id`),
  KEY `addresses_order_id_foreign` (`order_id`),
  KEY `addresses_parent_address_id_foreign` (`parent_address_id`),
  CONSTRAINT `addresses_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE,
  CONSTRAINT `addresses_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `addresses_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `addresses_parent_address_id_foreign` FOREIGN KEY (`parent_address_id`) REFERENCES `addresses` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.addresses: ~21 rows (approximately)
INSERT INTO `addresses` (`id`, `address_type`, `parent_address_id`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address`, `city`, `state`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `use_for_shipping`, `additional`, `created_at`, `updated_at`) VALUES
	(1, 'cart_billing', NULL, NULL, 1, NULL, 'Nguyen', 'Hung', NULL, '', '127e Le Lu', 'Tan Phu', 'Ho Chi Minh', 'VN', '760000', 'hungnd13112004@gmail.com', '0375881945', NULL, 0, 1, NULL, '2026-09-28 02:29:06', '2026-09-28 02:29:06'),
	(2, 'cart_shipping', NULL, NULL, 1, NULL, 'Nguyen', 'Hung', NULL, '', '127e Le Lu', 'Tan Phu', 'Ho Chi Minh', 'VN', '760000', 'hungnd13112004@gmail.com', '0375881945', NULL, 0, 0, NULL, '2026-09-28 02:29:06', '2026-09-28 02:29:06'),
	(3, 'order_shipping', NULL, NULL, NULL, 1, 'Nguyen', 'Hung', NULL, '', '127e Le Lu', 'Tan Phu', 'Ho Chi Minh', 'VN', '760000', 'hungnd13112004@gmail.com', '0375881945', NULL, 0, 0, NULL, '2026-09-28 02:29:18', '2026-09-28 02:29:18'),
	(4, 'order_billing', NULL, NULL, NULL, 1, 'Nguyen', 'Hung', NULL, '', '127e Le Lu', 'Tan Phu', 'Ho Chi Minh', 'VN', '760000', 'hungnd13112004@gmail.com', '0375881945', NULL, 0, 0, NULL, '2026-09-28 02:29:18', '2026-09-28 02:29:18'),
	(5, 'customer', NULL, 1, NULL, NULL, 'Nguyen', 'Hung', NULL, '', '127e Le Lu', 'Tan Phu', 'Ho Chi Minh', 'VN', '760000', 'hungnd13112004@gmail.com', '0375881945', NULL, 0, 0, NULL, '2026-09-29 07:42:55', '2026-09-29 07:42:55'),
	(6, 'cart_billing', 5, 1, 2, NULL, 'Nguyen', 'Hung', NULL, '', '127e Le Lu', 'Tan Phu', 'Ho Chi Minh', 'VN', '760000', 'hungnd13112004@gmail.com', '0375881945', NULL, 0, 1, NULL, '2026-09-29 07:42:57', '2026-09-29 07:42:57'),
	(7, 'cart_shipping', 5, 1, 2, NULL, 'Nguyen', 'Hung', NULL, '', '127e Le Lu', 'Tan Phu', 'Ho Chi Minh', 'VN', '760000', 'hungnd13112004@gmail.com', '0375881945', NULL, 0, 0, NULL, '2026-09-29 07:42:57', '2026-09-29 07:42:57'),
	(8, 'order_shipping', NULL, NULL, NULL, 2, 'Nguyen', 'Hung', NULL, '', '127e Le Lu', 'Tan Phu', 'Ho Chi Minh', 'VN', '760000', 'hungnd13112004@gmail.com', '0375881945', NULL, 0, 0, NULL, '2026-09-29 07:43:12', '2026-09-29 07:43:12'),
	(9, 'order_billing', NULL, NULL, NULL, 2, 'Nguyen', 'Hung', NULL, '', '127e Le Lu', 'Tan Phu', 'Ho Chi Minh', 'VN', '760000', 'hungnd13112004@gmail.com', '0375881945', NULL, 0, 0, NULL, '2026-09-29 07:43:12', '2026-09-29 07:43:12'),
	(10, 'cart_billing', 5, 1, 3, NULL, 'Nguyen', 'Hung', NULL, '', '127e Le Lu', 'Tan Phu', 'Ho Chi Minh', 'VN', '760000', 'hungnd13112004@gmail.com', '0375881945', NULL, 0, 1, NULL, '2026-09-29 07:47:48', '2026-09-29 07:47:48'),
	(11, 'cart_shipping', 5, 1, 3, NULL, 'Nguyen', 'Hung', NULL, '', '127e Le Lu', 'Tan Phu', 'Ho Chi Minh', 'VN', '760000', 'hungnd13112004@gmail.com', '0375881945', NULL, 0, 0, NULL, '2026-09-29 07:47:48', '2026-09-29 07:47:48'),
	(12, 'order_shipping', NULL, NULL, NULL, 3, 'Nguyen', 'Hung', NULL, '', '127e Le Lu', 'Tan Phu', 'Ho Chi Minh', 'VN', '760000', 'hungnd13112004@gmail.com', '0375881945', NULL, 0, 0, NULL, '2026-09-29 07:48:01', '2026-09-29 07:48:01'),
	(13, 'order_billing', NULL, NULL, NULL, 3, 'Nguyen', 'Hung', NULL, '', '127e Le Lu', 'Tan Phu', 'Ho Chi Minh', 'VN', '760000', 'hungnd13112004@gmail.com', '0375881945', NULL, 0, 0, NULL, '2026-09-29 07:48:01', '2026-09-29 07:48:01'),
	(14, 'cart_billing', 5, 1, 5, NULL, 'Nguyen', 'Hung', NULL, '', '127e Le Lu', 'Tan Phu', 'Ho Chi Minh', 'VN', '760000', 'hungnd13112004@gmail.com', '0375881945', NULL, 0, 1, NULL, '2026-10-07 22:16:12', '2026-10-07 22:16:12'),
	(15, 'cart_shipping', 5, 1, 5, NULL, 'Nguyen', 'Hung', NULL, '', '127e Le Lu', 'Tan Phu', 'Ho Chi Minh', 'VN', '760000', 'hungnd13112004@gmail.com', '0375881945', NULL, 0, 0, NULL, '2026-10-07 22:16:12', '2026-10-07 22:16:12'),
	(16, 'order_shipping', NULL, NULL, NULL, 4, 'Nguyen', 'Hung', NULL, '', '127e Le Lu', 'Tan Phu', 'Ho Chi Minh', 'VN', '760000', 'hungnd13112004@gmail.com', '0375881945', NULL, 0, 0, NULL, '2026-10-07 22:16:24', '2026-10-07 22:16:24'),
	(17, 'order_billing', NULL, NULL, NULL, 4, 'Nguyen', 'Hung', NULL, '', '127e Le Lu', 'Tan Phu', 'Ho Chi Minh', 'VN', '760000', 'hungnd13112004@gmail.com', '0375881945', NULL, 0, 0, NULL, '2026-10-07 22:16:24', '2026-10-07 22:16:24'),
	(18, 'cart_billing', 5, 1, 7, NULL, 'Nguyen', 'Hung', NULL, '', '127e Le Lu', 'Tan Phu', 'Ho Chi Minh', 'VN', '760000', 'hungnd13112004@gmail.com', '0375881945', NULL, 0, 1, NULL, '2026-10-08 15:27:46', '2026-10-08 15:27:46'),
	(19, 'cart_shipping', 5, 1, 7, NULL, 'Nguyen', 'Hung', NULL, '', '127e Le Lu', 'Tan Phu', 'Ho Chi Minh', 'VN', '760000', 'hungnd13112004@gmail.com', '0375881945', NULL, 0, 0, NULL, '2026-10-08 15:27:47', '2026-10-08 15:27:47'),
	(20, 'order_shipping', NULL, NULL, NULL, 5, 'Nguyen', 'Hung', NULL, '', '127e Le Lu', 'Tan Phu', 'Ho Chi Minh', 'VN', '760000', 'hungnd13112004@gmail.com', '0375881945', NULL, 0, 0, NULL, '2026-10-08 15:28:26', '2026-10-08 15:28:26'),
	(21, 'order_billing', NULL, NULL, NULL, 5, 'Nguyen', 'Hung', NULL, '', '127e Le Lu', 'Tan Phu', 'Ho Chi Minh', 'VN', '760000', 'hungnd13112004@gmail.com', '0375881945', NULL, 0, 0, NULL, '2026-10-08 15:28:26', '2026-10-08 15:28:26'),
	(22, 'cart_billing', 5, 1, 8, NULL, 'Nguyen', 'Hung', NULL, '', '127e Le Lu', 'Tan Phu', 'Ho Chi Minh', 'VN', '760000', 'hungnd13112004@gmail.com', '0375881945', NULL, 0, 1, NULL, '2026-10-08 15:31:48', '2026-10-08 15:31:48'),
	(23, 'cart_shipping', 5, 1, 8, NULL, 'Nguyen', 'Hung', NULL, '', '127e Le Lu', 'Tan Phu', 'Ho Chi Minh', 'VN', '760000', 'hungnd13112004@gmail.com', '0375881945', NULL, 0, 0, NULL, '2026-10-08 15:31:48', '2026-10-08 15:31:48'),
	(24, 'order_shipping', NULL, NULL, NULL, 6, 'Nguyen', 'Hung', NULL, '', '127e Le Lu', 'Tan Phu', 'Ho Chi Minh', 'VN', '760000', 'hungnd13112004@gmail.com', '0375881945', NULL, 0, 0, NULL, '2026-10-21 22:27:57', '2026-10-21 22:27:57'),
	(25, 'order_billing', NULL, NULL, NULL, 6, 'Nguyen', 'Hung', NULL, '', '127e Le Lu', 'Tan Phu', 'Ho Chi Minh', 'VN', '760000', 'hungnd13112004@gmail.com', '0375881945', NULL, 0, 0, NULL, '2026-10-21 22:27:57', '2026-10-21 22:27:57');

-- Dumping structure for table bagisto_db.admins
CREATE TABLE IF NOT EXISTS `admins` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `role_id` int unsigned NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_secret` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `two_factor_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `two_factor_backup_codes` json DEFAULT NULL,
  `two_factor_verified_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`),
  UNIQUE KEY `admins_api_token_unique` (`api_token`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.admins: ~0 rows (approximately)
INSERT INTO `admins` (`id`, `name`, `email`, `password`, `api_token`, `status`, `role_id`, `image`, `remember_token`, `two_factor_secret`, `two_factor_enabled`, `two_factor_backup_codes`, `two_factor_verified_at`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'admin@example.com', '$2y$12$iUOOlTxiTYSJQ7zGkF49deTNJt0KmQAqMHLo58/DRcEJJyQZ4W2aq', 'DuKLojCLzhbCMd7lLeQSwB1IQp17GdBVEUKbnQM8hR3xMRlVo6nlVwDt4QIrgFo9t6sntlPnDf4oQz3a', 1, 1, NULL, NULL, NULL, 0, NULL, NULL, '2026-09-28 02:10:02', '2026-11-03 04:58:52'),
	(2, 'Cristiano Ronaldo', 'staff@example.com', '$2y$12$lA67tEawbV8gfqZfZ3vuPuqTq9Ua0gseEXh7sZTREeAYoKEzTVDnS', 'ELBjAgM1wTWusJGbC51quhTq0xDcnL8sRWpzSlnLWIypLk9gVOZFPjMjtBPxoKAJq6e7ga1NPoQmHBdm', 1, 4, NULL, NULL, NULL, 0, NULL, NULL, '2026-10-21 22:52:52', '2026-11-03 05:03:23');

-- Dumping structure for table bagisto_db.admin_password_resets
CREATE TABLE IF NOT EXISTS `admin_password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `admin_password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.admin_password_resets: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.agent_conversations
CREATE TABLE IF NOT EXISTS `agent_conversations` (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `agent_conversations_user_id_updated_at_index` (`user_id`,`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.agent_conversations: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.agent_conversation_messages
CREATE TABLE IF NOT EXISTS `agent_conversation_messages` (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversation_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tool_calls` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tool_results` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `usage` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `conversation_index` (`conversation_id`,`user_id`,`updated_at`),
  KEY `agent_conversation_messages_user_id_index` (`user_id`),
  KEY `agent_conversation_messages_conversation_id_index` (`conversation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.agent_conversation_messages: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.attributes
CREATE TABLE IF NOT EXISTS `attributes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `swatch_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `validation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `regex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `is_unique` tinyint(1) NOT NULL DEFAULT '0',
  `is_filterable` tinyint(1) NOT NULL DEFAULT '0',
  `is_comparable` tinyint(1) NOT NULL DEFAULT '0',
  `is_configurable` tinyint(1) NOT NULL DEFAULT '0',
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `is_visible_on_front` tinyint(1) NOT NULL DEFAULT '0',
  `value_per_locale` tinyint(1) NOT NULL DEFAULT '0',
  `value_per_channel` tinyint(1) NOT NULL DEFAULT '0',
  `default_value` int DEFAULT NULL,
  `enable_wysiwyg` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attributes_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.attributes: ~27 rows (approximately)
INSERT INTO `attributes` (`id`, `code`, `admin_name`, `type`, `swatch_type`, `validation`, `regex`, `position`, `is_required`, `is_unique`, `is_filterable`, `is_comparable`, `is_configurable`, `is_user_defined`, `is_visible_on_front`, `value_per_locale`, `value_per_channel`, `default_value`, `enable_wysiwyg`, `created_at`, `updated_at`) VALUES
	(1, 'sku', 'SKU', 'text', NULL, NULL, NULL, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2026-09-28 02:10:01', '2026-09-28 02:10:01'),
	(2, 'name', 'Name', 'text', NULL, NULL, NULL, 3, 1, 0, 0, 1, 0, 0, 0, 1, 0, NULL, 0, '2026-09-28 02:10:01', '2026-09-28 02:10:01'),
	(3, 'url_key', 'URL Key', 'text', NULL, NULL, NULL, 4, 1, 1, 0, 0, 0, 0, 0, 1, 0, NULL, 0, '2026-09-28 02:10:01', '2026-09-28 02:10:01'),
	(4, 'tax_category_id', 'Tax Category', 'select', NULL, NULL, NULL, 5, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, '2026-09-28 02:10:01', '2026-09-28 02:10:01'),
	(5, 'new', 'New', 'boolean', NULL, NULL, NULL, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '2026-09-28 02:10:01', '2026-09-28 02:10:01'),
	(6, 'featured', 'Featured', 'boolean', NULL, NULL, NULL, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '2026-09-28 02:10:01', '2026-09-28 02:10:01'),
	(7, 'visible_individually', 'Visible Individually', 'boolean', NULL, NULL, NULL, 9, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '2026-09-28 02:10:01', '2026-09-28 02:10:01'),
	(8, 'status', 'Status', 'boolean', NULL, NULL, NULL, 10, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, '2026-09-28 02:10:01', '2026-09-28 02:10:01'),
	(9, 'short_description', 'Short Description', 'textarea', NULL, NULL, NULL, 11, 1, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 1, '2026-09-28 02:10:01', '2026-09-28 02:10:01'),
	(10, 'description', 'Description', 'textarea', NULL, NULL, NULL, 12, 1, 0, 0, 1, 0, 0, 0, 1, 0, NULL, 1, '2026-09-28 02:10:01', '2026-09-28 02:10:01'),
	(11, 'price', 'Price', 'price', NULL, 'decimal', NULL, 13, 1, 0, 1, 1, 0, 0, 0, 0, 0, NULL, 0, '2026-09-28 02:10:01', '2026-09-28 02:10:01'),
	(12, 'cost', 'Cost', 'price', NULL, 'decimal', NULL, 14, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL, 0, '2026-09-28 02:10:01', '2026-09-28 02:10:01'),
	(13, 'special_price', 'Special Price', 'price', NULL, 'decimal', NULL, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2026-09-28 02:10:01', '2026-09-28 02:10:01'),
	(14, 'special_price_from', 'Special Price From', 'date', NULL, NULL, NULL, 16, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, '2026-09-28 02:10:01', '2026-09-28 02:10:01'),
	(15, 'special_price_to', 'Special Price To', 'date', NULL, NULL, NULL, 17, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, '2026-09-28 02:10:01', '2026-09-28 02:10:01'),
	(16, 'meta_title', 'Meta Title', 'textarea', NULL, NULL, NULL, 18, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, '2026-09-28 02:10:01', '2026-09-28 02:10:01'),
	(17, 'meta_keywords', 'Meta Keywords', 'textarea', NULL, NULL, NULL, 20, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, '2026-09-28 02:10:01', '2026-09-28 02:10:01'),
	(18, 'meta_description', 'Meta Description', 'textarea', NULL, NULL, NULL, 21, 0, 0, 0, 0, 0, 1, 0, 1, 0, NULL, 0, '2026-09-28 02:10:01', '2026-09-28 02:10:01'),
	(19, 'length', 'Length', 'text', NULL, 'decimal', NULL, 22, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL, 0, '2026-09-28 02:10:01', '2026-09-28 02:10:01'),
	(22, 'weight', 'Weight', 'text', NULL, 'decimal', NULL, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2026-09-28 02:10:01', '2026-10-05 22:34:39'),
	(26, 'guest_checkout', 'Guest Checkout', 'boolean', NULL, NULL, NULL, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '2026-09-28 02:10:01', '2026-09-28 02:10:01'),
	(27, 'product_number', 'Product Number', 'text', NULL, NULL, NULL, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2026-09-28 02:10:01', '2026-09-28 02:10:01'),
	(28, 'manage_stock', 'Manage Stock', 'boolean', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, '2026-09-28 02:10:01', '2026-09-28 02:10:01'),
	(29, 'allow_rma', 'Allow RMA', 'boolean', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, '2026-09-28 02:10:01', '2026-09-28 02:10:01'),
	(30, 'rma_rule_id', 'RMA Rules', 'select', NULL, NULL, NULL, 5, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, '2026-09-28 02:10:01', '2026-09-28 02:10:01');

-- Dumping structure for table bagisto_db.attribute_families
CREATE TABLE IF NOT EXISTS `attribute_families` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.attribute_families: ~0 rows (approximately)
INSERT INTO `attribute_families` (`id`, `code`, `name`, `status`, `is_user_defined`) VALUES
	(1, 'default', 'Default', 0, 1);

-- Dumping structure for table bagisto_db.attribute_groups
CREATE TABLE IF NOT EXISTS `attribute_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute_family_id` int unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `column` int NOT NULL DEFAULT '1',
  `position` int NOT NULL,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_groups_attribute_family_id_name_unique` (`attribute_family_id`,`name`),
  CONSTRAINT `attribute_groups_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.attribute_groups: ~8 rows (approximately)
INSERT INTO `attribute_groups` (`id`, `code`, `attribute_family_id`, `name`, `column`, `position`, `is_user_defined`) VALUES
	(1, 'general', 1, 'General', 1, 1, 0),
	(2, 'description', 1, 'Description', 1, 2, 0),
	(3, 'meta_description', 1, 'Meta Description', 1, 3, 0),
	(4, 'price', 1, 'Price', 2, 1, 0),
	(5, 'shipping', 1, 'Shipping', 2, 2, 0),
	(6, 'settings', 1, 'Settings', 2, 3, 0),
	(7, 'inventories', 1, 'Inventories', 2, 4, 0),
	(8, 'rma', 1, 'RMA', 2, 5, 0);

-- Dumping structure for table bagisto_db.attribute_group_mappings
CREATE TABLE IF NOT EXISTS `attribute_group_mappings` (
  `attribute_id` int unsigned NOT NULL,
  `attribute_group_id` int unsigned NOT NULL,
  `position` int DEFAULT NULL,
  PRIMARY KEY (`attribute_id`,`attribute_group_id`),
  KEY `attribute_group_mappings_attribute_group_id_foreign` (`attribute_group_id`),
  CONSTRAINT `attribute_group_mappings_attribute_group_id_foreign` FOREIGN KEY (`attribute_group_id`) REFERENCES `attribute_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attribute_group_mappings_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.attribute_group_mappings: ~26 rows (approximately)
INSERT INTO `attribute_group_mappings` (`attribute_id`, `attribute_group_id`, `position`) VALUES
	(1, 1, 1),
	(2, 1, 3),
	(3, 1, 4),
	(4, 1, 5),
	(5, 6, 1),
	(6, 6, 2),
	(7, 6, 3),
	(8, 6, 4),
	(9, 2, 1),
	(10, 2, 2),
	(11, 4, 1),
	(12, 4, 2),
	(13, 4, 3),
	(14, 4, 4),
	(15, 4, 5),
	(16, 3, 1),
	(17, 3, 2),
	(18, 3, 3),
	(19, 5, 1),
	(22, 5, 4),
	(26, 6, 5),
	(27, 1, 2),
	(28, 7, 1),
	(29, 8, 1),
	(30, 8, 2);

-- Dumping structure for table bagisto_db.attribute_options
CREATE TABLE IF NOT EXISTS `attribute_options` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int unsigned NOT NULL,
  `admin_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int DEFAULT NULL,
  `swatch_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_options_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `attribute_options_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.attribute_options: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.attribute_option_translations
CREATE TABLE IF NOT EXISTS `attribute_option_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `attribute_option_id` int unsigned NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `swatch_alt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_option_locale_unique` (`attribute_option_id`,`locale`),
  CONSTRAINT `attribute_option_translations_attribute_option_id_foreign` FOREIGN KEY (`attribute_option_id`) REFERENCES `attribute_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.attribute_option_translations: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.attribute_translations
CREATE TABLE IF NOT EXISTS `attribute_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int unsigned NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_translations_attribute_id_locale_unique` (`attribute_id`,`locale`),
  CONSTRAINT `attribute_translations_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.attribute_translations: ~25 rows (approximately)
INSERT INTO `attribute_translations` (`id`, `attribute_id`, `locale`, `name`) VALUES
	(1, 1, 'en', 'SKU'),
	(2, 2, 'en', 'Name'),
	(3, 3, 'en', 'URL Key'),
	(4, 4, 'en', 'Tax Category'),
	(5, 5, 'en', 'New'),
	(6, 6, 'en', 'Featured'),
	(7, 7, 'en', 'Visible Individually'),
	(8, 8, 'en', 'Status'),
	(9, 9, 'en', 'Short Description'),
	(10, 10, 'en', 'Description'),
	(11, 11, 'en', 'Price'),
	(12, 12, 'en', 'Cost'),
	(13, 13, 'en', 'Special Price'),
	(14, 14, 'en', 'Special Price From'),
	(15, 15, 'en', 'Special Price To'),
	(16, 16, 'en', 'Meta Title'),
	(17, 17, 'en', 'Meta Keywords'),
	(18, 18, 'en', 'Meta Description'),
	(19, 19, 'en', 'Length'),
	(22, 22, 'en', 'Weight'),
	(26, 26, 'en', 'Guest Checkout'),
	(27, 27, 'en', 'Product Number'),
	(28, 28, 'en', 'Manage Stock'),
	(29, 29, 'en', 'Allow RMA'),
	(30, 30, 'en', 'RMA Rules');

-- Dumping structure for table bagisto_db.bookings
CREATE TABLE IF NOT EXISTS `bookings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned DEFAULT NULL,
  `order_item_id` int unsigned DEFAULT NULL,
  `order_id` int unsigned DEFAULT NULL,
  `qty` int DEFAULT '0',
  `from` int DEFAULT NULL,
  `to` int DEFAULT NULL,
  `allow_cancellation` tinyint(1) NOT NULL DEFAULT '1',
  `booking_product_event_ticket_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bookings_order_item_id_foreign` (`order_item_id`),
  KEY `bookings_booking_product_event_ticket_id_foreign` (`booking_product_event_ticket_id`),
  KEY `bookings_order_id_foreign` (`order_id`),
  KEY `bookings_product_id_foreign` (`product_id`),
  CONSTRAINT `bookings_booking_product_event_ticket_id_foreign` FOREIGN KEY (`booking_product_event_ticket_id`) REFERENCES `booking_product_event_tickets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `bookings_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  CONSTRAINT `bookings_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE SET NULL,
  CONSTRAINT `bookings_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.bookings: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.booking_products
CREATE TABLE IF NOT EXISTS `booking_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int DEFAULT '0',
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_location` tinyint(1) NOT NULL DEFAULT '0',
  `available_every_week` tinyint(1) DEFAULT NULL,
  `available_from` datetime DEFAULT NULL,
  `available_to` datetime DEFAULT NULL,
  `allow_cancellation` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_products_product_id_foreign` (`product_id`),
  CONSTRAINT `booking_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.booking_products: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.booking_product_appointment_slots
CREATE TABLE IF NOT EXISTS `booking_product_appointment_slots` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_product_id` int unsigned NOT NULL,
  `duration` int DEFAULT NULL,
  `break_time` int DEFAULT NULL,
  `same_slot_all_days` tinyint(1) DEFAULT NULL,
  `slots` json DEFAULT NULL,
  `allow_slot_overlap` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `booking_product_appointment_slots_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_appointment_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.booking_product_appointment_slots: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.booking_product_default_slots
CREATE TABLE IF NOT EXISTS `booking_product_default_slots` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_product_id` int unsigned NOT NULL,
  `booking_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` int DEFAULT NULL,
  `break_time` int DEFAULT NULL,
  `slots` json DEFAULT NULL,
  `allow_slot_overlap` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `booking_product_default_slots_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_default_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.booking_product_default_slots: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.booking_product_event_tickets
CREATE TABLE IF NOT EXISTS `booking_product_event_tickets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_product_id` int unsigned NOT NULL,
  `price` decimal(12,4) DEFAULT '0.0000',
  `qty` int DEFAULT '0',
  `special_price` decimal(12,4) DEFAULT NULL,
  `special_price_from` datetime DEFAULT NULL,
  `special_price_to` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_product_event_tickets_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_event_tickets_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.booking_product_event_tickets: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.booking_product_event_ticket_translations
CREATE TABLE IF NOT EXISTS `booking_product_event_ticket_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_product_event_ticket_id` bigint unsigned NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bpet_locale_unique` (`booking_product_event_ticket_id`,`locale`),
  CONSTRAINT `bpet_translations_fk` FOREIGN KEY (`booking_product_event_ticket_id`) REFERENCES `booking_product_event_tickets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.booking_product_event_ticket_translations: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.booking_product_rental_slots
CREATE TABLE IF NOT EXISTS `booking_product_rental_slots` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_product_id` int unsigned NOT NULL,
  `renting_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `daily_price` decimal(12,4) DEFAULT '0.0000',
  `hourly_price` decimal(12,4) DEFAULT '0.0000',
  `same_slot_all_days` tinyint(1) DEFAULT NULL,
  `slots` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_product_rental_slots_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_rental_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.booking_product_rental_slots: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.booking_product_table_slots
CREATE TABLE IF NOT EXISTS `booking_product_table_slots` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_product_id` int unsigned NOT NULL,
  `price_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guest_limit` int NOT NULL DEFAULT '0',
  `duration` int NOT NULL,
  `break_time` int NOT NULL,
  `prevent_scheduling_before` int NOT NULL,
  `same_slot_all_days` tinyint(1) DEFAULT NULL,
  `slots` json DEFAULT NULL,
  `allow_slot_overlap` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_product_table_slots_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_table_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.booking_product_table_slots: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.cart
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `customer_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_gift` tinyint(1) NOT NULL DEFAULT '0',
  `items_count` int DEFAULT NULL,
  `items_qty` decimal(12,4) DEFAULT NULL,
  `exchange_rate` decimal(12,4) DEFAULT NULL,
  `global_currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cart_currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `tax_total` decimal(12,4) DEFAULT '0.0000',
  `base_tax_total` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `checkout_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_guest` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `applied_cart_rule_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int unsigned DEFAULT NULL,
  `channel_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_customer_id_foreign` (`customer_id`),
  KEY `cart_channel_id_foreign` (`channel_id`),
  CONSTRAINT `cart_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.cart: ~8 rows (approximately)
INSERT INTO `cart` (`id`, `customer_email`, `customer_first_name`, `customer_last_name`, `shipping_method`, `coupon_code`, `is_gift`, `items_count`, `items_qty`, `exchange_rate`, `global_currency_code`, `base_currency_code`, `channel_currency_code`, `cart_currency_code`, `grand_total`, `base_grand_total`, `sub_total`, `base_sub_total`, `tax_total`, `base_tax_total`, `discount_amount`, `base_discount_amount`, `shipping_amount`, `base_shipping_amount`, `shipping_amount_incl_tax`, `base_shipping_amount_incl_tax`, `sub_total_incl_tax`, `base_sub_total_incl_tax`, `checkout_method`, `is_guest`, `is_active`, `applied_cart_rule_ids`, `customer_id`, `channel_id`, `created_at`, `updated_at`) VALUES
	(1, 'hungnd13112004@gmail.com', 'Nguyen', 'Hung', 'free_free', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 999.0000, 999.0000, 999.0000, 999.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 999.0000, 999.0000, NULL, 1, 0, NULL, NULL, 1, '2026-09-28 02:27:37', '2026-09-28 02:29:24'),
	(2, 'hungnd13112004@gmail.com', 'Nguyen', 'Hung', 'free_free', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 1049.0000, 1049.0000, 1049.0000, 1049.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1049.0000, 1049.0000, NULL, 0, 0, NULL, 1, 1, '2026-09-29 07:42:06', '2026-09-29 07:43:18'),
	(3, 'hungnd13112004@gmail.com', 'Nguyen', 'Hung', 'free_free', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 249.9900, 249.9900, 249.9900, 249.9900, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 249.9900, 249.9900, NULL, 0, 0, NULL, 1, 1, '2026-09-29 07:47:36', '2026-09-29 07:48:05'),
	(4, 'hungnd13112004@gmail.com', 'Nguyen', 'Hung', NULL, NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 249.9900, 249.9900, 249.9900, 249.9900, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 249.9900, 249.9900, NULL, 0, 0, NULL, 1, 1, '2026-09-29 07:54:37', '2026-09-29 07:54:37'),
	(5, 'hungnd13112004@gmail.com', 'Nguyen', 'Hung', 'free_free', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 1049.0000, 1049.0000, 1049.0000, 1049.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1049.0000, 1049.0000, NULL, 0, 0, NULL, 1, 1, '2026-10-07 21:59:55', '2026-10-07 22:16:31'),
	(6, 'demo1@gmail.com', 'Peter', 'Parker', 'free_free', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 1149.0000, 1149.0000, 1149.0000, 1149.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1149.0000, 1149.0000, NULL, 0, 1, NULL, 2, 1, '2026-10-07 22:05:54', '2026-10-21 22:29:35'),
	(7, 'hungnd13112004@gmail.com', 'Nguyen', 'Hung', 'free_free', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 1049.0000, 1049.0000, 1049.0000, 1049.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1049.0000, 1049.0000, NULL, 0, 0, NULL, 1, 1, '2026-10-08 15:27:25', '2026-10-08 15:28:34'),
	(8, 'hungnd13112004@gmail.com', 'Nguyen', 'Hung', 'flatrate_flatrate', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 1059.0000, 1059.0000, 1049.0000, 1049.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, 10.0000, 10.0000, 1049.0000, 1049.0000, NULL, 0, 0, NULL, 1, 1, '2026-10-08 15:31:37', '2026-10-21 22:28:03'),
	(10, 'hungnd13112004@gmail.com', 'Nguyen', 'Hung', NULL, NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 1199.0000, 1199.0000, 1199.0000, 1199.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1199.0000, 1199.0000, NULL, 0, 1, NULL, 1, 1, '2026-11-03 05:01:25', '2026-11-03 05:04:52');

-- Dumping structure for table bagisto_db.cart_items
CREATE TABLE IF NOT EXISTS `cart_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `quantity` int unsigned NOT NULL DEFAULT '0',
  `sku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_weight` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_weight` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `price` decimal(12,4) NOT NULL DEFAULT '1.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `custom_price` decimal(12,4) DEFAULT NULL,
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_percent` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `applied_tax_rate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned NOT NULL,
  `cart_id` int unsigned NOT NULL,
  `tax_category_id` int unsigned DEFAULT NULL,
  `applied_cart_rule_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_items_parent_id_foreign` (`parent_id`),
  KEY `cart_items_product_id_foreign` (`product_id`),
  KEY `cart_items_cart_id_foreign` (`cart_id`),
  KEY `cart_items_tax_category_id_foreign` (`tax_category_id`),
  CONSTRAINT `cart_items_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `cart_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.cart_items: ~7 rows (approximately)
INSERT INTO `cart_items` (`id`, `quantity`, `sku`, `type`, `name`, `coupon_code`, `weight`, `total_weight`, `base_total_weight`, `price`, `base_price`, `custom_price`, `total`, `base_total`, `tax_percent`, `tax_amount`, `base_tax_amount`, `discount_percent`, `discount_amount`, `base_discount_amount`, `price_incl_tax`, `base_price_incl_tax`, `total_incl_tax`, `base_total_incl_tax`, `applied_tax_rate`, `parent_id`, `product_id`, `cart_id`, `tax_category_id`, `applied_cart_rule_ids`, `additional`, `created_at`, `updated_at`) VALUES
	(1, 1, 'PHONE-ROG8PRO-512', 'simple', 'ASUS ROG Phone 8 Pro 16GB/512GB Gaming Snapdragon 8 Gen 3', NULL, 0.3500, 0.3500, 0.3500, 999.0000, 999.0000, NULL, 999.0000, 999.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 999.0000, 999.0000, 999.0000, 999.0000, NULL, NULL, 5, 1, NULL, NULL, '{"cart_id": 1, "quantity": 1, "is_buy_now": "0", "product_id": "5"}', '2026-09-28 02:27:37', '2026-09-28 02:27:37'),
	(2, 1, 'PHONE-XM14U-512', 'simple', 'Xiaomi 14 Ultra 16GB/512GB Leica Quad Camera 1-inch Sensor', NULL, 0.3500, 0.3500, 0.3500, 1049.0000, 1049.0000, NULL, 1049.0000, 1049.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1049.0000, 1049.0000, 1049.0000, 1049.0000, NULL, NULL, 6, 2, NULL, NULL, '{"cart_id": 2, "quantity": 1, "product_id": 6}', '2026-09-29 07:42:06', '2026-09-29 07:42:06'),
	(3, 1, 'EAR-SONY-WF1000XM5', 'simple', 'Sony WF-1000XM5 Flagship Noise Canceling Earbuds Hi-Res LDAC', NULL, 0.3500, 0.3500, 0.3500, 249.9900, 249.9900, NULL, 249.9900, 249.9900, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 249.9900, 249.9900, 249.9900, 249.9900, NULL, NULL, 12, 3, NULL, NULL, '{"cart_id": 3, "quantity": 1, "is_buy_now": "0", "product_id": "12"}', '2026-09-29 07:47:36', '2026-09-29 07:47:36'),
	(4, 1, 'EAR-SONY-WF1000XM5', 'simple', 'Sony WF-1000XM5 Flagship Noise Canceling Earbuds Hi-Res LDAC', NULL, 0.3500, 0.3500, 0.3500, 249.9900, 249.9900, NULL, 249.9900, 249.9900, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 249.9900, 249.9900, 249.9900, 249.9900, NULL, NULL, 12, 4, NULL, NULL, '{"locale": "en", "cart_id": 4, "quantity": 1, "is_buy_now": "0", "product_id": "12"}', '2026-09-29 07:54:37', '2026-09-29 07:54:37'),
	(12, 1, 'PHONE-XM14U-512', 'simple', 'Xiaomi 14 Ultra 16GB/512GB Leica Quad Camera 1-inch Sensor', NULL, 0.3500, 0.3500, 0.3500, 1049.0000, 1049.0000, NULL, 1049.0000, 1049.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1049.0000, 1049.0000, 1049.0000, 1049.0000, NULL, NULL, 6, 5, NULL, NULL, '{"cart_id": 5, "quantity": 1, "product_id": 6}', '2026-10-07 22:15:51', '2026-10-07 22:15:51'),
	(13, 1, 'PHONE-XM14U-512', 'simple', 'Xiaomi 14 Ultra 16GB/512GB Leica Quad Camera 1-inch Sensor', NULL, 0.3500, 0.3500, 0.3500, 1049.0000, 1049.0000, NULL, 1049.0000, 1049.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1049.0000, 1049.0000, 1049.0000, 1049.0000, NULL, NULL, 6, 7, NULL, NULL, '{"cart_id": 7, "quantity": 1, "product_id": 6}', '2026-10-08 15:27:25', '2026-10-08 15:27:25'),
	(14, 1, 'PHONE-XM14U-512', 'simple', 'Xiaomi 14 Ultra 16GB/512GB Leica Quad Camera 1-inch Sensor', NULL, 0.3500, 0.3500, 0.3500, 1049.0000, 1049.0000, NULL, 1049.0000, 1049.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1049.0000, 1049.0000, 1049.0000, 1049.0000, NULL, NULL, 6, 8, NULL, NULL, '{"cart_id": 8, "quantity": 1, "product_id": 6}', '2026-10-08 15:31:37', '2026-10-08 15:31:37'),
	(18, 1, 'PHONE-IP16PM-256', 'simple', 'Apple iPhone 16 Pro Max 256GB Desert Titanium A18 Pro 48MP Fusion', NULL, 0.2270, 0.2270, 0.2270, 1149.0000, 1149.0000, NULL, 1149.0000, 1149.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1149.0000, 1149.0000, 1149.0000, 1149.0000, NULL, NULL, 1, 6, NULL, NULL, '{"cart_id": 6, "quantity": 1, "product_id": 1}', '2026-10-21 22:28:39', '2026-10-21 22:28:39'),
	(20, 1, 'PHONE-S24U-512', 'simple', 'Samsung Galaxy S24 Ultra 12GB/512GB Titanium AI Snapdragon 8 Gen 3', NULL, 0.2320, 0.2320, 0.2320, 1199.0000, 1199.0000, NULL, 1199.0000, 1199.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1199.0000, 1199.0000, 1199.0000, 1199.0000, NULL, NULL, 4, 10, NULL, NULL, '{"cart_id": 10, "quantity": 1, "product_id": 4}', '2026-11-03 05:01:25', '2026-11-03 05:01:25');

-- Dumping structure for table bagisto_db.cart_item_inventories
CREATE TABLE IF NOT EXISTS `cart_item_inventories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `qty` int unsigned NOT NULL DEFAULT '0',
  `inventory_source_id` int unsigned DEFAULT NULL,
  `cart_item_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.cart_item_inventories: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.cart_payment
CREATE TABLE IF NOT EXISTS `cart_payment` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cart_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_payment_cart_id_foreign` (`cart_id`),
  CONSTRAINT `cart_payment_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.cart_payment: ~6 rows (approximately)
INSERT INTO `cart_payment` (`id`, `method`, `method_title`, `cart_id`, `created_at`, `updated_at`) VALUES
	(1, 'cashondelivery', 'Cash On Delivery', 1, '2026-09-28 02:29:17', '2026-09-28 02:29:17'),
	(2, 'moneytransfer', 'Money Transfer', 2, '2026-09-29 07:43:11', '2026-09-29 07:43:11'),
	(3, 'cashondelivery', 'Cash On Delivery', 3, '2026-09-29 07:47:56', '2026-09-29 07:47:56'),
	(4, 'cashondelivery', 'Cash On Delivery', 5, '2026-10-07 22:16:21', '2026-10-07 22:16:21'),
	(18, 'moneytransfer', 'Money Transfer', 7, '2026-10-08 15:28:25', '2026-10-08 15:28:25'),
	(23, 'cashondelivery', 'Cash On Delivery', 8, '2026-10-21 22:27:52', '2026-10-21 22:27:52');

-- Dumping structure for table bagisto_db.cart_rules
CREATE TABLE IF NOT EXISTS `cart_rules` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `coupon_type` int NOT NULL DEFAULT '1',
  `use_auto_generation` tinyint(1) NOT NULL DEFAULT '0',
  `usage_per_customer` int NOT NULL DEFAULT '0',
  `uses_per_coupon` int NOT NULL DEFAULT '0',
  `times_used` int unsigned NOT NULL DEFAULT '0',
  `condition_type` tinyint(1) NOT NULL DEFAULT '1',
  `conditions` json DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT '0',
  `uses_attribute_conditions` tinyint(1) NOT NULL DEFAULT '0',
  `action_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_quantity` int NOT NULL DEFAULT '1',
  `discount_step` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `apply_to_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `free_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.cart_rules: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.cart_rule_channels
CREATE TABLE IF NOT EXISTS `cart_rule_channels` (
  `cart_rule_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  PRIMARY KEY (`cart_rule_id`,`channel_id`),
  KEY `cart_rule_channels_channel_id_foreign` (`channel_id`),
  CONSTRAINT `cart_rule_channels_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.cart_rule_channels: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.cart_rule_coupons
CREATE TABLE IF NOT EXISTS `cart_rule_coupons` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usage_limit` int unsigned NOT NULL DEFAULT '0',
  `usage_per_customer` int unsigned NOT NULL DEFAULT '0',
  `times_used` int unsigned NOT NULL DEFAULT '0',
  `type` int unsigned NOT NULL DEFAULT '0',
  `is_primary` tinyint(1) NOT NULL DEFAULT '0',
  `expired_at` date DEFAULT NULL,
  `cart_rule_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_rule_coupons_cart_rule_id_foreign` (`cart_rule_id`),
  CONSTRAINT `cart_rule_coupons_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.cart_rule_coupons: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.cart_rule_coupon_usage
CREATE TABLE IF NOT EXISTS `cart_rule_coupon_usage` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `times_used` int NOT NULL DEFAULT '0',
  `cart_rule_coupon_id` int unsigned NOT NULL,
  `customer_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_rule_coupon_usage_cart_rule_coupon_id_foreign` (`cart_rule_coupon_id`),
  KEY `cart_rule_coupon_usage_customer_id_foreign` (`customer_id`),
  CONSTRAINT `cart_rule_coupon_usage_cart_rule_coupon_id_foreign` FOREIGN KEY (`cart_rule_coupon_id`) REFERENCES `cart_rule_coupons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_coupon_usage_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.cart_rule_coupon_usage: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.cart_rule_customers
CREATE TABLE IF NOT EXISTS `cart_rule_customers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `times_used` bigint unsigned NOT NULL DEFAULT '0',
  `customer_id` int unsigned NOT NULL,
  `cart_rule_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_rule_customers_cart_rule_id_foreign` (`cart_rule_id`),
  KEY `cart_rule_customers_customer_id_foreign` (`customer_id`),
  CONSTRAINT `cart_rule_customers_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_customers_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.cart_rule_customers: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.cart_rule_customer_groups
CREATE TABLE IF NOT EXISTS `cart_rule_customer_groups` (
  `cart_rule_id` int unsigned NOT NULL,
  `customer_group_id` int unsigned NOT NULL,
  PRIMARY KEY (`cart_rule_id`,`customer_group_id`),
  KEY `cart_rule_customer_groups_customer_group_id_foreign` (`customer_group_id`),
  CONSTRAINT `cart_rule_customer_groups_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_customer_groups_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.cart_rule_customer_groups: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.cart_rule_translations
CREATE TABLE IF NOT EXISTS `cart_rule_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cart_rule_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cart_rule_translations_cart_rule_id_locale_unique` (`cart_rule_id`,`locale`),
  CONSTRAINT `cart_rule_translations_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.cart_rule_translations: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.cart_shipping_rates
CREATE TABLE IF NOT EXISTS `cart_shipping_rates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `carrier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `carrier_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double DEFAULT '0',
  `base_price` double DEFAULT '0',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_percent` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `applied_tax_rate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_calculate_tax` tinyint(1) NOT NULL DEFAULT '1',
  `cart_address_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cart_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_shipping_rates_cart_id_foreign` (`cart_id`),
  CONSTRAINT `cart_shipping_rates_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.cart_shipping_rates: ~12 rows (approximately)
INSERT INTO `cart_shipping_rates` (`id`, `carrier`, `carrier_title`, `method`, `method_title`, `method_description`, `price`, `base_price`, `discount_amount`, `base_discount_amount`, `tax_percent`, `tax_amount`, `base_tax_amount`, `price_incl_tax`, `base_price_incl_tax`, `applied_tax_rate`, `is_calculate_tax`, `cart_address_id`, `created_at`, `updated_at`, `cart_id`) VALUES
	(3, 'flatrate', 'Flat Rate', 'flatrate_flatrate', 'Flat Rate', 'Flat Rate Shipping', 10, 10, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, NULL, 1, 2, '2026-09-28 02:29:11', '2026-09-28 02:29:11', 1),
	(4, 'free', 'Free Shipping', 'free_free', 'Free Shipping', 'Free Shipping', 0, 0, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 2, '2026-09-28 02:29:11', '2026-09-28 02:29:11', 1),
	(19, 'flatrate', 'Flat Rate', 'flatrate_flatrate', 'Flat Rate', 'Flat Rate Shipping', 10, 10, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, NULL, 1, 7, '2026-09-29 07:43:08', '2026-09-29 07:43:08', 2),
	(20, 'free', 'Free Shipping', 'free_free', 'Free Shipping', 'Free Shipping', 0, 0, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 7, '2026-09-29 07:43:08', '2026-09-29 07:43:08', 2),
	(27, 'flatrate', 'Flat Rate', 'flatrate_flatrate', 'Flat Rate', 'Flat Rate Shipping', 10, 10, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, NULL, 1, 11, '2026-09-29 07:47:54', '2026-09-29 07:47:54', 3),
	(28, 'free', 'Free Shipping', 'free_free', 'Free Shipping', 'Free Shipping', 0, 0, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 11, '2026-09-29 07:47:54', '2026-09-29 07:47:54', 3),
	(31, 'flatrate', 'Flat Rate', 'flatrate_flatrate', 'Flat Rate', 'Flat Rate Shipping', 10, 10, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, NULL, 1, 15, '2026-10-07 22:16:16', '2026-10-07 22:16:16', 5),
	(32, 'free', 'Free Shipping', 'free_free', 'Free Shipping', 'Free Shipping', 0, 0, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 15, '2026-10-07 22:16:16', '2026-10-07 22:16:16', 5),
	(35, 'flatrate', 'Flat Rate', 'flatrate_flatrate', 'Flat Rate', 'Flat Rate Shipping', 10, 10, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, NULL, 1, 19, '2026-10-08 15:27:49', '2026-10-08 15:27:49', 7),
	(36, 'free', 'Free Shipping', 'free_free', 'Free Shipping', 'Free Shipping', 0, 0, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 19, '2026-10-08 15:27:49', '2026-10-08 15:27:49', 7),
	(49, 'flatrate', 'Flat Rate', 'flatrate_flatrate', 'Flat Rate', 'Flat Rate Shipping', 10, 10, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, NULL, 1, 23, '2026-10-21 22:27:50', '2026-10-21 22:27:50', 8),
	(50, 'free', 'Free Shipping', 'free_free', 'Free Shipping', 'Free Shipping', 0, 0, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 23, '2026-10-21 22:27:50', '2026-10-21 22:27:50', 8);

-- Dumping structure for table bagisto_db.catalog_rules
CREATE TABLE IF NOT EXISTS `catalog_rules` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `starts_from` date DEFAULT NULL,
  `ends_till` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `condition_type` tinyint(1) NOT NULL DEFAULT '1',
  `conditions` json DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT '0',
  `action_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.catalog_rules: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.catalog_rule_channels
CREATE TABLE IF NOT EXISTS `catalog_rule_channels` (
  `catalog_rule_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  PRIMARY KEY (`catalog_rule_id`,`channel_id`),
  KEY `catalog_rule_channels_channel_id_foreign` (`channel_id`),
  CONSTRAINT `catalog_rule_channels_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.catalog_rule_channels: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.catalog_rule_customer_groups
CREATE TABLE IF NOT EXISTS `catalog_rule_customer_groups` (
  `catalog_rule_id` int unsigned NOT NULL,
  `customer_group_id` int unsigned NOT NULL,
  PRIMARY KEY (`catalog_rule_id`,`customer_group_id`),
  KEY `catalog_rule_customer_groups_customer_group_id_foreign` (`customer_group_id`),
  CONSTRAINT `catalog_rule_customer_groups_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_customer_groups_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.catalog_rule_customer_groups: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.catalog_rule_products
CREATE TABLE IF NOT EXISTS `catalog_rule_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT '0',
  `action_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int unsigned NOT NULL DEFAULT '0',
  `product_id` int unsigned NOT NULL,
  `customer_group_id` int unsigned NOT NULL,
  `catalog_rule_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_rule_products_product_id_foreign` (`product_id`),
  KEY `catalog_rule_products_customer_group_id_foreign` (`customer_group_id`),
  KEY `catalog_rule_products_catalog_rule_id_foreign` (`catalog_rule_id`),
  KEY `catalog_rule_products_channel_id_foreign` (`channel_id`),
  CONSTRAINT `catalog_rule_products_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_products_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_products_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.catalog_rule_products: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.catalog_rule_product_prices
CREATE TABLE IF NOT EXISTS `catalog_rule_product_prices` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `rule_date` date NOT NULL,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `product_id` int unsigned NOT NULL,
  `customer_group_id` int unsigned NOT NULL,
  `catalog_rule_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_rule_product_prices_product_id_foreign` (`product_id`),
  KEY `catalog_rule_product_prices_customer_group_id_foreign` (`customer_group_id`),
  KEY `catalog_rule_product_prices_catalog_rule_id_foreign` (`catalog_rule_id`),
  KEY `catalog_rule_product_prices_channel_id_foreign` (`channel_id`),
  CONSTRAINT `catalog_rule_product_prices_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_product_prices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_product_prices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_product_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.catalog_rule_product_prices: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `position` int NOT NULL DEFAULT '0',
  `logo_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `display_mode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'products_and_description',
  `_lft` int unsigned NOT NULL DEFAULT '0',
  `_rgt` int unsigned NOT NULL DEFAULT '0',
  `parent_id` int unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `banner_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories__lft__rgt_parent_id_index` (`_lft`,`_rgt`,`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.categories: ~9 rows (approximately)
INSERT INTO `categories` (`id`, `position`, `logo_path`, `status`, `display_mode`, `_lft`, `_rgt`, `parent_id`, `additional`, `banner_path`, `created_at`, `updated_at`) VALUES
	(1, 1, NULL, 0, 'products_and_description', 1, 102, NULL, NULL, NULL, '2026-09-28 02:10:01', '2026-09-29 05:52:24'),
	(2, 1, 'category/2/gemini-generated-image-nnxm5snnxm5snnxm.webp', 1, 'products_and_description', 86, 87, 1, NULL, NULL, '2026-09-28 02:17:35', '2026-10-06 21:07:56'),
	(3, 2, 'category/3/gemini-generated-image-euzh3xeuzh3xeuzh.webp', 1, 'products_and_description', 88, 91, 1, NULL, NULL, '2026-09-28 02:17:35', '2026-10-06 21:08:52'),
	(4, 3, 'category/4/mc10-88-bk-799-c10-3-port-power-bank-2022-1-600x.webp', 1, 'products_and_description', 92, 93, 1, NULL, NULL, '2026-09-28 02:17:35', '2026-10-06 21:10:29'),
	(5, 4, 'category/5/gemini-generated-image-o2lmteo2lmteo2lm.webp', 1, 'products_and_description', 94, 95, 1, NULL, NULL, '2026-09-28 02:17:35', '2026-10-06 21:11:49'),
	(6, 5, 'category/6/gemini-generated-image-e21l9we21l9we21l.webp', 1, 'products_and_description', 96, 97, 1, NULL, NULL, '2026-09-28 02:17:35', '2026-10-06 21:18:14'),
	(7, 6, 'category/7/gemini-generated-image-k9ao93k9ao93k9ao.webp', 1, 'products_and_description', 98, 99, 1, NULL, NULL, '2026-09-28 02:17:35', '2026-10-06 21:12:42'),
	(8, 7, 'category/8/gemini-generated-image-e2rofze2rofze2ro.webp', 1, 'products_and_description', 100, 101, 1, NULL, NULL, '2026-09-28 02:17:35', '2026-10-06 21:13:10'),
	(9, 1, NULL, 0, 'products_and_description', 89, 90, 3, NULL, NULL, '2026-10-21 22:35:49', '2026-10-21 22:35:49');

-- Dumping structure for table bagisto_db.category_filterable_attributes
CREATE TABLE IF NOT EXISTS `category_filterable_attributes` (
  `category_id` int unsigned NOT NULL,
  `attribute_id` int unsigned NOT NULL,
  KEY `category_filterable_attributes_category_id_foreign` (`category_id`),
  KEY `category_filterable_attributes_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `category_filterable_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `category_filterable_attributes_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.category_filterable_attributes: ~7 rows (approximately)
INSERT INTO `category_filterable_attributes` (`category_id`, `attribute_id`) VALUES
	(1, 11),
	(8, 11),
	(7, 11),
	(6, 11),
	(5, 11),
	(4, 11),
	(3, 11),
	(2, 11),
	(9, 11);

-- Dumping structure for table bagisto_db.category_translations
CREATE TABLE IF NOT EXISTS `category_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int unsigned NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_path` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `logo_alt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `banner_alt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `locale_id` int unsigned DEFAULT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_translations_category_id_slug_locale_unique` (`category_id`,`slug`,`locale`),
  KEY `category_translations_locale_id_foreign` (`locale_id`),
  CONSTRAINT `category_translations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `category_translations_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.category_translations: ~8 rows (approximately)
INSERT INTO `category_translations` (`id`, `category_id`, `name`, `slug`, `url_path`, `description`, `meta_title`, `meta_description`, `meta_keywords`, `logo_alt`, `banner_alt`, `locale_id`, `locale`) VALUES
	(1, 1, 'Root', 'root', '', '<p>Root Category Description</p>', '', '', '', NULL, NULL, NULL, 'en'),
	(2, 2, 'Flagship Smartphones', 'flagship-smartphones', '', '<p>World-class flagship smartphones featuring cutting-edge performance, latest-generation chipsets, and pro-grade camera systems.</p>', 'Flagship Smartphones', 'World-class flagship smartphones featuring cutting-edge performance, latest-generation chipsets, and pro-grade camera systems.', '', '', NULL, NULL, 'en'),
	(3, 3, 'Fast Chargers & GaN', 'fast-chargers-gan', '', '<p>High-performance GaN fast chargers from 65W to 240W, multi-device fast charging for smartphones and laptops.</p>', 'Fast Chargers & GaN', 'High-performance GaN fast chargers from 65W to 240W, multi-device fast charging for smartphones and laptops.', '', '', NULL, NULL, 'en'),
	(4, 4, 'Power Banks', 'power-banks', '', '<p>High-capacity 20,000mAh - 30,000mAh power banks with massive output power and futuristic Cyberpunk aesthetics.</p>', 'Power Banks', 'High-capacity 20,000mAh - 30,000mAh power banks with massive output power and futuristic Cyberpunk aesthetics.', '', '', NULL, NULL, 'en'),
	(5, 5, 'Audio & Gaming Earbuds', 'audio-gaming-earbuds', '', '<p>True Wireless earbuds with active noise cancellation (ANC), Hi-Res LDAC certified audio, and ultra-low latency gaming audio.</p>', 'Audio & Gaming Earbuds', 'True Wireless earbuds with active noise cancellation (ANC), Hi-Res LDAC certified audio, and ultra-low latency gaming audio.', '', '', NULL, NULL, 'en'),
	(6, 6, 'Phone Coolers & Gaming Gear', 'phone-coolers-gaming-gear', '', '<p>Magnetic semiconductor phone coolers with 27W - 36W power, instant drop to 0°C for uninterrupted maximum gaming performance.</p>', 'Phone Coolers & Gaming Gear', 'Magnetic semiconductor phone coolers with 27W - 36W power, instant drop to 0°C for uninterrupted maximum gaming performance.', '', '', NULL, NULL, 'en'),
	(7, 7, 'Thunderbolt Cables & Hubs', 'cables-and-hubs', '', '<p>Heavy-duty braided Type-C Thunderbolt 4 240W cables with 40Gbps lightning-fast data transfer and multi-port expansion hubs.</p>', 'Thunderbolt Cables & Hubs', 'Heavy-duty braided Type-C Thunderbolt 4 240W cables with 40Gbps lightning-fast data transfer and multi-port expansion hubs.', '', '', NULL, NULL, 'en'),
	(8, 8, 'Tough Cases & Screen Protectors', 'cases-and-protectors', '', '<p>Military-grade shockproof cases with authentic Kevlar MagSafe and ultra-tough 9H+ scratch-resistant tempered glass screen protectors.</p>', 'Tough Cases & Screen Protectors', 'Military-grade shockproof cases with authentic Kevlar MagSafe and ultra-tough 9H+ scratch-resistant tempered glass screen protectors.', '', '', NULL, NULL, 'en'),
	(9, 9, 'TestOnly1', 'testonly1', '', '<p>I Never see him before :)</p>', 'test', '', '', NULL, NULL, 1, 'en');

-- Dumping structure for table bagisto_db.channels
CREATE TABLE IF NOT EXISTS `channels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `timezone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hostname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_seo` json DEFAULT NULL,
  `is_maintenance_on` tinyint(1) NOT NULL DEFAULT '0',
  `allowed_ips` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `root_category_id` int unsigned DEFAULT NULL,
  `default_locale_id` int unsigned NOT NULL,
  `base_currency_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `channels_root_category_id_foreign` (`root_category_id`),
  KEY `channels_default_locale_id_foreign` (`default_locale_id`),
  KEY `channels_base_currency_id_foreign` (`base_currency_id`),
  KEY `channels_hostname_idx` (`hostname`),
  CONSTRAINT `channels_base_currency_id_foreign` FOREIGN KEY (`base_currency_id`) REFERENCES `currencies` (`id`),
  CONSTRAINT `channels_default_locale_id_foreign` FOREIGN KEY (`default_locale_id`) REFERENCES `locales` (`id`),
  CONSTRAINT `channels_root_category_id_foreign` FOREIGN KEY (`root_category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.channels: ~1 rows (approximately)
INSERT INTO `channels` (`id`, `code`, `timezone`, `theme`, `hostname`, `logo`, `favicon`, `home_seo`, `is_maintenance_on`, `allowed_ips`, `root_category_id`, `default_locale_id`, `base_currency_id`, `created_at`, `updated_at`) VALUES
	(1, 'default', NULL, 'default', 'http://localhost:8000', 'channel/1/logo-removebg-preview.png', 'channel/1/favicon-16x16.png', NULL, 0, '', 1, 1, 1, '2026-09-28 02:10:01', '2026-10-06 21:29:42');

-- Dumping structure for table bagisto_db.channel_currencies
CREATE TABLE IF NOT EXISTS `channel_currencies` (
  `channel_id` int unsigned NOT NULL,
  `currency_id` int unsigned NOT NULL,
  PRIMARY KEY (`channel_id`,`currency_id`),
  KEY `channel_currencies_currency_id_foreign` (`currency_id`),
  CONSTRAINT `channel_currencies_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `channel_currencies_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.channel_currencies: ~0 rows (approximately)
INSERT INTO `channel_currencies` (`channel_id`, `currency_id`) VALUES
	(1, 1);

-- Dumping structure for table bagisto_db.channel_inventory_sources
CREATE TABLE IF NOT EXISTS `channel_inventory_sources` (
  `channel_id` int unsigned NOT NULL,
  `inventory_source_id` int unsigned NOT NULL,
  UNIQUE KEY `channel_inventory_source_unique` (`channel_id`,`inventory_source_id`),
  KEY `channel_inventory_sources_inventory_source_id_foreign` (`inventory_source_id`),
  CONSTRAINT `channel_inventory_sources_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `channel_inventory_sources_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.channel_inventory_sources: ~0 rows (approximately)
INSERT INTO `channel_inventory_sources` (`channel_id`, `inventory_source_id`) VALUES
	(1, 1);

-- Dumping structure for table bagisto_db.channel_locales
CREATE TABLE IF NOT EXISTS `channel_locales` (
  `channel_id` int unsigned NOT NULL,
  `locale_id` int unsigned NOT NULL,
  PRIMARY KEY (`channel_id`,`locale_id`),
  KEY `channel_locales_locale_id_foreign` (`locale_id`),
  CONSTRAINT `channel_locales_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `channel_locales_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.channel_locales: ~0 rows (approximately)
INSERT INTO `channel_locales` (`channel_id`, `locale_id`) VALUES
	(1, 1);

-- Dumping structure for table bagisto_db.channel_translations
CREATE TABLE IF NOT EXISTS `channel_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` int unsigned NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `maintenance_mode_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `logo_alt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `home_seo` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `channel_translations_channel_id_locale_unique` (`channel_id`,`locale`),
  KEY `channel_translations_locale_index` (`locale`),
  CONSTRAINT `channel_translations_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.channel_translations: ~0 rows (approximately)
INSERT INTO `channel_translations` (`id`, `channel_id`, `locale`, `name`, `description`, `maintenance_mode_text`, `logo_alt`, `home_seo`, `created_at`, `updated_at`) VALUES
	(1, 1, 'en', 'Default', '', '', '', '{"meta_title": "ShopSiuu", "meta_keywords": "ShopSiuu meta keyword", "meta_description": "ShopSiuu meta description"}', NULL, '2026-10-06 21:29:42');

-- Dumping structure for table bagisto_db.cms_pages
CREATE TABLE IF NOT EXISTS `cms_pages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `layout` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.cms_pages: ~10 rows (approximately)
INSERT INTO `cms_pages` (`id`, `layout`, `created_at`, `updated_at`) VALUES
	(1, NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(2, NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(3, NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(4, NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(5, NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(6, NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(7, NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(8, NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(9, NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(10, NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02');

-- Dumping structure for table bagisto_db.cms_page_channels
CREATE TABLE IF NOT EXISTS `cms_page_channels` (
  `cms_page_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  UNIQUE KEY `cms_page_channels_cms_page_id_channel_id_unique` (`cms_page_id`,`channel_id`),
  KEY `cms_page_channels_channel_id_foreign` (`channel_id`),
  CONSTRAINT `cms_page_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cms_page_channels_cms_page_id_foreign` FOREIGN KEY (`cms_page_id`) REFERENCES `cms_pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.cms_page_channels: ~10 rows (approximately)
INSERT INTO `cms_page_channels` (`cms_page_id`, `channel_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1),
	(7, 1),
	(8, 1),
	(9, 1),
	(10, 1);

-- Dumping structure for table bagisto_db.cms_page_translations
CREATE TABLE IF NOT EXISTS `cms_page_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `page_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `html_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cms_page_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_page_translations_cms_page_id_url_key_locale_unique` (`cms_page_id`,`url_key`,`locale`),
  CONSTRAINT `cms_page_translations_cms_page_id_foreign` FOREIGN KEY (`cms_page_id`) REFERENCES `cms_pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.cms_page_translations: ~10 rows (approximately)
INSERT INTO `cms_page_translations` (`id`, `page_title`, `url_key`, `html_content`, `meta_title`, `meta_description`, `meta_keywords`, `locale`, `cms_page_id`) VALUES
	(1, 'About Us', 'about-us', '<div class="static-container">\r\n<div class="mb-5"><h2>About Us - ShopSiuu Gaming Gear</h2><br><p><strong>ShopSiuu</strong> is a premier e-commerce ecosystem dedicated to delivering authentic high-end gaming gear, mechanical keyboards, and precision peripherals for gamers and software engineers.</p><br><h3>Our Philosophy:</h3><br><blockquote>"Don\'t just trust the hype, feel the gear yourself."</blockquote><br><p>We believe every individual has a unique grip style, actuation preference, and sound profile. Therefore, every single product at ShopSiuu is carefully curated and 100% authentic, backed by dedicated post-purchase support and direct replacement warranty.</p><br><hr><br><p><em>Experimental e-commerce platform deployed on Bagisto (Laravel Framework) for Graduation Capstone Project - Team 5.</em></p></div>\r\n</div>', 'About Us', 'Learn more about ShopSiuu Gaming Gear, our philosophy, and high-end peripherals ecosystem.', 'aboutus', 'en', 1),
	(2, 'Return Policy', 'return-policy', '<div class="static-container">\r\n<div class="mb-5"><h2>Return & Exchange Policy - ShopSiuu</h2><br><h3>1. Eligibility Criteria for Return & Exchange:</h3><br><ul><br>  <li>Product must have intact warranty seals and serial numbers from ShopSiuu or official distributors.</li><br>  <li>All original packaging, accessories, cables, adapters, and promotional gifts must be included without severe physical damage or dents from drops.</li><br></ul><br><h3>2. 1-to-1 Replacement Window:</h3><br><p>We offer a strict <strong>1-to-1 replacement within the first 15 days</strong> for any power failures, sensor faults, or PCB defects caused by the manufacturer.</p></div>\r\n</div>', 'Return Policy', 'ShopSiuu return and exchange policy with 15-day 1-to-1 replacement guarantee.', 'return, policy', 'en', 2),
	(3, 'Refund Policy', 'refund-policy', '<div class="static-container">\r\n<div class="mb-5"><h2>Transparent Refund Policy</h2><br><p>ShopSiuu is committed to customer satisfaction with a swift and transparent refund process:</p><br><h3>1. Eligible Cases for Refund:</h3><br><ul><br>  <li>Delivered product does not match the ordered model, switch variant, or color.</li><br>  <li>Hardware manufacturer defect occurs within the first 7 days, but the replacement unit is out of stock.</li><br></ul><br><h3>2. Refund Method & Processing Time:</h3><br><p>Refunds will be credited directly to your registered bank account within 24 to 48 business hours after our technical center inspects the returned unit.</p></div>\r\n</div>', 'Refund Policy', 'Transparent refund policy and terms at ShopSiuu Gaming Gear.', 'refund, policy', 'en', 3),
	(4, 'Terms & Conditions', 'terms-conditions', '<div class="static-container">\r\n<div class="mb-5"><h2>Terms & Conditions of Sale</h2><br><h3>1. Order Confirmation</h3><br><p>An order is considered successfully placed when the system issues a unique Order ID and sends a status confirmation notification to the customer\'s registered account.</p><br><h3>2. Pricing & Specification Accuracy</h3><br><p>ShopSiuu strives to ensure accurate pricing and product technical specifications. In the unlikely event of a technical database error, our customer service will contact the buyer before processing the dispatch.</p><br><h3>3. Order Refusal Rights</h3><br><p>ShopSiuu reserves the right to decline service to accounts with recurring unexcused Cash on Delivery (COD) rejection history.</p></div>\r\n</div>', 'Terms & Conditions', 'Terms and conditions governing orders and transactions on ShopSiuu.', 'term, conditions', 'en', 4),
	(5, 'Terms of Use', 'terms-of-use', '<div class="static-container">\r\n<div class="mb-5"><h2>Platform Terms of Use</h2><br><p>Welcome to ShopSiuu. By accessing and using our website, you agree to comply with the following terms:</p><br><h3>1. Member Account Security</h3><br><p>Users are responsible for maintaining the confidentiality of their credentials. Any fraudulent orders, unauthorized code injection, or deliberate system overload attempts are strictly prohibited.</p><br><h3>2. Intellectual Property</h3><br><p>All product imagery, review content, and technical documents published on this website are the proprietary property of ShopSiuu and official brand partners.</p></div>\r\n</div>', 'Terms of Use', 'Platform terms of use and acceptable conduct guidelines on ShopSiuu.', 'term, use', 'en', 5),
	(6, 'Customer Service', 'customer-service', '<div class="static-container">\r\n<div class="mb-5"><h2>ShopSiuu Customer Support Center</h2><br><p>Our dedicated technical specialists are always available to help with hardware setups, firmware updates, driver configurations, and desk setup optimizations.</p><br><h3>Official Contact Channels:</h3><br><ul><br>  <li><strong>Showroom & Hands-on Experience:</strong> ShopSiuu Store - 127e Le Lu, Tan Phu District, Ho Chi Minh City.</li><br>  <li><strong>Technical Hotline:</strong> 1900 xxxx (08:30 - 21:30 Monday through Sunday).</li><br>  <li><strong>Online Support:</strong> Instant assistance available via Live Chat and Technical Support Email.</li><br></ul></div>\r\n</div>', 'Customer Service', 'Contact ShopSiuu Customer Support for hardware advice and technical inquiries.', 'customer, service', 'en', 6),
	(7, 'What\'s New', 'whats-new', '<div class="static-container">\\r\\n<div class="mb-5"><h2>Latest Gaming Gear Trends & Innovations</h2><br><p>Explore the newest breakthrough gaming tech and peripherals recently arrived at ShopSiuu:</p><br><ul><br>  <li><strong>Magnetic Hall Effect (HE) Keyboards:</strong> Ultra-responsive Rapid Trigger technology engineered specifically for competitive FPS titles.</li><br>  <li><strong>Sub-40g Ultra-lightweight Mice:</strong> Featherlight chassis combined with flagship optical sensors and wireless 8K Polling Rate support.</li><br>  <li><strong>Premium Poron Mousepads:</strong> Unrivaled desk grip and micro-control cloth textures tailored for pixel-perfect aim adjustments.</li><br></ul></div>\\r\\n</div>', 'What\'s New', 'Discover the latest trends in gaming gear, magnetic switches, and ultra-light mice.', 'new', 'en', 7),
	(8, 'Payment Policy', 'payment-policy', '<div class="static-container">\r\n<div class="mb-5"><h2>Payment Policy - ShopSiuu</h2><br><p>To ensure maximum convenience and complete peace of mind, ShopSiuu provides flexible and secure payment options:</p><br><h3>1. Cash On Delivery (COD)</h3><br><p>Pay in cash upon delivery after inspecting the package exterior directly with the courier.</p><br><h3>2. Transparent Invoicing</h3><br><p>Every completed transaction generates a verifiable electronic invoice accessible directly in your customer dashboard.</p></div>\r\n</div>', 'Payment Policy', 'ShopSiuu payment methods and electronic invoicing policies.', 'payment, policy', 'en', 8),
	(9, 'Shipping Policy', 'shipping-policy', '<div class="static-container">\r\n<div class="mb-5"><h2>Shipping Policy - ShopSiuu</h2><br><p>ShopSiuu partners with top-tier courier networks to deliver your mechanical keyboards, gaming gear, and tech accessories safely and promptly.</p><br><h3>1. Estimated Delivery Time</h3><br><ul><br>  <li><strong>Ho Chi Minh City Metro:</strong> Express same-day or 24-hour delivery from order confirmation.</li><br>  <li><strong>Other Provinces & Cities:</strong> Standard express delivery within 2 to 4 business days.</li><br></ul><br><h3>2. Shipping Rates</h3><br><ul><br>  <li><strong>Free Express Shipping</strong> on all orders of $50.00 (or 1,000,000 VND) and above.</li><br>  <li>Standard Flat Rate Shipping applies to orders below the promotional threshold.</li><br></ul><br><h3>3. Package Inspection</h3><br><p>Customers have the full right to inspect exterior parcel seals before completing payment with delivery personnel.</p></div>\r\n</div>', 'Shipping Policy', 'Shipping options, timelines, and rates for ShopSiuu orders.', 'shipping, policy', 'en', 9),
	(10, 'Privacy Policy', 'privacy-policy', '<div class="static-container">\r\n<div class="mb-5"><h2>Information Privacy Policy - ShopSiuu</h2><br><p>ShopSiuu is committed to upholding strict privacy standards for all personal customer data collected on our platform.</p><br><h3>1. Information Collection</h3><br><p>We collect essential information required to verify orders and complete deliveries, including: Full Name, Phone Number, Shipping Address, and Email Address.</p><br><h3>2. Data Security & Encryption</h3><br><p>All user passwords are automatically encrypted using industry-standard Bcrypt hashing prior to database storage, guaranteeing data protection against unauthorized exposure.</p><br><h3>3. Use of Information</h3><br><p>Collected data is used solely for order processing, dispatch status updates, and warranty service requests.</p></div>\r\n</div>', 'Privacy Policy', 'ShopSiuu privacy policy, data collection practices, and Bcrypt security standard.', 'privacy, policy', 'en', 10);

-- Dumping structure for table bagisto_db.compare_items
CREATE TABLE IF NOT EXISTS `compare_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `customer_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `compare_items_product_id_foreign` (`product_id`),
  KEY `compare_items_customer_id_foreign` (`customer_id`),
  CONSTRAINT `compare_items_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `compare_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.compare_items: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.core_config
CREATE TABLE IF NOT EXISTS `core_config` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.core_config: ~136 rows (approximately)
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES
	(1, 'sales.checkout.shopping_cart.allow_guest_checkout', '0', NULL, NULL, '2026-09-28 02:10:02', '2026-09-29 06:41:40'),
	(2, 'emails.general.notifications.emails.general.notifications.registration', '1', NULL, NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(3, 'emails.general.notifications.emails.general.notifications.customer_registration_confirmation_mail_to_admin', '0', NULL, NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(4, 'emails.general.notifications.emails.general.notifications.customer_account_credentials', '1', NULL, NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(5, 'emails.general.notifications.emails.general.notifications.new_order', '1', NULL, NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(6, 'emails.general.notifications.emails.general.notifications.new_order_mail_to_admin', '1', NULL, NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(7, 'emails.general.notifications.emails.general.notifications.new_invoice', '1', NULL, NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(8, 'emails.general.notifications.emails.general.notifications.new_invoice_mail_to_admin', '0', NULL, NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(9, 'emails.general.notifications.emails.general.notifications.new_refund', '1', NULL, NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(10, 'emails.general.notifications.emails.general.notifications.new_refund_mail_to_admin', '0', NULL, NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(11, 'emails.general.notifications.emails.general.notifications.new_shipment', '1', NULL, NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(12, 'emails.general.notifications.emails.general.notifications.new_shipment_mail_to_admin', '0', NULL, NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(13, 'emails.general.notifications.emails.general.notifications.new_inventory_source', '1', NULL, NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(14, 'emails.general.notifications.emails.general.notifications.cancel_order', '1', NULL, NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(15, 'emails.general.notifications.emails.general.notifications.cancel_order_mail_to_admin', '0', NULL, NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(16, 'general.design.categories.category_view', 'sidebar', NULL, NULL, '2026-09-28 02:10:02', '2026-09-29 06:31:13'),
	(17, 'customer.settings.social_login.enable_facebook', '0', 'default', NULL, '2026-09-28 02:10:02', '2026-10-06 21:26:54'),
	(18, 'customer.settings.social_login.enable_twitter', '0', 'default', NULL, '2026-09-28 02:10:02', '2026-10-06 21:26:54'),
	(19, 'customer.settings.social_login.enable_google', '0', 'default', NULL, '2026-09-28 02:10:02', '2026-10-06 21:26:54'),
	(20, 'customer.settings.social_login.enable_linkedin', '0', 'default', NULL, '2026-09-28 02:10:02', '2026-10-06 21:26:54'),
	(21, 'customer.settings.social_login.enable_github', '0', 'default', NULL, '2026-09-28 02:10:02', '2026-10-06 21:26:54'),
	(22, 'general.content.header_offer.title', 'Get up to 40% OFF', NULL, NULL, '2026-09-29 06:30:05', '2026-09-29 06:30:05'),
	(23, 'general.content.header_offer.redirection_title', 'Shop Now Before It\'s Gone', NULL, NULL, '2026-09-29 06:30:05', '2026-09-29 06:30:05'),
	(24, 'general.content.header_offer.redirection_link', '', NULL, NULL, '2026-09-29 06:30:05', '2026-09-29 06:30:05'),
	(25, 'general.content.speculation_rules.enabled', '0', NULL, NULL, '2026-09-29 06:30:05', '2026-09-29 06:30:05'),
	(26, 'general.content.speculation_rules.prerender_enabled', '0', NULL, NULL, '2026-09-29 06:30:05', '2026-09-29 06:30:05'),
	(27, 'general.content.speculation_rules.prefetch_enabled', '0', NULL, NULL, '2026-09-29 06:30:05', '2026-09-29 06:30:05'),
	(28, 'general.content.footer.copyright_content', '© 2026 Siuuu Store - Modern E-Commerce Platform. All rights reserved.', NULL, 'en', '2026-09-29 06:30:05', '2026-09-29 08:06:24'),
	(29, 'general.content.custom_scripts.custom_css', '', 'default', NULL, '2026-09-29 06:30:05', '2026-09-29 06:30:05'),
	(30, 'general.content.custom_scripts.custom_javascript', '', 'default', NULL, '2026-09-29 06:30:05', '2026-09-29 06:30:05'),
	(31, 'catalog.products.settings.compare_option', '1', NULL, NULL, '2026-09-29 06:33:31', '2026-09-29 06:33:31'),
	(32, 'catalog.products.settings.image_search', '0', NULL, NULL, '2026-09-29 06:33:31', '2026-09-29 06:33:31'),
	(33, 'catalog.products.search.engine', 'database', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(34, 'catalog.products.search.admin_mode', 'database', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(35, 'catalog.products.search.storefront_mode', 'database', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(36, 'catalog.products.search.min_query_length', '0', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(37, 'catalog.products.search.max_query_length', '1000', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(38, 'catalog.products.product_view_page.no_of_related_products', '', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(39, 'catalog.products.product_view_page.no_of_up_sells_products', '', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(40, 'catalog.products.cart_view_page.no_of_cross_sells_products', '', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(41, 'catalog.products.storefront.products_per_page', '', 'default', NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(42, 'catalog.products.storefront.buy_now_button_display', '0', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(43, 'catalog.products.cache_small_image.width', '', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(44, 'catalog.products.cache_small_image.height', '', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(45, 'catalog.products.cache_medium_image.width', '', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(46, 'catalog.products.cache_medium_image.height', '', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(47, 'catalog.products.cache_large_image.width', '', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(48, 'catalog.products.cache_large_image.height', '', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(49, 'catalog.products.review.guest_review', '0', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(50, 'catalog.products.review.customer_review', '1', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(51, 'catalog.products.review.censoring_reviewer_name', '1', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(52, 'catalog.products.review.summary', 'review_counts', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(53, 'catalog.products.attribute.image_attribute_upload_size', '', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(54, 'catalog.products.attribute.file_attribute_upload_size', '', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(55, 'catalog.products.social_share.enabled', '0', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(56, 'catalog.products.social_share.facebook', '0', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(57, 'catalog.products.social_share.twitter', '0', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(58, 'catalog.products.social_share.pinterest', '0', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(59, 'catalog.products.social_share.whatsapp', '0', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(60, 'catalog.products.social_share.linkedin', '0', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(61, 'catalog.products.social_share.email', '0', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(62, 'catalog.products.social_share.share_message', '', NULL, NULL, '2026-09-29 06:33:32', '2026-09-29 06:33:32'),
	(63, 'customer.address.requirements.country', '0', 'default', NULL, '2026-09-29 06:34:20', '2026-09-29 06:34:20'),
	(64, 'customer.address.requirements.state', '0', 'default', NULL, '2026-09-29 06:34:20', '2026-09-29 06:34:20'),
	(65, 'customer.address.requirements.postcode', '0', 'default', NULL, '2026-09-29 06:34:20', '2026-09-29 06:34:20'),
	(66, 'customer.address.information.street_lines', '1', 'default', NULL, '2026-09-29 06:34:20', '2026-09-29 06:34:20'),
	(67, 'customer.settings.wishlist.wishlist_option', '0', NULL, NULL, '2026-09-29 06:35:10', '2026-10-06 21:26:54'),
	(68, 'customer.settings.login_options.redirected_to_page', 'home', NULL, NULL, '2026-09-29 06:35:10', '2026-09-29 06:35:10'),
	(69, 'customer.settings.create_new_account_options.default_group', 'general', NULL, NULL, '2026-09-29 06:35:10', '2026-09-29 06:35:10'),
	(70, 'customer.settings.create_new_account_options.news_letter', '0', NULL, NULL, '2026-09-29 06:35:10', '2026-09-29 06:35:10'),
	(71, 'customer.settings.newsletter.subscription', '0', NULL, NULL, '2026-09-29 06:35:10', '2026-09-29 06:35:10'),
	(72, 'customer.settings.email.verification', '0', NULL, NULL, '2026-09-29 06:35:10', '2026-09-29 06:35:10'),
	(73, 'customer.settings.social_login.facebook_client_id', '', NULL, NULL, '2026-09-29 06:35:10', '2026-09-29 06:35:10'),
	(74, 'customer.settings.social_login.facebook_client_secret', '', NULL, NULL, '2026-09-29 06:35:10', '2026-09-29 06:35:10'),
	(75, 'customer.settings.social_login.facebook_callback_url', 'http://localhost:8000/customer/social-login/facebook/callback', NULL, NULL, '2026-09-29 06:35:10', '2026-09-29 06:35:10'),
	(76, 'customer.settings.social_login.twitter_client_id', '', NULL, NULL, '2026-09-29 06:35:10', '2026-09-29 06:35:10'),
	(77, 'customer.settings.social_login.twitter_client_secret', '', NULL, NULL, '2026-09-29 06:35:10', '2026-09-29 06:35:10'),
	(78, 'customer.settings.social_login.twitter_callback_url', 'http://localhost:8000/customer/social-login/twitter/callback', NULL, NULL, '2026-09-29 06:35:10', '2026-09-29 06:35:10'),
	(79, 'customer.settings.social_login.google_client_id', '', NULL, NULL, '2026-09-29 06:35:10', '2026-09-29 06:35:10'),
	(80, 'customer.settings.social_login.google_client_secret', '', NULL, NULL, '2026-09-29 06:35:10', '2026-09-29 06:35:10'),
	(81, 'customer.settings.social_login.google_callback_url', 'http://localhost:8000/customer/social-login/google/callback', NULL, NULL, '2026-09-29 06:35:10', '2026-09-29 06:35:10'),
	(82, 'customer.settings.social_login.linkedin_client_id', '', NULL, NULL, '2026-09-29 06:35:10', '2026-09-29 06:35:10'),
	(83, 'customer.settings.social_login.linkedin_client_secret', '', NULL, NULL, '2026-09-29 06:35:10', '2026-09-29 06:35:10'),
	(84, 'customer.settings.social_login.linkedin_callback_url', 'http://localhost:8000/customer/social-login/linkedin-openid/callback', NULL, NULL, '2026-09-29 06:35:10', '2026-09-29 06:35:10'),
	(85, 'customer.settings.social_login.github_client_id', '', NULL, NULL, '2026-09-29 06:35:10', '2026-09-29 06:35:10'),
	(86, 'customer.settings.social_login.github_client_secret', '', NULL, NULL, '2026-09-29 06:35:10', '2026-09-29 06:35:10'),
	(87, 'customer.settings.social_login.github_callback_url', 'http://localhost:8000/customer/social-login/github/callback', NULL, NULL, '2026-09-29 06:35:10', '2026-09-29 06:35:10'),
	(88, 'sales.shipping.origin.country', 'VN', 'default', 'en', '2026-09-29 06:37:33', '2026-09-29 06:37:33'),
	(89, 'sales.shipping.origin.state', 'Ho Chi Minh', 'default', 'en', '2026-09-29 06:37:33', '2026-09-29 06:37:33'),
	(90, 'sales.shipping.origin.city', 'Ho Chi Minh', 'default', 'en', '2026-09-29 06:37:33', '2026-09-29 06:37:33'),
	(91, 'sales.shipping.origin.address', '127e Le Lu', 'default', 'en', '2026-09-29 06:37:33', '2026-09-29 06:37:33'),
	(92, 'sales.shipping.origin.zipcode', '00084', 'default', 'en', '2026-09-29 06:37:33', '2026-09-29 06:37:33'),
	(93, 'sales.shipping.origin.store_name', 'ShopSiuu', 'default', 'en', '2026-09-29 06:37:33', '2026-09-29 06:37:33'),
	(94, 'sales.shipping.origin.vat_number', '1', 'default', NULL, '2026-09-29 06:37:33', '2026-09-29 06:37:33'),
	(95, 'sales.shipping.origin.contact', '0123456789', 'default', NULL, '2026-09-29 06:37:33', '2026-09-29 06:37:33'),
	(96, 'sales.shipping.origin.bank_details', '', 'default', 'en', '2026-09-29 06:37:33', '2026-09-29 06:37:33'),
	(97, 'sales.payment_methods.stripe.active', '0', 'default', NULL, '2026-09-29 06:40:04', '2026-09-29 06:40:04'),
	(98, 'sales.payment_methods.razorpay.active', '0', 'default', NULL, '2026-09-29 06:40:04', '2026-09-29 06:40:04'),
	(99, 'sales.payment_methods.payu.active', '0', 'default', NULL, '2026-09-29 06:40:04', '2026-09-29 06:40:04'),
	(100, 'sales.payment_methods.phonepe.active', '0', 'default', NULL, '2026-09-29 06:40:04', '2026-09-29 06:40:04'),
	(101, 'sales.payment_methods.paypal_smart_button.active', '0', 'default', NULL, '2026-09-29 06:40:04', '2026-10-08 15:39:02'),
	(102, 'sales.payment_methods.paypal_smart_button.title', 'PayPal Smart Button', 'default', 'en', '2026-09-29 06:40:04', '2026-09-29 06:40:04'),
	(103, 'sales.payment_methods.paypal_smart_button.description', 'PayPal', 'default', 'en', '2026-09-29 06:40:04', '2026-09-29 06:40:04'),
	(104, 'sales.payment_methods.paypal_smart_button.client_id', 'sb', 'default', NULL, '2026-09-29 06:40:04', '2026-09-29 06:40:04'),
	(105, 'sales.payment_methods.paypal_smart_button.client_secret', '', 'default', NULL, '2026-09-29 06:40:04', '2026-09-29 06:40:04'),
	(106, 'sales.payment_methods.paypal_smart_button.accepted_currencies', 'USD', 'default', NULL, '2026-09-29 06:40:04', '2026-09-29 06:40:04'),
	(107, 'sales.payment_methods.paypal_smart_button.sandbox', '1', 'default', NULL, '2026-09-29 06:40:04', '2026-09-29 06:40:04'),
	(108, 'sales.payment_methods.paypal_smart_button.sort', '5', 'default', NULL, '2026-09-29 06:40:04', '2026-09-29 06:40:04'),
	(109, 'sales.payment_methods.paypal_standard.active', '0', 'default', NULL, '2026-09-29 06:40:04', '2026-10-08 15:39:02'),
	(110, 'sales.payment_methods.paypal_standard.title', 'PayPal Standard', 'default', 'en', '2026-09-29 06:40:04', '2026-09-29 06:40:04'),
	(111, 'sales.payment_methods.paypal_standard.description', 'PayPal Standard', 'default', 'en', '2026-09-29 06:40:04', '2026-09-29 06:40:04'),
	(112, 'sales.payment_methods.paypal_standard.business_account', 'test@webkul.com', 'default', NULL, '2026-09-29 06:40:04', '2026-09-29 06:40:04'),
	(113, 'sales.payment_methods.paypal_standard.sandbox', '1', 'default', NULL, '2026-09-29 06:40:04', '2026-09-29 06:40:04'),
	(114, 'sales.payment_methods.paypal_standard.sort', '6', 'default', NULL, '2026-09-29 06:40:04', '2026-09-29 06:40:04'),
	(115, 'sales.payment_methods.cashondelivery.active', '1', 'default', NULL, '2026-09-29 06:40:04', '2026-09-29 06:40:04'),
	(116, 'sales.payment_methods.cashondelivery.title', 'Cash On Delivery', 'default', 'en', '2026-09-29 06:40:04', '2026-09-29 06:40:04'),
	(117, 'sales.payment_methods.cashondelivery.description', 'Cash On Delivery', 'default', 'en', '2026-09-29 06:40:04', '2026-09-29 06:40:04'),
	(118, 'sales.payment_methods.cashondelivery.instructions', '', 'default', 'en', '2026-09-29 06:40:04', '2026-09-29 06:40:04'),
	(119, 'sales.payment_methods.cashondelivery.generate_invoice', '0', 'default', NULL, '2026-09-29 06:40:04', '2026-09-29 06:40:04'),
	(120, 'sales.payment_methods.cashondelivery.sort', '7', 'default', NULL, '2026-09-29 06:40:04', '2026-09-29 06:40:04'),
	(121, 'sales.payment_methods.moneytransfer.active', '0', 'default', NULL, '2026-09-29 06:40:05', '2026-10-08 15:39:02'),
	(122, 'sales.payment_methods.moneytransfer.title', 'Money Transfer', 'default', 'en', '2026-09-29 06:40:05', '2026-09-29 06:40:05'),
	(123, 'sales.payment_methods.moneytransfer.description', 'Money Transfer', 'default', 'en', '2026-09-29 06:40:05', '2026-09-29 06:40:05'),
	(124, 'sales.payment_methods.moneytransfer.generate_invoice', '0', 'default', NULL, '2026-09-29 06:40:05', '2026-09-29 06:40:05'),
	(125, 'sales.payment_methods.moneytransfer.mailing_address', '', 'default', NULL, '2026-09-29 06:40:05', '2026-09-29 06:40:05'),
	(126, 'sales.payment_methods.moneytransfer.sort', '8', 'default', NULL, '2026-09-29 06:40:05', '2026-09-29 06:40:05'),
	(127, 'sales.payment_methods.payglocal.active', '0', 'default', NULL, '2026-09-29 06:40:05', '2026-09-29 06:40:05'),
	(128, 'sales.checkout.shopping_cart.cart_page', '1', NULL, NULL, '2026-09-29 06:41:40', '2026-09-29 06:41:40'),
	(129, 'sales.checkout.shopping_cart.cross_sell', '1', NULL, NULL, '2026-09-29 06:41:40', '2026-09-29 06:41:40'),
	(130, 'sales.checkout.shopping_cart.estimate_shipping', '1', NULL, NULL, '2026-09-29 06:41:40', '2026-09-29 06:41:40'),
	(131, 'sales.checkout.my_cart.summary', 'display_number_of_items_in_cart', NULL, NULL, '2026-09-29 06:41:40', '2026-09-29 06:41:40'),
	(132, 'sales.checkout.mini_cart.display_mini_cart', '0', NULL, NULL, '2026-09-29 06:41:40', '2026-09-29 06:41:40'),
	(133, 'sales.checkout.mini_cart.offer_info', 'Get Up To 30% OFF on your 1st order', NULL, NULL, '2026-09-29 06:41:40', '2026-09-29 06:41:40'),
	(134, 'general.design.admin_logo.logo_image', 'configuration/0WCN0d9skaE76Pp9Dyc0MWDUjgsiuNT8JoBeMpDA.png', NULL, NULL, '2026-09-29 09:15:09', '2026-09-29 09:15:09'),
	(135, 'general.design.admin_logo.favicon', 'configuration/NGMfv3daPUqiar9XideHYwvDaq5TWxeOLQs4NvQe.png', NULL, NULL, '2026-09-29 09:15:09', '2026-09-29 09:15:09'),
	(136, 'magic_ai.general.settings.enabled', '1', NULL, NULL, '2026-09-29 09:15:58', '2026-09-29 09:15:58'),
	(137, 'catalog.inventory.stock_options.back_orders', '0', NULL, NULL, '2026-10-21 22:00:09', '2026-10-21 22:00:09');

-- Dumping structure for table bagisto_db.countries
CREATE TABLE IF NOT EXISTS `countries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.countries: ~254 rows (approximately)
INSERT INTO `countries` (`id`, `code`, `name`) VALUES
	(1, 'AF', 'Afghanistan'),
	(2, 'AX', 'Åland Islands'),
	(3, 'AL', 'Albania'),
	(4, 'DZ', 'Algeria'),
	(5, 'AS', 'American Samoa'),
	(6, 'AD', 'Andorra'),
	(7, 'AO', 'Angola'),
	(8, 'AI', 'Anguilla'),
	(9, 'AQ', 'Antarctica'),
	(10, 'AG', 'Antigua & Barbuda'),
	(11, 'AR', 'Argentina'),
	(12, 'AM', 'Armenia'),
	(13, 'AW', 'Aruba'),
	(14, 'AC', 'Ascension Island'),
	(15, 'AU', 'Australia'),
	(16, 'AT', 'Austria'),
	(17, 'AZ', 'Azerbaijan'),
	(18, 'BS', 'Bahamas'),
	(19, 'BH', 'Bahrain'),
	(20, 'BD', 'Bangladesh'),
	(21, 'BB', 'Barbados'),
	(22, 'BY', 'Belarus'),
	(23, 'BE', 'Belgium'),
	(24, 'BZ', 'Belize'),
	(25, 'BJ', 'Benin'),
	(26, 'BM', 'Bermuda'),
	(27, 'BT', 'Bhutan'),
	(28, 'BO', 'Bolivia'),
	(29, 'BA', 'Bosnia & Herzegovina'),
	(30, 'BW', 'Botswana'),
	(31, 'BR', 'Brazil'),
	(32, 'IO', 'British Indian Ocean Territory'),
	(33, 'VG', 'British Virgin Islands'),
	(34, 'BN', 'Brunei'),
	(35, 'BG', 'Bulgaria'),
	(36, 'BF', 'Burkina Faso'),
	(37, 'BI', 'Burundi'),
	(38, 'KH', 'Cambodia'),
	(39, 'CM', 'Cameroon'),
	(40, 'CA', 'Canada'),
	(41, 'IC', 'Canary Islands'),
	(42, 'CV', 'Cape Verde'),
	(43, 'BQ', 'Caribbean Netherlands'),
	(44, 'KY', 'Cayman Islands'),
	(45, 'CF', 'Central African Republic'),
	(46, 'EA', 'Ceuta & Melilla'),
	(47, 'TD', 'Chad'),
	(48, 'CL', 'Chile'),
	(49, 'CN', 'China'),
	(50, 'CX', 'Christmas Island'),
	(51, 'CC', 'Cocos (Keeling) Islands'),
	(52, 'CO', 'Colombia'),
	(53, 'KM', 'Comoros'),
	(54, 'CG', 'Congo - Brazzaville'),
	(55, 'CD', 'Congo - Kinshasa'),
	(56, 'CK', 'Cook Islands'),
	(57, 'CR', 'Costa Rica'),
	(58, 'CI', 'Côte d’Ivoire'),
	(59, 'HR', 'Croatia'),
	(60, 'CU', 'Cuba'),
	(61, 'CW', 'Curaçao'),
	(62, 'CY', 'Cyprus'),
	(63, 'CZ', 'Czechia'),
	(64, 'DK', 'Denmark'),
	(65, 'DG', 'Diego Garcia'),
	(66, 'DJ', 'Djibouti'),
	(67, 'DM', 'Dominica'),
	(68, 'DO', 'Dominican Republic'),
	(69, 'EC', 'Ecuador'),
	(70, 'EG', 'Egypt'),
	(71, 'SV', 'El Salvador'),
	(72, 'GQ', 'Equatorial Guinea'),
	(73, 'ER', 'Eritrea'),
	(74, 'EE', 'Estonia'),
	(75, 'ET', 'Ethiopia'),
	(76, 'EZ', 'Eurozone'),
	(77, 'FK', 'Falkland Islands'),
	(78, 'FO', 'Faroe Islands'),
	(79, 'FJ', 'Fiji'),
	(80, 'FI', 'Finland'),
	(81, 'FR', 'France'),
	(82, 'GF', 'French Guiana'),
	(83, 'PF', 'French Polynesia'),
	(84, 'TF', 'French Southern Territories'),
	(85, 'GA', 'Gabon'),
	(86, 'GM', 'Gambia'),
	(87, 'GE', 'Georgia'),
	(88, 'DE', 'Germany'),
	(89, 'GH', 'Ghana'),
	(90, 'GI', 'Gibraltar'),
	(91, 'GR', 'Greece'),
	(92, 'GL', 'Greenland'),
	(93, 'GD', 'Grenada'),
	(94, 'GP', 'Guadeloupe'),
	(95, 'GU', 'Guam'),
	(96, 'GT', 'Guatemala'),
	(97, 'GG', 'Guernsey'),
	(98, 'GN', 'Guinea'),
	(99, 'GW', 'Guinea-Bissau'),
	(100, 'GY', 'Guyana'),
	(101, 'HT', 'Haiti'),
	(102, 'HN', 'Honduras'),
	(103, 'HK', 'Hong Kong SAR China'),
	(104, 'HU', 'Hungary'),
	(105, 'IS', 'Iceland'),
	(106, 'IN', 'India'),
	(107, 'ID', 'Indonesia'),
	(108, 'IR', 'Iran'),
	(109, 'IQ', 'Iraq'),
	(110, 'IE', 'Ireland'),
	(111, 'IM', 'Isle of Man'),
	(112, 'IL', 'Israel'),
	(113, 'IT', 'Italy'),
	(114, 'JM', 'Jamaica'),
	(115, 'JP', 'Japan'),
	(116, 'JE', 'Jersey'),
	(117, 'JO', 'Jordan'),
	(118, 'KZ', 'Kazakhstan'),
	(119, 'KE', 'Kenya'),
	(120, 'KI', 'Kiribati'),
	(121, 'XK', 'Kosovo'),
	(122, 'KW', 'Kuwait'),
	(123, 'KG', 'Kyrgyzstan'),
	(124, 'LA', 'Laos'),
	(125, 'LV', 'Latvia'),
	(126, 'LB', 'Lebanon'),
	(127, 'LS', 'Lesotho'),
	(128, 'LR', 'Liberia'),
	(129, 'LY', 'Libya'),
	(130, 'LI', 'Liechtenstein'),
	(131, 'LT', 'Lithuania'),
	(132, 'LU', 'Luxembourg'),
	(133, 'MO', 'Macau SAR China'),
	(134, 'MK', 'Macedonia'),
	(135, 'MG', 'Madagascar'),
	(136, 'MW', 'Malawi'),
	(137, 'MY', 'Malaysia'),
	(138, 'MV', 'Maldives'),
	(139, 'ML', 'Mali'),
	(140, 'MT', 'Malta'),
	(141, 'MH', 'Marshall Islands'),
	(142, 'MQ', 'Martinique'),
	(143, 'MR', 'Mauritania'),
	(144, 'MU', 'Mauritius'),
	(145, 'YT', 'Mayotte'),
	(146, 'MX', 'Mexico'),
	(147, 'FM', 'Micronesia'),
	(148, 'MD', 'Moldova'),
	(149, 'MC', 'Monaco'),
	(150, 'MN', 'Mongolia'),
	(151, 'ME', 'Montenegro'),
	(152, 'MS', 'Montserrat'),
	(153, 'MA', 'Morocco'),
	(154, 'MZ', 'Mozambique'),
	(155, 'MM', 'Myanmar (Burma)'),
	(156, 'NA', 'Namibia'),
	(157, 'NR', 'Nauru'),
	(158, 'NP', 'Nepal'),
	(159, 'NL', 'Netherlands'),
	(160, 'NC', 'New Caledonia'),
	(161, 'NZ', 'New Zealand'),
	(162, 'NI', 'Nicaragua'),
	(163, 'NE', 'Niger'),
	(164, 'NG', 'Nigeria'),
	(165, 'NU', 'Niue'),
	(166, 'NF', 'Norfolk Island'),
	(167, 'KP', 'North Korea'),
	(168, 'MP', 'Northern Mariana Islands'),
	(169, 'NO', 'Norway'),
	(170, 'OM', 'Oman'),
	(171, 'PK', 'Pakistan'),
	(172, 'PW', 'Palau'),
	(173, 'PS', 'Palestinian Territories'),
	(174, 'PA', 'Panama'),
	(175, 'PG', 'Papua New Guinea'),
	(176, 'PY', 'Paraguay'),
	(177, 'PE', 'Peru'),
	(178, 'PH', 'Philippines'),
	(179, 'PN', 'Pitcairn Islands'),
	(180, 'PL', 'Poland'),
	(181, 'PT', 'Portugal'),
	(182, 'PR', 'Puerto Rico'),
	(183, 'QA', 'Qatar'),
	(184, 'RE', 'Réunion'),
	(185, 'RO', 'Romania'),
	(186, 'RU', 'Russia'),
	(187, 'RW', 'Rwanda'),
	(188, 'WS', 'Samoa'),
	(189, 'SM', 'San Marino'),
	(190, 'ST', 'São Tomé & Príncipe'),
	(191, 'SA', 'Saudi Arabia'),
	(192, 'SN', 'Senegal'),
	(193, 'RS', 'Serbia'),
	(194, 'SC', 'Seychelles'),
	(195, 'SL', 'Sierra Leone'),
	(196, 'SG', 'Singapore'),
	(197, 'SX', 'Sint Maarten'),
	(198, 'SK', 'Slovakia'),
	(199, 'SI', 'Slovenia'),
	(200, 'SB', 'Solomon Islands'),
	(201, 'SO', 'Somalia'),
	(202, 'ZA', 'South Africa'),
	(203, 'GS', 'South Georgia & South Sandwich Islands'),
	(204, 'KR', 'South Korea'),
	(205, 'SS', 'South Sudan'),
	(206, 'ES', 'Spain'),
	(207, 'LK', 'Sri Lanka'),
	(208, 'BL', 'St. Barthélemy'),
	(209, 'SH', 'St. Helena'),
	(210, 'KN', 'St. Kitts & Nevis'),
	(211, 'LC', 'St. Lucia'),
	(212, 'MF', 'St. Martin'),
	(213, 'PM', 'St. Pierre & Miquelon'),
	(214, 'VC', 'St. Vincent & Grenadines'),
	(215, 'SD', 'Sudan'),
	(216, 'SR', 'Suriname'),
	(217, 'SJ', 'Svalbard & Jan Mayen'),
	(218, 'SZ', 'Swaziland'),
	(219, 'SE', 'Sweden'),
	(220, 'CH', 'Switzerland'),
	(221, 'SY', 'Syria'),
	(222, 'TW', 'Taiwan'),
	(223, 'TJ', 'Tajikistan'),
	(224, 'TZ', 'Tanzania'),
	(225, 'TH', 'Thailand'),
	(226, 'TL', 'Timor-Leste'),
	(227, 'TG', 'Togo'),
	(228, 'TK', 'Tokelau'),
	(229, 'TO', 'Tonga'),
	(230, 'TT', 'Trinidad & Tobago'),
	(231, 'TA', 'Tristan da Cunha'),
	(232, 'TN', 'Tunisia'),
	(233, 'TR', 'Turkey'),
	(234, 'TM', 'Turkmenistan'),
	(235, 'TC', 'Turks & Caicos Islands'),
	(236, 'TV', 'Tuvalu'),
	(237, 'UM', 'U.S. Outlying Islands'),
	(238, 'VI', 'U.S. Virgin Islands'),
	(239, 'UG', 'Uganda'),
	(240, 'UA', 'Ukraine'),
	(241, 'AE', 'United Arab Emirates'),
	(242, 'GB', 'United Kingdom'),
	(244, 'US', 'United States'),
	(245, 'UY', 'Uruguay'),
	(246, 'UZ', 'Uzbekistan'),
	(247, 'VU', 'Vanuatu'),
	(248, 'VA', 'Vatican City'),
	(249, 'VE', 'Venezuela'),
	(250, 'VN', 'Vietnam'),
	(251, 'WF', 'Wallis & Futuna'),
	(252, 'EH', 'Western Sahara'),
	(253, 'YE', 'Yemen'),
	(254, 'ZM', 'Zambia'),
	(255, 'ZW', 'Zimbabwe');

-- Dumping structure for table bagisto_db.country_states
CREATE TABLE IF NOT EXISTS `country_states` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int unsigned DEFAULT NULL,
  `country_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_states_country_id_foreign` (`country_id`),
  CONSTRAINT `country_states_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.country_states: ~586 rows (approximately)
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES
	(1, 244, 'US', 'AL', 'Alabama'),
	(2, 244, 'US', 'AK', 'Alaska'),
	(3, 244, 'US', 'AS', 'American Samoa'),
	(4, 244, 'US', 'AZ', 'Arizona'),
	(5, 244, 'US', 'AR', 'Arkansas'),
	(6, 244, 'US', 'AE', 'Armed Forces Africa'),
	(7, 244, 'US', 'AA', 'Armed Forces Americas'),
	(8, 244, 'US', 'AE', 'Armed Forces Canada'),
	(9, 244, 'US', 'AE', 'Armed Forces Europe'),
	(10, 244, 'US', 'AE', 'Armed Forces Middle East'),
	(11, 244, 'US', 'AP', 'Armed Forces Pacific'),
	(12, 244, 'US', 'CA', 'California'),
	(13, 244, 'US', 'CO', 'Colorado'),
	(14, 244, 'US', 'CT', 'Connecticut'),
	(15, 244, 'US', 'DE', 'Delaware'),
	(16, 244, 'US', 'DC', 'District of Columbia'),
	(17, 244, 'US', 'FM', 'Federated States Of Micronesia'),
	(18, 244, 'US', 'FL', 'Florida'),
	(19, 244, 'US', 'GA', 'Georgia'),
	(20, 244, 'US', 'GU', 'Guam'),
	(21, 244, 'US', 'HI', 'Hawaii'),
	(22, 244, 'US', 'ID', 'Idaho'),
	(23, 244, 'US', 'IL', 'Illinois'),
	(24, 244, 'US', 'IN', 'Indiana'),
	(25, 244, 'US', 'IA', 'Iowa'),
	(26, 244, 'US', 'KS', 'Kansas'),
	(27, 244, 'US', 'KY', 'Kentucky'),
	(28, 244, 'US', 'LA', 'Louisiana'),
	(29, 244, 'US', 'ME', 'Maine'),
	(30, 244, 'US', 'MH', 'Marshall Islands'),
	(31, 244, 'US', 'MD', 'Maryland'),
	(32, 244, 'US', 'MA', 'Massachusetts'),
	(33, 244, 'US', 'MI', 'Michigan'),
	(34, 244, 'US', 'MN', 'Minnesota'),
	(35, 244, 'US', 'MS', 'Mississippi'),
	(36, 244, 'US', 'MO', 'Missouri'),
	(37, 244, 'US', 'MT', 'Montana'),
	(38, 244, 'US', 'NE', 'Nebraska'),
	(39, 244, 'US', 'NV', 'Nevada'),
	(40, 244, 'US', 'NH', 'New Hampshire'),
	(41, 244, 'US', 'NJ', 'New Jersey'),
	(42, 244, 'US', 'NM', 'New Mexico'),
	(43, 244, 'US', 'NY', 'New York'),
	(44, 244, 'US', 'NC', 'North Carolina'),
	(45, 244, 'US', 'ND', 'North Dakota'),
	(46, 244, 'US', 'MP', 'Northern Mariana Islands'),
	(47, 244, 'US', 'OH', 'Ohio'),
	(48, 244, 'US', 'OK', 'Oklahoma'),
	(49, 244, 'US', 'OR', 'Oregon'),
	(50, 244, 'US', 'PW', 'Palau'),
	(51, 244, 'US', 'PA', 'Pennsylvania'),
	(52, 244, 'US', 'PR', 'Puerto Rico'),
	(53, 244, 'US', 'RI', 'Rhode Island'),
	(54, 244, 'US', 'SC', 'South Carolina'),
	(55, 244, 'US', 'SD', 'South Dakota'),
	(56, 244, 'US', 'TN', 'Tennessee'),
	(57, 244, 'US', 'TX', 'Texas'),
	(58, 244, 'US', 'UT', 'Utah'),
	(59, 244, 'US', 'VT', 'Vermont'),
	(60, 244, 'US', 'VI', 'Virgin Islands'),
	(61, 244, 'US', 'VA', 'Virginia'),
	(62, 244, 'US', 'WA', 'Washington'),
	(63, 244, 'US', 'WV', 'West Virginia'),
	(64, 244, 'US', 'WI', 'Wisconsin'),
	(65, 244, 'US', 'WY', 'Wyoming'),
	(66, 40, 'CA', 'AB', 'Alberta'),
	(67, 40, 'CA', 'BC', 'British Columbia'),
	(68, 40, 'CA', 'MB', 'Manitoba'),
	(69, 40, 'CA', 'NL', 'Newfoundland and Labrador'),
	(70, 40, 'CA', 'NB', 'New Brunswick'),
	(71, 40, 'CA', 'NS', 'Nova Scotia'),
	(72, 40, 'CA', 'NT', 'Northwest Territories'),
	(73, 40, 'CA', 'NU', 'Nunavut'),
	(74, 40, 'CA', 'ON', 'Ontario'),
	(75, 40, 'CA', 'PE', 'Prince Edward Island'),
	(76, 40, 'CA', 'QC', 'Quebec'),
	(77, 40, 'CA', 'SK', 'Saskatchewan'),
	(78, 40, 'CA', 'YT', 'Yukon Territory'),
	(79, 88, 'DE', 'NDS', 'Niedersachsen'),
	(80, 88, 'DE', 'BAW', 'Baden-Württemberg'),
	(81, 88, 'DE', 'BAY', 'Bayern'),
	(82, 88, 'DE', 'BER', 'Berlin'),
	(83, 88, 'DE', 'BRG', 'Brandenburg'),
	(84, 88, 'DE', 'BRE', 'Bremen'),
	(85, 88, 'DE', 'HAM', 'Hamburg'),
	(86, 88, 'DE', 'HES', 'Hessen'),
	(87, 88, 'DE', 'MEC', 'Mecklenburg-Vorpommern'),
	(88, 88, 'DE', 'NRW', 'Nordrhein-Westfalen'),
	(89, 88, 'DE', 'RHE', 'Rheinland-Pfalz'),
	(90, 88, 'DE', 'SAR', 'Saarland'),
	(91, 88, 'DE', 'SAS', 'Sachsen'),
	(92, 88, 'DE', 'SAC', 'Sachsen-Anhalt'),
	(93, 88, 'DE', 'SCN', 'Schleswig-Holstein'),
	(94, 88, 'DE', 'THE', 'Thüringen'),
	(95, 16, 'AT', 'WI', 'Wien'),
	(96, 16, 'AT', 'NO', 'Niederösterreich'),
	(97, 16, 'AT', 'OO', 'Oberösterreich'),
	(98, 16, 'AT', 'SB', 'Salzburg'),
	(99, 16, 'AT', 'KN', 'Kärnten'),
	(100, 16, 'AT', 'ST', 'Steiermark'),
	(101, 16, 'AT', 'TI', 'Tirol'),
	(102, 16, 'AT', 'BL', 'Burgenland'),
	(103, 16, 'AT', 'VB', 'Vorarlberg'),
	(104, 220, 'CH', 'AG', 'Aargau'),
	(105, 220, 'CH', 'AI', 'Appenzell Innerrhoden'),
	(106, 220, 'CH', 'AR', 'Appenzell Ausserrhoden'),
	(107, 220, 'CH', 'BE', 'Bern'),
	(108, 220, 'CH', 'BL', 'Basel-Landschaft'),
	(109, 220, 'CH', 'BS', 'Basel-Stadt'),
	(110, 220, 'CH', 'FR', 'Freiburg'),
	(111, 220, 'CH', 'GE', 'Genf'),
	(112, 220, 'CH', 'GL', 'Glarus'),
	(113, 220, 'CH', 'GR', 'Graubünden'),
	(114, 220, 'CH', 'JU', 'Jura'),
	(115, 220, 'CH', 'LU', 'Luzern'),
	(116, 220, 'CH', 'NE', 'Neuenburg'),
	(117, 220, 'CH', 'NW', 'Nidwalden'),
	(118, 220, 'CH', 'OW', 'Obwalden'),
	(119, 220, 'CH', 'SG', 'St. Gallen'),
	(120, 220, 'CH', 'SH', 'Schaffhausen'),
	(121, 220, 'CH', 'SO', 'Solothurn'),
	(122, 220, 'CH', 'SZ', 'Schwyz'),
	(123, 220, 'CH', 'TG', 'Thurgau'),
	(124, 220, 'CH', 'TI', 'Tessin'),
	(125, 220, 'CH', 'UR', 'Uri'),
	(126, 220, 'CH', 'VD', 'Waadt'),
	(127, 220, 'CH', 'VS', 'Wallis'),
	(128, 220, 'CH', 'ZG', 'Zug'),
	(129, 220, 'CH', 'ZH', 'Zürich'),
	(130, 206, 'ES', 'A Coruсa', 'A Coruña'),
	(131, 206, 'ES', 'Alava', 'Alava'),
	(132, 206, 'ES', 'Albacete', 'Albacete'),
	(133, 206, 'ES', 'Alicante', 'Alicante'),
	(134, 206, 'ES', 'Almeria', 'Almeria'),
	(135, 206, 'ES', 'Asturias', 'Asturias'),
	(136, 206, 'ES', 'Avila', 'Avila'),
	(137, 206, 'ES', 'Badajoz', 'Badajoz'),
	(138, 206, 'ES', 'Baleares', 'Baleares'),
	(139, 206, 'ES', 'Barcelona', 'Barcelona'),
	(140, 206, 'ES', 'Burgos', 'Burgos'),
	(141, 206, 'ES', 'Caceres', 'Caceres'),
	(142, 206, 'ES', 'Cadiz', 'Cadiz'),
	(143, 206, 'ES', 'Cantabria', 'Cantabria'),
	(144, 206, 'ES', 'Castellon', 'Castellon'),
	(145, 206, 'ES', 'Ceuta', 'Ceuta'),
	(146, 206, 'ES', 'Ciudad Real', 'Ciudad Real'),
	(147, 206, 'ES', 'Cordoba', 'Cordoba'),
	(148, 206, 'ES', 'Cuenca', 'Cuenca'),
	(149, 206, 'ES', 'Girona', 'Girona'),
	(150, 206, 'ES', 'Granada', 'Granada'),
	(151, 206, 'ES', 'Guadalajara', 'Guadalajara'),
	(152, 206, 'ES', 'Guipuzcoa', 'Guipuzcoa'),
	(153, 206, 'ES', 'Huelva', 'Huelva'),
	(154, 206, 'ES', 'Huesca', 'Huesca'),
	(155, 206, 'ES', 'Jaen', 'Jaen'),
	(156, 206, 'ES', 'La Rioja', 'La Rioja'),
	(157, 206, 'ES', 'Las Palmas', 'Las Palmas'),
	(158, 206, 'ES', 'Leon', 'Leon'),
	(159, 206, 'ES', 'Lleida', 'Lleida'),
	(160, 206, 'ES', 'Lugo', 'Lugo'),
	(161, 206, 'ES', 'Madrid', 'Madrid'),
	(162, 206, 'ES', 'Malaga', 'Malaga'),
	(163, 206, 'ES', 'Melilla', 'Melilla'),
	(164, 206, 'ES', 'Murcia', 'Murcia'),
	(165, 206, 'ES', 'Navarra', 'Navarra'),
	(166, 206, 'ES', 'Ourense', 'Ourense'),
	(167, 206, 'ES', 'Palencia', 'Palencia'),
	(168, 206, 'ES', 'Pontevedra', 'Pontevedra'),
	(169, 206, 'ES', 'Salamanca', 'Salamanca'),
	(170, 206, 'ES', 'Santa Cruz de Tenerife', 'Santa Cruz de Tenerife'),
	(171, 206, 'ES', 'Segovia', 'Segovia'),
	(172, 206, 'ES', 'Sevilla', 'Sevilla'),
	(173, 206, 'ES', 'Soria', 'Soria'),
	(174, 206, 'ES', 'Tarragona', 'Tarragona'),
	(175, 206, 'ES', 'Teruel', 'Teruel'),
	(176, 206, 'ES', 'Toledo', 'Toledo'),
	(177, 206, 'ES', 'Valencia', 'Valencia'),
	(178, 206, 'ES', 'Valladolid', 'Valladolid'),
	(179, 206, 'ES', 'Vizcaya', 'Vizcaya'),
	(180, 206, 'ES', 'Zamora', 'Zamora'),
	(181, 206, 'ES', 'Zaragoza', 'Zaragoza'),
	(182, 81, 'FR', '1', 'Ain'),
	(183, 81, 'FR', '2', 'Aisne'),
	(184, 81, 'FR', '3', 'Allier'),
	(185, 81, 'FR', '4', 'Alpes-de-Haute-Provence'),
	(186, 81, 'FR', '5', 'Hautes-Alpes'),
	(187, 81, 'FR', '6', 'Alpes-Maritimes'),
	(188, 81, 'FR', '7', 'Ardèche'),
	(189, 81, 'FR', '8', 'Ardennes'),
	(190, 81, 'FR', '9', 'Ariège'),
	(191, 81, 'FR', '10', 'Aube'),
	(192, 81, 'FR', '11', 'Aude'),
	(193, 81, 'FR', '12', 'Aveyron'),
	(194, 81, 'FR', '13', 'Bouches-du-Rhône'),
	(195, 81, 'FR', '14', 'Calvados'),
	(196, 81, 'FR', '15', 'Cantal'),
	(197, 81, 'FR', '16', 'Charente'),
	(198, 81, 'FR', '17', 'Charente-Maritime'),
	(199, 81, 'FR', '18', 'Cher'),
	(200, 81, 'FR', '19', 'Corrèze'),
	(201, 81, 'FR', '2A', 'Corse-du-Sud'),
	(202, 81, 'FR', '2B', 'Haute-Corse'),
	(203, 81, 'FR', '21', 'Côte-d\'Or'),
	(204, 81, 'FR', '22', 'Côtes-d\'Armor'),
	(205, 81, 'FR', '23', 'Creuse'),
	(206, 81, 'FR', '24', 'Dordogne'),
	(207, 81, 'FR', '25', 'Doubs'),
	(208, 81, 'FR', '26', 'Drôme'),
	(209, 81, 'FR', '27', 'Eure'),
	(210, 81, 'FR', '28', 'Eure-et-Loir'),
	(211, 81, 'FR', '29', 'Finistère'),
	(212, 81, 'FR', '30', 'Gard'),
	(213, 81, 'FR', '31', 'Haute-Garonne'),
	(214, 81, 'FR', '32', 'Gers'),
	(215, 81, 'FR', '33', 'Gironde'),
	(216, 81, 'FR', '34', 'Hérault'),
	(217, 81, 'FR', '35', 'Ille-et-Vilaine'),
	(218, 81, 'FR', '36', 'Indre'),
	(219, 81, 'FR', '37', 'Indre-et-Loire'),
	(220, 81, 'FR', '38', 'Isère'),
	(221, 81, 'FR', '39', 'Jura'),
	(222, 81, 'FR', '40', 'Landes'),
	(223, 81, 'FR', '41', 'Loir-et-Cher'),
	(224, 81, 'FR', '42', 'Loire'),
	(225, 81, 'FR', '43', 'Haute-Loire'),
	(226, 81, 'FR', '44', 'Loire-Atlantique'),
	(227, 81, 'FR', '45', 'Loiret'),
	(228, 81, 'FR', '46', 'Lot'),
	(229, 81, 'FR', '47', 'Lot-et-Garonne'),
	(230, 81, 'FR', '48', 'Lozère'),
	(231, 81, 'FR', '49', 'Maine-et-Loire'),
	(232, 81, 'FR', '50', 'Manche'),
	(233, 81, 'FR', '51', 'Marne'),
	(234, 81, 'FR', '52', 'Haute-Marne'),
	(235, 81, 'FR', '53', 'Mayenne'),
	(236, 81, 'FR', '54', 'Meurthe-et-Moselle'),
	(237, 81, 'FR', '55', 'Meuse'),
	(238, 81, 'FR', '56', 'Morbihan'),
	(239, 81, 'FR', '57', 'Moselle'),
	(240, 81, 'FR', '58', 'Nièvre'),
	(241, 81, 'FR', '59', 'Nord'),
	(242, 81, 'FR', '60', 'Oise'),
	(243, 81, 'FR', '61', 'Orne'),
	(244, 81, 'FR', '62', 'Pas-de-Calais'),
	(245, 81, 'FR', '63', 'Puy-de-Dôme'),
	(246, 81, 'FR', '64', 'Pyrénées-Atlantiques'),
	(247, 81, 'FR', '65', 'Hautes-Pyrénées'),
	(248, 81, 'FR', '66', 'Pyrénées-Orientales'),
	(249, 81, 'FR', '67', 'Bas-Rhin'),
	(250, 81, 'FR', '68', 'Haut-Rhin'),
	(251, 81, 'FR', '69', 'Rhône'),
	(252, 81, 'FR', '70', 'Haute-Saône'),
	(253, 81, 'FR', '71', 'Saône-et-Loire'),
	(254, 81, 'FR', '72', 'Sarthe'),
	(255, 81, 'FR', '73', 'Savoie'),
	(256, 81, 'FR', '74', 'Haute-Savoie'),
	(257, 81, 'FR', '75', 'Paris'),
	(258, 81, 'FR', '76', 'Seine-Maritime'),
	(259, 81, 'FR', '77', 'Seine-et-Marne'),
	(260, 81, 'FR', '78', 'Yvelines'),
	(261, 81, 'FR', '79', 'Deux-Sèvres'),
	(262, 81, 'FR', '80', 'Somme'),
	(263, 81, 'FR', '81', 'Tarn'),
	(264, 81, 'FR', '82', 'Tarn-et-Garonne'),
	(265, 81, 'FR', '83', 'Var'),
	(266, 81, 'FR', '84', 'Vaucluse'),
	(267, 81, 'FR', '85', 'Vendée'),
	(268, 81, 'FR', '86', 'Vienne'),
	(269, 81, 'FR', '87', 'Haute-Vienne'),
	(270, 81, 'FR', '88', 'Vosges'),
	(271, 81, 'FR', '89', 'Yonne'),
	(272, 81, 'FR', '90', 'Territoire-de-Belfort'),
	(273, 81, 'FR', '91', 'Essonne'),
	(274, 81, 'FR', '92', 'Hauts-de-Seine'),
	(275, 81, 'FR', '93', 'Seine-Saint-Denis'),
	(276, 81, 'FR', '94', 'Val-de-Marne'),
	(277, 81, 'FR', '95', 'Val-d\'Oise'),
	(278, 185, 'RO', 'AB', 'Alba'),
	(279, 185, 'RO', 'AR', 'Arad'),
	(280, 185, 'RO', 'AG', 'Argeş'),
	(281, 185, 'RO', 'BC', 'Bacău'),
	(282, 185, 'RO', 'BH', 'Bihor'),
	(283, 185, 'RO', 'BN', 'Bistriţa-Năsăud'),
	(284, 185, 'RO', 'BT', 'Botoşani'),
	(285, 185, 'RO', 'BV', 'Braşov'),
	(286, 185, 'RO', 'BR', 'Brăila'),
	(287, 185, 'RO', 'B', 'Bucureşti'),
	(288, 185, 'RO', 'BZ', 'Buzău'),
	(289, 185, 'RO', 'CS', 'Caraş-Severin'),
	(290, 185, 'RO', 'CL', 'Călăraşi'),
	(291, 185, 'RO', 'CJ', 'Cluj'),
	(292, 185, 'RO', 'CT', 'Constanţa'),
	(293, 185, 'RO', 'CV', 'Covasna'),
	(294, 185, 'RO', 'DB', 'Dâmboviţa'),
	(295, 185, 'RO', 'DJ', 'Dolj'),
	(296, 185, 'RO', 'GL', 'Galaţi'),
	(297, 185, 'RO', 'GR', 'Giurgiu'),
	(298, 185, 'RO', 'GJ', 'Gorj'),
	(299, 185, 'RO', 'HR', 'Harghita'),
	(300, 185, 'RO', 'HD', 'Hunedoara'),
	(301, 185, 'RO', 'IL', 'Ialomiţa'),
	(302, 185, 'RO', 'IS', 'Iaşi'),
	(303, 185, 'RO', 'IF', 'Ilfov'),
	(304, 185, 'RO', 'MM', 'Maramureş'),
	(305, 185, 'RO', 'MH', 'Mehedinţi'),
	(306, 185, 'RO', 'MS', 'Mureş'),
	(307, 185, 'RO', 'NT', 'Neamţ'),
	(308, 185, 'RO', 'OT', 'Olt'),
	(309, 185, 'RO', 'PH', 'Prahova'),
	(310, 185, 'RO', 'SM', 'Satu-Mare'),
	(311, 185, 'RO', 'SJ', 'Sălaj'),
	(312, 185, 'RO', 'SB', 'Sibiu'),
	(313, 185, 'RO', 'SV', 'Suceava'),
	(314, 185, 'RO', 'TR', 'Teleorman'),
	(315, 185, 'RO', 'TM', 'Timiş'),
	(316, 185, 'RO', 'TL', 'Tulcea'),
	(317, 185, 'RO', 'VS', 'Vaslui'),
	(318, 185, 'RO', 'VL', 'Vâlcea'),
	(319, 185, 'RO', 'VN', 'Vrancea'),
	(320, 80, 'FI', 'Lappi', 'Lappi'),
	(321, 80, 'FI', 'Pohjois-Pohjanmaa', 'Pohjois-Pohjanmaa'),
	(322, 80, 'FI', 'Kainuu', 'Kainuu'),
	(323, 80, 'FI', 'Pohjois-Karjala', 'Pohjois-Karjala'),
	(324, 80, 'FI', 'Pohjois-Savo', 'Pohjois-Savo'),
	(325, 80, 'FI', 'Etelä-Savo', 'Etelä-Savo'),
	(326, 80, 'FI', 'Etelä-Pohjanmaa', 'Etelä-Pohjanmaa'),
	(327, 80, 'FI', 'Pohjanmaa', 'Pohjanmaa'),
	(328, 80, 'FI', 'Pirkanmaa', 'Pirkanmaa'),
	(329, 80, 'FI', 'Satakunta', 'Satakunta'),
	(330, 80, 'FI', 'Keski-Pohjanmaa', 'Keski-Pohjanmaa'),
	(331, 80, 'FI', 'Keski-Suomi', 'Keski-Suomi'),
	(332, 80, 'FI', 'Varsinais-Suomi', 'Varsinais-Suomi'),
	(333, 80, 'FI', 'Etelä-Karjala', 'Etelä-Karjala'),
	(334, 80, 'FI', 'Päijät-Häme', 'Päijät-Häme'),
	(335, 80, 'FI', 'Kanta-Häme', 'Kanta-Häme'),
	(336, 80, 'FI', 'Uusimaa', 'Uusimaa'),
	(337, 80, 'FI', 'Itä-Uusimaa', 'Itä-Uusimaa'),
	(338, 80, 'FI', 'Kymenlaakso', 'Kymenlaakso'),
	(339, 80, 'FI', 'Ahvenanmaa', 'Ahvenanmaa'),
	(340, 74, 'EE', 'EE-37', 'Harjumaa'),
	(341, 74, 'EE', 'EE-39', 'Hiiumaa'),
	(342, 74, 'EE', 'EE-44', 'Ida-Virumaa'),
	(343, 74, 'EE', 'EE-49', 'Jõgevamaa'),
	(344, 74, 'EE', 'EE-51', 'Järvamaa'),
	(345, 74, 'EE', 'EE-57', 'Läänemaa'),
	(346, 74, 'EE', 'EE-59', 'Lääne-Virumaa'),
	(347, 74, 'EE', 'EE-65', 'Põlvamaa'),
	(348, 74, 'EE', 'EE-67', 'Pärnumaa'),
	(349, 74, 'EE', 'EE-70', 'Raplamaa'),
	(350, 74, 'EE', 'EE-74', 'Saaremaa'),
	(351, 74, 'EE', 'EE-78', 'Tartumaa'),
	(352, 74, 'EE', 'EE-82', 'Valgamaa'),
	(353, 74, 'EE', 'EE-84', 'Viljandimaa'),
	(354, 74, 'EE', 'EE-86', 'Võrumaa'),
	(355, 125, 'LV', 'LV-DGV', 'Daugavpils'),
	(356, 125, 'LV', 'LV-JEL', 'Jelgava'),
	(357, 125, 'LV', 'Jēkabpils', 'Jēkabpils'),
	(358, 125, 'LV', 'LV-JUR', 'Jūrmala'),
	(359, 125, 'LV', 'LV-LPX', 'Liepāja'),
	(360, 125, 'LV', 'LV-LE', 'Liepājas novads'),
	(361, 125, 'LV', 'LV-REZ', 'Rēzekne'),
	(362, 125, 'LV', 'LV-RIX', 'Rīga'),
	(363, 125, 'LV', 'LV-RI', 'Rīgas novads'),
	(364, 125, 'LV', 'Valmiera', 'Valmiera'),
	(365, 125, 'LV', 'LV-VEN', 'Ventspils'),
	(366, 125, 'LV', 'Aglonas novads', 'Aglonas novads'),
	(367, 125, 'LV', 'LV-AI', 'Aizkraukles novads'),
	(368, 125, 'LV', 'Aizputes novads', 'Aizputes novads'),
	(369, 125, 'LV', 'Aknīstes novads', 'Aknīstes novads'),
	(370, 125, 'LV', 'Alojas novads', 'Alojas novads'),
	(371, 125, 'LV', 'Alsungas novads', 'Alsungas novads'),
	(372, 125, 'LV', 'LV-AL', 'Alūksnes novads'),
	(373, 125, 'LV', 'Amatas novads', 'Amatas novads'),
	(374, 125, 'LV', 'Apes novads', 'Apes novads'),
	(375, 125, 'LV', 'Auces novads', 'Auces novads'),
	(376, 125, 'LV', 'Babītes novads', 'Babītes novads'),
	(377, 125, 'LV', 'Baldones novads', 'Baldones novads'),
	(378, 125, 'LV', 'Baltinavas novads', 'Baltinavas novads'),
	(379, 125, 'LV', 'LV-BL', 'Balvu novads'),
	(380, 125, 'LV', 'LV-BU', 'Bauskas novads'),
	(381, 125, 'LV', 'Beverīnas novads', 'Beverīnas novads'),
	(382, 125, 'LV', 'Brocēnu novads', 'Brocēnu novads'),
	(383, 125, 'LV', 'Burtnieku novads', 'Burtnieku novads'),
	(384, 125, 'LV', 'Carnikavas novads', 'Carnikavas novads'),
	(385, 125, 'LV', 'Cesvaines novads', 'Cesvaines novads'),
	(386, 125, 'LV', 'Ciblas novads', 'Ciblas novads'),
	(387, 125, 'LV', 'LV-CE', 'Cēsu novads'),
	(388, 125, 'LV', 'Dagdas novads', 'Dagdas novads'),
	(389, 125, 'LV', 'LV-DA', 'Daugavpils novads'),
	(390, 125, 'LV', 'LV-DO', 'Dobeles novads'),
	(391, 125, 'LV', 'Dundagas novads', 'Dundagas novads'),
	(392, 125, 'LV', 'Durbes novads', 'Durbes novads'),
	(393, 125, 'LV', 'Engures novads', 'Engures novads'),
	(394, 125, 'LV', 'Garkalnes novads', 'Garkalnes novads'),
	(395, 125, 'LV', 'Grobiņas novads', 'Grobiņas novads'),
	(396, 125, 'LV', 'LV-GU', 'Gulbenes novads'),
	(397, 125, 'LV', 'Iecavas novads', 'Iecavas novads'),
	(398, 125, 'LV', 'Ikšķiles novads', 'Ikšķiles novads'),
	(399, 125, 'LV', 'Ilūkstes novads', 'Ilūkstes novads'),
	(400, 125, 'LV', 'Inčukalna novads', 'Inčukalna novads'),
	(401, 125, 'LV', 'Jaunjelgavas novads', 'Jaunjelgavas novads'),
	(402, 125, 'LV', 'Jaunpiebalgas novads', 'Jaunpiebalgas novads'),
	(403, 125, 'LV', 'Jaunpils novads', 'Jaunpils novads'),
	(404, 125, 'LV', 'LV-JL', 'Jelgavas novads'),
	(405, 125, 'LV', 'LV-JK', 'Jēkabpils novads'),
	(406, 125, 'LV', 'Kandavas novads', 'Kandavas novads'),
	(407, 125, 'LV', 'Kokneses novads', 'Kokneses novads'),
	(408, 125, 'LV', 'Krimuldas novads', 'Krimuldas novads'),
	(409, 125, 'LV', 'Krustpils novads', 'Krustpils novads'),
	(410, 125, 'LV', 'LV-KR', 'Krāslavas novads'),
	(411, 125, 'LV', 'LV-KU', 'Kuldīgas novads'),
	(412, 125, 'LV', 'Kārsavas novads', 'Kārsavas novads'),
	(413, 125, 'LV', 'Lielvārdes novads', 'Lielvārdes novads'),
	(414, 125, 'LV', 'LV-LM', 'Limbažu novads'),
	(415, 125, 'LV', 'Lubānas novads', 'Lubānas novads'),
	(416, 125, 'LV', 'LV-LU', 'Ludzas novads'),
	(417, 125, 'LV', 'Līgatnes novads', 'Līgatnes novads'),
	(418, 125, 'LV', 'Līvānu novads', 'Līvānu novads'),
	(419, 125, 'LV', 'LV-MA', 'Madonas novads'),
	(420, 125, 'LV', 'Mazsalacas novads', 'Mazsalacas novads'),
	(421, 125, 'LV', 'Mālpils novads', 'Mālpils novads'),
	(422, 125, 'LV', 'Mārupes novads', 'Mārupes novads'),
	(423, 125, 'LV', 'Naukšēnu novads', 'Naukšēnu novads'),
	(424, 125, 'LV', 'Neretas novads', 'Neretas novads'),
	(425, 125, 'LV', 'Nīcas novads', 'Nīcas novads'),
	(426, 125, 'LV', 'LV-OG', 'Ogres novads'),
	(427, 125, 'LV', 'Olaines novads', 'Olaines novads'),
	(428, 125, 'LV', 'Ozolnieku novads', 'Ozolnieku novads'),
	(429, 125, 'LV', 'LV-PR', 'Preiļu novads'),
	(430, 125, 'LV', 'Priekules novads', 'Priekules novads'),
	(431, 125, 'LV', 'Priekuļu novads', 'Priekuļu novads'),
	(432, 125, 'LV', 'Pārgaujas novads', 'Pārgaujas novads'),
	(433, 125, 'LV', 'Pāvilostas novads', 'Pāvilostas novads'),
	(434, 125, 'LV', 'Pļaviņu novads', 'Pļaviņu novads'),
	(435, 125, 'LV', 'Raunas novads', 'Raunas novads'),
	(436, 125, 'LV', 'Riebiņu novads', 'Riebiņu novads'),
	(437, 125, 'LV', 'Rojas novads', 'Rojas novads'),
	(438, 125, 'LV', 'Ropažu novads', 'Ropažu novads'),
	(439, 125, 'LV', 'Rucavas novads', 'Rucavas novads'),
	(440, 125, 'LV', 'Rugāju novads', 'Rugāju novads'),
	(441, 125, 'LV', 'Rundāles novads', 'Rundāles novads'),
	(442, 125, 'LV', 'LV-RE', 'Rēzeknes novads'),
	(443, 125, 'LV', 'Rūjienas novads', 'Rūjienas novads'),
	(444, 125, 'LV', 'Salacgrīvas novads', 'Salacgrīvas novads'),
	(445, 125, 'LV', 'Salas novads', 'Salas novads'),
	(446, 125, 'LV', 'Salaspils novads', 'Salaspils novads'),
	(447, 125, 'LV', 'LV-SA', 'Saldus novads'),
	(448, 125, 'LV', 'Saulkrastu novads', 'Saulkrastu novads'),
	(449, 125, 'LV', 'Siguldas novads', 'Siguldas novads'),
	(450, 125, 'LV', 'Skrundas novads', 'Skrundas novads'),
	(451, 125, 'LV', 'Skrīveru novads', 'Skrīveru novads'),
	(452, 125, 'LV', 'Smiltenes novads', 'Smiltenes novads'),
	(453, 125, 'LV', 'Stopiņu novads', 'Stopiņu novads'),
	(454, 125, 'LV', 'Strenču novads', 'Strenču novads'),
	(455, 125, 'LV', 'Sējas novads', 'Sējas novads'),
	(456, 125, 'LV', 'LV-TA', 'Talsu novads'),
	(457, 125, 'LV', 'LV-TU', 'Tukuma novads'),
	(458, 125, 'LV', 'Tērvetes novads', 'Tērvetes novads'),
	(459, 125, 'LV', 'Vaiņodes novads', 'Vaiņodes novads'),
	(460, 125, 'LV', 'LV-VK', 'Valkas novads'),
	(461, 125, 'LV', 'LV-VM', 'Valmieras novads'),
	(462, 125, 'LV', 'Varakļānu novads', 'Varakļānu novads'),
	(463, 125, 'LV', 'Vecpiebalgas novads', 'Vecpiebalgas novads'),
	(464, 125, 'LV', 'Vecumnieku novads', 'Vecumnieku novads'),
	(465, 125, 'LV', 'LV-VE', 'Ventspils novads'),
	(466, 125, 'LV', 'Viesītes novads', 'Viesītes novads'),
	(467, 125, 'LV', 'Viļakas novads', 'Viļakas novads'),
	(468, 125, 'LV', 'Viļānu novads', 'Viļānu novads'),
	(469, 125, 'LV', 'Vārkavas novads', 'Vārkavas novads'),
	(470, 125, 'LV', 'Zilupes novads', 'Zilupes novads'),
	(471, 125, 'LV', 'Ādažu novads', 'Ādažu novads'),
	(472, 125, 'LV', 'Ērgļu novads', 'Ērgļu novads'),
	(473, 125, 'LV', 'Ķeguma novads', 'Ķeguma novads'),
	(474, 125, 'LV', 'Ķekavas novads', 'Ķekavas novads'),
	(475, 131, 'LT', 'LT-AL', 'Alytaus Apskritis'),
	(476, 131, 'LT', 'LT-KU', 'Kauno Apskritis'),
	(477, 131, 'LT', 'LT-KL', 'Klaipėdos Apskritis'),
	(478, 131, 'LT', 'LT-MR', 'Marijampolės Apskritis'),
	(479, 131, 'LT', 'LT-PN', 'Panevėžio Apskritis'),
	(480, 131, 'LT', 'LT-SA', 'Šiaulių Apskritis'),
	(481, 131, 'LT', 'LT-TA', 'Tauragės Apskritis'),
	(482, 131, 'LT', 'LT-TE', 'Telšių Apskritis'),
	(483, 131, 'LT', 'LT-UT', 'Utenos Apskritis'),
	(484, 131, 'LT', 'LT-VL', 'Vilniaus Apskritis'),
	(485, 31, 'BR', 'AC', 'Acre'),
	(486, 31, 'BR', 'AL', 'Alagoas'),
	(487, 31, 'BR', 'AP', 'Amapá'),
	(488, 31, 'BR', 'AM', 'Amazonas'),
	(489, 31, 'BR', 'BA', 'Bahia'),
	(490, 31, 'BR', 'CE', 'Ceará'),
	(491, 31, 'BR', 'ES', 'Espírito Santo'),
	(492, 31, 'BR', 'GO', 'Goiás'),
	(493, 31, 'BR', 'MA', 'Maranhão'),
	(494, 31, 'BR', 'MT', 'Mato Grosso'),
	(495, 31, 'BR', 'MS', 'Mato Grosso do Sul'),
	(496, 31, 'BR', 'MG', 'Minas Gerais'),
	(497, 31, 'BR', 'PA', 'Pará'),
	(498, 31, 'BR', 'PB', 'Paraíba'),
	(499, 31, 'BR', 'PR', 'Paraná'),
	(500, 31, 'BR', 'PE', 'Pernambuco'),
	(501, 31, 'BR', 'PI', 'Piauí'),
	(502, 31, 'BR', 'RJ', 'Rio de Janeiro'),
	(503, 31, 'BR', 'RN', 'Rio Grande do Norte'),
	(504, 31, 'BR', 'RS', 'Rio Grande do Sul'),
	(505, 31, 'BR', 'RO', 'Rondônia'),
	(506, 31, 'BR', 'RR', 'Roraima'),
	(507, 31, 'BR', 'SC', 'Santa Catarina'),
	(508, 31, 'BR', 'SP', 'São Paulo'),
	(509, 31, 'BR', 'SE', 'Sergipe'),
	(510, 31, 'BR', 'TO', 'Tocantins'),
	(511, 31, 'BR', 'DF', 'Distrito Federal'),
	(512, 59, 'HR', 'HR-01', 'Zagrebačka županija'),
	(513, 59, 'HR', 'HR-02', 'Krapinsko-zagorska županija'),
	(514, 59, 'HR', 'HR-03', 'Sisačko-moslavačka županija'),
	(515, 59, 'HR', 'HR-04', 'Karlovačka županija'),
	(516, 59, 'HR', 'HR-05', 'Varaždinska županija'),
	(517, 59, 'HR', 'HR-06', 'Koprivničko-križevačka županija'),
	(518, 59, 'HR', 'HR-07', 'Bjelovarsko-bilogorska županija'),
	(519, 59, 'HR', 'HR-08', 'Primorsko-goranska županija'),
	(520, 59, 'HR', 'HR-09', 'Ličko-senjska županija'),
	(521, 59, 'HR', 'HR-10', 'Virovitičko-podravska županija'),
	(522, 59, 'HR', 'HR-11', 'Požeško-slavonska županija'),
	(523, 59, 'HR', 'HR-12', 'Brodsko-posavska županija'),
	(524, 59, 'HR', 'HR-13', 'Zadarska županija'),
	(525, 59, 'HR', 'HR-14', 'Osječko-baranjska županija'),
	(526, 59, 'HR', 'HR-15', 'Šibensko-kninska županija'),
	(527, 59, 'HR', 'HR-16', 'Vukovarsko-srijemska županija'),
	(528, 59, 'HR', 'HR-17', 'Splitsko-dalmatinska županija'),
	(529, 59, 'HR', 'HR-18', 'Istarska županija'),
	(530, 59, 'HR', 'HR-19', 'Dubrovačko-neretvanska županija'),
	(531, 59, 'HR', 'HR-20', 'Međimurska županija'),
	(532, 59, 'HR', 'HR-21', 'Grad Zagreb'),
	(533, 106, 'IN', 'AN', 'Andaman and Nicobar Islands'),
	(534, 106, 'IN', 'AP', 'Andhra Pradesh'),
	(535, 106, 'IN', 'AR', 'Arunachal Pradesh'),
	(536, 106, 'IN', 'AS', 'Assam'),
	(537, 106, 'IN', 'BR', 'Bihar'),
	(538, 106, 'IN', 'CH', 'Chandigarh'),
	(539, 106, 'IN', 'CT', 'Chhattisgarh'),
	(540, 106, 'IN', 'DN', 'Dadra and Nagar Haveli'),
	(541, 106, 'IN', 'DD', 'Daman and Diu'),
	(542, 106, 'IN', 'DL', 'Delhi'),
	(543, 106, 'IN', 'GA', 'Goa'),
	(544, 106, 'IN', 'GJ', 'Gujarat'),
	(545, 106, 'IN', 'HR', 'Haryana'),
	(546, 106, 'IN', 'HP', 'Himachal Pradesh'),
	(547, 106, 'IN', 'JK', 'Jammu and Kashmir'),
	(548, 106, 'IN', 'JH', 'Jharkhand'),
	(549, 106, 'IN', 'KA', 'Karnataka'),
	(550, 106, 'IN', 'KL', 'Kerala'),
	(551, 106, 'IN', 'LD', 'Lakshadweep'),
	(552, 106, 'IN', 'MP', 'Madhya Pradesh'),
	(553, 106, 'IN', 'MH', 'Maharashtra'),
	(554, 106, 'IN', 'MN', 'Manipur'),
	(555, 106, 'IN', 'ML', 'Meghalaya'),
	(556, 106, 'IN', 'MZ', 'Mizoram'),
	(557, 106, 'IN', 'NL', 'Nagaland'),
	(558, 106, 'IN', 'OR', 'Odisha'),
	(559, 106, 'IN', 'PY', 'Puducherry'),
	(560, 106, 'IN', 'PB', 'Punjab'),
	(561, 106, 'IN', 'RJ', 'Rajasthan'),
	(562, 106, 'IN', 'SK', 'Sikkim'),
	(563, 106, 'IN', 'TN', 'Tamil Nadu'),
	(564, 106, 'IN', 'TG', 'Telangana'),
	(565, 106, 'IN', 'TR', 'Tripura'),
	(566, 106, 'IN', 'UP', 'Uttar Pradesh'),
	(567, 106, 'IN', 'UT', 'Uttarakhand'),
	(568, 106, 'IN', 'WB', 'West Bengal'),
	(569, 176, 'PY', 'PY-16', 'Alto Paraguay'),
	(570, 176, 'PY', 'PY-10', 'Alto Paraná'),
	(571, 176, 'PY', 'PY-13', 'Amambay'),
	(572, 176, 'PY', 'PY-ASU', 'Asunción'),
	(573, 176, 'PY', 'PY-19', 'Boquerón'),
	(574, 176, 'PY', 'PY-5', 'Caaguazú'),
	(575, 176, 'PY', 'PY-6', 'Caazapá'),
	(576, 176, 'PY', 'PY-14', 'Canindeyú'),
	(577, 176, 'PY', 'PY-11', 'Central'),
	(578, 176, 'PY', 'PY-1', 'Concepción'),
	(579, 176, 'PY', 'PY-3', 'Cordillera'),
	(580, 176, 'PY', 'PY-4', 'Guairá'),
	(581, 176, 'PY', 'PY-7', 'Itapúa'),
	(582, 176, 'PY', 'PY-8', 'Misiones'),
	(583, 176, 'PY', 'PY-9', 'Paraguarí'),
	(584, 176, 'PY', 'PY-15', 'Presidente Hayes'),
	(585, 176, 'PY', 'PY-2', 'San Pedro'),
	(586, 176, 'PY', 'PY-12', 'Ñeembucú');

-- Dumping structure for table bagisto_db.country_state_translations
CREATE TABLE IF NOT EXISTS `country_state_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `country_state_id` int unsigned NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `country_state_translations_country_state_id_foreign` (`country_state_id`),
  CONSTRAINT `country_state_translations_country_state_id_foreign` FOREIGN KEY (`country_state_id`) REFERENCES `country_states` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.country_state_translations: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.country_translations
CREATE TABLE IF NOT EXISTS `country_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int unsigned NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `country_translations_country_id_foreign` (`country_id`),
  CONSTRAINT `country_translations_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.country_translations: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.currencies
CREATE TABLE IF NOT EXISTS `currencies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `decimal` int unsigned NOT NULL DEFAULT '2',
  `group_separator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ',',
  `decimal_separator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '.',
  `currency_position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.currencies: ~2 rows (approximately)
INSERT INTO `currencies` (`id`, `code`, `name`, `symbol`, `decimal`, `group_separator`, `decimal_separator`, `currency_position`, `created_at`, `updated_at`) VALUES
	(1, 'USD', 'United States Dollar', '$', 2, ',', '.', NULL, NULL, NULL),
	(2, 'VND', 'Vietnamese Dong', 'đ', 0, '', '', '', '2026-09-29 06:27:20', '2026-09-29 06:27:20');

-- Dumping structure for table bagisto_db.currency_exchange_rates
CREATE TABLE IF NOT EXISTS `currency_exchange_rates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rate` decimal(24,12) NOT NULL,
  `target_currency` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `currency_exchange_rates_target_currency_unique` (`target_currency`),
  CONSTRAINT `currency_exchange_rates_target_currency_foreign` FOREIGN KEY (`target_currency`) REFERENCES `currencies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.currency_exchange_rates: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.customers
CREATE TABLE IF NOT EXISTS `customers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_group_id` int unsigned DEFAULT NULL,
  `channel_id` int unsigned DEFAULT NULL,
  `subscribed_to_news_letter` tinyint(1) NOT NULL DEFAULT '0',
  `is_verified` tinyint(1) NOT NULL DEFAULT '0',
  `is_suspended` tinyint unsigned NOT NULL DEFAULT '0',
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customers_phone_unique` (`phone`),
  UNIQUE KEY `customers_api_token_unique` (`api_token`),
  UNIQUE KEY `customers_email_channel_unique` (`email`,`channel_id`),
  KEY `customers_customer_group_id_foreign` (`customer_group_id`),
  KEY `customers_channel_id_foreign` (`channel_id`),
  CONSTRAINT `customers_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE SET NULL,
  CONSTRAINT `customers_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.customers: ~6 rows (approximately)
INSERT INTO `customers` (`id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `email`, `phone`, `image`, `status`, `password`, `api_token`, `customer_group_id`, `channel_id`, `subscribed_to_news_letter`, `is_verified`, `is_suspended`, `token`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Nguyen', 'Hung', NULL, NULL, 'hungnd13112004@gmail.com', NULL, NULL, 1, '$2y$12$Z5eAuYLPJb3t8TkTMM2fHeeUOK4kCWNYZ4U/EDe22GZvvsCqRYmfi', 'KWlcsZZmZaVuOVSF0i6AVo6QMDYiqv7BihcEEEzE9xViWui53P2h3c72urf94Y4caxckArH3TuaTnZFM', 2, 1, 0, 1, 0, '42cd4410d97a026cf03365823cb2d360', NULL, '2026-09-29 07:41:04', '2026-10-21 22:26:32'),
	(2, 'Peter', 'Parker', NULL, NULL, 'demo1@gmail.com', NULL, NULL, 1, '$2y$12$QK1yOMNfJ4MUtn2VNxet7eCVEQnYZRNJvwZDyptvTMnn5HtHOlrXW', 'pJ5pUK7ePXB5Qvfkf2xhAN1lsoHLn84lJYUNio33pMuRB1NvfIxdL9zKtEeHYu2aaNzzXbO1KskXdIKB', 2, 1, 0, 1, 0, 'd3bad96ffa0de5de04d76b3a53426d2d', NULL, '2026-10-07 22:05:38', '2026-10-21 21:40:37'),
	(3, 'Nguyễn', 'Hùng', NULL, NULL, 'hungtest@gmail.com', NULL, NULL, 1, '$2y$12$uzeOJkXBXs7NaC.7L8CFWObGlllCV/XNute/KT2CHUTgXJIvtEkEm', 'ehQxuOV5QeTls7KnZ58CmQEnzlIm79MRFtV0p6FWhZ8y0HAjgwj0Jua64hTOTYsiPnuKidn1AEExI5sI', 2, 1, 0, 1, 0, '35af78e9fe699e9a916ab7f46c2fb45c', NULL, '2026-10-21 21:37:38', '2026-10-21 21:37:38'),
	(4, 'tt', 'te', NULL, NULL, 'demo2@gmail.com', NULL, NULL, 1, '$2y$12$0YazBQ4C5AW6wUbL344gmuGEG7c0c7qLHRDROSFCOrDXBT12.4n3a', 'unqDEX6cV1Qdq0QP3KGfiwjcXbrbR0qARGcLpLVr65ivEdPTdXH3xkS6Qxf1fBrPWKSO16rKsOnp3dC6', 2, 1, 0, 1, 0, 'dbbe3c18b28b25ba401530b66b3b6bd2', NULL, '2026-10-21 21:38:50', '2026-10-21 21:38:50'),
	(5, 'Error', 'Terer', NULL, NULL, 'demo3@gmail.com', NULL, NULL, 1, '$2y$12$HSjdWG5sals//ADUeByMFeVy7PBoom7gDwEG7Cjda5mMF3Gf/5B5.', '7LEkog6uJx0o2wANWEcn4agKOa7O08YYVvEVzJ79pURGic6Pwe4rr0nbNvqcMTLppIPN2Pqv2JnbWfJV', 2, 1, 0, 1, 0, '309e683b4b90d1dcb613c763c17d70ec', NULL, '2026-10-22 10:28:43', '2026-10-22 10:28:43'),
	(6, 'Nguyễn', 'Hùng', NULL, NULL, 'demo4@gmail.com', NULL, NULL, 1, '$2y$12$Cxr4S1OAo66vnQleG1kLF.Znb6YafD1J.hr59DTkMUBWu97HIYa..', 'Y2uXtZP1VZtZwZwazlwMkHtRQMO4rVGABqeYLc30EJtD1D57op8mjPzd7u7ZEQDDN3KKKxzUmNOb9n2U', 2, 1, 0, 1, 0, '2e73adb3dcc0a989b9e2f29db1bc1dbc', NULL, '2026-10-22 10:29:32', '2026-10-22 10:29:32');

-- Dumping structure for table bagisto_db.customer_groups
CREATE TABLE IF NOT EXISTS `customer_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_groups_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.customer_groups: ~3 rows (approximately)
INSERT INTO `customer_groups` (`id`, `code`, `name`, `is_user_defined`, `created_at`, `updated_at`) VALUES
	(1, 'guest', 'Guest', 0, NULL, NULL),
	(2, 'general', 'General', 0, NULL, NULL),
	(3, 'wholesale', 'Wholesale', 0, NULL, NULL);

-- Dumping structure for table bagisto_db.customer_notes
CREATE TABLE IF NOT EXISTS `customer_notes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int unsigned DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_notified` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_notes_customer_id_foreign` (`customer_id`),
  CONSTRAINT `customer_notes_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.customer_notes: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.customer_password_resets
CREATE TABLE IF NOT EXISTS `customer_password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `customer_password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.customer_password_resets: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.customer_social_accounts
CREATE TABLE IF NOT EXISTS `customer_social_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int unsigned NOT NULL,
  `provider_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_social_accounts_provider_id_unique` (`provider_id`),
  KEY `customer_social_accounts_customer_id_foreign` (`customer_id`),
  CONSTRAINT `customer_social_accounts_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.customer_social_accounts: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.datagrid_saved_filters
CREATE TABLE IF NOT EXISTS `datagrid_saved_filters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `src` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `datagrid_saved_filters_user_id_name_src_unique` (`user_id`,`name`,`src`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.datagrid_saved_filters: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.downloadable_link_purchased
CREATE TABLE IF NOT EXISTS `downloadable_link_purchased` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `download_bought` int NOT NULL DEFAULT '0',
  `download_used` int NOT NULL DEFAULT '0',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int unsigned NOT NULL,
  `order_id` int unsigned NOT NULL,
  `order_item_id` int unsigned NOT NULL,
  `download_canceled` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `downloadable_link_purchased_customer_id_foreign` (`customer_id`),
  KEY `downloadable_link_purchased_order_id_foreign` (`order_id`),
  KEY `downloadable_link_purchased_order_item_id_foreign` (`order_item_id`),
  CONSTRAINT `downloadable_link_purchased_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `downloadable_link_purchased_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `downloadable_link_purchased_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.downloadable_link_purchased: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.eu_withdrawals
CREATE TABLE IF NOT EXISTS `eu_withdrawals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` int unsigned NOT NULL,
  `customer_id` int unsigned DEFAULT NULL,
  `is_guest` tinyint(1) NOT NULL DEFAULT '0',
  `customer_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_id` int unsigned NOT NULL,
  `locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `received_at` timestamp NOT NULL,
  `confirmation_sent_at` timestamp NULL DEFAULT NULL,
  `final_confirmation_sent_at` timestamp NULL DEFAULT NULL,
  `confirmation_error` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'received',
  `declined_at` timestamp NULL DEFAULT NULL,
  `declined_reason` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `declined_by_user_id` int unsigned DEFAULT NULL,
  `refunded_at` timestamp NULL DEFAULT NULL,
  `refunded_by_user_id` int unsigned DEFAULT NULL,
  `refund_note` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `eu_withdrawals_order_id_unique` (`order_id`),
  UNIQUE KEY `eu_withdrawals_uuid_unique` (`uuid`),
  KEY `eu_withdrawals_customer_id_index` (`customer_id`),
  KEY `eu_withdrawals_channel_id_status_index` (`channel_id`,`status`),
  KEY `eu_withdrawals_received_at_index` (`received_at`),
  KEY `eu_withdrawals_declined_by_user_id_foreign` (`declined_by_user_id`),
  KEY `eu_withdrawals_refunded_by_user_id_foreign` (`refunded_by_user_id`),
  CONSTRAINT `eu_withdrawals_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `eu_withdrawals_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL,
  CONSTRAINT `eu_withdrawals_declined_by_user_id_foreign` FOREIGN KEY (`declined_by_user_id`) REFERENCES `admins` (`id`) ON DELETE SET NULL,
  CONSTRAINT `eu_withdrawals_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `eu_withdrawals_refunded_by_user_id_foreign` FOREIGN KEY (`refunded_by_user_id`) REFERENCES `admins` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.eu_withdrawals: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.gdpr_data_request
CREATE TABLE IF NOT EXISTS `gdpr_data_request` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int unsigned NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gdpr_data_request_customer_id_foreign` (`customer_id`),
  CONSTRAINT `gdpr_data_request_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.gdpr_data_request: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.imports
CREATE TABLE IF NOT EXISTS `imports` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `process_in_queue` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `validation_strategy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `allowed_errors` int NOT NULL DEFAULT '0',
  `processed_rows_count` int NOT NULL DEFAULT '0',
  `invalid_rows_count` int NOT NULL DEFAULT '0',
  `errors_count` int NOT NULL DEFAULT '0',
  `errors` json DEFAULT NULL,
  `field_separator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `images_directory_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'directory',
  `images_archive_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `error_file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `summary` json DEFAULT NULL,
  `started_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.imports: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.import_batches
CREATE TABLE IF NOT EXISTS `import_batches` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `data` json NOT NULL,
  `summary` json DEFAULT NULL,
  `import_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `import_batches_import_id_foreign` (`import_id`),
  CONSTRAINT `import_batches_import_id_foreign` FOREIGN KEY (`import_id`) REFERENCES `imports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.import_batches: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.inventory_sources
CREATE TABLE IF NOT EXISTS `inventory_sources` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contact_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_fax` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `postcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int NOT NULL DEFAULT '0',
  `latitude` decimal(10,5) DEFAULT NULL,
  `longitude` decimal(10,5) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `inventory_sources_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.inventory_sources: ~0 rows (approximately)
INSERT INTO `inventory_sources` (`id`, `code`, `name`, `description`, `contact_name`, `contact_email`, `contact_number`, `contact_fax`, `country`, `state`, `city`, `street`, `postcode`, `priority`, `latitude`, `longitude`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'default', 'Default', NULL, 'Default', 'warehouse@example.com', '1234567899', NULL, 'US', 'MI', 'Detroit', '12th Street', '48127', 0, NULL, NULL, 1, NULL, NULL);

-- Dumping structure for table bagisto_db.invoices
CREATE TABLE IF NOT EXISTS `invoices` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `increment_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT '0',
  `total_qty` int DEFAULT NULL,
  `base_currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `order_id` int unsigned DEFAULT NULL,
  `transaction_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reminders` int NOT NULL DEFAULT '0',
  `next_reminder_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoices_order_id_foreign` (`order_id`),
  CONSTRAINT `invoices_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.invoices: ~2 rows (approximately)
INSERT INTO `invoices` (`id`, `increment_id`, `state`, `email_sent`, `total_qty`, `base_currency_code`, `channel_currency_code`, `order_currency_code`, `sub_total`, `base_sub_total`, `grand_total`, `base_grand_total`, `shipping_amount`, `base_shipping_amount`, `tax_amount`, `base_tax_amount`, `discount_amount`, `base_discount_amount`, `shipping_tax_amount`, `base_shipping_tax_amount`, `sub_total_incl_tax`, `base_sub_total_incl_tax`, `shipping_amount_incl_tax`, `base_shipping_amount_incl_tax`, `order_id`, `transaction_id`, `reminders`, `next_reminder_at`, `created_at`, `updated_at`) VALUES
	(1, '1', 'paid', 1, 1, 'USD', 'USD', 'USD', 249.9900, 249.9900, 249.9900, 249.9900, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 249.9900, 249.9900, 0.0000, 0.0000, 3, NULL, 0, NULL, '2026-09-29 07:55:18', '2026-10-21 22:47:16'),
	(2, '2', 'paid', 1, 1, 'USD', 'USD', 'USD', 1049.0000, 1049.0000, 1059.0000, 1059.0000, 10.0000, 10.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1049.0000, 1049.0000, 10.0000, 10.0000, 6, NULL, 0, NULL, '2026-10-21 22:47:10', '2026-10-21 22:47:16');

-- Dumping structure for table bagisto_db.invoice_items
CREATE TABLE IF NOT EXISTS `invoice_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `product_id` int unsigned DEFAULT NULL,
  `product_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_item_id` int unsigned DEFAULT NULL,
  `invoice_id` int unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_items_invoice_id_foreign` (`invoice_id`),
  KEY `invoice_items_parent_id_foreign` (`parent_id`),
  CONSTRAINT `invoice_items_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invoice_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `invoice_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.invoice_items: ~0 rows (approximately)
INSERT INTO `invoice_items` (`id`, `parent_id`, `name`, `description`, `sku`, `qty`, `price`, `base_price`, `total`, `base_total`, `tax_amount`, `base_tax_amount`, `discount_percent`, `discount_amount`, `base_discount_amount`, `price_incl_tax`, `base_price_incl_tax`, `total_incl_tax`, `base_total_incl_tax`, `product_id`, `product_type`, `order_item_id`, `invoice_id`, `additional`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'Sony WF-1000XM5 Flagship Noise Canceling Earbuds Hi-Res LDAC', NULL, 'EAR-SONY-WF1000XM5', 1, 249.9900, 249.9900, 249.9900, 249.9900, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 249.9900, 249.9900, 249.9900, 249.9900, 12, 'Webkul\\Product\\Models\\Product', 3, 1, '{"locale": "en", "cart_id": 3, "quantity": 1, "is_buy_now": "0", "product_id": "12"}', '2026-09-29 07:55:18', '2026-09-29 07:55:18'),
	(2, NULL, 'Xiaomi 14 Ultra 16GB/512GB Leica Quad Camera 1-inch Sensor', NULL, 'PHONE-XM14U-512', 1, 1049.0000, 1049.0000, 1049.0000, 1049.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1049.0000, 1049.0000, 1049.0000, 1049.0000, 6, 'Webkul\\Product\\Models\\Product', 6, 2, '{"locale": "en", "cart_id": 8, "quantity": 1, "product_id": 6}', '2026-10-21 22:47:10', '2026-10-21 22:47:10');

-- Dumping structure for table bagisto_db.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.jobs: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.job_batches
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.job_batches: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.locales
CREATE TABLE IF NOT EXISTS `locales` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `direction` enum('ltr','rtl') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ltr',
  `logo_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locales_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.locales: ~0 rows (approximately)
INSERT INTO `locales` (`id`, `code`, `name`, `direction`, `logo_path`, `created_at`, `updated_at`) VALUES
	(1, 'en', 'English', 'ltr', 'locales/mtjubU38w8ZtfTSH537Cm9e3R6uAOIAJHbGwGB5E.png', NULL, NULL);

-- Dumping structure for table bagisto_db.marketing_campaigns
CREATE TABLE IF NOT EXISTS `marketing_campaigns` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail_to` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `spooling` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_id` int unsigned DEFAULT NULL,
  `customer_group_id` int unsigned DEFAULT NULL,
  `marketing_template_id` int unsigned DEFAULT NULL,
  `marketing_event_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `marketing_campaigns_channel_id_foreign` (`channel_id`),
  KEY `marketing_campaigns_customer_group_id_foreign` (`customer_group_id`),
  KEY `marketing_campaigns_marketing_template_id_foreign` (`marketing_template_id`),
  KEY `marketing_campaigns_marketing_event_id_foreign` (`marketing_event_id`),
  CONSTRAINT `marketing_campaigns_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE SET NULL,
  CONSTRAINT `marketing_campaigns_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE SET NULL,
  CONSTRAINT `marketing_campaigns_marketing_event_id_foreign` FOREIGN KEY (`marketing_event_id`) REFERENCES `marketing_events` (`id`) ON DELETE SET NULL,
  CONSTRAINT `marketing_campaigns_marketing_template_id_foreign` FOREIGN KEY (`marketing_template_id`) REFERENCES `marketing_templates` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.marketing_campaigns: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.marketing_events
CREATE TABLE IF NOT EXISTS `marketing_events` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.marketing_events: ~0 rows (approximately)
INSERT INTO `marketing_events` (`id`, `name`, `description`, `date`, `created_at`, `updated_at`) VALUES
	(1, 'Birthday', 'Birthday', NULL, NULL, NULL);

-- Dumping structure for table bagisto_db.marketing_templates
CREATE TABLE IF NOT EXISTS `marketing_templates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.marketing_templates: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.migrations: ~199 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_admin_password_resets_table', 1),
	(3, '2014_10_12_100000_create_password_resets_table', 1),
	(4, '2018_06_12_111907_create_admins_table', 1),
	(5, '2018_06_13_055341_create_roles_table', 1),
	(6, '2018_07_05_130148_create_attributes_table', 1),
	(7, '2018_07_05_132854_create_attribute_translations_table', 1),
	(8, '2018_07_05_135150_create_attribute_families_table', 1),
	(9, '2018_07_05_135152_create_attribute_groups_table', 1),
	(10, '2018_07_05_140832_create_attribute_options_table', 1),
	(11, '2018_07_05_140856_create_attribute_option_translations_table', 1),
	(12, '2018_07_05_142820_create_categories_table', 1),
	(13, '2018_07_10_055143_create_locales_table', 1),
	(14, '2018_07_20_054426_create_countries_table', 1),
	(15, '2018_07_20_054502_create_currencies_table', 1),
	(16, '2018_07_20_054542_create_currency_exchange_rates_table', 1),
	(17, '2018_07_20_064849_create_channels_table', 1),
	(18, '2018_07_21_142836_create_category_translations_table', 1),
	(19, '2018_07_23_110040_create_inventory_sources_table', 1),
	(20, '2018_07_24_082635_create_customer_groups_table', 1),
	(21, '2018_07_24_082930_create_customers_table', 1),
	(22, '2018_07_27_065727_create_products_table', 1),
	(23, '2018_07_27_070011_create_product_attribute_values_table', 1),
	(24, '2018_07_27_092623_create_product_reviews_table', 1),
	(25, '2018_07_27_113941_create_product_images_table', 1),
	(26, '2018_07_27_113956_create_product_inventories_table', 1),
	(27, '2018_08_30_064755_create_tax_categories_table', 1),
	(28, '2018_08_30_065042_create_tax_rates_table', 1),
	(29, '2018_08_30_065840_create_tax_mappings_table', 1),
	(30, '2018_09_05_150444_create_cart_table', 1),
	(31, '2018_09_05_150915_create_cart_items_table', 1),
	(32, '2018_09_11_064045_customer_password_resets', 1),
	(33, '2018_09_19_093453_create_cart_payment', 1),
	(34, '2018_09_19_093508_create_cart_shipping_rates_table', 1),
	(35, '2018_09_20_060658_create_core_config_table', 1),
	(36, '2018_09_27_113154_create_orders_table', 1),
	(37, '2018_09_27_113207_create_order_items_table', 1),
	(38, '2018_09_27_115022_create_shipments_table', 1),
	(39, '2018_09_27_115029_create_shipment_items_table', 1),
	(40, '2018_09_27_115135_create_invoices_table', 1),
	(41, '2018_09_27_115144_create_invoice_items_table', 1),
	(42, '2018_10_01_095504_create_order_payment_table', 1),
	(43, '2018_10_03_025230_create_wishlist_table', 1),
	(44, '2018_10_12_101803_create_country_translations_table', 1),
	(45, '2018_10_12_101913_create_country_states_table', 1),
	(46, '2018_10_12_101923_create_country_state_translations_table', 1),
	(47, '2018_11_16_173504_create_subscribers_list_table', 1),
	(48, '2018_11_21_144411_create_cart_item_inventories_table', 1),
	(49, '2018_12_06_185202_create_product_flat_table', 1),
	(50, '2018_12_24_123812_create_channel_inventory_sources_table', 1),
	(51, '2018_12_26_165327_create_product_ordered_inventories_table', 1),
	(52, '2019_05_13_024321_create_cart_rules_table', 1),
	(53, '2019_05_13_024322_create_cart_rule_channels_table', 1),
	(54, '2019_05_13_024323_create_cart_rule_customer_groups_table', 1),
	(55, '2019_05_13_024324_create_cart_rule_translations_table', 1),
	(56, '2019_05_13_024325_create_cart_rule_customers_table', 1),
	(57, '2019_05_13_024326_create_cart_rule_coupons_table', 1),
	(58, '2019_05_13_024327_create_cart_rule_coupon_usage_table', 1),
	(59, '2019_06_17_180258_create_product_downloadable_samples_table', 1),
	(60, '2019_06_17_180314_create_product_downloadable_sample_translations_table', 1),
	(61, '2019_06_17_180325_create_product_downloadable_links_table', 1),
	(62, '2019_06_17_180346_create_product_downloadable_link_translations_table', 1),
	(63, '2019_06_21_202249_create_downloadable_link_purchased_table', 1),
	(64, '2019_07_02_180307_create_booking_products_table', 1),
	(65, '2019_07_05_154415_create_booking_product_default_slots_table', 1),
	(66, '2019_07_05_154429_create_booking_product_appointment_slots_table', 1),
	(67, '2019_07_05_154440_create_booking_product_event_tickets_table', 1),
	(68, '2019_07_05_154451_create_booking_product_rental_slots_table', 1),
	(69, '2019_07_05_154502_create_booking_product_table_slots_table', 1),
	(70, '2019_07_30_153530_create_cms_pages_table', 1),
	(71, '2019_07_31_143339_create_category_filterable_attributes_table', 1),
	(72, '2019_08_02_105320_create_product_grouped_products_table', 1),
	(73, '2019_08_20_170510_create_product_bundle_options_table', 1),
	(74, '2019_08_20_170520_create_product_bundle_option_translations_table', 1),
	(75, '2019_08_20_170528_create_product_bundle_option_products_table', 1),
	(76, '2019_09_11_184511_create_refunds_table', 1),
	(77, '2019_09_11_184519_create_refund_items_table', 1),
	(78, '2019_12_03_184613_create_catalog_rules_table', 1),
	(79, '2019_12_03_184651_create_catalog_rule_channels_table', 1),
	(80, '2019_12_03_184732_create_catalog_rule_customer_groups_table', 1),
	(81, '2019_12_06_101110_create_catalog_rule_products_table', 1),
	(82, '2019_12_06_110507_create_catalog_rule_product_prices_table', 1),
	(83, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(84, '2020_01_14_191854_create_cms_page_translations_table', 1),
	(85, '2020_01_15_130209_create_cms_page_channels_table', 1),
	(86, '2020_02_18_165639_create_bookings_table', 1),
	(87, '2020_02_21_121201_create_booking_product_event_ticket_translations_table', 1),
	(88, '2020_04_16_185147_add_table_addresses', 1),
	(89, '2020_05_06_171638_create_order_comments_table', 1),
	(90, '2020_05_21_171500_create_product_customer_group_prices_table', 1),
	(91, '2020_06_25_162154_create_customer_social_accounts_table', 1),
	(92, '2020_08_07_174804_create_gdpr_data_request_table', 1),
	(93, '2020_11_19_112228_create_product_videos_table', 1),
	(94, '2020_11_26_141455_create_marketing_templates_table', 1),
	(95, '2020_11_26_150534_create_marketing_events_table', 1),
	(96, '2020_11_26_150644_create_marketing_campaigns_table', 1),
	(97, '2020_12_21_000200_create_channel_translations_table', 1),
	(98, '2020_12_27_121950_create_jobs_table', 1),
	(99, '2021_03_11_212124_create_order_transactions_table', 1),
	(100, '2021_04_07_132010_create_product_review_images_table', 1),
	(101, '2021_12_15_104544_notifications', 1),
	(102, '2022_03_15_160510_create_failed_jobs_table', 1),
	(103, '2022_04_01_094622_create_sitemaps_table', 1),
	(104, '2022_10_03_144232_create_product_price_indices_table', 1),
	(105, '2022_10_04_144444_create_job_batches_table', 1),
	(106, '2022_10_08_134150_create_product_inventory_indices_table', 1),
	(107, '2023_05_26_213105_create_wishlist_items_table', 1),
	(108, '2023_05_26_213120_create_compare_items_table', 1),
	(109, '2023_06_27_163529_rename_product_review_images_to_product_review_attachments', 1),
	(110, '2023_07_06_140013_add_logo_path_column_to_locales', 1),
	(111, '2023_07_10_184256_create_theme_customizations_table', 1),
	(112, '2023_07_12_181722_remove_home_page_and_footer_content_column_from_channel_translations_table', 1),
	(113, '2023_07_20_185324_add_column_column_in_attribute_groups_table', 1),
	(114, '2023_07_25_145943_add_regex_column_in_attributes_table', 1),
	(115, '2023_07_25_165945_drop_notes_column_from_customers_table', 1),
	(116, '2023_07_25_171058_create_customer_notes_table', 1),
	(117, '2023_07_31_125232_rename_image_and_category_banner_columns_from_categories_table', 1),
	(118, '2023_09_15_170053_create_theme_customization_translations_table', 1),
	(119, '2023_09_20_102031_add_default_value_column_in_attributes_table', 1),
	(120, '2023_09_20_102635_add_inventories_group_in_attribute_groups_table', 1),
	(121, '2023_09_26_155709_add_columns_to_currencies', 1),
	(122, '2023_10_12_090446_add_tax_category_id_column_in_order_items_table', 1),
	(123, '2023_11_08_054614_add_code_column_in_attribute_groups_table', 1),
	(124, '2023_11_08_140116_create_search_terms_table', 1),
	(125, '2023_11_09_162805_create_url_rewrites_table', 1),
	(126, '2023_11_17_150401_create_search_synonyms_table', 1),
	(127, '2023_12_11_054614_add_channel_id_column_in_product_price_indices_table', 1),
	(128, '2024_01_11_154640_create_imports_table', 1),
	(129, '2024_01_11_154741_create_import_batches_table', 1),
	(130, '2024_01_19_170350_add_unique_id_column_in_product_attribute_values_table', 1),
	(131, '2024_01_19_170350_add_unique_id_column_in_product_customer_group_prices_table', 1),
	(132, '2024_01_22_170814_add_unique_index_in_mapping_tables', 1),
	(133, '2024_02_26_153000_add_columns_to_addresses_table', 1),
	(134, '2024_03_07_193421_rename_address1_column_in_addresses_table', 1),
	(135, '2024_04_16_144400_add_cart_id_column_in_cart_shipping_rates_table', 1),
	(136, '2024_04_19_102939_add_incl_tax_columns_in_orders_table', 1),
	(137, '2024_04_19_135405_add_incl_tax_columns_in_cart_items_table', 1),
	(138, '2024_04_19_144641_add_incl_tax_columns_in_order_items_table', 1),
	(139, '2024_04_23_133154_add_incl_tax_columns_in_cart_table', 1),
	(140, '2024_04_23_150945_add_incl_tax_columns_in_cart_shipping_rates_table', 1),
	(141, '2024_04_24_102939_add_incl_tax_columns_in_invoices_table', 1),
	(142, '2024_04_24_102939_add_incl_tax_columns_in_refunds_table', 1),
	(143, '2024_04_24_144641_add_incl_tax_columns_in_invoice_items_table', 1),
	(144, '2024_04_24_144641_add_incl_tax_columns_in_refund_items_table', 1),
	(145, '2024_04_24_144641_add_incl_tax_columns_in_shipment_items_table', 1),
	(146, '2024_05_10_152848_create_saved_filters_table', 1),
	(147, '2024_06_03_174128_create_product_channels_table', 1),
	(148, '2024_06_04_130527_add_channel_id_column_in_customers_table', 1),
	(149, '2024_06_04_130600_make_email_unique_per_channel', 1),
	(150, '2024_06_13_184426_add_theme_column_into_theme_customizations_table', 1),
	(151, '2024_07_17_172645_add_additional_column_to_sitemaps_table', 1),
	(152, '2024_10_11_135010_create_product_customizable_options_table', 1),
	(153, '2024_10_11_135110_create_product_customizable_option_translations_table', 1),
	(154, '2024_10_11_135228_create_product_customizable_option_prices_table', 1),
	(155, '2025_05_07_121250_update_total_weight_columns_in_shipments_and_weight_shipment_items_tables', 1),
	(156, '2025_09_05_000100_add_indexes_to_channels_tables', 1),
	(157, '2025_09_05_000200_add_indexes_to_product_relation_tables', 1),
	(158, '2025_09_05_000300_add_indexes_to_product_media_and_attributes', 1),
	(159, '2025_09_05_000400_add_indexes_to_attributes_and_product_types', 1),
	(160, '2025_09_05_000500_add_indexes_to_product_grouped_products_and_product_bundle_option_products', 1),
	(161, '2025_09_05_000500_add_indexes_to_url_rewrites_and_visits', 1),
	(162, '2025_09_11_140301_add_two_factor_to_admins', 1),
	(163, '2025_11_14_173810_create_rma_statuses_table', 1),
	(164, '2025_11_14_173812_create_rma_table', 1),
	(165, '2025_11_14_173906_create_rma_reasons_table', 1),
	(166, '2025_11_14_173959_create_rma_items_table', 1),
	(167, '2025_11_14_174030_create_rma_images_table', 1),
	(168, '2025_11_14_174059_create_rma_messages_table', 1),
	(169, '2025_11_14_174134_create_rma_reason_resolutions_table', 1),
	(170, '2025_11_14_174205_create_rma_rules_table', 1),
	(171, '2025_11_14_174355_create_rma_custom_fields_table', 1),
	(172, '2025_11_14_174426_create_rma_custom_field_options_table', 1),
	(173, '2025_11_14_174509_create_rma_additional_fields_table', 1),
	(174, '2026_02_03_151924_create_sessions_table', 1),
	(175, '2026_02_11_095547_add_rma_return_period_to_order_items_table', 1),
	(176, '2026_03_11_113926_create_agent_conversations_table', 1),
	(177, '2026_04_09_120000_change_tax_category_id_fk_on_cart_items_to_null_on_delete', 1),
	(178, '2026_04_09_120100_change_tax_category_id_fk_on_order_items_to_null_on_delete', 1),
	(179, '2026_04_17_000001_add_booking_product_enhancements', 1),
	(180, '2026_04_17_000002_add_allow_cancellation_snapshot_to_bookings', 1),
	(181, '2026_05_27_114230_create_eu_withdrawals_table', 1),
	(182, '2026_06_24_000000_rename_received_package_rma_status', 1),
	(183, '2026_06_24_000001_rename_neutral_rma_statuses', 1),
	(184, '2026_07_03_170000_create_sitemap_channels_table', 1),
	(185, '2026_07_27_000001_add_image_source_to_imports_table', 1),
	(186, '2026_08_10_000001_add_derived_columns_in_product_flat_table', 1),
	(187, '2026_08_13_000001_make_images_count_nullable_in_product_flat_table', 1),
	(188, '2026_08_15_000001_create_product_image_translations_table', 1),
	(189, '2026_08_15_000002_add_alt_text_columns_to_category_translations_table', 1),
	(190, '2026_08_15_000003_add_logo_alt_column_to_channel_translations_table', 1),
	(191, '2026_08_15_000004_add_swatch_alt_column_to_attribute_option_translations_table', 1),
	(192, '2026_08_15_000005_rename_theme_customizations_to_theme_sections', 1),
	(193, '2026_08_15_000006_move_theme_uploads_to_section_directory', 1),
	(194, '2026_08_15_000007_add_draft_options_to_theme_section_translations_table', 1),
	(195, '2026_08_15_000008_make_options_nullable_on_theme_section_translations_table', 1),
	(196, '2026_08_19_000002_add_draft_columns_to_theme_sections_table', 1),
	(197, '2026_08_26_000001_rename_linkedin_social_login_config_code', 1),
	(198, '2026_09_04_000001_drop_duplicate_channel_pivot_indexes', 1),
	(199, '2026_09_04_000002_drop_duplicate_attributes_code_index', 1);

-- Dumping structure for table bagisto_db.notifications
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT '0',
  `order_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_order_id_foreign` (`order_id`),
  CONSTRAINT `notifications_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.notifications: ~3 rows (approximately)
INSERT INTO `notifications` (`id`, `type`, `read`, `order_id`, `created_at`, `updated_at`) VALUES
	(1, 'order', 1, 1, '2026-09-28 02:29:21', '2026-09-28 02:30:25'),
	(2, 'order', 0, 2, '2026-09-29 07:43:15', '2026-09-29 07:43:15'),
	(3, 'order', 1, 3, '2026-09-29 07:48:03', '2026-09-29 07:54:23'),
	(4, 'order', 0, 4, '2026-10-07 22:16:28', '2026-10-07 22:16:28'),
	(5, 'order', 0, 5, '2026-10-08 15:28:31', '2026-10-08 15:28:31'),
	(6, 'order', 0, 6, '2026-10-21 22:28:00', '2026-10-21 22:28:00');

-- Dumping structure for table bagisto_db.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `increment_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_guest` tinyint(1) DEFAULT NULL,
  `customer_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_gift` tinyint(1) NOT NULL DEFAULT '0',
  `total_item_count` int DEFAULT NULL,
  `total_qty_ordered` int DEFAULT NULL,
  `base_currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `grand_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `grand_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `sub_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `sub_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `shipping_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_invoiced` decimal(12,4) DEFAULT '0.0000',
  `shipping_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_refunded` decimal(12,4) DEFAULT '0.0000',
  `shipping_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `shipping_tax_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_tax_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `customer_id` int unsigned DEFAULT NULL,
  `customer_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_id` int unsigned DEFAULT NULL,
  `channel_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cart_id` int DEFAULT NULL,
  `applied_cart_rule_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_increment_id_unique` (`increment_id`),
  KEY `orders_customer_id_foreign` (`customer_id`),
  KEY `orders_channel_id_foreign` (`channel_id`),
  CONSTRAINT `orders_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE SET NULL,
  CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.orders: ~6 rows (approximately)
INSERT INTO `orders` (`id`, `increment_id`, `status`, `channel_name`, `is_guest`, `customer_email`, `customer_first_name`, `customer_last_name`, `shipping_method`, `shipping_title`, `shipping_description`, `coupon_code`, `is_gift`, `total_item_count`, `total_qty_ordered`, `base_currency_code`, `channel_currency_code`, `order_currency_code`, `grand_total`, `base_grand_total`, `grand_total_invoiced`, `base_grand_total_invoiced`, `grand_total_refunded`, `base_grand_total_refunded`, `sub_total`, `base_sub_total`, `sub_total_invoiced`, `base_sub_total_invoiced`, `sub_total_refunded`, `base_sub_total_refunded`, `discount_percent`, `discount_amount`, `base_discount_amount`, `discount_invoiced`, `base_discount_invoiced`, `discount_refunded`, `base_discount_refunded`, `tax_amount`, `base_tax_amount`, `tax_amount_invoiced`, `base_tax_amount_invoiced`, `tax_amount_refunded`, `base_tax_amount_refunded`, `shipping_amount`, `base_shipping_amount`, `shipping_invoiced`, `base_shipping_invoiced`, `shipping_refunded`, `base_shipping_refunded`, `shipping_discount_amount`, `base_shipping_discount_amount`, `shipping_tax_amount`, `base_shipping_tax_amount`, `shipping_tax_refunded`, `base_shipping_tax_refunded`, `sub_total_incl_tax`, `base_sub_total_incl_tax`, `shipping_amount_incl_tax`, `base_shipping_amount_incl_tax`, `customer_id`, `customer_type`, `channel_id`, `channel_type`, `cart_id`, `applied_cart_rule_ids`, `created_at`, `updated_at`) VALUES
	(1, '1', 'canceled', 'Default', 1, 'hungnd13112004@gmail.com', 'Nguyen', 'Hung', 'free_free', 'Free Shipping - Free Shipping', 'Free Shipping', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 999.0000, 999.0000, 0.0000, 0.0000, 0.0000, 0.0000, 999.0000, 999.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 999.0000, 999.0000, 0.0000, 0.0000, NULL, NULL, 1, 'Webkul\\Core\\Models\\Channel', 1, NULL, '2026-09-28 02:29:18', '2026-09-28 02:30:59'),
	(2, '2', 'pending', 'Default', 0, 'hungnd13112004@gmail.com', 'Nguyen', 'Hung', 'free_free', 'Free Shipping - Free Shipping', 'Free Shipping', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 1049.0000, 1049.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1049.0000, 1049.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1049.0000, 1049.0000, 0.0000, 0.0000, 1, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', 2, NULL, '2026-09-29 07:43:12', '2026-09-29 07:43:12'),
	(3, '3', 'completed', 'Default', 0, 'hungnd13112004@gmail.com', 'Nguyen', 'Hung', 'free_free', 'Free Shipping - Free Shipping', 'Free Shipping', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 249.9900, 249.9900, 249.9900, 249.9900, 0.0000, 0.0000, 249.9900, 249.9900, 249.9900, 249.9900, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 249.9900, 249.9900, 0.0000, 0.0000, 1, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', 3, NULL, '2026-09-29 07:48:01', '2026-09-29 07:55:19'),
	(4, '4', 'pending', 'Default', 0, 'hungnd13112004@gmail.com', 'Nguyen', 'Hung', 'free_free', 'Free Shipping - Free Shipping', 'Free Shipping', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 1049.0000, 1049.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1049.0000, 1049.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1049.0000, 1049.0000, 0.0000, 0.0000, 1, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', 5, NULL, '2026-10-07 22:16:24', '2026-10-07 22:16:24'),
	(5, '5', 'pending', 'Default', 0, 'hungnd13112004@gmail.com', 'Nguyen', 'Hung', 'free_free', 'Free Shipping - Free Shipping', 'Free Shipping', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 1049.0000, 1049.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1049.0000, 1049.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1049.0000, 1049.0000, 0.0000, 0.0000, 1, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', 7, NULL, '2026-10-08 15:28:26', '2026-10-08 15:28:26'),
	(6, '6', 'processing', 'Default', 0, 'hungnd13112004@gmail.com', 'Nguyen', 'Hung', 'flatrate_flatrate', 'Flat Rate - Flat Rate', 'Flat Rate Shipping', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 1059.0000, 1059.0000, 1059.0000, 1059.0000, 0.0000, 0.0000, 1049.0000, 1049.0000, 1049.0000, 1049.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, 10.0000, 10.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1049.0000, 1049.0000, 10.0000, 10.0000, 1, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', 8, NULL, '2026-10-21 22:27:57', '2026-10-21 22:47:10');

-- Dumping structure for table bagisto_db.order_comments
CREATE TABLE IF NOT EXISTS `order_comments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int unsigned DEFAULT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_notified` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_comments_order_id_foreign` (`order_id`),
  CONSTRAINT `order_comments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.order_comments: ~0 rows (approximately)
INSERT INTO `order_comments` (`id`, `order_id`, `comment`, `customer_notified`, `created_at`, `updated_at`) VALUES
	(1, 1, 'ok', 0, '2026-09-28 02:30:41', '2026-09-28 02:30:41');

-- Dumping structure for table bagisto_db.order_items
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT '0.0000',
  `total_weight` decimal(12,4) DEFAULT '0.0000',
  `qty_ordered` int DEFAULT '0',
  `qty_shipped` int DEFAULT '0',
  `qty_invoiced` int DEFAULT '0',
  `qty_canceled` int DEFAULT '0',
  `qty_refunded` int DEFAULT '0',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `amount_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_amount_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `tax_percent` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `product_id` int unsigned DEFAULT NULL,
  `product_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int unsigned DEFAULT NULL,
  `tax_category_id` int unsigned DEFAULT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `rma_return_period` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_parent_id_foreign` (`parent_id`),
  KEY `order_items_tax_category_id_foreign` (`tax_category_id`),
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.order_items: ~3 rows (approximately)
INSERT INTO `order_items` (`id`, `sku`, `type`, `name`, `coupon_code`, `weight`, `total_weight`, `qty_ordered`, `qty_shipped`, `qty_invoiced`, `qty_canceled`, `qty_refunded`, `price`, `base_price`, `total`, `base_total`, `total_invoiced`, `base_total_invoiced`, `amount_refunded`, `base_amount_refunded`, `discount_percent`, `discount_amount`, `base_discount_amount`, `discount_invoiced`, `base_discount_invoiced`, `discount_refunded`, `base_discount_refunded`, `tax_percent`, `tax_amount`, `base_tax_amount`, `tax_amount_invoiced`, `base_tax_amount_invoiced`, `tax_amount_refunded`, `base_tax_amount_refunded`, `price_incl_tax`, `base_price_incl_tax`, `total_incl_tax`, `base_total_incl_tax`, `product_id`, `product_type`, `order_id`, `tax_category_id`, `parent_id`, `additional`, `rma_return_period`, `created_at`, `updated_at`) VALUES
	(1, 'PHONE-ROG8PRO-512', 'simple', 'ASUS ROG Phone 8 Pro 16GB/512GB Gaming Snapdragon 8 Gen 3', NULL, 0.3500, 0.3500, 1, 0, 0, 1, 0, 999.0000, 999.0000, 999.0000, 999.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 999.0000, 999.0000, 999.0000, 999.0000, 5, 'Webkul\\Product\\Models\\Product', 1, NULL, NULL, '{"locale": "en", "cart_id": 1, "quantity": 1, "is_buy_now": "0", "product_id": "5"}', NULL, '2026-09-28 02:29:18', '2026-09-28 02:30:59'),
	(2, 'PHONE-XM14U-512', 'simple', 'Xiaomi 14 Ultra 16GB/512GB Leica Quad Camera 1-inch Sensor', NULL, 0.3500, 0.3500, 1, 0, 0, 0, 0, 1049.0000, 1049.0000, 1049.0000, 1049.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1049.0000, 1049.0000, 1049.0000, 1049.0000, 6, 'Webkul\\Product\\Models\\Product', 2, NULL, NULL, '{"locale": "en", "cart_id": 2, "quantity": 1, "product_id": 6}', NULL, '2026-09-29 07:43:12', '2026-09-29 07:43:12'),
	(3, 'EAR-SONY-WF1000XM5', 'simple', 'Sony WF-1000XM5 Flagship Noise Canceling Earbuds Hi-Res LDAC', NULL, 0.3500, 0.3500, 1, 1, 1, 0, 0, 249.9900, 249.9900, 249.9900, 249.9900, 249.9900, 249.9900, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 249.9900, 249.9900, 249.9900, 249.9900, 12, 'Webkul\\Product\\Models\\Product', 3, NULL, NULL, '{"locale": "en", "cart_id": 3, "quantity": 1, "is_buy_now": "0", "product_id": "12"}', NULL, '2026-09-29 07:48:01', '2026-09-29 07:55:19'),
	(4, 'PHONE-XM14U-512', 'simple', 'Xiaomi 14 Ultra 16GB/512GB Leica Quad Camera 1-inch Sensor', NULL, 0.3500, 0.3500, 1, 0, 0, 0, 0, 1049.0000, 1049.0000, 1049.0000, 1049.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1049.0000, 1049.0000, 1049.0000, 1049.0000, 6, 'Webkul\\Product\\Models\\Product', 4, NULL, NULL, '{"locale": "en", "cart_id": 5, "quantity": 1, "product_id": 6}', NULL, '2026-10-07 22:16:24', '2026-10-07 22:16:24'),
	(5, 'PHONE-XM14U-512', 'simple', 'Xiaomi 14 Ultra 16GB/512GB Leica Quad Camera 1-inch Sensor', NULL, 0.3500, 0.3500, 1, 0, 0, 0, 0, 1049.0000, 1049.0000, 1049.0000, 1049.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1049.0000, 1049.0000, 1049.0000, 1049.0000, 6, 'Webkul\\Product\\Models\\Product', 5, NULL, NULL, '{"locale": "en", "cart_id": 7, "quantity": 1, "product_id": 6}', NULL, '2026-10-08 15:28:26', '2026-10-08 15:28:26'),
	(6, 'PHONE-XM14U-512', 'simple', 'Xiaomi 14 Ultra 16GB/512GB Leica Quad Camera 1-inch Sensor', NULL, 0.3500, 0.3500, 1, 0, 1, 0, 0, 1049.0000, 1049.0000, 1049.0000, 1049.0000, 1049.0000, 1049.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1049.0000, 1049.0000, 1049.0000, 1049.0000, 6, 'Webkul\\Product\\Models\\Product', 6, NULL, NULL, '{"locale": "en", "cart_id": 8, "quantity": 1, "product_id": 6}', NULL, '2026-10-21 22:27:57', '2026-10-21 22:47:10');

-- Dumping structure for table bagisto_db.order_payment
CREATE TABLE IF NOT EXISTS `order_payment` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int unsigned DEFAULT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_payment_order_id_foreign` (`order_id`),
  CONSTRAINT `order_payment_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.order_payment: ~3 rows (approximately)
INSERT INTO `order_payment` (`id`, `order_id`, `method`, `method_title`, `additional`, `created_at`, `updated_at`) VALUES
	(1, 1, 'cashondelivery', 'Cash On Delivery', NULL, '2026-09-28 02:29:18', '2026-09-28 02:29:18'),
	(2, 2, 'moneytransfer', 'Money Transfer', NULL, '2026-09-29 07:43:12', '2026-09-29 07:43:12'),
	(3, 3, 'cashondelivery', 'Cash On Delivery', NULL, '2026-09-29 07:48:01', '2026-09-29 07:48:01'),
	(4, 4, 'cashondelivery', 'Cash On Delivery', NULL, '2026-10-07 22:16:24', '2026-10-07 22:16:24'),
	(5, 5, 'moneytransfer', 'Money Transfer', NULL, '2026-10-08 15:28:26', '2026-10-08 15:28:26'),
	(6, 6, 'cashondelivery', 'Cash On Delivery', NULL, '2026-10-21 22:27:57', '2026-10-21 22:27:57');

-- Dumping structure for table bagisto_db.order_transactions
CREATE TABLE IF NOT EXISTS `order_transactions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(12,4) DEFAULT '0.0000',
  `payment_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` json DEFAULT NULL,
  `invoice_id` int unsigned NOT NULL,
  `order_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_transactions_order_id_foreign` (`order_id`),
  CONSTRAINT `order_transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.order_transactions: ~0 rows (approximately)
INSERT INTO `order_transactions` (`id`, `transaction_id`, `status`, `type`, `amount`, `payment_method`, `data`, `invoice_id`, `order_id`, `created_at`, `updated_at`) VALUES
	(1, '90880c49c129a4b8c306f21b34285c5f', 'paid', 'cashondelivery', 249.9900, 'cashondelivery', NULL, 1, 3, '2026-09-29 07:55:19', '2026-09-29 07:55:19');

-- Dumping structure for table bagisto_db.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.password_resets: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.personal_access_tokens: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  `attribute_family_id` int unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_sku_unique` (`sku`),
  KEY `products_attribute_family_id_foreign` (`attribute_family_id`),
  KEY `products_parent_id_foreign` (`parent_id`),
  CONSTRAINT `products_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `products_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.products: ~37 rows (approximately)
INSERT INTO `products` (`id`, `sku`, `type`, `parent_id`, `attribute_family_id`, `additional`, `created_at`, `updated_at`) VALUES
	(1, 'PHONE-IP16PM-256', 'simple', NULL, 1, NULL, '2026-09-28 02:17:35', '2026-09-28 02:17:35'),
	(2, 'TEST-001', 'simple', NULL, 1, NULL, '2026-09-28 02:20:28', '2026-09-28 02:20:28'),
	(3, 'PHONE-TEST-002', 'simple', NULL, 1, NULL, '2026-09-28 02:20:40', '2026-09-28 02:20:40'),
	(4, 'PHONE-S24U-512', 'simple', NULL, 1, NULL, '2026-09-28 02:21:11', '2026-09-28 02:21:11'),
	(5, 'PHONE-ROG8PRO-512', 'simple', NULL, 1, NULL, '2026-09-28 02:21:26', '2026-09-28 02:21:26'),
	(6, 'PHONE-XM14U-512', 'simple', NULL, 1, NULL, '2026-09-28 02:21:27', '2026-09-28 02:21:27'),
	(7, 'CHG-ANKER-737-140W', 'simple', NULL, 1, NULL, '2026-09-28 02:21:27', '2026-09-28 02:21:27'),
	(8, 'CHG-BASEUS-BLADE-100W', 'simple', NULL, 1, NULL, '2026-09-28 02:21:27', '2026-09-28 02:21:27'),
	(9, 'CHG-UGREEN-NEXODE-300W', 'simple', NULL, 1, NULL, '2026-09-28 02:21:27', '2026-09-28 02:21:27'),
	(10, 'PB-SHARGEEK-STORM2-100W', 'simple', NULL, 1, NULL, '2026-09-28 02:21:27', '2026-09-28 02:21:27'),
	(11, 'PB-ANKER-PRIME-20000', 'simple', NULL, 1, NULL, '2026-09-28 02:21:28', '2026-09-28 02:21:28'),
	(12, 'EAR-SONY-WF1000XM5', 'simple', NULL, 1, NULL, '2026-09-28 02:21:28', '2026-09-28 02:21:28'),
	(13, 'EAR-ROG-CETRA-SPEEDNOVA', 'simple', NULL, 1, NULL, '2026-09-28 02:21:28', '2026-09-28 02:21:28'),
	(14, 'COOL-REDMAGIC-5PRO', 'simple', NULL, 1, NULL, '2026-09-28 02:21:28', '2026-09-28 02:21:28'),
	(15, 'COOL-BLACKSHARK-4PRO', 'simple', NULL, 1, NULL, '2026-09-28 02:21:28', '2026-09-28 02:21:28'),
	(16, 'CAB-UGREEN-TB4-240W', 'simple', NULL, 1, NULL, '2026-09-28 02:21:28', '2026-09-28 02:21:28'),
	(17, 'CASE-UAG-MONARCH-PRO', 'simple', NULL, 1, NULL, '2026-09-28 02:21:29', '2026-09-28 02:21:29'),
	(18, 'GLASS-BELKIN-SAPPHIRE', 'simple', NULL, 1, NULL, '2026-09-28 02:21:29', '2026-09-28 02:21:29'),
	(19, 'PHONE-REDMAGIC9S-512', 'simple', NULL, 1, NULL, '2026-10-05 23:22:02', '2026-10-05 23:22:02'),
	(20, 'CHG-ANKER-67W', 'simple', NULL, 1, NULL, '2026-10-05 23:22:02', '2026-10-05 23:22:02'),
	(21, 'CHG-SHARGE-RETRO-67W', 'simple', NULL, 1, NULL, '2026-10-05 23:22:02', '2026-10-05 23:22:02'),
	(22, 'PB-CUKTECH20-210W', 'simple', NULL, 1, NULL, '2026-10-05 23:22:02', '2026-10-05 23:22:02'),
	(23, 'PB-ANKER-737-24K', 'simple', NULL, 1, NULL, '2026-10-05 23:22:02', '2026-10-05 23:22:02'),
	(24, 'PB-BASEUS-BLADE2-65W', 'simple', NULL, 1, NULL, '2026-10-05 23:22:02', '2026-10-05 23:22:02'),
	(25, 'EAR-BOSE-QCULTRA', 'simple', NULL, 1, NULL, '2026-10-05 23:22:02', '2026-10-05 23:22:02'),
	(26, 'EAR-RAZER-HAMMERHEAD', 'simple', NULL, 1, NULL, '2026-10-05 23:22:02', '2026-10-05 23:22:02'),
	(27, 'EAR-AIRPODS-PRO2', 'simple', NULL, 1, NULL, '2026-10-05 23:22:02', '2026-10-05 23:22:02'),
	(28, 'COOL-FLYDIGI-B7X', 'simple', NULL, 1, NULL, '2026-10-05 23:22:02', '2026-10-05 23:22:02'),
	(29, 'GEAR-GAMESIR-G8', 'simple', NULL, 1, NULL, '2026-10-05 23:22:02', '2026-10-05 23:22:02'),
	(30, 'COOL-RAZER-CHROMA', 'simple', NULL, 1, NULL, '2026-10-05 23:22:02', '2026-10-05 23:22:02'),
	(31, 'HUB-CALDIGIT-TS4', 'simple', NULL, 1, NULL, '2026-10-05 23:22:02', '2026-10-05 23:22:02'),
	(32, 'HUB-ANKER-575-13IN1', 'simple', NULL, 1, NULL, '2026-10-05 23:22:02', '2026-10-05 23:22:02'),
	(33, 'HUB-SATECHI-MACMINI', 'simple', NULL, 1, NULL, '2026-10-05 23:22:02', '2026-10-05 23:22:02'),
	(34, 'HUB-BASEUS-10IN1', 'simple', NULL, 1, NULL, '2026-10-05 23:22:02', '2026-10-05 23:22:02'),
	(35, 'CASE-PITAKA-MAGEZ5', 'simple', NULL, 1, NULL, '2026-10-05 23:22:02', '2026-10-05 23:22:02'),
	(36, 'CASE-SPIGEN-TOUGH-MAGFIT', 'simple', NULL, 1, NULL, '2026-10-05 23:22:02', '2026-10-05 23:22:02'),
	(37, 'GLASS-TORRAS-DIAMOND', 'simple', NULL, 1, NULL, '2026-10-05 23:22:02', '2026-10-05 23:22:02'),
	(38, 'SP-TEST-01', 'simple', NULL, 1, NULL, '2026-10-21 22:37:35', '2026-10-21 22:45:23'),
	(39, 'MOUSE-RAZER-V3PRO', 'simple', NULL, 1, NULL, '2026-11-03 14:50:34', '2026-11-03 14:50:34'),
	(40, 'GLASS-TORRAS-SSSSS', 'simple', NULL, 1, NULL, '2026-11-03 14:53:06', '2026-11-03 14:53:06');

-- Dumping structure for table bagisto_db.product_attribute_values
CREATE TABLE IF NOT EXISTS `product_attribute_values` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `boolean_value` tinyint(1) DEFAULT NULL,
  `integer_value` int DEFAULT NULL,
  `float_value` decimal(12,4) DEFAULT NULL,
  `datetime_value` datetime DEFAULT NULL,
  `date_value` date DEFAULT NULL,
  `json_value` json DEFAULT NULL,
  `product_id` int unsigned NOT NULL,
  `attribute_id` int unsigned NOT NULL,
  `unique_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `chanel_locale_attribute_value_index_unique` (`channel`,`locale`,`attribute_id`,`product_id`),
  UNIQUE KEY `product_attribute_values_unique_id_unique` (`unique_id`),
  KEY `product_attribute_values_attribute_id_foreign` (`attribute_id`),
  KEY `prod_attr_product_id_idx` (`product_id`),
  CONSTRAINT `product_attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_attribute_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=943 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_attribute_values: ~900 rows (approximately)
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES
	(1, NULL, NULL, 'TEST-001', NULL, NULL, NULL, NULL, NULL, NULL, 2, 1, '2|1'),
	(2, 'en', NULL, 'Test Product', NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, 'en|2|2'),
	(3, 'en', NULL, 'test-product-001', NULL, NULL, NULL, NULL, NULL, NULL, 2, 3, 'en|2|3'),
	(4, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 2, 28, 'default|2|28'),
	(5, NULL, NULL, NULL, NULL, NULL, 100.0000, NULL, NULL, NULL, 2, 11, '2|11'),
	(6, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 29, 'default|2|29'),
	(7, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 5, '2|5'),
	(8, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 6, '2|6'),
	(9, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 7, '2|7'),
	(10, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 2, 8, 'default|2|8'),
	(11, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2, 26, '2|26'),
	(12, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, 2, 22, '2|22'),
	(13, 'en', NULL, '<p>Test short desc</p>', NULL, NULL, NULL, NULL, NULL, NULL, 3, 9, 'en|3|9'),
	(14, 'en', NULL, '<p>Test full desc</p>', NULL, NULL, NULL, NULL, NULL, NULL, 3, 10, 'en|3|10'),
	(15, NULL, NULL, 'PHONE-TEST-002', NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, '3|1'),
	(16, 'en', NULL, 'iPhone 16 Pro Max Test', NULL, NULL, NULL, NULL, NULL, NULL, 3, 2, 'en|3|2'),
	(17, 'en', NULL, 'iphone-16-pro-max-test', NULL, NULL, NULL, NULL, NULL, NULL, 3, 3, 'en|3|3'),
	(18, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 3, 28, 'default|3|28'),
	(19, NULL, NULL, NULL, NULL, NULL, 1199.0000, NULL, NULL, NULL, 3, 11, '3|11'),
	(20, NULL, NULL, NULL, NULL, NULL, 899.0000, NULL, NULL, NULL, 3, 12, '3|12'),
	(21, NULL, NULL, NULL, NULL, NULL, 1129.0000, NULL, NULL, NULL, 3, 13, '3|13'),
	(22, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL, 3, 14, 'default|3|14'),
	(23, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2027-12-31', NULL, 3, 15, 'default|3|15'),
	(24, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 3, 29, 'default|3|29'),
	(25, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 3, 5, '3|5'),
	(26, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 3, 6, '3|6'),
	(27, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 3, 7, '3|7'),
	(28, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 3, 8, 'default|3|8'),
	(29, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 3, 26, '3|26'),
	(30, NULL, NULL, '0.35', NULL, NULL, NULL, NULL, NULL, NULL, 3, 22, '3|22'),
	(31, 'en', NULL, '<p>The ultimate flagship gaming phone featuring an ultra-smooth 165Hz AMOLED display, AirTrigger ultrasonic touch sensors, and GameCool 8 3D vapor chamber cooling system.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 5, 9, 'en|5|9'),
	(32, 'en', NULL, '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">The ultimate flagship gaming phone featuring an ultra-smooth 165Hz AMOLED display, AirTrigger ultrasonic touch sensors, and GameCool 8 3D vapor chamber cooling system.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Display</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">6.78 inch Samsung E6 Flexible AMOLED 165Hz LTPO 2500 nits</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Processor</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Snapdragon 8 Gen 3 clocked up to 3.3GHz</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Memory &amp; Storage</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">16GB LPDDR5X RAM, 512GB UFS 4.0 storage</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">LED Lighting</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">AniMe Vision secondary matrix display with 341 customizable mini-LEDs</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Battery &amp; Charging</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">5,500 mAh, 65W HyperCharge fast charging, 15W Qi wireless charging</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Gaming Features</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">AirTrigger 8, dual USB-C ports (side &amp; bottom), IP68 water resistance</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', NULL, NULL, NULL, NULL, NULL, NULL, 5, 10, 'en|5|10'),
	(33, NULL, NULL, 'PHONE-ROG8PRO-512', NULL, NULL, NULL, NULL, NULL, NULL, 5, 1, '5|1'),
	(34, 'en', NULL, 'ASUS ROG Phone 8 Pro 16GB/512GB Gaming Snapdragon 8 Gen 3', NULL, NULL, NULL, NULL, NULL, NULL, 5, 2, 'en|5|2'),
	(35, 'en', NULL, 'asus-rog-phone-8-pro-16gb512gb-gaming-snapdragon-8-gen-3-nom6', NULL, NULL, NULL, NULL, NULL, NULL, 5, 3, 'en|5|3'),
	(36, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 5, 28, 'default|5|28'),
	(37, NULL, NULL, NULL, NULL, NULL, 1099.0000, NULL, NULL, NULL, 5, 11, '5|11'),
	(38, NULL, NULL, NULL, NULL, NULL, 824.2500, NULL, NULL, NULL, 5, 12, '5|12'),
	(39, NULL, NULL, NULL, NULL, NULL, 999.0000, NULL, NULL, NULL, 5, 13, '5|13'),
	(40, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL, 5, 14, 'default|5|14'),
	(41, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2027-12-31', NULL, 5, 15, 'default|5|15'),
	(42, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 5, 29, 'default|5|29'),
	(43, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 5, 5, '5|5'),
	(44, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 5, 6, '5|6'),
	(45, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 5, 7, '5|7'),
	(46, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 5, 8, 'default|5|8'),
	(47, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 5, 26, '5|26'),
	(48, NULL, NULL, '0.35', NULL, NULL, NULL, NULL, NULL, NULL, 5, 22, '5|22'),
	(49, 'en', NULL, '<p>The pinnacle of mobile photography co-engineered with Leica, featuring a quad 50MP camera array with a 1-inch sensor and stepless variable aperture.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 6, 9, 'en|6|9'),
	(50, 'en', NULL, '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">The pinnacle of mobile photography co-engineered with Leica, featuring a quad 50MP camera array with a 1-inch sensor and stepless variable aperture.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Display</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">6.73 inch LTPO AMOLED WQHD+ 120Hz 3000 nits Dolby Vision</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Processor</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Qualcomm Snapdragon 8 Gen 3</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Memory &amp; Storage</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">16GB LPDDR5X RAM, 512GB UFS 4.0 storage</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Camera Leica</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">50MP LYT-900 1-inch OIS stepless variable aperture f/1.63 - f/4.0</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Battery &amp; Charging</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">5,000 mAh, 90W HyperCharge wired fast charging, 80W wireless charging</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', NULL, NULL, NULL, NULL, NULL, NULL, 6, 10, 'en|6|10'),
	(51, NULL, NULL, 'PHONE-XM14U-512', NULL, NULL, NULL, NULL, NULL, NULL, 6, 1, '6|1'),
	(52, 'en', NULL, 'Xiaomi 14 Ultra 16GB/512GB Leica Quad Camera 1-inch Sensor', NULL, NULL, NULL, NULL, NULL, NULL, 6, 2, 'en|6|2'),
	(53, 'en', NULL, 'xiaomi-14-ultra-16gb512gb-leica-quad-camera-1-inch-sensor-7anx', NULL, NULL, NULL, NULL, NULL, NULL, 6, 3, 'en|6|3'),
	(54, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 6, 28, 'default|6|28'),
	(55, NULL, NULL, NULL, NULL, NULL, 1149.0000, NULL, NULL, NULL, 6, 11, '6|11'),
	(56, NULL, NULL, NULL, NULL, NULL, 861.7500, NULL, NULL, NULL, 6, 12, '6|12'),
	(57, NULL, NULL, NULL, NULL, NULL, 1049.0000, NULL, NULL, NULL, 6, 13, '6|13'),
	(58, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL, 6, 14, 'default|6|14'),
	(59, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2027-12-31', NULL, 6, 15, 'default|6|15'),
	(60, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 6, 29, 'default|6|29'),
	(61, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 6, 5, '6|5'),
	(62, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 6, 6, '6|6'),
	(63, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 6, 7, '6|7'),
	(64, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 6, 8, 'default|6|8'),
	(65, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 6, 26, '6|26'),
	(66, NULL, NULL, '0.35', NULL, NULL, NULL, NULL, NULL, NULL, 6, 22, '6|22'),
	(67, 'en', NULL, '<p>Anker\'s most advanced GaN charger with 140W max output (PD 3.1), fast charging a 16-inch MacBook Pro and two iPhones simultaneously at top speed.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 7, 9, 'en|7|9'),
	(68, 'en', NULL, '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Anker\'s most advanced GaN charger with 140W max output (PD 3.1), fast charging a 16-inch MacBook Pro and two iPhones simultaneously at top speed.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Total Output</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">140W Max (Supports USB Power Delivery 3.1 standard)</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Ports</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">2 x USB-C (140W max per port), 1 x USB-A (22.5W)</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Technology</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">GaNPrime, ActiveShield 2.0 real-time temperature monitoring 3M times/day</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Compatibility</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">MacBook Pro, Dell XPS, iPhone 16/15, Samsung 45W Super Fast Charging 2.0</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Dimensions</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">39% smaller than standard Apple 140W power adapter</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', NULL, NULL, NULL, NULL, NULL, NULL, 7, 10, 'en|7|10'),
	(69, NULL, NULL, 'CHG-ANKER-737-140W', NULL, NULL, NULL, NULL, NULL, NULL, 7, 1, '7|1'),
	(70, 'en', NULL, 'Anker 737 GaNPrime 140W 3-Port Wall Charger (A2341)', NULL, NULL, NULL, NULL, NULL, NULL, 7, 2, 'en|7|2'),
	(71, 'en', NULL, 'cu-sac-gan-anker-737-ganprime-140w-3-cong-a2341-gquz', NULL, NULL, NULL, NULL, NULL, NULL, 7, 3, 'en|7|3'),
	(72, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 7, 28, 'default|7|28'),
	(73, NULL, NULL, NULL, NULL, NULL, 99.9900, NULL, NULL, NULL, 7, 11, '7|11'),
	(74, NULL, NULL, NULL, NULL, NULL, 74.9900, NULL, NULL, NULL, 7, 12, '7|12'),
	(75, NULL, NULL, NULL, NULL, NULL, 84.9900, NULL, NULL, NULL, 7, 13, '7|13'),
	(76, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL, 7, 14, 'default|7|14'),
	(77, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2027-12-31', NULL, 7, 15, 'default|7|15'),
	(78, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 7, 29, 'default|7|29'),
	(79, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 7, 5, '7|5'),
	(80, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 7, 6, '7|6'),
	(81, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 7, 7, '7|7'),
	(82, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 7, 8, 'default|7|8'),
	(83, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 7, 26, '7|26'),
	(84, NULL, NULL, '0.35', NULL, NULL, NULL, NULL, NULL, NULL, 7, 22, '7|22'),
	(85, 'en', NULL, '<p>Ultra-slim 18mm card-style profile easily slips into backpacks and sleeves, delivering 100W high power with intelligent 4-port power distribution.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 8, 9, 'en|8|9'),
	(86, 'en', NULL, '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Ultra-slim 18mm card-style profile easily slips into backpacks and sleeves, delivering 100W high power with intelligent 4-port power distribution.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Power</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">100W Max</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Output Ports</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">2x Type-C (100W), 2x USB-A (30W)</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Profile</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Only 1.8cm ultra-compact card profile design</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Protection</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Auto power shutoff when full, comprehensive overvoltage, overcurrent, and overheat protections</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', NULL, NULL, NULL, NULL, NULL, NULL, 8, 10, 'en|8|10'),
	(87, NULL, NULL, 'CHG-BASEUS-BLADE-100W', NULL, NULL, NULL, NULL, NULL, NULL, 8, 1, '8|1'),
	(88, 'en', NULL, 'Baseus Blade HD GaN 100W Ultra-Slim Fast Charger PD 3.0 & QC 4.0', NULL, NULL, NULL, NULL, NULL, NULL, 8, 2, 'en|8|2'),
	(89, 'en', NULL, 'cu-sac-sieu-mong-baseus-blade-hd-gan-100w-pd-30-qc-40-a1gh', NULL, NULL, NULL, NULL, NULL, NULL, 8, 3, 'en|8|3'),
	(90, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 8, 28, 'default|8|28'),
	(91, NULL, NULL, NULL, NULL, NULL, 69.9900, NULL, NULL, NULL, 8, 11, '8|11'),
	(92, NULL, NULL, NULL, NULL, NULL, 52.4900, NULL, NULL, NULL, 8, 12, '8|12'),
	(93, NULL, NULL, NULL, NULL, NULL, 54.9900, NULL, NULL, NULL, 8, 13, '8|13'),
	(94, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL, 8, 14, 'default|8|14'),
	(95, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2027-12-31', NULL, 8, 15, 'default|8|15'),
	(96, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 8, 29, 'default|8|29'),
	(97, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 8, 5, '8|5'),
	(98, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 8, 6, '8|6'),
	(99, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 8, 7, '8|7'),
	(100, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 8, 8, 'default|8|8'),
	(101, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 8, 26, '8|26'),
	(102, NULL, NULL, '0.35', NULL, NULL, NULL, NULL, NULL, NULL, 8, 22, '8|22'),
	(103, 'en', NULL, '<p>High-powered desktop charging station capable of fast charging 3 high-performance laptops and 2 smartphones simultaneously at maximum speed.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 9, 9, 'en|9|9'),
	(104, 'en', NULL, '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">High-powered desktop charging station capable of fast charging 3 high-performance laptops and 2 smartphones simultaneously at maximum speed.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Total Power</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">300W Max</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Main Port Type-C1</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">140W Max dedicated output (PD 3.1)</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">GaN Chipset</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">GaNFast Gen III optimizing efficiency up to 95%</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Power Cord</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">2m detachable heavy-duty AC extension cable for desktop setups</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', NULL, NULL, NULL, NULL, NULL, NULL, 9, 10, 'en|9|10'),
	(105, NULL, NULL, 'CHG-UGREEN-NEXODE-300W', NULL, NULL, NULL, NULL, NULL, NULL, 9, 1, '9|1'),
	(106, 'en', NULL, 'Ugreen Nexode GaN 300W 5-Port Desktop Charger Station', NULL, NULL, NULL, NULL, NULL, NULL, 9, 2, 'en|9|2'),
	(107, 'en', NULL, 'tram-sac-de-ban-ugreen-nexode-gan-300w-5-cong-sac-3-laptop-oox7', NULL, NULL, NULL, NULL, NULL, NULL, 9, 3, 'en|9|3'),
	(108, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 9, 28, 'default|9|28'),
	(109, NULL, NULL, NULL, NULL, NULL, 199.9900, NULL, NULL, NULL, 9, 11, '9|11'),
	(110, NULL, NULL, NULL, NULL, NULL, 149.9900, NULL, NULL, NULL, 9, 12, '9|12'),
	(111, NULL, NULL, NULL, NULL, NULL, 169.9900, NULL, NULL, NULL, 9, 13, '9|13'),
	(112, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL, 9, 14, 'default|9|14'),
	(113, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2027-12-31', NULL, 9, 15, 'default|9|15'),
	(114, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 9, 29, 'default|9|29'),
	(115, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 9, 5, '9|5'),
	(116, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 9, 6, '9|6'),
	(117, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 9, 7, '9|7'),
	(118, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 9, 8, 'default|9|8'),
	(119, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 9, 26, '9|26'),
	(120, NULL, NULL, '0.35', NULL, NULL, NULL, NULL, NULL, NULL, 9, 22, '9|22'),
	(121, 'en', NULL, '<p>Cyberpunk-inspired transparent power bank with an IPS color smart screen displaying real-time voltage, current, battery temperature, and wattage.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 10, 9, 'en|10|9'),
	(122, 'en', NULL, '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Cyberpunk-inspired transparent power bank with an IPS color smart screen displaying real-time voltage, current, battery temperature, and wattage.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Capacity</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">25,600 mAh / 93.5Wh (Airline approved carry-on standard)</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Type-C Output</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">100W Max PD In/Out (Fully recharges power bank in just 90 mins)</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Adjustable DC Port</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">3.3V - 25.2V customizable output up to 75W</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Display</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">1.14-inch IPS color screen with real-time power metrics</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Battery Cells</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">8x 18650 premium electric vehicle-grade battery cells</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', NULL, NULL, NULL, NULL, NULL, NULL, 10, 10, 'en|10|10'),
	(123, NULL, NULL, 'PB-SHARGEEK-STORM2-100W', NULL, NULL, NULL, NULL, NULL, NULL, 10, 1, '10|1'),
	(124, 'en', NULL, 'Shargeek Storm 2 25600mAh 100W Transparent Cyberpunk Power Bank', NULL, NULL, NULL, NULL, NULL, NULL, 10, 2, 'en|10|2'),
	(125, 'en', NULL, 'pin-du-phong-shargeek-storm-2-25600mah-100w-trong-suot-ips-screen-mdiv', NULL, NULL, NULL, NULL, NULL, NULL, 10, 3, 'en|10|3'),
	(126, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 10, 28, 'default|10|28'),
	(127, NULL, NULL, NULL, NULL, NULL, 219.0000, NULL, NULL, NULL, 10, 11, '10|11'),
	(128, NULL, NULL, NULL, NULL, NULL, 164.2500, NULL, NULL, NULL, 10, 12, '10|12'),
	(129, NULL, NULL, NULL, NULL, NULL, 189.0000, NULL, NULL, NULL, 10, 13, '10|13'),
	(130, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL, 10, 14, 'default|10|14'),
	(131, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2027-12-31', NULL, 10, 15, 'default|10|15'),
	(132, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 10, 29, 'default|10|29'),
	(133, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 10, 5, '10|5'),
	(134, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 10, 6, '10|6'),
	(135, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 10, 7, '10|7'),
	(136, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 10, 8, 'default|10|8'),
	(137, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 10, 26, '10|26'),
	(138, NULL, NULL, '0.35', NULL, NULL, NULL, NULL, NULL, NULL, 10, 22, '10|22'),
	(139, 'en', NULL, '<p>Modern column design with dual 100W USB-C ports, enabling simultaneous 100W fast charging for two MacBook Pro laptops.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 11, 9, 'en|11|9'),
	(140, 'en', NULL, '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Modern column design with dual 100W USB-C ports, enabling simultaneous 100W fast charging for two MacBook Pro laptops.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Capacity</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">20.000 mAh</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Max Output Power</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">200W (Dual-port 100W + 100W)</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Ports</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">2x USB-C (100W), 1x USB-A (65W)</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Display</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Color Smart Display showing real-time battery level &amp; wattage</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', NULL, NULL, NULL, NULL, NULL, NULL, 11, 10, 'en|11|10'),
	(141, NULL, NULL, 'PB-ANKER-PRIME-20000', NULL, NULL, NULL, NULL, NULL, NULL, 11, 1, '11|1'),
	(142, 'en', NULL, 'Anker Prime 20000mAh 200W Multi-Device Power Bank', NULL, NULL, NULL, NULL, NULL, NULL, 11, 2, 'en|11|2'),
	(143, 'en', NULL, 'pin-du-phong-anker-prime-20000mah-200w-output-da-nang-m6up', NULL, NULL, NULL, NULL, NULL, NULL, 11, 3, 'en|11|3'),
	(144, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 11, 28, 'default|11|28'),
	(145, NULL, NULL, NULL, NULL, NULL, 129.9900, NULL, NULL, NULL, 11, 11, '11|11'),
	(146, NULL, NULL, NULL, NULL, NULL, 97.4900, NULL, NULL, NULL, 11, 12, '11|12'),
	(147, NULL, NULL, NULL, NULL, NULL, 109.9900, NULL, NULL, NULL, 11, 13, '11|13'),
	(148, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL, 11, 14, 'default|11|14'),
	(149, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2027-12-31', NULL, 11, 15, 'default|11|15'),
	(150, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 11, 29, 'default|11|29'),
	(151, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 11, 5, '11|5'),
	(152, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 11, 6, '11|6'),
	(153, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 11, 7, '11|7'),
	(154, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 11, 8, 'default|11|8'),
	(155, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 11, 26, '11|26'),
	(156, NULL, NULL, '0.35', NULL, NULL, NULL, NULL, NULL, NULL, 11, 22, '11|22'),
	(157, 'en', NULL, '<p>Industry-leading true wireless active noise canceling earbuds, powered by the Dynamic Driver X for deep, immersive bass and crystal-clear acoustic detail.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 12, 9, 'en|12|9'),
	(158, 'en', NULL, '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Industry-leading true wireless active noise canceling earbuds, powered by the Dynamic Driver X for deep, immersive bass and crystal-clear acoustic detail.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Noise Cancellation</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Dual Integrated Processor V2 and HD Noise Canceling Processor QN2e</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Audio Quality</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Hi-Res Audio Wireless, LDAC, DSEE Extreme AI</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Battery Life</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">8 hrs (ANC on) + 16 hrs from charging case (24 hrs total)</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Microphones</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Bone conduction sensors and AI noise-reduction call algorithm</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Water Resistance</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">IPX4 splash and sweat resistance standard</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', NULL, NULL, NULL, NULL, NULL, NULL, 12, 10, 'en|12|10'),
	(159, NULL, NULL, 'EAR-SONY-WF1000XM5', NULL, NULL, NULL, NULL, NULL, NULL, 12, 1, '12|1'),
	(160, 'en', NULL, 'Sony WF-1000XM5 Flagship Noise Canceling Earbuds Hi-Res LDAC', NULL, NULL, NULL, NULL, NULL, NULL, 12, 2, 'en|12|2'),
	(161, 'en', NULL, 'tai-nghe-sony-wf-1000xm5-chong-on-dau-bang-hi-res-ldac-fyam', NULL, NULL, NULL, NULL, NULL, NULL, 12, 3, 'en|12|3'),
	(162, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 12, 28, 'default|12|28'),
	(163, NULL, NULL, NULL, NULL, NULL, 299.9900, NULL, NULL, NULL, 12, 11, '12|11'),
	(164, NULL, NULL, NULL, NULL, NULL, 224.9900, NULL, NULL, NULL, 12, 12, '12|12'),
	(165, NULL, NULL, NULL, NULL, NULL, 249.9900, NULL, NULL, NULL, 12, 13, '12|13'),
	(166, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL, 12, 14, 'default|12|14'),
	(167, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2027-12-31', NULL, 12, 15, 'default|12|15'),
	(168, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 12, 29, 'default|12|29'),
	(169, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 12, 5, '12|5'),
	(170, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 12, 6, '12|6'),
	(171, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 12, 7, '12|7'),
	(172, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 12, 8, 'default|12|8'),
	(173, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 12, 26, '12|26'),
	(174, NULL, NULL, '0.35', NULL, NULL, NULL, NULL, NULL, NULL, 12, 22, '12|22'),
	(175, 'en', NULL, '<p>The ultimate audio weapon for gamers featuring dual-mode 2.4GHz ultra-low latency wireless via USB-C Dongle, eliminating sound lag in competitive FPS and MOBA games.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 13, 9, 'en|13|9'),
	(176, 'en', NULL, '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">The ultimate audio weapon for gamers featuring dual-mode 2.4GHz ultra-low latency wireless via USB-C Dongle, eliminating sound lag in competitive FPS and MOBA games.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Dual Wireless</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">ROG SpeedNova 2.4GHz wireless (via USB-C Dongle) &amp; Bluetooth 5.3</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Audio Quality</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">High-resolution 24-bit 96kHz spatial audio</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Noise Cancellation</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Adaptive Hybrid ANC intelligent environmental noise reduction</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Microphones</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">AI Bone-Conduction microphones for crystal-clear voice chat</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Battery Life</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Up to 46 hours total playtime (Bluetooth mode)</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', NULL, NULL, NULL, NULL, NULL, NULL, 13, 10, 'en|13|10'),
	(177, NULL, NULL, 'EAR-ROG-CETRA-SPEEDNOVA', NULL, NULL, NULL, NULL, NULL, NULL, 13, 1, '13|1'),
	(178, 'en', NULL, 'ASUS ROG Cetra True Wireless SpeedNova 2.4GHz Gaming Earbuds', NULL, NULL, NULL, NULL, NULL, NULL, 13, 2, 'en|13|2'),
	(179, 'en', NULL, 'tai-nghe-gaming-rog-cetra-true-wireless-speednova-24ghz-vjr4', NULL, NULL, NULL, NULL, NULL, NULL, 13, 3, 'en|13|3'),
	(180, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 13, 28, 'default|13|28'),
	(181, NULL, NULL, NULL, NULL, NULL, 199.9900, NULL, NULL, NULL, 13, 11, '13|11'),
	(182, NULL, NULL, NULL, NULL, NULL, 149.9900, NULL, NULL, NULL, 13, 12, '13|12'),
	(183, NULL, NULL, NULL, NULL, NULL, 179.9900, NULL, NULL, NULL, 13, 13, '13|13'),
	(184, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL, 13, 14, 'default|13|14'),
	(185, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2027-12-31', NULL, 13, 15, 'default|13|15'),
	(186, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 13, 29, 'default|13|29'),
	(187, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 13, 5, '13|5'),
	(188, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 13, 6, '13|6'),
	(189, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 13, 7, '13|7'),
	(190, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 13, 8, 'default|13|8'),
	(191, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 13, 26, '13|26'),
	(192, NULL, NULL, '0.35', NULL, NULL, NULL, NULL, NULL, NULL, 13, 22, '13|22'),
	(193, 'en', NULL, '<p>High-powered 36W magnetic phone cooler with instant freezing technology, snapping securely to MagSafe to cool devices within 3 seconds.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 14, 9, 'en|14|9'),
	(194, 'en', NULL, '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">High-powered 36W magnetic phone cooler with instant freezing technology, snapping securely to MagSafe to cool devices within 3 seconds.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Power</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">36W Max (Requires 9V/3A or higher fast charger)</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Cooling Capacity</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Drops surface temperature below -12°C, preventing thermal throttling in heavy games</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Mounting</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Direct MagSafe magnetic mount for iPhone or included universal clamp for Android</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Controls</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Bluetooth app connectivity to customize fan speed and 16.8M color RGB lighting</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', NULL, NULL, NULL, NULL, NULL, NULL, 14, 10, 'en|14|10'),
	(195, NULL, NULL, 'COOL-REDMAGIC-5PRO', NULL, NULL, NULL, NULL, NULL, NULL, 14, 1, '14|1'),
	(196, 'en', NULL, 'RedMagic Magnetic Cooler 5 Pro 36W Magnetic Phone Cooler', NULL, NULL, NULL, NULL, NULL, NULL, 14, 2, 'en|14|2'),
	(197, 'en', NULL, 'so-lanh-tan-nhiet-tu-tinh-redmagic-magnetic-cooler-5-pro-36w-clgk', NULL, NULL, NULL, NULL, NULL, NULL, 14, 3, 'en|14|3'),
	(198, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 14, 28, 'default|14|28'),
	(199, NULL, NULL, NULL, NULL, NULL, 59.9900, NULL, NULL, NULL, 14, 11, '14|11'),
	(200, NULL, NULL, NULL, NULL, NULL, 44.9900, NULL, NULL, NULL, 14, 12, '14|12'),
	(201, NULL, NULL, NULL, NULL, NULL, 49.9900, NULL, NULL, NULL, 14, 13, '14|13'),
	(202, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL, 14, 14, 'default|14|14'),
	(203, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2027-12-31', NULL, 14, 15, 'default|14|15'),
	(204, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 14, 29, 'default|14|29'),
	(205, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 14, 5, '14|5'),
	(206, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 14, 6, '14|6'),
	(207, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 14, 7, '14|7'),
	(208, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 14, 8, 'default|14|8'),
	(209, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 14, 26, '14|26'),
	(210, NULL, NULL, '0.35', NULL, NULL, NULL, NULL, NULL, NULL, 14, 22, '14|22'),
	(211, 'en', NULL, '<p>Large-area TEC semiconductor cooler from Black Shark featuring a real-time digital temperature LED display directly on the device body.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 15, 9, 'en|15|9'),
	(212, 'en', NULL, '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Large-area TEC semiconductor cooler from Black Shark featuring a real-time digital temperature LED display directly on the device body.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Power</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">27W TEC Cooling Engine</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Noise Level</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Whisper-quiet below 35dB, zero mic interference during voice calls</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Display</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Real-time digital LED temperature readout</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Clamp Mechanism</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Flexible silicone-cushioned clamp compatible with all phones 67mm - 88mm wide</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', NULL, NULL, NULL, NULL, NULL, NULL, 15, 10, 'en|15|10'),
	(213, NULL, NULL, 'COOL-BLACKSHARK-4PRO', NULL, NULL, NULL, NULL, NULL, NULL, 15, 1, '15|1'),
	(214, 'en', NULL, 'Black Shark FunCooler 4 Pro 27W Semiconductor Phone Cooler', NULL, NULL, NULL, NULL, NULL, NULL, 15, 2, 'en|15|2'),
	(215, 'en', NULL, 'quat-so-lanh-black-shark-funcooler-4-pro-27w-lanh-dong-bang-mfvo', NULL, NULL, NULL, NULL, NULL, NULL, 15, 3, 'en|15|3'),
	(216, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 15, 28, 'default|15|28'),
	(217, NULL, NULL, NULL, NULL, NULL, 45.0000, NULL, NULL, NULL, 15, 11, '15|11'),
	(218, NULL, NULL, NULL, NULL, NULL, 33.7500, NULL, NULL, NULL, 15, 12, '15|12'),
	(219, NULL, NULL, NULL, NULL, NULL, 38.0000, NULL, NULL, NULL, 15, 13, '15|13'),
	(220, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL, 15, 14, 'default|15|14'),
	(221, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2027-12-31', NULL, 15, 15, 'default|15|15'),
	(222, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 15, 29, 'default|15|29'),
	(223, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 15, 5, '15|5'),
	(224, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 15, 6, '15|6'),
	(225, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 15, 7, '15|7'),
	(226, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 15, 8, 'default|15|8'),
	(227, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 15, 26, '15|26'),
	(228, NULL, NULL, '0.35', NULL, NULL, NULL, NULL, NULL, NULL, 15, 22, '15|22'),
	(229, 'en', NULL, '<p>Premium multi-purpose cable supporting 8K UHD video output, lightning-fast 40Gbps data transfer, and up to 240W ultra-high power delivery.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 16, 9, 'en|16|9'),
	(230, 'en', NULL, '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Premium multi-purpose cable supporting 8K UHD video output, lightning-fast 40Gbps data transfer, and up to 240W ultra-high power delivery.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Bandwidth</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">40Gbps ultra-speed transfer (transfers 10GB file in ~3 seconds)</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Charging Power</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">240W (48V/5A) USB Power Delivery Extended Power Range (EPR)</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Display Output</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Single 8K@60Hz or dual 4K@60Hz displays</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Durability</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Aluminum alloy housings and durable nylon braided exterior rated for 20,000+ bends</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', NULL, NULL, NULL, NULL, NULL, NULL, 16, 10, 'en|16|10'),
	(231, NULL, NULL, 'CAB-UGREEN-TB4-240W', NULL, NULL, NULL, NULL, NULL, NULL, 16, 1, '16|1'),
	(232, 'en', NULL, 'Ugreen Thunderbolt 4 Type-C 240W 40Gbps 8K Fast Charging & Data Cable', NULL, NULL, NULL, NULL, NULL, NULL, 16, 2, 'en|16|2'),
	(233, 'en', NULL, 'cap-sac-du-lieu-ugreen-thunderbolt-4-type-c-240w-40gbps-8k-x5rb', NULL, NULL, NULL, NULL, NULL, NULL, 16, 3, 'en|16|3'),
	(234, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 16, 28, 'default|16|28'),
	(235, NULL, NULL, NULL, NULL, NULL, 34.9900, NULL, NULL, NULL, 16, 11, '16|11'),
	(236, NULL, NULL, NULL, NULL, NULL, 26.2400, NULL, NULL, NULL, 16, 12, '16|12'),
	(237, NULL, NULL, NULL, NULL, NULL, 27.9900, NULL, NULL, NULL, 16, 13, '16|13'),
	(238, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL, 16, 14, 'default|16|14'),
	(239, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2027-12-31', NULL, 16, 15, 'default|16|15'),
	(240, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 16, 29, 'default|16|29'),
	(241, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 16, 5, '16|5'),
	(242, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 16, 6, '16|6'),
	(243, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 16, 7, '16|7'),
	(244, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 16, 8, 'default|16|8'),
	(245, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 16, 26, '16|26'),
	(246, NULL, NULL, '0.35', NULL, NULL, NULL, NULL, NULL, NULL, 16, 22, '16|22'),
	(247, 'en', NULL, '<p>Legendary multi-layer protective armor case combining genuine DuPont Kevlar fiber, strong MagSafe magnets, and honeycomb shock-absorbing bumpers.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 17, 9, 'en|17|9'),
	(248, 'en', NULL, '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Legendary multi-layer protective armor case combining genuine DuPont Kevlar fiber, strong MagSafe magnets, and honeycomb shock-absorbing bumpers.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Shock Protection</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Tested to 25 ft. (7.6 meters) drop protection (MIL-STD 810G 516.6)</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Materials</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Reinforced DuPont Kevlar fiber, alloy metal hardware, and impact-resistant TPU</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">MagSafe</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Built-in strong N52 Neodymium magnetic array</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Camera Protection</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Elevated perimeter bezel defends expensive camera lenses against scratches</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', NULL, NULL, NULL, NULL, NULL, NULL, 17, 10, 'en|17|10'),
	(249, NULL, NULL, 'CASE-UAG-MONARCH-PRO', NULL, NULL, NULL, NULL, NULL, NULL, 17, 1, '17|1'),
	(250, 'en', NULL, 'UAG Monarch Pro Kevlar MagSafe Military Drop-Tested Rugged Case', NULL, NULL, NULL, NULL, NULL, NULL, 17, 2, 'en|17|2'),
	(251, 'en', NULL, 'op-lung-uag-monarch-pro-kevlar-magsafe-chong-va-dap-quan-doi-svwr', NULL, NULL, NULL, NULL, NULL, NULL, 17, 3, 'en|17|3'),
	(252, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 17, 28, 'default|17|28'),
	(253, NULL, NULL, NULL, NULL, NULL, 79.9500, NULL, NULL, NULL, 17, 11, '17|11'),
	(254, NULL, NULL, NULL, NULL, NULL, 59.9600, NULL, NULL, NULL, 17, 12, '17|12'),
	(255, NULL, NULL, NULL, NULL, NULL, 69.9500, NULL, NULL, NULL, 17, 13, '17|13'),
	(256, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL, 17, 14, 'default|17|14'),
	(257, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2027-12-31', NULL, 17, 15, 'default|17|15'),
	(258, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 17, 29, 'default|17|29'),
	(259, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 17, 5, '17|5'),
	(260, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 17, 6, '17|6'),
	(261, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 17, 7, '17|7'),
	(262, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 17, 8, 'default|17|8'),
	(263, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 17, 26, '17|26'),
	(264, NULL, NULL, '0.35', NULL, NULL, NULL, NULL, NULL, NULL, 17, 22, '17|22'),
	(265, 'en', NULL, '<p>Ultra-thin 0.29mm glass engineered with German double ion-exchange technology, providing up to 2.7x greater strength than conventional tempered glass.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 18, 9, 'en|18|9'),
	(266, 'en', NULL, '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Ultra-thin 0.29mm glass engineered with German double ion-exchange technology, providing up to 2.7x greater strength than conventional tempered glass.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid rgb(229,231,235);margin-bottom:24px;height:89.6px;">\r\n<tbody>\r\n<tr style="background-color:rgb(249,250,251);border-bottom:1px solid rgb(229,231,235);height:22.4px;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:rgb(55,65,81);font-size:14px;height:22.4px;">Hardness</td>\r\n<td style="padding:10px 16px;color:rgb(75,85,99);font-size:14px;height:22.4px;">9H+ Double Ion-Exchange strengthened glass</td>\r\n</tr>\r\n<tr style="background-color:rgb(255,255,255);border-bottom:1px solid rgb(229,231,235);height:22.4px;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:rgb(55,65,81);font-size:14px;height:22.4px;">Privacy</td>\r\n<td style="padding:10px 16px;color:rgb(75,85,99);font-size:14px;height:22.4px;">2-way 28-degree side privacy filter keeps screen confidential in public spaces</td>\r\n</tr>\r\n<tr style="background-color:rgb(249,250,251);border-bottom:1px solid rgb(229,231,235);height:22.4px;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:rgb(55,65,81);font-size:14px;height:22.4px;">Touch Sensitivity</td>\r\n<td style="padding:10px 16px;color:rgb(75,85,99);font-size:14px;height:22.4px;">0.29mm ultra-slim profile preserves 100% native touch precision and smooth Face ID</td>\r\n</tr>\r\n<tr style="background-color:rgb(255,255,255);border-bottom:1px solid rgb(229,231,235);height:22.4px;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:rgb(55,65,81);font-size:14px;height:22.4px;">Easy Align Tray</td>\r\n<td style="padding:10px 16px;color:rgb(75,85,99);font-size:14px;height:22.4px;">Includes patented alignment tray for 100% bubble-free, flawless home installation</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', NULL, NULL, NULL, NULL, NULL, NULL, 18, 10, 'en|18|10'),
	(267, NULL, NULL, 'GLASS-BELKIN-SAPPHIRE', NULL, NULL, NULL, NULL, NULL, NULL, 18, 1, '18|1'),
	(268, 'en', NULL, 'Belkin UltraGlass 2 Privacy 9H+ Ultra-Tough Tempered Glass Screen Protector', NULL, NULL, NULL, NULL, NULL, NULL, 18, 2, 'en|18|2'),
	(269, 'en', NULL, 'kinh-cuong-luc-belkin-ultraglass-2-chong-nhin-trom-sieu-cung-9h-3lsr', NULL, NULL, NULL, NULL, NULL, NULL, 18, 3, 'en|18|3'),
	(270, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 18, 28, 'default|18|28'),
	(271, NULL, NULL, NULL, NULL, NULL, 39.9900, NULL, NULL, NULL, 18, 11, '18|11'),
	(272, NULL, NULL, NULL, NULL, NULL, 29.9900, NULL, NULL, NULL, 18, 12, '18|12'),
	(273, NULL, NULL, NULL, NULL, NULL, 32.9900, NULL, NULL, NULL, 18, 13, '18|13'),
	(274, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL, 18, 14, 'default|18|14'),
	(275, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2027-12-31', NULL, 18, 15, 'default|18|15'),
	(276, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 18, 29, 'default|18|29'),
	(277, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 18, 5, '18|5'),
	(278, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 18, 6, '18|6'),
	(279, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 18, 7, '18|7'),
	(280, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 18, 8, 'default|18|8'),
	(281, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 18, 26, '18|26'),
	(282, NULL, NULL, '0.35', NULL, NULL, NULL, NULL, NULL, NULL, 18, 22, '18|22'),
	(283, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, 4, 'default|18|4'),
	(287, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 18, 27, '18|27'),
	(288, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 18, 16, 'en|18|16'),
	(289, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 18, 17, 'en|18|17'),
	(290, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 18, 18, 'en|18|18'),
	(291, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, 30, 'default|18|30'),
	(292, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 18, 19, '18|19'),
	(295, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, 4, 'default|17|4'),
	(296, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 17, 27, '17|27'),
	(297, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 17, 16, 'en|17|16'),
	(298, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 17, 17, 'en|17|17'),
	(299, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 17, 18, 'en|17|18'),
	(300, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, 30, 'default|17|30'),
	(301, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 17, 19, '17|19'),
	(302, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, 4, 'default|16|4'),
	(303, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 16, 27, '16|27'),
	(304, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 16, 16, 'en|16|16'),
	(305, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 16, 17, 'en|16|17'),
	(306, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 16, 18, 'en|16|18'),
	(307, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, 30, 'default|16|30'),
	(308, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 16, 19, '16|19'),
	(309, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, 4, 'default|15|4'),
	(310, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 15, 27, '15|27'),
	(311, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 15, 16, 'en|15|16'),
	(312, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 15, 17, 'en|15|17'),
	(313, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 15, 18, 'en|15|18'),
	(314, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, 30, 'default|15|30'),
	(315, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 15, 19, '15|19'),
	(316, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, 4, 'default|14|4'),
	(317, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 14, 27, '14|27'),
	(318, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 14, 16, 'en|14|16'),
	(319, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 14, 17, 'en|14|17'),
	(320, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 14, 18, 'en|14|18'),
	(321, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, 30, 'default|14|30'),
	(322, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 14, 19, '14|19'),
	(323, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, 4, 'default|13|4'),
	(324, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 13, 27, '13|27'),
	(325, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 13, 16, 'en|13|16'),
	(326, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 13, 17, 'en|13|17'),
	(327, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 13, 18, 'en|13|18'),
	(328, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, 30, 'default|13|30'),
	(329, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 13, 19, '13|19'),
	(330, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, 4, 'default|12|4'),
	(331, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 12, 27, '12|27'),
	(332, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 12, 16, 'en|12|16'),
	(333, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 12, 17, 'en|12|17'),
	(334, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 12, 18, 'en|12|18'),
	(335, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, 30, 'default|12|30'),
	(336, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 12, 19, '12|19'),
	(337, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, 4, 'default|11|4'),
	(338, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 11, 27, '11|27'),
	(339, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 11, 16, 'en|11|16'),
	(340, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 11, 17, 'en|11|17'),
	(341, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 11, 18, 'en|11|18'),
	(342, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, 30, 'default|11|30'),
	(343, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 11, 19, '11|19'),
	(344, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 4, 'default|10|4'),
	(345, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 10, 27, '10|27'),
	(346, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 10, 16, 'en|10|16'),
	(347, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 10, 17, 'en|10|17'),
	(348, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 10, 18, 'en|10|18'),
	(349, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 30, 'default|10|30'),
	(350, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 10, 19, '10|19'),
	(351, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 4, 'default|9|4'),
	(352, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 9, 27, '9|27'),
	(353, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 9, 16, 'en|9|16'),
	(354, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 9, 17, 'en|9|17'),
	(355, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 9, 18, 'en|9|18'),
	(356, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 30, 'default|9|30'),
	(357, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 9, 19, '9|19'),
	(358, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 4, 'default|8|4'),
	(359, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 8, 27, '8|27'),
	(360, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 8, 16, 'en|8|16'),
	(361, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 8, 17, 'en|8|17'),
	(362, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 8, 18, 'en|8|18'),
	(363, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 30, 'default|8|30'),
	(364, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 8, 19, '8|19'),
	(365, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 4, 'default|7|4'),
	(366, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 7, 27, '7|27'),
	(367, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 7, 16, 'en|7|16'),
	(368, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 7, 17, 'en|7|17'),
	(369, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 7, 18, 'en|7|18'),
	(370, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 30, 'default|7|30'),
	(371, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 7, 19, '7|19'),
	(372, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 4, 'default|5|4'),
	(373, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 5, 27, '5|27'),
	(374, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 5, 16, 'en|5|16'),
	(375, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 5, 17, 'en|5|17'),
	(376, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 5, 18, 'en|5|18'),
	(377, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 30, 'default|5|30'),
	(378, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 5, 19, '5|19'),
	(379, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 4, 'default|6|4'),
	(380, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 6, 27, '6|27'),
	(381, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 6, 16, 'en|6|16'),
	(382, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 6, 17, 'en|6|17'),
	(383, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 6, 18, 'en|6|18'),
	(384, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 30, 'default|6|30'),
	(385, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 6, 19, '6|19'),
	(386, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 4, 'default|3|4'),
	(387, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 3, 27, '3|27'),
	(388, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 3, 16, 'en|3|16'),
	(389, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 3, 17, 'en|3|17'),
	(390, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 3, 18, 'en|3|18'),
	(391, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 30, 'default|3|30'),
	(392, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 3, 19, '3|19'),
	(393, NULL, NULL, 'PHONE-S24U-512', NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, '4|1'),
	(394, 'en', NULL, 'Samsung Galaxy S24 Ultra 12GB/512GB Titanium AI Snapdragon 8 Gen 3', NULL, NULL, NULL, NULL, NULL, NULL, 4, 2, 'en|4|2'),
	(395, 'en', NULL, 'samsung-galaxy-s24-ultra-12gb512gb-titanium-ai-snapdragon-8-gen-3', NULL, NULL, NULL, NULL, NULL, NULL, 4, 3, 'en|4|3'),
	(396, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 4, 'default|4|4'),
	(397, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 4, 5, '4|5'),
	(398, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 4, 6, '4|6'),
	(399, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 4, 7, '4|7'),
	(400, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 4, 8, 'default|4|8'),
	(401, 'en', NULL, '<p>The pinnacle of AI smartphones featuring a durable Titanium frame, built-in S-Pen, quad telephoto 200MP camera system, and the ultra-powerful Snapdragon 8 Gen 3 for Galaxy.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 4, 9, 'en|4|9'),
	(402, 'en', NULL, '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">The pinnacle of AI smartphones featuring a durable Titanium frame, built-in S-Pen, quad telephoto 200MP camera system, and the ultra-powerful Snapdragon 8 Gen 3 for Galaxy.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Display</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">6.8 inch Dynamic AMOLED 2X Quad HD+ 120Hz 2600 nits Corning Gorilla Armor</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Processor</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Qualcomm Snapdragon 8 Gen 3 for Galaxy (4nm, Octa-core up to 3.39GHz)</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Memory &amp; Storage</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">12GB LPDDR5X RAM, 512GB UFS 4.0 high-speed storage</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Camera System</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">200MP Wide OIS + 50MP Periscope 5x Optical + 10MP Telephoto 3x + 12MP Ultra-Wide</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Battery &amp; Charging</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">5,000 mAh, 45W Super Fast Charging 2.0, 15W Fast Wireless Charging, Wireless PowerShare</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">AI &amp; Features</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Galaxy AI (Live Translate, Circle to Search, Note Assist), Integrated S-Pen, IP68</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', NULL, NULL, NULL, NULL, NULL, NULL, 4, 10, 'en|4|10'),
	(403, NULL, NULL, NULL, NULL, NULL, 1299.0000, NULL, NULL, NULL, 4, 11, '4|11'),
	(404, NULL, NULL, NULL, NULL, NULL, 974.2500, NULL, NULL, NULL, 4, 12, '4|12'),
	(405, NULL, NULL, NULL, NULL, NULL, 1199.0000, NULL, NULL, NULL, 4, 13, '4|13'),
	(406, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL, 4, 14, 'default|4|14'),
	(407, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2027-12-31', NULL, 4, 15, 'default|4|15'),
	(408, 'en', NULL, 'Samsung Galaxy S24 Ultra 12GB/512GB Titanium AI Snapdragon 8 Gen 3', NULL, NULL, NULL, NULL, NULL, NULL, 4, 16, 'en|4|16'),
	(409, 'en', NULL, 'samsung, galaxy, s24, ultra, 12gb512gb, titanium, ai, snapdragon, 8, gen, 3', NULL, NULL, NULL, NULL, NULL, NULL, 4, 17, 'en|4|17'),
	(410, 'en', NULL, 'The pinnacle of AI smartphones featuring a durable Titanium frame, built-in S-Pen, quad telephoto 200MP camera system, and the ultra-powerful Snapdragon 8 Gen 3 for Galaxy.', NULL, NULL, NULL, NULL, NULL, NULL, 4, 18, 'en|4|18'),
	(411, NULL, NULL, '0.232', NULL, NULL, NULL, NULL, NULL, NULL, 4, 22, '4|22'),
	(412, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 4, 26, '4|26'),
	(413, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 4, 28, 'default|4|28'),
	(414, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 4, 29, 'default|4|29'),
	(415, NULL, NULL, 'PHONE-IP16PM-256', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '1|1'),
	(416, 'en', NULL, 'Apple iPhone 16 Pro Max 256GB Desert Titanium A18 Pro 48MP Fusion', NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, 'en|1|2'),
	(417, 'en', NULL, 'apple-iphone-16-pro-max-256gb-desert-titanium-a18-pro-48mp-fusion', NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, 'en|1|3'),
	(418, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 4, 'default|1|4'),
	(419, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 5, '1|5'),
	(420, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 6, '1|6'),
	(421, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 7, '1|7'),
	(422, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 8, 'default|1|8'),
	(423, 'en', NULL, '<p>Engineered for Apple Intelligence with the blazing A18 Pro chip, thinner borders on the expansive 6.9-inch display, dedicated Camera Control button, and 4K 120 fps Dolby Vision recording.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 1, 9, 'en|1|9'),
	(424, 'en', NULL, '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Engineered for Apple Intelligence with the blazing A18 Pro chip, thinner borders on the expansive 6.9-inch display, dedicated Camera Control button, and 4K 120 fps Dolby Vision recording.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Display</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">6.9 inch Super Retina XDR OLED ProMotion 120Hz LTPO 2000 nits Ceramic Shield Gen 2</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Processor</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Apple A18 Pro (6-core CPU, 6-core GPU with Hardware Ray Tracing, 16-core NPU)</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Memory &amp; Storage</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">8GB Unified RAM, 256GB NVMe high-speed flash storage</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Camera System</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">48MP Fusion OIS + 48MP Ultra-Wide Macro + 12MP 5x Tetraprism Telephoto (120mm)</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Battery &amp; Charging</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">4,685 mAh, 25W MagSafe Fast Wireless, USB-C 3.2 Gen 2 (10Gbps DisplayPort)</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Special Features</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Dedicated Camera Control capacitive sensor, Action Button, Grade 5 Titanium body</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, 'en|1|10'),
	(425, NULL, NULL, NULL, NULL, NULL, 1199.0000, NULL, NULL, NULL, 1, 11, '1|11'),
	(426, NULL, NULL, NULL, NULL, NULL, 899.2500, NULL, NULL, NULL, 1, 12, '1|12'),
	(427, NULL, NULL, NULL, NULL, NULL, 1149.0000, NULL, NULL, NULL, 1, 13, '1|13'),
	(428, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL, 1, 14, 'default|1|14'),
	(429, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2027-12-31', NULL, 1, 15, 'default|1|15'),
	(430, 'en', NULL, 'Apple iPhone 16 Pro Max 256GB Desert Titanium A18 Pro 48MP Fusion', NULL, NULL, NULL, NULL, NULL, NULL, 1, 16, 'en|1|16'),
	(431, 'en', NULL, 'apple, iphone, 16, pro, max, 256gb, desert, titanium, a18, pro, 48mp, fusion', NULL, NULL, NULL, NULL, NULL, NULL, 1, 17, 'en|1|17'),
	(432, 'en', NULL, 'Engineered for Apple Intelligence with the blazing A18 Pro chip, thinner borders on the expansive 6.9-inch display, dedicated Camera Control button, and 4K 120 fps Dolby Vision recording.', NULL, NULL, NULL, NULL, NULL, NULL, 1, 18, 'en|1|18'),
	(433, NULL, NULL, '0.227', NULL, NULL, NULL, NULL, NULL, NULL, 1, 22, '1|22'),
	(434, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 26, '1|26'),
	(435, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 28, 'default|1|28'),
	(436, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 29, 'default|1|29'),
	(437, NULL, NULL, 'PHONE-REDMAGIC9S-512', NULL, NULL, NULL, NULL, NULL, NULL, 19, 1, '19|1'),
	(438, 'en', NULL, 'Nubia RedMagic 9S Pro 16GB/512GB Gaming Snapdragon 8 Gen 3 Leading Version', NULL, NULL, NULL, NULL, NULL, NULL, 19, 2, 'en|19|2'),
	(439, 'en', NULL, 'nubia-redmagic-9s-pro-16gb512gb-gaming-snapdragon-8-gen-3-leading-version', NULL, NULL, NULL, NULL, NULL, NULL, 19, 3, 'en|19|3'),
	(440, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19, 4, 'default|19|4'),
	(441, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 19, 5, '19|5'),
	(442, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 19, 6, '19|6'),
	(443, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 19, 7, '19|7'),
	(444, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 19, 8, 'default|19|8'),
	(445, 'en', NULL, '<p>Ultimate esports mobile weapon featuring an uninterrupted true full-screen display, internal 22,000 RPM RGB cooling fan, and 520Hz dual touch shoulder triggers.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 19, 9, 'en|19|9'),
	(446, 'en', NULL, '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Ultimate esports mobile weapon featuring an uninterrupted true full-screen display, internal 22,000 RPM RGB cooling fan, and 520Hz dual touch shoulder triggers.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Display</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">6.8 inch BOE Q9+ True FullScreen AMOLED 120Hz 1600 nits Under-Display Camera (UDC)</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Processor</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Qualcomm Snapdragon 8 Gen 3 Leading Version (CPU Overclocked to 3.4GHz)</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Cooling System</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">ICE 13.5 Magic Cooling System with 22,000 RPM Internal RGB Centrifugal Fan</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Memory &amp; Storage</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">16GB LPDDR5X RAM, 512GB UFS 4.0 flash storage</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Battery &amp; Charging</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">6,500 mAh dual-cell monster battery, 80W Quick Charge 4+</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Esports Controls</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">520Hz Dual Glass Shoulder Triggers, Red Core R2 Pro dedicated gaming chip</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', NULL, NULL, NULL, NULL, NULL, NULL, 19, 10, 'en|19|10'),
	(447, NULL, NULL, NULL, NULL, NULL, 899.0000, NULL, NULL, NULL, 19, 11, '19|11'),
	(448, NULL, NULL, NULL, NULL, NULL, 649.0000, NULL, NULL, NULL, 19, 12, '19|12'),
	(449, NULL, NULL, NULL, NULL, NULL, 799.0000, NULL, NULL, NULL, 19, 13, '19|13'),
	(450, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL, 19, 14, 'default|19|14'),
	(451, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2027-12-31', NULL, 19, 15, 'default|19|15'),
	(452, 'en', NULL, 'Nubia RedMagic 9S Pro 16GB/512GB Gaming Snapdragon 8 Gen 3 Leading Version', NULL, NULL, NULL, NULL, NULL, NULL, 19, 16, 'en|19|16'),
	(453, 'en', NULL, 'nubia, redmagic, 9s, pro, 16gb512gb, gaming, snapdragon, 8, gen, 3, leading, version', NULL, NULL, NULL, NULL, NULL, NULL, 19, 17, 'en|19|17'),
	(454, 'en', NULL, 'Ultimate esports mobile weapon featuring an uninterrupted true full-screen display, internal 22,000 RPM RGB cooling fan, and 520Hz dual touch shoulder triggers.', NULL, NULL, NULL, NULL, NULL, NULL, 19, 18, 'en|19|18'),
	(455, NULL, NULL, '0.229', NULL, NULL, NULL, NULL, NULL, NULL, 19, 22, '19|22'),
	(456, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 19, 26, '19|26'),
	(457, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 19, 28, 'default|19|28'),
	(458, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 19, 29, 'default|19|29'),
	(459, NULL, NULL, 'CHG-ANKER-67W', NULL, NULL, NULL, NULL, NULL, NULL, 20, 1, '20|1'),
	(460, 'en', NULL, 'Anker Prime 67W GaN 3-Port Ultra-Compact Wall Charger (A2669)', NULL, NULL, NULL, NULL, NULL, NULL, 20, 2, 'en|20|2'),
	(461, 'en', NULL, 'anker-prime-67w-gan-3-port-ultra-compact-wall-charger-a2669', NULL, NULL, NULL, NULL, NULL, NULL, 20, 3, 'en|20|3'),
	(462, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 4, 'default|20|4'),
	(463, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 20, 5, '20|5'),
	(464, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 20, 6, '20|6'),
	(465, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 20, 7, '20|7'),
	(466, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 20, 8, 'default|20|8'),
	(467, 'en', NULL, '<p>Ultra-compact 67W 3-port charger powered by GaNPrime technology, delivering simultaneous high-speed charging for laptops, phones, and tablets in a 51% smaller footprint.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 20, 9, 'en|20|9'),
	(468, 'en', NULL, '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Ultra-compact 67W 3-port charger powered by GaNPrime technology, delivering simultaneous high-speed charging for laptops, phones, and tablets in a 51% smaller footprint.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Total Output</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">67W Max (USB Power Delivery 3.0 / PPS / QC 4.0+)</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Port Configuration</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">2 x USB-C (67W max each), 1 x USB-A (22.5W max)</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Smart Power Allocation</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Dynamic Power Distribution automatically balances wattage per connected device</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Safety &amp; Thermal</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">ActiveShield 2.0 temperature monitoring checks thermals 3 million times per day</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Dimensions</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">40 x 38 x 50 mm (51% smaller than original Apple 67W power adapter)</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', NULL, NULL, NULL, NULL, NULL, NULL, 20, 10, 'en|20|10'),
	(469, NULL, NULL, NULL, NULL, NULL, 59.9900, NULL, NULL, NULL, 20, 11, '20|11'),
	(470, NULL, NULL, NULL, NULL, NULL, 34.0000, NULL, NULL, NULL, 20, 12, '20|12'),
	(471, NULL, NULL, NULL, NULL, NULL, 49.9900, NULL, NULL, NULL, 20, 13, '20|13'),
	(472, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL, 20, 14, 'default|20|14'),
	(473, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2027-12-31', NULL, 20, 15, 'default|20|15'),
	(474, 'en', NULL, 'Anker Prime 67W GaN 3-Port Ultra-Compact Wall Charger (A2669)', NULL, NULL, NULL, NULL, NULL, NULL, 20, 16, 'en|20|16'),
	(475, 'en', NULL, 'anker, prime, 67w, gan, 3, port, ultra, compact, wall, charger, a2669', NULL, NULL, NULL, NULL, NULL, NULL, 20, 17, 'en|20|17'),
	(476, 'en', NULL, 'Ultra-compact 67W 3-port charger powered by GaNPrime technology, delivering simultaneous high-speed charging for laptops, phones, and tablets in a 51% smaller footprint.', NULL, NULL, NULL, NULL, NULL, NULL, 20, 18, 'en|20|18'),
	(477, NULL, NULL, '0.145', NULL, NULL, NULL, NULL, NULL, NULL, 20, 22, '20|22'),
	(478, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 20, 26, '20|26'),
	(479, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 20, 28, 'default|20|28'),
	(480, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 20, 29, 'default|20|29'),
	(481, NULL, NULL, 'CHG-SHARGE-RETRO-67W', NULL, NULL, NULL, NULL, NULL, NULL, 21, 1, '21|1'),
	(482, 'en', NULL, 'Sharge Retro 67W GaN Fast Charger with Real-Time Matrix LED Display', NULL, NULL, NULL, NULL, NULL, NULL, 21, 2, 'en|21|2'),
	(483, 'en', NULL, 'sharge-retro-67w-gan-fast-charger-with-real-time-matrix-led-display', NULL, NULL, NULL, NULL, NULL, NULL, 21, 3, 'en|21|3'),
	(484, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, 4, 'default|21|4'),
	(485, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 21, 5, '21|5'),
	(486, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 21, 6, '21|6'),
	(487, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 21, 7, '21|7'),
	(488, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 21, 8, 'default|21|8'),
	(489, 'en', NULL, '<p>Nostalgic vintage Macintosh computer aesthetic featuring a functional real-time Matrix digital LED screen that outputs live wattage data and charging animations.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 21, 9, 'en|21|9'),
	(490, 'en', NULL, '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Nostalgic vintage Macintosh computer aesthetic featuring a functional real-time Matrix digital LED screen that outputs live wattage data and charging animations.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Power Output</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">67W Max PD 3.0 All-GaN Architecture</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Ports</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">3 x USB-C simultaneous fast charging ports</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Matrix Display</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Vintage LED Matrix screen showing real-time numerical wattage &amp; charging status</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Compatibility</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Fast charges MacBook Pro/Air, iPad Pro, iPhone 16/15, Steam Deck, ROG Ally</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Protection</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Over-voltage, over-current, short-circuit, and electrostatic protection</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', NULL, NULL, NULL, NULL, NULL, NULL, 21, 10, 'en|21|10'),
	(491, NULL, NULL, NULL, NULL, NULL, 79.9900, NULL, NULL, NULL, 21, 11, '21|11'),
	(492, NULL, NULL, NULL, NULL, NULL, 42.0000, NULL, NULL, NULL, 21, 12, '21|12'),
	(493, NULL, NULL, NULL, NULL, NULL, 64.9900, NULL, NULL, NULL, 21, 13, '21|13'),
	(494, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL, 21, 14, 'default|21|14'),
	(495, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2027-12-31', NULL, 21, 15, 'default|21|15'),
	(496, 'en', NULL, 'Sharge Retro 67W GaN Fast Charger with Real-Time Matrix LED Display', NULL, NULL, NULL, NULL, NULL, NULL, 21, 16, 'en|21|16'),
	(497, 'en', NULL, 'sharge, retro, 67w, gan, fast, charger, with, real, time, matrix, led, display', NULL, NULL, NULL, NULL, NULL, NULL, 21, 17, 'en|21|17'),
	(498, 'en', NULL, 'Nostalgic vintage Macintosh computer aesthetic featuring a functional real-time Matrix digital LED screen that outputs live wattage data and charging animations.', NULL, NULL, NULL, NULL, NULL, NULL, 21, 18, 'en|21|18'),
	(499, NULL, NULL, '0.16', NULL, NULL, NULL, NULL, NULL, NULL, 21, 22, '21|22'),
	(500, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 21, 26, '21|26'),
	(501, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 21, 28, 'default|21|28'),
	(502, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 21, 29, 'default|21|29'),
	(503, NULL, NULL, 'PB-CUKTECH20-210W', NULL, NULL, NULL, NULL, NULL, NULL, 22, 1, '22|1'),
	(504, 'en', NULL, 'CUKTECH 20 25000mAh 210W Multi-Port Power Bank with TFT Color Screen', NULL, NULL, NULL, NULL, NULL, NULL, 22, 2, 'en|22|2'),
	(505, 'en', NULL, 'cuktech-20-25000mah-210w-multi-port-power-bank-with-tft-color-screen', NULL, NULL, NULL, NULL, NULL, NULL, 22, 3, 'en|22|3'),
	(506, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 22, 4, 'default|22|4'),
	(507, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 22, 5, '22|5'),
	(508, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 22, 6, '22|6'),
	(509, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 22, 7, '22|7'),
	(510, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 22, 8, 'default|22|8'),
	(511, 'en', NULL, '<p>Heavy-duty 210W multi-port external battery with automotive-grade 21700 power cells, 140W single-port high power, and a vibrant 1.54-inch TFT color information screen.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 22, 9, 'en|22|9'),
	(512, 'en', NULL, '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Heavy-duty 210W multi-port external battery with automotive-grade 21700 power cells, 140W single-port high power, and a vibrant 1.54-inch TFT color information screen.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Capacity</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">25,000 mAh / 90Wh (TSA &amp; FAA Airline Approved for Carry-on)</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Total Output</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">210W Max (Single USB-C1 up to 140W PD 3.1, USB-C2 60W, USB-A 30W)</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Fast Self-Recharge</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">110W Ultra-Fast Input (recharges 40% in just 19 minutes)</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Display</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">1.54-inch full-color TFT screen with live voltage, current, power curve and battery temp</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Battery Cells</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">5x Auto-Grade 21700 battery cells engineered for 1000+ deep cycles</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', NULL, NULL, NULL, NULL, NULL, NULL, 22, 10, 'en|22|10'),
	(513, NULL, NULL, NULL, NULL, NULL, 139.9900, NULL, NULL, NULL, 22, 11, '22|11'),
	(514, NULL, NULL, NULL, NULL, NULL, 85.0000, NULL, NULL, NULL, 22, 12, '22|12'),
	(515, NULL, NULL, NULL, NULL, NULL, 119.9900, NULL, NULL, NULL, 22, 13, '22|13'),
	(516, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL, 22, 14, 'default|22|14'),
	(517, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2027-12-31', NULL, 22, 15, 'default|22|15'),
	(518, 'en', NULL, 'CUKTECH 20 25000mAh 210W Multi-Port Power Bank with TFT Color Screen', NULL, NULL, NULL, NULL, NULL, NULL, 22, 16, 'en|22|16'),
	(519, 'en', NULL, 'cuktech, 20, 25000mah, 210w, multi, port, power, bank, with, tft, color, screen', NULL, NULL, NULL, NULL, NULL, NULL, 22, 17, 'en|22|17'),
	(520, 'en', NULL, 'Heavy-duty 210W multi-port external battery with automotive-grade 21700 power cells, 140W single-port high power, and a vibrant 1.54-inch TFT color information screen.', NULL, NULL, NULL, NULL, NULL, NULL, 22, 18, 'en|22|18'),
	(521, NULL, NULL, '0.58', NULL, NULL, NULL, NULL, NULL, NULL, 22, 22, '22|22'),
	(522, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 22, 26, '22|26'),
	(523, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 22, 28, 'default|22|28'),
	(524, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 22, 29, 'default|22|29'),
	(525, NULL, NULL, 'PB-ANKER-737-24K', NULL, NULL, NULL, NULL, NULL, NULL, 23, 1, '23|1'),
	(526, 'en', NULL, 'Anker 737 Power Bank (PowerCore 24K) 24000mAh 140W Smart Screen', NULL, NULL, NULL, NULL, NULL, NULL, 23, 2, 'en|23|2'),
	(527, 'en', NULL, 'anker-737-power-bank-powercore-24k-24000mah-140w-smart-screen', NULL, NULL, NULL, NULL, NULL, NULL, 23, 3, 'en|23|3'),
	(528, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 23, 4, 'default|23|4'),
	(529, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 23, 5, '23|5'),
	(530, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 23, 6, '23|6'),
	(531, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 23, 7, '23|7'),
	(532, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 23, 8, 'default|23|8'),
	(533, 'en', NULL, '<p>Equipped with state-of-the-art Power Delivery 3.1 and bi-directional technology to quickly recharge the portable charger or get a 140W ultra-powerful charge.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 23, 9, 'en|23|9'),
	(534, 'en', NULL, '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Equipped with state-of-the-art Power Delivery 3.1 and bi-directional technology to quickly recharge the portable charger or get a 140W ultra-powerful charge.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Capacity</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">24,000 mAh High-Density Li-ion Battery</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Max Output</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">140W Two-Way Fast Charging (Single Port 140W In/Out)</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Smart Digital Display</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Color display shows output/input power, estimated recharge time, and battery health</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Ports</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">2 x USB-C (140W max per port), 1 x USB-A (18W)</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Protection</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">ActiveShield 2.0 temperature monitoring and intelligent power management</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', NULL, NULL, NULL, NULL, NULL, NULL, 23, 10, 'en|23|10'),
	(535, NULL, NULL, NULL, NULL, NULL, 149.9900, NULL, NULL, NULL, 23, 11, '23|11'),
	(536, NULL, NULL, NULL, NULL, NULL, 95.0000, NULL, NULL, NULL, 23, 12, '23|12'),
	(537, NULL, NULL, NULL, NULL, NULL, 129.9900, NULL, NULL, NULL, 23, 13, '23|13'),
	(538, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL, 23, 14, 'default|23|14'),
	(539, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2027-12-31', NULL, 23, 15, 'default|23|15'),
	(540, 'en', NULL, 'Anker 737 Power Bank (PowerCore 24K) 24000mAh 140W Smart Screen', NULL, NULL, NULL, NULL, NULL, NULL, 23, 16, 'en|23|16'),
	(541, 'en', NULL, 'anker, 737, power, bank, powercore, 24k, 24000mah, 140w, smart, screen', NULL, NULL, NULL, NULL, NULL, NULL, 23, 17, 'en|23|17'),
	(542, 'en', NULL, 'Equipped with state-of-the-art Power Delivery 3.1 and bi-directional technology to quickly recharge the portable charger or get a 140W ultra-powerful charge.', NULL, NULL, NULL, NULL, NULL, NULL, 23, 18, 'en|23|18'),
	(543, NULL, NULL, '0.63', NULL, NULL, NULL, NULL, NULL, NULL, 23, 22, '23|22'),
	(544, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 23, 26, '23|26'),
	(545, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 23, 28, 'default|23|28'),
	(546, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 23, 29, 'default|23|29'),
	(547, NULL, NULL, 'PB-BASEUS-BLADE2-65W', NULL, NULL, NULL, NULL, NULL, NULL, 24, 1, '24|1'),
	(548, 'en', NULL, 'Baseus Blade 2 12000mAh 65W Ultra-Thin Smart Digital Power Bank', NULL, NULL, NULL, NULL, NULL, NULL, 24, 2, 'en|24|2'),
	(549, 'en', NULL, 'baseus-blade-2-12000mah-65w-ultra-thin-smart-digital-power-bank', NULL, NULL, NULL, NULL, NULL, NULL, 24, 3, 'en|24|3'),
	(550, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 24, 4, 'default|24|4'),
	(551, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 24, 5, '24|5'),
	(552, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 24, 6, '24|6'),
	(553, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 24, 7, '24|7'),
	(554, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 24, 8, 'default|24|8'),
	(555, 'en', NULL, '<p>Ultra-slim 10.2mm flat profile power bank designed for sleek laptop bags, featuring Bluetooth companion app control and 65W bidirectional fast charging.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 24, 9, 'en|24|9'),
	(556, 'en', NULL, '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Ultra-slim 10.2mm flat profile power bank designed for sleek laptop bags, featuring Bluetooth companion app control and 65W bidirectional fast charging.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Capacity</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">12,000 mAh / 44.4Wh Silicon-Carbon Anode Battery</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Profile Thickness</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Only 10.2mm (0.4 inches) Ultra-Thin form factor</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Power Delivery</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">65W Max USB-C PD Input and Output</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">App Integration</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Baseus Smart App customizes output modes, timer, and monitors degradation</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Ports</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">2 x USB-C ports with auto power distribution</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', NULL, NULL, NULL, NULL, NULL, NULL, 24, 10, 'en|24|10'),
	(557, NULL, NULL, NULL, NULL, NULL, 69.9900, NULL, NULL, NULL, 24, 11, '24|11'),
	(558, NULL, NULL, NULL, NULL, NULL, 40.0000, NULL, NULL, NULL, 24, 12, '24|12'),
	(559, NULL, NULL, NULL, NULL, NULL, 59.9900, NULL, NULL, NULL, 24, 13, '24|13'),
	(560, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL, 24, 14, 'default|24|14'),
	(561, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2027-12-31', NULL, 24, 15, 'default|24|15'),
	(562, 'en', NULL, 'Baseus Blade 2 12000mAh 65W Ultra-Thin Smart Digital Power Bank', NULL, NULL, NULL, NULL, NULL, NULL, 24, 16, 'en|24|16'),
	(563, 'en', NULL, 'baseus, blade, 2, 12000mah, 65w, ultra, thin, smart, digital, power, bank', NULL, NULL, NULL, NULL, NULL, NULL, 24, 17, 'en|24|17'),
	(564, 'en', NULL, 'Ultra-slim 10.2mm flat profile power bank designed for sleek laptop bags, featuring Bluetooth companion app control and 65W bidirectional fast charging.', NULL, NULL, NULL, NULL, NULL, NULL, 24, 18, 'en|24|18'),
	(565, NULL, NULL, '0.32', NULL, NULL, NULL, NULL, NULL, NULL, 24, 22, '24|22'),
	(566, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 24, 26, '24|26'),
	(567, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 24, 28, 'default|24|28'),
	(568, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 24, 29, 'default|24|29'),
	(569, NULL, NULL, 'EAR-BOSE-QCULTRA', NULL, NULL, NULL, NULL, NULL, NULL, 25, 1, '25|1'),
	(570, 'en', NULL, 'Bose QuietComfort Ultra True Wireless Noise Canceling Earbuds', NULL, NULL, NULL, NULL, NULL, NULL, 25, 2, 'en|25|2'),
	(571, 'en', NULL, 'bose-quietcomfort-ultra-true-wireless-noise-canceling-earbuds', NULL, NULL, NULL, NULL, NULL, NULL, 25, 3, 'en|25|3'),
	(572, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 4, 'default|25|4'),
	(573, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 25, 5, '25|5'),
	(574, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 25, 6, '25|6'),
	(575, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 25, 7, '25|7'),
	(576, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 25, 8, 'default|25|8'),
	(577, 'en', NULL, '<p>World-class noise cancellation paired with breakthrough Bose Immersive Audio for a realistic spatial acoustic listening experience regardless of source content.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 25, 9, 'en|25|9'),
	(578, 'en', NULL, '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">World-class noise cancellation paired with breakthrough Bose Immersive Audio for a realistic spatial acoustic listening experience regardless of source content.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Active Noise Cancellation</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">CustomTune technology calibrates noise cancellation specifically to your ear canal</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Spatial Audio</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Bose Immersive Audio delivers full spatial sound field without head-tracking latency</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Battery Life</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Up to 6 hours continuous play (24 hours total with wireless charging case)</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Call Quality</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Advanced 4-microphone array focuses on your voice and filters out wind noise</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Water Resistance</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">IPX4 sweat and weather resistant</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', NULL, NULL, NULL, NULL, NULL, NULL, 25, 10, 'en|25|10'),
	(579, NULL, NULL, NULL, NULL, NULL, 299.0000, NULL, NULL, NULL, 25, 11, '25|11'),
	(580, NULL, NULL, NULL, NULL, NULL, 180.0000, NULL, NULL, NULL, 25, 12, '25|12'),
	(581, NULL, NULL, NULL, NULL, NULL, 249.0000, NULL, NULL, NULL, 25, 13, '25|13'),
	(582, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL, 25, 14, 'default|25|14'),
	(583, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2027-12-31', NULL, 25, 15, 'default|25|15'),
	(584, 'en', NULL, 'Bose QuietComfort Ultra True Wireless Noise Canceling Earbuds', NULL, NULL, NULL, NULL, NULL, NULL, 25, 16, 'en|25|16'),
	(585, 'en', NULL, 'bose, quietcomfort, ultra, true, wireless, noise, canceling, earbuds', NULL, NULL, NULL, NULL, NULL, NULL, 25, 17, 'en|25|17'),
	(586, 'en', NULL, 'World-class noise cancellation paired with breakthrough Bose Immersive Audio for a realistic spatial acoustic listening experience regardless of source content.', NULL, NULL, NULL, NULL, NULL, NULL, 25, 18, 'en|25|18'),
	(587, NULL, NULL, '0.06', NULL, NULL, NULL, NULL, NULL, NULL, 25, 22, '25|22'),
	(588, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 25, 26, '25|26'),
	(589, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 25, 28, 'default|25|28'),
	(590, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 25, 29, 'default|25|29'),
	(591, NULL, NULL, 'EAR-RAZER-HAMMERHEAD', NULL, NULL, NULL, NULL, NULL, NULL, 26, 1, '26|1'),
	(592, 'en', NULL, 'Razer Hammerhead Pro HyperSpeed True Wireless Gaming Earbuds', NULL, NULL, NULL, NULL, NULL, NULL, 26, 2, 'en|26|2'),
	(593, 'en', NULL, 'razer-hammerhead-pro-hyperspeed-true-wireless-gaming-earbuds', NULL, NULL, NULL, NULL, NULL, NULL, 26, 3, 'en|26|3'),
	(594, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 26, 4, 'default|26|4'),
	(595, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 26, 5, '26|5'),
	(596, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 26, 6, '26|6'),
	(597, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 26, 7, '26|7'),
	(598, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 26, 8, 'default|26|8'),
	(599, 'en', NULL, '<p>Pro-grade wireless gaming earbuds featuring dual connectivity with a 2.4GHz Razer HyperSpeed USB-C dongle for cross-platform zero-latency gaming.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 26, 9, 'en|26|9'),
	(600, 'en', NULL, '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Pro-grade wireless gaming earbuds featuring dual connectivity with a 2.4GHz Razer HyperSpeed USB-C dongle for cross-platform zero-latency gaming.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Wireless Technology</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">2.4GHz Razer HyperSpeed (via included USB-C Dongle) &amp; Bluetooth 5.3</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Latency</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Sub-40ms ultra-low gaming latency on PC, PlayStation, Switch, and Mobile</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Noise Cancellation</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Adjustable Hybrid Active Noise Cancellation with Transparency Mode</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">RGB Lighting</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Customizable Razer Chroma RGB with 16.8 million colors</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Battery Life</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Up to 30 hours total playtime with Qi-compatible wireless charging case</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', NULL, NULL, NULL, NULL, NULL, NULL, 26, 10, 'en|26|10'),
	(601, NULL, NULL, NULL, NULL, NULL, 199.9900, NULL, NULL, NULL, 26, 11, '26|11'),
	(602, NULL, NULL, NULL, NULL, NULL, 110.0000, NULL, NULL, NULL, 26, 12, '26|12'),
	(603, NULL, NULL, NULL, NULL, NULL, 169.9900, NULL, NULL, NULL, 26, 13, '26|13'),
	(604, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL, 26, 14, 'default|26|14'),
	(605, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2027-12-31', NULL, 26, 15, 'default|26|15'),
	(606, 'en', NULL, 'Razer Hammerhead Pro HyperSpeed True Wireless Gaming Earbuds', NULL, NULL, NULL, NULL, NULL, NULL, 26, 16, 'en|26|16'),
	(607, 'en', NULL, 'razer, hammerhead, pro, hyperspeed, true, wireless, gaming, earbuds', NULL, NULL, NULL, NULL, NULL, NULL, 26, 17, 'en|26|17'),
	(608, 'en', NULL, 'Pro-grade wireless gaming earbuds featuring dual connectivity with a 2.4GHz Razer HyperSpeed USB-C dongle for cross-platform zero-latency gaming.', NULL, NULL, NULL, NULL, NULL, NULL, 26, 18, 'en|26|18'),
	(609, NULL, NULL, '0.055', NULL, NULL, NULL, NULL, NULL, NULL, 26, 22, '26|22'),
	(610, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 26, 26, '26|26'),
	(611, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 26, 28, 'default|26|28'),
	(612, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 26, 29, 'default|26|29'),
	(613, NULL, NULL, 'EAR-AIRPODS-PRO2', NULL, NULL, NULL, NULL, NULL, NULL, 27, 1, '27|1'),
	(614, 'en', NULL, 'Apple AirPods Pro (2nd Gen) USB-C MagSafe Active Noise Cancelling', NULL, NULL, NULL, NULL, NULL, NULL, 27, 2, 'en|27|2'),
	(615, 'en', NULL, 'apple-airpods-pro-2nd-gen-usb-c-magsafe-active-noise-cancelling', NULL, NULL, NULL, NULL, NULL, NULL, 27, 3, 'en|27|3'),
	(616, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, 4, 'default|27|4'),
	(617, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 27, 5, '27|5'),
	(618, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 27, 6, '27|6'),
	(619, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 27, 7, '27|7'),
	(620, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 27, 8, 'default|27|8'),
	(621, 'en', NULL, '<p>Up to 2x more active noise cancellation powered by the Apple H2 chip, with Adaptive Audio, Personalized Spatial Audio, and USB-C MagSafe charging case with speaker.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 27, 9, 'en|27|9'),
	(622, 'en', NULL, '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Up to 2x more active noise cancellation powered by the Apple H2 chip, with Adaptive Audio, Personalized Spatial Audio, and USB-C MagSafe charging case with speaker.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Audio Engine</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Apple H2 Headphone Chip + Apple U1 in MagSafe Case for Precision Finding</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">ANC &amp; Transparency</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Adaptive Audio seamlessly blends ANC and Transparency mode as environments change</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Spatial Audio</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Personalized Spatial Audio with dynamic head tracking</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Battery Life</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">6 hours listening on single charge (30 hours total with MagSafe Case)</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Durability</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">IP54 dust, sweat, and water resistance for both earbuds and case</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', NULL, NULL, NULL, NULL, NULL, NULL, 27, 10, 'en|27|10'),
	(623, NULL, NULL, NULL, NULL, NULL, 249.0000, NULL, NULL, NULL, 27, 11, '27|11'),
	(624, NULL, NULL, NULL, NULL, NULL, 165.0000, NULL, NULL, NULL, 27, 12, '27|12'),
	(625, NULL, NULL, NULL, NULL, NULL, 219.0000, NULL, NULL, NULL, 27, 13, '27|13'),
	(626, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL, 27, 14, 'default|27|14'),
	(627, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2027-12-31', NULL, 27, 15, 'default|27|15'),
	(628, 'en', NULL, 'Apple AirPods Pro (2nd Gen) USB-C MagSafe Active Noise Cancelling', NULL, NULL, NULL, NULL, NULL, NULL, 27, 16, 'en|27|16'),
	(629, 'en', NULL, 'apple, airpods, pro, 2nd, gen, usb, c, magsafe, active, noise, cancelling', NULL, NULL, NULL, NULL, NULL, NULL, 27, 17, 'en|27|17'),
	(630, 'en', NULL, 'Up to 2x more active noise cancellation powered by the Apple H2 chip, with Adaptive Audio, Personalized Spatial Audio, and USB-C MagSafe charging case with speaker.', NULL, NULL, NULL, NULL, NULL, NULL, 27, 18, 'en|27|18'),
	(631, NULL, NULL, '0.056', NULL, NULL, NULL, NULL, NULL, NULL, 27, 22, '27|22'),
	(632, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 27, 26, '27|26'),
	(633, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 27, 28, 'default|27|28'),
	(634, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 27, 29, 'default|27|29'),
	(635, NULL, NULL, 'COOL-FLYDIGI-B7X', NULL, NULL, NULL, NULL, NULL, NULL, 28, 1, '28|1'),
	(636, 'en', NULL, 'Flydigi B7X Magnetic Phone Cooler 27W Smart Overclocking RGB', NULL, NULL, NULL, NULL, NULL, NULL, 28, 2, 'en|28|2'),
	(637, 'en', NULL, 'flydigi-b7x-magnetic-phone-cooler-27w-smart-overclocking-rgb', NULL, NULL, NULL, NULL, NULL, NULL, 28, 3, 'en|28|3'),
	(638, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 28, 4, 'default|28|4'),
	(639, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 28, 5, '28|5'),
	(640, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 28, 6, '28|6'),
	(641, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 28, 7, '28|7'),
	(642, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 28, 8, 'default|28|8'),
	(643, 'en', NULL, '<p>Next-generation 27W variable frequency magnetic semiconductor phone radiator, featuring intelligent temperature sensing and silent hydraulic fan technology.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 28, 9, 'en|28|9'),
	(644, 'en', NULL, '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Next-generation 27W variable frequency magnetic semiconductor phone radiator, featuring intelligent temperature sensing and silent hydraulic fan technology.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Cooling Power</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">27W Smart Overclocking TEC module (instant drop to -5°C in seconds)</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Magnetic Connection</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Strong MagSafe neodymium ring attachment + universal back clip</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Smart Regulation</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Flydigi App Bluetooth control with anti-condensation auto temperature regulation</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Noise Level</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Silent 7-blade hydraulic bearing fan (&lt;37dB)</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Lighting</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Dynamic customizable circular RGB halo illumination</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', NULL, NULL, NULL, NULL, NULL, NULL, 28, 10, 'en|28|10'),
	(645, NULL, NULL, NULL, NULL, NULL, 49.9900, NULL, NULL, NULL, 28, 11, '28|11'),
	(646, NULL, NULL, NULL, NULL, NULL, 24.0000, NULL, NULL, NULL, 28, 12, '28|12'),
	(647, NULL, NULL, NULL, NULL, NULL, 39.9900, NULL, NULL, NULL, 28, 13, '28|13'),
	(648, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL, 28, 14, 'default|28|14'),
	(649, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2027-12-31', NULL, 28, 15, 'default|28|15'),
	(650, 'en', NULL, 'Flydigi B7X Magnetic Phone Cooler 27W Smart Overclocking RGB', NULL, NULL, NULL, NULL, NULL, NULL, 28, 16, 'en|28|16'),
	(651, 'en', NULL, 'flydigi, b7x, magnetic, phone, cooler, 27w, smart, overclocking, rgb', NULL, NULL, NULL, NULL, NULL, NULL, 28, 17, 'en|28|17'),
	(652, 'en', NULL, 'Next-generation 27W variable frequency magnetic semiconductor phone radiator, featuring intelligent temperature sensing and silent hydraulic fan technology.', NULL, NULL, NULL, NULL, NULL, NULL, 28, 18, 'en|28|18'),
	(653, NULL, NULL, '0.095', NULL, NULL, NULL, NULL, NULL, NULL, 28, 22, '28|22'),
	(654, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 28, 26, '28|26'),
	(655, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 28, 28, 'default|28|28'),
	(656, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 28, 29, 'default|28|29'),
	(657, NULL, NULL, 'GEAR-GAMESIR-G8', NULL, NULL, NULL, NULL, NULL, NULL, 29, 1, '29|1'),
	(658, 'en', NULL, 'GameSir G8 Galileo Type-C Mobile Gaming Controller Hall Effect', NULL, NULL, NULL, NULL, NULL, NULL, 29, 2, 'en|29|2'),
	(659, 'en', NULL, 'gamesir-g8-galileo-type-c-mobile-gaming-controller-hall-effect', NULL, NULL, NULL, NULL, NULL, NULL, 29, 3, 'en|29|3'),
	(660, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 29, 4, 'default|29|4'),
	(661, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 29, 5, '29|5'),
	(662, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 29, 6, '29|6'),
	(663, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 29, 7, '29|7'),
	(664, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 29, 8, 'default|29|8'),
	(665, 'en', NULL, '<p>Console-grade mobile gaming controller with non-contact Hall Effect sticks and analog triggers, movable Type-C port, and magnetic swappable faceplates.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 29, 9, 'en|29|9'),
	(666, 'en', NULL, '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Console-grade mobile gaming controller with non-contact Hall Effect sticks and analog triggers, movable Type-C port, and magnetic swappable faceplates.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Connection</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Adjustable movable Type-C direct connection (Zero input latency &amp; pass-through charging)</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Joysticks &amp; Triggers</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Hall Effect anti-drift magnetic sensing sticks and precision analog triggers</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Compatibility</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Supports iPhone 15/16 series &amp; Android phones (Length 110-185mm)</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Ergonomics</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Full-size console ergonomics with dual programmable back macro buttons</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Customization</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Interchangeable magnetic faceplates and multiple thumbstick height caps</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', NULL, NULL, NULL, NULL, NULL, NULL, 29, 10, 'en|29|10'),
	(667, NULL, NULL, NULL, NULL, NULL, 79.9900, NULL, NULL, NULL, 29, 11, '29|11'),
	(668, NULL, NULL, NULL, NULL, NULL, 48.0000, NULL, NULL, NULL, 29, 12, '29|12'),
	(669, NULL, NULL, NULL, NULL, NULL, 69.9900, NULL, NULL, NULL, 29, 13, '29|13'),
	(670, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL, 29, 14, 'default|29|14'),
	(671, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2027-12-31', NULL, 29, 15, 'default|29|15'),
	(672, 'en', NULL, 'GameSir G8 Galileo Type-C Mobile Gaming Controller Hall Effect', NULL, NULL, NULL, NULL, NULL, NULL, 29, 16, 'en|29|16'),
	(673, 'en', NULL, 'gamesir, g8, galileo, type, c, mobile, gaming, controller, hall, effect', NULL, NULL, NULL, NULL, NULL, NULL, 29, 17, 'en|29|17'),
	(674, 'en', NULL, 'Console-grade mobile gaming controller with non-contact Hall Effect sticks and analog triggers, movable Type-C port, and magnetic swappable faceplates.', NULL, NULL, NULL, NULL, NULL, NULL, 29, 18, 'en|29|18'),
	(675, NULL, NULL, '0.252', NULL, NULL, NULL, NULL, NULL, NULL, 29, 22, '29|22'),
	(676, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 29, 26, '29|26'),
	(677, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 29, 28, 'default|29|28'),
	(678, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 29, 29, 'default|29|29'),
	(679, NULL, NULL, 'COOL-RAZER-CHROMA', NULL, NULL, NULL, NULL, NULL, NULL, 30, 1, '30|1'),
	(680, 'en', NULL, 'Razer Phone Cooler Chroma Magnetic MagSafe RGB Semiconductor Fan', NULL, NULL, NULL, NULL, NULL, NULL, 30, 2, 'en|30|2'),
	(681, 'en', NULL, 'razer-phone-cooler-chroma-magnetic-magsafe-rgb-semiconductor-fan', NULL, NULL, NULL, NULL, NULL, NULL, 30, 3, 'en|30|3'),
	(682, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, 4, 'default|30|4'),
	(683, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 30, 5, '30|5'),
	(684, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 30, 6, '30|6'),
	(685, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 30, 7, '30|7'),
	(686, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 30, 8, 'default|30|8'),
	(687, 'en', NULL, '<p>Advanced smartphone cooling tile with heat sink and 7-blade fan, armed with MagSafe compatibility and 12 customizable Razer Chroma RGB LEDs.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 30, 9, 'en|30|9'),
	(688, 'en', NULL, '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Advanced smartphone cooling tile with heat sink and 7-blade fan, armed with MagSafe compatibility and 12 customizable Razer Chroma RGB LEDs.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Cooling Engine</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Thermoelectric Peltier semiconductor cooling plate with aluminum heat sink</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Fan Specs</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">7-blade high-speed fan spinning up to 6400 RPM with whisper-quiet profile (&lt;30dB)</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Lighting</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">12 Individually addressable RGB LEDs powered by Razer Chroma RGB (BLE app)</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Attachment</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Built-in MagSafe magnetic alignment + universal Android clip clamp included</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Power Connection</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">USB-C powered (requires 5V/2A or higher power source)</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', NULL, NULL, NULL, NULL, NULL, NULL, 30, 10, 'en|30|10'),
	(689, NULL, NULL, NULL, NULL, NULL, 59.9900, NULL, NULL, NULL, 30, 11, '30|11'),
	(690, NULL, NULL, NULL, NULL, NULL, 32.0000, NULL, NULL, NULL, 30, 12, '30|12'),
	(691, NULL, NULL, NULL, NULL, NULL, 49.9900, NULL, NULL, NULL, 30, 13, '30|13'),
	(692, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL, 30, 14, 'default|30|14'),
	(693, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2027-12-31', NULL, 30, 15, 'default|30|15'),
	(694, 'en', NULL, 'Razer Phone Cooler Chroma Magnetic MagSafe RGB Semiconductor Fan', NULL, NULL, NULL, NULL, NULL, NULL, 30, 16, 'en|30|16'),
	(695, 'en', NULL, 'razer, phone, cooler, chroma, magnetic, magsafe, rgb, semiconductor, fan', NULL, NULL, NULL, NULL, NULL, NULL, 30, 17, 'en|30|17'),
	(696, 'en', NULL, 'Advanced smartphone cooling tile with heat sink and 7-blade fan, armed with MagSafe compatibility and 12 customizable Razer Chroma RGB LEDs.', NULL, NULL, NULL, NULL, NULL, NULL, 30, 18, 'en|30|18'),
	(697, NULL, NULL, '0.1', NULL, NULL, NULL, NULL, NULL, NULL, 30, 22, '30|22'),
	(698, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 30, 26, '30|26'),
	(699, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 30, 28, 'default|30|28'),
	(700, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 30, 29, 'default|30|29'),
	(701, NULL, NULL, 'HUB-CALDIGIT-TS4', NULL, NULL, NULL, NULL, NULL, NULL, 31, 1, '31|1'),
	(702, 'en', NULL, 'CalDigit TS4 Thunderbolt 4 18-Port Docking Station 98W Power Delivery', NULL, NULL, NULL, NULL, NULL, NULL, 31, 2, 'en|31|2'),
	(703, 'en', NULL, 'caldigit-ts4-thunderbolt-4-18-port-docking-station-98w-power-delivery', NULL, NULL, NULL, NULL, NULL, NULL, 31, 3, 'en|31|3'),
	(704, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 31, 4, 'default|31|4'),
	(705, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 31, 5, '31|5'),
	(706, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 31, 6, '31|6'),
	(707, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 31, 7, '31|7'),
	(708, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 31, 8, 'default|31|8'),
	(709, 'en', NULL, '<p>The world\'s most capable Thunderbolt 4 dock with a staggering 18 ports of connectivity, up to 98W host laptop charging, and 2.5Gb Ethernet speed.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 31, 9, 'en|31|9'),
	(710, 'en', NULL, '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">The world\'s most capable Thunderbolt 4 dock with a staggering 18 ports of connectivity, up to 98W host laptop charging, and 2.5Gb Ethernet speed.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Total Ports</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">18 Connectivity Ports (3x TB4 40Gbps, 1x DP 1.4, 5x USB-A 10Gbps, 3x USB-C 10Gbps, 2.5GbE, SD/microSD UHS-II, Front/Rear Audio)</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Host Power Delivery</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Up to 98W continuous power delivery to charge power-hungry workstations</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Video Output</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Single 8K@60Hz or Dual 6K@60Hz external high-refresh displays</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Network</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">2.5 Gigabit Ethernet port (2.5x faster than standard gigabit)</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Build Quality</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Precision all-aluminum heatsink body for fanless silent heat dissipation</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', NULL, NULL, NULL, NULL, NULL, NULL, 31, 10, 'en|31|10'),
	(711, NULL, NULL, NULL, NULL, NULL, 399.9500, NULL, NULL, NULL, 31, 11, '31|11'),
	(712, NULL, NULL, NULL, NULL, NULL, 250.0000, NULL, NULL, NULL, 31, 12, '31|12'),
	(713, NULL, NULL, NULL, NULL, NULL, 359.9500, NULL, NULL, NULL, 31, 13, '31|13'),
	(714, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL, 31, 14, 'default|31|14'),
	(715, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2027-12-31', NULL, 31, 15, 'default|31|15'),
	(716, 'en', NULL, 'CalDigit TS4 Thunderbolt 4 18-Port Docking Station 98W Power Delivery', NULL, NULL, NULL, NULL, NULL, NULL, 31, 16, 'en|31|16'),
	(717, 'en', NULL, 'caldigit, ts4, thunderbolt, 4, 18, port, docking, station, 98w, power, delivery', NULL, NULL, NULL, NULL, NULL, NULL, 31, 17, 'en|31|17'),
	(718, 'en', NULL, 'The world\'s most capable Thunderbolt 4 dock with a staggering 18 ports of connectivity, up to 98W host laptop charging, and 2.5Gb Ethernet speed.', NULL, NULL, NULL, NULL, NULL, NULL, 31, 18, 'en|31|18'),
	(719, NULL, NULL, '0.64', NULL, NULL, NULL, NULL, NULL, NULL, 31, 22, '31|22'),
	(720, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 31, 26, '31|26'),
	(721, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 31, 28, 'default|31|28'),
	(722, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 31, 29, 'default|31|29'),
	(723, NULL, NULL, 'HUB-ANKER-575-13IN1', NULL, NULL, NULL, NULL, NULL, NULL, 32, 1, '32|1'),
	(724, 'en', NULL, 'Anker 575 USB-C Hub (13-in-1) 85W Pass-Through Triple Display', NULL, NULL, NULL, NULL, NULL, NULL, 32, 2, 'en|32|2'),
	(725, 'en', NULL, 'anker-575-usb-c-hub-13-in-1-85w-pass-through-triple-display', NULL, NULL, NULL, NULL, NULL, NULL, 32, 3, 'en|32|3'),
	(726, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 32, 4, 'default|32|4'),
	(727, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 32, 5, '32|5'),
	(728, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 32, 6, '32|6'),
	(729, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 32, 7, '32|7'),
	(730, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 32, 8, 'default|32|8'),
	(731, 'en', NULL, '<p>Comprehensive 13-in-1 desktop expansion hub with dual HDMI ports, DisplayPort, 85W high-speed pass-through charging, and Gigabit Ethernet connectivity.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 32, 9, 'en|32|9'),
	(732, 'en', NULL, '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Comprehensive 13-in-1 desktop expansion hub with dual HDMI ports, DisplayPort, 85W high-speed pass-through charging, and Gigabit Ethernet connectivity.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Expansion</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">13-in-1 (2x HDMI 4K@60Hz, 1x DP 4K@60Hz, 100W PD In / 85W Out, 1x USB-C 5Gbps, 3x USB-A 5Gbps, 1x USB 2.0, RJ45 LAN, SD/TF, 3.5mm AUX)</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Multi-Display</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Supports Triple Display expansion on Windows and dual mirrored displays on macOS</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Power Pass-Through</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Up to 85W safe laptop pass-through charging with 15W reserved for hub operations</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Safety Protection</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">MultiProtect temperature control and short-circuit prevention architecture</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', NULL, NULL, NULL, NULL, NULL, NULL, 32, 10, 'en|32|10'),
	(733, NULL, NULL, NULL, NULL, NULL, 79.9900, NULL, NULL, NULL, 32, 11, '32|11'),
	(734, NULL, NULL, NULL, NULL, NULL, 45.0000, NULL, NULL, NULL, 32, 12, '32|12'),
	(735, NULL, NULL, NULL, NULL, NULL, 64.9900, NULL, NULL, NULL, 32, 13, '32|13'),
	(736, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL, 32, 14, 'default|32|14'),
	(737, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2027-12-31', NULL, 32, 15, 'default|32|15'),
	(738, 'en', NULL, 'Anker 575 USB-C Hub (13-in-1) 85W Pass-Through Triple Display', NULL, NULL, NULL, NULL, NULL, NULL, 32, 16, 'en|32|16'),
	(739, 'en', NULL, 'anker, 575, usb, c, hub, 13, in, 1, 85w, pass, through, triple, display', NULL, NULL, NULL, NULL, NULL, NULL, 32, 17, 'en|32|17'),
	(740, 'en', NULL, 'Comprehensive 13-in-1 desktop expansion hub with dual HDMI ports, DisplayPort, 85W high-speed pass-through charging, and Gigabit Ethernet connectivity.', NULL, NULL, NULL, NULL, NULL, NULL, 32, 18, 'en|32|18'),
	(741, NULL, NULL, '0.17', NULL, NULL, NULL, NULL, NULL, NULL, 32, 22, '32|22'),
	(742, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 32, 26, '32|26'),
	(743, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 32, 28, 'default|32|28'),
	(744, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 32, 29, 'default|32|29'),
	(745, NULL, NULL, 'HUB-SATECHI-MACMINI', NULL, NULL, NULL, NULL, NULL, NULL, 33, 1, '33|1'),
	(746, 'en', NULL, 'Satechi Aluminum Stand & Hub for Mac Mini with M.2 SSD Enclosure', NULL, NULL, NULL, NULL, NULL, NULL, 33, 2, 'en|33|2'),
	(747, 'en', NULL, 'satechi-aluminum-stand-hub-for-mac-mini-with-m2-ssd-enclosure', NULL, NULL, NULL, NULL, NULL, NULL, 33, 3, 'en|33|3'),
	(748, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 33, 4, 'default|33|4'),
	(749, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 33, 5, '33|5'),
	(750, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 33, 6, '33|6'),
	(751, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 33, 7, '33|7'),
	(752, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 33, 8, 'default|33|8'),
	(753, 'en', NULL, '<p>Patent-pending stand and USB-C hub tailored for Apple Mac Mini &amp; Mac Studio, featuring a built-in M.2 NVMe SSD enclosure and front-facing fast I/O ports.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 33, 9, 'en|33|9'),
	(754, 'en', NULL, '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Patent-pending stand and USB-C hub tailored for Apple Mac Mini &amp; Mac Studio, featuring a built-in M.2 NVMe SSD enclosure and front-facing fast I/O ports.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Internal Storage</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Built-in tool-free M.2 NVMe / SATA SSD enclosure (speeds up to 10Gbps)</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Front Ports</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">1x USB-C (10Gbps), 3x USB-A (10Gbps), SD and MicroSD card readers (104MB/s), 3.5mm Headphone Jack</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Design Aesthetics</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Matches Apple Mac Mini aluminum finish and form factor seamlessly</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Cooling Vents</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Engineered with built-in air vents to maximize Mac Mini airflow and cooling efficiency</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', NULL, NULL, NULL, NULL, NULL, NULL, 33, 10, 'en|33|10'),
	(755, NULL, NULL, NULL, NULL, NULL, 99.9900, NULL, NULL, NULL, 33, 11, '33|11'),
	(756, NULL, NULL, NULL, NULL, NULL, 58.0000, NULL, NULL, NULL, 33, 12, '33|12'),
	(757, NULL, NULL, NULL, NULL, NULL, 84.9900, NULL, NULL, NULL, 33, 13, '33|13'),
	(758, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL, 33, 14, 'default|33|14'),
	(759, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2027-12-31', NULL, 33, 15, 'default|33|15'),
	(760, 'en', NULL, 'Satechi Aluminum Stand & Hub for Mac Mini with M.2 SSD Enclosure', NULL, NULL, NULL, NULL, NULL, NULL, 33, 16, 'en|33|16'),
	(761, 'en', NULL, 'satechi, aluminum, stand, hub, for, mac, mini, with, m2, ssd, enclosure', NULL, NULL, NULL, NULL, NULL, NULL, 33, 17, 'en|33|17'),
	(762, 'en', NULL, 'Patent-pending stand and USB-C hub tailored for Apple Mac Mini & Mac Studio, featuring a built-in M.2 NVMe SSD enclosure and front-facing fast I/O ports.', NULL, NULL, NULL, NULL, NULL, NULL, 33, 18, 'en|33|18'),
	(763, NULL, NULL, '0.3', NULL, NULL, NULL, NULL, NULL, NULL, 33, 22, '33|22'),
	(764, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 33, 26, '33|26'),
	(765, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 33, 28, 'default|33|28'),
	(766, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 33, 29, 'default|33|29'),
	(767, NULL, NULL, 'HUB-BASEUS-10IN1', NULL, NULL, NULL, NULL, NULL, NULL, 34, 1, '34|1'),
	(768, 'en', NULL, 'Baseus Metal Gleam 10-in-1 Dual 4K HDMI USB-C Multi-Port Adapter Hub', NULL, NULL, NULL, NULL, NULL, NULL, 34, 2, 'en|34|2'),
	(769, 'en', NULL, 'baseus-metal-gleam-10-in-1-dual-4k-hdmi-usb-c-multi-port-adapter-hub', NULL, NULL, NULL, NULL, NULL, NULL, 34, 3, 'en|34|3'),
	(770, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 34, 4, 'default|34|4'),
	(771, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 34, 5, '34|5'),
	(772, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 34, 6, '34|6'),
	(773, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 34, 7, '34|7'),
	(774, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 34, 8, 'default|34|8'),
	(775, 'en', NULL, '<p>Sturdy sandblasted aluminum 10-in-1 USB-C adapter featuring dual 4K HDMI output, 100W Power Delivery, and Gigabit LAN for work-from-anywhere setups.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 34, 9, 'en|34|9'),
	(776, 'en', NULL, '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Sturdy sandblasted aluminum 10-in-1 USB-C adapter featuring dual 4K HDMI output, 100W Power Delivery, and Gigabit LAN for work-from-anywhere setups.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Port Layout</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">2x 4K HDMI @60Hz/30Hz, 1x 100W USB-C PD, 1x Gigabit RJ45 Ethernet, 3x USB 3.0 (5Gbps), SD &amp; TF Card Slots, 3.5mm Audio</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Chassis</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Aerospace-grade sandblasted aluminum alloy case for rapid heat dissipation</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Cable</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Reinforced braided nylon integrated connector with LED indicator light</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Compatibility</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Plug-and-play on Windows 11, macOS, iPadOS, ChromeOS, and Android</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', NULL, NULL, NULL, NULL, NULL, NULL, 34, 10, 'en|34|10'),
	(777, NULL, NULL, NULL, NULL, NULL, 49.9900, NULL, NULL, NULL, 34, 11, '34|11'),
	(778, NULL, NULL, NULL, NULL, NULL, 26.0000, NULL, NULL, NULL, 34, 12, '34|12'),
	(779, NULL, NULL, NULL, NULL, NULL, 39.9900, NULL, NULL, NULL, 34, 13, '34|13'),
	(780, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL, 34, 14, 'default|34|14'),
	(781, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2027-12-31', NULL, 34, 15, 'default|34|15'),
	(782, 'en', NULL, 'Baseus Metal Gleam 10-in-1 Dual 4K HDMI USB-C Multi-Port Adapter Hub', NULL, NULL, NULL, NULL, NULL, NULL, 34, 16, 'en|34|16'),
	(783, 'en', NULL, 'baseus, metal, gleam, 10, in, 1, dual, 4k, hdmi, usb, c, multi, port, adapter, hub', NULL, NULL, NULL, NULL, NULL, NULL, 34, 17, 'en|34|17'),
	(784, 'en', NULL, 'Sturdy sandblasted aluminum 10-in-1 USB-C adapter featuring dual 4K HDMI output, 100W Power Delivery, and Gigabit LAN for work-from-anywhere setups.', NULL, NULL, NULL, NULL, NULL, NULL, 34, 18, 'en|34|18'),
	(785, NULL, NULL, '0.12', NULL, NULL, NULL, NULL, NULL, NULL, 34, 22, '34|22'),
	(786, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 34, 26, '34|26'),
	(787, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 34, 28, 'default|34|28'),
	(788, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 34, 29, 'default|34|29'),
	(789, NULL, NULL, 'CASE-PITAKA-MAGEZ5', NULL, NULL, NULL, NULL, NULL, NULL, 35, 1, '35|1'),
	(790, 'en', NULL, 'Pitaka MagEZ Case 5 1500D Aramid Fiber Ultra-Slim MagSafe Case', NULL, NULL, NULL, NULL, NULL, NULL, 35, 2, 'en|35|2'),
	(791, 'en', NULL, 'pitaka-magez-case-5-1500d-aramid-fiber-ultra-slim-magsafe-case', NULL, NULL, NULL, NULL, NULL, NULL, 35, 3, 'en|35|3'),
	(792, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 35, 4, 'default|35|4'),
	(793, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 35, 5, '35|5'),
	(794, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 35, 6, '35|6'),
	(795, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 35, 7, '35|7'),
	(796, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 35, 8, 'default|35|8'),
	(797, 'en', NULL, '<p>Crafted from 100% genuine aerospace-grade 1500D Aramid Fiber with Amber Magnet Film technology, delivering naked-phone thinness and powerful MagSafe suction.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 35, 9, 'en|35|9'),
	(798, 'en', NULL, '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Crafted from 100% genuine aerospace-grade 1500D Aramid Fiber with Amber Magnet Film technology, delivering naked-phone thinness and powerful MagSafe suction.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Material</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">100% Genuine 1500D Aerospace-Grade Aramid Fiber (Bulletproof material)</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Thickness &amp; Weight</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">0.75mm Paper-thin profile | Weighs merely 19 grams</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">MagSafe Integration</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Amber Magnet Film technology integrates MagSafe ring with zero added bulk</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Grip &amp; Texture</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Vacuum-formed 3D Grip non-slip textured finish feels skin-soft yet grippy</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Lens Protection</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Raised aerospace aluminum camera bezel ring shields costly lenses</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', NULL, NULL, NULL, NULL, NULL, NULL, 35, 10, 'en|35|10'),
	(799, NULL, NULL, NULL, NULL, NULL, 69.9900, NULL, NULL, NULL, 35, 11, '35|11'),
	(800, NULL, NULL, NULL, NULL, NULL, 38.0000, NULL, NULL, NULL, 35, 12, '35|12'),
	(801, NULL, NULL, NULL, NULL, NULL, 59.9900, NULL, NULL, NULL, 35, 13, '35|13'),
	(802, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL, 35, 14, 'default|35|14'),
	(803, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2027-12-31', NULL, 35, 15, 'default|35|15'),
	(804, 'en', NULL, 'Pitaka MagEZ Case 5 1500D Aramid Fiber Ultra-Slim MagSafe Case', NULL, NULL, NULL, NULL, NULL, NULL, 35, 16, 'en|35|16'),
	(805, 'en', NULL, 'pitaka, magez, case, 5, 1500d, aramid, fiber, ultra, slim, magsafe, case', NULL, NULL, NULL, NULL, NULL, NULL, 35, 17, 'en|35|17'),
	(806, 'en', NULL, 'Crafted from 100% genuine aerospace-grade 1500D Aramid Fiber with Amber Magnet Film technology, delivering naked-phone thinness and powerful MagSafe suction.', NULL, NULL, NULL, NULL, NULL, NULL, 35, 18, 'en|35|18'),
	(807, NULL, NULL, '0.019', NULL, NULL, NULL, NULL, NULL, NULL, 35, 22, '35|22'),
	(808, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 35, 26, '35|26'),
	(809, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 35, 28, 'default|35|28'),
	(810, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 35, 29, 'default|35|29'),
	(811, NULL, NULL, 'CASE-SPIGEN-TOUGH-MAGFIT', NULL, NULL, NULL, NULL, NULL, NULL, 36, 1, '36|1'),
	(812, 'en', NULL, 'Spigen Tough Armor MagFit Dual-Layer Kickstand Rugged Case', NULL, NULL, NULL, NULL, NULL, NULL, 36, 2, 'en|36|2'),
	(813, 'en', NULL, 'spigen-tough-armor-magfit-dual-layer-kickstand-rugged-case', NULL, NULL, NULL, NULL, NULL, NULL, 36, 3, 'en|36|3'),
	(814, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, 4, 'default|36|4'),
	(815, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 36, 5, '36|5'),
	(816, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 36, 6, '36|6'),
	(817, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 36, 7, '36|7'),
	(818, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 36, 8, 'default|36|8'),
	(819, 'en', NULL, '<p>Legendary dual-layer heavy duty drop defense combining shock-absorbent TPU and rigid polycarbonate with extreme impact foam and reinforced magnetic kickstand.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 36, 9, 'en|36|9'),
	(820, 'en', NULL, '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Legendary dual-layer heavy duty drop defense combining shock-absorbent TPU and rigid polycarbonate with extreme impact foam and reinforced magnetic kickstand.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Drop Protection</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Certified Military Grade MIL-STD 810G-516.6 with Air Cushion Technology</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Impact Foam</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">All-new Extreme Impact Foam lining absorbs and dissipates severe shock energy</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Kickstand</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Ergonomic reinforced flush built-in kickstand for hands-free landscape viewing</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">MagSafe Compatibility</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Embedded strong N52 neodymium magnetic ring for flawless MagSafe accessories</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', NULL, NULL, NULL, NULL, NULL, NULL, 36, 10, 'en|36|10'),
	(821, NULL, NULL, NULL, NULL, NULL, 44.9900, NULL, NULL, NULL, 36, 11, '36|11'),
	(822, NULL, NULL, NULL, NULL, NULL, 20.0000, NULL, NULL, NULL, 36, 12, '36|12'),
	(823, NULL, NULL, NULL, NULL, NULL, 34.9900, NULL, NULL, NULL, 36, 13, '36|13'),
	(824, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL, 36, 14, 'default|36|14'),
	(825, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2027-12-31', NULL, 36, 15, 'default|36|15'),
	(826, 'en', NULL, 'Spigen Tough Armor MagFit Dual-Layer Kickstand Rugged Case', NULL, NULL, NULL, NULL, NULL, NULL, 36, 16, 'en|36|16'),
	(827, 'en', NULL, 'spigen, tough, armor, magfit, dual, layer, kickstand, rugged, case', NULL, NULL, NULL, NULL, NULL, NULL, 36, 17, 'en|36|17'),
	(828, 'en', NULL, 'Legendary dual-layer heavy duty drop defense combining shock-absorbent TPU and rigid polycarbonate with extreme impact foam and reinforced magnetic kickstand.', NULL, NULL, NULL, NULL, NULL, NULL, 36, 18, 'en|36|18'),
	(829, NULL, NULL, '0.065', NULL, NULL, NULL, NULL, NULL, NULL, 36, 22, '36|22'),
	(830, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 36, 26, '36|26'),
	(831, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 36, 28, 'default|36|28'),
	(832, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 36, 29, 'default|36|29'),
	(833, NULL, NULL, 'GLASS-TORRAS-DIAMOND', NULL, NULL, NULL, NULL, NULL, NULL, 37, 1, '37|1'),
	(834, 'en', NULL, 'Torras Diamond Shield 9H+ Ultra-Hard Screen Protector with EZ-Fit Tray', NULL, NULL, NULL, NULL, NULL, NULL, 37, 2, 'en|37|2'),
	(835, 'en', NULL, 'torras-diamond-shield-9h-ultra-hard-screen-protector-with-ez-fit-tray', NULL, NULL, NULL, NULL, NULL, NULL, 37, 3, 'en|37|3'),
	(836, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 37, 4, 'default|37|4'),
	(837, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 37, 5, '37|5'),
	(838, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 37, 6, '37|6'),
	(839, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 37, 7, '37|7'),
	(840, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 37, 8, 'default|37|8'),
	(841, 'en', NULL, '<p>Military shatterproof 9H+ diamond-hard tempered glass screen shield with 10-second auto-dust-eliminating installation tray and oleophobic coating.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 37, 9, 'en|37|9'),
	(842, 'en', NULL, '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Military shatterproof 9H+ diamond-hard tempered glass screen shield with 10-second auto-dust-eliminating installation tray and oleophobic coating.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Hardness &amp; Toughness</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">9H+ Top-Grade CSG Diamond-Hard Tempered Glass (Withstands 110lb edge impacts)</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Easy Installation</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Patented 10-Second Auto-Alignment &amp; Auto-Dust-Removal Tray ensures 0 bubbles</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Touch &amp; Clarity</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">99.99% High Transparency HD Clarity with 0.28mm ultra-responsive sensitivity</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Surface Coating</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Vacuum Electroplated Oleophobic coating resists fingerprints and oil smudges</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', NULL, NULL, NULL, NULL, NULL, NULL, 37, 10, 'en|37|10'),
	(843, NULL, NULL, NULL, NULL, NULL, 32.9900, NULL, NULL, NULL, 37, 11, '37|11'),
	(844, NULL, NULL, NULL, NULL, NULL, 14.0000, NULL, NULL, NULL, 37, 12, '37|12'),
	(845, NULL, NULL, NULL, NULL, NULL, 26.9900, NULL, NULL, NULL, 37, 13, '37|13'),
	(846, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-01-01', NULL, 37, 14, 'default|37|14'),
	(847, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2027-12-31', NULL, 37, 15, 'default|37|15'),
	(848, 'en', NULL, 'Torras Diamond Shield 9H+ Ultra-Hard Screen Protector with EZ-Fit Tray', NULL, NULL, NULL, NULL, NULL, NULL, 37, 16, 'en|37|16'),
	(849, 'en', NULL, 'torras, diamond, shield, 9h, ultra, hard, screen, protector, with, ez, fit, tray', NULL, NULL, NULL, NULL, NULL, NULL, 37, 17, 'en|37|17'),
	(850, 'en', NULL, 'Military shatterproof 9H+ diamond-hard tempered glass screen shield with 10-second auto-dust-eliminating installation tray and oleophobic coating.', NULL, NULL, NULL, NULL, NULL, NULL, 37, 18, 'en|37|18'),
	(851, NULL, NULL, '0.03', NULL, NULL, NULL, NULL, NULL, NULL, 37, 22, '37|22'),
	(852, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 37, 26, '37|26'),
	(853, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 37, 28, 'default|37|28'),
	(854, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 37, 29, 'default|37|29'),
	(855, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 37, 27, '37|27'),
	(856, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 37, 30, 'default|37|30'),
	(857, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 37, 19, '37|19'),
	(858, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 36, 27, '36|27'),
	(859, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, 30, 'default|36|30'),
	(860, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 36, 19, '36|19'),
	(861, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 35, 27, '35|27'),
	(862, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 35, 30, 'default|35|30'),
	(863, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 35, 19, '35|19'),
	(864, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 34, 27, '34|27'),
	(865, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 34, 30, 'default|34|30'),
	(866, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 34, 19, '34|19'),
	(867, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 33, 27, '33|27'),
	(868, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 33, 30, 'default|33|30'),
	(869, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 33, 19, '33|19'),
	(870, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 32, 27, '32|27'),
	(871, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 32, 30, 'default|32|30'),
	(872, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 32, 19, '32|19'),
	(873, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 30, 27, '30|27'),
	(874, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, 30, 'default|30|30'),
	(875, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 30, 19, '30|19'),
	(876, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 31, 27, '31|27'),
	(877, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 31, 30, 'default|31|30'),
	(878, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 31, 19, '31|19'),
	(879, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 29, 27, '29|27'),
	(880, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 29, 30, 'default|29|30'),
	(881, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 29, 19, '29|19'),
	(882, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 28, 27, '28|27'),
	(883, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 28, 30, 'default|28|30'),
	(884, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 28, 19, '28|19'),
	(885, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 26, 27, '26|27'),
	(886, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 26, 30, 'default|26|30'),
	(887, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 26, 19, '26|19'),
	(888, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 27, 27, '27|27'),
	(889, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, 30, 'default|27|30'),
	(890, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 27, 19, '27|19'),
	(891, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 25, 27, '25|27'),
	(892, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 30, 'default|25|30'),
	(893, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 25, 19, '25|19'),
	(894, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 24, 27, '24|27'),
	(895, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 24, 30, 'default|24|30'),
	(896, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 24, 19, '24|19'),
	(897, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 23, 27, '23|27'),
	(898, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 23, 30, 'default|23|30'),
	(899, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 23, 19, '23|19'),
	(900, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 22, 27, '22|27'),
	(901, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 22, 30, 'default|22|30'),
	(902, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 22, 19, '22|19'),
	(903, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 21, 27, '21|27'),
	(904, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, 30, 'default|21|30'),
	(905, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 21, 19, '21|19'),
	(906, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 20, 27, '20|27'),
	(907, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 30, 'default|20|30'),
	(908, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 20, 19, '20|19'),
	(909, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 19, 27, '19|27'),
	(910, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19, 30, 'default|19|30'),
	(911, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 19, 19, '19|19'),
	(912, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 4, 27, '4|27'),
	(913, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 30, 'default|4|30'),
	(914, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 4, 19, '4|19'),
	(915, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, 27, '1|27'),
	(916, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 30, 'default|1|30'),
	(917, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, 19, '1|19'),
	(918, 'en', NULL, '<p>Dominate your enemies with lightning-fast, precise clicks. The G305 LIGHTSPEED wireless gaming mouse from Logitech® G is designed for serious performance with the latest technology and an impressive 250-hour battery life. Plus, it’s available at an affordable price point and in a variety of colors, so you can gear up in style.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 38, 9, 'en|38|9'),
	(919, 'en', NULL, '<p>Dominate your enemies with lightning-fast, precise clicks. The G305 LIGHTSPEED wireless gaming mouse from Logitech® G is designed for serious performance with the latest technology and an impressive 250-hour battery life. Plus, it’s available at an affordable price point and in a variety of colors, so you can gear up in style.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 38, 10, 'en|38|10'),
	(920, NULL, NULL, 'SP-TEST-01', NULL, NULL, NULL, NULL, NULL, NULL, 38, 1, '38|1'),
	(921, 'en', NULL, 'G305 LIGHTSPEED wireless gaming mouse', NULL, NULL, NULL, NULL, NULL, NULL, 38, 2, 'en|38|2'),
	(922, 'en', NULL, 'g305-lightspeed-wireless-gaming-mouse', NULL, NULL, NULL, NULL, NULL, NULL, 38, 3, 'en|38|3'),
	(923, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 38, 4, 'default|38|4'),
	(924, NULL, NULL, 'G305', NULL, NULL, NULL, NULL, NULL, NULL, 38, 27, '38|27'),
	(925, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 38, 28, 'default|38|28'),
	(926, 'en', NULL, 'G305 Gaming mice', NULL, NULL, NULL, NULL, NULL, NULL, 38, 16, 'en|38|16'),
	(927, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 38, 17, 'en|38|17'),
	(928, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 38, 18, 'en|38|18'),
	(929, NULL, NULL, NULL, NULL, NULL, 250.0000, NULL, NULL, NULL, 38, 11, '38|11'),
	(930, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 38, 12, '38|12'),
	(931, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 38, 13, '38|13'),
	(932, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 38, 14, 'default|38|14'),
	(933, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 38, 15, 'default|38|15'),
	(934, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 38, 29, 'default|38|29'),
	(935, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 38, 30, 'default|38|30'),
	(936, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 38, 5, '38|5'),
	(937, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 38, 6, '38|6'),
	(938, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 38, 7, '38|7'),
	(939, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 38, 8, 'default|38|8'),
	(940, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 38, 26, '38|26'),
	(941, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 38, 19, '38|19'),
	(942, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 38, 22, '38|22');

-- Dumping structure for table bagisto_db.product_bundle_options
CREATE TABLE IF NOT EXISTS `product_bundle_options` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `product_bundle_options_product_id_foreign` (`product_id`),
  CONSTRAINT `product_bundle_options_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_bundle_options: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.product_bundle_option_products
CREATE TABLE IF NOT EXISTS `product_bundle_option_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `product_bundle_option_id` int unsigned NOT NULL,
  `qty` int NOT NULL DEFAULT '0',
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `bundle_option_products_product_id_bundle_option_id_unique` (`product_id`,`product_bundle_option_id`),
  KEY `pbop_option_id_idx` (`product_bundle_option_id`),
  CONSTRAINT `product_bundle_option_id_foreign` FOREIGN KEY (`product_bundle_option_id`) REFERENCES `product_bundle_options` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_bundle_option_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_bundle_option_products: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.product_bundle_option_translations
CREATE TABLE IF NOT EXISTS `product_bundle_option_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_bundle_option_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_bundle_option_translations_option_id_locale_unique` (`product_bundle_option_id`,`locale`),
  UNIQUE KEY `bundle_option_translations_locale_label_bundle_option_id_unique` (`locale`,`label`,`product_bundle_option_id`),
  CONSTRAINT `product_bundle_option_translations_option_id_foreign` FOREIGN KEY (`product_bundle_option_id`) REFERENCES `product_bundle_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_bundle_option_translations: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.product_categories
CREATE TABLE IF NOT EXISTS `product_categories` (
  `product_id` int unsigned NOT NULL,
  `category_id` int unsigned NOT NULL,
  UNIQUE KEY `product_categories_product_id_category_id_unique` (`product_id`,`category_id`),
  KEY `product_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `product_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_categories: ~36 rows (approximately)
INSERT INTO `product_categories` (`product_id`, `category_id`) VALUES
	(3, 1),
	(1, 2),
	(4, 2),
	(5, 2),
	(6, 2),
	(19, 2),
	(7, 3),
	(8, 3),
	(9, 3),
	(20, 3),
	(21, 3),
	(10, 4),
	(11, 4),
	(22, 4),
	(23, 4),
	(24, 4),
	(12, 5),
	(13, 5),
	(25, 5),
	(26, 5),
	(27, 5),
	(14, 6),
	(15, 6),
	(28, 6),
	(29, 6),
	(30, 6),
	(38, 6),
	(16, 7),
	(31, 7),
	(32, 7),
	(33, 7),
	(34, 7),
	(17, 8),
	(18, 8),
	(35, 8),
	(36, 8),
	(37, 8);

-- Dumping structure for table bagisto_db.product_channels
CREATE TABLE IF NOT EXISTS `product_channels` (
  `product_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  UNIQUE KEY `product_channels_product_id_channel_id_unique` (`product_id`,`channel_id`),
  KEY `product_channels_channel_id_foreign` (`channel_id`),
  KEY `pc_product_id_channel_id_idx` (`product_id`,`channel_id`),
  CONSTRAINT `product_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_channels_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_channels: ~37 rows (approximately)
INSERT INTO `product_channels` (`product_id`, `channel_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1),
	(7, 1),
	(8, 1),
	(9, 1),
	(10, 1),
	(11, 1),
	(12, 1),
	(13, 1),
	(14, 1),
	(15, 1),
	(16, 1),
	(17, 1),
	(18, 1),
	(19, 1),
	(20, 1),
	(21, 1),
	(22, 1),
	(23, 1),
	(24, 1),
	(25, 1),
	(26, 1),
	(27, 1),
	(28, 1),
	(29, 1),
	(30, 1),
	(31, 1),
	(32, 1),
	(33, 1),
	(34, 1),
	(35, 1),
	(36, 1),
	(37, 1),
	(38, 1),
	(39, 1),
	(40, 1);

-- Dumping structure for table bagisto_db.product_cross_sells
CREATE TABLE IF NOT EXISTS `product_cross_sells` (
  `parent_id` int unsigned NOT NULL,
  `child_id` int unsigned NOT NULL,
  UNIQUE KEY `product_cross_sells_parent_id_child_id_unique` (`parent_id`,`child_id`),
  KEY `product_cross_sells_child_id_foreign` (`child_id`),
  CONSTRAINT `product_cross_sells_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_cross_sells_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_cross_sells: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.product_customer_group_prices
CREATE TABLE IF NOT EXISTS `product_customer_group_prices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL DEFAULT '0',
  `value_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `product_id` int unsigned NOT NULL,
  `customer_group_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `unique_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_customer_group_prices_unique_id_unique` (`unique_id`),
  KEY `product_customer_group_prices_product_id_foreign` (`product_id`),
  KEY `product_customer_group_prices_customer_group_id_foreign` (`customer_group_id`),
  CONSTRAINT `product_customer_group_prices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_customer_group_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_customer_group_prices: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.product_customizable_options
CREATE TABLE IF NOT EXISTS `product_customizable_options` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '1',
  `max_characters` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `supported_file_extensions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sort_order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `product_customizable_options_product_id_foreign` (`product_id`),
  CONSTRAINT `product_customizable_options_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_customizable_options: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.product_customizable_option_prices
CREATE TABLE IF NOT EXISTS `product_customizable_option_prices` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `label` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `product_customizable_option_id` int unsigned NOT NULL,
  `sort_order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pcop_product_customizable_option_id_foreign` (`product_customizable_option_id`),
  CONSTRAINT `pcop_product_customizable_option_id_foreign` FOREIGN KEY (`product_customizable_option_id`) REFERENCES `product_customizable_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_customizable_option_prices: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.product_customizable_option_translations
CREATE TABLE IF NOT EXISTS `product_customizable_option_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `product_customizable_option_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_customizable_option_id_locale_unique` (`product_customizable_option_id`,`locale`),
  CONSTRAINT `pcot_product_customizable_option_id_foreign` FOREIGN KEY (`product_customizable_option_id`) REFERENCES `product_customizable_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_customizable_option_translations: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.product_downloadable_links
CREATE TABLE IF NOT EXISTS `product_downloadable_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sample_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sample_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sample_file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sample_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `downloads` int NOT NULL DEFAULT '0',
  `sort_order` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_downloadable_links_product_id_foreign` (`product_id`),
  CONSTRAINT `product_downloadable_links_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_downloadable_links: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.product_downloadable_link_translations
CREATE TABLE IF NOT EXISTS `product_downloadable_link_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_downloadable_link_id` int unsigned NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `link_translations_link_id_foreign` (`product_downloadable_link_id`),
  CONSTRAINT `link_translations_link_id_foreign` FOREIGN KEY (`product_downloadable_link_id`) REFERENCES `product_downloadable_links` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_downloadable_link_translations: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.product_downloadable_samples
CREATE TABLE IF NOT EXISTS `product_downloadable_samples` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_downloadable_samples_product_id_foreign` (`product_id`),
  CONSTRAINT `product_downloadable_samples_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_downloadable_samples: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.product_downloadable_sample_translations
CREATE TABLE IF NOT EXISTS `product_downloadable_sample_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_downloadable_sample_id` int unsigned NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `sample_translations_sample_id_foreign` (`product_downloadable_sample_id`),
  CONSTRAINT `sample_translations_sample_id_foreign` FOREIGN KEY (`product_downloadable_sample_id`) REFERENCES `product_downloadable_samples` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_downloadable_sample_translations: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.product_flat
CREATE TABLE IF NOT EXISTS `product_flat` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `url_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new` tinyint(1) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `meta_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `price` decimal(12,4) DEFAULT NULL,
  `special_price` decimal(12,4) DEFAULT NULL,
  `special_price_from` date DEFAULT NULL,
  `special_price_to` date DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `images_count` int DEFAULT '0',
  `manage_stock` tinyint(1) DEFAULT NULL,
  `base_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `attribute_family_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute_family_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  `visible_individually` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_flat_unique_index` (`product_id`,`channel`,`locale`),
  KEY `product_flat_attribute_family_id_foreign` (`attribute_family_id`),
  KEY `product_flat_parent_id_foreign` (`parent_id`),
  CONSTRAINT `product_flat_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `product_flat_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `product_flat` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_flat_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_flat: ~38 rows (approximately)
INSERT INTO `product_flat` (`id`, `sku`, `type`, `product_number`, `name`, `short_description`, `description`, `url_key`, `new`, `featured`, `status`, `meta_title`, `meta_keywords`, `meta_description`, `price`, `special_price`, `special_price_from`, `special_price_to`, `weight`, `quantity`, `images_count`, `manage_stock`, `base_image`, `category_name`, `attribute_family_name`, `created_at`, `locale`, `channel`, `attribute_family_id`, `product_id`, `updated_at`, `parent_id`, `visible_individually`) VALUES
	(1, 'PHONE-ROG8PRO-512', 'simple', '', 'ASUS ROG Phone 8 Pro 16GB/512GB Gaming Snapdragon 8 Gen 3', '<p>The ultimate flagship gaming phone featuring an ultra-smooth 165Hz AMOLED display, AirTrigger ultrasonic touch sensors, and GameCool 8 3D vapor chamber cooling system.</p>', '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">The ultimate flagship gaming phone featuring an ultra-smooth 165Hz AMOLED display, AirTrigger ultrasonic touch sensors, and GameCool 8 3D vapor chamber cooling system.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Display</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">6.78 inch Samsung E6 Flexible AMOLED 165Hz LTPO 2500 nits</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Processor</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Snapdragon 8 Gen 3 clocked up to 3.3GHz</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Memory &amp; Storage</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">16GB LPDDR5X RAM, 512GB UFS 4.0 storage</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">LED Lighting</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">AniMe Vision secondary matrix display with 341 customizable mini-LEDs</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Battery &amp; Charging</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">5,500 mAh, 65W HyperCharge fast charging, 15W Qi wireless charging</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Gaming Features</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">AirTrigger 8, dual USB-C ports (side &amp; bottom), IP68 water resistance</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', 'asus-rog-phone-8-pro-16gb512gb-gaming-snapdragon-8-gen-3-nom6', 1, 1, 1, '', '', '', 1099.0000, 999.0000, '2025-01-01', '2027-12-31', 0.3500, 10, 5, 1, 'product/5/rog-7va8-man-hinh.webp', 'Flagship Smartphones', 'Default', '2026-09-28 09:21:27', 'en', 'default', 1, 5, '2026-10-22 05:00:27', NULL, 1),
	(2, 'PHONE-XM14U-512', 'simple', '', 'Xiaomi 14 Ultra 16GB/512GB Leica Quad Camera 1-inch Sensor', '<p>The pinnacle of mobile photography co-engineered with Leica, featuring a quad 50MP camera array with a 1-inch sensor and stepless variable aperture.</p>', '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">The pinnacle of mobile photography co-engineered with Leica, featuring a quad 50MP camera array with a 1-inch sensor and stepless variable aperture.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Display</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">6.73 inch LTPO AMOLED WQHD+ 120Hz 3000 nits Dolby Vision</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Processor</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Qualcomm Snapdragon 8 Gen 3</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Memory &amp; Storage</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">16GB LPDDR5X RAM, 512GB UFS 4.0 storage</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Camera Leica</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">50MP LYT-900 1-inch OIS stepless variable aperture f/1.63 - f/4.0</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Battery &amp; Charging</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">5,000 mAh, 90W HyperCharge wired fast charging, 80W wireless charging</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', 'xiaomi-14-ultra-16gb512gb-leica-quad-camera-1-inch-sensor-7anx', 1, 1, 1, '', '', '', 1149.0000, 1049.0000, '2025-01-01', '2027-12-31', 0.3500, 8, 5, 1, 'product/6/9e32dac4fda571a7a5a3a6490f98361f.webp', 'Flagship Smartphones', 'Default', '2026-09-28 09:21:27', 'en', 'default', 1, 6, '2026-10-22 05:00:27', NULL, 1),
	(3, 'CHG-ANKER-737-140W', 'simple', '', 'Anker 737 GaNPrime 140W 3-Port Wall Charger (A2341)', '<p>Anker\'s most advanced GaN charger with 140W max output (PD 3.1), fast charging a 16-inch MacBook Pro and two iPhones simultaneously at top speed.</p>', '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Anker\'s most advanced GaN charger with 140W max output (PD 3.1), fast charging a 16-inch MacBook Pro and two iPhones simultaneously at top speed.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Total Output</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">140W Max (Supports USB Power Delivery 3.1 standard)</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Ports</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">2 x USB-C (140W max per port), 1 x USB-A (22.5W)</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Technology</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">GaNPrime, ActiveShield 2.0 real-time temperature monitoring 3M times/day</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Compatibility</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">MacBook Pro, Dell XPS, iPhone 16/15, Samsung 45W Super Fast Charging 2.0</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Dimensions</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">39% smaller than standard Apple 140W power adapter</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', 'cu-sac-gan-anker-737-ganprime-140w-3-cong-a2341-gquz', 1, 1, 1, '', '', '', 99.9900, 84.9900, '2025-01-01', '2027-12-31', 0.3500, 27, 3, 1, 'product/7/24dbaece-c71d-42c7-a04b-6cc60da4f175.webp', 'Fast Chargers & GaN', 'Default', '2026-09-28 09:21:27', 'en', 'default', 1, 7, '2026-10-22 05:00:27', NULL, 1),
	(4, 'CHG-BASEUS-BLADE-100W', 'simple', '', 'Baseus Blade HD GaN 100W Ultra-Slim Fast Charger PD 3.0 & QC 4.0', '<p>Ultra-slim 18mm card-style profile easily slips into backpacks and sleeves, delivering 100W high power with intelligent 4-port power distribution.</p>', '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Ultra-slim 18mm card-style profile easily slips into backpacks and sleeves, delivering 100W high power with intelligent 4-port power distribution.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Power</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">100W Max</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Output Ports</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">2x Type-C (100W), 2x USB-A (30W)</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Profile</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Only 1.8cm ultra-compact card profile design</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Protection</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Auto power shutoff when full, comprehensive overvoltage, overcurrent, and overheat protections</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', 'cu-sac-sieu-mong-baseus-blade-hd-gan-100w-pd-30-qc-40-a1gh', 1, 1, 1, '', '', '', 69.9900, 54.9900, '2025-01-01', '2027-12-31', 0.3500, 94, 1, 1, 'product/8/02-1666673256090.webp', 'Fast Chargers & GaN', 'Default', '2026-09-28 09:21:27', 'en', 'default', 1, 8, '2026-10-22 05:00:27', NULL, 1),
	(5, 'CHG-UGREEN-NEXODE-300W', 'simple', '', 'Ugreen Nexode GaN 300W 5-Port Desktop Charger Station', '<p>High-powered desktop charging station capable of fast charging 3 high-performance laptops and 2 smartphones simultaneously at maximum speed.</p>', '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">High-powered desktop charging station capable of fast charging 3 high-performance laptops and 2 smartphones simultaneously at maximum speed.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Total Power</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">300W Max</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Main Port Type-C1</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">140W Max dedicated output (PD 3.1)</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">GaN Chipset</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">GaNFast Gen III optimizing efficiency up to 95%</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Power Cord</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">2m detachable heavy-duty AC extension cable for desktop setups</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', 'tram-sac-de-ban-ugreen-nexode-gan-300w-5-cong-sac-3-laptop-oox7', 1, 1, 1, '', '', '', 199.9900, 169.9900, '2025-01-01', '2027-12-31', 0.3500, 32, 3, 1, 'product/9/ugreen-nexode-300w-usb-c-gan-charger-5-ports-desktop-charger-257525.webp', 'Fast Chargers & GaN', 'Default', '2026-09-28 09:21:27', 'en', 'default', 1, 9, '2026-10-22 05:00:27', NULL, 1),
	(6, 'PB-SHARGEEK-STORM2-100W', 'simple', '', 'Shargeek Storm 2 25600mAh 100W Transparent Cyberpunk Power Bank', '<p>Cyberpunk-inspired transparent power bank with an IPS color smart screen displaying real-time voltage, current, battery temperature, and wattage.</p>', '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Cyberpunk-inspired transparent power bank with an IPS color smart screen displaying real-time voltage, current, battery temperature, and wattage.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Capacity</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">25,600 mAh / 93.5Wh (Airline approved carry-on standard)</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Type-C Output</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">100W Max PD In/Out (Fully recharges power bank in just 90 mins)</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Adjustable DC Port</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">3.3V - 25.2V customizable output up to 75W</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Display</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">1.14-inch IPS color screen with real-time power metrics</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Battery Cells</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">8x 18650 premium electric vehicle-grade battery cells</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', 'pin-du-phong-shargeek-storm-2-25600mah-100w-trong-suot-ips-screen-mdiv', 1, 1, 1, '', '', '', 219.0000, 189.0000, '2025-01-01', '2027-12-31', 0.3500, 59, 3, 1, 'product/10/pin-sac-du-phong-shargeek-storm-2-liquid-25600mah-2.webp', 'Power Banks', 'Default', '2026-09-28 09:21:28', 'en', 'default', 1, 10, '2026-10-22 05:00:27', NULL, 1),
	(7, 'PB-ANKER-PRIME-20000', 'simple', '', 'Anker Prime 20000mAh 200W Multi-Device Power Bank', '<p>Modern column design with dual 100W USB-C ports, enabling simultaneous 100W fast charging for two MacBook Pro laptops.</p>', '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Modern column design with dual 100W USB-C ports, enabling simultaneous 100W fast charging for two MacBook Pro laptops.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Capacity</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">20.000 mAh</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Max Output Power</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">200W (Dual-port 100W + 100W)</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Ports</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">2x USB-C (100W), 1x USB-A (65W)</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Display</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Color Smart Display showing real-time battery level &amp; wattage</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', 'pin-du-phong-anker-prime-20000mah-200w-output-da-nang-m6up', 1, 1, 1, '', '', '', 129.9900, 109.9900, '2025-01-01', '2027-12-31', 0.3500, 55, 3, 1, 'product/11/pin-sac-du-phong-anker-prime-20000mah-200w-a1336-1.webp', 'Power Banks', 'Default', '2026-09-28 09:21:28', 'en', 'default', 1, 11, '2026-10-22 05:00:27', NULL, 1),
	(8, 'EAR-SONY-WF1000XM5', 'simple', '', 'Sony WF-1000XM5 Flagship Noise Canceling Earbuds Hi-Res LDAC', '<p>Industry-leading true wireless active noise canceling earbuds, powered by the Dynamic Driver X for deep, immersive bass and crystal-clear acoustic detail.</p>', '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Industry-leading true wireless active noise canceling earbuds, powered by the Dynamic Driver X for deep, immersive bass and crystal-clear acoustic detail.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Noise Cancellation</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Dual Integrated Processor V2 and HD Noise Canceling Processor QN2e</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Audio Quality</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Hi-Res Audio Wireless, LDAC, DSEE Extreme AI</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Battery Life</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">8 hrs (ANC on) + 16 hrs from charging case (24 hrs total)</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Microphones</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Bone conduction sensors and AI noise-reduction call algorithm</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Water Resistance</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">IPX4 splash and sweat resistance standard</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', 'tai-nghe-sony-wf-1000xm5-chong-on-dau-bang-hi-res-ldac-fyam', 1, 1, 1, '', '', '', 299.9900, 249.9900, '2025-01-01', '2027-12-31', 0.3500, 90, 2, 1, 'product/12/tai-nghe-khong-day-sony-wf-1000xm5-6-1.webp', 'Audio & Gaming Earbuds', 'Default', '2026-09-28 09:21:28', 'en', 'default', 1, 12, '2026-10-22 05:00:27', NULL, 1),
	(9, 'EAR-ROG-CETRA-SPEEDNOVA', 'simple', '', 'ASUS ROG Cetra True Wireless SpeedNova 2.4GHz Gaming Earbuds', '<p>The ultimate audio weapon for gamers featuring dual-mode 2.4GHz ultra-low latency wireless via USB-C Dongle, eliminating sound lag in competitive FPS and MOBA games.</p>', '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">The ultimate audio weapon for gamers featuring dual-mode 2.4GHz ultra-low latency wireless via USB-C Dongle, eliminating sound lag in competitive FPS and MOBA games.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Dual Wireless</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">ROG SpeedNova 2.4GHz wireless (via USB-C Dongle) &amp; Bluetooth 5.3</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Audio Quality</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">High-resolution 24-bit 96kHz spatial audio</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Noise Cancellation</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Adaptive Hybrid ANC intelligent environmental noise reduction</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Microphones</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">AI Bone-Conduction microphones for crystal-clear voice chat</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Battery Life</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Up to 46 hours total playtime (Bluetooth mode)</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', 'tai-nghe-gaming-rog-cetra-true-wireless-speednova-24ghz-vjr4', 1, 1, 1, '', '', '', 199.9900, 179.9900, '2025-01-01', '2027-12-31', 0.3500, 54, 3, 1, 'product/13/tai-nghe-asus-rog-cetra-tws-speednova-1.webp', 'Audio & Gaming Earbuds', 'Default', '2026-09-28 09:21:28', 'en', 'default', 1, 13, '2026-10-22 05:00:27', NULL, 1),
	(10, 'COOL-REDMAGIC-5PRO', 'simple', '', 'RedMagic Magnetic Cooler 5 Pro 36W Magnetic Phone Cooler', '<p>High-powered 36W magnetic phone cooler with instant freezing technology, snapping securely to MagSafe to cool devices within 3 seconds.</p>', '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">High-powered 36W magnetic phone cooler with instant freezing technology, snapping securely to MagSafe to cool devices within 3 seconds.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Power</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">36W Max (Requires 9V/3A or higher fast charger)</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Cooling Capacity</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Drops surface temperature below -12°C, preventing thermal throttling in heavy games</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Mounting</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Direct MagSafe magnetic mount for iPhone or included universal clamp for Android</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Controls</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Bluetooth app connectivity to customize fan speed and 16.8M color RGB lighting</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', 'so-lanh-tan-nhiet-tu-tinh-redmagic-magnetic-cooler-5-pro-36w-clgk', 1, 1, 1, '', '', '', 59.9900, 49.9900, '2025-01-01', '2027-12-31', 0.3500, 92, 4, 1, 'product/14/quat-tan-nhiet-redmagic-vc-cooler-5-pro-3.webp', 'Phone Coolers & Gaming Gear', 'Default', '2026-09-28 09:21:28', 'en', 'default', 1, 14, '2026-10-22 05:00:27', NULL, 1),
	(11, 'COOL-BLACKSHARK-4PRO', 'simple', '', 'Black Shark FunCooler 4 Pro 27W Semiconductor Phone Cooler', '<p>Large-area TEC semiconductor cooler from Black Shark featuring a real-time digital temperature LED display directly on the device body.</p>', '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Large-area TEC semiconductor cooler from Black Shark featuring a real-time digital temperature LED display directly on the device body.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Power</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">27W TEC Cooling Engine</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Noise Level</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Whisper-quiet below 35dB, zero mic interference during voice calls</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Display</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Real-time digital LED temperature readout</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Clamp Mechanism</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Flexible silicone-cushioned clamp compatible with all phones 67mm - 88mm wide</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', 'quat-so-lanh-black-shark-funcooler-4-pro-27w-lanh-dong-bang-mfvo', 1, 1, 1, '', '', '', 45.0000, 38.0000, '2025-01-01', '2027-12-31', 0.3500, 25, 4, 1, 'product/15/quat-tan-nhiet-dien-thoai-black-shark-funcooler-4-pro-2.webp', 'Phone Coolers & Gaming Gear', 'Default', '2026-09-28 09:21:28', 'en', 'default', 1, 15, '2026-10-22 05:00:27', NULL, 1),
	(12, 'CAB-UGREEN-TB4-240W', 'simple', '', 'Ugreen Thunderbolt 4 Type-C 240W 40Gbps 8K Fast Charging & Data Cable', '<p>Premium multi-purpose cable supporting 8K UHD video output, lightning-fast 40Gbps data transfer, and up to 240W ultra-high power delivery.</p>', '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Premium multi-purpose cable supporting 8K UHD video output, lightning-fast 40Gbps data transfer, and up to 240W ultra-high power delivery.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Bandwidth</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">40Gbps ultra-speed transfer (transfers 10GB file in ~3 seconds)</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Charging Power</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">240W (48V/5A) USB Power Delivery Extended Power Range (EPR)</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Display Output</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Single 8K@60Hz or dual 4K@60Hz displays</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Durability</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Aluminum alloy housings and durable nylon braided exterior rated for 20,000+ bends</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', 'cap-sac-du-lieu-ugreen-thunderbolt-4-type-c-240w-40gbps-8k-x5rb', 1, 1, 1, '', '', '', 34.9900, 27.9900, '2025-01-01', '2027-12-31', 0.3500, 63, 2, 1, 'product/16/cap-sac-du-lieu-ugreen-thunderbolt-4-type-c-240w-40gbps-8k-x5rb.webp', 'Thunderbolt Cables & Hubs', 'Default', '2026-09-28 09:21:29', 'en', 'default', 1, 16, '2026-10-22 05:00:27', NULL, 1),
	(13, 'CASE-UAG-MONARCH-PRO', 'simple', '', 'UAG Monarch Pro Kevlar MagSafe Military Drop-Tested Rugged Case', '<p>Legendary multi-layer protective armor case combining genuine DuPont Kevlar fiber, strong MagSafe magnets, and honeycomb shock-absorbing bumpers.</p>', '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Legendary multi-layer protective armor case combining genuine DuPont Kevlar fiber, strong MagSafe magnets, and honeycomb shock-absorbing bumpers.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Shock Protection</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Tested to 25 ft. (7.6 meters) drop protection (MIL-STD 810G 516.6)</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Materials</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Reinforced DuPont Kevlar fiber, alloy metal hardware, and impact-resistant TPU</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">MagSafe</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Built-in strong N52 Neodymium magnetic array</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Camera Protection</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Elevated perimeter bezel defends expensive camera lenses against scratches</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', 'op-lung-uag-monarch-pro-kevlar-magsafe-chong-va-dap-quan-doi-svwr', 1, 1, 1, '', '', '', 79.9500, 69.9500, '2025-01-01', '2027-12-31', 0.3500, 16, 2, 1, 'product/17/images.webp', 'Tough Cases & Screen Protectors', 'Default', '2026-09-28 09:21:29', 'en', 'default', 1, 17, '2026-10-22 05:00:27', NULL, 1),
	(14, 'GLASS-BELKIN-SAPPHIRE', 'simple', '', 'Belkin UltraGlass 2 Privacy 9H+ Ultra-Tough Tempered Glass Screen Protector', '<p>Ultra-thin 0.29mm glass engineered with German double ion-exchange technology, providing up to 2.7x greater strength than conventional tempered glass.</p>', '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Ultra-thin 0.29mm glass engineered with German double ion-exchange technology, providing up to 2.7x greater strength than conventional tempered glass.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid rgb(229,231,235);margin-bottom:24px;height:89.6px;">\r\n<tbody>\r\n<tr style="background-color:rgb(249,250,251);border-bottom:1px solid rgb(229,231,235);height:22.4px;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:rgb(55,65,81);font-size:14px;height:22.4px;">Hardness</td>\r\n<td style="padding:10px 16px;color:rgb(75,85,99);font-size:14px;height:22.4px;">9H+ Double Ion-Exchange strengthened glass</td>\r\n</tr>\r\n<tr style="background-color:rgb(255,255,255);border-bottom:1px solid rgb(229,231,235);height:22.4px;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:rgb(55,65,81);font-size:14px;height:22.4px;">Privacy</td>\r\n<td style="padding:10px 16px;color:rgb(75,85,99);font-size:14px;height:22.4px;">2-way 28-degree side privacy filter keeps screen confidential in public spaces</td>\r\n</tr>\r\n<tr style="background-color:rgb(249,250,251);border-bottom:1px solid rgb(229,231,235);height:22.4px;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:rgb(55,65,81);font-size:14px;height:22.4px;">Touch Sensitivity</td>\r\n<td style="padding:10px 16px;color:rgb(75,85,99);font-size:14px;height:22.4px;">0.29mm ultra-slim profile preserves 100% native touch precision and smooth Face ID</td>\r\n</tr>\r\n<tr style="background-color:rgb(255,255,255);border-bottom:1px solid rgb(229,231,235);height:22.4px;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:rgb(55,65,81);font-size:14px;height:22.4px;">Easy Align Tray</td>\r\n<td style="padding:10px 16px;color:rgb(75,85,99);font-size:14px;height:22.4px;">Includes patented alignment tray for 100% bubble-free, flawless home installation</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', 'kinh-cuong-luc-belkin-ultraglass-2-chong-nhin-trom-sieu-cung-9h-3lsr', 1, 1, 1, '', '', '', 39.9900, 32.9900, '2025-01-01', '2027-12-31', 0.3500, 69, 1, 1, 'product/18/e-c-ultraglass2-am-expedite-row-front-9e84471191b84d799254e1699e446bd3-09c09e7353164225bbf2829217467909-master.webp', 'Tough Cases & Screen Protectors', 'Default', '2026-09-28 09:21:29', 'en', 'default', 1, 18, '2026-10-22 05:00:27', NULL, 1),
	(15, 'PHONE-IP16PM-256', 'simple', '', 'Apple iPhone 16 Pro Max 256GB Desert Titanium A18 Pro 48MP Fusion', '<p>Engineered for Apple Intelligence with the blazing A18 Pro chip, thinner borders on the expansive 6.9-inch display, dedicated Camera Control button, and 4K 120 fps Dolby Vision recording.</p>', '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Engineered for Apple Intelligence with the blazing A18 Pro chip, thinner borders on the expansive 6.9-inch display, dedicated Camera Control button, and 4K 120 fps Dolby Vision recording.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Display</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">6.9 inch Super Retina XDR OLED ProMotion 120Hz LTPO 2000 nits Ceramic Shield Gen 2</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Processor</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Apple A18 Pro (6-core CPU, 6-core GPU with Hardware Ray Tracing, 16-core NPU)</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Memory &amp; Storage</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">8GB Unified RAM, 256GB NVMe high-speed flash storage</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Camera System</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">48MP Fusion OIS + 48MP Ultra-Wide Macro + 12MP 5x Tetraprism Telephoto (120mm)</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Battery &amp; Charging</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">4,685 mAh, 25W MagSafe Fast Wireless, USB-C 3.2 Gen 2 (10Gbps DisplayPort)</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Special Features</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Dedicated Camera Control capacitive sensor, Action Button, Grade 5 Titanium body</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', 'apple-iphone-16-pro-max-256gb-desert-titanium-a18-pro-48mp-fusion', 1, 1, 1, 'Apple iPhone 16 Pro Max 256GB Desert Titanium A18 Pro 48MP Fusion', 'apple, iphone, 16, pro, max, 256gb, desert, titanium, a18, pro, 48mp, fusion', 'Engineered for Apple Intelligence with the blazing A18 Pro chip, thinner borders on the expansive 6.9-inch display, dedicated Camera Control button, and 4K 120 fps Dolby Vision recording.', 1199.0000, 1149.0000, '2025-01-01', '2027-12-31', 0.2270, 9, 2, 1, 'product/1/iphone-16-pro-max.webp', 'Flagship Smartphones', 'Default', '2026-10-06 06:22:02', 'en', 'default', 1, 1, '2026-10-22 05:00:27', NULL, 1),
	(16, 'TEST-001', 'simple', NULL, 'Test Product', NULL, NULL, 'test-product-001', 0, 0, 1, NULL, NULL, NULL, 100.0000, NULL, NULL, NULL, 1.0000, 66, 0, 1, NULL, NULL, 'Default', '2026-09-28 09:22:16', 'en', 'default', 1, 2, '2026-10-22 05:00:27', NULL, 0),
	(17, 'PHONE-TEST-002', 'simple', '', 'iPhone 16 Pro Max Test', '<p>Test short desc</p>', '<p>Test full desc</p>', 'iphone-16-pro-max-test', 1, 1, 0, '', '', '', 1199.0000, 1129.0000, '2025-01-01', '2027-12-31', 0.3500, 8, 0, 1, NULL, 'Root', 'Default', '2026-09-28 09:22:16', 'en', 'default', 1, 3, '2026-10-22 05:00:27', NULL, 1),
	(18, 'PHONE-S24U-512', 'simple', '', 'Samsung Galaxy S24 Ultra 12GB/512GB Titanium AI Snapdragon 8 Gen 3', '<p>The pinnacle of AI smartphones featuring a durable Titanium frame, built-in S-Pen, quad telephoto 200MP camera system, and the ultra-powerful Snapdragon 8 Gen 3 for Galaxy.</p>', '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">The pinnacle of AI smartphones featuring a durable Titanium frame, built-in S-Pen, quad telephoto 200MP camera system, and the ultra-powerful Snapdragon 8 Gen 3 for Galaxy.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Display</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">6.8 inch Dynamic AMOLED 2X Quad HD+ 120Hz 2600 nits Corning Gorilla Armor</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Processor</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Qualcomm Snapdragon 8 Gen 3 for Galaxy (4nm, Octa-core up to 3.39GHz)</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Memory &amp; Storage</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">12GB LPDDR5X RAM, 512GB UFS 4.0 high-speed storage</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Camera System</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">200MP Wide OIS + 50MP Periscope 5x Optical + 10MP Telephoto 3x + 12MP Ultra-Wide</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Battery &amp; Charging</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">5,000 mAh, 45W Super Fast Charging 2.0, 15W Fast Wireless Charging, Wireless PowerShare</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">AI &amp; Features</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Galaxy AI (Live Translate, Circle to Search, Note Assist), Integrated S-Pen, IP68</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', 'samsung-galaxy-s24-ultra-12gb512gb-titanium-ai-snapdragon-8-gen-3', 1, 1, 1, 'Samsung Galaxy S24 Ultra 12GB/512GB Titanium AI Snapdragon 8 Gen 3', 'samsung, galaxy, s24, ultra, 12gb512gb, titanium, ai, snapdragon, 8, gen, 3', 'The pinnacle of AI smartphones featuring a durable Titanium frame, built-in S-Pen, quad telephoto 200MP camera system, and the ultra-powerful Snapdragon 8 Gen 3 for Galaxy.', 1299.0000, 1199.0000, '2025-01-01', '2027-12-31', 0.2320, 6, 1, 1, 'product/4/samsung-galaxy-s24-ultra-cu-p4q4-rv.webp', 'Flagship Smartphones', 'Default', '2026-10-06 06:22:02', 'en', 'default', 1, 4, '2026-10-22 05:00:27', NULL, 1),
	(19, 'PHONE-REDMAGIC9S-512', 'simple', '', 'Nubia RedMagic 9S Pro 16GB/512GB Gaming Snapdragon 8 Gen 3 Leading Version', '<p>Ultimate esports mobile weapon featuring an uninterrupted true full-screen display, internal 22,000 RPM RGB cooling fan, and 520Hz dual touch shoulder triggers.</p>', '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Ultimate esports mobile weapon featuring an uninterrupted true full-screen display, internal 22,000 RPM RGB cooling fan, and 520Hz dual touch shoulder triggers.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Display</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">6.8 inch BOE Q9+ True FullScreen AMOLED 120Hz 1600 nits Under-Display Camera (UDC)</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Processor</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Qualcomm Snapdragon 8 Gen 3 Leading Version (CPU Overclocked to 3.4GHz)</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Cooling System</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">ICE 13.5 Magic Cooling System with 22,000 RPM Internal RGB Centrifugal Fan</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Memory &amp; Storage</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">16GB LPDDR5X RAM, 512GB UFS 4.0 flash storage</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Battery &amp; Charging</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">6,500 mAh dual-cell monster battery, 80W Quick Charge 4+</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Esports Controls</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">520Hz Dual Glass Shoulder Triggers, Red Core R2 Pro dedicated gaming chip</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', 'nubia-redmagic-9s-pro-16gb512gb-gaming-snapdragon-8-gen-3-leading-version', 1, 1, 1, 'Nubia RedMagic 9S Pro 16GB/512GB Gaming Snapdragon 8 Gen 3 Leading Version', 'nubia, redmagic, 9s, pro, 16gb512gb, gaming, snapdragon, 8, gen, 3, leading, version', 'Ultimate esports mobile weapon featuring an uninterrupted true full-screen display, internal 22,000 RPM RGB cooling fan, and 520Hz dual touch shoulder triggers.', 899.0000, 799.0000, '2025-01-01', '2027-12-31', 0.2290, 5, 2, 1, 'product/19/nubia-red-magic-9s-pro-den-1.webp', 'Flagship Smartphones', 'Default', '2026-10-06 06:22:02', 'en', 'default', 1, 19, '2026-10-22 05:00:27', NULL, 1),
	(20, 'CHG-ANKER-67W', 'simple', '', 'Anker Prime 67W GaN 3-Port Ultra-Compact Wall Charger (A2669)', '<p>Ultra-compact 67W 3-port charger powered by GaNPrime technology, delivering simultaneous high-speed charging for laptops, phones, and tablets in a 51% smaller footprint.</p>', '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Ultra-compact 67W 3-port charger powered by GaNPrime technology, delivering simultaneous high-speed charging for laptops, phones, and tablets in a 51% smaller footprint.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Total Output</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">67W Max (USB Power Delivery 3.0 / PPS / QC 4.0+)</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Port Configuration</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">2 x USB-C (67W max each), 1 x USB-A (22.5W max)</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Smart Power Allocation</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Dynamic Power Distribution automatically balances wattage per connected device</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Safety &amp; Thermal</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">ActiveShield 2.0 temperature monitoring checks thermals 3 million times per day</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Dimensions</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">40 x 38 x 50 mm (51% smaller than original Apple 67W power adapter)</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', 'anker-prime-67w-gan-3-port-ultra-compact-wall-charger-a2669', 1, 0, 1, 'Anker Prime 67W GaN 3-Port Ultra-Compact Wall Charger (A2669)', 'anker, prime, 67w, gan, 3, port, ultra, compact, wall, charger, a2669', 'Ultra-compact 67W 3-port charger powered by GaNPrime technology, delivering simultaneous high-speed charging for laptops, phones, and tablets in a 51% smaller footprint.', 59.9900, 49.9900, '2025-01-01', '2027-12-31', 0.1450, 11, 1, 1, 'product/20/sac-3-cong-anker-prime-67w-gan-a2669-3-d3a5e6ce1f7f41c08b12fe7bcddae14d-grande.webp', 'Fast Chargers & GaN', 'Default', '2026-10-06 06:22:02', 'en', 'default', 1, 20, '2026-10-22 05:00:27', NULL, 1),
	(21, 'CHG-SHARGE-RETRO-67W', 'simple', '', 'Sharge Retro 67W GaN Fast Charger with Real-Time Matrix LED Display', '<p>Nostalgic vintage Macintosh computer aesthetic featuring a functional real-time Matrix digital LED screen that outputs live wattage data and charging animations.</p>', '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Nostalgic vintage Macintosh computer aesthetic featuring a functional real-time Matrix digital LED screen that outputs live wattage data and charging animations.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Power Output</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">67W Max PD 3.0 All-GaN Architecture</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Ports</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">3 x USB-C simultaneous fast charging ports</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Matrix Display</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Vintage LED Matrix screen showing real-time numerical wattage &amp; charging status</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Compatibility</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Fast charges MacBook Pro/Air, iPad Pro, iPhone 16/15, Steam Deck, ROG Ally</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Protection</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Over-voltage, over-current, short-circuit, and electrostatic protection</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', 'sharge-retro-67w-gan-fast-charger-with-real-time-matrix-led-display', 1, 1, 1, 'Sharge Retro 67W GaN Fast Charger with Real-Time Matrix LED Display', 'sharge, retro, 67w, gan, fast, charger, with, real, time, matrix, led, display', 'Nostalgic vintage Macintosh computer aesthetic featuring a functional real-time Matrix digital LED screen that outputs live wattage data and charging animations.', 79.9900, 64.9900, '2025-01-01', '2027-12-31', 0.1600, 93, 2, 1, 'product/21/51wywi5ig9l.webp', 'Fast Chargers & GaN', 'Default', '2026-10-06 06:22:02', 'en', 'default', 1, 21, '2026-10-22 05:00:27', NULL, 1),
	(22, 'PB-CUKTECH20-210W', 'simple', '', 'CUKTECH 20 25000mAh 210W Multi-Port Power Bank with TFT Color Screen', '<p>Heavy-duty 210W multi-port external battery with automotive-grade 21700 power cells, 140W single-port high power, and a vibrant 1.54-inch TFT color information screen.</p>', '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Heavy-duty 210W multi-port external battery with automotive-grade 21700 power cells, 140W single-port high power, and a vibrant 1.54-inch TFT color information screen.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Capacity</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">25,000 mAh / 90Wh (TSA &amp; FAA Airline Approved for Carry-on)</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Total Output</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">210W Max (Single USB-C1 up to 140W PD 3.1, USB-C2 60W, USB-A 30W)</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Fast Self-Recharge</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">110W Ultra-Fast Input (recharges 40% in just 19 minutes)</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Display</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">1.54-inch full-color TFT screen with live voltage, current, power curve and battery temp</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Battery Cells</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">5x Auto-Grade 21700 battery cells engineered for 1000+ deep cycles</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', 'cuktech-20-25000mah-210w-multi-port-power-bank-with-tft-color-screen', 1, 1, 1, 'CUKTECH 20 25000mAh 210W Multi-Port Power Bank with TFT Color Screen', 'cuktech, 20, 25000mah, 210w, multi, port, power, bank, with, tft, color, screen', 'Heavy-duty 210W multi-port external battery with automotive-grade 21700 power cells, 140W single-port high power, and a vibrant 1.54-inch TFT color information screen.', 139.9900, 119.9900, '2025-01-01', '2027-12-31', 0.5800, 36, 1, 1, 'product/22/sac-du-phong-cuktech-20-25000mah-210w-cuk00p23glbk-ckp23-2k-210-black.webp', 'Power Banks', 'Default', '2026-10-06 06:22:02', 'en', 'default', 1, 22, '2026-10-22 05:00:27', NULL, 1),
	(23, 'PB-ANKER-737-24K', 'simple', '', 'Anker 737 Power Bank (PowerCore 24K) 24000mAh 140W Smart Screen', '<p>Equipped with state-of-the-art Power Delivery 3.1 and bi-directional technology to quickly recharge the portable charger or get a 140W ultra-powerful charge.</p>', '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Equipped with state-of-the-art Power Delivery 3.1 and bi-directional technology to quickly recharge the portable charger or get a 140W ultra-powerful charge.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Capacity</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">24,000 mAh High-Density Li-ion Battery</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Max Output</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">140W Two-Way Fast Charging (Single Port 140W In/Out)</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Smart Digital Display</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Color display shows output/input power, estimated recharge time, and battery health</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Ports</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">2 x USB-C (140W max per port), 1 x USB-A (18W)</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Protection</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">ActiveShield 2.0 temperature monitoring and intelligent power management</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', 'anker-737-power-bank-powercore-24k-24000mah-140w-smart-screen', 1, 1, 1, 'Anker 737 Power Bank (PowerCore 24K) 24000mAh 140W Smart Screen', 'anker, 737, power, bank, powercore, 24k, 24000mah, 140w, smart, screen', 'Equipped with state-of-the-art Power Delivery 3.1 and bi-directional technology to quickly recharge the portable charger or get a 140W ultra-powerful charge.', 149.9900, 129.9900, '2025-01-01', '2027-12-31', 0.6300, 18, 2, 1, 'product/23/61euvvvuk1l.webp', 'Power Banks', 'Default', '2026-10-06 06:22:02', 'en', 'default', 1, 23, '2026-10-22 05:00:27', NULL, 1),
	(24, 'PB-BASEUS-BLADE2-65W', 'simple', '', 'Baseus Blade 2 12000mAh 65W Ultra-Thin Smart Digital Power Bank', '<p>Ultra-slim 10.2mm flat profile power bank designed for sleek laptop bags, featuring Bluetooth companion app control and 65W bidirectional fast charging.</p>', '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Ultra-slim 10.2mm flat profile power bank designed for sleek laptop bags, featuring Bluetooth companion app control and 65W bidirectional fast charging.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Capacity</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">12,000 mAh / 44.4Wh Silicon-Carbon Anode Battery</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Profile Thickness</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Only 10.2mm (0.4 inches) Ultra-Thin form factor</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Power Delivery</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">65W Max USB-C PD Input and Output</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">App Integration</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Baseus Smart App customizes output modes, timer, and monitors degradation</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Ports</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">2 x USB-C ports with auto power distribution</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', 'baseus-blade-2-12000mah-65w-ultra-thin-smart-digital-power-bank', 1, 0, 1, 'Baseus Blade 2 12000mAh 65W Ultra-Thin Smart Digital Power Bank', 'baseus, blade, 2, 12000mah, 65w, ultra, thin, smart, digital, power, bank', 'Ultra-slim 10.2mm flat profile power bank designed for sleek laptop bags, featuring Bluetooth companion app control and 65W bidirectional fast charging.', 69.9900, 59.9900, '2025-01-01', '2027-12-31', 0.3200, 29, 2, 1, 'product/24/02-2-min-1702608340186.webp', 'Power Banks', 'Default', '2026-10-06 06:22:02', 'en', 'default', 1, 24, '2026-10-22 05:00:27', NULL, 1),
	(25, 'EAR-BOSE-QCULTRA', 'simple', '', 'Bose QuietComfort Ultra True Wireless Noise Canceling Earbuds', '<p>World-class noise cancellation paired with breakthrough Bose Immersive Audio for a realistic spatial acoustic listening experience regardless of source content.</p>', '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">World-class noise cancellation paired with breakthrough Bose Immersive Audio for a realistic spatial acoustic listening experience regardless of source content.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Active Noise Cancellation</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">CustomTune technology calibrates noise cancellation specifically to your ear canal</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Spatial Audio</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Bose Immersive Audio delivers full spatial sound field without head-tracking latency</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Battery Life</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Up to 6 hours continuous play (24 hours total with wireless charging case)</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Call Quality</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Advanced 4-microphone array focuses on your voice and filters out wind noise</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Water Resistance</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">IPX4 sweat and weather resistant</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', 'bose-quietcomfort-ultra-true-wireless-noise-canceling-earbuds', 1, 1, 1, 'Bose QuietComfort Ultra True Wireless Noise Canceling Earbuds', 'bose, quietcomfort, ultra, true, wireless, noise, canceling, earbuds', 'World-class noise cancellation paired with breakthrough Bose Immersive Audio for a realistic spatial acoustic listening experience regardless of source content.', 299.0000, 249.0000, '2025-01-01', '2027-12-31', 0.0600, 26, 1, 1, 'product/25/tai-nghe-true-wireless-bose-quietcomfort-ultra-earbuds-02-eec76cbaa6ce477491f19d70d019e167-master.webp', 'Audio & Gaming Earbuds', 'Default', '2026-10-06 06:22:02', 'en', 'default', 1, 25, '2026-10-22 05:00:27', NULL, 1),
	(26, 'EAR-RAZER-HAMMERHEAD', 'simple', '', 'Razer Hammerhead Pro HyperSpeed True Wireless Gaming Earbuds', '<p>Pro-grade wireless gaming earbuds featuring dual connectivity with a 2.4GHz Razer HyperSpeed USB-C dongle for cross-platform zero-latency gaming.</p>', '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Pro-grade wireless gaming earbuds featuring dual connectivity with a 2.4GHz Razer HyperSpeed USB-C dongle for cross-platform zero-latency gaming.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Wireless Technology</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">2.4GHz Razer HyperSpeed (via included USB-C Dongle) &amp; Bluetooth 5.3</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Latency</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Sub-40ms ultra-low gaming latency on PC, PlayStation, Switch, and Mobile</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Noise Cancellation</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Adjustable Hybrid Active Noise Cancellation with Transparency Mode</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">RGB Lighting</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Customizable Razer Chroma RGB with 16.8 million colors</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Battery Life</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Up to 30 hours total playtime with Qi-compatible wireless charging case</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', 'razer-hammerhead-pro-hyperspeed-true-wireless-gaming-earbuds', 1, 1, 1, 'Razer Hammerhead Pro HyperSpeed True Wireless Gaming Earbuds', 'razer, hammerhead, pro, hyperspeed, true, wireless, gaming, earbuds', 'Pro-grade wireless gaming earbuds featuring dual connectivity with a 2.4GHz Razer HyperSpeed USB-C dongle for cross-platform zero-latency gaming.', 199.9900, 169.9900, '2025-01-01', '2027-12-31', 0.0550, 35, 2, 1, 'product/26/666470-572149-02-front-comping-39c3459fa73b4ddd8164f3669bf08809-master.webp', 'Audio & Gaming Earbuds', 'Default', '2026-10-06 06:22:02', 'en', 'default', 1, 26, '2026-10-22 05:00:27', NULL, 1),
	(27, 'EAR-AIRPODS-PRO2', 'simple', '', 'Apple AirPods Pro (2nd Gen) USB-C MagSafe Active Noise Cancelling', '<p>Up to 2x more active noise cancellation powered by the Apple H2 chip, with Adaptive Audio, Personalized Spatial Audio, and USB-C MagSafe charging case with speaker.</p>', '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Up to 2x more active noise cancellation powered by the Apple H2 chip, with Adaptive Audio, Personalized Spatial Audio, and USB-C MagSafe charging case with speaker.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Audio Engine</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Apple H2 Headphone Chip + Apple U1 in MagSafe Case for Precision Finding</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">ANC &amp; Transparency</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Adaptive Audio seamlessly blends ANC and Transparency mode as environments change</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Spatial Audio</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Personalized Spatial Audio with dynamic head tracking</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Battery Life</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">6 hours listening on single charge (30 hours total with MagSafe Case)</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Durability</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">IP54 dust, sweat, and water resistance for both earbuds and case</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', 'apple-airpods-pro-2nd-gen-usb-c-magsafe-active-noise-cancelling', 1, 0, 1, 'Apple AirPods Pro (2nd Gen) USB-C MagSafe Active Noise Cancelling', 'apple, airpods, pro, 2nd, gen, usb, c, magsafe, active, noise, cancelling', 'Up to 2x more active noise cancellation powered by the Apple H2 chip, with Adaptive Audio, Personalized Spatial Audio, and USB-C MagSafe charging case with speaker.', 249.0000, 219.0000, '2025-01-01', '2027-12-31', 0.0560, 30, 1, 1, 'product/27/airpods-pro-3-hero-select-202509.webp', 'Audio & Gaming Earbuds', 'Default', '2026-10-06 06:22:02', 'en', 'default', 1, 27, '2026-10-22 05:00:27', NULL, 1),
	(28, 'COOL-FLYDIGI-B7X', 'simple', '', 'Flydigi B7X Magnetic Phone Cooler 27W Smart Overclocking RGB', '<p>Next-generation 27W variable frequency magnetic semiconductor phone radiator, featuring intelligent temperature sensing and silent hydraulic fan technology.</p>', '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Next-generation 27W variable frequency magnetic semiconductor phone radiator, featuring intelligent temperature sensing and silent hydraulic fan technology.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Cooling Power</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">27W Smart Overclocking TEC module (instant drop to -5°C in seconds)</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Magnetic Connection</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Strong MagSafe neodymium ring attachment + universal back clip</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Smart Regulation</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Flydigi App Bluetooth control with anti-condensation auto temperature regulation</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Noise Level</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Silent 7-blade hydraulic bearing fan (&lt;37dB)</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Lighting</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Dynamic customizable circular RGB halo illumination</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', 'flydigi-b7x-magnetic-phone-cooler-27w-smart-overclocking-rgb', 1, 1, 1, 'Flydigi B7X Magnetic Phone Cooler 27W Smart Overclocking RGB', 'flydigi, b7x, magnetic, phone, cooler, 27w, smart, overclocking, rgb', 'Next-generation 27W variable frequency magnetic semiconductor phone radiator, featuring intelligent temperature sensing and silent hydraulic fan technology.', 49.9900, 39.9900, '2025-01-01', '2027-12-31', 0.0950, 58, 2, 1, 'product/28/b-0816b750-c1ff-4908-85eb-fd5929b25ccd.webp', 'Phone Coolers & Gaming Gear', 'Default', '2026-10-06 06:22:02', 'en', 'default', 1, 28, '2026-10-22 05:00:27', NULL, 1),
	(29, 'GEAR-GAMESIR-G8', 'simple', '', 'GameSir G8 Galileo Type-C Mobile Gaming Controller Hall Effect', '<p>Console-grade mobile gaming controller with non-contact Hall Effect sticks and analog triggers, movable Type-C port, and magnetic swappable faceplates.</p>', '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Console-grade mobile gaming controller with non-contact Hall Effect sticks and analog triggers, movable Type-C port, and magnetic swappable faceplates.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Connection</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Adjustable movable Type-C direct connection (Zero input latency &amp; pass-through charging)</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Joysticks &amp; Triggers</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Hall Effect anti-drift magnetic sensing sticks and precision analog triggers</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Compatibility</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Supports iPhone 15/16 series &amp; Android phones (Length 110-185mm)</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Ergonomics</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Full-size console ergonomics with dual programmable back macro buttons</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Customization</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Interchangeable magnetic faceplates and multiple thumbstick height caps</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', 'gamesir-g8-galileo-type-c-mobile-gaming-controller-hall-effect', 1, 1, 1, 'GameSir G8 Galileo Type-C Mobile Gaming Controller Hall Effect', 'gamesir, g8, galileo, type, c, mobile, gaming, controller, hall, effect', 'Console-grade mobile gaming controller with non-contact Hall Effect sticks and analog triggers, movable Type-C port, and magnetic swappable faceplates.', 79.9900, 69.9900, '2025-01-01', '2027-12-31', 0.2520, 14, 2, 1, 'product/29/61mjgicr7ql.webp', 'Phone Coolers & Gaming Gear', 'Default', '2026-10-06 06:22:02', 'en', 'default', 1, 29, '2026-10-22 05:00:27', NULL, 1),
	(30, 'COOL-RAZER-CHROMA', 'simple', '', 'Razer Phone Cooler Chroma Magnetic MagSafe RGB Semiconductor Fan', '<p>Advanced smartphone cooling tile with heat sink and 7-blade fan, armed with MagSafe compatibility and 12 customizable Razer Chroma RGB LEDs.</p>', '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Advanced smartphone cooling tile with heat sink and 7-blade fan, armed with MagSafe compatibility and 12 customizable Razer Chroma RGB LEDs.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Cooling Engine</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Thermoelectric Peltier semiconductor cooling plate with aluminum heat sink</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Fan Specs</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">7-blade high-speed fan spinning up to 6400 RPM with whisper-quiet profile (&lt;30dB)</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Lighting</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">12 Individually addressable RGB LEDs powered by Razer Chroma RGB (BLE app)</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Attachment</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Built-in MagSafe magnetic alignment + universal Android clip clamp included</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Power Connection</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">USB-C powered (requires 5V/2A or higher power source)</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', 'razer-phone-cooler-chroma-magnetic-magsafe-rgb-semiconductor-fan', 1, 0, 1, 'Razer Phone Cooler Chroma Magnetic MagSafe RGB Semiconductor Fan', 'razer, phone, cooler, chroma, magnetic, magsafe, rgb, semiconductor, fan', 'Advanced smartphone cooling tile with heat sink and 7-blade fan, armed with MagSafe compatibility and 12 customizable Razer Chroma RGB LEDs.', 59.9900, 49.9900, '2025-01-01', '2027-12-31', 0.1000, 44, 2, 1, 'product/30/61kwgqk0psl.webp', 'Phone Coolers & Gaming Gear', 'Default', '2026-10-06 06:22:02', 'en', 'default', 1, 30, '2026-10-22 05:00:27', NULL, 1),
	(31, 'HUB-CALDIGIT-TS4', 'simple', '', 'CalDigit TS4 Thunderbolt 4 18-Port Docking Station 98W Power Delivery', '<p>The world\'s most capable Thunderbolt 4 dock with a staggering 18 ports of connectivity, up to 98W host laptop charging, and 2.5Gb Ethernet speed.</p>', '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">The world\'s most capable Thunderbolt 4 dock with a staggering 18 ports of connectivity, up to 98W host laptop charging, and 2.5Gb Ethernet speed.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Total Ports</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">18 Connectivity Ports (3x TB4 40Gbps, 1x DP 1.4, 5x USB-A 10Gbps, 3x USB-C 10Gbps, 2.5GbE, SD/microSD UHS-II, Front/Rear Audio)</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Host Power Delivery</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Up to 98W continuous power delivery to charge power-hungry workstations</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Video Output</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Single 8K@60Hz or Dual 6K@60Hz external high-refresh displays</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Network</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">2.5 Gigabit Ethernet port (2.5x faster than standard gigabit)</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Build Quality</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Precision all-aluminum heatsink body for fanless silent heat dissipation</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', 'caldigit-ts4-thunderbolt-4-18-port-docking-station-98w-power-delivery', 1, 1, 1, 'CalDigit TS4 Thunderbolt 4 18-Port Docking Station 98W Power Delivery', 'caldigit, ts4, thunderbolt, 4, 18, port, docking, station, 98w, power, delivery', 'The world\'s most capable Thunderbolt 4 dock with a staggering 18 ports of connectivity, up to 98W host laptop charging, and 2.5Gb Ethernet speed.', 399.9500, 359.9500, '2025-01-01', '2027-12-31', 0.6400, 72, 1, 1, 'product/31/ts4-verticalrightfrontview-whitebg.webp', 'Thunderbolt Cables & Hubs', 'Default', '2026-10-06 06:22:02', 'en', 'default', 1, 31, '2026-10-22 05:00:27', NULL, 1),
	(32, 'HUB-ANKER-575-13IN1', 'simple', '', 'Anker 575 USB-C Hub (13-in-1) 85W Pass-Through Triple Display', '<p>Comprehensive 13-in-1 desktop expansion hub with dual HDMI ports, DisplayPort, 85W high-speed pass-through charging, and Gigabit Ethernet connectivity.</p>', '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Comprehensive 13-in-1 desktop expansion hub with dual HDMI ports, DisplayPort, 85W high-speed pass-through charging, and Gigabit Ethernet connectivity.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Expansion</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">13-in-1 (2x HDMI 4K@60Hz, 1x DP 4K@60Hz, 100W PD In / 85W Out, 1x USB-C 5Gbps, 3x USB-A 5Gbps, 1x USB 2.0, RJ45 LAN, SD/TF, 3.5mm AUX)</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Multi-Display</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Supports Triple Display expansion on Windows and dual mirrored displays on macOS</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Power Pass-Through</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Up to 85W safe laptop pass-through charging with 15W reserved for hub operations</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Safety Protection</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">MultiProtect temperature control and short-circuit prevention architecture</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', 'anker-575-usb-c-hub-13-in-1-85w-pass-through-triple-display', 1, 0, 1, 'Anker 575 USB-C Hub (13-in-1) 85W Pass-Through Triple Display', 'anker, 575, usb, c, hub, 13, in, 1, 85w, pass, through, triple, display', 'Comprehensive 13-in-1 desktop expansion hub with dual HDMI ports, DisplayPort, 85W high-speed pass-through charging, and Gigabit Ethernet connectivity.', 79.9900, 64.9900, '2025-01-01', '2027-12-31', 0.1700, 41, 1, 1, 'product/32/s-l1600.webp', 'Thunderbolt Cables & Hubs', 'Default', '2026-10-06 06:22:02', 'en', 'default', 1, 32, '2026-10-22 05:00:27', NULL, 1),
	(33, 'HUB-SATECHI-MACMINI', 'simple', '', 'Satechi Aluminum Stand & Hub for Mac Mini with M.2 SSD Enclosure', '<p>Patent-pending stand and USB-C hub tailored for Apple Mac Mini &amp; Mac Studio, featuring a built-in M.2 NVMe SSD enclosure and front-facing fast I/O ports.</p>', '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Patent-pending stand and USB-C hub tailored for Apple Mac Mini &amp; Mac Studio, featuring a built-in M.2 NVMe SSD enclosure and front-facing fast I/O ports.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Internal Storage</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Built-in tool-free M.2 NVMe / SATA SSD enclosure (speeds up to 10Gbps)</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Front Ports</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">1x USB-C (10Gbps), 3x USB-A (10Gbps), SD and MicroSD card readers (104MB/s), 3.5mm Headphone Jack</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Design Aesthetics</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Matches Apple Mac Mini aluminum finish and form factor seamlessly</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Cooling Vents</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Engineered with built-in air vents to maximize Mac Mini airflow and cooling efficiency</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', 'satechi-aluminum-stand-hub-for-mac-mini-with-m2-ssd-enclosure', 1, 1, 1, 'Satechi Aluminum Stand & Hub for Mac Mini with M.2 SSD Enclosure', 'satechi, aluminum, stand, hub, for, mac, mini, with, m2, ssd, enclosure', 'Patent-pending stand and USB-C hub tailored for Apple Mac Mini & Mac Studio, featuring a built-in M.2 NVMe SSD enclosure and front-facing fast I/O ports.', 99.9900, 84.9900, '2025-01-01', '2027-12-31', 0.3000, 61, 1, 1, 'product/33/71qeytqrm0l.webp', 'Thunderbolt Cables & Hubs', 'Default', '2026-10-06 06:22:02', 'en', 'default', 1, 33, '2026-10-22 05:00:27', NULL, 1),
	(34, 'HUB-BASEUS-10IN1', 'simple', '', 'Baseus Metal Gleam 10-in-1 Dual 4K HDMI USB-C Multi-Port Adapter Hub', '<p>Sturdy sandblasted aluminum 10-in-1 USB-C adapter featuring dual 4K HDMI output, 100W Power Delivery, and Gigabit LAN for work-from-anywhere setups.</p>', '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Sturdy sandblasted aluminum 10-in-1 USB-C adapter featuring dual 4K HDMI output, 100W Power Delivery, and Gigabit LAN for work-from-anywhere setups.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Port Layout</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">2x 4K HDMI @60Hz/30Hz, 1x 100W USB-C PD, 1x Gigabit RJ45 Ethernet, 3x USB 3.0 (5Gbps), SD &amp; TF Card Slots, 3.5mm Audio</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Chassis</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Aerospace-grade sandblasted aluminum alloy case for rapid heat dissipation</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Cable</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Reinforced braided nylon integrated connector with LED indicator light</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Compatibility</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Plug-and-play on Windows 11, macOS, iPadOS, ChromeOS, and Android</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', 'baseus-metal-gleam-10-in-1-dual-4k-hdmi-usb-c-multi-port-adapter-hub', 1, 0, 1, 'Baseus Metal Gleam 10-in-1 Dual 4K HDMI USB-C Multi-Port Adapter Hub', 'baseus, metal, gleam, 10, in, 1, dual, 4k, hdmi, usb, c, multi, port, adapter, hub', 'Sturdy sandblasted aluminum 10-in-1 USB-C adapter featuring dual 4K HDMI output, 100W Power Delivery, and Gigabit LAN for work-from-anywhere setups.', 49.9900, 39.9900, '2025-01-01', '2027-12-31', 0.1200, 12, 1, 1, 'product/34/video-fe65c6d82ea5417cbc5c417af20f49ac-large.webp', 'Thunderbolt Cables & Hubs', 'Default', '2026-10-06 06:22:02', 'en', 'default', 1, 34, '2026-10-22 05:00:27', NULL, 1),
	(35, 'CASE-PITAKA-MAGEZ5', 'simple', '', 'Pitaka MagEZ Case 5 1500D Aramid Fiber Ultra-Slim MagSafe Case', '<p>Crafted from 100% genuine aerospace-grade 1500D Aramid Fiber with Amber Magnet Film technology, delivering naked-phone thinness and powerful MagSafe suction.</p>', '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Crafted from 100% genuine aerospace-grade 1500D Aramid Fiber with Amber Magnet Film technology, delivering naked-phone thinness and powerful MagSafe suction.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Material</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">100% Genuine 1500D Aerospace-Grade Aramid Fiber (Bulletproof material)</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Thickness &amp; Weight</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">0.75mm Paper-thin profile | Weighs merely 19 grams</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">MagSafe Integration</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Amber Magnet Film technology integrates MagSafe ring with zero added bulk</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Grip &amp; Texture</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Vacuum-formed 3D Grip non-slip textured finish feels skin-soft yet grippy</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Lens Protection</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Raised aerospace aluminum camera bezel ring shields costly lenses</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', 'pitaka-magez-case-5-1500d-aramid-fiber-ultra-slim-magsafe-case', 1, 1, 1, 'Pitaka MagEZ Case 5 1500D Aramid Fiber Ultra-Slim MagSafe Case', 'pitaka, magez, case, 5, 1500d, aramid, fiber, ultra, slim, magsafe, case', 'Crafted from 100% genuine aerospace-grade 1500D Aramid Fiber with Amber Magnet Film technology, delivering naked-phone thinness and powerful MagSafe suction.', 69.9900, 59.9900, '2025-01-01', '2027-12-31', 0.0190, 47, 1, 1, 'product/35/715cpyjmunl.webp', 'Tough Cases & Screen Protectors', 'Default', '2026-10-06 06:22:02', 'en', 'default', 1, 35, '2026-10-22 05:00:27', NULL, 1),
	(36, 'CASE-SPIGEN-TOUGH-MAGFIT', 'simple', '', 'Spigen Tough Armor MagFit Dual-Layer Kickstand Rugged Case', '<p>Legendary dual-layer heavy duty drop defense combining shock-absorbent TPU and rigid polycarbonate with extreme impact foam and reinforced magnetic kickstand.</p>', '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Legendary dual-layer heavy duty drop defense combining shock-absorbent TPU and rigid polycarbonate with extreme impact foam and reinforced magnetic kickstand.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Drop Protection</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Certified Military Grade MIL-STD 810G-516.6 with Air Cushion Technology</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Impact Foam</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">All-new Extreme Impact Foam lining absorbs and dissipates severe shock energy</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Kickstand</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Ergonomic reinforced flush built-in kickstand for hands-free landscape viewing</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">MagSafe Compatibility</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Embedded strong N52 neodymium magnetic ring for flawless MagSafe accessories</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', 'spigen-tough-armor-magfit-dual-layer-kickstand-rugged-case', 1, 0, 1, 'Spigen Tough Armor MagFit Dual-Layer Kickstand Rugged Case', 'spigen, tough, armor, magfit, dual, layer, kickstand, rugged, case', 'Legendary dual-layer heavy duty drop defense combining shock-absorbent TPU and rigid polycarbonate with extreme impact foam and reinforced magnetic kickstand.', 44.9900, 34.9900, '2025-01-01', '2027-12-31', 0.0650, 84, 1, 1, 'product/36/61ygh697e4l.webp', 'Tough Cases & Screen Protectors', 'Default', '2026-10-06 06:22:02', 'en', 'default', 1, 36, '2026-10-22 05:00:27', NULL, 1),
	(37, 'GLASS-TORRAS-DIAMOND', 'simple', '', 'Torras Diamond Shield 9H+ Ultra-Hard Screen Protector with EZ-Fit Tray', '<p>Military shatterproof 9H+ diamond-hard tempered glass screen shield with 10-second auto-dust-eliminating installation tray and oleophobic coating.</p>', '<div class="tech-product-detail" style="font-family:inherit;">\r\n<p style="font-size:16px;margin-bottom:16px;">Military shatterproof 9H+ diamond-hard tempered glass screen shield with 10-second auto-dust-eliminating installation tray and oleophobic coating.</p>\r\n<h3 style="font-size:18px;font-weight:bold;margin-top:24px;margin-bottom:12px;color:#111827;">Technical Specifications</h3>\r\n<table style="width:100%;border-collapse:collapse;border:1px solid #e5e7eb;margin-bottom:24px;">\r\n<tbody>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Hardness &amp; Toughness</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">9H+ Top-Grade CSG Diamond-Hard Tempered Glass (Withstands 110lb edge impacts)</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Easy Installation</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Patented 10-Second Auto-Alignment &amp; Auto-Dust-Removal Tray ensures 0 bubbles</td>\r\n</tr>\r\n<tr style="background-color:#f9fafb;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Touch &amp; Clarity</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">99.99% High Transparency HD Clarity with 0.28mm ultra-responsive sensitivity</td>\r\n</tr>\r\n<tr style="background-color:#ffffff;border-bottom:1px solid #e5e7eb;">\r\n<td style="padding:10px 16px;font-weight:600;width:35%;color:#374151;font-size:14px;">Surface Coating</td>\r\n<td style="padding:10px 16px;color:#4b5563;font-size:14px;">Vacuum Electroplated Oleophobic coating resists fingerprints and oil smudges</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div style="border-left:4px solid #3b82f6;padding:12px 16px;margin-top:16px;">\r\n<p style="margin:0;color:#1e40af;font-size:13px;font-weight:500;">✓ 100% Brand-New Genuine Sealed | 12-24 Month Official Warranty | 30-Day Replacement for Manufacturer Defects</p>\r\n</div>\r\n</div>', 'torras-diamond-shield-9h-ultra-hard-screen-protector-with-ez-fit-tray', 1, 1, 1, 'Torras Diamond Shield 9H+ Ultra-Hard Screen Protector with EZ-Fit Tray', 'torras, diamond, shield, 9h, ultra, hard, screen, protector, with, ez, fit, tray', 'Military shatterproof 9H+ diamond-hard tempered glass screen shield with 10-second auto-dust-eliminating installation tray and oleophobic coating.', 32.9900, 26.9900, '2025-01-01', '2027-12-31', 0.0300, 76, 2, 1, 'product/37/71e1tj2u4el.webp', 'Tough Cases & Screen Protectors', 'Default', '2026-10-06 06:22:02', 'en', 'default', 1, 37, '2026-10-22 05:00:27', NULL, 1),
	(38, 'SP-TEST-01', 'simple', 'G305', 'G305 LIGHTSPEED wireless gaming mouse', '<p>Dominate your enemies with lightning-fast, precise clicks. The G305 LIGHTSPEED wireless gaming mouse from Logitech® G is designed for serious performance with the latest technology and an impressive 250-hour battery life. Plus, it’s available at an affordable price point and in a variety of colors, so you can gear up in style.</p>', '<p>Dominate your enemies with lightning-fast, precise clicks. The G305 LIGHTSPEED wireless gaming mouse from Logitech® G is designed for serious performance with the latest technology and an impressive 250-hour battery life. Plus, it’s available at an affordable price point and in a variety of colors, so you can gear up in style.</p>', 'g305-lightspeed-wireless-gaming-mouse', 1, 1, 1, 'G305 Gaming mice', '', '', 250.0000, NULL, NULL, NULL, 0.0000, 4, 1, 1, 'product/38/TAdYGpVSXTLoJfIuVvDI3vHcZ6fdaSpeQRB1C55W.webp', 'Phone Coolers & Gaming Gear', 'Default', '2026-10-22 05:37:35', 'en', 'default', 1, 38, '2026-10-22 05:45:30', NULL, 1),
	(39, 'MOUSE-RAZER-V3PRO', 'simple', NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, 'Default', '2026-11-03 21:50:34', 'en', 'default', 1, 39, '2026-11-03 21:50:34', NULL, 1),
	(40, 'GLASS-TORRAS-SSSSS', 'simple', NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, 'Default', '2026-11-03 21:53:06', 'en', 'default', 1, 40, '2026-11-03 21:53:06', NULL, 1);

-- Dumping structure for table bagisto_db.product_grouped_products
CREATE TABLE IF NOT EXISTS `product_grouped_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `associated_product_id` int unsigned NOT NULL,
  `qty` int NOT NULL DEFAULT '0',
  `sort_order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `grouped_products_product_id_associated_product_id_unique` (`product_id`,`associated_product_id`),
  KEY `product_grouped_products_associated_product_id_foreign` (`associated_product_id`),
  KEY `pgp_product_id_idx` (`product_id`),
  CONSTRAINT `product_grouped_products_associated_product_id_foreign` FOREIGN KEY (`associated_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_grouped_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_grouped_products: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.product_images
CREATE TABLE IF NOT EXISTS `product_images` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int unsigned NOT NULL,
  `position` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `prod_img_product_id_idx` (`product_id`),
  CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_images: ~87 rows (approximately)
INSERT INTO `product_images` (`id`, `type`, `path`, `product_id`, `position`) VALUES
	(17, 'images', 'product/18/e-c-ultraglass2-am-expedite-row-front-9e84471191b84d799254e1699e446bd3-09c09e7353164225bbf2829217467909-master.webp', 18, 1),
	(18, 'images', 'product/17/images.webp', 17, 1),
	(19, 'images', 'product/17/uag-hs-apple-iphone-2024-paul-monarch-pro-kevlar-element-green-std-01.webp', 17, 2),
	(20, 'images', 'product/16/cap-sac-du-lieu-ugreen-thunderbolt-4-type-c-240w-40gbps-8k-x5rb.webp', 16, 1),
	(21, 'images', 'product/16/cap-sac-du-lieu-ugreen-thunderbolt-4-type-c-240w-40gbps-8k-x5rb-1.webp', 16, 2),
	(22, 'images', 'product/15/quat-tan-nhiet-dien-thoai-black-shark-funcooler-4-pro-2.webp', 15, 1),
	(23, 'images', 'product/15/quat-tan-nhiet-dien-thoai-black-shark-funcooler-4-pro-3.webp', 15, 2),
	(24, 'images', 'product/15/quat-tan-nhiet-dien-thoai-black-shark-funcooler-4-pro-8.webp', 15, 3),
	(25, 'images', 'product/15/quat-tan-nhiet-dien-thoai-black-shark-funcooler-4-pro-13.webp', 15, 4),
	(26, 'images', 'product/14/quat-tan-nhiet-redmagic-vc-cooler-5-pro-3.webp', 14, 1),
	(27, 'images', 'product/14/quat-tan-nhiet-redmagic-vc-cooler-5-pro-4.webp', 14, 2),
	(28, 'images', 'product/14/quat-tan-nhiet-redmagic-vc-cooler-5-pro-5.webp', 14, 3),
	(29, 'images', 'product/14/quat-tan-nhiet-redmagic-vc-cooler-5-pro-6.webp', 14, 4),
	(30, 'images', 'product/13/tai-nghe-asus-rog-cetra-tws-speednova-1.webp', 13, 1),
	(31, 'images', 'product/13/tai-nghe-asus-rog-cetra-tws-speednova-2.webp', 13, 2),
	(32, 'images', 'product/13/tai-nghe-asus-rog-cetra-tws-speednova-3.webp', 13, 3),
	(33, 'images', 'product/12/tai-nghe-khong-day-sony-wf-1000xm5-6-1.webp', 12, 1),
	(34, 'images', 'product/12/tai-nghe-khong-day-sony-wf-1000xm5-8.webp', 12, 2),
	(35, 'images', 'product/11/pin-sac-du-phong-anker-prime-20000mah-200w-a1336-1.webp', 11, 1),
	(36, 'images', 'product/11/pin-sac-du-phong-anker-prime-a1336-20000mah-200w-2.webp', 11, 2),
	(37, 'images', 'product/11/pin-sac-du-phong-anker-prime-a1336-20000mah-200w-3.webp', 11, 3),
	(38, 'images', 'product/10/pin-sac-du-phong-shargeek-storm-2-liquid-25600mah-2.webp', 10, 1),
	(39, 'images', 'product/10/pin-sac-du-phong-shargeek-storm-2-liquid-25600mah-4.webp', 10, 2),
	(40, 'images', 'product/10/storm-2-lucas-1-1.webp', 10, 3),
	(41, 'images', 'product/9/ugreen-nexode-300w-usb-c-gan-charger-5-ports-desktop-charger-257525.webp', 9, 1),
	(42, 'images', 'product/9/ugreen-nexode-300w-usb-c-gan-charger-5-ports-desktop-charger-270874.webp', 9, 2),
	(43, 'images', 'product/9/ugreen-nexode-300w-usb-c-gan-charger-5-ports-desktop-charger-321310.webp', 9, 3),
	(44, 'images', 'product/8/02-1666673256090.webp', 8, 1),
	(45, 'images', 'product/7/24dbaece-c71d-42c7-a04b-6cc60da4f175.webp', 7, 1),
	(46, 'images', 'product/7/a2148t11-td02-v1-jpg-07d2168d-709e-4404-a428-30763d1ccbf4.webp', 7, 2),
	(47, 'images', 'product/7/a2148t11-td03-v1-jpg-7cd4bfd2-0244-43f8-b80d-73f53e6e0fc5.webp', 7, 3),
	(48, 'images', 'product/5/rog-7va8-man-hinh.webp', 5, 1),
	(49, 'images', 'product/5/rog-phone-7-mat-sau.webp', 5, 2),
	(50, 'images', 'product/5/rog-phone-8-8pro.webp', 5, 3),
	(51, 'images', 'product/5/rog-phone-8-8pro-mat-lung.webp', 5, 4),
	(52, 'images', 'product/5/rog-phone-8-antutu.webp', 5, 5),
	(53, 'images', 'product/6/9e32dac4fda571a7a5a3a6490f98361f.webp', 6, 1),
	(54, 'images', 'product/6/497c5a1dae937d74f840e27f7077660b.webp', 6, 2),
	(55, 'images', 'product/6/9438aa9769e427909d71f07d977216e2.webp', 6, 3),
	(56, 'images', 'product/6/pc-14ultra-amoled.webp', 6, 4),
	(57, 'images', 'product/6/pc-14ultra-header.webp', 6, 5),
	(102, 'images', 'product/37/71e1tj2u4el.webp', 37, 1),
	(103, 'images', 'product/36/61ygh697e4l.webp', 36, 1),
	(104, 'images', 'product/35/715cpyjmunl.webp', 35, 1),
	(105, 'images', 'product/34/video-fe65c6d82ea5417cbc5c417af20f49ac-large.webp', 34, 1),
	(106, 'images', 'product/33/71qeytqrm0l.webp', 33, 1),
	(107, 'images', 'product/32/s-l1600.webp', 32, 1),
	(108, 'images', 'product/30/61kwgqk0psl.webp', 30, 1),
	(109, 'images', 'product/30/razer-phone-cooler-chroma-iphone-android-desktop-1280x575-800-resize.webp', 30, 2),
	(110, 'images', 'product/31/ts4-verticalrightfrontview-whitebg.webp', 31, 1),
	(111, 'images', 'product/29/61mjgicr7ql.webp', 29, 1),
	(112, 'images', 'product/29/hero-img-update.webp', 29, 2),
	(113, 'images', 'product/28/b-0816b750-c1ff-4908-85eb-fd5929b25ccd.webp', 28, 1),
	(114, 'images', 'product/28/k-b3e5e84f-8efd-4de4-9d29-f57bcc1119c1.webp', 28, 2),
	(115, 'images', 'product/26/666470-572149-02-front-comping-39c3459fa73b4ddd8164f3669bf08809-master.webp', 26, 1),
	(116, 'images', 'product/26/666470-572149-03-front-comping-352c821e4dab4dcdad55c519bdaf985d-master.webp', 26, 2),
	(117, 'images', 'product/27/airpods-pro-3-hero-select-202509.webp', 27, 1),
	(118, 'images', 'product/25/tai-nghe-true-wireless-bose-quietcomfort-ultra-earbuds-02-eec76cbaa6ce477491f19d70d019e167-master.webp', 25, 1),
	(119, 'images', 'product/24/02-2-min-1702608340186.webp', 24, 1),
	(120, 'images', 'product/24/p10063801323-00-min-1702608340185.webp', 24, 2),
	(121, 'images', 'product/23/61euvvvuk1l.webp', 23, 1),
	(122, 'images', 'product/23/pin-sac-du-phong-anker-737-powercore-24000-140w-a1289-1-1.webp', 23, 2),
	(123, 'images', 'product/22/sac-du-phong-cuktech-20-25000mah-210w-cuk00p23glbk-ckp23-2k-210-black.webp', 22, 1),
	(124, 'images', 'product/21/51wywi5ig9l.webp', 21, 1),
	(125, 'images', 'product/21/layer5-86445db0-8696-42d5-9929-7059896331de.webp', 21, 2),
	(126, 'images', 'product/20/sac-3-cong-anker-prime-67w-gan-a2669-3-d3a5e6ce1f7f41c08b12fe7bcddae14d-grande.webp', 20, 1),
	(127, 'images', 'product/19/nubia-red-magic-9s-pro-den-1.webp', 19, 1),
	(128, 'images', 'product/19/nubia-red-magic-9s-pro-trang-trong-1.webp', 19, 2),
	(129, 'images', 'product/4/samsung-galaxy-s24-ultra-cu-p4q4-rv.webp', 4, 1),
	(130, 'images', 'product/1/iphone-16-pro-max.webp', 1, 1),
	(131, 'images', 'product/1/iphone-16-pro-max-2.webp', 1, 2),
	(132, 'images', 'product/37/eGklCKqD4tA586u1oaAxzeSkJWnyNOPfFk4P7qf9.webp', 37, 2),
	(133, 'images', 'product/38/TAdYGpVSXTLoJfIuVvDI3vHcZ6fdaSpeQRB1C55W.webp', 38, 1);

-- Dumping structure for table bagisto_db.product_image_translations
CREATE TABLE IF NOT EXISTS `product_image_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_image_id` int unsigned NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `image_translations_image_id_locale_unique` (`product_image_id`,`locale`),
  CONSTRAINT `image_translations_image_id_foreign` FOREIGN KEY (`product_image_id`) REFERENCES `product_images` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_image_translations: ~41 rows (approximately)
INSERT INTO `product_image_translations` (`id`, `product_image_id`, `locale`, `alt_text`) VALUES
	(2, 17, 'en', ''),
	(3, 18, 'en', ''),
	(4, 19, 'en', ''),
	(5, 20, 'en', ''),
	(6, 21, 'en', ''),
	(7, 22, 'en', ''),
	(8, 23, 'en', ''),
	(9, 24, 'en', ''),
	(10, 25, 'en', ''),
	(11, 26, 'en', ''),
	(12, 27, 'en', ''),
	(13, 28, 'en', ''),
	(14, 29, 'en', ''),
	(15, 30, 'en', ''),
	(16, 31, 'en', ''),
	(17, 32, 'en', ''),
	(18, 33, 'en', ''),
	(19, 34, 'en', ''),
	(20, 35, 'en', ''),
	(21, 36, 'en', ''),
	(22, 37, 'en', ''),
	(23, 38, 'en', ''),
	(24, 39, 'en', ''),
	(25, 40, 'en', ''),
	(26, 41, 'en', ''),
	(27, 42, 'en', ''),
	(28, 43, 'en', ''),
	(29, 44, 'en', ''),
	(30, 45, 'en', ''),
	(31, 46, 'en', ''),
	(32, 47, 'en', ''),
	(33, 48, 'en', ''),
	(34, 49, 'en', ''),
	(35, 50, 'en', ''),
	(36, 51, 'en', ''),
	(37, 52, 'en', ''),
	(38, 53, 'en', ''),
	(39, 54, 'en', ''),
	(40, 55, 'en', ''),
	(41, 56, 'en', ''),
	(42, 57, 'en', ''),
	(43, 102, 'en', ''),
	(44, 103, 'en', ''),
	(45, 104, 'en', ''),
	(46, 105, 'en', ''),
	(47, 106, 'en', ''),
	(48, 107, 'en', ''),
	(49, 108, 'en', ''),
	(50, 109, 'en', ''),
	(51, 110, 'en', ''),
	(52, 111, 'en', ''),
	(53, 112, 'en', ''),
	(54, 113, 'en', ''),
	(55, 114, 'en', ''),
	(56, 115, 'en', ''),
	(57, 116, 'en', ''),
	(58, 117, 'en', ''),
	(59, 118, 'en', ''),
	(60, 119, 'en', ''),
	(61, 120, 'en', ''),
	(62, 121, 'en', ''),
	(63, 122, 'en', ''),
	(64, 123, 'en', ''),
	(65, 124, 'en', ''),
	(66, 125, 'en', ''),
	(67, 126, 'en', ''),
	(68, 127, 'en', ''),
	(69, 128, 'en', ''),
	(70, 129, 'en', ''),
	(71, 130, 'en', ''),
	(72, 131, 'en', ''),
	(73, 132, 'en', ''),
	(74, 133, 'en', '');

-- Dumping structure for table bagisto_db.product_inventories
CREATE TABLE IF NOT EXISTS `product_inventories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL DEFAULT '0',
  `product_id` int unsigned NOT NULL,
  `vendor_id` int NOT NULL DEFAULT '0',
  `inventory_source_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_source_vendor_index_unique` (`product_id`,`inventory_source_id`,`vendor_id`),
  KEY `product_inventories_inventory_source_id_foreign` (`inventory_source_id`),
  CONSTRAINT `product_inventories_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_inventories: ~37 rows (approximately)
INSERT INTO `product_inventories` (`id`, `qty`, `product_id`, `vendor_id`, `inventory_source_id`) VALUES
	(1, 8, 3, 0, 1),
	(2, 10, 5, 0, 1),
	(3, 8, 6, 0, 1),
	(4, 27, 7, 0, 1),
	(5, 94, 8, 0, 1),
	(6, 32, 9, 0, 1),
	(7, 59, 10, 0, 1),
	(8, 55, 11, 0, 1),
	(9, 90, 12, 0, 1),
	(10, 54, 13, 0, 1),
	(11, 92, 14, 0, 1),
	(12, 25, 15, 0, 1),
	(13, 63, 16, 0, 1),
	(14, 16, 17, 0, 1),
	(15, 69, 18, 0, 1),
	(16, 6, 4, 0, 1),
	(17, 9, 1, 0, 1),
	(18, 5, 19, 0, 1),
	(19, 11, 20, 0, 1),
	(20, 93, 21, 0, 1),
	(21, 36, 22, 0, 1),
	(22, 18, 23, 0, 1),
	(23, 29, 24, 0, 1),
	(24, 26, 25, 0, 1),
	(25, 35, 26, 0, 1),
	(26, 30, 27, 0, 1),
	(27, 58, 28, 0, 1),
	(28, 14, 29, 0, 1),
	(29, 44, 30, 0, 1),
	(30, 72, 31, 0, 1),
	(31, 41, 32, 0, 1),
	(32, 61, 33, 0, 1),
	(33, 12, 34, 0, 1),
	(34, 47, 35, 0, 1),
	(35, 84, 36, 0, 1),
	(36, 76, 37, 0, 1),
	(37, 66, 2, 0, 1),
	(38, 4, 38, 0, 1);

-- Dumping structure for table bagisto_db.product_inventory_indices
CREATE TABLE IF NOT EXISTS `product_inventory_indices` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL DEFAULT '0',
  `product_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_inventory_indices_product_id_channel_id_unique` (`product_id`,`channel_id`),
  KEY `product_inventory_indices_channel_id_foreign` (`channel_id`),
  KEY `prod_inv_product_id_idx` (`product_id`),
  CONSTRAINT `product_inventory_indices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_inventory_indices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_inventory_indices: ~37 rows (approximately)
INSERT INTO `product_inventory_indices` (`id`, `qty`, `product_id`, `channel_id`, `created_at`, `updated_at`) VALUES
	(1, 10, 5, 1, NULL, '2026-10-21 22:00:09'),
	(2, 7, 6, 1, NULL, '2026-10-21 22:28:00'),
	(3, 27, 7, 1, NULL, '2026-10-21 22:00:27'),
	(4, 94, 8, 1, NULL, '2026-10-21 22:00:27'),
	(5, 32, 9, 1, NULL, '2026-10-21 22:00:27'),
	(6, 59, 10, 1, NULL, '2026-10-21 22:00:27'),
	(7, 55, 11, 1, NULL, '2026-10-21 22:00:27'),
	(8, 90, 12, 1, NULL, '2026-10-21 22:00:27'),
	(9, 54, 13, 1, NULL, '2026-10-21 22:00:27'),
	(10, 92, 14, 1, NULL, '2026-10-21 22:00:27'),
	(11, 25, 15, 1, NULL, '2026-10-21 22:00:27'),
	(12, 63, 16, 1, NULL, '2026-10-21 22:00:27'),
	(13, 16, 17, 1, NULL, '2026-10-21 22:00:09'),
	(14, 69, 18, 1, NULL, '2026-10-21 22:00:27'),
	(15, 9, 1, 1, NULL, '2026-10-21 22:00:27'),
	(16, 66, 2, 1, NULL, '2026-10-21 22:00:27'),
	(17, 8, 3, 1, NULL, '2026-10-21 22:00:27'),
	(18, 6, 4, 1, NULL, '2026-10-21 22:00:27'),
	(19, 5, 19, 1, NULL, '2026-10-21 22:00:27'),
	(20, 11, 20, 1, NULL, '2026-10-21 22:00:27'),
	(21, 93, 21, 1, NULL, '2026-10-21 22:00:27'),
	(22, 36, 22, 1, NULL, '2026-10-21 22:00:27'),
	(23, 18, 23, 1, NULL, '2026-10-21 22:00:27'),
	(24, 29, 24, 1, NULL, '2026-10-21 22:00:27'),
	(25, 26, 25, 1, NULL, '2026-10-21 22:00:27'),
	(26, 35, 26, 1, NULL, '2026-10-21 22:00:27'),
	(27, 30, 27, 1, NULL, '2026-10-21 22:00:27'),
	(28, 58, 28, 1, NULL, '2026-10-21 22:00:27'),
	(29, 14, 29, 1, NULL, '2026-10-21 22:00:27'),
	(30, 44, 30, 1, NULL, '2026-10-21 22:00:27'),
	(31, 72, 31, 1, NULL, '2026-10-21 22:00:27'),
	(32, 41, 32, 1, NULL, '2026-10-21 22:00:27'),
	(33, 61, 33, 1, NULL, '2026-10-21 22:00:27'),
	(34, 12, 34, 1, NULL, '2026-10-21 22:00:27'),
	(35, 47, 35, 1, NULL, '2026-10-21 22:00:27'),
	(36, 84, 36, 1, NULL, '2026-10-21 22:00:27'),
	(37, 76, 37, 1, NULL, '2026-10-21 22:00:27'),
	(38, 4, 38, 1, NULL, NULL);

-- Dumping structure for table bagisto_db.product_ordered_inventories
CREATE TABLE IF NOT EXISTS `product_ordered_inventories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL DEFAULT '0',
  `product_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_ordered_inventories_product_id_channel_id_unique` (`product_id`,`channel_id`),
  KEY `product_ordered_inventories_channel_id_foreign` (`channel_id`),
  CONSTRAINT `product_ordered_inventories_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_ordered_inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_ordered_inventories: ~0 rows (approximately)
INSERT INTO `product_ordered_inventories` (`id`, `qty`, `product_id`, `channel_id`) VALUES
	(1, 1, 6, 1);

-- Dumping structure for table bagisto_db.product_price_indices
CREATE TABLE IF NOT EXISTS `product_price_indices` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `customer_group_id` int unsigned DEFAULT NULL,
  `channel_id` int unsigned NOT NULL DEFAULT '1',
  `min_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `regular_min_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `max_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `regular_max_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `price_indices_product_id_customer_group_id_channel_id_unique` (`product_id`,`customer_group_id`,`channel_id`),
  KEY `product_price_indices_customer_group_id_foreign` (`customer_group_id`),
  KEY `product_price_indices_channel_id_foreign` (`channel_id`),
  KEY `ppi_product_id_customer_group_id_idx` (`product_id`,`customer_group_id`),
  CONSTRAINT `product_price_indices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_price_indices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_price_indices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_price_indices: ~111 rows (approximately)
INSERT INTO `product_price_indices` (`id`, `product_id`, `customer_group_id`, `channel_id`, `min_price`, `regular_min_price`, `max_price`, `regular_max_price`, `created_at`, `updated_at`) VALUES
	(1, 5, 1, 1, 999.0000, 1099.0000, 999.0000, 1099.0000, NULL, NULL),
	(2, 5, 2, 1, 999.0000, 1099.0000, 999.0000, 1099.0000, NULL, NULL),
	(3, 5, 3, 1, 999.0000, 1099.0000, 999.0000, 1099.0000, NULL, NULL),
	(4, 6, 1, 1, 1049.0000, 1149.0000, 1049.0000, 1149.0000, NULL, NULL),
	(5, 6, 2, 1, 1049.0000, 1149.0000, 1049.0000, 1149.0000, NULL, NULL),
	(6, 6, 3, 1, 1049.0000, 1149.0000, 1049.0000, 1149.0000, NULL, NULL),
	(7, 7, 1, 1, 84.9900, 99.9900, 84.9900, 99.9900, NULL, NULL),
	(8, 7, 2, 1, 84.9900, 99.9900, 84.9900, 99.9900, NULL, NULL),
	(9, 7, 3, 1, 84.9900, 99.9900, 84.9900, 99.9900, NULL, NULL),
	(10, 8, 1, 1, 54.9900, 69.9900, 54.9900, 69.9900, NULL, NULL),
	(11, 8, 2, 1, 54.9900, 69.9900, 54.9900, 69.9900, NULL, NULL),
	(12, 8, 3, 1, 54.9900, 69.9900, 54.9900, 69.9900, NULL, NULL),
	(13, 9, 1, 1, 169.9900, 199.9900, 169.9900, 199.9900, NULL, NULL),
	(14, 9, 2, 1, 169.9900, 199.9900, 169.9900, 199.9900, NULL, NULL),
	(15, 9, 3, 1, 169.9900, 199.9900, 169.9900, 199.9900, NULL, NULL),
	(16, 10, 1, 1, 189.0000, 219.0000, 189.0000, 219.0000, NULL, NULL),
	(17, 10, 2, 1, 189.0000, 219.0000, 189.0000, 219.0000, NULL, NULL),
	(18, 10, 3, 1, 189.0000, 219.0000, 189.0000, 219.0000, NULL, NULL),
	(19, 11, 1, 1, 109.9900, 129.9900, 109.9900, 129.9900, NULL, NULL),
	(20, 11, 2, 1, 109.9900, 129.9900, 109.9900, 129.9900, NULL, NULL),
	(21, 11, 3, 1, 109.9900, 129.9900, 109.9900, 129.9900, NULL, NULL),
	(22, 12, 1, 1, 249.9900, 299.9900, 249.9900, 299.9900, NULL, NULL),
	(23, 12, 2, 1, 249.9900, 299.9900, 249.9900, 299.9900, NULL, NULL),
	(24, 12, 3, 1, 249.9900, 299.9900, 249.9900, 299.9900, NULL, NULL),
	(25, 13, 1, 1, 179.9900, 199.9900, 179.9900, 199.9900, NULL, NULL),
	(26, 13, 2, 1, 179.9900, 199.9900, 179.9900, 199.9900, NULL, NULL),
	(27, 13, 3, 1, 179.9900, 199.9900, 179.9900, 199.9900, NULL, NULL),
	(28, 14, 1, 1, 49.9900, 59.9900, 49.9900, 59.9900, NULL, NULL),
	(29, 14, 2, 1, 49.9900, 59.9900, 49.9900, 59.9900, NULL, NULL),
	(30, 14, 3, 1, 49.9900, 59.9900, 49.9900, 59.9900, NULL, NULL),
	(31, 15, 1, 1, 38.0000, 45.0000, 38.0000, 45.0000, NULL, NULL),
	(32, 15, 2, 1, 38.0000, 45.0000, 38.0000, 45.0000, NULL, NULL),
	(33, 15, 3, 1, 38.0000, 45.0000, 38.0000, 45.0000, NULL, NULL),
	(34, 16, 1, 1, 27.9900, 34.9900, 27.9900, 34.9900, NULL, NULL),
	(35, 16, 2, 1, 27.9900, 34.9900, 27.9900, 34.9900, NULL, NULL),
	(36, 16, 3, 1, 27.9900, 34.9900, 27.9900, 34.9900, NULL, NULL),
	(37, 17, 1, 1, 69.9500, 79.9500, 69.9500, 79.9500, NULL, NULL),
	(38, 17, 2, 1, 69.9500, 79.9500, 69.9500, 79.9500, NULL, NULL),
	(39, 17, 3, 1, 69.9500, 79.9500, 69.9500, 79.9500, NULL, NULL),
	(40, 18, 1, 1, 32.9900, 39.9900, 32.9900, 39.9900, NULL, NULL),
	(41, 18, 2, 1, 32.9900, 39.9900, 32.9900, 39.9900, NULL, NULL),
	(42, 18, 3, 1, 32.9900, 39.9900, 32.9900, 39.9900, NULL, NULL),
	(43, 1, 1, 1, 1149.0000, 1199.0000, 1149.0000, 1199.0000, NULL, '2026-09-28 02:24:34'),
	(44, 1, 2, 1, 1149.0000, 1199.0000, 1149.0000, 1199.0000, NULL, '2026-09-28 02:24:34'),
	(45, 1, 3, 1, 1149.0000, 1199.0000, 1149.0000, 1199.0000, NULL, '2026-09-28 02:24:34'),
	(46, 2, 1, 1, 100.0000, 100.0000, 100.0000, 100.0000, NULL, NULL),
	(47, 2, 2, 1, 100.0000, 100.0000, 100.0000, 100.0000, NULL, NULL),
	(48, 2, 3, 1, 100.0000, 100.0000, 100.0000, 100.0000, NULL, NULL),
	(49, 3, 1, 1, 1129.0000, 1199.0000, 1129.0000, 1199.0000, NULL, NULL),
	(50, 3, 2, 1, 1129.0000, 1199.0000, 1129.0000, 1199.0000, NULL, NULL),
	(51, 3, 3, 1, 1129.0000, 1199.0000, 1129.0000, 1199.0000, NULL, NULL),
	(52, 4, 1, 1, 1199.0000, 1299.0000, 1199.0000, 1299.0000, NULL, '2026-09-28 02:24:34'),
	(53, 4, 2, 1, 1199.0000, 1299.0000, 1199.0000, 1299.0000, NULL, '2026-09-28 02:24:35'),
	(54, 4, 3, 1, 1199.0000, 1299.0000, 1199.0000, 1299.0000, NULL, '2026-09-28 02:24:35'),
	(55, 19, 1, 1, 799.0000, 899.0000, 799.0000, 899.0000, NULL, NULL),
	(56, 19, 2, 1, 799.0000, 899.0000, 799.0000, 899.0000, NULL, NULL),
	(57, 19, 3, 1, 799.0000, 899.0000, 799.0000, 899.0000, NULL, NULL),
	(58, 20, 1, 1, 49.9900, 59.9900, 49.9900, 59.9900, NULL, NULL),
	(59, 20, 2, 1, 49.9900, 59.9900, 49.9900, 59.9900, NULL, NULL),
	(60, 20, 3, 1, 49.9900, 59.9900, 49.9900, 59.9900, NULL, NULL),
	(61, 21, 1, 1, 64.9900, 79.9900, 64.9900, 79.9900, NULL, NULL),
	(62, 21, 2, 1, 64.9900, 79.9900, 64.9900, 79.9900, NULL, NULL),
	(63, 21, 3, 1, 64.9900, 79.9900, 64.9900, 79.9900, NULL, NULL),
	(64, 22, 1, 1, 119.9900, 139.9900, 119.9900, 139.9900, NULL, NULL),
	(65, 22, 2, 1, 119.9900, 139.9900, 119.9900, 139.9900, NULL, NULL),
	(66, 22, 3, 1, 119.9900, 139.9900, 119.9900, 139.9900, NULL, NULL),
	(67, 23, 1, 1, 129.9900, 149.9900, 129.9900, 149.9900, NULL, NULL),
	(68, 23, 2, 1, 129.9900, 149.9900, 129.9900, 149.9900, NULL, NULL),
	(69, 23, 3, 1, 129.9900, 149.9900, 129.9900, 149.9900, NULL, NULL),
	(70, 24, 1, 1, 59.9900, 69.9900, 59.9900, 69.9900, NULL, NULL),
	(71, 24, 2, 1, 59.9900, 69.9900, 59.9900, 69.9900, NULL, NULL),
	(72, 24, 3, 1, 59.9900, 69.9900, 59.9900, 69.9900, NULL, NULL),
	(73, 25, 1, 1, 249.0000, 299.0000, 249.0000, 299.0000, NULL, NULL),
	(74, 25, 2, 1, 249.0000, 299.0000, 249.0000, 299.0000, NULL, NULL),
	(75, 25, 3, 1, 249.0000, 299.0000, 249.0000, 299.0000, NULL, NULL),
	(76, 26, 1, 1, 169.9900, 199.9900, 169.9900, 199.9900, NULL, NULL),
	(77, 26, 2, 1, 169.9900, 199.9900, 169.9900, 199.9900, NULL, NULL),
	(78, 26, 3, 1, 169.9900, 199.9900, 169.9900, 199.9900, NULL, NULL),
	(79, 27, 1, 1, 219.0000, 249.0000, 219.0000, 249.0000, NULL, NULL),
	(80, 27, 2, 1, 219.0000, 249.0000, 219.0000, 249.0000, NULL, NULL),
	(81, 27, 3, 1, 219.0000, 249.0000, 219.0000, 249.0000, NULL, NULL),
	(82, 28, 1, 1, 39.9900, 49.9900, 39.9900, 49.9900, NULL, NULL),
	(83, 28, 2, 1, 39.9900, 49.9900, 39.9900, 49.9900, NULL, NULL),
	(84, 28, 3, 1, 39.9900, 49.9900, 39.9900, 49.9900, NULL, NULL),
	(85, 29, 1, 1, 69.9900, 79.9900, 69.9900, 79.9900, NULL, NULL),
	(86, 29, 2, 1, 69.9900, 79.9900, 69.9900, 79.9900, NULL, NULL),
	(87, 29, 3, 1, 69.9900, 79.9900, 69.9900, 79.9900, NULL, NULL),
	(88, 30, 1, 1, 49.9900, 59.9900, 49.9900, 59.9900, NULL, NULL),
	(89, 30, 2, 1, 49.9900, 59.9900, 49.9900, 59.9900, NULL, NULL),
	(90, 30, 3, 1, 49.9900, 59.9900, 49.9900, 59.9900, NULL, NULL),
	(91, 31, 1, 1, 359.9500, 399.9500, 359.9500, 399.9500, NULL, NULL),
	(92, 31, 2, 1, 359.9500, 399.9500, 359.9500, 399.9500, NULL, NULL),
	(93, 31, 3, 1, 359.9500, 399.9500, 359.9500, 399.9500, NULL, NULL),
	(94, 32, 1, 1, 64.9900, 79.9900, 64.9900, 79.9900, NULL, NULL),
	(95, 32, 2, 1, 64.9900, 79.9900, 64.9900, 79.9900, NULL, NULL),
	(96, 32, 3, 1, 64.9900, 79.9900, 64.9900, 79.9900, NULL, NULL),
	(97, 33, 1, 1, 84.9900, 99.9900, 84.9900, 99.9900, NULL, NULL),
	(98, 33, 2, 1, 84.9900, 99.9900, 84.9900, 99.9900, NULL, NULL),
	(99, 33, 3, 1, 84.9900, 99.9900, 84.9900, 99.9900, NULL, NULL),
	(100, 34, 1, 1, 39.9900, 49.9900, 39.9900, 49.9900, NULL, NULL),
	(101, 34, 2, 1, 39.9900, 49.9900, 39.9900, 49.9900, NULL, NULL),
	(102, 34, 3, 1, 39.9900, 49.9900, 39.9900, 49.9900, NULL, NULL),
	(103, 35, 1, 1, 59.9900, 69.9900, 59.9900, 69.9900, NULL, NULL),
	(104, 35, 2, 1, 59.9900, 69.9900, 59.9900, 69.9900, NULL, NULL),
	(105, 35, 3, 1, 59.9900, 69.9900, 59.9900, 69.9900, NULL, NULL),
	(106, 36, 1, 1, 34.9900, 44.9900, 34.9900, 44.9900, NULL, NULL),
	(107, 36, 2, 1, 34.9900, 44.9900, 34.9900, 44.9900, NULL, NULL),
	(108, 36, 3, 1, 34.9900, 44.9900, 34.9900, 44.9900, NULL, NULL),
	(109, 37, 1, 1, 26.9900, 32.9900, 26.9900, 32.9900, NULL, NULL),
	(110, 37, 2, 1, 26.9900, 32.9900, 26.9900, 32.9900, NULL, NULL),
	(111, 37, 3, 1, 26.9900, 32.9900, 26.9900, 32.9900, NULL, NULL),
	(112, 38, 1, 1, 250.0000, 250.0000, 250.0000, 250.0000, NULL, NULL),
	(113, 38, 2, 1, 250.0000, 250.0000, 250.0000, 250.0000, NULL, NULL),
	(114, 38, 3, 1, 250.0000, 250.0000, 250.0000, 250.0000, NULL, NULL);

-- Dumping structure for table bagisto_db.product_relations
CREATE TABLE IF NOT EXISTS `product_relations` (
  `parent_id` int unsigned NOT NULL,
  `child_id` int unsigned NOT NULL,
  UNIQUE KEY `product_relations_parent_id_child_id_unique` (`parent_id`,`child_id`),
  KEY `product_relations_child_id_foreign` (`child_id`),
  CONSTRAINT `product_relations_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_relations_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_relations: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.product_reviews
CREATE TABLE IF NOT EXISTS `product_reviews` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int NOT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int unsigned NOT NULL,
  `customer_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prod_rev_product_id_idx` (`product_id`),
  CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_reviews: ~0 rows (approximately)
INSERT INTO `product_reviews` (`id`, `name`, `title`, `rating`, `comment`, `status`, `product_id`, `customer_id`, `created_at`, `updated_at`) VALUES
	(1, 'Alex Hunter', 'Top-tier build quality!', 5, 'Outstanding build quality and crystal clear audio. Truly a high-end experience!', 'approved', 6, 1, '2026-09-29 07:58:04', '2026-09-29 07:59:06');

-- Dumping structure for table bagisto_db.product_review_attachments
CREATE TABLE IF NOT EXISTS `product_review_attachments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `review_id` int unsigned NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'image',
  `mime_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_review_images_review_id_foreign` (`review_id`),
  CONSTRAINT `product_review_images_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `product_reviews` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_review_attachments: ~0 rows (approximately)
INSERT INTO `product_review_attachments` (`id`, `review_id`, `type`, `mime_type`, `path`) VALUES
	(1, 1, 'image', 'jpeg', 'review/1/Hgofhuuf3tKvNBam1kqZjuS9BZbbI4LcPlG5uPVf.jpg');

-- Dumping structure for table bagisto_db.product_super_attributes
CREATE TABLE IF NOT EXISTS `product_super_attributes` (
  `product_id` int unsigned NOT NULL,
  `attribute_id` int unsigned NOT NULL,
  UNIQUE KEY `product_super_attributes_product_id_attribute_id_unique` (`product_id`,`attribute_id`),
  KEY `product_super_attributes_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `product_super_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `product_super_attributes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_super_attributes: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.product_up_sells
CREATE TABLE IF NOT EXISTS `product_up_sells` (
  `parent_id` int unsigned NOT NULL,
  `child_id` int unsigned NOT NULL,
  UNIQUE KEY `product_up_sells_parent_id_child_id_unique` (`parent_id`,`child_id`),
  KEY `product_up_sells_child_id_foreign` (`child_id`),
  CONSTRAINT `product_up_sells_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_up_sells_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_up_sells: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.product_videos
CREATE TABLE IF NOT EXISTS `product_videos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `prod_vid_product_id_idx` (`product_id`),
  CONSTRAINT `product_videos_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.product_videos: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.refunds
CREATE TABLE IF NOT EXISTS `refunds` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `increment_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT '0',
  `total_qty` int DEFAULT NULL,
  `base_currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_refund` decimal(12,4) DEFAULT '0.0000',
  `base_adjustment_refund` decimal(12,4) DEFAULT '0.0000',
  `adjustment_fee` decimal(12,4) DEFAULT '0.0000',
  `base_adjustment_fee` decimal(12,4) DEFAULT '0.0000',
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `order_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `refunds_order_id_foreign` (`order_id`),
  CONSTRAINT `refunds_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.refunds: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.refund_items
CREATE TABLE IF NOT EXISTS `refund_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `product_id` int unsigned DEFAULT NULL,
  `product_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_item_id` int unsigned DEFAULT NULL,
  `refund_id` int unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `refund_items_parent_id_foreign` (`parent_id`),
  KEY `refund_items_order_item_id_foreign` (`order_item_id`),
  KEY `refund_items_refund_id_foreign` (`refund_id`),
  CONSTRAINT `refund_items_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `refund_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `refund_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `refund_items_refund_id_foreign` FOREIGN KEY (`refund_id`) REFERENCES `refunds` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.refund_items: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.rma
CREATE TABLE IF NOT EXISTS `rma` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int unsigned NOT NULL,
  `rma_status_id` int unsigned DEFAULT NULL,
  `package_condition` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `information` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rma_order_id_foreign` (`order_id`),
  KEY `rma_rma_status_id_foreign` (`rma_status_id`),
  CONSTRAINT `rma_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `rma_rma_status_id_foreign` FOREIGN KEY (`rma_status_id`) REFERENCES `rma_statuses` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.rma: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.rma_additional_fields
CREATE TABLE IF NOT EXISTS `rma_additional_fields` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rma_id` int unsigned DEFAULT NULL,
  `rma_custom_field_id` int unsigned DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rma_additional_fields_rma_id_foreign` (`rma_id`),
  KEY `rma_additional_fields_rma_custom_field_id_foreign` (`rma_custom_field_id`),
  CONSTRAINT `rma_additional_fields_rma_custom_field_id_foreign` FOREIGN KEY (`rma_custom_field_id`) REFERENCES `rma_custom_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `rma_additional_fields_rma_id_foreign` FOREIGN KEY (`rma_id`) REFERENCES `rma` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.rma_additional_fields: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.rma_custom_fields
CREATE TABLE IF NOT EXISTS `rma_custom_fields` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) DEFAULT '0',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_required` tinyint(1) DEFAULT '0',
  `position` int DEFAULT '0',
  `input_validation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rma_custom_fields_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.rma_custom_fields: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.rma_custom_field_options
CREATE TABLE IF NOT EXISTS `rma_custom_field_options` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rma_custom_field_id` int unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rma_custom_field_options_rma_custom_field_id_foreign` (`rma_custom_field_id`),
  CONSTRAINT `rma_custom_field_options_rma_custom_field_id_foreign` FOREIGN KEY (`rma_custom_field_id`) REFERENCES `rma_custom_fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.rma_custom_field_options: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.rma_images
CREATE TABLE IF NOT EXISTS `rma_images` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rma_id` int unsigned NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rma_images_rma_id_foreign` (`rma_id`),
  CONSTRAINT `rma_images_rma_id_foreign` FOREIGN KEY (`rma_id`) REFERENCES `rma` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.rma_images: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.rma_items
CREATE TABLE IF NOT EXISTS `rma_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rma_id` int unsigned DEFAULT NULL,
  `rma_reason_id` int unsigned DEFAULT NULL,
  `order_item_id` int unsigned DEFAULT NULL,
  `variant_id` int unsigned DEFAULT NULL,
  `quantity` int unsigned NOT NULL,
  `resolution` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rma_items_rma_id_foreign` (`rma_id`),
  KEY `rma_items_rma_reason_id_foreign` (`rma_reason_id`),
  KEY `rma_items_order_item_id_foreign` (`order_item_id`),
  KEY `rma_items_variant_id_foreign` (`variant_id`),
  CONSTRAINT `rma_items_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `rma_items_rma_id_foreign` FOREIGN KEY (`rma_id`) REFERENCES `rma` (`id`) ON DELETE CASCADE,
  CONSTRAINT `rma_items_rma_reason_id_foreign` FOREIGN KEY (`rma_reason_id`) REFERENCES `rma_reasons` (`id`) ON DELETE SET NULL,
  CONSTRAINT `rma_items_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.rma_items: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.rma_messages
CREATE TABLE IF NOT EXISTS `rma_messages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rma_id` int unsigned NOT NULL,
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachment_path` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `attachment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_admin` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rma_messages_rma_id_foreign` (`rma_id`),
  CONSTRAINT `rma_messages_rma_id_foreign` FOREIGN KEY (`rma_id`) REFERENCES `rma` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.rma_messages: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.rma_reasons
CREATE TABLE IF NOT EXISTS `rma_reasons` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `position` int NOT NULL DEFAULT '0',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.rma_reasons: ~5 rows (approximately)
INSERT INTO `rma_reasons` (`id`, `title`, `status`, `position`, `is_admin`, `created_at`, `updated_at`) VALUES
	(1, 'Manufacturer Defect', 1, 1, 0, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(2, 'Damaged During Shipping', 1, 2, 0, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(3, 'Wrong Description Online', 1, 3, 0, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(4, 'Dead On Arrival', 1, 4, 0, '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(5, 'Product Not Received Yet', 1, 5, 0, '2026-09-28 02:10:02', '2026-09-28 02:10:02');

-- Dumping structure for table bagisto_db.rma_reason_resolutions
CREATE TABLE IF NOT EXISTS `rma_reason_resolutions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rma_reason_id` int unsigned NOT NULL,
  `resolution_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rma_reason_resolutions_rma_reason_id_foreign` (`rma_reason_id`),
  CONSTRAINT `rma_reason_resolutions_rma_reason_id_foreign` FOREIGN KEY (`rma_reason_id`) REFERENCES `rma_reasons` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.rma_reason_resolutions: ~10 rows (approximately)
INSERT INTO `rma_reason_resolutions` (`id`, `rma_reason_id`, `resolution_type`, `created_at`, `updated_at`) VALUES
	(1, 1, 'return', '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(2, 1, 'cancel_items', '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(3, 2, 'return', '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(4, 2, 'cancel_items', '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(5, 3, 'return', '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(6, 3, 'cancel_items', '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(7, 4, 'return', '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(8, 4, 'cancel_items', '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(9, 5, 'return', '2026-09-28 02:10:02', '2026-09-28 02:10:02'),
	(10, 5, 'cancel_items', '2026-09-28 02:10:02', '2026-09-28 02:10:02');

-- Dumping structure for table bagisto_db.rma_rules
CREATE TABLE IF NOT EXISTS `rma_rules` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `return_period` int DEFAULT NULL,
  `default` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.rma_rules: ~0 rows (approximately)
INSERT INTO `rma_rules` (`id`, `name`, `description`, `status`, `return_period`, `default`, `created_at`, `updated_at`) VALUES
	(1, 'Basic', '1', 1, 10, NULL, '2026-09-28 02:10:02', '2026-09-28 02:10:02');

-- Dumping structure for table bagisto_db.rma_statuses
CREATE TABLE IF NOT EXISTS `rma_statuses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.rma_statuses: ~9 rows (approximately)
INSERT INTO `rma_statuses` (`id`, `title`, `status`, `color`, `default`, `created_at`, `updated_at`) VALUES
	(1, 'Pending Review', 1, '#efb308', 1, NULL, NULL),
	(2, 'Approved', 1, '#12af56', 1, NULL, NULL),
	(3, 'Awaiting Return', 1, '#f59e0b', 1, NULL, NULL),
	(4, 'Return In Transit', 1, '#3b82f6', 1, NULL, NULL),
	(5, 'Refunded', 1, '#10b981', 1, NULL, NULL),
	(6, 'Solved', 1, '#47b84f', 1, NULL, NULL),
	(7, 'Request Declined', 1, '#e11d48', 1, NULL, NULL),
	(8, 'Item Canceled', 1, '#dc2626', 1, NULL, NULL),
	(9, 'Request Canceled', 1, '#991b1b', 1, NULL, NULL);

-- Dumping structure for table bagisto_db.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.roles: ~1 rows (approximately)
INSERT INTO `roles` (`id`, `name`, `description`, `permission_type`, `permissions`, `created_at`, `updated_at`) VALUES
	(1, 'Administrator', 'This role users will have all the access', 'all', NULL, NULL, NULL),
	(4, 'Order Staff', 'Only manage sales and orders', 'custom', '["dashboard", "sales", "sales.orders", "sales.orders.create", "sales.orders.view", "sales.orders.cancel", "sales.invoices", "sales.invoices.view", "sales.invoices.create", "sales.invoices.update", "sales.shipments", "sales.shipments.view", "sales.shipments.create", "sales.refunds", "sales.refunds.view", "sales.refunds.create", "sales.transactions", "sales.transactions.view", "sales.rma", "sales.rma.requests", "sales.rma.requests.create", "sales.rma.reasons", "sales.rma.reasons.create", "sales.rma.reasons.edit", "sales.rma.reasons.delete", "sales.rma.rules", "sales.rma.rules.create", "sales.rma.rules.edit", "sales.rma.rules.delete", "sales.rma.statuses", "sales.rma.statuses.create", "sales.rma.statuses.edit", "sales.rma.statuses.delete", "sales.rma.custom-fields", "sales.rma.custom-fields.create", "sales.rma.custom-fields.edit", "sales.rma.custom-fields.delete", "sales.eu_withdrawals", "sales.eu_withdrawals.view", "sales.eu_withdrawals.decline", "sales.eu_withdrawals.mark_refunded", "sales.eu_withdrawals.resend_confirmation", "sales.bookings"]', '2026-10-21 22:51:19', '2026-10-21 22:51:19');

-- Dumping structure for table bagisto_db.search_synonyms
CREATE TABLE IF NOT EXISTS `search_synonyms` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `terms` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.search_synonyms: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.search_terms
CREATE TABLE IF NOT EXISTS `search_terms` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `results` int NOT NULL DEFAULT '0',
  `uses` int NOT NULL DEFAULT '0',
  `redirect_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_in_suggested_terms` tinyint(1) NOT NULL DEFAULT '0',
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `search_terms_channel_id_foreign` (`channel_id`),
  CONSTRAINT `search_terms_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.search_terms: ~5 rows (approximately)
INSERT INTO `search_terms` (`id`, `term`, `results`, `uses`, `redirect_url`, `display_in_suggested_terms`, `locale`, `channel_id`, `created_at`, `updated_at`) VALUES
	(1, 'phone', 6, 2, NULL, 0, 'en', 1, '2026-09-29 17:45:51', '2026-10-21 21:41:29'),
	(2, 'earbuds', 11, 1, NULL, 0, 'en', 1, '2026-09-29 17:46:02', '2026-09-29 17:46:02'),
	(3, 'case', 1, 1, NULL, 0, 'en', 1, '2026-09-29 17:46:25', '2026-09-29 17:46:25'),
	(4, 'đồ án', 0, 4, NULL, 0, 'en', 1, '2026-10-05 22:21:59', '2026-10-05 22:37:09'),
	(5, 'mouse', 0, 1, NULL, 0, 'en', 1, '2026-10-21 21:41:18', '2026-10-21 21:41:18'),
	(6, 'sanphamkhongtontai999', 0, 1, NULL, 0, 'en', 1, '2026-10-21 21:42:03', '2026-10-21 21:42:03');

-- Dumping structure for table bagisto_db.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.sessions: ~1 rows (approximately)
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('5ku7wJ3SN2WVHEUDGQXzg6XlvSDlukvFLl11NnWB', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36', 'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiVm1sMVJVbkpXRlZDZ0NsSm9GZlJ2YTViODJQTUVnN0FKQ0ttbFJLeSI7czozOiJ1cmwiO2E6MDp7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjUyOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYWRtaW4vY2F0YWxvZy9wcm9kdWN0cy9lZGl0LzQwIjtzOjU6InJvdXRlIjtzOjI3OiJhZG1pbi5jYXRhbG9nLnByb2R1Y3RzLmVkaXQiO31zOjY6ImxvY2FsZSI7czoyOiJlbiI7czo4OiJjdXJyZW5jeSI7czozOiJVU0QiO3M6NTI6ImxvZ2luX2FkbWluXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjIyOiJQSFBERUJVR0JBUl9TVEFDS19EQVRBIjthOjA6e319', 1793722991),
	('A31kgn7jbc14pxUWbZZTDihGuzrpyFvLbOigzJ2R', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36', 'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiaEx3NGJzWXpuNHduMWFjNGFIcVdjUndBQkl5OUt0NDI3TzNkd1kwMiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9mYXZpY29uLmljbyI7czo1OiJyb3V0ZSI7czozMDoic2hvcC5wcm9kdWN0X29yX2NhdGVnb3J5LmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MDp7fXM6NTI6ImxvZ2luX2FkbWluXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MjtzOjY6ImxvY2FsZSI7czoyOiJlbiI7czo4OiJjdXJyZW5jeSI7czozOiJVU0QiO3M6MjI6IlBIUERFQlVHQkFSX1NUQUNLX0RBVEEiO2E6MDp7fX0=', 1793721659);

-- Dumping structure for table bagisto_db.shipments
CREATE TABLE IF NOT EXISTS `shipments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_qty` int DEFAULT NULL,
  `total_weight` decimal(12,4) DEFAULT NULL,
  `carrier_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `carrier_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `track_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `email_sent` tinyint(1) NOT NULL DEFAULT '0',
  `customer_id` int unsigned DEFAULT NULL,
  `customer_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int unsigned NOT NULL,
  `order_address_id` int unsigned DEFAULT NULL,
  `inventory_source_id` int unsigned DEFAULT NULL,
  `inventory_source_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shipments_order_id_foreign` (`order_id`),
  KEY `shipments_inventory_source_id_foreign` (`inventory_source_id`),
  CONSTRAINT `shipments_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE SET NULL,
  CONSTRAINT `shipments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.shipments: ~0 rows (approximately)
INSERT INTO `shipments` (`id`, `status`, `total_qty`, `total_weight`, `carrier_code`, `carrier_title`, `track_number`, `email_sent`, `customer_id`, `customer_type`, `order_id`, `order_address_id`, `inventory_source_id`, `inventory_source_name`, `created_at`, `updated_at`) VALUES
	(1, NULL, 1, 0.3500, NULL, '', '', 1, 1, 'Webkul\\Customer\\Models\\Customer', 3, 12, 1, 'Default', '2026-09-29 07:55:01', '2026-09-29 07:55:05');

-- Dumping structure for table bagisto_db.shipment_items
CREATE TABLE IF NOT EXISTS `shipment_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT NULL,
  `price` decimal(12,4) DEFAULT '0.0000',
  `base_price` decimal(12,4) DEFAULT '0.0000',
  `total` decimal(12,4) DEFAULT '0.0000',
  `base_total` decimal(12,4) DEFAULT '0.0000',
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `product_id` int unsigned DEFAULT NULL,
  `product_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_item_id` int unsigned DEFAULT NULL,
  `shipment_id` int unsigned NOT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shipment_items_shipment_id_foreign` (`shipment_id`),
  CONSTRAINT `shipment_items_shipment_id_foreign` FOREIGN KEY (`shipment_id`) REFERENCES `shipments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.shipment_items: ~0 rows (approximately)
INSERT INTO `shipment_items` (`id`, `name`, `description`, `sku`, `qty`, `weight`, `price`, `base_price`, `total`, `base_total`, `price_incl_tax`, `base_price_incl_tax`, `product_id`, `product_type`, `order_item_id`, `shipment_id`, `additional`, `created_at`, `updated_at`) VALUES
	(1, 'Sony WF-1000XM5 Flagship Noise Canceling Earbuds Hi-Res LDAC', NULL, 'EAR-SONY-WF1000XM5', 1, 0.3500, 249.9900, 249.9900, 249.9900, 249.9900, 249.9900, 249.9900, 12, 'Webkul\\Product\\Models\\Product', 3, 1, '{"locale": "en", "cart_id": 3, "quantity": 1, "is_buy_now": "0", "product_id": "12"}', '2026-09-29 07:55:01', '2026-09-29 07:55:01');

-- Dumping structure for table bagisto_db.sitemaps
CREATE TABLE IF NOT EXISTS `sitemaps` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `additional` json DEFAULT NULL,
  `generated_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.sitemaps: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.sitemap_channels
CREATE TABLE IF NOT EXISTS `sitemap_channels` (
  `sitemap_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  UNIQUE KEY `sitemap_channels_sitemap_id_channel_id_unique` (`sitemap_id`,`channel_id`),
  KEY `sitemap_channels_channel_id_foreign` (`channel_id`),
  CONSTRAINT `sitemap_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sitemap_channels_sitemap_id_foreign` FOREIGN KEY (`sitemap_id`) REFERENCES `sitemaps` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.sitemap_channels: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.subscribers_list
CREATE TABLE IF NOT EXISTS `subscribers_list` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_subscribed` tinyint(1) NOT NULL DEFAULT '0',
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int unsigned DEFAULT NULL,
  `channel_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscribers_list_customer_id_foreign` (`customer_id`),
  KEY `subscribers_list_channel_id_foreign` (`channel_id`),
  CONSTRAINT `subscribers_list_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subscribers_list_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.subscribers_list: ~0 rows (approximately)
INSERT INTO `subscribers_list` (`id`, `email`, `is_subscribed`, `token`, `customer_id`, `channel_id`, `created_at`, `updated_at`) VALUES
	(1, 'hungnd13112004@gmail.com', 1, '6abba1b9808d1', NULL, 1, '2026-09-29 10:02:09', '2026-09-29 10:02:09');

-- Dumping structure for table bagisto_db.tax_categories
CREATE TABLE IF NOT EXISTS `tax_categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_categories_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.tax_categories: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.tax_categories_tax_rates
CREATE TABLE IF NOT EXISTS `tax_categories_tax_rates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tax_category_id` int unsigned NOT NULL,
  `tax_rate_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_map_index_unique` (`tax_category_id`,`tax_rate_id`),
  KEY `tax_categories_tax_rates_tax_rate_id_foreign` (`tax_rate_id`),
  CONSTRAINT `tax_categories_tax_rates_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tax_categories_tax_rates_tax_rate_id_foreign` FOREIGN KEY (`tax_rate_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.tax_categories_tax_rates: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.tax_rates
CREATE TABLE IF NOT EXISTS `tax_rates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_zip` tinyint(1) NOT NULL DEFAULT '0',
  `zip_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_from` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_to` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_rate` decimal(12,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_rates_identifier_unique` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.tax_rates: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.theme_sections
CREATE TABLE IF NOT EXISTS `theme_sections` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `theme_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'default',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int NOT NULL,
  `draft_sort_order` int DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `draft_status` tinyint(1) DEFAULT NULL,
  `channel_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `theme_customizations_channel_id_foreign` (`channel_id`),
  CONSTRAINT `theme_customizations_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.theme_sections: ~10 rows (approximately)
INSERT INTO `theme_sections` (`id`, `theme_code`, `type`, `name`, `sort_order`, `draft_sort_order`, `status`, `draft_status`, `channel_id`, `created_at`, `updated_at`) VALUES
	(2, 'default', 'static_content', 'Offer Information', 1, NULL, 1, NULL, 1, '2026-09-28 02:10:02', '2026-09-29 09:56:26'),
	(12, 'default', 'services_content', 'Services Content', 8, NULL, 1, NULL, 1, '2026-09-28 02:10:02', '2026-09-29 09:56:26'),
	(16, 'default', 'category_carousel', 'Categories', 3, NULL, 1, NULL, 1, '2026-09-28 07:37:06', '2026-09-29 09:56:26'),
	(18, 'default', 'product_carousel', 'Featured Products', 4, NULL, 1, NULL, 1, '2026-09-29 05:47:24', '2026-09-29 09:56:26'),
	(19, 'default', 'image_carousel', 'Banner', 2, NULL, 1, NULL, 1, '2026-09-29 06:07:02', '2026-09-29 09:56:26'),
	(22, 'default', 'static_content', 'Showroom Showcase', 7, NULL, 1, NULL, 1, '2026-09-29 06:51:18', '2026-09-29 09:56:26'),
	(23, 'default', 'product_carousel', 'Featured Audio & Earbuds', 5, NULL, 1, NULL, 1, '2026-09-29 06:56:46', '2026-09-29 09:56:26'),
	(25, 'default', 'product_carousel', 'Gaming Gear & Accessories', 6, NULL, 1, NULL, 1, '2026-09-29 06:59:51', '2026-09-29 09:56:26'),
	(26, 'default', 'static_content', 'Footer Info', 9, NULL, 0, NULL, 1, '2026-09-29 09:22:21', '2026-09-29 09:30:21'),
	(27, 'default', 'footer_links', 'Footer Links', 10, NULL, 1, NULL, 1, '2026-09-29 09:54:17', '2026-09-29 09:56:26');

-- Dumping structure for table bagisto_db.theme_section_translations
CREATE TABLE IF NOT EXISTS `theme_section_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `section_id` int unsigned NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` json DEFAULT NULL,
  `draft_options` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `theme_customization_id_foreign` (`section_id`),
  CONSTRAINT `theme_customization_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `theme_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.theme_section_translations: ~10 rows (approximately)
INSERT INTO `theme_section_translations` (`id`, `section_id`, `locale`, `options`, `draft_options`) VALUES
	(2, 2, 'en', '{"css": ".home-offer h1 {\\n  display: block;\\n  font-weight: 1000;\\n  text-align: center;\\n  font-size: 22px;\\n  font-family: \\"Playfair Display\\", \\"Times New Roman\\", serif;\\n  background-color: #e8edfe;\\n  padding-top: 20px;\\n  padding-bottom: 20px;\\n}\\n\\n@media (max-width: 768px) {\\n  .home-offer h1 {\\n    font-size: 18px;\\n    padding-top: 10px;\\n    padding-bottom: 10px;\\n  }\\n} \\n\\n@media (max-width: 525px) {\\n  .home-offer h1 {\\n    font-size: 14px;\\n    padding-top: 6px;\\n    padding-bottom: 6px;\\n  }\\n}", "html": "<div class=\\"home-offer\\"><h1>UP TO 40% OFF - PREMIER GAMING GEAR & TECH STORE</h1></div>"}', NULL),
	(7, 12, 'en', '{"services": [{"title": "Free Express Shipping", "description": "Fast & secure nationwide delivery", "service_icon": "icon-truck"}, {"title": "100% Genuine Gear", "description": "12-month official replacement warranty", "service_icon": "icon-product"}, {"title": "24/7 Customer Support", "description": "Dedicated assistance around the clock", "service_icon": "icon-support"}]}', NULL),
	(10, 16, 'en', '{"filters": []}', NULL),
	(12, 18, 'en', '{"title": "Featured Products", "filters": {"limit": "12", "featured": "1"}}', NULL),
	(13, 19, 'en', '{"images": [{"link": "", "image": "storage/themes/default/sections/19/acrpKL0hcAb66rOjph50MkDSCUY2SC2spx1zWq3K.webp", "title": ""}, {"link": "", "image": "storage/themes/default/sections/19/DPrdA7D9jK9Qxo2iwe46EoEWOx4B39FwcN5y3fbS.webp", "title": ""}, {"link": "", "image": "storage/themes/default/sections/19/jI6aLk19UTl7ado1Pu1tg8crvPHLTuLimJkCeYwg.webp", "title": ""}]}', NULL),
	(15, 22, 'en', '{"css": "/* Container wrapper */\\n.siuu-banner-wrapper {\\n  width: 100%;\\n  padding: 40px 16px;\\n  display: flex;\\n  justify-content: center;\\n  align-items: center;\\n  box-sizing: border-box;\\n}\\n\\n/* Promo banner frame */\\n.siuu-promo-banner {\\n  display: flex;\\n  flex-direction: row;\\n  width: 100%;\\n  max-width: 1240px;\\n  min-height: 420px;\\n  border-radius: 16px;\\n  overflow: hidden;\\n  box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.1);\\n  background-color: #0b111e;\\n}\\n\\n/* Left image column */\\n.siuu-banner-image {\\n  flex: 1.1;\\n  position: relative;\\n  background-color: #f1f5f9;\\n  overflow: hidden;\\n}\\n\\n.siuu-banner-image img {\\n  width: 100%;\\n  height: 100%;\\n  object-fit: cover;\\n  display: block;\\n}\\n\\n/* Right content column */\\n.siuu-banner-content {\\n  flex: 0.9;\\n  background-color: #0b111e;\\n  color: #ffffff;\\n  padding: 48px;\\n  display: flex;\\n  flex-direction: column;\\n  justify-content: center;\\n  align-items: flex-start;\\n  box-sizing: border-box;\\n}\\n\\n.siuu-tagline {\\n  font-size: 0.875rem;\\n  font-weight: 600;\\n  text-transform: uppercase;\\n  letter-spacing: 1.5px;\\n  color: #94a3b8;\\n  margin-bottom: 12px;\\n}\\n\\n.siuu-title {\\n  font-size: 2rem;\\n  line-height: 1.3;\\n  font-weight: 800;\\n  color: #ffffff;\\n  margin-bottom: 16px;\\n}\\n\\n.siuu-desc {\\n  font-size: 0.95rem;\\n  line-height: 1.6;\\n  color: #cbd5e1;\\n  margin-bottom: 28px;\\n}\\n\\n.siuu-btn {\\n  display: inline-block;\\n  background-color: #2563eb;\\n  color: #ffffff !important;\\n  font-size: 0.95rem;\\n  font-weight: 600;\\n  padding: 12px 28px;\\n  border-radius: 8px;\\n  text-decoration: none;\\n  transition: background-color 0.2s ease;\\n}\\n\\n.siuu-btn:hover {\\n  background-color: #1d4ed8;\\n}\\n\\n/* Mobile responsive */\\n@media (max-width: 768px) {\\n  .siuu-promo-banner {\\n    flex-direction: column;\\n  }\\n  .siuu-banner-image {\\n    min-height: 240px;\\n  }\\n  .siuu-banner-content {\\n    padding: 28px 20px;\\n  }\\n  .siuu-title {\\n    font-size: 1.5rem;\\n  }\\n}", "html": "<div class=\\"siuu-banner-wrapper\\">\\r\\n  <div class=\\"siuu-promo-banner\\">\\r\\n    \\r\\n    <div class=\\"siuu-banner-image\\">\\r\\n      <img src=\\"https://images.unsplash.com/photo-1615663245857-ac93bb7c39e7?q=80&amp;w=1000&amp;auto=format&amp;fit=crop\\" alt=\\"Mousepad &amp; Gaming Mouse ShopSiuu\\" />\\r\\n    </div>\\r\\n\\r\\n    \\r\\n    <div class=\\"siuu-banner-content\\">\\r\\n      <span class=\\"siuu-tagline\\">ShopSiuu Showroom</span>\\r\\n      <h2 class=\\"siuu-title\\">Don\'t just trust the hype,<br />feel the gear yourself</h2>\\r\\n      <p class=\\"siuu-desc\\">\\r\\n        Over 200 gaming gear models ready for hands-on trial and side-by-side comparison on-site. Friendly, zero-pressure advice.\\r\\n      </p>\\r\\n      <a href=\\"http://127.0.0.1:8000/search?featured=1\\" class=\\"siuu-btn\\">Visit ShopSiuu</a>\\r\\n    </div>\\r\\n  </div>\\r\\n</div>"}', NULL),
	(16, 23, 'en', '{"title": "Featured Audio & Earbuds", "filters": {"sort": "created_at-desc", "category_id": "5"}}', NULL),
	(18, 25, 'en', '{"title": "Gaming Gear & Accessories", "filters": {"category_id": "6"}}', NULL),
	(19, 26, 'en', '{"css": ".siuu-footer-wrapper {\\n  width: 100%;\\n  background-color: #f8fafc;\\n  border-top: 1px solid #e2e8f0;\\n  padding: 30px 20px 20px !important; /* Compact padding */\\n  margin-bottom: 0 !important;\\n  box-sizing: border-box;\\n}\\n\\n.siuu-footer-container {\\n  max-width: 1240px;\\n  margin: 0 auto;\\n  display: flex;\\n  justify-content: space-between;\\n  flex-wrap: wrap;\\n  gap: 20px;\\n}\\n\\n.siuu-footer-col {\\n  flex: 1 1 220px;\\n}\\n\\n.siuu-f-title {\\n  font-size: 0.95rem;\\n  font-weight: 700;\\n  color: #0f172a;\\n  margin-bottom: 12px;\\n  text-transform: uppercase;\\n}\\n\\n.siuu-f-desc, .siuu-f-info {\\n  font-size: 0.85rem;\\n  line-height: 1.5;\\n  color: #64748b;\\n  margin-bottom: 8px;\\n}\\n\\n.siuu-f-links {\\n  list-style: none;\\n  padding: 0;\\n  margin: 0;\\n}\\n\\n.siuu-f-links li {\\n  margin-bottom: 8px;\\n}\\n\\n.siuu-f-links a {\\n  text-decoration: none;\\n  color: #475569;\\n  font-size: 0.875rem;\\n  transition: color 0.2s;\\n}\\n\\n.siuu-f-links a:hover {\\n  color: #2563eb;\\n}\\n\\n/* Email subscribe form styling */\\n.siuu-f-form {\\n  display: flex !important;\\n  align-items: center;\\n  margin-top: 10px;\\n  margin-bottom: 10px;\\n  width: 100%;\\n  max-width: 280px;\\n}\\n\\n.siuu-f-input {\\n  flex: 1 !important;\\n  display: block !important;\\n  height: 38px !important;\\n  padding: 0 12px !important;\\n  border: 1px solid #cbd5e1 !important;\\n  border-radius: 6px 0 0 6px !important;\\n  outline: none !important;\\n  background-color: #ffffff !important;\\n  color: #0f172a !important;\\n  font-size: 0.875rem !important;\\n  box-sizing: border-box !important;\\n}\\n\\n.siuu-f-btn {\\n  height: 38px !important;\\n  background-color: #2563eb !important;\\n  color: #ffffff !important;\\n  border: none !important;\\n  padding: 0 16px !important;\\n  border-radius: 0 6px 6px 0 !important;\\n  cursor: pointer;\\n  font-weight: 600;\\n  font-size: 0.875rem !important;\\n  box-sizing: border-box !important;\\n  white-space: nowrap;\\n}\\n\\n.siuu-f-badge {\\n  font-size: 0.8rem;\\n  color: #16a34a;\\n  font-weight: 600;\\n}\\n\\n@media (max-width: 768px) {\\n  .siuu-footer-container {\\n    flex-direction: column;\\n  }\\n}", "html": "<div class=\\"siuu-footer-wrapper\\">\\r\\n  <div class=\\"siuu-footer-container\\">\\r\\n    \\r\\n    <div class=\\"siuu-footer-col\\">\\r\\n      <h3 class=\\"siuu-f-title\\">ShopSiuu Gaming Gear</h3>\\r\\n      <p class=\\"siuu-f-desc\\">Authorized distributor of authentic gaming gear & high-end peripherals.</p>\\r\\n      <p class=\\"siuu-f-info\\"><strong>Address:</strong> 127e Le Lu, Tan Phu District, Ho Chi Minh City</p>\\r\\n      <p class=\\"siuu-f-info\\"><strong>Hotline:</strong> 0909 xxx xxx (08:30 - 21:30)</p>\\r\\n    </div>\\r\\n\\r\\n    \\r\\n    <div class=\\"siuu-footer-col\\">\\r\\n      <h3 class=\\"siuu-f-title\\">Customer Support</h3>\\r\\n      <ul class=\\"siuu-f-links\\">\\r\\n        <li><a href=\\"/page/about-us\\">About Us</a></li>\\r\\n        <li><a href=\\"/page/customer-service\\">Customer Service</a></li>\\r\\n        <li><a href=\\"/page/terms-of-use\\">Terms of Use</a></li>\\r\\n      </ul>\\r\\n    </div>\\r\\n\\r\\n    \\r\\n    <div class=\\"siuu-footer-col\\">\\r\\n      <h3 class=\\"siuu-f-title\\">Store Policies</h3>\\r\\n      <ul class=\\"siuu-f-links\\">\\r\\n        <li><a href=\\"/page/privacy-policy\\">Privacy Policy</a></li>\\r\\n        <li><a href=\\"/page/shipping-policy\\">Shipping Policy</a></li>\\r\\n        <li><a href=\\"/page/return-policy\\">Return & Exchange Policy</a></li>\\r\\n      </ul>\\r\\n    </div>\\r\\n\\r\\n    \\r\\n    <div class=\\"siuu-footer-col\\">\\r\\n      <h3 class=\\"siuu-f-title\\">Newsletter</h3>\\r\\n      <p class=\\"siuu-f-desc\\">Subscribe to receive a 10% discount voucher for your first order.</p>\\r\\n      <div class=\\"siuu-f-form\\">\\r\\n        \\r\\n        <button type=\\"button\\" class=\\"siuu-f-btn\\">Subscribe</button>\\r\\n      </div>\\r\\n      <p class=\\"siuu-f-badge\\">✓ 100% Genuine Guarantee</p>\\r\\n    </div>\\r\\n  </div>\\r\\n</div>"}', NULL),
	(20, 27, 'en', '{"column_1": [{"url": "http://localhost:8000/page/about-us", "title": "About Us"}, {"url": "http://localhost:8000/page/customer-service", "title": "Customer Service"}, {"url": "http://localhost:8000/page/whats-new", "title": "New Arrivals & Trends"}, {"url": "http://localhost:8000/page/terms-of-use", "title": "Terms of Use"}, {"url": "http://localhost:8000/page/terms-conditions", "title": "Terms & Conditions"}], "column_2": [{"url": "http://localhost:8000/page/privacy-policy", "title": "Privacy Policy"}, {"url": "http://localhost:8000/page/payment-policy", "title": "Payment Policy"}, {"url": "http://localhost:8000/page/shipping-policy", "title": "Shipping Policy"}, {"url": "http://localhost:8000/page/return-policy", "title": "Return Policy"}, {"url": "http://localhost:8000/page/refund-policy", "title": "Refund Policy"}]}', NULL);

-- Dumping structure for table bagisto_db.url_rewrites
CREATE TABLE IF NOT EXISTS `url_rewrites` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entity_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `request_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `url_rewrites_et_rp_lc_idx` (`entity_type`,`request_path`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.url_rewrites: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.users: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.wishlist
CREATE TABLE IF NOT EXISTS `wishlist` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `customer_id` int unsigned NOT NULL,
  `item_options` json DEFAULT NULL,
  `moved_to_cart` date DEFAULT NULL,
  `shared` tinyint(1) DEFAULT NULL,
  `time_of_moving` date DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wishlist_channel_id_foreign` (`channel_id`),
  KEY `wishlist_product_id_foreign` (`product_id`),
  KEY `wishlist_customer_id_foreign` (`customer_id`),
  CONSTRAINT `wishlist_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.wishlist: ~0 rows (approximately)

-- Dumping structure for table bagisto_db.wishlist_items
CREATE TABLE IF NOT EXISTS `wishlist_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `customer_id` int unsigned NOT NULL,
  `additional` json DEFAULT NULL,
  `moved_to_cart` date DEFAULT NULL,
  `shared` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wishlist_items_channel_id_foreign` (`channel_id`),
  KEY `wishlist_items_product_id_foreign` (`product_id`),
  KEY `wishlist_items_customer_id_foreign` (`customer_id`),
  CONSTRAINT `wishlist_items_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_items_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bagisto_db.wishlist_items: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
