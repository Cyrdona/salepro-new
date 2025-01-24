

CREATE TABLE `accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_no` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `initial_balance` double DEFAULT NULL,
  `total_balance` double NOT NULL,
  `note` text DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'Bank Account',
  `parent_account_id` int(11) DEFAULT NULL,
  `is_payment` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO accounts VALUES("1","11111","Sales Accounts","1000","1000","this is first account","1","1","2018-12-18 02:58:02","2024-03-12 07:57:50","","Bank Account","","1");
INSERT INTO accounts VALUES("3","21211","Sa","","0","","0","1","2018-12-18 02:58:56","2019-01-20 09:59:06","","Bank Account","","1");
INSERT INTO accounts VALUES("5","bank-1","zuhair","100000","100000","","","1","2022-11-28 05:58:18","2022-11-28 05:58:18","","Bank Account","","1");



CREATE TABLE `adjustments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `document` varchar(191) DEFAULT NULL,
  `total_qty` double NOT NULL,
  `item` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO adjustments VALUES("1","adr-20250113-062710","2","","100","1","","2025-01-13 18:27:10","2025-01-13 18:27:10");
INSERT INTO adjustments VALUES("2","adr-20250113-062844","2","","24","1","","2025-01-13 18:28:44","2025-01-13 18:28:44");
INSERT INTO adjustments VALUES("3","adr-20250113-063150","2","","13","1","","2025-01-13 18:31:50","2025-01-13 18:31:50");



CREATE TABLE `attendances` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `employee_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `checkin` varchar(255) NOT NULL,
  `checkout` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `barcodes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `width` double(22,4) DEFAULT NULL,
  `height` double(22,4) DEFAULT NULL,
  `paper_width` double(22,4) DEFAULT NULL,
  `paper_height` double(22,4) DEFAULT NULL,
  `top_margin` double(22,4) DEFAULT NULL,
  `left_margin` double(22,4) DEFAULT NULL,
  `row_distance` double(22,4) DEFAULT NULL,
  `col_distance` double(22,4) DEFAULT NULL,
  `stickers_in_one_row` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `is_continuous` tinyint(1) NOT NULL DEFAULT 0,
  `stickers_in_one_sheet` int(11) DEFAULT NULL,
  `is_custom` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `billers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `company_name` varchar(191) NOT NULL,
  `vat_number` varchar(191) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `phone_number` varchar(191) NOT NULL,
  `address` varchar(191) NOT NULL,
  `city` varchar(191) NOT NULL,
  `state` varchar(191) DEFAULT NULL,
  `postal_code` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO billers VALUES("1","GRANT KOFFI","20250112100809.jpeg","BARDOS AFRICA","","synergytechnology93@gmail.com","2722536293","ABIDJAN 01","ABIDJAN","","","Côte d’Ivoire","1","2025-01-11 15:00:31","2025-01-12 22:08:09");
INSERT INTO billers VALUES("2","DO RITA CHRISTELLE","20250111043756.PNG","BARDOS","","synergytechnology9@gmail.com","0777265969","ABIDJAN 01- COCODY","ABIDJAN-ANGRE","","","Côte d’Ivoire","1","2025-01-11 16:37:56","2025-01-11 16:37:56");



CREATE TABLE `brands` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO brands VALUES("1","ALCOOL","","1","2025-01-11 14:37:54","2025-01-11 14:37:54");
INSERT INTO brands VALUES("2","SOLIBRA","","1","2025-01-12 14:00:36","2025-01-12 14:00:36");
INSERT INTO brands VALUES("3","SANBITTER","","1","2025-01-12 14:05:44","2025-01-12 14:05:44");
INSERT INTO brands VALUES("4","SANTERO","","1","2025-01-12 14:41:10","2025-01-12 14:41:10");
INSERT INTO brands VALUES("5","CIAO","","1","2025-01-12 15:05:51","2025-01-12 15:05:51");
INSERT INTO brands VALUES("6","NAUD","","1","2025-01-12 17:16:08","2025-01-12 17:16:08");
INSERT INTO brands VALUES("7","BOSCA","","1","2025-01-12 18:10:37","2025-01-12 18:10:37");
INSERT INTO brands VALUES("8","ROCCA DEI FORTI","","1","2025-01-12 19:35:47","2025-01-12 19:35:47");



CREATE TABLE `cash_registers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cash_in_hand` double NOT NULL,
  `user_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO cash_registers VALUES("1","0","47","1","1","2025-01-11 14:54:10","2025-01-11 14:54:10");
INSERT INTO cash_registers VALUES("2","0","1","2","0","2025-01-11 15:37:32","2025-01-15 18:14:09");
INSERT INTO cash_registers VALUES("3","0","1","2","1","2025-01-11 15:37:33","2025-01-11 15:37:33");
INSERT INTO cash_registers VALUES("4","2000","48","2","0","2025-01-11 16:39:49","2025-01-13 18:01:58");
INSERT INTO cash_registers VALUES("5","0","47","2","1","2025-01-11 16:46:10","2025-01-11 16:46:10");
INSERT INTO cash_registers VALUES("6","0","1","2","1","2025-01-12 12:22:29","2025-01-12 12:22:29");
INSERT INTO cash_registers VALUES("7","0","1","1","0","2025-01-12 14:19:35","2025-01-15 18:28:57");
INSERT INTO cash_registers VALUES("8","0","1","3","1","2025-01-12 14:20:22","2025-01-12 14:20:22");
INSERT INTO cash_registers VALUES("9","0","47","3","1","2025-01-12 14:30:33","2025-01-12 14:30:33");
INSERT INTO cash_registers VALUES("10","10000","48","2","1","2025-01-13 18:02:17","2025-01-13 18:02:17");
INSERT INTO cash_registers VALUES("11","0","49","3","1","2025-01-13 20:12:46","2025-01-13 20:12:46");
INSERT INTO cash_registers VALUES("12","0","50","3","1","2025-01-13 20:24:37","2025-01-13 20:24:37");



CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `woocommerce_category_id` int(11) DEFAULT NULL,
  `is_sync_disable` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO categories VALUES("1","LIQEUR","","","1","","","2025-01-11 14:38:18","2025-01-11 14:38:18");
INSERT INTO categories VALUES("2","BIERE","","","1","","","2025-01-12 14:01:01","2025-01-12 14:01:01");
INSERT INTO categories VALUES("3","SUCRERIE","","","1","","","2025-01-12 14:05:19","2025-01-12 14:05:19");
INSERT INTO categories VALUES("4","COCKTAIL","","","1","","","2025-01-12 14:42:35","2025-01-12 14:42:35");
INSERT INTO categories VALUES("5","VIN","","","1","","","2025-01-12 15:06:07","2025-01-12 15:06:07");
INSERT INTO categories VALUES("6","EAU","","","1","","","2025-01-12 15:53:06","2025-01-12 15:53:06");
INSERT INTO categories VALUES("7","CHAMPAGNE","","","1","","","2025-01-12 16:07:01","2025-01-12 16:07:01");



CREATE TABLE `challans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `courier_id` int(11) NOT NULL,
  `packing_slip_list` longtext NOT NULL,
  `amount_list` longtext NOT NULL,
  `cash_list` longtext DEFAULT NULL,
  `online_payment_list` longtext DEFAULT NULL,
  `cheque_list` longtext DEFAULT NULL,
  `delivery_charge_list` longtext DEFAULT NULL,
  `status_list` longtext DEFAULT NULL,
  `closing_date` date DEFAULT NULL,
  `created_by_id` int(11) NOT NULL,
  `closed_by_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `coupons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `amount` double NOT NULL,
  `minimum_amount` double DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `used` int(11) NOT NULL,
  `expired_date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `couriers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `currencies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `exchange_rate` double NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO currencies VALUES("1","Franc CFA","XOF","1","1","2020-11-01 00:22:58","2025-01-11 12:20:53");
INSERT INTO currencies VALUES("2","Euro","Euro","0.95","0","2020-11-01 01:29:12","2025-01-09 12:33:09");
INSERT INTO currencies VALUES("3","Bangladeshi Taka","BDT","110","0","2023-09-06 07:05:29","2023-09-06 07:05:46");
INSERT INTO currencies VALUES("4","Franc CFA","XOF","0","0","2025-01-09 12:32:52","2025-01-11 12:20:35");



CREATE TABLE `custom_fields` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `belongs_to` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `default_value` text DEFAULT NULL,
  `option_value` text DEFAULT NULL,
  `grid_value` int(11) NOT NULL,
  `is_table` tinyint(1) NOT NULL,
  `is_invoice` tinyint(1) NOT NULL,
  `is_required` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_disable` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `customer_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `percentage` varchar(191) NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO customer_groups VALUES("1","Clients nouveaux","0","1","2025-01-12 17:40:49","2025-01-12 17:40:49");
INSERT INTO customer_groups VALUES("2","Clients fidèles","5%","1","2025-01-12 17:41:24","2025-01-12 17:41:37");
INSERT INTO customer_groups VALUES("3","Clients VIP","10%","1","2025-01-12 17:41:55","2025-01-12 17:41:55");



CREATE TABLE `customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_group_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `company_name` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `phone_number` varchar(191) NOT NULL,
  `tax_no` varchar(191) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `postal_code` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `points` double DEFAULT NULL,
  `deposit` double DEFAULT NULL,
  `expense` double DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ecom` varchar(255) DEFAULT NULL,
  `dsf` varchar(255) DEFAULT 'df',
  `arabic_name` varchar(255) DEFAULT NULL,
  `admin` varchar(255) DEFAULT NULL,
  `franchise_location` varchar(255) DEFAULT NULL,
  `customer_type` varchar(255) DEFAULT 'Same as Customer',
  `customer_assigned_to` varchar(255) DEFAULT 'Advocate',
  `assigned` varchar(255) DEFAULT 'Advocate',
  `aaaaaaaa` varchar(255) DEFAULT 'aa',
  `district` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO customers VALUES("1","1","","Client de Passage","","","2722536293","","","","","","","401","","","1","2025-01-12 17:46:07","2025-01-16 00:48:12","","df","","","","Same as Customer","Advocate","Advocate","aa","");



CREATE TABLE `deliveries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `packing_slip_ids` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `courier_id` int(11) DEFAULT NULL,
  `address` text NOT NULL,
  `delivered_by` varchar(191) DEFAULT NULL,
  `recieved_by` varchar(191) DEFAULT NULL,
  `file` varchar(191) DEFAULT NULL,
  `note` varchar(191) DEFAULT NULL,
  `status` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `departments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `deposits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `customer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `discount_plan_customers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `discount_plan_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `discount_plan_discounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `discount_id` int(11) NOT NULL,
  `discount_plan_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `discount_plans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `discounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `applicable_for` varchar(191) NOT NULL,
  `product_list` longtext DEFAULT NULL,
  `valid_from` date NOT NULL,
  `valid_till` date NOT NULL,
  `type` varchar(191) NOT NULL,
  `value` double NOT NULL,
  `minimum_qty` double NOT NULL,
  `maximum_qty` double NOT NULL,
  `days` varchar(191) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `dso_alerts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_info` longtext NOT NULL,
  `number_of_products` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `dsr_alerts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `report_data` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO dsr_alerts VALUES("1","{"total_sales":1000,"total_cash":0,"total_expenses":0,"created_products":[],"updated_products":[{"id":1,"name":"BEAUFORT - Bi\u00e8re blonde l\u00e9g\u00e8re 33cl","code":"9501100003065","type":"standard","barcode_symbology":"C128","brand_id":2,"category_id":2,"unit_id":1,"purchase_unit_id":1,"sale_unit_id":1,"cost":430,"price":500,"wholesale_price":450,"qty":23,"alert_quantity":null,"daily_sale_objective":null,"promotion":null,"promotion_price":null,"starting_date":null,"last_date":null,"tax_id":null,"tax_method":1,"image":"202501120203181.PNG","file":null,"is_embeded":null,"is_variant":null,"is_batch":null,"is_diffPrice":null,"is_imei":null,"featured":1,"product_list":null,"variant_list":null,"qty_list":null,"price_list":null,"product_details":"","variant_option":null,"variant_value":null,"is_active":1,"is_sync_disable":null,"woocommerce_product_id":null,"woocommerce_media_id":null,"created_at":"2025-01-12 14:03:18","updated_at":"2025-01-16 00:50:39","deleted_at":null}]}","2025-01-16 01:57:58","2025-01-16 01:57:58");
INSERT INTO dsr_alerts VALUES("2","{"total_sales":1000,"total_cash":0,"total_expenses":0,"created_products":[],"updated_products":[{"id":1,"name":"BEAUFORT - Bi\u00e8re blonde l\u00e9g\u00e8re 33cl","code":"9501100003065","type":"standard","barcode_symbology":"C128","brand_id":2,"category_id":2,"unit_id":1,"purchase_unit_id":1,"sale_unit_id":1,"cost":430,"price":500,"wholesale_price":450,"qty":23,"alert_quantity":null,"daily_sale_objective":null,"promotion":null,"promotion_price":null,"starting_date":null,"last_date":null,"tax_id":null,"tax_method":1,"image":"202501120203181.PNG","file":null,"is_embeded":null,"is_variant":null,"is_batch":null,"is_diffPrice":null,"is_imei":null,"featured":1,"product_list":null,"variant_list":null,"qty_list":null,"price_list":null,"product_details":"","variant_option":null,"variant_value":null,"is_active":1,"is_sync_disable":null,"woocommerce_product_id":null,"woocommerce_media_id":null,"created_at":"2025-01-12 14:03:18","updated_at":"2025-01-16 00:50:39","deleted_at":null}]}","2025-01-16 02:04:25","2025-01-16 02:04:25");



CREATE TABLE `employees` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone_number` varchar(191) NOT NULL,
  `department_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `staff_id` varchar(191) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `expense_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `expenses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) NOT NULL,
  `expense_category_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `amount` double NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `external_services` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `details` longtext DEFAULT NULL,
  `module_status` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`module_status`)),
  `active` int(11) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO external_services VALUES("1","PayPal","payment","Client ID,Client Secret;abcd1234,wxyz5678","","0","","");
INSERT INTO external_services VALUES("2","Stripe","payment","Public Key,Private Key;efgh1234,stuv5678","","0","","");
INSERT INTO external_services VALUES("3","Razorpay","payment","Key,Secret;rzp_test_Y4MCcpHfZNU6rR,3Hr7SDqaZ0G5waN0jsLgsiLx","","1","","");
INSERT INTO external_services VALUES("4","Paystack","payment","public_Key,Secret_Key;pk_test_e8d220b7463d64569f0053e78534f38e6b10cf4a,sk_test_6d62cb976e1e0ab43f1e48b2934b0dfc7f32a1fe","","1","","");
INSERT INTO external_services VALUES("6","Mollie","payment","api_key;test_dHar4XY7LxsDOtmnkVtjNVWXLSlXsM","","0","","");
INSERT INTO external_services VALUES("7","Xendit","payment","secret_key,callback_token;xnd_development_aKJVKYbc4lHkEjcCLzWLrBsKs6jF6nbM6WaCMfnJerP3JW57CLis553XNRdDU,YPZxND92Mt8tdXntTYIEkRX802onZ5OcdKBUzycebuqYvN4n","","1","","");
INSERT INTO external_services VALUES("8","bkash","payment","Mode,app_key,app_secret,username,password;sandbox,0vWQuCRGiUX7EPVjQDr0EUAYtc,jcUNPBgbcqEDedNKdvE4G1cAK7D3hCjmJccNPZZBq96QIxxwAMEx,01770618567,D7DaC<*E*eG","","1","","");
INSERT INTO external_services VALUES("9","sslcommerz","payment","appkey,appsecret;12341234,asdfa23423","","1","","");
INSERT INTO external_services VALUES("10","Pesapal","payment","Mode,Consumer Key,Consumer Secret;sandbox,qkio1BGGYAXTu2JOfm7XSXNruoZsrqEW,osGQ364R49cXKeOYSpaOnT++rHs=","","1","","");



CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `general_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_title` varchar(191) NOT NULL,
  `site_logo` varchar(191) DEFAULT NULL,
  `is_rtl` tinyint(1) DEFAULT NULL,
  `currency` varchar(191) NOT NULL,
  `package_id` int(11) DEFAULT NULL,
  `subscription_type` varchar(255) DEFAULT NULL,
  `staff_access` varchar(191) NOT NULL,
  `without_stock` varchar(255) NOT NULL DEFAULT 'no',
  `date_format` varchar(191) NOT NULL,
  `developed_by` varchar(191) DEFAULT NULL,
  `invoice_format` varchar(191) DEFAULT NULL,
  `decimal` int(11) DEFAULT 2,
  `state` int(11) DEFAULT NULL,
  `theme` varchar(191) NOT NULL,
  `modules` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `currency_position` varchar(191) NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `expiry_type` varchar(255) NOT NULL DEFAULT 'days',
  `expiry_value` varchar(255) NOT NULL DEFAULT '0',
  `is_zatca` tinyint(1) DEFAULT NULL,
  `company_name` varchar(191) DEFAULT NULL,
  `vat_registration_number` varchar(191) DEFAULT NULL,
  `is_packing_slip` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO general_settings VALUES("1","Bardos Africa SARL","20250111114054.jpeg","0","1","","","all","no","d-m-Y","SYNERGY TECH","standard","0","1","default.css","manufacturing","2018-07-06 06:13:11","2025-01-11 12:33:00","prefix","","days","0","0","BARDOS AFRICA SARL","CI-ABJ-2020-B-09139","1");



CREATE TABLE `gift_card_recharges` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gift_card_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `gift_cards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `card_no` varchar(191) NOT NULL,
  `amount` double NOT NULL,
  `expense` double NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `holidays` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `note` text DEFAULT NULL,
  `is_approved` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `hrm_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `checkin` varchar(191) NOT NULL,
  `checkout` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO hrm_settings VALUES("1","10:00am","6:00pm","2019-01-02 02:20:08","2019-01-02 04:20:53");



CREATE TABLE `income_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `incomes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(255) NOT NULL,
  `income_category_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `amount` double NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `languages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO languages VALUES("1","en","2018-07-07 22:59:17","2019-12-24 17:34:20");



CREATE TABLE `mail_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `driver` varchar(191) NOT NULL,
  `host` varchar(191) NOT NULL,
  `port` varchar(191) NOT NULL,
  `from_address` varchar(191) NOT NULL,
  `from_name` varchar(191) NOT NULL,
  `username` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `encryption` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO mail_settings VALUES("1","smtp","smtp.gmail.com","587","bardosafrica@gmail.com","Bardos Africa SARL","bardosafrica@gmail.com","xamb wlkf xnvy gzib","TLS","2025-01-15 08:27:22","2025-01-15 08:27:22");



CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=265 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO migrations VALUES("1","2014_10_12_000000_create_users_table","1");
INSERT INTO migrations VALUES("2","2014_10_12_100000_create_password_resets_table","1");
INSERT INTO migrations VALUES("3","2018_02_17_060412_create_categories_table","1");
INSERT INTO migrations VALUES("4","2018_02_20_035727_create_brands_table","1");
INSERT INTO migrations VALUES("5","2018_02_25_100635_create_suppliers_table","1");
INSERT INTO migrations VALUES("6","2018_02_27_101619_create_warehouse_table","1");
INSERT INTO migrations VALUES("7","2018_03_03_040448_create_units_table","1");
INSERT INTO migrations VALUES("8","2018_03_04_041317_create_taxes_table","1");
INSERT INTO migrations VALUES("9","2018_03_10_061915_create_customer_groups_table","1");
INSERT INTO migrations VALUES("10","2018_03_10_090534_create_customers_table","1");
INSERT INTO migrations VALUES("11","2018_03_11_095547_create_billers_table","1");
INSERT INTO migrations VALUES("12","2018_04_05_054401_create_products_table","1");
INSERT INTO migrations VALUES("13","2018_04_06_133606_create_purchases_table","1");
INSERT INTO migrations VALUES("14","2018_04_06_154600_create_product_purchases_table","1");
INSERT INTO migrations VALUES("15","2018_04_06_154915_create_product_warhouse_table","1");
INSERT INTO migrations VALUES("16","2018_04_10_085927_create_sales_table","1");
INSERT INTO migrations VALUES("17","2018_04_10_090133_create_product_sales_table","1");
INSERT INTO migrations VALUES("18","2018_04_10_090254_create_payments_table","1");
INSERT INTO migrations VALUES("19","2018_04_10_090341_create_payment_with_cheque_table","1");
INSERT INTO migrations VALUES("20","2018_04_10_090509_create_payment_with_credit_card_table","1");
INSERT INTO migrations VALUES("21","2018_04_13_121436_create_quotation_table","1");
INSERT INTO migrations VALUES("22","2018_04_13_122324_create_product_quotation_table","1");
INSERT INTO migrations VALUES("23","2018_04_14_121802_create_transfers_table","1");
INSERT INTO migrations VALUES("24","2018_04_14_121913_create_product_transfer_table","1");
INSERT INTO migrations VALUES("25","2018_05_13_082847_add_payment_id_and_change_sale_id_to_payments_table","2");
INSERT INTO migrations VALUES("26","2018_05_13_090906_change_customer_id_to_payment_with_credit_card_table","3");
INSERT INTO migrations VALUES("27","2018_05_20_054532_create_adjustments_table","4");
INSERT INTO migrations VALUES("28","2018_05_20_054859_create_product_adjustments_table","4");
INSERT INTO migrations VALUES("29","2018_05_21_163419_create_returns_table","5");
INSERT INTO migrations VALUES("30","2018_05_21_163443_create_product_returns_table","5");
INSERT INTO migrations VALUES("31","2018_06_02_050905_create_roles_table","6");
INSERT INTO migrations VALUES("32","2018_06_02_073430_add_columns_to_users_table","7");
INSERT INTO migrations VALUES("33","2018_06_03_053738_create_permission_tables","8");
INSERT INTO migrations VALUES("36","2018_06_21_063736_create_pos_setting_table","9");
INSERT INTO migrations VALUES("37","2018_06_21_094155_add_user_id_to_sales_table","10");
INSERT INTO migrations VALUES("38","2018_06_21_101529_add_user_id_to_purchases_table","11");
INSERT INTO migrations VALUES("39","2018_06_21_103512_add_user_id_to_transfers_table","12");
INSERT INTO migrations VALUES("40","2018_06_23_061058_add_user_id_to_quotations_table","13");
INSERT INTO migrations VALUES("41","2018_06_23_082427_add_is_deleted_to_users_table","14");
INSERT INTO migrations VALUES("42","2018_06_25_043308_change_email_to_users_table","15");
INSERT INTO migrations VALUES("43","2018_07_06_115449_create_general_settings_table","16");
INSERT INTO migrations VALUES("44","2018_07_08_043944_create_languages_table","17");
INSERT INTO migrations VALUES("45","2018_07_11_102144_add_user_id_to_returns_table","18");
INSERT INTO migrations VALUES("46","2018_07_11_102334_add_user_id_to_payments_table","18");
INSERT INTO migrations VALUES("47","2018_07_22_130541_add_digital_to_products_table","19");
INSERT INTO migrations VALUES("49","2018_07_24_154250_create_deliveries_table","20");
INSERT INTO migrations VALUES("50","2018_08_16_053336_create_expense_categories_table","21");
INSERT INTO migrations VALUES("51","2018_08_17_115415_create_expenses_table","22");
INSERT INTO migrations VALUES("55","2018_08_18_050418_create_gift_cards_table","23");
INSERT INTO migrations VALUES("56","2018_08_19_063119_create_payment_with_gift_card_table","24");
INSERT INTO migrations VALUES("57","2018_08_25_042333_create_gift_card_recharges_table","25");
INSERT INTO migrations VALUES("58","2018_08_25_101354_add_deposit_expense_to_customers_table","26");
INSERT INTO migrations VALUES("59","2018_08_26_043801_create_deposits_table","27");
INSERT INTO migrations VALUES("60","2018_09_02_044042_add_keybord_active_to_pos_setting_table","28");
INSERT INTO migrations VALUES("61","2018_09_09_092713_create_payment_with_paypal_table","29");
INSERT INTO migrations VALUES("62","2018_09_10_051254_add_currency_to_general_settings_table","30");
INSERT INTO migrations VALUES("63","2018_10_22_084118_add_biller_and_store_id_to_users_table","31");
INSERT INTO migrations VALUES("65","2018_10_26_034927_create_coupons_table","32");
INSERT INTO migrations VALUES("66","2018_10_27_090857_add_coupon_to_sales_table","33");
INSERT INTO migrations VALUES("67","2018_11_07_070155_add_currency_position_to_general_settings_table","34");
INSERT INTO migrations VALUES("68","2018_11_19_094650_add_combo_to_products_table","35");
INSERT INTO migrations VALUES("69","2018_12_09_043712_create_accounts_table","36");
INSERT INTO migrations VALUES("70","2018_12_17_112253_add_is_default_to_accounts_table","37");
INSERT INTO migrations VALUES("71","2018_12_19_103941_add_account_id_to_payments_table","38");
INSERT INTO migrations VALUES("72","2018_12_20_065900_add_account_id_to_expenses_table","39");
INSERT INTO migrations VALUES("73","2018_12_20_082753_add_account_id_to_returns_table","40");
INSERT INTO migrations VALUES("74","2018_12_26_064330_create_return_purchases_table","41");
INSERT INTO migrations VALUES("75","2018_12_26_144210_create_purchase_product_return_table","42");
INSERT INTO migrations VALUES("76","2018_12_26_144708_create_purchase_product_return_table","43");
INSERT INTO migrations VALUES("77","2018_12_27_110018_create_departments_table","44");
INSERT INTO migrations VALUES("78","2018_12_30_054844_create_employees_table","45");
INSERT INTO migrations VALUES("79","2018_12_31_125210_create_payrolls_table","46");
INSERT INTO migrations VALUES("80","2018_12_31_150446_add_department_id_to_employees_table","47");
INSERT INTO migrations VALUES("81","2019_01_01_062708_add_user_id_to_expenses_table","48");
INSERT INTO migrations VALUES("82","2019_01_02_075644_create_hrm_settings_table","49");
INSERT INTO migrations VALUES("83","2019_01_02_090334_create_attendances_table","50");
INSERT INTO migrations VALUES("84","2019_01_27_160956_add_three_columns_to_general_settings_table","51");
INSERT INTO migrations VALUES("85","2019_02_15_183303_create_stock_counts_table","52");
INSERT INTO migrations VALUES("86","2019_02_17_101604_add_is_adjusted_to_stock_counts_table","53");
INSERT INTO migrations VALUES("87","2019_04_13_101707_add_tax_no_to_customers_table","54");
INSERT INTO migrations VALUES("89","2019_10_14_111455_create_holidays_table","55");
INSERT INTO migrations VALUES("90","2019_11_13_145619_add_is_variant_to_products_table","56");
INSERT INTO migrations VALUES("91","2019_11_13_150206_create_product_variants_table","57");
INSERT INTO migrations VALUES("92","2019_11_13_153828_create_variants_table","57");
INSERT INTO migrations VALUES("93","2019_11_25_134041_add_qty_to_product_variants_table","58");
INSERT INTO migrations VALUES("94","2019_11_25_134922_add_variant_id_to_product_purchases_table","58");
INSERT INTO migrations VALUES("95","2019_11_25_145341_add_variant_id_to_product_warehouse_table","58");
INSERT INTO migrations VALUES("96","2019_11_29_182201_add_variant_id_to_product_sales_table","59");
INSERT INTO migrations VALUES("97","2019_12_04_121311_add_variant_id_to_product_quotation_table","60");
INSERT INTO migrations VALUES("98","2019_12_05_123802_add_variant_id_to_product_transfer_table","61");
INSERT INTO migrations VALUES("100","2019_12_08_114954_add_variant_id_to_product_returns_table","62");
INSERT INTO migrations VALUES("101","2019_12_08_203146_add_variant_id_to_purchase_product_return_table","63");
INSERT INTO migrations VALUES("102","2020_02_28_103340_create_money_transfers_table","64");
INSERT INTO migrations VALUES("103","2020_07_01_193151_add_image_to_categories_table","65");
INSERT INTO migrations VALUES("105","2020_09_26_130426_add_user_id_to_deliveries_table","66");
INSERT INTO migrations VALUES("107","2020_10_11_125457_create_cash_registers_table","67");
INSERT INTO migrations VALUES("108","2020_10_13_155019_add_cash_register_id_to_sales_table","68");
INSERT INTO migrations VALUES("109","2020_10_13_172624_add_cash_register_id_to_returns_table","69");
INSERT INTO migrations VALUES("110","2020_10_17_212338_add_cash_register_id_to_payments_table","70");
INSERT INTO migrations VALUES("111","2020_10_18_124200_add_cash_register_id_to_expenses_table","71");
INSERT INTO migrations VALUES("112","2020_10_21_121632_add_developed_by_to_general_settings_table","72");
INSERT INTO migrations VALUES("113","2019_08_19_000000_create_failed_jobs_table","73");
INSERT INTO migrations VALUES("114","2020_10_30_135557_create_notifications_table","73");
INSERT INTO migrations VALUES("115","2020_11_01_044954_create_currencies_table","74");
INSERT INTO migrations VALUES("116","2020_11_01_140736_add_price_to_product_warehouse_table","75");
INSERT INTO migrations VALUES("117","2020_11_02_050633_add_is_diff_price_to_products_table","76");
INSERT INTO migrations VALUES("118","2020_11_09_055222_add_user_id_to_customers_table","77");
INSERT INTO migrations VALUES("119","2020_11_17_054806_add_invoice_format_to_general_settings_table","78");
INSERT INTO migrations VALUES("120","2021_02_10_074859_add_variant_id_to_product_adjustments_table","79");
INSERT INTO migrations VALUES("121","2021_03_07_093606_create_product_batches_table","80");
INSERT INTO migrations VALUES("122","2021_03_07_093759_add_product_batch_id_to_product_warehouse_table","80");
INSERT INTO migrations VALUES("123","2021_03_07_093900_add_product_batch_id_to_product_purchases_table","80");
INSERT INTO migrations VALUES("124","2021_03_11_132603_add_product_batch_id_to_product_sales_table","81");
INSERT INTO migrations VALUES("127","2021_03_25_125421_add_is_batch_to_products_table","82");
INSERT INTO migrations VALUES("128","2021_05_19_120127_add_product_batch_id_to_product_returns_table","82");
INSERT INTO migrations VALUES("130","2021_05_22_105611_add_product_batch_id_to_purchase_product_return_table","83");
INSERT INTO migrations VALUES("131","2021_05_23_124848_add_product_batch_id_to_product_transfer_table","84");
INSERT INTO migrations VALUES("132","2021_05_26_153106_add_product_batch_id_to_product_quotation_table","85");
INSERT INTO migrations VALUES("133","2021_06_08_213007_create_reward_point_settings_table","86");
INSERT INTO migrations VALUES("134","2021_06_16_104155_add_points_to_customers_table","87");
INSERT INTO migrations VALUES("135","2021_06_17_101057_add_used_points_to_payments_table","88");
INSERT INTO migrations VALUES("136","2021_07_06_132716_add_variant_list_to_products_table","89");
INSERT INTO migrations VALUES("137","2021_09_27_161141_add_is_imei_to_products_table","90");
INSERT INTO migrations VALUES("138","2021_09_28_170052_add_imei_number_to_product_warehouse_table","91");
INSERT INTO migrations VALUES("139","2021_09_28_170126_add_imei_number_to_product_purchases_table","91");
INSERT INTO migrations VALUES("140","2021_10_03_170652_add_imei_number_to_product_sales_table","92");
INSERT INTO migrations VALUES("141","2021_10_10_145214_add_imei_number_to_product_returns_table","93");
INSERT INTO migrations VALUES("142","2021_10_11_104504_add_imei_number_to_product_transfer_table","94");
INSERT INTO migrations VALUES("143","2021_10_12_160107_add_imei_number_to_purchase_product_return_table","95");
INSERT INTO migrations VALUES("144","2021_10_12_205146_add_is_rtl_to_general_settings_table","96");
INSERT INTO migrations VALUES("145","2021_10_23_142451_add_is_approve_to_payments_table","97");
INSERT INTO migrations VALUES("146","2022_01_13_191242_create_discount_plans_table","97");
INSERT INTO migrations VALUES("147","2022_01_14_174318_create_discount_plan_customers_table","97");
INSERT INTO migrations VALUES("148","2022_01_14_202439_create_discounts_table","98");
INSERT INTO migrations VALUES("149","2022_01_16_153506_create_discount_plan_discounts_table","98");
INSERT INTO migrations VALUES("150","2022_02_05_174210_add_order_discount_type_and_value_to_sales_table","99");
INSERT INTO migrations VALUES("154","2022_05_26_195506_add_daily_sale_objective_to_products_table","100");
INSERT INTO migrations VALUES("155","2022_05_28_104209_create_dso_alerts_table","101");
INSERT INTO migrations VALUES("156","2022_06_01_112100_add_is_embeded_to_products_table","102");
INSERT INTO migrations VALUES("157","2022_06_14_130505_add_sale_id_to_returns_table","103");
INSERT INTO migrations VALUES("159","2022_07_19_115504_add_variant_data_to_products_table","104");
INSERT INTO migrations VALUES("160","2022_07_25_194300_add_additional_cost_to_product_variants_table","104");
INSERT INTO migrations VALUES("161","2022_09_04_195610_add_purchase_id_to_return_purchases_table","105");
INSERT INTO migrations VALUES("162","2023_01_18_123842_alter_table_pos_setting","106");
INSERT INTO migrations VALUES("164","2023_01_18_125040_alter_table_general_settings","107");
INSERT INTO migrations VALUES("165","2023_01_18_133701_alter_table_pos_setting","108");
INSERT INTO migrations VALUES("166","2023_01_25_145309_add_expiry_date_to_general_settings_table","109");
INSERT INTO migrations VALUES("167","2023_02_23_125656_alter_table_sales","110");
INSERT INTO migrations VALUES("168","2023_02_26_124100_add_package_id_to_general_settings_table","111");
INSERT INTO migrations VALUES("169","2023_03_04_120325_create_custom_fields_table","111");
INSERT INTO migrations VALUES("170","2023_03_22_174352_add_currency_id_and_exchange_rate_to_returns_table","112");
INSERT INTO migrations VALUES("171","2023_03_27_114320_add_currency_id_and_exchange_rate_to_purchases_table","113");
INSERT INTO migrations VALUES("172","2023_03_27_132747_add_currency_id_and_exchange_rate_to_return_purchases_table","114");
INSERT INTO migrations VALUES("173","2023_04_25_150236_create_mail_settings_table","115");
INSERT INTO migrations VALUES("174","2023_05_13_125424_add_zatca_to_general_settings_table","116");
INSERT INTO migrations VALUES("175","2023_05_28_155540_create_tables_table","117");
INSERT INTO migrations VALUES("176","2023_05_29_115039_add_is_table_to_pos_setting_table","117");
INSERT INTO migrations VALUES("177","2023_05_29_115301_add_table_id_to_sales_table","117");
INSERT INTO migrations VALUES("178","2023_05_31_165049_add_queue_no_to_sales_table","117");
INSERT INTO migrations VALUES("190","2023_08_12_124016_add_staff_id_to_employees_table","121");
INSERT INTO migrations VALUES("192","2023_07_23_160254_create_couriers_table","122");
INSERT INTO migrations VALUES("193","2023_07_23_174343_add_courier_id_to_deliveries_table","122");
INSERT INTO migrations VALUES("194","2023_08_14_142608_add_is_active_to_currencies_table","122");
INSERT INTO migrations VALUES("195","2023_08_24_130203_change_columns_to_attendances_table","122");
INSERT INTO migrations VALUES("196","2023_09_10_134503_add_without_stock_to_general_settings_table","123");
INSERT INTO migrations VALUES("204","2023_09_26_211542_add_modules_to_general_settings_table","125");
INSERT INTO migrations VALUES("217","2023_10_15_124306_add_return_qty_to_product_sales_table","129");
INSERT INTO migrations VALUES("219","2023_12_03_235606_crete_external_services_table","131");
INSERT INTO migrations VALUES("221","2023_03_14_174658_add_subscription_type_to_general_setting_table","130");
INSERT INTO migrations VALUES("222","2024_02_04_131826_add_unit_cost_to_product_adjustments_table","132");
INSERT INTO migrations VALUES("223","2024_02_13_173126_change_modules_to_general_settings_table","133");
INSERT INTO migrations VALUES("224","2024_05_02_114215_add_payment_receiver_to_payments","134");
INSERT INTO migrations VALUES("225","2024_05_06_132553_create_sms_templates_table","135");
INSERT INTO migrations VALUES("226","2024_05_07_102225_add_send_sms_to_pos_setting_table","135");
INSERT INTO migrations VALUES("227","2024_05_07_132625_add_is_default_to_sms_templates_table","135");
INSERT INTO migrations VALUES("228","2024_05_08_112211_change_address_and_city_field_to_nullable_in_customers_table","135");
INSERT INTO migrations VALUES("229","2024_05_08_151050_add_is_default_ecommerce_columne_to_sms_templates_table","135");
INSERT INTO migrations VALUES("230","2024_05_20_182757_add_wholesale_price_to_products_table","136");
INSERT INTO migrations VALUES("231","2024_05_21_170500_add_is_sent_to_transfers_table","137");
INSERT INTO migrations VALUES("232","2023_02_05_132001_add_change_to_payments_table","138");
INSERT INTO migrations VALUES("233","2024_06_04_225113_create_income_categories_table","138");
INSERT INTO migrations VALUES("234","2024_06_04_225128_create_incomes_table","138");
INSERT INTO migrations VALUES("235","2024_06_29_131917_add_is_packing_slip_to_general_settings_table","138");
INSERT INTO migrations VALUES("236","2024_07_05_192531_create_packing_slips_table","138");
INSERT INTO migrations VALUES("237","2024_07_05_193002_create_packing_slip_products_table","138");
INSERT INTO migrations VALUES("238","2024_07_05_194501_add_is_packing_and_delivered_to_product_sales_table","138");
INSERT INTO migrations VALUES("239","2024_07_14_122245_add_delivery_id_to_packing_slips_table","138");
INSERT INTO migrations VALUES("240","2024_07_14_122415_add_variant_id_to_packing_slip_products_table","138");
INSERT INTO migrations VALUES("241","2024_07_14_122519_add_packing_slip_ids_to_deliveries_table","138");
INSERT INTO migrations VALUES("242","2024_07_16_125908_create_challans_table","138");
INSERT INTO migrations VALUES("245","2023_03_18_141537_add_woocommerce_category_id_to_categories_table","139");
INSERT INTO migrations VALUES("246","2023_03_20_214553_add_column_for_woocommerce_to_products_table","139");
INSERT INTO migrations VALUES("247","2023_03_20_214563_add_woocommerce_tax_id_to_taxes_table","139");
INSERT INTO migrations VALUES("248","2023_03_20_214565_add_woocommerce_order_id_to_sales_table","139");
INSERT INTO migrations VALUES("249","2023_08_01_134406_add_is_sync_disable_to_categories_table","139");
INSERT INTO migrations VALUES("250","2023_08_01_135252_add_product_status_to_woocommerce_settings_table","139");
INSERT INTO migrations VALUES("251","2024_08_12_112830_add_thermal_invoice_size_to_pos_setting","139");
INSERT INTO migrations VALUES("252","2024_08_14_133351_add_expiry_type_value_to_general_settings","139");
INSERT INTO migrations VALUES("253","2024_09_11_151744_add_return_qty_to_product_purchases_table","140");
INSERT INTO migrations VALUES("254","2024_09_12_162309_create_barcodes_table","140");
INSERT INTO migrations VALUES("255","2024_10_10_121312_add_data_to_payment_with_credit_card_table","141");
INSERT INTO migrations VALUES("256","2024_10_10_212501_alter_attendances_table","142");
INSERT INTO migrations VALUES("257","2024_10_10_213757_alter_attendances_table","142");
INSERT INTO migrations VALUES("258","2024_10_14_144917_change_column_to_nullable_to_payment_with_credit_card_table","142");
INSERT INTO migrations VALUES("259","2024_09_01_120515_create_productions_table","143");
INSERT INTO migrations VALUES("260","2024_09_01_120536_create_product_productions_table","143");
INSERT INTO migrations VALUES("261","2024_11_10_121521_add_code_and_type_to_accounts_table","144");
INSERT INTO migrations VALUES("262","2024_11_24_100926_add_module_status_to_external_services_table","145");
INSERT INTO migrations VALUES("263","2025_01_15_235054_create_dsr_alerts_table","146");
INSERT INTO migrations VALUES("264","2025_01_16_010406_add_deleted_at_to_products_table","146");



