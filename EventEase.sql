-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 08 Jan 2025 pada 08.16
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eventease`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `events`
--

CREATE TABLE `events` (
  `eventID` int(11) NOT NULL,
  `eventName` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `eventDate` date DEFAULT NULL,
  `eventTime` time DEFAULT NULL,
  `venueID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `events`
--

INSERT INTO `events` (`eventID`, `eventName`, `description`, `eventDate`, `eventTime`, `venueID`) VALUES
(1, 'Tech Innovators Summit', 'A summit for technology leaders and enthusiasts.', '2025-06-10', '09:00:00', 1),
(2, 'Global Sports Fest', 'International sports festival featuring games.', '2025-07-15', '08:00:00', 2),
(3, 'Summer Music Festival', 'A grand music festival with live bands.', '2025-08-05', '19:00:00', 4),
(4, 'Business Networking Conference', 'Networking for business professionals.', '2025-09-20', '10:00:00', 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `participants`
--

CREATE TABLE `participants` (
  `participantID` int(11) NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `eventID` int(11) DEFAULT NULL,
  `ticketID` int(11) DEFAULT NULL,
  `registrationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `participantName` varchar(255) DEFAULT NULL,
  `participantEmail` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `participants`
--

INSERT INTO `participants` (`participantID`, `userID`, `eventID`, `ticketID`, `registrationDate`, `participantName`, `participantEmail`) VALUES
(1, NULL, 1, 1, '2025-01-07 14:40:23', 'Nabila', 'nabila@gmail.com'),
(2, NULL, 1, 1, '2025-01-07 14:42:09', 'Nabila', 'nabila@gmail.com'),
(3, NULL, 1, 1, '2025-01-07 14:43:55', 'Nabila', 'nabila@gmail.com'),
(4, NULL, 2, 3, '2025-01-07 14:44:08', 'Nabila', 'nabila@gmail.com'),
(5, NULL, 2, 3, '2025-01-07 14:45:40', 'Nabila', 'nabila@gmail.com'),
(6, NULL, 1, 2, '2025-01-07 15:06:24', 'Nabila', 'nabila@gmail.com'),
(7, NULL, 1, 2, '2025-01-07 15:14:02', 'Nabila', 'nabila@gmail.com'),
(8, NULL, 2, 4, '2025-01-07 15:16:19', 'Nabila', 'nabila@gmail.com'),
(9, NULL, 2, 4, '2025-01-07 15:34:14', 'Nabila', 'nabila@gmail.com'),
(10, NULL, 1, 1, '2025-01-07 15:41:12', 'Nabila', 'nabila@gmail.com'),
(12, NULL, 2, 4, '2025-01-07 21:36:58', 'Hiroshima', 'hiroshima@gmail.com'),
(13, NULL, 2, 4, '2025-01-08 07:07:21', 'hiroshima', 'hiroshima@gmail.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `participanttickets`
--

CREATE TABLE `participanttickets` (
  `participantID` int(11) NOT NULL,
  `ticketID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `payments`
--

CREATE TABLE `payments` (
  `paymentID` int(11) NOT NULL,
  `participantID` int(11) DEFAULT NULL,
  `ticketID` int(11) DEFAULT NULL,
  `paymentStatus` enum('pending','paid','failed') DEFAULT NULL,
  `paymentDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tickets`
--

CREATE TABLE `tickets` (
  `ticketID` int(11) NOT NULL,
  `eventID` int(11) DEFAULT NULL,
  `ticketCategory` varchar(255) DEFAULT NULL,
  `ticketPrice` decimal(10,2) DEFAULT NULL,
  `ticketStock` int(11) DEFAULT NULL,
  `ticketStatus` enum('available','sold','cancelled') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tickets`
--

INSERT INTO `tickets` (`ticketID`, `eventID`, `ticketCategory`, `ticketPrice`, `ticketStock`, `ticketStatus`) VALUES
(1, 1, 'VIP', 200000.00, 42, 'available'),
(2, 1, 'Regular', 100000.00, 196, 'available'),
(3, 2, 'VIP', 300000.00, 96, 'available'),
(4, 2, 'Regular', 150000.00, 286, 'available'),
(5, 3, 'VIP', 250000.00, 75, 'available'),
(6, 3, 'Regular', 120000.00, 250, 'available'),
(7, 4, 'VIP', 400000.00, 50, 'available'),
(8, 4, 'Regular', 200000.00, 150, 'available');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `userID` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` enum('admin','organizer','participant') DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `registrationDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`userID`, `username`, `password`, `role`, `email`, `registrationDate`) VALUES
(3, 'nabila', 'nabila123', 'participant', 'nabila@gmail.com', '2025-01-07 13:13:39'),
(5, 'hiroshima', 'hiroshima', 'participant', 'hiroshima@gmail.com', '2025-01-08 07:05:48'),
(6, 'hiroshima12', 'hiroshima123', 'admin', 'hiroshima12@gmail.com', '2025-01-08 07:08:07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `venue`
--

CREATE TABLE `venue` (
  `venueID` int(11) NOT NULL,
  `venueName` varchar(255) NOT NULL,
  `capacity` int(11) NOT NULL,
  `location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `venue`
--

INSERT INTO `venue` (`venueID`, `venueName`, `capacity`, `location`) VALUES
(1, 'Grand Ballroom', 1000, 'Bandung'),
(2, 'Sports Arena', 1500, '456 Champion Blvd'),
(3, 'City Park', 2000, '789 Greenway Road'),
(4, 'Music Hall', 800, '101 Symphony Lane'),
(5, 'Conference Center', 1200, 'Jakarta');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`eventID`),
  ADD KEY `venueID` (`venueID`);

--
-- Indeks untuk tabel `participants`
--
ALTER TABLE `participants`
  ADD PRIMARY KEY (`participantID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `eventID` (`eventID`),
  ADD KEY `ticketID` (`ticketID`);

--
-- Indeks untuk tabel `participanttickets`
--
ALTER TABLE `participanttickets`
  ADD PRIMARY KEY (`participantID`,`ticketID`),
  ADD KEY `ticketID` (`ticketID`);

--
-- Indeks untuk tabel `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`paymentID`),
  ADD KEY `participantID` (`participantID`),
  ADD KEY `ticketID` (`ticketID`);

--
-- Indeks untuk tabel `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`ticketID`),
  ADD KEY `eventID` (`eventID`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeks untuk tabel `venue`
--
ALTER TABLE `venue`
  ADD PRIMARY KEY (`venueID`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `events`
--
ALTER TABLE `events`
  MODIFY `eventID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `participants`
--
ALTER TABLE `participants`
  MODIFY `participantID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `payments`
--
ALTER TABLE `payments`
  MODIFY `paymentID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tickets`
--
ALTER TABLE `tickets`
  MODIFY `ticketID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `venue`
--
ALTER TABLE `venue`
  MODIFY `venueID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`venueID`) REFERENCES `venue` (`venueID`);

--
-- Ketidakleluasaan untuk tabel `participants`
--
ALTER TABLE `participants`
  ADD CONSTRAINT `participants_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`),
  ADD CONSTRAINT `participants_ibfk_2` FOREIGN KEY (`eventID`) REFERENCES `events` (`eventID`),
  ADD CONSTRAINT `participants_ibfk_3` FOREIGN KEY (`ticketID`) REFERENCES `tickets` (`ticketID`);

--
-- Ketidakleluasaan untuk tabel `participanttickets`
--
ALTER TABLE `participanttickets`
  ADD CONSTRAINT `participanttickets_ibfk_1` FOREIGN KEY (`participantID`) REFERENCES `participants` (`participantID`),
  ADD CONSTRAINT `participanttickets_ibfk_2` FOREIGN KEY (`ticketID`) REFERENCES `tickets` (`ticketID`);

--
-- Ketidakleluasaan untuk tabel `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`participantID`) REFERENCES `participants` (`participantID`),
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`ticketID`) REFERENCES `tickets` (`ticketID`);

--
-- Ketidakleluasaan untuk tabel `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`eventID`) REFERENCES `events` (`eventID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
