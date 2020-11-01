-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Окт 27 2020 г., 06:00
-- Версия сервера: 10.1.32-MariaDB
-- Версия PHP: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `microblog`
--

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_bin NOT NULL,
  `text` text COLLATE utf8_bin NOT NULL,
  `date` datetime NOT NULL,
  `status` bigint(1) UNSIGNED NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`post_id`, `title`, `text`, `date`, `status`) VALUES
(4, 'Мой первый пост в микробложике', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin laoreet efficitur pretium. In eleifend nunc lectus, sit amet eleifend mauris hendrerit quis. Cras tincidunt nibh sodales condimentum tincidunt. Suspendisse vestibulum luctus enim, et posuere risus blandit in. Sed mollis blandit sem, non molestie purus egestas vel. Sed in efficitur nibh, sed rhoncus leo. Cras tortor purus, ultricies ac enim vitae, euismod condimentum erat. Vivamus at luctus justo. Sed vehicula sollicitudin suscipit. Sed tempus nunc nec ligula aliquam, sit amet luctus lacus euismod. Vestibulum efficitur tincidunt ex a vehicula. Suspendisse et nunc tristique, fringilla quam a, gravida nulla.\r<br>\r<br>Cras fermentum, massa vitae vestibulum accumsan, ipsum nibh tempus ante, rhoncus iaculis leo libero eu lacus. Mauris venenatis at metus consectetur lacinia. Vivamus quis tellus arcu. Praesent sit amet ultrices lectus. Proin ac lorem luctus, imperdiet augue nec, fringilla metus. Duis viverra quis metus at imperdiet. Duis dignissim mauris sed sem scelerisque, sit amet finibus nunc pharetra. Quisque malesuada pulvinar finibus. Donec in enim ex. Cras luctus est non augue semper, ut gravida purus volutpat. Suspendisse finibus odio neque, in suscipit erat maximus eu. Ut varius lorem in lectus sodales, in dapibus ipsum tempus. Maecenas vel eros condimentum, auctor nibh a, maximus quam.\r<br>\r<br>Mauris sit amet est eleifend, auctor sem varius, congue purus. Nulla ultricies volutpat ante, et convallis tellus porta consectetur. Sed tristique lobortis ligula a laoreet. Pellentesque porta sapien lorem, eu pellentesque metus venenatis at. Pellentesque justo tellus, porta sit amet ex non, dignissim vestibulum sapien. Nam dui turpis, tincidunt at vehicula at, tincidunt id felis. Mauris nec gravida quam, eget sagittis mauris. Vestibulum sit amet porta tellus, vel elementum purus. Mauris porttitor fermentum eros, quis consectetur eros placerat at.\r<br>\r<br>Curabitur egestas tincidunt turpis at luctus. Nunc mattis dolor eu arcu finibus, non viverra justo egestas. Proin euismod nisi eu mauris imperdiet, at euismod turpis egestas. Etiam ut lectus rutrum, euismod justo sed, malesuada metus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas sodales ligula vel turpis elementum, a tristique mi sagittis. Sed porttitor ipsum at lectus imperdiet, eu sagittis enim dictum.\r<br>\r<br>Curabitur a euismod neque, a consectetur diam. Nullam pulvinar erat sit amet dui cursus condimentum. Aenean commodo lorem est, et tincidunt turpis sagittis ut. Donec non iaculis nunc. Morbi ornare orci turpis, quis dapibus enim hendrerit at. Sed eleifend quam et ipsum bibendum euismod. Nunc id orci eu mi interdum imperdiet. Nunc vitae ex vitae augue aliquet imperdiet. Praesent a tristique nisl.', '2020-10-27 05:47:10','1');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`),
  ADD UNIQUE KEY `post_id` (`post_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;