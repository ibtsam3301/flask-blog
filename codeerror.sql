-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 04, 2020 at 09:02 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codeerror`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(50) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_num` varchar(50) NOT NULL,
  `mes` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `email`, `phone_num`, `mes`, `date`) VALUES
(3, 'sdad', 'dasda', 'sdsada', 'ssadasdasd', '2020-08-29 23:31:30'),
(4, 'ibtsam', 'ahmadibtsam07@gmail.com', '+923264646444', 'test', '2020-08-29 23:31:52'),
(5, 'ibtsam', 'ahmadibtsam07@gmail.com', '+923264646444', 'hi h', '2020-08-30 00:44:20'),
(6, 'ibtsam', 'ahmadibtsam07@gmail.com', '+923264646444', 'hi h', '2020-08-30 00:45:02'),
(7, 'ibtsam', 'ahmadibtsam07@gmail.com', '+923264646444', 'hi h', '2020-08-30 00:45:34'),
(8, 'ibtsam', 'ahmadibtsam07@gmail.com', '+923264646444', 'hi h', '2020-08-30 00:47:10'),
(9, 'ibtsam', 'ahmadibtsam07@gmail.com', '+923264646444', 'hi h', '2020-08-30 00:48:51'),
(10, 'ibtsam', 'ahmadibtsam07@gmail.com', '+923264646444', 'jgjghhjghgjhgjjjjjjjjjjjjjjjjjjjjjjjjjh', '2020-08-30 00:50:15'),
(11, 'das', 'dasda@asdsa.com', '212`22`12', 'qwewqewewqeqweqweqw', '2020-08-30 00:51:10'),
(12, 'dsadsa', 'sadsad', 'sdad', 'sadasd', '2020-08-30 00:52:38'),
(13, 'nooo', 'ahmadibtsam@gmail.com', '898989899', 'ibtsam ahmad ', '2020-08-30 00:56:16'),
(14, 'nooo', 'ahmadibtsam@gmail.com', '898989899', 'ibtsam ahmad ', '2020-08-30 00:56:42');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` text NOT NULL,
  `tagline` text NOT NULL,
  `slug` varchar(25) NOT NULL,
  `content` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `img_file` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `tagline`, `slug`, `content`, `date`, `img_file`) VALUES
(2, 'This is second one', 'Second post but still for testing', 'second-post', 'This is second post', '2020-08-30 23:11:53', 'contact-bg.jpg'),
(5, 'sq', 'ewqe', 'qwe', 'qwe', '2020-09-01 19:03:28', 'qwe'),
(6, 'new post', 'thos s the new post', 'qwe', 'dsada', '2020-09-02 19:27:47', 'asdada'),
(8, 'new post', 'ewqe', 'qwe', 'dasd', '2020-09-03 13:53:30', 'asdas'),
(9, 'fdsf', 'sdfs', 'sdfs', 'dsadasdd', '2020-09-03 14:33:27', 'fsfs'),
(10, 'dasd', 'asda', 'asda', 'sdasdasd', '2020-09-03 14:34:36', 'adada'),
(11, 'sdfsdffsdf', 'sdfsdfsdfasd', 'new-postsdfsdf', 'fsdfsdsdfsdfsd', '2020-09-03 14:35:05', 'fsdfsdfsfsdfdsf'),
(12, 'asd', 'asdasd', 'asdasd', 'asdasdasdas', '2020-09-03 14:35:35', 'asdasdasd'),
(13, 'asdas', 'asdasd', 'asdad', 'dasdasdas', '2020-09-03 14:46:02', 'asdasd'),
(14, 'dasdasd', 'asdasd', 'adsas', 'dasdas', '2020-09-03 14:46:10', 'dasdasdasd'),
(15, 'sdffsd', 'fsdfsdf', 'fsdfsd', 'ewrwer', '2020-09-03 14:46:12', ''),
(16, 'rtyryrt', 'ryrtyrty', 'cvbcvb', 'retytr', '2020-09-03 14:46:15', ''),
(17, 'rtyrtyrtyrty', 'rtyrtyrt', 'fhfh', 'gfnbvcncv', '2020-09-03 14:46:17', ''),
(18, 'sdad', 'asdasdasd', 'asdasdas', 'asdasdasda', '2020-09-03 19:30:41', 'sdasd'),
(19, 'asd', 'adasd', 'asd', 'asdasd', '2020-09-03 19:31:40', 'asdasd'),
(20, 'sq', 'ada', 'fgdfgd', 'gfdfg', '2020-09-03 19:32:55', 'dfgdf'),
(21, 'dasd', 'adasd', 'asd', 'asdas', '2020-09-03 19:34:01', 'asdasd'),
(22, 'dasd', 'asdasd', 'adasd', 'asdasdasd', '2020-09-03 19:34:51', 'adsasdasd'),
(23, 'python', 'Python An Object Oriented Programming Language', 'python-article', 'Python is an interpreted, object-oriented, high-level programming language with dynamic semantics. Its high-level built in data structures, combined with dynamic typing and dynamic binding, make it very attractive for Rapid Application Development, as well as for use as a scripting or glue language to connect existing components together. Python\'s simple, easy to learn syntax emphasizes readability and therefore reduces the cost of program maintenance. Python supports modules and packages, which encourages program modularity and code reuse. The Python interpreter and the extensive standard library are available in source or binary form without charge for all major platforms, and can be freely distributed.\r\n\r\nOften, programmers fall in love with Python because of the increased productivity it provides. Since there is no compilation step, the edit-test-debug cycle is incredibly fast. Debugging Python programs is easy: a bug or bad input will never cause a segmentation fault. Instead, when the interpreter discovers an error, it raises an exception. When the program doesn\'t catch the exception, the interpreter prints a stack trace. A source level debugger allows inspection of local and global variables, evaluation of arbitrary expressions, setting breakpoints, stepping through the code a line at a time, and so on. The debugger is written in Python itself, testifying to Python\'s introspective power. On the other hand, often the quickest way to debug a program is to add a few print statements to the source: the fast edit-test-debug cycle makes this simple approach very effective.\r\n\r\n', '2020-09-04 11:27:15', 'python.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