CREATE TABLE `money_transfers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) NOT NULL,
  `from_account_id` int(11) NOT NULL,
  `to_account_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO notifications VALUES("de221136-ed2a-491a-844c-ed9aecc4c3f7","App\Notifications\SendNotification","App\Models\User","52","{"sender_id":"51","receiver_id":"52","reminder_date":"2025-01-15","document_name":null,"message":"Salut"}","","2025-01-15 12:12:56","2025-01-15 12:12:56");



CREATE TABLE `packing_slip_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `packing_slip_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `packing_slips` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(255) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `delivery_id` int(11) DEFAULT NULL,
  `amount` double NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO password_resets VALUES("ashfaqdev.php@gmail.com","$2y$10$plxHOMxChJlHd9t6FQkoN.4dXMdtZ9fE5tXBBItzjxB1R5JF9OpbO","2023-07-15 11:31:30");



CREATE TABLE `payment_with_cheque` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) NOT NULL,
  `cheque_no` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `payment_with_credit_card` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer_stripe_id` varchar(191) DEFAULT NULL,
  `charge_id` varchar(191) NOT NULL,
  `data` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `payment_with_gift_card` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) NOT NULL,
  `gift_card_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `payment_with_paypal` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) NOT NULL,
  `transaction_id` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_reference` varchar(191) NOT NULL,
  `user_id` int(11) NOT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `payment_receiver` varchar(255) DEFAULT NULL,
  `amount` double NOT NULL,
  `used_points` double DEFAULT NULL,
  `change` double DEFAULT NULL,
  `paying_method` varchar(191) NOT NULL,
  `payment_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO payments VALUES("1","ppr-20250112-020319","1","1","","","0","","43000","","0","Cash","","2025-01-12 14:03:19","2025-01-12 14:03:19");
INSERT INTO payments VALUES("2","ppr-20250112-025902","1","2","","","0","","4500","","0","Cash","","2025-01-12 14:59:02","2025-01-12 14:59:02");
INSERT INTO payments VALUES("3","ppr-20250112-030907","1","3","","","0","","800","","0","Cash","","2025-01-12 15:09:07","2025-01-12 15:09:07");
INSERT INTO payments VALUES("4","ppr-20250112-031131","1","4","","","0","","800","","0","Cash","","2025-01-12 15:11:31","2025-01-12 15:11:31");
INSERT INTO payments VALUES("5","ppr-20250112-031339","1","5","","","0","","800","","0","Cash","","2025-01-12 15:13:39","2025-01-12 15:13:39");
INSERT INTO payments VALUES("6","ppr-20250112-031616","1","6","","","0","","800","","0","Cash","","2025-01-12 15:16:16","2025-01-12 15:16:16");
INSERT INTO payments VALUES("7","ppr-20250112-032018","1","7","","","0","","800","","0","Cash","","2025-01-12 15:20:18","2025-01-12 15:20:18");
INSERT INTO payments VALUES("8","ppr-20250112-032228","1","8","","","0","","1500","","0","Cash","","2025-01-12 15:22:28","2025-01-12 15:22:28");
INSERT INTO payments VALUES("9","ppr-20250112-032825","1","9","","","0","","800","","0","Cash","","2025-01-12 15:28:25","2025-01-12 15:28:25");
INSERT INTO payments VALUES("10","ppr-20250112-033003","1","10","","","0","","800","","0","Cash","","2025-01-12 15:30:03","2025-01-12 15:30:03");
INSERT INTO payments VALUES("11","ppr-20250112-033305","1","11","","","0","","600","","0","Cash","","2025-01-12 15:33:05","2025-01-12 15:33:05");
INSERT INTO payments VALUES("12","ppr-20250112-033540","1","12","","","0","","600","","0","Cash","","2025-01-12 15:35:40","2025-01-12 15:35:40");
INSERT INTO payments VALUES("13","ppr-20250112-034313","1","13","","","0","","450","","0","Cash","","2025-01-12 15:43:13","2025-01-12 15:43:13");
INSERT INTO payments VALUES("14","ppr-20250112-034535","1","14","","","0","","850","","0","Cash","","2025-01-12 15:45:35","2025-01-12 15:45:35");
INSERT INTO payments VALUES("15","ppr-20250112-035132","1","15","","","0","","1500","","0","Cash","","2025-01-12 15:51:32","2025-01-12 15:51:32");
INSERT INTO payments VALUES("16","ppr-20250112-035351","1","16","","","0","","8000","","0","Cash","","2025-01-12 15:53:51","2025-01-12 15:53:51");
INSERT INTO payments VALUES("17","ppr-20250112-035659","1","17","","","0","","80","","0","Cash","","2025-01-12 15:56:59","2025-01-12 15:56:59");
INSERT INTO payments VALUES("18","ppr-20250112-035922","1","18","","","0","","1500","","0","Cash","","2025-01-12 15:59:22","2025-01-12 15:59:22");
INSERT INTO payments VALUES("19","ppr-20250112-040503","1","19","","","0","","10500","","0","Cash","","2025-01-12 16:05:03","2025-01-12 16:05:03");
INSERT INTO payments VALUES("20","ppr-20250112-041133","1","20","","","0","","3500","","0","Cash","","2025-01-12 16:11:33","2025-01-12 16:11:33");
INSERT INTO payments VALUES("21","ppr-20250112-041404","1","21","","","0","","8900","","0","Cash","","2025-01-12 16:14:04","2025-01-12 16:14:04");
INSERT INTO payments VALUES("22","ppr-20250112-041558","1","22","","","0","","9000","","0","Cash","","2025-01-12 16:15:58","2025-01-12 16:15:58");
INSERT INTO payments VALUES("23","ppr-20250112-041829","1","23","","","0","","7000","","0","Cash","","2025-01-12 16:18:29","2025-01-12 16:18:29");
INSERT INTO payments VALUES("24","ppr-20250112-042020","1","24","","","0","","4500","","0","Cash","","2025-01-12 16:20:20","2025-01-12 16:20:20");
INSERT INTO payments VALUES("25","ppr-20250112-042213","1","25","","","0","","4500","","0","Cash","","2025-01-12 16:22:13","2025-01-12 16:22:13");
INSERT INTO payments VALUES("26","ppr-20250112-042401","1","26","","","0","","4500","","0","Cash","","2025-01-12 16:24:01","2025-01-12 16:24:01");
INSERT INTO payments VALUES("27","ppr-20250112-042654","1","27","","","0","","7500","","0","Cash","","2025-01-12 16:26:54","2025-01-12 16:26:54");
INSERT INTO payments VALUES("28","ppr-20250112-042904","1","28","","","0","","8000","","0","Cash","","2025-01-12 16:29:04","2025-01-12 16:29:04");
INSERT INTO payments VALUES("29","ppr-20250112-043722","1","29","","","0","","8000","","0","Cash","","2025-01-12 16:37:22","2025-01-12 16:37:22");
INSERT INTO payments VALUES("30","ppr-20250112-044550","1","30","","","0","","8000","","0","Cash","","2025-01-12 16:45:50","2025-01-12 16:45:50");
INSERT INTO payments VALUES("31","ppr-20250112-044849","1","31","","","0","","8000","","0","Cash","","2025-01-12 16:48:49","2025-01-12 16:48:49");
INSERT INTO payments VALUES("32","ppr-20250112-045142","1","32","","","0","","8000","","0","Cash","","2025-01-12 16:51:42","2025-01-12 16:51:42");
INSERT INTO payments VALUES("33","ppr-20250112-045455","1","33","","","0","","8000","","0","Cash","","2025-01-12 16:54:55","2025-01-12 16:54:55");
INSERT INTO payments VALUES("34","ppr-20250112-045806","1","34","","","0","","8000","","0","Cash","","2025-01-12 16:58:06","2025-01-12 16:58:06");
INSERT INTO payments VALUES("35","ppr-20250112-050248","1","35","","","0","","4848","","0","Cash","","2025-01-12 17:02:48","2025-01-12 17:02:48");
INSERT INTO payments VALUES("36","ppr-20250112-050558","1","36","","","0","","7740","","0","Cash","","2025-01-12 17:05:58","2025-01-12 17:05:58");
INSERT INTO payments VALUES("37","ppr-20250112-051156","1","37","","","0","","8100","","0","Cash","","2025-01-12 17:11:56","2025-01-12 17:11:56");
INSERT INTO payments VALUES("38","ppr-20250112-051414","1","38","","","0","","8400","","0","Cash","","2025-01-12 17:14:14","2025-01-12 17:14:14");
INSERT INTO payments VALUES("39","ppr-20250112-051757","1","39","","","0","","30000","","0","Cash","","2025-01-12 17:17:57","2025-01-12 17:17:57");
INSERT INTO payments VALUES("40","ppr-20250112-052106","1","40","","","0","","35000","","0","Cash","","2025-01-12 17:21:06","2025-01-12 17:21:06");
INSERT INTO payments VALUES("41","ppr-20250112-052609","1","41","","","0","","7122","","0","Cash","","2025-01-12 17:26:09","2025-01-12 17:26:09");
INSERT INTO payments VALUES("42","ppr-20250112-052742","1","42","","","0","","7000","","0","Cash","","2025-01-12 17:27:42","2025-01-12 17:27:42");
INSERT INTO payments VALUES("45","ppr-20250112-061114","47","43","","","0","","7821","","0","Cash","","2025-01-12 18:11:14","2025-01-12 18:11:14");
INSERT INTO payments VALUES("46","ppr-20250112-061654","47","44","","","0","","4550","","0","Cash","","2025-01-12 18:16:54","2025-01-12 18:16:54");
INSERT INTO payments VALUES("47","ppr-20250112-062009","47","45","","","0","","28000","","0","Cash","","2025-01-12 18:20:09","2025-01-12 18:20:09");
INSERT INTO payments VALUES("48","ppr-20250112-062426","47","46","","","0","","30000","","0","Cash","","2025-01-12 18:24:26","2025-01-12 18:24:26");
INSERT INTO payments VALUES("49","ppr-20250112-062704","47","47","","","0","","3000","","0","Cash","","2025-01-12 18:27:04","2025-01-12 18:27:04");
INSERT INTO payments VALUES("50","ppr-20250112-063049","47","48","","","0","","45000","","0","Cash","","2025-01-12 18:30:49","2025-01-12 18:30:49");
INSERT INTO payments VALUES("51","ppr-20250112-063433","47","49","","","0","","15000","","0","Cash","","2025-01-12 18:34:33","2025-01-12 18:34:33");
INSERT INTO payments VALUES("52","ppr-20250112-063651","47","50","","","0","","15000","","0","Cash","","2025-01-12 18:36:51","2025-01-12 18:36:51");
INSERT INTO payments VALUES("53","ppr-20250112-064828","47","51","","","0","","4500","","0","Cash","","2025-01-12 18:48:28","2025-01-12 18:48:28");
INSERT INTO payments VALUES("54","ppr-20250112-064954","47","52","","","0","","4500","","0","Cash","","2025-01-12 18:49:54","2025-01-12 18:49:54");
INSERT INTO payments VALUES("55","ppr-20250112-065146","47","53","","","0","","4500","","0","Cash","","2025-01-12 18:51:46","2025-01-12 18:51:46");
INSERT INTO payments VALUES("56","ppr-20250112-065333","47","54","","","0","","4500","","0","Cash","","2025-01-12 18:53:33","2025-01-12 18:53:33");
INSERT INTO payments VALUES("57","ppr-20250112-065728","47","55","","","0","","4500","","0","Cash","","2025-01-12 18:57:28","2025-01-12 18:57:28");
INSERT INTO payments VALUES("58","ppr-20250112-065959","47","56","","","0","","4500","","0","Cash","","2025-01-12 18:59:59","2025-01-12 18:59:59");
INSERT INTO payments VALUES("59","ppr-20250112-070236","47","57","","","0","","4500","","0","Cash","","2025-01-12 19:02:36","2025-01-12 19:02:36");
INSERT INTO payments VALUES("60","ppr-20250112-070411","47","58","","","0","","4500","","0","Cash","","2025-01-12 19:04:11","2025-01-12 19:04:11");
INSERT INTO payments VALUES("61","ppr-20250112-070707","47","59","","","0","","4500","","0","Cash","","2025-01-12 19:07:07","2025-01-12 19:07:07");
INSERT INTO payments VALUES("62","ppr-20250112-070843","47","60","","","0","","4500","","0","Cash","","2025-01-12 19:08:43","2025-01-12 19:08:43");
INSERT INTO payments VALUES("63","ppr-20250112-071044","47","61","","","0","","4500","","0","Cash","","2025-01-12 19:10:44","2025-01-12 19:10:44");
INSERT INTO payments VALUES("64","ppr-20250112-071221","47","62","","","0","","4500","","0","Cash","","2025-01-12 19:12:21","2025-01-12 19:12:21");
INSERT INTO payments VALUES("65","ppr-20250112-072139","47","63","","","0","","4500","","0","Cash","","2025-01-12 19:21:39","2025-01-12 19:21:39");
INSERT INTO payments VALUES("66","ppr-20250112-072314","47","64","","","0","","4500","","0","Cash","","2025-01-12 19:23:14","2025-01-12 19:23:14");
INSERT INTO payments VALUES("67","ppr-20250112-072430","47","65","","","0","","4500","","0","Cash","","2025-01-12 19:24:30","2025-01-12 19:24:30");
INSERT INTO payments VALUES("68","ppr-20250112-072623","47","66","","","0","","4500","","0","Cash","","2025-01-12 19:26:23","2025-01-12 19:26:23");
INSERT INTO payments VALUES("69","ppr-20250112-074250","47","67","","","0","","4500","","0","Cash","","2025-01-12 19:42:50","2025-01-12 19:42:50");
INSERT INTO payments VALUES("70","ppr-20250112-074617","47","68","","","0","","4500","","0","Cash","","2025-01-12 19:46:17","2025-01-12 19:46:17");
INSERT INTO payments VALUES("71","ppr-20250112-074754","47","69","","","0","","4500","","0","Cash","","2025-01-12 19:47:54","2025-01-12 19:47:54");
INSERT INTO payments VALUES("72","ppr-20250112-075012","47","70","","","0","","4500","","0","Cash","","2025-01-12 19:50:12","2025-01-12 19:50:12");
INSERT INTO payments VALUES("73","ppr-20250112-075155","47","71","","","0","","4500","","0","Cash","","2025-01-12 19:51:55","2025-01-12 19:51:55");
INSERT INTO payments VALUES("74","ppr-20250112-075501","47","72","","","0","","4500","","0","Cash","","2025-01-12 19:55:01","2025-01-12 19:55:01");
INSERT INTO payments VALUES("75","ppr-20250112-080020","47","73","","","0","","4500","","0","Cash","","2025-01-12 20:00:20","2025-01-12 20:00:20");
INSERT INTO payments VALUES("76","ppr-20250112-080208","47","74","","","0","","4500","","0","Cash","","2025-01-12 20:02:08","2025-01-12 20:02:08");
INSERT INTO payments VALUES("77","ppr-20250112-080403","47","75","","","0","","4500","","0","Cash","","2025-01-12 20:04:03","2025-01-12 20:04:03");
INSERT INTO payments VALUES("78","ppr-20250112-080646","47","76","","","0","","4500","","0","Cash","","2025-01-12 20:06:46","2025-01-12 20:06:46");
INSERT INTO payments VALUES("79","ppr-20250112-080905","47","77","","","0","","2500","","0","Cash","","2025-01-12 20:09:05","2025-01-12 20:09:05");
INSERT INTO payments VALUES("80","ppr-20250112-081054","47","78","","","0","","2500","","0","Cash","","2025-01-12 20:10:54","2025-01-12 20:10:54");
INSERT INTO payments VALUES("81","ppr-20250112-081229","47","79","","","0","","2500","","0","Cash","","2025-01-12 20:12:29","2025-01-12 20:12:29");
INSERT INTO payments VALUES("82","ppr-20250112-081444","47","80","","","0","","1500","","0","Cash","","2025-01-12 20:14:44","2025-01-12 20:14:44");
INSERT INTO payments VALUES("83","ppr-20250112-081742","47","81","","","0","","4500","","0","Cash","","2025-01-12 20:17:42","2025-01-12 20:17:42");
INSERT INTO payments VALUES("84","ppr-20250112-082153","47","82","","","0","","7000","","0","Cash","","2025-01-12 20:21:53","2025-01-12 20:21:53");
INSERT INTO payments VALUES("85","ppr-20250112-082330","47","83","","","0","","8500","","0","Cash","","2025-01-12 20:23:30","2025-01-12 20:23:30");
INSERT INTO payments VALUES("86","ppr-20250112-082730","47","84","","","0","","3500","","0","Cash","","2025-01-12 20:27:30","2025-01-12 20:27:30");
INSERT INTO payments VALUES("87","ppr-20250112-083237","47","85","","","0","","7000","","0","Cash","","2025-01-12 20:32:37","2025-01-12 20:32:37");
INSERT INTO payments VALUES("88","ppr-20250112-083439","47","86","","","0","","4500","","0","Cash","","2025-01-12 20:34:39","2025-01-12 20:34:39");
INSERT INTO payments VALUES("89","ppr-20250112-083805","47","87","","","0","","4500","","0","Cash","","2025-01-12 20:38:05","2025-01-12 20:38:05");
INSERT INTO payments VALUES("90","ppr-20250112-084114","47","88","","","0","","4500","","0","Cash","","2025-01-12 20:41:14","2025-01-12 20:41:14");
INSERT INTO payments VALUES("91","ppr-20250112-084254","47","89","","","0","","4500","","0","Cash","","2025-01-12 20:42:54","2025-01-12 20:42:54");
INSERT INTO payments VALUES("92","ppr-20250112-084513","47","90","","","0","","4500","","0","Cash","","2025-01-12 20:45:13","2025-01-12 20:45:13");
INSERT INTO payments VALUES("93","ppr-20250112-090239","47","91","","","0","","850","","0","Cash","","2025-01-12 21:02:39","2025-01-12 21:02:39");
INSERT INTO payments VALUES("97","ppr-20250114-113655","47","96","","","0","","28000","","0","Cash","","2025-01-14 11:36:55","2025-01-14 11:36:55");
INSERT INTO payments VALUES("98","ppr-20250114-114010","47","97","","","0","","147000","","0","Cash","","2025-01-14 11:40:10","2025-01-14 11:40:10");
INSERT INTO payments VALUES("99","ppr-20250114-115524","47","98","","","0","","24390","","0","Cash","","2025-01-14 11:55:24","2025-01-14 11:55:24");
INSERT INTO payments VALUES("100","ppr-20250114-115836","47","99","","","0","","14655","","0","Cash","","2025-01-14 11:58:36","2025-01-14 11:58:36");
INSERT INTO payments VALUES("101","ppr-20250114-120043","47","100","","","0","","22725","","0","Cash","","2025-01-14 12:00:43","2025-01-14 12:00:43");
INSERT INTO payments VALUES("102","ppr-20250114-120409","47","101","","","0","","10815","","0","Cash","","2025-01-14 12:04:09","2025-01-14 12:04:09");
INSERT INTO payments VALUES("103","ppr-20250114-120545","47","102","","","0","","21820","","0","Cash","","2025-01-14 12:05:45","2025-01-14 12:05:45");
INSERT INTO payments VALUES("104","ppr-20250114-121147","47","103","","","0","","26184","","0","Cash","","2025-01-14 12:11:47","2025-01-14 12:11:47");
INSERT INTO payments VALUES("105","ppr-20250114-122546","48","104","","","0","","5252","","0","Cash","","2025-01-14 12:25:46","2025-01-14 12:25:46");
INSERT INTO payments VALUES("106","ppr-20250114-123048","48","105","","","0","","59500","","0","Cash","","2025-01-14 12:30:48","2025-01-14 12:30:48");
INSERT INTO payments VALUES("107","ppr-20250114-123502","48","106","","","0","","7000","","0","Cash","","2025-01-14 12:35:02","2025-01-14 12:35:02");
INSERT INTO payments VALUES("108","ppr-20250114-123800","48","107","","","0","","54000","","0","Cash","","2025-01-14 12:38:00","2025-01-14 12:38:00");
INSERT INTO payments VALUES("109","ppr-20250114-124211","48","108","","","0","","7000","","0","Cash","","2025-01-14 12:42:11","2025-01-14 12:42:11");
INSERT INTO payments VALUES("110","ppr-20250114-124415","48","109","","","0","","35000","","0","Cash","","2025-01-14 12:44:15","2025-01-14 12:44:15");
INSERT INTO payments VALUES("111","ppr-20250114-124621","48","110","","","0","","49500","","0","Cash","","2025-01-14 12:46:21","2025-01-14 12:46:21");
INSERT INTO payments VALUES("112","ppr-20250114-125315","48","111","","","0","","6500","","0","Cash","","2025-01-14 12:53:15","2025-01-14 12:53:15");
INSERT INTO payments VALUES("113","ppr-20250114-010649","48","112","","","0","","5600","","0","Cash","","2025-01-14 13:06:49","2025-01-14 13:06:49");
INSERT INTO payments VALUES("114","ppr-20250114-011016","48","113","","","0","","6500","","0","Cash","","2025-01-14 13:10:16","2025-01-14 13:10:16");
INSERT INTO payments VALUES("115","ppr-20250114-011320","48","114","","","0","","24000","","0","Cash","","2025-01-14 13:13:20","2025-01-14 13:13:20");
INSERT INTO payments VALUES("116","ppr-20250114-011726","48","115","","","0","","13500","","0","Cash","","2025-01-14 13:17:26","2025-01-14 13:17:26");
INSERT INTO payments VALUES("117","ppr-20250114-011939","48","116","","","0","","1800","","0","Cash","","2025-01-14 13:19:39","2025-01-14 13:19:39");
INSERT INTO payments VALUES("118","ppr-20250114-012157","48","117","","","0","","1350","","0","Cash","","2025-01-14 13:21:57","2025-01-14 13:21:57");
INSERT INTO payments VALUES("119","ppr-20250114-012648","48","118","","","0","","9900","","0","Cash","","2025-01-14 13:26:48","2025-01-14 13:26:48");
INSERT INTO payments VALUES("120","ppr-20250114-013327","48","119","","","0","","3500","","0","Cash","","2025-01-14 13:33:27","2025-01-14 13:33:27");
INSERT INTO payments VALUES("121","ppr-20250115-044955","1","120","","","0","","280000","","0","Cash","","2025-01-15 16:49:55","2025-01-15 16:49:55");
INSERT INTO payments VALUES("123","spr-20250115-054511","1","","7","2","1","","500","","0","Cash","","2025-01-15 17:45:11","2025-01-15 17:45:11");
INSERT INTO payments VALUES("124","spr-20250115-054639","1","","8","2","1","","7500","","0","Cash","","2025-01-15 17:46:39","2025-01-15 17:46:39");



