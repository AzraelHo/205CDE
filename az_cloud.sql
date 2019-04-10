-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- 主機: 127.0.0.1
-- 產生時間： 2019 年 04 月 10 日 15:59
-- 伺服器版本: 10.1.36-MariaDB
-- PHP 版本： 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `az_cloud`
--

-- --------------------------------------------------------

--
-- 資料表結構 `contact`
--

CREATE TABLE `contact` (
  `No.` int(6) NOT NULL,
  `contactName` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `contactEmail` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `subject` text CHARACTER SET utf8 COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `contact`
--

INSERT INTO `contact` (`No.`, `contactName`, `contactEmail`, `subject`) VALUES
(1, 'JK Lam', 'jklam@gmail.com', 'Something');

-- --------------------------------------------------------

--
-- 資料表結構 `customer_info`
--

CREATE TABLE `customer_info` (
  `userID` int(6) UNSIGNED ZEROFILL NOT NULL,
  `username` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `firstName` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `lastName` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `phoneNum` varchar(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(12) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `customer_info`
--

INSERT INTO `customer_info` (`userID`, `username`, `firstName`, `lastName`, `email`, `phoneNum`, `password`) VALUES
(000001, 'KKLam', 'KK', 'LAm', 'qwer@gmail.com', '12345678', '00000000'),
(000002, 'ABC', 'A', 'BC', 'abc@gmail.com', '12344321', '11223344'),
(000003, 'JoeYam', 'Joe', 'Yam', 'joeyam@gmail.com', '89796357', 'qazwsxedc');

-- --------------------------------------------------------

--
-- 資料表結構 `order_list`
--

CREATE TABLE `order_list` (
  `RecNum` int(6) NOT NULL,
  `orderType` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `customerID` int(6) UNSIGNED ZEROFILL NOT NULL,
  `payment` varchar(10) NOT NULL,
  `orderTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `order_list`
--

INSERT INTO `order_list` (`RecNum`, `orderType`, `customerID`, `payment`, `orderTime`) VALUES
(1, 'HOST01', 000001, 'Master', '2019-04-09 02:23:31'),
(3, 'SERYD1', 000002, 'Master', '2019-04-09 03:11:47');

-- --------------------------------------------------------

--
-- 資料表結構 `productlist`
--

CREATE TABLE `productlist` (
  `name` varchar(55) COLLATE utf8_bin NOT NULL,
  `productID` varchar(6) COLLATE utf8_bin NOT NULL,
  `infoRow1` text COLLATE utf8_bin NOT NULL,
  `infoRow2` text COLLATE utf8_bin NOT NULL,
  `infoRow3` text COLLATE utf8_bin NOT NULL,
  `infoRow4` text COLLATE utf8_bin NOT NULL,
  `infoRow5` text COLLATE utf8_bin NOT NULL,
  `infoRow6` text COLLATE utf8_bin NOT NULL,
  `infoRow7` text COLLATE utf8_bin NOT NULL,
  `infoRow8` text COLLATE utf8_bin NOT NULL,
  `infoRow9` text COLLATE utf8_bin NOT NULL,
  `infoRow10` text COLLATE utf8_bin NOT NULL,
  `infoRow11` text COLLATE utf8_bin NOT NULL,
  `infoRow12` text COLLATE utf8_bin NOT NULL,
  `infoRow13` text COLLATE utf8_bin NOT NULL,
  `price` int(5) NOT NULL,
  `Time` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 資料表的匯出資料 `productlist`
--

INSERT INTO `productlist` (`name`, `productID`, `infoRow1`, `infoRow2`, `infoRow3`, `infoRow4`, `infoRow5`, `infoRow6`, `infoRow7`, `infoRow8`, `infoRow9`, `infoRow10`, `infoRow11`, `infoRow12`, `infoRow13`, `price`, `Time`) VALUES
('SSL Hosting Lite', 'HOST01', 'SSL Certificate Website', 'Company Email Service', '1 SSL Certificate', '－', '5GB SSD Website Storage', '10GB Mail Server Storage', '10 Email Accounts', 'Basic Mailbox Protection', '1 QTY MySQL Database', '1 QTY Domain Support', '100GB Traffic', 'Traffic Priority of Service - Middle', '－', 1536, '1 Year'),
('SSL Hosting Basic', 'HOST02', 'Basic SSL Certificate Website', 'Company Email Service', '1 Comodo PositiveSSL', '1 Dedicated IP address', '10GB SSD Website Storage', '15GB Mail Server Storage', '20 Email Accounts', 'Advanced Mailbox Protection', '1 QTY MySQL Database', '1 QTY Domain Support', '1TB Traffic', 'Traffic Priority of Service - Middle', '－', 2256, '1 Year'),
('SSL Hosting Pro', 'HOST03', 'Best Data Protection SSL Website', 'Business Email Service', '1 Comodo PositiveSSL', '1 Dedicated IP Address', '20GB SSD Website Storage', '30GB Mail Server Storage', '100 Email Accounts', 'Advanced Mailbox Protection', '3 QTY MySQL Database', '1 QTY Domain Support', 'Unlimited Traffic', 'Traffic Priority of Service – Middle', 'Shared Addr Book and Calendar', 4776, '1 Year'),
('SSL Hosting Premium', 'HOST04', 'Email Protection SSL Website', 'Corporate Email Service', '1 GeoTrust QuickSSL Premium', '1 Dedicated IP Address', '50GB SSD Website Storage', '50GB Mail Server Storage', 'Unlimited Email Accounts', 'Advanced Mailbox Protection', 'Unlimited QTY MySQL Database', '1 QTY Domain Support', 'Unlimited Traffic', 'Traffic Priority of Service - Privilege', 'Shared Addr Book and Calendar', 7176, '1 Year'),
('Standard Managed Server (Dual-Core CPU)', 'SERMD1', 'Model: DS1004', '2 x Intel E5-2630 Series CPU', '2 x 6 CPU Core', '64GB Memory', '2 X 2TB / 2 X 500GB SSD Hard Disk', '1 Comodo PositiveSSL', 'Basic Version Server Management Service', '', '', '', '', '', '', 2758, '1 Month'),
('Advanced Managed Server (Dual-Core CPU)', 'SERMD2', 'Model: DS1005', '2 X Intel E5-2680 V2 Series CPU', '2 x 8 CPU Core', '64GB Memory', '2 x 2TB / 2 x 500GB SSD Hard Disk', '1 GeoTrust QuickSSL Premium', 'Basic Version Server Management Service', '', '', '', '', '', '', 3388, '1 Month'),
('Professional Managed Server (Dual-Core CPU)', 'SERMD3', 'Model: DS1006', '2 X Intel E5-2680 V2 Series CPU', '2 x 8 CPU Core', '96GB Memory', '2 x 2TB / 2 x 500GB SSD Hard Disk', '1 GeoTrust QuickSSL Premium', 'Basic Version Server Management Service', '', '', '', '', '', '', 4018, '1 Month'),
('Basic Managed Server', 'SERMS1', 'Model: DS1001', '1 x Intel E5-2630 Series CPU', '6 x CPU Core', '16GB Memory', '2 x 1TB / 2 x 250GB SSD Hard Disk', '1 Comodo PositiveSSL', 'Basic Version Server Management Service', '', '', '', '', '', '', 1798, '1 Month'),
('Standard Managed Server', 'SERMS2', 'Model: DS1002', '1 x Intel E5-2630 Series CPU', '6 x CPU Core', '32GB Memory', '2 x 2TB / 2 x 500GB SSD Hard Disk', '1 Comodo PositiveSSL', 'Basic Version Server Management Service', '', '', '', '', '', '', 2278, '1 Month'),
('Advanced Managed Server', 'SERMS3', 'Mode: DS1003', '2 x Intel E5-2630 Series CPU', '8 x CPU Core', '32GB Memory', '2 X 1TB / 2 X 250GB SSD Hard Disk', '1 GeoTrust QuickSSL Premium', 'Basic Version Server Management Service', '', '', '', '', '', '', 2278, '1 Month'),
('Standard Managed Server (Dual-Core CPU) (1 Year)', 'SERYD1', 'Model: DS1004', '2 x Intel E5-2630 Series CPU', '2 x 6 CPU Core', '64GB Memory', '2 X 2TB / 2 X 500GB SSD Hard Disk', '1 Comodo PositiveSSL', 'Basic Version Server Management Service', 'HK$2,299/month Prepaid Annually', '', '', '', '', '', 27588, '1 Year'),
('Advanced Managed Server (Dual-Core CPU) (1 Year)', 'SERYD2', 'Model: DS1005', '2 X Intel E5-2680 V2 Series CPU', '2 x 8 CPU Core', '64GB Memory', '2 x 2TB / 2 x 500GB SSD Hard Disk', '1 GeoTrust QuickSSL Premium', 'Basic Version Server Management Service', 'HK$2,824/month Prepaid Annually', '', '', '', '', '', 33888, '1 Year'),
('Professional Managed Server (Dual-Core CPU) (1 Year)', 'SERYD3', 'Model: DS1006', '2 X Intel E5-2680 V2 Series CPU', '2 x 8 CPU Core', '96GB Memory', '2 x 2TB / 2 x 500GB SSD Hard Disk', '1 GeoTrust QuickSSL Premium', 'Basic Version Server Management Service', 'HK$3,349/month Prepaid Annually', '', '', '', '', '', 40188, '1 Year'),
('Basic Managed Server (1 Year)', 'SERYS1', 'Model: DS1001', '1 x Intel E5-2630 Series CPU', '6 x CPU Core', '16GB Memory', '2 x 1TB / 2 x 250GB SSD Hard Disk', '1 Comodo PositiveSSL', 'Basic Version Server Management Service', 'HK$1,499/month Prepaid Annually', '', '', '', '', '', 17988, '1 Year'),
('Standard Managed Server (1 Year)', 'SERYS2', 'Model: DS1002', '1 x Intel E5-2630 Series CPU', '6 x CPU Core', '32GB Memory', '2 x 2TB / 2 x 500GB SSD Hard Disk', '1 Comodo PositiveSSL', 'Basic Version Server Management Service', 'HK$1,899/month Prepaid Annually', '', '', '', '', '', 22788, '1 Year'),
('Advanced Managed Server (1 Year)', 'SERYS3', 'Mode: DS1003', '2 x Intel E5-2630 Series CPU', '8 x CPU Core', '32GB Memory', '2 X 1TB / 2 X 250GB SSD Hard Disk', '1 GeoTrust QuickSSL Premium', 'Basic Version Server Management Service', 'HK$1,899/month Prepaid Annually', '', '', '', '', '', 22788, '1 Year');

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`No.`);

--
-- 資料表索引 `customer_info`
--
ALTER TABLE `customer_info`
  ADD PRIMARY KEY (`userID`);

--
-- 資料表索引 `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`RecNum`);

--
-- 資料表索引 `productlist`
--
ALTER TABLE `productlist`
  ADD PRIMARY KEY (`productID`);

--
-- 在匯出的資料表使用 AUTO_INCREMENT
--

--
-- 使用資料表 AUTO_INCREMENT `contact`
--
ALTER TABLE `contact`
  MODIFY `No.` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表 AUTO_INCREMENT `customer_info`
--
ALTER TABLE `customer_info`
  MODIFY `userID` int(6) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用資料表 AUTO_INCREMENT `order_list`
--
ALTER TABLE `order_list`
  MODIFY `RecNum` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
