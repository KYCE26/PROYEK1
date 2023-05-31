-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Bulan Mei 2023 pada 14.45
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rental_mobil`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `booking`
--

CREATE TABLE `booking` (
  `id_booking` int(11) NOT NULL,
  `kode_booking` varchar(255) NOT NULL,
  `id_login` int(11) NOT NULL,
  `id_mobil` int(11) NOT NULL,
  `ktp` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_tlp` varchar(15) NOT NULL,
  `tanggal` varchar(255) NOT NULL,
  `lama_sewa` int(11) NOT NULL,
  `total_harga` int(11) NOT NULL,
  `konfirmasi_pembayaran` varchar(255) NOT NULL,
  `tgl_input` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `booking`
--

INSERT INTO `booking` (`id_booking`, `kode_booking`, `id_login`, `id_mobil`, `ktp`, `nama`, `alamat`, `no_tlp`, `tanggal`, `lama_sewa`, `total_harga`, `konfirmasi_pembayaran`, `tgl_input`) VALUES
(43, '1684914696', 4, 11, '312477764220', 'MUHAMMAD RIFKY', 'Desa Teladan', '0895636553207', '2023-02-22', 1, 1500265, 'Pembayaran di terima', '2023-05-24'),
(44, '1684914990', 4, 11, '312477764220', 'MUHAMMAD RIFKY', 'Desa Teladan', '0895636553207', '2222-02-22', 1, 1500221, 'Sedang di proses', '2023-05-24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `infoweb`
--

CREATE TABLE `infoweb` (
  `id` int(11) NOT NULL,
  `nama_rental` varchar(255) DEFAULT NULL,
  `telp` varchar(15) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `no_rek` text DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `infoweb`
--

INSERT INTO `infoweb` (`id`, `nama_rental`, `telp`, `alamat`, `email`, `no_rek`, `updated_at`) VALUES
(1, 'RJ.RENT', '0895636553207', 'Jln. Gadung, Brluglug, Desa Lembeng Ketewel, Kec. Sukawati, Kab. Gianyar, Bali', 'rjgaming@gmail.com', 'BRI A/N Rifja 314227564276', '2022-01-24 04:57:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `login`
--

CREATE TABLE `login` (
  `id_login` int(11) NOT NULL,
  `nama_pengguna` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `no_ktp` varchar(20) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `no_telepon` varchar(13) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `login`
--

INSERT INTO `login` (`id_login`, `nama_pengguna`, `username`, `no_ktp`, `alamat`, `no_telepon`, `password`, `level`) VALUES
(1, 'Kasyzam', 'admin', '0', '', '0', '202cb962ac59075b964b07152d234b70', 'admin'),
(3, 'Krisna Waskita', 'demo', '0', '', '0', 'fe01ce2a7fbac8fafaed7c982a04e229', 'pengguna'),
(4, 'Rifky', 'Ky', '0', '', '0', '202cb962ac59075b964b07152d234b70', 'pengguna'),
(5, 'Ri', 'Ri', '0', '', '0', '250cf8b51c773f3f8dc8b4be867a9a02', 'pengguna'),
(8, 'Difta', 'dif', '3148472638472847', 'majalengka', '08117311644', '202cb962ac59075b964b07152d234b70', 'pengguna');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mobil`
--

CREATE TABLE `mobil` (
  `id_mobil` int(11) NOT NULL,
  `no_plat` varchar(255) NOT NULL,
  `merk` varchar(255) NOT NULL,
  `harga` int(255) NOT NULL,
  `deskripsi` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `gambar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `mobil`
--

INSERT INTO `mobil` (`id_mobil`, `no_plat`, `merk`, `harga`, `deskripsi`, `status`, `gambar`) VALUES
(11, 'DK 1409 ERD', 'Lamborghini Aventador J', 1500000, '2012', 'Tidak Tersedia', '1684913107Aventador J.png'),
(12, 'DK 5327 RD', 'Toyota Kijang', 375000, 'Kijang Kotak', 'Tersedia', '1684913316kijang kotak.png'),
(13, 'DK 8432', 'l300', 400000, 'bisa bawa barang banyak', 'Tersedia', '1684914155l300.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_booking` int(255) NOT NULL,
  `no_rekening` int(255) NOT NULL,
  `nama_rekening` varchar(255) NOT NULL,
  `nominal` int(255) NOT NULL,
  `tanggal` varchar(255) NOT NULL,
  `foto` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_booking`, `no_rekening`, `nama_rekening`, `nominal`, `tanggal`, `foto`) VALUES
(5, 3, 13213, 'Fauzan Falah', 800743, '2022-01-24', ''),
(11, 10, 123, '123', 123, '2023-03-12', ''),
(46, 43, 2147483647, 'MUHAMMAD RIFKY', 1, '2023-02-22', '1684914725bukti.jpg'),
(47, 44, 2147483647, 'MUHAMMAD RIFKY', 1500221, '2222-02-22', '1684915326bukti.jpg');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id_booking`);

--
-- Indeks untuk tabel `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id_login`);

--
-- Indeks untuk tabel `mobil`
--
ALTER TABLE `mobil`
  ADD PRIMARY KEY (`id_mobil`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `booking`
--
ALTER TABLE `booking`
  MODIFY `id_booking` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT untuk tabel `login`
--
ALTER TABLE `login`
  MODIFY `id_login` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `mobil`
--
ALTER TABLE `mobil`
  MODIFY `id_mobil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
