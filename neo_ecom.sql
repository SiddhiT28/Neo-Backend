-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2022 at 08:59 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `neo_ecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `api_address`
--

CREATE TABLE `api_address` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `street` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `zipcode` varchar(100) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `api_address`
--

INSERT INTO `api_address` (`id`, `name`, `street`, `city`, `state`, `zipcode`, `user_id`) VALUES
(1, '301, Braham Avenue, Plot 177, Sec 21', 'Kamothe, Navi Mumbai', 'Mumbai', 'Maharashtra', '410209', 1),
(3, 'Home', '202, Neel Sankalp, Panvel,', 'Navi Mumbai', 'Maharashtra', '410209', 2);

-- --------------------------------------------------------

--
-- Table structure for table `api_banneradd`
--

CREATE TABLE `api_banneradd` (
  `id` bigint(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `product_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `api_banneradd`
--

INSERT INTO `api_banneradd` (`id`, `image`, `created_at`, `updated_at`, `product_id`) VALUES
(1, 'images/5092428.jpg', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 4),
(2, 'images/5691822.jpg', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 1);

-- --------------------------------------------------------

--
-- Table structure for table `api_cart`
--

CREATE TABLE `api_cart` (
  `id` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `api_cart`
--

INSERT INTO `api_cart` (`id`, `quantity`, `created_at`, `updated_at`, `product_id`, `user_id`) VALUES
(15, 5, '2022-05-20 10:22:26.569373', '2022-05-20 20:02:11.451439', 12, 2),
(16, 1, '2022-05-20 10:25:02.791847', '2022-05-20 10:25:02.791847', 7, 2);

-- --------------------------------------------------------

--
-- Table structure for table `api_order`
--

CREATE TABLE `api_order` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `address_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `signature_id` varchar(100) NOT NULL,
  `amount` double NOT NULL,
  `provider_order_id` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `quantity` int(11) NOT NULL,
  `products_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `api_order`
--

INSERT INTO `api_order` (`id`, `created_at`, `updated_at`, `address_id`, `user_id`, `signature_id`, `amount`, `provider_order_id`, `status`, `quantity`, `products_id`) VALUES
(1, '2022-05-12 11:02:33.744358', '2022-05-12 11:02:33.749357', 1, 1, '2ceae74a93846446c73e805f61267d0e48452673989a3359987107c202d97dab', 4655, 'order_JUICcvUESQiOVt', 'Success', 1, 1),
(2, '2022-05-20 09:34:17.412292', '2022-05-20 09:34:17.420309', 3, 2, '23562101af059952bdcdeb6c36f8508747a3472f6032b8fc755a67288476d45e', 27914, 'order_JXQyNGGKVAR1xE', 'Success', 4, 1),
(3, '2022-05-20 09:34:17.434459', '2022-05-20 09:34:17.438479', 3, 2, '23562101af059952bdcdeb6c36f8508747a3472f6032b8fc755a67288476d45e', 27914, 'order_JXQyNGGKVAR1xE', 'Success', 1, 7),
(4, '2022-05-20 09:34:17.458706', '2022-05-20 09:34:17.463483', 3, 2, '23562101af059952bdcdeb6c36f8508747a3472f6032b8fc755a67288476d45e', 27914, 'order_JXQyNGGKVAR1xE', 'Success', 1, 18);

-- --------------------------------------------------------

--
-- Table structure for table `api_person`
--

CREATE TABLE `api_person` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `api_person`
--

INSERT INTO `api_person` (`id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Pratham Yadav', 'pyadav5000@gmail.com', 'pbkdf2_sha256$320000$PEfzsF7kop3ZKVXJEPcbQY$aOzqzAOmklVI8qL3l6HS+NHcvWlka1lR87fvKNr3mOk=', '2022-05-12 09:34:11.359694', '2022-05-12 09:34:11.359694'),
(2, 'Siddhi Thoke', 'siddhist19phpcomp@student.mes.ac.in', 'pbkdf2_sha256$320000$Ie7D8tjmlEiiXkNjtgqw4g$FfZMDK8FIoj0pE2QbzZ2TO2SgcCREIPJ991GCpotiBI=', '2022-05-12 11:33:08.702676', '2022-05-19 07:05:33.609535');

-- --------------------------------------------------------

--
-- Table structure for table `api_product`
--

CREATE TABLE `api_product` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `price` double NOT NULL,
  `brand` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `numberOfProducts` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `sale` int(11) NOT NULL,
  `vendor_id` bigint(20) NOT NULL,
  `discounts` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `api_product`
--

INSERT INTO `api_product` (`id`, `name`, `description`, `price`, `brand`, `category`, `numberOfProducts`, `created_at`, `updated_at`, `sale`, `vendor_id`, `discounts`) VALUES
(1, 'Nike Women\'s Trail Running Shoes', 'This is a nike shoe', 4655, '', '[\"sports\",\"footwear\",\"men\"]', 116, '2022-05-12 09:35:28.460506', '2022-05-20 09:34:17.406257', 13, 1, 45),
(2, 'Fashion Dream Women’s BSY Green Floral Print Dresses', 'This is a green dress for everyone.', 789, '', '[\"fashion\",\"clothes\",\"women\"]', 1203, '2022-05-13 05:11:14.554977', '2022-05-13 05:11:14.554977', 0, 1, 0),
(3, 'NYKA Heels', 'Red heels for casual wears.', 678, '', '[\"footwear\",\"casual\",\"women\"]', 121, '2022-05-13 05:12:32.561280', '2022-05-13 05:12:32.561280', 0, 1, 0),
(4, 'Casual Wear Shoes Navy Color', 'Regular wear for shoes, for day to day life.', 1459, '', '[\"footwear\",\"casual\",\"men\"]', 1231, '2022-05-13 05:13:44.961388', '2022-05-13 05:13:44.961388', 0, 1, 0),
(5, 'Shanvi Fashion One Side Off Shoulder Women\'s Crop Top ', 'Care Instructions: Machine Wash <br>\nFit Type: Slim Fit<br>\nFit Type: Slim Fit <br>\nNeck Style: One Shoulder<br>\nPattern: Solid; Fabric: Cotton<br>\nCollar Style: Collarless<br>\nOccasion Type: Ceremony; Closure Type: Pull On', 359, '', '[\"fashion\",\"clothes\",\"women\"]', 100, '2022-05-19 13:12:56.142788', '2022-05-19 13:12:56.142788', 0, 1, 0),
(6, 'Peep Toe Ankle Strap Stiletto Heel ', 'Style:	Fashion\r\nType:	Heeled-Sandals\r\nMaterial:	PU\r\nPattern Type:	Snakeskin\r\nOccasion:	Party\r\nPackage Include:	1*Heels\r\nHeel Height:	11.5cm', 2795, '', '[\"fashion\",\"footwear\",\"women\"]', 120, '2022-05-19 14:10:40.790053', '2022-05-19 14:10:40.790053', 0, 1, 0),
(7, 'Men White & Red Colourblocked AIR MAX SC Sneakers', 'With its easy-going lines, heritage athletics look and, of course, visible Air cushioning, the Nike Air Max SC is the perfect finish to any outfit. The rich mixture of materials adds depth while making it a durable and lightweight shoe for everyday wear.', 5995, '', '[\"footwear\",\"sports\",\"men\"]', 1199, '2022-05-19 14:14:02.330685', '2022-05-20 09:34:17.425334', 1, 1, 0),
(8, 'Women Red & White Printed Hooded Sweatshirt', 'Red and white printed sweatshirt with applique details, has a hood, one kangaroo pockets, long sleeves, straight hem', 629, '', '[\"clothes\",\"fashion\",\"women\"]', 120, '2022-05-20 03:05:47.493640', '2022-05-20 03:05:47.493640', 0, 1, 0),
(9, 'Women Grey Solid Shorts', 'Grey solid mid-rise regular shorts, has 2 pockets, has an elasticated waistband with slip-on closure', 934, '', '[\"clothes\",\"fashion\",\"women\"]', 122, '2022-05-20 03:11:02.953150', '2022-05-20 03:11:02.953640', 0, 1, 0),
(10, 'Medium Blue Tapered Fit Full Length Jeans', 'A pair of medium stone wash jeans, that comes with tapered fit. A staple update for a casual wardrobe, this one also blends well with casual tee and slip ons.The model (height 6 ft 1 in) is wearing Size 32.', 899, '', '[\"clothes\",\"fashion\",\"men\"]', 121, '2022-05-20 03:13:02.643110', '2022-05-20 03:13:02.643110', 0, 1, 0),
(11, 'MUSTARD YELLOW HOODIE – UNISEX HOODED SWEATSHIRT', 'Hoodie Color: Mustard Yellow\r\nREGULAR FIT: Fits just right. Not too tight, not too loose!\r\n100% combed cotton with single jersey to make it wrinkle-free and smooth. Doesn’t let you feel hot!\r\n320GSM 100% bio-washed cotton to achieve soft fabric. Non-zipped with convenient kangaroo pockets. Doesn’t dirty easily.\r\nPremium quality inks are used here to make sure your printed designs are stretch resistant. No ‘hide and seek’ with the design.', 825, '', '[\"clothes\",\"fashion\",\"men\",\"women\"]', 122, '2022-05-20 03:23:46.468749', '2022-05-20 03:23:46.468749', 0, 1, 0),
(12, 'FLYNOFF Blue Solid Round Neck Slim Fit Half Sleeve Men\'s T-Shirt', 'Fabric : Cotton Blend<br>\r\nSleeve Length : Short Sleeves<br>\r\nPattern : Solid<br>\r\nHigh Quality Cotton Blend Fabric : The T-Shirt is manufactured using Cotton Blend fabric material, which is known to be highly absorbent, thereby keeping you cool all day long. It is a durable piece of clothing and hence lasts multiple washes after being used on a regular basis.<br>\r\nCountry of Origin : India<br>', 271, '', '[\"clothes\",\"men\",\"fashion\",\"casual\"]', 100, '2022-05-20 03:50:36.427957', '2022-05-20 03:50:36.427957', 0, 2, 30),
(13, 'Women Culprit Aparel Grey T-Shirt', '\r\n\r\n100% Cotton : Made with top-quality lightweight fabric – it’s airy, highly absorbent & sturdy.<br>\r\n<br>\r\nRegular Fit : Fits just right – not too tight, not too loose.', 799, '', '[\"clothes\",\"women\",\"casual\"]', 129, '2022-05-20 03:56:32.184590', '2022-05-20 03:56:32.184590', 0, 2, 0),
(14, 'Women Fit and Flare Floral Print V Neck Maxi Dress', 'Women’s multicolor flower and leaf prints fit and flare sweetheart neck maxi Dress. Garment is made of crepe, which suits well on all body types. This Wrap dress has a plain leaf pattern and is perfect for a day out with friends or a night of get-together with family. 100% pure fabric used in the dress.', 699, '', '[\"clothes\",\"casual\",\"women\"]', 122, '2022-05-20 04:03:50.508127', '2022-05-20 04:03:50.508127', 0, 2, 0),
(15, 'Grey Sweat Shirt', 'Please change this description', 788, '', '[\"clothes\",\"men\",\"casual\"]', 200, '2022-05-20 04:21:41.172540', '2022-05-20 04:21:41.172540', 0, 2, 0),
(16, 'Dark and Sky Blue Round Neck Shirt ', 'Half sleeves round neck shirt for everyday wear. <br>\r\nPure cotton', 899, '', '[\"clothes\",\"men\",\"casual\"]', 122, '2022-05-20 04:23:32.755930', '2022-05-20 04:23:32.755930', 0, 2, 0),
(17, 'Air Jordan 1 Retro High OG', 'This iteration of the AJ1 re-imagines Mike\'s first signature model with a fresh mix of colours. Premium materials, soft cushioning and a padded ankle collar offer total support and celebrate the shoe that started it all.\r\n<br>\r\nBenefits<br>\r\n<br>\r\n    Premium construction delivers comfort and iconic appeal.\r\n    An encapsulated Air-Sole unit at the heel gives you soft cushioning.\r\n<br>\r\n<br>\r\nProduct Details<br>\r\n\r\n    Cupsole construction<br>\r\n    Padded collar<br>\r\n    Colour Shown: White/Black/University Red<br>\r\n    Style: 575441-161<br>\r\n    Country/Region of Origin: China<br>', 9955, '', '[\"footwear\",\"men\",\"sports\"]', 180, '2022-05-20 04:30:08.692125', '2022-05-20 04:30:08.692125', 0, 2, 0),
(18, 'Genuine Leather Slip-On Loafers with Tassels', 'Wipe with a clean, dry cloth when needed<br>\r\nSlip-on Styling<br>\r\nGenuine leather upper<br>\r\nPackage contains: 1 pair of shoes<br>', 3299, '', '[\"footwear\",\"casual\",\"fashion\",\"men\"]', 149, '2022-05-20 04:32:48.616569', '2022-05-20 09:34:17.450482', 1, 2, 0),
(19, ' Skip to the beginning of the images gallery Acer Aspire 5 Thin & Light Laptop Intel Core i5 11th Ge', '11th Gen Intel® Core i5-1135G7 processor<br>\r\nWindows 11 Home 64-bit<br>\r\nIntel® Iris® Xe Graphics<br>\r\n2*4GB RAM (4 GB of onboard DDR4 system memory, 4 GB of DDR4 system memory, upgradable up to 20 GB of DDR4 system memory)<br>\r\nSSD: 512 GB, PCIe Gen3 8 Gb/s up to 4 lanes, NVMe<br>\r\nSupports up to 2 TB 2.5-inch 5400 RPM HDD<br>\r\n39.6 cm (15.6\") Full HD 1920 x 1080, high-brightness Acer ComfyView™ LED-backlit TFT LCD<br>\r\nProduct Type : Laptop Computer<br>\r\nMRP : ₹64,999.00 (Inclusive of all taxes)<br>\r\nCountry of origin : China<br>', 50999, '', '[\"electronics\",\"laptop\"]', 122, '2022-05-20 20:37:12.710704', '2022-05-20 20:37:12.710704', 0, 3, 0),
(20, ' HP Pavilion Laptop 15-eg2009TU', '12th Generation Intel® Core™ i5 processor<br>\r\nWindows 11 Home<br>\r\nIntel® Iris® Xᵉ Graphics<br>\r\n8 GB DDR4-3200 MHz RAM (2 x 4 GB)<br>', 67999, '', '[\"electronics\",\"laptop\"]', 122, '2022-05-20 20:47:18.839236', '2022-05-20 20:47:18.839236', 0, 3, 0),
(21, 'ThinkPad P17 Gen 2 (17, Intel) Mobile Workstation', 'The ThinkPad P17 Gen 2 (17, Intel) mobile workstation is built for ultimate performance, from its advanced Intel® Core™ or Intel® Xeon® processors to the big, bright 43.9cms (17.3) UHD or FHD display and professional-grade NVIDIA® RTX™ graphics.\r\nIt’s a portable powerhouse, with up to 6TB SSD storage and 128GB of DDR4 memory.', 199626, '', '[\"electronics\",\"laptop\"]', 122, '2022-05-20 21:10:10.382318', '2022-05-20 21:10:10.382318', 0, 3, 0),
(22, 'RedmiBook 15', '8GB RAM + 256GB SSD, i3 11th Gen + UHD Graphics', 34999, 'MI', '[\"electronics\",\"laptop\"]', 120, '2022-05-20 21:11:23.819126', '2022-05-20 21:12:59.817636', 0, 3, 0),
(23, 'Apple M1 Chip with 8‑Core CPU and 8‑Core GPU 256GB SSD Storage', 'pple M1 chip with 8-core CPU, 8-core GPU, and 16-core Neural Engine\r\n8GB unified memory\r\n256GB SSD storage\r\n13-inch Retina display with True Tone\r\nMagic Keyboard\r\nTouch Bar and Touch ID\r\nForce Touch trackpad\r\nTwo Thunderbolt / USB 4 ports', 101086, '', '[\"electronics\",\"laptop\"]', 100, '2022-05-20 21:15:34.453455', '2022-05-20 21:15:34.453455', 0, 3, 0),
(24, 'HP Pavilion 31.5 All-in-One Desktop PC 32-b0590in', '1 TB PCIe® NVMe™ TLC M.2 SSD\r\n12th Generation Intel® Core™ i7 processor\r\nWindows 11 Home Single Language in S mode\r\n16 GB DDR4-3200 MHz RAM (2 x 8 GB)\r\nIntel® UHD Graphics 770', 126999, 'HP', '[\"electronics\",\"desktop\"]', 110, '2022-05-20 21:28:32.042027', '2022-05-20 21:29:09.407865', 0, 3, 0),
(25, 'Apple iMac 60.96 cm (24-inch) All-In-One Desktop (8-core Apple M1 chip/8 GB/256 GB), MJV93HN/A Blue', '    60.96 cm (24-inch) Retina 4.5K Display\r\n    Apple 8-core M1 chip, Support for “Hey Siri\"\r\n    4480 x 2520 resolution, 500 nits Brightness\r\n    1080p FaceTime HD camera with M1 ISP\r\n    Magic Keyboard, macOS Operating System\r\n    Configurable to 16GB unified memory, Up to 2 TB storage\r\n    Wide colour Display and True Tone technology\r\n    1080p FaceTime HD camera with M1 image signal processor', 119900, '', '[\"electronics\",\"desktop\"]', 100, '2022-05-20 21:31:55.939580', '2022-05-20 21:31:55.939580', 0, 3, 0),
(26, 'HP 54.61 cm (21.5 inch) All-In-One Desktop (AMD R3/2.6 GHz/4 GB/1 TB), 22-dd0201in Jet Black', '    54.61 cm (21.5 inch) Full HD Display\r\n    4 GB RAM, 1 TB Internal Storage\r\n    Windows 10 Operating System\r\n    Bluetooth, Wi-Fi, HDMI Supported', 37499, '', '[\"electronics\",\"desktop\"]', 122, '2022-05-20 21:33:01.019350', '2022-05-20 21:33:01.019350', 0, 3, 0),
(27, 'Apple iPhone 12 (128GB ROM, 4GB RAM, MGJA3HN/A, Black) ', '\r\n    15.49 cm (6.1\"), Super Retina XDR\r\n    4GB RAM | 128GB ROM | iOS 14\r\n    Hexa-Core A14 Bionic Chip Processor\r\n    R: 12MP + 12MP | F: 12MP\r\n    2815 mAh Lithium Ion Battery\r\n    Barometer | Proximity Sensor', 57999, '', '[\"electronics\",\"mobilePhone\"]', 120, '2022-05-20 21:34:44.018700', '2022-05-20 21:34:44.018700', 0, 3, 0),
(28, 'OnePlus Nord CE 2 5G (Bahama Blue, 8GB, 128GB)', '\r\n    8 GB RAM | 128 GB ROM\r\n    16.33 cm (6.43 inch) Full HD+ AMOLED Display\r\n    64MP + 8MP + 2MP | 16MP Front Camera\r\n    4500 mAh Battery\r\n', 14999, '', '[\"electronics\",\"mobilePhone\"]', 80, '2022-05-20 21:36:07.114615', '2022-05-20 21:36:07.114615', 0, 3, 0),
(29, 'Google Pixel 4a (Just Black, 128 GB)  (6 GB RAM)', 'The Google Pixel 4a is more than just another smartphone for your tasks! Its HDR+ will help you take stunning photos. The Night Sight mode with astrophotography is just what you need to click those stunning images of the star-lit skies you have been meaning to capture. This phone also features apps such as the Pixel Recorder app that transcribes speech automatically. ', 31999, '', '[\"electronics\",\"mobilePhone\"]', 150, '2022-05-20 21:37:03.724359', '2022-05-20 21:37:03.724359', 0, 3, 0),
(30, 'Samsung Galaxy M12', '16.55cm (6.5”) HD+ Infinity-V Display with 90Hz Screen refresh rate\r\nTrue 48MP Quad Camera with Isocell GM2 sensor\r\n6,000mAh Long-lasting Battery with 15W Adaptive Fast Charging', 10499, '', '[\"electronics\",\"mobilePhone\"]', 108, '2022-05-20 21:38:56.896204', '2022-05-20 21:38:56.896204', 0, 3, 0),
(31, 'Mochi Beige Formal Pumps', 'Keep your product dry avoid gettign it wet or damp. to clean it, simply wipe with a dry cloth. keep fasteners and zip running smoothly by running pencil leads over the open teeth for mor details click here ', 1990, '', '[\"footwear\",\"men\"]', 120, '2022-05-22 06:07:05.741936', '2022-05-22 06:07:05.741936', 0, 1, 0),
(32, 'Asus X543MA-GQ1015T Laptop (Celeron Dual Core/4 GB/1 TB/Windows 10)', 'Be It For Work Or Play, This 39.62 Cm 15.6 Laptop From Asus Is Here To Offer A Powerful Computing Experience. It Comes With A Powerful Processor Which Makes It Capable Of Handling Any Task That You Throw At It. The Large Storage Space Of Up To 1 Tb Lets You Store Large Files, Movies, Photos, And More On This Laptop With Ease. To Top It Off, The Asus Icecool Technology Helps Keep This System Cool So That You Can Carry On With Your Work Without Worrying About Any Heating Issues.', 26990, '', '[\"electronics\",\"laptop\"]', 120, '2022-05-22 06:10:52.921033', '2022-05-22 06:10:52.921143', 0, 3, 0),
(33, 'Microsoft Surface Go (THH-00023) Laptop Intel Core i5-1035G1 (10th Gen) Intel UHD 8GB 128GB SSD Wind', 'Display: 12.4 inch 1536 x 1024 PixelSense display | Touchscreen enabled\r\nMemory & Storage: 8GB LPDDR4X RAM | Storage: 128 GB SSD\r\nDesign and battery: Touchscreen | Thin and light design | Laptop weight: 1.11 Kg | Average battery life = 13 hrs\r\nPorts & CD drive: 2 USB 3.0 Ports | Without CD drive', 64890, '', '[\"electronics\",\"laptop\"]', 180, '2022-05-22 06:12:45.412630', '2022-05-22 06:12:45.412630', 0, 3, 0),
(34, 'MSI GF63 Thin Core i5 10th Gen - (8 GB/512 GB SSD/Windows 10 Home/4 GB Graphics/NVIDIA GeForce RTX 3', 'If you enjoy gaming and want to play wherever and whenever you want, then the MSI GF63 Thin 10UC-607IN Gaming Laptop is an ideal choice for you. This laptop features a 144 Hz IPS-level, Thin-bezel Display for clear visuals, an impressive Cooling system for Low-key Gaming, and High-fidelity Audio for immersive audio. ', 69990, '', '[\"electronics\",\"laptop\"]', 50, '2022-05-22 06:14:22.493525', '2022-05-22 06:14:22.493525', 0, 3, 0),
(35, 'Inspiron 24 5000 All-in-One Desktop', '11th Gen Intel® Core™ i3-1115G4 (6 MB cache, 2 cores, 4 threads, up to 4.10 GHz Turbo) | 8 GB, 1 x 8 GB, DDR4, 2666 MHz | 256 GB SSD', 53990, '', '[\"electronics\",\"desktop\"]', 80, '2022-05-22 06:19:12.705914', '2022-05-22 06:19:12.705914', 0, 3, 0),
(36, 'HP 54.61 cm (21.5 inch) All-In-One Desktop (AMD R3/2.6 GHz/4 GB/1 TB), 22-dd0201in Jet Black', 'To all those fans of multitasking, don’t struggle with a desktop that cannot run at your speed. The HP 54.61 cm (21.5 inch) All-In-One Desktop (AMD R3/2.6 GHz/4 GB/1 TB), 22-dd0201in gives you all the incredible qualities in a slender and sophisticated frame, so you can enjoy a wide range of important features within a visibly appealing device. Flaunting a fast and efficient processor and an enduring battery system, it boosts your user experience. <br>\r\n4GB Ram || 1 TB HDD Internal Storage || Windows 10', 37499, '', '[\"electronics\",\"desktop\"]', 20, '2022-05-22 06:21:18.633014', '2022-05-22 06:21:18.633014', 0, 3, 0),
(37, ' HP All-in-One 22-df0202in Desktop (AMD Ryzen 3 / 8 GB RAM / 1 TB SATA /21.5inch (54.6cm) Display/ A', 'Windows 11 Home<br>\r\n21.5inch (54.6cm) Diagonal, FHD (1920 x 1080), IPS, three-sided micro-edge, anti-glare<br>\r\n8 GB DDR4 Memory<br>\r\nAMD Ryzen™ 3 Processor<br>\r\n1 TB GB SATA HDD Capacity<br>\r\nAMD Radeon™ Graphics<br>\r\n1 Year Manufacturer Warran<br>', 41490, '', '[\"electronics\",\"desktop\"]', 40, '2022-05-22 06:23:10.940074', '2022-05-22 06:23:10.940074', 0, 3, 0),
(38, 'Apple iMac 60.96 cm (24-inch) All-In-One Desktop (8-core Apple M1 chip/8 GB/256 GB), MGTF3HN/A Silve', '    60.96 cm (24-inch) Retina 4.5K Display <br>\r\n    Apple 8-core M1 chip, Support for “Hey Siri\" <br>\r\n    4480 x 2520 resolution, 500 nits Brightness <br>\r\n    1080p FaceTime HD camera with M1 ISP <br>', 119900, '', '[\"electronics\",\"desktop\"]', 120, '2022-05-22 06:24:51.031745', '2022-05-22 06:24:51.031745', 0, 3, 0),
(39, 'Apple iMac 5K MXWU2HN/A(Core i5 3.1 GHz/8GB RAM/512 GB SSD/27 (68.58 Cm) 5K Retina Display/4GB Radeo', 'Display Size -27 Inches<br>\r\nProcessor- AMD Radeon Pro 5300<br>\r\nGraphic Processor -Radeon Pro 5300<br>\r\nDisplay Feature - Full HD LED Backlit Anti-glare Display<br>\r\nOperating System - Windows 10 Home Basic<br>\r\nWarranty- 1 Year <br>', 189900, '', '[\"electronics\",\"desktop\"]', 20, '2022-05-22 06:28:01.417079', '2022-05-22 06:28:01.417079', 0, 3, 0),
(40, ' Oppo A31 (Fantasy White, 6GB RAM, 128GB Storage) ', '12+2+2MP triple rear camera (12MP main camera+2MP macro lens+2MP depth camera) with Portrait bokeh, macro lens, dazzle color mode, AI beautification | 8MP front camera<br>\r\n16.5 centimeters (6.5-inch) waterdrop multi touch screen with an 89% screen to body ratio | 1600 x 720 pixels resolution, 269 ppi pixel density<br>\r\nMemory, Storage & SIM: 6GB RAM | 128GB internal memory expandable up to 256GB | Dual SIM (nano+nano) dual-standby (4G+4G)<br>\r\nAndroid Pie v9.0 based on ColorOS 6.1 operating system with 2.3GHz Mediatek 6765 octa core processor, IMG GE8320<br>\r\n4230mAH lithium-polymer battery providing talk-time of 45 hours and standby time of 450 hours<br>\r\n1 year manufacturer warranty for device and 6 months manufacturer warranty for in-box accessories including batteries from the date of purchase<br>\r\nBox also includes: USB cable, Sim tray ejecter, pre-applied screen protector and protective case, booklet with warranty card and quick guide. The box does not include earphones<br>', 11500, '', '[\"electronics\",\"mobilePhone\"]', 200, '2022-05-22 06:31:29.395205', '2022-05-22 06:31:29.395205', 0, 3, 0),
(41, 'Realme narzo 50i (Carbon Black, 4GB RAM+64GB Storage) - with No Cost EMI/Additional Exchange Offers ', '4 GB RAM | 64 GB ROM | Expandable Upto 256 GB<br>\r\n16.51 cm (6.5 inch) HD+ Display<br>\r\n8MP Primary Camera | 5MP Front Camera<br>\r\n5000 mAh Battery<br>\r\nOcta-core Processo<br>', 8500, '', '[\"electronics\",\"mobilePhone\"]', 120, '2022-05-22 06:33:10.812254', '2022-05-22 06:33:10.812403', 0, 3, 0),
(42, 'Jio Phone Next 32 GB ROM, 2 GB RAM, Blue Smartphone ', ' 13MP rear camera with AI portrait, AI scene recognition, HDR, pro mode | 5MP front camera<br>\r\n16.58 centimeters (6.53 inch) HD+ multi-touch capacitive touchscreen with 1600 x 720 pixels resolution, 268 ppi pixel density and 20:9 aspect ratio<br>\r\nMemory, Storage & SIM: 3GB RAM, 32GB internal memory expandable up to 512GB | Dual SIM (nano+nano) + Dedicated SD card slot<br>\r\nAndroid v10 operating system with upto 2.0GHz clock speed Mediatek<br> Helio G25 octa core processor<br>\r\n5000mAH lithium-polymer large battery with 10W wired charger in-box <br>', 4497, '', '[\"electronics\",\"mobilePhone\"]', 120, '2022-05-22 06:34:33.595723', '2022-05-22 06:34:33.595723', 0, 3, 0),
(43, 'Redmi 9A(Midnight Black 3GB RAM 32GB Storage) | 2GHz Octa-core Helio G25 Processor | 5000 mAh Batter', '3MP rear camera with AI portrait, AI scene recognition, HDR, pro mode | 5MP front camera<br>\r\n16.58 centimeters (6.53 inch) HD+ multi-touch capacitive touchscreen with 1600 x 720 pixels resolution, 268 ppi pixel density and 20:9 aspect ratio<br>\r\nMemory, Storage & SIM: 3GB RAM, 32GB internal memory expandable up to 512GB | Dual SIM (nano+nano) + Dedicated SD card slot\r\nAndroid v10 operating system with upto 2.0GHz clock speed Mediatek Helio G25 octa core processor<br>\r\n5000mAH lithium-polymer large battery with 10W wired charger in-box <br>', 7550, '', '[\"electronics\",\"mobilePhone\"]', 150, '2022-05-22 06:35:57.512703', '2022-05-22 06:35:57.512703', 0, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `api_productimage`
--

CREATE TABLE `api_productimage` (
  `id` bigint(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `product_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `api_productimage`
--

INSERT INTO `api_productimage` (`id`, `image`, `created_at`, `updated_at`, `product_id`) VALUES
(1, 'images/pexels-ray-piedra-1537671_zrXUBEy.jpg', '2022-05-12 09:35:28.466509', '2022-05-12 09:35:28.466509', 1),
(2, 'images/pexels-anne-985635_oqYPtgc.jpg', '2022-05-13 05:11:14.565979', '2022-05-13 05:11:14.565979', 2),
(3, 'images/pexels-bella-zhong-3076787.jpg', '2022-05-13 05:12:32.566284', '2022-05-13 05:12:32.567283', 3),
(4, 'images/pexels-web-donut-19090.jpg', '2022-05-13 05:13:44.965394', '2022-05-13 05:13:44.965394', 4),
(5, 'images/pexels-abir-hasan-1857375.jpg', '2022-05-19 13:12:56.156363', '2022-05-19 13:12:56.156363', 5),
(6, 'images/pexels-bella-zhong-3782789.jpg', '2022-05-19 14:10:40.799170', '2022-05-19 14:10:40.799170', 6),
(7, 'images/pexels-suraj-b-2759779.jpg', '2022-05-19 14:14:02.349837', '2022-05-19 14:14:02.349837', 7),
(8, 'images/pexels-oleg-magni-2145983.jpg', '2022-05-20 03:05:47.515517', '2022-05-20 03:05:47.515517', 8),
(9, 'images/pexels-thegiansepillo-3304941_yFRZ7LT.jpg', '2022-05-20 03:11:02.963808', '2022-05-20 03:11:02.963808', 9),
(10, 'images/pexels-yogendra-singh-1701205.jpg', '2022-05-20 03:13:02.654305', '2022-05-20 03:13:02.654305', 10),
(11, 'images/pexels-marlene-leppänen-1183266.jpg', '2022-05-20 03:23:46.479279', '2022-05-20 03:23:46.479279', 11),
(12, 'images/pexels-spencer-selover-428311.jpg', '2022-05-20 03:50:36.442027', '2022-05-20 03:50:36.442027', 12),
(13, 'images/pexels-spencer-selover-428338.jpg', '2022-05-20 03:56:32.191010', '2022-05-20 03:56:32.191010', 13),
(14, 'images/pexels-maksim-goncharenok-4380970.jpg', '2022-05-20 04:03:50.515041', '2022-05-20 04:03:50.515041', 14),
(15, 'images/pexels-aidan-roof-3372595.jpg', '2022-05-20 04:21:41.177364', '2022-05-20 04:21:41.177539', 15),
(16, 'images/pexels-andres-ayrton-6551145.jpg', '2022-05-20 04:23:32.767639', '2022-05-20 04:23:32.767639', 16),
(17, 'images/pexels-jd-danny-2385477.jpg', '2022-05-20 04:30:08.704661', '2022-05-20 04:30:08.704661', 17),
(18, 'images/pexels-ahmed-anwar-1122605.jpg', '2022-05-20 04:32:48.628575', '2022-05-20 04:32:48.628575', 18),
(19, 'images/laptop_01.jpg', '2022-05-20 20:37:12.720089', '2022-05-20 20:37:12.720089', 19),
(20, 'images/hp_laptop.webp', '2022-05-20 20:47:18.843806', '2022-05-20 20:47:18.843806', 20),
(21, 'images/lenovo_laptop.webp', '2022-05-20 21:10:10.389195', '2022-05-20 21:10:10.389195', 21),
(22, 'images/redmi_laptop.png', '2022-05-20 21:11:23.824478', '2022-05-20 21:11:23.824478', 22),
(23, 'images/apple_laptop.jpg', '2022-05-20 21:15:34.458515', '2022-05-20 21:15:34.458515', 23),
(24, 'images/hp_desktop.webp', '2022-05-20 21:28:32.047505', '2022-05-20 21:28:32.047505', 24),
(25, 'images/apple-imac.jpg', '2022-05-20 21:31:55.945250', '2022-05-20 21:31:55.945250', 25),
(26, 'images/HP_desktop.jpg', '2022-05-20 21:33:01.023306', '2022-05-20 21:33:01.023306', 26),
(27, 'images/mxw_2048s_webpf_auto.avif', '2022-05-20 21:34:44.027821', '2022-05-20 21:34:44.027821', 27),
(28, 'images/onePlusPhone.jpg', '2022-05-20 21:36:07.123194', '2022-05-20 21:36:07.123194', 28),
(29, 'images/google-pixel-4a-ga02099-in-original-imafwyzmnfxzmv5q.webp', '2022-05-20 21:37:03.743395', '2022-05-20 21:37:03.743395', 29),
(30, 'images/in-galaxy-m12-m127-sm-m127gzwgins-405434314.webp', '2022-05-20 21:38:56.902238', '2022-05-20 21:38:56.902238', 30),
(31, 'images/pexels-monicore-134064.jpg', '2022-05-22 06:07:05.773147', '2022-05-22 06:07:05.773147', 31),
(32, 'images/asus_laptop.webp', '2022-05-22 06:10:52.930358', '2022-05-22 06:10:52.930358', 32),
(33, 'images/microsoft_laptop.webp', '2022-05-22 06:12:45.418662', '2022-05-22 06:12:45.418662', 33),
(34, 'images/msi_laptop.webp', '2022-05-22 06:14:22.498568', '2022-05-22 06:14:22.498568', 34),
(35, 'images/dektop_01.png', '2022-05-22 06:19:12.714913', '2022-05-22 06:19:12.714913', 35),
(36, 'images/dektop_02.jpg', '2022-05-22 06:21:18.640008', '2022-05-22 06:21:18.640008', 36),
(37, 'images/dektop_03.jpg', '2022-05-22 06:23:10.946320', '2022-05-22 06:23:10.946320', 37),
(38, 'images/dektop_04.jpg', '2022-05-22 06:24:51.037752', '2022-05-22 06:24:51.037752', 38),
(39, 'images/dektop_05.jpg', '2022-05-22 06:28:01.420947', '2022-05-22 06:28:01.420947', 39),
(40, 'images/phone_01.jpg', '2022-05-22 06:31:29.405351', '2022-05-22 06:31:29.405351', 40),
(41, 'images/phone_02.jpg', '2022-05-22 06:33:10.817418', '2022-05-22 06:33:10.817418', 41),
(42, 'images/phone_03.jpg', '2022-05-22 06:34:33.601722', '2022-05-22 06:34:33.601722', 42),
(43, 'images/phone_04.jpg', '2022-05-22 06:35:57.518018', '2022-05-22 06:35:57.518018', 43);

-- --------------------------------------------------------

--
-- Table structure for table `api_retailer`
--

CREATE TABLE `api_retailer` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `companyName` varchar(100) NOT NULL,
  `companyAddress` varchar(100) NOT NULL,
  `bankDetails` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `phonenumbers` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `api_retailer`
--

INSERT INTO `api_retailer` (`id`, `name`, `email`, `password`, `companyName`, `companyAddress`, `bankDetails`, `created_at`, `updated_at`, `phonenumbers`) VALUES
(1, 'Pratham Yadav', 'pyadav5000@gmail.com', 'pbkdf2_sha256$320000$mMhIai9jPiRj881SNUlqTF$vpPWFdyJdPa4Ec2BsubDKko2hClFc9OyRDmZ3rEAUCw=', 'Antaur International', '301, Braham Avenue, Plot 177, Sec 21, Kamothe', 'SBIN12901', '2022-05-12 09:34:46.839168', '2022-05-19 06:39:27.288633', 2147483647),
(2, 'Siddhi Thoke', 'siddhithoke10@gmail.com', 'pbkdf2_sha256$320000$HfgPvj8TnfPRAFO5hEVHcx$Kgeo7n0pwJZZ7AB2DDliz+ivBquoGfpAINeh2C+Kcgk=', 'Mystix', 'Neel Sankalp, New Panvel, Navi Mumbai - 410206', 'SBIN1900', '2022-05-20 03:45:00.471369', '2022-05-20 05:09:42.860517', 2147483647),
(3, 'Ramcharan', 'neoretailers@gmail.com', 'pbkdf2_sha256$320000$SaedXEWOFdWV9t2V8pBOLv$UofzcEnGaex1Yu1rOlyxCcP7Xq8dlu+TlT+Vf9IEuOQ=', '', '', '', '2022-05-20 20:29:26.192895', '2022-05-20 20:29:26.193895', 2147483647);

-- --------------------------------------------------------

--
-- Table structure for table `api_review`
--

CREATE TABLE `api_review` (
  `id` bigint(20) NOT NULL,
  `review` longtext NOT NULL,
  `rating` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `api_wishlist`
--

CREATE TABLE `api_wishlist` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `customer_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `api_wishlist`
--

INSERT INTO `api_wishlist` (`id`, `created_at`, `updated_at`, `customer_id`) VALUES
(8, '2022-05-18 14:53:55.280931', '2022-05-20 10:24:52.569076', 2);

-- --------------------------------------------------------

--
-- Table structure for table `api_wishlist_products`
--

CREATE TABLE `api_wishlist_products` (
  `id` bigint(20) NOT NULL,
  `wishlist_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `api_wishlist_products`
--

INSERT INTO `api_wishlist_products` (`id`, `wishlist_id`, `product_id`) VALUES
(16, 8, 7);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add content type', 6, 'add_contenttype'),
(22, 'Can change content type', 6, 'change_contenttype'),
(23, 'Can delete content type', 6, 'delete_contenttype'),
(24, 'Can view content type', 6, 'view_contenttype'),
(25, 'Can add address', 7, 'add_address'),
(26, 'Can change address', 7, 'change_address'),
(27, 'Can delete address', 7, 'delete_address'),
(28, 'Can view address', 7, 'view_address'),
(29, 'Can add person', 8, 'add_person'),
(30, 'Can change person', 8, 'change_person'),
(31, 'Can delete person', 8, 'delete_person'),
(32, 'Can view person', 8, 'view_person'),
(33, 'Can add product', 9, 'add_product'),
(34, 'Can change product', 9, 'change_product'),
(35, 'Can delete product', 9, 'delete_product'),
(36, 'Can view product', 9, 'view_product'),
(37, 'Can add cart', 10, 'add_cart'),
(38, 'Can change cart', 10, 'change_cart'),
(39, 'Can delete cart', 10, 'delete_cart'),
(40, 'Can view cart', 10, 'view_cart'),
(41, 'Can add review', 11, 'add_review'),
(42, 'Can change review', 11, 'change_review'),
(43, 'Can delete review', 11, 'delete_review'),
(44, 'Can view review', 11, 'view_review'),
(45, 'Can add order', 12, 'add_order'),
(46, 'Can change order', 12, 'change_order'),
(47, 'Can delete order', 12, 'delete_order'),
(48, 'Can view order', 12, 'view_order'),
(49, 'Can add product image', 13, 'add_productimage'),
(50, 'Can change product image', 13, 'change_productimage'),
(51, 'Can delete product image', 13, 'delete_productimage'),
(52, 'Can view product image', 13, 'view_productimage'),
(53, 'Can add banner add', 14, 'add_banneradd'),
(54, 'Can change banner add', 14, 'change_banneradd'),
(55, 'Can delete banner add', 14, 'delete_banneradd'),
(56, 'Can view banner add', 14, 'view_banneradd'),
(57, 'Can add retailer', 15, 'add_retailer'),
(58, 'Can change retailer', 15, 'change_retailer'),
(59, 'Can delete retailer', 15, 'delete_retailer'),
(60, 'Can view retailer', 15, 'view_retailer'),
(61, 'Can add wishlist', 16, 'add_wishlist'),
(62, 'Can change wishlist', 16, 'change_wishlist'),
(63, 'Can delete wishlist', 16, 'delete_wishlist'),
(64, 'Can view wishlist', 16, 'view_wishlist');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$320000$FYwLLj41IPjozAyhiIJmLm$ptHLFUZ8v904GI5vd142R/OFiwieEjTdsIk0NyFn4z8=', '2022-05-19 20:06:29.280556', 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2022-05-19 20:03:16.456493');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-05-20 05:09:42.864491', '2', 'Retailer object (2)', 2, '[{\"changed\": {\"fields\": [\"Password\"]}}]', 15, 1),
(2, '2022-05-20 21:12:59.818603', '22', 'Product object (22)', 2, '[{\"changed\": {\"fields\": [\"Brand\", \"Category\"]}}]', 9, 1),
(3, '2022-05-20 21:29:09.409844', '24', 'Product object (24)', 2, '[{\"changed\": {\"fields\": [\"Brand\", \"Category\"]}}]', 9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(7, 'api', 'address'),
(14, 'api', 'banneradd'),
(10, 'api', 'cart'),
(12, 'api', 'order'),
(8, 'api', 'person'),
(9, 'api', 'product'),
(13, 'api', 'productimage'),
(15, 'api', 'retailer'),
(11, 'api', 'review'),
(16, 'api', 'wishlist'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(6, 'contenttypes', 'contenttype'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-05-12 09:32:14.503767'),
(2, 'auth', '0001_initial', '2022-05-12 09:32:15.031402'),
(3, 'admin', '0001_initial', '2022-05-12 09:32:15.146345'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-05-12 09:32:15.154344'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-05-12 09:32:15.165381'),
(6, 'api', '0001_initial', '2022-05-12 09:32:15.361122'),
(7, 'api', '0002_remove_person_address', '2022-05-12 09:32:15.374161'),
(8, 'api', '0003_address_user', '2022-05-12 09:32:15.426553'),
(9, 'api', '0004_product_image_product_sale_review_order', '2022-05-12 09:32:15.817799'),
(10, 'api', '0005_alter_product_category', '2022-05-12 09:32:15.826802'),
(11, 'api', '0006_remove_product_image_productimage', '2022-05-12 09:32:15.916650'),
(12, 'api', '0007_alter_productimage_product', '2022-05-12 09:32:15.928653'),
(13, 'api', '0008_alter_address_user', '2022-05-12 09:32:15.937650'),
(14, 'api', '0009_alter_cart_user', '2022-05-12 09:32:15.948681'),
(15, 'api', '0010_alter_cart_product_banneradd', '2022-05-12 09:32:16.038651'),
(16, 'api', '0011_rename_modeofpayment_order_provider_order_id_and_more', '2022-05-12 09:32:16.077647'),
(17, 'api', '0012_remove_order_product', '2022-05-12 09:32:16.722770'),
(18, 'api', '0013_remove_order_provider_order_id_remove_order_quantity_and_more', '2022-05-12 09:32:16.768730'),
(19, 'api', '0014_order_provider_order_id', '2022-05-12 09:32:16.784768'),
(20, 'api', '0015_order_status', '2022-05-12 09:32:16.815060'),
(21, 'api', '0016_alter_order_user', '2022-05-12 09:32:16.827067'),
(22, 'api', '0017_order_product', '2022-05-12 09:32:16.896382'),
(23, 'api', '0018_remove_order_product_order_product', '2022-05-12 09:32:17.119418'),
(24, 'api', '0019_rename_product_order_products', '2022-05-12 09:32:17.143702'),
(25, 'api', '0020_order_quantity_remove_order_products_order_products', '2022-05-12 09:32:17.281171'),
(26, 'api', '0021_retailer', '2022-05-12 09:32:17.308047'),
(27, 'api', '0022_product_vendor', '2022-05-12 09:32:17.363056'),
(28, 'api', '0023_rename_phonenumbers_retailer_phonenumber', '2022-05-12 09:32:17.379046'),
(29, 'api', '0024_alter_product_vendor', '2022-05-12 09:32:17.537769'),
(30, 'api', '0025_alter_product_vendor', '2022-05-12 09:32:17.702362'),
(31, 'api', '0026_alter_product_vendor', '2022-05-12 09:32:17.816975'),
(32, 'api', '0027_alter_product_vendor', '2022-05-12 09:32:17.976209'),
(33, 'api', '0028_remove_product_vendor', '2022-05-12 09:32:18.087205'),
(34, 'api', '0029_rename_phonenumber_retailer_phonenumbers', '2022-05-12 09:32:18.100202'),
(35, 'api', '0030_remove_retailer_phonenumbers_product_vendor_and_more', '2022-05-12 09:32:18.178210'),
(36, 'api', '0031_rename_phonenumber_retailer_phonenumbers', '2022-05-12 09:32:18.193174'),
(37, 'api', '0032_alter_product_vendor', '2022-05-12 09:32:18.351093'),
(38, 'api', '0033_alter_product_vendor', '2022-05-12 09:32:18.363128'),
(39, 'api', '0034_alter_product_vendor', '2022-05-12 09:32:18.504321'),
(40, 'api', '0035_remove_product_vendor', '2022-05-12 09:32:18.578323'),
(41, 'api', '0036_product_vendor', '2022-05-12 09:32:18.630323'),
(42, 'api', '0037_alter_productimage_image', '2022-05-12 09:32:18.654178'),
(43, 'contenttypes', '0002_remove_content_type_name', '2022-05-12 09:32:18.727177'),
(44, 'auth', '0002_alter_permission_name_max_length', '2022-05-12 09:32:18.779336'),
(45, 'auth', '0003_alter_user_email_max_length', '2022-05-12 09:32:18.798561'),
(46, 'auth', '0004_alter_user_username_opts', '2022-05-12 09:32:18.807589'),
(47, 'auth', '0005_alter_user_last_login_null', '2022-05-12 09:32:18.853564'),
(48, 'auth', '0006_require_contenttypes_0002', '2022-05-12 09:32:18.859558'),
(49, 'auth', '0007_alter_validators_add_error_messages', '2022-05-12 09:32:18.868558'),
(50, 'auth', '0008_alter_user_username_max_length', '2022-05-12 09:32:18.890569'),
(51, 'auth', '0009_alter_user_last_name_max_length', '2022-05-12 09:32:18.911561'),
(52, 'auth', '0010_alter_group_name_max_length', '2022-05-12 09:32:18.930593'),
(53, 'auth', '0011_update_proxy_permissions', '2022-05-12 09:32:18.947600'),
(54, 'auth', '0012_alter_user_first_name_max_length', '2022-05-12 09:32:18.965559'),
(55, 'sessions', '0001_initial', '2022-05-12 09:32:19.002558'),
(56, 'api', '0038_wishlist', '2022-05-16 05:59:19.496015'),
(57, 'api', '0039_product_discounts', '2022-05-19 15:17:10.098020');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('cbg45z080jestg6641afnoj3nxs05ywe', '.eJxVjMsOwiAQRf-FtSFTHgIu3fcbCDMDUjU0Ke3K-O_apAvd3nPOfYmYtrXGreclTiwuYhCn3w0TPXLbAd9Tu82S5rYuE8pdkQftcpw5P6-H-3dQU6_fWlsPxWdOOoMiz2AyOyqYBjZaEWKxBZwJgAo5gLGBiM5QnGOnjTfi_QEB0The:1nrmPl:ZWajSaGpDgSyovms2ZAUuA2lZo4UBWHzxd1NtgmQx7A', '2022-06-02 20:06:29.289593');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `api_address`
--
ALTER TABLE `api_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `api_address_user_id_19458536_fk_api_person_id` (`user_id`);

--
-- Indexes for table `api_banneradd`
--
ALTER TABLE `api_banneradd`
  ADD PRIMARY KEY (`id`),
  ADD KEY `api_banneradd_product_id_59a5ae24_fk_api_product_id` (`product_id`);

--
-- Indexes for table `api_cart`
--
ALTER TABLE `api_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `api_cart_product_id_f60eac94_fk_api_product_id` (`product_id`),
  ADD KEY `api_cart_user_id_79972181_fk_api_person_id` (`user_id`);

--
-- Indexes for table `api_order`
--
ALTER TABLE `api_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `api_order_address_id_089033c4_fk_api_address_id` (`address_id`),
  ADD KEY `api_order_user_id_52781ff0_fk_api_person_id` (`user_id`),
  ADD KEY `api_order_products_id_181de1c2_fk_api_product_id` (`products_id`);

--
-- Indexes for table `api_person`
--
ALTER TABLE `api_person`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_product`
--
ALTER TABLE `api_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `api_product_vendor_id_81a5fbf1_fk_api_retailer_id` (`vendor_id`);

--
-- Indexes for table `api_productimage`
--
ALTER TABLE `api_productimage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `api_productimage_product_id_5020b937_fk_api_product_id` (`product_id`);

--
-- Indexes for table `api_retailer`
--
ALTER TABLE `api_retailer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_review`
--
ALTER TABLE `api_review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `api_review_product_id_78d61c8d_fk_api_product_id` (`product_id`),
  ADD KEY `api_review_user_id_8bf97ad4_fk_api_person_id` (`user_id`);

--
-- Indexes for table `api_wishlist`
--
ALTER TABLE `api_wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `api_wishlist_customer_id_004c2c4b_fk_api_person_id` (`customer_id`);

--
-- Indexes for table `api_wishlist_products`
--
ALTER TABLE `api_wishlist_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `api_wishlist_products_wishlist_id_product_id_6beed711_uniq` (`wishlist_id`,`product_id`),
  ADD KEY `api_wishlist_products_product_id_a0a27e7f_fk_api_product_id` (`product_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `api_address`
--
ALTER TABLE `api_address`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `api_banneradd`
--
ALTER TABLE `api_banneradd`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `api_cart`
--
ALTER TABLE `api_cart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `api_order`
--
ALTER TABLE `api_order`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `api_person`
--
ALTER TABLE `api_person`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `api_product`
--
ALTER TABLE `api_product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `api_productimage`
--
ALTER TABLE `api_productimage`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `api_retailer`
--
ALTER TABLE `api_retailer`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `api_review`
--
ALTER TABLE `api_review`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `api_wishlist`
--
ALTER TABLE `api_wishlist`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `api_wishlist_products`
--
ALTER TABLE `api_wishlist_products`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `api_address`
--
ALTER TABLE `api_address`
  ADD CONSTRAINT `api_address_user_id_19458536_fk_api_person_id` FOREIGN KEY (`user_id`) REFERENCES `api_person` (`id`);

--
-- Constraints for table `api_banneradd`
--
ALTER TABLE `api_banneradd`
  ADD CONSTRAINT `api_banneradd_product_id_59a5ae24_fk_api_product_id` FOREIGN KEY (`product_id`) REFERENCES `api_product` (`id`);

--
-- Constraints for table `api_cart`
--
ALTER TABLE `api_cart`
  ADD CONSTRAINT `api_cart_product_id_f60eac94_fk_api_product_id` FOREIGN KEY (`product_id`) REFERENCES `api_product` (`id`),
  ADD CONSTRAINT `api_cart_user_id_79972181_fk_api_person_id` FOREIGN KEY (`user_id`) REFERENCES `api_person` (`id`);

--
-- Constraints for table `api_order`
--
ALTER TABLE `api_order`
  ADD CONSTRAINT `api_order_address_id_089033c4_fk_api_address_id` FOREIGN KEY (`address_id`) REFERENCES `api_address` (`id`),
  ADD CONSTRAINT `api_order_products_id_181de1c2_fk_api_product_id` FOREIGN KEY (`products_id`) REFERENCES `api_product` (`id`),
  ADD CONSTRAINT `api_order_user_id_52781ff0_fk_api_person_id` FOREIGN KEY (`user_id`) REFERENCES `api_person` (`id`);

--
-- Constraints for table `api_product`
--
ALTER TABLE `api_product`
  ADD CONSTRAINT `api_product_vendor_id_81a5fbf1_fk_api_retailer_id` FOREIGN KEY (`vendor_id`) REFERENCES `api_retailer` (`id`);

--
-- Constraints for table `api_productimage`
--
ALTER TABLE `api_productimage`
  ADD CONSTRAINT `api_productimage_product_id_5020b937_fk_api_product_id` FOREIGN KEY (`product_id`) REFERENCES `api_product` (`id`);

--
-- Constraints for table `api_review`
--
ALTER TABLE `api_review`
  ADD CONSTRAINT `api_review_product_id_78d61c8d_fk_api_product_id` FOREIGN KEY (`product_id`) REFERENCES `api_product` (`id`),
  ADD CONSTRAINT `api_review_user_id_8bf97ad4_fk_api_person_id` FOREIGN KEY (`user_id`) REFERENCES `api_person` (`id`);

--
-- Constraints for table `api_wishlist`
--
ALTER TABLE `api_wishlist`
  ADD CONSTRAINT `api_wishlist_customer_id_004c2c4b_fk_api_person_id` FOREIGN KEY (`customer_id`) REFERENCES `api_person` (`id`);

--
-- Constraints for table `api_wishlist_products`
--
ALTER TABLE `api_wishlist_products`
  ADD CONSTRAINT `api_wishlist_products_product_id_a0a27e7f_fk_api_product_id` FOREIGN KEY (`product_id`) REFERENCES `api_product` (`id`),
  ADD CONSTRAINT `api_wishlist_products_wishlist_id_6f0f43b7_fk_api_wishlist_id` FOREIGN KEY (`wishlist_id`) REFERENCES `api_wishlist` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
