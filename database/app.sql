CREATE TABLE IF NOT EXISTS `access` (
  `access_id` int(11) NOT NULL AUTO_INCREMENT,
  `access_group_id` int(11) NOT NULL,
  `access_module_id` int(11) NOT NULL,
  `access_view` int(11) DEFAULT '0',
  `access_insert` int(11) DEFAULT '0',
  `access_update` int(11) DEFAULT '0',
  `access_delete` int(11) DEFAULT '0',
  PRIMARY KEY (`access_id`),
  KEY `access_group_id_idx` (`access_group_id`),
  KEY `access_module_id` (`access_module_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `access`
--

INSERT INTO `access` (`access_id`, `access_group_id`, `access_module_id`, `access_view`, `access_insert`, `access_update`, `access_delete`) VALUES
(1, 1, 21, 1, 0, 0, 0),
(2, 1, 22, 1, 1, 1, 1),
(3, 1, 23, 1, 1, 1, 1),
(4, 1, 24, 1, 1, 0, 0),
(5, 1, 25, 1, 1, 1, 1),
(6, 2, 21, 1, 0, 0, 0),
(7, 1, 26, 1, 0, 1, 0),
(8, 2, 0, 1, 0, 0, 0),
(9, 2, 25, 1, 1, 0, 0),
(10, 2, 24, 0, 0, 0, 0),
(11, 1, 27, 1, 1, 1, 1),
(12, 2, 27, 0, 0, 0, 0),
(13, 2, 22, 1, 0, 0, 0),
(14, 2, 23, 1, 0, 0, 0),
(16, 1, 28, 1, 1, 1, 1),
(17, 1, 29, 1, 1, 1, 1),
(18, 1, 30, 1, 1, 1, 1),
(19, 1, 32, 1, 0, 1, 0),
(20, 1, 31, 1, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(45) DEFAULT NULL,
  `category_image` varchar(120) NOT NULL,
  `category_img` varchar(80) NOT NULL,
  `category_desc` text,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `category_image`, `category_img`, `category_desc`) VALUES
(1, 'Pizza', '<img src="../upload/gambar/1426389025.png" width="100%"></img>', '1426389025.png', 'Pizza Category'),
(2, 'Drink', '<img src="../upload/gambar/1426389057an.png" width="100%"></img>', '1426389057an.png', 'Drink Category'),
(3, 'Pasta', '<img src="../upload/gambar/1426389078.png" width="100%"></img>', '1426389078.png', 'Pasta Category');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(45) DEFAULT NULL,
  `group_description` varchar(130) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`group_id`, `group_name`, `group_description`) VALUES
(1, 'admin', 'Administrator Access'),
(2, 'user', 'User Access');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_category_id` int(11) DEFAULT NULL,
  `menu_name` varchar(65) DEFAULT NULL,
  `menu_price` double DEFAULT NULL,
  `menu_disc` float DEFAULT NULL,
  `menu_image` varchar(125) DEFAULT NULL,
  `menu_img` varchar(80) NOT NULL,
  `menu_desc` text,
  PRIMARY KEY (`menu_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`menu_id`, `menu_category_id`, `menu_name`, `menu_price`, `menu_disc`, `menu_image`, `menu_img`, `menu_desc`) VALUES
(1, 1, 'Super Supremes', 10.5, 10, '<img src="../upload/gambar/1426389202.jpg" width="100%"></img>', '1426389202.jpg', 'Super Supreme Chicken and smoked beef, minced beef, beef burgers, mushrooms, onions, red peppers and green peppers'),
(2, 1, ' Meat Lovers', 10.5, 10, '<img src="../upload/gambar/142639118789249.jpg" width="100%"></img>', '142639118789249.jpg', 'Meat Lovers Sliced beef sausage, minced beef, beef burgers, chicken sausage'),
(3, 1, 'Tuna Melt', 16.5, 0, '<img src="../upload/gambar/1426389422.jpg" width="100%"></img>', '1426389422.jpg', 'Tuna Melt Sliced tuna meat, grain, corn, mayonnaise sauce'),
(4, 1, 'Splitza', 17.5, 0, '<img src="../upload/gambar/1426389476.jpg" width="100%"></img>', '1426389476.jpg', 'Splitza one pizza two topping: seafood dan beetato pepperoni'),
(5, 1, 'American Favourite', 10.8, 5, '<img src="../upload/gambar/1426389507.jpg" width="100%"></img>', '1426389507.jpg', 'Favourite Pepperoni American beef, minced beef, mushrooms'),
(6, 2, 'Green Tea Yakult', 15.5, 0, '<img src="../upload/gambar/1426389533.jpg" width="100%"></img>', '1426389533.jpg', 'Green Tea Yakult'),
(7, 2, 'Strawberry Watermelon', 3.5, 10, '<img src="../upload/gambar/1426389556.jpg" width="100%"></img>', '1426389556.jpg', 'Strawberry Watermelon Juice'),
(8, 2, 'Avocado Juice', 7.3, 0, '<img src="../upload/gambar/1426389596.jpg" width="100%"></img>', '1426389596.jpg', 'Avocado Juice'),
(9, 2, 'Favourite Float', 3.5, 0, '<img src="../upload/gambar/1426389621.jpg" width="100%"></img>', '1426389621.jpg', 'Favourite Float'),
(10, 3, 'Cheese', 16, 15, '<img src="../upload/gambar/1426389660.jpg" width="100%"></img>', '1426389660.jpg', 'Cheese - Baked Fusilli Beef, beef bits crunchy, creamy cheddar cheese sauce covered'),
(11, 3, 'Black Pepper Beef', 7.6, 0, '<img src="../upload/gambar/1426389693.jpg" width="100%"></img>', '1426389693.jpg', 'Black Pepper Beef / Chicken Fettuccine Pan-fried, beef / chicken seasoning black pepper. black pepper sauce, pickled fresh'),
(12, 3, 'Chicken Par-mi-gia-na', 8, 15, '<img src="../upload/gambar/1426389726.jpg" width="100%"></img>', '1426389726.jpg', 'Chicken Par-mi-na-gia Spinach Fettuccine Fettuccine spinach sauteed with olive oil and Italian seasoning. Coated chicken pieces Pronto tomato sauce and mozzarella cheese');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `message_name` varchar(45) NOT NULL,
  `message_email` varchar(25) NOT NULL,
  `message_phone` bigint(20) NOT NULL,
  `message_value` text NOT NULL,
  `message_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`message_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`message_id`, `message_name`, `message_email`, `message_phone`, `message_value`, `message_timestamp`) VALUES
(1, 'rizal', 'rizal.saleh1@gmail.com', 864480, 'test', '2015-04-06 02:08:46'),
(3, 'rizal', 'riza@gmail.com', 864480, 'Test', '2015-04-07 17:21:56'),
(5, 'ahmad', 'salehriz@gmail.com', 819344444, 'finish', '2015-04-09 00:17:24');

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE IF NOT EXISTS `module` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(45) DEFAULT NULL,
  `module_link` varchar(125) DEFAULT NULL,
  `module_order` int(11) NOT NULL,
  `module_icon` varchar(45) NOT NULL,
  `module_description` text,
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `module`
--

INSERT INTO `module` (`module_id`, `module_name`, `module_link`, `module_order`, `module_icon`, `module_description`) VALUES
(22, 'Category Menu', 'category', 2, 'gn-icon-icon-list', 'Module Category Menu'),
(23, 'Promo', 'promo', 3, 'gn-icon-icon-sale-2', 'Modul Promo'),
(24, 'Message', 'message', 4, 'gn-icon-icon-list-2', 'Module Message'),
(25, 'User Admin', 'user', 8, 'gn-icon-icon-uniF00F', 'Module User Admin'),
(26, 'List Orders', 'list_order', 6, 'gn-icon-icon-cart', 'Module List Orders'),
(28, 'List Menu', 'menu', 2, 'gn-icon-icon-food', 'Module List Menu'),
(29, 'Group Access', 'group', 9, 'gn-icon-icon-users', 'Module User Access'),
(30, 'Customers', 'customers', 3, 'gn-icon-icon-user', 'Module Customers'),
(31, 'Setting', 'setting', 6, 'gn-icon-icon-settings3', 'Module Setting'),
(32, 'Opening Hours', 'opening', 6, 'gn-icon-icon-clock', 'Module Opening Hours');

-- --------------------------------------------------------

--
-- Table structure for table `opening_hours`
--

CREATE TABLE IF NOT EXISTS `opening_hours` (
  `opening_hours_id` int(11) NOT NULL AUTO_INCREMENT,
  `opening_hours_day` varchar(25) NOT NULL,
  `opening_hours_open` time NOT NULL,
  `opening_hours_close` time NOT NULL,
  PRIMARY KEY (`opening_hours_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `opening_hours`
--

INSERT INTO `opening_hours` (`opening_hours_id`, `opening_hours_day`, `opening_hours_open`, `opening_hours_close`) VALUES
(1, 'Monday', '11:00:00', '20:00:00'),
(2, 'Tuesday', '10:00:00', '20:00:00'),
(3, 'Wednesday', '10:00:00', '20:00:00'),
(4, 'Thursday', '10:00:00', '20:00:00'),
(5, 'Friday', '10:00:00', '20:00:00'),
(6, 'Saturday', '10:00:00', '20:00:00'),
(7, 'Sunday', '10:00:00', '20:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `order_header`
--

CREATE TABLE IF NOT EXISTS `order_header` (
  `order_header_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_header_ref` varchar(15) DEFAULT NULL,
  `order_header_customers_name` varchar(45) NOT NULL,
  `order_header_customers_email` varchar(45) NOT NULL,
  `order_header_customers_telp` varchar(25) NOT NULL,
  `order_header_customers_address` text NOT NULL,
  `order_header_customers_street` text NOT NULL,
  `order_header_delivery_fee` double NOT NULL,
  `order_header_tax` int(11) NOT NULL,
  `order_header_tax_total` double NOT NULL,
  `order_header_subtotal` double NOT NULL,
  `order_header_total` double(10,0) NOT NULL,
  `order_header_note` text NOT NULL,
  `order_header_status` varchar(45) NOT NULL,
  `order_header_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_header_id`),
  UNIQUE KEY `order_header_ref` (`order_header_ref`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `order_header`
--

INSERT INTO `order_header` (`order_header_id`, `order_header_ref`, `order_header_customers_name`, `order_header_customers_email`, `order_header_customers_telp`, `order_header_customers_address`, `order_header_customers_street`, `order_header_delivery_fee`, `order_header_tax`, `order_header_tax_total`, `order_header_subtotal`, `order_header_total`, `order_header_note`, `order_header_status`, `order_header_date`) VALUES
(1, '81500107926', 'rizal saleh', 'rizal.saleh1@gmail.com', '864480', 'Gunung Sari, Rappocini, Makassar City, South Sulawesi, Indonesia', 'minasa upa', 6, 15, 4.95, 33, 44, '', 'Orders', '2015-04-08 14:07:48'),
(2, '66338983086', 'rizal saleh', 'rizal.saleh1@gmail.com', '864480', 'Gunung Sari, Rappocini, Makassar City, South Sulawesi, Indonesia', 'minasa upa', 6, 15, 4.44, 29.6, 40, 'ok', 'Orders', '2015-04-08 14:16:31'),
(3, '18561849985', 'rizal saleh', 'rizal.saleh1@gmail.com', '864480', 'Gunung Sari, Rappocini, Makassar City, South Sulawesi, Indonesia', 'minasa upa', 6, 15, 2.835, 18.9, 28, 'ok', 'Orders', '2015-04-08 14:19:02'),
(4, '9229271804', 'rizal saleh', 'rizal.saleh1@gmail.com', '864480', 'Gunung Sari, Rappocini, Makassar City, South Sulawesi, Indonesia', 'minasa upa', 6, 15, 7.425, 49.5, 63, 'ok', 'Orders', '2015-04-08 14:20:17'),
(5, '98294551636', 'rizal saleh', 'rizal.saleh1@gmail.com', '864480', 'Gunung Sari, Rappocini, Makassar City, South Sulawesi, Indonesia', 'minasa upa', 6, 15, 2.04, 13.6, 22, '', 'Orders', '2015-04-08 14:25:21'),
(6, '72675616878', 'rizal saleh', 'rizal.saleh1@gmail.com', '864480', 'Gunung Sari, Rappocini, Makassar City, South Sulawesi, Indonesia', 'minasa upa', 6, 15, 2.04, 13.6, 22, 'ok', 'Orders', '2015-04-08 14:25:35'),
(7, '69647918392', 'rizal saleh', 'rizal.saleh1@gmail.com', '864480', 'Gunung Sari, Rappocini, Makassar City, South Sulawesi, Indonesia', 'minasa upa', 6, 15, 4.65, 31, 42, 'ok', 'Orders', '2015-04-08 14:33:27'),
(8, '2141691114', 'rizal saleh', 'rizal.saleh1@gmail.com', '864480', 'Gunung Sari, Rappocini, Makassar City, South Sulawesi, Indonesia', 'minasa upa', 6, 15, 2.835, 18.9, 28, '', 'Orders', '2015-04-08 14:35:18'),
(9, '25600607223', 'rizal saleh', 'rizal.saleh1@gmail.com', '864480', 'Gunung Sari, Rappocini, Makassar City, South Sulawesi, Indonesia', 'minasa upa', 6, 15, 5.25, 35, 46, '', 'Proccess', '2015-04-08 14:39:00'),
(10, '84427212220', 'rizal saleh', 'rizal.saleh1@gmail.com', '864480', 'Gunung Sari, Rappocini, Makassar City, South Sulawesi, Indonesia', 'minasa upa', 6, 15, 2.19, 14.6, 23, 'Fast delivery', 'Done', '2015-04-08 14:54:28'),
(11, '81766829718', 'Ahmad', 'salehriz@gmail.com', '081934444', 'Gunung Sari, Rappocini, Makassar City, South Sulawesi, Indonesia', 'Jalan Pelita', 6, 15, 2.1, 14, 22, 'ok', 'Proccess', '2015-04-09 00:16:05'),
(12, '76379072749', 'rizal saleh', 'rizal.saleh1@gmail.com', '864480', 'Gunung Sari, Rappocini, Makassar City, South Sulawesi, Indonesia', 'minasa upa', 6, 15, 8.604, 57.36, 72, 'ok', 'Orders', '2015-04-09 03:49:29');

-- --------------------------------------------------------

--
-- Table structure for table `order_line`
--

CREATE TABLE IF NOT EXISTS `order_line` (
  `order_line_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_line_header_ref` varchar(15) DEFAULT NULL,
  `order_line_menu_id` int(11) DEFAULT NULL,
  `order_line_category_name` varchar(45) NOT NULL,
  `order_line_name` varchar(45) DEFAULT NULL,
  `order_line_image` varchar(65) DEFAULT NULL,
  `order_line_price` double DEFAULT NULL,
  `order_line_disc` float DEFAULT NULL,
  `order_line_qty` int(11) DEFAULT NULL,
  `order_line_subtotal` double NOT NULL,
  `order_line_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_line_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `order_line`
--

INSERT INTO `order_line` (`order_line_id`, `order_line_header_ref`, `order_line_menu_id`, `order_line_category_name`, `order_line_name`, `order_line_image`, `order_line_price`, `order_line_disc`, `order_line_qty`, `order_line_subtotal`, `order_line_date`) VALUES
(1, '6760776697', 9, 'Drink', 'Favourite Float', '1426389621.jpg', 3.5, 0, 3, 10.5, '2015-04-08 14:05:55'),
(2, '81500107926', 3, 'Pizza', 'Tuna Melt', '1426389422.jpg', 16.5, 0, 2, 33, '2015-04-08 14:07:47'),
(3, '66338983086', 11, 'Pasta', 'Black Pepper Beef', '1426389693.jpg', 7.6, 0, 3, 22.8, '2015-04-08 14:16:30'),
(4, '66338983086', 12, 'Pasta', 'Chicken Par-mi-gia-na', '1426389726.jpg', 8, 15, 1, 6.8, '2015-04-08 14:16:31'),
(5, '18561849985', 2, 'Pizza', ' Meat Lovers', '142639118789249.jpg', 10.5, 10, 2, 18.9, '2015-04-08 14:19:01'),
(6, '9229271804', 3, 'Pizza', 'Tuna Melt', '1426389422.jpg', 16.5, 0, 3, 49.5, '2015-04-08 14:20:17'),
(7, '98294551636', 12, 'Pasta', 'Chicken Par-mi-gia-na', '1426389726.jpg', 8, 15, 2, 13.6, '2015-04-08 14:25:20'),
(8, '72675616878', 12, 'Pasta', 'Chicken Par-mi-gia-na', '1426389726.jpg', 8, 15, 2, 13.6, '2015-04-08 14:25:33'),
(9, '69647918392', 6, 'Drink', 'Green Tea Yakult', '1426389533.jpg', 15.5, 0, 2, 31, '2015-04-08 14:33:26'),
(10, '2141691114', 2, 'Pizza', ' Meat Lovers', '142639118789249.jpg', 10.5, 10, 2, 18.9, '2015-04-08 14:35:18'),
(11, '25600607223', 4, 'Pizza', 'Splitza', '1426389476.jpg', 17.5, 0, 2, 35, '2015-04-08 14:39:00'),
(12, '84427212220', 9, 'Drink', 'Favourite Float', '1426389621.jpg', 3.5, 0, 2, 7, '2015-04-08 14:54:28'),
(13, '84427212220', 11, 'Pasta', 'Black Pepper Beef', '1426389693.jpg', 7.6, 0, 1, 7.6, '2015-04-08 14:54:28'),
(14, '81766829718', 9, 'Drink', 'Favourite Float', '1426389621.jpg', 3.5, 0, 4, 14, '2015-04-09 00:16:04'),
(15, '76379072749', 10, 'Pasta', 'Cheese', '1426389660.jpg', 16, 15, 3, 40.8, '2015-04-09 03:49:27'),
(16, '76379072749', 7, 'Drink', 'Strawberry Watermelon', '1426389556.jpg', 3.5, 10, 2, 6.3, '2015-04-09 03:49:28'),
(17, '76379072749', 5, 'Pizza', 'American Favourite', '1426389507.jpg', 10.8, 5, 1, 10.26, '2015-04-09 03:49:29');

-- --------------------------------------------------------
--
-- Table structure for table `promo`
--

CREATE TABLE IF NOT EXISTS `promo` (
  `promo_id` int(11) NOT NULL AUTO_INCREMENT,
  `promo_title` varchar(85) NOT NULL,
  `promo_desc` text,
  `promo_img` varchar(150) NOT NULL,
  `promo_image` varchar(501) NOT NULL,
  `promo_end_date` date NOT NULL,
  `promo_status` enum('Aktif','Non Aktif') NOT NULL,
  PRIMARY KEY (`promo_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `promo`
--

INSERT INTO `promo` (`promo_id`, `promo_title`, `promo_desc`, `promo_img`, `promo_image`, `promo_end_date`, `promo_status`) VALUES
(1, 'New Promo', 'Package festive menu for 4 people', 'image-28677.jpg', '<img src="../upload/gambar/image-28677.jpg" width="100%"></img>', '2015-04-30', 'Aktif'),
(2, 'Get Promo', 'Package festive menu for 4 people', '1426343736hut_06012014.jpg', '<img src="../upload/gambar/1426343736hut_06012014.jpg" width="100%"></img>', '2015-04-14', 'Aktif');

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE IF NOT EXISTS `register` (
  `register_id` int(11) NOT NULL AUTO_INCREMENT,
  `register_email` varchar(65) NOT NULL,
  `register_password` varchar(45) NOT NULL,
  `register_name` varchar(45) NOT NULL,
  `register_address` text NOT NULL,
  `register_street` text NOT NULL,
  `register_phone` varchar(20) NOT NULL,
  `register_type` varchar(25) NOT NULL,
  `register_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`register_id`),
  UNIQUE KEY `register_email` (`register_email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;

--
-- Dumping data for table `register`
--

INSERT INTO `register` (`register_id`, `register_email`, `register_password`, `register_name`, `register_address`, `register_street`, `register_phone`, `register_type`, `register_date`) VALUES
(1, 'rizal.saleh1@gmail.com', 'rahasia888', 'rizal saleh', 'Gunung Sari, Rappocini, Makassar City, South Sulawesi, Indonesia', 'minasa upa', '864480', 'internal', '2015-04-04 07:46:42'),
(29, 'salehriz@gmail.com', '12345', 'Ahmad', 'Gunung Sari, Rappocini, Makassar City, South Sulawesi, Indonesia', 'Jalan Pelita', '081934444', 'internal', '2015-04-09 00:15:42');

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE IF NOT EXISTS `setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `setting_name` varchar(65) NOT NULL,
  `setting_address` text NOT NULL,
  `setting_telephone` varchar(20) NOT NULL,
  `setting_email` varchar(40) NOT NULL,
  `setting_img` varchar(85) NOT NULL,
  `setting_images` varchar(140) NOT NULL,
  `setting_website` varchar(55) NOT NULL,
  `setting_tax` float NOT NULL,
  `setting_latitude` double NOT NULL,
  `setting_longitude` double NOT NULL,
  `setting_delivery_fee` float NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`setting_id`, `setting_name`, `setting_address`, `setting_telephone`, `setting_email`, `setting_img`, `setting_images`, `setting_website`, `setting_tax`, `setting_latitude`, `setting_longitude`, `setting_delivery_fee`) VALUES
(1, 'Pizza Hut', 'Jalan BTN Minasa Upa Blok A6 No.19', '081934444055', 'rizal.saleh1@gmail.com', 'store_image.jpg', '<img src="../upload/gambar/store_image.jpg" width="100%"></img>', 'www.pizzahu.com', 15, 119.4442755, -5.1512761, 6.5);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) NOT NULL,
  `user_password` varchar(125) NOT NULL,
  `user_group` int(11) NOT NULL,
  `user_full_name` varchar(65) NOT NULL,
  `user_email` varchar(45) NOT NULL,
  `user_phone` varchar(16) NOT NULL,
  `user_address` text NOT NULL,
  `user_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_aktif` int(11) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `user_password`, `user_group`, `user_full_name`, `user_email`, `user_phone`, `user_address`, `user_update`, `user_aktif`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 1, 'administrator', 'admin@info.com', '+628923274274277', 'Makassar, Indonesia', '2014-04-17 15:45:51', 1),
(2, 'user', 'd41d8cd98f00b204e9800998ecf8427e', 2, 'user', 'user@info.com', '', '', '2015-04-09 01:58:34', 0);
