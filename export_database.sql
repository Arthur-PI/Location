-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 13 nov. 2020 à 23:32
-- Version du serveur :  10.4.14-MariaDB
-- Version de PHP : 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `location`
--

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20201019202959', '2020-10-20 10:32:36', 68),
('DoctrineMigrations\\Version20201113212608', '2020-11-13 21:26:29', 79),
('DoctrineMigrations\\Version20201113212724', '2020-11-13 21:27:30', 73);

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

CREATE TABLE `facture` (
  `id` int(11) NOT NULL,
  `id_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_vehic` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_d` date NOT NULL,
  `date_f` date NOT NULL,
  `montant` double NOT NULL,
  `payee` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `facture`
--

INSERT INTO `facture` (`id`, `id_user`, `id_vehic`, `date_d`, `date_f`, `montant`, `payee`) VALUES
(1, '101', '2', '2020-09-20', '2020-10-20', 1100, 0),
(2, '102', '2', '2020-01-15', '2020-04-15', 3330, 1),
(3, '103', '3', '2020-09-25', '2020-09-30', 300, 0),
(4, '102', '6', '2020-06-12', '2020-06-22', 1800, 1),
(5, '105', '4', '2020-10-10', '2020-10-25', 1950, 0),
(6, '102', '1', '2020-05-20', '2020-10-20', 4500, 1),
(7, '107', '1', '2020-02-08', '2020-05-08', 2700, 1),
(8, '102', '3', '2020-07-26', '2020-09-11', 2250, 1),
(9, '108', '7', '2020-09-25', '2020-10-25', 5700, 0),
(10, '109', '8', '2020-06-05', '2020-06-20', 2550, 1);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `nom`, `num_user`, `password`, `email`) VALUES
(1, 'admin', 'admin', '$2y$13$N4cenjkG2zZItYdeVYiDoO/htJxG0pitgl34FEVLTTHnypKkaifx.', 'admin@gmail.com'),
(2, 'Jean', '101', '$2y$13$U63dZXqNLx5MWhsHuk5WU.W403HTIUrHGtAabfM8aiNjKb9D9TzSS', 'jean_neymar@gmail.com'),
(3, 'Alex', '102', '$2y$13$6GjD75Y.5nlkou3kesdjEeKrnVd227xqhugUXMmtIGixDnmpaeahG', 'alex_terrieur@gmail.com'),
(4, 'Alain', '103', '$2y$13$6GjD75Y.5nlkou3kesdjEeKrnVd227xqhugUXMmtIGixDnmpaeahG', 'alain_parfait@gmail.com'),
(5, 'Mehdi', '104', '$2y$13$6GjD75Y.5nlkou3kesdjEeKrnVd227xqhugUXMmtIGixDnmpaeahG', 'mehdi_cament@gmail.com'),
(6, 'Sacha', '105', '$2y$13$6GjD75Y.5nlkou3kesdjEeKrnVd227xqhugUXMmtIGixDnmpaeahG', 'sacha_touille@gmail.com'),
(7, 'Lena', '105', '$2y$13$6GjD75Y.5nlkou3kesdjEeKrnVd227xqhugUXMmtIGixDnmpaeahG', 'lena_rines@gmail.com'),
(8, 'Eve', '106', '$2y$13$6GjD75Y.5nlkou3kesdjEeKrnVd227xqhugUXMmtIGixDnmpaeahG', 'eve_rest@gmail.com'),
(9, 'Lucie', '107', '$2y$13$6GjD75Y.5nlkou3kesdjEeKrnVd227xqhugUXMmtIGixDnmpaeahG', 'lucie_fer@gmail.com'),
(10, 'Jacques', '108', '$2y$13$6GjD75Y.5nlkou3kesdjEeKrnVd227xqhugUXMmtIGixDnmpaeahG', 'jacques_ouzi@gmail.com'),
(11, 'Guy', '109', '$2y$13$6GjD75Y.5nlkou3kesdjEeKrnVd227xqhugUXMmtIGixDnmpaeahG', 'guy_mauve@gmail.com'),
(12, 'Terry', '110', '$2y$13$6GjD75Y.5nlkou3kesdjEeKrnVd227xqhugUXMmtIGixDnmpaeahG', 'terry_golo@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `vehicule`
--

CREATE TABLE `vehicule` (
  `id` int(11) NOT NULL,
  `modele` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `carac` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `quantite` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prix` double NOT NULL,
  `disponible` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vehicule`
--

INSERT INTO `vehicule` (`id`, `modele`, `carac`, `quantite`, `image`, `prix`, `disponible`) VALUES
(1, 'Scenic', '{\"marque\": \"Renault\", \"couleur\": \"Gris\", \"boite\": \"Manuelle\", \"moteur\": \"Essence\", \"nbPlaces\": \"5\", \"nbPortes\": \"5\"}', 11, 'https://www.sixt.fr/fileadmin/files/global/user_upload/fleet/png/350x200/renault-grand-scenic-5d-silber-2018.png', 30, 1),
(2, 'Kodiaq', '{\"marque\": \"Skoda\", \"couleur\": \"Blanc\", \"boite\": \"Manuelle\", \"moteur\": \"Essence\", \"nbPlaces\": \"5\", \"nbPortes\": \"5\"}', 4, '/img/voitures/skoda-kodiaq-55664.png', 37, 0),
(3, '5008', '{\"marque\": \"Peugeot\", \"couleur\": \"Gris\", \"boite\": \"Manuelle\", \"moteur\": \"Essence\", \"nbPlaces\": \"7\", \"nbPortes\": \"5\"}', 6, 'https://www.sixt.fr/fileadmin/files/global/user_upload/fleet/png/350x200/peugeot-5008-5d-grau-2017.png', 50, 0),
(4, 'X5 xDrive', '{\"marque\": \"BMW\", \"couleur\": \"Blanc\", \"boite\": \"Automatique\", \"moteur\": \"Hybride\", \"nbPlaces\": \"5\", \"nbPortes\": \"5\"}', 3, 'https://www.sixt.fr/fileadmin/files/global/user_upload/fleet/png/350x200/bmw-x5-5d-weiss-2018.png', 130, 0),
(5, 'Rover Sport HSE', '{\"marque\": \"Range\", \"couleur\": \"Rouge\", \"boite\": \"Automatique\", \"moteur\": \"Essence\", \"nbPlaces\": \"5\", \"nbPortes\": \"4\"}', 4, 'https://www.sixt.fr/fileadmin/files/global/user_upload/fleet/png/350x200/land-rover-range-rover-hse-sport-rot-2016.png', 120, 0),
(6, 'F-Type cabrio', '{\"marque\": \"Jaguar\", \"couleur\": \"Gris\", \"boite\": \"Automatique\", \"moteur\": \"Hybride\", \"nbPlaces\": \"2\", \"nbPortes\": \"2\"}', 2, 'https://www.sixt.fr/fileadmin/files/global/user_upload/fleet/png/350x200/jaguar-f-type-cabrio-2d-silber-2014.png', 180, 0),
(7, 'Panamera', '{\"marque\": \"Porsche\", \"couleur\": \"Noir\", \"boite\": \"Automatique\", \"moteur\": \"Essence\", \"nbPlaces\": \"5\", \"nbPortes\": \"4\"}', 0, 'https://www.sixt.fr/fileadmin/files/global/user_upload/fleet/png/350x200/porsche-panamera-4d-schwarz-2014.png', 190, 1),
(8, 'AMG GT C Roadster', '{\"marque\": \"Mercedes\", \"couleur\": \"Gris\", \"boite\": \"Automatique\", \"moteur\": \"Essence\", \"nbPlaces\": \"2\", \"nbPortes\": \"2\"}', 1, 'https://www.sixt.fr/fileadmin/files/global/user_upload/fleet/png/350x200/mb-gt-amg-2d-weiss-2017.png', 170, 0),
(9, 'Fortwo', '{\"marque\": \"Smart\", \"couleur\": \"Gris\", \"boite\": \"Automatique\", \"moteur\": \"Electrique\", \"nbPlaces\": \"2\", \"nbPortes\": \"2\"}', 15, 'https://www.sixt.fr/fileadmin/files/global/user_upload/fleet/png/350x200/smart-for-two-cabrio-grau-offen-2017-elektro.png', 20, 0),
(10, 'Cabriolet', '{\"marque\": \"Mini\", \"couleur\": \"Gris\", \"boite\": \"Manuelle\", \"moteur\": \"Electrique\", \"nbPlaces\": \"4\", \"nbPortes\": \"2\"}', 8, 'https://www.sixt.fr/fileadmin/files/global/user_upload/fleet/png/350x200/mini-cooper-cabrio-2d-weiss-offen-2018.png', 50, 0),
(11, 'M340', '{\"marque\": \"BMW\", \"couleur\": \"Noir\", \"boite\": \"Automatique\", \"moteur\": \"Hybride\", \"nbPlaces\": \"5\", \"nbPortes\": \"5\"}', 11, 'https://www.sixt.fr/fileadmin/files/global/user_upload/fleet/png/350x200/bmw-M340i-4d-schwarz-2019.png', 60, 0),
(12, 'Modele S', '{\"marque\": \"Tesla\", \"couleur\": \"bleu\", \"boite\": \"Automatique\", \"moteur\": \"electrique\", \"nbPlaces\": \"5\", \"nbPortes\": \"5\"}', 4, '/img/voitures/TeslaModele-S-5fab00b35241f.jpeg', 63, 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `facture`
--
ALTER TABLE `facture`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `vehicule`
--
ALTER TABLE `vehicule`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `facture`
--
ALTER TABLE `facture`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `vehicule`
--
ALTER TABLE `vehicule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
