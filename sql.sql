-- phpMyAdmin SQL Dump
-- version 4.0.10.6
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 16 2018 г., 20:53
-- Версия сервера: 5.5.41-log
-- Версия PHP: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `onzbot`
--

-- --------------------------------------------------------

--
-- Структура таблицы `bot`
--

CREATE TABLE IF NOT EXISTS `bot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(225) COLLATE utf8_unicode_ci NOT NULL,
  `money` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `user` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `channel` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `group` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `supergroup` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `admin` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `inmoney` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `outmoney` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `money_ref` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `bot`
--

INSERT INTO `bot` (`id`, `login`, `name`, `money`, `user`, `channel`, `group`, `supergroup`, `admin`, `inmoney`, `outmoney`, `money_ref`) VALUES
(1, 'Onzbot', 'Ishlab top', '2500', '425', '17', '0', '0', '2', '700.6', '283.7', '0');

-- --------------------------------------------------------

--
-- Структура таблицы `channel`
--

CREATE TABLE IF NOT EXISTS `channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `login` varchar(225) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `sana` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `creator` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `creator_id` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `join` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `join_id` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `money` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `regcount` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `count` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `inuser` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `outuser` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `demo` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=28 ;

--
-- Дамп данных таблицы `channel`
--

INSERT INTO `channel` (`id`, `uid`, `login`, `title`, `link`, `sana`, `creator`, `creator_id`, `join`, `join_id`, `money`, `regcount`, `count`, `inuser`, `outuser`, `demo`) VALUES
(19, '', 'https', '', '', '1520845577', '', '', 'Ð¯ Ñ‚Ð²Ð¾Ð¹ Ð¿Ð°Ñ…Ð°Ð½ ', '198492023', '0', '0', '0', '0', '0', '1'),
(11, '-1001070132062', 'yurtboshim', 'ÐŽÐ·Ð±ÐµÐºÐ¸ÑÑ‚Ð¾Ð½âœ…', '', '1520792493', '', '', 'Ð’.Ð˜.Ð” Ð£Ð· ', '209852095', '0', '200', '116', '0', '0', '0'),
(12, '-1001175265761', 'pultopishsirlari', 'ÐŸÑƒÐ» Ñ‚Ð¾Ð¿Ð¸Ñˆ ÑÐ¸Ñ€Ð»Ð°Ñ€Ð¸', '', '1520792664', '', '', 'Ð’.Ð˜.Ð” Ð£Ð· ', '209852095', '0', '50', '0', '0', '0', '0'),
(13, '-1001133525570', 'huquqiy_axborot', 'Huquqiy Axborot', '', '1520831184', '', '', 'Ð’.Ð˜.Ð” Ð£Ð· ', '209852095', '0', '250', '187', '0', '0', '0'),
(15, '-1001056610936', 'droidfan', 'Android informed + APP', '', '1520832514', '', '', 'eFeDe3 Â°', '75643804', '0', '2', '0', '0', '0', '0'),
(16, '', '222', '', '', '1520833742', '', '', 'ÐžÐ¼Ð°Ð´ ', '222', '0', '0', '0', '0', '0', '1'),
(17, '', '1111', '', '', '1520835023', '', '', 'Pavel Durov', '1111', '0', '0', '0', '0', '0', '1'),
(18, '', 'uzbkulgu', '', '', '1520835066', '', '', 'Pavel Durov', '400249350', '0', '0', '0', '0', '0', '1'),
(20, '', 'xakercom', '', '', '1520943125', '', '', 'Ð¯ Ñ‚Ð²Ð¾Ð¹ Ð¿Ð°Ñ…Ð°Ð½ ', '198492023', '0', '0', '0', '0', '0', '1'),
(21, '', 'tgkanaln1', '', '', '1520943870', '', '', 'Ð¯ Ñ‚Ð²Ð¾Ð¹ Ð¿Ð°Ñ…Ð°Ð½ ', '198492023', '0', '0', '0', '0', '0', '1'),
(22, '', 'uz_hacker', '', '', '1521052524', '', '', 'â–“â–ˆâ–ˆâ–“â–“ â™š É¢eÉ´eÊ€aÊŸ â™š â–“â–“â–ˆâ–ˆâ–“ ', '233489969', '0', '0', '0', '0', '0', '1'),
(23, '', 'real', '', '', '1521055948', '', '', 'Ð¼Ð°Ð¼ÑƒÑ€ ', '300084373', '0', '0', '0', '0', '0', '1'),
(24, '', 'doda_prikol', '', '', '1521056605', '', '', 'Creator Admin', '489739082', '0', '0', '0', '0', '0', '1'),
(25, '', 'oox_uz', '', '', '1521076316', '', '', 'Xojiakbar ', '356697226', '0', '0', '0', '0', '0', '1'),
(26, '-1001114429886', 'yurtdoshim', 'ÐŽÐ·Ð±ÐµÐºÐ¸ÑÑ‚Ð¾Ð½', '', '1521121481', '', '', 'Ð’.Ð˜.Ð” Ð£Ð· ', '209852095', '0', '500', '483', '0', '0', '0'),
(27, '', 'vilmaxtr', '', '', '1521127344', '', '', 'Vilmax trader ', '359931197', '0', '0', '0', '0', '0', '1');

-- --------------------------------------------------------

--
-- Структура таблицы `group`
--

CREATE TABLE IF NOT EXISTS `group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `login` varchar(225) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `sana` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `creator` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `creator_id` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `join` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `join_id` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `supergroup`
--

CREATE TABLE IF NOT EXISTS `supergroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `login` varchar(225) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `sana` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `creator` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `creator_id` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `join` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `join_id` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `text`
--

