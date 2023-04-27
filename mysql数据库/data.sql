-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        8.0.28 - MySQL Community Server - GPL
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- 导出 data 的数据库结构
CREATE DATABASE IF NOT EXISTS `data` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `data`;

-- 导出  表 data.groups 结构
CREATE TABLE IF NOT EXISTS `groups` (
  `id` bigint NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL DEFAULT '群聊',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在导出表  data.groups 的数据：~0 rows (大约)
DELETE FROM `groups`;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` (`id`, `name`) VALUES
	(1649682319491, 'test');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;

-- 导出  表 data.history 结构
CREATE TABLE IF NOT EXISTS `history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` tinyint NOT NULL DEFAULT '0',
  `sender` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0',
  `receiver` json NOT NULL,
  `value` json NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT;

-- 正在导出表  data.history 的数据：~9 rows (大约)
DELETE FROM `history`;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` (`id`, `type`, `sender`, `receiver`, `value`, `time`) VALUES
	(1, 100, '1111', '{"id": "2222", "group": false}', '{"content": "你好，用户2", "filename": ""}', '2022-04-11 22:24:00'),
	(2, 100, '2222', '{"id": "1111", "group": false}', '{"content": "你好，用户1", "filename": ""}', '2022-04-11 22:25:00'),
	(3, 30, '1111', '{"id": "2222", "group": false}', '{"content": "http://localhost:4000/public/images/1649687123242.jpeg", "filename": "1649687123242.jpeg"}', '2022-04-11 22:25:00'),
	(4, 40, '2222', '{"id": "1111", "group": false}', '{"content": "http://localhost:4000/public/files/头像.jpg", "filename": "头像.jpg"}', '2022-04-11 22:25:00'),
	(5, 100, '1111', '{"id": 1649682319491, "group": true}', '{"content": "有人吗？", "filename": ""}', '2022-04-11 22:25:00'),
	(6, 100, '2222', '{"id": 1649682319491, "group": true}', '{"content": "没有", "filename": ""}', '2022-04-11 22:25:00'),
	(7, 100, '1111', '{"id": 1649682319491, "group": true}', '{"content": "那你是谁", "filename": ""}', '2022-04-11 22:26:00'),
	(8, 100, '2222', '{"id": 1649682319491, "group": true}', '{"content": "不知道", "filename": ""}', '2022-04-11 22:26:00'),
	(9, 30, '1111', '{"id": 1649682319491, "group": true}', '{"content": "http://localhost:4000/public/images/1649687178085.jpeg", "filename": "1649687178085.jpeg"}', '2022-04-11 22:26:00'),
	(10, 100, '1111', '{"id": 1649682319491, "group": true}', '{"content": "测试😁", "filename": ""}', '2022-04-11 23:31:00'),
	(11, 100, '1111', '{"id": 1649682319491, "group": true}', '{"content": "测试1😛", "filename": ""}', '2022-04-11 23:34:00'),
	(12, 100, '1111', '{"id": 1649682319491, "group": true}', '{"content": "测试😋", "filename": ""}', '2022-04-11 23:36:00'),
	(13, 100, '1111', '{"id": 1649682319491, "group": true}', '{"content": "测试😋", "filename": ""}', '2022-04-11 23:37:00');
/*!40000 ALTER TABLE `history` ENABLE KEYS */;

-- 导出  表 data.user 结构
CREATE TABLE IF NOT EXISTS `user` (
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `nc` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT;

-- 正在导出表  data.user 的数据：~3 rows (大约)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`username`, `password`, `id`, `nc`) VALUES
	('1111', '1111', 1, '用户1'),
	('2222', '2222', 2, '用户2'),
	('3333', '3333', 3, '用户3');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
