-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 04 mai 2020 à 16:54
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP : 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `database`
--

-- --------------------------------------------------------

--
-- Structure de la table `fornisseur`
--

CREATE TABLE `fornisseur` (
  `id_F` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `télé` decimal(10,0) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `name_p` varchar(200) DEFAULT NULL,
  `id_P` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `fornisseur`
--

INSERT INTO `fornisseur` (`id_F`, `name`, `address`, `télé`, `email`, `name_p`, `id_P`) VALUES
(8, 'Qualbal', '15 QU baron RUE lissas Madrid Espagne', '34', 'Qualbal.fish@gmail.com', NULL, 21),
(9, 'Mamamia', '15 QU baron RUE lissas barcalona Espagne', '9999999999', 'mamamia@gmail.com', NULL, 22);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id_P` int(11) NOT NULL,
  `name_p` varchar(200) DEFAULT NULL,
  `category` varchar(200) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `quantité` varchar(200) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `id_R` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id_P`, `name_p`, `category`, `price`, `quantité`, `name`, `id_R`) VALUES
(20, 'Apple', 'Fruit', 5, '70 kg', NULL, 4),
(21, 'Tone', 'Fish', 120, '80 kg', NULL, 5),
(22, ' lemonade', 'Grocery', 2, '200 Packet', NULL, 6);

-- --------------------------------------------------------

--
-- Structure de la table `rayon`
--

CREATE TABLE `rayon` (
  `id_R` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `img` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `rayon`
--

INSERT INTO `rayon` (`id_R`, `name`, `img`) VALUES
(4, 'Vegetables', 'https://images.pexels.com/photos/264636/pexels-photo-264636.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
(5, 'Fish and meat', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQhQitoQLd19m8tnFCZ4xu0rk47Urdygioun8klRnusARflg7Se&usqp=CAU'),
(6, 'Grocery', 'https://images.pexels.com/photos/4053267/pexels-photo-4053267.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
(7, 'Cleaning', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSh0_P0T_wjIX1Aplo6uvLC63LbzKk7hfM6oJPZQc2RR5qRXaYk&usqp=CAU'),
(9, 'Drink', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS4e1QYlX0wSlbcawRBcKcllMUOd_UYQbc7EBcP2MvblSC6Wapu&usqp=CAU'),
(11, 'Electronic ', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRPHjTJ4h8YmgWWEqC8prtQ5fBTwY8-i7PDVU6CjGO_-sn3emMS&usqp=CAU'),
(12, 'gardening', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR65flBaLKoc6msB9lFNZfWJGCw1oIiIhgGUilfd6TIDYv7QOBB&usqp=CAU'),
(13, 'Sport', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQa1igJw28BY5zEg4-lpbg9zYs7laP_Q5QCaEjjkBuxq6K5Zqyf&usqp=CAU'),
(14, 'Clothes', 'https://images.pexels.com/photos/994523/pexels-photo-994523.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `fornisseur`
--
ALTER TABLE `fornisseur`
  ADD PRIMARY KEY (`id_F`),
  ADD KEY `id_P` (`id_P`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id_P`),
  ADD KEY `id_R` (`id_R`);

--
-- Index pour la table `rayon`
--
ALTER TABLE `rayon`
  ADD PRIMARY KEY (`id_R`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `fornisseur`
--
ALTER TABLE `fornisseur`
  MODIFY `id_F` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id_P` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pour la table `rayon`
--
ALTER TABLE `rayon`
  MODIFY `id_R` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `fornisseur`
--
ALTER TABLE `fornisseur`
  ADD CONSTRAINT `fornisseur_ibfk_1` FOREIGN KEY (`id_P`) REFERENCES `produit` (`id_P`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `produit_ibfk_1` FOREIGN KEY (`id_R`) REFERENCES `rayon` (`id_R`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
