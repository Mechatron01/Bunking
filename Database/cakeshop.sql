-- MariaDB dump 10.19  Distrib 10.4.27-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: cakeshop
-- ------------------------------------------------------
-- Server version	10.4.27-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `cartID` bigint(20) NOT NULL AUTO_INCREMENT,
  `userID` bigint(20) NOT NULL,
  PRIMARY KEY (`cartID`),
  KEY `userID` (`userID`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (9,4),(10,5),(11,6);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartitem`
--

DROP TABLE IF EXISTS `cartitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cartitem` (
  `cartItemID` bigint(20) NOT NULL AUTO_INCREMENT,
  `productID` bigint(20) NOT NULL,
  `cartID` bigint(20) NOT NULL,
  `price` float NOT NULL,
  `quantity` smallint(6) NOT NULL,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`cartItemID`),
  KEY `1_Cart_Zero-Or-More_CartItems` (`cartID`),
  KEY `1_Product_Many_CartItems` (`productID`),
  CONSTRAINT `1_Cart_Zero-Or-More_CartItems` FOREIGN KEY (`cartID`) REFERENCES `cart` (`cartID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `1_Product_Many_CartItems` FOREIGN KEY (`productID`) REFERENCES `products` (`productID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartitem`
--

LOCK TABLES `cartitem` WRITE;
/*!40000 ALTER TABLE `cartitem` DISABLE KEYS */;
INSERT INTO `cartitem` VALUES (17,2,9,25,1,'2020-12-27 13:59:46'),(18,3,9,15,3,'2020-12-27 14:18:52'),(19,5,9,60,3,'2020-12-27 14:18:56'),(32,3,11,15,1,'2023-03-31 01:17:59');
/*!40000 ALTER TABLE `cartitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `categoryID` bigint(20) NOT NULL AUTO_INCREMENT,
  `p_cat_name` varchar(30) NOT NULL,
  `p_cat_desc` text NOT NULL,
  PRIMARY KEY (`categoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'cake','cakes with layer(s), frosting and top coat'),(2,'cupcake','small cake baked in cupcake or muffin cups'),(3,'cakepop','cake shaped as lollipops'),(4,'cookie','baked circular or differently shaped biscuits'),(5,'macaron','sandwiched cookies and cream'),(6,'brownie','chocolate fudge cakes'),(7,'pastry','cakes that don\'t fall in any other categories');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderitem` (
  `orderItemID` bigint(20) NOT NULL AUTO_INCREMENT,
  `productID` bigint(20) NOT NULL,
  `orderID` bigint(20) NOT NULL,
  `price` float NOT NULL,
  `quantity` smallint(6) NOT NULL,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`orderItemID`),
  KEY `1_Order_Many_OrderItems` (`orderID`),
  KEY `1_Product_Many_OrderItems` (`productID`),
  CONSTRAINT `1_Order_Many_OrderItems` FOREIGN KEY (`orderID`) REFERENCES `userorder` (`orderID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `1_Product_Many_OrderItems` FOREIGN KEY (`productID`) REFERENCES `products` (`productID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitem`
--

LOCK TABLES `orderitem` WRITE;
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
INSERT INTO `orderitem` VALUES (14,1,12,25,1,'2020-12-27 02:36:14'),(15,3,12,15,2,'2020-12-27 02:36:14'),(16,2,12,25,2,'2020-12-27 13:49:55'),(17,2,12,25,4,'2020-12-27 13:58:44'),(18,2,15,25,1,'2023-03-30 17:32:50'),(19,2,15,25,4,'2023-03-30 17:35:23'),(20,13,17,20,3,'2023-03-30 20:07:54'),(21,14,17,20,3,'2023-03-30 20:59:11'),(22,5,17,60,3,'2023-03-30 21:01:00'),(23,4,17,20,2,'2023-03-30 21:01:00'),(24,6,17,650,1,'2023-03-30 21:13:59'),(25,37,17,650,1,'2023-03-30 21:38:20'),(26,43,17,1000,1,'2023-03-30 23:37:57'),(27,5,15,60,3,'2023-03-30 23:48:00'),(28,24,17,320,1,'2023-03-30 23:50:01'),(29,4,17,20,1,'2023-03-31 00:24:14');
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `userID` bigint(20) NOT NULL,
  `orderID` bigint(20) NOT NULL DEFAULT 0,
  `address` varchar(100) NOT NULL,
  `phone` varchar(8) NOT NULL,
  `isSchedule` tinyint(1) DEFAULT 0,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `productID` bigint(20) NOT NULL,
  `p_name` varchar(100) NOT NULL,
  `quantity` smallint(6) NOT NULL,
  `total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (4,12,'flic en flac','55555555',0,NULL,NULL,1,'Vanilla Cupcake',1,55),(4,12,'flic en flac','55555555',0,NULL,NULL,3,'Choc chip cookie',2,55),(4,12,'flic en flac','55555555',0,NULL,NULL,2,'Red Velvet Cupcake',2,55),(4,12,'flic en flac','55555555',0,NULL,NULL,2,'Red Velvet Cupcake',4,55),(5,15,'1234 main st','',1,'2023-04-03','12:33:00',2,'Red Velvet Cupcake',1,25),(5,15,'1234 main st','',1,'2023-04-03','12:33:00',2,'Red Velvet Cupcake',4,25),(4,12,'flic en flac','55555555',0,NULL,NULL,1,'Vanilla Cupcake',1,55),(4,12,'flic en flac','55555555',0,NULL,NULL,3,'Choc chip cookie',2,55),(4,12,'flic en flac','55555555',0,NULL,NULL,2,'Red Velvet Cupcake',2,55),(4,12,'flic en flac','55555555',0,NULL,NULL,2,'Red Velvet Cupcake',4,55),(5,15,'1234 main st','',1,'2023-04-03','12:33:00',2,'Red Velvet Cupcake',1,25),(5,15,'1234 main st','',1,'2023-04-03','12:33:00',2,'Red Velvet Cupcake',4,25),(6,17,'3 beaconhill','',0,'0000-00-00','00:00:00',13,'Cinnamon brownie',3,60),(4,12,'flic en flac','55555555',0,NULL,NULL,1,'Vanilla Cupcake',1,55),(4,12,'flic en flac','55555555',0,NULL,NULL,3,'Choc chip cookie',2,55),(4,12,'flic en flac','55555555',0,NULL,NULL,2,'Red Velvet Cupcake',2,55),(4,12,'flic en flac','55555555',0,NULL,NULL,2,'Red Velvet Cupcake',4,55),(5,15,'1234 main st','',1,'2023-04-03','12:33:00',2,'Red Velvet Cupcake',1,25),(5,15,'1234 main st','',1,'2023-04-03','12:33:00',2,'Red Velvet Cupcake',4,25),(6,17,'3 beaconhill','',0,'0000-00-00','00:00:00',13,'Cinnamon brownie',3,60),(6,17,'3 beaconhill','',0,'0000-00-00','00:00:00',14,'choc-chip brownie',3,60),(4,12,'flic en flac','55555555',0,NULL,NULL,1,'Vanilla Cupcake',1,55),(4,12,'flic en flac','55555555',0,NULL,NULL,3,'Choc chip cookie',2,55),(4,12,'flic en flac','55555555',0,NULL,NULL,2,'Red Velvet Cupcake',2,55),(4,12,'flic en flac','55555555',0,NULL,NULL,2,'Red Velvet Cupcake',4,55),(5,15,'1234 main st','',1,'2023-04-03','12:33:00',2,'Red Velvet Cupcake',1,25),(5,15,'1234 main st','',1,'2023-04-03','12:33:00',2,'Red Velvet Cupcake',4,25),(6,17,'3 beaconhill','',0,'0000-00-00','00:00:00',13,'Cinnamon brownie',3,60),(6,17,'3 beaconhill','',0,'0000-00-00','00:00:00',14,'choc-chip brownie',3,60),(6,17,'3 beaconhill','',0,'0000-00-00','00:00:00',5,'Donut',3,60),(6,17,'3 beaconhill','',0,'0000-00-00','00:00:00',4,'Croissant',2,60),(6,17,'3 beaconhill','',0,'0000-00-00','00:00:00',6,'Macaron_box_20',1,60),(6,17,'3 beaconhill','',0,'0000-00-00','00:00:00',37,'Rainbow cake',1,60),(4,12,'flic en flac','55555555',0,NULL,NULL,1,'Vanilla Cupcake',1,55),(4,12,'flic en flac','55555555',0,NULL,NULL,3,'Choc chip cookie',2,55),(4,12,'flic en flac','55555555',0,NULL,NULL,2,'Red Velvet Cupcake',2,55),(4,12,'flic en flac','55555555',0,NULL,NULL,2,'Red Velvet Cupcake',4,55),(5,15,'1234 main st','',1,'2023-04-03','12:33:00',2,'Red Velvet Cupcake',1,25),(5,15,'1234 main st','',1,'2023-04-03','12:33:00',2,'Red Velvet Cupcake',4,25),(6,17,'3 beaconhill','',0,'0000-00-00','00:00:00',13,'Cinnamon brownie',3,60),(6,17,'3 beaconhill','',0,'0000-00-00','00:00:00',14,'choc-chip brownie',3,60),(6,17,'3 beaconhill','',0,'0000-00-00','00:00:00',5,'Donut',3,60),(6,17,'3 beaconhill','',0,'0000-00-00','00:00:00',4,'Croissant',2,60),(6,17,'3 beaconhill','',0,'0000-00-00','00:00:00',6,'Macaron_box_20',1,60),(6,17,'3 beaconhill','',0,'0000-00-00','00:00:00',37,'Rainbow cake',1,60),(6,17,'3 beaconhill','',0,'0000-00-00','00:00:00',43,'White floral fondant cake',1,60);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_category` (
  `productID` bigint(20) NOT NULL,
  `categoryID` bigint(20) NOT NULL,
  KEY `1_Product_Many_Categories` (`productID`),
  KEY `1_Category_Many_Products` (`categoryID`),
  CONSTRAINT `1_Category_Many_Products` FOREIGN KEY (`categoryID`) REFERENCES `categories` (`categoryID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `1_Product_Many_Categories` FOREIGN KEY (`productID`) REFERENCES `products` (`productID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (1,2),(2,2),(3,4),(4,7),(5,7),(6,5),(7,2),(8,7),(9,7),(10,3),(11,2),(12,2),(13,6),(14,6),(15,6),(16,6),(17,6),(18,6),(19,6),(20,6),(21,6),(22,6),(23,6),(24,6),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,4),(46,4),(47,4),(48,4),(49,4),(50,4),(51,4),(52,4);
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_type`
--

DROP TABLE IF EXISTS `product_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_type` (
  `productID` bigint(20) NOT NULL,
  `typeID` bigint(20) NOT NULL,
  KEY `1_Product_Many_Types` (`productID`),
  KEY `1_Type_Many_Products` (`typeID`),
  CONSTRAINT `1_Product_Many_Types` FOREIGN KEY (`productID`) REFERENCES `products` (`productID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `1_Type_Many_Products` FOREIGN KEY (`typeID`) REFERENCES `types` (`typeID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_type`
--

LOCK TABLES `product_type` WRITE;
/*!40000 ALTER TABLE `product_type` DISABLE KEYS */;
INSERT INTO `product_type` VALUES (1,2),(2,2),(3,2),(4,2),(5,2),(6,2),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,2),(14,2),(15,2),(16,2),(17,2),(18,2),(19,2),(20,2),(21,2),(22,2),(23,2),(24,2),(37,2),(38,2),(39,2),(40,2),(41,2),(42,2),(43,2),(44,2),(45,2),(46,2),(47,2),(48,2),(49,2),(50,2),(51,2),(52,2);
/*!40000 ALTER TABLE `product_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `productID` bigint(20) NOT NULL AUTO_INCREMENT,
  `p_name` varchar(100) NOT NULL,
  `p_desc` text NOT NULL,
  `p_img` text NOT NULL,
  `p_price` float NOT NULL,
  PRIMARY KEY (`productID`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Vanilla Cupcake','vanilla cupcake with vanilla frosting','Assets\\images\\products\\cupcake_pic.png',25),(2,'Red Velvet Cupcake','red velvet cupcake with cream cheese frosting','Assets\\images\\products\\red_velvet_cupcake_pic.png',25),(3,'Choc chip cookie','cookie with chocolate chips','Assets\\images\\products\\cookies_pic.png',15),(4,'Croissant','light and airy pastry','Assets\\images\\products\\croissants_pic.jpg',20),(5,'Donut','sweet fried rind dough with colourful frosting','Assets\\images\\products\\donut_on_plate_pic.jpg',60),(6,'Macaron_box_20','box of 20 macarons of different flavours','Assets\\images\\products\\macaron_box_pic.jpg',650),(7,'Birthday cupcakes','Cupcakes specially designed for birthdays','Assets\\images\\products\\Cake_1.jpg',350),(8,'Fruity Cheesecake','A cool, exotic cheesecake, perfect for hot days! With its Graham biscuit base and smooth texture, this cheesecake offers a plethora of textures at once!','Assets\\images\\products\\Cake_2.jpg',400),(9,'Chocolate Mousse','The best chocolate mousse that feels like eating clouds! It has a fudgy chocolate base and a very delicate chocolate mousse as its body with a tasty strawberry on the top. All with 70% cacao.','Assets\\images\\products\\Cake_3.jpg',400),(10,'Chocolate Cake pops','Lollipops but as a cake coated with a cracking chocolate!','Assets\\images\\products\\Cake_4.jpg',350),(11,'Expresso Cupcake','Expresso cupcake with a chocolate base and a hint of coffee! It\'s accompanied with a very creamy frosting with a coffee flavor.','Assets\\images\\products\\Cake_5.jpg',30),(12,'Rainbow Cupcake','Vanilla flavoured cupcake with a confetti bomb at its heart! The topping is a meringue based frosting.','Assets\\images\\products\\cupcake_bg.jpg',40),(13,'Cinnamon brownie','Squared chocolaty and fudgy brownie, flavored faintly with cinnamon!','Assets\\images\\products\\Brownie\\Brownie_1.png',20),(14,'choc-chip brownie','Amazingly mouth melting brownie with a fudgy consistency. It contains melted chocolate in every bite !','Assets\\images\\products\\Brownie\\Brownie_2.png',20),(15,'choc-mint brownie','This brownie is refreshing and very delicious, with a hint of mint and a swirl of chocolate.','Assets\\images\\products\\Brownie\\Brownie_3.png',20),(16,'Pecan brownie','This brownie contains pecan nuts and offers a wider range of textures. A pure chef-d\'oeuvre!','Assets\\images\\products\\Brownie\\Brownie_4.png',29),(17,'Raspberry  brownie','Delicate raspberry brownie that brings the perfect balance between fruitiness and chocolate ! Raspberry is one of the best fruits that compliments the cacao flavor.','Assets\\images\\products\\Brownie\\Brownie_5.png',29),(18,'Walnut brownie','This brownie contains roasted walnuts that accentuates the cacao in the brownie. The nutty flavor and particular texture of the roasted walnut compliments the delicateness and fudgy texture of the original brownie.','Assets\\images\\products\\Brownie\\Brownie_6.png',29),(19,'White-choc brownie','White chocolate provides for the adequate moisture that makes up the perfect brownie!','Assets\\images\\products\\Brownie\\Brownie_7.png',29),(20,'Choc-chip blondie','Blondie is another word for a longer brownie but not necessarily dominated by chocolate! This choc chip blondie offers the warmth and purity of vanilla and the fudgy texture of the chocolate chips.','Assets\\images\\products\\Brownie\\Brownie_8.png',40),(21,'Raspberry swirl blondie','A fruity flavor that perfectly fits the moistness of a good blondie.','Assets\\images\\products\\Brownie\\Brownie_9.png',40),(22,'Lemon blondie','Lemon flavored blondie provides for the perfect balance between the sourness of the lemon and the sweetness of the blondie.','Assets\\images\\products\\Brownie\\Brownie_10.png',40),(23,'Christmas box x 24','Brownie box with 4 pieces of 6 unique flavors:<br><br>\r\n1. Walnut Brownie,<br>\r\n2. Cream cheese Brownie,<br>\r\n3. Original Brownie,<br>\r\n4. Choc-chip Brownie,<br>\r\n5. Raspberry swirl Brownie,<br>\r\n6. Double choc Brownie.<br>','Assets\\images\\products\\Brownie\\Brownie_11.png',700),(24,'Christmas brownie bars x 8','The box contains 8 brownie bars, topped with white chocolate with a hint of candy cane. A limited edition by Bun King Bakery!','Assets\\images\\products\\Brownie\\Brownie_12.png',320),(37,'Rainbow cake','Beautiful multi flavored cake with interior and exterior rainbow colors! 4 layers of different cakes in 1!','Assets\\images\\products\\Cakes\\Cake_1.png',650),(38,'Elegant floral wedding cake','Multi layered wedding cake decorated with fondant and sugar flowers. It\'s layers and sandwiched with several frostings: <br>\r\n\r\n> White chocolate ganache<br>\r\n> Vanilla frosting <br>\r\n> Chocolate and raspberry frosting<br>\r\n\r\n','Assets\\images\\products\\Cakes\\Cake_2.png',2200),(39,'Minimal elegant floral cake','Multi-layered cake with a minimalistic design for a modern look. The floral design gives an elegant touch to it. It\'s flavor is vanilla with chocolate frosting.','Assets\\images\\products\\Cakes\\Cake_3.png',1800),(40,'Golden drip floral cake','Long multi-layered cake with golden white chocolate drips. One of our trendiest and candid looking cake ! It\'s delicious with a combination of our best compatible flavors.','Assets\\images\\products\\Cakes\\Cake_4.png',1500),(41,'Fruity cake with chocolate','Simple chocolate cake with vanilla buttercream and refreshing red berries: cherries and strawberries.','Assets\\images\\products\\Cakes\\Cake_5.png',350),(42,'Fruity cake with alomonds','Vanilla and almond flavored cake with simple buttercream frosting and fresh fruits.','Assets\\images\\products\\Cakes\\Cake_6.png',350),(43,'White floral fondant cake','Red velvet cake covered with fondant and sugar flowers for a vintage look.','Assets\\images\\products\\Cakes\\Cake_7.png',1000),(44,'Choc-drip coffee cake','Amazing coffee cake with coffee beans flavored buttercream and a dripping chocolate ganache.','Assets\\images\\products\\Cakes\\Cake_8.png',1000),(45,'Original vanilla cookie','Plain vanilla cookie','Assets\\images\\products\\Cookie\\Cookie_1.png',15),(46,'M&M cookie','Soft cookie with M&Ms .','Assets\\images\\products\\Cookie\\Cookie_4.png',15),(47,'Choc-chunks cookie','Cookie filled with chocolate chips','Assets\\images\\products\\Cookie\\Cookie_5.png',15),(48,'M&M and Choc-chip cookie','Cookie with M&M and Chocolate chips.','Assets\\images\\products\\Cookie\\Cookie_6.png',15),(49,'Chocolate sandwich cookie','2 chocolate cookies filled with whipped cream too satisfy any sugar cravings!','Assets\\images\\products\\Cookie\\Cookie_7.png',30),(50,'Choc-chip and M&M sandwich cookie','M&M and Choc-chip cookies with whipped cream','Assets\\images\\products\\Cookie\\Cookie_8.png',30),(51,'Oats cookies','Cookies with oats for a healthier option.','Assets\\images\\products\\Cookie\\Cookie_9.png',15),(52,'Dark-choc and mint cookie','Dark chocolate cookie with a hint of mint','Assets\\images\\products\\Cookie\\Cookie_10.png',15);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_test`
--

DROP TABLE IF EXISTS `products_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_test` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_name` varchar(100) NOT NULL,
  `p_desc` text NOT NULL,
  `p_cat_id` int(11) NOT NULL,
  `p_type_id` int(11) NOT NULL,
  `p_img` text NOT NULL,
  `p_price` float NOT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_test`
--

LOCK TABLES `products_test` WRITE;
/*!40000 ALTER TABLE `products_test` DISABLE KEYS */;
INSERT INTO `products_test` VALUES (1,'Vanilla Cupcake','vanilla cupcake with vanilla frosting',2,2,'Assets\\images\\products\\cupcake_pic.png',25),(2,'Red Velvet Cupcake','red velvet cupcake with cream cheese frosting',2,2,'Assets\\images\\products\\red_velvet_cupcake_pic.png',25),(3,'Choc chip cookie','cookie with chocolate chips ',4,2,'Assets\\images\\products\\cookies_pic.png',15),(4,'Croissant','light and airy pastry',7,2,'Assets\\images\\products\\croissants_pic.jpg',20),(5,'Donut','sweet fried rind dough with colourful frosting',7,2,'Assets\\images\\products\\donut_on_plate_pic.jpg',60),(6,'Macaron box x 20 pieces','box of 20 macarons of different flavours',5,2,'Assets\\images\\products\\macaron_box_pic.jpg',650),(7,'Birthday cupcakes','Cupcakes specially designed for birthdays',2,1,'Assets\\images\\products\\Cake_1.jpg',350),(8,'Fruity Cheesecake','A cool, exotic cheesecake, perfect for hot days! With its Graham biscuit base and smooth texture, this cheesecake offers a plethora of textures at once! ',7,1,'Assets\\images\\products\\Cake_2.jpg',400),(9,'Chocolate Mousse','The best chocolate mousse that feels like eating clouds! It has a fudgy chocolate base and a very delicate chocolate mousse as its body with a tasty strawberry on the top. All with 70% cacao.',7,1,'Assets\\images\\products\\Cake_3.jpg',400),(10,'Chocolate Cake pops','Lollipops but as a cake coated with a cracking chocolate!',3,1,'Assets\\images\\products\\Cake_4.jpg',350),(11,'Expresso Cupcake','Expresso cupcake with a chocolate base and a hint of coffee! It\'s accompanied with a very creamy frosting with a coffee flavor.',2,1,'Assets\\images\\products\\Cake_5.jpg',30),(12,'Rainbow Cupcake','Vanilla flavoured cupcake with a confetti bomb at its heart! The topping is a meringue based frosting. ',2,1,'Assets\\images\\products\\cupcake_bg.jpg',40),(13,'Cinnamon brownie','Squared chocolaty and fudgy brownie, flavored faintly with cinnamon!',6,2,'Assets\\images\\products\\Brownie\\Brownie_1.png',20),(14,'choc-chip brownie','Amazingly mouth melting brownie with a fudgy consistency. It contains melted chocolate in every bite !',6,2,'Assets\\images\\products\\Brownie\\Brownie_2.png',20),(15,'choc-mint brownie','This brownie is refreshing and very delicious, with a hint of mint and a swirl of chocolate.',6,2,'Assets\\images\\products\\Brownie\\Brownie_3.png',20),(16,'Pecan brownie','This brownie contains pecan nuts and offers a wider range of textures. A pure chef-d\'oeuvre!',6,2,'Assets\\images\\products\\Brownie\\Brownie_4.png',29),(17,'Raspberry  brownie','Delicate raspberry brownie that brings the perfect balance between fruitiness and chocolate ! Raspberry is one of the best fruits that compliments the cacao flavor.',6,2,'Assets\\images\\products\\Brownie\\Brownie_5.png',29),(18,'Walnut brownie','This brownie contains roasted walnuts that accentuates the cacao in the brownie. The nutty flavor and particular texture of the roasted walnut compliments the delicateness and fudgy texture of the original brownie.',6,2,'Assets\\images\\products\\Brownie\\Brownie_6.png',29),(19,'White-choc brownie','White chocolate provides for the adequate moisture that makes up the perfect brownie!',6,2,'Assets\\images\\products\\Brownie\\Brownie_7.png',29),(20,'Choc-chip blondie','Blondie is another word for a longer brownie but not necessarily dominated by chocolate! This choc chip blondie offers the warmth and purity of vanilla and the fudgy texture of the chocolate chips.',6,2,'Assets\\images\\products\\Brownie\\Brownie_8.png',40),(21,'Raspberry swirl blondie','A fruity flavor that perfectly fits the moistness of a good blondie.',6,2,'Assets\\images\\products\\Brownie\\Brownie_9.png',40),(22,'Lemon blondie','Lemon flavored blondie provides for the perfect balance between the sourness of the lemon and the sweetness of the blondie.',6,2,'Assets\\images\\products\\Brownie\\Brownie_10.png',40),(23,'Christmas box x 24','Brownie box with 4 pieces of 6 unique flavors:<br><br>\r\n1. Walnut Brownie,<br>\r\n2. Cream cheese Brownie,<br>\r\n3. Original Brownie,<br>\r\n4. Choc-chip Brownie,<br>\r\n5. Raspberry swirl Brownie,<br>\r\n6. Double choc Brownie.<br>',6,2,'Assets\\images\\products\\Brownie\\Brownie_11.png',700),(24,'Christmas brownie bars x 8','The box contains 8 brownie bars, topped with white chocolate with a hint of candy cane. A limited edition by Bun King Bakery!',6,2,'Assets\\images\\products\\Brownie\\Brownie_12.png',320),(37,'Rainbow cake','Beautiful multi flavored cake with interior and exterior rainbow colors! 4 layers of different cakes in 1!',1,2,'Assets\\images\\products\\Cakes\\Cake_1.png',650),(38,'Elegant floral wedding cake','Multi layered wedding cake decorated with fondant and sugar flowers. It\'s layers and sandwiched with several frostings: <br>\r\n\r\n> White chocolate ganache<br>\r\n> Vanilla frosting <br>\r\n> Chocolate and raspberry frosting<br>\r\n\r\n',1,2,'Assets\\images\\products\\Cakes\\Cake_2.png',2200),(39,'Minimal elegant floral cake','Multi-layered cake with a minimalistic design for a modern look. The floral design gives an elegant touch to it. It\'s flavor is vanilla with chocolate frosting.',1,2,'Assets\\images\\products\\Cakes\\Cake_3.png',1800),(40,'Golden drip floral cake','Long multi-layered cake with golden white chocolate drips. One of our trendiest and candid looking cake ! It\'s delicious with a combination of our best compatible flavors.',1,2,'Assets\\images\\products\\Cakes\\Cake_4.png',1500),(41,'Fruity cake with chocolate','Simple chocolate cake with vanilla buttercream and refreshing red berries: cherries and strawberries.',1,2,'Assets\\images\\products\\Cakes\\Cake_5.png',350),(42,'Fruity cake with alomonds','Vanilla and almond flavored cake with simple buttercream frosting and fresh fruits.',1,2,'Assets\\images\\products\\Cakes\\Cake_6.png',350),(43,'White floral fondant cake','Red velvet cake covered with fondant and sugar flowers for a vintage look.',1,2,'Assets\\images\\products\\Cakes\\Cake_7.png',1000),(44,'Choc-drip coffee cake','Amazing coffee cake with coffee beans flavored buttercream and a dripping chocolate ganache.',1,2,'Assets\\images\\products\\Cakes\\Cake_8.png',1000),(45,'Original vanilla cookie','Plain vanilla cookie',4,2,'Assets\\images\\products\\Cookie\\Cookie_1.png',15),(46,'M&M cookie','Soft cookie with M&Ms .',4,2,'Assets\\images\\products\\Cookie\\Cookie_4.png',15),(47,'Choc-chunks cookie','Cookie filled with chocolate chips',4,2,'Assets\\images\\products\\Cookie\\Cookie_5.png',15),(48,'M&M and Choc-chip cookie','Cookie with M&M and Chocolate chips.',4,2,'Assets\\images\\products\\Cookie\\Cookie_6.png',15),(49,'Chocolate sandwich cookie','2 chocolate cookies filled with whipped cream too satisfy any sugar cravings!',4,2,'Assets\\images\\products\\Cookie\\Cookie_7.png',30),(50,'Choc-chip and M&M sandwich cookie','M&M and Choc-chip cookies with whipped cream',4,2,'Assets\\images\\products\\Cookie\\Cookie_8.png',30),(51,'Oats cookies','Cookies with oats for a healthier option.',4,2,'Assets\\images\\products\\Cookie\\Cookie_9.png',15),(52,'Dark-choc and mint cookie','Dark chocolate cookie with a hint of mint',4,2,'Assets\\images\\products\\Cookie\\Cookie_10.png',15);
/*!40000 ALTER TABLE `products_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction` (
  `tranID` bigint(20) NOT NULL AUTO_INCREMENT,
  `userID` bigint(20) NOT NULL,
  `orderID` bigint(20) NOT NULL,
  `paymentMethod` text NOT NULL,
  `status` text NOT NULL,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`tranID`),
  KEY `1_Order_Many_Transactions` (`orderID`),
  KEY `1_User_Many_Transactions` (`userID`),
  CONSTRAINT `1_Order_Many_Transactions` FOREIGN KEY (`orderID`) REFERENCES `userorder` (`orderID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `1_User_Many_Transactions` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (12,4,12,'creditCard','successful','2020-12-27 02:36:14'),(13,4,12,'JuiceByMCB','successful','2020-12-27 13:49:55'),(14,4,12,'creditCard','successful','2020-12-27 13:58:44'),(15,5,15,'creditCard','successful','2023-03-30 17:32:50'),(16,5,15,'creditCard','successful','2023-03-30 17:35:23'),(17,6,17,'creditCard','successful','2023-03-30 20:07:54'),(18,6,17,'creditCard','successful','2023-03-30 20:59:11'),(19,6,17,'creditCard','successful','2023-03-30 21:01:00'),(20,6,17,'creditCard','successful','2023-03-30 21:13:59'),(21,6,17,'creditCard','successful','2023-03-30 21:38:20'),(22,6,17,'creditCard','successful','2023-03-30 23:37:57'),(23,5,15,'creditCard','successful','2023-03-30 23:48:00'),(24,6,17,'creditCard','successful','2023-03-30 23:50:01'),(25,6,17,'creditCard','successful','2023-03-31 00:24:14');
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types`
--

DROP TABLE IF EXISTS `types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `types` (
  `typeID` bigint(20) NOT NULL AUTO_INCREMENT,
  `p_type_name` varchar(30) NOT NULL,
  `p_type_desc` text NOT NULL,
  PRIMARY KEY (`typeID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types`
--

LOCK TABLES `types` WRITE;
/*!40000 ALTER TABLE `types` DISABLE KEYS */;
INSERT INTO `types` VALUES (1,'new','new products are tagged as new'),(2,'featured','products which have to get attention are tagged as featured'),(3,'hot','products on sale are tagged as hot'),(4,'best','best- seller products are tagged as best');
/*!40000 ALTER TABLE `types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userID` bigint(20) NOT NULL AUTO_INCREMENT,
  `uname` varchar(50) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(60) NOT NULL,
  `phone` varchar(8) NOT NULL,
  `description` text NOT NULL,
  `vkey` varchar(100) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `isSubscribed` tinyint(1) NOT NULL,
  `isAdmin` tinyint(1) NOT NULL,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'oprah123','$2y$10$pu.rx7.mCBuy.L/1WjJbiufyUm43iUHjqp9wVLcxqzH0H.qqqOrVm','Oprah','Windsor','vinoveg106@chatdays.com','New York','57458962','','18981cb084d8b9392a26041542908bdc',1,1,1,'2020-12-25 17:59:23'),(2,'siri123','$2y$10$F4agSnQaMewBbKKcoavmn.vmn4Utci5WM1KtFjQ7b/nSQm4lCbVkm','Siri','Windsor','tadoso1652@aranelab.com','','','','e14520491a0cfcba3d5d9de1798273a5',1,0,0,'2020-12-25 14:03:48'),(3,'sanjana2020','$2y$10$YG6ch/.jzZ9.TGR1D6RVY.FMPHCGX52Bhy6BDYD.4HY4SZ6isovaS','sanjana','lolo','sanjana.ramchurun@umail.uom.ac.mu','','','','b394c058279a76504793c869410d41b8',1,0,0,'2020-12-26 18:16:08'),(4,'sanjana2021','$2y$10$zwnOI5uDLMjFTPh9TuNBf.edR00sOnkp04SRHgkboTUyBDsIPYbZe','lala','lolo','katy61100@outlook.com','flic en flac','55555555','lin bon','d7a55e39acca229015eb6224163b3298',1,0,0,'2020-12-26 18:19:45'),(5,'admin','$2y$10$.zeAc4rkHXcJVwFMeEJj5e38Kl/sRjMNZgp4/KZpVnAJsdy2bcmY2','admin','admin','admin@admin.com','','','','c0b5d34eeb6e5a5313bd0d68327b5ed6',1,1,1,'2023-03-30 17:18:34'),(6,'normaluser','$2y$10$pTu2fYXvUjrrcEgYdZX8gOgVlzOobmOYCQ2uEGiad6LHM8wkL04Ta','normaluser','normaluser','normaluser@normaluser.com','','','','cb7a83640e4fbf80b908a7945b29b143',1,0,0,'2023-03-30 20:06:27');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userorder`
--

DROP TABLE IF EXISTS `userorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userorder` (
  `orderID` bigint(20) NOT NULL AUTO_INCREMENT,
  `userID` bigint(20) NOT NULL,
  `total` float NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(8) NOT NULL,
  `status` text NOT NULL,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `isSchedule` tinyint(1) DEFAULT 0,
  `date` date DEFAULT curdate(),
  `time` time DEFAULT (curtime() + interval 1 hour),
  PRIMARY KEY (`orderID`),
  KEY `1_User_Many_Orders` (`userID`),
  CONSTRAINT `1_User_Many_Orders` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userorder`
--

LOCK TABLES `userorder` WRITE;
/*!40000 ALTER TABLE `userorder` DISABLE KEYS */;
INSERT INTO `userorder` VALUES (12,4,55,'flic en flac','55555555','successful','2020-12-27 02:36:14',0,NULL,NULL),(13,4,50,'22, Morc Anna','55555555','successful','2020-12-27 13:49:55',0,NULL,NULL),(14,4,100,'22, Morc Anna','55555555','successful','2020-12-27 13:58:44',0,NULL,NULL),(15,5,25,'1234 main st','','successful','2023-03-30 17:32:50',1,'2023-04-03','12:33:00'),(16,5,100,'3 beaconhill','','successful','2023-03-30 17:35:23',1,'2023-04-09','12:40:00'),(17,6,60,'3 beaconhill','','successful','2023-03-30 20:07:54',0,'0000-00-00','00:00:00'),(18,6,60,'3 beaconhill','','successful','2023-03-30 20:59:11',0,'0000-00-00','00:00:00'),(19,6,220,'3 beaconhill','','successful','2023-03-30 21:01:00',1,'2023-04-03','16:00:00'),(20,6,650,'3 beaconhill','','successful','2023-03-30 21:13:59',0,'0000-00-00','00:00:00'),(21,6,650,'3 beaconhill','','successful','2023-03-30 21:38:20',0,'0000-00-00','00:00:00'),(22,6,1000,'3 beaconhill','','successful','2023-03-30 23:37:57',1,'2023-04-03','18:40:00'),(23,5,180,'1234 main st','','successful','2023-03-30 23:48:00',1,'2023-04-03','18:50:00'),(24,6,320,'1234 main st','','successful','2023-03-30 23:50:00',1,'2023-04-01','18:50:00'),(25,6,20,'1234 Main st','','successful','2023-03-31 00:24:13',0,'0000-00-00','00:00:00');
/*!40000 ALTER TABLE `userorder` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-30 20:47:01