CREATE TABLE `payrolls` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `paying_method` varchar(191) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO permissions VALUES("4","products-edit","web","2018-06-03 01:00:09","2018-06-03 01:00:09");
INSERT INTO permissions VALUES("5","products-delete","web","2018-06-03 22:54:22","2018-06-03 22:54:22");
INSERT INTO permissions VALUES("6","products-add","web","2018-06-04 00:34:14","2018-06-04 00:34:14");
INSERT INTO permissions VALUES("7","products-index","web","2018-06-04 03:34:27","2018-06-04 03:34:27");
INSERT INTO permissions VALUES("8","purchases-index","web","2018-06-04 08:03:19","2018-06-04 08:03:19");
INSERT INTO permissions VALUES("9","purchases-add","web","2018-06-04 08:12:25","2018-06-04 08:12:25");
INSERT INTO permissions VALUES("10","purchases-edit","web","2018-06-04 09:47:36","2018-06-04 09:47:36");
INSERT INTO permissions VALUES("11","purchases-delete","web","2018-06-04 09:47:36","2018-06-04 09:47:36");
INSERT INTO permissions VALUES("12","sales-index","web","2018-06-04 10:49:08","2018-06-04 10:49:08");
INSERT INTO permissions VALUES("13","sales-add","web","2018-06-04 10:49:52","2018-06-04 10:49:52");
INSERT INTO permissions VALUES("14","sales-edit","web","2018-06-04 10:49:52","2018-06-04 10:49:52");
INSERT INTO permissions VALUES("15","sales-delete","web","2018-06-04 10:49:53","2018-06-04 10:49:53");
INSERT INTO permissions VALUES("16","quotes-index","web","2018-06-04 22:05:10","2018-06-04 22:05:10");
INSERT INTO permissions VALUES("17","quotes-add","web","2018-06-04 22:05:10","2018-06-04 22:05:10");
INSERT INTO permissions VALUES("18","quotes-edit","web","2018-06-04 22:05:10","2018-06-04 22:05:10");
INSERT INTO permissions VALUES("19","quotes-delete","web","2018-06-04 22:05:10","2018-06-04 22:05:10");
INSERT INTO permissions VALUES("20","transfers-index","web","2018-06-04 22:30:03","2018-06-04 22:30:03");
INSERT INTO permissions VALUES("21","transfers-add","web","2018-06-04 22:30:03","2018-06-04 22:30:03");
INSERT INTO permissions VALUES("22","transfers-edit","web","2018-06-04 22:30:03","2018-06-04 22:30:03");
INSERT INTO permissions VALUES("23","transfers-delete","web","2018-06-04 22:30:03","2018-06-04 22:30:03");
INSERT INTO permissions VALUES("24","returns-index","web","2018-06-04 22:50:24","2018-06-04 22:50:24");
INSERT INTO permissions VALUES("25","returns-add","web","2018-06-04 22:50:24","2018-06-04 22:50:24");
INSERT INTO permissions VALUES("26","returns-edit","web","2018-06-04 22:50:25","2018-06-04 22:50:25");
INSERT INTO permissions VALUES("27","returns-delete","web","2018-06-04 22:50:25","2018-06-04 22:50:25");
INSERT INTO permissions VALUES("28","customers-index","web","2018-06-04 23:15:54","2018-06-04 23:15:54");
INSERT INTO permissions VALUES("29","customers-add","web","2018-06-04 23:15:55","2018-06-04 23:15:55");
INSERT INTO permissions VALUES("30","customers-edit","web","2018-06-04 23:15:55","2018-06-04 23:15:55");
INSERT INTO permissions VALUES("31","customers-delete","web","2018-06-04 23:15:55","2018-06-04 23:15:55");
INSERT INTO permissions VALUES("32","suppliers-index","web","2018-06-04 23:40:12","2018-06-04 23:40:12");
INSERT INTO permissions VALUES("33","suppliers-add","web","2018-06-04 23:40:12","2018-06-04 23:40:12");
INSERT INTO permissions VALUES("34","suppliers-edit","web","2018-06-04 23:40:12","2018-06-04 23:40:12");
INSERT INTO permissions VALUES("35","suppliers-delete","web","2018-06-04 23:40:12","2018-06-04 23:40:12");
INSERT INTO permissions VALUES("36","product-report","web","2018-06-24 23:05:33","2018-06-24 23:05:33");
INSERT INTO permissions VALUES("37","purchase-report","web","2018-06-24 23:24:56","2018-06-24 23:24:56");
INSERT INTO permissions VALUES("38","sale-report","web","2018-06-24 23:33:13","2018-06-24 23:33:13");
INSERT INTO permissions VALUES("39","customer-report","web","2018-06-24 23:36:51","2018-06-24 23:36:51");
INSERT INTO permissions VALUES("40","due-report","web","2018-06-24 23:39:52","2018-06-24 23:39:52");
INSERT INTO permissions VALUES("41","users-index","web","2018-06-25 00:00:10","2018-06-25 00:00:10");
INSERT INTO permissions VALUES("42","users-add","web","2018-06-25 00:00:10","2018-06-25 00:00:10");
INSERT INTO permissions VALUES("43","users-edit","web","2018-06-25 00:01:30","2018-06-25 00:01:30");
INSERT INTO permissions VALUES("44","users-delete","web","2018-06-25 00:01:30","2018-06-25 00:01:30");
INSERT INTO permissions VALUES("45","profit-loss","web","2018-07-14 21:50:05","2018-07-14 21:50:05");
INSERT INTO permissions VALUES("46","best-seller","web","2018-07-14 22:01:38","2018-07-14 22:01:38");
INSERT INTO permissions VALUES("47","daily-sale","web","2018-07-14 22:24:21","2018-07-14 22:24:21");
INSERT INTO permissions VALUES("48","monthly-sale","web","2018-07-14 22:30:41","2018-07-14 22:30:41");
INSERT INTO permissions VALUES("49","daily-purchase","web","2018-07-14 22:36:46","2018-07-14 22:36:46");
INSERT INTO permissions VALUES("50","monthly-purchase","web","2018-07-14 22:48:17","2018-07-14 22:48:17");
INSERT INTO permissions VALUES("51","payment-report","web","2018-07-14 23:10:41","2018-07-14 23:10:41");
INSERT INTO permissions VALUES("52","warehouse-stock-report","web","2018-07-14 23:16:55","2018-07-14 23:16:55");
INSERT INTO permissions VALUES("53","product-qty-alert","web","2018-07-14 23:33:21","2018-07-14 23:33:21");
INSERT INTO permissions VALUES("54","supplier-report","web","2018-07-30 03:00:01","2018-07-30 03:00:01");
INSERT INTO permissions VALUES("55","expenses-index","web","2018-09-05 01:07:10","2018-09-05 01:07:10");
INSERT INTO permissions VALUES("56","expenses-add","web","2018-09-05 01:07:10","2018-09-05 01:07:10");
INSERT INTO permissions VALUES("57","expenses-edit","web","2018-09-05 01:07:10","2018-09-05 01:07:10");
INSERT INTO permissions VALUES("58","expenses-delete","web","2018-09-05 01:07:11","2018-09-05 01:07:11");
INSERT INTO permissions VALUES("59","general_setting","web","2018-10-19 23:10:04","2018-10-19 23:10:04");
INSERT INTO permissions VALUES("60","mail_setting","web","2018-10-19 23:10:04","2018-10-19 23:10:04");
INSERT INTO permissions VALUES("61","pos_setting","web","2018-10-19 23:10:04","2018-10-19 23:10:04");
INSERT INTO permissions VALUES("62","hrm_setting","web","2019-01-02 10:30:23","2019-01-02 10:30:23");
INSERT INTO permissions VALUES("63","purchase-return-index","web","2019-01-02 21:45:14","2019-01-02 21:45:14");
INSERT INTO permissions VALUES("64","purchase-return-add","web","2019-01-02 21:45:14","2019-01-02 21:45:14");
INSERT INTO permissions VALUES("65","purchase-return-edit","web","2019-01-02 21:45:14","2019-01-02 21:45:14");
INSERT INTO permissions VALUES("66","purchase-return-delete","web","2019-01-02 21:45:14","2019-01-02 21:45:14");
INSERT INTO permissions VALUES("67","account-index","web","2019-01-02 22:06:13","2019-01-02 22:06:13");
INSERT INTO permissions VALUES("68","balance-sheet","web","2019-01-02 22:06:14","2019-01-02 22:06:14");
INSERT INTO permissions VALUES("69","account-statement","web","2019-01-02 22:06:14","2019-01-02 22:06:14");
INSERT INTO permissions VALUES("70","department","web","2019-01-02 22:30:01","2019-01-02 22:30:01");
INSERT INTO permissions VALUES("71","attendance","web","2019-01-02 22:30:01","2019-01-02 22:30:01");
INSERT INTO permissions VALUES("72","payroll","web","2019-01-02 22:30:01","2019-01-02 22:30:01");
INSERT INTO permissions VALUES("73","employees-index","web","2019-01-02 22:52:19","2019-01-02 22:52:19");
INSERT INTO permissions VALUES("74","employees-add","web","2019-01-02 22:52:19","2019-01-02 22:52:19");
INSERT INTO permissions VALUES("75","employees-edit","web","2019-01-02 22:52:19","2019-01-02 22:52:19");
INSERT INTO permissions VALUES("76","employees-delete","web","2019-01-02 22:52:19","2019-01-02 22:52:19");
INSERT INTO permissions VALUES("77","user-report","web","2019-01-16 06:48:18","2019-01-16 06:48:18");
INSERT INTO permissions VALUES("78","stock_count","web","2019-02-17 10:32:01","2019-02-17 10:32:01");
INSERT INTO permissions VALUES("79","adjustment","web","2019-02-17 10:32:02","2019-02-17 10:32:02");
INSERT INTO permissions VALUES("80","sms_setting","web","2019-02-22 05:18:03","2019-02-22 05:18:03");
INSERT INTO permissions VALUES("81","create_sms","web","2019-02-22 05:18:03","2019-02-22 05:18:03");
INSERT INTO permissions VALUES("82","print_barcode","web","2019-03-07 05:02:19","2019-03-07 05:02:19");
INSERT INTO permissions VALUES("83","empty_database","web","2019-03-07 05:02:19","2019-03-07 05:02:19");
INSERT INTO permissions VALUES("84","customer_group","web","2019-03-07 05:37:15","2019-03-07 05:37:15");
INSERT INTO permissions VALUES("85","unit","web","2019-03-07 05:37:15","2019-03-07 05:37:15");
INSERT INTO permissions VALUES("86","tax","web","2019-03-07 05:37:15","2019-03-07 05:37:15");
INSERT INTO permissions VALUES("87","gift_card","web","2019-03-07 06:29:38","2019-03-07 06:29:38");
INSERT INTO permissions VALUES("88","coupon","web","2019-03-07 06:29:38","2019-03-07 06:29:38");
INSERT INTO permissions VALUES("89","holiday","web","2019-10-19 08:57:15","2019-10-19 08:57:15");
INSERT INTO permissions VALUES("90","warehouse-report","web","2019-10-22 06:00:23","2019-10-22 06:00:23");
INSERT INTO permissions VALUES("91","warehouse","web","2020-02-26 06:47:32","2020-02-26 06:47:32");
INSERT INTO permissions VALUES("92","brand","web","2020-02-26 06:59:59","2020-02-26 06:59:59");
INSERT INTO permissions VALUES("93","billers-index","web","2020-02-26 07:11:15","2020-02-26 07:11:15");
INSERT INTO permissions VALUES("94","billers-add","web","2020-02-26 07:11:15","2020-02-26 07:11:15");
INSERT INTO permissions VALUES("95","billers-edit","web","2020-02-26 07:11:15","2020-02-26 07:11:15");
INSERT INTO permissions VALUES("96","billers-delete","web","2020-02-26 07:11:15","2020-02-26 07:11:15");
INSERT INTO permissions VALUES("97","money-transfer","web","2020-03-02 05:41:48","2020-03-02 05:41:48");
INSERT INTO permissions VALUES("98","category","web","2020-07-13 12:13:16","2020-07-13 12:13:16");
INSERT INTO permissions VALUES("99","delivery","web","2020-07-13 12:13:16","2020-07-13 12:13:16");
INSERT INTO permissions VALUES("100","send_notification","web","2020-10-31 06:21:31","2020-10-31 06:21:31");
INSERT INTO permissions VALUES("101","today_sale","web","2020-10-31 06:57:04","2020-10-31 06:57:04");
INSERT INTO permissions VALUES("102","today_profit","web","2020-10-31 06:57:04","2020-10-31 06:57:04");
INSERT INTO permissions VALUES("103","currency","web","2020-11-09 00:23:11","2020-11-09 00:23:11");
INSERT INTO permissions VALUES("104","backup_database","web","2020-11-15 00:16:55","2020-11-15 00:16:55");
INSERT INTO permissions VALUES("105","reward_point_setting","web","2021-06-27 04:34:42","2021-06-27 04:34:42");
INSERT INTO permissions VALUES("106","revenue_profit_summary","web","2022-02-08 13:57:21","2022-02-08 13:57:21");
INSERT INTO permissions VALUES("107","cash_flow","web","2022-02-08 13:57:22","2022-02-08 13:57:22");
INSERT INTO permissions VALUES("108","monthly_summary","web","2022-02-08 13:57:22","2022-02-08 13:57:22");
INSERT INTO permissions VALUES("109","yearly_report","web","2022-02-08 13:57:22","2022-02-08 13:57:22");
INSERT INTO permissions VALUES("110","discount_plan","web","2022-02-16 09:12:26","2022-02-16 09:12:26");
INSERT INTO permissions VALUES("111","discount","web","2022-02-16 09:12:38","2022-02-16 09:12:38");
INSERT INTO permissions VALUES("112","product-expiry-report","web","2022-03-30 05:39:20","2022-03-30 05:39:20");
INSERT INTO permissions VALUES("113","purchase-payment-index","web","2022-06-05 14:12:27","2022-06-05 14:12:27");
INSERT INTO permissions VALUES("114","purchase-payment-add","web","2022-06-05 14:12:28","2022-06-05 14:12:28");
INSERT INTO permissions VALUES("115","purchase-payment-edit","web","2022-06-05 14:12:28","2022-06-05 14:12:28");
INSERT INTO permissions VALUES("116","purchase-payment-delete","web","2022-06-05 14:12:28","2022-06-05 14:12:28");
INSERT INTO permissions VALUES("117","sale-payment-index","web","2022-06-05 14:12:28","2022-06-05 14:12:28");
INSERT INTO permissions VALUES("118","sale-payment-add","web","2022-06-05 14:12:28","2022-06-05 14:12:28");
INSERT INTO permissions VALUES("119","sale-payment-edit","web","2022-06-05 14:12:28","2022-06-05 14:12:28");
INSERT INTO permissions VALUES("120","sale-payment-delete","web","2022-06-05 14:12:28","2022-06-05 14:12:28");
INSERT INTO permissions VALUES("121","all_notification","web","2022-06-05 14:12:29","2022-06-05 14:12:29");
INSERT INTO permissions VALUES("122","sale-report-chart","web","2022-06-05 14:12:29","2022-06-05 14:12:29");
INSERT INTO permissions VALUES("123","dso-report","web","2022-06-05 14:12:29","2022-06-05 14:12:29");
INSERT INTO permissions VALUES("124","product_history","web","2022-08-25 14:04:05","2022-08-25 14:04:05");
INSERT INTO permissions VALUES("125","supplier-due-report","web","2022-08-31 09:46:33","2022-08-31 09:46:33");
INSERT INTO permissions VALUES("126","custom_field","web","2023-05-02 07:41:35","2023-05-02 07:41:35");
INSERT INTO permissions VALUES("127","incomes-index","web","2024-08-11 04:50:59","2024-08-11 04:50:59");
INSERT INTO permissions VALUES("128","incomes-add","web","2024-08-11 04:50:59","2024-08-11 04:50:59");
INSERT INTO permissions VALUES("129","incomes-edit","web","2024-08-11 04:50:59","2024-08-11 04:50:59");
INSERT INTO permissions VALUES("130","incomes-delete","web","2024-08-11 04:50:59","2024-08-11 04:50:59");
INSERT INTO permissions VALUES("131","packing_slip_challan","web","2024-08-11 04:51:00","2024-08-11 04:51:00");
INSERT INTO permissions VALUES("132","biller-report","web","2024-08-25 23:30:44","2024-08-25 23:30:44");



CREATE TABLE `pos_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `product_number` int(11) NOT NULL,
  `keybord_active` tinyint(1) NOT NULL,
  `is_table` tinyint(1) NOT NULL DEFAULT 0,
  `send_sms` tinyint(1) NOT NULL DEFAULT 0,
  `stripe_public_key` varchar(191) DEFAULT NULL,
  `stripe_secret_key` varchar(191) DEFAULT NULL,
  `paypal_live_api_username` varchar(191) DEFAULT NULL,
  `paypal_live_api_password` varchar(191) DEFAULT NULL,
  `paypal_live_api_secret` varchar(191) DEFAULT NULL,
  `payment_options` text DEFAULT NULL,
  `invoice_option` varchar(10) DEFAULT NULL,
  `thermal_invoice_size` varchar(255) NOT NULL DEFAULT '80',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `pos_setting_id_unique` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO pos_setting VALUES("1","1","1","2","1","1","1","1","","","admin","admin","","cash,cheque,deposit,WAVE,ORANGE MONEY,MOOV MONEY","thermal","80","2018-09-02 03:17:04","2025-01-15 18:18:57");



CREATE TABLE `product_adjustments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `adjustment_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `unit_cost` double DEFAULT NULL,
  `qty` double NOT NULL,
  `action` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_adjustments VALUES("1","1","1","","430","100","-","2025-01-13 18:27:10","2025-01-13 18:27:10");
INSERT INTO product_adjustments VALUES("2","2","1","","430","24","+","2025-01-13 18:28:44","2025-01-13 18:28:44");
INSERT INTO product_adjustments VALUES("3","3","8","","450","13","+","2025-01-13 18:31:50","2025-01-13 18:31:50");



CREATE TABLE `product_batches` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `batch_no` varchar(191) NOT NULL,
  `expired_date` date NOT NULL,
  `qty` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `product_productions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `production_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` double NOT NULL,
  `recieved` double NOT NULL,
  `purchase_unit_id` int(11) NOT NULL,
  `net_unit_cost` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `product_purchases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `purchase_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text DEFAULT NULL,
  `qty` double NOT NULL,
  `recieved` double NOT NULL,
  `return_qty` double NOT NULL DEFAULT 0,
  `purchase_unit_id` int(11) NOT NULL,
  `net_unit_cost` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_purchases VALUES("1","1","1","","","","100","100","0","1","430","0","0","0","43000","2025-01-12 14:03:19","2025-01-12 14:03:19");
