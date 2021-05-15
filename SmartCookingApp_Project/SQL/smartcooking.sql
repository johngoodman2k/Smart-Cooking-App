/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 100417
 Source Host           : localhost:3306
 Source Schema         : smartcooking

 Target Server Type    : MySQL
 Target Server Version : 100417
 File Encoding         : 65001

 Date: 15/05/2021 14:29:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `parentCat` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'Món ngon mỗi ngày', NULL);
INSERT INTO `category` VALUES (2, 'Món ngon diệp lễ', NULL);
INSERT INTO `category` VALUES (3, 'Món ngon đãi khách', NULL);
INSERT INTO `category` VALUES (4, 'Món ngon cho bé', NULL);
INSERT INTO `category` VALUES (5, 'Đồ uống', NULL);
INSERT INTO `category` VALUES (6, 'Món ngon ăn sáng', 1);
INSERT INTO `category` VALUES (7, 'Món ngon ăn trưa', 1);
INSERT INTO `category` VALUES (8, 'Món ngon ăn chiều', 1);
INSERT INTO `category` VALUES (9, 'Món ngon ăn tối', 1);
INSERT INTO `category` VALUES (10, 'Món ngon ngày tết', 2);
INSERT INTO `category` VALUES (11, 'Món ngon ngày lễ', 2);
INSERT INTO `category` VALUES (12, 'Món ngon đãi khách diệp đám tiệc', 3);
INSERT INTO `category` VALUES (13, 'Món ngon đãi khách ở nhà', 3);
INSERT INTO `category` VALUES (14, 'Cháo ngon cho trẻ', 4);
INSERT INTO `category` VALUES (15, 'Món ngon giàu dinh dưỡng', 4);
INSERT INTO `category` VALUES (16, 'Đồ uống pha chế', 5);
INSERT INTO `category` VALUES (17, 'Đồ uống có gas', 5);
INSERT INTO `category` VALUES (18, 'Đồ uống bổ sung', 5);

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `postname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `TinyDes` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `FullDes` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `catID` int NOT NULL,
  `userID` int NOT NULL,
  `updateDate` date NOT NULL,
  `enable` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES (1, '1', 'i love u', 'ádasdasdas', 7, 2, '2021-05-15', 'true');
INSERT INTO `post` VALUES (3, 'abc', 'abc', '', 6, 2, '2021-05-15', 'true');
INSERT INTO `post` VALUES (4, '1', '1', '<p>1</p>', 6, 2, '2021-05-15', 'true');
INSERT INTO `post` VALUES (5, '1', '1', '<p>11</p>', 6, 2, '2021-05-15', 'true');
INSERT INTO `post` VALUES (6, '1', '1', '<p>1</p>', 6, 2, '2021-05-15', 'true');
INSERT INTO `post` VALUES (7, '2', '2', '<p>2</p>', 6, 2, '2021-05-15', 'true');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dob` date NOT NULL,
  `office` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `enable` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'khang', '$12$AaDVSEQ8JLyPN74BO30srOByMta2UhLueGuN5Ej/T1d813GrWVJaa', 'khangkid', 'khangkid1234dd@gmail.com', '2021-04-01', 'user', 'true');
INSERT INTO `users` VALUES (2, 'khangkid123', '$2a$12$4gjb2KhYbj3EblKXEaPQZehNqckByhD9EVY3D5ldyXVwUd.ewdG2i', 'khanghehe', 'khangkid1234dd@gmail.com', '2021-01-14', 'user', 'true');
INSERT INTO `users` VALUES (3, 'admin', '$2a$12$b1NItyNrmq2Rf4xef.jEzuBDYn9d14yR1GjnTgkGg14vxWuFEqyxO', 'Admin', 'Admin@gmail.com', '2000-01-01', 'admin', 'true');
INSERT INTO `users` VALUES (4, 'khang1', '$2a$12$7.uOzJSIEpcdlnb4a.At5epcOPmY.ByG.gY7LvI3Dl8pJg71RpWZi', 'KhangDang', 'Admin@gmail.com', '2000-01-01', 'user', 'true');
INSERT INTO `users` VALUES (5, 'user1', '$2a$12$YqHdYlpx6mln1VdOEuEU4uPYkktfExee24P/AkjwdJm8gLaMhfVEG', 'user1', 'user@gmail.com', '2021-04-29', 'user', 'true');
INSERT INTO `users` VALUES (7, 'manloxocung', '$2a$12$.ss7mtPrRND/r/YUprjVZeYTkTF9/yswXsPWxb3YVFrfFhVcpkLGm', '', 'man1234dd@gmail.com', '2021-04-26', 'user', 'true');
INSERT INTO `users` VALUES (8, 'khangkid1234', '$2a$12$N3xmruMkOZUQWJUeh3AZluClKZKhZAlwjtD9ynEUNi.S9GP/dAUjC', 'KhangDang', 'khangkid1234@gmail.com', '2021-05-09', 'user', 'true');
INSERT INTO `users` VALUES (9, 'hoang123', '$2a$12$fGVn0xlMn5jatNl7/P9iZufLwjEZN1ABkfb8geiR9hK3PTYPW.NO.', 'hoang', 'hoang@gmail.com', '2021-05-05', 'user', 'true');

SET FOREIGN_KEY_CHECKS = 1;
