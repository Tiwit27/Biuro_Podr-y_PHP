-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Cze 04, 2024 at 10:23 AM
-- Wersja serwera: 10.4.28-MariaDB
-- Wersja PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `biuro_podrozy`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `oferty`
--

CREATE TABLE `oferty` (
  `id` int(11) NOT NULL,
  `Miasto` varchar(30) NOT NULL,
  `Kraj` int(11) NOT NULL,
  `opis` text NOT NULL,
  `miejsca` int(11) NOT NULL,
  `cena` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `oferty`
--

INSERT INTO `oferty` (`id`, `Miasto`, `Kraj`, `opis`, `miejsca`, `cena`) VALUES
(1, 'Sousse', 1, 'Bardzo atrakcyjna lokalizacja przy plaży w Sousse oraz niedaleko wszelkich rozrywek, dobry serwis hotelowy i bogaty program animacyjny - to jedne z głównych plusów hotelu. Gorąco polecamy.', 35, 1135),
(2, 'Sharm El Sheikh', 2, 'Zbudowany na rozległym terenie, tuż nad Morzem Czerwonym. W prawdziwym raju dla miłośników nurkowania. Jednym z największych atutów jest aquapark z wieloma zjeżdżalniami dla najmłodszych i starszych. Animatorzy przygotowali bogaty program animacyjny i szereg zabaw w mini klubie dla naszych pociech. Znajdziemy także coś dla ducha i ciała w hotelowym centrum SPA z wieloma zabiegami relaksacyjnymi.', 23, 2092),
(3, 'Mahdia', 1, 'Obiekt położony zaledwie kilka kilometrów od centrum miasta Mahdia i blisko piaszczystej plaży z dostępem do morza o szmaragdowych kolorach. W hotelu na Gości czekają zjeżdżalnie, baseny, animacje, sporty plażowe i wiele innych atrakcji, które sprawią, że nikt nie będzie się tutaj nudził.', 14, 3098);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `panstwa`
--

CREATE TABLE `panstwa` (
  `id` int(11) NOT NULL,
  `nazwa_panstwa` varchar(50) NOT NULL,
  `zdjecie_panstwa` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `panstwa`
--

INSERT INTO `panstwa` (`id`, `nazwa_panstwa`, `zdjecie_panstwa`) VALUES
(1, 'Tunezja', 'https://ocdn.eu/pulscms-transforms/1/UxDk9kpTURBXy9kNDhiZmU4MTJmNDVhNWRlNmZkYjNiYTA3YmUzYzBmOS5qcGeTlQMAH80D6M0CMpUCzQSwAMPDkwmmNjU0MmNhBt4AAaEwAQ/widok-ze-wzgorza-byrsa-ze-starozytnymi-pozostalosciami-kartaginy-tunis-tunezja.jpeg'),
(2, 'Egipt', 'https://www.tui.pl/blog/wp-content/uploads/2023/10/egipt.jpg');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zdjecia`
--

CREATE TABLE `zdjecia` (
  `id_zdjecia` int(11) NOT NULL,
  `id_oferty` int(11) NOT NULL,
  `adres_url` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `zdjecia`
--

INSERT INTO `zdjecia` (`id_zdjecia`, `id_oferty`, `adres_url`) VALUES
(1, 1, 'https://i.wakacje.pl/no-index/hotel/tunezja/marabout-basen-aquapark-362833484-1200-800.jpg'),
(2, 1, 'https://i.wakacje.pl/no-index/hotel/tunezja/marabout-aquapark-zjezdzalnia-362832526-1200-800.jpg'),
(3, 1, 'https://i.wakacje.pl/no-index/hotel/tunezja/marabout-obiekt-basen-362833262-1200-800.jpg'),
(4, 1, 'https://i.wakacje.pl/no-index/hotel/tunezja/marabout-plaza-1534437497-1200-800.jpg'),
(5, 1, 'https://i.wakacje.pl/no-index/hotel/tunezja/marabout-recepcja-lobby-1634640454-1200-800.jpg'),
(6, 1, 'https://i.wakacje.pl/no-index/hotel/tunezja/marabout-pokoj-1634640611-1200-800.jpg'),
(7, 2, 'https://media.coraltravel.pl/www/pl/hotels/12/83/3916/egipt-sharm-el-sheikh-regency-plaza-aqua-park-spa-resort-baseny.jpg'),
(8, 2, 'https://media.coraltravel.pl/www/pl/hotels/12/83/3916/egipt-sharm-el-sheikh-regency-plaza-aqua-park-spa-resort-plaza-20200925.jpg'),
(9, 2, 'https://media.coraltravel.pl/www/pl/hotels/12/83/3916/egipt-sharm-el-sheikh-regency-plaza-aqua-park-spa-resort-lobby.jpg'),
(10, 2, 'https://media.coraltravel.pl/www/pl/hotels/12/83/3916/egipt-sharm-el-sheikh-regency-plaza-aqua-park-spa-resort-wakacje-egipt.jpg'),
(11, 3, 'https://media.coraltravel.pl/www/pl/hotels/34/15/261/637721640228463061.jpg'),
(12, 3, 'https://media.coraltravel.pl/www/pl/hotels/34/15/261/637721639909558227.jpg'),
(13, 3, 'https://media.coraltravel.pl/www/pl/hotels/34/15/261/637721640056432539.jpg'),
(14, 3, 'https://media.coraltravel.pl/www/pl/hotels/34/15/261/637721627998167159.jpg'),
(15, 3, 'https://media.coraltravel.pl/www/pl/hotels/34/15/261/637721641782205240.jpg'),
(16, 3, 'https://media.coraltravel.pl/www/pl/hotels/34/15/261/637721634274693007.jpg');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `oferty`
--
ALTER TABLE `oferty`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `panstwa`
--
ALTER TABLE `panstwa`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `zdjecia`
--
ALTER TABLE `zdjecia`
  ADD PRIMARY KEY (`id_zdjecia`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `oferty`
--
ALTER TABLE `oferty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `panstwa`
--
ALTER TABLE `panstwa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `zdjecia`
--
ALTER TABLE `zdjecia`
  MODIFY `id_zdjecia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