INSERT INTO product_purchases VALUES("2","2","13","","","","10","10","0","1","450","0","0","0","4500","2025-01-12 14:59:02","2025-01-12 14:59:02");
INSERT INTO product_purchases VALUES("3","3","15","","","","1","1","0","1","800","0","0","0","800","2025-01-12 15:09:07","2025-01-12 15:09:07");
INSERT INTO product_purchases VALUES("4","4","16","","","","1","1","0","1","800","0","0","0","800","2025-01-12 15:11:31","2025-01-12 15:11:31");
INSERT INTO product_purchases VALUES("5","5","17","","","","1","1","0","1","800","0","0","0","800","2025-01-12 15:13:39","2025-01-12 15:13:39");
INSERT INTO product_purchases VALUES("6","6","18","","","","1","1","0","1","800","0","0","0","800","2025-01-12 15:16:16","2025-01-12 15:16:16");
INSERT INTO product_purchases VALUES("7","7","19","","","","1","1","0","1","800","0","0","0","800","2025-01-12 15:20:18","2025-01-12 15:20:18");
INSERT INTO product_purchases VALUES("8","8","20","","","","1","1","0","1","1500","0","0","0","1500","2025-01-12 15:22:28","2025-01-12 15:22:28");
INSERT INTO product_purchases VALUES("9","9","21","","","","1","1","0","1","800","0","0","0","800","2025-01-12 15:28:25","2025-01-12 15:28:25");
INSERT INTO product_purchases VALUES("10","10","22","","","","1","1","0","1","800","0","0","0","800","2025-01-12 15:30:03","2025-01-12 15:30:03");
INSERT INTO product_purchases VALUES("11","11","23","","","","1","1","0","1","600","0","0","0","600","2025-01-12 15:33:05","2025-01-12 15:33:05");
INSERT INTO product_purchases VALUES("12","12","24","","","","1","1","0","1","600","0","0","0","600","2025-01-12 15:35:40","2025-01-12 15:35:40");
INSERT INTO product_purchases VALUES("13","13","25","","","","1","1","0","1","450","0","0","0","450","2025-01-12 15:43:13","2025-01-12 15:43:13");
INSERT INTO product_purchases VALUES("14","14","26","","","","1","1","0","1","850","0","0","0","850","2025-01-12 15:45:35","2025-01-12 15:45:35");
INSERT INTO product_purchases VALUES("15","15","27","","","","1","1","0","1","1500","0","0","0","1500","2025-01-12 15:51:32","2025-01-12 15:51:32");
INSERT INTO product_purchases VALUES("16","16","28","","","","1","1","0","1","8000","0","0","0","8000","2025-01-12 15:53:51","2025-01-12 15:53:51");
INSERT INTO product_purchases VALUES("17","17","29","","","","1","1","0","1","80","0","0","0","80","2025-01-12 15:56:59","2025-01-12 15:56:59");
INSERT INTO product_purchases VALUES("18","18","30","","","","1","1","0","1","1500","0","0","0","1500","2025-01-12 15:59:22","2025-01-12 15:59:22");
INSERT INTO product_purchases VALUES("19","19","31","","","","3","3","0","1","3500","0","0","0","10500","2025-01-12 16:05:03","2025-01-12 16:05:03");
INSERT INTO product_purchases VALUES("20","20","32","","","","1","1","0","1","3500","0","0","0","3500","2025-01-12 16:11:33","2025-01-12 16:11:33");
INSERT INTO product_purchases VALUES("21","21","33","","","","1","1","0","1","8900","0","0","0","8900","2025-01-12 16:14:04","2025-01-12 16:14:04");
INSERT INTO product_purchases VALUES("22","22","34","","","","1","1","0","1","9000","0","0","0","9000","2025-01-12 16:15:58","2025-01-12 16:15:58");
INSERT INTO product_purchases VALUES("23","23","35","","","","1","1","0","1","7000","0","0","0","7000","2025-01-12 16:18:29","2025-01-12 16:18:29");
INSERT INTO product_purchases VALUES("24","24","36","","","","1","1","0","1","4500","0","0","0","4500","2025-01-12 16:20:20","2025-01-12 16:20:20");
INSERT INTO product_purchases VALUES("25","25","37","","","","1","1","0","1","4500","0","0","0","4500","2025-01-12 16:22:13","2025-01-12 16:22:13");
INSERT INTO product_purchases VALUES("26","26","38","","","","1","1","0","1","4500","0","0","0","4500","2025-01-12 16:24:01","2025-01-12 16:24:01");
INSERT INTO product_purchases VALUES("27","27","39","","","","1","1","0","1","7500","0","0","0","7500","2025-01-12 16:26:54","2025-01-12 16:26:54");
INSERT INTO product_purchases VALUES("28","28","40","","","","1","1","0","1","8000","0","0","0","8000","2025-01-12 16:29:04","2025-01-12 16:29:04");
INSERT INTO product_purchases VALUES("29","29","41","","","","1","1","0","1","8000","0","0","0","8000","2025-01-12 16:37:22","2025-01-12 16:37:22");
INSERT INTO product_purchases VALUES("30","30","42","","","","1","1","0","1","8000","0","0","0","8000","2025-01-12 16:45:50","2025-01-12 16:45:50");
INSERT INTO product_purchases VALUES("31","31","43","","","","1","1","0","1","8000","0","0","0","8000","2025-01-12 16:48:49","2025-01-12 16:48:49");
INSERT INTO product_purchases VALUES("32","32","44","","","","1","1","0","1","8000","0","0","0","8000","2025-01-12 16:51:42","2025-01-12 16:51:42");
INSERT INTO product_purchases VALUES("33","33","45","","","","1","1","0","1","8000","0","0","0","8000","2025-01-12 16:54:55","2025-01-12 16:54:55");
INSERT INTO product_purchases VALUES("34","34","46","","","","1","1","0","1","8000","0","0","0","8000","2025-01-12 16:58:06","2025-01-12 16:58:06");
INSERT INTO product_purchases VALUES("35","35","47","","","","1","1","0","1","4848","0","0","0","4848","2025-01-12 17:02:48","2025-01-12 17:02:48");
INSERT INTO product_purchases VALUES("36","36","48","","","","1","1","0","1","7740","0","0","0","7740","2025-01-12 17:05:58","2025-01-12 17:05:58");
INSERT INTO product_purchases VALUES("37","37","49","","","","1","1","0","1","8100","0","0","0","8100","2025-01-12 17:11:56","2025-01-12 17:11:56");
INSERT INTO product_purchases VALUES("38","38","50","","","","1","1","0","1","8400","0","0","0","8400","2025-01-12 17:14:14","2025-01-12 17:14:14");
INSERT INTO product_purchases VALUES("39","39","51","","","","1","1","0","1","30000","0","0","0","30000","2025-01-12 17:17:57","2025-01-12 17:17:57");
INSERT INTO product_purchases VALUES("40","40","52","","","","1","1","0","1","35000","0","0","0","35000","2025-01-12 17:21:06","2025-01-12 17:21:06");
INSERT INTO product_purchases VALUES("41","41","53","","","","1","1","0","1","7122","0","0","0","7122","2025-01-12 17:26:09","2025-01-12 17:26:09");
INSERT INTO product_purchases VALUES("42","42","54","","","","1","1","0","1","7000","0","0","0","7000","2025-01-12 17:27:42","2025-01-12 17:27:42");
INSERT INTO product_purchases VALUES("43","43","55","","","","1","1","0","1","7821","0","0","0","7821","2025-01-12 18:11:14","2025-01-12 18:11:14");
INSERT INTO product_purchases VALUES("44","44","56","","","","1","1","0","1","4550","0","0","0","4550","2025-01-12 18:16:54","2025-01-12 18:16:54");
INSERT INTO product_purchases VALUES("45","45","57","","","","1","1","0","1","28000","0","0","0","28000","2025-01-12 18:20:09","2025-01-12 18:20:09");
INSERT INTO product_purchases VALUES("46","46","58","","","","1","1","0","1","30000","0","0","0","30000","2025-01-12 18:24:26","2025-01-12 18:24:26");
INSERT INTO product_purchases VALUES("47","47","59","","","","1","1","0","1","3000","0","0","0","3000","2025-01-12 18:27:04","2025-01-12 18:27:04");
INSERT INTO product_purchases VALUES("48","48","60","","","","1","1","0","1","45000","0","0","0","45000","2025-01-12 18:30:49","2025-01-12 18:30:49");
INSERT INTO product_purchases VALUES("49","49","61","","","","1","1","0","1","15000","0","0","0","15000","2025-01-12 18:34:33","2025-01-12 18:34:33");
INSERT INTO product_purchases VALUES("50","50","62","","","","1","1","0","1","15000","0","0","0","15000","2025-01-12 18:36:51","2025-01-12 18:36:51");
INSERT INTO product_purchases VALUES("51","51","63","","","","1","1","0","1","4500","0","0","0","4500","2025-01-12 18:48:28","2025-01-12 18:48:28");
INSERT INTO product_purchases VALUES("52","52","64","","","","1","1","0","1","4500","0","0","0","4500","2025-01-12 18:49:54","2025-01-12 18:49:54");
INSERT INTO product_purchases VALUES("53","53","65","","","","1","1","0","1","4500","0","0","0","4500","2025-01-12 18:51:46","2025-01-12 18:51:46");
INSERT INTO product_purchases VALUES("54","54","66","","","","1","1","0","1","4500","0","0","0","4500","2025-01-12 18:53:33","2025-01-12 18:53:33");
INSERT INTO product_purchases VALUES("55","55","67","","","","1","1","0","1","4500","0","0","0","4500","2025-01-12 18:57:28","2025-01-12 18:57:28");
INSERT INTO product_purchases VALUES("56","56","68","","","","1","1","0","1","4500","0","0","0","4500","2025-01-12 18:59:59","2025-01-12 18:59:59");
INSERT INTO product_purchases VALUES("57","57","69","","","","1","1","0","1","4500","0","0","0","4500","2025-01-12 19:02:36","2025-01-12 19:02:36");
INSERT INTO product_purchases VALUES("58","58","70","","","","1","1","0","1","4500","0","0","0","4500","2025-01-12 19:04:11","2025-01-12 19:04:11");
INSERT INTO product_purchases VALUES("59","59","71","","","","1","1","0","1","4500","0","0","0","4500","2025-01-12 19:07:07","2025-01-12 19:07:07");
INSERT INTO product_purchases VALUES("60","60","72","","","","1","1","0","1","4500","0","0","0","4500","2025-01-12 19:08:43","2025-01-12 19:08:43");
INSERT INTO product_purchases VALUES("61","61","73","","","","1","1","0","1","4500","0","0","0","4500","2025-01-12 19:10:44","2025-01-12 19:10:44");
INSERT INTO product_purchases VALUES("62","62","74","","","","1","1","0","1","4500","0","0","0","4500","2025-01-12 19:12:21","2025-01-12 19:12:21");
INSERT INTO product_purchases VALUES("63","63","75","","","","1","1","0","1","4500","0","0","0","4500","2025-01-12 19:21:39","2025-01-12 19:21:39");
INSERT INTO product_purchases VALUES("64","64","76","","","","1","1","0","1","4500","0","0","0","4500","2025-01-12 19:23:14","2025-01-12 19:23:14");
INSERT INTO product_purchases VALUES("65","65","77","","","","1","1","0","1","4500","0","0","0","4500","2025-01-12 19:24:30","2025-01-12 19:24:30");
INSERT INTO product_purchases VALUES("66","66","78","","","","1","1","0","1","4500","0","0","0","4500","2025-01-12 19:26:23","2025-01-12 19:26:23");
INSERT INTO product_purchases VALUES("67","67","79","","","","1","1","0","1","4500","0","0","0","4500","2025-01-12 19:42:50","2025-01-12 19:42:50");
INSERT INTO product_purchases VALUES("68","68","80","","","","1","1","0","1","4500","0","0","0","4500","2025-01-12 19:46:17","2025-01-12 19:46:17");
INSERT INTO product_purchases VALUES("69","69","81","","","","1","1","0","1","4500","0","0","0","4500","2025-01-12 19:47:54","2025-01-12 19:47:54");
INSERT INTO product_purchases VALUES("70","70","82","","","","1","1","0","1","4500","0","0","0","4500","2025-01-12 19:50:12","2025-01-12 19:50:12");
INSERT INTO product_purchases VALUES("71","71","83","","","","1","1","0","1","4500","0","0","0","4500","2025-01-12 19:51:55","2025-01-12 19:51:55");
INSERT INTO product_purchases VALUES("72","72","84","","","","1","1","0","1","4500","0","0","0","4500","2025-01-12 19:55:01","2025-01-12 19:55:01");
INSERT INTO product_purchases VALUES("73","73","85","","","","1","1","0","1","4500","0","0","0","4500","2025-01-12 20:00:20","2025-01-12 20:00:20");
INSERT INTO product_purchases VALUES("74","74","86","","","","1","1","0","1","4500","0","0","0","4500","2025-01-12 20:02:08","2025-01-12 20:02:08");
INSERT INTO product_purchases VALUES("75","75","87","","","","1","1","0","1","4500","0","0","0","4500","2025-01-12 20:04:03","2025-01-12 20:04:03");
INSERT INTO product_purchases VALUES("76","76","88","","","","1","1","0","1","4500","0","0","0","4500","2025-01-12 20:06:46","2025-01-12 20:06:46");
INSERT INTO product_purchases VALUES("77","77","89","","","","1","1","0","1","2500","0","0","0","2500","2025-01-12 20:09:05","2025-01-12 20:09:05");
INSERT INTO product_purchases VALUES("78","78","90","","","","1","1","0","1","2500","0","0","0","2500","2025-01-12 20:10:54","2025-01-12 20:10:54");
INSERT INTO product_purchases VALUES("79","79","91","","","","1","1","0","1","2500","0","0","0","2500","2025-01-12 20:12:29","2025-01-12 20:12:29");
INSERT INTO product_purchases VALUES("80","80","92","","","","1","1","0","1","1500","0","0","0","1500","2025-01-12 20:14:44","2025-01-12 20:14:44");
INSERT INTO product_purchases VALUES("81","81","93","","","","1","1","0","1","4500","0","0","0","4500","2025-01-12 20:17:42","2025-01-12 20:17:42");
INSERT INTO product_purchases VALUES("82","82","94","","","","1","1","0","1","7000","0","0","0","7000","2025-01-12 20:21:53","2025-01-12 20:21:53");
INSERT INTO product_purchases VALUES("83","83","95","","","","1","1","0","1","8500","0","0","0","8500","2025-01-12 20:23:30","2025-01-12 20:23:30");
INSERT INTO product_purchases VALUES("84","84","96","","","","1","1","0","1","3500","0","0","0","3500","2025-01-12 20:27:30","2025-01-12 20:27:30");
INSERT INTO product_purchases VALUES("85","85","97","","","","1","1","0","1","7000","0","0","0","7000","2025-01-12 20:32:37","2025-01-12 20:32:37");
INSERT INTO product_purchases VALUES("86","86","98","","","","1","1","0","1","4500","0","0","0","4500","2025-01-12 20:34:38","2025-01-12 20:34:38");
INSERT INTO product_purchases VALUES("87","87","99","","","","1","1","0","1","4500","0","0","0","4500","2025-01-12 20:38:05","2025-01-12 20:38:05");
INSERT INTO product_purchases VALUES("88","88","100","","","","1","1","0","1","4500","0","0","0","4500","2025-01-12 20:41:14","2025-01-12 20:41:14");
INSERT INTO product_purchases VALUES("89","89","101","","","","1","1","0","1","4500","0","0","0","4500","2025-01-12 20:42:54","2025-01-12 20:42:54");
INSERT INTO product_purchases VALUES("90","90","102","","","","1","1","0","1","4500","0","0","0","4500","2025-01-12 20:45:13","2025-01-12 20:45:13");
INSERT INTO product_purchases VALUES("91","91","103","","","","1","1","0","1","850","0","0","0","850","2025-01-12 21:02:39","2025-01-12 21:02:39");
INSERT INTO product_purchases VALUES("99","95","79","","","","22","22","0","1","4500","0","0","0","99000","2025-01-13 19:36:39","2025-01-13 19:36:39");
INSERT INTO product_purchases VALUES("100","95","36","","","","1","1","0","1","4500","0","0","0","4500","2025-01-13 19:36:39","2025-01-13 19:36:39");
INSERT INTO product_purchases VALUES("101","95","75","","","","34","34","0","1","4500","0","0","0","153000","2025-01-13 19:36:39","2025-01-13 19:36:39");
INSERT INTO product_purchases VALUES("102","95","84","","","","7","7","0","1","4500","0","0","0","31500","2025-01-13 19:36:39","2025-01-13 19:36:39");
INSERT INTO product_purchases VALUES("103","95","31","","","","2","2","0","1","3500","0","0","0","7000","2025-01-13 19:36:39","2025-01-13 19:36:39");
INSERT INTO product_purchases VALUES("104","95","86","","","","3","3","0","1","4500","0","0","0","13500","2025-01-13 19:36:39","2025-01-13 19:36:39");
INSERT INTO product_purchases VALUES("105","95","30","","","","5","5","0","1","1500","0","0","0","7500","2025-01-13 19:36:39","2025-01-13 19:36:39");
INSERT INTO product_purchases VALUES("106","95","51","","","","7","7","0","1","30000","0","0","0","210000","2025-01-13 19:36:39","2025-01-13 19:36:39");
INSERT INTO product_purchases VALUES("107","95","58","","","","3","3","0","1","30000","0","0","0","90000","2025-01-13 19:36:39","2025-01-13 19:36:39");
INSERT INTO product_purchases VALUES("108","95","57","","","","5","5","0","1","28000","0","0","0","140000","2025-01-13 19:36:39","2025-01-13 19:36:39");
INSERT INTO product_purchases VALUES("109","95","60","","","","2","2","0","1","45000","0","0","0","90000","2025-01-13 19:36:39","2025-01-13 19:36:39");
INSERT INTO product_purchases VALUES("110","95","52","","","","5","5","0","1","35000","0","0","0","175000","2025-01-13 19:36:39","2025-01-13 19:36:39");
INSERT INTO product_purchases VALUES("111","95","98","","","","3","3","0","1","4500","0","0","0","13500","2025-01-13 19:36:39","2025-01-13 19:36:39");
INSERT INTO product_purchases VALUES("112","95","37","","","","1","1","0","1","4500","0","0","0","4500","2025-01-13 19:36:39","2025-01-13 19:36:39");
INSERT INTO product_purchases VALUES("113","95","27","","","","4","4","0","1","1500","0","0","0","6000","2025-01-13 19:36:39","2025-01-13 19:36:39");
INSERT INTO product_purchases VALUES("114","95","9","","","","12","12","0","1","450","0","0","0","5400","2025-01-13 19:36:39","2025-01-13 19:36:39");
INSERT INTO product_purchases VALUES("115","95","6","","","","8","8","0","1","450","0","0","0","3600","2025-01-13 19:36:39","2025-01-13 19:36:39");
INSERT INTO product_purchases VALUES("116","95","25","","","","6","6","0","1","450","0","0","0","2700","2025-01-13 19:36:39","2025-01-13 19:36:39");
INSERT INTO product_purchases VALUES("117","95","90","","","","13","13","0","1","2500","0","0","0","32500","2025-01-13 19:36:39","2025-01-13 19:36:39");
INSERT INTO product_purchases VALUES("118","95","96","","","","6","6","0","1","3500","0","0","0","21000","2025-01-13 19:36:39","2025-01-13 19:36:39");
INSERT INTO product_purchases VALUES("119","95","89","","","","20","20","0","1","2500","0","0","0","50000","2025-01-13 19:36:39","2025-01-13 19:36:39");
INSERT INTO product_purchases VALUES("120","95","59","","","","12","12","0","1","3000","0","0","0","36000","2025-01-13 19:36:39","2025-01-13 19:36:39");
INSERT INTO product_purchases VALUES("121","95","61","","","","4","4","0","1","15000","0","0","0","60000","2025-01-13 19:36:39","2025-01-13 19:36:39");
INSERT INTO product_purchases VALUES("122","95","33","","","","4","4","0","1","8900","0","0","0","35600","2025-01-13 19:36:39","2025-01-13 19:36:39");
INSERT INTO product_purchases VALUES("123","95","32","","","","2","2","0","1","3500","0","0","0","7000","2025-01-13 19:36:39","2025-01-13 19:36:39");
INSERT INTO product_purchases VALUES("124","95","72","","","","24","24","0","1","4500","0","0","0","108000","2025-01-13 19:36:39","2025-01-13 19:36:39");
INSERT INTO product_purchases VALUES("125","95","85","","","","1","1","0","1","4500","0","0","0","4500","2025-01-13 19:36:39","2025-01-13 19:36:39");
INSERT INTO product_purchases VALUES("126","95","93","","","","4","4","0","1","4500","0","0","0","18000","2025-01-13 19:36:39","2025-01-13 19:36:39");
INSERT INTO product_purchases VALUES("127","95","88","","","","4","4","0","1","4500","0","0","0","18000","2025-01-13 19:36:39","2025-01-13 19:36:39");
INSERT INTO product_purchases VALUES("128","95","87","","","","7","7","0","1","4500","0","0","0","31500","2025-01-13 19:36:39","2025-01-13 19:36:39");
INSERT INTO product_purchases VALUES("129","95","11","","","","1","1","0","1","850","0","0","0","850","2025-01-13 19:36:40","2025-01-13 19:36:40");
INSERT INTO product_purchases VALUES("130","95","78","","","","5","5","0","1","4500","0","0","0","22500","2025-01-13 19:36:40","2025-01-13 19:36:40");
INSERT INTO product_purchases VALUES("131","95","66","","","","4","4","0","1","4500","0","0","0","18000","2025-01-13 19:36:40","2025-01-13 19:36:40");
INSERT INTO product_purchases VALUES("132","95","40","","","","18","18","0","1","8000","0","0","0","144000","2025-01-13 19:36:40","2025-01-13 19:36:40");
INSERT INTO product_purchases VALUES("133","95","92","","","","7","7","0","1","1500","0","0","0","10500","2025-01-13 19:36:40","2025-01-13 19:36:40");
INSERT INTO product_purchases VALUES("134","95","95","","","","9","9","0","1","8500","0","0","0","76500","2025-01-13 19:36:40","2025-01-13 19:36:40");
INSERT INTO product_purchases VALUES("135","95","94","","","","8","8","0","1","7000","0","0","0","56000","2025-01-13 19:36:40","2025-01-13 19:36:40");
INSERT INTO product_purchases VALUES("136","95","68","","","","10","10","0","1","4500","0","0","0","45000","2025-01-13 19:36:40","2025-01-13 19:36:40");
INSERT INTO product_purchases VALUES("137","95","48","","","","27","27","0","1","7740","0","0","0","208980","2025-01-13 19:36:40","2025-01-13 19:36:40");
INSERT INTO product_purchases VALUES("138","95","47","","","","22","22","0","1","4848","0","0","0","106656","2025-01-13 19:36:40","2025-01-13 19:36:40");
INSERT INTO product_purchases VALUES("139","95","43","","","","34","34","0","1","8000","0","0","0","272000","2025-01-13 19:36:40","2025-01-13 19:36:40");
INSERT INTO product_purchases VALUES("140","95","102","","","","15","15","0","1","4500","0","0","0","67500","2025-01-13 19:36:40","2025-01-13 19:36:40");
INSERT INTO product_purchases VALUES("141","95","100","","","","22","22","0","1","4500","0","0","0","99000","2025-01-13 19:36:40","2025-01-13 19:36:40");
INSERT INTO product_purchases VALUES("142","95","99","","","","14","14","0","1","4500","0","0","0","63000","2025-01-13 19:36:40","2025-01-13 19:36:40");
INSERT INTO product_purchases VALUES("143","95","101","","","","15","15","0","1","4500","0","0","0","67500","2025-01-13 19:36:40","2025-01-13 19:36:40");
INSERT INTO product_purchases VALUES("144","95","44","","","","1","1","0","1","8000","0","0","0","8000","2025-01-13 19:36:40","2025-01-13 19:36:40");
INSERT INTO product_purchases VALUES("145","95","67","","","","1","1","0","1","4500","0","0","0","4500","2025-01-13 19:36:40","2025-01-13 19:36:40");
INSERT INTO product_purchases VALUES("146","95","46","","","","12","12","0","1","8000","0","0","0","96000","2025-01-13 19:36:40","2025-01-13 19:36:40");
INSERT INTO product_purchases VALUES("147","95","62","","","","6","6","0","1","15000","0","0","0","90000","2025-01-13 19:36:40","2025-01-13 19:36:40");
INSERT INTO product_purchases VALUES("148","95","2","","","","5","5","0","1","1500","0","0","0","7500","2025-01-13 19:36:40","2025-01-13 19:36:40");
INSERT INTO product_purchases VALUES("149","95","81","","","","17","17","0","1","4500","0","0","0","76500","2025-01-13 19:36:40","2025-01-13 19:36:40");
INSERT INTO product_purchases VALUES("150","95","83","","","","5","5","0","1","4500","0","0","0","22500","2025-01-13 19:36:40","2025-01-13 19:36:40");
INSERT INTO product_purchases VALUES("151","95","82","","","","12","12","0","1","4500","0","0","0","54000","2025-01-13 19:36:40","2025-01-13 19:36:40");
INSERT INTO product_purchases VALUES("152","95","35","","","","2","2","0","1","7000","0","0","0","14000","2025-01-13 19:36:40","2025-01-13 19:36:40");
INSERT INTO product_purchases VALUES("153","95","38","","","","1","1","0","1","4500","0","0","0","4500","2025-01-13 19:36:40","2025-01-13 19:36:40");
INSERT INTO product_purchases VALUES("154","95","24","","","","27","27","0","1","600","0","0","0","16200","2025-01-13 19:36:40","2025-01-13 19:36:40");
INSERT INTO product_purchases VALUES("155","95","53","","","","1","1","0","1","7122","0","0","0","7122","2025-01-13 19:36:40","2025-01-13 19:36:40");
INSERT INTO product_purchases VALUES("156","95","97","","","","2","2","0","1","7000","0","0","0","14000","2025-01-13 19:36:40","2025-01-13 19:36:40");
INSERT INTO product_purchases VALUES("157","95","3","","","","17","17","0","1","450","0","0","0","7650","2025-01-13 19:36:40","2025-01-13 19:36:40");
INSERT INTO product_purchases VALUES("158","95","49","","","","1","1","0","1","8100","0","0","0","8100","2025-01-13 19:36:40","2025-01-13 19:36:40");
INSERT INTO product_purchases VALUES("159","95","50","","","","1","1","0","1","8400","0","0","0","8400","2025-01-13 19:36:40","2025-01-13 19:36:40");
INSERT INTO product_purchases VALUES("160","95","34","","","","4","4","0","1","9000","0","0","0","36000","2025-01-13 19:36:40","2025-01-13 19:36:40");
INSERT INTO product_purchases VALUES("161","95","4","","","","22","22","0","1","450","0","0","0","9900","2025-01-13 19:36:40","2025-01-13 19:36:40");
INSERT INTO product_purchases VALUES("162","95","13","","","","17","17","0","1","450","0","0","0","7650","2025-01-13 19:36:40","2025-01-13 19:36:40");
INSERT INTO product_purchases VALUES("163","95","16","","","","19","19","0","1","800","0","0","0","15200","2025-01-13 19:36:40","2025-01-13 19:36:40");
INSERT INTO product_purchases VALUES("164","95","14","","","","25","25","0","1","800","0","0","0","20000","2025-01-13 19:36:40","2025-01-13 19:36:40");
INSERT INTO product_purchases VALUES("165","95","18","","","","30","30","0","1","800","0","0","0","24000","2025-01-13 19:36:40","2025-01-13 19:36:40");
INSERT INTO product_purchases VALUES("166","95","15","","","","37","37","0","1","800","0","0","0","29600","2025-01-13 19:36:40","2025-01-13 19:36:40");
INSERT INTO product_purchases VALUES("167","95","41","","","","19","19","0","1","8000","0","0","0","152000","2025-01-13 19:36:40","2025-01-13 19:36:40");
INSERT INTO product_purchases VALUES("168","95","65","","","","3","3","0","1","4500","0","0","0","13500","2025-01-13 19:36:41","2025-01-13 19:36:41");
INSERT INTO product_purchases VALUES("169","95","64","","","","23","23","0","1","4500","0","0","0","103500","2025-01-13 19:36:41","2025-01-13 19:36:41");
INSERT INTO product_purchases VALUES("170","95","76","","","","4","4","0","1","4500","0","0","0","18000","2025-01-13 19:36:41","2025-01-13 19:36:41");
INSERT INTO product_purchases VALUES("171","95","77","","","","3","3","0","1","4500","0","0","0","13500","2025-01-13 19:36:41","2025-01-13 19:36:41");
INSERT INTO product_purchases VALUES("172","95","10","","","","1","1","0","1","800","0","0","0","800","2025-01-13 19:36:41","2025-01-13 19:36:41");
INSERT INTO product_purchases VALUES("173","95","42","","","","41","41","0","1","8000","0","0","0","328000","2025-01-13 19:36:41","2025-01-13 19:36:41");
INSERT INTO product_purchases VALUES("174","95","91","","","","5","5","0","1","2500","0","0","0","12500","2025-01-13 19:36:41","2025-01-13 19:36:41");
INSERT INTO product_purchases VALUES("175","95","73","","","","2","2","0","1","4500","0","0","0","9000","2025-01-13 19:36:41","2025-01-13 19:36:41");
INSERT INTO product_purchases VALUES("176","95","12","","","","67","67","0","1","850","0","0","0","56950","2025-01-13 19:36:41","2025-01-13 19:36:41");
INSERT INTO product_purchases VALUES("177","95","63","","","","4","4","0","1","4500","0","0","0","18000","2025-01-13 19:36:41","2025-01-13 19:36:41");
INSERT INTO product_purchases VALUES("178","95","71","","","","9","9","0","1","4500","0","0","0","40500","2025-01-13 19:36:41","2025-01-13 19:36:41");
INSERT INTO product_purchases VALUES("179","95","39","","","","40","40","0","1","7500","0","0","0","300000","2025-01-13 19:36:41","2025-01-13 19:36:41");
INSERT INTO product_purchases VALUES("180","95","69","","","","1","1","0","1","4500","0","0","0","4500","2025-01-13 19:36:41","2025-01-13 19:36:41");
INSERT INTO product_purchases VALUES("181","95","20","","","","19","19","0","1","1500","0","0","0","28500","2025-01-13 19:36:41","2025-01-13 19:36:41");
INSERT INTO product_purchases VALUES("182","95","22","","","","32","32","0","1","800","0","0","0","25600","2025-01-13 19:36:41","2025-01-13 19:36:41");
INSERT INTO product_purchases VALUES("183","95","17","","","","45","45","0","1","800","0","0","0","36000","2025-01-13 19:36:41","2025-01-13 19:36:41");
INSERT INTO product_purchases VALUES("184","95","21","","","","23","23","0","1","800","0","0","0","18400","2025-01-13 19:36:41","2025-01-13 19:36:41");
INSERT INTO product_purchases VALUES("185","95","19","","","","25","25","0","1","800","0","0","0","20000","2025-01-13 19:36:41","2025-01-13 19:36:41");
INSERT INTO product_purchases VALUES("186","95","54","","","","3","3","0","1","7000","0","0","0","21000","2025-01-13 19:36:41","2025-01-13 19:36:41");
INSERT INTO product_purchases VALUES("187","95","29","","","","2","2","0","1","80","0","0","0","160","2025-01-13 19:36:41","2025-01-13 19:36:41");
INSERT INTO product_purchases VALUES("188","95","7","","","","37","37","0","1","450","0","0","0","16650","2025-01-13 19:36:41","2025-01-13 19:36:41");
INSERT INTO product_purchases VALUES("189","96","104","","","","4","4","0","1","7000","0","0","0","28000","2025-01-14 11:36:55","2025-01-14 11:36:55");
INSERT INTO product_purchases VALUES("190","97","105","","","","21","21","0","1","7000","0","0","0","147000","2025-01-14 11:40:10","2025-01-14 11:40:10");
INSERT INTO product_purchases VALUES("191","98","106","","","","5","5","0","1","4878","0","0","0","24390","2025-01-14 11:55:24","2025-01-14 11:55:24");
INSERT INTO product_purchases VALUES("192","99","107","","","","3","3","0","1","4885","0","0","0","14655","2025-01-14 11:58:36","2025-01-14 11:58:36");
INSERT INTO product_purchases VALUES("193","100","108","","","","5","5","0","1","4545","0","0","0","22725","2025-01-14 12:00:43","2025-01-14 12:00:43");
INSERT INTO product_purchases VALUES("194","101","110","","","","7","7","0","1","1545","0","0","0","10815","2025-01-14 12:04:09","2025-01-14 12:04:09");
INSERT INTO product_purchases VALUES("195","102","111","","","","4","4","0","1","5455","0","0","0","21820","2025-01-14 12:05:45","2025-01-14 12:05:45");
INSERT INTO product_purchases VALUES("196","103","112","","","","4","4","0","1","6546","0","0","0","26184","2025-01-14 12:11:47","2025-01-14 12:11:47");
INSERT INTO product_purchases VALUES("197","104","113","","","","1","1","0","1","5252","0","0","0","5252","2025-01-14 12:25:46","2025-01-14 12:25:46");
INSERT INTO product_purchases VALUES("198","105","114","","","","14","14","0","1","4250","0","0","0","59500","2025-01-14 12:30:48","2025-01-14 12:30:48");
INSERT INTO product_purchases VALUES("199","106","115","","","","4","4","0","1","1750","0","0","0","7000","2025-01-14 12:35:02","2025-01-14 12:35:02");
INSERT INTO product_purchases VALUES("200","107","116","","","","10","10","0","1","5400","0","0","0","54000","2025-01-14 12:38:00","2025-01-14 12:38:00");
INSERT INTO product_purchases VALUES("201","108","117","","","","2","2","0","1","3500","0","0","0","7000","2025-01-14 12:42:11","2025-01-14 12:42:11");
INSERT INTO product_purchases VALUES("202","109","118","","","","10","10","0","1","3500","0","0","0","35000","2025-01-14 12:44:15","2025-01-14 12:44:15");
INSERT INTO product_purchases VALUES("203","110","119","","","","9","9","0","1","5500","0","0","0","49500","2025-01-14 12:46:21","2025-01-14 12:46:21");
INSERT INTO product_purchases VALUES("204","111","120","","","","1","1","0","1","6500","0","0","0","6500","2025-01-14 12:53:14","2025-01-14 12:53:14");
INSERT INTO product_purchases VALUES("205","112","121","","","","1","1","0","1","5600","0","0","0","5600","2025-01-14 13:06:49","2025-01-14 13:06:49");
INSERT INTO product_purchases VALUES("206","113","122","","","","1","1","0","1","6500","0","0","0","6500","2025-01-14 13:10:16","2025-01-14 13:10:16");
INSERT INTO product_purchases VALUES("207","114","123","","","","5","5","0","1","4800","0","0","0","24000","2025-01-14 13:13:20","2025-01-14 13:13:20");
INSERT INTO product_purchases VALUES("208","115","124","","","","3","3","0","1","4500","0","0","0","13500","2025-01-14 13:17:26","2025-01-14 13:17:26");
INSERT INTO product_purchases VALUES("209","116","125","","","","3","3","0","1","600","0","0","0","1800","2025-01-14 13:19:39","2025-01-14 13:19:39");
INSERT INTO product_purchases VALUES("210","117","126","","","","3","3","0","1","450","0","0","0","1350","2025-01-14 13:21:57","2025-01-14 13:21:57");
INSERT INTO product_purchases VALUES("211","118","128","","","","6","6","0","1","1650","0","0","0","9900","2025-01-14 13:26:48","2025-01-14 13:26:48");
INSERT INTO product_purchases VALUES("212","119","129","","","","10","10","0","1","350","0","0","0","3500","2025-01-14 13:33:27","2025-01-14 13:33:27");
INSERT INTO product_purchases VALUES("213","120","130","","","","10","10","0","1","28000","0","0","0","280000","2025-01-15 16:49:55","2025-01-15 16:49:55");
INSERT INTO product_purchases VALUES("214","121","117","","","","7","7","0","1","3500","0","0","0","24500","2025-01-15 16:54:31","2025-01-15 16:54:31");



CREATE TABLE `product_quotation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quotation_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `qty` double NOT NULL,
  `sale_unit_id` int(11) NOT NULL,
  `net_unit_price` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `product_returns` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `return_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text DEFAULT NULL,
  `qty` double NOT NULL,
  `sale_unit_id` int(11) NOT NULL,
  `net_unit_price` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `product_sales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sale_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text DEFAULT NULL,
  `qty` double NOT NULL,
  `return_qty` double NOT NULL DEFAULT 0,
  `sale_unit_id` int(11) NOT NULL,
  `net_unit_price` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_delivered` tinyint(1) DEFAULT NULL,
  `is_packing` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_sales VALUES("9","7","3","","","null","1","0","1","500","0","0","0","500","2025-01-15 17:45:11","2025-01-15 17:45:11","","");
INSERT INTO product_sales VALUES("10","8","72","","","null","1","0","1","4500","0","0","0","4500","2025-01-15 17:46:39","2025-01-15 17:46:39","","");
INSERT INTO product_sales VALUES("11","8","15","","","null","1","0","1","1000","0","0","0","1000","2025-01-15 17:46:39","2025-01-15 17:46:39","","");
INSERT INTO product_sales VALUES("12","8","13","","","null","1","0","1","500","0","0","0","500","2025-01-15 17:46:39","2025-01-15 17:46:39","","");
INSERT INTO product_sales VALUES("13","8","8","","","null","1","0","1","500","0","0","0","500","2025-01-15 17:46:39","2025-01-15 17:46:39","","");
INSERT INTO product_sales VALUES("14","8","9","","","null","1","0","1","500","0","0","0","500","2025-01-15 17:46:39","2025-01-15 17:46:39","","");
INSERT INTO product_sales VALUES("15","8","1","","","null","1","0","1","500","0","0","0","500","2025-01-15 17:46:39","2025-01-15 17:46:39","","");



CREATE TABLE `product_transfer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transfer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text DEFAULT NULL,
  `qty` double NOT NULL,
  `purchase_unit_id` int(11) NOT NULL,
  `net_unit_cost` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `product_variants` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `item_code` varchar(191) NOT NULL,
  `additional_cost` double DEFAULT NULL,
  `additional_price` double DEFAULT NULL,
  `qty` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `product_warehouse` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` varchar(191) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text DEFAULT NULL,
  `warehouse_id` int(11) NOT NULL,
  `qty` double NOT NULL,
  `price` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_warehouse VALUES("1","1","","","null,null,null","2","23","","2025-01-12 14:03:19","2025-01-16 00:50:39");
