-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 30 sep. 2021 à 05:38
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
-- Base de données : `suividiplomes`
--

-- --------------------------------------------------------

--
-- Structure de la table `demandes`
--

CREATE TABLE `demandes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `etudiant_cin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_demande` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_demande` date NOT NULL,
  `traite` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `demandes`
--

INSERT INTO `demandes` (`id`, `etudiant_cin`, `type_demande`, `date_demande`, `traite`, `created_at`, `updated_at`) VALUES
(1, 'AB345668', 'DEUG', '2021-06-01', 1, '2021-09-05 21:34:32', '2021-09-29 00:30:39'),
(2, 'AB345668', 'Licence', '2020-05-17', 0, '2021-09-05 21:34:32', '2021-09-15 03:51:17'),
(3, 'AB222222', 'DEUG', '2020-05-22', 1, '2021-09-05 21:34:32', '2021-09-05 21:34:32'),
(4, 'AB222222', 'Licence', '2021-07-03', 0, '2021-09-05 21:34:33', '2021-09-13 04:26:53'),
(5, 'WA111111', 'DEUG', '2020-06-01', 0, '2021-09-05 21:34:33', '2021-09-13 04:29:20'),
(6, 'WA111111', 'Licence', '2021-07-23', 0, '2021-09-05 21:34:33', '2021-09-05 21:34:33'),
(7, 'AE4355789', 'DEUG', '2021-07-23', 1, '2021-09-05 21:34:33', '2021-09-13 02:57:44'),
(8, 'AE3477778', 'DEUG', '2021-07-29', 0, '2021-09-14 11:29:34', '2021-09-14 11:29:34'),
(9, 'AE4690754', 'DEUG', '2021-07-29', 1, '2021-09-14 11:29:34', '2021-09-14 11:42:53'),
(11, 'Ffd', 'DEUG', '2021-07-29', 1, '2021-09-14 11:29:35', '2021-09-14 11:42:53'),
(13, 'Hffr', 'DEUG', '2021-07-29', 0, '2021-09-14 12:43:31', '2021-09-14 12:43:31'),
(14, 'Iutth', 'Licence', '2021-08-02', 0, '2021-09-14 12:43:33', '2021-09-14 12:43:33');

-- --------------------------------------------------------

--
-- Structure de la table `diplomes`
--

CREATE TABLE `diplomes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `demande_id` bigint(20) UNSIGNED NOT NULL,
  `etudiant_cin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `statut_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `date_creationDossier_envoiAuServiceDiplome` date NOT NULL,
  `date_reedition` date DEFAULT NULL,
  `type_erreur` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_impression_envoiAuDecanat` date DEFAULT NULL,
  `date_singature_renvoiAuServiceDiplome` date DEFAULT NULL,
  `date_generationBorodeaux_envoiApresidence` date DEFAULT NULL,
  `date_receptionParBureauOrdre_envoiAuGuichetRetrait` date DEFAULT NULL,
  `date_notificationEtudiant` date DEFAULT NULL,
  `date_retraitDiplome_archiveDossier` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `diplomes`
--

INSERT INTO `diplomes` (`id`, `demande_id`, `etudiant_cin`, `statut_id`, `date_creationDossier_envoiAuServiceDiplome`, `date_reedition`, `type_erreur`, `date_impression_envoiAuDecanat`, `date_singature_renvoiAuServiceDiplome`, `date_generationBorodeaux_envoiApresidence`, `date_receptionParBureauOrdre_envoiAuGuichetRetrait`, `date_notificationEtudiant`, `date_retraitDiplome_archiveDossier`, `created_at`, `updated_at`) VALUES
(2, 3, 'AB222222', 7, '2020-05-30', NULL, NULL, '2021-09-13', '2021-09-13', '2021-09-14', '2021-09-14', '2021-09-16', NULL, '2021-09-05 21:34:33', '2021-09-16 12:37:14'),
(8, 7, 'AE4355789', 7, '2021-09-13', NULL, NULL, '2021-09-13', '2021-09-13', '2021-09-13', '2021-09-13', '2021-09-16', NULL, '2021-09-13 02:57:44', '2021-09-16 12:35:38'),
(11, 9, 'AE4690754', 4, '2021-09-14', NULL, NULL, '2021-09-14', '2021-09-14', NULL, NULL, NULL, NULL, '2021-09-14 11:42:53', '2021-09-14 12:50:21'),
(12, 11, 'Ffd', 4, '2021-09-14', '2021-09-14', 'نوع الخطأ هو الاسم', '2021-09-14', '2021-09-14', NULL, NULL, NULL, NULL, '2021-09-14 11:42:53', '2021-09-14 12:50:21'),
(15, 1, 'AB345668', 1, '2021-09-29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-09-29 00:30:39', '2021-09-29 00:30:39');

-- --------------------------------------------------------

--
-- Structure de la table `etudiants`
--

