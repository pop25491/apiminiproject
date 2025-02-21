-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 20, 2025 at 02:41 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mini_project_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `CartID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL CHECK (`Quantity` > 0),
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`CartID`, `ProductID`, `CustomerID`, `Quantity`, `CreatedAt`) VALUES
(87, 2, 11, 1, '2025-02-20 13:36:41');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `CategoryID` int(11) NOT NULL,
  `CategoryName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`CategoryID`, `CategoryName`) VALUES
(1, 'อุปกรณ์อิเล็กทรอนิกส์'),
(2, 'เครื่องใช้ไฟฟ้า'),
(3, 'เครื่องสำอาง'),
(4, 'เครื่องแต่งกาย'),
(5, 'อาหารและเครื่องดื่ม');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CustomerID` int(11) NOT NULL,
  `FullName` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CustomerID`, `FullName`, `Email`, `Password`, `Phone`, `Address`, `CreatedAt`) VALUES
(1, 'สมชาย ใจดี', 'somchai@example.com', 'hashed_password_1', '0812345678', '123 ถนนสุขุมวิท กรุงเทพฯ', '2025-02-15 15:54:45'),
(2, 'สมหญิง สวยงาม', 'somhying@example.com', 'hashed_password_2', '0898765432', '45/6 ถนนรามอินทรา กรุงเทพฯ', '2025-02-15 15:54:45'),
(11, 'kkk', 'k@gmail.com', '$2a$08$lmS3/FxNU2qh.UeqWKWeL.LXlFIpB8pK4gkA37G4oaW66MOJKyCsu', NULL, NULL, '2025-02-20 09:51:23'),
(12, 'h', 'h@gmail.com', '$2a$08$aDqGISTWXUUjlLdpJgQ9t.izzVt9ceKHon6NpdahWraUZQu13XZ.K', NULL, NULL, '2025-02-20 10:18:39');

-- --------------------------------------------------------

--
-- Table structure for table `orderdetail`
--

CREATE TABLE `orderdetail` (
  `OrderDetailID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL CHECK (`Quantity` > 0),
  `Subtotal` decimal(10,2) NOT NULL CHECK (`Subtotal` >= 0),
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderdetail`
--

INSERT INTO `orderdetail` (`OrderDetailID`, `OrderID`, `ProductID`, `Quantity`, `Subtotal`, `CreatedAt`) VALUES
(1, 1, 1, 1, 12900.00, '2025-02-15 15:54:45'),
(2, 2, 3, 2, 17800.00, '2025-02-15 15:54:45');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `OrderDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `TotalPrice` decimal(10,2) NOT NULL CHECK (`TotalPrice` >= 0),
  `Status` enum('Pending','Paid','Shipped','Delivered','Cancelled') NOT NULL DEFAULT 'Pending',
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OrderID`, `CustomerID`, `OrderDate`, `TotalPrice`, `Status`, `CreatedAt`, `UpdatedAt`) VALUES
(1, 1, '2025-02-15 15:54:45', 12900.00, 'Pending', '2025-02-15 15:54:45', '2025-02-15 15:54:45'),
(2, 2, '2025-02-15 15:54:45', 17800.00, 'Paid', '2025-02-15 15:54:45', '2025-02-15 15:54:45'),
(35, 1, '2025-02-20 09:51:58', 51600.00, 'Pending', '2025-02-20 09:51:58', '2025-02-20 09:51:58'),
(36, 1, '2025-02-20 10:24:00', 1780000.00, 'Pending', '2025-02-20 10:24:00', '2025-02-20 10:24:00'),
(37, 1, '2025-02-20 10:29:03', 35900.00, 'Pending', '2025-02-20 10:29:03', '2025-02-20 10:29:03'),
(38, 12, '2025-02-20 10:30:36', 8900.00, 'Paid', '2025-02-20 10:30:36', '2025-02-20 10:42:07'),
(39, 12, '2025-02-20 10:38:29', 8900.00, 'Paid', '2025-02-20 10:38:29', '2025-02-20 10:42:14'),
(40, 12, '2025-02-20 11:00:51', 99999999.99, 'Pending', '2025-02-20 11:00:51', '2025-02-20 11:00:51'),
(41, 11, '2025-02-20 12:09:30', 3625900.00, 'Paid', '2025-02-20 12:09:30', '2025-02-20 12:11:10'),
(42, 11, '2025-02-20 12:12:20', 35900.00, 'Paid', '2025-02-20 12:12:20', '2025-02-20 12:16:39'),
(43, 11, '2025-02-20 12:36:40', 199.00, 'Paid', '2025-02-20 12:36:40', '2025-02-20 12:36:46');

-- --------------------------------------------------------

--
-- Table structure for table `ordertracking`
--

CREATE TABLE `ordertracking` (
  `TrackingID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `Status` enum('Pending','Processing','Shipped','Delivered') NOT NULL DEFAULT 'Pending',
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ordertracking`
--

INSERT INTO `ordertracking` (`TrackingID`, `OrderID`, `Status`, `UpdatedAt`) VALUES
(1, 1, 'Processing', '2025-02-15 15:54:45'),
(2, 2, 'Shipped', '2025-02-15 15:54:45');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `PaymentID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `PaymentMethod` enum('Credit Card','PayPal','Bank Transfer') NOT NULL,
  `Amount` decimal(10,2) NOT NULL CHECK (`Amount` >= 0),
  `PaymentDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `Status` enum('Pending','Completed','Failed') NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`PaymentID`, `OrderID`, `PaymentMethod`, `Amount`, `PaymentDate`, `Status`) VALUES
