-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 10, 2022 at 04:23 AM
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
-- Database: `koperasi`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail_simpanan`
--

CREATE TABLE `detail_simpanan` (
  `nosimpan` varchar(11) NOT NULL,
  `no_nas` varchar(8) NOT NULL,
  `debet` double NOT NULL,
  `kredit` double NOT NULL,
  `saldo` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_simpanan`
--

INSERT INTO `detail_simpanan` (`nosimpan`, `no_nas`, `debet`, `kredit`, `saldo`) VALUES
('SP-14020', '1402112', 1000000, 0, 1000000),
('SP-2007721', '2007112', 1000000, 0, 2000000),
('SP-20070', '2007112', 1000000, 0, 2000000);

-- --------------------------------------------------------

--
-- Table structure for table `nasabah`
--

CREATE TABLE `nasabah` (
  `no_nas` varchar(8) NOT NULL,
  `nama_nas` varchar(30) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `kota` varchar(20) NOT NULL,
  `no_telp` varchar(13) NOT NULL,
  `pekerjaan` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nasabah`
--

INSERT INTO `nasabah` (`no_nas`, `nama_nas`, `alamat`, `kota`, `no_telp`, `pekerjaan`) VALUES
('1000000', 'ade dewi fitriani', 'Desa lima sungai jati rt 05 rw 02', 'mataraman', '085390963406', 'penulis'),
('2007113', 'winda', 'Desa pematang danau', 'banjar', '081251678945', 'wartawan'),
('2007112', 'viky ', 'Danau salak', 'banjar', '087980896070', 'guru'),
('2007114', 'arziki davian', 'desa takuti', 'Banjar', '087890976090', 'buruh cuci');

-- --------------------------------------------------------

--
-- Table structure for table `pinjaman`
--

CREATE TABLE `pinjaman` (
  `kd_pinj` varchar(30) NOT NULL,
  `jns_pinj` varchar(30) DEFAULT NULL,
  `max_pinj` varchar(30) DEFAULT NULL,
  `max_ang` varchar(30) DEFAULT NULL,
  `bunga` varchar(30) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pinjaman`
--

INSERT INTO `pinjaman` (`kd_pinj`, `jns_pinj`, `max_pinj`, `max_ang`, `bunga`) VALUES
('PJ-PK', 'Pinjaman Pokok', '5000000', '18', '5'),
('PJ-MHS', 'Pinjaman sementara', '8000000', '24', '25'),
('PJ-USH', 'Pinjaman Usaha', '10000000', '17', '10');

-- --------------------------------------------------------

--
-- Table structure for table `simpan`
--

CREATE TABLE `simpan` (
  `no_nas` varchar(8) NOT NULL,
  `username` varchar(30) NOT NULL,
  `tanggal` varchar(30) NOT NULL,
  `ket` varchar(30) NOT NULL,
  `saldo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `simpan`
--

INSERT INTO `simpan` (`no_nas`, `username`, `tanggal`, `ket`, `saldo`) VALUES
('2005789', 'viky', '12/10/2021', 'Member', '190000'),
('2007112', 'winda', '01/11/2021', 'Member', '600000'),
('2008901', 'sinta', '10/12/2021', 'Member', '800000');

-- --------------------------------------------------------

--
-- Table structure for table `simpanan`
--

CREATE TABLE `simpanan` (
  `kd_simp` varchar(4) NOT NULL,
  `jns_simp` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `simpanan`
--

INSERT INTO `simpanan` (`kd_simp`, `jns_simp`) VALUES
('SBRG', 'Simpanan Barang'),
('SPKK', 'Simpanan Pokok'),
('SWJB', 'Simpanan Wajib');

-- --------------------------------------------------------

--
-- Table structure for table `trans_pinjaman`
--

CREATE TABLE `trans_pinjaman` (
  `nopinjam` varchar(11) NOT NULL,
  `tglpinjam` date NOT NULL,
  `no_nas` varchar(8) NOT NULL,
  `keterangan` varchar(20) NOT NULL,
  `pinjpokok` double NOT NULL,
  `lama` int(11) NOT NULL,
  `bunga` double NOT NULL,
  `admin` int(11) NOT NULL,
  `jml` double NOT NULL,
  `total` double NOT NULL,
  `angsuran` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trans_pinjaman`
--

INSERT INTO `trans_pinjaman` (`nopinjam`, `tglpinjam`, `no_nas`, `keterangan`, `pinjpokok`, `lama`, `bunga`, `admin`, `jml`, `total`, `angsuran`) VALUES
('PJ-20070', '2020-07-10', '2007114', 'PJ-USH', 1000000, 12, 18, 3, 210000, 1210000, 100833.33333333333);

-- --------------------------------------------------------

--
-- Table structure for table `trans_simpanan`
--

CREATE TABLE `trans_simpanan` (
  `nosimpan` varchar(11) NOT NULL,
  `tglsimpan` date NOT NULL,
  `jenis` varchar(20) NOT NULL,
  `saldo` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trans_simpanan`
--

INSERT INTO `trans_simpanan` (`nosimpan`, `tglsimpan`, `jenis`, `saldo`) VALUES
('SP-20070', '2020-07-10', '2007112', 2000000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_simpanan`
--
ALTER TABLE `detail_simpanan`
  ADD PRIMARY KEY (`nosimpan`,`no_nas`),
  ADD KEY `no_ang` (`no_nas`),
  ADD KEY `nosimpan` (`nosimpan`,`no_nas`);

--
-- Indexes for table `nasabah`
--
ALTER TABLE `nasabah`
  ADD PRIMARY KEY (`no_nas`),
  ADD KEY `no_ang` (`no_nas`),
  ADD KEY `no_ang_2` (`no_nas`),
  ADD KEY `no_ang_3` (`no_nas`),
  ADD KEY `no_ang_4` (`no_nas`),
  ADD KEY `no_ang_5` (`no_nas`);

--
-- Indexes for table `pinjaman`
--
ALTER TABLE `pinjaman`
  ADD PRIMARY KEY (`kd_pinj`);

--
-- Indexes for table `simpan`
--
ALTER TABLE `simpan`
  ADD PRIMARY KEY (`no_nas`),
  ADD KEY `no_ang` (`no_nas`),
  ADD KEY `no_ang_2` (`no_nas`);

--
-- Indexes for table `simpanan`
--
ALTER TABLE `simpanan`
  ADD PRIMARY KEY (`kd_simp`);

--
-- Indexes for table `trans_pinjaman`
--
ALTER TABLE `trans_pinjaman`
  ADD PRIMARY KEY (`nopinjam`,`no_nas`),
  ADD KEY `nopinjam` (`nopinjam`,`no_nas`),
  ADD KEY `nopinjam_2` (`nopinjam`,`no_nas`),
  ADD KEY `nopinjam_3` (`nopinjam`,`no_nas`),
  ADD KEY `no_ang` (`no_nas`),
  ADD KEY `no_ang_2` (`no_nas`),
  ADD KEY `nopinjam_4` (`nopinjam`,`no_nas`);

--
-- Indexes for table `trans_simpanan`
--
ALTER TABLE `trans_simpanan`
  ADD PRIMARY KEY (`nosimpan`),
  ADD KEY `nosimpan` (`nosimpan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