CREATE TABLE `etudiants` (
  `cin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apogee` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cne` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom_arabe` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom_arabe` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filiere` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `option` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nationalite` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_naiss` date NOT NULL,
  `lieu_naiss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_inst` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `etudiants`
--

INSERT INTO `etudiants` (`cin`, `apogee`, `cne`, `nom`, `prenom`, `nom_arabe`, `prenom_arabe`, `filiere`, `option`, `nationalite`, `date_naiss`, `lieu_naiss`, `email_inst`, `created_at`, `updated_at`) VALUES
('AB222222', '1507644', 'J11119776', 'ELIDRISSI', 'Maha', 'الادريسي', 'مها', 'Droit en français', 'Droit Privé', 'Marocaine', '1996-05-22', 'مراكش', 'Maha.elidrissi@um5.ac.ma', '2021-09-05 21:34:32', '2021-09-05 21:34:32'),
('AB345668', '17008877', 'J1209776', 'ELMADANI', 'Ahmed', 'المدني', 'احمد', 'القانون باللغة العربية', 'قانون الأعمال', 'مغربي', '1999-07-08', 'الرباط', 'Ahmed.elmadani@um5.ac.ma', '2021-09-05 21:34:32', '2021-09-13 04:30:31'),
('AE3477778', '1500434', 'J34555789', 'IDRISSI', 'Zineb', 'ادريسي', 'زينب', 'Sciences Economiques et Gestion', NULL, 'Marocaine', '1998-08-06', 'Rabat', 'zineb.idrissi@um5.ac.ma', '2021-09-14 11:29:34', '2021-09-14 11:29:34'),
('AE4355789', '15008877', 'J1309776', 'JOADANI', 'Mustafa', 'جعداني', 'مصطفى', 'القانون باللغة العربية', NULL, 'مغربي', '1999-12-08', 'الرباط', 'Mustafa.joadani@um5.ac.ma', '2021-09-05 21:34:32', '2021-09-05 21:34:32'),
('AE4690754', '1500433', 'J6543322', 'EL', 'Jihan', 'ال', 'جيهان', 'القانون باللغة العربية', NULL, 'مغربية', '1995-07-22', 'Salè', 'jihane.el@um5.ac.ma', '2021-09-14 11:29:34', '2021-09-14 11:29:34'),
('Ffd', 'G', 'Ff', 'GGG', 'Cdd', 'Ddd', 'Cfhhd', 'القانون باللغة العربية', NULL, 'Hh', '2021-07-17', 'Vh', 'd@gmail.com', '2021-09-14 11:29:35', '2021-09-14 12:46:45'),
('Hffr', 'Hgfff', 'Vgff', 'HII', 'Hello', 'نال', 'البي', 'Droit en français', NULL, 'Vfdd', '2021-07-24', 'Gffd', 'jhh@gmail.com', '2021-09-14 11:29:34', '2021-09-14 11:29:34'),
('Iutth', '5432', 'Fds', 'HH', 'Nkm', 'متا', 'الل', 'Droit en français', 'Fr', 'Ggg', '2021-08-20', 'Hhh', 'ajah@gmail.com', '2021-09-14 11:29:36', '2021-09-14 12:43:33'),
('WA111111', '1702355', 'J5432299', 'FAOUZI', 'Amal', 'فوزي', 'أمال', 'Sciences Economiques et Gestion', 'Finance Comptabilité', 'Marocaine', '1998-01-11', 'سلا', 'Amal.faouzi@um5.ac.ma', '2021-09-05 21:34:32', '2021-09-13 04:30:01');

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `formulaires`
--

CREATE TABLE `formulaires` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type_formulaire` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lien` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `formulaires`
--

INSERT INTO `formulaires` (`id`, `type_formulaire`, `lien`, `api_id`, `created_at`, `updated_at`) VALUES
(1, 'DEUG', 'https://forms.gle/VwdHjuyfrcrNi6', 'k6frzhgfh4rkfrh', '2021-09-05 21:34:32', '2021-09-05 21:34:32'),
(2, 'Licence', 'https://forms.gle/VdXwKUytfcz5YA9A', 'upxdrrurt2asi', '2021-09-05 21:34:32', '2021-09-05 21:34:32');

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000001_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_07_17_012528_create_formulaires_table', 1),
(6, '2021_07_17_020727_create_etudiants_table', 1),
(7, '2021_07_17_180108_create_demandes_table', 1),
(8, '2021_07_17_181113_create_statut_diplome_table', 1),
(9, '2021_07_17_182123_create_diplomes_table', 1),
(10, '2021_07_22_212036_laratrust_setup_tables', 1);

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'profile-read', '2021-09-05 21:34:25', '2021-09-05 21:34:25'),
(2, 'profile-update', '2021-09-05 21:34:25', '2021-09-05 21:34:25'),
(3, 'users-create', '2021-09-05 21:34:25', '2021-09-05 21:34:25'),
(4, 'users-read', '2021-09-05 21:34:25', '2021-09-05 21:34:25'),
(5, 'users-update', '2021-09-05 21:34:25', '2021-09-05 21:34:25'),
(6, 'users-delete', '2021-09-05 21:34:25', '2021-09-05 21:34:25'),
(7, 'formulaires-read', '2021-09-05 21:34:25', '2021-09-05 21:34:25'),
(8, 'formulaires-update', '2021-09-05 21:34:25', '2021-09-05 21:34:25'),
(9, 'etudiants-read', '2021-09-05 21:34:25', '2021-09-05 21:34:25'),
(10, 'demandes-read', '2021-09-05 21:34:25', '2021-09-05 21:34:25'),
(11, 'diplomes-read', '2021-09-05 21:34:25', '2021-09-05 21:34:25'),
(12, 'diplomes-create', '2021-09-05 21:34:26', '2021-09-05 21:34:26'),
(13, 'etudiants-update', '2021-09-05 21:34:28', '2021-09-05 21:34:28'),
(14, 'diplomes-update', '2021-09-05 21:34:28', '2021-09-05 21:34:28');