INSERT INTO product_warehouse VALUES("2","13","","","null","2","26","","2025-01-12 14:59:02","2025-01-15 17:46:39");
INSERT INTO product_warehouse VALUES("3","15","","","null","2","37","","2025-01-12 15:09:07","2025-01-15 17:46:39");
INSERT INTO product_warehouse VALUES("4","16","","","null","2","20","","2025-01-12 15:11:31","2025-01-13 19:36:40");
INSERT INTO product_warehouse VALUES("5","17","","","","2","46","","2025-01-12 15:13:39","2025-01-13 19:36:41");
INSERT INTO product_warehouse VALUES("6","18","","","","2","31","","2025-01-12 15:16:16","2025-01-13 19:36:40");
INSERT INTO product_warehouse VALUES("7","19","","","","2","26","","2025-01-12 15:20:18","2025-01-13 19:36:41");
INSERT INTO product_warehouse VALUES("8","20","","","","2","20","","2025-01-12 15:22:28","2025-01-13 19:36:41");
INSERT INTO product_warehouse VALUES("9","21","","","","2","24","","2025-01-12 15:28:25","2025-01-13 19:36:41");
INSERT INTO product_warehouse VALUES("10","22","","","","2","33","","2025-01-12 15:30:03","2025-01-13 19:36:41");
INSERT INTO product_warehouse VALUES("11","23","","","","2","1","","2025-01-12 15:33:05","2025-01-12 15:33:05");
INSERT INTO product_warehouse VALUES("12","24","","","","2","28","","2025-01-12 15:35:40","2025-01-13 19:36:40");
INSERT INTO product_warehouse VALUES("13","25","","","","2","7","","2025-01-12 15:43:13","2025-01-13 19:36:39");
INSERT INTO product_warehouse VALUES("14","26","","","","2","1","","2025-01-12 15:45:35","2025-01-12 15:45:35");
INSERT INTO product_warehouse VALUES("15","27","","","","2","5","","2025-01-12 15:51:32","2025-01-13 19:36:39");
INSERT INTO product_warehouse VALUES("16","28","","","","2","1","","2025-01-12 15:53:51","2025-01-12 15:53:51");
INSERT INTO product_warehouse VALUES("17","29","","","","2","3","","2025-01-12 15:56:59","2025-01-13 19:36:41");
INSERT INTO product_warehouse VALUES("18","30","","","","2","6","","2025-01-12 15:59:22","2025-01-13 19:36:39");
INSERT INTO product_warehouse VALUES("19","31","","","null","2","5","","2025-01-12 16:05:03","2025-01-13 19:36:39");
INSERT INTO product_warehouse VALUES("20","32","","","","2","3","","2025-01-12 16:11:33","2025-01-13 19:36:39");
INSERT INTO product_warehouse VALUES("21","33","","","","2","5","","2025-01-12 16:14:04","2025-01-13 19:36:39");
INSERT INTO product_warehouse VALUES("22","34","","","","2","5","","2025-01-12 16:15:58","2025-01-13 19:36:40");
INSERT INTO product_warehouse VALUES("23","35","","","","2","3","","2025-01-12 16:18:29","2025-01-13 19:36:40");
INSERT INTO product_warehouse VALUES("24","36","","","","2","2","","2025-01-12 16:20:20","2025-01-13 19:36:39");
INSERT INTO product_warehouse VALUES("25","37","","","","2","2","","2025-01-12 16:22:12","2025-01-13 19:36:39");
INSERT INTO product_warehouse VALUES("26","38","","","","2","2","","2025-01-12 16:24:01","2025-01-13 19:36:40");
INSERT INTO product_warehouse VALUES("27","39","","","","2","41","","2025-01-12 16:26:54","2025-01-13 19:36:41");
INSERT INTO product_warehouse VALUES("28","40","","","","2","19","","2025-01-12 16:29:04","2025-01-13 19:36:40");
INSERT INTO product_warehouse VALUES("29","41","","","","2","20","","2025-01-12 16:37:22","2025-01-13 19:36:40");
INSERT INTO product_warehouse VALUES("30","42","","","","2","42","","2025-01-12 16:45:50","2025-01-13 19:36:41");
INSERT INTO product_warehouse VALUES("31","43","","","null","2","35","","2025-01-12 16:48:49","2025-01-13 19:36:40");
INSERT INTO product_warehouse VALUES("32","44","","","","2","2","","2025-01-12 16:51:42","2025-01-13 19:36:40");
INSERT INTO product_warehouse VALUES("33","45","","","","2","1","","2025-01-12 16:54:54","2025-01-12 16:54:54");
INSERT INTO product_warehouse VALUES("34","46","","","","2","13","","2025-01-12 16:58:06","2025-01-13 19:36:40");
INSERT INTO product_warehouse VALUES("35","47","","","","2","23","","2025-01-12 17:02:48","2025-01-13 19:36:40");
INSERT INTO product_warehouse VALUES("36","48","","","","2","28","","2025-01-12 17:05:58","2025-01-13 19:36:40");
INSERT INTO product_warehouse VALUES("37","49","","","","2","2","","2025-01-12 17:11:56","2025-01-13 19:36:40");
INSERT INTO product_warehouse VALUES("38","50","","","","2","2","","2025-01-12 17:14:14","2025-01-13 19:36:40");
INSERT INTO product_warehouse VALUES("39","51","","","","2","8","","2025-01-12 17:17:57","2025-01-13 19:36:39");
INSERT INTO product_warehouse VALUES("40","52","","","","2","6","","2025-01-12 17:21:06","2025-01-13 19:36:39");
INSERT INTO product_warehouse VALUES("41","53","","","","2","2","","2025-01-12 17:26:09","2025-01-13 19:36:40");
INSERT INTO product_warehouse VALUES("42","54","","","","2","4","","2025-01-12 17:27:42","2025-01-13 19:36:41");
INSERT INTO product_warehouse VALUES("43","55","","","","2","1","","2025-01-12 18:11:14","2025-01-13 18:18:09");
INSERT INTO product_warehouse VALUES("44","56","","","","2","1","","2025-01-12 18:16:54","2025-01-13 18:18:09");
INSERT INTO product_warehouse VALUES("45","57","","","","2","6","","2025-01-12 18:20:09","2025-01-13 19:36:39");
INSERT INTO product_warehouse VALUES("46","58","","","","2","4","","2025-01-12 18:24:26","2025-01-13 19:36:39");
INSERT INTO product_warehouse VALUES("47","59","","","","2","13","","2025-01-12 18:27:04","2025-01-13 19:36:39");
INSERT INTO product_warehouse VALUES("48","60","","","","2","3","","2025-01-12 18:30:49","2025-01-13 19:36:39");
INSERT INTO product_warehouse VALUES("49","61","","","","2","5","","2025-01-12 18:34:33","2025-01-13 19:36:39");
INSERT INTO product_warehouse VALUES("50","62","","","","2","7","","2025-01-12 18:36:51","2025-01-13 19:36:40");
INSERT INTO product_warehouse VALUES("51","63","","","","2","5","","2025-01-12 18:48:28","2025-01-13 19:36:41");
INSERT INTO product_warehouse VALUES("52","64","","","","2","24","","2025-01-12 18:49:54","2025-01-13 19:36:41");
INSERT INTO product_warehouse VALUES("53","65","","","","2","4","","2025-01-12 18:51:46","2025-01-13 19:36:41");
INSERT INTO product_warehouse VALUES("54","66","","","","2","5","","2025-01-12 18:53:33","2025-01-13 19:36:40");
INSERT INTO product_warehouse VALUES("55","67","","","","2","2","","2025-01-12 18:57:28","2025-01-13 19:36:40");
INSERT INTO product_warehouse VALUES("56","68","","","","2","11","","2025-01-12 18:59:59","2025-01-13 19:36:40");
INSERT INTO product_warehouse VALUES("57","69","","","","2","2","","2025-01-12 19:02:36","2025-01-13 19:36:41");
INSERT INTO product_warehouse VALUES("58","70","","","","2","1","","2025-01-12 19:04:11","2025-01-12 19:04:11");
INSERT INTO product_warehouse VALUES("59","71","","","","2","10","","2025-01-12 19:07:07","2025-01-13 19:36:41");
INSERT INTO product_warehouse VALUES("60","72","","","","2","24","","2025-01-12 19:08:42","2025-01-15 17:46:39");
INSERT INTO product_warehouse VALUES("61","73","","","","2","3","","2025-01-12 19:10:44","2025-01-13 19:36:41");
INSERT INTO product_warehouse VALUES("62","74","","","","2","1","","2025-01-12 19:12:21","2025-01-12 19:12:21");
INSERT INTO product_warehouse VALUES("63","75","","","","2","35","","2025-01-12 19:21:39","2025-01-13 19:36:39");
INSERT INTO product_warehouse VALUES("64","76","","","","2","5","","2025-01-12 19:23:14","2025-01-13 19:36:41");
INSERT INTO product_warehouse VALUES("65","77","","","","2","4","","2025-01-12 19:24:30","2025-01-13 19:36:41");
INSERT INTO product_warehouse VALUES("66","78","","","","2","6","","2025-01-12 19:26:23","2025-01-13 19:36:40");
INSERT INTO product_warehouse VALUES("67","79","","","","2","23","","2025-01-12 19:42:50","2025-01-13 19:36:39");
INSERT INTO product_warehouse VALUES("68","80","","","","2","1","","2025-01-12 19:46:17","2025-01-12 19:46:17");
INSERT INTO product_warehouse VALUES("69","81","","","","2","18","","2025-01-12 19:47:54","2025-01-13 19:36:40");
INSERT INTO product_warehouse VALUES("70","82","","","","2","13","","2025-01-12 19:50:12","2025-01-13 19:36:40");
INSERT INTO product_warehouse VALUES("71","83","","","","2","6","","2025-01-12 19:51:55","2025-01-13 19:36:40");
INSERT INTO product_warehouse VALUES("72","84","","","","2","8","","2025-01-12 19:55:01","2025-01-13 19:36:39");
INSERT INTO product_warehouse VALUES("73","85","","","","2","2","","2025-01-12 20:00:20","2025-01-13 19:36:39");
INSERT INTO product_warehouse VALUES("74","86","","","","2","4","","2025-01-12 20:02:08","2025-01-13 19:36:39");
INSERT INTO product_warehouse VALUES("75","87","","","","2","8","","2025-01-12 20:04:03","2025-01-13 19:36:39");
INSERT INTO product_warehouse VALUES("76","88","","","","2","5","","2025-01-12 20:06:46","2025-01-13 19:36:39");
INSERT INTO product_warehouse VALUES("77","89","","","","2","21","","2025-01-12 20:09:05","2025-01-13 19:36:39");
INSERT INTO product_warehouse VALUES("78","90","","","","2","14","","2025-01-12 20:10:54","2025-01-13 19:36:39");
INSERT INTO product_warehouse VALUES("79","91","","","","2","6","","2025-01-12 20:12:29","2025-01-13 19:36:41");
INSERT INTO product_warehouse VALUES("80","92","","","","2","8","","2025-01-12 20:14:44","2025-01-13 19:36:40");
INSERT INTO product_warehouse VALUES("81","93","","","","2","5","","2025-01-12 20:17:42","2025-01-13 19:36:39");
INSERT INTO product_warehouse VALUES("82","94","","","","2","9","","2025-01-12 20:21:53","2025-01-13 19:36:40");
INSERT INTO product_warehouse VALUES("83","95","","","","2","10","","2025-01-12 20:23:30","2025-01-13 19:36:40");
INSERT INTO product_warehouse VALUES("84","96","","","","2","7","","2025-01-12 20:27:30","2025-01-13 19:36:39");
INSERT INTO product_warehouse VALUES("85","97","","","","2","3","","2025-01-12 20:32:37","2025-01-13 19:36:40");
INSERT INTO product_warehouse VALUES("86","98","","","","2","4","","2025-01-12 20:34:38","2025-01-13 19:36:39");
INSERT INTO product_warehouse VALUES("87","99","","","","2","15","","2025-01-12 20:38:05","2025-01-13 19:36:40");
INSERT INTO product_warehouse VALUES("88","100","","","","2","23","","2025-01-12 20:41:14","2025-01-13 19:36:40");
INSERT INTO product_warehouse VALUES("89","101","","","","2","16","","2025-01-12 20:42:54","2025-01-13 19:36:40");
INSERT INTO product_warehouse VALUES("90","102","","","","2","16","","2025-01-12 20:45:13","2025-01-13 19:36:40");
INSERT INTO product_warehouse VALUES("91","103","","","","2","1","","2025-01-12 21:02:39","2025-01-12 21:02:39");
INSERT INTO product_warehouse VALUES("92","8","","","","2","12","","2025-01-13 17:33:00","2025-01-15 17:46:39");
INSERT INTO product_warehouse VALUES("93","9","","","","2","11","500","2025-01-13 19:36:39","2025-01-15 17:46:39");
INSERT INTO product_warehouse VALUES("94","6","","","","2","8","500","2025-01-13 19:36:39","2025-01-13 19:36:39");
INSERT INTO product_warehouse VALUES("95","11","","","","2","1","1000","2025-01-13 19:36:40","2025-01-13 19:36:40");
INSERT INTO product_warehouse VALUES("96","2","","","","2","5","2000","2025-01-13 19:36:40","2025-01-13 19:36:40");
INSERT INTO product_warehouse VALUES("97","3","","","","2","16","","2025-01-13 19:36:40","2025-01-15 17:45:11");
INSERT INTO product_warehouse VALUES("98","4","","","","2","22","500","2025-01-13 19:36:40","2025-01-13 19:36:40");
INSERT INTO product_warehouse VALUES("99","14","","","","2","25","","2025-01-13 19:36:40","2025-01-15 14:10:22");
INSERT INTO product_warehouse VALUES("100","10","","","","2","1","","2025-01-13 19:36:41","2025-01-15 15:24:56");
INSERT INTO product_warehouse VALUES("101","12","","","","2","67","","2025-01-13 19:36:41","2025-01-15 15:22:58");
INSERT INTO product_warehouse VALUES("102","7","","","","2","37","500","2025-01-13 19:36:41","2025-01-13 19:36:41");
INSERT INTO product_warehouse VALUES("103","104","","","","2","4","","2025-01-14 11:36:55","2025-01-14 11:36:55");
INSERT INTO product_warehouse VALUES("104","105","","","","2","21","","2025-01-14 11:40:10","2025-01-14 11:40:10");
INSERT INTO product_warehouse VALUES("105","106","","","","2","5","","2025-01-14 11:55:24","2025-01-14 11:55:24");
INSERT INTO product_warehouse VALUES("106","107","","","","2","3","","2025-01-14 11:58:36","2025-01-14 11:58:36");
INSERT INTO product_warehouse VALUES("107","108","","","","2","5","","2025-01-14 12:00:43","2025-01-14 12:00:43");
INSERT INTO product_warehouse VALUES("108","110","","","","2","7","","2025-01-14 12:04:09","2025-01-14 12:04:09");
INSERT INTO product_warehouse VALUES("109","111","","","","2","4","","2025-01-14 12:05:45","2025-01-14 12:05:45");
INSERT INTO product_warehouse VALUES("110","112","","","","2","4","","2025-01-14 12:11:47","2025-01-14 12:11:47");
INSERT INTO product_warehouse VALUES("111","113","","","","2","1","","2025-01-14 12:25:46","2025-01-14 12:25:46");
INSERT INTO product_warehouse VALUES("112","114","","","","2","14","","2025-01-14 12:30:48","2025-01-14 12:30:48");
INSERT INTO product_warehouse VALUES("113","115","","","","2","4","","2025-01-14 12:35:02","2025-01-14 12:35:02");
INSERT INTO product_warehouse VALUES("114","116","","","","2","10","","2025-01-14 12:38:00","2025-01-14 12:38:00");
INSERT INTO product_warehouse VALUES("115","117","","","","2","9","","2025-01-14 12:42:11","2025-01-15 16:54:31");
INSERT INTO product_warehouse VALUES("116","118","","","","2","10","","2025-01-14 12:44:15","2025-01-14 12:44:15");
INSERT INTO product_warehouse VALUES("117","119","","","","2","9","","2025-01-14 12:46:21","2025-01-14 12:46:21");
INSERT INTO product_warehouse VALUES("118","120","","","","2","1","","2025-01-14 12:53:14","2025-01-14 12:53:14");
INSERT INTO product_warehouse VALUES("119","121","","","","2","1","","2025-01-14 13:06:49","2025-01-14 13:06:49");
INSERT INTO product_warehouse VALUES("120","122","","","","2","1","","2025-01-14 13:10:16","2025-01-14 13:10:16");
INSERT INTO product_warehouse VALUES("121","123","","","","2","5","","2025-01-14 13:13:20","2025-01-14 13:13:20");
INSERT INTO product_warehouse VALUES("122","124","","","","2","3","","2025-01-14 13:17:26","2025-01-14 13:17:26");
INSERT INTO product_warehouse VALUES("123","125","","","","2","3","","2025-01-14 13:19:39","2025-01-14 13:19:39");
INSERT INTO product_warehouse VALUES("124","126","","","","2","3","","2025-01-14 13:21:57","2025-01-14 13:21:57");
INSERT INTO product_warehouse VALUES("125","128","","","","2","6","","2025-01-14 13:26:48","2025-01-14 13:26:48");
INSERT INTO product_warehouse VALUES("126","129","","","","2","10","","2025-01-14 13:33:27","2025-01-14 13:33:27");
INSERT INTO product_warehouse VALUES("127","130","","","","2","10","","2025-01-15 16:49:55","2025-01-15 16:49:55");