CREATE TABLE IF NOT EXISTS `text` (
  `id` int(10) unsigned NOT NULL,
  `payme` mediumtext NOT NULL,
  `rules` mediumtext NOT NULL,
  `chat` mediumtext NOT NULL,
  `qiwi` mediumtext NOT NULL,
  `webmoney` mediumtext NOT NULL,
  `advcash` mediumtext NOT NULL,
  `in` mediumtext NOT NULL,
  `in2` mediumtext NOT NULL,
  `in3` mediumtext NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `text`
--

INSERT INTO `text` (`id`, `payme`, `rules`, `chat`, `qiwi`, `webmoney`, `advcash`, `in`, `in2`, `in3`) VALUES
(1, '\nKarta: 8600 0000 0000 0000\n\nAdmin: @idFox\n\n', 'ðŸ”·+0.30 Ñ€ÑƒÐ± Ð·Ð° Ð¿Ð¾Ð´Ð¿Ð¸ÑÐºÑƒðŸ”·\nðŸ’Ž+0.30 Ñ€ÑƒÐ±Ð»ÐµÐ¹ Ð·Ð° Ñ€ÐµÐ³Ð¸ÑÑ‚Ñ€Ð°Ñ†Ð¸ÑŽ Ñ€ÐµÑ„ÐµÑ€Ð°Ð»Ð°ðŸ’Ž\n\nðŸ“ˆ Ð Ð°ÑÑ†ÐµÐ½ÐºÐ¸ Ð½Ð° Ñ€ÐµÐºÐ»Ð°Ð¼ÑƒðŸ“ˆ\nðŸ”·+0.5 Ñ€ÑƒÐ± Ð·Ð° Ð¿Ð¾Ð´Ð¿Ð¸ÑÑ‡Ð¸ÐºÐ°ðŸ”·\n\nðŸ˜ŽÐ ÐµÐºÐ»Ð°Ð¼Ð°Ð´Ð°Ñ‚ÐµÐ»ÑÐ¼\n \nâ—ï¸Ð—ÐÐŸÐ Ð•Ð©Ð•ÐÐž:\n\nðŸ“ŽÐ Ð°Ð·Ð¼ÐµÑ‰Ð°Ñ‚ÑŒ ÐºÐ°Ð½Ð°Ð»Ñ‹ Ð¼Ð¾ÑˆÐµÐ½Ð½Ð¸Ñ‡ÐµÑÑ‚Ð²Ð°, Ð¸ Ð³Ñ€ÑƒÐ¿Ð¿Ñ‹ Ñ Ð¿Ñ€Ð¾Ð¿Ð°Ð³Ð°Ð½Ð´Ð¾Ð¹ Ð½Ð°Ñ€ÐºÐ¾Ñ‚Ð¸ÐºÐ¾Ð² Ð¸ Ñ‚ÐµÑ€Ñ€Ð¾Ñ€Ð¸Ð·Ð¼Ð°, Ð° Ñ‚Ð°ÐºÐ¶Ðµ Ð³Ñ€ÑƒÐ¿Ð¿Ñ‹ Ð¾ÐºÐ°Ð·Ñ‹Ð²Ð°ÑŽÑ‰Ð¸Ðµ Ð½ÐµÐ³Ð°Ñ‚Ð¸Ð²Ð½Ð¾Ðµ Ð¿ÑÐ¸Ñ…Ð¾Ð»Ð¾Ð³Ð¸Ñ‡ÐµÑÐºÐ¾Ðµ Ð²Ð¾Ð·Ð´ÐµÐ¹ÑÑ‚Ð²Ð¸Ðµ.\nðŸ“ŽÐŸÐ¾ÑÐ»Ðµ Ð·Ð°ÐºÐ°Ð·Ð° ÑƒÐ±Ð¸Ñ€Ð°Ñ‚ÑŒ Ð¿Ñ€Ð°Ð²Ð° Ñƒ Ð±Ð¾Ñ‚Ð°;\n \nðŸ“ŽÐŸÑ€Ð°Ð²Ð° Ñƒ Ð±Ð¾Ñ‚Ð° Ð¼Ð¾Ð¶Ð½Ð¾ ÑƒÐ±Ñ€Ð°Ñ‚ÑŒ Ð¿Ð¾ÑÐ»Ðµ Ð¾ÐºÐ¾Ð½Ñ‡Ð°Ð½Ð¸Ñ Ð·Ð°ÐºÐ°Ð·Ð°.', 'ÐŸÑ€Ð¸ÑÐ¾ÐµÐ´Ð¸Ð½ÑÐ¹Ñ‚ÐµÑÑŒ Ðº Ð½Ð°Ð¼\n\nhttps://telegram.me/joinchat/AAAAAEYNIeEWzCJSk-1qqQ', 'ÐŸÐ¾ÑÐ»Ðµ Ð¿Ð»Ð°Ñ‚ÐµÐ¶Ð° Ð±Ð°Ð»Ð°Ð½Ñ Ð¿Ð¾Ð¿Ð¾Ð»Ð½Ð¸Ñ‚ÑÑ Ð·Ð° 1 Ð¼Ð¸Ð½ÑƒÑ‚Ñƒ. Ð’Ð°Ð¼ Ð¿Ñ€Ð¸Ð´ÐµÑ‚ ÑÐ¾Ð¾Ð±Ñ‰ÐµÐ½Ð¸Ðµ.\n\nÐ”Ð»Ñ Ð¿Ð¾Ð¿Ð¾Ð»Ð½ÐµÐ½Ð¸Ñ Ð’Ð°ÑˆÐµÐ³Ð¾ Ð±Ð°Ð»Ð°Ð½ÑÐ° Ð¿ÐµÑ€ÐµÐ²ÐµÐ´Ð¸Ñ‚Ðµ Ð½ÑƒÐ¶Ð½ÑƒÑŽ ÑÑƒÐ¼Ð¼Ñƒ Ð½Ð° ÐºÐ¾ÑˆÐµÐ»ÐµÐº Qiwi +79630290668\nÐ’ ÐºÐ¾Ð¼Ð¼ÐµÐ½Ñ‚Ð°Ñ€Ð¸Ð¸ Ð¿Ð»Ð°Ñ‚ÐµÐ¶Ð° ÐžÐ‘Ð¯Ð—ÐÐ¢Ð•Ð›Ð¬ÐÐž Ð½Ð°Ð¿Ð¸ÑˆÐ¸Ñ‚Ðµ Ñ‡Ð¸ÑÐ»Ð¾:', 'ÐŸÐ¾ÑÐ»Ðµ Ð¿Ð»Ð°Ñ‚ÐµÐ¶Ð° Ð±Ð°Ð»Ð°Ð½Ñ Ð¿Ð¾Ð¿Ð¾Ð»Ð½Ð¸Ñ‚ÑÑ Ð·Ð° 1 Ð¼Ð¸Ð½ÑƒÑ‚Ñƒ. Ð’Ð°Ð¼ Ð¿Ñ€Ð¸Ð´ÐµÑ‚ ÑÐ¾Ð¾Ð±Ñ‰ÐµÐ½Ð¸Ðµ.\n\nÐ”Ð»Ñ Ð¿Ð¾Ð¿Ð¾Ð»Ð½ÐµÐ½Ð¸Ñ Ð’Ð°ÑˆÐµÐ³Ð¾ Ð±Ð°Ð»Ð°Ð½ÑÐ° Ð¿ÐµÑ€ÐµÐ²ÐµÐ´Ð¸Ñ‚Ðµ Ð½ÑƒÐ¶Ð½ÑƒÑŽ ÑÑƒÐ¼Ð¼Ñƒ Ð½Ð° ÐºÐ¾ÑˆÐµÐ»ÐµÐº Payeer P90732796\nÐ’ ÐºÐ¾Ð¼Ð¼ÐµÐ½Ñ‚Ð°Ñ€Ð¸Ð¸ Ð¿Ð»Ð°Ñ‚ÐµÐ¶Ð° ÐžÐ‘Ð¯Ð—ÐÐ¢Ð•Ð›Ð¬ÐÐž Ð½Ð°Ð¿Ð¸ÑˆÐ¸Ñ‚Ðµ Ñ‡Ð¸ÑÐ»Ð¾:', 'ÐŸÐ¾ÑÐ»Ðµ Ð¿Ð»Ð°Ñ‚ÐµÐ¶Ð° Ð±Ð°Ð»Ð°Ð½Ñ Ð¿Ð¾Ð¿Ð¾Ð»Ð½Ð¸Ñ‚ÑÑ Ð·Ð° 1 Ð¼Ð¸Ð½ÑƒÑ‚Ñƒ. Ð’Ð°Ð¼ Ð¿Ñ€Ð¸Ð´ÐµÑ‚ ÑÐ¾Ð¾Ð±Ñ‰ÐµÐ½Ð¸Ðµ.\n\nÐ”Ð»Ñ Ð¿Ð¾Ð¿Ð¾Ð»Ð½ÐµÐ½Ð¸Ñ Ð’Ð°ÑˆÐµÐ³Ð¾ Ð±Ð°Ð»Ð°Ð½ÑÐ° Ð¿ÐµÑ€ÐµÐ²ÐµÐ´Ð¸Ñ‚Ðµ Ð½ÑƒÐ¶Ð½ÑƒÑŽ ÑÑƒÐ¼Ð¼Ñƒ Ð½Ð° ÐºÐ¾ÑˆÐµÐ»ÐµÐº AdvCash shoxkuolov@gmail.com\nÐ’ ÐºÐ¾Ð¼Ð¼ÐµÐ½Ñ‚Ð°Ñ€Ð¸Ð¸ Ð¿Ð»Ð°Ñ‚ÐµÐ¶Ð° ÐžÐ‘Ð¯Ð—ÐÐ¢Ð•Ð›Ð¬ÐÐž Ð½Ð°Ð¿Ð¸ÑˆÐ¸Ñ‚Ðµ Ñ‡Ð¸ÑÐ»Ð¾:', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `login` varchar(225) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(225) COLLATE utf8_unicode_ci NOT NULL,
  `time` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `lan` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'uz',
  `ref` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `referal` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `admin` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `money` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `joinn` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `money_join` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `money_ref` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `outn` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `inmoney` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `outmoney` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `token` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `timezona` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=368 ;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `uid`, `login`, `name`, `time`, `lan`, `ref`, `referal`, `admin`, `money`, `joinn`, `money_join`, `money_ref`, `outn`, `inmoney`, `outmoney`, `token`, `timezona`) VALUES
(1, '75643804', 'idFox', '', '1520279695', 'uz', '0', 'https://telegram.me/OnZBot?start=75643804', '0', '5', '1', '0.3', '0', '0', '0', '11', '0', '+5'),
(2, '209852095', 'viduz', 'Ð’.Ð˜.Ð” Ð£Ð· ', '1520304992', 'uz', '125', 'https://telegram.me/OnZBot?start=209852095', '0', '1699.8', '1', '0.3', '37.5', '0', '0', '138', '0', '+5'),
(3, '345290371', 'JamWId_AmaqI', 'á´Šá´€á´á´¡Éªá´… á´€á´á´€Ç«Éª [CeUz]â„¢ ', '1520306872', 'uz', '0', 'https://telegram.me/OnZBot?start=345290371', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(4, '368844346', 'ads_buy', 'Ð ÐµÐºÐ»Ð°Ð¼Ð° &#8593;', '1520321517', 'uz', '0', 'https://telegram.me/OnZBot?start=368844346', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(5, '95532882', 'ceo_uz', 'á… á… á… á… á… á…  #blackhat [InSoft]', '1520331140', 'uz', '0', 'https://telegram.me/OnZBot?start=95532882', '0', '0.3', '0', '0.3', '0', '0', '0', '0', '0', '+5'),
(6, '485299189', 'inve100r', 'Inve100r ', '1520333511', 'uz', '0', 'https://telegram.me/OnZBot?start=485299189', '0', '0.3', '1', '0.3', '0', '0', '0', '0', '0', '+5'),
(7, '491739221', 'CODERuz', '#coderuz ', '1520333680', 'uz', '0', 'https://telegram.me/OnZBot?start=491739221', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(8, '346693875', 'anvarjon_coder', '#ÐÐ½Ð²Ð°Ñ€Ð¶Ð¾Ð½ ðŸ‘‘ ', '1520335574', 'uz', '0', 'https://telegram.me/OnZBot?start=346693875', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(9, '429863039', 'MONSTER_RU', 'MA_X ', '1520350701', 'uz', '0', 'https://telegram.me/OnZBot?start=429863039', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(10, '83582295', '', 'Ð”ÐµÑ‚ÐºÐ° Ð½Ð° ÑÐ°Ð¹Ñ‚Ðµ!! ', '1520350862', 'uz', '0', 'https://telegram.me/OnZBot?start=83582295', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(12, '277571215', 'BC221', 'â™”Î¡resÎ¹deÎ·Ñ‚|TASÂ° ', '1520505379', 'uz', '0', 'https://telegram.me/OnZBot?start=277571215', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(11, '172923880', 'TheRustamovs', 'D.R. ', '1520440412', 'uz', '0', 'https://telegram.me/OnZBot?start=172923880', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(15, '200255531', 'SHOXPRODUCTION', 'SÌ¶ÊœâœªXÌ¶á´˜Æ¦Ì¶oÌ¶á´…á´œá´„á´›ÉªâœªÉ´ ', '1520833459', 'uz', '0', 'https://telegram.me/OnZBot?start=200255531', '0', '0.3', '1', '0.3', '0', '0', '0', '0', '0', '+5'),
(13, '161489401', 'Susibobo', 'Sunnat ', '1520705883', 'uz', '66', 'https://telegram.me/OnZBot?start=161489401', '0', '6', '3', '0.9', '19.8', '0', '0', '10.1', '0', '+5'),
(14, '310850754', 'Shoxolov', 'Ð¨Ð¾Ñ…Ñ€ÑƒÑ… (Ñ…Ð° ÑžÑˆÐ°)', '1520787986', 'uz', '0', 'https://telegram.me/OnZBot?start=310850754', '0', '0.3', '1', '0.3', '0', '0', '0', '100', '0', '+5'),
(16, '279322368', '', 'Ð Ð› Ð˜ Ðœ Ð Ð  Ð” Ðž Ð', '1520833465', 'uz', '0', 'https://telegram.me/OnZBot?start=279322368', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(17, '467878372', 'Feride_Princessa_0208', 'Princessa ', '1520833493', 'uz', '0', 'https://telegram.me/OnZBot?start=467878372', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(18, '183993568', 'KinG906', 'âœº â”„à¦…à¦ à¦‡â™š â‚­Î¹Î·É¢ â™šà¦ à¦…â”„ âœº ', '1520833496', 'uz', '0', 'https://telegram.me/OnZBot?start=183993568', '0', '0.3', '1', '0.3', '0', '0', '0', '0', '0', '+5'),
(19, '474682971', '', 'Islom ', '1520833522', 'uz', '1', 'https://telegram.me/OnZBot?start=474682971', '0', '0.9', '2', '0.6', '0.3', '0', '0', '0', '0', '+5'),
(20, '490735082', '', 'ÐÐ¹Ð³ÑƒÐ»ÑŒ ÐœÐ°Ñ…Ð¼ÑƒÐ´Ð¾Ð²Ð°', '1520833553', 'uz', '0', 'https://telegram.me/OnZBot?start=490735082', '0', '0.3', '1', '0.3', '0', '0', '0', '0', '0', '+5'),
(21, '442780491', '', 'ÐžÐ¼Ð°Ð´ ', '1520833559', 'uz', '0', 'https://telegram.me/OnZBot?start=442780491', '0', '0.3', '1', '0.3', '0', '0', '0', '0', '0', '+5'),
(22, '296756238', '', 'Ð¤Ðš Ð‘ÐÐ Ð¡Ð•Ð›ÐžÐÐ', '1520833592', 'uz', '0', 'https://telegram.me/OnZBot?start=296756238', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(23, '51922376', 'farxod737', 'Ð¤Ð°Ñ€Ñ…Ð¾Ð´ Ð¡Ð°Ð´Ð¸ÐºÐ¾Ð²', '1520833610', 'uz', '1', 'https://telegram.me/OnZBot?start=51922376', '0', '0.3', '0', '0', '0.3', '0', '0', '0', '0', '+5'),
(24, '210092316', '', 'ILHOMJON JAMOLOV', '1520833637', 'uz', '0', 'https://telegram.me/OnZBot?start=210092316', '0', '0.3', '1', '0.3', '0', '0', '0', '0', '0', '+5'),
(25, '160150703', 'JakongirXolbayev', 'Jakhongir Kholbaev', '1520833645', 'uz', '0', 'https://telegram.me/OnZBot?start=160150703', '0', '0.3', '1', '0.3', '0', '0', '0', '0', '0', '+5'),
(40, '566375907', '', 'Ð£Ð¼Ð¸Ð´Ð¶Ð¾Ð½ ÐÐ»Ð¶Ð¾Ð½Ð¾Ð²', '1520834185', 'uz', '0', 'https://telegram.me/OnZBot?start=566375907', '0', '0.9', '3', '0.9', '0', '0', '0', '0', '0', '+5'),
(26, '321089922', '', 'ÐÐžÐ”Ð˜Ð Ð‘Ð•Ðš Ð ÐÐ¨Ð˜Ð”ÐžÐ’', '1520833654', 'uz', '0', 'https://telegram.me/OnZBot?start=321089922', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(27, '484713694', '', 'mirkomolova gavxarxon', '1520833658', 'uz', '0', 'https://telegram.me/OnZBot?start=484713694', '0', '0.3', '1', '0.3', '0', '0', '0', '0', '0', '+5'),
(28, '182197088', 'united83', 'Rustam ', '1520833696', 'uz', '0', 'https://telegram.me/OnZBot?start=182197088', '0', '0.3', '1', '0.3', '0', '0', '0', '0', '0', '+5'),
(29, '82536304', 'anvarbekovjamshid', 'Anvarbekov Jamshidbek', '1520833793', 'uz', '0', 'https://telegram.me/OnZBot?start=82536304', '0', '0.6', '2', '0.6', '0', '0', '0', '0', '0', '+5'),
(30, '447437232', '', 'Muhamadjon ', '1520833837', 'uz', '0', 'https://telegram.me/OnZBot?start=447437232', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(31, '398643062', '', 'Baby LoveðŸ’‘ðŸ’‘', '1520833884', 'uz', '0', 'https://telegram.me/OnZBot?start=398643062', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(32, '430129089', '', 'Islombek Mardonov', '1520833889', 'uz', '0', 'https://telegram.me/OnZBot?start=430129089', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(33, '479667747', '', 'Abdimurodov Behzodjon', '1520833984', 'uz', '0', 'https://telegram.me/OnZBot?start=479667747', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(34, '466709786', '', 'Tel Mony', '1520833991', 'uz', '0', 'https://telegram.me/OnZBot?start=466709786', '0', '0.9', '3', '0.9', '0', '0', '0', '0', '0', '+5'),
(35, '298743598', 'ghaniyev_official', 'â­â­â­Ð”Ð°Ñ€Ð¼ÐµÐ½ Ð“Ð°Ð½Ð¸ÐµÐ²â­â­â­', '1520833999', 'uz', '0', 'https://telegram.me/OnZBot?start=298743598', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(36, '244122998', 'SitakoV8474', 'Umidbek ', '1520834050', 'uz', '0', 'https://telegram.me/OnZBot?start=244122998', '0', '0.3', '1', '0.3', '0', '0', '0', '0', '0', '+5'),
(37, '429560610', '', 'USMON KHON', '1520834144', 'uz', '0', 'https://telegram.me/OnZBot?start=429560610', '0', '0.6', '2', '0.6', '0', '0', '0', '0', '0', '+5'),
(38, '155681588', '', 'Nizomiddin ', '1520834182', 'uz', '0', 'https://telegram.me/OnZBot?start=155681588', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(39, '401090919', 'R_Jasurbek', 'Jasurbek ', '1520834184', 'uz', '0', 'https://telegram.me/OnZBot?start=401090919', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(41, '439294630', 'Muzaffar0308', 'Muzaffar Qudaybergenov', '1520834230', 'uz', '0', 'https://telegram.me/OnZBot?start=439294630', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(42, '322913317', '', 'Farhodjon ', '1520834237', 'uz', '0', 'https://telegram.me/OnZBot?start=322913317', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(43, '413788639', 'MachoBY', 'â“¢â“â“›â“â“œâ“â“£ ', '1520834250', 'uz', '0', 'https://telegram.me/OnZBot?start=413788639', '0', '0.3', '1', '0.3', '0', '0', '0', '0', '0', '+5'),
(44, '466124467', '', 'ÐžÐ¼Ð¾Ð½ Ð£Ñ€Ð¾ÐºÐ¾Ð²', '1520834404', 'uz', '0', 'https://telegram.me/OnZBot?start=466124467', '0', '0.3', '1', '0.3', '0', '0', '0', '0', '0', '+5'),
(45, '319370215', '', 'Ð¡Ð°Ð³Ð¸Ð½Ð´Ð¸Ðº Ð‘Ð°Ð·Ð°Ñ€Ð±Ð°ÐµÐ²', '1520834445', 'uz', '0', 'https://telegram.me/OnZBot?start=319370215', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(46, '445594788', '', 'Ð¡Ð°Ð±Ð¾Ñ…Ð¾Ð½ ', '1520834478', 'uz', '0', 'https://telegram.me/OnZBot?start=445594788', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(47, '288080835', '', 'Bekzod Ismatillayev', '1520834529', 'uz', '0', 'https://telegram.me/OnZBot?start=288080835', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(48, '346000800', '', 'M-1 123 ', '1520834558', 'uz', '0', 'https://telegram.me/OnZBot?start=346000800', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(49, '161713882', '', 'Ðœ Ð®ÑÑƒÑ„ ', '1520834584', 'uz', '0', 'https://telegram.me/OnZBot?start=161713882', '0', '0.3', '1', '0.3', '0', '0', '0', '0', '0', '+5'),
(50, '495024574', 'charoz', 'Akm8486 ', '1520834590', 'uz', '0', 'https://telegram.me/OnZBot?start=495024574', '0', '0.9', '3', '0.9', '0', '0', '0', '0', '0', '+5'),
(51, '444877022', '', 'Jumagul Xurramova', '1520834619', 'uz', '0', 'https://telegram.me/OnZBot?start=444877022', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(52, '240576279', 'xushnud_1711', 'Xushnud Ollamov', '1520834639', 'uz', '0', 'https://telegram.me/OnZBot?start=240576279', '0', '0.6', '2', '0.6', '0', '0', '0', '0', '0', '+5'),
(53, '263786806', 'Azamjon9090', 'Azamjon ', '1520834658', 'uz', '0', 'https://telegram.me/OnZBot?start=263786806', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(54, '537954155', '', 'â“Šä¹™áƒª áƒªâ“„×¢ ', '1520834691', 'uz', '0', 'https://telegram.me/OnZBot?start=537954155', '0', '0.3', '1', '0.3', '0', '0', '0', '0', '0', '+5'),
(55, '342801841', 'MasterXacker', 'âœ®â•â•¬â•¬SÒˆÂ hÒˆÂ uÒˆÂ NÒˆÂ qÒˆÂ oÒˆÂ RÒˆÂ â•¬â•¬â•âœ® ', '1520834786', 'uz', '0', 'https://telegram.me/OnZBot?start=342801841', '0', '0.3', '1', '0.3', '0', '0', '0', '0', '0', '+5'),
(56, '213918608', '', 'ÐÐ·Ð¸Ð·Ð° Ð¤Ð°Ñ…Ñ€Ð¸Ð´Ð¸Ð½Ð¾Ð²Ð½Ð° ', '1520834803', 'uz', '0', 'https://telegram.me/OnZBot?start=213918608', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(57, '493003235', 'dil998831', 'dil998831 ', '1520834839', 'uz', '0', 'https://telegram.me/OnZBot?start=493003235', '0', '0.6', '3', '0.9', '0', '0', '0', '0', '0', '+5'),
(58, '117120792', 'AskarHaitov', 'Askar Haitov', '1520834852', 'uz', '0', 'https://telegram.me/OnZBot?start=117120792', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(59, '400249350', 'WebsumUz', 'Pavel Durov', '1520834982', 'uz', '0', 'https://telegram.me/OnZBot?start=400249350', '0', '0.3', '1', '0.3', '0', '0', '0', '0', '0', '+5'),
(60, '546693303', 'Ramzbek_Rajabov777', '_Ramzbek_ _Rajabov_', '1520834984', 'uz', '0', 'https://telegram.me/OnZBot?start=546693303', '0', '0', '1', '0.3', '0', '0', '0', '0', '0', '+5'),
(61, '453608806', 'Creator_admin_uzb', 'à¹ˆRoshan ', '1520835234', 'uz', '1', 'https://telegram.me/OnZBot?start=453608806', '0', '0', '1', '0.3', '0.3', '0', '0', '0', '0', '+5'),
(62, '421766381', 'X_FiGhTeR', 'ðŸƒðŸ”X_FighteRðŸ”ðŸƒ ', '1520835513', 'uz', '0', 'https://telegram.me/OnZBot?start=421766381', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(63, '462945304', 'Taqdirimsann', 'Kamina ', '1520835538', 'uz', '0', 'https://telegram.me/OnZBot?start=462945304', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(64, '320223610', '', 'â˜†â˜†â™¡_Sanjar_Bek â™¡â˜†â˜† ', '1520835802', 'uz', '0', 'https://telegram.me/OnZBot?start=320223610', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(65, '403306194', '', 'Shukrullo Bozorov', '1520835896', 'uz', '0', 'https://telegram.me/OnZBot?start=403306194', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(66, '84467228', 'NewMaster', 'ðŸŒŸÍœÍ¡HÍœÍ¡aÍœÍ¡cÍœÍ¡kÍœÍ¡eÍœÍ¡rÍœÍ¡~ÍœÍ¡BÍœÍ¡oÍœÍ¡yðŸŒŸ ', '1520835900', 'uz', '0', 'https://telegram.me/OnZBot?start=84467228', '0', '0.9', '3', '0.9', '0', '0', '0', '0', '0', '+5'),
(67, '362954238', '', 'ELMUROD HAMDAMOV', '1520836128', 'uz', '0', 'https://telegram.me/OnZBot?start=362954238', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(68, '489130553', 'My5tvofficial', 'MY5 ', '1520836182', 'uz', '0', 'https://telegram.me/OnZBot?start=489130553', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(69, '492566434', 'onam_mening_baxtim', 'Man xaker emasman ', '1520836692', 'uz', '0', 'https://telegram.me/OnZBot?start=492566434', '0', '0', '1', '0.3', '0', '0', '0', '0', '0', '+5'),
(70, '388951332', 'Millianeery', 'Îžâ€¢ âœ˜à¸™Ï„ÏÑ‹Ð¹ â€¢Îž ', '1520836752', 'uz', '0', 'https://telegram.me/OnZBot?start=388951332', '0', '0.3', '1', '0.3', '0', '0', '0', '0', '0', '+5'),
(71, '485278836', '', 'Abbos ', '1520836843', 'uz', '0', 'https://telegram.me/OnZBot?start=485278836', '0', '0.3', '1', '0.3', '0', '0', '0', '0', '0', '+5'),
(74, '549364362', 'Najmiddin10', 'Najmiddin ', '1520837248', 'uz', '0', 'https://telegram.me/OnZBot?start=549364362', '0', '1.2', '4', '1.2', '0', '0', '0', '0', '0', '+5'),
(72, '410244270', 'Shox9600', 'Ð¨Ð¾Ñ…Ñ€ÑƒÑ… ðŸ˜Ž ', '1520837141', 'uz', '0', 'https://telegram.me/OnZBot?start=410244270', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(73, '440140113', 'prince_m786', 'prÄ±nÃ§e ', '1520837151', 'uz', '1', 'https://telegram.me/OnZBot?start=440140113', '0', '1.2', '3', '0.9', '0.3', '0', '0', '0', '0', '+5'),
(75, '541938748', '', 'ÐÐ±Ð´ÑƒÐ»Ð»Ð°ÐµÐ²Ð° ', '1520837496', 'uz', '0', 'https://telegram.me/OnZBot?start=541938748', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(76, '197786316', 'highabovethesky', 'â“¡â“â“™â“â“‘â“žâ“¥ ', '1520837588', 'uz', '0', 'https://telegram.me/OnZBot?start=197786316', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(77, '308000766', 'Abon8880', 'A.A.Karimov ãƒ„', '1520837894', 'uz', '0', 'https://telegram.me/OnZBot?start=308000766', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(78, '417471579', 'phonecashadmin', 'ðŸ¤™ðŸ» ', '1520838561', 'uz', '0', 'https://telegram.me/OnZBot?start=417471579', '0', '0.3', '1', '0.3', '0', '0', '0', '0', '0', '+5'),
(90, '112347520', '', 'â„ ', '1520842095', 'uz', '0', 'https://telegram.me/OnZBot?start=112347520', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(79, '148106558', '', 'â˜…AzÎ±Ð¼Î±Ñ‚ Ð²Ñ”Ðºâ˜… ', '1520838615', 'uz', '0', 'https://telegram.me/OnZBot?start=148106558', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(80, '505654640', '', '... ', '1520838736', 'uz', '0', 'https://telegram.me/OnZBot?start=505654640', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(81, '478659867', 'Hosiyathonim', 'Gul gul Gul gul', '1520839481', 'uz', '0', 'https://telegram.me/OnZBot?start=478659867', '0', '0.3', '1', '0.3', '0', '0', '0', '0', '0', '+5'),
(82, '135982212', '', 'SHER&NUR ', '1520839569', 'uz', '0', 'https://telegram.me/OnZBot?start=135982212', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(83, '224028972', 'Navro2', 'ROSE ', '1520839940', 'uz', '0', 'https://telegram.me/OnZBot?start=224028972', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(84, '312068345', '', 'DAVRON ', '1520840000', 'uz', '0', 'https://telegram.me/OnZBot?start=312068345', '0', '0.3', '1', '0.3', '0', '0', '0', '0', '0', '+5'),
(85, '486805907', '', 'ÐŸÑ€Ð¾ÑÑ‚Ð° ÐžÑ‚Ð»Ð¸Ñ‡Ð½Ð¾', '1520840540', 'uz', '0', 'https://telegram.me/OnZBot?start=486805907', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(86, '501578762', 'atopscript', 'Creator ', '1520840730', 'uz', '0', 'https://telegram.me/OnZBot?start=501578762', '0', '0.6', '2', '0.6', '0', '0', '0', '0', '0', '+5'),
(87, '219332797', 'Xronuz', 'ðŸ‡½ ðŸ‡· ðŸ‡´ ðŸ‡³ ðŸ‡º ðŸ‡¿ ', '1520840941', 'uz', '37', 'https://telegram.me/OnZBot?start=219332797', '0', '2.3', '4', '1.2', '11.1', '0', '0', '10', '0', '+5'),
(88, '463156163', 'Sardorbek5080', 'Sardor bek', '1520841556', 'uz', '0', 'https://telegram.me/OnZBot?start=463156163', '0', '0.3', '1', '0.3', '0', '0', '0', '0', '0', '+5'),
(89, '456009363', 'BARCELONA19960614', 'Ahror Nizomidinov', '1520841957', 'uz', '0', 'https://telegram.me/OnZBot?start=456009363', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(91, '194465343', '', 'Ð˜ÑˆÐ±ÑƒÐ²Ð¸ ÐÐ¹Ð¼Ð°Ñ‚Ð¾Ð²Ð°', '1520842177', 'uz', '0', 'https://telegram.me/OnZBot?start=194465343', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(92, '169431616', '', 'ðŸ¤’ðŸ¤’ðŸ¤’ðŸ¤’ ', '1520842794', 'uz', '0', 'https://telegram.me/OnZBot?start=169431616', '0', '0.3', '1', '0.3', '0', '0', '0', '0', '0', '+5'),
(93, '504289750', 'RajabovJavohir', 'Javohir Rajabov', '1520843182', 'uz', '0', 'https://telegram.me/OnZBot?start=504289750', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(94, '542464350', 'Rza9631', 'ðŸ…¡ðŸ…©ðŸ… ', '1520843933', 'uz', '0', 'https://telegram.me/OnZBot?start=542464350', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(95, '148223180', 'REALSSSS', 'REAL ', '1520844132', 'uz', '0', 'https://telegram.me/OnZBot?start=148223180', '0', '0.9', '3', '0.9', '0', '0', '0', '0', '0', '+5'),
(96, '233489969', 'general_uz', 'â–“â–ˆâ–ˆâ–“â–“ â™š É¢eÉ´eÊ€aÊŸ â™š â–“â–“â–ˆâ–ˆâ–“ ', '1520844190', 'uz', '25', 'https://telegram.me/OnZBot?start=233489969', '0', '3.1', '2', '0.6', '7.5', '0', '0', '5', '0', '+5'),
(97, '403600483', 'shamsiddin300', 'Uzbek ', '1520844368', 'uz', '0', 'https://telegram.me/OnZBot?start=403600483', '0', '1.2', '4', '1.2', '0', '0', '0', '0', '0', '+5'),
(146, '421948117', 'Half_blood_prince0402', 'à¹ˆ ', '1520877039', 'uz', '0', 'https://telegram.me/OnZBot?start=421948117', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(98, '430316472', 'DERSKOE', 'â†‘â†â†’â†“ ', '1520844602', 'uz', '0', 'https://telegram.me/OnZBot?start=430316472', '0', '0.3', '1', '0.3', '0', '0', '0', '0', '0', '+5'),
(99, '324783652', '', 'Abraham Lincoln', '1520844872', 'uz', '0', 'https://telegram.me/OnZBot?start=324783652', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(100, '161384210', 'SiMpLeBoYuZ', 'S a R v a R SaduLLayeV', '1520844907', 'uz', '0', 'https://telegram.me/OnZBot?start=161384210', '0', '0.6', '2', '0.6', '0', '0', '0', '0', '0', '+5'),
(101, '560452428', '', 'Rza ', '1520845018', 'uz', '0', 'https://telegram.me/OnZBot?start=560452428', '0', '0.3', '1', '0.3', '0', '0', '0', '0', '0', '+5'),
(102, '118663346', 'taslaq', 'Ð˜ÑÐ»Ð°Ð¼ ÐšÑƒÑ€Ð±Ð°Ð½Ð±Ð°ÐµÐ²', '1520845218', 'uz', '0', 'https://telegram.me/OnZBot?start=118663346', '0', '0.3', '1', '0.3', '0', '0', '0', '0', '0', '+5'),
(103, '528511096', 'men_uni_sevaman_uni', 'ðŸ’”â¤ï¸ðŸ’™ðŸ’œSEVGIðŸ’”â¤ï¸ðŸ’™ðŸ’œ ', '1520845316', 'uz', '0', 'https://telegram.me/OnZBot?start=528511096', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(104, '496831352', '', 'Ð¯Ñ€Ð¾ÑÐ»Ð°Ð² Ð‘ÑƒÑ€Ð»Ð°Ñ‡ÐµÐ½ÐºÐ¾', '1520845322', 'uz', '0', 'https://telegram.me/OnZBot?start=496831352', '0', '0.3', '1', '0.3', '0', '0', '0', '0', '0', '+5'),
(105, '351454076', 'UzWebStar', 'ðŸ¤˜â€¢.â˜† gÑÑ”Î±Ñ‚ Î±âˆ‚Ð¼Î¹Ð¸ â˜†.â€¢ðŸ˜Ž ', '1520845345', 'uz', '0', 'https://telegram.me/OnZBot?start=351454076', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(106, '402869239', '', 'Davron ', '1520845453', 'uz', '1', 'https://telegram.me/OnZBot?start=402869239', '0', '1.2', '3', '0.9', '0.3', '0', '0', '0', '0', '+5'),
(107, '510918746', 'Xoroshay', 'ÐÐ»Ð¸Ð½Ð° ÐœÐ°Ð½Ð³Ð¸Ñ‚', '1520845465', 'uz', '0', 'https://telegram.me/OnZBot?start=510918746', '0', '0.3', '1', '0.3', '0', '0', '0', '0', '0', '+5'),
(108, '198492023', 'MRX1998', 'Ð¯ Ñ‚Ð²Ð¾Ð¹ Ð¿Ð°Ñ…Ð°Ð½ ', '1520845471', 'uz', '2', 'https://telegram.me/OnZBot?start=198492023', '0', '0.9', '1', '0.3', '0.6', '0', '0', '0', '0', '+5'),
(109, '213843458', '', 'FCB ', '1520845522', 'uz', '0', 'https://telegram.me/OnZBot?start=213843458', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(110, '548189433', 'bektemur1226', 'Ð¢ÐµÐ¼ÑƒÑ€Ð±ÐµÐº ', '1520845525', 'uz', '0', 'https://telegram.me/OnZBot?start=548189433', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(111, '351236277', '', 'ðŸš˜ðŸš–ðŸš—ðŸš• Ð¨ÑƒÐ¼Ð°Ñ…ÐµÑ€', '1520845557', 'uz', '0', 'https://telegram.me/OnZBot?start=351236277', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(112, '487713565', 'XXAACCEER', 'â“§â“§â“â“â“’â“’â“”â“”â“¡â“¡ ', '1520845949', 'uz', '0', 'https://telegram.me/OnZBot?start=487713565', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(113, '565463765', '', 'Ð¡ÑƒÐ»Ñ‚Ð°Ð½ ', '1520846319', 'uz', '0', 'https://telegram.me/OnZBot?start=565463765', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(114, '496504229', '', 'Ð¡ÑƒÐ»Ñ‚Ð°Ð½ ', '1520846414', 'uz', '0', 'https://telegram.me/OnZBot?start=496504229', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(115, '489443637', 'z_z_x_z_z', 'Crowd strike |Mozii investing', '1520847458', 'uz', '0', 'https://telegram.me/OnZBot?start=489443637', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(116, '399695700', '', 'Bagi ', '1520847651', 'uz', '0', 'https://telegram.me/OnZBot?start=399695700', '0', '0.6', '2', '0.6', '0', '0', '0', '0', '0', '+5'),
(117, '433693437', 'Learning_Learning_Learning', 'Abdulmalik ', '1520847651', 'uz', '0', 'https://telegram.me/OnZBot?start=433693437', '0', '0.6', '2', '0.6', '0', '0', '0', '0', '0', '+5'),
(118, '379682571', '', 'SHAVKATOV N O R B E K', '1520847843', 'uz', '0', 'https://telegram.me/OnZBot?start=379682571', '0', '0.6', '2', '0.6', '0', '0', '0', '0', '0', '+5'),
(119, '476957906', 'SEREGA57RU', 'Ð¡ÐµÑ€Ð³ÐµÐ¹ ÐžÐ²Ñ‡Ð¸Ð½Ð½Ð¸ÐºÐ¾Ð²', '1520847891', 'uz', '0', 'https://telegram.me/OnZBot?start=476957906', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(120, '273637900', 'Bot_qwerty', 'Bot ', '1520847918', 'uz', '0', 'https://telegram.me/OnZBot?start=273637900', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(121, '437757997', '', 'Navrozbek ', '1520847994', 'uz', '0', 'https://telegram.me/OnZBot?start=437757997', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(122, '567264032', 'Wowena', 'Wow ', '1520848315', 'uz', '0', 'https://telegram.me/OnZBot?start=567264032', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(123, '561471018', '', 'King Walker', '1520848160', 'uz', '0', 'https://telegram.me/OnZBot?start=561471018', '0', '0.6', '2', '0.6', '0', '0', '0', '0', '0', '+5'),
(124, '380157597', 'samanDar8334', 'Ð£Ð´Ð°Ð»Ñ‘Ð½Ð½Ñ‹Ð¹ Ð°ÐºÐºÐ°ÑƒÐ½Ñ‚', '1520865403', 'uz', '0', 'https://telegram.me/OnZBot?start=380157597', '0', '0.3', '1', '0.3', '0', '0', '0', '0', '0', '+5'),
(125, '502898719', '', '... ', '1520865709', 'uz', '0', 'https://telegram.me/OnZBot?start=502898719', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(126, '415668953', 'Hali_hammasi_oldindaaaaa', 'Daston ', '1520855176', 'uz', '0', 'https://telegram.me/OnZBot?start=415668953', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(127, '487704121', 'Seeewme', 'Wee ', '1520867053', 'uz', '0', 'https://telegram.me/OnZBot?start=487704121', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(128, '465258170', 'Freelance0909', 'Freelance ', '1520864589', 'uz', '0', 'https://telegram.me/OnZBot?start=465258170', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(129, '456938704', '', 'Uzakov Shukhrat', '1520867098', 'uz', '0', 'https://telegram.me/OnZBot?start=456938704', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(130, '551135137', '', '.....ðŸ˜Š/..... ', '1520867138', 'uz', '0', 'https://telegram.me/OnZBot?start=551135137', '0', '0.3', '1', '0.3', '0', '0', '0', '0', '0', '+5'),
(131, '246563456', 'AsliddinUz', 'Asliddin ', '1520868868', 'uz', '0', 'https://telegram.me/OnZBot?start=246563456', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(132, '370569966', 'NilufarNosirova', 'Nilufar Nosirova', '1520867729', 'uz', '0', 'https://telegram.me/OnZBot?start=370569966', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(133, '369860884', 'Ww707707', 'Narxi qancha MEHRNI ', '1520867437', 'uz', '0', 'https://telegram.me/OnZBot?start=369860884', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(134, '452597961', 'LucferUzb', 'L U C F E R ', '1520868462', 'uz', '0', 'https://telegram.me/OnZBot?start=452597961', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(135, '344567659', '', 'AliSher ', '1520870197', 'uz', '0', 'https://telegram.me/OnZBot?start=344567659', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(136, '331494062', 'Beka_09', 'ðŸ¤˜Ð‘ÏÎ±Ï„ Ð—Î± Ð‘ÏÎ±Ï„Î± Ð½Î± Î²ÑÎµÐ³Î”Î± ðŸ‘Š ', '1520869083', 'uz', '0', 'https://telegram.me/OnZBot?start=331494062', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(137, '85074719', 'Janobsms', 'Usmonoff ', '1520870841', 'uz', '0', 'https://telegram.me/OnZBot?start=85074719', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(138, '334075863', 'Azim3006', 'Azim Bagat', '1520876656', 'uz', '0', 'https://telegram.me/OnZBot?start=334075863', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(139, '439568145', 'Turon_Arsloni', 'â™› Turon_Arsloni ', '1520876105', 'uz', '0', 'https://telegram.me/OnZBot?start=439568145', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(140, '313330607', 'Abdulazizabek', 'Abdulaziz Abdurahamonov', '1520870891', 'uz', '0', 'https://telegram.me/OnZBot?start=313330607', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(141, '513770758', 'Leonid01011983', 'Ð›ÐµÐ¾Ð½Ð¸Ð´ Ð›ÐµÐ¾Ð½Ð¸Ð´', '1520871108', 'uz', '0', 'https://telegram.me/OnZBot?start=513770758', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(142, '288381782', '', 'Ð Ð°ÑÑƒÐ» ÐÑ‚Ð°Ð´Ð¶Ð°Ð½Ð¾Ð²', '1520881508', 'uz', '0', 'https://telegram.me/OnZBot?start=288381782', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(143, '536151282', 'Hhxbcc', '... ', '1520877718', 'uz', '0', 'https://telegram.me/OnZBot?start=536151282', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(144, '410671518', 'FTnur7707', 'Ð¼Ð°Ð¶Ð¾Ñ€ ', '1520910158', 'uz', '0', 'https://telegram.me/OnZBot?start=410671518', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(145, '410671518', 'FTnur7707', 'Ð¼Ð°Ð¶Ð¾Ñ€ ', '1520910028', 'uz', '0', 'https://telegram.me/OnZBot?start=410671518', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(147, '538245914', 'King9499', 'â—„â–ˆâ–“ Î±FÑ‚Î±Ê€ÉªÏ„ÎµÏ„ â–“â–ˆâ–º ', '1520878260', 'uz', '0', 'https://telegram.me/OnZBot?start=538245914', '0', '0.6', '2', '0.6', '0', '0', '0', '0', '0', '+5'),
(148, '508294614', '', 'ÐÐ°Ð´Ñ ', '1520886558', 'uz', '0', 'https://telegram.me/OnZBot?start=508294614', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(149, '440412763', 'Akhmadaliyev1', 'â’¶â“šâ“—â“œâ“â““â“â“›â“˜â“¨â“”â“¥ ', '1520872975', 'uz', '0', 'https://telegram.me/OnZBot?start=440412763', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(150, '354443020', '', 'Alisher ', '1520912142', 'uz', '0', 'https://telegram.me/OnZBot?start=354443020', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(151, '384981987', '', 'Valjon Parker', '1520875960', 'uz', '0', 'https://telegram.me/OnZBot?start=384981987', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(152, '483180067', 'M_a_r_d_o_n_17', 'à¥ÎžÐ—Ïƒ×’ÏƒÏ„ÏƒÐ¹ Ð¼à¸¥Î»ÑŠÑ‡à¸™là¸£à¸°Îžà¥ ', '1520884929', 'uz', '0', 'https://telegram.me/OnZBot?start=483180067', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(153, '332846430', 'Janob_Xacker', 'Â»â™¦â˜…Jentelmenâ˜…â™¦Â« ', '1520882188', 'uz', '0', 'https://telegram.me/OnZBot?start=332846430', '0', '0.6', '2', '0.6', '0', '0', '0', '0', '0', '+5'),
(154, '200010685', 'umidjonxasanov', 'Umidjon Xasanov', '1520882626', 'uz', '0', 'https://telegram.me/OnZBot?start=200010685', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(155, '220511956', 'Xayratiy', 'Hayrati ', '1520875185', 'uz', '0', 'https://telegram.me/OnZBot?start=220511956', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(156, '75932179', 'NuRiKoOoBlabberEN', 'NuRiK oOO', '1520906058', 'uz', '0', 'https://telegram.me/OnZBot?start=75932179', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(157, '511265106', '', 'Balanco Irina', '1520888533', 'uz', '0', 'https://telegram.me/OnZBot?start=511265106', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(158, '386064691', 'TeleMoneyUz', 'Classic ', '1520880274', 'uz', '0', 'https://telegram.me/OnZBot?start=386064691', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(159, '337465193', '', 'Mihroj Avloqulov', '1520880854', 'uz', '0', 'https://telegram.me/OnZBot?start=337465193', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(160, '165376680', 'Pb2055', '49142 ', '1520906682', 'uz', '0', 'https://telegram.me/OnZBot?start=165376680', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(161, '494519022', '', 'ÐÐ»ÐµÐºÑÐ°Ð½Ð´Ñ€ Ð¡Ð¼Ð¸Ñ€Ð½Ð¾Ð²', '1520914405', 'uz', '0', 'https://telegram.me/OnZBot?start=494519022', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(162, '444280057', 'sarikgram', 'Sardor Kasimovich', '1520914982', 'uz', '0', 'https://telegram.me/OnZBot?start=444280057', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(163, '446000660', 'ERRORuz', 'â™š KÎ¹Î·G â™š ', '1520908190', 'uz', '0', 'https://telegram.me/OnZBot?start=446000660', '0', '0.3', '1', '0.3', '0', '0', '0', '0', '0', '+5'),
(164, '178340085', '', 'NO NAME', '1520916227', 'uz', '0', 'https://telegram.me/OnZBot?start=178340085', '0', '0.3', '1', '0.3', '0', '0', '0', '0', '0', '+5'),
(165, '136043221', 'TABIBIM', 'Ð¤ÐµÑ€ÑƒÐ·Ð° Ñ‚Ð°Ð±Ð¸Ð± ', '1520917980', 'uz', '6', 'https://telegram.me/OnZBot?start=136043221', '0', '1.8', '0', '0', '1.8', '0', '0', '0', '0', '+5'),
(166, '242771717', 'Foziljanovich', 'Nazarbek ', '1520916730', 'uz', '0', 'https://telegram.me/OnZBot?start=242771717', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(167, '509871618', '', 'Zarif Yarashov', '1520906595', 'uz', '0', 'https://telegram.me/OnZBot?start=509871618', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(168, '397040296', 'Jasurbek05916744098', 'ðŸ‡º ðŸ‡¿ ðŸ‡§ ðŸ‡ª ðŸ‡° ðŸ‡® ðŸ‡¸ ðŸ‡¹ ðŸ‡¦ ðŸ‡³ ', '1520930709', 'uz', '0', 'https://telegram.me/OnZBot?start=397040296', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(169, '188863737', '', 'Pavel Durov ', '1520922388', 'uz', '0', 'https://telegram.me/OnZBot?start=188863737', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(170, '255554115', '', 'Toxtasinov Muzaffar', '1520931083', 'uz', '0', 'https://telegram.me/OnZBot?start=255554115', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(171, '259974556', 'joxa_7707', 'Joxa ', '1520921202', 'uz', '0', 'https://telegram.me/OnZBot?start=259974556', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(172, '426183525', '', 'ðŸŽ© Î’Î¹zÎ·ÎµSà¹—Î±Î· ðŸŽ© ', '1520926643', 'uz', '0', 'https://telegram.me/OnZBot?start=426183525', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(173, '567481029', 'SHAHBOZBEK_official', 'Ñ¼ãƒ„áƒ“Ä„à¹ƒhà¸¥ÊÎ”à¸™à¹ƒà¹€à¹ƒà¹ƒà¸¥h Mà¸™à¸˜à¹€à¹ƒà¸“à¸¥Î·à¹€Î·áƒ“ãƒ„Ñ¼ ', '1520922648', 'uz', '0', 'https://telegram.me/OnZBot?start=567481029', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(174, '517395959', 'creator_realbizness_uz', 'OYBEK ', '1520931652', 'uz', '0', 'https://telegram.me/OnZBot?start=517395959', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(175, '460922402', 'Yangibozor_007', 'â“Šä¹™áƒªÎµâ“š ', '1520919017', 'uz', '0', 'https://telegram.me/OnZBot?start=460922402', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(176, '480034321', '', 'Muzaffar Mominov', '1520944925', 'uz', '0', 'https://telegram.me/OnZBot?start=480034321', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(177, '340078702', '', 'Ð›Ð¾Ð±Ð°Ñ€ ', '1520948141', 'uz', '0', 'https://telegram.me/OnZBot?start=340078702', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(178, '452484862', 'I_do_not_want_to_live', 'ðŸŒ¹ Asia Mohammed ðŸŒ¹ ', '1520953917', 'uz', '0', 'https://telegram.me/OnZBot?start=452484862', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(179, '383375308', '', 'Abror Aliqulov ', '1520954559', 'uz', '0', 'https://telegram.me/OnZBot?start=383375308', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(180, '557297445', 'Xprognoz', 'Xprognoz ', '1520957229', 'uz', '0', 'https://telegram.me/OnZBot?start=557297445', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(181, '64147089', '', 'Feruzaxon Aslanova ', '1520962034', 'uz', '0', 'https://telegram.me/OnZBot?start=64147089', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(182, '527296198', 'Mr_Jehk', 'F_COUTINHO14 ', '1520965277', 'uz', '0', 'https://telegram.me/OnZBot?start=527296198', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(183, '482517215', '', '80884 ', '1520976230', 'uz', '0', 'https://telegram.me/OnZBot?start=482517215', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(184, '335484357', 'NorinAdmin', 'Ð‘Ð¾Ð±ÑƒÑ€ ', '1520980999', 'uz', '0', 'https://telegram.me/OnZBot?start=335484357', '0', '0.6', '2', '0.6', '0', '0', '0', '0', '0', '+5'),
(185, '543027291', 'Daminovwolf', 'Wolf Volk', '1520989925', 'uz', '0', 'https://telegram.me/OnZBot?start=543027291', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(186, '488269225', 'AlanWake77', 'Alan Wake', '1520973789', 'uz', '0', 'https://telegram.me/OnZBot?start=488269225', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(187, '421695439', 'TITAN20_40', 'âœº â”„à¦…à¦  Í¡ÍœÍ¡aÍœÍ¡.ÍœÍ¡ ÍœÍ¡cÍœÍ¡.ÍœÍ¡ ÍœÍ¡cÍœÍ¡.ÍœÍ¡ ÍœÍ¡Î¿ÍœÍ¡.ÍœÍ¡ ÍœÍ¡Ï…ÍœÍ¡.ÍœÍ¡ ÍœÍ¡Î·.ÍœÍ¡ Ï„ÍœÍ¡à¦ à¦…â”„ âœº ', '1521007414', 'uz', '0', 'https://telegram.me/OnZBot?start=421695439', '0', '0.6', '2', '0.6', '0', '0', '0', '0', '0', '+5'),
(188, '529165142', 'UZBSAR', 'Sardor kuchkarov', '1521014220', 'uz', '0', 'https://telegram.me/OnZBot?start=529165142', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(189, '91201168', 'Mr_magistr', 'Farhod Shodiyorov', '1521016524', 'uz', '0', 'https://telegram.me/OnZBot?start=91201168', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(190, '348164212', 'CRonaldo_777', 'sÌ†aÌ†dÌ†rÌ†iÌ†dÌ†dÌ†iÌ†nÌ† ', '1521019740', 'uz', '0', 'https://telegram.me/OnZBot?start=348164212', '0', '0.6', '2', '0.6', '0', '0', '0', '0', '0', '+5'),
(191, '353613884', 'AsLMiR', 'MiSTeR â˜†AsLMiRâ˜† ', '1521020218', 'uz', '0', 'https://telegram.me/OnZBot?start=353613884', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(192, '85113302', 'FaRKhoD_cHiK', 'FaÅ”KhÃ¸Ä ðŸ‘ŠðŸ†—', '1521027637', 'uz', '0', 'https://telegram.me/OnZBot?start=85113302', '0', '0.3', '1', '0.3', '0', '0', '0', '0', '0', '+5'),
(193, '269336255', 'Milliarder8848', '_S_I_R_O_J_ ', '1521035160', 'uz', '0', 'https://telegram.me/OnZBot?start=269336255', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(194, '484853359', 'DeFeNdRi', 'DeFeNdR CaPiTaN', '1521034493', 'uz', '0', 'https://telegram.me/OnZBot?start=484853359', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(195, '400336175', 'Dr_feruzbek', 'Feruzbek Qosimov', '1521027153', 'uz', '0', 'https://telegram.me/OnZBot?start=400336175', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(196, '394037400', 'Ashaddiy', 'Muxammadjon ', '1521035983', 'uz', '0', 'https://telegram.me/OnZBot?start=394037400', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(197, '488894794', '', 'ã…¤ã…¤ã…¤ ', '1521038084', 'uz', '0', 'https://telegram.me/OnZBot?start=488894794', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(198, '518128083', '', 'Dilfuza ', '1521039711', 'uz', '0', 'https://telegram.me/OnZBot?start=518128083', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(199, '532759758', 'Invest3333', 'Invest mafia ', '1521039336', 'uz', '0', 'https://telegram.me/OnZBot?start=532759758', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(200, '468321855', 'Mr_americanoo', 'ï¸»â•¦ãƒ‡â•¤â”â”µ ðŸ‘‘â“—â“â“’â“šâ“”â“¡ðŸ‘‘ ï¸»â•¦ãƒ‡â•¤â”â”µ ', '1521044672', 'uz', '0', 'https://telegram.me/OnZBot?start=468321855', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(201, '284161239', '', 'Jurayev Otabek', '1521047214', 'uz', '0', 'https://telegram.me/OnZBot?start=284161239', '0', '0.6', '2', '0.6', '0', '0', '0', '0', '0', '+5'),
(202, '519127052', 'Ronuzz', 'Xronuzz ', '1521048298', 'uz', '0', 'https://telegram.me/OnZBot?start=519127052', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(203, '523003930', 'Xronuzn1', 'Xronuz2 ', '1521048868', 'uz', '0', 'https://telegram.me/OnZBot?start=523003930', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(204, '363874539', 'Hayotgakulibboqsang', 'ðŸŽŠðŸŽŠðŸŽŠðŸŽŠðŸŽŠðŸŽŠ ðŸŽŠðŸŽŠðŸŽŠðŸŽŠðŸŽŠðŸŽŠ', '1521048954', 'uz', '0', 'https://telegram.me/OnZBot?start=363874539', '0', '0.6', '2', '0.6', '0', '0', '0', '0', '0', '+5'),
(205, '179629251', 'Maga_official_page', 'ÎœÅ˜.ÒœÄ¦á»®Ä´Î”Îœá»®Å˜Î”ÄÃ˜â‚£â‚£ ', '1521048998', 'uz', '0', 'https://telegram.me/OnZBot?start=179629251', '0', '0.6', '2', '0.6', '0', '0', '0', '0', '0', '+5'),
(206, '2188779', 'Zweet', 'AZU ', '1521049909', 'uz', '0', 'https://telegram.me/OnZBot?start=2188779', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(207, '91647658', 'Alhamdullila7', 'â„¢â˜†âœ« âœ¯Ð¡ÐÐ‘âœ­ â‰›âœ” â˜‘ â˜ª â„¢â˜†âœ« â‰›â˜žâ˜ª 777 â„¢â˜†âœ« âœ¯ â£ âœ­ â‰› â˜‘ â˜ª', '1521049914', 'uz', '0', 'https://telegram.me/OnZBot?start=91647658', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(208, '428066043', 'rufat4144', 'á€”à¹Œà¹Œà¹Œà¹Œà¹Œà¸±à¸±à¸±à¸±à¸±à¸±à¸±à¸±à¸±à¸±à¸¸à¸¸à¸¸à¸¸à¸¸à¸¸à¸¸à¸¸à¸¸à¸¸à¸¸à¸¸à¸¸à¸¸à¸¸à¸¸à¸·à¸·à¸·à¸·à¸·à¹‰à¹‰à¹‰à¹‰à¹‰à¹‰à¹‰à¹‰à¹ˆà¹ˆà¹ˆà¹ˆà¹ˆà¹ˆà¸¸à¸¸à¸¸à¸¸à¸¸à¸¸à¸¸á€”à¹Œà¹Œà¹Œà¹Œà¹Œà¸±à¸±à¸±à¸±à¸±à¸±à¸±à¸±à¸±à¸±à¸¸', '1521049937', 'uz', '0', 'https://telegram.me/OnZBot?start=428066043', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(209, '541392503', 'Triott', 'V.N ', '1521049989', 'uz', '0', 'https://telegram.me/OnZBot?start=541392503', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(210, '425616256', '', 'Ð£Ñ‡Ð¸Ñ‚ÐµÐ»ÑŒ Ð¿Ð¾ ÐšÐ¾Ñ€Ð°Ð½Ñƒ', '1521050161', 'uz', '0', 'https://telegram.me/OnZBot?start=425616256', '0', '0.3', '1', '0.3', '0', '0', '0', '0', '0', '+5'),
(211, '438130726', 'ID007ZvEr', 'á… á… á… á… á… á… á… á… á… á…  â  ÎžÏà¸¥Å¯Ã§kà¸™Å¯ Ï€cÏ…Ï‡ ðŸ‘‘ ', '1521050170', 'uz', '0', 'https://telegram.me/OnZBot?start=438130726', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(212, '240285321', 'Photolight_st', 'ðŸ‘¨â€ðŸ‘¨â€Photo-LighT_Studio ðŸ‘¨ðŸ»â€âœˆï¸ðŸ‘¨ðŸ¼â€ðŸŽ“', '1521050219', 'uz', '0', 'https://telegram.me/OnZBot?start=240285321', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(213, '521912567', 'Nenoman', 'Xronuz4 ', '1521050254', 'uz', '0', 'https://telegram.me/OnZBot?start=521912567', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(214, '470895143', 'Asliddin071199', 'Asliddin ', '1521050276', 'uz', '0', 'https://telegram.me/OnZBot?start=470895143', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(215, '463994156', 'I_am_from_SHOVOT', 'Ibrohim ', '1521050355', 'uz', '0', 'https://telegram.me/OnZBot?start=463994156', '0', '0.6', '2', '0.6', '0', '0', '0', '0', '0', '+5'),
(216, '261770868', '', 'Oybek+ Sevara', '1521050525', 'uz', '0', 'https://telegram.me/OnZBot?start=261770868', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(217, '280560756', '', 'Azamat ', '1521050596', 'uz', '0', 'https://telegram.me/OnZBot?start=280560756', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(218, '436886278', 'utkir6', 'Ð¨Ð¾Ñ…Ð¶Ð°Ñ…Ð¾Ð½ ', '1521050616', 'uz', '0', 'https://telegram.me/OnZBot?start=436886278', '0', '0.6', '2', '0.6', '0', '0', '0', '0', '0', '+5'),
(219, '32081018', '', 'ÐÑ‚Ð°Ð¼ÑƒÑ€Ð°Ñ‚ ', '1521050831', 'uz', '0', 'https://telegram.me/OnZBot?start=32081018', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(220, '341757248', '', 'Ð—ÑƒÐ»Ñ„Ð¸Ñ Ð®Ð»Ð´Ð°ÑˆÐµÐ²Ð½Ð°', '1521051257', 'uz', '0', 'https://telegram.me/OnZBot?start=341757248', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(221, '394684149', '', 'LiTTle LadY', '1521051356', 'uz', '0', 'https://telegram.me/OnZBot?start=394684149', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(222, '559821320', 'Totoxbet', 'Xronuz5 ', '1521051481', 'uz', '0', 'https://telegram.me/OnZBot?start=559821320', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(223, '543250057', 'YOQUBJON777', '$777$ ', '1521051696', 'uz', '0', 'https://telegram.me/OnZBot?start=543250057', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(224, '272128584', '', '60676 Veras', '1521052422', 'uz', '0', 'https://telegram.me/OnZBot?start=272128584', '0', '0.3', '1', '0.3', '0', '0', '0', '0', '0', '+5'),
(225, '455290997', 'Adiz_08_01', 'Adiz ', '1521052520', 'uz', '25', 'https://telegram.me/OnZBot?start=455290997', '0', '3.1', '2', '0.6', '7.5', '0', '0', '5', '0', '+5'),
(226, '5261165', 'Obidjon8886', 'OBID OLIMOVICH', '1521052559', 'uz', '1', 'https://telegram.me/OnZBot?start=5261165', '0', '0.9', '2', '0.6', '0.3', '0', '0', '0', '0', '+5'),
(227, '296829035', 'Valiyevich7788', 'ÐÐ·Ð°Ð¼Ð°Ñ‚ .', '1521052611', 'uz', '0', 'https://telegram.me/OnZBot?start=296829035', '0', '0.6', '2', '0.6', '0', '0', '0', '0', '0', '+5'),
(228, '442852121', 'TaRNaDo2017', 'DRAGON ', '1521052677', 'uz', '0', 'https://telegram.me/OnZBot?start=442852121', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(229, '147360224', '', 'Jas ', '1521052701', 'uz', '0', 'https://telegram.me/OnZBot?start=147360224', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(230, '393519897', '', 'Ziyodulloyev Begmirzo', '1521052741', 'uz', '0', 'https://telegram.me/OnZBot?start=393519897', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(231, '54043520', '', 'Ð¨ ', '1521052788', 'uz', '0', 'https://telegram.me/OnZBot?start=54043520', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(232, '518036982', 'Zenchik89', 'Zena ', '1521052811', 'uz', '0', 'https://telegram.me/OnZBot?start=518036982', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(233, '529399847', '', 'kim ekan', '1521052870', 'uz', '0', 'https://telegram.me/OnZBot?start=529399847', '0', '0.6', '2', '0.6', '0', '0', '0', '0', '0', '+5'),
(234, '190953404', '', 'Maxmudov Zayniddin', '1521053072', 'uz', '0', 'https://telegram.me/OnZBot?start=190953404', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(235, '276623052', '', 'â–·â—‰â”€â”€â”€â”€â”€ 00:95 ', '1521053282', 'uz', '0', 'https://telegram.me/OnZBot?start=276623052', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(236, '537262652', '', 'Nargiza ', '1521053739', 'uz', '0', 'https://telegram.me/OnZBot?start=537262652', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(237, '353762570', 'Jamshid010', 'R a y M o n D *******', '1521053821', 'uz', '0', 'https://telegram.me/OnZBot?start=353762570', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(238, '433938669', 'Shoha_3839', 'ShakhðŸ‘ŠðŸ‘Š ', '1521054559', 'uz', '0', 'https://telegram.me/OnZBot?start=433938669', '0', '0.3', '1', '0.3', '0', '0', '0', '0', '0', '+5'),
(239, '512083032', 'Rxron', 'The First', '1521054657', 'uz', '0', 'https://telegram.me/OnZBot?start=512083032', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(240, '42360367', 'Boxing_4465', 'Ð¡Ð°Ð¸Ð±Ð¾Ð² ðŸ’ª ', '1521054836', 'uz', '0', 'https://telegram.me/OnZBot?start=42360367', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(241, '300084373', '', 'Ð¼Ð°Ð¼ÑƒÑ€ ', '1521055055', 'uz', '0', 'https://telegram.me/OnZBot?start=300084373', '0', '0.3', '1', '0.3', '0', '0', '0', '0', '0', '+5'),
(242, '454796385', '', '007 700', '1521055191', 'uz', '0', 'https://telegram.me/OnZBot?start=454796385', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(243, '489739082', 'Creator_Admin', 'Creator Admin', '1521055544', 'uz', '0', 'https://telegram.me/OnZBot?start=489739082', '0', '0.6', '2', '0.6', '0', '0', '0', '0', '0', '+5'),
(244, '530127301', 'Trueronuz', 'Ezun victor', '1521056349', 'uz', '0', 'https://telegram.me/OnZBot?start=530127301', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(245, '224666374', '', 'Ð£Ð¼Ð¸Ð´ ÐÐ»Ð¸Ð¼Ð¾Ð²', '1521056565', 'uz', '0', 'https://telegram.me/OnZBot?start=224666374', '0', '0.3', '1', '0.3', '0', '0', '0', '0', '0', '+5'),
(246, '330211012', '', '?? ???', '1521056594', 'uz', '0', 'https://telegram.me/OnZBot?start=330211012', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(247, '132096150', 'Fury27', 'Murod ', '1521056656', 'uz', '0', 'https://telegram.me/OnZBot?start=132096150', '0', '0.6', '2', '0.6', '0', '0', '0', '0', '0', '+5'),
(248, '447975372', 'UzMusicOfficial', '--ÐžÐ´Ð¸Ð½Ð¾(Ðš)-- ', '1521056899', 'uz', '0', 'https://telegram.me/OnZBot?start=447975372', '0', '0.6', '2', '0.6', '0', '0', '0', '0', '0', '+5'),
(249, '490509235', '', 'ismoyilov jomoldin', '1521058782', 'uz', '0', 'https://telegram.me/OnZBot?start=490509235', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(250, '466948030', '', 'Ð£Ð¼Ð¸Ð´Ð¶Ð¾Ð½ ÐÑ…Ð¼ÐµÐ´Ð¾Ð²', '1521060162', 'uz', '0', 'https://telegram.me/OnZBot?start=466948030', '0', '0.3', '1', '0.3', '0', '0', '0', '0', '0', '+5'),
(251, '508112404', '', 'Mustafa ', '1521061369', 'uz', '0', 'https://telegram.me/OnZBot?start=508112404', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(252, '62998629', 'komoliddin1050', 'ÐžÐ±Ð¸Ð´ ', '1521061988', 'uz', '0', 'https://telegram.me/OnZBot?start=62998629', '0', '0.6', '2', '0.6', '0', '0', '0', '0', '0', '+5'),
(253, '277299776', 'JASON707', 'Jason0308 ', '1521074252', 'uz', '0', 'https://telegram.me/OnZBot?start=277299776', '0', '0.6', '2', '0.6', '0', '0', '0', '0', '0', '+5'),
(254, '254725433', '', 'Ðœ 55555555', '1521075258', 'uz', '0', 'https://telegram.me/OnZBot?start=254725433', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(255, '356697226', 'B_Xojiakbar', 'Xojiakbar ', '1521076155', 'uz', '0', 'https://telegram.me/OnZBot?start=356697226', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(256, '350108257', 'USERNAMEYO', 'ADMINISTRATION ', '1521076266', 'uz', '0', 'https://telegram.me/OnZBot?start=350108257', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(257, '389438432', '', 'Ð–....... Ð¥.........', '1521079506', 'uz', '0', 'https://telegram.me/OnZBot?start=389438432', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(258, '3937413', '', 'ÐÐ»Ð¸ÑˆÐµÑ€ ÐÐ»Ð¸ÑˆÐµÑ€', '1521081808', 'uz', '0', 'https://telegram.me/OnZBot?start=3937413', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(259, '335963474', 'Sharofiddin0110', 'Sharofiddin Abdukarimov', '1521081895', 'uz', '5', 'https://telegram.me/OnZBot?start=335963474', '0', '1.5', '0', '0', '1.5', '0', '0', '0', '0', '+5'),
(260, '349127981', '', 'Malohat ', '1521082304', 'uz', '0', 'https://telegram.me/OnZBot?start=349127981', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(261, '500269096', '', 'ðŸ’ªðŸ’ªðŸ’ª ', '1521082708', 'uz', '0', 'https://telegram.me/OnZBot?start=500269096', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(262, '393200695', '', 'â‚©ðŸ˜‰# ', '1521082790', 'uz', '0', 'https://telegram.me/OnZBot?start=393200695', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(263, '552389512', 'Terraronuz', 'Millioner ', '1521082805', 'uz', '0', 'https://telegram.me/OnZBot?start=552389512', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(264, '127785245', '', 'Ð“Ð£Ð›ÐœÐ£Ð ÐžÐ”. Ð‘ÐžÐ‘Ðž (Ð˜Ð›ÐžÐ Ð¢ÐÐ‘Ð˜Ð‘)', '1521083024', 'uz', '0', 'https://telegram.me/OnZBot?start=127785245', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(265, '33298541', 'FarziddinNasriddinov', 'Farziddin Nasriddinov', '1521083192', 'uz', '0', 'https://telegram.me/OnZBot?start=33298541', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(266, '111565008', 'X2512', 'Ð‘Ð¾Ð½Ñƒ ', '1521083568', 'uz', '0', 'https://telegram.me/OnZBot?start=111565008', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5');
INSERT INTO `user` (`id`, `uid`, `login`, `name`, `time`, `lan`, `ref`, `referal`, `admin`, `money`, `joinn`, `money_join`, `money_ref`, `outn`, `inmoney`, `outmoney`, `token`, `timezona`) VALUES
(267, '401307928', 'RaxmonovN', 'Nodirbek ', '1521084787', 'uz', '0', 'https://telegram.me/OnZBot?start=401307928', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(268, '407107171', '', '. .', '1521086351', 'uz', '0', 'https://telegram.me/OnZBot?start=407107171', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(269, '270040870', '', '998949359924 ', '1521086579', 'uz', '0', 'https://telegram.me/OnZBot?start=270040870', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(270, '363763676', '', '((((Ð¨Ð•Ð )))) ', '1521086901', 'uz', '0', 'https://telegram.me/OnZBot?start=363763676', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(271, '262109952', 'cbhfx', 'MNO ', '1521088280', 'uz', '0', 'https://telegram.me/OnZBot?start=262109952', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(272, '486459514', 'Xronuzdva', 'Xronuzdvaynoy ', '1521089591', 'uz', '0', 'https://telegram.me/OnZBot?start=486459514', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(273, '351484685', '', 'Shuhratilla Fayzullaev', '1521089969', 'uz', '0', 'https://telegram.me/OnZBot?start=351484685', '0', '0.3', '1', '0.3', '0', '0', '0', '0', '0', '+5'),
(274, '506098992', '', 'Hushnazarov Akmal ', '1521091156', 'uz', '0', 'https://telegram.me/OnZBot?start=506098992', '0', '0.3', '1', '0.3', '0', '0', '0', '0', '0', '+5'),
(275, '555819266', 'Alliance_Teams', 'Alliance Teams', '1521091237', 'uz', '0', 'https://telegram.me/OnZBot?start=555819266', '0', '1.2', '4', '1.2', '0', '0', '0', '0', '0', '+5'),
(276, '406941053', 'The_Best_Of_The_Bestt', 'É¬à¹Œà¹Œà¹Œà¹Œà¹Œà¸±à¸±à¸±à¸±à¸±à¸±à¸±à¸±à¸±à¸±à¸¸à¸¸à¸¸à¸¸à¸¸à¸¸à¸¸à¸¸à¸¸à¸¸à¸¸à¸¸ Í¡ÍœÍ¡â„¢ÍœÍ¡ÍœÍ¡ðŸ”±ÍœÍ¡É¬à¹Œà¹Œà¹Œà¹Œà¹Œà¸±à¸±à¸±à¸±à¸±à¸±à¸±à¸±à¸±à¸±à¸¸à¸¸à¸¸à¸¸à¸¸à¸¸à¸¸à¸¸à¸¸à¸¸à¸¸à¸¸à¸¸à¸¸à¸¸à¦Šà¦ˆÍ¡ÍœÍ¡ÍœÍ¡Í¡Íœ Â«B', '1521092608', 'uz', '0', 'https://telegram.me/OnZBot?start=406941053', '0', '0.9', '3', '0.9', '0', '0', '0', '0', '0', '+5'),
(277, '85906885', 'damir9194', 'Ð”Ð°Ð¼Ð¸Ñ€ ÐÐ°Ñ€Ð±Ð°ÐµÐ²', '1521092738', 'uz', '0', 'https://telegram.me/OnZBot?start=85906885', '0', '0.6', '2', '0.6', '0', '0', '0', '0', '0', '+5'),
(278, '553423359', 'Zuborra', 'Xronuzno ', '1521092791', 'uz', '0', 'https://telegram.me/OnZBot?start=553423359', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(279, '425605961', '', 'RÐ°vshan ', '1521093024', 'uz', '0', 'https://telegram.me/OnZBot?start=425605961', '0', '0.6', '2', '0.6', '0', '0', '0', '0', '0', '+5'),
(280, '1853395', '', 'âš½ï¸âš½ï¸âš½ï¸âš½ï¸ ', '1521093043', 'uz', '0', 'https://telegram.me/OnZBot?start=1853395', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(281, '277301418', 'uZHacker20_05', 'ðŸƒÍÍžÌºÍ‰ÌºÍ‰Í‰ Í¢ÍœÍ’ÌÍ’ÌÍÌ„Í‰ÌºÍ‰ÌºÌºÌºÍ’ÌÍ’ ÌÍ¢Íœ Í‰ÌºÍ‰ÍÍžÍœÍ¢Í¢ÍœÍ’Í’Í’Í’Í’ÌÌ—Í”Ì¬Í•Ì–Ì—Ì–Í¢ÍœÍ’ÌÍ’Í’Í’Ì‚Í”Ì—Ì—Í”Í”Ì—Ì— ÍžÍÍžÍ¢ÍœÍ”Ì–Ì—Ì–Í”Í”Ì—Ì–Í”Ì­Ì»Í’EÍ›à¿† à¿†Í›NÍ›à¿† à¿†Í›EÍ›Í›à¿† à¿†Rà¿† à¿†Í›Í›GÍ›Í›à¿', '1521093096', 'uz', '0', 'https://telegram.me/OnZBot?start=277301418', '0', '3', '10', '3', '0', '0', '0', '0', '0', '+5'),
(282, '493464771', 'youtuber_1', 'Otabek Zver', '1521093099', 'uz', '0', 'https://telegram.me/OnZBot?start=493464771', '0', '0.9', '3', '0.9', '0', '0', '0', '0', '0', '+5'),
(283, '101732484', '', 'E ..... N......', '1521093116', 'uz', '0', 'https://telegram.me/OnZBot?start=101732484', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(284, '75163827', 'User_9900', 'User 9900', '1521093183', 'uz', '0', 'https://telegram.me/OnZBot?start=75163827', '0', '0.6', '2', '0.6', '0', '0', '0', '0', '0', '+5'),
(285, '434739393', '', 'Makhliyo ', '1521093601', 'uz', '0', 'https://telegram.me/OnZBot?start=434739393', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(286, '310042783', '', 'Ð£ÑÑ‚Ð° Ð±ÑƒÐ²Ð°', '1521093680', 'uz', '0', 'https://telegram.me/OnZBot?start=310042783', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(287, '397686881', '', 'Jasur Soliyev', '1521093683', 'uz', '0', 'https://telegram.me/OnZBot?start=397686881', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(288, '298683722', 'Kechikkan_xayot', 'Umid ', '1521093890', 'uz', '0', 'https://telegram.me/OnZBot?start=298683722', '0', '0.6', '2', '0.6', '0', '0', '0', '0', '0', '+5'),
(289, '531531956', 'Buryta', 'Johongir Johongir', '1521094050', 'uz', '0', 'https://telegram.me/OnZBot?start=531531956', '0', '0.6', '2', '0.6', '0', '0', '0', '0', '0', '+5'),
(290, '82746798', 'Dr_Sobit', 'Sobit ', '1521094657', 'uz', '1', 'https://telegram.me/OnZBot?start=82746798', '0', '0.3', '0', '0', '0.3', '0', '0', '0', '0', '+5'),
(291, '448438892', '', '+998979183308 ', '1521094954', 'uz', '0', 'https://telegram.me/OnZBot?start=448438892', '0', '0.6', '2', '0.6', '0', '0', '0', '0', '0', '+5'),
(292, '412304620', 'Mirik_admin', 'ÐŸÑ€Ð¾ÑÑ‚Ð°.Ð°Ð´Ð¼Ð¸Ð½ ', '1521095138', 'uz', '0', 'https://telegram.me/OnZBot?start=412304620', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(293, '463374933', '', 'Ð¥Ð°Ð¹Ñ€Ð¸Ð½Ð¸ÑÐ¾ ÐÑˆÑƒÑ€Ð¾Ð²Ð°', '1521095927', 'uz', '0', 'https://telegram.me/OnZBot?start=463374933', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(294, '543054033', 'Xdanuz01', 'Xronuzzga ', '1521096492', 'uz', '0', 'https://telegram.me/OnZBot?start=543054033', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(295, '418532836', '', 'ÐÐ±Ð´ÑƒÐ»Ð°Ð·Ð¸Ð· ', '1521097005', 'uz', '0', 'https://telegram.me/OnZBot?start=418532836', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(296, '368023571', '', 'Komilxon +998943060498', '1521097959', 'uz', '0', 'https://telegram.me/OnZBot?start=368023571', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(297, '347371768', 'Afruz_07', 'Dilafruz Tohirboyeva', '1521098005', 'uz', '0', 'https://telegram.me/OnZBot?start=347371768', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(298, '294473991', 'Uz_invest', 'ðŸ’²Uzb InvestorðŸ’²', '1521098312', 'uz', '1', 'https://telegram.me/OnZBot?start=294473991', '0', '0.3', '0', '0', '0.3', '0', '0', '0', '0', '+5'),
(299, '300623263', 'onlinemagazin1', 'Online_magazin ', '1521098572', 'uz', '0', 'https://telegram.me/OnZBot?start=300623263', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(300, '486785452', 'UZB_CRIPTA', 'Investor ', '1521098768', 'uz', '0', 'https://telegram.me/OnZBot?start=486785452', '0', '0.6', '2', '0.6', '0', '0', '0', '0', '0', '+5'),
(301, '404512151', 'Neo_007', 'D.d.d ', '1521098867', 'uz', '3', 'https://telegram.me/OnZBot?start=404512151', '0', '1.8', '3', '0.9', '0.9', '0', '0', '0', '0', '+5'),
(302, '373210045', 'DilshodPanda', 'Ð”Ð¸Ð»ÑˆÐ¾Ð´ Ð”Ð¶ÑƒÑ€Ð°ÐµÐ²', '1521099120', 'uz', '0', 'https://telegram.me/OnZBot?start=373210045', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(303, '191326783', '', 'Dilya Naryan Mar', '1521099625', 'uz', '0', 'https://telegram.me/OnZBot?start=191326783', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(304, '527976813', 'Xdanuz', 'é¦™ é¾™', '1521099825', 'uz', '0', 'https://telegram.me/OnZBot?start=527976813', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(305, '312294751', 'Svetlana_Ovchinnikova', 'Ð¡Ð²ÐµÑ‚Ð»Ð°Ð½Ð° ÐžÐ²Ñ‡Ð¸Ð½Ð½Ð¸ÐºÐ¾Ð²Ð°', '1521100794', 'uz', '1', 'https://telegram.me/OnZBot?start=312294751', '0', '0.3', '0', '0', '0.3', '0', '0', '0', '0', '+5'),
(306, '277368870', '', 'Shyhnazar Nuriyev', '1521100804', 'uz', '0', 'https://telegram.me/OnZBot?start=277368870', '0', '0.6', '2', '0.6', '0', '0', '0', '0', '0', '+5'),
(307, '497205634', 'Svetlaya_777', 'Ð¡Ð¾Ñ„Ð¸Ñ Ð¡ÐµÑ€Ð³ÐµÐµÐ²Ð½Ð°', '1521101318', 'uz', '0', 'https://telegram.me/OnZBot?start=497205634', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(308, '392960861', '', 'TRI xXx ', '1521101958', 'uz', '0', 'https://telegram.me/OnZBot?start=392960861', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(309, '48233315', 'sobir077', 'online ', '1521103114', 'uz', '0', 'https://telegram.me/OnZBot?start=48233315', '0', '0.6', '2', '0.6', '0', '0', '0', '0', '0', '+5'),
(310, '488952842', 'Xdonuzdd', 'ä¹” é¹é¹', '1521103257', 'uz', '0', 'https://telegram.me/OnZBot?start=488952842', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(311, '540444455', 'TvZorHD', 'Billioner ', '1521104091', 'uz', '0', 'https://telegram.me/OnZBot?start=540444455', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(312, '342539950', '', 'Ðbduraximova SH......', '1521104192', 'uz', '0', 'https://telegram.me/OnZBot?start=342539950', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(313, '278235944', 'MANSURBEK_9350', 'Duschanov Mansurbek', '1521105883', 'uz', '4', 'https://telegram.me/OnZBot?start=278235944', '0', '2.4', '4', '1.2', '1.2', '0', '0', '0', '0', '+5'),
(314, '567265604', 'Sherbek_ali', 'Sherbek Shamurodov', '1521105979', 'uz', '0', 'https://telegram.me/OnZBot?start=567265604', '0', '1.2', '4', '1.2', '0', '0', '0', '0', '0', '+5'),
(315, '386419770', '', 'Xusinboy Berdimuradov', '1521106168', 'uz', '0', 'https://telegram.me/OnZBot?start=386419770', '0', '0.6', '2', '0.6', '0', '0', '0', '0', '0', '+5'),
(316, '205751361', '', 'O.N ', '1521106246', 'uz', '0', 'https://telegram.me/OnZBot?start=205751361', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(317, '539420529', 'Free_intelect', 'D.D.D ', '1521106352', 'uz', '0', 'https://telegram.me/OnZBot?start=539420529', '0', '0.3', '1', '0.3', '0', '0', '0', '0', '0', '+5'),
(318, '376339537', 'Uzbektigrr', 'Uzbek Tiger', '1521106805', 'uz', '0', 'https://telegram.me/OnZBot?start=376339537', '0', '0.6', '2', '0.6', '0', '0', '0', '0', '0', '+5'),
(319, '486333847', 'Adikkayipnazarov', 'ÐÐ±Ð´ÑƒÑ€Ð°Ñ…Ð¼Ð°Ð½ ', '1521108520', 'uz', '0', 'https://telegram.me/OnZBot?start=486333847', '0', '0.6', '2', '0.6', '0', '0', '0', '0', '0', '+5'),
(320, '144069121', 'SherShoX99', 'ðŸ˜ŽSheRShoXðŸ‘‘ ', '1521108748', 'uz', '0', 'https://telegram.me/OnZBot?start=144069121', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(321, '192804697', 'Sardobekuzb', 'Sardorbek ', '1521109344', 'uz', '0', 'https://telegram.me/OnZBot?start=192804697', '0', '0.6', '2', '0.6', '0', '0', '0', '0', '0', '+5'),
(322, '557353204', 'Its_durov', 'ç²¤ æ ', '1521111096', 'uz', '0', 'https://telegram.me/OnZBot?start=557353204', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(323, '479484993', 'uzbooooommm', 'UZBOOM ', '1521111268', 'uz', '0', 'https://telegram.me/OnZBot?start=479484993', '0', '0.6', '2', '0.6', '0', '0', '0', '0', '0', '+5'),
(324, '261819415', '', 'Ð¨Ð°Ñ…Ð½Ð¾Ð· ', '1521111667', 'uz', '0', 'https://telegram.me/OnZBot?start=261819415', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(325, '416815347', '', 'Shahi ', '1521111839', 'uz', '0', 'https://telegram.me/OnZBot?start=416815347', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(326, '473278089', 'Makkkarofff', 'Makkaroffffff ', '1521111934', 'uz', '0', 'https://telegram.me/OnZBot?start=473278089', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(327, '461818805', 'Krutoyking', 'Urra ', '1521113439', 'uz', '0', 'https://telegram.me/OnZBot?start=461818805', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(328, '494730290', 'M_i_l_l_i_o_n_e_r', 'MÎ¹Î»Î»Î¹ÏƒÎ·Îµr ðŸ‘‘ ', '1521115134', 'uz', '0', 'https://telegram.me/OnZBot?start=494730290', '0', '0.9', '3', '0.9', '0', '0', '0', '0', '0', '+5'),
(329, '296507231', 'D9300', 'D & S ', '1521115643', 'uz', '0', 'https://telegram.me/OnZBot?start=296507231', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(330, '538028665', '', 'Fazliddin Arziqulov', '1521115802', 'uz', '0', 'https://telegram.me/OnZBot?start=538028665', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(331, '260238318', '', 'ðŸ‘‘ ', '1521116084', 'uz', '0', 'https://telegram.me/OnZBot?start=260238318', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(332, '480791397', '', 'âœ® ã€‡É´ÊŸÊ ã„—Ê€ÉªÉ´Ï‚Îµ âœ® ', '1521117379', 'uz', '0', 'https://telegram.me/OnZBot?start=480791397', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(333, '552657390', 'Xronuzss', 'ghj egh', '1521118137', 'uz', '0', 'https://telegram.me/OnZBot?start=552657390', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(334, '449992129', 'Matimatik2001', 'Suleymanova InwaAllah Studentka TATU 2019', '1521118691', 'uz', '0', 'https://telegram.me/OnZBot?start=449992129', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(335, '350266936', 'No_namie', 'Å‹o ÛµÅ‹ï¾‘mÎµ', '1521119146', 'uz', '0', 'https://telegram.me/OnZBot?start=350266936', '0', '0.3', '1', '0.3', '0', '0', '0', '0', '0', '+5'),
(336, '497544097', 'Eldorbe', 'Eldorbek ', '1521119459', 'uz', '0', 'https://telegram.me/OnZBot?start=497544097', '0', '0.9', '3', '0.9', '0', '0', '0', '0', '0', '+5'),
(337, '217182374', 'Vlad_De', 'Mr. Vlad ', '1521119918', 'uz', '0', 'https://telegram.me/OnZBot?start=217182374', '0', '0.3', '1', '0.3', '0', '0', '0', '0', '0', '+5'),
(338, '560343963', 'Dogemoney', 'çˆ± è”š', '1521120470', 'uz', '0', 'https://telegram.me/OnZBot?start=560343963', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(339, '474764762', 'QaLbiMdaQoL', 'Ã±á»¡Ä‘ÎÅ™ðŸ‘‘ ', '1521120951', 'uz', '0', 'https://telegram.me/OnZBot?start=474764762', '0', '0.6', '2', '0.6', '0', '0', '0', '0', '0', '+5'),
(340, '448866126', 'iranetpersian', 'Ð¢Ð¸Ð³Ñ€Ð°Ð½ Ð¥ÑƒÑÐµÐ½Ð¾Ð²Ð¸Ñ‡', '1521121055', 'uz', '0', 'https://telegram.me/OnZBot?start=448866126', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(341, '556640255', 'Yeshoku', 'Yesho ', '1521122427', 'uz', '0', 'https://telegram.me/OnZBot?start=556640255', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(342, '544035386', 'Mind_invesbot', 'Ð”ÐµÐ½Ð¸Ñ ', '1521122487', 'uz', '0', 'https://telegram.me/OnZBot?start=544035386', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(343, '557315067', '', 'Qodirov Davron', '1521124814', 'uz', '0', 'https://telegram.me/OnZBot?start=557315067', '0', '0.9', '3', '0.9', '0', '0', '0', '0', '0', '+5'),
(344, '347755350', 'Rudolpg', 'Rudolph ', '1521124849', 'uz', '0', 'https://telegram.me/OnZBot?start=347755350', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(345, '438179432', '', '904287251 ', '1521125120', 'uz', '0', 'https://telegram.me/OnZBot?start=438179432', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(346, '281993978', 'DEXPEE', 'SAMSUNG ', '1521125787', 'uz', '0', 'https://telegram.me/OnZBot?start=281993978', '0', '0.9', '3', '0.9', '0', '0', '0', '0', '0', '+5'),
(347, '385089454', 'BuxarskiyLion', 'M ', '1521126216', 'uz', '15', 'https://telegram.me/OnZBot?start=385089454', '0', '0.4', '3', '0.9', '4.5', '0', '0', '5', '0', '+5'),
(348, '38234205', 'Lion_Manager', 'Lion Manager ', '1521126295', 'uz', '0', 'https://telegram.me/OnZBot?start=38234205', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(349, '429922714', 'Hammew_dapew', 'Arabik â™§ ', '1521126605', 'uz', '0', 'https://telegram.me/OnZBot?start=429922714', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(350, '107831530', 'HayoTDapeW', 'Î²ÑÎµÐ³Î”Î± Î¸Î·Î»Î¹Î·Îµ â„¢ ', '1521126643', 'uz', '0', 'https://telegram.me/OnZBot?start=107831530', '0', '0.9', '3', '0.9', '0', '0', '0', '0', '0', '+5'),
(351, '373644198', 'NurStar', 'NurStar ', '1521126673', 'uz', '0', 'https://telegram.me/OnZBot?start=373644198', '0', '0.9', '3', '0.9', '0', '0', '0', '0', '0', '+5'),
(352, '389603327', 'Sirojbeeek98', 'Sirojbek ', '1521126694', 'uz', '0', 'https://telegram.me/OnZBot?start=389603327', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(353, '547589891', '', 'Abdulloh ', '1521126756', 'uz', '0', 'https://telegram.me/OnZBot?start=547589891', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(354, '484217704', 'mdamcom', 'ÏÎµÎ±Î»Ï…Ï‚Ï„ ÏƒÏ€Ï„Ï…Ð¼Ï…Ï‚Ï„ Ð½Ïƒ Ð½Î¾ Î¾Ð³ÏƒÏ…Ï‚Ï„ ', '1521126853', 'uz', '0', 'https://telegram.me/OnZBot?start=484217704', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(355, '536792626', 'advance77777', 'ðŸ€_Murodillo_ðŸŒ´ ', '1521127155', 'uz', '0', 'https://telegram.me/OnZBot?start=536792626', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(356, '293940656', 'Noonooonoooo', 'Mr.Mirjalol ', '1521127157', 'uz', '0', 'https://telegram.me/OnZBot?start=293940656', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(357, '262725938', 'NEWCITYUZ_ADM', 'ðŸ–¤Smoke Magic [ á´Ê€É¢ÉªÉ´á´€ÊŸ á´˜Ê€á´Ò“ÉªÊŸ ] ', '1521127283', 'uz', '0', 'https://telegram.me/OnZBot?start=262725938', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(358, '359931197', 'Fortunate5', 'Vilmax trader ', '1521127291', 'uz', '0', 'https://telegram.me/OnZBot?start=359931197', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(359, '455141744', 'the_best_boy_N1', 'izzat ', '1521127318', 'uz', '0', 'https://telegram.me/OnZBot?start=455141744', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(360, '442268472', 'Sanatbek93', 'SanKa ', '1521127408', 'uz', '0', 'https://telegram.me/OnZBot?start=442268472', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(361, '523177496', 'Xdonuz', 'Xdonuz ', '1521127576', 'uz', '0', 'https://telegram.me/OnZBot?start=523177496', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(362, '478502178', 'internetzarabotok0', 'B.i.n.a.r.y O.p.t.i.o.n', '1521127583', 'uz', '0', 'https://telegram.me/OnZBot?start=478502178', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(363, '311352670', '', 'JA$UR KUNNAEV', '1521127699', 'uz', '0', 'https://telegram.me/OnZBot?start=311352670', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(364, '534085808', 'Tura_Ergashev', 'T U R A ', '1521127706', 'uz', '0', 'https://telegram.me/OnZBot?start=534085808', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(365, '132299243', 'TheNotarius_MMA', 'Misha ', '1521127834', 'uz', '0', 'https://telegram.me/OnZBot?start=132299243', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5'),
(366, '535424832', 'Vodiy_sadosi_officel', 'ðŸŽ¶Vodiy SadosiðŸŽ¶ (admin)', '1521127858', 'uz', '0', 'https://telegram.me/OnZBot?start=535424832', '0', '0.9', '3', '0.9', '0', '0', '0', '0', '0', '+5'),
(367, '384452830', '', 'werzod ', '1521128035', 'uz', '0', 'https://telegram.me/OnZBot?start=384452830', '0', '0', '0', '0', '0', '0', '0', '0', '0', '+5');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
