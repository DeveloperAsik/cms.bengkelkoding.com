-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Okt 2022 pada 03.55
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `db_project_management_generator`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_a_generator_subjects`
--

CREATE TABLE `tbl_a_generator_subjects` (
  `id` int(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `is_active` int(1) NOT NULL DEFAULT 0,
  `created_by` int(32) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(32) NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_a_generator_subjects`
--

INSERT INTO `tbl_a_generator_subjects` (`id`, `code`, `name`, `description`, `is_active`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES
(1, 'stTY4FqZlPhO', 'user-login', '-', 1, 2, '2022-10-14 09:37:31', 2, '2022-10-14 09:37:31');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_a_generator_subjects`
--
ALTER TABLE `tbl_a_generator_subjects`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_a_generator_subjects`
--
ALTER TABLE `tbl_a_generator_subjects`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;
