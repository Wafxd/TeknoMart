-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 29 Jun 2024 pada 19.45
-- Versi server: 10.3.39-MariaDB-cll-lve
-- Versi PHP: 8.1.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tecp5312_elektronik`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `details`
--

CREATE TABLE `details` (
  `id_orders` int(10) NOT NULL,
  `id_barang` int(10) NOT NULL,
  `harga_satuan` int(99) NOT NULL,
  `qty` int(99) NOT NULL,
  `rating` int(10) NOT NULL,
  `ulasan` varchar(255) NOT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `details`
--

INSERT INTO `details` (`id_orders`, `id_barang`, `harga_satuan`, `qty`, `rating`, `ulasan`, `foto`) VALUES
(33, 199, 8899000, 2, 0, '', ''),
(33, 267, 89000, 2, 0, '', ''),
(34, 267, 89000, 1, 0, '', ''),
(35, 199, 8899000, 1, 0, '', ''),
(35, 266, 109000, 2, 0, '', ''),
(35, 267, 89000, 1, 0, '', ''),
(37, 199, 8899000, 1, 5, 'asdw', 'upload/665ef4411bc5e_print.png'),
(37, 266, 109000, 1, 4, '', ''),
(38, 2, 8699000, 2, 5, '', ''),
(39, 266, 109000, 1, 3, '', ''),
(40, 2, 8699000, 1, 4, '', ''),
(41, 266, 109000, 1, 5, '', ''),
(42, 266, 109000, 1, 5, '', ''),
(43, 2, 8699000, 1, 0, '', ''),
(44, 2, 8699000, 1, 3, '', ''),
(45, 2, 8699000, 1, 5, '', ''),
(45, 3, 4899000, 1, 4, '', ''),
(45, 5, 2939000, 2, 5, '', ''),
(46, 5, 2939000, 1, 0, '', ''),
(47, 5, 2939000, 1, 0, '', ''),
(49, 5, 2939000, 1, 0, '', ''),
(50, 5, 2939000, 1, 0, '', ''),
(51, 5, 2939000, 1, 0, '', ''),
(52, 3, 4899000, 1, 0, '', ''),
(53, 3, 4899000, 1, 3, '', ''),
(54, 2, 8699000, 1, 0, '', ''),
(55, 2, 8699000, 1, 2, '', ''),
(56, 3, 4899000, 1, 2, '', ''),
(56, 5, 2939000, 1, 2, '', ''),
(57, 3, 4899000, 1, 4, 'mntp', 'upload/665fe0ee19678_cancelled.png'),
(58, 5, 2939000, 1, 5, 'mantap refund diterima', ''),
(59, 452, 849000, 1, 4, '', ''),
(59, 463, 129000, 1, 5, '', ''),
(60, 452, 849000, 2, 5, '', 'upload/66602438e7c29_cancelled.png'),
(61, 463, 129000, 1, 0, '', ''),
(63, 463, 129000, 2, 5, 'bagus bgt', 'upload/666151b8c44c9_JBL-Tour-One-M2-6-1024x576.jpg'),
(69, 452, 849000, 1, 0, '', ''),
(72, 393, 1369000, 3, 0, '', ''),
(72, 394, 1299000, 1, 0, '', ''),
(73, 392, 3499000, 1, 0, '', ''),
(73, 448, 2099000, 1, 0, '', ''),
(73, 450, 899000, 1, 0, '', ''),
(74, 458, 2129000, 1, 0, '', ''),
(75, 394, 1299000, 1, 4, '', ''),
(75, 461, 379000, 1, 5, 'Mantap berkualitas dan murah', 'upload/66616ffa2cf48_JBL-Tour-One-M2-6-1024x576.jpg'),
(76, 394, 1299000, 2, 5, '', ''),
(76, 463, 129000, 3, 3, '', ''),
(77, 461, 379000, 3, 0, '', ''),
(77, 463, 129000, 2, 0, '', ''),
(78, 461, 379000, 1, 5, '', ''),
(79, 394, 1299000, 2, 0, '', ''),
(79, 461, 379000, 3, 0, '', ''),
(80, 390, 2149000, 1, 5, '', ''),
(80, 394, 1299000, 2, 3, 'baguss', ''),
(80, 461, 379000, 3, 5, 'mantap', 'upload/66619c008c0ac_IMG_20240402_161816_216-1600x1200.jpg'),
(81, 463, 129000, 1, 0, '', ''),
(82, 394, 1299000, 1, 4, 'bagus tapi dus penyok', ''),
(82, 463, 129000, 5, 5, '', ''),
(83, 5, 2939000, 1, 5, 'AC BAGUS', ''),
(83, 461, 379000, 1, 4, '', 'upload/6661b186752f7_JBL-Tour-One-M2-6-1024x576.jpg'),
(84, 450, 899000, 1, 0, '', ''),
(85, 458, 2129000, 5, 5, '', ''),
(86, 393, 1369000, 4, 5, '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jasa_kirim`
--