CREATE TABLE `productions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(255) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `total_qty` int(11) NOT NULL,
  `total_tax` double NOT NULL,
  `total_cost` double NOT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `status` int(11) NOT NULL,
  `document` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `barcode_symbology` varchar(191) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `purchase_unit_id` int(11) NOT NULL,
  `sale_unit_id` int(11) NOT NULL,
  `cost` double NOT NULL,
  `price` double NOT NULL,
  `wholesale_price` double DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `alert_quantity` double DEFAULT NULL,
  `daily_sale_objective` double DEFAULT NULL,
  `promotion` tinyint(4) DEFAULT NULL,
  `promotion_price` varchar(191) DEFAULT NULL,
  `starting_date` varchar(200) DEFAULT NULL,
  `last_date` date DEFAULT NULL,
  `tax_id` int(11) DEFAULT NULL,
  `tax_method` int(11) DEFAULT NULL,
  `image` longtext DEFAULT NULL,
  `file` varchar(191) DEFAULT NULL,
  `is_embeded` tinyint(1) DEFAULT NULL,
  `is_variant` tinyint(1) DEFAULT NULL,
  `is_batch` tinyint(1) DEFAULT NULL,
  `is_diffPrice` tinyint(1) DEFAULT NULL,
  `is_imei` tinyint(1) DEFAULT NULL,
  `featured` tinyint(4) DEFAULT NULL,
  `product_list` varchar(191) DEFAULT NULL,
  `variant_list` varchar(191) DEFAULT NULL,
  `qty_list` varchar(191) DEFAULT NULL,
  `price_list` varchar(191) DEFAULT NULL,
  `product_details` text DEFAULT NULL,
  `variant_option` text DEFAULT NULL,
  `variant_value` text DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_sync_disable` tinyint(4) DEFAULT NULL,
  `woocommerce_product_id` int(11) DEFAULT NULL,
  `woocommerce_media_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO products VALUES("1","BEAUFORT - Bière blonde légère 33cl","9501100003065","standard","C128","2","2","1","1","1","430","500","450","23","","","","","","","","1","202501120203181.PNG","","","","","","","1","","","","","","","","1","","","","2025-01-12 14:03:18","2025-01-16 00:50:39","");
INSERT INTO products VALUES("2","SANBITTER 6X100ML","8002270009242","standard","C128","3","3","1","1","1","1500","2000","","5","","","","","","","","1","202501120206291.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 14:06:30","2025-01-13 19:36:40","");
INSERT INTO products VALUES("3","GIN BITTERS 250ML ALC18%VOL","6186000690367","standard","C128","1","1","1","1","1","450","500","","16","","","","","","","","1","202501120212011.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 14:12:02","2025-01-15 17:45:11","");
INSERT INTO products VALUES("4","CODY&amp;#039;S - Bière saveur citron 5,9% 500ml","4012440026997","standard","C128","2","2","1","1","1","450","500","","22","","","","","","","","1","202501120214161.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 14:14:17","2025-01-13 19:36:40","");
INSERT INTO products VALUES("5","RACINES - Bière 33cl","5407010260380","standard","C128","2","2","1","1","1","450","500","","0","","","","","","","","1","202501120216321.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 14:16:33","2025-01-12 15:03:08","");
INSERT INTO products VALUES("6","YOUKI  MOKA-CAFE 33CL","3700029400580","standard","C128","2","3","1","1","1","450","500","","8","","","","","","","","1","202501120218591.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 14:18:59","2025-01-13 19:36:39","");
INSERT INTO products VALUES("7","Castro lager Alc5.9%vol","0703290192454","standard","C128","2","2","1","1","1","450","500","","37","","","","","","","","1","202501120224021.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 14:24:03","2025-01-13 19:36:41","");
INSERT INTO products VALUES("8","CALAO MENTOS 250ML ALC18%VOL","6186000690466","standard","C128","1","1","1","1","1","450","500","","12","","","","","","","","1","202501120228191.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 14:28:20","2025-01-15 17:46:39","");
INSERT INTO products VALUES("9","YOUKI -  Pomme canette 33cl","3700029400573","standard","C128","2","3","1","1","1","450","500","","11","","","","","","","","1","202501120238191.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 14:38:19","2025-01-15 17:46:39","");
INSERT INTO products VALUES("10","958 SANTERO BLUE 250ML 6.5%VOL","8004385037127","standard","C128","4","4","1","1","1","850","1000","","1","","","","","","","","1","202501120243371.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 14:43:38","2025-01-15 15:24:56","");
INSERT INTO products VALUES("11","958 SANTERO TONICA 250ML","8004385037271","standard","C128","4","2","1","1","1","850","1000","","1","","","","","","","","1","202501120247401.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 14:47:41","2025-01-13 19:36:40","");
INSERT INTO products VALUES("12","958 SANTERO BELLENI 250ML 6.5%VOL","8004385037103","standard","C128","4","2","1","1","1","850","1000","","67","10","","","","","","","1","202501120251441.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 14:51:44","2025-01-15 15:22:58","");
INSERT INTO products VALUES("13","COCA.COLA 33CL","5449000000996","standard","C128","2","3","1","1","1","450","500","","26","","","","","","","","1","202501120259011.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 14:59:02","2025-01-15 17:46:39","");
INSERT INTO products VALUES("14","Ciao secco 200ML 10.5%VOL","8033116401876","standard","C128","5","5","1","1","1","700","1000","","25","","","","","","","","1","202501120306441.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 15:06:45","2025-01-15 14:10:22","");
INSERT INTO products VALUES("15","CIAO ROSE 200ML 10.5%VOL","8033116401043","standard","C128","5","5","1","1","1","700","1000","","37","","","","","","","","1","202501120309071.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 15:09:07","2025-01-15 17:46:39","");
INSERT INTO products VALUES("16","CIAO SFRITA 200ML 6.9% ALC","8033116402392","standard","C128","5","5","1","1","1","700","1000","","20","","","","","","","","1","202501120311301.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 15:11:31","2025-01-15 14:11:34","");
INSERT INTO products VALUES("17","Ciao Mojito 200ML ALC 6.6%VOL","8033116408295","standard","C128","5","5","1","1","1","700","1000","","46","","","","","","","","1","202501120313381.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 15:13:39","2025-01-15 14:51:44","");
INSERT INTO products VALUES("18","Ciao Sangria 200ml alc 6.9%vol","8033116403894","standard","C128","5","5","1","1","1","700","1000","","31","","","","","","","","1","202501120316161.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 15:16:16","2025-01-15 14:09:28","");
INSERT INTO products VALUES("19","Ciao LE MON PEACH 200ml ALC 5%vol","8033116402521","standard","C128","5","5","1","1","1","700","1000","","26","","","","","","","","1","202501120320171.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 15:20:18","2025-01-15 14:50:22","");
INSERT INTO products VALUES("20","CIAO PINO GRIGRIO 250ml ALC 12%vol","8033116409209","standard","C128","5","5","1","1","1","850","1250","","20","","","","","","","","1","202501120322271.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 15:22:28","2025-01-15 14:54:16","");
INSERT INTO products VALUES("21","CIAO LE MON PEACH ZERO 200ML","8033116407779","standard","C128","","3","1","1","1","700","1000","","24","","","","","","","","1","202501120328241.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 15:28:25","2025-01-15 14:51:05","");
INSERT INTO products VALUES("22","CIAO MOSCATO 200ML 8%VOL","8033116402859","standard","C128","5","5","1","1","1","700","1000","","33","","","","","","","","1","202501120330021.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 15:30:03","2025-01-15 14:52:22","");
INSERT INTO products VALUES("23","BEAUFORT - Bière blonde légère 25cl ALC 5%vol","9501100000163","standard","C128","2","2","1","1","2","600","2000","","1","","","","","","","","1","202501120333041.PNG","","","","","","","1","","","","","","","","1","","","","2025-01-12 15:33:05","2025-01-12 15:33:05","");
INSERT INTO products VALUES("24","HEINEKEN - Bière 250ml  ALC.5%VOL","6186000327249","standard","C128","2","2","1","1","2","600","2000","","28","","","","","","","","1","202501120335391.PNG","","","","","","","1","","","","","","","","1","","","","2025-01-12 15:35:40","2025-01-13 19:36:40","");
INSERT INTO products VALUES("25","WORLD COLA 33cl","5407010260687","standard","C128","2","3","1","1","1","450","500","","7","","","","","","","","1","202501120343121.PNG","","","","","","","1","","","","","","","","1","","","","2025-01-12 15:43:13","2025-01-13 19:36:39","");
INSERT INTO products VALUES("26","SPRITE 1.5L","5449000012203","standard","C128","2","3","1","1","1","850","1000","","1","","","","","","","","1","202501120345341.PNG","","","","","","","1","","","","","","","","1","","","","2025-01-12 15:45:35","2025-01-12 15:45:35","");
INSERT INTO products VALUES("27","YOUKI TONI 30CL X12","3700029406254","standard","C128","2","3","1","1","2","1500","1800","","5","","","","","","","","1","202501120351311.PNG","","","","","","","1","","","","","","","","1","","","","2025-01-12 15:51:32","2025-01-13 19:36:39","");
INSERT INTO products VALUES("28","CELESTE 0.5L X9","6181100099126","standard","C128","2","6","1","1","2","8000","1000","","1","","","","","","","","1","202501120353501.PNG","","","","","","","1","","","","","","","","1","","","","2025-01-12 15:53:51","2025-01-12 15:53:51","");
INSERT INTO products VALUES("29","CELESTE - Eau minérale naturelle 330ml","6186000182206","standard","C128","2","6","1","1","1","80","100","","3","","","","","","","","1","202501120356581.PNG","","","","","","","1","","","","","","","","1","","","","2025-01-12 15:56:59","2025-01-13 19:36:41","");
INSERT INTO products VALUES("30","ORANGINA 50CL  X6","8435185100955","standard","C128","2","3","1","1","4","1500","1800","","6","","","","","","","","1","202501120359221.PNG","","","","","","","1","","","","","","","","1","","","","2025-01-12 15:59:22","2025-01-13 19:36:39","");
INSERT INTO products VALUES("31","Pic Noir Merlot ALC 13%vol","3701394500943","standard","C128","1","5","1","1","1","4000","5000","","5","","","","","","","","1","202501120405021.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 16:05:03","2025-01-15 14:32:15","");
INSERT INTO products VALUES("32","VEUVE CLICQUOT Champagne Brut 750ml 12.5%vol","3049614222245","standard","C128","1","7","1","1","1","3500","6000","","3","","","","","","","","1","202501120411321.PNG","","","","","","","","","","","","","","","1","","","","2025-01-12 16:11:33","2025-01-13 19:36:39","");
INSERT INTO products VALUES("33","VEUVE CLICQUOT Champagne RICH 750ml 12%vol","3049614152337","standard","C128","1","7","1","1","1","4300","4500","","5","","","","","","","","1","202501120414031.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 16:14:04","2025-01-15 15:00:05","");
INSERT INTO products VALUES("34","DILE ROSSO","8004385033310","standard","C128","4","5","1","1","1","6000","8000","","5","","","","","","","","1","202501120415581.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 16:15:58","2025-01-15 14:14:02","");
INSERT INTO products VALUES("35","Lagrezette Mablec ROSE BERRY 750ML 12.5%vol","3555820245201","standard","C128","1","5","1","1","1","10000","8000","","3","","","","","","","","1","202501120418291.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 16:18:29","2025-01-15 14:19:52","");
INSERT INTO products VALUES("36","RLG Cuvée Carte D&amp;#039;or 750ml 15%vol","6186000690114","standard","C128","1","5","1","1","1","4500","5000","","2","","","","","","","","1","202501120420191.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 16:20:20","2025-01-15 14:40:14","");
INSERT INTO products VALUES("37","Lagrezette Malbec Pourpre","3555820665184","standard","C128","1","5","1","1","1","5000","6500","","2","","","","","","","","1","202501120422121.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 16:22:12","2025-01-15 14:21:20","");
INSERT INTO products VALUES("38","Lagrezette BLANC Pourpre","3555820685182","standard","C128","1","5","1","1","1","5000","6500","","2","","","","","","","","1","202501120424011.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 16:24:01","2025-01-15 14:19:09","");
INSERT INTO products VALUES("39","958 SANTERO 750ml 11.5Vol","8004385038667","standard","C128","4","5","1","1","1","10000","12000","","41","","","","","","","","1","202501120426531.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 16:26:53","2025-01-15 15:20:09","");
INSERT INTO products VALUES("40","958 SANTERO MILESIMATO 750ml 11.5%vol","8004385035741","standard","C128","4","5","1","1","1","7000","9000","","19","","","","","","","","1","202501120429031.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 16:29:04","2025-01-15 15:35:18","");
INSERT INTO products VALUES("41","958 Santero Extra Millesimato Gold","8004385038742","standard","C128","4","5","1","1","1","8000","10000","","20","","","","","","","","1","202501120437221.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 16:37:22","2025-01-15 15:28:57","");
INSERT INTO products VALUES("42","958 SANTERO BLACK MILLESIMATO – 750ML","8004385035079","standard","C128","4","5","1","1","1","8000","10000","","42","","","","","","","","1","202501120445491.PNG","","","","","","","1","","","","","","","","1","","","","2025-01-12 16:45:50","2025-01-13 19:36:41","");
INSERT INTO products VALUES("43","958 SANTERO GLAM 750 ML","8004385037677","standard","C128","4","4","1","1","1","6500","8000","","35","","","","","","","","1","202501120448491.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 16:48:49","2025-01-15 15:29:43","");
INSERT INTO products VALUES("44","SANTERO FRAGOLA VIN UP 750ml 6.5%vol","8004385032207","standard","C128","4","4","1","1","1","4000","5000","","2","","","","","","","","1","202501120451421.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 16:51:42","2025-01-15 15:58:37","");
INSERT INTO products VALUES("45","SANTERO PESCA VIN UP 750ml  ALC 6.5%VOL","8004385032184","standard","C128","4","4","1","1","1","6000","8000","","1","","","","","","","","1","202501120454541.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 16:54:54","2025-01-15 15:59:46","");
INSERT INTO products VALUES("46","SANTERO ASTI  DOLCE 750ml 7.5vol","8004385032108","standard","C128","4","5","1","1","1","4500","6000","","13","","","","","","","","1","202501120458051.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 16:58:06","2025-01-15 15:55:35","");
INSERT INTO products VALUES("47","958 SANTERO GLAM dry 750 ML","8004385037851","standard","C128","4","5","1","1","1","6500","8000","","23","","","","","","","","1","202501120502471.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 17:02:48","2025-01-15 15:30:21","");
INSERT INTO products VALUES("48","958 SANTERO GLAM SEMI DOCLE  750 ML","8004385037837","standard","C128","4","5","1","1","1","6500","8000","","28","","","","","","","","1","202501120505571.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 17:05:58","2025-01-15 15:30:59","");
INSERT INTO products VALUES("49","DILE ROSSINI BRRY 750ml ALC 5%vol","8004385035895","standard","C128","4","5","1","1","1","5000","7000","","2","","","","","","","","1","202501120511561.jpg","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 17:11:56","2025-01-15 14:15:32","");
INSERT INTO products VALUES("50","DILE BLUE 750ml 5%vol","8004385034348","standard","C128","4","5","1","1","1","5000","7000","","2","","","","","","","","1","202501120514131.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 17:14:14","2025-01-15 14:14:48","");
INSERT INTO products VALUES("51","Naud VSOP Fine Cognac 40% Vol. 70cl","3701394500004","standard","C128","6","1","1","1","1","30000","45000","","8","","","","","","","","1","202501120517571.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 17:17:57","2025-01-15 14:30:39","");
INSERT INTO products VALUES("52","NAUD ALCEE 70CL 45%Vol","3701394501117","standard","C128","6","1","1","1","1","35000","45000","","6","","","","","","","","1","202501120521061.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 17:21:06","2025-01-15 14:23:01","");
INSERT INTO products VALUES("53","GIN ROYAL 750ml 40%vol","6186000003303","standard","C128","1","1","1","1","1","7122","8000","","2","","","","","","","","1","202501120526081.PNG","","","","","","","1","","","","","","","","1","","","","2025-01-12 17:26:09","2025-01-13 19:36:40","");
INSERT INTO products VALUES("54","CHIRA VODKA BLEU","3770022104006","standard","C128","1","1","1","1","1","25000","27000","","4","","","","","","","","1","202501120527411.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 17:27:42","2025-01-15 14:49:06","");
INSERT INTO products VALUES("55","BOSCA ASTI","8002450936801","standard","C128","7","7","1","1","1","4000","5000","","1","","","","","","","","1","202501120611141.jpg","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 18:11:14","2025-01-15 14:44:48","");
INSERT INTO products VALUES("56","BOSCA ASTI 75","8002450001011","standard","C128","7","7","1","1","1","4000","5000","","1","","","","","","","","1","202501120616541.jpg","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 18:16:54","2025-01-15 14:45:32","");
INSERT INTO products VALUES("57","Naud Hidden Loot Dark Reserve","3701394500707","standard","C128","6","1","1","1","1","35000","50000","","6","","","","","","","","1","202501120620081.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 18:20:09","2025-01-15 14:28:47","");
INSERT INTO products VALUES("58","Naud HIdden Loot ORIGINAL","3701394500073","standard","C128","6","1","1","1","1","30000","45000","","4","","","","","","","","1","202501120624251.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 18:24:26","2025-01-15 14:29:46","");
INSERT INTO products VALUES("59","VILLA JOLANDA GOLD EXTRA DRY 75cl 11.5vol","8004385030395","standard","C128","4","5","1","1","1","4000","6500","","13","","","","","","","","1","202501120627041.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 18:27:04","2025-01-15 15:16:27","");
INSERT INTO products VALUES("60","Naud EXTRA Fine Cognac 42.3%vol","3701394500035","standard","C128","6","1","1","1","1","100000","180000","","3","","","","","","","","1","202501120630481.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 18:30:49","2025-01-15 14:24:28","");
INSERT INTO products VALUES("61","VILLA JOLANDA GOLD EXT","8004385030753","standard","C128","4","5","1","1","1","10000","15000","","5","","","","","","","","1","202501120634321.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 18:34:33","2025-01-15 15:03:52","");
INSERT INTO products VALUES("62","SANTERO ASTI  DOLCE 1.5L 7.5vol","8004385032757","standard","C128","4","5","1","1","1","10000","20000","","7","","","","","","","","1","202501120636501.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 18:36:51","2025-01-15 15:54:41","");
INSERT INTO products VALUES("63","958 SANTERO ASTI OTTO E MEZZO 750 ML 8.5%VOL","8004385036199","standard","C128","4","5","1","1","1","4000","5000","","5","","","","","","","","1","202501120648281.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 18:48:28","2025-01-15 15:22:03","");
INSERT INTO products VALUES("64","958 SANTERO DIEGO BORMIDA 750 ML 11.5%VOL","8004385038896","standard","C128","4","5","1","1","1","4000","5000","","24","","","","","","","","1","202501120649531.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 18:49:54","2025-01-15 15:27:04","");
INSERT INTO products VALUES("65","958 SANTERO EXTRA DRY CODE 34-21","8004385033709","standard","C128","4","5","1","1","1","4000","5000","","4","","","","","","","","1","202501120651461.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 18:51:46","2025-01-15 15:28:13","");
INSERT INTO products VALUES("66","958 SANTERO ONE LOVE 750 ML 11.5%VOL","8004385038483","standard","C128","4","5","1","1","1","4000","5000","","5","","","","","","","","1","202501120653331.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 18:53:33","2025-01-15 15:36:56","");
INSERT INTO products VALUES("67","SANTERO EXTRA DRY CODE 38-21","8004385036922","standard","C128","4","5","1","1","1","4000","5000","","2","","","","","","","","1","202501120657281.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 18:57:28","2025-01-15 15:56:17","");
INSERT INTO products VALUES("68","958 SANTERO iLOVE 750ML 11.5%vol","8004385038544","standard","C128","4","5","1","1","1","4000","5000","","11","","","","","","","","1","202501120659581.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 18:59:59","2025-01-15 15:31:33","");
INSERT INTO products VALUES("69","958 SANTERO 750 ML 11.5%vol","8004385034102","standard","C128","4","5","1","1","1","4000","5000","","2","","","","","","","","1","202501120702351.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 19:02:36","2025-01-15 15:19:02","");
INSERT INTO products VALUES("70","958 SANTERO DOLCE ROSSO 750 ML","8004385037356","standard","C128","4","5","1","1","1","4000","5000","","1","","","","","","","","1","202501120704101.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 19:04:11","2025-01-15 15:27:34","");
INSERT INTO products VALUES("71","958 SANTERO ALLEZ LES ELEPHANTS 750ML 0%vol","8004385039060","standard","C128","4","5","1","1","1","4000","4900","","10","","","","","","","","1","202501120707071.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 19:07:07","2025-01-15 15:21:19","");
INSERT INTO products VALUES("72","VERDI BOSCA 75CL 5%Vol","8002450749005","standard","C128","7","5","1","1","1","3000","4500","","24","","","","","","","","1","202501120708421.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 19:08:42","2025-01-15 17:46:39","");
INSERT INTO products VALUES("73","958 SANTERO BELLENI 750ML 6.5%VOL","8004385035826","standard","C128","4","5","1","1","1","4000","5000","","3","","","","","","","","1","202501120710441.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 19:10:44","2025-01-15 15:23:27","");
INSERT INTO products VALUES("74","958 SANTERO MILESIMATO 750ml 11.%vol","8004385033440","standard","C128","4","5","1","1","1","4000","5000","","1","","","","","","","","1","202501120712211.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 19:12:21","2025-01-15 15:34:37","");
INSERT INTO products VALUES("75","RIUNITE MOSCATO 750CL 8%VOL","0089744765659","standard","C128","1","5","1","1","1","4500","5000","","35","","","","","","","","1","202501120721391.PNG","","","","","","","1","","","","","","","","1","","","","2025-01-12 19:21:39","2025-01-13 19:36:39","");
INSERT INTO products VALUES("76","958 SANTERO code 56-22 750 ML 6.5%vol","8004385036373","standard","C128","4","5","1","1","1","4000","5000","","5","","","","","","","","1","202501120723141.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 19:23:14","2025-01-15 15:26:37","");
INSERT INTO products VALUES("77","958 SANTERO BLUE 750 ML 10%VOL.","8004385035437","standard","C128","4","5","1","1","1","4000","5000","","4","","","","","","","","1","202501120724291.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 19:24:30","2025-01-15 15:25:32","");
INSERT INTO products VALUES("78","958 SANTERO ROSE DOLCE 750 ML 6.5%VOL.","8004385036380","standard","C128","4","5","1","1","1","4000","5000","","6","","","","","","","","1","202501120726221.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 19:26:23","2025-01-15 15:37:24","");
INSERT INTO products VALUES("79","Rocca Dei Forti ALCOHOL FREE 75CL 0%VOL","8002495516990","standard","C128","8","5","1","1","1","3500","6500","","23","","","","","","","","1","202501120742501.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 19:42:50","2025-01-15 14:41:44","");
INSERT INTO products VALUES("80","Rocca Dei Forti PASSERINA 75CL 12%VOL","8002495515696","standard","C128","8","5","1","1","1","3500","6500","","1","","","","","","","","1","202501120746161.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 19:46:17","2025-01-15 15:50:08","");
INSERT INTO products VALUES("81","Rocca Dei FORTI DOLCE 75CL 9.5%VOL","8002495515658","standard","C128","8","5","1","1","1","3500","5000","","18","","","","","","","","1","202501120747531.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 19:47:54","2025-01-15 15:47:49","");
INSERT INTO products VALUES("82","ROCCA DEi FORTI BRUT 75CL 11.5VOL","8002495515641","standard","C128","8","5","1","1","1","3500","6500","","13","","","","","","","","1","202501120750121.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 19:50:12","2025-01-15 15:42:01","");
INSERT INTO products VALUES("83","ROCCA DEi FORTI DEMI SEC 75CL 11%VOL","8002495515788","standard","C128","8","5","1","1","1","3500","6500","","6","","","","","","","","1","202501120751541.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 19:51:55","2025-01-15 15:43:31","");
INSERT INTO products VALUES("84","RIUNITE LAMBRUSCO 75CL 8%VOL.","8002550505259","standard","C128","1","5","1","1","1","3000","4500","","8","","","","","","","","1","202501120755001.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 19:55:01","2025-01-15 14:39:36","");
INSERT INTO products VALUES("85","Toselli Non Alcoholic Spumante 75cl","8002450746714","standard","C128","7","5","1","1","1","3000","5000","","2","","","","","","","","1","202501120800201.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 20:00:20","2025-01-15 14:55:34","");
INSERT INTO products VALUES("86","Particular Blanc de Noirs Grenache Cava 75 cl. 12%VOL.","8411789021919","standard","C128","1","5","1","1","1","5000","7000","","4","","","","","","","","1","202501120802071.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 20:02:08","2025-01-15 14:31:39","");
INSERT INTO products VALUES("87","ACCADEMIA MOSCATO","8005829323004","standard","C128","1","5","1","1","1","6000","8000","","8","","","","","","","","1","202501120804021.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 20:04:03","2025-01-15 15:38:17","");
INSERT INTO products VALUES("88","ACCADEMIA PRESECCO DOC","8005829322007","standard","C128","1","5","1","1","1","6000","8000","","5","","","","","","","","1","202501120806461.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 20:06:46","2025-01-15 15:38:52","");
INSERT INTO products VALUES("89","VILLA JOLANDA GOLD PT.OR","8004385031323","standard","C128","4","5","1","1","1","2500","3000","","21","","","","","","","","1","202501120809051.PNG","","","","","","","1","","","","","","","","1","","","","2025-01-12 20:09:05","2025-01-13 19:36:39","");
INSERT INTO products VALUES("90","VILLA JOLANDA PROSECCO D.O.C","8004385030678","standard","C128","4","5","1","1","1","2500","3000","","14","","","","","","","","1","202501120810541.PNG","","","","","","","1","","","","","","","","1","","","","2025-01-12 20:10:54","2025-01-13 19:36:39","");
INSERT INTO products VALUES("91","958 SANTERO BELLINI P.","8004385036984","standard","C128","4","5","1","1","1","2000","2500","","6","","","","","","","","1","202501120812281.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 20:12:29","2025-01-15 15:24:00","");
INSERT INTO products VALUES("92","958 SANTERO MILESIMATO 200ml 11.5%vol P.","8004385033808","standard","C128","4","5","1","1","1","1500","2000","","8","","","","","","","","1","202501120814431.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 20:14:44","2025-01-15 15:34:06","");
INSERT INTO products VALUES("93","ACCADEMIA PRESECCO DOC 750ml ALC 11%Vol","8005829986094","standard","C128","1","5","1","1","1","6000","8000","","5","","","","","","","","1","202501120817411.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 20:17:42","2025-01-15 15:39:38","");
INSERT INTO products VALUES("94","958 SANTERO LOVE EXTRA DRY 1500 ML 11.5VOL","8004385035994","standard","C128","4","5","1","1","1","8000","10000","","9","","","","","","","","1","202501120821521.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 20:21:53","2025-01-15 15:32:47","");
INSERT INTO products VALUES("95","958 SANTERO MILESIMATO 1500ml 11.5%vol","8004385033242","standard","C128","4","5","1","1","1","8000","10000","","10","","","","","","","","1","202501120823291.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 20:23:30","2025-01-15 15:33:24","");
INSERT INTO products VALUES("96","VILLA JOLANDA MOSCATO ROSE 75cl 6.5% VOL","8004385028620","standard","C128","4","5","1","1","1","5000","7000","","7","","","","","","","","1","202501120827301.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 20:27:30","2025-01-15 15:17:30","");
INSERT INTO products VALUES("97","GIN MAJOR JOHNSON 150CL 40%vol","6186000003341","standard","C128","1","1","1","1","1","5000","10000","","3","","","","","","","","1","202501120832361.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 20:32:37","2025-01-15 14:18:07","");
INSERT INTO products VALUES("98","LE VOLPI PROSECCO 750ml 11%vol","8388765726147","standard","C128","1","5","1","1","1","3000","5000","","4","","","","","","","","1","202501120834381.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 20:34:38","2025-01-15 14:21:53","");
INSERT INTO products VALUES("99","Sparkletini Peach 75cl 5%vol","8002450744000","standard","C128","7","5","1","1","1","2000","3000","","15","","","","","","","","1","202501120838051.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 20:38:05","2025-01-15 16:01:49","");
INSERT INTO products VALUES("100","SPARkLETINI RASPBERRY 75cl 5%VOL","8002450741009","standard","C128","7","5","1","1","1","2000","3000","","23","","","","","","","","1","202501120841141.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 20:41:14","2025-01-15 16:02:35","");
INSERT INTO products VALUES("101","Sparkletini green apple 75CL ALC 5%vol","8002450748008","standard","C128","7","5","1","1","1","2000","3000","","16","","","","","","","","1","202501120842541.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 20:42:54","2025-01-15 16:00:52","");
INSERT INTO products VALUES("102","Sparkletini WATERMELON 75cl ALC 5%vol","8002450743003","standard","C128","7","5","1","1","1","2000","3000","","16","","","","","","","","1","202501120845121.PNG","","0","","","0","","1","","","","","","","","1","","","","2025-01-12 20:45:13","2025-01-15 16:03:26","");
INSERT INTO products VALUES("103","Cacahuète R","KK","standard","C128","1","2","1","1","1","850","1000","","1","","","","","","","","1","202501120902381.PNG","","","","","","","1","","","","","","","","1","","","","2025-01-12 21:02:39","2025-01-12 21:02:39","");
INSERT INTO products VALUES("104","CORONA EXTRA 4 X 6 33CL /330ml CARTON","7501064191459","standard","C128","2","2","1","1","4","7000","11000","","4","","","","","","","","1","202501141136541.PNG","","","","","","","1","","","","","","","","1","","","","2025-01-14 11:36:55","2025-01-14 11:36:55","");
INSERT INTO products VALUES("105","DESPERADOS 24 X 250ML ALC.5.9%VOL CARTON","6186000327607","standard","C128","2","2","1","1","3","7000","10000","","21","","","","","","","","1","202501141140091.PNG","","","","","","","1","","","","","","","","1","","","","2025-01-14 11:40:10","2025-01-14 11:40:10","");
INSERT INTO products VALUES("106","CIAO SANGRIA 24 X 200ML CARTON","18033116403273","standard","C128","5","5","1","1","3","4878","16000","","5","","","","","","","","1","202501141155231.PNG","","","","","","","1","","","","","","","","1","","","","2025-01-14 11:55:24","2025-01-14 11:55:24","");
INSERT INTO products VALUES("107","CIAO MOSCATO 24X 200ML 8%VOL CARTON","18033116401378","standard","C128","5","5","1","1","3","4885","14700","","3","","","","","","","","1","202501141158351.PNG","","","","","","","1","","","","","","","","1","","","","2025-01-14 11:58:36","2025-01-14 11:58:36","");
INSERT INTO products VALUES("108","CIAO SFRITA 24 x 200ML 6.9% ALC CARTON","18033116401101","standard","C128","5","5","1","1","3","4545","14854","","5","","","","","","","","1","202501141200421.PNG","","","","","","","1","","","","","","","","1","","","","2025-01-14 12:00:43","2025-01-14 12:00:43","");
INSERT INTO products VALUES("109","Ciao LE MON PEACH 24 x 200ml ALC 5%vol CARTON","18033116404140","standard","C128","5","5","1","1","3","5454","18545","","0","","","","","","","","1","202501141202161.PNG","","","","","","","1","","","","","","","","1","","","","2025-01-14 12:02:17","2025-01-14 12:02:17","");
INSERT INTO products VALUES("110","CIAO ROSE 24 X 200ML CARTON","18033116400432","standard","C128","5","5","1","1","3","1545","4151","","7","","","","","","","","1","202501141204081.PNG","","","","","","","1","","","","","","","","1","","","","2025-01-14 12:04:09","2025-01-14 12:04:09","");
INSERT INTO products VALUES("111","CIAO MOJITO 24 X 200ml CARTON","18033116404126","standard","C128","5","5","1","1","3","5455","8212","","4","","","","","","","","1","202501141205441.PNG","","","","","","","1","","","","","","","","1","","","","2025-01-14 12:05:45","2025-01-14 12:05:45","");
INSERT INTO products VALUES("112","ROCCA DEI FORTI SPUMANTE BRUT 6 X 75CL ALC 11.5% CARTON","8002495512039","standard","C128","8","5","1","1","4","6546","4545","","4","","","","","","","","1","202501141211461.PNG","","","","","","","1","","","","","","","","1","","","","2025-01-14 12:11:47","2025-01-14 12:11:47","");
INSERT INTO products VALUES("113","POURPRE MALBEC BY LA GREZETTE 6 X 75CL ALC14%","3555822665182","standard","C128","1","5","1","1","4","5252","31512","","1","","","","","","","","1","202501141225461.PNG","","","","","","","1","","","","","","","","1","","","","2025-01-14 12:25:46","2025-01-14 12:25:46","");
INSERT INTO products VALUES("114","SANTERO ELEPHT S.ALC","8004385039091","standard","C128","","5","1","1","4","4250","30000","","14","","","","","","","","1","zummXD2dvAtI.png","","","","","","","1","","","","","","","","1","","","","2025-01-14 12:30:48","2025-01-14 12:30:48","");
INSERT INTO products VALUES("115","SANTERO PROSECCO DOC BABY VILLA YOLANDA","8004385030845","standard","C128","4","5","1","1","3","1750","48000","","4","","","","","","","","1","zummXD2dvAtI.png","","","","","","","1","","","","","","","","1","","","","2025-01-14 12:35:02","2025-01-14 12:35:02","");
INSERT INTO products VALUES("116","PASSERINA ROCCA DEI FORTI 75CL 12% ALC","8002495513166","standard","C128","8","5","1","1","4","5400","39000","","10","","","","","","","","1","zummXD2dvAtI.png","","","","","","","1","","","","","","","","1","","","","2025-01-14 12:38:00","2025-01-14 12:38:00","");
INSERT INTO products VALUES("117","RIUNITE LAMBRUSCO 75CL 6% ALC CARTON","8002550605256","standard","C128","1","5","1","1","4","3500","27000","","9","","","","","","","","1","zummXD2dvAtI.png","","0","","","0","","1","","","","","","","","1","","","","2025-01-14 12:42:11","2025-01-15 16:54:31","");
INSERT INTO products VALUES("118","SANTERO GLAM GOLD","8004385037868","standard","C128","","5","1","1","4","3500","29400","","10","","","","","","","","1","zummXD2dvAtI.png","","","","","","","1","","","","","","","","1","","","","2025-01-14 12:44:15","2025-01-14 12:44:15","");
INSERT INTO products VALUES("119","ROCCA DEI FORTI MOSCATO 75CL 7%ALC","8002495512428","standard","C128","","5","1","1","4","5500","39000","","9","","","","","","","","1","zummXD2dvAtI.png","","","","","","","1","","","","","","","","1","","","","2025-01-14 12:46:21","2025-01-14 12:46:21","");
INSERT INTO products VALUES("120","SANTERO DI 958 MILLESIMATO","8004385036441","standard","C128","4","5","1","1","4","6500","39000","","1","","","","","","","","1","zummXD2dvAtI.png","","","","","","","1","","","","","","","","1","","","","2025-01-14 12:53:14","2025-01-14 12:53:15","");
INSERT INTO products VALUES("121","SANTERO TOP MILESIMATO 75CL 11%ALC","8004385035758","standard","C128","4","5","1","1","4","5600","33600","","1","","","","","","","","1","zummXD2dvAtI.png","","","","","","","1","","","","","","","","1","","","","2025-01-14 13:06:49","2025-01-14 13:06:49","");
INSERT INTO products VALUES("122","SANTERO BLACK MILLESIMATO 75CL 11.5%ALC","8004385035062","standard","C128","4","5","1","1","4","6500","39000","","1","","","","","","","","1","zummXD2dvAtI.png","","","","","","","1","","","","","","","","1","","","","2025-01-14 13:10:16","2025-01-14 13:10:16","");
INSERT INTO products VALUES("123","958 SANTERO FLUO 75CL 11.5%ALC","8004385038674","standard","C128","","5","1","1","4","4800","28800","","5","","","","","","","","1","zummXD2dvAtI.png","","","","","","","1","","","","","","","","1","","","","2025-01-14 13:13:19","2025-01-14 13:13:20","");
INSERT INTO products VALUES("124","GOLD VILLA YOLLANDA 75CL 11.5%ALC","8004385030418","standard","C128","4","5","1","1","4","4500","27000","","3","","","","","","","","1","zummXD2dvAtI.png","","","","","","","1","","","","","","","","1","","","","2025-01-14 13:17:26","2025-01-14 13:17:26","");
INSERT INTO products VALUES("125","BEAUFORT 25CL 5%ALC","9501100000170","standard","C128","2","2","1","1","1","600","11500","","3","","","","","","","","1","zummXD2dvAtI.png","","","","","","","1","","","","","","","","1","","","","2025-01-14 13:19:38","2025-01-14 13:19:39","");
INSERT INTO products VALUES("126","CODYS BEER 5.9%ALC","4012440926990","standard","C128","2","2","1","1","3","450","14500","","3","","","","","","","","1","zummXD2dvAtI.png","","","","","","","1","","","","","","","","1","","","","2025-01-14 13:21:57","2025-01-14 13:21:57","");
INSERT INTO products VALUES("127","VERDI","8002450749050","standard","C128","","5","1","1","4","1650","18000","","0","","","","","","","","1","zummXD2dvAtI.png","","","","","","","1","","","","","","","","1","","","","2025-01-14 13:23:33","2025-01-14 13:23:33","");
INSERT INTO products VALUES("128","RIUNITE MOSCATO 75CL 8%ALC","40089744765657","standard","C128","","5","1","1","2","1650","27000","","6","","","","","","","","1","zummXD2dvAtI.png","","","","","","","1","","","","","","","","1","","","","2025-01-14 13:26:48","2025-01-14 13:26:48","");
INSERT INTO products VALUES("129","CASTRO LAGER 5.9%ALC 330ML","0703290192492","standard","C128","","2","1","1","3","350","10800","","10","","","","","","","","1","zummXD2dvAtI.png","","","","","","","1","","","","","","","","1","","","","2025-01-14 13:33:27","2025-01-14 13:33:27","");
INSERT INTO products VALUES("130","ROCCA DEi FORTI DEMI SEC 6 X 75CL 11%VOL CARTON","8002495513869","standard","C128","8","5","1","1","4","28000","39000","","10","","","","","","","","1","202501150449541.PNG","","","","","","","1","","","","","","","","1","","","","2025-01-15 16:49:55","2025-01-15 16:49:55","");



CREATE TABLE `purchase_product_return` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `return_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text DEFAULT NULL,
  `qty` double NOT NULL,
  `purchase_unit_id` int(11) NOT NULL,
  `net_unit_cost` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `purchases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) NOT NULL,
  `user_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `exchange_rate` double DEFAULT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_cost` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `paid_amount` double NOT NULL,
  `status` int(11) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `document` varchar(191) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO purchases VALUES("1","pr-20250112-020319","1","2","","","","1","100","0","0","43000","","0","","","43000","43000","1","2","","","2025-01-12 14:03:19","2025-01-12 14:03:19");
INSERT INTO purchases VALUES("2","pr-20250112-025902","1","2","","","","1","10","0","0","4500","","0","","","4500","4500","1","2","","","2025-01-12 14:59:02","2025-01-12 14:59:02");
INSERT INTO purchases VALUES("3","pr-20250112-030907","1","2","","","","1","1","0","0","800","","0","","","800","800","1","2","","","2025-01-12 15:09:07","2025-01-12 15:09:07");
INSERT INTO purchases VALUES("4","pr-20250112-031131","1","2","","","","1","1","0","0","800","","0","","","800","800","1","2","","","2025-01-12 15:11:31","2025-01-12 15:11:31");
INSERT INTO purchases VALUES("5","pr-20250112-031339","1","2","","","","1","1","0","0","800","","0","","","800","800","1","2","","","2025-01-12 15:13:39","2025-01-12 15:13:39");
INSERT INTO purchases VALUES("6","pr-20250112-031616","1","2","","","","1","1","0","0","800","","0","","","800","800","1","2","","","2025-01-12 15:16:16","2025-01-12 15:16:16");
INSERT INTO purchases VALUES("7","pr-20250112-032018","1","2","","","","1","1","0","0","800","","0","","","800","800","1","2","","","2025-01-12 15:20:18","2025-01-12 15:20:18");
INSERT INTO purchases VALUES("8","pr-20250112-032228","1","2","","","","1","1","0","0","1500","","0","","","1500","1500","1","2","","","2025-01-12 15:22:28","2025-01-12 15:22:28");
INSERT INTO purchases VALUES("9","pr-20250112-032825","1","2","","","","1","1","0","0","800","","0","","","800","800","1","2","","","2025-01-12 15:28:25","2025-01-12 15:28:25");
INSERT INTO purchases VALUES("10","pr-20250112-033003","1","2","","","","1","1","0","0","800","","0","","","800","800","1","2","","","2025-01-12 15:30:03","2025-01-12 15:30:03");
INSERT INTO purchases VALUES("11","pr-20250112-033305","1","2","","","","1","1","0","0","600","","0","","","600","600","1","2","","","2025-01-12 15:33:05","2025-01-12 15:33:05");
INSERT INTO purchases VALUES("12","pr-20250112-033540","1","2","","","","1","1","0","0","600","","0","","","600","600","1","2","","","2025-01-12 15:35:40","2025-01-12 15:35:40");
INSERT INTO purchases VALUES("13","pr-20250112-034313","1","2","","","","1","1","0","0","450","","0","","","450","450","1","2","","","2025-01-12 15:43:13","2025-01-12 15:43:13");
INSERT INTO purchases VALUES("14","pr-20250112-034535","1","2","","","","1","1","0","0","850","","0","","","850","850","1","2","","","2025-01-12 15:45:35","2025-01-12 15:45:35");
INSERT INTO purchases VALUES("15","pr-20250112-035132","1","2","","","","1","1","0","0","1500","","0","","","1500","1500","1","2","","","2025-01-12 15:51:32","2025-01-12 15:51:32");
INSERT INTO purchases VALUES("16","pr-20250112-035351","1","2","","","","1","1","0","0","8000","","0","","","8000","8000","1","2","","","2025-01-12 15:53:51","2025-01-12 15:53:51");
INSERT INTO purchases VALUES("17","pr-20250112-035659","1","2","","","","1","1","0","0","80","","0","","","80","80","1","2","","","2025-01-12 15:56:59","2025-01-12 15:56:59");
INSERT INTO purchases VALUES("18","pr-20250112-035922","1","2","","","","1","1","0","0","1500","","0","","","1500","1500","1","2","","","2025-01-12 15:59:22","2025-01-12 15:59:22");
INSERT INTO purchases VALUES("19","pr-20250112-040503","1","2","","","","1","3","0","0","10500","","0","","","10500","10500","1","2","","","2025-01-12 16:05:03","2025-01-12 16:05:03");
INSERT INTO purchases VALUES("20","pr-20250112-041133","1","2","","","","1","1","0","0","3500","","0","","","3500","3500","1","2","","","2025-01-12 16:11:33","2025-01-12 16:11:33");
INSERT INTO purchases VALUES("21","pr-20250112-041404","1","2","","","","1","1","0","0","8900","","0","","","8900","8900","1","2","","","2025-01-12 16:14:04","2025-01-12 16:14:04");
INSERT INTO purchases VALUES("22","pr-20250112-041558","1","2","","","","1","1","0","0","9000","","0","","","9000","9000","1","2","","","2025-01-12 16:15:58","2025-01-12 16:15:58");
INSERT INTO purchases VALUES("23","pr-20250112-041829","1","2","","","","1","1","0","0","7000","","0","","","7000","7000","1","2","","","2025-01-12 16:18:29","2025-01-12 16:18:29");
INSERT INTO purchases VALUES("24","pr-20250112-042020","1","2","","","","1","1","0","0","4500","","0","","","4500","4500","1","2","","","2025-01-12 16:20:20","2025-01-12 16:20:20");
INSERT INTO purchases VALUES("25","pr-20250112-042212","1","2","","","","1","1","0","0","4500","","0","","","4500","4500","1","2","","","2025-01-12 16:22:12","2025-01-12 16:22:12");
INSERT INTO purchases VALUES("26","pr-20250112-042401","1","2","","","","1","1","0","0","4500","","0","","","4500","4500","1","2","","","2025-01-12 16:24:01","2025-01-12 16:24:01");
INSERT INTO purchases VALUES("27","pr-20250112-042654","1","2","","","","1","1","0","0","7500","","0","","","7500","7500","1","2","","","2025-01-12 16:26:54","2025-01-12 16:26:54");
INSERT INTO purchases VALUES("28","pr-20250112-042904","1","2","","","","1","1","0","0","8000","","0","","","8000","8000","1","2","","","2025-01-12 16:29:04","2025-01-12 16:29:04");
INSERT INTO purchases VALUES("29","pr-20250112-043722","1","2","","","","1","1","0","0","8000","","0","","","8000","8000","1","2","","","2025-01-12 16:37:22","2025-01-12 16:37:22");
INSERT INTO purchases VALUES("30","pr-20250112-044550","1","2","","","","1","1","0","0","8000","","0","","","8000","8000","1","2","","","2025-01-12 16:45:50","2025-01-12 16:45:50");
INSERT INTO purchases VALUES("31","pr-20250112-044849","1","2","","","","1","1","0","0","8000","","0","","","8000","8000","1","2","","","2025-01-12 16:48:49","2025-01-12 16:48:49");
INSERT INTO purchases VALUES("32","pr-20250112-045142","1","2","","","","1","1","0","0","8000","","0","","","8000","8000","1","2","","","2025-01-12 16:51:42","2025-01-12 16:51:42");
INSERT INTO purchases VALUES("33","pr-20250112-045454","1","2","","","","1","1","0","0","8000","","0","","","8000","8000","1","2","","","2025-01-12 16:54:55","2025-01-12 16:54:55");
INSERT INTO purchases VALUES("34","pr-20250112-045806","1","2","","","","1","1","0","0","8000","","0","","","8000","8000","1","2","","","2025-01-12 16:58:06","2025-01-12 16:58:06");
INSERT INTO purchases VALUES("35","pr-20250112-050248","1","2","","","","1","1","0","0","4848","","0","","","4848","4848","1","2","","","2025-01-12 17:02:48","2025-01-12 17:02:48");
INSERT INTO purchases VALUES("36","pr-20250112-050558","1","2","","","","1","1","0","0","7740","","0","","","7740","7740","1","2","","","2025-01-12 17:05:58","2025-01-12 17:05:58");
INSERT INTO purchases VALUES("37","pr-20250112-051156","1","2","","","","1","1","0","0","8100","","0","","","8100","8100","1","2","","","2025-01-12 17:11:56","2025-01-12 17:11:56");
INSERT INTO purchases VALUES("38","pr-20250112-051414","1","2","","","","1","1","0","0","8400","","0","","","8400","8400","1","2","","","2025-01-12 17:14:14","2025-01-12 17:14:14");
INSERT INTO purchases VALUES("39","pr-20250112-051757","1","2","","","","1","1","0","0","30000","","0","","","30000","30000","1","2","","","2025-01-12 17:17:57","2025-01-12 17:17:57");
INSERT INTO purchases VALUES("40","pr-20250112-052106","1","2","","","","1","1","0","0","35000","","0","","","35000","35000","1","2","","","2025-01-12 17:21:06","2025-01-12 17:21:06");
INSERT INTO purchases VALUES("41","pr-20250112-052609","1","2","","","","1","1","0","0","7122","","0","","","7122","7122","1","2","","","2025-01-12 17:26:09","2025-01-12 17:26:09");
INSERT INTO purchases VALUES("42","pr-20250112-052742","1","2","","","","1","1","0","0","7000","","0","","","7000","7000","1","2","","","2025-01-12 17:27:42","2025-01-12 17:27:42");
INSERT INTO purchases VALUES("43","pr-20250112-061114","47","2","","","","1","1","0","0","7821","","0","","","7821","7821","1","2","","","2025-01-12 18:11:14","2025-01-12 18:11:14");
INSERT INTO purchases VALUES("44","pr-20250112-061654","47","2","","","","1","1","0","0","4550","","0","","","4550","4550","1","2","","","2025-01-12 18:16:54","2025-01-12 18:16:54");
INSERT INTO purchases VALUES("45","pr-20250112-062009","47","2","","","","1","1","0","0","28000","","0","","","28000","28000","1","2","","","2025-01-12 18:20:09","2025-01-12 18:20:09");
INSERT INTO purchases VALUES("46","pr-20250112-062426","47","2","","","","1","1","0","0","30000","","0","","","30000","30000","1","2","","","2025-01-12 18:24:26","2025-01-12 18:24:26");
INSERT INTO purchases VALUES("47","pr-20250112-062704","47","2","","","","1","1","0","0","3000","","0","","","3000","3000","1","2","","","2025-01-12 18:27:04","2025-01-12 18:27:04");
INSERT INTO purchases VALUES("48","pr-20250112-063049","47","2","","","","1","1","0","0","45000","","0","","","45000","45000","1","2","","","2025-01-12 18:30:49","2025-01-12 18:30:49");
INSERT INTO purchases VALUES("49","pr-20250112-063433","47","2","","","","1","1","0","0","15000","","0","","","15000","15000","1","2","","","2025-01-12 18:34:33","2025-01-12 18:34:33");
INSERT INTO purchases VALUES("50","pr-20250112-063651","47","2","","","","1","1","0","0","15000","","0","","","15000","15000","1","2","","","2025-01-12 18:36:51","2025-01-12 18:36:51");
INSERT INTO purchases VALUES("51","pr-20250112-064828","47","2","","","","1","1","0","0","4500","","0","","","4500","4500","1","2","","","2025-01-12 18:48:28","2025-01-12 18:48:28");
INSERT INTO purchases VALUES("52","pr-20250112-064954","47","2","","","","1","1","0","0","4500","","0","","","4500","4500","1","2","","","2025-01-12 18:49:54","2025-01-12 18:49:54");
INSERT INTO purchases VALUES("53","pr-20250112-065146","47","2","","","","1","1","0","0","4500","","0","","","4500","4500","1","2","","","2025-01-12 18:51:46","2025-01-12 18:51:46");
INSERT INTO purchases VALUES("54","pr-20250112-065333","47","2","","","","1","1","0","0","4500","","0","","","4500","4500","1","2","","","2025-01-12 18:53:33","2025-01-12 18:53:33");
INSERT INTO purchases VALUES("55","pr-20250112-065728","47","2","","","","1","1","0","0","4500","","0","","","4500","4500","1","2","","","2025-01-12 18:57:28","2025-01-12 18:57:28");
INSERT INTO purchases VALUES("56","pr-20250112-065959","47","2","","","","1","1","0","0","4500","","0","","","4500","4500","1","2","","","2025-01-12 18:59:59","2025-01-12 18:59:59");
INSERT INTO purchases VALUES("57","pr-20250112-070236","47","2","","","","1","1","0","0","4500","","0","","","4500","4500","1","2","","","2025-01-12 19:02:36","2025-01-12 19:02:36");
INSERT INTO purchases VALUES("58","pr-20250112-070411","47","2","","","","1","1","0","0","4500","","0","","","4500","4500","1","2","","","2025-01-12 19:04:11","2025-01-12 19:04:11");
INSERT INTO purchases VALUES("59","pr-20250112-070707","47","2","","","","1","1","0","0","4500","","0","","","4500","4500","1","2","","","2025-01-12 19:07:07","2025-01-12 19:07:07");
INSERT INTO purchases VALUES("60","pr-20250112-070842","47","2","","","","1","1","0","0","4500","","0","","","4500","4500","1","2","","","2025-01-12 19:08:42","2025-01-12 19:08:42");
INSERT INTO purchases VALUES("61","pr-20250112-071044","47","2","","","","1","1","0","0","4500","","0","","","4500","4500","1","2","","","2025-01-12 19:10:44","2025-01-12 19:10:44");
INSERT INTO purchases VALUES("62","pr-20250112-071221","47","2","","","","1","1","0","0","4500","","0","","","4500","4500","1","2","","","2025-01-12 19:12:21","2025-01-12 19:12:21");
INSERT INTO purchases VALUES("63","pr-20250112-072139","47","2","","","","1","1","0","0","4500","","0","","","4500","4500","1","2","","","2025-01-12 19:21:39","2025-01-12 19:21:39");
INSERT INTO purchases VALUES("64","pr-20250112-072314","47","2","","","","1","1","0","0","4500","","0","","","4500","4500","1","2","","","2025-01-12 19:23:14","2025-01-12 19:23:14");
INSERT INTO purchases VALUES("65","pr-20250112-072430","47","2","","","","1","1","0","0","4500","","0","","","4500","4500","1","2","","","2025-01-12 19:24:30","2025-01-12 19:24:30");
INSERT INTO purchases VALUES("66","pr-20250112-072623","47","2","","","","1","1","0","0","4500","","0","","","4500","4500","1","2","","","2025-01-12 19:26:23","2025-01-12 19:26:23");
INSERT INTO purchases VALUES("67","pr-20250112-074250","47","2","","","","1","1","0","0","4500","","0","","","4500","4500","1","2","","","2025-01-12 19:42:50","2025-01-12 19:42:50");
INSERT INTO purchases VALUES("68","pr-20250112-074617","47","2","","","","1","1","0","0","4500","","0","","","4500","4500","1","2","","","2025-01-12 19:46:17","2025-01-12 19:46:17");
INSERT INTO purchases VALUES("69","pr-20250112-074754","47","2","","","","1","1","0","0","4500","","0","","","4500","4500","1","2","","","2025-01-12 19:47:54","2025-01-12 19:47:54");
INSERT INTO purchases VALUES("70","pr-20250112-075012","47","2","","","","1","1","0","0","4500","","0","","","4500","4500","1","2","","","2025-01-12 19:50:12","2025-01-12 19:50:12");
INSERT INTO purchases VALUES("71","pr-20250112-075155","47","2","","","","1","1","0","0","4500","","0","","","4500","4500","1","2","","","2025-01-12 19:51:55","2025-01-12 19:51:55");
INSERT INTO purchases VALUES("72","pr-20250112-075501","47","2","","","","1","1","0","0","4500","","0","","","4500","4500","1","2","","","2025-01-12 19:55:01","2025-01-12 19:55:01");
INSERT INTO purchases VALUES("73","pr-20250112-080020","47","2","","","","1","1","0","0","4500","","0","","","4500","4500","1","2","","","2025-01-12 20:00:20","2025-01-12 20:00:20");
INSERT INTO purchases VALUES("74","pr-20250112-080208","47","2","","","","1","1","0","0","4500","","0","","","4500","4500","1","2","","","2025-01-12 20:02:08","2025-01-12 20:02:08");
INSERT INTO purchases VALUES("75","pr-20250112-080403","47","2","","","","1","1","0","0","4500","","0","","","4500","4500","1","2","","","2025-01-12 20:04:03","2025-01-12 20:04:03");
INSERT INTO purchases VALUES("76","pr-20250112-080646","47","2","","","","1","1","0","0","4500","","0","","","4500","4500","1","2","","","2025-01-12 20:06:46","2025-01-12 20:06:46");
INSERT INTO purchases VALUES("77","pr-20250112-080905","47","2","","","","1","1","0","0","2500","","0","","","2500","2500","1","2","","","2025-01-12 20:09:05","2025-01-12 20:09:05");
INSERT INTO purchases VALUES("78","pr-20250112-081054","47","2","","","","1","1","0","0","2500","","0","","","2500","2500","1","2","","","2025-01-12 20:10:54","2025-01-12 20:10:54");
INSERT INTO purchases VALUES("79","pr-20250112-081229","47","2","","","","1","1","0","0","2500","","0","","","2500","2500","1","2","","","2025-01-12 20:12:29","2025-01-12 20:12:29");
INSERT INTO purchases VALUES("80","pr-20250112-081444","47","2","","","","1","1","0","0","1500","","0","","","1500","1500","1","2","","","2025-01-12 20:14:44","2025-01-12 20:14:44");
INSERT INTO purchases VALUES("81","pr-20250112-081742","47","2","","","","1","1","0","0","4500","","0","","","4500","4500","1","2","","","2025-01-12 20:17:42","2025-01-12 20:17:42");
INSERT INTO purchases VALUES("82","pr-20250112-082153","47","2","","","","1","1","0","0","7000","","0","","","7000","7000","1","2","","","2025-01-12 20:21:53","2025-01-12 20:21:53");
INSERT INTO purchases VALUES("83","pr-20250112-082330","47","2","","","","1","1","0","0","8500","","0","","","8500","8500","1","2","","","2025-01-12 20:23:30","2025-01-12 20:23:30");
INSERT INTO purchases VALUES("84","pr-20250112-082730","47","2","","","","1","1","0","0","3500","","0","","","3500","3500","1","2","","","2025-01-12 20:27:30","2025-01-12 20:27:30");
INSERT INTO purchases VALUES("85","pr-20250112-083237","47","2","","","","1","1","0","0","7000","","0","","","7000","7000","1","2","","","2025-01-12 20:32:37","2025-01-12 20:32:37");
INSERT INTO purchases VALUES("86","pr-20250112-083438","47","2","","","","1","1","0","0","4500","","0","","","4500","4500","1","2","","","2025-01-12 20:34:38","2025-01-12 20:34:38");
INSERT INTO purchases VALUES("87","pr-20250112-083805","47","2","","","","1","1","0","0","4500","","0","","","4500","4500","1","2","","","2025-01-12 20:38:05","2025-01-12 20:38:05");
INSERT INTO purchases VALUES("88","pr-20250112-084114","47","2","","","","1","1","0","0","4500","","0","","","4500","4500","1","2","","","2025-01-12 20:41:14","2025-01-12 20:41:14");
INSERT INTO purchases VALUES("89","pr-20250112-084254","47","2","","","","1","1","0","0","4500","","0","","","4500","4500","1","2","","","2025-01-12 20:42:54","2025-01-12 20:42:54");
INSERT INTO purchases VALUES("90","pr-20250112-084513","47","2","","","","1","1","0","0","4500","","0","","","4500","4500","1","2","","","2025-01-12 20:45:13","2025-01-12 20:45:13");
INSERT INTO purchases VALUES("91","pr-20250112-090239","47","2","","","","1","1","0","0","850","","0","","","850","850","1","2","","","2025-01-12 21:02:39","2025-01-12 21:02:39");
INSERT INTO purchases VALUES("95","13012025","47","2","1","1","1","90","1115","0","0","4555168","0","0","0","0","4555168","0","1","1","","","2025-01-13 00:00:00","2025-01-13 19:36:39");
INSERT INTO purchases VALUES("96","pr-20250114-113655","47","2","","","","1","4","0","0","28000","","0","","","28000","28000","1","2","","","2025-01-14 11:36:55","2025-01-14 11:36:55");
INSERT INTO purchases VALUES("97","pr-20250114-114010","47","2","","","","1","21","0","0","147000","","0","","","147000","147000","1","2","","","2025-01-14 11:40:10","2025-01-14 11:40:10");
INSERT INTO purchases VALUES("98","pr-20250114-115524","47","2","","","","1","5","0","0","24390","","0","","","24390","24390","1","2","","","2025-01-14 11:55:24","2025-01-14 11:55:24");
INSERT INTO purchases VALUES("99","pr-20250114-115836","47","2","","","","1","3","0","0","14655","","0","","","14655","14655","1","2","","","2025-01-14 11:58:36","2025-01-14 11:58:36");
INSERT INTO purchases VALUES("100","pr-20250114-120043","47","2","","","","1","5","0","0","22725","","0","","","22725","22725","1","2","","","2025-01-14 12:00:43","2025-01-14 12:00:43");
INSERT INTO purchases VALUES("101","pr-20250114-120409","47","2","","","","1","7","0","0","10815","","0","","","10815","10815","1","2","","","2025-01-14 12:04:09","2025-01-14 12:04:09");
INSERT INTO purchases VALUES("102","pr-20250114-120545","47","2","","","","1","4","0","0","21820","","0","","","21820","21820","1","2","","","2025-01-14 12:05:45","2025-01-14 12:05:45");
INSERT INTO purchases VALUES("103","pr-20250114-121147","47","2","","","","1","4","0","0","26184","","0","","","26184","26184","1","2","","","2025-01-14 12:11:47","2025-01-14 12:11:47");
INSERT INTO purchases VALUES("104","pr-20250114-122546","48","2","","","","1","1","0","0","5252","","0","","","5252","5252","1","2","","","2025-01-14 12:25:46","2025-01-14 12:25:46");
INSERT INTO purchases VALUES("105","pr-20250114-123048","48","2","","","","1","14","0","0","59500","","0","","","59500","59500","1","2","","","2025-01-14 12:30:48","2025-01-14 12:30:48");
INSERT INTO purchases VALUES("106","pr-20250114-123502","48","2","","","","1","4","0","0","7000","","0","","","7000","7000","1","2","","","2025-01-14 12:35:02","2025-01-14 12:35:02");
INSERT INTO purchases VALUES("107","pr-20250114-123800","48","2","","","","1","10","0","0","54000","","0","","","54000","54000","1","2","","","2025-01-14 12:38:00","2025-01-14 12:38:00");
INSERT INTO purchases VALUES("108","pr-20250114-124211","48","2","","","","1","2","0","0","7000","","0","","","7000","7000","1","2","","","2025-01-14 12:42:11","2025-01-14 12:42:11");
INSERT INTO purchases VALUES("109","pr-20250114-124415","48","2","","","","1","10","0","0","35000","","0","","","35000","35000","1","2","","","2025-01-14 12:44:15","2025-01-14 12:44:15");
INSERT INTO purchases VALUES("110","pr-20250114-124621","48","2","","","","1","9","0","0","49500","","0","","","49500","49500","1","2","","","2025-01-14 12:46:21","2025-01-14 12:46:21");
INSERT INTO purchases VALUES("111","pr-20250114-125314","48","2","","","","1","1","0","0","6500","","0","","","6500","6500","1","2","","","2025-01-14 12:53:14","2025-01-14 12:53:14");
INSERT INTO purchases VALUES("112","pr-20250114-010649","48","2","","","","1","1","0","0","5600","","0","","","5600","5600","1","2","","","2025-01-14 13:06:49","2025-01-14 13:06:49");
INSERT INTO purchases VALUES("113","pr-20250114-011016","48","2","","","","1","1","0","0","6500","","0","","","6500","6500","1","2","","","2025-01-14 13:10:16","2025-01-14 13:10:16");
INSERT INTO purchases VALUES("114","pr-20250114-011320","48","2","","","","1","5","0","0","24000","","0","","","24000","24000","1","2","","","2025-01-14 13:13:20","2025-01-14 13:13:20");
INSERT INTO purchases VALUES("115","pr-20250114-011726","48","2","","","","1","3","0","0","13500","","0","","","13500","13500","1","2","","","2025-01-14 13:17:26","2025-01-14 13:17:26");
INSERT INTO purchases VALUES("116","pr-20250114-011939","48","2","","","","1","3","0","0","1800","","0","","","1800","1800","1","2","","","2025-01-14 13:19:39","2025-01-14 13:19:39");
INSERT INTO purchases VALUES("117","pr-20250114-012157","48","2","","","","1","3","0","0","1350","","0","","","1350","1350","1","2","","","2025-01-14 13:21:57","2025-01-14 13:21:57");
INSERT INTO purchases VALUES("118","pr-20250114-012648","48","2","","","","1","6","0","0","9900","","0","","","9900","9900","1","2","","","2025-01-14 13:26:48","2025-01-14 13:26:48");
INSERT INTO purchases VALUES("119","pr-20250114-013327","48","2","","","","1","10","0","0","3500","","0","","","3500","3500","1","2","","","2025-01-14 13:33:27","2025-01-14 13:33:27");
INSERT INTO purchases VALUES("120","pr-20250115-044955","1","2","","","","1","10","0","0","280000","","0","","","280000","280000","1","2","","","2025-01-15 16:49:55","2025-01-15 16:49:55");
INSERT INTO purchases VALUES("121","15012025","1","2","1","1","1","1","7","0","0","24500","0","0","0","0","24500","0","1","1","","","2025-01-15 16:54:31","2025-01-15 16:54:31");



CREATE TABLE `quotations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) NOT NULL,
  `user_id` int(11) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_price` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `quotation_status` int(11) NOT NULL,
  `document` varchar(191) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `return_purchases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `exchange_rate` double DEFAULT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_cost` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `document` varchar(191) DEFAULT NULL,
  `return_note` text DEFAULT NULL,
  `staff_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `returns` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `exchange_rate` double DEFAULT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_price` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `document` varchar(191) DEFAULT NULL,
  `return_note` text DEFAULT NULL,
  `staff_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `reward_point_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `per_point_amount` double NOT NULL,
  `minimum_amount` double NOT NULL,
  `duration` int(11) DEFAULT NULL,
  `type` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO reward_point_settings VALUES("1","300","1000","1","Year","1","2021-06-08 15:40:15","2021-06-27 05:20:55");



CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO role_has_permissions VALUES("4","1");
INSERT INTO role_has_permissions VALUES("4","4");
INSERT INTO role_has_permissions VALUES("4","8");
INSERT INTO role_has_permissions VALUES("5","1");
INSERT INTO role_has_permissions VALUES("5","8");
INSERT INTO role_has_permissions VALUES("6","1");
INSERT INTO role_has_permissions VALUES("6","4");
INSERT INTO role_has_permissions VALUES("6","8");
INSERT INTO role_has_permissions VALUES("7","1");
INSERT INTO role_has_permissions VALUES("7","2");
INSERT INTO role_has_permissions VALUES("7","4");
INSERT INTO role_has_permissions VALUES("7","6");
INSERT INTO role_has_permissions VALUES("7","8");
INSERT INTO role_has_permissions VALUES("8","1");
INSERT INTO role_has_permissions VALUES("8","2");
INSERT INTO role_has_permissions VALUES("8","4");
INSERT INTO role_has_permissions VALUES("8","6");
INSERT INTO role_has_permissions VALUES("8","8");
INSERT INTO role_has_permissions VALUES("9","1");
INSERT INTO role_has_permissions VALUES("9","4");
INSERT INTO role_has_permissions VALUES("9","8");
INSERT INTO role_has_permissions VALUES("10","1");
INSERT INTO role_has_permissions VALUES("10","8");
INSERT INTO role_has_permissions VALUES("11","1");
INSERT INTO role_has_permissions VALUES("11","8");
INSERT INTO role_has_permissions VALUES("12","1");
INSERT INTO role_has_permissions VALUES("12","2");
INSERT INTO role_has_permissions VALUES("12","4");
INSERT INTO role_has_permissions VALUES("12","6");
INSERT INTO role_has_permissions VALUES("12","8");
INSERT INTO role_has_permissions VALUES("13","1");
INSERT INTO role_has_permissions VALUES("13","4");
INSERT INTO role_has_permissions VALUES("13","8");
INSERT INTO role_has_permissions VALUES("14","1");
INSERT INTO role_has_permissions VALUES("14","8");
INSERT INTO role_has_permissions VALUES("15","1");
INSERT INTO role_has_permissions VALUES("15","8");
INSERT INTO role_has_permissions VALUES("16","1");
INSERT INTO role_has_permissions VALUES("16","2");
INSERT INTO role_has_permissions VALUES("16","6");
INSERT INTO role_has_permissions VALUES("16","8");
INSERT INTO role_has_permissions VALUES("17","1");
INSERT INTO role_has_permissions VALUES("17","8");
INSERT INTO role_has_permissions VALUES("18","1");
INSERT INTO role_has_permissions VALUES("18","8");
INSERT INTO role_has_permissions VALUES("19","1");
INSERT INTO role_has_permissions VALUES("19","8");
INSERT INTO role_has_permissions VALUES("20","1");
INSERT INTO role_has_permissions VALUES("20","2");
INSERT INTO role_has_permissions VALUES("20","4");
INSERT INTO role_has_permissions VALUES("20","6");
INSERT INTO role_has_permissions VALUES("20","8");
INSERT INTO role_has_permissions VALUES("21","1");
INSERT INTO role_has_permissions VALUES("21","4");
INSERT INTO role_has_permissions VALUES("21","8");
INSERT INTO role_has_permissions VALUES("22","1");
INSERT INTO role_has_permissions VALUES("22","4");
INSERT INTO role_has_permissions VALUES("22","8");
INSERT INTO role_has_permissions VALUES("23","1");
INSERT INTO role_has_permissions VALUES("23","8");
INSERT INTO role_has_permissions VALUES("24","1");
INSERT INTO role_has_permissions VALUES("24","2");
INSERT INTO role_has_permissions VALUES("24","4");
INSERT INTO role_has_permissions VALUES("24","6");
INSERT INTO role_has_permissions VALUES("24","8");
INSERT INTO role_has_permissions VALUES("25","1");
INSERT INTO role_has_permissions VALUES("25","4");
INSERT INTO role_has_permissions VALUES("25","8");
INSERT INTO role_has_permissions VALUES("26","1");
INSERT INTO role_has_permissions VALUES("26","8");
INSERT INTO role_has_permissions VALUES("27","1");
INSERT INTO role_has_permissions VALUES("27","8");
INSERT INTO role_has_permissions VALUES("28","1");
INSERT INTO role_has_permissions VALUES("28","2");
INSERT INTO role_has_permissions VALUES("28","4");
INSERT INTO role_has_permissions VALUES("28","6");
INSERT INTO role_has_permissions VALUES("28","8");
INSERT INTO role_has_permissions VALUES("29","1");
INSERT INTO role_has_permissions VALUES("29","4");
INSERT INTO role_has_permissions VALUES("29","8");
INSERT INTO role_has_permissions VALUES("30","1");
INSERT INTO role_has_permissions VALUES("30","8");
INSERT INTO role_has_permissions VALUES("31","1");
INSERT INTO role_has_permissions VALUES("31","8");
INSERT INTO role_has_permissions VALUES("32","1");
INSERT INTO role_has_permissions VALUES("32","2");
INSERT INTO role_has_permissions VALUES("32","6");
INSERT INTO role_has_permissions VALUES("32","8");
INSERT INTO role_has_permissions VALUES("33","1");
INSERT INTO role_has_permissions VALUES("33","8");
INSERT INTO role_has_permissions VALUES("34","1");
INSERT INTO role_has_permissions VALUES("34","8");
INSERT INTO role_has_permissions VALUES("35","1");
INSERT INTO role_has_permissions VALUES("35","8");
INSERT INTO role_has_permissions VALUES("36","1");
INSERT INTO role_has_permissions VALUES("36","2");
INSERT INTO role_has_permissions VALUES("36","6");
INSERT INTO role_has_permissions VALUES("36","7");
INSERT INTO role_has_permissions VALUES("36","8");
INSERT INTO role_has_permissions VALUES("37","1");
INSERT INTO role_has_permissions VALUES("37","2");
INSERT INTO role_has_permissions VALUES("37","6");
INSERT INTO role_has_permissions VALUES("37","7");
INSERT INTO role_has_permissions VALUES("37","8");
INSERT INTO role_has_permissions VALUES("38","1");
INSERT INTO role_has_permissions VALUES("38","2");
INSERT INTO role_has_permissions VALUES("38","6");
INSERT INTO role_has_permissions VALUES("38","7");
INSERT INTO role_has_permissions VALUES("38","8");
INSERT INTO role_has_permissions VALUES("39","1");
INSERT INTO role_has_permissions VALUES("39","2");
INSERT INTO role_has_permissions VALUES("39","6");
INSERT INTO role_has_permissions VALUES("39","7");
INSERT INTO role_has_permissions VALUES("39","8");
INSERT INTO role_has_permissions VALUES("40","1");
INSERT INTO role_has_permissions VALUES("40","2");
INSERT INTO role_has_permissions VALUES("40","6");
INSERT INTO role_has_permissions VALUES("40","7");
INSERT INTO role_has_permissions VALUES("40","8");
INSERT INTO role_has_permissions VALUES("41","1");
INSERT INTO role_has_permissions VALUES("41","2");
INSERT INTO role_has_permissions VALUES("41","6");
INSERT INTO role_has_permissions VALUES("41","8");
INSERT INTO role_has_permissions VALUES("42","1");
INSERT INTO role_has_permissions VALUES("42","8");
INSERT INTO role_has_permissions VALUES("43","1");
INSERT INTO role_has_permissions VALUES("43","8");
INSERT INTO role_has_permissions VALUES("44","1");
INSERT INTO role_has_permissions VALUES("44","8");
INSERT INTO role_has_permissions VALUES("45","1");
INSERT INTO role_has_permissions VALUES("45","2");
INSERT INTO role_has_permissions VALUES("45","6");
INSERT INTO role_has_permissions VALUES("45","7");
INSERT INTO role_has_permissions VALUES("45","8");
INSERT INTO role_has_permissions VALUES("46","1");
INSERT INTO role_has_permissions VALUES("46","2");
INSERT INTO role_has_permissions VALUES("46","6");
INSERT INTO role_has_permissions VALUES("46","7");
INSERT INTO role_has_permissions VALUES("46","8");
INSERT INTO role_has_permissions VALUES("47","1");
INSERT INTO role_has_permissions VALUES("47","2");
INSERT INTO role_has_permissions VALUES("47","6");
INSERT INTO role_has_permissions VALUES("47","7");
INSERT INTO role_has_permissions VALUES("47","8");
INSERT INTO role_has_permissions VALUES("48","1");
INSERT INTO role_has_permissions VALUES("48","2");
INSERT INTO role_has_permissions VALUES("48","6");
INSERT INTO role_has_permissions VALUES("48","7");
INSERT INTO role_has_permissions VALUES("48","8");
INSERT INTO role_has_permissions VALUES("49","1");
INSERT INTO role_has_permissions VALUES("49","2");
INSERT INTO role_has_permissions VALUES("49","6");
INSERT INTO role_has_permissions VALUES("49","7");
INSERT INTO role_has_permissions VALUES("49","8");
INSERT INTO role_has_permissions VALUES("50","1");
INSERT INTO role_has_permissions VALUES("50","2");
INSERT INTO role_has_permissions VALUES("50","6");
INSERT INTO role_has_permissions VALUES("50","7");
INSERT INTO role_has_permissions VALUES("50","8");
INSERT INTO role_has_permissions VALUES("51","1");
INSERT INTO role_has_permissions VALUES("51","2");
INSERT INTO role_has_permissions VALUES("51","6");
INSERT INTO role_has_permissions VALUES("51","7");
INSERT INTO role_has_permissions VALUES("51","8");
INSERT INTO role_has_permissions VALUES("52","1");
INSERT INTO role_has_permissions VALUES("52","2");
INSERT INTO role_has_permissions VALUES("52","6");
INSERT INTO role_has_permissions VALUES("52","7");
INSERT INTO role_has_permissions VALUES("52","8");
INSERT INTO role_has_permissions VALUES("53","1");
INSERT INTO role_has_permissions VALUES("53","2");
INSERT INTO role_has_permissions VALUES("53","6");
INSERT INTO role_has_permissions VALUES("53","7");
INSERT INTO role_has_permissions VALUES("53","8");
INSERT INTO role_has_permissions VALUES("54","1");
INSERT INTO role_has_permissions VALUES("54","2");
INSERT INTO role_has_permissions VALUES("54","6");
INSERT INTO role_has_permissions VALUES("54","7");
INSERT INTO role_has_permissions VALUES("54","8");
INSERT INTO role_has_permissions VALUES("55","1");
INSERT INTO role_has_permissions VALUES("55","2");
INSERT INTO role_has_permissions VALUES("55","4");
INSERT INTO role_has_permissions VALUES("55","6");
INSERT INTO role_has_permissions VALUES("55","8");
INSERT INTO role_has_permissions VALUES("56","1");
INSERT INTO role_has_permissions VALUES("56","4");
INSERT INTO role_has_permissions VALUES("56","8");
INSERT INTO role_has_permissions VALUES("57","1");
INSERT INTO role_has_permissions VALUES("57","4");
INSERT INTO role_has_permissions VALUES("57","8");
INSERT INTO role_has_permissions VALUES("58","1");
INSERT INTO role_has_permissions VALUES("58","8");
INSERT INTO role_has_permissions VALUES("59","1");
INSERT INTO role_has_permissions VALUES("59","6");
INSERT INTO role_has_permissions VALUES("59","8");
INSERT INTO role_has_permissions VALUES("60","1");
INSERT INTO role_has_permissions VALUES("60","8");
INSERT INTO role_has_permissions VALUES("61","1");
INSERT INTO role_has_permissions VALUES("61","6");
INSERT INTO role_has_permissions VALUES("61","8");
INSERT INTO role_has_permissions VALUES("62","1");
INSERT INTO role_has_permissions VALUES("62","6");
INSERT INTO role_has_permissions VALUES("62","8");
INSERT INTO role_has_permissions VALUES("63","1");
INSERT INTO role_has_permissions VALUES("63","2");
INSERT INTO role_has_permissions VALUES("63","4");
INSERT INTO role_has_permissions VALUES("63","6");
INSERT INTO role_has_permissions VALUES("63","8");
INSERT INTO role_has_permissions VALUES("64","1");
INSERT INTO role_has_permissions VALUES("64","4");
INSERT INTO role_has_permissions VALUES("64","8");
INSERT INTO role_has_permissions VALUES("65","1");
INSERT INTO role_has_permissions VALUES("65","8");
INSERT INTO role_has_permissions VALUES("66","1");
INSERT INTO role_has_permissions VALUES("66","8");
INSERT INTO role_has_permissions VALUES("67","1");
INSERT INTO role_has_permissions VALUES("67","2");
INSERT INTO role_has_permissions VALUES("67","6");
INSERT INTO role_has_permissions VALUES("67","7");
INSERT INTO role_has_permissions VALUES("67","8");
INSERT INTO role_has_permissions VALUES("68","1");
INSERT INTO role_has_permissions VALUES("68","2");
INSERT INTO role_has_permissions VALUES("68","6");
INSERT INTO role_has_permissions VALUES("68","7");
INSERT INTO role_has_permissions VALUES("68","8");
INSERT INTO role_has_permissions VALUES("69","1");
INSERT INTO role_has_permissions VALUES("69","2");
INSERT INTO role_has_permissions VALUES("69","6");
INSERT INTO role_has_permissions VALUES("69","7");
INSERT INTO role_has_permissions VALUES("69","8");
INSERT INTO role_has_permissions VALUES("70","1");
INSERT INTO role_has_permissions VALUES("70","2");
INSERT INTO role_has_permissions VALUES("70","6");
INSERT INTO role_has_permissions VALUES("70","8");
INSERT INTO role_has_permissions VALUES("71","1");
INSERT INTO role_has_permissions VALUES("71","2");
INSERT INTO role_has_permissions VALUES("71","6");
INSERT INTO role_has_permissions VALUES("71","8");
INSERT INTO role_has_permissions VALUES("72","1");
INSERT INTO role_has_permissions VALUES("72","2");
INSERT INTO role_has_permissions VALUES("72","6");
INSERT INTO role_has_permissions VALUES("72","8");
INSERT INTO role_has_permissions VALUES("73","1");
INSERT INTO role_has_permissions VALUES("73","2");
INSERT INTO role_has_permissions VALUES("73","6");
INSERT INTO role_has_permissions VALUES("73","8");
INSERT INTO role_has_permissions VALUES("74","1");
INSERT INTO role_has_permissions VALUES("74","8");
INSERT INTO role_has_permissions VALUES("75","1");
INSERT INTO role_has_permissions VALUES("75","8");
INSERT INTO role_has_permissions VALUES("76","1");
INSERT INTO role_has_permissions VALUES("76","8");
INSERT INTO role_has_permissions VALUES("77","1");
INSERT INTO role_has_permissions VALUES("77","2");
INSERT INTO role_has_permissions VALUES("77","6");
INSERT INTO role_has_permissions VALUES("77","7");
INSERT INTO role_has_permissions VALUES("77","8");
INSERT INTO role_has_permissions VALUES("78","1");
INSERT INTO role_has_permissions VALUES("78","2");
INSERT INTO role_has_permissions VALUES("78","6");
INSERT INTO role_has_permissions VALUES("78","8");
INSERT INTO role_has_permissions VALUES("79","1");
INSERT INTO role_has_permissions VALUES("79","2");
INSERT INTO role_has_permissions VALUES("79","6");
INSERT INTO role_has_permissions VALUES("79","8");
INSERT INTO role_has_permissions VALUES("80","1");
INSERT INTO role_has_permissions VALUES("80","8");
INSERT INTO role_has_permissions VALUES("81","1");
INSERT INTO role_has_permissions VALUES("81","8");
INSERT INTO role_has_permissions VALUES("82","1");
INSERT INTO role_has_permissions VALUES("82","2");
INSERT INTO role_has_permissions VALUES("82","6");
INSERT INTO role_has_permissions VALUES("82","8");
INSERT INTO role_has_permissions VALUES("84","1");
INSERT INTO role_has_permissions VALUES("84","2");
INSERT INTO role_has_permissions VALUES("84","6");
INSERT INTO role_has_permissions VALUES("84","8");
INSERT INTO role_has_permissions VALUES("85","1");
INSERT INTO role_has_permissions VALUES("85","2");
INSERT INTO role_has_permissions VALUES("85","6");
INSERT INTO role_has_permissions VALUES("85","8");
INSERT INTO role_has_permissions VALUES("86","1");
INSERT INTO role_has_permissions VALUES("86","2");
INSERT INTO role_has_permissions VALUES("86","6");
INSERT INTO role_has_permissions VALUES("86","8");
INSERT INTO role_has_permissions VALUES("87","1");
INSERT INTO role_has_permissions VALUES("87","2");
INSERT INTO role_has_permissions VALUES("87","6");
INSERT INTO role_has_permissions VALUES("87","8");
INSERT INTO role_has_permissions VALUES("88","1");
INSERT INTO role_has_permissions VALUES("88","2");
INSERT INTO role_has_permissions VALUES("88","6");
INSERT INTO role_has_permissions VALUES("88","8");
INSERT INTO role_has_permissions VALUES("89","1");
INSERT INTO role_has_permissions VALUES("89","2");
INSERT INTO role_has_permissions VALUES("89","4");
INSERT INTO role_has_permissions VALUES("89","6");
INSERT INTO role_has_permissions VALUES("89","8");
INSERT INTO role_has_permissions VALUES("90","1");
INSERT INTO role_has_permissions VALUES("90","2");
INSERT INTO role_has_permissions VALUES("90","6");
INSERT INTO role_has_permissions VALUES("90","7");
INSERT INTO role_has_permissions VALUES("90","8");
INSERT INTO role_has_permissions VALUES("91","1");
INSERT INTO role_has_permissions VALUES("91","2");
INSERT INTO role_has_permissions VALUES("91","6");
INSERT INTO role_has_permissions VALUES("91","8");
INSERT INTO role_has_permissions VALUES("92","1");
INSERT INTO role_has_permissions VALUES("92","2");
INSERT INTO role_has_permissions VALUES("92","6");
INSERT INTO role_has_permissions VALUES("92","8");
INSERT INTO role_has_permissions VALUES("93","1");
INSERT INTO role_has_permissions VALUES("93","2");
INSERT INTO role_has_permissions VALUES("93","6");
INSERT INTO role_has_permissions VALUES("93","8");
INSERT INTO role_has_permissions VALUES("94","1");
INSERT INTO role_has_permissions VALUES("94","8");
INSERT INTO role_has_permissions VALUES("95","1");
INSERT INTO role_has_permissions VALUES("95","8");
INSERT INTO role_has_permissions VALUES("96","1");
INSERT INTO role_has_permissions VALUES("96","8");
INSERT INTO role_has_permissions VALUES("97","1");
INSERT INTO role_has_permissions VALUES("97","2");
INSERT INTO role_has_permissions VALUES("97","6");
INSERT INTO role_has_permissions VALUES("97","7");
INSERT INTO role_has_permissions VALUES("97","8");
INSERT INTO role_has_permissions VALUES("98","1");
INSERT INTO role_has_permissions VALUES("98","2");
INSERT INTO role_has_permissions VALUES("98","6");
INSERT INTO role_has_permissions VALUES("98","8");
INSERT INTO role_has_permissions VALUES("99","1");
INSERT INTO role_has_permissions VALUES("99","2");
INSERT INTO role_has_permissions VALUES("99","6");
INSERT INTO role_has_permissions VALUES("99","8");
INSERT INTO role_has_permissions VALUES("100","1");
INSERT INTO role_has_permissions VALUES("100","2");
INSERT INTO role_has_permissions VALUES("100","6");
INSERT INTO role_has_permissions VALUES("100","8");
INSERT INTO role_has_permissions VALUES("101","1");
INSERT INTO role_has_permissions VALUES("101","2");
INSERT INTO role_has_permissions VALUES("101","6");
INSERT INTO role_has_permissions VALUES("101","8");
INSERT INTO role_has_permissions VALUES("102","1");
INSERT INTO role_has_permissions VALUES("102","2");
INSERT INTO role_has_permissions VALUES("102","6");
INSERT INTO role_has_permissions VALUES("102","8");
INSERT INTO role_has_permissions VALUES("103","1");
INSERT INTO role_has_permissions VALUES("103","2");
INSERT INTO role_has_permissions VALUES("103","6");
INSERT INTO role_has_permissions VALUES("103","8");
INSERT INTO role_has_permissions VALUES("104","1");
INSERT INTO role_has_permissions VALUES("104","2");
INSERT INTO role_has_permissions VALUES("104","8");
INSERT INTO role_has_permissions VALUES("105","1");
INSERT INTO role_has_permissions VALUES("105","6");
INSERT INTO role_has_permissions VALUES("105","8");
INSERT INTO role_has_permissions VALUES("106","1");
INSERT INTO role_has_permissions VALUES("106","2");
INSERT INTO role_has_permissions VALUES("106","4");
INSERT INTO role_has_permissions VALUES("106","6");
INSERT INTO role_has_permissions VALUES("106","7");
INSERT INTO role_has_permissions VALUES("106","8");
INSERT INTO role_has_permissions VALUES("107","1");
INSERT INTO role_has_permissions VALUES("107","2");
INSERT INTO role_has_permissions VALUES("107","6");
INSERT INTO role_has_permissions VALUES("107","7");
INSERT INTO role_has_permissions VALUES("107","8");
INSERT INTO role_has_permissions VALUES("108","1");
INSERT INTO role_has_permissions VALUES("108","2");
INSERT INTO role_has_permissions VALUES("108","6");
INSERT INTO role_has_permissions VALUES("108","7");
INSERT INTO role_has_permissions VALUES("108","8");
INSERT INTO role_has_permissions VALUES("109","1");
INSERT INTO role_has_permissions VALUES("109","2");
INSERT INTO role_has_permissions VALUES("109","6");
INSERT INTO role_has_permissions VALUES("109","7");
INSERT INTO role_has_permissions VALUES("109","8");
INSERT INTO role_has_permissions VALUES("110","1");
INSERT INTO role_has_permissions VALUES("110","2");
INSERT INTO role_has_permissions VALUES("110","6");
INSERT INTO role_has_permissions VALUES("110","8");
INSERT INTO role_has_permissions VALUES("111","1");
INSERT INTO role_has_permissions VALUES("111","2");
INSERT INTO role_has_permissions VALUES("111","6");
INSERT INTO role_has_permissions VALUES("111","8");
INSERT INTO role_has_permissions VALUES("112","1");
INSERT INTO role_has_permissions VALUES("112","2");
INSERT INTO role_has_permissions VALUES("112","6");
INSERT INTO role_has_permissions VALUES("112","7");
INSERT INTO role_has_permissions VALUES("112","8");
INSERT INTO role_has_permissions VALUES("113","1");
INSERT INTO role_has_permissions VALUES("113","2");
INSERT INTO role_has_permissions VALUES("113","6");
INSERT INTO role_has_permissions VALUES("113","8");
INSERT INTO role_has_permissions VALUES("114","1");
INSERT INTO role_has_permissions VALUES("114","8");
INSERT INTO role_has_permissions VALUES("115","1");
INSERT INTO role_has_permissions VALUES("115","8");
INSERT INTO role_has_permissions VALUES("116","1");
INSERT INTO role_has_permissions VALUES("116","8");
INSERT INTO role_has_permissions VALUES("117","1");
INSERT INTO role_has_permissions VALUES("117","2");
INSERT INTO role_has_permissions VALUES("117","6");
INSERT INTO role_has_permissions VALUES("117","8");
INSERT INTO role_has_permissions VALUES("118","1");
INSERT INTO role_has_permissions VALUES("118","8");
INSERT INTO role_has_permissions VALUES("119","1");
INSERT INTO role_has_permissions VALUES("119","8");
INSERT INTO role_has_permissions VALUES("120","1");
INSERT INTO role_has_permissions VALUES("120","8");
INSERT INTO role_has_permissions VALUES("121","1");
INSERT INTO role_has_permissions VALUES("121","2");
INSERT INTO role_has_permissions VALUES("121","6");
INSERT INTO role_has_permissions VALUES("121","8");
INSERT INTO role_has_permissions VALUES("122","1");
INSERT INTO role_has_permissions VALUES("122","2");
INSERT INTO role_has_permissions VALUES("122","6");
INSERT INTO role_has_permissions VALUES("122","7");
INSERT INTO role_has_permissions VALUES("122","8");
INSERT INTO role_has_permissions VALUES("123","1");
INSERT INTO role_has_permissions VALUES("123","2");
INSERT INTO role_has_permissions VALUES("123","6");
INSERT INTO role_has_permissions VALUES("123","7");
INSERT INTO role_has_permissions VALUES("123","8");
INSERT INTO role_has_permissions VALUES("124","1");
INSERT INTO role_has_permissions VALUES("124","2");
INSERT INTO role_has_permissions VALUES("124","6");
INSERT INTO role_has_permissions VALUES("124","8");
INSERT INTO role_has_permissions VALUES("125","1");
INSERT INTO role_has_permissions VALUES("125","2");
INSERT INTO role_has_permissions VALUES("125","6");
INSERT INTO role_has_permissions VALUES("125","7");
INSERT INTO role_has_permissions VALUES("125","8");
INSERT INTO role_has_permissions VALUES("126","1");
INSERT INTO role_has_permissions VALUES("126","2");
INSERT INTO role_has_permissions VALUES("126","6");
INSERT INTO role_has_permissions VALUES("126","8");
INSERT INTO role_has_permissions VALUES("127","1");
INSERT INTO role_has_permissions VALUES("127","2");
INSERT INTO role_has_permissions VALUES("127","6");
INSERT INTO role_has_permissions VALUES("127","8");
INSERT INTO role_has_permissions VALUES("128","1");
INSERT INTO role_has_permissions VALUES("128","8");
INSERT INTO role_has_permissions VALUES("129","1");
INSERT INTO role_has_permissions VALUES("129","8");
INSERT INTO role_has_permissions VALUES("130","1");
INSERT INTO role_has_permissions VALUES("130","8");
INSERT INTO role_has_permissions VALUES("131","1");
INSERT INTO role_has_permissions VALUES("131","2");
INSERT INTO role_has_permissions VALUES("131","6");
INSERT INTO role_has_permissions VALUES("131","8");
INSERT INTO role_has_permissions VALUES("132","1");
INSERT INTO role_has_permissions VALUES("132","2");
INSERT INTO role_has_permissions VALUES("132","6");
INSERT INTO role_has_permissions VALUES("132","7");
INSERT INTO role_has_permissions VALUES("132","8");



CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `guard_name` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO roles VALUES("1","Super Admin","L'administrateur peut accéder à toutes les données...","web","1","2018-06-01 23:46:44","2025-01-12 23:30:32");
INSERT INTO roles VALUES("2","Administrateur","Les accès administrator only","web","1","2018-10-22 02:38:13","2025-01-15 09:11:25");
INSERT INTO roles VALUES("4","Personnel","Le personnel a un accès spécifique...","web","1","2018-06-02 00:05:27","2025-01-12 23:29:13");
INSERT INTO roles VALUES("5","Caissier","Les accès des caissiers","web","1","2020-11-05 06:43:16","2025-01-15 09:10:13");
INSERT INTO roles VALUES("6","PDG","Les droits d’accès du Chef d entreprise","web","0","2025-01-12 23:23:20","2025-01-15 09:08:13");
INSERT INTO roles VALUES("7","Comptable","","web","1","2025-01-12 23:26:22","2025-01-12 23:26:22");
INSERT INTO roles VALUES("8","Administrateur","L'administrateur peut accéder à quelque donnée","web","0","2025-01-12 23:31:08","2025-01-15 09:07:55");



CREATE TABLE `sales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `table_id` int(11) DEFAULT NULL,
  `queue` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `biller_id` int(11) DEFAULT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_price` double NOT NULL,
  `grand_total` double NOT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `exchange_rate` double DEFAULT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount_type` varchar(191) DEFAULT NULL,
  `order_discount_value` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `coupon_id` int(11) DEFAULT NULL,
  `coupon_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `sale_status` int(11) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `document` varchar(191) DEFAULT NULL,
  `paid_amount` double DEFAULT NULL,
  `sale_note` text DEFAULT NULL,
  `staff_note` text DEFAULT NULL,
  `woocommerce_order_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO sales VALUES("7","posr-20250115-054511","1","2","","","1","2","","1","1","0","0","500","500","1","1","0","0","Flat","","0","","0","0","1","4","","500","","","","2025-01-15 17:45:11","2025-01-15 17:45:11");
