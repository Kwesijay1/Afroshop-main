-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 10, 2024 at 12:12 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `password`) VALUES
(4, 'admin', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2'),
(5, 'admin2', '9195f873d1715b7575f88118db6dc42a91137874');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `pid`, `name`, `price`, `quantity`, `image`) VALUES
(100, 9, 7, 'Full Set Massai African Print Jewellry', 100, 1, 'African_Beaded_Jewelries__by_TribalTess_on_Etsy-removebg-preview.png');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `number` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `total_price` int(100) NOT NULL,
  `placed_on` date NOT NULL DEFAULT current_timestamp(),
  `payment_status` varchar(20) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `creator` varchar(100) NOT NULL,
  `details` varchar(500) NOT NULL,
  `price` int(10) NOT NULL,
  `image_01` varchar(100) NOT NULL,
  `image_02` varchar(100) NOT NULL,
  `image_03` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `creator`, `details`, `price`, `image_01`, `image_02`, `image_03`) VALUES
(4, 'Mens Smock', '1111111', 'Description:\r\nOur Classic Men&#39;s Smock is designed for comfort, durability, and functionality. Perfect for artists, craftsmen, chefs, and anyone who needs a reliable and stylish work garment.\r\n\r\nFeatures:\r\n\r\nMaterial: High-quality, breathable cotton blend\r\nFit: Loose, comfortable fit to allow for ease of movement\r\nDesign: Traditional smock design with a modern touch\r\nNeckline: Round neck with a button-down front\r\nPockets: Two spacious front pockets for convenient storage\r\nSleeves: Long sleeve', 150, 'download__3_-removebg-preview.png', 'Have_to_get_hold_of_one_of_these_Ghanaian_smocks__-removebg-preview.png', 'Northern_Ghana_Smock_for_Men_-removebg-preview.png'),
(5, 'Ankara Shorts', '', 'Description:\r\nStep into summer with style and comfort with our Ankara Print Men&#39;s Shorts. These shorts feature vibrant and unique African Ankara prints, making them a standout piece for any casual occasion.\r\n\r\nFeatures:\r\n\r\nMaterial: 100% premium cotton for breathability and comfort\r\nFit: Regular fit with an elastic waistband and adjustable drawstring for a custom fit\r\nDesign: Bold and colorful Ankara prints inspired by traditional African patterns\r\nPockets: Two side pockets and one back pock', 15, 'Men_s_Clothing_Online_Stores__Cheap_Casual_Clothes_For_Men-removebg-preview.png', 'Men_s_Clothing_Online_Stores__Cheap_Casual_Clothes_For_Men-removebg-preview.png', 'Lace-Up_Color_Block_Comfortable_Loose_Beach_Jogger_Sporting_Casual_Men_s_Shorts-removebg-preview.png'),
(7, 'Full Set Massai African Print Jewellry', '', 'Description:\r\nEmbrace the rich heritage and vibrant colors of Africa with our Maasai African Print Jewelry Full Set. This exquisite collection includes a necklace, earrings, bracelet, and ring, all adorned with traditional Maasai beadwork and prints, perfect for making a bold statement.\r\n\r\nFeatures:\r\n\r\nMaterial: High-quality beads, durable thread, and metal alloy\r\nDesign: Intricate beadwork inspired by traditional Maasai patterns and prints\r\nColors: A variety of vibrant colors including red, blu', 100, 'African_Beaded_Jewelries__by_TribalTess_on_Etsy-removebg-preview.png', 'African_Beads_Necklace_Sets_Masai_Necklace_Sets_Masai_-_Etsy-removebg-preview.png', 'Four-set_African_Handmade_Tribal_Jewelry_Maasai_Beaded_Elegant_Necklace-removebg-preview.png'),
(8, 'African Print Sneakers', '', 'Product Name: African Print Sneakers\r\n\r\nDescription:\r\nStep out in style and comfort with our African Print Sneakers. These unique and vibrant sneakers feature traditional African patterns, combining modern footwear design with rich cultural heritage. Perfect for casual wear, these sneakers are a statement piece for any wardrobe.\r\n\r\nFeatures:\r\n\r\nMaterial: High-quality canvas upper with African print, rubber sole for durability and traction\r\nDesign: Bold and colorful African prints, each pair feat', 65, 'ps2-removebg-preview.png', 'Print_Sneakers-removebg-preview.png', 'Print_Sneakers-removebg-preview.png'),
(9, 'Kente/Furgu Cloth', '', 'Description:\r\nExperience the rich cultural heritage of Ghana with our Authentic Kente/Fugu Cloth. These vibrant and intricately woven fabrics are a symbol of African pride and craftsmanship, perfect for traditional ceremonies, special occasions, or as a unique addition to your wardrobe.\r\n\r\nFeatures:\r\n\r\nMaterial: 100% premium cotton for durability and comfort\r\nDesign: Traditional Kente/Fugu patterns with vibrant colors and intricate designs\r\nDimensions: Standard size - 6 yards (54&#34; x 216&#34;', 250, 'download__4_-removebg-preview.png', 'Kente_Cloth_Fugu_Style__Ghana_Kente__Hand_woven_African_Cloth-removebg-preview.png', 'Northern_ghana_kente_cloth__hand_woven-removebg-preview.png'),
(10, 'Leekung African Sculputure', '', 'Description:\r\nAdd a touch of African elegance to your home or office with our Leekung African Sculpture. This beautifully crafted piece of art captures the essence of African culture and craftsmanship, making it a perfect decorative item or thoughtful gift.\r\n\r\nFeatures:\r\n\r\nMaterial: High-quality resin with a hand-painted finish\r\nDesign: Intricate detailing inspired by traditional African art\r\nHeight: 12 inches (30 cm)\r\nBase: Sturdy and stable, suitable for display on shelves, desks, or mantels\r\n', 167, 'A_GURO_MASK_REPRESENTING_GU__1_-removebg-preview.png', 'African_Masks_-_Beaded_Bird_Red-removebg-preview.png', 'NOVICA_Brown_and_Red_Handcrafted_African_Wood_Wall_Mask__Dan_Beauty_-removebg-preview.png'),
(12, 'Fulani Wicker Hat', '', 'Description:\r\nImmerse yourself in the rich cultural heritage of West Africa with our Authentic Fulani Wicker Hat. Handcrafted by skilled Fulani artisans, this hat is not only a stylish accessory but also a piece of traditional African craftsmanship. Perfect for both functional use and as a decorative item.\r\n\r\nFeatures:\r\n\r\nMaterial: Handwoven wicker and leather\r\nDesign: Traditional Fulani design with a conical shape and leather accents\r\nSize: One size fits most\r\nColors: Natural wicker color with ', 75, 'Handmade_Vintage_Fulani_Straw_Hat-_African_Hat-Sun_Hat-_Festival_Hat-removebg-preview.png', 'Medium_Fulani_Wicker_Hat__1_-removebg-preview.png', 'Medium_Fulani_Wicker_Hat-removebg-preview.png'),
(13, 'Drawbags', '', 'Description:\r\nOur Versatile Drawstring Bags are the perfect blend of convenience, durability, and style. Ideal for daily use, these bags are great for gym sessions, travel, or as a casual accessory. With a range of vibrant designs, thereâ€™s a drawstring bag to suit everyoneâ€™s taste.\r\n\r\nFeatures:\r\n\r\nMaterial: High-quality polyester for durability and easy cleaning\r\nDesign: Available in a variety of colors and patterns, including solid colors, prints, and custom designs\r\nSize: 15&#34; x 18&#34;', 50, 'Ankara_Drawstring_Bag-removebg-preview.png', 'download-removebg-preview.png', 'Notinaf-removebg-preview.png'),
(14, 'Straw Baskets', '', 'Description:\r\nEnhance your home decor and storage solutions with our Handwoven Straw Baskets. These versatile baskets are crafted from natural straw, combining durability with rustic charm. Perfect for organizing, storage, or as decorative pieces, they add a touch of elegance to any space.\r\n\r\nFeatures:\r\n\r\nMaterial: 100% natural straw\r\nDesign: Handwoven with intricate patterns, featuring sturdy handles for easy carrying\r\nSizes: Available in Small, Medium, and Large\r\nSmall: 10&#34; x 8&#34; x 6&#3', 49, 'African_Straw_Basket_in_Red_and_Brown-removebg-preview.png', 'download__5_-removebg-preview.png', 'Fair_Trade_Home_Decor__Jewelry__Baskets__Gifts__Food___SERRV-removebg-preview.png'),
(16, 'African Printed Mugs', '', 'Description:\r\nBrighten up your kitchen and coffee breaks with our African Printed Mugs. Featuring vibrant, traditional African patterns, these mugs are perfect for enjoying your favorite hot beverages while adding a splash of color and culture to your day.\r\n\r\nFeatures:\r\n\r\nMaterial: High-quality ceramic\r\nDesign: Bold and colorful African prints, inspired by traditional patterns\r\nCapacity: 12 oz (355 ml)\r\nMicrowave Safe: Yes\r\nDishwasher Safe: Yes\r\nColors: Various vibrant patterns available, each u', 30, 'Gift_ideas_for_birthdays_weddings__printed_coffee_mugs__gifts-removebg-preview.png', 'kente_african_print_Two-tone_Coffee_Mug-removebg-preview.png', 'Speciality_tea_and_coffee_mugs__printed_gift_ideas_for_birthd-removebg-preview.png'),
(18, 'Bolga Funtail', '', 'Description:\r\nOur Bolga Funtail Baskets are a celebration of traditional African craftsmanship. Handwoven by skilled artisans in the Bolgatanga region of Ghana, these baskets feature a unique funtail design that is both stylish and functional. Perfect for storage, shopping, or as a decorative piece, each basket is a one-of-a-kind work of art.\r\n\r\nFeatures:\r\n\r\nMaterial: 100% natural elephant grass\r\nDesign: Handwoven with a unique funtail pattern\r\nHandles: Durable leather handles for comfortable ca', 45, 'Artesanato-removebg-preview.png', 'Artesanato-removebg-preview.png', 'Reflektion_Design_Modern_African_Decor___Accessories-removebg-preview.png'),
(20, 'Straw Storage Baskets', '', 'Description:\r\nOrganize your home with style using our Handwoven Straw Storage Baskets. These versatile and eco-friendly baskets are perfect for decluttering and adding a natural, rustic touch to any room. Made from durable and sustainable straw, each basket is handwoven by skilled artisans, ensuring a unique and high-quality product.\r\n\r\nFeatures:\r\n\r\nMaterial: 100% natural straw\r\nDesign: Handwoven with intricate patterns and sturdy construction\r\n', 77, 'download__5_-removebg-preview.png', 'Storage_Baskets-removebg-preview.png', 'Laundry_Baskets-removebg-preview.png');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `number` int(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `number`, `password`, `address`) VALUES
(9, 'Nas', 'naslyon7@gmail.com', 207176329, '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', ''),
(10, 'admin', 'naseem1234@gmail.com', 22222222, '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '0244688447, 12, Ashogman, Kasoa, Accra, Airport, Ghana - 0000');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `user_id_2` (`user_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `pid` (`pid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `products` (`id`);

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
