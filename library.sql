-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 09, 2018 at 11:51 PM
-- Server version: 5.7.21
-- PHP Version: 7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add user', 2, 'add_user'),
(5, 'Can change user', 2, 'change_user'),
(6, 'Can delete user', 2, 'delete_user'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add permission', 4, 'add_permission'),
(11, 'Can change permission', 4, 'change_permission'),
(12, 'Can delete permission', 4, 'delete_permission'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add user_book', 7, 'add_user_book'),
(20, 'Can change user_book', 7, 'change_user_book'),
(21, 'Can delete user_book', 7, 'delete_user_book'),
(22, 'Can add book', 8, 'add_book'),
(23, 'Can change book', 8, 'change_book'),
(24, 'Can delete book', 8, 'delete_book'),
(25, 'Can add author', 9, 'add_author'),
(26, 'Can change author', 9, 'change_author'),
(27, 'Can delete author', 9, 'delete_author'),
(28, 'Can add category', 10, 'add_category'),
(29, 'Can change category', 10, 'change_category'),
(30, 'Can delete category', 10, 'delete_category'),
(31, 'Can add user_profile', 11, 'add_user_profile'),
(32, 'Can change user_profile', 11, 'change_user_profile'),
(33, 'Can delete user_profile', 11, 'delete_user_profile');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) COLLATE utf8_bin NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8_bin NOT NULL,
  `first_name` varchar(30) COLLATE utf8_bin NOT NULL,
  `last_name` varchar(150) COLLATE utf8_bin NOT NULL,
  `email` varchar(254) COLLATE utf8_bin NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$100000$anwK5YAHD3Hu$c+gQhkCy/nc4WnhIRjR8vM0l3zVafQrc6dJRR059G5M=', '2018-02-09 20:50:35.161015', 1, 'Sarah', 'Sarah', 'Nadrin', 'nadrin@hotmail.com', 1, 1, '2018-02-04 16:35:50.000000'),
(2, 'pbkdf2_sha256$100000$BzaV19qVkiWR$HEUUythLkvOkEB47ek/nrSvbP3C1xye/fGih/WWdvXw=', '2018-02-07 16:53:33.870393', 0, 'Aliaa', 'Aliaa', 'Sayed', 'aliaa@gmail.com', 0, 1, '2018-02-04 16:55:39.000000'),
(3, 'pbkdf2_sha256$100000$leO5QvqnA8Ts$yMenmG7S4UAiRRnIujYHkDWt33SMbOVUejOmiNsFGXk=', NULL, 0, 'Hagar', 'Hagar', 'Abdelwahab', 'hagar@gmail.com', 0, 1, '2018-02-04 16:55:59.000000');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `auth_user_user_permissions`
--

INSERT INTO `auth_user_user_permissions` (`id`, `user_id`, `permission_id`) VALUES
(7, 1, 1),
(8, 1, 2),
(9, 1, 3),
(10, 1, 4),
(11, 1, 5),
(12, 1, 6),
(13, 1, 7),
(14, 1, 8),
(15, 1, 9),
(16, 1, 10),
(17, 1, 11),
(18, 1, 12),
(19, 1, 13),
(20, 1, 14),
(21, 1, 15),
(22, 1, 16),
(23, 1, 17),
(24, 1, 18),
(25, 1, 19),
(26, 1, 20),
(27, 1, 21),
(28, 1, 22),
(29, 1, 23),
(30, 1, 24),
(31, 1, 25),
(32, 1, 26),
(33, 1, 27),
(34, 1, 28),
(35, 1, 29),
(36, 1, 30),
(4, 2, 16),
(5, 2, 17),
(6, 2, 18),
(1, 3, 16),
(2, 3, 17),
(3, 3, 18);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8_bin,
  `object_repr` varchar(200) COLLATE utf8_bin NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2018-02-04 16:55:40.096443', '2', 'Aliaa', 1, '[{"added": {}}]', 2, 1),
(2, '2018-02-04 16:55:59.917138', '3', 'Hagar', 1, '[{"added": {}}]', 2, 1),
(3, '2018-02-04 16:57:57.087713', '3', 'Hagar', 2, '[{"changed": {"fields": ["first_name", "last_name", "email", "user_permissions"]}}]', 2, 1),
(4, '2018-02-04 16:58:58.384960', '2', 'Aliaa', 2, '[{"changed": {"fields": ["first_name", "last_name", "email", "user_permissions"]}}]', 2, 1),
(5, '2018-02-04 17:00:39.948879', '1', 'Sarah', 2, '[{"changed": {"fields": ["username", "first_name", "last_name", "user_permissions"]}}]', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) COLLATE utf8_bin NOT NULL,
  `model` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(4, 'auth', 'permission'),
(2, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(9, 'library', 'author'),
(8, 'library', 'book'),
(10, 'library', 'category'),
(7, 'library', 'user_book'),
(11, 'library', 'user_profile'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) COLLATE utf8_bin NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2018-02-04 15:48:51.048553'),
(2, 'auth', '0001_initial', '2018-02-04 15:48:59.685842'),
(3, 'admin', '0001_initial', '2018-02-04 15:49:01.527285'),
(4, 'admin', '0002_logentry_remove_auto_add', '2018-02-04 15:49:01.583131'),
(5, 'contenttypes', '0002_remove_content_type_name', '2018-02-04 15:49:02.700626'),
(6, 'auth', '0002_alter_permission_name_max_length', '2018-02-04 15:49:03.415715'),
(7, 'auth', '0003_alter_user_email_max_length', '2018-02-04 15:49:04.197918'),
(8, 'auth', '0004_alter_user_username_opts', '2018-02-04 15:49:04.261689'),
(9, 'auth', '0005_alter_user_last_login_null', '2018-02-04 15:49:04.854164'),
(10, 'auth', '0006_require_contenttypes_0002', '2018-02-04 15:49:04.888757'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2018-02-04 15:49:04.938206'),
(12, 'auth', '0008_alter_user_username_max_length', '2018-02-04 15:49:06.508863'),
(13, 'auth', '0009_alter_user_last_name_max_length', '2018-02-04 15:49:07.221307'),
(14, 'library', '0001_initial', '2018-02-04 15:49:10.572774'),
(15, 'library', '0002_auto_20180204_1259', '2018-02-04 15:49:13.221338'),
(16, 'library', '0003_author_follow', '2018-02-04 15:49:15.356259'),
(17, 'library', '0004_category_favourite', '2018-02-04 15:49:17.564676'),
(18, 'library', '0005_auto_20180204_1339', '2018-02-04 15:49:19.452466'),
(19, 'library', '0006_auto_20180204_1341', '2018-02-04 15:49:20.712759'),
(20, 'library', '0007_auto_20180204_1436', '2018-02-04 15:49:21.831083'),
(21, 'sessions', '0001_initial', '2018-02-04 15:49:22.566956'),
(22, 'library', '0008_user_profile', '2018-02-07 14:42:37.109453'),
(23, 'library', '0009_auto_20180207_1442', '2018-02-07 14:42:37.203116');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_bin NOT NULL,
  `session_data` longtext COLLATE utf8_bin NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('fv17dk5azaulnx6089t8ya9rf3qq8zz8', 'M2Q3YTA4MjcxZWJjNDZhZWZhYTQ5ZGQ4YzJhY2U1NTg1ODM2OTQ4Mzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmU3MGE0MzJhYzYyYTE4ZmIwYThhMWUzOGUwYzc2M2ZhYTE2MjU0MiIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-02-23 18:01:21.063878');

-- --------------------------------------------------------

--
-- Table structure for table `library_author`
--

CREATE TABLE `library_author` (
  `author_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `date_of_birth` date NOT NULL,
  `date_of_die` date NOT NULL,
  `contact` varchar(100) COLLATE utf8_bin NOT NULL,
  `bio` longtext COLLATE utf8_bin NOT NULL,
  `img` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `library_author`
--

INSERT INTO `library_author` (`author_id`, `name`, `date_of_birth`, `date_of_die`, `contact`, `bio`, `img`) VALUES
(1, 'Naguib Mahfouz', '1911-11-11', '2006-08-30', '99999999', 'Naguib Mahfouz was an Egyptian writer who won the 1988 Nobel Prize for Literature. He is regarded as one of the first contemporary writers of Arabic literature, along with Tawfiq el-Hakim, to explore themes of existentialism', 'author_img/naguib_mahfouz.jpg'),
(2, 'Agatha Christie', '1890-09-15', '1976-01-12', '8888888888', 'Dame Agatha Mary Clarissa Christie, Lady Mallowan, DBE (née Miller; 15 September 1890 - 12 January 1976) was an English writer. She is known for her 66 detective novels and 14 short story collections', 'author_img/agatha_christie.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `library_author_follow`
--

CREATE TABLE `library_author_follow` (
  `id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `library_book`
--

CREATE TABLE `library_book` (
  `book_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `published_at` date NOT NULL,
  `summary` longtext COLLATE utf8_bin NOT NULL,
  `country` varchar(50) COLLATE utf8_bin NOT NULL,
  `link` varchar(200) COLLATE utf8_bin NOT NULL,
  `author_id_id` int(11) NOT NULL,
  `img` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `library_book`
--

INSERT INTO `library_book` (`book_id`, `name`, `published_at`, `summary`, `country`, `link`, `author_id_id`, `img`) VALUES
(1, 'Sleeping Murder', '1976-01-01', 'Sleeping Murder: Miss Marple\'s Last Case is a work of detective fiction by Agatha Christie and first published in the UK by the Collins Crime Club in October 1976 and in the US by Dodd, Mead and Company later in the same year. The UK edition retailed for £3.50 and the US edition for $7.95.', 'UK', 'www.sleepingmurder.com', 2, 'book_img/sleeping_murder.jpg'),
(2, 'Palace Walk', '1987-02-01', 'ZNCXjNJZCxnjNZCJ', 'Egypt', 'www.chasedbythedogs.con', 1, 'book_img/palace_walk.jpeg'),
(3, 'Midaq alley', '1947-08-01', 'Midaq Alley is the English Translation of Zuqāq al-Midaq by Naguib Mahfouz, released in English in 1966. The story is about Midaq Alley, a teeming back street in Cairo which is a microcosm of the world', 'Egypt', 'www.Midaqalley.com', 1, 'book_img/midaq_alley.jpeg'),
(4, 'Sugar Street:The Cairo Trilogy', '1957-02-14', 'Al-Sukkariyya, is named after the street where his daughter Khadijah and her family live.', 'Egypt', 'www.sugarstreet.com', 1, 'book_img/sugar_street.jpg'),
(5, 'The Harafish', '1977-02-04', ' It comprises a series of episodes in a dozen generations of a family from the Egyptian urban rabble (the "harafish"). Many of the members of this family become clan chiefs in an alley in the city; some of them are benefactors to the other members of the harafish; some are more corrupt. Neither the location within Egypt nor the time of the events is ever identified.', 'Egypt', 'www.theharafish.com', 1, 'book_img/the_harafish.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `library_category`
--

CREATE TABLE `library_category` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `library_category`
--

INSERT INTO `library_category` (`cat_id`, `cat_name`) VALUES
(1, 'Romance'),
(2, 'horror'),
(3, 'drama'),
(4, 'Mystery'),
(5, 'Science fiction');

-- --------------------------------------------------------

--
-- Table structure for table `library_category_book`
--

CREATE TABLE `library_category_book` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `library_category_book`
--

INSERT INTO `library_category_book` (`id`, `category_id`, `book_id`) VALUES
(1, 3, 2),
(2, 3, 3),
(4, 3, 4),
(5, 3, 5),
(3, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `library_category_favourite`
--

CREATE TABLE `library_category_favourite` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `library_category_favourite`
--

INSERT INTO `library_category_favourite` (`id`, `category_id`, `user_id`) VALUES
(1, 3, 1),
(2, 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `library_user_book`
--

CREATE TABLE `library_user_book` (
  `id` int(11) NOT NULL,
  `rate` int(11) DEFAULT NULL,
  `status` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `book_id_id` int(11) NOT NULL,
  `user_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `library_user_book`
--

INSERT INTO `library_user_book` (`id`, `rate`, `status`, `book_id_id`, `user_id_id`) VALUES
(1, 3, 'read', 2, 1),
(2, 2, 'read', 2, 2),
(3, 2, 'read', 3, 1),
(4, 3, 'read', 1, 1),
(5, 1, NULL, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `library_user_profile`
--

CREATE TABLE `library_user_profile` (
  `id` int(11) NOT NULL,
  `img` varchar(100) COLLATE utf8_bin NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `library_user_profile`
--

INSERT INTO `library_user_profile` (`id`, `img`, `user_id`) VALUES
(1, 'user_img/photo_2.png', 1),
(2, 'user_img/photo_7.png', 2),
(3, 'user_img/photo_6.png', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `library_author`
--
ALTER TABLE `library_author`
  ADD PRIMARY KEY (`author_id`);

--
-- Indexes for table `library_author_follow`
--
ALTER TABLE `library_author_follow`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `library_author_follow_author_id_user_id_6d2ed274_uniq` (`author_id`,`user_id`),
  ADD KEY `library_author_follow_user_id_994c9fda_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `library_book`
--
ALTER TABLE `library_book`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `library_book_author_id_id_0bba8a43_fk_library_author_author_id` (`author_id_id`);

--
-- Indexes for table `library_category`
--
ALTER TABLE `library_category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `library_category_book`
--
ALTER TABLE `library_category_book`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `library_category_category_book_category_id_book_id_7f253eaf_uniq` (`category_id`,`book_id`),
  ADD KEY `library_category_book_book_id_49b8b6a3_fk_library_book_book_id` (`book_id`);

--
-- Indexes for table `library_category_favourite`
--
ALTER TABLE `library_category_favourite`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `library_category_favourite_category_id_user_id_b437d54a_uniq` (`category_id`,`user_id`),
  ADD KEY `library_category_favourite_user_id_beecb5fb_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `library_user_book`
--
ALTER TABLE `library_user_book`
  ADD PRIMARY KEY (`id`),
  ADD KEY `library_user_book_book_id_id_01f2f226_fk_library_book_book_id` (`book_id_id`),
  ADD KEY `library_user_book_user_id_id_f6f85264_fk_auth_user_id` (`user_id_id`);

--
-- Indexes for table `library_user_profile`
--
ALTER TABLE `library_user_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `library_author`
--
ALTER TABLE `library_author`
  MODIFY `author_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `library_author_follow`
--
ALTER TABLE `library_author_follow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `library_book`
--
ALTER TABLE `library_book`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `library_category`
--
ALTER TABLE `library_category`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `library_category_book`
--
ALTER TABLE `library_category_book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `library_category_favourite`
--
ALTER TABLE `library_category_favourite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `library_user_book`
--
ALTER TABLE `library_user_book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `library_user_profile`
--
ALTER TABLE `library_user_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `library_author_follow`
--
ALTER TABLE `library_author_follow`
  ADD CONSTRAINT `library_author_follo_author_id_ed84d80c_fk_library_a` FOREIGN KEY (`author_id`) REFERENCES `library_author` (`author_id`),
  ADD CONSTRAINT `library_author_follow_user_id_994c9fda_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `library_book`
--
ALTER TABLE `library_book`
  ADD CONSTRAINT `library_book_author_id_id_0bba8a43_fk_library_author_author_id` FOREIGN KEY (`author_id_id`) REFERENCES `library_author` (`author_id`);

--
-- Constraints for table `library_category_book`
--
ALTER TABLE `library_category_book`
  ADD CONSTRAINT `library_category_boo_category_id_8530f568_fk_library_c` FOREIGN KEY (`category_id`) REFERENCES `library_category` (`cat_id`),
  ADD CONSTRAINT `library_category_book_book_id_49b8b6a3_fk_library_book_book_id` FOREIGN KEY (`book_id`) REFERENCES `library_book` (`book_id`);

--
-- Constraints for table `library_category_favourite`
--
ALTER TABLE `library_category_favourite`
  ADD CONSTRAINT `library_category_fav_category_id_efdc7b65_fk_library_c` FOREIGN KEY (`category_id`) REFERENCES `library_category` (`cat_id`),
  ADD CONSTRAINT `library_category_favourite_user_id_beecb5fb_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `library_user_book`
--
ALTER TABLE `library_user_book`
  ADD CONSTRAINT `library_user_book_book_id_id_01f2f226_fk_library_book_book_id` FOREIGN KEY (`book_id_id`) REFERENCES `library_book` (`book_id`),
  ADD CONSTRAINT `library_user_book_user_id_id_f6f85264_fk_auth_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `library_user_profile`
--
ALTER TABLE `library_user_profile`
  ADD CONSTRAINT `library_user_profile_user_id_552992a5_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