INSERT INTO sales VALUES("8","posr-20250115-054639","1","2","","","1","2","2","6","6","0","0","7500","7500","1","1","0","0","Flat","","0","","0","0","1","4","","7500","","","","2025-01-15 17:46:39","2025-01-15 17:46:39");
INSERT INTO sales VALUES("10","posr-20250116-124812","1","3","","","1","2","1","2","1","0","0","1000","1000","1","1","0","0","Flat","","0","","0","0","3","2","","2000","","","","2025-01-16 00:48:12","2025-01-16 00:48:12");



CREATE TABLE `sms_templates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `is_default_ecommerce` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `stock_counts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `category_id` varchar(191) DEFAULT NULL,
  `brand_id` varchar(191) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(191) NOT NULL,
  `initial_file` varchar(191) DEFAULT NULL,
  `final_file` varchar(191) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `is_adjusted` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO stock_counts VALUES("1","scr-20250112-023316","2","","","47","full","20250112-023316.csv","","","0","2025-01-12 14:33:16","2025-01-12 14:33:16");
INSERT INTO stock_counts VALUES("2","scr-20250112-092345","2","","","47","full","20250112-092345.csv","","","0","2025-01-12 21:23:45","2025-01-12 21:23:45");



CREATE TABLE `suppliers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `company_name` varchar(191) NOT NULL,
  `vat_number` varchar(191) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `phone_number` varchar(191) NOT NULL,
  `address` varchar(191) NOT NULL,
  `city` varchar(191) NOT NULL,
  `state` varchar(191) DEFAULT NULL,
  `postal_code` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO suppliers VALUES("1","BADOS AFRICA","","BARDOS AFRICA","","contact@bardosafrica.biz","27 22 53 62 93","ABIDJAN 01- COCODY-COCOVIKO","ABIDJAN","","","COTE D'IVOIRE","1","2025-01-13 18:48:11","2025-01-13 18:48:11");



CREATE TABLE `tables` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `number_of_person` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO tables VALUES("1","Drink","5","","1","2025-01-11 21:34:31","2025-01-11 21:34:31");



CREATE TABLE `taxes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `rate` double NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `woocommerce_tax_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `transfers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `from_warehouse_id` int(11) NOT NULL,
  `to_warehouse_id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_cost` double NOT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `document` varchar(191) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `is_sent` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `units` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `unit_code` varchar(191) NOT NULL,
  `unit_name` varchar(191) NOT NULL,
  `base_unit` int(11) DEFAULT NULL,
  `operator` varchar(191) DEFAULT NULL,
  `operation_value` double DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO units VALUES("1","U","Unité","","*","1","1","2025-01-11 17:26:27","2025-01-11 17:26:27");
