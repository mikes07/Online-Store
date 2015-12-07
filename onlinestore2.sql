-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Дек 07 2015 г., 14:59
-- Версия сервера: 5.5.25
-- Версия PHP: 5.2.12

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `onlinestore2`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `CategoryId` int(11) NOT NULL AUTO_INCREMENT,
  `Category` tinytext NOT NULL,
  PRIMARY KEY (`CategoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`CategoryId`, `Category`) VALUES
(1, 'Fruits'),
(2, 'Vegetable'),
(3, 'Biscuit'),
(4, 'Cheese'),
(5, 'Juice'),
(6, 'Yoghurt'),
(7, 'Milk'),
(8, 'Chocolate');

-- --------------------------------------------------------

--
-- Структура таблицы `orderdetails`
--

CREATE TABLE IF NOT EXISTS `orderdetails` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `OrderId` int(11) NOT NULL,
  `ProductId` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Price` double NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `OrderId` int(11) NOT NULL AUTO_INCREMENT,
  `ContactName` tinytext NOT NULL,
  `DeliveryAddress` text NOT NULL,
  `CCName` tinytext NOT NULL,
  `CCNumber` tinytext NOT NULL,
  `CCExpireDate` tinytext NOT NULL,
  PRIMARY KEY (`OrderId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2084680536 ;

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `ProductId` int(11) NOT NULL AUTO_INCREMENT,
  `CategoryId` int(11) NOT NULL,
  `Name` tinytext NOT NULL,
  `Description` text NOT NULL,
  `Price` double NOT NULL,
  PRIMARY KEY (`ProductId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`ProductId`, `CategoryId`, `Name`, `Description`, `Price`) VALUES
(1, 8, 'Timtim', 'Mint Chocolate 250g', 12.45),
(2, 3, 'Choco Pie', 'Chocolate biscuit, 180g', 8.45),
(3, 6, 'Campino', 'Fruit yoghurt, 1l', 23.3),
(4, 5, 'Nico', 'Orange juice, 0.5l', 45.7),
(5, 4, 'Holland cheese', 'Cheese of Holland, 1kg', 53.55),
(6, 1, 'Oranges', 'Sweet oranges, 1kg', 35.5),
(7, 2, 'Tomatoes', 'Krasnodar, 1kg', 25.5),
(8, 7, 'Milk', '0.5l', 30.5);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