-- --------------------------------------------------------

--
-- Structure de la table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(9, 2),
(9, 3),
(9, 4),
(9, 5),
(9, 6),
(9, 7),
(9, 8),
(10, 1),
(10, 2),
(10, 3),
(10, 4),
(11, 1),
(11, 2),
(11, 3),
(11, 4),
(11, 5),
(11, 6),
(11, 7),
(11, 8),
(12, 2),
(12, 3),
(12, 4),
(13, 5),
(14, 5),
(14, 6),
(14, 7),
(14, 8);

-- --------------------------------------------------------

--
-- Structure de la table `permission_user`
--

CREATE TABLE `permission_user` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'token', '04b2bd61fc001165ee954058916c13e7b9e25be014b13eb70d6f78ddeed79f54', '[\"*\"]', '2021-09-06 05:00:32', '2021-09-05 21:46:39', '2021-09-06 05:00:32'),
(2, 'App\\Models\\User', 2, 'token', 'b2a25927c8e8969656d4f51603178ccf0e12de3852e2fa6cef1b207efebcc282', '[\"*\"]', '2021-09-06 05:32:42', '2021-09-06 05:00:53', '2021-09-06 05:32:42'),
(3, 'App\\Models\\User', 1, 'token', '41460661cabff708faeeccbda4beb9ffad45f9421f28356a21f9ba085769e489', '[\"*\"]', '2021-09-07 18:07:52', '2021-09-07 16:18:00', '2021-09-07 18:07:52'),
(4, 'App\\Models\\User', 1, 'token', 'd71a3f4f95a05098d23f69d580228daba10e50056a726989d695f9c3e002af93', '[\"*\"]', '2021-09-12 19:01:14', '2021-09-07 18:11:30', '2021-09-12 19:01:14'),
(5, 'App\\Models\\User', 5, 'token', '694d92b8c11c641ab51ca3c2c75cc1425f65e1587d42b605bb0b2adabc068e27', '[\"*\"]', '2021-09-12 19:01:51', '2021-09-12 19:01:41', '2021-09-12 19:01:51'),
(6, 'App\\Models\\User', 11, 'token', '4b0f86a9f313c8a6615cf4b090c7a44b99b72dced963716f6861cc5993b791d8', '[\"*\"]', '2021-09-12 19:41:35', '2021-09-12 19:11:39', '2021-09-12 19:41:35'),
(7, 'App\\Models\\User', 11, 'token', '8a727bb5e5a099578692da30718f6f6b6a23900e2e26bfff63b2fd31825ac65e', '[\"*\"]', '2021-09-12 19:42:18', '2021-09-12 19:41:41', '2021-09-12 19:42:18'),
(8, 'App\\Models\\User', 15, 'token', 'c23a67cb578e6da020a3dec460e090482a12ff565a14d1523b731f8fd8c3cbc7', '[\"*\"]', '2021-09-12 19:43:56', '2021-09-12 19:43:51', '2021-09-12 19:43:56'),
(9, 'App\\Models\\User', 13, 'token', '80b589ce6b67627b57cba56e5474d6c941ef7f5d5453cd5aa9e0a65034427d24', '[\"*\"]', '2021-09-12 19:45:59', '2021-09-12 19:44:36', '2021-09-12 19:45:59'),
(10, 'App\\Models\\User', 17, 'token', '1b3430430f150798d0761ae3405303b2ad6176273fd000432a95dd960ffe59a9', '[\"*\"]', '2021-09-13 01:51:38', '2021-09-12 19:46:54', '2021-09-13 01:51:38'),
(11, 'App\\Models\\User', 11, 'token', '5f58a52b0b8f1ff5965f21c552f6abc08a382edaef0de41ecbed34a75d7ddd8b', '[\"*\"]', '2021-09-13 02:43:09', '2021-09-13 01:51:54', '2021-09-13 02:43:09'),
(12, 'App\\Models\\User', 13, 'token', '7fd5b134abdf367728e8613fd49429a21a40ee7c0ed3c2a49fadc108b97f5572', '[\"*\"]', '2021-09-13 02:45:41', '2021-09-13 02:43:42', '2021-09-13 02:45:41'),
(13, 'App\\Models\\User', 12, 'token', 'e335e2b7a4bb50222be46de77e6d12e8f2d047ec6fb97acd5787a7d41c7e28e0', '[\"*\"]', '2021-09-13 02:58:00', '2021-09-13 02:45:56', '2021-09-13 02:58:00'),
(14, 'App\\Models\\User', 17, 'token', 'b87b137c44caeb4e3887dbd030b35d38ae7fec309b826b041c39cfe68ed31ced', '[\"*\"]', '2021-09-13 02:58:19', '2021-09-13 02:58:14', '2021-09-13 02:58:19'),
(15, 'App\\Models\\User', 15, 'token', '796b76cf64fcdcc755b09404a7668bc4f1149829f0104fe35ca4f3bbe1508f18', '[\"*\"]', '2021-09-13 03:08:08', '2021-09-13 02:58:34', '2021-09-13 03:08:08'),
(16, 'App\\Models\\User', 16, 'token', '690597e63ffb7ffb3d4795b29e0ea3ef96edb91fd0f7f72e18f50c63a6cb7441', '[\"*\"]', '2021-09-13 03:08:55', '2021-09-13 03:08:28', '2021-09-13 03:08:55'),
(17, 'App\\Models\\User', 15, 'token', '1d09f1599f05020bada0e9e9e62d4f225b1cde97f55f547a2547cdf5b4d7b216', '[\"*\"]', '2021-09-13 03:11:39', '2021-09-13 03:09:07', '2021-09-13 03:11:39'),
(18, 'App\\Models\\User', 15, 'token', '0b6da92375f0dbc8c9e91a6e19170c365a236dfee50ab8cfffe28083ac2af17d', '[\"*\"]', '2021-09-13 03:11:58', '2021-09-13 03:11:53', '2021-09-13 03:11:58'),
(19, 'App\\Models\\User', 17, 'token', 'ca82eca9d4bf3c1921d35467ffab32bae5962c4aaf2e5f128e90f441ef66b761', '[\"*\"]', '2021-09-13 03:12:37', '2021-09-13 03:12:15', '2021-09-13 03:12:37'),
(20, 'App\\Models\\User', 18, 'token', 'c03db24d8cf58a5dafc2b9aa14c22242451b2e596f81021f7ed7e4438e543482', '[\"*\"]', '2021-09-13 03:17:52', '2021-09-13 03:12:51', '2021-09-13 03:17:52'),
(21, 'App\\Models\\User', 11, 'token', '08376dd5f218c7e1b81fd1c2950e33a2ea3e00e26a2c3f9b2ff9150afd1aaf43', '[\"*\"]', '2021-09-13 03:40:06', '2021-09-13 03:18:22', '2021-09-13 03:40:06'),
(22, 'App\\Models\\User', 17, 'token', '70529d2105acbe41855c0e77f77aad80119e8e00e89468f730fe0d842d75751e', '[\"*\"]', '2021-09-13 03:40:33', '2021-09-13 03:40:26', '2021-09-13 03:40:33'),
(23, 'App\\Models\\User', 15, 'token', 'bf771e3063d742aebf85a1e37d157c01053d92793a88bc6a011d5ac1e712d064', '[\"*\"]', '2021-09-13 03:46:01', '2021-09-13 03:40:42', '2021-09-13 03:46:01'),
(24, 'App\\Models\\User', 11, 'token', 'f5925a8a1c822ddfb4fdb30c35c81cc2ad77c2103b83c19ee764e3471d7a0991', '[\"*\"]', '2021-09-13 04:20:14', '2021-09-13 03:47:12', '2021-09-13 04:20:14'),
(25, 'App\\Models\\User', 15, 'token', '2be85ba5cd9942da4a29ad5dc95cd4d1c7544be0444a613e81826a9303d4e372', '[\"*\"]', '2021-09-13 04:20:57', '2021-09-13 04:20:46', '2021-09-13 04:20:57'),
(26, 'App\\Models\\User', 11, 'token', 'f3e0f62c3b1bb3c980eec96653952d2fdaf5f4400a15ab316f388e44db1abfe9', '[\"*\"]', '2021-09-13 04:21:40', '2021-09-13 04:21:33', '2021-09-13 04:21:40'),
(27, 'App\\Models\\User', 12, 'token', '023034f34f12887def2ab814c691efd71d0c426622090227629f9e5d9165112d', '[\"*\"]', '2021-09-13 04:22:01', '2021-09-13 04:21:56', '2021-09-13 04:22:01'),
(28, 'App\\Models\\User', 14, 'token', '3993d834fb1482ac12cd41d88747d8a1b66fec6a5429ec5d98f6362b11c77a12', '[\"*\"]', '2021-09-13 04:22:23', '2021-09-13 04:22:18', '2021-09-13 04:22:23'),
(29, 'App\\Models\\User', 13, 'token', '5dcbdc51950ae31fe7eb2a068bc42084341fc4dfb21aeae4d2addb06225cb562', '[\"*\"]', '2021-09-13 04:28:50', '2021-09-13 04:22:40', '2021-09-13 04:28:50'),
(30, 'App\\Models\\User', 14, 'token', '71e9dc948872bdf3178d363675efa400a0c256b2dfa130cafacafa82b808f4aa', '[\"*\"]', '2021-09-13 04:29:20', '2021-09-13 04:29:11', '2021-09-13 04:29:20'),
(31, 'App\\Models\\User', 15, 'token', 'f16d192c30e4adfcf9c56c5ab112a9df622199ab99ee9e17f08af75b6753df7b', '[\"*\"]', '2021-09-13 04:30:39', '2021-09-13 04:29:44', '2021-09-13 04:30:39'),
(32, 'App\\Models\\User', 16, 'token', '85fcc112078bc988e37ea9a715b5eedea6d69975ed895f3120c0e553c25d0ced', '[\"*\"]', '2021-09-13 04:31:02', '2021-09-13 04:30:55', '2021-09-13 04:31:02'),
(33, 'App\\Models\\User', 11, 'token', '2dbbf477d8851537e8f2345972dd324393f8ad06e9966e5d2506eeb2215fa4cf', '[\"*\"]', '2021-09-13 04:31:21', '2021-09-13 04:31:15', '2021-09-13 04:31:21'),
(34, 'App\\Models\\User', 15, 'token', 'b23a759c5472d97a39c283d01249fd9c917eb187ae19e7b71d30762acc53a7f4', '[\"*\"]', '2021-09-13 04:32:35', '2021-09-13 04:32:07', '2021-09-13 04:32:35'),
(35, 'App\\Models\\User', 11, 'token', 'e275991639f22b16ce8f8eb440301ea0b3932cb79c8e88b7b68046c17dc8a56e', '[\"*\"]', '2021-09-13 05:02:01', '2021-09-13 04:33:21', '2021-09-13 05:02:01'),
(36, 'App\\Models\\User', 13, 'token', '66ec1c589376d506366b5565f6f7126ddbe92688d6b952f4bfd67620f439b00e', '[\"*\"]', '2021-09-13 12:43:31', '2021-09-13 11:02:10', '2021-09-13 12:43:31'),
(37, 'App\\Models\\User', 11, 'token', '294ff4061b838ad8e27356c1bb9f6e17deb30e08eeaab65560c72ff92ae0bb98', '[\"*\"]', '2021-09-14 11:22:31', '2021-09-14 11:20:06', '2021-09-14 11:22:31'),
(38, 'App\\Models\\User', 11, 'token', '35f9346b1e7f6c47f81b1194ec5009fd816f2f425b0d2c638c6b43f62bb49218', '[\"*\"]', '2021-09-14 11:39:45', '2021-09-14 11:23:08', '2021-09-14 11:39:45'),
(39, 'App\\Models\\User', 12, 'token', 'ee4c561a37d097e947d41491ac43c2a5e870f43eafdb2afdfc927fd1fd434798', '[\"*\"]', '2021-09-14 11:43:41', '2021-09-14 11:40:24', '2021-09-14 11:43:41'),
(40, 'App\\Models\\User', 15, 'token', '47769911d5249ebe1cf8a61954a48ce9824f0595afa1c1067dee56f3cc990553', '[\"*\"]', '2021-09-14 12:06:53', '2021-09-14 11:43:55', '2021-09-14 12:06:53'),
(41, 'App\\Models\\User', 16, 'token', '1486b1baf150d00cc6f1879f7301450d594845a3e235a4263e84e6525d51aaee', '[\"*\"]', '2021-09-14 12:11:34', '2021-09-14 12:11:04', '2021-09-14 12:11:34'),
(42, 'App\\Models\\User', 17, 'token', '33311f9533bb3ef6c78aad4f50d949388c1c9c989099990da277c39e6a7a3ec9', '[\"*\"]', '2021-09-14 12:12:31', '2021-09-14 12:11:52', '2021-09-14 12:12:31'),
(43, 'App\\Models\\User', 15, 'token', '35f4697b1be47c6cab5238e96007710a8b1c80c2fc50a72f2fab2ddc5dc6d392', '[\"*\"]', '2021-09-14 12:13:44', '2021-09-14 12:12:45', '2021-09-14 12:13:44'),
(44, 'App\\Models\\User', 11, 'token', '29ffebb79cd3da46d11d4b041f069bf645a05db3b0c210764e5b9b1e4b5b222a', '[\"*\"]', '2021-09-14 12:18:49', '2021-09-14 12:16:44', '2021-09-14 12:18:49'),
(45, 'App\\Models\\User', 11, 'token', '4d4ffef3dd063382b6ee4563405541be87f48d82a39c3a5a7a3759a7506cbeb5', '[\"*\"]', '2021-09-14 12:40:19', '2021-09-14 12:39:59', '2021-09-14 12:40:19'),
(46, 'App\\Models\\User', 12, 'token', '0c5ccd727c0544698bc1f4241f73bce6d88618284c8a58c371b8f8edfa220caf', '[\"*\"]', '2021-09-14 12:44:38', '2021-09-14 12:41:22', '2021-09-14 12:44:38'),
(47, 'App\\Models\\User', 15, 'token', 'ef33fdc9a47e04d71f66ca19e64774b0e0182b783b1734be311b597d6aad0ccb', '[\"*\"]', '2021-09-14 12:49:40', '2021-09-14 12:45:17', '2021-09-14 12:49:40'),
(48, 'App\\Models\\User', 16, 'token', '5f753e73a14d30021731f8bcbfaf089411231ac9e807593b67cac52dd03f2920', '[\"*\"]', '2021-09-14 12:50:27', '2021-09-14 12:50:06', '2021-09-14 12:50:27'),
(49, 'App\\Models\\User', 17, 'token', '9182d58928a81b265aa4b1371958c33802c9b20f8e30241fc60ec295e42827d7', '[\"*\"]', '2021-09-14 12:51:43', '2021-09-14 12:51:22', '2021-09-14 12:51:43'),
(50, 'App\\Models\\User', 18, 'token', 'fab33a75769ecd20ef17dc223b642c2d03ca53a54af2884b8cd1dfb26506c5b1', '[\"*\"]', '2021-09-14 12:55:26', '2021-09-14 12:52:30', '2021-09-14 12:55:26'),
(51, 'App\\Models\\User', 11, 'token', 'af86ea892041c966f24f63bc0dbde6c2a159e87fc9b6c0c7a6e9ac7d2e0ade4b', '[\"*\"]', '2021-09-14 13:22:00', '2021-09-14 12:55:43', '2021-09-14 13:22:00'),
(52, 'App\\Models\\User', 19, 'token', '7a2d0a90720cd3956af2948a0e1ee8796b513255fa58bebd9fc3e02425461d09', '[\"*\"]', '2021-09-15 00:48:22', '2021-09-14 22:20:28', '2021-09-15 00:48:22'),
(53, 'App\\Models\\User', 18, 'token', 'e1e1a03ea0c0913c1c9689559ee9503c940a15815f32b7394c03bfab82d17d43', '[\"*\"]', '2021-09-15 01:00:58', '2021-09-15 00:54:17', '2021-09-15 01:00:58'),
(54, 'App\\Models\\User', 11, 'token', '93c029300cd2db35e6159f9a62412d4aa8667861ccdda7ed92f44a510de3e3df', '[\"*\"]', '2021-09-15 01:03:56', '2021-09-15 01:01:41', '2021-09-15 01:03:56'),
(55, 'App\\Models\\User', 18, 'token', 'ad2f2ff8d27743fcb7be46775b4b190b8a6022833680f242f09edbad6455757d', '[\"*\"]', '2021-09-15 03:11:27', '2021-09-15 01:04:12', '2021-09-15 03:11:27'),
(56, 'App\\Models\\User', 11, 'token', 'a94cf90ea36861da21bde8a1ace2889e2d2d62ff76a9a305dfd088ca23c21974', '[\"*\"]', '2021-09-15 03:24:42', '2021-09-15 03:17:23', '2021-09-15 03:24:42'),
(57, 'App\\Models\\User', 15, 'token', '7c8d5c9bba2fe2eec6e674922c057d834631acd4696cf53a2f1a8158d4a73c6d', '[\"*\"]', '2021-09-15 03:50:06', '2021-09-15 03:31:32', '2021-09-15 03:50:06'),
(58, 'App\\Models\\User', 12, 'token', '74dc5042ace697dd9da425a0bc2e63700b8b67d7f1bc986b4e48a129db874dcb', '[\"*\"]', '2021-09-15 03:51:17', '2021-09-15 03:51:00', '2021-09-15 03:51:17'),
(59, 'App\\Models\\User', 15, 'token', '69893c5971879fa45d31a6cb844e6cbabd1fc2afd854e069e36e0e88cebf27aa', '[\"*\"]', '2021-09-15 03:51:44', '2021-09-15 03:51:27', '2021-09-15 03:51:44'),
(60, 'App\\Models\\User', 16, 'token', 'd8a601df86c2af1cb1ccb441cf7d9fed854c95f4085ddcb8b3ecad46d9c9049a', '[\"*\"]', '2021-09-15 03:52:23', '2021-09-15 03:52:02', '2021-09-15 03:52:23'),
(61, 'App\\Models\\User', 15, 'token', '4e19f69fff3bae17456c881a2194191cc0d643a3bbb454369912cf9785d1227c', '[\"*\"]', '2021-09-15 04:35:22', '2021-09-15 03:52:44', '2021-09-15 04:35:22'),
(62, 'App\\Models\\User', 13, 'token', 'ce1aeea1ad390cf8e915e9c63468fe09f85644b02dd85278b7073e629a590a9d', '[\"*\"]', '2021-09-15 04:36:29', '2021-09-15 04:35:40', '2021-09-15 04:36:29'),
(63, 'App\\Models\\User', 15, 'token', 'a05b306490382aa49b1d1429c8ed7266fe9196edef856c927016cacbdeeb8603', '[\"*\"]', '2021-09-15 05:32:28', '2021-09-15 04:36:48', '2021-09-15 05:32:28'),
(64, 'App\\Models\\User', 11, 'token', 'f0c7420f7c244e2710f2e547fb67c1c34645c3fd6b6c8b8b6b51c48f66f40457', '[\"*\"]', '2021-09-15 05:47:44', '2021-09-15 05:43:13', '2021-09-15 05:47:44'),
(65, 'App\\Models\\User', 12, 'token', 'cd12de2e2486c82d87ce11b405226dcdaf633a0bca87bba47e02d4036f20f2a3', '[\"*\"]', '2021-09-15 05:48:56', '2021-09-15 05:48:36', '2021-09-15 05:48:56'),
(66, 'App\\Models\\User', 11, 'token', '5464726251bf7823708a1bea157cae7b0e4b88cbed830ad02402bd446923564f', '[\"*\"]', '2021-09-15 05:49:16', '2021-09-15 05:49:09', '2021-09-15 05:49:16'),
(67, 'App\\Models\\User', 11, 'token', 'cc52a4b2b0c14f04645d1e07faa2b6fced55db7f248e3a1879a93053a4d30985', '[\"*\"]', '2021-09-15 11:53:17', '2021-09-15 06:17:08', '2021-09-15 11:53:17'),
(68, 'App\\Models\\User', 18, 'token', 'e9eff0769cef7166d8fbb29d4e220ce9439b695bdee0f9a8da796e8e50696efd', '[\"*\"]', '2021-09-15 14:02:04', '2021-09-15 13:45:16', '2021-09-15 14:02:04'),
(69, 'App\\Models\\User', 18, 'token', '3bd4dee8d9172bf296cc688deb2741c7a16b4c7e3de855f8851c82e3a3d76a29', '[\"*\"]', '2021-09-16 21:37:50', '2021-09-16 11:59:23', '2021-09-16 21:37:50'),
(70, 'App\\Models\\User', 19, 'token', '3bbb06097e73a04428ba713fc34b747d682ced622317af2e72c8bb3ece65a99f', '[\"*\"]', '2021-09-28 23:47:09', '2021-09-28 23:42:43', '2021-09-28 23:47:09'),
(71, 'App\\Models\\User', 12, 'token', '8092b3cef47e8b6d84e3913b08bbef7b9ef085fb277461619a228bc6fa985b42', '[\"*\"]', '2021-09-28 23:50:32', '2021-09-28 23:48:27', '2021-09-28 23:50:32'),
(72, 'App\\Models\\User', 19, 'token', 'eec3c1d6242d75133c9141b4ab87e738a34a5a397b234428dd6ea7edf8113a1e', '[\"*\"]', '2021-09-29 00:26:57', '2021-09-28 23:59:15', '2021-09-29 00:26:57'),
(73, 'App\\Models\\User', 12, 'token', '66f11599866f9b5649be6b796cf37a057e907cc2ea64c20d71aaf82627b53482', '[\"*\"]', '2021-09-29 00:30:56', '2021-09-29 00:29:29', '2021-09-29 00:30:56'),
(74, 'App\\Models\\User', 15, 'token', '1ff7fb38a3f0e13d16e80843200cbfdc51e61a49c9ae25a333bfe5b61c88c0d6', '[\"*\"]', '2021-09-29 00:31:59', '2021-09-29 00:31:28', '2021-09-29 00:31:59');

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', '2021-09-05 21:34:25', '2021-09-05 21:34:25'),
(2, 'Guichet Droit Arabe', '2021-09-05 21:34:26', '2021-09-05 21:34:26'),
(3, 'Guichet Droit Français', '2021-09-05 21:34:26', '2021-09-05 21:34:26'),
(4, 'Guichet Economie', '2021-09-05 21:34:27', '2021-09-05 21:34:27'),
(5, 'Service de Diplômes', '2021-09-05 21:34:28', '2021-09-05 21:34:28'),
(6, 'Décanat', '2021-09-05 21:34:28', '2021-09-05 21:34:28'),
(7, 'Bureau d\'Ordre', '2021-09-05 21:34:28', '2021-09-05 21:34:28'),
(8, 'Guichet de Retrait', '2021-09-05 21:34:29', '2021-09-05 21:34:29');

