-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 24, 2025 at 06:53 PM
-- Server version: 5.7.33
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `java_sewa_pc`
--

-- --------------------------------------------------------

--
-- Table structure for table `pc`
--

CREATE TABLE `pc` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `nama` varchar(50) NOT NULL,
  `merek` varchar(50) NOT NULL,
  `spesifikasi` varchar(512) NOT NULL,
  `harga` int(10) UNSIGNED NOT NULL,
  `ketersediaan` enum('Disewa','Tersedia') NOT NULL DEFAULT 'Tersedia'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pc`
--

INSERT INTO `pc` (`id`, `nama`, `merek`, `spesifikasi`, `harga`, `ketersediaan`) VALUES
(1, 'PC-01', 'ASUS', 'PROSESOR: INTEL CORE-i5 GEN 7\nRAM: 8GB\nSSD: 256GB', 75000, 'Tersedia'),
(2, 'PC-02', 'ASUSU', 'PROSESOR: INTEL CORE-i5 GEN 9\nRAM: 16GB\nSSD: 512GB', 125000, 'Tersedia'),
(4, 'PC-03', 'ASROCK', 'PROSESOR: INTEL CORE i5\nRAM: 4GB\nSSD: 256 GB', 80000, 'Disewa'),
(5, 'PC-05', 'Lenovo', 'PROSESOR: INTEL CORE i3\nRAM: 4GB\nHDD: 512GB', 75000, 'Tersedia');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `hp` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id`, `nama`, `alamat`, `hp`) VALUES
(1, 'Zulfa', 'Jl. Singajaya Desa Ulin Kec. Simpur', '083159876752'),
(2, 'Ninda', 'Ankinang', '08123'),
(3, 'Nindi', 'Kandangan', '0898'),
(5, 'Majnun', 'Ulin', '09124394893'),
(6, 'Udin', 'Kandangan', '083158832374');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(10) UNSIGNED NOT NULL,
  `pc_id` tinyint(3) UNSIGNED NOT NULL,
  `pelanggan_id` int(10) UNSIGNED NOT NULL,
  `tgl_sewa` date NOT NULL,
  `tgl_kembali` date NOT NULL,
  `total_harga` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id`, `pc_id`, `pelanggan_id`, `tgl_sewa`, `tgl_kembali`, `total_harga`) VALUES
(1, 1, 1, '2025-01-24', '2025-01-25', 75000),
(2, 2, 2, '2025-01-24', '2025-01-25', 125000),
(3, 4, 3, '2025-01-24', '2025-01-27', 240000),
(7, 1, 5, '2025-01-24', '2025-01-25', 75000),
(8, 5, 6, '2025-01-25', '2025-01-28', 225000),
(9, 4, 1, '2025-01-25', '2025-01-27', 160000),
(10, 4, 5, '2025-01-27', '2025-01-28', 80000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pc`
--
ALTER TABLE `pc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pc`
--
ALTER TABLE `pc`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