INSERT INTO units VALUES("2","Douzaine","Douzaine","1","*","12","1","2025-01-11 17:27:31","2025-01-15 08:32:23");
INSERT INTO units VALUES("3","C24","Carton de 24","1","*","24","1","2025-01-11 17:28:43","2025-01-15 08:32:52");
INSERT INTO units VALUES("4","C6","Carton de 6","1","*","6","1","2025-01-11 17:29:47","2025-01-15 08:33:05");
INSERT INTO units VALUES("5","g","Gramme","","*","1","1","2025-01-11 17:30:27","2025-01-11 17:30:27");
INSERT INTO units VALUES("6","Kg","Kiligramme","5","*","1000","1","2025-01-11 17:30:53","2025-01-15 08:33:52");



CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `phone` varchar(191) NOT NULL,
  `company_name` varchar(191) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `biller_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO users VALUES("1","admin","synergytechnology93@gmail.com","$2y$10$D3NNYjFpxZ/7ve5fTVs.k.6cH5AfPyPC1JL7/G8NQoVcTPvt9nZoa","qW0go4Ht0Gclb4JrwOJEZT8EdaUFnBYPM8QKtKScXk6nXLKnYLqTKMYX9V3I","27 22 53 6293 // 05 94 40 63 39","BARDOS AFRICA","1","","","1","0","2018-06-02 03:24:15","2025-01-11 14:05:26");
INSERT INTO users VALUES("3","dhiman da","dhiman@gmail.com","$2y$10$Fef6vu5E67nm11hX7V5a2u1ThNCQ6n9DRCvRF9TD7stk.Pmt2R6O.","5ehQM6JIfiQfROgTbB5let0Z93vjLHS7rd9QD5RPNgOxli3xdo7fykU7vtTt","212","lioncoders","1","","","0","1","2018-06-13 22:00:31","2020-11-05 07:06:51");
INSERT INTO users VALUES("6","test","test@gmail.com","$2y$10$TDAeHcVqHyCmurki0wjLZeIl1SngKX3WLOhyTiCoZG3souQfqv.LS","KpW1gYYlOFacumklO2IcRfSsbC3KcWUZzOI37gqoqM388Xie6KdhaOHIFEYm","1234","212312","4","","","0","1","2018-06-23 03:05:33","2018-06-23 03:13:45");
INSERT INTO users VALUES("8","test","test@yahoo.com","$2y$10$hlMigidZV0j2/IPkgE/xsOSb8WM2IRlsMv.1hg1NM7kfyd6bGX3hC","","31231","","4","","","0","1","2018-06-24 22:35:49","2018-07-02 01:07:39");
INSERT INTO users VALUES("9","staff","anda@gmail.com","$2y$10$kxDbnynB6mB1e1w3pmtbSOlSxy/WwbLPY5TJpMi0Opao5ezfuQjQm","EOBWOQLzRNZHj4Qo59mIDEW4z1qk7Bewt7tgTwGSnMaGlez2Xt47zb6ReIb1","3123","","4","5","1","1","0","2018-07-02 01:08:08","2018-10-23 21:41:13");
INSERT INTO users VALUES("10","abul","abul@alpha.com","$2y$10$5zgB2OOMyNBNVAd.QOQIju5a9fhNnTqPx5H6s4oFlXhNiF6kXEsPq","x7HlttI5bM0vSKViqATaowHFJkLS3PHwfvl7iJdFl5Z1SsyUgWCVbLSgAoi0","1234","anda","1","","","0","0","2018-09-07 23:44:48","2018-09-07 23:44:48");
INSERT INTO users VALUES("11","teststaff","a@a.com","$2y$10$5KNBIIhZzvvZEQEhkHaZGu.Q8bbQNfqYvYgL5N55B8Pb4P5P/b/Li","DkHDEcCA0QLfsKPkUK0ckL0CPM6dPiJytNa0k952gyTbeAyMthW3vi7IRitp","111","aa","4","5","1","0","1","2018-10-22 02:47:56","2018-10-23 02:10:56");
INSERT INTO users VALUES("12","john","john@gmail.com","$2y$10$P/pN2J/uyTYNzQy2kRqWwuSv7P2f6GE/ykBwtHdda7yci3XsfOKWe","O0f1WJBVjT5eKYl3Js5l1ixMMtoU6kqrH7hbHDx9I1UCcD9CmiSmCBzHbQZg","10001","","4","2","2","0","1","2018-12-30 00:48:37","2019-03-06 04:59:49");
INSERT INTO users VALUES("13","jjj","test@test.com","$2y$10$/Qx3gHWYWUhlF1aPfzXaCeZA7fRzfSEyCIOnk/dcC4ejO8PsoaalG","","1213","","1","","","0","1","2019-01-03 00:08:31","2019-03-03 04:02:29");
INSERT INTO users VALUES("19","shakalaka","shakalaka@gmail.com","$2y$10$ketLWT0Ib/JXpo00eJlxoeSw.7leS8V1CUGInfbyOWT4F5.Xuo7S2","","1212","Digital image","5","","","0","1","2020-11-09 00:07:16","2025-01-12 23:33:22");
INSERT INTO users VALUES("21","modon","modon@gmail.com","$2y$10$7VpoeGMkP8QCvL5zLwFW..6MYJ5MRumDLDoX.TTQtClS561rpFHY.","","2222","modon company","5","","","0","1","2020-11-13 07:12:08","2025-01-12 23:33:22");
INSERT INTO users VALUES("22","dhiman","dhiman@gmail.com","$2y$10$3mPygsC6wwnDtw/Sg85IpuExtUhgaHx52Lwp7Rz0.FNfuFdfKVpRq","","+8801111111101","lioncoders","5","","","0","1","2020-11-15 06:14:58","2025-01-11 17:04:53");
INSERT INTO users VALUES("31","mbs","mbs@gmail.com","$2y$10$6Ldm1rWEVSrlTmpjIXkeQO9KwWJz/j0FB4U.fY1oCFeax47rvttEK","","2121","","4","1","2","0","1","2021-12-29 06:40:22","2025-01-12 23:33:22");
INSERT INTO users VALUES("39","maja","maja@maja.com","$2y$10$lrMVhNDE9AuKhFrJIgG2y.zdtrCltR8/JB1okO0W8GsUcMjSFW7rW","","444555","","4","5","2","0","1","2022-09-14 04:37:21","2025-01-12 23:33:22");
INSERT INTO users VALUES("42","Tarik Iqbal","tarik_17@yahoo.co.uk","$2y$10$z2nZAsrIPrSWgPEtTY9D6.1vmkvYj4p3W3kamYvdoCDnCtlVqZp86","","","","5","","","0","1","2023-11-17 05:04:37","2025-01-12 23:33:22");
INSERT INTO users VALUES("43","support@lion-coders.com","support@lion-coders.com","$2y$10$ea.ekPLTQk0Y5087FqSbdevaN.gkEMGucgFJ13aGPEd.EqY45Y.AK","","","","5","","","0","1","2023-12-09 14:15:06","2025-01-12 23:33:22");
INSERT INTO users VALUES("44","james","jamesbond@gmail.com","$2y$10$7XCviP5GAZm6E/nlk4HQmuyw2kbhVpLbxsN6PqmNubmUKpiseGiEy","","313131","MI6","5","","","1","0","2024-01-19 13:23:28","2024-01-19 13:23:28");
INSERT INTO users VALUES("46","bkk","bkk@bkk.com","$2y$10$6FBCW.gf7tOH6ygDYLUcSeVkur1VL.iBSvGor35AxO849fJLxxZoW","","87897","","5","","","0","1","2024-06-10 10:40:15","2025-01-15 12:15:09");
INSERT INTO users VALUES("47","GRANT KOFFI","grantkoffi777@gmail.com","$2y$10$S1/Dhq5fBPW1/u8VwoGr4OFHXyyDIITNJhn0cqFaLjrz3gKhTxH4C","","0173011501","BARDOS AFRICA","5","1","2","1","0","2025-01-11 14:27:37","2025-01-16 00:32:57");
INSERT INTO users VALUES("48","DO RITA CHRISTELLE","synergytechnology9@gmail.com","$2y$10$gRa4yxuIBPNpTv02JJ7wQeSxKJBaq3xvZLbFpOJRcpdRcY39qg4Za","","0777265969","BARDOS","4","2","2","1","0","2025-01-11 16:39:03","2025-01-11 16:39:03");
INSERT INTO users VALUES("49","Jean sylvain Dossou","s.dossou@hotmail.co.uk","$2y$10$bh3aS4R/cORL4x8k/b2HWObZw5wSrg64O9qfZGvCFJtd6M4RGfEDq","","0707675050","BARDOS AFRICA SARL","2","","","1","0","2025-01-13 20:08:56","2025-01-15 09:17:14");
INSERT INTO users VALUES("50","DA","contact@immobiliacorporation.com","$2y$10$EEqH694p00DjJpvrT.5ctOOFYpLwC4WIZs9Ucy1bY5B9Y65P5hCNy","","0584434343","","1","","","1","0","2025-01-13 20:22:36","2025-01-13 20:22:36");
INSERT INTO users VALUES("51","Dona","pierrecyriaquedona@gmail.com","$2y$10$Th6Fhw6dmrABNwZtSYkO6u/1WGoToQ/Ume1WCrC0w4KX27vEQCV4K","","0720121218","SYNERGY TECH","1","","","1","0","2025-01-15 08:41:40","2025-01-15 09:17:46");
INSERT INTO users VALUES("52","Dev","cyriaquedona@gmail.com","$2y$10$t7/apQYt.RIyZV/4k7XIzec1daFWDdbCJMuZBfnQB1BemKTDkGnXi","","0720121218","SYNERGY TECH","2","","","1","0","2025-01-15 08:45:55","2025-01-15 12:15:33");
INSERT INTO users VALUES("53","Patron","behanzinpierrecyriaque@gmail.com","$2y$10$UgHlanpcVvPpciqtM93ES.h04dAGpjegVDXIAGYTuQmJBWMRKzTou","","0142455422","","2","","","1","0","2025-01-15 12:17:11","2025-01-15 12:17:11");



CREATE TABLE `variants` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `warehouses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `address` text NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO warehouses VALUES("1","BARDOS - BAR","05 94 40 63 39","","ABIDJAN 01","1","2025-01-11 14:35:08","2025-01-12 22:23:47");
INSERT INTO warehouses VALUES("2","BARDOS - SUPERETTE","27 22 53 62 93","synergytechnology93@gmail.com","ABIDJAN 01","1","2025-01-11 15:34:45","2025-01-12 22:22:28");
INSERT INTO warehouses VALUES("3","BARDOS - PIZZIRIA","2722536293","synergytechnology93@gmail.com","ABIDJAN 01","1","2025-01-11 15:36:36","2025-01-12 22:23:16");

