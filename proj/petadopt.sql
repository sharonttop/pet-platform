-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2021-08-22 12:09:39
-- 伺服器版本： 10.4.20-MariaDB
-- PHP 版本： 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";git
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫: `petadopt`
--

-- --------------------------------------------------------

--
-- 資料表結構 `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(10) UNSIGNED NOT NULL,
  `admin_username` varchar(500) NOT NULL DEFAULT '',
  `admin_password` varchar(500) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 傾印資料表的資料 `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_username`, `admin_password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- 資料表結構 `adoptdetails`
--

CREATE TABLE `adoptdetails` (
  `adopt_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `adopt_name` varchar(1000) NOT NULL DEFAULT '',
  `adopt_price` double NOT NULL DEFAULT 0,
  `adopt_quantity` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `adopt_total` double NOT NULL DEFAULT 0,
  `adopt_status` varchar(45) NOT NULL DEFAULT '',
  `adopt_date` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 傾印資料表的資料 `adoptdetails`
--

INSERT INTO `adoptdetails` (`adopt_id`, `user_id`, `adopt_name`, `adopt_price`, `adopt_quantity`, `adopt_total`, `adopt_status`, `adopt_date`) VALUES
(1, 1, 'pet2 ', 100, 2, 200, 'Adopted', '2021-08-20'),
(2, 1, 'pet3 ', 100, 3, 300, 'Adopted', '2021-08-20'),
(3, 2, 'pet1 ', 100, 1, 100, 'Adopted', '2021-08-21'),
(4, 1, 'pet5', 60, 2, 120, 'Adopted', '2021-08-21'),
(35, 1, 'pet2', 50, 2, 100, 'adopted', '2021-08-22'),
(38, 1, 'pet2', 50, 1, 50, 'adopted', '2021-08-22'),
(40, 1, 'pet2', 50, 1, 50, 'Pending', '2021-08-22'),
(43, 2, 'pet3', 60, 10, 600, 'adopted', '2021-08-22'),
(44, 2, 'pet4', 55, 20, 1100, 'adopted', '2021-08-22');

-- --------------------------------------------------------

--
-- 資料表結構 `pets`
--

CREATE TABLE `pets` (
  `pet_id` int(10) UNSIGNED NOT NULL,
  `pet_name` varchar(5000) NOT NULL DEFAULT '',
  `pet_price` double DEFAULT NULL,
  `pet_image` varchar(5000) NOT NULL DEFAULT '',
  `pet_date` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 傾印資料表的資料 `pets`
--

INSERT INTO `pets` (`pet_id`, `pet_name`, `pet_price`, `pet_image`, `pet_date`) VALUES
(1, 'pet1 ', 100, 'dog1.jpg', '2021-08-20'),
(2, 'pet2', 50, 'dog2.jpg', '2021-08-20'),
(3, 'pet3', 60, 'cat1.jpg', '2021-08-20'),
(4, 'pet4', 55, 'cat2.jpg', '2021-08-20'),
(5, 'pet5', 90, 'cat3.jpg', '2021-08-20'),
(6, 'pet6', 40, 'dog3.jpg', '2021-08-20');

-- --------------------------------------------------------

--
-- 資料表結構 `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_email` varchar(1000) NOT NULL,
  `user_password` varchar(1000) NOT NULL,
  `user_firstname` varchar(1000) NOT NULL,
  `user_lastname` varchar(1000) NOT NULL,
  `user_address` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 傾印資料表的資料 `users`
--

INSERT INTO `users` (`user_id`, `user_email`, `user_password`, `user_firstname`, `user_lastname`, `user_address`) VALUES
(1, 'admin@gmail.com', 'admin', 'admin', 'admin', 'Taipei'),
(2, 'test@gmail.com', 'test', 'test', '123', 'Taiwan'),
(6, 'test456@gmail.com', 'test', 'test', '456', '112233');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- 資料表索引 `adoptdetails`
--
ALTER TABLE `adoptdetails`
  ADD PRIMARY KEY (`adopt_id`),
  ADD KEY `FK_adoptdetails_1` (`user_id`);

--
-- 資料表索引 `pets`
--
ALTER TABLE `pets`
  ADD PRIMARY KEY (`pet_id`);

--
-- 資料表索引 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `adoptdetails`
--
ALTER TABLE `adoptdetails`
  MODIFY `adopt_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `pets`
--
ALTER TABLE `pets`
  MODIFY `pet_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `adoptdetails`
--
ALTER TABLE `adoptdetails`
  ADD CONSTRAINT `FK_adoptdetails_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