(1, 1, 'Credit Card', 12900.00, '2025-02-15 15:54:45', 'Pending'),
(2, 2, 'Bank Transfer', 17800.00, '2025-02-15 15:54:45', 'Completed'),
(22, 38, 'Credit Card', 8900.00, '2025-02-20 03:30:45', 'Completed'),
(23, 38, 'PayPal', 8900.00, '2025-02-20 03:42:05', 'Completed'),
(24, 39, 'PayPal', 8900.00, '2025-02-20 03:42:13', 'Completed'),
(25, 41, 'Bank Transfer', 3625900.00, '2025-02-20 05:11:08', 'Completed'),
(26, 42, 'Credit Card', 35900.00, '2025-02-20 05:16:37', 'Completed'),
(27, 43, 'Credit Card', 199.00, '2025-02-20 05:36:45', 'Completed'),
(28, 43, 'Credit Card', 199.00, '2025-02-20 05:36:48', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ProductID` int(11) NOT NULL,
  `ProductName` varchar(100) NOT NULL,
  `Description` text DEFAULT NULL,
  `Price` decimal(10,2) NOT NULL CHECK (`Price` >= 0),
  `Stock` int(11) NOT NULL CHECK (`Stock` >= 0),
  `CategoryID` int(11) DEFAULT NULL,
  `ImageURL` varchar(255) DEFAULT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ProductID`, `ProductName`, `Description`, `Price`, `Stock`, `CategoryID`, `ImageURL`, `CreatedAt`, `UpdatedAt`) VALUES
(1, 'โทรศัพท์มือถือ', 'โทรศัพท์มือถือจอ 6.5 นิ้ว กล้อง 50MP', 12900.00, 50, 1, 'images/phone.jpg', '2025-02-15 15:54:45', '2025-02-15 15:54:45'),
(2, 'แล็ปท็อป', 'แล็ปท็อปประสิทธิภาพสูงสำหรับงานหนัก', 35900.00, 30, 1, 'images/laptop.jpg', '2025-02-15 15:54:45', '2025-02-15 15:54:45'),
(3, 'เครื่องซักผ้า', 'เครื่องซักผ้าอัตโนมัติขนาด 8 กก.', 8900.00, 20, 2, 'images/washing_machine.jpg', '2025-02-15 15:54:45', '2025-02-15 15:54:45'),
(4, 'ลิปสติก', 'ลิปสติกสีแดงสดติดทนนาน', 350.00, 100, 3, 'images/lipstick.jpg', '2025-02-15 15:54:45', '2025-02-15 15:54:45'),
(5, 'เสื้อยืด', 'เสื้อยืดผ้าฝ้าย 100% สวมใส่สบาย', 199.00, 200, 4, 'images/tshirt.jpg', '2025-02-15 15:54:45', '2025-02-15 15:54:45'),
(6, 'หูฟังบลูทูธ', 'หูฟังบลูทูธตัดเสียงรบกวน คุณภาพเสียงระดับพรีเมียม', 4900.00, 60, 3, 'url3', '2025-02-16 15:52:09', '2025-02-16 15:52:09'),
(7, 'สมาร์ทวอทช์', 'สมาร์ทวอทช์ตรวจจับสุขภาพ แบตอึด', 9900.00, 40, 2, 'url2', '2025-02-16 15:52:21', '2025-02-16 15:52:21'),
(8, 'กางเกงในสีแดง', 'ยืดดดดด หดดดด ไม่เท่ากัน', 9999.00, 1, 2, 'url2', '2025-02-16 15:53:12', '2025-02-16 15:53:12');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `ReviewID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Rating` int(11) NOT NULL CHECK (`Rating` between 1 and 5),
  `Comment` text DEFAULT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`ReviewID`, `CustomerID`, `ProductID`, `Rating`, `Comment`, `CreatedAt`) VALUES
(1, 1, 1, 5, 'โทรศัพท์ดีมาก แบตอึด ใช้งานลื่นไหล', '2025-02-15 15:54:45'),
(2, 2, 3, 4, 'เครื่องซักผ้าใช้งานง่าย ราคาคุ้มค่า', '2025-02-15 15:54:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`CartID`),
  ADD KEY `ProductID` (`ProductID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CategoryID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD PRIMARY KEY (`OrderDetailID`),
  ADD KEY `OrderID` (`OrderID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `ordertracking`
--
ALTER TABLE `ordertracking`
  ADD PRIMARY KEY (`TrackingID`),
  ADD KEY `OrderID` (`OrderID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`PaymentID`),
  ADD KEY `OrderID` (`OrderID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ProductID`),
  ADD KEY `CategoryID` (`CategoryID`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`ReviewID`),
  ADD KEY `CustomerID` (`CustomerID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `CartID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `orderdetail`
--
ALTER TABLE `orderdetail`
  MODIFY `OrderDetailID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `ordertracking`
--
ALTER TABLE `ordertracking`
  MODIFY `TrackingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `PaymentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `ReviewID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE CASCADE;

--
-- Constraints for table `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD CONSTRAINT `orderdetail_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`) ON DELETE CASCADE,
  ADD CONSTRAINT `orderdetail_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE CASCADE;

--
-- Constraints for table `ordertracking`
--
ALTER TABLE `ordertracking`
  ADD CONSTRAINT `ordertracking_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`) ON DELETE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`) ON DELETE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`) ON DELETE SET NULL;

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE CASCADE,
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
