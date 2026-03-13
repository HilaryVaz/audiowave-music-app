-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 13, 2026 at 05:58 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `music_streaming`
--

-- --------------------------------------------------------

--
-- Table structure for table `albums`
--

CREATE TABLE `albums` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `artist_id` int(11) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `cover_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `artists`
--

CREATE TABLE `artists` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `bio` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `song_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`id`, `user_id`, `song_id`, `created_at`) VALUES
(8, 2, 2, '2026-03-13 15:23:51'),
(10, 2, 4, '2026-03-13 16:05:30');

-- --------------------------------------------------------

--
-- Table structure for table `playlists`
--

CREATE TABLE `playlists` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `playlist_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `playlists`
--

INSERT INTO `playlists` (`id`, `user_id`, `name`, `created_at`, `playlist_name`) VALUES
(1, 2, '', '2026-03-12 16:22:24', 'Chill Songs'),
(2, 2, '', '2026-03-12 16:22:43', 'My Favorites');

-- --------------------------------------------------------

--
-- Table structure for table `playlist_songs`
--

CREATE TABLE `playlist_songs` (
  `id` int(11) NOT NULL,
  `playlist_id` int(11) NOT NULL,
  `song_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `playlist_songs`
--

INSERT INTO `playlist_songs` (`id`, `playlist_id`, `song_id`) VALUES
(1, 1, 1),
(2, 1, 1),
(3, 2, 2),
(4, 2, 1),
(5, 2, 2),
(6, 1, 3),
(7, 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `recently_played`
--

CREATE TABLE `recently_played` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `song_id` int(11) NOT NULL,
  `played_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `songs`
--

CREATE TABLE `songs` (
  `id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `artist_id` int(11) DEFAULT NULL,
  `album_id` int(11) DEFAULT NULL,
  `genre` varchar(100) DEFAULT NULL,
  `file_path` varchar(255) NOT NULL,
  `cover_image` varchar(255) DEFAULT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `lyrics` text DEFAULT NULL,
  `artist` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `songs`
--

INSERT INTO `songs` (`id`, `title`, `artist_id`, `album_id`, `genre`, `file_path`, `cover_image`, `uploaded_at`, `lyrics`, `artist`) VALUES
(1, 'Perfect', NULL, NULL, 'Pop', 'perfect.mpeg', 'Perfect_coverphoto.jpeg', '2026-03-12 15:52:25', 'I found a love for me\r\nOh, darling, just dive right in\r\nAnd follow my lead\r\nWell, I found a girl\r\nBeautiful and sweet\r\nOh, I never knew you were the someone waiting for me\r\n\'Cause we were just kids when we fell in love\r\nNot knowing what it was\r\nI will not give you up this time\r\nOh, darling, just kiss me slow\r\nYour heart is all I own\r\nAnd in your eyes, you\'re holding mine\r\nBaby, I\'m dancing in the dark\r\nWith you between my arms\r\nBarefoot on the grass\r\nWhile listenin\' to our favourite song\r\nWhen you said you looked a mess\r\nI whispered underneath my breath\r\nBut you heard it\r\n\"Darling, you look perfect tonight\"\r\nWell, I found a woman\r\nStronger than anyone I know\r\nShe shares my dreams\r\nI hope that someday, I\'ll share her home\r\nI found a love\r\nTo carry more than just my secrets\r\nTo carry love\r\nTo carry children of our own\r\nWe are still kids, but we\'re so in love\r\nFightin\' against all odds\r\nI know we\'ll be alright this time\r\nDarling, just hold my hand\r\nBe my girl, I\'ll be your man\r\nI see my future in your eyes\r\nOh, baby, I\'m\r\nDancin\' in the dark\r\nWith you between my arms\r\nBarefoot on the grass\r\nListenin\' to our favourite song\r\nWhen I saw you in that dress, lookin\' so beautiful\r\nI don\'t deserve this\r\nDarling, you look perfect tonight\r\nNo, no, no\r\nMm\r\nBaby, I\'m\r\nDancin\' in the dark\r\nWith you between my arms\r\nBarefoot on the grass\r\nListenin\' to our favourite song\r\nI have faith in what I see\r\nNow I know I have met an angel in person\r\nAnd she looks perfect\r\nI don\'t deserve this\r\nYou look perfect tonight', 'Ed Sheeran'),
(2, 'Ku Lo Sa', NULL, NULL, 'Afrobeats', 'ku_lo_sa.mpeg', 'KuLoSa.jpeg', '2026-03-12 17:18:02', '[Intro]\r\nYeah, yeah\r\nYeah, yeah, yeah, oh oh, ku lo—\r\n\r\n[Verse 1]\r\nSo many reasons wey I wan dey for you my love (Love)\r\nNa you I wan to retire with my love oh\r\nSee all the li ku ku things you do, dey make me no no\r\nThis distance is taking a hold of me for sure\r\nBaby come\r\n\r\n[Chorus]\r\nKu lo sa\r\nOmo I want make we dey— (Ku lo sa)\r\nAh! Girl I wan make you— (Ku lo sa)\r\nOh lo lo, I for like make you— (Pull over)\r\nOh, no (Ku lo sa oh)\r\nOmo I want make we dey— (Ku lo sa)\r\nOh lo lo, girl I wan make you— (Ku lo sa)\r\nOh, no, no, I for like make you— (Pull over)\r\nPull over, come on, pull over (Ku lo sa oh)\r\n\r\n[Verse 2]\r\nShebi na this kind of things wey dey make man see yawa (See yawa)\r\nAnd me I understand say your dad no like me rara (Me rara)\r\nSee me I want make you know say me dey for you guarra\' (Guarantee oh)\r\nAnd if na the price be that, I for like to see yawa (See yawa)\r\n\r\nYou might also like\r\nGOD DID\r\nDJ Khaled\r\nPropeller\r\nJAE5\r\nUSE THIS GOSPEL (REMIX)\r\nDJ Khaled\r\n[Bridge]\r\nI never trade you for nothing\r\nThis love will make me dey champ I see\r\nWithout you I no fit do nothing (Without you, without you)\r\nAbeg telling me wetin suppin gaan, \'uppin gaan\r\nI never trade you for nothing (I never trade you baby)\r\nThis love will make me dey stunting (This love will make me dey stunting, no no)\r\nWithout you I no fit do nothing\r\nOmoge telling me what\'s suppin gaan\r\n\r\n[Chorus]\r\nKu lo sa\r\nOmo, I want make we dey yeah— (Ku lo sa)\r\nOmo, girl I wan make you— (Ku lo sa)\r\nBaby, I for like make you— (Pull over)\r\nOh baby, oh no no (Ku lo sa)\r\nOmo, I want make we dey (Ku lo sa)\r\nOmo, I wan you everyday (Ku lo sa)\r\nBring out your shayo make we play (Ku lo sa)\r\nEh, eh\r\nYeah, yeah, Ku lo sa\r\n\r\n[Outro]\r\nOh no, baby, oh no\r\nYou making my mind go loco\r\nYou make a younger boy go loco\r\nYou make a young boy go loco (Ku lo sa)\r\nBaby, oh no\r\nYou make a young boy go loco (Ku lo sa)\r\nYou make a young boy go loco (Ku lo sa)\r\nYeah, yeah, yeah\r\nSee, I never trade you for nothing (Ku lo sa)\r\nThis love will making me de stunting (Ku lo sa)\r\nWithout you I no fit do nothing (Pull over)\r\nOmoge tell me wetin suppin gannn (Ku lo sa)', 'Oxlade'),
(3, 'Heat Waves', NULL, NULL, 'Pop', 'heat_waves.mpeg', 'heat_waves.jpeg', '2026-03-13 15:38:36', 'Road shimmer wigglin\' the vision\r\nHeat, heat waves, I\'m swimmin\' in a mirror\r\nRoad shimmer wigglin\' the vision\r\nHeat, heat waves, I\'m swimmin\' in a\r\nSometimes, all I think about is you\r\nLate nights in the middle of June\r\nHeat waves been fakin\' me out\r\nCan\'t make you happier now\r\nSometimes, all I think about is you\r\nLate nights in the middle of June\r\nHeat waves been fakin\' me out\r\nCan\'t make you happier now\r\nUsually I put somethin\' on TV\r\nSo we never think about you and me\r\nBut today I see our reflections\r\nClearly in Hollywood, layin\' on the screen\r\nYou just need a better life than this\r\nYou need somethin\' I can never give\r\nFake water all across the road\r\nIt\'s gone now, the night has come, but\r\nSometimes, all I think about is you\r\nLate nights in the middle of June\r\nHeat waves been fakin\' me out\r\nCan\'t make you happier now\r\nYou can\'t fight it, you can\'t breathe\r\nYou say something so lovin\', but\r\nNow I gotta let you go\r\nYou\'ll be better off in someone new\r\nI don\'t wanna be alone\r\nYou know it hurts me too\r\nYou look so broken when you cry\r\nOne more and then I say goodbye\r\nSometimes, all I think about is you\r\nLate nights in the middle of June\r\nHeat waves been fakin\' me out\r\nCan\'t make you happier now\r\nSometimes, all I think about is you\r\nLate nights in the middle of June\r\nHeat waves been fakin\' me out\r\nCan\'t make you happier now\r\nI just wonder what you\'re dreamin\' of\r\nWhen you sleep and smile so comfortable\r\nI just wish that I could give you that\r\nThat look that\'s perfectly un-sad\r\nSometimes, all I think about is you\r\nLate nights in the middle of June\r\nHeat waves been fakin\' me out\r\nHeat waves been fakin\' me out\r\nSometimes, all I think about is you\r\nLate nights in the middle of June\r\nHeat waves been fakin\' me out\r\nCan\'t make you happier now\r\nSometimes, all I think about is you\r\nLate nights in the middle of June\r\nHeat waves been fakin\' me out\r\nCan\'t make you happier now\r\nRoad shimmer wigglin\' the vision\r\nHeat, heat waves, I\'m swimmin\' in a mirror\r\nRoad shimmer wigglin\' the vision\r\nHeat, heat waves, I\'m swimmin\' in a mirror', 'Glass Animals'),
(4, 'El Perdón', NULL, NULL, 'Reggaetón', 'El_Perdon.mp3', 'El_Perdon.jpeg', '2026-03-13 15:55:59', 'Ah ah\r\nDime si es verdad\r\nMe dijeron que te estás casando\r\nTú no sabes lo que estoy sufriendo\r\nEsto te lo tengo que decir\r\nCuéntame\r\nTu despedida para mí fue dura\r\nSerá que él te llevó a la luna\r\nY yo no supe hacerlo así\r\nTe estaba buscando\r\nPor la calle gritando\r\nEsto me está matando, oh no\r\nTe estaba buscando\r\nPor la calle gritando\r\nComo un loco tomando, oh\r\nEs que yo sin ti, y tú sin mí\r\nDime quién puede ser feliz\r\nEsto no me gusta\r\nEsto no me gusta\r\nEs que yo sin ti, y tú sin mí\r\nDime quién puede ser feliz\r\nEsto no me gusta\r\nEsto no me gusta\r\nYo sin ti, no aguanto más\r\nPor eso vengo a decirte lo que siento\r\nEstoy sufriendo en la soledad\r\nY aunque tu padre no aprobó esta relación\r\nYo sigo insistiendo a pedir perdón\r\nLo único que importa está en tu corazón\r\nTe estaba buscando\r\nPor la calle gritando\r\nEsto me está matando, oh no\r\nTe estaba buscando\r\nPor las calles gritando\r\nComo un loco tomando oh\r\nEs que yo sin ti, y tú sin mí\r\nDime quién puede ser feliz\r\nEsto no me gusta\r\nEsto no me gusta\r\nEs que yo sin ti, y tú sin mí\r\nDime quién puede ser feliz\r\nEsto no me gusta\r\nEso no me gusta\r\nYo te juré a ti ese eterno amor\r\nY ahora otro te da calor\r\nCuando en las noches tienes frío oh oh, oh\r\nYo sé que él te parece mejor\r\nPero yo estoy en tu corazón\r\nY por eso pido perdón\r\nEs que yo sin ti, y tú sin mí\r\nDime quién puede ser feliz\r\nEsto no me gusta\r\nEsto no me gusta\r\nEs que yo sin ti, y tú sin mí\r\nDime quién puede ser feliz\r\nEsto no me gusta\r\noh yeah, oh oh\r\nDicen que uno no sabe lo que tiene hasta que lo pierde pero\r\n(Yo sin ti) Vale la pena luchar por lo que uno quiere\r\n(No puedo vivir así) Y hacer el intento\r\n(No quiero vivir así)\r\nN.I.C.K\r\nNicky Jam, Enrique Iglesias\r\nHaciendo historia (No quiero que me dejes por favor)\r\nSaga White Black (Y te pido perdón)', 'Nicky Jam, Enrique Iglesias');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('user','admin') DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `password`, `role`, `created_at`) VALUES
(1, 'Admin', 'admin@gmail.com', 'admin', '$2y$10$wH9F8z4B8FJm0H1V1vMZ5e7nXj8yH2WQxT6Fz9YwQvUu8F7zL2x3K', 'admin', '2026-03-11 17:17:36'),
(2, 'Hilary Vaz', 'vazhilary10@gmail.com', 'Hilary', '$2y$10$Q1xuDaWRMOTnqfLXS.JC..PSsLTOKWOy42eA4IiHWneKWxvXQc57O', 'user', '2026-03-11 18:09:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`id`),
  ADD KEY `artist_id` (`artist_id`);

--
-- Indexes for table `artists`
--
ALTER TABLE `artists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `song_id` (`song_id`);

--
-- Indexes for table `playlists`
--
ALTER TABLE `playlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `playlist_songs`
--
ALTER TABLE `playlist_songs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `playlist_id` (`playlist_id`),
  ADD KEY `song_id` (`song_id`);

--
-- Indexes for table `recently_played`
--
ALTER TABLE `recently_played`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `song_id` (`song_id`);

--
-- Indexes for table `songs`
--
ALTER TABLE `songs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `artist_id` (`artist_id`),
  ADD KEY `album_id` (`album_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `albums`
--
ALTER TABLE `albums`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `artists`
--
ALTER TABLE `artists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `playlists`
--
ALTER TABLE `playlists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `playlist_songs`
--
ALTER TABLE `playlist_songs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `recently_played`
--
ALTER TABLE `recently_played`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `songs`
--
ALTER TABLE `songs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `albums`
--
ALTER TABLE `albums`
  ADD CONSTRAINT `albums_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`song_id`) REFERENCES `songs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `playlists`
--
ALTER TABLE `playlists`
  ADD CONSTRAINT `playlists_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `playlist_songs`
--
ALTER TABLE `playlist_songs`
  ADD CONSTRAINT `playlist_songs_ibfk_1` FOREIGN KEY (`playlist_id`) REFERENCES `playlists` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `playlist_songs_ibfk_2` FOREIGN KEY (`song_id`) REFERENCES `songs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `recently_played`
--
ALTER TABLE `recently_played`
  ADD CONSTRAINT `recently_played_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `recently_played_ibfk_2` FOREIGN KEY (`song_id`) REFERENCES `songs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `songs`
--
ALTER TABLE `songs`
  ADD CONSTRAINT `songs_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `songs_ibfk_2` FOREIGN KEY (`album_id`) REFERENCES `albums` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
