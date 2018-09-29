/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.3.40
 Source Server Type    : MySQL
 Source Server Version : 50522
 Source Host           : 192.168.3.40:3306
 Source Schema         : homestead

 Target Server Type    : MySQL
 Target Server Version : 50522
 File Encoding         : 65001

 Date: 29/09/2018 17:29:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog`  (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `category_id` int(4) DEFAULT NULL,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `comment_total` int(4) DEFAULT 0,
  `ip_address` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` int(4) DEFAULT 0,
  `create_date` bigint(13) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKFEBA5C93FCBC1E60`(`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 274 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES (272, 1, 'testing1', '<p>testing1</p>\r\n', 0, '127.0.0.1', 0, 1294848000000);
INSERT INTO `blog` VALUES (273, 4, 'testing2', '<p>testing2</p>\r\n', 0, NULL, 1, 1532919707);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `create_date` bigint(13) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'Reading', 0, 1520069455);
INSERT INTO `category` VALUES (2, 'Feeling', 0, 1164601652);
INSERT INTO `category` VALUES (3, 'Traveling', 0, 1164601652);
INSERT INTO `category` VALUES (4, 'Working', 0, 1164601652);
INSERT INTO `category` VALUES (5, 'Learning', 0, 1164601652);
INSERT INTO `category` VALUES (6, 'Watching', 0, 1164601652);
INSERT INTO `category` VALUES (7, 'Playing', 0, 1164601652);
INSERT INTO `category` VALUES (8, 'Living', 0, 1164601652);
INSERT INTO `category` VALUES (9, 'Listening', 1, 1164601652);
INSERT INTO `category` VALUES (10, 'Codeing', 1, 1164601652);
INSERT INTO `category` VALUES (12, 'Ending', 1, 1164601652);
INSERT INTO `category` VALUES (15, 'teching', 0, 1520062659);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_date` bigint(13) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '超级管理员', 1491966079000);
INSERT INTO `role` VALUES (17, '系统管理员', 1494558079667);

-- ----------------------------
-- Table structure for role_right
-- ----------------------------
DROP TABLE IF EXISTS `role_right`;
CREATE TABLE `role_right`  (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `role_id` int(4) DEFAULT NULL,
  `menu_code` int(40) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 141 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of role_right
-- ----------------------------
INSERT INTO `role_right` VALUES (116, 1, 10);
INSERT INTO `role_right` VALUES (117, 1, 1001);
INSERT INTO `role_right` VALUES (118, 1, 100101);
INSERT INTO `role_right` VALUES (119, 1, 10010101);
INSERT INTO `role_right` VALUES (120, 1, 10010102);
INSERT INTO `role_right` VALUES (121, 1, 100102);
INSERT INTO `role_right` VALUES (122, 1, 10010201);
INSERT INTO `role_right` VALUES (123, 1, 10010202);
INSERT INTO `role_right` VALUES (124, 1, 1002);
INSERT INTO `role_right` VALUES (125, 1, 100202);
INSERT INTO `role_right` VALUES (126, 1, 10020201);
INSERT INTO `role_right` VALUES (127, 1, 10020202);
INSERT INTO `role_right` VALUES (128, 1, 100203);
INSERT INTO `role_right` VALUES (129, 1, 10020301);
INSERT INTO `role_right` VALUES (130, 1, 10020302);
INSERT INTO `role_right` VALUES (131, 1, 100201);
INSERT INTO `role_right` VALUES (132, 1, 10020101);
INSERT INTO `role_right` VALUES (133, 17, 100101);
INSERT INTO `role_right` VALUES (134, 17, 10010101);
INSERT INTO `role_right` VALUES (135, 17, 10010102);
INSERT INTO `role_right` VALUES (136, 17, 100201);
INSERT INTO `role_right` VALUES (137, 17, 10020101);
INSERT INTO `role_right` VALUES (138, 17, 100203);
INSERT INTO `role_right` VALUES (139, 17, 10020301);
INSERT INTO `role_right` VALUES (140, 17, 10020302);

-- ----------------------------
-- Table structure for t_finance
-- ----------------------------
DROP TABLE IF EXISTS `t_finance`;
CREATE TABLE `t_finance`  (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `category_id` int(4) DEFAULT NULL,
  `name` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_no` int(4) NOT NULL,
  `status` int(4) DEFAULT NULL,
  `create_date` bigint(13) DEFAULT NULL,
  PRIMARY KEY (`id`, `order_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_finance
-- ----------------------------
INSERT INTO `t_finance` VALUES (8, 8, '中国银行', '/public/images/product/201884/1533371222479.jpg', '中行信用卡', 'https://ebsnew.boc.cn/boc15/login.html', 1, 0, 1538019236470);
INSERT INTO `t_finance` VALUES (19, 8, '平安银行', '/public/images/product/201884/1533371196529.png', '刷6次免年费', 'https://c.pingan.com/apply/newpublic/new_apply/index.html#mainPage', 3, 0, 1538019242379);
INSERT INTO `t_finance` VALUES (20, 7, '民生银行', '/public/images/product/201884/1533371180496.jpg', '在线申请，每周狂省200元', 'https://creditcard.cmbc.com.cn/onlinepc/logon/logon.jhtml?id=32&time=1509956970375', 2, 0, 1533371183044);
INSERT INTO `t_finance` VALUES (21, 7, '中信银行', '/public/images/product/201884/1533371157250.png', '刷卡免年费，新户交易送Campo Marzio钢笔', 'https://creditcard.ecitic.com/citiccard/cardshop-web/apply/toPageIndex.do?pid=CS0216&sid=WHSQK&', 5, 0, 1533371159442);
INSERT INTO `t_finance` VALUES (22, 7, '光大银行', '/public/images/product/201884/1533371291093.png', '五星级酒店自助餐五折\r\n境外消费返现最高8%', 'https://xyk.cebbank.com/home/ps/index.htm', 4, 0, 1533371292704);
INSERT INTO `t_finance` VALUES (23, 7, '浦发银行', '/public/images/product/201884/1533371251155.png', '新户消费达标赠两张观影券、388元的五星酒店健身', 'https://onlineapp.spdbccc.com.cn/ccoa/newccoapage/addr.jsp?productCode=SPDB100052', 6, 0, 1533371252801);
INSERT INTO `t_finance` VALUES (24, 7, '华夏银行', '/public/images/product/201884/1533371236905.png', '首刷送6个月爱奇艺会员先 \r\n刷卡达标再送6个月   \r\n华夏商城购会员专享8折 \r\n首年享受免年费 \r\n取现每日首笔0手续费 \r\n滴滴租车95折(国内)', 'https://creditapply.hxb.com.cn/', 7, 0, 1533371238754);
INSERT INTO `t_finance` VALUES (25, 8, '平安银行', '/public/images/product/201884/1533371337027.jpg', '平安银行理财通', 'http://caifu.pingan.com/licai.shtml', 1, 0, 1533371338904);
INSERT INTO `t_finance` VALUES (26, 13, '人人贷', '/public/images/product/201884/1533371409957.png', '人人贷，人人可贷，注册领480元红包', 'https://www.renrendai.com/pc/passport/index/register?registerSource=web_top&wpFromPos=topHeader', 2, 0, 1533371411575);
INSERT INTO `t_finance` VALUES (27, 8, '国民丰泰', '/public/images/product/201884/1533371493012.jpg', '最低期限30天，年化率最高可达12.5%', 'https://www.sztnf.com/invest/list.html', 2, 0, 1533371494477);
INSERT INTO `t_finance` VALUES (29, 13, '信贷通', '/public/images/product/201884/1533371534731.jpg', '35倍活期存款收益。已有29839位投资人选择了信贷通！', 'https://www.xindaitong.com/', 3, 0, 1533371536478);
INSERT INTO `t_finance` VALUES (30, 8, '钱多多', '/public/images/product/201884/1533371664840.jpg', '投资满额送iphone X', 'https://d.com.cn/adclick/reg_2016.html', 4, 0, 1533371666438);
INSERT INTO `t_finance` VALUES (31, 13, '悟空理财', '/public/images/product/201884/1533371633744.jpg', '加入悟空理财，送5000元体验金', 'https://market.wukonglicai.com/marketing/spreadpc-20160905/pcbdpp01.html', 3, 0, 1538019314855);
INSERT INTO `t_finance` VALUES (32, 13, '渤海银行', '/public/images/product/2018927/1538020244702.jpg', '欢迎前来借钱，信托。', NULL, 0, 0, 1538020256579);
INSERT INTO `t_finance` VALUES (33, 13, '宁波银行', '/public/images/product/2018927/1538020518842.jpg', '宁波银行，给你家的温暧。', NULL, 0, 0, 1538020542622);

-- ----------------------------
-- Table structure for t_finance_banner
-- ----------------------------
DROP TABLE IF EXISTS `t_finance_banner`;
CREATE TABLE `t_finance_banner`  (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pic_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_finance_banner
-- ----------------------------
INSERT INTO `t_finance_banner` VALUES (16, '光大银行信用卡', '/public/images/banner/1509954311323_gzip.jpg', 'http://www.baidu.com');
INSERT INTO `t_finance_banner` VALUES (20, '1', '/public/images/banner/1510192260913_gzip.jpg', 'http://www.wht.cn');

-- ----------------------------
-- Table structure for t_finance_category
-- ----------------------------
DROP TABLE IF EXISTS `t_finance_category`;
CREATE TABLE `t_finance_category`  (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ad` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ad_icon` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ad_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `navigation` int(4) DEFAULT NULL,
  `status` int(4) DEFAULT NULL,
  `create_date` bigint(13) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_finance_category
-- ----------------------------
INSERT INTO `t_finance_category` VALUES (7, '信用卡', '信用卡', '/pic/finance/20171106/1509955904180_gzip.png', 'https://www.baidu.com/', 3, 0, 1533266306799);
INSERT INTO `t_finance_category` VALUES (8, '理财', '“理财”一词，最早见诸于20世纪90年代初期的报端。随着中国股票债券市场的扩容，商业银行、零售业务的日趋丰富和市民总体收入的逐年上升，“理财”概念逐渐走俏。个人理财（658）品种大致可以分为个人资产品', '/pic/finance/20171107/1510034887243_gzip.png', 'https://baike.baidu.com/item/%E7%90%86%E8%B4%A2/550678?fr=aladdin', 2, 0, 1533266312227);
INSERT INTO `t_finance_category` VALUES (13, '借钱', '借贷', '/pic/finance/20171106/1509957309162_gzip.png', 'https://baike.baidu.com/item/%E5%80%9F%E8%B4%B7/79595?fr=aladdin', 1, 0, 1533265845917);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `remember_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'peterlee', 'peterlee@gmail.com', '$2y$10$UR3rvgVt7B3.gXhO2gjWs.OYQes0ewhUaA7jFkR.OUoGjuBEaiSf.', '7eW1HmlIBJa9etDEXhn3Ek9yWDuTVZLESAwMaWxdFB4Cqf2pYZWlrZECIKfH', '2018-04-02 14:51:37', '2018-04-02 14:51:37');
INSERT INTO `users` VALUES (6, '李绿波1', '215025281@qq.com', '0000001', NULL, '2018-04-25 14:06:35', '2018-04-25 14:06:46');
INSERT INTO `users` VALUES (7, '超级管理员1', '9143071691@qq.com', '00000011', NULL, '2018-04-26 08:42:00', '2018-04-26 08:42:08');
INSERT INTO `users` VALUES (8, NULL, NULL, NULL, NULL, '2018-05-16 05:45:47', '2018-05-16 05:45:47');

SET FOREIGN_KEY_CHECKS = 1;
