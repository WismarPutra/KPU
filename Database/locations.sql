-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Agu 2025 pada 16.21
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gps_tracker`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `locations`
--

CREATE TABLE `locations` (
  `id` int(11) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `locations`
--

INSERT INTO `locations` (`id`, `latitude`, `longitude`, `created_at`) VALUES
(3, -6.89532, 107.643234, '2025-08-11 11:39:27'),
(4, -6.895316, 107.643227, '2025-08-11 13:48:53'),
(5, -6.895313, 107.643234, '2025-08-11 13:51:57'),
(6, -6.895318, 107.643234, '2025-08-11 13:52:37'),
(7, -6.895313, 107.643234, '2025-08-11 13:53:17'),
(8, -6.89531, 107.643234, '2025-08-11 13:54:16'),
(9, -6.895311, 107.643234, '2025-08-11 13:55:07'),
(10, -6.895315, 107.643234, '2025-08-11 13:55:36'),
(11, -6.895318, 107.643227, '2025-08-11 13:56:10'),
(12, -6.895314, 107.643227, '2025-08-11 13:56:37'),
(13, -6.895312, 107.643219, '2025-08-11 13:57:07'),
(14, -6.895302, 107.643257, '2025-08-11 14:00:11'),
(15, -6.895308, 107.643242, '2025-08-11 14:01:42'),
(16, -6.895312, 107.64325, '2025-08-11 14:01:56'),
(17, -6.895308, 107.64325, '2025-08-11 14:02:11'),
(18, -6.89531, 107.64325, '2025-08-11 14:02:39'),
(19, -6.895449, 107.643379, '2025-08-11 14:05:32'),
(20, -6.895424, 107.643356, '2025-08-11 14:06:01'),
(21, -6.895397, 107.643341, '2025-08-11 14:06:32'),
(22, -6.895386, 107.643326, '2025-08-11 14:07:04'),
(23, -6.895382, 107.643311, '2025-08-11 14:07:32'),
(24, -6.895373, 107.643295, '2025-08-11 14:08:02'),
(25, -6.895363, 107.643288, '2025-08-11 14:08:32'),
(26, -6.895302, 107.643196, '2025-08-11 14:14:10'),
(27, -6.895308, 107.643196, '2025-08-11 14:14:43'),
(28, -6.895315, 107.643204, '2025-08-11 14:15:13');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
