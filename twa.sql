-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 13, 2021 at 01:33 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `twa`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(11) NOT NULL,
  `name` text NOT NULL,
  `phone_num` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `msg` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `phone_num`, `email`, `msg`, `date`) VALUES
(1, 'Parsh Purohit', '3886778617633', 'firtspost@gmail.com', 'gdfgsdhaflag uiafh hasu h hsafhash fhja ah h ah dfdaakl fakl akl akl  af', '2021-10-08 14:11:25'),
(2, 'gfuhkug', '482794292094', 'dgjhdklgjhk@gmail.com', 'djsfhsdj fjksdh', '2021-10-08 16:22:52'),
(3, 'Sahil khan', '9411884416', 'SahilKH12@gmail.com', 'hi, i want to know about what topics I can post on it', '2021-10-09 13:44:45'),
(4, 'dsf', '9411884416', 'svdsd@gmail.com', 'dsjkjsklkhsdkgh', '2021-10-09 17:13:29'),
(5, 'dgjj', '9411884416', 'adjkk@gamil.com', 'ahdfjka hdaf dh fhdia fkad fka kfahk fd', '2021-10-09 17:27:23'),
(6, 'dgjj', '9411884416', 'adjkk@gamil.com', 'ahdfjka hdaf dh fhdia fkad fka kfahk fd', '2021-10-09 17:28:33'),
(7, 'dgjj', '9411884416', 'adjkk@gamil.com', 'ahdfjka hdaf dh fhdia fkad fka kfahk fd', '2021-10-09 17:28:42'),
(8, 'dgjj', '9411884416', 'adjkk@gamil.com', 'ahdfjka hdaf dh fhdia fkad fka kfahk fd', '2021-10-09 17:29:44'),
(9, 'adssfa', '482794292094', 'dfdfss', 'fjksdhjkl', '2021-10-09 17:32:17'),
(10, 'adssfa', '482794292094', 'dfdfss', 'fjksdhjkl', '2021-10-09 17:36:44'),
(11, 'adssfa', '482794292094', 'dfdfss', 'fjksdhjkl', '2021-10-09 17:38:19'),
(12, 'adssfa', '482794292094', 'dfdfss', 'fjksdhjkl', '2021-10-09 17:44:57'),
(13, 'adssfa', '482794292094', 'dfdfss', 'fjksdhjkl', '2021-10-09 17:47:56'),
(14, 'adssfa', '482794292094', 'dfdfss', 'fjksdhjkl', '2021-10-09 17:50:33'),
(15, 'adssfa', '482794292094', 'dfdfss', 'fjksdhjkl', '2021-10-09 17:51:50'),
(16, 'adssfa', '482794292094', 'dfdfss', 'fjksdhjkl', '2021-10-09 19:30:24');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` text NOT NULL,
  `tagline` text NOT NULL,
  `slug` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `bywho` text NOT NULL,
  `imgfile` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `tagline`, `slug`, `content`, `date`, `bywho`, `imgfile`) VALUES
(1, 'Artificial Intelligence.', 'What is Artificial Intelligence? How Does AI Work?', 'first-post', 'How Does Artificial Intelligence Work?\r\n \r\nAI Approaches and Concepts\r\nLess than a decade after breaking the Nazi encryption machine Enigma and helping the Allied Forces win World War II, mathematician Alan Turing changed history a second time with a simple question: \"Can machines think?\" \r\n\r\nTuring\'s paper \"Computing Machinery and Intelligence\" (1950), and its subsequent Turing Test, established the fundamental goal and vision of artificial intelligence.   \r\n\r\nAt its core, AI is the branch of computer science that aims to answer Turing\'s question in the affirmative. It is the endeavor to replicate or simulate human intelligence in machines.\r\n\r\nThe expansive goal of artificial intelligence has given rise to many questions and debates. So much so, that no singular definition of the field is universally accepted.  ', '2021-10-12 13:12:30', 'Sparsh Saxena II', 'post-b1g.jpg'),
(2, 'Internet of Things is a revolutionary approach for future technology enhancement', 'The Internet of Things (IoT) is an emerging paradigm that enables the communication between electronic devices and sensors through the internet in order to facilitate our lives.', 'Internet-of-Things', 'Internet of Things (IoT) is a new paradigm that has changed the traditional way of living into a high tech life style. Smart city, smart homes, pollution control, energy saving, smart transportation, smart industries are such transformations due to IoT. A lot of crucial research studies and investigations have been done in order to enhance the technology through IoT. However, there are still a lot of challenges and issues that need to be addressed to achieve the full potential of IoT. These challenges and issues must be considered from various aspects of IoT such as applications, challenges, enabling technologies, social and environmental impacts etc. The main goal of this review article is to provide a detailed discussion from both technological and social perspective. The article discusses different challenges and key issues of IoT, architecture and important application domains. Also, the article bring into light the existing literature and illustrated their contribution in different aspects of IoT. Moreover, the importance of big data and its analysis with respect to IoT has been discussed. This article would help the readers and researcher to understand the IoT and its applicability to the real world.', '2021-10-10 14:21:49', 'TWA', ''),
(3, 'sdjkf sdljf ;s', 'dsajkfh sdhfdhfihsdio fhiosa io', 'thrid-post', 'dfh dhjhd ghdfhg iodf h h gihsdfi k hkl kd dk kd kl gkldf ghklkfh sdfguhdfug dfngjisdfgjkhdfkj gjkdfh gjkdfhgjkh dfjghdfhgui dhfui ghdfui gu hfuigdhjhjh gjk hfuidhg fdiushgiuof hgjk hdsjhdsfjk hgjk hdfjkghjkfhgjksdgujsdfhgjkhsdf jkghjsdjh fdhjgsjd jk fhg fh djkjkhjkdfhgjk fhgj hjk fhg jdfhg jkfd gkj jkfdhgjk dfghjkdfs gjkdfhg jkgsdh kghkjfsdhgjdfhghjkdfh gjk hjksfjkfsdkghjkf ghfjdsghigsfjkgsh dklghjksdfhgjkdsfhjgksdfghjklsdf hgihsiughsdfk j gjsdfhgjkhdfjk gjkf kj hdfjkh jg g', '2021-10-10 15:20:29', 'Admi', ''),
(4, 'fj njkh sh s kl', ' sdhf d id gisah difi lf kszj klv klzklzf iof jklj klcj klfgioj fji  ', 'fourth-post', 'dfh dhjhd ghdfhg iodf h h gihsdfi k hkl kd dk kd kl gkldf ghklkfh sdfguhdfug dfngjisdfgjkhdfkj gjkdfh gjkdfhgjkh dfjghdfhgui dhfui ghdfui gu hfuigdhjhjh gjk hfuidhg fdiushgiuof hgjk hdsjhdsfjk hgjk hdfjkghjkfhgjksdgujsdfhgjkhsdf jkghjsdjh fdhjgsjd jk fhg fh djkjkhjkdfhgjk fhgj hjk fhg jdfhg jkfd gkj jkfdhgjk dfghjkdfs gjkdfhg jkgsdh kghkjfsdhgjdfhghjkdfh gjk hjksfjkfsdkghjkf ghfjdsghigsfjkgsh dklghjksdfhgjkdsfhjgksdfghjklsdf hgihsiughsdfk j gjsdfhgjkhdfjk gjkf kj hdfjkh jg g', '2021-10-10 15:20:29', 'AAdmi', ''),
(5, 'gff kf ly l', 'tvertwsrtjt io yluy iuuiyuiuuuiui   ui uiui ui tyfty dfkljjkgfhvjhnv hl   jklgl', 'fifth-post', 'dfh dhjhd ghdfhg iodf h h gihsdfi k hkl kd dk kd kl gkldf ghklkfh sdfguhdfug dfngjisdfgjkhdfkj gjkdfh gjkdfhgjkh dfjghdfhgui dhfui ghdfui gu hfuigdhjhjh gjk hfuidhg fdiushgiuof hgjk hdsjhdsfjk hgjk hdfjkghjkfhgjksdgujsdfhgjkhsdf jkghjsdjh fdhjgsjd jk fhg fh djkjkhjkdfhgjk fhgj hjk fhg jdfhg jkfd gkj jkfdhgjk dfghjkdfs gjkdfhg jkgsdh kghkjfsdhgjdfhghjkdfh gjk hjksfjkfsdkghjkf ghfjdsghigsfjkgsh dklghjksdfhgjkdsfhjgksdfghjklsdf hgihsiughsdfk j gjsdfhgjkhdfjk gjkf kj hdfjkh jg g', '2021-10-10 15:22:03', 'nisan', ''),
(6, 'fg t f hlgjhg jhg uyl bjhg jhgl jhg lg ljh l', 'c kkldjfdj pfjzl kvcklj klvj j v ivj klcxzjv kljv kljcvk lkj ', 'sliuhfjh-post', 'j cx lh vklxzvild k vkxz klv dfh dhjhd ghdfhg iodf h h gihsdfi k hkl kd dk kd kl gkldf ghklkfh sdfguhdfug dfngjisdfgjkhdfkj gjkdfh gjkdfhgjkh dfjghdfhgui dhfui ghdfui gu hfuigdhjhjh gjk hfuidhg fdiushgiuof hgjk hdsjhdsfjk hgjk hdfjkghjkfhgjksdgujsdfhgjkhsdf jkghjsdjh fdhjgsjd jk fhg fh djkjkhjkdfhgjk fhgj hjk fhg jdfhg jkfd gkj jkfdhgjk dfghjkdfs gjkdfhg jkgsdh kghkjfsdhgjdfhghjkdfh gjk hjksfjkfsdkghjkf ghfjdsghigsfjkgsh dklghjksdfhgjkdsfhjgksdfghjklsdf hgihsiughsdfk j gjsdfhgjkhdfjk gjkf kj hdfjkh jg g', '2021-10-10 15:22:03', 'nisandehi', ''),
(8, 'hdjfh sdhh fsd jkf h', 'b,kjklc jjfg js \'sg;l \'s;ls .,x /', 'sfklsd-lsdj', 'dfsjgh shkslsdklh kk kv k ', '2021-10-13 16:38:30', 's lxl l ;', '');

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
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