-- --------------------------------------------------------

--
-- Structure de la table `role_user`
--

CREATE TABLE `role_user` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `role_user`
--

INSERT INTO `role_user` (`role_id`, `user_id`, `user_type`) VALUES
(1, 11, 'App\\Models\\User'),
(2, 12, 'App\\Models\\User'),
(3, 13, 'App\\Models\\User'),
(4, 14, 'App\\Models\\User'),
(5, 15, 'App\\Models\\User'),
(6, 16, 'App\\Models\\User'),
(7, 17, 'App\\Models\\User'),
(8, 18, 'App\\Models\\User'),
(1, 19, 'App\\Models\\User');

-- --------------------------------------------------------

--
-- Structure de la table `statut_diplome`
--

CREATE TABLE `statut_diplome` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `statut` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `statut_diplome`
--

INSERT INTO `statut_diplome` (`id`, `statut`, `created_at`, `updated_at`) VALUES
(1, 'Créé et envoyé au service diplômes', NULL, NULL),
(2, 'Réédité', NULL, NULL),
(3, 'Imprimé et envoyé au décanat', NULL, NULL),
(4, 'Signé et renvoyé au service de diplômes', NULL, NULL),
(5, 'Envoyé à la présidence', NULL, NULL),
(6, 'Reçu par bureau d\'ordre et envoyé au guichet de retrait', NULL, NULL),
(7, 'Diplôme prêt à retirer (étudiant notifié)', NULL, NULL),
(8, 'Diplôme retiré et dossier archivé', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(11, 'Admin@gmail.com', '$2y$10$GmKmh8NGXVqTk6CNyu.aOOg3Tc54l2bqgytS5EiToJdkXpmSloVpK', NULL, '2021-09-12 19:10:18', '2021-09-12 19:10:18'),
(12, 'user1@gmail.com', '$2y$10$Bv1n7swZmNFDlHMW5YkWL.87odYJ77TLCxotPKIamfYq8TTlUm3Ly', NULL, '2021-09-12 19:10:19', '2021-09-14 13:00:49'),
(13, 'user2@gmail.com', '$2y$10$fa6.wbLAclV1O33HaVO5BeoJDvupqh6ramMKRsg/XVlQF5HHpYqiW', NULL, '2021-09-12 19:10:19', '2021-09-12 19:10:19'),
(14, 'user3@gmail.com', '$2y$10$jqvELZbhq1GuZOqopk8HxufN4clzO9A6yZ3SE3BjZbB3LD.sHbPUG', NULL, '2021-09-12 19:10:20', '2021-09-12 19:10:20'),
(15, 'user4@gmail.com', '$2y$10$cqR/iXWd9eoVtXyrh9YW4uAWah/Oos4m14KuLv.GvtCM7nWg0nhU2', NULL, '2021-09-12 19:10:21', '2021-09-12 19:10:21'),
(16, 'user5@gmail.com', '$2y$10$PRj68LouE1E8dyMvGYInF.VOKxYnFLdIA3ACDM4R2Kq5jmVhRJzVy', NULL, '2021-09-12 19:10:21', '2021-09-12 19:10:21'),
(17, 'user6@gmail.com', '$2y$10$.Qdl.8WKivqPO1GSVlGxUuI/5i7miGdNlJXhL7bcJOo9/4c6UniRO', NULL, '2021-09-12 19:10:22', '2021-09-12 19:10:22'),
(18, 'user7@gmail.com', '$2y$10$AGN5LsJu9Yc.9bOFdgfNy.hf4phEOqqqCqsF4uQaNWoMy4kEF3az.', NULL, '2021-09-12 19:10:22', '2021-09-12 19:10:22'),
(19, 'Admin2@gmail.com', '$2y$10$TFBB/mnFvNoF.juiZX384u9/0QvOUtA9VneasaKlpkNiI5N.kgiei', NULL, '2021-09-14 12:59:33', '2021-09-14 12:59:33');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `demandes`
--
ALTER TABLE `demandes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `demandes_etudiant_cin_foreign` (`etudiant_cin`);

--
-- Index pour la table `diplomes`
--
ALTER TABLE `diplomes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `diplomes_demande_id_unique` (`demande_id`),
  ADD KEY `diplomes_etudiant_cin_foreign` (`etudiant_cin`),
  ADD KEY `diplomes_statut_id_foreign` (`statut_id`);

--
-- Index pour la table `etudiants`
--
ALTER TABLE `etudiants`
  ADD PRIMARY KEY (`cin`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `formulaires`
--
ALTER TABLE `formulaires`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Index pour la table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Index pour la table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Index pour la table `permission_user`
--
ALTER TABLE `permission_user`
  ADD PRIMARY KEY (`user_id`,`permission_id`,`user_type`),
  ADD KEY `permission_user_permission_id_foreign` (`permission_id`);

--
-- Index pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Index pour la table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`,`user_type`),
  ADD UNIQUE KEY `role_user_user_id_unique` (`user_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Index pour la table `statut_diplome`
--
ALTER TABLE `statut_diplome`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `demandes`
--
ALTER TABLE `demandes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `diplomes`
--
ALTER TABLE `diplomes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `formulaires`
--
ALTER TABLE `formulaires`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `statut_diplome`
--
ALTER TABLE `statut_diplome`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `demandes`
--
ALTER TABLE `demandes`
  ADD CONSTRAINT `demandes_etudiant_cin_foreign` FOREIGN KEY (`etudiant_cin`) REFERENCES `etudiants` (`cin`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `diplomes`
--
ALTER TABLE `diplomes`
  ADD CONSTRAINT `diplomes_demande_id_foreign` FOREIGN KEY (`demande_id`) REFERENCES `demandes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `diplomes_etudiant_cin_foreign` FOREIGN KEY (`etudiant_cin`) REFERENCES `etudiants` (`cin`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `diplomes_statut_id_foreign` FOREIGN KEY (`statut_id`) REFERENCES `statut_diplome` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `permission_user`
--
ALTER TABLE `permission_user`
  ADD CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
