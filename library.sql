-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2019-01-30 12:44:36
-- 服务器版本： 10.1.28-MariaDB
-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library`
--

-- --------------------------------------------------------

--
-- 表的结构 `new_book`
--


#服务器端口使用编码
SET NAMES UTF8;
#丢弃数据库，如果存在的话
DROP DATABASE IF EXISTS libary;
#创建数据库
CREATE DATABASE libary CHARSET=UTF8;
USE libary;

CREATE TABLE `new_book` (
  `bid` int(11) NOT NULL,
  `title` varchar(20) DEFAULT NULL,
  `classify` varchar(10) DEFAULT NULL,
  `author` varchar(20) DEFAULT NULL,
  `press` varchar(20) DEFAULT NULL,
  `searchid` varchar(20) DEFAULT NULL,
  `ISBN` varchar(13) DEFAULT NULL,
  `entry_time` date DEFAULT NULL,
  `price` decimal(3,2) DEFAULT NULL,
  `pic` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `new_book`
--

INSERT INTO `new_book` (`bid`, `title`, `classify`, `author`, `press`, `searchid`, `ISBN`, `entry_time`, `price`, `pic`) VALUES
(1, '陈公培文集', 'Chinese', '陈公培，1901-1968著', '上海 上海人民出版社 2016', 'C52/1610', '9787208141049', '2019-01-23', '9.99', 'img/book/chengongpei.jpg'),
(2, '越境的力量 历史与思想论集 盛嘉著', 'Chinese', '盛嘉 著', '厦门 厦门大学出版社 2016', 'C52/1615', '9787561562284', '2019-01-23', '9.99', 'img/book/yuejingdeliliang.png'),
(3, '苏菲的世界（挪威） 乔斯坦·贾德著', 'Chinese', '戈德尔，1952-著', '北京 作家出版社 2007', 'I533.45/5d2', '9787506341271', '2019-01-23', '9.99', 'img/book/sufei.jpg'),
(4, '跨文化背景下的北欧文学研究', 'Chinese', '孙建 主编', '上海 复旦大学出版社 2017', 'I530.6/1', '9787309126051', '2019-01-23', '9.99', 'img/book/kuawenhua.jpg'),
(5, '潘家洵译易卜生戏剧', 'Chinese', '易卜生，1828-1906著', '北京 作家出版社 2007', 'I533.45/5d2', '9787506341271', '2019-01-23', '9.99', 'img/book/yibushengxiju.jpg'),
(6, '审判（奥）卡夫卡著 宁瑛译', 'Chinese', '卡夫卡，1883-1924著', '西安 西安交通大学出版社 2015', 'I521.45/2h2', '9787560574370', '2019-01-23', '9.99', 'img/book/shenpan.jpg'),
(7, '新娘·女主人·十字架（挪威）温塞特著', 'Chinese', '温塞特，1882-1949著', '北京 北京理工大学出版社 2015', 'I533.45/4.1(1)', '9787568205306', '2019-01-23', '9.99', 'img/book/xinniang.jpg'),
(8, '生命本就纯真 周国平著', 'Chinese', '周国平，1945-著', '长沙 湖南文艺出版社 2017', 'I267/503bf', '9787540479497', '2019-01-23', '9.99', 'img/book/shengmingbenjiuchunzhen.jpg'),
(9, '视差 美国与东亚的关系', 'Chinese', '卡明斯，1943-著', '北京 生活·读书·新知三联书店2016', 'D871.22/68', '9787108055637', '2019-01-23', '9.99', 'img/book/shicha.jpg'),
(10, '话语与贸易摩擦', 'Chinese', '吴鹏 著', '北京 人民出版社 2017', 'F752.7712/46', '9787010166001', '2019-01-23', '9.99', 'img/book/huayumaoyi.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `new_book`
--
ALTER TABLE `new_book`
  ADD PRIMARY KEY (`bid`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `new_book`
--
ALTER TABLE `new_book`
  MODIFY `bid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
