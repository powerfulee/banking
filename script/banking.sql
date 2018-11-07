/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.3.40
 Source Server Type    : MySQL
 Source Server Version : 50522
 Source Host           : 192.168.3.40:3306
 Source Schema         : banking

 Target Server Type    : MySQL
 Target Server Version : 50522
 File Encoding         : 65001

 Date: 30/09/2018 08:45:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

CREATE DATABASE `banking`;

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

SET FOREIGN_KEY_CHECKS = 1;
