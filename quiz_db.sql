-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Máj 06. 19:28
-- Kiszolgáló verziója: 10.4.24-MariaDB
-- PHP verzió: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `quiz_db`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `questions`
--

CREATE TABLE `questions` (
  `id` int(10) NOT NULL,
  `name` varchar(30) NOT NULL,
  `imagePath` varchar(40) NOT NULL,
  `answer1` varchar(50) NOT NULL,
  `answer2` varchar(50) NOT NULL,
  `answer3` varchar(50) NOT NULL,
  `correctAnswerDB` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `questions`
--

INSERT INTO `questions` (`id`, `name`, `imagePath`, `answer1`, `answer2`, `answer3`, `correctAnswerDB`) VALUES
(1, 'piramis', '/src/img/1.jpg', 'A gízai piramisok', 'Alexandriai világítótorony', 'Hamurapi sziklatemploma', 1),
(2, 'A Magyar Parlament', '/src/img/3.jpg', ' Alexandriai világítótorony', 'A Magyar Parlament', 'Nápolyi kőszínházak', 2),
(3, 'moai', '/src/img/moai.jpg', 'Húsvét-Szigetek, Moai szoborok', 'Sechell szigetek, törzsi szobrok', 'Arámiai ősszobrok', 1),
(4, 'colosseum', '/src/img/colosseum.jpg', 'Nápolyi kőszínházak', 'Achropolis Athén', 'Colosseum, Róma', 3),
(5, 'bison', '/src/img/bison.jpg', 'Neandervölgyi barlangrajz', 'Bison barlang, Altamira', 'Bivaly fresko, Nápoly', 2),
(6, 'Stonhenge', '/src/img/stonehenge.jpg', 'Közép-Afrika, templom romok', 'Törzsi kőszobrok, Seychelles szigetek', 'Stonehenge, Anglia', 3),
(7, 'Adam', '/src/img/adam.jpg', 'Ádám Teremtése, Sixtus-kápolna', 'Apa és Fia, Leonardo de Vinci', 'Érintés, ismeretlen művész', 1),
(8, 'Lánchíd', '/src/img/lanchid.jpg', 'Széchényi Lánchíd, Budapest', 'Qubaro-ma híd, Botswana', 'London, Temse híd', 1),
(9, 'Saint Basil', '/src/img/saintbasil.jpg', 'Téli palota, Szentpétervár', 'Gaudi Színes katedrális', 'Boldog Vazul-székesegyház', 3),
(10, 'Taj Mahal', '/src/img/2.jpg', 'Alexandriai világítótorony', 'Taj Mahal', 'Hamurapi sziklatemploma', 2),
(11, 'Bláthy', '/src/img/blathy.jpg', 'Neumann János Informatikai Technikum', 'Bláthy Ottó Titusz informatikai technikum, Óbuda', 'Kodolányi János Egyetem', 2),
(16, 'agamemnon', '/src/img/agamemnon.jpg', 'Agamemnon halotti maszkja', 'Homérosz arcmása', 'Penelopé halotti maszkja', 1),
(17, 'antonioVivaldi', '/src/img/antonioVivaldi.jpg', 'Bach', 'Leonardo da Vinci', 'Antonio Vivaldi', 3),
(18, 'arcDeTriomphe', '/src/img/arcDeTriomphe.jpg', 'Váci Diadalív', 'Arc de Triomphe', 'Stonehenge', 2),
(19, 'babitsMihaly', '/src/img/Babits.jpg', 'Liszt Ferenc', 'Ernest Hemingway', 'Babits Mihály', 3),
(20, 'caravaggioSirbatetel', '/src/img/Caravaggio_m.jpg', 'Caravaggio: Sírbatétel', 'Munkácsy: Sírbatétel', 'Ismeretlen festő. valakit cipelnek', 1),
(21, 'Sasa Batllo', '/src/img/casa_batllo_b.jpg', 'Casa Batllo', 'Karamosz ház', 'Régi templom', 1),
(22, 'csodaszarvass', '/src/img/csodaszarvas.jpg', 'Egyiptomi falidísz', 'Kelta bross', 'Csodaszarvas', 3),
(23, 'ernestHemingway', '/src/img/ernestHemingway.jpg', 'Marcus T. Cicero', 'Ernest Hemingway', 'Frank L. Wright', 2),
(24, 'faberge', '/src/img/faberge.jpg', 'Húsvéti tojások', 'Faberge tojások', 'Falusi dísz tojások', 2),
(25, 'lisztFerenc', '/src/img/lisztFerenc.jpg', 'Liszt Ferenc', 'Havasi Balázs', 'Egy amerikai színész', 1),
(26, 'maganyosC', '/src/img/maganyosC.jpg', 'Páva', 'Ismeretlen fa', 'Magányos cédrus', 3),
(27, 'matyasKulacs', '/src/img/matyasKulacs.jpg', 'Sör tartó', 'Mátyás kulacs', 'Mandala', 2),
(28, 'niccoloP', '/src/img/niccoloP.jpg', 'Janus Pannonius', 'Mátyás király', 'Niccoló Paganini', 3),
(29, 'panteon', '/src/img/panteon.jpg', 'Panteon, Roma', 'Naptemplom, Templom hegy', 'Vatikáni Csillagvizsgáló', 1),
(32, 'globeSzinhaz', '/src/img/globeSzinhaz.jpg', 'Globe Színház', 'Teve karám', 'Bajor templom', 1),
(33, 'johannSebastianBach', '/src/img/j_s_bach_leipzig.jpg', 'Casanova', 'VII.Henrich herceg', 'Johann S. Bach', 3),
(34, 'kolcsey', '/src/img/kolcsey_ng.jpg', 'Dr. House, emlékszobor', 'Kölcsey Ferenc szobor, Nemzeti Galéria', 'Ady Endre', 2),
(35, 'leanyGyF', '/src/img/leanyGyF.jpg', 'Magdolna', 'Mária', 'Leány gyöngy fülbevalóval', 3),
(36, 'pontDuGard', '/src/img/pontDuGard.jpg', 'Kilenclyukú Híd', 'Pont du Gard', 'Istár kapu', 2),
(37, 'pyotrllyichT', '/src/img/tchaikovsky.jpg', 'Kiss Ernő', 'Petőfi Sándor', 'Pyotrl lyich Tchaikovsky', 3),
(38, 'radnotiMiklos', '/src/img/radnotiMiklos.jpg', 'Radnóti Miklós', 'Széchenyi István', 'Munkácsy Mihály', 1),
(39, 'romolusRemus', '/src/img/romolusRemus.jpg', 'Romolus és Remus', 'Maugli és Tarzan', 'Afrikai törzsi szobor', 1),
(40, 'willendorfiV', '/src/img/willendorfiV.jpg', 'Svájci Mars', 'Willendorfi Vénusz', 'Holland Pluto', 2),
(41, 'A Megváltó Krisztus szobor', 'src/img/AMegváltóKrisztus.jpg', 'Krisutus szobor, Portugália', 'Áldó Krisztus szobor, Tarcal', 'Megváltó Krisztus, Brazília', 3),
(42, 'eiffel', 'src/img/eiffel.jpg', 'Eiffel torony - Párizs', 'A Pisai Ferde Torony', 'MOL Székház', 1),
(43, 'nazca', 'src/img/nazca.jpg', 'Balaton felvidék', 'Ferihegyi leszálópálya', 'Nazca vonalak Peru', 3),
(44, 'Fuji', 'src/img/fuji.jpg', 'Kékes', 'Himalája', 'Fuji ', 3),
(45, 'Golden Gate', 'src/img/goldengate.jpg', 'Tower híd, London', 'Golden Gate híd, San Francisco', 'Károly híd, Prága', 2),
(46, 'Vatikán', 'src/img/vatikan.jpg', 'Vatikán', 'Nápolyi kőszínházak', 'Trianon emlékmű', 1),
(47, 'balaton', 'src/img/balaton.jpg', 'Fertő tó', 'Velencei tó', 'Balaton', 3),
(48, 'Turul', 'src/img/tataiTurul.jpg', 'Tatai Turul szobor', 'Főnix ', 'Egyiptomi szent madár', 1),
(49, 'Sikló', 'src/img/siklo.jpg', 'Kisföldalati ', 'Budavári sikló', 'Libegő', 2),
(50, 'Batthyany örökmécses', 'src/img/orokmecses.jpg', 'Trianon emlékmű', 'Eddystone-világítótorony', 'Batthyany Örökmécses', 3),
(51, 'Szent István Bazilika', 'src/img/bazilika.jpg', 'Alexandriai világítótorony', 'Szent István-bazilika', 'Pécsi székesegyház', 2),
(52, 'Fehér Ház', 'src/img/feherHaz.jpg', 'Lordok Háza (GB)', 'Országház (HUN)', 'Fehér Ház (USA)', 3),
(53, 'Ásító inas', 'src/img/asitoInas.jpg', 'Munkácsy: Ásító inas', 'Edvard Munch: A sikoly', 'Van Gogh: Önarckép', 1),
(54, 'Amerikai Szabadság-szobor', 'src/img/amerikaiszabszob.jpg', 'Amerikai Szabadság-szobor', 'Las Vegas szimbólum', 'Magyar Szbadság-szobor', 1),
(55, 'Petőfi', 'src/img/petofisandor.jpg', 'Arany János', 'Ady Endre', 'Petőfi Sándor', 3),
(56, 'foltos szalamandra', 'src/img/foltosSzalamandra.jpg', 'Foltos szalamandra', 'Gekkó', 'Komodói varánusz', 1),
(58, 'Kínai Nagy Fal', 'src/img/kinai_n_fal.jpg', 'Kínai Nagy Fal', 'Arab Védősánc', 'Kastély oldalfal', 1),
(59, 'Machu Pichu, Peru', 'src/img/machu_pichu_peru.jpg', 'Kínai Emlékváros', 'Azték templom', 'Machu Pichu, Peru', 3),
(60, 'Pongyang Észak-korea', 'src/img/pongyang_north_korea.jpg', 'Roma, Főtér', 'Pongyang Észak-Korea', 'Oroszország, Szentpétervár', 2),
(61, 'Potala, Tibet', 'src/img/potala_tibet.jpg', 'Katmandu, Sziklaváros', 'Potala, Tibet', 'Peru, Hegyi község', 2),
(62, 'Times Square, New York', 'src/img/times_square.jpg', 'Times Square, New York', 'Budapest, Magyarország', 'Washington, USA', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `scores`
--

CREATE TABLE `scores` (
  `id` int(10) NOT NULL,
  `score` int(10) NOT NULL,
  `name` varchar(30) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `scores`
--

INSERT INTO `scores` (`id`, `score`, `name`, `date`) VALUES
(15, 16, 'Név nélkül', '2024-04-18 17:59:55'),
(18, 6, 'Csacska', '2024-04-18 18:03:57'),
(55, 12, 'Cica', '2024-05-02 07:25:34'),
(57, 10, 'Csacska', '2024-05-02 14:54:10'),
(58, 20, 'Csacska', '2024-05-02 14:55:23'),
(60, 37, 'testUser', '2024-05-06 14:28:51'),
(61, 5, 'testUser', '2024-05-06 14:31:42');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `isAdmin` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `isAdmin`) VALUES
(23, 'Cica', 'cica@kutyus.com', '$2b$08$11eIRcqYKPRhwxnxYtT9guZn/tiuefDaPNuAFYyaQ.rW1O/KkEH6G', NULL),
(27, 'Csacska', 'csacsi@csacsi.hu', '$2b$08$eTocUXJBU6Av5htx2aE3zebsp8/xzKVaoIPsonnr0FV.zbDoCSpVy', NULL),
(29, 'kifli', 'zsemle123@kenyer.com', '$2b$08$YqY76rNmTAetgZ4hIbzV2ObLAa.urtUCR1auvXaw7ID6kJFAgykyC', NULL),
(30, 'Cica', 'cica@blathy.info', '$2b$08$jZDFG7ePezyc81AdXszMku6QWjYE5epeGw6u5zCPRMJcaXbToyepK', 1),
(32, 'Alma', 'almafa@blathy.info', '$2b$08$ykhbwjwFPA/hihRLT3wgyeZyBHqkszs7HLRy3pW4yt.aR0JEhzdn2', 1),
(40, 'testUser', 'test@test.hu', '$2b$08$e4SL/cRTs39Gz4nmOiZ3C.Xd1wSOG.Yxd6sGXQjUZ8z0a8YGmzVAG', 0),
(41, 'testAdmi', 'test@blathy.info', '$2b$08$H8INBBKfoaIbEY07mNOEWOxBxGbyYgciA/C9IdNVhVEefYlG8Ajri', 1);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `scores`
--
ALTER TABLE `scores`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT a táblához `scores`
--
ALTER TABLE `scores`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