CREATE TABLE `jasa_kirim` (
  `id_jasa` int(10) NOT NULL,
  `nama_jasa` varchar(99) NOT NULL,
  `harga_jasa` int(99) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `jasa_kirim`
--

INSERT INTO `jasa_kirim` (`id_jasa`, `nama_jasa`, `harga_jasa`) VALUES
(1, 'Sicepat', 24000),
(2, 'JNE', 25000),
(3, 'J&T', 23000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `keranjang`
--

CREATE TABLE `keranjang` (
  `id_barang` int(10) NOT NULL,
  `id_user` int(10) NOT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `keranjang`
--

INSERT INTO `keranjang` (`id_barang`, `id_user`, `qty`) VALUES
(390, 6, 1),
(458, 6, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `metode`
--

CREATE TABLE `metode` (
  `id_metode` int(10) NOT NULL,
  `nama_metode` varchar(99) NOT NULL,
  `harga_admin` int(10) NOT NULL,
  `va` bigint(99) NOT NULL,
  `qr` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `metode`
--

INSERT INTO `metode` (`id_metode`, `nama_metode`, `harga_admin`, `va`, `qr`) VALUES
(1, 'Bank BNI', 2000, 8241002201150001, 'assets/img/qr_others.jpg'),
(2, 'Bank BRI', 2000, 888100876543214, 'assets/img/qr_others.jpg'),
(3, 'Bank Mandiri', 2000, 89630011000001, 'assets/img/qr_others.jpg'),
(4, 'Bank BTN', 2000, 934590010000000013, 'assets/img/qr_others.jpg'),
(5, 'Dana', 2000, 85806203920, 'assets/img/qr_dana.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id_orders` int(10) NOT NULL,
  `id_user` int(10) NOT NULL,
  `id_jasa` int(10) NOT NULL,
  `id_metode` int(10) NOT NULL,
  `tanggal` datetime NOT NULL,
  `pesan` varchar(255) NOT NULL,
  `konfirmasi` varchar(99) NOT NULL,
  `status` varchar(99) NOT NULL,
  `bukti_pembayaran` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id_orders`, `id_user`, `id_jasa`, `id_metode`, `tanggal`, `pesan`, `konfirmasi`, `status`, `bukti_pembayaran`) VALUES
(33, 1, 2, 5, '2024-06-03 21:23:48', 'Sukses anjay', 'Terkonfirmasi', 'Selesai', 'upload/665dd1fe4e83e_bukti.jpg'),
(34, 2, 1, 5, '2024-06-03 21:42:06', 'pppp', 'Terkonfirmasi', 'Selesai', 'upload/665dd64711443_bukti.jpg'),
(35, 2, 1, 5, '2024-06-03 21:59:56', 'Sicepat harus cepat', 'Terkonfirmasi', 'Selesai Belum Dinilai', 'upload/665dda73b0cf5_bukti.jpg'),
(37, 1, 1, 2, '2024-06-04 16:33:35', '', 'Terkonfirmasi', 'Selesai', 'upload/665edfa8a419e_bukti.jpg'),
(38, 1, 1, 4, '2024-06-04 18:10:15', '', 'Terkonfirmasi', 'Selesai', 'upload/665ef61e49b87_bukti.jpg'),
(39, 1, 1, 2, '2024-06-04 19:31:08', '', 'Terkonfirmasi', 'Selesai', 'upload/665f0914aa4ea_bukti.jpg'),
(40, 1, 2, 5, '2024-06-04 20:37:36', 'Jangan lupa diberi plastik tambahan', 'Terkonfirmasi', 'Selesai', 'upload/665fb5ea2b8dc_bukti.jpg'),
(41, 1, 2, 2, '2024-06-04 20:42:29', '', 'Terkonfirmasi', 'Selesai', 'upload/665f1c1e64933_bukti.jpg'),
(42, 1, 1, 2, '2024-06-04 20:46:40', 'anjay', 'Terkonfirmasi', 'Selesai', 'upload/665f1ade040cf_bukti.jpg'),
(43, 1, 1, 2, '2024-06-05 07:28:37', '', 'Belum Terkonfirmasi', 'Belum Bayar', ''),
(44, 1, 1, 5, '2024-06-05 07:44:21', '', 'Terkonfirmasi', 'Selesai', 'upload/665fb5b8e97a4_bukti.jpg'),
(45, 1, 3, 2, '2024-06-05 07:50:56', 'ppp', 'Terkonfirmasi', 'Selesai', 'upload/665fb6b2c37aa_bukti.jpg'),
(46, 1, 1, 2, '2024-06-05 07:57:46', '', 'Belum Terkonfirmasi', 'Belum Bayar', ''),
(47, 1, 1, 1, '2024-06-05 08:04:26', '', 'Belum Terkonfirmasi', 'Belum Bayar', ''),
(49, 1, 1, 2, '2024-06-05 08:13:56', '', 'Belum Terkonfirmasi', 'Belum Bayar', ''),
(50, 1, 1, 2, '2024-06-05 08:18:17', '', 'Belum Terkonfirmasi', 'Belum Bayar', ''),
(51, 1, 2, 3, '2024-06-05 08:18:53', '', 'Belum Terkonfirmasi', 'Dibatalkan', ''),
(52, 1, 2, 2, '2024-06-05 08:20:49', '', 'Belum Terkonfirmasi', 'Dibatalkan', ''),
(53, 1, 2, 2, '2024-06-05 08:22:33', '', 'Terkonfirmasi', 'Selesai', 'upload/665fbdf550025_bukti.jpg'),
(54, 1, 2, 2, '2024-06-05 08:29:05', '', 'Belum Terkonfirmasi', 'Dibatalkan', ''),
(55, 1, 2, 2, '2024-06-05 09:04:09', '', 'Terkonfirmasi', 'Selesai', 'upload/665fc7bb71469_bukti.jpg'),
(56, 3, 2, 2, '2024-06-05 10:37:46', 'KAsi bonus', 'Terkonfirmasi', 'Selesai', 'upload/665fdd9e87dee_IMG_20240402_161816_216-1600x1200.jpg'),
(57, 3, 1, 2, '2024-06-05 10:48:11', '', 'Terkonfirmasi', 'Selesai', 'upload/665fe000bb4a6_ditolak.png'),
(58, 3, 2, 2, '2024-06-05 11:21:57', '', 'Terkonfirmasi', 'Selesai', 'upload/665fe7eaa7d7e_logo.png'),
(59, 4, 1, 4, '2024-06-05 15:24:52', 'harus awet', 'Terkonfirmasi', 'Selesai', 'upload/66602104cc432_videoframe_1098.png'),
(60, 4, 1, 2, '2024-06-05 15:38:47', '', 'Terkonfirmasi', 'Selesai', 'upload/6660241c6e173_logo.png'),
(61, 2, 1, 3, '2024-06-06 12:02:28', '', 'Terkonfirmasi', 'Dikirim', 'upload/666143234c6a4_bukti.jpg'),
(63, 5, 1, 2, '2024-06-06 13:02:04', 'Saya Mau Pesan Ini', 'Terkonfirmasi', 'Selesai', 'upload/666150e946add_bukti.jpg'),
(69, 1, 1, 5, '2024-06-06 13:25:30', '', 'Terkonfirmasi', 'Dikirim', 'upload/6661567a55b2d_bukti.jpg'),
(72, 5, 1, 5, '2024-06-06 14:14:16', '', 'Terkonfirmasi', 'Diajukan Refund', 'upload/66618d410b047_bukti.jpg'),
(73, 6, 3, 5, '2024-06-06 15:10:44', 'DI cek Kelengkapannya', 'Belum Terkonfirmasi', 'Belum Bayar', ''),
(74, 6, 1, 1, '2024-06-06 15:11:33', '', 'Terkonfirmasi', 'Dikirim', 'upload/66616f3f6b667_bukti.jpg'),
(75, 6, 2, 1, '2024-06-06 15:12:51', '', 'Terkonfirmasi', 'Selesai', 'upload/66616f8d45274_bukti.jpg'),
(76, 5, 3, 5, '2024-06-06 17:16:46', 'Perhatikan kelengkapannya', 'Terkonfirmasi', 'Selesai', 'upload/66618cc86e0ed_bukti.jpg'),
(77, 5, 3, 2, '2024-06-06 17:32:50', 'Perhatikan kelengkapannya', 'Belum Terkonfirmasi', 'Menunggu Konfirmasi', 'upload/6664556e8c826_bukti.jpg'),
(78, 1, 1, 2, '2024-06-06 17:42:58', '', 'Terkonfirmasi', 'Selesai', 'upload/666192d47dc33_bukti.jpg'),
(79, 5, 3, 2, '2024-06-06 17:51:08', 'Perhatikan kelengkapannya', 'Terkonfirmasi', 'Dikirim', 'upload/666194ced88ae_bukti.jpg'),
(80, 7, 1, 3, '2024-06-06 18:20:13', '', 'Terkonfirmasi', 'Selesai', 'upload/66619ba117ad4_bukti.jpg'),
(81, 7, 1, 1, '2024-06-06 18:23:14', '', 'Terkonfirmasi', 'Diajukan Retur', 'upload/66619c29183dd_bukti.jpg'),
(82, 1, 3, 3, '2024-06-06 18:34:28', 'Perhatikan kelengkapannya', 'Terkonfirmasi', 'Selesai', 'upload/66619eeff1269_bukti.jpg'),
(83, 1, 1, 3, '2024-06-06 19:52:42', '', 'Terkonfirmasi', 'Selesai', 'upload/6661b126455c4_bukti.jpg'),
(84, 6, 2, 5, '2024-06-06 21:41:17', '', 'Belum Terkonfirmasi', 'Dibatalkan', ''),
(85, 1, 2, 2, '2024-06-06 22:14:06', '', 'Terkonfirmasi', 'Selesai', 'upload/6661d24979e23_download.png'),
(86, 1, 1, 2, '2024-06-06 22:15:32', '', 'Terkonfirmasi', 'Selesai', 'upload/6661d2acece4d_NAKAMICHI MICROPHONE NAKAMICHI-NA320BLK.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_admin`
--

CREATE TABLE `tb_admin` (
  `id_admin` int(10) NOT NULL,
  `username` varchar(99) NOT NULL,
  `password` varchar(99) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_admin`
--

INSERT INTO `tb_admin` (`id_admin`, `username`, `password`) VALUES
(1, 'admin', '$2y$10$Z4vecyI3/IsnCIjFEBzYduAg4leBtsQGCSLYwfkytFmXwFqsq62um');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_barang`
--

CREATE TABLE `tb_barang` (
  `id_barang` int(10) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `harga` int(99) NOT NULL,
  `img` varchar(255) NOT NULL,
  `kategori` varchar(99) NOT NULL,
  `merk` varchar(99) NOT NULL,
  `keterangan` varchar(5000) NOT NULL,
  `stok` int(10) NOT NULL,
  `terjual` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_barang`
--

INSERT INTO `tb_barang` (`id_barang`, `nama_barang`, `harga`, `img`, `kategori`, `merk`, `keterangan`, `stok`, `terjual`) VALUES
(2, 'SHARP MESIN CUCI DAN DRYER PENGERING WASHER AND DRYERS ESFL1410DPX', 8699000, 'assets/img/cuci.jpg', 'Mesin Cuci', 'Sharp', 'Wash: 10.5Kg\r\nDryer: 7Kg\r\nSpin speed 1400Rpm\r\nJ-Tech Inverter\r\nPlasmacluster Ion Technology\r\nDelay Timer\r\nAllergant Program\r\nFragrancerogram\r\nPower Consumption: 1200 Watt\r\nPower Consumption Max: 1800 Watt', 0, 5),
(3, 'PANASONIC AC SPLIT AIR CONDITIONER INVERTER CSPU-XKJ SERIES', 4899000, 'assets/img/6637898b53784_ac.jpg', 'AC', 'Panasonic', 'Kapasitas Pendinginan : 1,5 PK\r\nEER (rated) : 12,93\r\nEER (label) : 12,44 Btu/hW\r\nVoltase : 220V\r\nArus Daya : 2,5A\r\nDaya Listrik (min-max) : 410 (190-550)W', 2, 4),
(5, 'DAIKIN 1.5 PK AC MULTI SPLIT AIR CONDITIONER CTKC35RVM4', 2939000, 'assets/img/66378b80e4239_ac-daikin.jpg', 'AC', 'Daikin', 'Harga Produk Air Conditioner adalah Unit saja.\r\nBelum termasuk Biaya Pasang, Bracket ( Outdoor ), Pipa AC, Stecker Listrik dan Pipa Pembuangan.\r\n\r\nUnit Hanya Indoor, Outdoor dijual terpisah.\r\n\r\nSPECIFICATIONS\r\n\r\n1.5 PK\r\nLevel 1 800 Watt\r\nLevel 2 1200 Watt\r\n11900 Btu/h\r\nWide Angle\r\nLow Watt Mode\r\nAuto Restart\r\nSelf Diagnosis\r\nSpace Savin\r\nEnergy Saving', 1, 5),
(9, 'INFINIX SMARTPHONE ANDROID HOT 40 PRO SERIES 2', 2199000, 'assets/img/6639c15e99662_INFINIX SMARTPHONE ANDROID HOT 40 PRO SERIES_2.199.000.jpg', 'Handphone', 'Infinix', 'p', 0, 0),
(22, 'VIEWSONIC PROJECTOR PA503XE PA503XE', 4799000, 'assets/img/VIEWSONIC PROJECTOR PA503XE PA503XE_4.799.000.jpg', 'Proyektor', 'Viewsonic', '22,000:1 contrast ratio\r\nSuperColor technology\r\n5 colour modes\r\nAuto power off\r\nVertical keystone\r\nThrow Distance: 1.19m-13.11m\r\nInput : HDMI, Audio-in(3.5mm), composite, Computer in\r\n', 0, 0),
(24, 'LENOVO GAMING LAPTOP NOTEBOOK LOQ 15APH8 AMD RYZEN 5-7640HS_12.699.000', 12699000, 'assets/img/LENOVO GAMING LAPTOP NOTEBOOK LOQ 15APH8 AMD RYZEN 5-7640HS_12.699.000.jpg', 'Laptop', 'Lenovo', 'Processor: AMD Ryzen 5-7640HS\r\nMemory Penyimpanan: SSD 512 GB\r\nRAM: 8 GB\r\nSystem Operasi: Windows 11 Home\r\nLayar: 15.6 Inch FHD IPS Anti Glare\r\nVGA: Nvidia Geforce RTX 3050 4GB \r\nFitur: Refresh Rate 144Hz, 4 Zone RGB, Backlight Keyboard, Lenovo LOQ M100 Gaming Mouse Office Home Student 2021 2 Years Warranty Premium Care + ADP', 0, 0),
(25, 'LENOVO GAMING LAPTOP NOTEBOOK LOQ 15IAX9 INTEL CORE I5-12450HX', 12999000, 'assets/img/LENOVO GAMING LAPTOP NOTEBOOK LOQ 15IAX9 INTEL CORE I5-12450HX_12.999.000.jpg', 'Laptop', 'Lenovo', 'Processor: Intel Core i5-12450HX\n Memory Penyimpanan: SSD 512 GB\n RAM: 12 GB\n System Operasi: Windows 11 Home\n Layar: 15.6 Inch FHD IPS\n VGA: Nvidia Geforce RTX 3050 6GB\n Fitur: Refresh Rate 144Hz, White Backlight Keyboard, Office Home Student 2021, 2 Years Warranty, Premium Care + ADP', 0, 0),
(26, 'HP LAPTOP NOTEBOOK 14S-DQ3111TU INTEL CELERON N4500', 4799000, 'assets/img/HP LAPTOP NOTEBOOK 14S-DQ3111TU INTEL CELERON N4500_4.799.000.jpg', 'Laptop', 'HP', 'Processor: Intel Celeron N4500\n Memory Penyimpanan: SSD 512 GB\n RAM: 8 GB\n System Operasi: Windows 11 Home\n Layar: 14 Inch LED HD\n VGA: UMA\n Fitur: Backlight Keyboard, Office Home Student 2021, 2 Years Warranty', 0, 0),
(27, 'LENOVO GAMING LAPTOP NOTEBOOK IDEAPAD GAMING 3 15ACH6 AMD RYZEN 5-5500H', 9999000, 'assets/img/LENOVO GAMING LAPTOP NOTEBOOK IDEAPAD GAMING 3 15ACH6 AMD RYZEN 5-5500H_9.999.000.jpg', 'Laptop', 'Lenovo', 'Processor: AMD Ryzen 5-5500H\n Memory Penyimpanan: SSD 512 GB\n RAM: 8 GB\n System Operasi: Windows 11 Home\n Layar: 15.6 Inch FHD IPS Anti-Glare\n VGA: Nvidia Geforce GTX 2050 4GB\n• Fitur: Refresh Rate 144Hz, Backlight Keyboard, Office Home Student 2021, 2 Years Warranty, Premium Care + ADP, Colour: Shadow Black', 0, 0),
(28, 'LENOVO GAMING LAPTOP NOTEBOOK V14 G4 AMN AMD Ryzen 3-7320U', 5699000, 'assets/img/LENOVO GAMING LAPTOP NOTEBOOK V14 G4 AMN AMD Ryzen 3-7320U_5.699.000.jpg', 'Laptop', 'Lenovo', 'Processor: AMD Ryzen 3-7320U\n Memory Penyimpanan: SSD 256 GB\n RAM: 8 GB\n System Operasi: Windows 11 Home\n Layar: 14 Inch FHD Anti Glare\n VGA: Integrated AMD Radeon Graphics\n Fitur: Office Home Student 2021', 0, 0),
(29, 'MSI GAMING LAPTOP NOTEBOOK GF63-12UCX INTEL CORE I5-12450H', 9499000, 'assets/img/MSI GAMING LAPTOP NOTEBOOK GF63-12UCX INTEL CORE I5-12450H_9.499.000.jpg', 'Laptop', 'MSI', 'Processor: Intel Core i5-12450H\n Memory Penyimpanan: SSD 512 GB\n RAM: 8 GB\n System Operasi: Windows 11 Home\n Layar: 15.6 Inch FHD IPS-Level\n VGA: Nvidia Geforce RTX 2050 4GB\n• Fitur: Refresh Rate 144Hz, 2 Years Warranty', 0, 0),
(30, 'MSI GAMING LAPTOP NOTEBOOK GF63-11UCX INTEL CORE I5-11400H', 8999000, 'assets/img/MSI GAMING LAPTOP NOTEBOOK GF63-11UCX INTEL CORE I5-11400H_8.999.000.jpg', 'Laptop', 'MSI', 'Processor: Intel Core i5-11400H\n Memory Penyimpanan: SSD 512 GB\n RAM: 8 GB\n System Operasi: Windows 11 Home\n Layar: 15.6 Inch FHD IPS-Level\n VGA: Nvidia Geforce RTX 2050 4GB\n• Fitur: Backlight Keyboard, 2 Years Warranty', 0, 0),
(31, 'MSI GAMING LAPTOP NOTEBOOK THIN 15 B13UC INTEL CORE I5-13420H', 11999000, 'assets/img/MSI GAMING LAPTOP NOTEBOOK THIN 15 B13UC INTEL CORE I5-13420H_11.999.000.jpg', 'Laptop', 'MSI', 'Processor: Intel Core i5-13420H\n• Memory Penyimpanan: SSD 512 GB\n RAM: 8 GB DDR4\n System Operasi: Windows 11 Home\n Layar: 15.6 Inch FHD IPS-Level\n VGA: Nvidia Geforce RTX 3050 4GB\n Fitur: Refresh Rate 144Hz, Backlight Keyboard, 2 Years Warranty', 0, 0),
(32, 'MSI GAMING LAPTOP NOTEBOOK BRAVO 15 B7ED AMD RYZEN 5-7535HS', 9999000, 'assets/img/MSI GAMING LAPTOP NOTEBOOK BRAVO 15 B7ED AMD RYZEN 5-7535HS_9.999.000.jpg', 'Laptop', 'MSI', 'Processor: AMD Ryzen 5-7535HS\n Memory Penyimpanan: SSD 512 GB\n RAM: 8 GB\n System Operasi: Windows 11 Home\n Layar: 15.6 Inch FHD IPS-Level\n VGA: AMD Radeon RX6550M 4GB\n• Fitur: Refresh Rate 144Hz, Backlight Keyboard, 2 Years Warranty', 0, 0),
(33, 'HP GAMING LAPTOP NOTEBOOK VICTUS 16-R0052TX INTEL CORE I7-13700HX', 20099000, 'assets/img/HP GAMING LAPTOP NOTEBOOK VICTUS 16-R0052TX INTEL CORE I7-13700HX_20.099.000.jpg', 'Laptop', 'HP', 'Processor: Intel Core i7-13700HX\n Memory Penyimpanan: SSD 1 TB\n RAM: 2 x 8 GB\n System Operasi: Windows 11 Home\n Layar: 16.1 Inch FHD IPS\n VGA: Nvidia Geforce RTX 4060 8GB\n• Fitur: Refresh Rate 165Hz, Backlight Keyboard, Office Home Student 2021', 0, 0),
(34, 'HP LAPTOP NOTEBOOK 14S-FQ1011AU AMD RYZEN 3-5300U', 6199000, 'assets/img/HP LAPTOP NOTEBOOK 14S-FQ1011AU AMD RYZEN 3-5300U_6.199.000.jpg', 'Laptop', 'HP', 'Processor: AMD Ryzen 3-5300U\n Memory Penyimpanan: SSD 512 GB\n RAM: 2 x 4 GB\n System Operasi: Windows 11 Home\n Layar: 14 Inch FHD IPS\n VGA: Integrated AMD Radeon Graphics\n Fitur: Backlight Keyboard, Office Home Student 2021', 0, 0),
(35, 'HP LAPTOP NOTEBOOK 14S-DQ5118TU INTEL CORE I5-1235U', 8599000, 'assets/img/HP LAPTOP NOTEBOOK 14S-DQ5118TU INTEL CORE I5-1235U_8.599.000.jpg', 'Laptop', 'HP', 'Processor: Intel Core i5-1235U\n Memory Penyimpanan: SSD 512 GB\n RAM: 8 GB\n System Operasi: Windows 11 Home\n Layar: 14 Inch FHD IPS\n VGA: Integrated Intel Iris Xe Graphics\n Fitur: Backlight Keyboard, Office Home Student 2021, Colour: Silver', 0, 0),
(36, 'ASUS GAMING LAPTOP NOTEBOOK TUF FA506NC-R535B3T-OE AMD RYZEN 5-7535HS', 11999000, 'assets/img/ASUS GAMING LAPTOP NOTEBOOK TUF FA506NC-R535B3T-OE AMD RYZEN 5-7535HS_11.999.000.jpg', 'Laptop', 'ASUS', 'Processor: AMD Ryzen 5-7535HS\nMemory Penyimpanan: SSD 512GB\nRAM: 16GB\nSystem Operasi: Windows 11 Home\nLayar: 15.6 Inch FHD\nVGA: Nvidia GeForce RTX3050 4GB\nFitur: Refresh Rate 144Hz, Backlight Keyboard, Office Home Student 2021, 2 Years Global Warranty', 0, 0),
(37, 'DELL LAPTOP NOTEBOOK VOSTRO V3430 INTEL CORE I5-1335U', 10899000, 'assets/img/DELL LAPTOP NOTEBOOK VOSTRO V3430 INTEL CORE I5-1335U_10.899.000.jpg', 'Laptop', 'Dell', 'Processor: Intel Core i5-1335U\nMemory Penyimpanan: SSD 512GB\nRAM: 8GB\nSystem Operasi: Windows 11 Home\nLayar: 14 Inch FHD Anti-glare\nVGA: Integrated Intel UHD Graphics\nFitur: Office Home Student 2021, 2 Years Warranty, Premium Support and Onsite Service', 0, 0),
(38, 'ASUS LAPTOP NOTEBOOK VIVOBOOK A416MAO-FHD427 INTEL CELERON N4020', 4699000, 'assets/img/ASUS LAPTOP NOTEBOOK VIVOBOOK A416MAO-FHD427 INTEL CELERON N4020_4.699.000.jpg', 'Laptop', 'ASUS', 'Processor: Intel Celeron N4020\nMemory Penyimpanan: SSD 256GB\nRAM: 8GB\nSystem Operasi: Windows 11 Home\nLayar: 14 Inch FHD\nVGA: UMA\nFitur: Office Home Student 2021', 0, 0),
(39, 'ACER LAPTOP NOTEBOOK ASPIRE 3 A314-35-C701 INTEL CELERON N5100', 4999000, 'assets/img/ACER LAPTOP NOTEBOOK ASPIRE 3 A314-35-C701 INTEL CELERON N5100_4.999.000.jpg', 'Laptop', 'Acer', 'Processor: Intel Celeron N5100\nMemory Penyimpanan: SSD 512GB\nRAM: 8GB\nSystem Operasi: Windows 11 Home\nLayar: 14 Inch HD\nVGA: UMA\nFitur: Office Home Student 2021', 0, 0),
(40, 'DELL LAPTOP NOTEBOOK INSPIRON 5430 INTEL CORE I5-1335U', 11699000, 'assets/img/DELL LAPTOP NOTEBOOK INSPIRON 5430 INTEL CORE I5-1335U_11.699.000.jpg', 'Laptop', 'Dell', 'Processor: Intel Core i5-1335U\nMemory Penyimpanan: SSD 512GB\nRAM: 8GB\nSystem Operasi: Windows 11 Home\nLayar: 14 Inch FD+ (1920x1200) Anti Glare\nVGA: Integrated Intel Iris Xe Graphics\nFitur: Office Home Student 2021, 2 Years Warranty, Premium Support and Onsite Service', 0, 0),
(41, 'ASUS LAPTOP NOTEBOOK ZENBOOK UM3402YA-OLEDS552 AMD RYZEN 5-5625U', 10499000, 'assets/img/ASUS LAPTOP NOTEBOOK ZENBOOK UM3402YA-OLEDS552 AMD RYZEN 5-5625U_10.499.000.jpg', 'Laptop', 'ASUS', 'Processor: AMD Ryzen 5-5625U\nMemory Penyimpanan: SSD 512GB\nRAM: 8GB LPDDR4X\nSystem Operasi: Windows 11 Home\nLayar: 14 Inch 2.8K (2880 x 1800) OLED 100% DCI-P3\nVGA: Integrated AMD Radeon Graphics\nFitur: Backlight Keyboard, Refresh Rate 90Hz, Fingerprint, NumberPad, Office Home Student 2021', 0, 0),
(42, 'ACER LAPTOP NOTEBOOK ASPIRE 5 A514-55-74ZR INTEL CORE I7-1255U', 9999000, 'assets/img/ACER LAPTOP NOTEBOOK ASPIRE 5 A514-55-74ZR INTEL CORE I7-1255U_9.999.000.jpg', 'Laptop', 'Acer', 'Processor: Intel Core i7-1255U\nMemory Penyimpanan: SSD 512GB\nRAM: 8GB\nSystem Operasi: Windows 11 Home\nLayar: 14 Inch FHD\nVGA: Integrated Intel Iris Xe Graphics\nFitur: Backlight Keyboard, Fingerprint, Office Home Student 2021', 0, 0),
(43, 'ASUS LAPTOP NOTEBOOK VIVOBOOK E1404FA-FHD321 AMD RYZEN 3-7320U', 5999000, 'assets/img/ASUS LAPTOP NOTEBOOK VIVOBOOK E1404FA-FHD321 AMD RYZEN 3-7320U_5.999.000.jpg', 'Laptop', 'ASUS', 'Processor: AMD Ryzen 3-7320U\nMemory Penyimpanan: SSD 256GB\nRAM: 8GB\nSystem Operasi: Windows 11 Home\nLayar: 14 Inch FHD\nVGA: UMA\nFitur: Office Home Student 2021', 0, 0),
(44, 'EPSON XGA 3LCD PROYECTOR EB-X06_ACK', 5499000, 'assets/img/EPSON XGA 3LCD PROYECTOR EB-X06_ACK_5.499.000.jpg', 'Projector', 'Epson', 'Projection Technology: RGB liquid crystal shutter projection system (3LCD)\nWhite Light Output (Normal/Eco): 3,600 lm\nUSB Interface: USB Type A: 1 (For Wireless LAN, Firmware Update, Copy OSD Settings) | USB Type B: 1 (For Firmware Update, Copy OSD Settings)\n3LCD technology for true-to-life Color Brightness\nNative XGA resolution and 4:3 performance\nLong lamp life up to 12,000 hours in ECO Mode\nEasy setup and positioning flexibility HDMI connectivity', 0, 0),
(45, 'BENQ LCD PROJECTOR W4000I', 49999000, 'assets/img/BENQ LCD PROJECTOR W4000I_49.999.000.jpg', 'Projector', 'BenQ', '100% DCI-P3 & 100% Rec.709 with CinematicColor out-of-box accurate colors\nHDR-PRO exclusive Local Contrast Enhancer and Tone Mapping for perfect details in dark and bright scenes\nCertified Android TV, 2D lens shift and 1.3X big zoom', 0, 0),
(46, 'EPSON XGA 3LCD PROYECTOR EB-X06', 6649000, 'assets/img/EPSON XGA 3LCD PROYECTOR EB-X06_6.649.000.jpg', 'Projector', 'Epson', 'Projection Technology: RGB liquid crystal shutter projection system (3LCD)\nWhite Light Output (Normal/Eco): 3,600 lm\nUSB Interface: USB Type A: 1 (For Wireless LAN, Firmware Update, Copy OSD Settings) | USB Type B: 1 (For Firmware Update, Copy OSD Settings)\n3LCD technology for true-to-life Color Brightness\nNative XGA resolution and 4:3 performance\nLong lamp life up to 12,000 hours in ECO Mode\nEasy setup and positioning flexibility HDMI connectivity', 0, 0),
(47, 'BENQ LCD PROJECTOR MW560_GT', 7219000, 'assets/img/BENQ LCD PROJECTOR MW560_GT_7.219.000.jpg', 'Projector', 'BenQ', '4000 ANSI Lumen High Brightness; 20,000:1 High Contrast\nWXGA (1280 x 800 pixel) resolusi | Mode Infografis Eksklusif Menampilkan Teks dan Grafik secara Detail\nMode SmartEco Menghemat Daya Lampu Hingga 70%', 0, 0),
(48, 'BENQ LCD PROJECTOR MX550_GT', 5749000, 'assets/img/BENQ LCD PROJECTOR MX550_GT_5.749.000.jpg', 'Projector', 'BenQ', 'Projection System: DLP\nResolution: XGA(1024x 768)\nBrightness (ANSI lumens): 3600\nContrast Ratio (FOFO): 20,000:1\nLight Source Wattage: 200W\nZoom Ratio: 1.1X\nSpeaker: 2W\nTypical Power Consumption: 270W', 0, 0),
(49, 'BENQ LCD PROJECTOR MS550_GT', 4999000, 'assets/img/BENQ LCD PROJECTOR MS550_GT_4.999.000.jpg', 'Projector', 'BenQ', '3600 ANSI Lumen High Brightness for Stunning Presentations\n20,000:1 High Native Contrast for Crisp Readability\nDual HDMI inputs for multiplatform digital connectivity\nResolution SVGA(800x 600)\nDisplay Color 1.07 Billion Colors\nLight Source Lamp\nLight Source Wattage 200W\nZoom Ratio 1.1X', 0, 0),
(50, 'VIEWSONIC PROJECTOR PA503XE PA503XE', 4799000, 'assets/img/VIEWSONIC PROJECTOR PA503XE PA503XE_4.799.000.jpg', 'Projector', 'ViewSonic', '22,000:1 contrast ratio\nSuperColor™ technology\n5 colour modes\nAuto power off\nVertical keystone\nThrow Distance: 1.19m-13.11m\nInput: HDMI, Audio-in(3.5mm), composite, Computer in', 0, 0),
(51, 'ACER LCD PROJECTOR X1', 5399000, 'assets/img/ACER LCD PROJECTOR X1_5.399.000.jpg', 'Projector', 'Acer', 'XGA (1024X768)\nDLP (Projector System)\n4.000 Lumens (Brightness)\nLamp Life 6.000 Hours\nContrast Ratio 20.000 : 1\nSpeaker Mono 3 Watt\nInput Interface 1x Analog RGB, 1x HDMI, 1x PC Audio, 1x Composite', 0, 0),
(52, 'ACER LCD PROJECTOR MR.JUK11.00H', 6149000, 'assets/img/ACER LCD PROJECTOR MR.JUK11.00H_6.149.000.jpg', 'Projector', 'Acer', 'Resolution WXGA (1,280 x 800)\nMaximum WUXGA (1,920 x 1,200)\nBrightness 4,800 ANSI Lumens (Standard), 3,200ANSI Lumens (ECO) (Compliant with ISO 21118 standard)\nAspect ratio 16:10 (Native), 4:3/16:9 (Supported)\nContrast Ratio: 20,000:1\nLamp life 5,000 Hours (Standard), 10,000 Hours (ECO), 15,000 Hours (ExtremeEco)', 0, 0),
(53, 'OPTOMA LCD PROJECTOR X400LVE', 4749000, 'assets/img/OPTOMA LCD PROJECTOR X400LVE_4.749.000.jpg', 'Projector', 'Optoma', 'Display technology: DLP\nResolution: XGA (1024x768)\nBrightness: 4,000 lumens\nContrast ratio: 25,000:1\nNative aspect ratio: 4:3\nAspect ratio - compatible: 16:9\nHorizontal scan rate: 15.38 ~ 91.15Khz\nScreen size: 27.78\"\" ~ 304.4\"\" diagonal\nPower consumption (max): 225W', 0, 0),
(54, 'SPC LCD PROJECTOR P100 SPC-P100', 5479000, 'assets/img/SPC LCD PROJECTOR P100 SPC-P100_5.479.000.jpg', 'Projector', 'SPC', 'DLP Technology\nResolusi Native: XGA (1024 x 768)\nBrightness: 4200 ANSI Lumens\nAspect Ratio 4:3 (Native)\nInput port: VGA/HDMI/Composite video (RCA)/Audio in/Audio Out', 0, 0),
(55, 'EPSON WXGA 3LCD PROJECTOR EB-W51_MT', 8349000, 'assets/img/EPSON WXGA 3LCD PROJECTOR EB-W51_MT_8.349.000.jpg', 'Projector', 'Epson', 'Resolution: WXGA (1280 x 800)\nProjection Technology: RGB liquid crystal shutter projection system (3LCD)\nColor Brightness: 4000 lumens\nWhite Brightness: 4000 lumens\nContrast Ratio: 16,000:1\nUSB Type A: 1 (For Wireless LAN, Firmware Update, Copy OSD Settings)\nUSB Type B: 1 (For Firmware Update, Copy OSD Settings)\nHDMI: 1', 0, 0),
(56, 'ACER LCD PROJECTOR UP.JVXSD.006', 5399000, 'assets/img/ACER LCD PROJECTOR UP.JVXSD.006_5.399.000.jpg', 'Projector', 'Acer', 'Resolution: Native XGA (1,024x768)\nBrightness: 4,000 ANSI Lumens\nProjection System: DLP®\nContrast Ratio: 20,000:1', 0, 0),
(57, 'EPSON XGA 3LCD PROJECTOR EB-E500_MT', 5749000, 'assets/img/EPSON XGA 3LCD PROJECTOR EB-E500_MT_5.749.000.jpg', 'Projector', 'Epson', 'Resolution: XGA (1024 x 768)\nProjection Technology: RGB liquid crystal shutter projection system (3LCD)\nBrightness White Light Output (Normal/Eco): 3,300 lm\nBrightness Colour Light Output: 3,300 lm\nLamp Life 6.000 Hours\nDigital Input HDMI: 1\nLCD Size: 0.55”\nContrast Ratio 15.000 : 1\nScreen Size 22 Inch/0.87 - 10.34 m\nPower consumption 327 Watt', 0, 0),
(58, 'EPSON XGA 3LCD PROJECTOR EB-X51_ACK', 6299000, 'assets/img/EPSON XGA 3LCD PROJECTOR EB-X51_ACK_6.299.000.jpg', 'Projector', 'Epson', 'Resolution: XGA (1024X768)\nProjection Technology: RGB liquid crystal shutter projection system (3LCD)\n3,800 Lumens (Brightness)\nLamp Life 6.000 Hours\nHDMI\nWith LCD 0.55Inch\nSpeaker 2W\nContrast Ratio 16.000 : 1\n327 Watt\nScreen Size 30 Inch/1.07 - 10.95 m', 0, 0),
(59, 'BENQ LCD PROJECTOR MX560_GT', 6459000, 'assets/img/BENQ LCD PROJECTOR MX560_GT_6.459.000.jpg', 'Projector', 'BenQ', 'Tingkat Kecerahan Tinggi 4000 ANSI Lumen dan Kontras Tinggi 20,000:1\nMode Infografis Eksklusif Menampilkan Teks dan Grafik secara Detail\nMode SmartEco Mampu Menghemat Lamp Power Hingga 70%', 0, 0),
(60, 'SAMSUNG SMART TV PROJECTOR SP-LFF3CLAXXXD', 9199000, 'assets/img/SAMSUNG SMART TV PROJECTOR SP-LFF3CLAXXXD_9.199.000.jpg', 'Projector', 'Samsung', 'Picture Engine: Crystal Engine\nHDR (High Dynamic Range): Yes\nFilm Mode: Yes\nAudio Dolby Digital Plus: MS12 2ch\nSpeaker Type: 360 Degrees\nBluetooth Audio: Yes\nOperating System: Tizen\nWeb Browser: yes\nPort HDMI: 1 (Micro)\nBluetooth: Yes (BT5.2)\nPower Consumption (Max): 50 Watt', 0, 0),
(61, 'EPSON XGA 3LCD PROJECTOR EB-X500', 6149000, 'assets/img/EPSON XGA 3LCD PROJECTOR EB-X500_6.149.000.jpg', 'Projector', 'Epson', 'XGA (1024X768)\n3LCD (Projector System)\nRGB Liquid Crystal Shutter\n3.600 Lumens (Brightness)\nLamp Life 6.000 Hours\nHDMI\nWith LCD 0.55Inch\nSpeaker 2W\nContrast Ratio 16.000 : 1\n327 Watt\nScreen Size 30 Inch/1.07 - 10.95 m', 0, 0),
(62, 'EPSON XGA 3LCD PROJECTOR EB-X51', 6299000, 'assets/img/EPSON XGA 3LCD PROJECTOR EB-X51_6.299.000.jpg', 'Projector', 'Epson', 'Resolution: XGA (1024X768)\nProjection Technology: RGB liquid crystal shutter projection system (3LCD)\n3.800 Lumens (Brightness)\nLamp Life 6.000 Hours\nHDMI\nWith LCD 0.55Inch\nSpeaker 2W\nContrast Ratio 16.000 : 1\n327 Watt\nScreen Size 30 Inch/1.07 - 10.95 m', 0, 0),
(63, 'EPSON XGA 3LCD PROJECTOR EB-E01_MT', 5349000, 'assets/img/EPSON XGA 3LCD PROJECTOR EB-E01_MT_5.349.000.jpg', 'Projector', 'Epson', 'Projection Technology: RGB liquid crystal shutter projection system (3LCD)\nWhite Light Output (Normal/Eco): 3,300 lm\nColour Light Output: 3,300 lm\nUSB Interface: USB Type B: 1 (For Firmware Update, Copy OSD Settings)\nAnalog Input: D-Sub 15pin: 1\nDigital Input: HDMI: 1\nLCD: Native Resolution: XGA (1024 x 768) | Size: 0.55” (C2fine)\nLightsource: Type: 210W UHE | Life (Normal / Eco): 6,000 / 12,000 hours\nAspect Ratio: 4:3\nBrightness Range Lumens, Projectors Facets: 2000', 0, 0),
(64, 'POLYTRON MULTIMEDIA SPEAKER PMA9523/W', 799000, 'assets/img/POLYTRON MULTIMEDIA SPEAKER PMA9523W_799.000.jpg', 'Speaker', 'Polytron', '2.1ch Multimedia Speaker\nBazzoke (Extra Bass)\nLED Display\nBass & Treble Control\nAmbient Light\nBluetooth Connection v5\nSupported with Polytron Audio Connect App\nUSB, SD Card/MMC, Aux, Line Input\nFM Radio\n2 Mic Input with Echo Control\nRemote Control\nPower Output: 100 WRMS', 0, 0),
(65, 'ROADMASTER SPEAKER AKTIF PA-121', 1599000, 'assets/img/ROADMASTER SPEAKER AKTIF PA-121_1.599.000.jpg', 'Speaker', 'Roadmaster', 'Bluetooth 5.0 Ready\nBluetooth True Wireless Sistem Technology\nUSB/Micro SD (MP3) Playback\nFM Digital Radio with remote\nRechargeable Battery\nTrolley Speaker\nIncluded 2 mic UHF wireless\n12 inch single woofer, 3 inch Mid Range, 1 inch Super Tweeter\n35.000 PMPO\n25 W RMS', 0, 0),
(66, 'POLYTRON MULTIMEDIA SPEAKER PMA9521B', 699000, 'assets/img/POLYTRON MULTIMEDIA SPEAKER PMA9521B_699.000.jpg', 'Speaker', 'Polytron', '2.1 Channel Multimedia Speaker\nSubwoofer 5\", Midrange of Satellite Speaker 3\"\nLED Display\nUSB (from flash disk & laptop/PC), S Card/MMC, Aux, Line Input\nFM Radio\nBass & Treble Control\n50 Watt\nAmbient Light\nBazzoke (Extra Bass)\nSurround Mode\nBluetooth Connection v5\nSupported with Polytron Audio Connect\nAudio Power Output: 80 Watt', 0, 0),
(67, 'SHARP SPEAKER AKTIF CBOX-TRB10MBO', 1299000, 'assets/img/SHARP SPEAKER AKTIF CBOX-TRB10MBO_1.299.000.jpg', 'Speaker', 'Sharp', 'Speaker Type: Trolley Serie\nAmplifier System: 3-way speaker system\nFrequency Response: Active\nInput Impedance: 50K Ohms\nInput Sensitivity: 600 mV\nX-Bass: Yes\nBass: Yes\nTreble: Yes\nMic Input: 1 Terminal\nMic Control: Mic Volume, Echo\nWoofer: 25.4cm (10\"), 4 Ohm, 50W\nMidrange: 7.5cm (3\"), 4 Ohm, 30W\nTweeter: 2.5cm (1\"), 25W\nAudio Output: 1 x 25 W (RMS) / 3000 W PMPO\nPower System: AC 100-240V ~ 50/60Hz ; DC 9V (1500mA)\nPower Supply: 11 W\nPower Consumption: 50 W\nPower Output: 1 x 25 W (RMS) / 3000 W PMPO', 0, 0),
(68, 'JBL SPEAKER AKTIF PARTYBOX 710', 8599000, 'assets/img/JBL SPEAKER AKTIF PARTYBOX 710_8.599.000.jpg', 'Speaker', 'JBL', 'Daya Keluaran (W): 800\nDynamic frequency response range (Hz): 35Hz – 20kHz (-6dB )\nBluetooth profiles: A2DP V1.3, AVRCP V1.6\nBluetooth frequency: 2400 MHz – 2483.5 MHz\nBluetooth transmitted modulation: GFSK, π/4 DQPSK, 8DPSK\nBluetooth transmitter power: ≤ 11dBm\nVersi Bluetooth: 5.1', 0, 0),
(69, 'SHARP SPEAKER AKTIF PARTY PS-925', 1699000, 'assets/img/SHARP SPEAKER AKTIF PARTY PS-925_1.699.000.jpg', 'Speaker', 'Sharp', 'Amplifier System: Active\nX-Bass: Yes\nBass: On Equalizer Set\nTreble: On Equalizer Set\nMic Input: 2 Ports\nMic Control: Yes\nAudio Output: 44 Watt RMS\nPower Supply: AC 100 - 240 Volt, 50 / 60 Hz', 0, 0),
(70, 'SONY WIRELESS PORTABLE SPEAKER XB23 BLACK', 1299000, 'assets/img/SONY WIRELESS PORTABLE SPEAKER XB23 BLACK_1.299.000.jpg', 'Speaker', 'Sony', 'Tipe Speaker: Rentang Penuh\nMode Suara: Clear Audio+, DSEE, EXTRA BASS TM , MODE STAMINA\nHands-Free Function: Yes\nSistem Komunikasi: Bluetooth Versi 5.0\nProfil Kompatibel: A2DP/AVRCP/HSP/HFP/SPP\nKodek yang di dukung: SBC, AAC, LDAC\nMasa Pakai: Sekitar 12 jam\nDaya Konsumsi: Sekitar 0,3 W', 0, 0),
(71, 'SHARP SPEAKER AKTIF PARTY PS-930', 1989000, 'assets/img/SHARP SPEAKER AKTIF PARTY PS-930_1.989.000.jpg', 'Speaker', 'Sharp', 'Model: Party Speaker System\nSpeaker Type: 1-way type light-up speaker system\nAmplifier System: Active\nX-Bass: Yes\nBass: On Equalizer Set\nTreble: On Equalizer Set\nMic Input: 2 Ports\nMic Control: Yes\nWoofer: 6.5”\nAudio Output: 80 Watt RMS\nPower Supply: AC 100 - 240 Volt, 50 / 60 Hz\nPower Consumption: DC-12V, 7,2aH rechargeable Battery', 0, 0),
(72, 'Polytron Bluetooth Speaker Aktif Karaoke PPS8L22', 1759000, 'assets/img/Polytron Bluetooth Speaker Aktif Karaoke PPS8L22_1.759.000.jpg', 'Speaker', 'Polytron', 'Tipe: PPS 8L22\nBattery Life: up to 14 Hour\nSpeaker System: 2 Way\nFM Radio: Yes\nMicrophone: 1\nBluetooth: Yes / Version 5.0\nDual Power (AC & Battery)\nBattery Life up to 14 Hours\nAnimation Light\nTWS Connection\nFree 1 Multi Channel WIRELESS MIC\nBluetooth Connection v5\nSupported with Polytron Audio Connect App\nPower Output: 60 Watt RMS', 0, 0),
(73, 'JBL SPEAKER AKTIF PARTY BOX ENCORE', 4999000, 'assets/img/JBL SPEAKER AKTIF PARTY BOX ENCORE_4.999.000.jpg', 'Speaker', 'JBL', 'Daya Keluaran (W): 100\nDynamic frequency response range (Hz): 50 Hz - 20k Hz @-6dB\nBluetooth profiles: A2DP 1.3, AVRCP 1.6\nBluetooth frequency: 2.4 GHz - 2.4835 GHz\nBluetooth transmitted modulation: GFSK, π/4 DQPSK, 8DPSK\nBluetooth transmitter power: < 9 dBm (EIRP)\nVersi Bluetooth: 5.1\nLama Pengisian Daya (jam): 3.5\nWaktu Bermain Musik (jam): 10', 0, 0),
(74, 'Polytron Bluetooth Speaker Aktif Karaoke PAS8BF28', 1839000, 'assets/img/Polytron Bluetooth Speaker Aktif Karaoke PAS8BF28_1.839.000.jpg', 'Speaker', 'Polytron', 'Tipe: PAS 8BF28\nPower Input Main Unit PS: 220V~ 50/60Hz\nPower Input Main Unit PC: 80 W\nAudio System: 2.0 Channel\nPower Output Front: 2 x 100 Watt RMS\nSpeaker Spec System: 3-Way, Double Woofer\nSpeaker Spec Tweeter: 1\" 6 Ohm 50 Watt RMS\nSpeaker Spec Front Midrange: 5\" 4 Ohm 50 Watt RMS\nSpeaker Spec Subwoofer: 2 X 8\" 8 Ohm 40 Watt RMS\nBluetooth: V2\nPolytron Audio Connect: Yes\nUSB Input: Yes\nSD Card MMC IN: Yes\nAUX Input: Yes\nLine Input: Yes\nFM Radio: Yes\nDisplay: LED Display 7 Segment 5 DIGIT\nMicrophone: 2\nMic Level Control: Analog\nEcho Control: Analog\nVolume: Digital\nPreset Equalizer Mode: Classic, Flat, Jazz, Outdoor, Pop, Rock, User with 5-Band Equalizer\nSuper Bass: Digital', 0, 0),
(75, 'Polytron Bluetooth Speaker Multimedia PMA9321B', 599000, 'assets/img/Polytron Bluetooth Speaker Multimedia PMA9321B_599.000.jpg', 'Speaker', 'Polytron', 'Power Input main unit Source: 220V~ 50/60Hz\nPower Input main unit Consumption: 30 W\nAudio System: 2.1 Channel\nPower Output Front: 2 X 6 Watt RMS\nPower Output Subwoofer: 21 Watt RMS\nSpeaker Spec System: 1-Way\nSpeaker Spec Front Midrange: 3\" 4Ω 10 Watt RMS\nSpeaker Spec Subwoofer: 5\" 6Ω 30 Watt RMS\nBluetooth: V2\nDisplay: LED Display 7 Segment 5 DIGIT\nVolume: Digital\nPreset Equalizer Mode: Flat, Rock, Pop, Jazz, Classic, Outdoor, User with 3-Band Digital Tone Control\nBazzoke: Digital\nBass: Digital\nTreble: Digital', 0, 0),
(76, 'SONY WIRELESS PORTABLE SPEAKER XB33 BLUE', 1849000, 'assets/img/SONY WIRELESS PORTABLE SPEAKER XB33 BLUE_1.849.000.jpg', 'Speaker', 'Sony', 'TIPE SPEAKER: Rentang Penuh\nMODE SUARA: Clear Audio+, DSEE, LIVE SOUND, EXTRA BASS TM, MODE STAMINA\nNFC: Ya\nHANDS-FREE FUNCTION: Ya\nSISTEM KOMUNIKASI: Bluetooth Versi 5.0\nPROFIL KOMPATIBEL: A2DP/AVRCP/HSP/HFP\nRENTANG TRANSMISI FREKUENSI: 20 Hz – 20.000 Hz (sampel 44,1 kHz)\nKODEK YANG DIDUKUNG: SBC, AAC, LDAC\nTERMINAL INPUT DAN OUTPUT: USB A (hanya untuk DC OUT)\nMASA PAKAI BATERAI: Sekitar 24 jam\nKONSUMSI DAYA: Sekitar 7,5 W\nPORT DAYA USB UNTUK SMARTPHONE: USB A (5V 1A)', 0, 0),
(77, 'JBL WIRELESS PORTABLE SPEAKER CLIP 3 SERIES', 799000, 'assets/img/JBL WIRELESS PORTABLE SPEAKER CLIP 3 SERIES_799.000.jpg', 'Speaker', 'JBL', 'Daya Keluaran (W): 3.3\nWaktu Bermain Musik (jam): 10\nVersi Bluetooth: 4.1\nTahan Air\nSpeakerphone\nBluetooth\nKabel Audio Input 3.5 mm\nMematikan daya secara otomatis\nKapasitas baterai (mAh): 1.000\nLama Pengisian Daya (jam): 3', 0, 0),
(78, 'Polytron Bluetooth Speaker Multimedia Karaoke PMA9522B', 849000, 'assets/img/Polytron Bluetooth Speaker Multimedia Karaoke PMA9522B_849.000.jpg', 'Speaker', 'Polytron', 'Power Input Main Unit Source: 220V~ 50/60Hz\nAudio System: 2.1 Channel\nPower Output Front: 2 X 30 Watt RMS\nPower Output Subwoofer: 80 Watt RMS\nSpeaker Spec System: 1-Way\nSpeaker Spec Front Midrange: 3\" 4Ω 10 Watt RMS\nSpeaker Spec Subwoofer: 6,5\" 6Ω 50 Watt RMS\nDisplay: LED Display 7 Segment 5 DIGIT\nMicrophone: 2\nMic Level Control: Analog\nEcho Control: Analog\nVolume: Digital\nBazzoke: Digital\nBass: Analog\nTreble: Analog', 0, 0),
(79, 'SONY WIRELESS PORTABLE SPEAKER XB13 SERIES', 599000, 'assets/img/SONY WIRELESS PORTABLE SPEAKER XB13 SERIES_599.000.jpg', 'Speaker', 'Sony', 'Diameter of Speaker Unit(Mono Speaker): 46mm\nWireless Connections: Yes\nBluetooth: Version 4.2\nMax. Communication Range: 10m\nInput and Output terminal: USB Type-C\nBattery Life: Approx. 16H', 0, 0),
(80, 'SONY WIRELESS PORTABLE SPEAKER XE300 SERIES', 2349000, 'assets/img/SONY WIRELESS PORTABLE SPEAKER XE300 SERIES_2.349.000.jpg', 'Speaker', 'Sony', 'Suara lebih lebar dengan Line-Shape Diffuser\nX-Balanced Speaker Unit untuk suara yang kuat dan jernih\nTahan air dan tahan debu IP67\nMasa pakai baterai 24 jam dan pengisian daya cepat\nUkuran portabel yang dapat Anda bawa ke mana saja', 0, 0),
(81, 'JBL PERSONAL SPEAKER PULSE 4 SERIES', 2249000, 'assets/img/JBL PERSONAL SPEAKER PULSE 4 SERIES_2.249.000.jpg', 'Speaker', 'JBL', '12 Hours of Playtime\nIPX7 waterproof\n360 Degree Lightshow and Sound\nJBL Partyboost', 0, 0),
(82, 'SONY SPEAKER AKTIF PARTY X-SERIES SRS-XV800', 8699000, 'assets/img/SONY SPEAKER AKTIF PARTY X-SERIES SRS-XV800_8.699.000.jpg', 'Speaker', 'Sony', 'Tipe Speaker: 2 arah, bass reflex\nJumlah Speaker: 3 unit Tweeter, 2 Unit Woofer, 2 Unit Tweeter Belakang\nX-balanced Speaker Unit: Unit Woofer\nMode Suara: Clear Audio+, Mega Bass, Volume Step S1, DSEE, EQ band 3 kostum, Live Sound, TV Sound Booster\nBluetooth: Versi 5.2\nProfil yg Kompatibel: Antarmuka (A2DP), Antarmuka (AVRCP), Antarmuka (SPP)\nFungsi tambahkan speaker: Stereo Pair, Party Connect\nCodec yg di dukung: SBC, AAC, LDAC\nJarak Transmisi Frekuensi: 20 Hz - 20.000 Hz (sampel 44,1 kHz)\nRentang Frekuensi: 2,4 GHz\nTerminal Input dan Output: Jack(IN) Stereo Mini, USB A, Input Digital Optik, Input Mikrofon, Input Gitar/MIC\nAplikasi Smartphone yg kompatibel: Sony | Music Center/Fiestable\nMasa pakai baterai: Sekitar 25 Jam\nSuplai Daya: AC 120-240 V, 50/60 Hz, dapat diisi ulang secara manual\nPort Daya USB untuk smartphone: USB A(5V 1,5A)\nKonsumsi Daya: Sekitar 77 W\nPerlindungan Terhadap Air: IPX4(saat diposisikan secara vertikal), IPX2(saat diposisikan secara horizontal)', 0, 0),
(83, 'SONY WIRELESS PORTABLE SPEAKER XG300 SERIES', 3999000, 'assets/img/SONY WIRELESS PORTABLE SPEAKER XG300 SERIES_3.999.000.jpg', 'Speaker', 'Sony', 'Powerful Party Sound\nX-Balanced Speaker Unit\nBluetooth® Connection and Fast Pair\n25 hours battery\nQuick charging will give you 70 minutes of play on just a 10 minute charge\nIP67 water resistant and rustproof\nRetractable handle', 0, 0),
(84, 'POLYTRON LCD PROYEKTOR PROJECTOR PLP71LHM', 1699000, 'assets/img/665a0702967d7_POLYTRON LCD PROYEKTOR PROJECTOR PLP71LHM_1.699.000.jpg', 'Projector', 'Polytron', 'Resolusi Native : 1280 x 720 (HD)\r\nElectronic Focus\r\nUkuran Proyeksi : 40  80\r\nKecerahan : 150 ANSI (2500 Lightsource Lumens)\r\nJarak Proyeksi : 1,2  2,4 meter\r\nWireless Multi-screen casting (Miracast, iOS Cast, Windows Cast)\r\nBuilt-in Stereo Speaker\r\nWiFi 2.4G/5G', 0, 0),
(89, 'KDK KIPAS ANGIN GANTUNG CEILING FAN 56 WZ56P', 749000, 'assets/img/KDK KIPAS ANGIN GANTUNG CEILING FAN 56 WZ56P_749.000.jpg', 'Kipas', 'KDK', 'FEATURES\r\nDiameter baling-baling 140cm\r\nBaling - baling terbuat dari metal\r\nTerdapat 5 pengaturan kecepatan angin\r\nMotor dilengkapi dengan \"thermal fuse\" ( sekering pengaman panas )\r\nSuara motor dan baling - baling halus\r\nDilengkapi dengan kawat baja sebagai pengaman\r\n\r\nSPECIFICATIONS\r\nFrekuensi : 50 Hz\r\nKonsumsi Daya : 13-78 Watt (Low-High)\r\nKecepatan Putaran : 89-295 rpm (Low-High)\r\nAir Delivery : 206 m3/min\r\nAir Velocity : 160 m/min\r\n', 0, 0),
(90, 'KDK KIPAS ANGIN GANTUNG CEILING FAN 56 WZ56P_GREY', 749000, 'assets/img/KDK KIPAS ANGIN GANTUNG CEILING FAN 56 WZ56P_GREY_749.000.jpg', 'Kipas', 'KDK', 'FEATURES\r\nKonsumsi listrik 220V / 12,6 - 79 Watt\r\nDiameter baling-baling 140cm\r\nBaling - baling terbuat dari metal\r\nTerdapat 5 pengaturan kecepatan angin\r\nMotor dilengkapi dengan \"thermal fuse\" ( sekering pengaman panas )\r\nSuara motor dan baling - baling halus\r\nDilengkapi dengan kawat baja sebagai pengaman\r\nSPECIFICATIONS\r\nFrekuensi : 50 Hz\r\nKonsumsi Daya : 13-78 Watt (Low-High)\r\nKecepatan Putaran : 89-295 rpm (Low-High)\r\nAir Delivery : 206 m3/min\r\nAir Velocity : 160 m/min', 0, 0),
(91, 'KIRIN KIPAS ANGIN BERDIRI STAND FAN KEF16SFD(TWO)_GR', 349000, 'assets/img/KIRIN KIPAS ANGIN BERDIRI STAND FAN KEF16SFD(TWO)_GR_349.000.jpg', 'Kipas', 'KIRIN', 'SPECIFICATION\r\nStand fan\r\nTwo Series (Standing dan Desk fan)\r\n3 fungsi kecepatan\r\nDilengkapi dengan grill pengaman\r\nTerdiri dari 5 blade kipas\r\nTimer 60 menit\r\nDaya 50W', 0, 0),
(92, 'MASPION KIPAS ANGIN BERDIRI STAND FAN F1624S', 399000, 'assets/img/MASPION KIPAS ANGIN BERDIRI STAND FAN F1624S_399.000.jpg', 'Kipas', 'MASPION', 'SPECIFICATION\r\nBlade Size : 16\" ( 400 mm)\r\nWattage : 55 W\r\nVoltage : 220 V 50 Hz\r\nSwitch Control : Manual\r\nSpeed : 3 speed\r\nDimensi : 500 x 260 x 565 mm', 0, 0),
(93, 'MASPION KIPAS ANGIN BOX FAN 12 EX2109T', 279000, 'assets/img/MASPION KIPAS ANGIN BOX FAN 12 EX2109T_279.000.jpg', 'Kipas', 'MASPION', 'FEATURES\r\n100% Motor Gulungan Tembaga\r\nMotor berkualitas dari gulungan tembaga murni, sehingga tahan karat dan lebih tahan lama.\r\nTimer Set Knob\r\nKipas angin akan berhenti otomatis pada pengaturan waktu yang diinginkan.\r\nRotating Louver\r\nPutaran louver depan menyebarkan angin lebih sejuk.\r\nSPECIFICATIONS\r\nBlade Size : 12\" (30 cm)\r\nPower : 45 W/220V~50Hz\r\nSpeed : 3 speed\r\nRPM : 1200 - 1300 Rpm/Min', 0, 0),
(94, 'MASPION KIPAS ANGIN BOX FAN 12 JF2111RC', 489000, 'assets/img/MASPION KIPAS ANGIN BOX FAN 12 JF2111RC_489.000.jpg', 'Kipas', 'MASPION', 'FEATURES\r\nBlade 12 Inch\r\nElectric mosquito repellent ionezer technologi\r\nPower 45 Watt\r\nRemote control\r\n3 Speed\r\nLouver oscillation', 0, 0),
(95, 'MASPION KIPAS ANGIN INDUSTRI INDUSTRIAL FAN PW450D', 479000, 'assets/img/MASPION KIPAS ANGIN INDUSTRI INDUSTRIAL FAN PW450D_479.000.jpg', 'Kipas', 'MASPION', 'SPECIFICATION\r\nBlade Size : 18\" (450 mm)\r\nWattage : 70 W\r\nVoltage : 220 V 50 Hz\r\nSwitch Control : manual \r\nSpeed : 3 speed\r\nDimensi : 690 x 195 x 525 mm', 0, 0),
(96, 'MASPION KIPAS ANGIN INDUSTRI INDUSTRIAL FAN PW603W_1.179.000.jpg', 1179000, 'assets/img/MASPION KIPAS ANGIN INDUSTRI INDUSTRIAL FAN PW603W_1.179.000.jpg', 'Kipas', 'MASPION', 'SPECIFICATION\r\nBlade Size : 24\" (600 mm)\r\nWattage : 150 W\r\nBlade: Casting Blades\r\nVoltage : 220 V 50 Hz\r\nSwitch Control : pull switch \r\nSpeed : 3 speed\r\nDimensi : 290 x 199 x 303 mm', 0, 0),
(97, 'MASPION KIPAS ANGIN MEJA DESK FAN 10 DF101', 249000, 'assets/img/MASPION KIPAS ANGIN MEJA DESK FAN 10 DF101_249.000.jpg', 'Kipas', 'MASPION', 'SPECIFICATION\r\nBlade Size : 10\" (250 mm)\r\nWattage : 35 W\r\nVoltage : 220 V 50 Hz\r\nSwitch Control : Manual\r\nSpeed : 3 speed', 0, 0),
(98, 'MASPION KIPAS ANGIN TOWER FAN TF01S', 449000, 'assets/img/MASPION KIPAS ANGIN TOWER FAN TF01S_449.000.jpg', 'Kipas', 'MASPION', 'SPECIFICATIONS\r\nTower Fan\r\n6” Fan Blade\r\n220V\r\n50Hz\r\nWattage 70W', 0, 0),
(99, 'MIDEA KIPAS ANGIN BERDIRI STAND FAN FS40-19K', 359000, 'assets/img/MIDEA KIPAS ANGIN BERDIRI STAND FAN FS40-19K_359.000.jpg', 'Kipas', 'MIDEA', 'SPECIFICATION :\r\n2 in 1 Function, dapat difungsikan sebagai kipas angin berdiri dan kipas angin meja\r\n3 Speeds, Pilih kecepatan angin yang anda inginkan\r\nOscilation (left/right), hembusan angin yang mencapai ke setiap sudut ruangan\r\nDiameter (inch): 16', 0, 0),
(100, 'MIYAKO KIPAS ANGIN DINDING WALL FAN KAW-1662PL', 249000, 'assets/img/MIYAKO KIPAS ANGIN DINDING WALL FAN KAW-1662PL_249.000.jpg', 'Kipas', 'MIYAKO', 'SPECIFICATION\r\nUKURAN: 16\"\r\nSWITCH: 2 PULL SWITCH(TALI PENGATURAN ON OFF/SPEED LEVEL & TALI PENGATURAN OSILASI)\r\nSPEED: 3\r\nHembusan angin ekstra kencang (Extra Strong Wind)\r\nJaring Mudah Dilepas Pasang dan anti karat\r\nSuara kipas tidak bising saat digunakan\r\nThermofuse yang dapat mencegah terjadinya overheat pada motor kipas', 0, 0),
(101, 'MIYAKO KIPAS ANGIN INDUSTRI INDUSTRIAL FAN KLB18', 349000, 'assets/img/MIYAKO KIPAS ANGIN INDUSTRI INDUSTRIAL FAN KLB18_349.000.jpg', 'Kipas', 'MIYAKO', 'SPECIFICATIONS\r\nUkuran : 18 \"\r\nDaya : 90 Watt\r\nTegangan : 220 VAC\r\nSwitch : Manual ( tidak menggunakan remote )\r\nTenaga Besar', 0, 0),
(102, 'PANASONIC KIPAS ANGIN BERDIRI STAND FAN FEL402', 699000, 'assets/img/PANASONIC KIPAS ANGIN BERDIRI STAND FAN FEL402_699.000.jpg', 'Kipas', 'PANASONIC', 'SPECIFICATIONS\r\nTeknologi Motor terbaru\r\nMotor Bintang 3 Saving energy\r\nHembusan Lebih Besar\r\nProteksi Keamanan Ganda\r\nMaterial V0 - Anti Bakar\r\nJapan Quality, SNI Standard\r\nVoltase (V) : 220 V ~ 50 Hz\r\nArus Daya (min-Max) (A) : 0.159 (0.159 - 0.231)\r\nDaya Listrik (min-max) (W) : 34.1 (34.1 - 48.4)\r\nTingkat Kebisingan [dB-A] : 54.9', 0, 0),
(103, 'PANASONIC KIPAS ANGIN DINDING WALL FAN F400MIW', 1319000, 'assets/img/PANASONIC KIPAS ANGIN DINDING WALL FAN F400MIW_1.319.000.jpg', 'Kipas', 'PANASONIC', 'FEATURES\r\nSuper comfortable , safe , and stubborn\r\nEquipped with a propeller diameter of 40 cm ( 16 Inch )\r\nCapable of producing wind gusts greater\r\nHaving technology Thermal Fuse', 0, 0),
(104, 'PANASONIC KIPAS ANGIN GANTUNG CEILING FAN 56 FEY1511 SERIES', 879000, 'assets/img/PANASONIC KIPAS ANGIN GANTUNG CEILING FAN 56 FEY1511 SERIES_879.000.jpg', 'Kipas', 'PANASONIC', 'FEATURES\r\nSafety Switch : Ketika baut pengikat pipa kendor dan lubang pipa melebar karena pemakaian lama, Safety Switch akan bergeser untuk menghentikan aliran listrik. sehingga motor berhenti dan kipas tidak akan jatuh.\r\nTeknologi Ball Bearing : Untuk perputaran kipas lebih lancar dan tidak berisik.\r\nThermal Fuse : Untuk melindungi motor dari bahaya arus pendek dan panas berlebihan.\r\nDesain blade berkualitas dan lebih kokoh tanpa sambungan\r\nDesain pipa assembling lebih sederhana untuk instalasi lebih mudah dan aman.\r\nDesain kanopi lebih besar dan tebal\r\nDilengkapi kabel ground untuk menghindari kejutan listrik\r\nDesain deco cover lebih elegan\r\nSPECIFICATION\r\nVoltage (V) = Frequency (Hz) 220 V = 50Hz\r\nPower Consumption (W) : 1 : 14.8W | 3 : 33.4W | 5 : 64W\r\nRotation per minute (RPM) : 1 : 96 | 3 : 153 | 5 : 228\r\nAir Volume (m²/min) : 5 : 203\r\nNoise (dB) : 53,5\r\nDemension (PxLxT) : 1500x1500x460mm', 0, 0),
(105, 'PANASONIC KIPAS ANGIN INDUSTRI INDUSTRIAL FAN FET4014H', 879000, 'assets/img/PANASONIC KIPAS ANGIN INDUSTRI INDUSTRIAL FAN FET4014H_879.000.jpg', 'Kipas', 'PANASONIC', 'SPECIFICATIONS\r\nHembusan angin kencang hingga 10 m\r\nMampu digunakan sebagai desk fan dan wall fan\r\nMotor tahan lama\r\nSuara halus dan tidak bising\r\nBaling - baling metal ukuran 40 cm', 0, 0),
(106, 'PANASONIC KIPAS ANGIN MEJA DESK FAN 12 FEK306P2', 489000, 'assets/img/PANASONIC KIPAS ANGIN MEJA DESK FAN 12 FEK306P2_489.000.jpg', 'Kipas', 'PANASONIC', 'SPECIFICATIONS\r\nHigh Technology Motor\r\nHigh Quality Blade\r\nDouble Oscillation\r\nmax 40W\r\nWeight (kg) 3.1\r\nDimension Packaging (L x W x H) 524 x 309 x 382', 0, 0),
(107, 'TURBO KIPAS ANGIN BERDIRI STAND FAN CFR3086', 389000, 'assets/img/TURBO KIPAS ANGIN BERDIRI STAND FAN CFR3086_389.000.jpg', 'Kipas', 'TURBO', 'SPECIFICATIONS\r\nMotor yang kuat, menggunakan gulungan tembaga sehingga kipas lebih awet tahan lamaKipas ganda, membuat membuat angin lebih dan menyebar ke segala sisi, sehingga ruangan rumah Anda lebih sejuk\r\nGrill yang kokoh\r\nMaterial Plastik ABS yang berkualitas membuat kipas angin Turbo lebih kokoh\r\nDesign Kaki yang sempurna sehingga kuat dan kipas tidak akan mudah jatuh\r\nUkuran Blade 16\"', 0, 0),
(108, 'TURBO KIPAS ANGIN MEJA DESK FAN 12 CFR1082', 249000, 'assets/img/TURBO KIPAS ANGIN MEJA DESK FAN 12 CFR1082_249.000.jpg', 'Kipas', 'TURBO', 'SPECIFICATIONS\r\nPower supply : 220V/50Hz\r\nPower consumption : 45 W\r\nUkuran blade : 12”\r\nDesk Fan\r\nDilengkapi 3 tombol kecepatan\r\nTersedia suku cadang asli\r\nDaya 55 - 65 watt', 0, 0),
(109, 'NAKAMICHI MICROPHONE N10X_2', 1099000, 'assets/img/NAKAMICHI MICROPHONE N10X_2_1.099.000.jpg', 'Microphone', 'NAKAMICHI', 'SPECIFICATIONS\nMic Wireless UHF 925-937,5 MHz\nMenggunakan Baterai\nJarak Mic Hingga 50m\nMemory: 1TB (16.000 lagu)', 0, 0),
(110, 'NAKAMICHI MICROPHONE NAKAMICHI-NC220BLK', 2399000, 'assets/img/NAKAMICHI MICROPHONE NAKAMICHI-NC220BLK_2.399.000.jpg', 'Microphone', 'NAKAMICHI', 'SPECIFICATIONS\nMicrophone Wireless Handheld\nlebih dari 200Ch frequency\nWorking distance : 100meter\nFrequency Response : 80Hz - 18kHz+3dB', 0, 0),
(111, 'AUDIOBANK MICROPHONE AB-PRIME-VII', 299000, 'assets/img/AUDIOBANK MICROPHONE AB-PRIME-VII_299.000.jpg', 'Microphone', 'AUDIOBANK', 'SPECIFICATIONS\nMicrophone Cable Jack\n3 Meter Cable\nHyper-Cardioid', 0, 0),
(112, 'BIK MICROPHONE PRO-8X', 759000, 'assets/img/BIK MICROPHONE PRO-8X_759.000.jpg', 'Microphone', 'BIK', 'SPECIFICATIONS\nDynamic Microphone\nDirectivity : Unidirectional\nFrequency Response : 50-16,000Hz\nSensitivity : -53.6dB(1.6mv)', 0, 0),
(113, 'JBL MICROPHONE JBL-VM300E', 3999000, 'assets/img/JBL MICROPHONE JBL-VM300E_3.999.000.jpg', 'Microphone', 'JBL', 'SPECIFICATIONS\nPreset Module\nAuto Scan\nShake to Snyc\nAuto Mute\nAuto Wakeup\nAuto Sleep', 0, 0),
(114, 'SHURE MICROPHONES SVX24A/PG28', 4079000, 'assets/img/SHURE MICROPHONES SVX24A_PG28_4.079.000.jpg', 'Microphone', 'SHURE', 'SPECIFICATIONS\nSHURE SVX24A/PG28 Wireles Microphone Diversity Handheld System\nWireless Vocal System\nIncludes SVX4 Diversity Receiver and SVX2 Handheld Microphone Transmitter with PG28 Microphone', 0, 0),
(115, 'SHURE MICROPHONES PGA58-XLR', 999000, 'assets/img/SHURE MICROPHONES PGA58-XLR_999.000.jpg', 'Microphone', 'SHURE', 'SPECIFICATIONS\nPGA58-XLR Cardioid Dynamic Vocal Microphone\nTransducer Type : Dynamic\nPolar Pattern: Cardioid\nFrequency Response : 50-16,000Hz\nSensitivity : -55 dBV/Pa\nSensitivity : 1.79 mV/Pa', 0, 0),
(116, 'NAKAMICHI MICROPHONE NAKAMICHI-NC230C', 2399000, 'assets/img/NAKAMICHI MICROPHONE NAKAMICHI-NC230C_2.399.000.jpg', 'Microphone', 'NAKAMICHI', 'SPECIFICATIONS\nMicrophone Wireless Headset dan Lavalier\nlebih dari 200Ch frequency\ndirancang untuk broadcast dan live events\nWorking distance : 100meter\nFrequency Response : 80Hz - 18kHz+3dB', 0, 0),
(117, 'NAKAMICHI MICROPHONE N30X', 1599000, 'assets/img/NAKAMICHI MICROPHONE N30X_1.599.000.jpg', 'Microphone', 'NAKAMICHI', 'SPECIFICATIONS\n2 Set Microphone\nBaterai 4pcs\nReceiver Mic\nKabel Charger', 0, 0),
(118, 'NAKAMICHI MICROPHONE NAKAMICHI-NC230RED', 3399000, 'assets/img/NAKAMICHI MICROPHONE NAKAMICHI-NC230RED_3.399.000.jpg', 'Microphone', 'NAKAMICHI', 'SPECIFICATIONS\nReceiver:\nFrequency Band : UHF 615 - 665 MHz\nFrequency Stability : +0.0005%\nMaximum Offset : +45kHz\nBandwidth : 40 MHz\nPower Supply : 100 - 240V AC50/60 Hz,10 W\nFrequency Response : 80Hz - 18kHz+3dB\nDynamic Range : 100dB\nWorking distance : 300meter\nMicrophone:\nFrequency Band : UHF 615 - 665 MHz\nMaximum Offset : +45kHz\nMax Input : 130dB SPL', 0, 0),
(119, 'NAKAMICHI MICROPHONE NAKAMICHI-NC230GLD', 3399000, 'assets/img/NAKAMICHI MICROPHONE NAKAMICHI-NC230GLD_3.399.000.jpg', 'Microphone', 'NAKAMICHI', 'SPECIFICATIONS\nReceiver:\nFrequency Band : UHF 615 - 665 MHz\nFrequency Stability : +0.0005%\nMaximum Offset : +45kHz\nBandwidth : 40 MHz\nPower Supply : 100 - 240V AC50/60 Hz,10 W\nFrequency Response : 80Hz - 18kHz+3dB\nDynamic Range : 100dB\nWorking distance : 300meter\n\nMicrophone:\nFrequency Band : UHF 615 - 665 MHz\nMaximum Offset : +45kHz\nMax Input : 130dB SPL', 0, 0),
(120, 'NAKAMICHI MICROPHONE NAKAMICHI-NC230BLK', 3399000, 'assets/img/NAKAMICHI MICROPHONE NAKAMICHI-NC230BLK_3.399.000.jpg', 'Microphone', 'NAKAMICHI', 'SPECIFICATIONS\nReceiver:\nFrequency Band : UHF 615 - 665 MHz\nFrequency Stability : +0.0005%\nMaximum Offset : +45kHz\nBandwidth : 40 MHz\nPower Supply : 100 - 240V AC50/60 Hz,10 W\nFrequency Response : 80Hz - 18kHz+3dB\nDynamic Range : 100dB\nWorking distance : 300meter\n\nMicrophone:\nFrequency Band : UHF 615 - 665 MHz\nMaximum Offset : +45kHz\nMax Input : 130dB SPL', 0, 0),
(121, 'NAKAMICHI MICROPHONE NAKAMICHI-NC220GLD', 2399000, 'assets/img/NAKAMICHI MICROPHONE NAKAMICHI-NC220GLD_2.399.000.jpg', 'Microphone', 'NAKAMICHI', 'SPECIFICATIONS\nMicrophone Wireless Handheld\nlebih dari 200Ch frequency\nWorking distance : 100meter\nFrequency Response : 80Hz - 18kHz+3dB', 0, 0),
(122, 'NAKAMICHI MICROPHONE NAKAMICHI-NC220RED', 2399000, 'assets/img/NAKAMICHI MICROPHONE NAKAMICHI-NC220RED_2.399.000.jpg', 'Microphone', 'NAKAMICHI', 'SPECIFICATIONS\nMicrophone Wireless Handheld\nlebih dari 200Ch frequency\nWorking distance : 100meter\nFrequency Response : 80Hz - 18kHz+3dB', 0, 0),
(123, 'NAKAMICHI MICROPHONE NAKAMICHI-NA330C', 5599000, 'assets/img/NAKAMICHI MICROPHONE NAKAMICHI-NA330C_5.599.000.jpg', 'Microphone', 'NAKAMICHI', 'SPECIFICATIONS\nMicrophone Wireless Headset dan Lavalier dengan sistem Real True Diversity\nlebih dari 100Ch frequency\nprofessional-grade sound\nWorking distance : 300meter\nFrequency Response : 50Hz-18KHz', 0, 0),
(124, 'SHURE MICROPHONES SM58-LC', 1719000, 'assets/img/SHURE MICROPHONES SM58-LC_1.719.000.jpg', 'Microphone', 'SHURE', 'SPECIFICATIONS\nMicrophone Type: Dynamic (moving coil)\nFrequency Response: 50 to 15,000 Hz\nPolar Pattern: Unidirectional (cardioid), rotationally symmetrical about microphone axis, uniform with frequency\nSensitivity (at 1,000 Hz Open Circuit Voltage): -54.5 dBV/Pa (1.85mV)\nImpedance: Rated impedance is 150 ohms (300 ohms actual) for connection to microphone inputs rated low impedance\nPolarity: Positive pressure on diaphragm produces positive voltage on pin 2 with respect to pin 3\nConnector: Three-pin professional audio connector (male XLR type)\nCase: Dark gray, enamel-painted, die cast metal; matte-finished, silver, spherical steel mesh grille\nOverall Dimensions: See User Guide', 0, 0),
(125, 'SHURE MICROPHONES SV100-X', 379000, 'assets/img/SHURE MICROPHONES SV100-X_379.000.jpg', 'Microphone', 'SHURE', 'SPECIFICATIONS\nShure SV 100 merupakan microphone dengan Cardioid Polar pattern yang mampu meredam feed back dengan kualitas suara yang sangat baik\nFrequency Response: 50 to 15,000 Hz\nImpedance: 600 Ohm\nOutput Level: -52 dBV/Pa* at 1kHz *1 Pa=94 dB SPL\nOutput Connection: XLR-1/4\" (6.3 mm)', 0, 0),
(126, 'SHURE MICROPHONES PGA48-XLR', 669000, 'assets/img/SHURE MICROPHONES PGA48-XLR_669.000.jpg', 'Microphone', 'SHURE', 'SPECIFICATIONS\nPGA48-LC Cardioid Dynamic Vocal Microphone\nThe PGA48 Dynamic Vocal Microphone is a professional quality microphone featuring highly durable design and construction that delivers excellent sound. Ideal for use in spoken word and karaoke performance\nFeatures: Tailored microphone cartridge design specifically for clarity in the standard frequency range of speech\nCardioid polar pattern picks up audio from the source while rejecting unwanted noise\nUpdated industrial design with black metallic finish and classic silver ball grille\nAvailable with and without XLR Cable for flexibility in gear choice\n15 ft (4.6 m) XLR-XLR cable | 15 ft (4.6 m) XLR-QTR cable | Also available without cable\nOn/Off switch for discrete control of microphone operation\nStand adapter for mounting to a microphone stand\nZipper pouch included for additional protection', 0, 0),
(127, 'SHURE MICROPHONES PGA58-LC', 929000, 'assets/img/SHURE MICROPHONES PGA58-LC_929.000.jpg', 'Microphone', 'SHURE', 'SPECIFICATIONS\nTailored microphone cartridge design for natural clarity in the frequency range of vocal performance\nCardioid polar pattern picks up audio from the source while rejecting unwanted noise\nUpdated industrial design with black metallic finish and grille for unobtrusive visual presence\nOn/Off switch for discrete control of microphone operation\nStand adapter for mounting to a microphone stand\nLegendary Shure quality design and construction for exceptional performance in rigorous environments', 0, 0),
(128, 'NAKAMICHI MICROPHONE NAKAMICHI-NA320BLK', 5299000, 'assets/img/NAKAMICHI MICROPHONE NAKAMICHI-NA320BLK_5.299.000.jpg', 'Microphone', 'NAKAMICHI', 'SPECIFICATIONS\nMicrophone Wireless Handheld menggunakan sistem Real True Diversity\nlebih dari 100Ch frequency\nWorking distance : 300meter\nSeri ini dirancang untuk live music performance, kinerja yang andal, pengaturan yang mudah, dan microcomputer CPU control', 0, 0),
(129, 'SANKEN SETRIKA FLAT IRON ADR210BL_N', 169000, 'assets/img/SANKEN SETRIKA FLAT IRON ADR210BL_N_169.000.jpg', 'Setrika', 'SANKEN', 'SPECIFICATIONS\nNon-Stick Coating\nGold Soleplate\nAdjustable Thermostatic Control\nFast Heasting\n360 Flexy Cable\nErgonomic & Light Weight\nVoltage : 220 V - 50 Hz\nPower Consumption : 300 W', 0, 0),
(130, 'MASPION SETRIKA FLAT IRON E1000', 89000, 'assets/img/MASPION SETRIKA FLAT IRON E1000_89.000.jpg', 'Setrika', 'MASPION', 'SPECIFICATIONS\nIron\nDouble protector thermostat + thermofuse', 0, 0),
(131, 'PHILIPS SETRIKA FLAT IRON GC160', 319000, 'assets/img/PHILIPS SETRIKA FLAT IRON GC160_319.000.jpg', 'Setrika', 'PHILIPS', 'FEATURES\nDynaGlide soleplate\nButton groove\nEasy temperature control\nSlim tip soleplate\nComfortable handle\nTemperature light-indicator\nEasy storage\n\nSPECIFICATIONS\nPower: 350 W\nPower cord length: 1.8 m\nWattage 350W', 0, 0),
(132, 'PANASONIC SETRIKA FLAT IRON NI22AWT', 359000, 'assets/img/PANASONIC SETRIKA FLAT IRON NI22AWT_359.000.jpg', 'Setrika', 'PANASONIC', 'SPECIFICATIONS\nDry Iron\n450 Watt\n2 Kg\nDouble Protection\nSoleplate dilapisi Teflon (Non sticky sole plate)\nSistem Casting\nDial Temperature Setting', 0, 0),
(133, 'COSMOS SETRIKA FLAT IRON CIS318F', 89000, 'assets/img/COSMOS SETRIKA FLAT IRON CIS318F_89.000.jpg', 'Setrika', 'COSMOS', 'SPECIFICATIONS\nSetrika listrik\nkontrol temperatur\n300w\nAnti lengket\nDesain modern dan minimalis', 0, 0),
(134, 'PHILIPS SETRIKA UAP TRAVEL STEAM IRON STH3010/30', 429000, 'assets/img/PHILIPS SETRIKA UAP TRAVEL STEAM IRON STH3010_429.000.jpg', 'Setrika', 'PHILIPS', 'SPECIFICATIONS\nSteamer ringkas yang bisa dilipat, mudah digunakan dan disimpan\nTidak perlu meja setrika, Hemat waktu dan bebas repot\nSegarkan kembali pakaian Anda dan hilangkan bau tak sedap\nTangki air 100 ml lepas-pasang sehingga mudah diisi\nUap membunuh 99,9% bakteri\nAman pada semua pakaian yang dapat disetrika, dijamin tidak akan terbakar', 0, 0),
(135, 'TURBO SETRIKA FLAT IRON EHL3038 SERIES', 129000, 'assets/img/TURBO SETRIKA FLAT IRON EHL3038 SERIES_129.000.jpg', 'Setrika', 'TURBO', 'SPECIFICATIONS\nalas teflon anti lengket\nSoleplate trylone glide\nLife time penggunaan bisa mencapai 600 jam lebih\nBahan : Plastic, alas teflon\nDaya 350 watt\nTeflon, Ketahanan abrasi hingga 340km\nLampu LED, penanda arus listrik sudah mengalir ke setrika\nUjung setrika dapat menjangkau bagian yang sulit\nMemiliki Thermal Fuse untuk proteksi terjadinya kebakaran', 0, 0);
INSERT INTO `tb_barang` (`id_barang`, `nama_barang`, `harga`, `img`, `kategori`, `merk`, `keterangan`, `stok`, `terjual`) VALUES
(136, 'TURBO SETRIKA STEAM IRON EHL3002 SERIES', 99000, 'assets/img/TURBO SETRIKA STEAM IRON EHL3002 SERIES_99.000.jpg', 'Setrika', 'TURBO', 'SPECIFICATIONS\nTegangan listrik : 220V 50 Hz\nKonsumsi daya : 1200 Watt\nDilengkapi dengan saluran masuk air\nDilengkapi dengan pipa semprot\nTombol control uap\nTombol control suhu\nTombol semprot\nDilengkapi dengan lampu indikator\nDapat menyetrika untuk berbagai jenis kain\nAlas setrika dilapisi anti lengket\nThermal Fuse sebagai pengaman korsleting', 0, 0),
(137, 'SHARP SETRIKA FLAT IRON EI-N05', 159000, 'assets/img/SHARP SETRIKA FLAT IRON EI-N05_159.000.jpg', 'Setrika', 'SHARP', 'SPECIFICATIONS\nPengatur suhu yang mudah\nPengaman kabel yang fleksibel\nDisertai dengan lampu indikator\nBahan Material : Non-Stick Coating\nDaya : 400 Watt\nTegangan : 220 Volt / 50 Hz', 5, 0),
(138, 'OXONE SETRIKA UAP STEAM IRON OX-848', 299000, 'assets/img/OXONE SETRIKA UAP STEAM IRON OX-848_299.000.jpg', 'Setrika', 'OXONE', 'SPECIFICATIONS\nSTEAM IRON\n350W\nSPRAY IRON WITH CERAMIC COATING', 0, 0),
(139, 'PHILIPS SETRIKA UAP VERTICAL STEAM IRON GC482/25', 729000, 'assets/img/PHILIPS SETRIKA UAP VERTICAL STEAM IRON GC48225_729.000.jpg', 'Setrika', 'PHILIPS', 'SPECIFICATION\n1.4L water tank with 80% larger filling hole\nSafe to use on all garments\nAdjustable pole for various height settings\nSteam kills more than 99% of bacteria and dust mites\nEasy Rinse descaling for years of effective use\nGlove for extra protection during steaming\nIntegrated garment hanger\n18g/min continuous steam\n2 steam settings for different types of fabric\nCompact design for easy storage', 0, 0),
(140, 'PANASONIC SETRIKA UAP TRAVEL STEAM IRON NI-GHF025WSR', 729000, 'assets/img/PANASONIC SETRIKA UAP TRAVEL STEAM IRON NI-GHF025WSR_729.000.jpg', 'Setrika', 'PANASONIC', 'SPECIFICATIONS\nSteamer Pakaian Ringkas 600g untuk bepergian\n1300W Tenaga uap hingga 21g/mnt\nMenghilangkan 99,99%* Tungau & Bakteri\nMenyetrika lancar dengan tapak setrika Titanium\nKering & Uap: Setrika 2 arah untuk kenyamanan Anda\nMulai Cepat dalam 30 detik', 0, 0),
(141, 'TEFAL SETRIKA FLAT DRY IRON EASY GLISS 1830006773', 299000, 'assets/img/TEFAL SETRIKA FLAT DRY IRON EASY GLISS 1830006773_299.000.jpg', 'Setrika', 'TEFAL', 'SPECIFICATIONS\nTefal FS4040 Easygliss Dry Iron\n350 Watt\nNon Stick Coating\nP.Kabel 1,7m', 0, 0),
(142, 'SHARP SETRIKA FLAT IRON EI-N10 SERIES', 169000, 'assets/img/SHARP SETRIKA FLAT IRON EI-N10 SERIES_169.000.jpg', 'Setrika', 'SHARP', 'SPECIFICATIONS\nNon-Stick Coating\nThermal Safety Cut Off\nIndication Lights\nPointed Soleplate\nComfortable Handle\nPower Consumption 350 Watt', 0, 0),
(143, 'MIYAKO SETRIKA FLATIRON EI-1008MBL', 109000, 'assets/img/MIYAKO SETRIKA FLATIRON EI-1008MBL_109.000.jpg', 'Setrika', 'MIYAKO', 'SPECIFICATION\nKabel Double Insulation\nSoleplate non Stick: Alas setrika dilapisi lapisan anti lengket\nAlas Setrika berujung lancip memudahkan untuk menjangkau setiap bagian yang tersulit\n3 Temperatur Controller', 0, 0),
(144, 'TEFAL PURE POP SETRIKA UAP TRAVEL STEAM IRON DT20E1 SERIES', 699000, 'assets/img/TEFAL PURE POP SETRIKA UAP TRAVEL STEAM IRON DT20E1 SERIES_699.000.jpg', 'Setrika', 'TEFAL', 'SPECIFICATIONS\nPower Consumption 1300 Watt\nUsage : Vertical\nHeat up Time 15 S\nWater Tank Capacity 70 ml\nPower Cord Length 2m\nSteam Ready Indicator', 0, 0),
(145, 'MASPION SETRIKA FLAT IRON HA255S', 119000, 'assets/img/MASPION SETRIKA FLAT IRON HA255S_119.000.jpg', 'Setrika', 'MASPION', 'SPECIFICATION\nHandle : plastic\nNon-stick coating sole plate\nWattage : 350 W\nVoltage : 220 V', 0, 0),
(146, 'MASPION SETRIKA FLAT IRON HA120', 119000, 'assets/img/MASPION SETRIKA FLAT IRON HA120_119.000.jpg', 'Setrika', 'MASPION', 'SPECIFICATION\nHandle : phenolic\nNon-stick coating sole plate\nWattage : 350 W\nVoltage : 220 V', 0, 0),
(147, 'SANKEN SETRIKA FLAT IRON ADR-222BK', 219000, 'assets/img/SANKEN SETRIKA FLAT IRON ADR-222BK_219.000.jpg', 'Setrika', 'SANKEN', 'SPECIFICATIONS\nDaya : 400 Watt\nTegangan : 220 V - 50 Hz\nFast Heating\nAdjustable Thermostatic Control\nErgonomic\nLightweight\nStainless Steel Sole Plate\nFlexible Cable', 0, 0),
(148, 'COSMOS SETRIKA FLAT IRON CI-3120NJB', 69000, 'assets/img/COSMOS SETRIKA FLAT IRON CI-3120NJB_69.000.jpg', 'Setrika', 'COSMOS', 'SPECIFICATIONS\r\nMaterial Iron Plate : Non Stick\r\nPower Consumption : 400 Watts', 0, 0),
(149, 'Samsung 32\" HD Smart TV T4503 UA32T4503AKXXD', 2579000, 'assets/img/Samsung 32_ HD Smart TV T4503 UA32T4503AKXXD_2.579.000.jpg', 'TV', 'Samsung', 'FEATURES\r\nHDR: High Dynamic Range levels up bright expression of your TV\r\nPurColor: Fine-tuned color for vibrant, lifelike picture\r\nContrast Enhancer: See images comes to life\r\nUltra Clean View: Improved detail for a clear picture\r\nSmart Hub: Find a variety of content in one place\r\nSlim design\r\n\r\nSPECIFICATION\r\nScreen Size	32\"\r\nTV Tuner	Digital\r\n3D Technology	No\r\nSmart tv	Yes\r\nDisplay Type	Flat\r\nSmart Platform Tizen\r\nNumber of HDMI Inputs	2\r\nNumber Of USB Port(s)	1\r\nResolution	1366 x 768\r\n', 0, 0),
(150, 'SAMSUNG 4K CRYSTAL UHD SMART TV CU7000KXXD SERIES', 3809000, 'assets/img/SAMSUNG 4K CRYSTAL UHD SMART TV CU7000KXXD SERIES_3.809.000.jpg', 'TV', 'Samsung', 'FEATURES\r\nPurColor: Brilliant colors for bright, true-to-life images\r\nCrystal Processor 4K: See every color in powerful 4K\r\nSmart Hub: Find all your favorite content in one place\r\nContrast Enhancer\r\nMotion Xcelerator: Smooth movement for clear images\r\nQ-Symphony Synchronised sound from your TV and Soundbar\r\n3-Bezeless Design\r\n\r\nSPECIFICATION\r\nScreen Size	43\" | 50\" | 55\" | 58\" | 65\"\r\nTV Tuner	Digital\r\n3D Technology	No\r\nSmart tv	Yes\r\nDisplay Type	Flat\r\nSmart Platform	Tizen Smart TV\r\nNumber of HDMI Inputs	3\r\nNumber Of USB Port(s)	1\r\nResolution	3,840 x 2,160\r\n', 0, 0),
(151, 'Samsung Lifestyle Smart TV The Frame 55 inch LS03B QLED 4K QA55LS03BAKXXD', 17049000, 'assets/img/Samsung Lifestyle Smart TV The Frame 55 inch LS03B QLED 4K QA55LS03BAKXXD_17.049.000.jpg', 'TV', 'Samsung', 'FEATURES\r\nMatte Display: Enjoy whats on with less reflection\r\nModern Frame Design: Designed to look like a slim picture frame\r\nCustomizable Frame: Match your space with customizable bezels\r\nArt Mode: When The Frame is off, the arts are displayed\r\nSlim Fit Wall Mount: A flush fit to the wall\r\nQuantum Processor 4K\r\nSmart Hub: Easy content discovery\r\nQ-Symphony: TV and soundbar in perfect harmony\r\n\r\nSPECIFICATION\r\nScreen Size	55\"\r\nTV Tuner	Digital\r\n3D Technology	No\r\nSmart tv	Yes\r\nDisplay Type	Flat\r\nSmart Platform Tizen\r\nNumber of HDMI Inputs	4\r\nNumber Of USB Port(s)	2\r\nResolution	3840 x 2160\r\n', 0, 0),
(152, 'Samsung Smart TV OLED 4K S90C dengan Quantum HDR', 25729000, 'assets/img/Samsung Smart TV OLED 4K S90C dengan Quantum HDR_25.729.000.jpg', 'TV', 'Samsung', 'FEATURES\r\nRich blacks and vivid colour reproduction powered by Quantum Dot Technology\r\nExceptional detail unveiled with Quantum HDR OLED\r\nDolby Atmos & Object Tracking Sound Lite for an immersive sound experience\r\nGreat view from virtually every seat with Wide Angle Viewing\r\nMotion Rate 200, Clarity in motion\r\nAI Upscalling\r\nQ-Symphony Synchronised sound from your TV and Soundbar\r\nLaserSlim Design, Beautiful from any angle\r\nUltra smooth gaming performance\r\nSmart Hub, Discover your favourite content in one place\r\nBuilt-in Voice Assistant\r\n\r\nSPECIFICATION\r\nScreen Size	55\" | 65\" | 77\"\r\nTV Tuner	Digital\r\n3D Technology	No\r\nSmart tv	Yes\r\nDisplay Type	Flat\r\nSmart Platform Tizen\r\nNumber of HDMI Inputs	4\r\nNumber Of USB Port(s)	2\r\nResolution	3840 x 2160\r\n', 0, 0),
(153, 'Sony X80L TV SERIES : 4K UHD LED Smart Google TV - 2023 Model', 9799000, 'assets/img/Sony X80L TV SERIES _ 4K UHD LED Smart Google TV - 2023 Model_9.799.000.jpg', 'TV', 'Sony', 'FEATURES\r\n4K HDR processor X1\r\nTRILUMINOS PRO\r\n4K X-Reality PRO\r\nMotionflow XR\r\nAuto Low Latency Mode\r\nAuto HDR Tone Mapping\r\nX-Balanced Speaker\r\nAuto Genre Picture Mode\r\nBluetooth connectivity\r\nAmbient Optimization\r\nLight Sensor\r\nSound optimisation for your room\r\nGoogle TV\r\nSmart remote\r\nLiving Décor\r\nDolby Vision® & Dolby Atmos®\r\n\r\nSPECIFICATION\r\nScreen Size	55\" | 65\" | 75\" | 85\"\r\nTV Tuner	Digital\r\n3D Technology	No\r\nSmart tv	Yes\r\nDisplay Type	Flat\r\nSmart Platform  Android TV\r\nNumber of HDMI Inputs	4\r\nNumber Of USB Port(s)	2\r\nResolution	3840 X 2160\r\n', 0, 0),
(154, 'Sony X75K TV Series: 4K UHD LED Smart Google TV 2022 Model', 5699000, 'assets/img/Sony X75K TV Series_ 4K UHD LED Smart Google TV 2022 Model_5.699.000.jpg', 'TV', 'Sony', 'SPECIFICATION\r\nScreen Size	43\" | 50\"| 55\"| 65\"\r\nTV Tuner	Digital\r\n3D Technology	No\r\nSmart tv	Yes\r\nDisplay Type	Flat\r\nSmart Platform	Android TV\r\nNumber of HDMI Inputs	3\r\nNumber Of USB Port(s)	2\r\nResolution	3840 x 2160\r\n', 0, 0),
(155, 'Sony X77L 75 Inch TV -KD-75X77L: 4K UHD LED Smart TV 2023 Model', 15159000, 'assets/img/Sony X77L 75 Inch TV -KD-75X77L_ 4K UHD LED Smart TV 2023 Model_15.159.000.jpg', 'TV', 'Sony', 'FEATURES\r\n4K HDR processor X1\r\n4K X-Reality PRO\r\nMotionflow XR\r\nClear phase\r\nX-Balanced Speaker\r\nVoice Search\r\nBluetooth connectivity\r\nX-Protection PRO\r\nSmart remote\r\nLiving Décor\r\nDolby Vision® & Dolby Atmos®\r\n\r\nSPECIFICATION\r\nScreen Size	75\"\r\nTV Tuner	Digital\r\n3D Technology	No\r\nSmart tv	Yes\r\nDisplay Type	Flat\r\nSmart Platform   Android TV\r\nNumber of HDMI Inputs	4\r\nNumber Of USB Port(s)	2\r\nResolution	3840 X 2160\r\n', 0, 0),
(156, 'POLYTRON 50\" LED UHD TV PLD50UV8959', 4539000, 'assets/img/POLYTRON 50_ LED UHD TV PLD50UV8959_4.539.000.jpg', 'TV', 'Polytron', 'FEATURES\r\n4K Upscalling dan 4K Upstreaming\r\nHigh Dyamic Range 10\r\nEasy Screen Mirroring\r\nSupport Netflix, Youtube, Prime Video\r\n120Hz Refresh Rate dengan VRR\r\n\r\nSPECIFICATIONS\r\nScreen Size	50\"\r\nTV Tuner	Digital\r\n3D Technology	No\r\nSmart tv	Yes\r\nDisplay Type	Flat\r\nSmart Platform	Vidaa\r\nNumber of HDMI Inputs	3\r\nNumber Of USB Port(s)	2\r\nResolution	3840 x 2160\r\n', 0, 0),
(157, 'Sony A80L TV Series: BRAVIA XR OLED 4K UHD Smart Google TV- 2023 Model', 23099000, 'assets/img/Sony A80L TV Series_ BRAVIA XR OLED 4K UHD Smart Google TV- 2023 Model_23.099.000.jpg', 'TV', 'Sony', 'FEATURES\r\n4K OLED\r\nCognitive Processor XR\r\nXR OLED Contrast Pro\r\nXR Triluminos Pro\r\nBeautiful colours from any angle\r\nAuto Low Latency Mode\r\nVoice Zoom 2\r\nVariable Refresh Rate\r\nBluetooth connectivity\r\nLight Sensor\r\nGoogle TV\r\nSmart remote\r\nLiving Décor\r\nDolby Vision® and Dolby Atmos®\r\n\r\nSPECIFICATION\r\nScreen Size	55\" | 65\" | 77\"\r\nTV Tuner	Digital\r\n3D Technology	No\r\nSmart tv	Yes\r\nDisplay Type	Flat\r\nSmart Platform	Android TV\r\nNumber of HDMI Inputs	4\r\nNumber Of USB Port(s)	2\r\nResolution	3840 x 2160\r\n', 0, 0),
(158, 'LG 50\" 4K SMART QNED TV 50QNED80TSA', 9199000, 'assets/img/LG 50_ 4K SMART QNED TV 50QNED80TSA_9.199.000.jpg', 'TV', 'LG', 'FEATURES\r\nWarna tajam dan jernih pada LG QNED yang kolosal. Chipset baru dan zona peredupan kami menyempurnakan konten sehingga setiap piksel tetap tajam.\r\nProsesor Smart alpha 5 AI 4K Gen7 mengoptimalkan audio dan kecerahan secara otomatis, untuk pengalaman aksi yang sesungguhnya.\r\nSuper Slim Design: Desain ramping menyatu dengan interior Anda\r\nPenyetelan Akustik AI: Audio optimal menyesuaikan ruangan Anda\r\nwebOS 24: Jadikan pengalaman TV Anda milik Anda\r\nPengalaman Sinema di rumah. HDR10 Pro menghadirkan tampilan film apa pun yang diinginkan dengan warna dan kontras yang presisi.\r\nGameplay yang Powerful: Selami aksi dengan kecepatan penuh\r\n\r\nSPECIFICATION\r\nScreen Size	50\"\r\nTV Tuner	Digital\r\n3D Technology	No\r\nSmart tv	Yes\r\nDisplay Type	Flat\r\nSmart Platform   WebOS 24\r\nNumber of HDMI Inputs	-\r\nNumber Of USB Port(s)	-\r\nResolution	3840 X 2160\r\n', 0, 0),
(159, 'POLYTRON 65\" 4K UHD GOOGLE TV PLD65UG5959', 7299000, 'assets/img/POLYTRON 65_ 4K UHD GOOGLE TV PLD65UG5959_7.299.000.jpg', 'TV', 'Polytron', 'SPECIFICATIONS\r\nScreen Size	65\"\r\nTV Tuner	Digital\r\n3D Technology	No\r\nSmart tv	Yes\r\nDisplay Type	Flat\r\nSmart Platform	GoogleTV\r\nNumber of HDMI Inputs	3\r\nNumber Of USB Port(s)	2\r\nResolution	3480 X 2160 (4K UHD)\r\n', 0, 0),
(160, 'AKARI 55\" 4K UHD ANDROID TV AT-5555B_N', 4999000, 'assets/img/AKARI 55_ 4K UHD ANDROID TV AT-5555B_N_4.999.000.jpg', 'TV', 'Akari', 'FEATURES\r\nMenggunakan Chipset generasi SK55 yg bisa menampilkan gambar dengan sempurna.\r\nAdanya Teknologi HDR (High Dynamic Range) yg dapat mempersembahkan detail dan tekstur gambar lebih unggul.\r\nDukungan Teknologi 4K Upscaling yg dapat meningkatkan resolusi dan mengoptimalkannya agar sesuai dengan panel tampilan tv 4K.\r\nMenyambungkan TV dengan perangkat yg lain melalui WiFi dan bluetooth.\r\nMemungkinkan menampilkan isi layar smartphone ke layar tv dengan fitur smart connect.\r\n\r\nSPECIFICATIONS\r\nScreen Size	55\"\r\nTV Tuner	Digital\r\n3D Technology	No\r\nSmart tv	Yes\r\nDisplay Type	Flat\r\nSmart Platform	-\r\nNumber of HDMI Inputs	3\r\nNumber Of USB Port(s)	2\r\nResolution	3840 x 2160\r\n', 0, 0),
(161, 'TOSHIBA 43\" FULL HD LED TV 43S25KP', 2839000, 'assets/img/TOSHIBA 43_ FULL HD LED TV 43S25KP_2.839.000.jpg', 'TV', 'Toshiba', 'FEATURES\r\nREGZA Engine HG\r\nEssential PQ Technology\r\nDigital Noise Reduction\r\nSelf-Luminous Technology\r\nContrast Booster\r\nGame Mode\r\nREGZA Power Audio\r\nDolby Audio\r\nDesign in Japan\r\n\r\nSPECIFICATIONS\r\nScreen Size	43\"\r\nTV Tuner	Digital\r\n3D Technology	No\r\nSmart tv	No\r\nDisplay Type	Flat\r\nSmart Platform	-\r\nNumber of HDMI Inputs	2\r\nNumber Of USB Port(s)	2\r\nResolution	-\r\n', 0, 0),
(162, 'AQUA 50\" 4K UHD ANDROID TV LE50AQT7000QUPRO', 4899000, 'assets/img/AQUA 50_ 4K UHD ANDROID TV LE50AQT7000QUPRO_4.899.000.jpg', 'TV', 'Aqua', 'FEATURES\r\nHQLED, with 4K HDR: Teknologi TV LCD meningkatkan warna yang presisi, menghadirkan lebih banyak level warna. Kontrol Kecerahan Tinggi, menciptakan tingkat warna yang halus.\r\nDolby Atmos: Nikmati pengalaman hiburan premium dengan suara imersif dari Dolby Atmos.\r\nDolby Vision: Menampilkan video secara dinamis, berdasarkan adegan demi adegan dengan rentang warna, kontras, dan luminans yang lebih akurat sehingga memungkinkan melihat banyak detail dengan akurasi warna yang lebih baik.\r\nPowerful Front Speaker: Speaker depan berkualitas tinggi yang dapat menghasilkan suara dengan mengagumkan.\r\nHands-free Voice Control: Jangan biarkan jarak jauh menghalangi. Katakan saja, dan Anda akan melihatnya. Cukup Ucapkan \"Hai Google\"(Ok Google\") untuk memulai.\r\nMicro Dimming: Peredupan Mikro menganalisis konten tampilan TV dengan ribuan zona terpisah, menyesuaikan kecerahan & kegelapan.\r\n\r\nSPECIFICATION\r\nScreen Size	50\"\r\nTV Tuner	Digital\r\n3D Technology	No\r\nSmart tv	Yes\r\nDisplay Type	Flat\r\nSmart Platform   Android\r\nNumber of HDMI Inputs	4\r\nNumber Of USB Port(s)	2\r\n', 0, 0),
(163, 'LG 55\" 4K SMART OLED TV 55LX1QPSA', 25999000, 'assets/img/LG 55_ 4K SMART OLED TV 55LX1QPSA_25.999.000.jpg', 'TV', 'LG', 'SPECIFICATION\r\nDesain Serbaguna, Tepi Bulat\r\nTekstil Krem yang Menenangkan\r\nBagian Belakang Serbaguna\r\nWadah Kabel & Aksesori\r\nLG Self-lit OLED evo\r\nProsesor AI ⍺9 Gen5 4K\r\nAI Picture Pro\r\nAI Brightness Control\r\n', 0, 0),
(164, 'LG 43\" 4K NANOCELL SMART TV 43NANO81TSA', 5999000, 'assets/img/LG 43_ 4K NANOCELL SMART TV 43NANO81TSA_5.999.000.jpg', 'TV', 'LG', 'FEATURES\r\nTemukan dunia yang hidup dengan warna yang kaya dan jernih berkat teknologi LG NanoCell.?\r\nProsesor Smart alpha 5 AI 4K Gen7 mengoptimalkan audio dan kecerahan secara otomatis, untuk pengalaman aksi yang sesungguhnya.\r\nPenyetelan Akustik AI: Audio optimal menyesuaikan ruangan Anda\r\nwebOS 24: Jadikan pengalaman TV Anda milik Anda\r\nPengalaman Sinema di rumah. HDR10 Pro menghadirkan tampilan film apa pun yang diinginkan dengan warna dan kontras yang presisi.\r\nGameplay yang Powerful: Selami aksi dengan kecepatan penuh\r\n\r\nSPECIFICATION\r\nScreen Size	43\"\r\nTV Tuner	Digital\r\n3D Technology	No\r\nSmart tv	Yes\r\nDisplay Type	Flat\r\nSmart Platform   WebOS 24\r\nNumber of HDMI Inputs	-\r\nNumber Of USB Port(s)	-\r\nResolution	3840 X 2160\r\n', 0, 0),
(165, 'HISENSE 75\" 8K ANDROID ULED TV 75U80H', 39999000, 'assets/img/HISENSE 75_ 8K ANDROID ULED TV 75U80H_39.999.000.jpg', 'TV', 'Hisense', 'FEATURES\r\nHi-View Engine PRO\r\nFull Array Local Dimming PRO\r\nQuantum Dot Color\r\nMini-LED PRO\r\n8K Resolution\r\n120Hz Ultra Motion\r\nGame Mode Pro\r\nHands-Free Voice Control\r\n\r\nSPECIFICATION\r\nScreen Size	75\"\r\nTV Tuner	Digital\r\n3D Technology	No\r\nSmart tv	Yes\r\nDisplay Type	Flat\r\nSmart Platform   Android TV\r\nNumber of HDMI Inputs	2\r\nNumber Of USB Port(s)	2\r\nResolution	7680 x 4320\r\n', 0, 0),
(166, 'SHARP 75\" AQUOS XLED TV 4T-C75FV1X', 54699000, 'assets/img/SHARP 75_ AQUOS XLED TV 4T-C75FV1X_54.699.000.jpg', 'TV', 'Sharp', 'SPECIFICATIONS\r\nScreen Size	75\"\r\nTV Tuner	Digital\r\n3D Technology	No\r\nSmart tv	Yes\r\nDisplay Type	Flat\r\nSmart Platform	Google TV\r\nNumber of HDMI Inputs	4\r\nNumber Of USB Port(s)	2\r\nResolution	3840 x 2160\r\n', 0, 0),
(167, 'CHANGHONG 32\" HD READY ANDROID LED TV LC32G7N', 18999000, 'assets/img/CHANGHONG 32_ HD READY ANDROID LED TV LC32G7N_1.899.000.jpg', 'TV', 'Changhong', 'SPECIFICATION\r\nScreen Size	32\"\r\nTV Tuner	Digital\r\n3D Technology	No\r\nSmart tv	Yes\r\nDisplay Type	Flat\r\nSmart Platform	Android 11\r\nNumber of HDMI Inputs	2\r\nNumber Of USB Port(s)	1\r\nResolution	1366 x 768\r\n', 0, 0),
(168, 'HISENSE 55\" 4K UHD GOOGLE TV 55A6500K', 6499000, 'assets/img/HISENSE 55_ 4K UHD GOOGLE TV 55A6500K_6.499.000.jpg', 'TV', 'Hisense', 'SPECIFICATION\r\nScreen Size	55\"\r\nTV Tuner	Digital\r\n3D Technology	No\r\nSmart tv	Yes\r\nDisplay Type	Flat\r\nSmart Platform   Google\r\nNumber of HDMI Inputs	3\r\nNumber Of USB Port(s)	2\r\nResolution	3840 x 2160\r\n', 0, 0),
(169, 'YONGMA RICE COOKER SMC8033R', 689000, 'assets/img/YONGMA RICE COOKER SMC8033R_689.000.jpg', 'Rice Cooker', 'Yongma', 'SPECIFICATIONS\r\nRice Cooker\r\nDapat digunakan untuk memasak, menghangatkan, mengukus\r\nKapasitas 2 L\r\nInner Pot : Gold Iron Wing\r\nDaya : 400 Watt\r\n', 0, 0),
(170, 'MIYAKO RICE COOKER MCM638BTKPRG', 249000, 'assets/img/MIYAKO RICE COOKER MCM638BTKPRG_249.000.jpg', 'Rice Cooker', 'Miyako', 'Rice Cooker\r\nMotif Batik Parang\r\nBody Plastik\r\n3 in 1\r\n', 0, 0),
(171, 'MASPION RICE COOKER MRJ109SS', 349000, 'assets/img/MASPION RICE COOKER MRJ109SS_349.000.jpg', 'Rice Cooker', 'Maspion', 'SPECIFICATIONS\r\nCapacity : 1.2 L\r\nPan : Stainless Steel\r\nFunction : Rice Cooker, Warmer, Steamer\r\nWattage : 350 W\r\n', 0, 0),
(172, 'KIRIN - RICE COOKER KRC159_TM', 379000, 'assets/img/KIRIN - RICE COOKER KRC159_TM_379.000.jpg', 'Rice Cooker', 'Kirin', 'Ricecooker\r\nkapasitas 2L\r\nTongolan ada\r\nFungsi 3 in 1 : memasak, memanasi, mengukus\r\nLapisan K-flon anti lengket\r\nPengatur suhu otomatis\r\nDaya 380W\r\n', 0, 0),
(173, 'OXONE RICE COOKER OX189', 379000, 'assets/img/OXONE RICE COOKER OX189_2.329.000.jpg', 'Rice Cooker', 'Oxone', 'SPECIFICATIONS\r\n1950 W\r\nKapasitas Besar 5.4 L\r\nPemasak Nasi\r\nStainless Steel\r\n', 0, 0),
(174, 'HITACHI RICE COOKER RZZH10YW', 969000, 'assets/img/HITACHI RICE COOKER RZZH10YW_969.000.jpg', 'Rice Cooker', 'Hitachi', 'SPECIFICATIONS\r\nCapacity (L) : 1 Liter\r\nMax. Amount of Rice : 5.5 cups\r\nInner Pot : Thickness 1.5 mm, Outer Side Aluminum, Non-stick Material Coating\r\nRapid Rice Cooking Program : Rapid Cook\r\nCooking Power : 540W\r\nWarming Power : 23Wh\r\n', 0, 0),
(175, 'SHARP RICE COOKER KSA18TTR', 459000, 'assets/img/SHARP RICE COOKER KSA18TTR_459.000.jpg', 'Rice Cooker', 'Sharp', 'Rice Cooker\r\nLibre Series\r\nOne Touch Operation , Easy To Use\r\nNon-stick Coated Cooking Bowl for Easy Cleaning\r\nCapacity 1.8 Liter\r\nCooking 380 Watt\r\n', 0, 0),
(176, 'SANKEN RICE COOKER SJ2000SP', 629000, 'assets/img/SANKEN RICE COOKER SJ2000SP_629.000.jpg', 'Rice Cooker', 'Sanken', 'FEATURES\r\n\r\n3D Warming\r\n6 in 1 Multifungsi\r\nStainless Steel Pot\r\nBody Stainless Steel\r\nSPECIFICATION\r\n\r\nBahan Material Panci : Stainless Steel\r\nKapasitas : 1.8 Liter\r\nDaya Memasak : 350 Watt\r\nDimensi Unit : 285 x 285 x 275 mm\r\n', 0, 0),
(177, 'COSMOS RICE COOKER CRJ2301D', 409000, 'assets/img/COSMOS RICE COOKER CRJ2301D_409.000.jpg', 'Rice Cooker', 'Cosmos', 'SPECIFICATIONS\r\nPanci anti Lengket\r\nKapasitas 2 Liter\r\nDilengkapi dengan pengaturan waktu\r\nDaya 400 Watt\r\nVoltase 220 V\r\n', 0, 0),
(178, 'CUCKOO RICE COOKER CR1005_P', 299000, 'assets/img/CUCKOO RICE COOKER CR1005_P_299.000.jpg', 'Rice Cooker', 'Cuckoo', 'SPECIFICATIONS\r\nAluminum Inner Pot and PTFE Non-sticky Coating (PFOA free)\r\n400 Watts (Cooking)\r\n60 Watt (Warms)\r\n10 Cups (1.8 Liter)\r\n', 0, 0),
(179, 'RINNAI RICE COOKER RR50ATJ', 3659000, 'assets/img/RINNAI RICE COOKER RR50ATJ_3.659.000.jpg', 'Rice Cooker', 'Rinnai', 'Automatic Gas Rice Cooker\r\nCapacity to cook up to 8Kg of rice in 25 minutes\r\nOne-touch automatic ignition system\r\nAutomatic shut-off device\r\nEnamel finishing for easy cleaning\r\n', 0, 0),
(180, 'POLYTRON RICE COOKER PRC1202P', 349000, 'assets/img/POLYTRON RICE COOKER PRC1202P_349.000.jpg', 'Rice Cooker', 'Polytron', 'SPECIFICATIONS\r\nceramic coating - anti lengket\r\nnasi tahan lama hingga 24 Jam keep warm\r\neasy clean removable inner lid\r\n3 in 1 Cooking\r\nKapasitas: 2 L\r\n', 0, 0),
(181, 'TEFAL RICE COOKER EVERFORCE RK364A67', 949000, 'assets/img/TEFAL RICE COOKER EVERFORCE RK364A67_949.000.jpg', 'Rice Cooker', 'Tefal', 'SPECIFICATIONS\r\nPanci sangat tahan: 2.0mm, 4 lapisan lapisan marmer efek batu dengan tepi bergulir 5.0mm hingga 50% lebih tahan.\r\nKoneksi tutup yang sangat tahan lama hingga 2x lebih kuat.\r\nKapasitas Besar: 2L (11 cangkir) melayani hingga 14 orang.\r\nPanel kontrol yang mudah digunakan.\r\nFungsi: Memasak & Penghangat otomatis (hingga 24 jam).\r\n', 0, 0),
(182, 'OXONE MINI RICE COOKER OX817N_BLACK', 519000, 'assets/img/OXONE MINI RICE COOKER OX817N_BLACK_519.000.jpg', 'Rice Cooker', 'Oxone', 'SPECIFICATION :\r\nRice cooker\r\nHigh Power (280watt) provides delicious rice\r\nAlso cooks rice porridge\r\nInner pot with Fluorine resin coating\r\nCapacity: 0.8 liter\r\n', 0, 0),
(183, 'PHILIPS RICE COOKER HD3119 GREEN', 499000, 'assets/img/PHILIPS RICE COOKER HD3119 GREEN_499.000.jpg', 'Rice Cooker', 'Philips', 'FEATURES\r\n\r\nPelapis anti-gores canggih agar panci tahan lama\r\nSistem pemanasan 3D cerdas memasak nasi secara merata\r\nFungsi tetap hangat otomatis selama 48 jam\r\nLogam paduan ekstra tebal memastikan tiap butir nasi dimasak sempurna\r\nKapasitas ekstra besar 2,0 liter cukup untuk 14 orang\r\nPanci mudah dilepas berkat pegangan yang tetap dingin\r\n\r\nSPECIFICATION\r\n\r\nBahan bodi utama : Plastik\r\nPanjang kabel : 0,8 m\r\nFrekuensi : 50 Hz\r\nVoltase : 220 volt\r\nDaya : 400 W\r\n', 0, 0),
(184, 'MIDEA RICE COOKER MB-FB30M161W', 459000, 'assets/img/MIDEA RICE COOKER MB-FB30M161W_459.000.jpg', 'Rice Cooker', 'Midea', 'SPECIFICATIONS\r\nPower Consumption 605 Watt\r\nCapacity 1 Liter\r\n1.5 mm Pan Coating\r\n6 Menu\r\n', 0, 0),
(185, 'OXONE MARS RICE COOKER OX816_RED', 519000, 'assets/img/OXONE MARS RICE COOKER OX816_RED_519.000.jpg', 'Rice Cooker', 'Oxone', 'SPECIFICATIONS\r\nLapisan Anti Lengket Black Diamond\r\nMultifungsi ; mananak, mengukus, menghangatkan.\r\nTermasuk : Pengukus dan sendok nasi\r\nKapasitas 1.8 Lt\r\nTegangan : 220V-50Hz\r\nMemasak :380 Watt\r\nMenghangatkan : 72 Watt\r\n', 0, 0),
(186, 'TURBO RICE COOKER CRL1185 SERIES', 369000, 'assets/img/TURBO RICE COOKER CRL1185 SERIES_369.000.jpg', 'Rice Cooker', 'Turbo', 'SPECIFICATION\r\nKapasitas: 1.8 Liter\r\nDouble Coating (lapisan ganda) Inner Pot\r\nTerdapat Steam Collector (Pengumpul Uap air)\r\nPattern Bunga yang baru\r\n3in1 Function : Cook, warm, steam\r\nLampu Indikator yang memudahkan Penggunaan\r\n', 0, 0),
(187, 'MIDEA DIGITAL RICE COOKER MB-FS5020W', 659000, 'assets/img/MIDEA DIGITAL RICE COOKER MB-FS5020W_659.000.jpg', 'Rice Cooker', 'Midea', 'SPECIFICATIONS\r\nPower Consumption 760 Watt\r\nCapacity 1.8 Liter\r\nIntelligent Cooking Curve\r\nEffective Heat Transferation\r\nNon-Stick Coating\r\nEven Heating\r\nTurbo Valve\r\nPanci Anti Lengket 6 Lapis\r\n6 Pilihan Fungsi Memasak\r\n', 0, 0),
(188, 'PHILIPS DIGITAL RICE COOKER HD4539/30', 1239000, 'assets/img/PHILIPS DIGITAL RICE COOKER HD4539_1.239.000.jpg', 'Rice Cooker', 'Philips', 'FEATURES\r\n18 presets menu (dengan layar sentuh yang mudah digunakan)\r\nInnerpot dengan lapisan bakuhanseki 8 lapis, lebih tahan lama dibandingkan lapisan anti-lengket\r\nSistem pemanasan 3D cerdas memasak nasi secara merata\r\nFungsi tetap hangat otomatis selama 48 jam\r\n5 pilihan tekstur nasi, mulai dari nasi pulen hingga crispy (nasi claypot) sesuai keinginan\r\nKapasitas 1.5 L, cukup untuk porsi 8 orang\r\nSPECIFICATION\r\nKapasitas : 1,5 l\r\nVoltase : 220 volt\r\nDaya : 900 W\r\n', 0, 0),
(189, 'SAMSUNG KULKAS MULTIDOOR REFRIGERATOR RF48A4010B4', 13899000, 'assets/img/SAMSUNG KULKAS MULTIDOOR REFRIGERATOR RF48A4010B4_13.899.000.jpg', 'Kulkas', 'Samsung', 'SPECIFICATIONS\r\nNet Total(Liter) : 466\r\nGentle Black Matt\r\nTwin Cooling Plus\r\nWater Tank Dispenser\r\nTempered Glass\r\nTwist Ice Maker\r\nO Frost\r\nDeodorizer\r\nDigital Incerter Compressor\r\nRecess Handle\r\nDoor Alarm\r\nPower Cool Function\r\nVacation Mode\r\n', 0, 0),
(190, 'PANASONIC KULKAS MULTIDOOR REFRIGERATOR NRCW530XMMS', 17999000, 'assets/img/PANASONIC KULKAS MULTIDOOR REFRIGERATOR NRCW530XMMS_17.999.000.jpg', 'Kulkas', 'Panasonic', 'SPECIFICATIONS\r\nKapasitas 536 Liter\r\nRefrigerator Capacity(gross): 321 Liter\r\nFreezer Capacity(gross): 215 Liter\r\nPower 70 Watt\r\nInverter\r\nPrime Fresh Freezing\r\nAg Clean Filter\r\nEconavi\r\nFresh Safe\r\n', 0, 0),
(191, 'POLYTRON KULKAS MULTIDOOR REFRIGERATOR PRS510X', 8449000, 'assets/img/POLYTRON KULKAS MULTIDOOR REFRIGERATOR PRS510X_8.449.000.jpg', 'Kulkas', 'Polytron', 'SPECIFICATIONS\r\nCapacity 480 Liter\r\nPower Consumption 170 Watt\r\n4 Door Side by Side\r\nGlass Door\r\nEnergy Saving with Compressor Inverter Technology\r\nLED Touch Panel\r\nChild Lock Protection\r\nDoor Alarm\r\nSmart Defrost System\r\nSmart Control Temperature System\r\nMulti Air Flow\r\n', 0, 0),
(192, 'SHARP KULKAS MULTIDOOR REFRIGERATOR SJIF50PMDS', 8699000, 'assets/img/SHARP KULKAS MULTIDOOR REFRIGERATOR SJIF50PMDS_8.699.000.jpg', 'Kulkas', 'Sharp', 'FEATURES\r\n\r\nInverter Technology\r\nPlasmacluster Ion\r\nLED Touch Control Panel\r\nPlasmacluster LED Lamp Indicator\r\nLED Lamp\r\nTempered Glass Tray\r\n\r\nSPECIFICATION\r\n\r\nDoor Color : Dark Silver Finish\r\nDoor Material : Stainless Steel\r\nCooling System : Fan Cooling Technology\r\nCapacity (Gross / Netto) :472/401\r\nComsumption : 180 Watt\r\nDimensions : 700x795x1800mm\r\n', 0, 0),
(193, 'MIDEA KULKAS MULTIDOOR REFRIGERATOR MDRF632FIF28ID', 7499000, 'assets/img/MIDEA KULKAS MULTIDOOR REFRIGERATOR MDRF632FIF28ID_7.499.000.jpg', 'Kulkas', 'Midea', 'SPECIFICATIONS\r\nCapacity : 470 Liter\r\nPower Consumption : 145 Watt\r\nInverter Quatro\r\nSmart Sensor\r\nVario Box\r\nFresh Keeping Technology\r\nPlatinum Fresh\r\nMulti Air Flow\r\n', 0, 0),
(194, 'LG KULKAS MULTIDOOR REFRIGERATOR GRA24FQSMB', 27369000, 'assets/img/LG KULKAS MULTIDOOR REFRIGERATOR GRA24FQSMB_27.369.000.jpg', 'Kulkas', 'LG', '\r\nSPECIFICATIONS\r\nCapacity 617 Liter\r\nPower Consumption 170 Watt\r\nDoor Cooling+\r\nLinear Cooling\r\nSmart Inverter Compressor\r\nSeamless Instavie Door-In-Doortm\r\nSmart ThinQ (Wi-Fi)\r\n', 0, 0),
(195, 'HITACHI KULKAS MULTIDOOR REFRIGERATOR RWB640PGD1GCK', 17199000, 'assets/img/HITACHI KULKAS MULTIDOOR REFRIGERATOR RWB640PGD1GCK_17.199.000.jpg', 'Kulkas', 'Hitachi', 'SPECIFICATION\r\nDoor	4 Door\r\nCapacity Net Total(Liter)	569\r\nCapacity Net for Freezer(Liter)	100\r\nCapacity Net for Fridge (Liter)	372\r\nTempered Glass Shelves	Yes\r\nCooling System	Inverter x Dual Fan\r\nInverter Technology	Yes\r\nFrost	No\r\nConsumption (W)	160\r\nColor	Black\r\nDimension (WxDXH) mm	900 x 720 x 1840\r\n', 0, 0),
(196, 'ELECTROLUX KULKAS MULTIDOOR REFRIGERATOR EQE5660AS', 18699000, 'assets/img/ELECTROLUX KULKAS MULTIDOOR REFRIGERATOR EQE5660AS_18.699.000.jpg', 'Kulkas', 'Electrolux', 'SPECIFICATION\r\nDoor	4 Door\r\nCapacity Net Total(Liter)	562\r\nCapacity Net for Freezer(Liter)	156\r\nCapacity Net for Fridge (Liter)	406\r\nTempered Glass Shelves	-\r\nCooling System	EvenTemp\r\nInverter Technology	-\r\nFrost	No\r\nConsumption (W)	65\r\nColor	Arctic Silver\r\nDimension (WxDXH) mm	934 x 767 x 1847\r\n', 0, 0),
(197, 'HISENSE KULKAS SIDE BY SIDE REFRIGERATOR RS680SN4IBU', 8399000, 'assets/img/HISENSE KULKAS SIDE BY SIDE REFRIGERATOR RS680SN4IBU_8.399.000.jpg', 'Kulkas', 'Hisense', 'SPECIFICATIONS\r\nCapacity : 566 Liter\r\nLED Touch Control\r\nTotal No Frost\r\nMulti Air Flow\r\nDual Tech Cooling\r\nSuper Freeze\r\nPremium Flat Door Design\r\nFood Organized\r\nChild Lock\r\nHoliday Function\r\nVector Inverter\r\n', 0, 0),
(198, 'CHANGHONG KULKAS SIDE BY SIDE REFRIGERATOR FSS680NIB', 6999000, 'assets/img/CHANGHONG KULKAS SIDE BY SIDE REFRIGERATOR FSS680NIB_6.999.000.jpg', 'Kulkas', 'Changhong', 'SPECIFICATIONS\r\nCapacity 560 Liter\r\nPower COnsumption 120 Watt\r\nSide By Side Doors\r\nTotal No Frost System\r\n3D Multi Air Flow System\r\nSmart Inverter\r\nIntellignt Temperature Control\r\n-32 Celcius Quick Frost\r\nR600A\r\n', 0, 0),
(199, 'AQUA KULKAS MULTIDOOR REFRIGERATOR AQR-IM525AM(GB)', 8899000, 'assets/img/AQUA KULKAS MULTIDOOR REFRIGERATOR AQR-IM525AM(GB)_8.899.000.jpg', 'Kulkas', 'Aqua', 'SPECIFICATIONS\r\nKapasitas : 456 Liter\r\nDaya Konsumsi Listrik : 120 Watt\r\nHCS (Humidity Control System) yang dapat mengatur kelembaban untuk memisahkan makanan yang membutuhkan kelembaban ditempat yang berbeda\r\nDigital Temperature Control dengan layar sentuh dan tampilan LED, anda dapat dengan mudah mengatur suhu di dalam kulkas secara otomatis.\r\nAnti Bacteria (T-ABT) : T-ABT (anti bacteria) Mampu membunuh 99.9% bakteri dan menguraikan kotoran organic. Menciptakan penyimpanan alami dengan udara yang segar, dan merawat bahan makanan agar bersih dan steril dari bakteri.\r\nTwin Invrter membuat kecepatan pendinginan akan lebih optimal sehingga akan membuat listrik lebih stabil dan menjadi irit.\r\nTwist Ice Maker untuk pembuatan es manual dan pilihan cetakan es\r\n', 0, 5),
(200, 'TOSHIBA KULKAS SIDE BY SIDE REFRIGERATOR GR-RS780WE-PMF(06)', 9429000, 'assets/img/TOSHIBA KULKAS SIDE BY SIDE REFRIGERATOR GR-RS780WE-PMF(06)_9.429.000.jpg', 'Kulkas', 'Toshiba', 'SPECIFICATION\r\ncapacity: 562 liter\r\n145 Watt\r\nPurebio\r\nOrigin Inverter\r\nSuper Cooling & Super Freezing\r\nExterior Display\r\nFast Purification\r\n', 0, 0),
(201, 'SHARP SAKURA VIVID KULKAS 1 PINTU 1 DOOR REFRIGERATOR SJN162DSH', 1699000, 'assets/img/SHARP SAKURA VIVID KULKAS 1 PINTU 1 DOOR REFRIGERATOR SJN162DSH_1.699.000.jpg', 'Kulkas', 'Sharp', 'FEATURES\r\n\r\nNew Design Aurora and Color\r\nTempered Glass Tray\r\nLow Wattage and Low Voltage\r\nFull Insulation\r\nWashable Gasket\r\nFresh Room\r\nSemi Automatic Defrost System\r\n\r\nSPECIFICATIONS\r\n\r\nBody Color	Green\r\nCooling System	Direct Cooling\r\nRefrigerant (NON CFC)	HFC-134a\r\nDefrosting	Semi Automatic\r\nCapacity (Gross / Netto)	133 / 128\r\nFreezer (Gross / Netto)	20 / 19\r\nRefrigerator (Gross / Netto)	113 / 109\r\nSource	220 - 240\r\nConsumption ( Watt )	84\r\nDepth	550\r\nWidth	535\r\nHeight\r\n', 3, 0),
(202, 'SANKEN KULKAS 1 PINTU 1 DOOR REFRIGERATOR SK-V198A-BB_M', 1799000, 'assets/img/SANKEN KULKAS 1 PINTU 1 DOOR REFRIGERATOR SK-V198A-BB_M_1.799.000.jpg', 'Kulkas', 'Sanken', 'SPECIFICATIONS\r\nCapacity 190 Liter\r\nPower Consumption 80 Watt\r\nLampu LED\r\nCool Lock Frezeer\r\nDinding HD\r\nPVC Gasket\r\n', 0, 0),
(203, 'LG OBJET KULKAS 2 PINTU BESAR 2 DOOR BIG REFRIGERATOR GCB459QGPB', 12739000, 'assets/img/LG OBJET KULKAS 2 PINTU BESAR 2 DOOR BIG REFRIGERATOR GCB459QGPB_12.739.000.jpg', 'Kulkas', 'LG', 'SPECIFICATIONS\r\nCapacity 344 Liter\r\nPower Consumption 85 Watt\r\nDoor Cooling+\r\nLinear Cooling\r\nSmart Inverter compressor\r\nMulti Ai Flow\r\nMetal Fresh\r\n', 0, 0),
(204, 'SAMSUNG BESPOKE KULKAS 2 PINTU BESAR 2 DOOR BIG REFRIGERATOR RT47CB66228J', 8499000, 'assets/img/SAMSUNG BESPOKE KULKAS 2 PINTU BESAR 2 DOOR BIG REFRIGERATOR RT47CB66228J_8.499.000.jpg', 'Kulkas', 'Samsung', 'FEATURES\r\n\r\nBespoke Design: Desain yang stylish dan unik\r\nSpaceMax: Kapasitas Internal lebih besar\r\nOptimal Fresh+ Ungkep Compartment\r\nDigital Inverter Compressor\r\n\r\nSPECIFICATION\r\n\r\nDoor	2 Door\r\nCapacity Net Total(Liter)	465\r\nCapacity Net for Freezer(Liter)	108\r\nCapacity Net for Fridge (Liter)	357\r\nTempered Glass Shelves	Yes\r\nCooling System	All-Around Cooling\r\nInverter Technology	Yes\r\nFrost	No Frost\r\nConsumption (W)	-\r\nDimension (WxDXH) mm	700 x 717 x 1825\r\n', 0, 0),
(205, 'SANKEN KULKAS 2 PINTU KECIL 2 DOOR SMALL REFRIGERATOR SK-V237F-RD', 3199000, 'assets/img/SANKEN KULKAS 2 PINTU KECIL 2 DOOR SMALL REFRIGERATOR SK-V237F-RD_3.199.000.jpg', 'Kulkas', 'Sanken', 'SPECIFICATIONS\r\n\r\nKapasitas : 230 Liter\r\nCooling System : Direct Cooling\r\nStrong Glass Shelf\r\nFlat Metal Back Cover\r\nBig Freezer & Crisper\r\nFrost Free\r\n', 0, 0),
(206, 'CHANGHONG - SMALL TWO DOOR REFRIGERATOR FTM355NB_3.849.000', 3849000, 'assets/img/CHANGHONG - SMALL TWO DOOR REFRIGERATOR FTM355NB_3.849.000.jpg', 'Kulkas', 'Changhong', 'SPECIFICATIONS\r\nCapacity 275 Liter\r\nPower Consumption 120 Watt\r\nNo Frost\r\nMulti Air Flow\r\nLed Light\r\nFrameless Design\r\nBig Compartement\r\n', 0, 0),
(207, 'POLYTRON KULKAS COMPACT REFRIGERATOR PRH51 SERIES', 1299000, 'assets/img/POLYTRON KULKAS COMPACT REFRIGERATOR PRH51 SERIES_1.299.000.jpg', 'Kulkas', 'Polytron', 'SPECIFICATIONS\r\nCapacity 50 Liter\r\nPower Consumption 60 Watt\r\nRefrigerator Pocket : 2\r\nIce Tray\r\nGlass Shelf\r\nGlass Door\r\n', 0, 0),
(208, 'POLYTRON KULKAS 1 PINTU 1 DOOR REFRIGERATOR PRA18MOW', 1799000, 'assets/img/POLYTRON KULKAS 1 PINTU 1 DOOR REFRIGERATOR PRA18MOW_1.799.000.jpg', 'Kulkas', 'Polytron', 'SPECIFICATIONS\r\nCapacity 180 Liter\r\nPower Consumption 75 Watt\r\nTempered Glass Door\r\nTempered Glass Rack\r\nNon Handle\r\n', 0, 0),
(246, 'MEVAL LED BULB 20W AB1-20A', 69000, 'assets/img/MEVAL LED BULB 20W AB1-20A_69.000.jpg', 'Lampu', 'MEVAL', 'Jenis Produk : Lampu LED, Warna Lampu : Putih, Kapasitas : 20 Watt, Lumens : 2450 Lumens, Umur Lampu : 15.000 Jam', 0, 0),
(247, 'MEVAL LED BULB 18W AB1-18A', 60000, 'assets/img/MEVAL LED BULB 18W AB1-18A_60.000.jpg', 'Lampu', 'MEVAL', 'Jenis Produk : Lampu LED, Warna Lampu : Putih, Kapasitas : 18 Watt, Lumens : 2000 Lumens, Umur Lampu : 15.000 Jam', 0, 0),
(248, 'MEVAL LED BULB 15W AB1-15A', 55000, 'assets/img/MEVAL LED BULB 15W AB1-15A_55.000.jpg', 'Lampu', 'MEVAL', 'Jenis Produk : Lampu LED, Warna Lampu : Putih, Kapasitas : 15 Watt, Lumens : 1521 Lumens (101 Lumens/Watt), Umur Lampu : 15.000 Jam', 0, 0),
(249, 'PHILIPS SINGLE BULB 10W A60 E27', 889000, 'assets/img/PHILIPS SINGLE BULB 10W A60 E27_889.000.jpg', 'Lampu', 'PHILIPS', 'Warna Cahaya: Putih, Kapasitas: 10 Watt, Lumens AC: 900 Lumens (90 Lumens/Watt), Lumens DC (Pada saat mati lampu): 540 Lumens (Masih 60% Terangnya dibandingkan AC), Kapasitas Baterai: 3.7V 2000mAh Lithium Ion, Voltage: AC 100 - 240V 50/60 Hz, Umur Lampu: 15.000 Jam', 0, 0),
(250, 'PHILIPS COL HUE GO V2 GM', 1119000, 'assets/img/PHILIPS COL HUE GO V2 GM_1.119.000.jpg', 'Lampu', 'PHILIPS', 'Synthesis Materials, Color-changeable, dimmable, portable, power adapter included, Table lamp type, 20,000 hour lifetime, 43 Watt power consumption, 520 lumens, Light color 2000-6500 Hue White Color Ambiance, White color', 0, 0),
(251, 'MEVAL SHELL DOWNLIGHT AR3-06B', 45000, 'assets/img/MEVAL SHELL DOWNLIGHT AR3-06B_45.000.jpg', 'Lampu', 'MEVAL', 'Control via Bluetooth, apps, and voice commands, LED light technology, 60mm diameter, 220V-240V input voltage, 25,000 hours lifetime, 0.5 Watt power consumption', 0, 0),
(252, 'MEVAL MAGIC BULB 10W MP3-10A', 80000, 'assets/img/MEVAL MAGIC BULB 10W MP3-10A_80.000.jpg', 'Lampu', 'MEVAL', 'IT Smart Filament Bulb, IT Smart - App control, Brightness Adjustable, Schedule Setting, Dimmable', 0, 0),
(253, 'MEVAL MAGIC BULB 7W MP3-07A', 70000, 'assets/img/MEVAL MAGIC BULB 7W MP3-07A_70.000.jpg', 'Lampu', 'MEVAL', 'Warna Cahaya: Putih, Kapasitas: 7 Watt, Lumens: 630 Lumens (90 Lumens/Watt), Kapasitas Baterai: 3.7V 2000mAh Lithium Ion, Voltage: AC 100 - 240V 50/60 Hz, Umur Lampu: 15.000 Jam', 0, 0),
(254, 'MEVAL LED WIFI SMART BULB AF9-12M', 125000, 'assets/img/MEVAL LED WIFI SMART BULB AF9-12M_125.000.jpg', 'Lampu', 'MEVAL', 'Dimmable: Yes, Base: E27, Input Voltage: AC 220 - 240V, Frequency: 50 Hz, Wattage: 12W, Color Temperature: 2700K-6500K + RGB, Environment temperature (°C): -20° ~ + 45° C, 2.200 Lumens', 0, 0),
(255, 'MEVAL LED WIFI SMART BULB AF9-09M', 115000, 'assets/img/MEVAL LED WIFI SMART BULB AF9-09M_115.000.jpg', 'Lampu', 'MEVAL', 'Kontrol lampu dengan menggunakan telepon pintar melalui koneksi wi-fi/hotspot, Kontrol lampu dapat menggunakan suara (mendukung Alexa, Siri, dan Google Assistant), Dengan kecerahan maksimal 896 lumens, lampu ini juga dapat diredupkan, Kombinasi warna RGB hingga 16 juta warna, Memiliki gradasi cahaya putih, dari 2700 k (warm white) sampai 6500 k (cool white), Pilihan suasana lampu yang dapat disesuaikan dengan kondisi ruangan, Dapat berubah ubah warna mengikuti alunan music, Sangat mudah dipasang, karena sesuai untuk rumah lampu (fitting) E27 yang sangat umum dipergunakan, Wattage : 12W, Lumens : 1150 lumens', 0, 0),
(259, 'MEVAL LED BULB 13W AB1-13A', 49000, 'assets/img/MEVAL LED BULB 13W AB1-13A_49.000.jpg', 'Lampu', 'MEVAL', 'Jenis Produk : Lampu LED, Warna Lampu : Putih, Kapasitas : 13 Watt, Lumens : 1200 Lumens (92 Lumens/Watt), Umur Lampu : 15.000 Jam', 0, 0),
(260, 'MEVAL LED BULB 11W AB1-11B', 40000, 'assets/img/MEVAL LED BULB 11W AB1-11A_40.000.jpg', 'Lampu', 'MEVAL', 'Jenis Produk : Lampu LED, Warna Lampu : Kuning, Kapasitas : 11 Watt, Lumens : 980 Lumens, Umur Lampu : 15.000 Jam', 0, 0),
(261, 'MEVAL LED BULB 5W AB1-05B', 20000, 'assets/img/MEVAL LED BULB 5W AB1-05B_20.000.jpg', 'Lampu', 'MEVAL', 'Jenis Produk : Lampu LED, Warna Lampu : Kuning, Kapasitas : 5 Watt, Lumens : 380 Lumens (76 Lumens/Watt), Umur Lampu : 15.000 Jam', 0, 0),
(262, 'MEVAL LED BULB 9W AB1-09B', 35000, 'assets/img/MEVAL LED BULB 9W AB1-09B_35.000.jpg', 'Lampu', 'MEVAL', 'Jenis Produk : Lampu LED, Warna Lampu : Kuning, Kapasitas : 9 Watt, Lumens : 760 Lumens (84 Lumens/Watt), Umur Lampu : 15.000 Jam', 0, 0),
(263, 'MEVAL DOWNLIGHT TRICOLOR AR5-15M', 90000, 'assets/img/MEVAL DOWNLIGHT TRICOLOR AR5-15M_90.000.jpg', 'Lampu', 'MEVAL', 'Jenis Produk : Lampu LED Slim Downlight Tri-Color, Warna Lampu : Daylight - Warm White - Cool White (Tri-Color), Kapasitas : 15 Watt, Lumens : 1400 Lumens, Diameter Pasang : 6 Inch', 0, 0),
(264, 'IMMERSIVE TECH SMART FILAMENT BULB BRONZ', 279000, 'assets/img/IMMERSIVE TECH SMART FILAMENT BULB BRONZ_279.000.jpg', 'Lampu LED', 'IMMERSIVE TECH', 'Jenis Produk : Lampu LED, Warna Lampu : Putih, Kapasitas : 11 Watt, Lumens : 1100 Lumens (100 Lumens/Watt), Umur Lampu : 15.000 Jam', 0, 0),
(265, 'DEON SMART BULB RGBWW FILAMENT', 95000, 'assets/img/DEON SMART BULB RGBWW FILAMENT_95.000.jpg', 'Lampu', 'DEON', 'Kontrol lampu dengan menggunakan telepon pintar melalui koneksi wi-fi/hotspot, Kontrol lampu dapat menggunakan suara (mendukung Alexa, Siri, dan Google Assistant), Dengan kecerahan maksimal 896 lumens, lampu ini juga dapat diredupkan, Kombinasi warna RGB hingga 16 juta warna, Memiliki gradasi cahaya putih, dari 2700 k (warm white) sampai 6500 k (cool white), Pilihan suasana lampu yang dapat disesuaikan dengan kondisi ruangan, Dapat berubah ubah warna mengikuti alunan music, Sangat mudah dipasang, karena sesuai untuk rumah lampu (fitting) E27 yang sangat umum dipergunakan, Wattage : 9W, Lumens : 896 lumens', 0, 0),
(266, 'DEON SMART BULB RGBWW 12W', 109000, 'assets/img/DEON SMART BULB RGBWW 12W_109.000.jpg', 'Lampu', 'DEON', 'Dimmable: Yes, Base: E27, Input Voltage: AC 220 - 240V, Frequency: 50 Hz, Wattage: 12W, Color Temperature: 2700K-6500K + RGB, Environment Temperature (°C): -20° ~ + 45° C, 900 Lumens', 0, 4),
(267, 'DEON SMART BULB RGBWW 9W', 89000, 'assets/img/DEON SMART BULB RGBWW 9W_89.000.jpg', 'Lampu', 'DEON', 'Dimmable: Yes, Base: E27, Input Voltage: AC 220 - 240V, Frequency: 50 Hz, Wattage: 9W, Color Temperature: 2700K-6500K + RGB, Environment Temperature (°C): -20° ~ + 45° C, 1.500 Lumens', 0, 0),
(268, 'IMMERSIVE TECH SMART FILAMENT BULB BRONZ', 279000, 'assets/img/IMMERSIVE TECH SMART FILAMENT BULB BRONZ_279.000.jpg', 'Lampu', 'IMMERSIVE TECH', 'IT Smart Filament Bulb, IT Smart - App control, Brightness Adjustable, Schedule Setting, Dimmable', 0, 0),
(389, 'LENOVO LED MONITOR L24M-40', 2099000, 'assets/img/LENOVO LED MONITOR L24M-40_2.099.000.jpg', 'Monitor', 'Lenovo', 'SPECIFICATIONS Display Size : 23.8 inches Aspect Ratio : 16:9 Resolution : 1920 x 1080 Display Panel : IPS Max View Area : 527.0 x 296.5 mm Refresh Rate : 100Hz (HDMI® only) Dot / Pixel Per Inch : 93 dpi Contrast Ratio : 1300:1 AMD FreeSync Ultraslim Response Time : 4 ms Operating System : Windows 10 Support | Windows 11 Support Stand support Pivot, Swivel & tilt Power Consumption : Typical / Max: 15W / 124W', 1000, 0),
(390, 'SAMSUNG 27 LED MONITOR LF27T450FQEXXD', 2149000, 'assets/img/SAMSUNG 27 LED MONITOR LF27T450FQEXXD_2.149.000.jpg', 'Monitor', 'Samsung', 'Spesification IPS Panel 3-sided borderless design Ergonomic Stand Tilt / Portrait / Landscape Game Mode AMD FreeSync 75Hz Refresh Rate Resolution : 1.920 x 1.080 Screen Size : 27\" Viewing Angle (H/V) : 178°/178° Color Gamut (NTSC 1976) : 72% (CIE 1931)', 99, 1),
(391, 'ACER 23.8 GAMING MONITOR VG241Y_X', 3899000, 'assets/img/ACER 23.8 GAMING MONITOR VG241Y_X_3.899.000.jpg', 'Monitor', 'Acer', 'Spesification Acer Nitro VG241Y_X IPS 23.8\" Wide (16:9) 1920 x 1080 @ 270hz Response time 0.5 ms Brightness 350 nits (cd/m2)  ', 100, 0),
(392, 'LENOVO GAMING MONITOR R27Q-30', 3499000, 'assets/img/LENOVO GAMING MONITOR R27Q-30_3.499.000.jpg', 'Monitor', 'Lenovo', 'Spesification Display Size : 27 inches Aspect Ratio : 16:9 Resolution : 2560 x 1440 Display Panel : IPS Max View Area : 596.7 x 335.7 mm Refresh Rate : 165Hz (Overclock to 180Hz) Dot / Pixel Per Inch : 109 dpi Contrast atio : 1000:1 Response Time : 0.5 ms AMD FreeSync Premium ', 99, 0),
(393, 'SAMSUNG 24 LED MONITOR LS24C330GAEXXD_1.369.000(5)', 1369000, 'assets/img/SAMSUNG 24 LED MONITOR LS24C330GAEXXD_1.369.000.jpg', 'Monitor', 'Samsung', 'Spesification Screen Size (Class): 24 Aspect Ratio: 16:9\r\nPanel Type: IPS The IPS screen provides enriched viewing experience Seamless gaming experience with AMD FreeSync, 100Hz refresh rate and Game Mode\r\nComfortable Eye Care with Eye Saver mode and less screen flickerin\r\n', 93, 7),
(394, 'ACER 23.8 LED MONITOR K243Y_E', 1299000, 'assets/img/ACER 23.8 LED MONITOR K243Y_E_1.299.000.jpg', 'Monitor', 'Acer', 'Spesification Response time 1ms & Refresh rate 100Hz dan AMD FreeSync utk pengalaman gaming dengan blur yg minimal pada gambar berkecepatan tinggi\r\nIPS Monitor dengan Design ZeroFrame sehingga tampilan layar lebih luas serta tampak lebih stylish serta sudah dilengkapi dengan Speaker Internal\r\nNyaman dengan fitur Bluelight Shield, Flicker Free, Comfyview, Low Dimming technology dan Desain Ergonomis\r\nDisplay : 23.8, FHD (1980x1080), 100Hz\r\nResponse Time : 1ms (VRB)\r\nInput Interface : VGA + HDMI(1.4) + Audio In + Audio Out + Speakers (2Wx2)\r\nFeatures: : 6-Axis Color Adjustment, Super Sharpness, Bluelight Shield, Flicker Free, Comfyview, Low Dimming dan Desain Ergonomis', 91, 9),
(395, 'SAMSUNG 43 SMART MONITOR LS43BM702UEXXD_DS', 5399000, 'assets/img/SAMSUNG 43 SMART MONITOR LS43BM702UEXXD_DS_5.399.000.jpg', 'Monitor', 'Samsung', 'Specification Screen Size : 43\"\r\nActive Display Size : 941.184x529.416 mm\r\nAspect Ratio : 16:9\r\nBrightness : 300 cd/?\r\nResolution : 3,840 x 2,160\r\nOperating System : Tizen\r\nHDMI : 2\r\nUSB : 3\r\n', 100, 0),
(396, 'SAMSUNG 32 SMART MONITOR LS32BM700UEXXD_DS_4.799.000', 4799000, 'assets/img/SAMSUNG 32 SMART MONITOR LS32BM700UEXXD_DS_4.799.000.jpg', 'Monitor', 'Samsung', 'Specifications Screen Size : 32 Inch\r\nAspect Ratio : 16:9\r\nResolution : 3840 x 2160\r\nOperating System : Tizen\r\nMobile connectivity via wireless DeX, Tap View and mirroring\r\nRemote Access\r\nSmart Monitor\r\nPort HDMI : 2\r\nPort USB : 3\r\n', 15, 0),
(397, 'LG 21,45 GAMING MONITOR 22MR410-B_GS_1.099.000', 1099000, 'assets/img/LG 21,45 GAMING MONITOR 22MR410-B_GS_1.099.000.jpg', 'Monitor', 'LG', 'Specifications Screen Size : 43\"\r\nActive Display Size : 941.184x529.416 mm\r\nAspect Ratio : 16:9\r\nBrightness : 300 cd/?\r\nResolution : 3,840 x 2,160\r\nOperating System : Tizen\r\nHDMI : 2\r\nUSB : 3\r\n', 15, 0),
(398, 'LENOVO 27 LED MONITOR Q27q-20', 3099000, 'assets/img/LENOVO 27 LED MONITOR Q27q-20_3.099.000.jpg', 'Monitor', 'Lenovo', ' Specifications : Monitor Q27q-20\r\nDisplay Size 27 Inch\r\nResolution 2560 x 1440(QHD/2K) IPS PANEL\r\nAspect Ratio 16:9\r\nResponse Time 8 ms\r\n1x DP 1.2\r\n1x HDMI 2.0 Port\r\n', 15, 0),
(399, 'LENOVO 34 GAMING MONITOR G34W-30_5.749.000(11)', 57499000, 'assets/img/LENOVO 34 GAMING MONITOR G34W-30_5.749.000.jpg', 'Monitor', 'Lenovo', ' Specifications : LENOVO GAMING MONITOR G34w-30\r\nUkuran Panel : 34 inch\r\nResolusi : 3440 X 1440\r\nKecepatan Refresh : 170 Hz\r\nWaktu Respons : 0.5 ms\r\nRasio aspek : 21 : 9\r\nDisplay : CURVED\r\nTipe Panel : VA PANEL\r\nKonsumsi Daya : 60 W\r\n2 X HDMI Port', 100, 0),
(400, 'LG 18,5 LED MONITOR IPS 19M38A_CP', 939000, 'assets/img/LG 18,5 LED MONITOR IPS 19M38A_CP_939.000.jpg', 'Monitor', 'LG', ' FEATURES :\r\nRed/Green Color Weakness\r\nSmart Energy Saving\r\nEye Comforts\r\nMultitasking & Easy to Use\r\nSPECIFICATION :\r\nModule : 18.5” LED\r\nResolusi : 1366 x 768\r\nInterface : D - Sub\r\n', 100, 0),
(401, 'LG 21.5 MONITOR LED 20MK400H-B', 1099000, 'assets/img/LG 21.5 MONITOR LED 20MK400H-B_1.099.000.jpg', 'Monitor', 'LG', ' FEATURES:\r\nMode Membaca\r\nBebas flicker\r\nSinkro Action Dinamis\r\nBlack Stabilizer\r\nKontrol pada layar\r\nPemasangan di Dinding\r\nSPECIFICATION :\r\nUkuran (Inci/cm) : 19.5\"\r\nResolusi : 1366 x 768\r\nRasio Aspek : 16:09\r\nKecerahan (Biasa) : 200cd/m2(Biasa) 160cd/m2(Min.)\r\nKedalaman Warna (Jumlah Warna) :16.7 Juta Warna\r\nRasio Kontras (DFC) : Mega\r\nHDMI : 1\r\nD-Sub : 1\r\n', 100, 0),
(402, 'SAMSUNG 24 CURVED LED MONITOR LC24F390FHEXXD', 1429000, 'assets/img/SAMSUNG 24 CURVED LED MONITOR LC24F390FHEXXD_1.429.000.jpg', 'Monitor', 'Samsung', ' SPECIFICATION :\r\nResolution : 1920x1080\r\nAspect Ratio : 16:9\r\nScreen Curvature : 1800R\r\nBrightness (Typical) : 250cd/m2\r\nResponse Time : 4(GTG)\r\nContrast Ration Static : 3000:1(Typ.)\r\n', 100, 0),
(403, 'ACER 21,5 FULL HD LED MONITOR EK221QE3bi', 1049000, 'assets/img/ACER 21,5 FULL HD LED MONITOR EK221QE3bi_1.049.000.jpg', 'Monitor', 'Acer', ' FEATURES :\r\nTampilan yang smooth dengan 100Hz refresh rate & sRGB 99%\r\nPerlindungan yang menciptakan kenyamanan pengguna : Flicker-less Technology, BluelightShield Technology, Acer ComfyView, Low-dimming\r\nBebas Tearing dengan AMD FreeSync Technology\r\nSPECIFICATIONS :\r\nDisplay : 21.5\"\r\nResponse Time : 1ms(VRB)\r\nInput Interface : VGA+HDMI(1.4)\r\nDisplay Screen Technology : IPS Zero Frame\r\nScreen Mode : Full HD @100Hz\r\nScreen Resolution : 1920 x1080', 100, 0),
(404, 'LG 31,5 4K UHD MONITOR 34WQ500-B', 4899000, 'assets/img/LG 31,5 4K UHD MONITOR 34WQ500-B_4.899.000.jpg', 'Monitor', 'LG', ' Specifications :Screen Size : 31.5\"\r\nResolution : 3840 x 2160\r\n60Hz Refresh Rate\r\nAMD FreeSync\r\nAspect Ratio: 16:9\r\n100x100 Wall Mount\r\n2xHDMI Port\r\n', 100, 0),
(405, 'LENOVO 18,5 LED MONITOR D19-10 61E0KAR6ID', 899000, 'assets/img/LENOVO 18,5 LED MONITOR D19-10 61E0KAR6ID_899.000.jpg', 'Monitor', 'Lenovo', ' Specifications :Lenovo D19-10\r\nDispay 18.5\"\r\nResolution 1366 x 768\r\nAspect Ratio 16:9\r\nRefresh Rate 60 Hz\r\nTwisted Nematic panel\r\n85 dpi\r\n72% NTSC\r\n1x HDMI 1.4, 1x VGA\r\n12 watt', 100, 0),
(406, 'SAMSUNG 49 GAMING MONITOR ODYSSEY G9 CURVED LC49G95TSSEXXD_DS', 18449000, 'assets/img/SAMSUNG 49 GAMING MONITOR ODYSSEY G9 CURVED LC49G95TSSEXXD_DS_18.449.000.jpg', 'Monitor', 'Samsung', ' Specifications :Layar 48.7 Inch Curved\r\nVA Panel\r\nAspect Ratio 32:9\r\nResolution 5120X1440\r\nResponse Time 1ms\r\nRefresh Rate 240Hz\r\n1x HDMI Port\r\n108W When Plugged\r\nWall Mount 100x100 mm\r\n', 100, 0),
(407, 'LG 29 ULTRAWIDE FHD HDR MONITOR 29WP60G-B', 2899000, 'assets/img/LG 29 ULTRAWIDE FHD HDR MONITOR 29WP60G-B_2.899.000.jpg', 'Monitor', 'LG', ' Specifications : Size : 29\"\r\nDisplay Type : IPS\r\nAspect Ratio : 21:9\r\nResolution : 2560 x 1080\r\nDisplay Resolution : UW-FHD\r\nRefresh Rate : 75Hz\r\nHDMI : Yes x 1\r\nDisplayPort : Yes x 1\r\nHeadphone Out : Yes\r\nUSB Type-C Connectivity\r\nAdaptive Sync : AMD FreeSync\r\n1ms Response Time with MBR\r\n3-Side Virtually Borderless Display\r\nSpeaker : No Built-in Speaker\r\n', 100, 0),
(408, 'LG 27 ULTRAGEAR QHD IPS GAMING MONITOR 27GP850-B_6.899.000', 6899000, 'assets/img/LG 27 ULTRAGEAR QHD IPS GAMING MONITOR 27GP850-B_6.899.000.jpg', 'Monitor', 'LG', ' Specifications: Size : 27\"\r\nDisplay Type : IPS\r\nAspect Ratio : 16:9\r\nResolution : 2560 x 1440\r\nDisplay Resolution : QHD\r\nRefresh Rate : 165Hz (O/C 180Hz)\r\nHDMI : Yes x 2\r\nDisplayPort : Yes x 1\r\nHeadphone Out : Yes\r\nNVIDIA G-Sync : G-SYNC Compatible\r\nAdaptive Sync : AMD FreeSync Premium\r\nVESA DisplayHDR : DisplayHDR 400\r\n3-Side Virtually Borderless Display\r\nTilt/Height/Pivot Adjustable Stand\r\nSpeaker : No Built-in Speaker\r\n', 100, 0);
INSERT INTO `tb_barang` (`id_barang`, `nama_barang`, `harga`, `img`, `kategori`, `merk`, `keterangan`, `stok`, `terjual`) VALUES
(429, 'SHARP AC SPLIT AIR CONDITIONER STANDARD AHAZCY SERIES', 2849000, 'assets/img/SHARP AC SPLIT AIR CONDITIONER STANDARD AHAZCY SERIES_2.849.000 (1).jpg', 'AC', 'Sharp', ' Harga Produk Air Conditioner adalah Unit saja.\r\nBelum termasuk Biaya Pasang, Bracket ( Outdoor ), Pipa AC, Stecker Listrik dan Pipa Pembuangan.\r\nSPECIFICATIONS :\r\n1/2 PK | 344 Watt | 5.000 Btu/h\r\n1 PK | 765 Watt | 9.000 Btu/h\r\n1.5 PK | 1035 Watt | 11500 Btu/h\r\n2 PK | 1640 Watt | 17500 Btu/h\r\nGold Fin on Evaporator\r\nLED Display Temperature\r\nSleep Mode\r\n', 100, 0),
(430, 'AKARI 2 PK AC SPLIT LOW WATT AIR CONDITIONER A18E7LWI', 5199000, 'assets/img/AKARI 2 PK AC SPLIT LOW WATT AIR CONDITIONER A18E7LWI_5.199.000(2).jpg', 'AC', 'Akari', ' Specifications : 2 PK | 1480 Watt | 18000 Btu/h\r\nDigital Display 4 Swing Gold Fin Nano Silver Filter Eco Mode Auto Restart On/Off Tmer ', 100, 0),
(431, 'PANASONIC 5 PK AC FLOOR STANDING AIR CONDITIONER CSJ45FFP8', 25999000, 'assets/img/PANASONIC 5 PK AC FLOOR STANDING AIR CONDITIONER CSJ45FFP8_25.999.000(3).jpg', 'AC', 'Panasonic', ' Specifications : Power Source : 380 V, 3Ø phase - 50Hz\r\nCooling Capacity : 12.40 kW, 42,300 Btu/h\r\nCurrent : 8.70 A\r\nPower Input : 4.88 kW\r\nEER : 8.66 Btu/hW, 2.54 W/W\r\nAir Volume : 27.0 m³/min\r\nSound Pressure Level* (Hi/Lo/Q-Lo) : 53/47 dB(A)\r\n', 100, 0),
(432, 'PANASONIC 2.5 PK AC SPLIT AIR CONDITIONER STANDARD INVERTER CSPU24XKJ', 13899000, 'assets/img/PANASONIC 2.5 PK AC SPLIT AIR CONDITIONER STANDARD INVERTER CSPU24XKJ_13.899.000(4).jpg', 'AC', 'Panasonic', ' Specifications : Kapasitas Pendinginan : 6,10 (1,12-6,90) kW | 20.800 (3.820-23.500) Btu/h\r\nEER (rated) : 11.95 (10,68-11,58)\r\nVoltase : 220 V\r\nArus Daya : 8 A\r\nDaya Listrik (min-max) : 1.740 (330-2.200) W\r\nInverter\r\nECO Mode\r\n', 100, 0),
(433, 'POLYTRON 2 PK AC FLOOR STANDING AIR CONDITIONER PSF2032', 8099000, 'assets/img/POLYTRON 2 PK AC FLOOR STANDING AIR CONDITIONER PSF2032_8.099.000_(5).jpg', 'AC', 'Polytron', ' Specifications : High Density Filter\r\nTurbo Mode\r\nSleep Mode\r\nAuto Self Diagnosis\r\nAuto Restart\r\nAuto Cleaning\r\n4-Way Auto Swing\r\nTimer\r\nDigital Display\r\nI-Feel\r\nEasy to Clean\r\nRefrigerant R32\r\nRated Power : 1600W\r\n', 100, 0),
(434, 'MIDEA AC SPLIT AIR CONDITIONER STANDARD NEW SERIES_4.999.000(6).jpg', 4999000, 'assets/img/MIDEA AC SPLIT AIR CONDITIONER STANDARD NEW SERIES_4.999.000(6).jpg', 'AC', 'Midea', ' Specifications : 1,5 PK | 1035 Watt | 11500 Btu/h\r\n2 PK | 1640 Watt | 17500 Btu/h\r\nSelf-Diagnosis & Auto-Protection\r\nFollow Me\r\nTurbo Cool\r\nLow Voltage\r\nSelf Cleaning\r\nCod Catalyst Filter', 100, 0),
(435, 'CHANGHONG AC SPLIT AIR CONDITIONER LOW WATT RDX4 SERIES', 2699000, 'assets/img/CHANGHONG AC SPLIT AIR CONDITIONER LOW WATT RDX4 SERIES_2.699.000(7).jpg', 'AC', 'CHANGHONG', ' Specifications : 0.5 PK | 383Watt | R32 | 4500BTU\r\n1 PK | 696Watt | R32 | 7900Btu\r\nLow Watt\r\nGolden Arc Evaporator\r\nDouble Filter\r\nAuto Clean\r\nSleep Mode\r\nLED Display\r\nAuto Diagnosis\r\nInner Grooved Cooper Pipe\r\n24 Hour On Off Timer\r\n ', 100, 0),
(436, 'POLYTRON AC SINGLE SPLIT AIR CONDITIONER STANDARD NEUVA PRO PACVZ SERIES_2.599.000(8).jpg', 2599000, 'assets/img/POLYTRON AC SINGLE SPLIT AIR CONDITIONER STANDARD NEUVA PRO PACVZ SERIES_2.599.000.jpg', 'AC', 'Polytron', ' Specifications : 0.5 PK| 450 Watt| 6000 Btu/h\r\n1 PK| 790 Watt | 9500 Btu/h\r\n1,5 PK| 990 Watt | 12000 Btu/h\r\n2 PK | 1590 Watt | 18000 Btu/h\r\nLeakage Detector\r\nSoft Start\r\nCarbon +HEPA Filter\r\nAuto Cleaning\r\nAuto Start\r\nEER 4 Stars\r\nHigh CoolingCapacity\r\nGold Fin\r\nTurbo Mode\r\nHighDensity Filter\r\n', 100, 0),
(437, 'AQUA AC SPLIT AIR CONDITIONER STANDARD IONIZER UV COOL AQAK-FQBL SERIES_5.849.000(9)I', 5849000, 'assets/img/AQUA AC SPLIT AIR CONDITIONER STANDARD IONIZER UV COOL AQAK-FQBL SERIES_5.849.000.jpg', 'AC', 'Aqua', ' Specifications : 0.5 PK | 360 Watt | 5000 Btu/h\r\n1 PK | 680 Watt | 9000 Btu/h\r\n2 PK | 1750 Watt | 19000 Btu/h\r\nUVC Sterilization\r\nWide Voltage\r\nAntiCorrion System\r\nTripe Airflow\r\n', 100, 0),
(438, 'PANASONIC AIR CURTAIN FY-4009U1NAN_7.059.000(10)I', 7059000, 'assets/img/PANASONIC AIR CURTAIN FY-4009U1NAN_7.059.000(10).jpg', 'AC', 'Panasonic', ' Specifications :Power COnsumption 110 Watt\r\n1340 CMH\r\n789 CFM\r\n54.5 dB\r\n', 100, 0),
(439, 'LG AC SPLIT AIR CONDITIONER NEW INVERTER SERIES', 3989000, 'assets/img/LG AC SPLIT AIR CONDITIONER NEW INVERTER SERIES_3.989.000(11).jpg', 'AC', 'LG', ' FEATURES :( AHXP6BMY)\r\nInverter\r\nNatural Wind (Auto Wind)\r\nPrefilter (washable/Anti-Bacteria)\r\nSelf Diagnosis\r\nAuto Cleaning (Coil Dry)\r\nEnergy Control\r\nSPECIFICATION:\r\n0.5 PK Btu/h : 5.000 | Daya Listrik : 420 Watt\r\n1.0 PK Btu/h : 8.800 | Daya Listrik : 920 Watt\r\n1.5 PK Btu/h : 11.000 | Daya Listrik : 1.150 Watt\r\n2.0 PK Btu/h : 17.000 | Daya Listrik : 1.840 Watt\r\n', 100, 0),
(440, 'LG AC STANDING FLOOR STANDING AIR CONDITIONER ZPNQ48LT3A0', 25999000, 'assets/img/LG AC STANDING FLOOR STANDING AIR CONDITIONER ZPNQ48LT3A0_25.999.000(12).jpg', 'AC', 'LG', ' Specifications : 5 PK | 48950 BTU/h | 4810 Watt\r\nInverter\r\nStylish Design\r\nPowerful Air flow\r\nEasy Power Cooling Mode\r\nPowerful & Even Air Distrbution\r\n', 100, 0),
(441, 'SHARP 1 PK AC PORTABLE AIR CONDITIONER CVP10ZCY', 5299000, 'assets/img/SHARP 1 PK AC PORTABLE AIR CONDITIONER CVP10ZCY_5.299.000(13).jpg', 'AC', 'Sharp', ' Specifications : 1 PK | 860W\r\n4 Mode Setting (Fan, Dry, Cool, Auto)\r\nCompact Size\r\nPlasmacluster Ion Generator\r\nDehumidifier + Sleep Operation\r\nAuto Restart + Ion Generator Mode\r\nRefresh Operation\r\n', 100, 0),
(442, 'HISENSE AC SPLIT AIR CONDITIONER STANDARD CDG SERIES', 5399000, 'assets/img/HISENSE AC SPLIT AIR CONDITIONER STANDARD CDG SERIES_5.399.000(14).jpg', 'AC', 'Hisense', ' Specifications : 1,5 PK | 1019 Watt | 12000 Btu/h\r\n2 PK | 1589 Watt | 18000 Btu/h\r\n4-1 Filter\r\nSmart Mode\r\nSuperMode\r\nSuper Quiet (low to 22dB)\r\nLED Display\r\nSelf Clean', 100, 0),
(443, 'AKARI 1.5 PK AC SPLIT LOW WATT AIR CONDITIONER A12E7LWI', 3999000, 'assets/img/AKARI 1.5 PK AC SPLIT LOW WATT AIR CONDITIONER A12E7LWI_3.999.000(15).jpg', 'AC', 'Akari', ' Specifications : 1.5 PK | 990 Watt| 12000 Btu/h\r\nDigital Display\r\n4 Swing\r\nGold Fin\r\nNano Silver Filter\r\nEco Mode\r\nAuto Restart', 100, 0),
(444, 'AKARI AC SPLIT STANDARD AIR CONDITIONER TC88LWI SERIES_2.659.000(16).jpg', 2659000, 'assets/img/AKARI AC SPLIT STANDARD AIR CONDITIONER TC88LWI SERIES_2.659.000(16).jpg', 'AC', 'Akari', ' Specifications : 1/2 PK | 400 Watt | 5200 Btu/h\r\n1 PK | 740 Watt | 9300 Btu\r\nFilter Purifier\r\nGold Fin Shield\r\n', 100, 0),
(445, 'AKARI 5 PK AC FLOOR STANDING AIR CONDITIONER AFS5398GLWI', 15699000, 'assets/img/AKARI 5 PK AC FLOOR STANDING AIR CONDITIONER AFS5398GLWI_15.699.000(17).jpg', 'AC', 'Akari', ' Specifications : 5 PK\r\n4800 Watt\r\n48000 Btu/h\r\nLow Noise\r\nTurbo Cooling\r\nBig Fan\r\nNano Silver Filter\r\n ', 100, 0),
(446, 'PANASONIC AC SPLIT AIR CONDITIONER STANDARD LOW WATT CSKN WKJ SERIES', 4499000, 'assets/img/PANASONIC AC SPLIT AIR CONDITIONER STANDARD LOW WATT CSKN WKJ SERIES_4.499.000(18).jpg', 'AC', 'Panasonic', ' Specifications : Model : CS - KN5WKJ | CS -KN7WKJ | CS - KN9WKJ\r\nKapasitas Pendinginan : 5.000 Btu/h | 7.000 Btu/h | 9.000 Btu/h\r\nKonsumsi Daya : 330 W | 530 W | 660 W\r\nEER : 13,44 Btu/W | 11,67 Btu/W | 11,96 Btu/W\r\n', 100, 0),
(447, 'DAIKIN 3 PK AC STANDING FLOOR STANDING FVRN71BXV14_18.199.000(19).jpg', 18199000, 'assets/img/DAIKIN 3 PK AC STANDING FLOOR STANDING FVRN71BXV14_18.199.000(19).jpg', 'AC', 'Daikin', ' Specifications : 3 PK\r\n2270 Watt\r\n24900 Btu/h\r\n3 Phase\r\nWide Airflow Control\r\nFine Design\r\n12 Hour On/Off Real Timer Setting\r\n', 100, 0),
(448, 'DAIKIN - MULTI SPLIT AIR CONDITIONER CTKC SERIES_2.099.000(20).jpg', 2099000, 'assets/img/DAIKIN - MULTI SPLIT AIR CONDITIONER CTKC SERIES_2.099.000(20).jpg', 'AC', 'Daikin', ' FEATURES :\r\nDaikin Multi-S 2 koneksi. Dengan 3 keunggulan utama, diantaranya hemat tempat, hemat energi dan hemat listrik. Hanya dengan 1 outdoor dapat mengoperasikan 2 unit indoor sekaligus menggunakan daya listrik sebesar 380 Watt (Low Watt Mode, Level 2).\r\nSPECIFICATIONS:\r\nCTKC15RVM4 : 1/2 PK | Lev. 1 650 Watt | Lev. 2 380 Watt | 5.100 Btu (in door saja)\r\nCTKC20RVM4 : 3/4 PK | Lev. 1 650 Watt | Lev. 2 380 Watt | 6.800 Btu (in door saja)\r\nCTKC25RVM$ : 1 PK | 8.500 Btu (in door saja)\r\n2MKC30QVM4 : out door untuk CTKC15RVM4 dan CTKC20RVM4\r\nMode Low Watt\r\nHembusan Udara Nyaman\r\nInverter Bertenaga\r\nOperasi Hening\r\nAuto Restart\r\nSelf Diagnosis\r\nSpace Saving\r\nPower Saving\r\nEnergy Saving\r\n ', 99, 0),
(449, 'PHILIPS WIRELESS IN-EAR HEADPHONES TAUT102BK-[HM]', 899000, 'assets/img/PHILIPS WIRELESS IN-EAR HEADPHONES TAUT102BK-[HM]_899.000(1).jpg', 'Headphone', 'Philips', ' Specifications : 6mm drivers/ closed-back Battery type : Lithium-Ion Music play time : 3+9 hr Standby time : 50 hr Talk time : 2.5 hr Rechargeable : Yes Built-in microphone Bluetooth version : 5.0 Maximum range : Up to 10m Speaker diameter : 6mm Frequency response : 20-20000 Hz', 100, 0),
(450, 'REALME EARBUD HEADPHONES AIR WHITE', 899000, 'assets/img/REALME EARBUD HEADPHONES AIR WHITE_899.000(2).jpg', 'Headphone', 'Realme', ' Specifications : Super Low Latency R1 Chip\r\nCharging Port USB Type-C\r\nWear Detection\r\nDynamic Bass Boost Driver\r\nWireless Charging 17 Hour Playback\r\nDual Micfor Calling\r\nCompatibility iOS/Android\r\nBluetooth v5.0\r\nBattery Capacity(Case) 400 mAh', 99, 0),
(451, 'PHILIPS WIRELESS HEADPHONE TAH1205BK', 599000, 'assets/img/PHILIPS WIRELESS HEADPHONE TAH1205BK_599.000(3).jpg', 'Headphone', 'Philips', ' Specifications : Powerful 32 mm neodymium drivers\r\nCrisp, clear sound\r\nGreat sound isolation from the closed-back design\r\n15 hours play time and fast charging\r\nLightweight and comfortable\r\nAdjustable headband and built-in mic for hands-free calls\r\nCushioned ear cups. Angle for maximum comfort\r\n', 100, 0),
(452, 'LOGITECH WIRELESS GAMING HEADPHONE G355', 849000, 'assets/img/LOGITECH WIRELESS GAMING HEADPHONE G355_849.000(4).jpg', 'Headphone', 'Logitech', ' Specifications : Logitech Wired Gaming Headphone G355\r\n20 - 20.000 hz\r\n87.5 Db\r\nWireless Connection', 96, 4),
(453, 'LOGITECH H390 MULTIMEDIA HEADPHONE ROSE', 479000, 'assets/img/LOGITECH H390 MULTIMEDIA HEADPHONE ROSE_479.000(5).jpg', 'Headphone', 'Logitech', ' Specifications : koneksi USB-A plug-and-play\r\nSempurna untuk panggilan suara, Skype, webinar, dan masih banyak lagi\r\nMikrofo Noise Cancelling\r\nKontrol in-line untuk menyesuaikan volume atau mute panggilan tanpa gangguan\r\nHeadband dan Ear Cup dengan Bantalan\r\nPanjang kabel: 2,33 m\r\n', 100, 0),
(454, 'SONY PERSONAL HEADPHONE MDRZX310APRCE-[HM]', 329000, 'assets/img/SONY PERSONAL HEADPHONE MDRZX310APRCE-[HM]_329.000(6).jpg', 'Headphone', 'Sony', ' FEATURES:\r\nLightweight, folding design for ultimate music mobility\r\n30mm ferrite drivers for powerful, balanced sound\r\n10 24,000Hz frequency range\r\nPadded earcups for comfortable listening\r\nChoice of colours to suit your style\r\nSPECIFICATION:\r\nCLOSED TYPE : YES\r\nDRIVER UNIT : 30 mm dynamic Dome type\r\nDYNAMIC TYPE : YES\r\nCAPACITY : 1000mW\r\nIMPEDANCE (OHM) : 24 ohm (1KHz)\r\nFREQUENCY RESPONSE : 10 24,000Hz\r\nSENSITIVITIES (DB/MW) : 98 dB/mW\r\nCORD TYPE : Y-type\r\nCORD LENGTH : 1.2 m\r\nPLUG : Four-conductor gold plated L-shaped stereo mini\r\n', 100, 0),
(455, 'PHILIPS PERSONAL HEADPHONE TAH4105 SERIES', 349000, 'assets/img/PHILIPS PERSONAL HEADPHONE TAH4105 SERIES_349.000(7).jpg', 'Headphone', 'Philips', ' Specifications :On Ear Headphone\r\nBig Bold Bass\r\nSuper Comfortable\r\nEasy to Carry\r\n', 100, 0),
(456, 'SONY WIRELESS HEADPHONE WH1000XM4 SERIES', 3299000, 'assets/img/SONY WIRELESS HEADPHONE WH1000XM4 SERIES_3.299.000(8).jpg', 'Headphone', 'Sony', ' Specifications : Noise Cancelling\r\nAmbient Sound Control\r\nHigh Quality Audio With DSEE Extreme and LDAC\r\nWireless Bluetooth And NFC\r\nFrequency Respone 4Hz-40KHz\r\nBattery Charge USB\r\nUp To 30 Hours Battery Life\r\nBluetooth v5.0\r\nBluetooth Distance 10m\r\n', 100, 0),
(457, 'JBL PERSONAL HEADPHONE TUNE 660BT BLACK', 1399000, 'assets/img/JBL PERSONAL HEADPHONE TUNE 660BT BLACK_1.399.000(9).jpg', 'Headphone', 'JBL', ' Specifications : Suara JBL Pure Bass\r\nActive Noise Cancelling\r\nDaya tahan baterai hingga 44 jam dengan ANC menyala\r\nPanggilan bebas genggam & dukungan Asisten Suara\r\nDesain ringan, nyaman, dan dapat dilipat\r\nPemasangan cepat dengan Google\r\n', 100, 0),
(458, 'LOGITECH GAMING HEADPHONE G733 SERIES', 2129000, 'assets/img/LOGITECH GAMING HEADPHONE G733 SERIES_2.129.000(10).jpg', 'Headphone', 'Logitech', ' Specifications : Port USB 2.0 (tipe port A)\r\nDriver: PRO-G 40 mm\r\nRespons frekuensi: 20 Hz-20 KHz\r\nImpedansi: 39 Ohm (pasif), 5k Ohm (aktif)\r\nSensitivitas: 87,5 dB SPL/mW\r\nJangkauan Wireless : Hingga jarak 20 meter\r\n', 94, 6),
(459, 'SONY PERSONAL HEADPHONE ZX110 SERIES', 199000, 'assets/img/SONY PERSONAL HEADPHONE ZX110 SERIES_199.000(11).jpg', 'Headphone', 'Sony', ' Specifications : 30mm dome driver untuk suara seimbang\r\nMagnet neodymium daya tinggi memberikan suara bertenaga\r\nRentang frekuensi 12Hz 22kHz\r\nEarcup berbantalan untuk kenyamanan mendengar\r\nPilihan warna sesuai gaya Anda\r\nSensitivitas 98 dB/mW\r\nUnit Driver 30 mm dinamis Jenis dome\r\nImpedans 24 ohm\r\nRespons Frekuensi 12 22.000Hz\r\n', 100, 0),
(460, 'SONY PERSONAL HEADPHONE MDRZX310APWCE-[HM]', 329000, 'assets/img/SONY PERSONAL HEADPHONE MDRZX310APWCE-[HM]_329.000(12).jpg', 'Headphone', 'Sony', ' FEATURES\r\nLightweight, folding design for ultimate music mobility\r\n30mm ferrite drivers for powerful, balanced sound\r\n10 24,000Hz frequency range\r\nPadded earcups for comfortable listening\r\nChoice of colours to suit your style\r\nSPECIFICATION\r\nCLOSED TYPE : YES\r\nDRIVER UNIT : 30 mm dynamic Dome type\r\nDYNAMIC TYPE : YES\r\nCAPACITY : 1000mW\r\nIMPEDANCE (OHM) : 24 ohm (1KHz)\r\nFREQUENCY RESPONSE : 10 24,000Hz\r\nSENSITIVITIES (DB/MW) : 98 dB/mW\r\nCORD TYPE : Y-type\r\nCORD LENGTH : 1.2 m\r\nPLUG : Four-conductor gold plated L-shaped stereo mini', 100, 0),
(461, 'REXUS GAMING HEADPHONE RX-HX28-WH_379.000(13).jpg', 379000, 'assets/img/REXUS GAMING HEADPHONE RX-HX28-WH_379.000(13).jpg', 'Headphone', 'Rexus', ' Specifications : Konektivitas Kabel dan Bluetooth V5.0\r\nPanel kontrol terintegrasi di housing speaker\r\nMikrofon Sensitif dan Dapat Dilepas\r\nDiameter driver: 50mm\r\nSensitivitas: 116dB\r\nRentang frekuensi: 20  20.000Hz\r\nPanjang kabel: 2,1 meter\r\nTipe konektor: Type C\r\nWaktu pemakaian: 200 jam (mode siaga)', 88, 12),
(462, 'REXUS GAMING HEADPHONE RX-HX25-WH', 269000, 'assets/img/REXUS GAMING HEADPHONE RX-HX25-WH_269.000(14).jpg', 'Headphone', 'Rexus', ' Specifications : Bigger Driver\r\nEarpad yang nyaman dan fungsional\r\nFlexible and Sensitive Microphone\r\nDiameter driver: 50mm\r\nSensitivitas: 116dB\r\nRentang frekuensi: 20  20.000Hz\r\nPanjang kabel: 2 meter\r\nPlug: Jack tunggal 3,5 mm', 100, 0),
(463, 'JETE - GAMING HEADPHONE HX8 SERIES', 129000, 'assets/img/JETE - GAMING HEADPHONE HX8 SERIES_129.000(15).jpg', 'Headphone', 'Jete', ' Specifications : Merk : Jete\r\nModel : HX8\r\nSensitivity : 99±5dB\r\nDesign For : Gaming\r\nDriver Unit : 10mm / 15mm Speaker\r\nMicrophone : Detachable Microphone\r\nNoise Cancelling : Yes\r\nCable Length : 1.2m\r\nPlug Type : 3.5mm Audio Jack', 85, 15),
(464, 'SONY WIRELESS HEADPHONE WH-CH720N SERIES', 1549000, 'assets/img/SONY WIRELESS HEADPHONE WH-CH720N SERIES_1.549.000(16).jpg', 'Headphone', 'Sony', ' Specifications : Dual noise sensor technology, featuring 1 microphones on each earcup, captures ambient noise\r\nStrong Battery life 50H/Quick charge of 3 minutes\r\nHigh sound quality with integrated processor V1 and well balanced sound tuning\r\n360 Reality Audio Compatible\r\nWearing comfort with lightweight and more comfort fitting\r\nBuilt-in-mic for call (Precise voice pickup technology uses beamforming microphones)\r\nWind Noise Reduction Structure\r\nMultiple Connection, useful for Work from home\r\nEasy button Operation\r\nVoice Assistant Compatible', 100, 0),
(465, 'REXUS GAMING HEADPHONE RX-F30 SERIES', 179000, 'assets/img/REXUS GAMING HEADPHONE RX-F30 SERIES_179.000(17).jpg', 'Headphone', 'Rexus', ' Specifications : RGB LED With Wide Spectrum of Colors\r\nKonektor 3,5mm Model L\r\nMikrofon Tongkat Fleksibel yang Sensitif\r\nDiameter speaker: 50mm\r\nSensitivitas: 115dB\r\nRentang frekuensi: 20  20.000Hz\r\nPanjang kabel: 2,2 meter\r\nRubber covered nylon cable', 100, 0),
(466, 'LOGITECH GAMING HEADPHONE G335 7.1 LIGHTSPEED MINT', 849000, 'assets/img/LOGITECH GAMING HEADPHONE G335 7.1 LIGHTSPEED MINT_849.000(18).jpg', 'Headphone', 'Logitech', ' Specifications : LOGITECH GAMING HEADPHONE G335 7.1 LIGHTSPEED\r\nHeadphone Driver: 40 mm\r\nHeadphone Respons Frekuensi: 20 Hz - 20 kHz\r\nHeadphone Impedansi: Sensitivitas 36 Ohm: 87,5 dB SPL/mW\r\nPola Penangkapan Mikrofon: Cardioid (Unidireksional)\r\nRespons Frekuensi Mikrofon: 100 Hz-10 KHz', 100, 0),
(467, 'JBL PERSONAL HEADPHONE TOUR ONE M2 SERIES_4.299.000(19).jpg', 4299000, 'assets/img/JBL PERSONAL HEADPHONE TOUR ONE M2 SERIES_4.299.000(19).jpg', 'Headphone', 'JBL', ' Specifications : JBL Signature Sound\r\nJauhkan kebisingan dan tetap fokus pada musik dengan True Adaptive Noise Cancelling\r\nTetap waspada terhadap suara di sekitar Anda sambil menikmati musik dengan Smart Ambient\r\nAlgoritme 4-mic crystal call pada JBL Tour One M2 memungkinkan Anda melakukan percakapan lebih baik bahkan di lingkungan yang bising atau berangin\r\nDesain ringan, nyaman, dan dapat dilipat\r\nup to 50 Hours of playtime\r\n10 Minutes of Charging provides up to 5 Hours of playtime', 100, 0),
(468, 'SONY Headphone Noise Cancelling Nirkabel WF-1000XM5 SERIES_3.399.000(20).jpg', 3399000, 'assets/img/SONY Headphone Noise Cancelling Nirkabel WF-1000XM5 SERIES_3.399.000(20).jpg', 'Headphone', 'Sony', ' Specifications : The best truly wireless noise canceling headphones on the market\r\nAstonishing sound quality with High-Resolution Audio.\r\nSony s best ever call quality with AI based noise reduction algorithm and bone conduction sensor\r\nSmall, light and beautifully designed.\r\nSmooth switching and a clear Bluetooth signal with a powerful new Integrated Processor V2.\r\nAdjusts to the world around you with adaptive sound control, using AI to offer the ideal listening experience.\r\nTalk and only hear ambient sound using Speak-to-Chat which pauses the music when you start talking.\r\nWater resistant for everyday use so splashes and sweat wont stop you.\r\nDesigned with the environment in mind with construction from recycled plastic materials and 100% paper packaging.\r\nBattery life up to 8 hours (24-hours with case). Quick charging - 3 min. for up to 1 hour of listening', 100, 0),
(469, 'SANKEN DISPENSER AIR BERDIRI GALON BAWAH STANDING DISPENSER HWD-C520IC', 1834800, 'assets/img/66616139449b7_dispenser.jpg', 'Dispenser', 'Sanken', 'Tegangan : 220V\r\nFREKUENSI : 50 Hz\r\nDAYA PEMANAS : 350 Watt\r\nDAYA PENDINGIN: 70 Watt\r\nTEMPERATUR PANAS : 80Â°C\r\nTEMPERATUR DINGIN : 14-17Â°C\r\nDAYA POMPA : 4 Watt', 5, 0),
(470, 'LG MESIN CUCI FRONT LOADING WASHER FB1207S6W', 4678800, 'assets/img/6664236d1b91a_LG MESIN CUCI FRONT LOADING WASHER FB1207S6W_3.899.000.jpg', 'Mesin Cuci', 'LG', '7Kg\r\n1200 Rpm\r\nInverter Direct Drive\r\n6 Motions Direct Drive\r\nSmart Diagnosis\r\nSleek and minimalist design\r\nPower Consumption Wash: 250 Watt\r\nPower Consumption Max: 2000 Watt', 1, 0),
(471, 'MIDEA MESIN CUCI FRONT LOADING WASHER MF100W75', 3718800, 'assets/img/666424fe1cebd_MF100W75.jpg', 'Mesin Cuci', 'Midea', 'Capacity: 7,5 Kg\r\nSpin: 1000 RPM\r\nLunar Dial: Integrated Digital Control\r\nHygiene 90Â°C: Noda membandel, residu deterjen, dan kuman berbahaya dihilangkan secara menyeluruh saat memilih mode Hygiene 90Â°C, yang bermanfaat untuk anak-anak dan orang tua yang sangat sensitif terhadap alergi.\r\nDigital Control: Mengoperasikan mesin cuci dengan digital desplay untuk melacak proses pencucian dan memilih fitur yang ingin digunakan.\r\nPre-Wash: Menambahkan program Pre-Wash hanya dengan satu langkah, pakaian yang sangat kotor akan direndam dan dicuci dengan lembut sebelum siklus utama untuk mengoptimalkan kinerja pembersihan cucian yang sangat kotor dan mencapai hasil pencucian terbaik.', 1, 0),
(472, 'POLYTRON MESIN CUCI 1 TABUNG TOP LOAD WASHER PAW9527X', 3118800, 'assets/img/6664255869d68_PAW9527X.jpg', 'Mesin Cuci', 'Polytron', 'Size: 9 kg\r\nPOWER CONSUMPTION : 330 Watt\r\nSPIN SPEED : 150 RPM(wash), 750 RPM(spin)\r\nFUNCTION PANEL: Digital\r\nWASH PROGRAM: Hijab/Normal/Quick /Jeans /Soft/Wash Only/ Rinse Only/Spin Only/Wash-Rinse/Rinse-Spin\r\n<30 DB Soundless Washing Technology', 1, 0),
(473, 'PANASONIC MESIN CUCI 2 TABUNG SEMI AUTO WASHER NAW88BCV1', 2398800, 'assets/img/666426164bc09_NA-W88FCV1_01.jpg', 'Mesin Cuci', 'Panasonic', 'Capacity : 8.5 kg\r\nSpin dry capacity : 5.5 kg\r\nSpeed : 1400 RPM\r\nAg Clean Pulsator\r\nHigh Feet\r\nWash power consumption : 220 Watt\r\nSpin power consumption : 130 Watt', 1, 0),
(474, 'SHARP COUNTERTOP OVEN EO-32BK', 869700, 'assets/img/66642aef29b66_EO-32BK.jpg', 'Microwave', 'Sharp', 'Power: 1000w\r\nCapacity: 32L\r\nConvection\r\n120 Minutes timer\r\nTemperature control up to 230 degree\r\nSelector knobs for Lower, Upper and Both Heater\r\nStainless Steel Heating Element\r\nFunctions: Toast, Grill, Bake, Roast & Convection\r\nAccessories : Food Tray and handle tray, Grill Rack and Handle Rack, & Crumb Tray', 1, 0),
(475, 'HITACHI COUNTERTOP MICROWAVE HMR-M2002', 1318800, 'assets/img/66642b594ff0b_HMR-M2002.jpg', 'Microwave', 'Hitachi', '20 L Capacity\r\n700 Watt Microwave Power\r\nDefrost Function by Time & Weight\r\n5 Adjustable Power Levels\r\nWith Glass Tray\r\nEasy to use Contemporary Design', 1, 0),
(476, 'TOSHIBA COUNTERTOP MICROWAVE MM-EG24P(BM)', 1606800, 'assets/img/66642ba2e4f4b_MM-EG24P_BM_.jpg', 'Microwave', 'Aqua Japan', 'Crispy Grill Cooking\r\nEasy Defrost\r\n10 Power Level\r\n6 Auto Menu\r\nDaya Listrik 80W- 800W\r\nKapasitas 23 L', 1, 0),
(477, 'SAMSUNG COUNTERTOP MICROWAVE 23L MS23K3515AS/SE', 1318800, 'assets/img/66642bfa85666_MS23.jpg', 'Microwave', 'Samsung', 'Solo dengan Quick Defrost, 23L\r\n\r\nFEATURES\r\n\r\nQuick Defrost\r\nKeep Warm\r\nCERAMIC INSIDEâ„¢\r\nLocal Recipe\r\nECO Mode\r\nDeodorization\r\nSPECIFICATION\r\n\r\nProduct Type : Solo\r\nOven Capacity : 23L\r\nControl Method : Tact+Dial\r\nDoor Type : Handle\r\nCavity Material : Ceramic Enamel\r\nTurntable Size : 288 mm\r\nDisplay Type : LED\r\nPower Source : 230V / 50Hz\r\nPower Consumption (Microwave) : 1150 W', 1, 0),
(478, 'SAMSUNG BESPOKE COUNTERTOP MICROWAVE BEIGE 30L MG30T5068CF/SE', 2434800, 'assets/img/66642cce321e0_BEIGE.jpg', 'Microwave', 'Samsung', '\r\nProduct Type : Grill\r\nOven Capacity : 30L (1.0 Cu.ft)\r\nControl Method : Touch\r\nDoor Type : Side Swing with Handle\r\nCavity Material : Ceramic Enamel\r\nTurntable Size : 318 mm\r\nDisplay Type : LED (White)\r\nGrill Heater : Sheath\r\nPower Source : 230V / 50Hz\r\nOutput Power (Microwave) : 900 W\r\nPower Consumption (Grill) : 1500 W\r\nPower Consumption (Microwave) : 1400 W\r\nPower Consumption (Max) : 1500 W\r\nPower Level : 6\r\nFeatures : Various Cooking Mode, Clock, 30 sec. Plus, Eco Mode, Defrost Power, Auto Programs, Auto Cook, Grill Fry, Home Dessert, Bread Defrost, Child Safety Lock', 1, 0),
(479, 'POLYTRON DISPENSER AIR BERDIRI HYDRA GALON BAWAH STANDING DISPENSER PWC776', 2314800, 'assets/img/66642da6b530c_PWC776.jpg', 'Dispenser', 'Polytron', 'Anti Dust Filter Sistem penyaringan udara utk mencegah terjadinya jamur di dalam selang pipa.\r\nChild Lock Kunci pengaman air panas selalu kembali ke posisi semula\r\nIntegrated Warning System Buzzer berbunyi pada kondisi seperti pintu belum tertutup rapat, air galon habis, atau difungsi pada pompa air.', 1, 0),
(480, 'SANKEN DISPENSER AIR BERDIRI GALON ATAS STANDING DISPENSER HWE67C', 1012700, 'assets/img/66642e8806e9f_HWE67C.jpg', 'Dispenser', 'Sanken', 'Standing Dispenser\r\n\r\nHot,Fresh and Cold\r\n\r\n100% Stainless steel tank\r\n\r\nQYA Bacticlen pipes\r\n\r\nPower 350W', 1, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pengeluaran`
--

CREATE TABLE `tb_pengeluaran` (
  `id_pengeluaran` int(11) NOT NULL,
  `id_barang` int(11) DEFAULT NULL,
  `harga` int(10) NOT NULL,
  `qty` int(10) NOT NULL,
  `tanggal` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_pengeluaran`
--

INSERT INTO `tb_pengeluaran` (`id_pengeluaran`, `id_barang`, `harga`, `qty`, `tanggal`) VALUES
(1, NULL, 9039000, 5, '2024-06-01 13:21:41'),
(2, 268, 195300, 5, '2024-06-02 19:34:09'),
(3, 267, 62300, 5, '2024-06-02 19:34:35'),
(4, 266, 76300, 5, '2024-06-02 19:34:41'),
(5, 199, 8009100, 5, '2024-06-02 21:46:19'),
(6, 201, 1359200, 3, '2024-06-03 21:18:16'),
(7, 137, 111300, 5, '2024-06-03 21:18:35'),
(8, 2, 7829100, 5, '2024-06-04 18:09:55'),
(9, 266, 76300, 1, '2024-06-05 07:49:25'),
(10, 3, 3919200, 5, '2024-06-05 07:49:41'),
(11, 5, 2351200, 5, '2024-06-05 07:49:51'),
(12, 469, 1529000, 5, '2024-06-06 14:11:53'),
(13, 470, 3899000, 1, '2024-06-08 16:25:01'),
(14, 471, 3099000, 1, '2024-06-08 16:31:42'),
(15, 472, 2599000, 1, '2024-06-08 16:33:12'),
(16, 473, 1999000, 1, '2024-06-08 16:36:22'),
(17, 474, 669000, 1, '2024-06-08 16:57:03'),
(18, 475, 1099000, 1, '2024-06-08 16:58:49'),
(19, 476, 1339000, 1, '2024-06-08 17:00:02'),
(20, 477, 1099000, 1, '2024-06-08 17:01:30'),
(21, 478, 2029000, 1, '2024-06-08 17:05:02'),
(22, 479, 1929000, 1, '2024-06-08 17:08:38'),
(23, 480, 779000, 1, '2024-06-08 17:12:24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_refund`
--

CREATE TABLE `tb_refund` (
  `id_refund` int(10) NOT NULL,
  `id_orders` int(10) NOT NULL,
  `tanggal` datetime NOT NULL,
  `alasan` varchar(255) NOT NULL,
  `bukti` varchar(255) NOT NULL,
  `status_refund` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_refund`
--

INSERT INTO `tb_refund` (`id_refund`, `id_orders`, `tanggal`, `alasan`, `bukti`, `status_refund`) VALUES
(5, 56, '2024-06-05 10:39:00', 'gak dapet bonus', 'upload/665fddd412a65_JBL-Tour-One-M2-6-1024x576.jpg', 'Ditolak'),
(6, 57, '2024-06-05 10:48:41', 's', 'upload/665fe01920b72_logo.png', 'Diterima'),
(7, 58, '2024-06-05 11:22:24', 'sss', 'upload/665fe800cb726_refund.png', 'Diterima'),
(8, 72, '2024-06-06 17:20:40', 'Monitor Rusak', 'upload/66618d787112d_IMG_20240402_161816_216-1600x1200.jpg', 'Menunggu'),
(9, 79, '2024-06-06 17:53:17', 'hetset jelek', 'upload/6661951dda943_JBL-Tour-One-M2-6-1024x576.jpg', 'Menunggu'),
(10, 79, '2024-06-06 17:53:24', 'hetset jelek', 'upload/6661952444fe8_JBL-Tour-One-M2-6-1024x576.jpg', 'Menunggu'),
(11, 81, '2024-06-06 18:24:33', 'hetset putus dari sananya', 'upload/66619c71a050f_IMG_20240402_161816_216-1600x1200.jpg', 'Menunggu'),
(12, 81, '2024-06-06 18:24:54', 'hetset putus sebelah', 'upload/66619c8636aa0_revkulkass.jpg', 'Menunggu'),
(13, 81, '2024-06-06 18:25:10', 'sasd', 'upload/66619c96e1931_print.png', 'Menunggu'),
(14, 81, '2024-06-06 18:28:31', 'hetset putus sebelah', 'upload/66619d5fda66f_IMG_20240402_161816_216-1600x1200.jpg', 'Menunggu'),
(15, 78, '2024-06-06 18:37:18', 'hetset mati sebelah', 'upload/66619f6e3a240_JBL-Tour-One-M2-6-1024x576.jpg', 'Diterima');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(10) NOT NULL,
  `username` varchar(99) NOT NULL,
  `nama` varchar(99) NOT NULL,
  `telp` varchar(20) NOT NULL,
  `alamat` varchar(99) NOT NULL,
  `email` varchar(99) NOT NULL,
  `password` varchar(99) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `username`, `nama`, `telp`, `alamat`, `email`, `password`) VALUES
(1, 'wafda', 'Muhammad Faris Wafda', '085806203920', 'Desa Kebun Kecamatan Kamal Kabupaten bangkalan Jawa timur madura', 'wafda@gmail.com', '$2y$10$V6EcydJIAW3PT8UjSiCEU.EPNuMjN2TO6myveY7q46GK4Y18m7Lxm'),
(2, 'andi', 'Andi Ali', '08811233115', 'kecamatan kamal bangkalan', 'andi2@gmail.com', '$2y$10$otESlzVN/HORYs1pztq3u.dqIap2wLbkc8/cDPntl.ZOjyt3V38qq'),
(3, 'rudi', 'rudi anjay', '08123123541', 'Desa Kamal RT2 RW3 Bangkalan Madura', 'rudianjay@gmail.com', '$2y$10$iFrJqWbv.b7EBW/w5orbguGd16GAidVjkmmMl63H161yyc4o5RLEu'),
(4, 'Edo', 'Edi Edo', '085544663212', 'Tanjung Jati Kamal', 'edi@gmail.com', '$2y$10$bpyUYHO15FA9zcBMHo9tMOeYtG1d85tMj2oAlNoyovF.tCqKdC9bS'),
(5, 'budi', 'Budianto Sunaryo Rizki', '081234123212', 'Jalan Socah No 13 Bangkalan Madura', 'budibeta@gmail.com', '$2y$10$vq2zLSs8uaMR1g87BE257O2STnUDHgb7tg4yriludn374M.f9UOOK'),
(6, 'rahman', 'Ali Rahman', '08521233412881', 'Jalan Tanjung Jati Raya No. 25 Kamal Bangkalan', 'Rahman123@gmail.com', '$2y$10$nK.g//fWhJmp6FaD1jkPw.HQT4K9QDEwTDpc6vZuGzY5d0Us2/WBm'),
(7, 'reza', 'Reza Pahlevi Muria Akbar', '08152312767123', 'tanjung jati no 31 depan masjid kamal bangkalan madura', 'reza@gmail.com', '$2y$10$A0i4x5h/kZsawaKly1a7xu5mVs6vdq6.l/bU/VwA/0snmbSxOE.qa'),
(8, 'spesial', 'spesial', '', 'spesial', 'spesial@gmail.com', '$2y$10$Z4vecyI3/IsnCIjFEBzYduAg4leBtsQGCSLYwfkytFmXwFqsq62um'),
(9, 'sp', 'sp', '', 'sp', 'sp@gmail.com', '$2y$10$zV072Ch1bxVEheIliQ1nk.1qTyxKQUV22KdOZ9Z72KFAY7lt3E5Oi');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `details`
--
ALTER TABLE `details`
  ADD PRIMARY KEY (`id_orders`,`id_barang`),
  ADD KEY `id_orders` (`id_orders`,`id_barang`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indeks untuk tabel `jasa_kirim`
--
ALTER TABLE `jasa_kirim`
  ADD PRIMARY KEY (`id_jasa`);

--
-- Indeks untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`id_barang`,`id_user`),
  ADD KEY `id_barang` (`id_barang`,`id_user`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `metode`
--
ALTER TABLE `metode`
  ADD PRIMARY KEY (`id_metode`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id_orders`),
  ADD KEY `id_user` (`id_user`,`id_jasa`,`id_metode`),
  ADD KEY `id_jasa` (`id_jasa`),
  ADD KEY `id_metode` (`id_metode`);

--
-- Indeks untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indeks untuk tabel `tb_pengeluaran`
--
ALTER TABLE `tb_pengeluaran`
  ADD PRIMARY KEY (`id_pengeluaran`),
  ADD KEY `fk_pengeluaran_barang` (`id_barang`);

--
-- Indeks untuk tabel `tb_refund`
--
ALTER TABLE `tb_refund`
  ADD PRIMARY KEY (`id_refund`),
  ADD KEY `id_orders` (`id_orders`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `jasa_kirim`
--
ALTER TABLE `jasa_kirim`
  MODIFY `id_jasa` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `metode`
--
ALTER TABLE `metode`
  MODIFY `id_metode` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id_orders` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `id_admin` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tb_barang`
--
ALTER TABLE `tb_barang`
  MODIFY `id_barang` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=481;

--
-- AUTO_INCREMENT untuk tabel `tb_pengeluaran`
--
ALTER TABLE `tb_pengeluaran`
  MODIFY `id_pengeluaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `tb_refund`
--
ALTER TABLE `tb_refund`
  MODIFY `id_refund` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `details`
--
ALTER TABLE `details`
  ADD CONSTRAINT `details_ibfk_1` FOREIGN KEY (`id_orders`) REFERENCES `orders` (`id_orders`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `details_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `tb_barang` (`id_barang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  ADD CONSTRAINT `keranjang_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `keranjang_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `tb_barang` (`id_barang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`id_jasa`) REFERENCES `jasa_kirim` (`id_jasa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`id_metode`) REFERENCES `metode` (`id_metode`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_pengeluaran`
--
ALTER TABLE `tb_pengeluaran`
  ADD CONSTRAINT `fk_pengeluaran_barang` FOREIGN KEY (`id_barang`) REFERENCES `tb_barang` (`id_barang`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_refund`
--
ALTER TABLE `tb_refund`
  ADD CONSTRAINT `tb_refund_ibfk_1` FOREIGN KEY (`id_orders`) REFERENCES `orders` (`id_orders`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
