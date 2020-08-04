-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 29, 2019 at 02:29 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kasir`
--

-- --------------------------------------------------------

--
-- Table structure for table `databuku`
--

CREATE TABLE `databuku` (
  `idbuku` varchar(50) NOT NULL,
  `namabuku` varchar(50) NOT NULL,
  `harga` bigint(20) NOT NULL,
  `penulis` varchar(50) NOT NULL,
  `penerbit` varchar(50) NOT NULL,
  `stok` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `databuku`
--

INSERT INTO `databuku` (`idbuku`, `namabuku`, `harga`, `penulis`, `penerbit`, `stok`) VALUES
('1', 'satu', 1000, 'asep', 'ujang', -2),
('1111', 'Tenda Biru', 12000, 'Drow', 'Weird', 17),
('123', 'Intelegensi Embun Pagi', 120000, 'Dee', 'Gramedia', 98),
('1231', 'Perahu Kertas', 90000, 'Dee', 'Gramedia', 45);

-- --------------------------------------------------------

--
-- Table structure for table `datapembelian`
--

CREATE TABLE `datapembelian` (
  `id` varchar(50) NOT NULL,
  `idbuku` varchar(50) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `namabuku` varchar(50) NOT NULL,
  `total` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `datapembelian`
--

INSERT INTO `datapembelian` (`id`, `idbuku`, `jumlah`, `namabuku`, `total`) VALUES
('101010', '1111', 1, 'Tenda Biru', 12000),
('12121212', '1111', 2, 'Tenda Biru', 24000),
('123', '1', 4, 'satu', 4000),
('1234', '1', 3, 'satu', 3000),
('12yu', '123', 2, 'Intelegensi Embun Pagi', 240000),
('1yu1', '1231', 3, 'Perahu Kertas', 270000),
('232367', '1231', 2, 'Perahu Kertas', 180000);

--
-- Triggers `datapembelian`
--
DELIMITER $$
CREATE TRIGGER `kurangstok` AFTER INSERT ON `datapembelian` FOR EACH ROW BEGIN
    UPDATE databuku SET stok=stok-New.jumlah
    WHERE idbuku=new.idbuku;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `namaadmin` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `password`, `namaadmin`) VALUES
('17111343', 'admin', 'Saeful  Firmansyah'),
('17111258', 'admin', 'Ronal F Sibarani'),
('17111365', 'admin', 'Saeful Rochman');

-- --------------------------------------------------------

--
-- Table structure for table `loginkasir`
--

CREATE TABLE `loginkasir` (
  `id` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loginkasir`
--

INSERT INTO `loginkasir` (`id`, `password`, `nama`) VALUES
('17111343', 'admin', 'Saeful Firmansyah'),
('17111365', 'admin', 'Saeful Rochman'),
('17111258', 'admin', 'Ronal F Sibarani');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `databuku`
--
ALTER TABLE `databuku`
  ADD PRIMARY KEY (`idbuku`);

--
-- Indexes for table `datapembelian`
--
ALTER TABLE `datapembelian`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
