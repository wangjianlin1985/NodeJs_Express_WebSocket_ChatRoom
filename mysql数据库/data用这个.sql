/*
 Navicat Premium Data Transfer

 Source Server         : mysql8.0
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : data

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 24/11/2022 15:50:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for groups
-- ----------------------------
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups`  (
  `id` bigint(20) NOT NULL DEFAULT 0,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '群聊',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of groups
-- ----------------------------
INSERT INTO `groups` VALUES (1649682319491, 'test');
INSERT INTO `groups` VALUES (1669218865490, '大学校园');

-- ----------------------------
-- Table structure for history
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL DEFAULT 0,
  `sender` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0',
  `receiver` json NOT NULL,
  `value` json NOT NULL,
  `time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of history
-- ----------------------------
INSERT INTO `history` VALUES (1, 100, '1111', '{\"id\": \"2222\", \"group\": false}', '{\"content\": \"你好，用户2\", \"filename\": \"\"}', '2022-04-11 22:24:00');
INSERT INTO `history` VALUES (2, 100, '2222', '{\"id\": \"1111\", \"group\": false}', '{\"content\": \"你好，用户1\", \"filename\": \"\"}', '2022-04-11 22:25:00');
INSERT INTO `history` VALUES (3, 30, '1111', '{\"id\": \"2222\", \"group\": false}', '{\"content\": \"http://localhost:4000/public/images/1649687123242.jpeg\", \"filename\": \"1649687123242.jpeg\"}', '2022-04-11 22:25:00');
INSERT INTO `history` VALUES (4, 40, '2222', '{\"id\": \"1111\", \"group\": false}', '{\"content\": \"http://localhost:4000/public/files/头像.jpg\", \"filename\": \"头像.jpg\"}', '2022-04-11 22:25:00');
INSERT INTO `history` VALUES (5, 100, '1111', '{\"id\": 1649682319491, \"group\": true}', '{\"content\": \"有人吗？\", \"filename\": \"\"}', '2022-04-11 22:25:00');
INSERT INTO `history` VALUES (6, 100, '2222', '{\"id\": 1649682319491, \"group\": true}', '{\"content\": \"没有\", \"filename\": \"\"}', '2022-04-11 22:25:00');
INSERT INTO `history` VALUES (7, 100, '1111', '{\"id\": 1649682319491, \"group\": true}', '{\"content\": \"那你是谁\", \"filename\": \"\"}', '2022-04-11 22:26:00');
INSERT INTO `history` VALUES (8, 100, '2222', '{\"id\": 1649682319491, \"group\": true}', '{\"content\": \"不知道\", \"filename\": \"\"}', '2022-04-11 22:26:00');
INSERT INTO `history` VALUES (9, 30, '1111', '{\"id\": 1649682319491, \"group\": true}', '{\"content\": \"http://localhost:4000/public/images/1649687178085.jpeg\", \"filename\": \"1649687178085.jpeg\"}', '2022-04-11 22:26:00');
INSERT INTO `history` VALUES (10, 100, '1111', '{\"id\": 1649682319491, \"group\": true}', '{\"content\": \"测试😁\", \"filename\": \"\"}', '2022-04-11 23:31:00');
INSERT INTO `history` VALUES (11, 100, '1111', '{\"id\": 1649682319491, \"group\": true}', '{\"content\": \"测试1😛\", \"filename\": \"\"}', '2022-04-11 23:34:00');
INSERT INTO `history` VALUES (12, 100, '1111', '{\"id\": 1649682319491, \"group\": true}', '{\"content\": \"测试😋\", \"filename\": \"\"}', '2022-04-11 23:36:00');
INSERT INTO `history` VALUES (13, 100, '1111', '{\"id\": 1649682319491, \"group\": true}', '{\"content\": \"测试😋\", \"filename\": \"\"}', '2022-04-11 23:37:00');
INSERT INTO `history` VALUES (14, 100, '1111', '{\"id\": 1669218865490, \"group\": true}', '{\"content\": \"你好啊 有人在吗？\", \"filename\": \"\"}', '2022-11-23 23:54:00');
INSERT INTO `history` VALUES (15, 100, '1111', '{\"id\": 1669218865490, \"group\": true}', '{\"content\": \"😙😙\", \"filename\": \"\"}', '2022-11-23 23:54:00');
INSERT INTO `history` VALUES (16, 100, '2222', '{\"id\": 1669218865490, \"group\": true}', '{\"content\": \"我来了哈哈\", \"filename\": \"\"}', '2022-11-23 23:56:00');
INSERT INTO `history` VALUES (17, 100, '1111', '{\"id\": 1669218865490, \"group\": true}', '{\"content\": \"嗯嗯欢迎\", \"filename\": \"\"}', '2022-11-23 23:56:00');
INSERT INTO `history` VALUES (18, 100, '1111', '{\"id\": 1669218865490, \"group\": true}', '{\"content\": \"🤡🤠\", \"filename\": \"\"}', '2022-11-23 23:56:00');
INSERT INTO `history` VALUES (19, 100, '1111', '{\"id\": 1669218865490, \"group\": true}', '{\"content\": \"你好啊 有人在吗？\", \"filename\": \"\"}', '2022-11-23 23:56:00');
INSERT INTO `history` VALUES (20, 40, '2222', '{\"id\": 1669218865490, \"group\": true}', '{\"content\": \"http://localhost:4000/public/files/【必看机密】最新版文档修改秘籍.doc\", \"filename\": \"【必看机密】最新版文档修改秘籍.doc\"}', '2022-11-23 23:56:00');
INSERT INTO `history` VALUES (21, 100, '1111', '{\"id\": 1669218865490, \"group\": true}', '{\"content\": \"😙😙\", \"filename\": \"\"}', '2022-11-23 23:56:00');
INSERT INTO `history` VALUES (22, 30, '1111', '{\"id\": 1669218865490, \"group\": true}', '{\"content\": \"http://localhost:4000/public/images/1669219027106.jpeg\", \"filename\": \"1669219027106.jpeg\"}', '2022-11-23 23:57:00');
INSERT INTO `history` VALUES (23, 100, '1111', '{\"id\": 1669218865490, \"group\": true}', '{\"content\": \"1111\", \"filename\": \"\"}', '2022-11-24 00:04:00');
INSERT INTO `history` VALUES (24, 100, '2222', '{\"id\": \"1111\", \"group\": false}', '{\"content\": \"私聊哈哈\", \"filename\": \"\"}', '2022-11-24 00:04:00');
INSERT INTO `history` VALUES (25, 100, '1111', '{\"id\": \"2222\", \"group\": false}', '{\"content\": \"你好啊 我是用户1\", \"filename\": \"\"}', '2022-11-24 15:35:00');
INSERT INTO `history` VALUES (26, 100, '2222', '{\"id\": \"1111\", \"group\": false}', '{\"content\": \"你好，我是用户2😋🤡\", \"filename\": \"\"}', '2022-11-24 15:36:00');
INSERT INTO `history` VALUES (27, 100, '1111', '{\"id\": \"2222\", \"group\": false}', '{\"content\": \"你好，这是我的照片，我漂亮吧？\", \"filename\": \"\"}', '2022-11-24 15:37:00');
INSERT INTO `history` VALUES (28, 100, '1111', '{\"id\": \"2222\", \"group\": false}', '{\"content\": \"你好啊 我是用户1\", \"filename\": \"\"}', '2022-11-24 15:37:00');
INSERT INTO `history` VALUES (29, 30, '1111', '{\"id\": \"2222\", \"group\": false}', '{\"content\": \"http://localhost:4000/public/images/1669275452868.jpeg\", \"filename\": \"1669275452868.jpeg\"}', '2022-11-24 15:37:00');
INSERT INTO `history` VALUES (30, 100, '2222', '{\"id\": \"1111\", \"group\": false}', '{\"content\": \"挺漂亮的，我给你发个文件测试下哈哈！\", \"filename\": \"\"}', '2022-11-24 15:37:00');
INSERT INTO `history` VALUES (31, 40, '2222', '{\"id\": \"1111\", \"group\": false}', '{\"content\": \"http://localhost:4000/public/files/biancheng.doc\", \"filename\": \"biancheng.doc\"}', '2022-11-24 15:38:00');
INSERT INTO `history` VALUES (32, 100, '2222', '{\"id\": \"1111\", \"group\": false}', '{\"content\": \"你好，我是用户2😋🤡\", \"filename\": \"\"}', '2022-11-24 15:38:00');
INSERT INTO `history` VALUES (33, 100, '1111', '{\"id\": \"2222\", \"group\": false}', '{\"content\": \"你好，这是我的照片，我漂亮吧？\", \"filename\": \"\"}', '2022-11-24 15:39:00');
INSERT INTO `history` VALUES (34, 100, '1111', '{\"id\": \"2222\", \"group\": false}', '{\"content\": \"你好啊 我是用户1\", \"filename\": \"\"}', '2022-11-24 15:39:00');
INSERT INTO `history` VALUES (35, 100, '2222', '{\"id\": \"1111\", \"group\": false}', '{\"content\": \"收到了吗？\", \"filename\": \"\"}', '2022-11-24 15:39:00');
INSERT INTO `history` VALUES (36, 30, '1111', '{\"id\": \"2222\", \"group\": false}', '{\"content\": \"http://localhost:4000/public/images/1669275452868.jpeg\", \"filename\": \"1669275452868.jpeg\"}', '2022-11-24 15:39:00');
INSERT INTO `history` VALUES (37, 100, '2222', '{\"id\": \"1111\", \"group\": false}', '{\"content\": \"挺漂亮的，我给你发个文件测试下哈哈！\", \"filename\": \"\"}', '2022-11-24 15:39:00');
INSERT INTO `history` VALUES (38, 100, '1111', '{\"id\": \"2222\", \"group\": false}', '{\"content\": \"嗯  不错 很好的聊天系统哈\", \"filename\": \"\"}', '2022-11-24 15:40:00');
INSERT INTO `history` VALUES (39, 40, '2222', '{\"id\": \"1111\", \"group\": false}', '{\"content\": \"http://localhost:4000/public/files/biancheng.doc\", \"filename\": \"biancheng.doc\"}', '2022-11-24 15:40:00');
INSERT INTO `history` VALUES (40, 100, '2222', '{\"id\": \"1111\", \"group\": false}', '{\"content\": \"你好，我是用户2😋🤡\", \"filename\": \"\"}', '2022-11-24 15:40:00');
INSERT INTO `history` VALUES (41, 100, '2222', '{\"id\": \"1111\", \"group\": false}', '{\"content\": \"收到了吗？\", \"filename\": \"\"}', '2022-11-24 15:41:00');
INSERT INTO `history` VALUES (42, 100, '1111', '{\"id\": \"2222\", \"group\": false}', '{\"content\": \"嗯  不错 很好的聊天系统哈\", \"filename\": \"\"}', '2022-11-24 15:42:00');
INSERT INTO `history` VALUES (43, 100, '1111', '{\"id\": \"2222\", \"group\": false}', '{\"content\": \"哈哈 我们也可以在这个房间里面多人群聊哦\", \"filename\": \"\"}', '2022-11-24 15:44:00');
INSERT INTO `history` VALUES (44, 100, '1111', '{\"id\": \"2222\", \"group\": false}', '{\"content\": \"你们2个人都收到了吗？\", \"filename\": \"\"}', '2022-11-24 15:44:00');
INSERT INTO `history` VALUES (45, 100, '1111', '{\"id\": \"2222\", \"group\": false}', '{\"content\": \"😅😇\", \"filename\": \"\"}', '2022-11-24 15:44:00');
INSERT INTO `history` VALUES (46, 100, '3333', '{\"id\": 1669218865490, \"group\": true}', '{\"content\": \"你好 我来了！\", \"filename\": \"\"}', '2022-11-24 15:45:00');
INSERT INTO `history` VALUES (47, 100, '1111', '{\"id\": \"2222\", \"group\": false}', '{\"content\": \"哈哈 我们也可以在这个房间里面多人群聊哦\", \"filename\": \"\"}', '2022-11-24 15:46:00');
INSERT INTO `history` VALUES (48, 100, '1111', '{\"id\": 1669218865490, \"group\": true}', '{\"content\": \"嗯 这里是多人群聊房间 哈哈 😊\", \"filename\": \"\"}', '2022-11-24 15:46:00');
INSERT INTO `history` VALUES (49, 100, '1111', '{\"id\": \"2222\", \"group\": false}', '{\"content\": \"你们2个人都收到了吗？\", \"filename\": \"\"}', '2022-11-24 15:46:00');
INSERT INTO `history` VALUES (50, 100, '1111', '{\"id\": \"2222\", \"group\": false}', '{\"content\": \"😅😇\", \"filename\": \"\"}', '2022-11-24 15:46:00');
INSERT INTO `history` VALUES (51, 100, '2222', '{\"id\": 1669218865490, \"group\": true}', '{\"content\": \"嗯 你们2个人发的信息我都看见了 哈哈\", \"filename\": \"\"}', '2022-11-24 15:46:00');
INSERT INTO `history` VALUES (52, 40, '1111', '{\"id\": 1669218865490, \"group\": true}', '{\"content\": \"http://localhost:4000/public/files/xiangshui.jpg\", \"filename\": \"xiangshui.jpg\"}', '2022-11-24 15:46:00');
INSERT INTO `history` VALUES (53, 30, '1111', '{\"id\": 1669218865490, \"group\": true}', '{\"content\": \"http://localhost:4000/public/images/1669276025126.jpeg\", \"filename\": \"1669276025126.jpeg\"}', '2022-11-24 15:47:00');
INSERT INTO `history` VALUES (54, 100, '3333', '{\"id\": 1669218865490, \"group\": true}', '{\"content\": \"你好 我来了！\", \"filename\": \"\"}', '2022-11-24 15:47:00');
INSERT INTO `history` VALUES (55, 100, '1111', '{\"id\": \"2222\", \"group\": false}', '{\"content\": \"哈哈 我们也可以在这个房间里面多人群聊哦\", \"filename\": \"\"}', '2022-11-24 15:48:00');
INSERT INTO `history` VALUES (56, 100, '1111', '{\"id\": 1669218865490, \"group\": true}', '{\"content\": \"嗯 这里是多人群聊房间 哈哈 😊\", \"filename\": \"\"}', '2022-11-24 15:48:00');
INSERT INTO `history` VALUES (57, 100, '1111', '{\"id\": \"2222\", \"group\": false}', '{\"content\": \"你们2个人都收到了吗？\", \"filename\": \"\"}', '2022-11-24 15:48:00');
INSERT INTO `history` VALUES (58, 100, '1111', '{\"id\": 1669218865490, \"group\": true}', '{\"content\": \"嗯嗯 多人群聊也可以发表情 图片 文件哈！\", \"filename\": \"\"}', '2022-11-24 15:48:00');
INSERT INTO `history` VALUES (59, 100, '2222', '{\"id\": 1669218865490, \"group\": true}', '{\"content\": \"嗯 你们2个人发的信息我都看见了 哈哈\", \"filename\": \"\"}', '2022-11-24 15:48:00');
INSERT INTO `history` VALUES (60, 40, '1111', '{\"id\": 1669218865490, \"group\": true}', '{\"content\": \"http://localhost:4000/public/files/xiangshui.jpg\", \"filename\": \"xiangshui.jpg\"}', '2022-11-24 15:48:00');
INSERT INTO `history` VALUES (61, 30, '1111', '{\"id\": 1669218865490, \"group\": true}', '{\"content\": \"http://localhost:4000/public/images/1669276025126.jpeg\", \"filename\": \"1669276025126.jpeg\"}', '2022-11-24 15:49:00');
INSERT INTO `history` VALUES (62, 100, '1111', '{\"id\": \"2222\", \"group\": false}', '{\"content\": \"哈哈 我们也可以在这个房间里面多人群聊哦\", \"filename\": \"\"}', '2022-11-24 15:50:00');
INSERT INTO `history` VALUES (63, 100, '1111', '{\"id\": 1669218865490, \"group\": true}', '{\"content\": \"嗯 这里是多人群聊房间 哈哈 😊\", \"filename\": \"\"}', '2022-11-24 15:50:00');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nc` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1111', '1111', 1, '用户1');
INSERT INTO `user` VALUES ('2222', '2222', 2, '用户2');
INSERT INTO `user` VALUES ('3333', '3333', 3, '用户3');

SET FOREIGN_KEY_CHECKS = 1;
