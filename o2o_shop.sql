/*
 Navicat Premium Data Transfer

 Source Server         : work
 Source Server Type    : MySQL
 Source Server Version : 50553
 Source Host           : localhost:3306
 Source Schema         : o2o_shop

 Target Server Type    : MySQL
 Target Server Version : 50553
 File Encoding         : 65001

 Date: 14/08/2018 17:30:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for o2o_admin
-- ----------------------------
DROP TABLE IF EXISTS `o2o_admin`;
CREATE TABLE `o2o_admin`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Aname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `parent_id` int(11) NOT NULL COMMENT '父类id  主管理员为0 ',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `last_login_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mobile` int(11) NOT NULL,
  `create_time` int(11) NOT NULL DEFAULT 0,
  `update_time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of o2o_admin
-- ----------------------------
INSERT INTO `o2o_admin` VALUES (1, 'huxiaole', 'ad4ed9656e5a0e638b6fcc81d0479b7d', 1, 0, '4502', '127.0.0.1', '1534232112', '1746671042@qq.com', 2147483647, 1534231142, 1534232112);
INSERT INTO `o2o_admin` VALUES (2, 'huxiaole1', '8e9010dcd6152c45476d1a6b37fb579f', 1, 1, '4212', '127.0.0.1', '1534231292', '1746671042@qq.com', 2147483647, 1534231292, 1534231459);
INSERT INTO `o2o_admin` VALUES (3, 'zhangsan', 'f538d7cef16a4e9ac51eb4c15e63de28', 1, 0, '2300', '127.0.0.1', '1534231809', '1746671042@qq.com', 2147483647, 1534231809, 1534231809);

-- ----------------------------
-- Table structure for o2o_area
-- ----------------------------
DROP TABLE IF EXISTS `o2o_area`;
CREATE TABLE `o2o_area`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `city_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `listorder` int(8) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parend_id`(`parent_id`) USING BTREE,
  INDEX `caty_id`(`city_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for o2o_bis
-- ----------------------------
DROP TABLE IF EXISTS `o2o_bis`;
CREATE TABLE `o2o_bis`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '店铺名称',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `licence_logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '缩略图',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述',
  `city_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `city_path` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `bank_info` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '银行账号',
  `money` decimal(20, 2) NOT NULL DEFAULT 0.00 COMMENT '钱',
  `bank_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '银行名称',
  `bank_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '开户名',
  `faren` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '法人',
  `faren_tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '法人电话',
  `listorder` int(8) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '拽提',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name`(`name`) USING BTREE,
  INDEX `caty_id`(`city_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of o2o_bis
-- ----------------------------
INSERT INTO `o2o_bis` VALUES (1, 'adidass', '1746671042@qq.com', '/upload\\20180803\\d0be0002f087ab3fd6fd75807b303eb2.jpg', '/upload\\20180803\\d8f439becf19959b3c6aaa2d994e3f58.jpg', '<p>adidass官方旗舰店</p>', 2, '2,4', '14353534534534534534', 0.00, '华夏银行', '胡小乐', '胡小乐', '15614480650', 0, 1, 1533261307, 1533353011);
INSERT INTO `o2o_bis` VALUES (2, 'nike', '2552698596@qq.com', '/upload\\20180803\\32f54555d0f319b2a2e481d98a824e50.png', '/upload\\20180803\\25142368c8a3244b027d02f24e05cb9a.png', '<p>nike</p>', 2, '2,6', '14353534534534534534', 0.00, '华夏银行', '胡小乐', '胡小乐', '15614480650', 0, 1, 1533262058, 1533278665);
INSERT INTO `o2o_bis` VALUES (3, 'LiNing', '664007531@qq.com', '/upload\\20180803\\5286037e8c2978d9f6db4a491582dd67.jpg', '/upload\\20180803\\04693d095bac278f96f383625dd757ea.jpg', '<p>Lining</p>', 1, '1', '14353534534534534534', 0.00, '华夏银行', '胡小乐', '胡小乐', '15614480650', 0, 2, 1533262390, 1533278511);
INSERT INTO `o2o_bis` VALUES (4, '亚瑟士', '485375992@qq.com', '/upload\\20180803\\8a715a23f19b4606aa4d499cf1117447.png', '/upload\\20180803\\ce389db5b801472a11252e30ffaefd3e.png', '<p>亚瑟士官网</p>', 1, '1', '14353534534534534534', 0.00, '华夏银行', '胡小乐', '胡小乐', '15614480650', 0, -1, 1533277282, 1533277978);
INSERT INTO `o2o_bis` VALUES (5, '骆驼', '664007531@qq.com', '/upload\\20180804\\f3abe1053d842eb51479438d22ad4c75.jpg', '/upload\\20180804\\4e0bf23d86925fde81c252b420434758.jpg', '<p>。骆驼</p>', 2, '2,6', '1234567890000000000', 0.00, '农业银行', '张三', '张三', '15614480650', 0, 0, 1533367977, 1533367977);
INSERT INTO `o2o_bis` VALUES (6, '李四专卖店', '1746671042@qq.com', '/upload\\20180806\\60660c9d2087db7b28f49fae9f6e3ca2.png', '/upload\\20180806\\21b80c3b241d08b717123a96f360e3f4.png', '&lt;p&gt;&amp;lt;script&amp;gt;alert(1)&amp;lt;/script&amp;gt;&amp;lt;script&amp;gt;alert(1)&amp;lt;/script&amp;gt;&amp;lt;script&amp;gt;alert(1)&amp;lt;/script&amp;gt;&amp;lt;script&amp;gt;alert(1)&amp;lt;/script&amp;gt;&lt;/p&gt;', 2, '2', '1234567890000000000', 0.00, '工商银行', '&lt;script&gt;alert(1)&lt;/script&gt;', '胡小乐', '15614480650', 0, 0, 1533525781, 1533525781);
INSERT INTO `o2o_bis` VALUES (7, '飞翔人', '1746671042@qq.com', '/upload\\20180806\\c12fb418baa40d44b55ca4bca4820d85.jpg', '/upload\\20180806\\28f526f0aac154626a132e69326eb4dc.jpg', '&lt;p&gt;&amp;lt;script&amp;gt;alert(1)&amp;lt;/script&amp;gt;&amp;lt;script&amp;gt;alert(1)&amp;lt;/script&amp;gt;&amp;lt;script&amp;gt;alert(1)&amp;lt;/script&amp;gt;&lt;/p&gt;', 2, '2,4', '1234567890000000000', 0.00, '华夏银行', '胡小乐', '胡小乐', '15614480650', 0, 1, 1533526196, 1533545404);

-- ----------------------------
-- Table structure for o2o_bis_account
-- ----------------------------
DROP TABLE IF EXISTS `o2o_bis_account`;
CREATE TABLE `o2o_bis_account`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '加入的盐',
  `bis_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商铺id',
  `last_login_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '最后一次登陆ip',
  `last_login_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后一次登录时间',
  `is_main` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否为住管理',
  `listorder` int(8) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bis_id`(`bis_id`) USING BTREE,
  INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of o2o_bis_account
-- ----------------------------
INSERT INTO `o2o_bis_account` VALUES (1, '1746671042@qq.com', 'b5032e0cdd4a74bc5035b0c16f2cfe54', '4046', 1, '127.0.0.1', 1534146836, 1, 0, 2, 1533261307, 1534216024);
INSERT INTO `o2o_bis_account` VALUES (2, 'huxiaole', '4d88da9f506240bc113c887a0d4f1c24', '2738', 2, '127.0.0.1', 1534232178, 1, 0, 1, 1533262058, 1534232178);
INSERT INTO `o2o_bis_account` VALUES (3, 'tianping', '2490182a4e67ec99890199041b4a36a5', '9383', 3, '127.0.0.1', 1533262390, 1, 0, -1, 1533262390, 1534215084);
INSERT INTO `o2o_bis_account` VALUES (4, '田先生', '0bc51b7cec4b62aad85312a8f876cbd9', '861', 4, '127.0.0.1', 1533277282, 1, 0, 1, 1533277282, 1533277978);
INSERT INTO `o2o_bis_account` VALUES (5, '张三', '6748dfed84ca8795faca6ffec5a96845', '8164', 5, '127.0.0.1', 1533367977, 1, 0, 1, 1533367977, 1534216160);
INSERT INTO `o2o_bis_account` VALUES (6, '李四', '78e00e87224c168cf757607e883dcdbb', '9091', 6, '127.0.0.1', 1533525781, 1, 0, 1, 1533525781, 1534216157);
INSERT INTO `o2o_bis_account` VALUES (7, '王五', '6dc60ee27f4a4c5c2cf8ff553fb44faf', '6533', 7, '127.0.0.1', 1533526196, 1, 0, 1, 1533526196, 1533545404);

-- ----------------------------
-- Table structure for o2o_bis_location
-- ----------------------------
DROP TABLE IF EXISTS `o2o_bis_location`;
CREATE TABLE `o2o_bis_location`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分店名称',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '电话',
  `contact` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '门店介绍',
  `xpoint` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '经度',
  `ypoint` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '纬度',
  `bis_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '总店铺id',
  `open_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '营业时间',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '门店介绍',
  `is_main` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否主店',
  `api_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'api 地址',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `city_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `city_path` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `bank_info` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `category_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '分类id',
  `category_path` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分类路径',
  `listorder` int(8) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 通过  0 未审核  -1 删除',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `caty_id`(`city_id`) USING BTREE,
  INDEX `bis_id`(`bis_id`) USING BTREE,
  INDEX `category_id`(`category_id`) USING BTREE,
  INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of o2o_bis_location
-- ----------------------------
INSERT INTO `o2o_bis_location` VALUES (1, 'adidass', '/upload\\20180803\\d0be0002f087ab3fd6fd75807b303eb2.jpg', '15614480650', '', '115.47632396694', '38.878828808895', 1, 20188, '<p>adidas&nbsp; &nbsp; &nbsp;官方旗舰店</p>', 1, '保定市竞秀区茂业中心1407', '<p>adidas&nbsp; &nbsp; &nbsp;官方旗舰店</p>', 2, '2,4', '', 4, '4,10', 0, 2, 1533261307, 1534216024);
INSERT INTO `o2o_bis_location` VALUES (2, 'nike', '/upload\\20180803\\32f54555d0f319b2a2e481d98a824e50.png', '15614480650', '', '115.47632396694', '38.878828808895', 2, 20188, '<p>Nike</p>', 1, '保定市竞秀区茂业中心1407', '<p>Nike</p>', 2, '2,6', '', 4, '4,10', 0, 1, 1533262058, 1533278665);
INSERT INTO `o2o_bis_location` VALUES (3, 'LiNing', '/upload\\20180803\\5286037e8c2978d9f6db4a491582dd67.jpg', '15614480650', '', '115.47632396694', '38.878828808895', 3, 20188, '<p>LiNing</p>', 1, '保定市竞秀区茂业中心1407', '<p>LiNing</p>', 1, '1', '', 1, '1,7|6', 0, -1, 1533262390, 1534215084);
INSERT INTO `o2o_bis_location` VALUES (4, '亚瑟士', '/upload\\20180803\\8a715a23f19b4606aa4d499cf1117447.png', '15614480650', '', '115.47632396694', '38.878828808895', 4, 20188, '<p>亚瑟士官网</p>', 1, '保定市竞秀区茂业中心1407', '<p>亚瑟士官网</p>', 1, '1', '', 4, '4,10', 0, -1, 1533277282, 1533277978);
INSERT INTO `o2o_bis_location` VALUES (5, '万斯', '/upload\\20180804\\cb999447fb9703815a10b9b6e4ff23f2.png', '15614480650', '胡小乐', '115.47632396694', '38.878828808895', 2, 20188, '<p>万斯</p>', 0, '保定市竞秀区茂业中心1407', '', 2, '2,6', '', 4, '4,', 0, 1, 1533345822, 1533345822);
INSERT INTO `o2o_bis_location` VALUES (6, '骆驼', '/upload\\20180804\\f3abe1053d842eb51479438d22ad4c75.jpg', '15614480650', '', '115.47632396694', '38.878828808895', 5, 20188, '<p>骆驼</p>', 1, '保定市竞秀区茂业中心1407', '<p>骆驼</p>', 2, '2,6', '', 5, '5,9', 0, 1, 1533367977, 1534216160);
INSERT INTO `o2o_bis_location` VALUES (7, '李四专卖店', '/upload\\20180806\\60660c9d2087db7b28f49fae9f6e3ca2.png', '15614480650', '', '117.21962949032', '38.070163304449', 6, 201910, '&lt;p&gt;&amp;lt;script&amp;gt;alert(1)&amp;lt;/script&amp;gt;&amp;lt;script&amp;gt;alert(1)&amp;lt;/script&amp;gt;&amp;lt;script&amp;gt;alert(1)&amp;lt;/script&amp;gt;&lt;/p&gt;', 1, '河北省沧州市盐山县凤池宾馆', '&lt;p&gt;&amp;lt;script&amp;gt;alert(1)&amp;lt;/script&amp;gt;&amp;lt;script&amp;gt;alert(1)&amp;lt;/script&amp;gt;&amp;lt;script&amp;gt;alert(1)&amp;lt;/script&amp;gt;&lt;/p&gt;', 2, '2', '', 1, '1,', 0, 1, 1533525781, 1534216157);
INSERT INTO `o2o_bis_location` VALUES (8, '飞翔人', '/upload\\20180806\\c12fb418baa40d44b55ca4bca4820d85.jpg', '15614480650', '', '115.47632396694', '38.878828808895', 7, 201910, '&lt;p&gt;&amp;lt;script&amp;gt;alert(1)&amp;lt;/script&amp;gt;&amp;lt;script&amp;gt;alert(1)&amp;lt;/script&amp;gt;&lt;/p&gt;', 1, '河北省保定市竞秀区茂业中心1407', '&lt;p&gt;&amp;lt;script&amp;gt;alert(1)&amp;lt;/script&amp;gt;&amp;lt;script&amp;gt;alert(1)&amp;lt;/script&amp;gt;&lt;/p&gt;', 2, '2,4', '', 5, '5,9', 0, 1, 1533526196, 1533545404);
INSERT INTO `o2o_bis_location` VALUES (9, '食在美食自助', '/upload\\20180808\\57d0be80d1dc7daaf45d9cf66e49173a.jpg', '15614480650', '李先生', '115.47632396694', '38.878828808895', 2, 201910, '&lt;p&gt;美味火锅店&lt;br/&gt;&lt;/p&gt;', 0, '保定市竞秀区茂业中心1407', '', 7, '7,8', '', 1, '1,17', 0, 1, 1533693041, 1533693041);
INSERT INTO `o2o_bis_location` VALUES (10, '于小鱼炒鸡', '/upload\\20180808\\ddfec03b994f87fca3a75220ad58496a.jpg', '15614480650', '赵先生', '115.47632396694', '38.878828808895', 2, 20188, '&lt;p&gt;超级好吃的炒鸡&lt;/p&gt;', 0, '河北省保定市竞秀区茂业中心1407', '', 7, '7,8', '', 1, '1,', 0, 1, 1533693300, 1533693300);
INSERT INTO `o2o_bis_location` VALUES (11, '牛太郎自助烧烤', '/upload\\20180808\\bd982fbb24f0c514848c913abc1625fd.jpg', '15614480650', '王女士', '115.47632396694', '38.878828808895', 2, 20189, '&lt;p&gt;烧烤非常好吃&lt;/p&gt;', 0, '保定市竞秀区茂业中心1407', '', 7, '7,8', '', 1, '1,17|12', 0, 1, 1533693367, 1533693367);
INSERT INTO `o2o_bis_location` VALUES (12, '牛太郎自助烧烤（军校店）', '/upload\\20180808\\777c5a7e8b79a5a9e45242d774e760d2.jpg', '15614480650', '李先生', '115.47632396694', '38.878828808895', 2, 20189, '&lt;p&gt;好吃好吃&lt;/p&gt;', 0, '保定市竞秀区茂业中心1407', '', 7, '7,8', '', 1, '1,18|12', 0, 1, 1533693422, 1533693422);
INSERT INTO `o2o_bis_location` VALUES (13, '肯德基', '/upload\\20180813\\57c0aa8ade41863646df9c3d064364c1.jpg', '15614480650', '胡小乐', '117.21962949032', '38.070163304449', 2, 201910, '&lt;p&gt;肯德基&lt;/p&gt;', 0, '河北省沧州市盐山县凤池宾馆', '', 7, '7', '', 1, '1,18|17', 0, 0, 1534140753, 1534140753);

-- ----------------------------
-- Table structure for o2o_bis_user
-- ----------------------------
DROP TABLE IF EXISTS `o2o_bis_user`;
CREATE TABLE `o2o_bis_user`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `licence_logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `city_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `listorder` int(8) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parend_id`(`parent_id`) USING BTREE,
  INDEX `caty_id`(`city_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for o2o_category
-- ----------------------------
DROP TABLE IF EXISTS `o2o_category`;
CREATE TABLE `o2o_category`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `listorder` int(8) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parend_id`(`parent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of o2o_category
-- ----------------------------
INSERT INTO `o2o_category` VALUES (1, '美食', 0, 3, 1, 1533019170, 1533635230);
INSERT INTO `o2o_category` VALUES (2, '娱乐', 0, 5, 1, 1533019176, 1533635222);
INSERT INTO `o2o_category` VALUES (3, '酒店', 0, 3, -1, 1533019184, 1533026285);
INSERT INTO `o2o_category` VALUES (4, '休闲', 0, 0, 1, 1533019191, 1533635238);
INSERT INTO `o2o_category` VALUES (5, '丽人', 0, 4, 1, 1533019198, 1533635226);
INSERT INTO `o2o_category` VALUES (6, '鸡腿', 1, 0, 1, 1533019813, 1533019813);
INSERT INTO `o2o_category` VALUES (7, '鸭肉', 1, 0, 1, 1533019822, 1533019822);
INSERT INTO `o2o_category` VALUES (8, '汉庭大酒店', 3, 0, 1, 1533019836, 1533019836);
INSERT INTO `o2o_category` VALUES (9, '非凡达人', 5, 0, 1, 1533019850, 1533019850);
INSERT INTO `o2o_category` VALUES (10, '高尔夫', 4, 0, 1, 1533019861, 1533019861);
INSERT INTO `o2o_category` VALUES (11, '浙江菜', 1, 0, 1, 1533524111, 1533524111);
INSERT INTO `o2o_category` VALUES (12, '烧烤', 1, 0, 1, 1533524125, 1533524125);
INSERT INTO `o2o_category` VALUES (13, '素食', 1, 0, 1, 1533524131, 1533524131);
INSERT INTO `o2o_category` VALUES (14, '川湘菜', 1, 0, 1, 1533524146, 1533524146);
INSERT INTO `o2o_category` VALUES (15, '东北菜', 1, 0, 1, 1533524156, 1533524156);
INSERT INTO `o2o_category` VALUES (16, '料理', 1, 0, 1, 1533524166, 1533524166);
INSERT INTO `o2o_category` VALUES (17, '火锅', 1, 0, 1, 1533524172, 1533524172);
INSERT INTO `o2o_category` VALUES (18, '自助餐', 1, 0, 1, 1533524178, 1533524178);
INSERT INTO `o2o_category` VALUES (19, '蹦极', 2, 0, 1, 1533524234, 1533524234);
INSERT INTO `o2o_category` VALUES (20, '唱歌', 2, 0, 1, 1533524246, 1533524246);
INSERT INTO `o2o_category` VALUES (21, '电影', 0, 2, 1, 1533631632, 1533635235);
INSERT INTO `o2o_category` VALUES (22, '订座', 21, 0, 1, 1533631641, 1533631641);
INSERT INTO `o2o_category` VALUES (23, '电影票团购', 21, 0, 1, 1533631651, 1533631651);
INSERT INTO `o2o_category` VALUES (24, '健身', 0, 1, 1, 1533635252, 1533635258);

-- ----------------------------
-- Table structure for o2o_city
-- ----------------------------
DROP TABLE IF EXISTS `o2o_city`;
CREATE TABLE `o2o_city`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `uname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `is_default` int(11) NOT NULL DEFAULT 0,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `listorder` int(8) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uname`(`uname`) USING BTREE,
  INDEX `parend_id`(`parent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of o2o_city
-- ----------------------------
INSERT INTO `o2o_city` VALUES (1, '北京', 'beijing', 0, 0, 0, 1, 1576546434, 1576546434);
INSERT INTO `o2o_city` VALUES (2, '江西', 'jiangxi', 0, 0, 0, 1, 1745343454, 1745343454);
INSERT INTO `o2o_city` VALUES (3, '南昌', 'nanchang', 1, 2, 0, 1, 1745343454, 1745343454);
INSERT INTO `o2o_city` VALUES (4, '上饶', 'shangrao', 0, 2, 0, 1, 1533972857, 1533972857);
INSERT INTO `o2o_city` VALUES (5, '抚州', 'fuzhou', 0, 2, 0, 1, 1894357353, 1533972857);
INSERT INTO `o2o_city` VALUES (6, '景德镇', 'jingdezhen', 0, 2, 0, 1, 1289747444, 1533972857);
INSERT INTO `o2o_city` VALUES (7, '河北', 'hebei', 0, 0, 50, 1, 1289747444, 1533973783);
INSERT INTO `o2o_city` VALUES (8, '保定', 'baoding', 0, 7, 0, 1, 1289747444, 1533972857);
INSERT INTO `o2o_city` VALUES (9, '沧州', 'cangzhou', 0, 7, 0, 1, 1289747444, 1533972857);
INSERT INTO `o2o_city` VALUES (10, '山东', 'shandong', 0, 0, 0, 1, 1533972857, 1533972857);
INSERT INTO `o2o_city` VALUES (12, '上海', 'shanghai', 0, 0, 0, 1, 1533973103, 1533973202);
INSERT INTO `o2o_city` VALUES (13, '淄博', 'zibo', 0, 10, 0, 1, 1533973119, 1533973119);
INSERT INTO `o2o_city` VALUES (14, '德州', 'dezhou', 0, 10, 0, 1, 1533973238, 1533973238);
INSERT INTO `o2o_city` VALUES (15, '广东', 'guangdong', 0, 0, 0, 1, 1533973360, 1533973360);
INSERT INTO `o2o_city` VALUES (16, '河南', 'henan', 0, 0, 0, 1, 1533973370, 1533973370);
INSERT INTO `o2o_city` VALUES (17, '浙江', 'zhejiang', 0, 0, 0, 1, 1533973383, 1533973383);
INSERT INTO `o2o_city` VALUES (18, '黑龙江', 'heilongjiang', 0, 0, 0, 1, 1533973405, 1533973405);
INSERT INTO `o2o_city` VALUES (19, '辽宁', 'liaoning', 0, 0, 0, 1, 1533973421, 1533973421);
INSERT INTO `o2o_city` VALUES (20, '吉林', 'jilin', 0, 0, 0, 1, 1533973435, 1533973435);
INSERT INTO `o2o_city` VALUES (24, '云南', 'yunnan', 0, 0, 0, 1, 1533973510, 1533973510);
INSERT INTO `o2o_city` VALUES (25, '安徽', 'anhui', 0, 0, 0, 1, 1533973526, 1533973526);
INSERT INTO `o2o_city` VALUES (26, '四川', 'sichuan', 0, 0, 0, 1, 1533973901, 1533973901);
INSERT INTO `o2o_city` VALUES (27, '乌鲁木齐', 'wulumuqi', 0, 0, 0, 1, 1533973921, 1533973921);
INSERT INTO `o2o_city` VALUES (30, '福建', 'fujian', 0, 0, 0, 1, 1533974010, 1533974010);
INSERT INTO `o2o_city` VALUES (31, '西藏', 'xizang', 0, 0, 0, 1, 1533974030, 1533974030);
INSERT INTO `o2o_city` VALUES (32, '宁夏', 'ningxia', 0, 0, 0, 1, 1533974038, 1533974038);
INSERT INTO `o2o_city` VALUES (33, '重庆', 'chongqing', 0, 0, 0, 1, 1533974051, 1533974051);

-- ----------------------------
-- Table structure for o2o_coupons
-- ----------------------------
DROP TABLE IF EXISTS `o2o_coupons`;
CREATE TABLE `o2o_coupons`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sn` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `deal_id` int(11) NOT NULL DEFAULT 0,
  `order_id` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0:订单未发送给用户   1:已发送给用户  2：用户已经实用   3：禁用',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`, `user_id`, `deal_id`, `create_time`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for o2o_deal
-- ----------------------------
DROP TABLE IF EXISTS `o2o_deal`;
CREATE TABLE `o2o_deal`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '团购名称',
  `category_id` int(11) NOT NULL DEFAULT 0 COMMENT '所属分类',
  `se_category_id` int(11) NOT NULL DEFAULT 0 COMMENT '所属子类',
  `bis_id` int(11) NOT NULL DEFAULT 0 COMMENT '门店id',
  `location_ids` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '所属门店',
  `image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '所属主店id',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '团购描述',
  `start_time` int(11) NOT NULL DEFAULT 0 COMMENT '团购开始时间',
  `end_time` int(11) NOT NULL DEFAULT 0 COMMENT '团购结束时间',
  `origin_price` decimal(20, 2) NOT NULL DEFAULT 0.00 COMMENT '原价',
  `current_price` decimal(20, 2) NOT NULL DEFAULT 0.00 COMMENT '现价',
  `city_id` int(11) NOT NULL DEFAULT 0 COMMENT '所属城市id',
  `buy_count` int(11) NOT NULL DEFAULT 0 COMMENT '已售数量',
  `total_count` int(11) NOT NULL DEFAULT 0 COMMENT '总价',
  `coupons_begin_time` int(11) UNSIGNED ZEROFILL NOT NULL DEFAULT 00000000000 COMMENT '活动开始时间',
  `coupons_end_time` int(11) NOT NULL DEFAULT 0 COMMENT '活动结束时间',
  `xpoint` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '精度',
  `ypoint` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '维度',
  `bis_account_id` int(10) NOT NULL DEFAULT 0 COMMENT '当前商户id',
  `balance_price` decimal(20, 2) NOT NULL DEFAULT 0.00,
  `notes` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '购买须知',
  `listorder` int(8) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 待审 1通过 -1未通过 2下架',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `category_id`(`category_id`) USING BTREE,
  INDEX `se_category_id`(`se_category_id`) USING BTREE,
  INDEX `city_id`(`city_id`) USING BTREE,
  INDEX `start_time`(`start_time`) USING BTREE,
  INDEX `end_time`(`end_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of o2o_deal
-- ----------------------------
INSERT INTO `o2o_deal` VALUES (1, '测试商品1', 4, 10, 2, '5', '/upload\\20180804\\9c3f9f667c0c3b770068df9ab0621456.png', '<p>测试商品1</p>', 1533527700, 1534218900, 43.00, 0.01, 14, 14536, 33, 01531108500, 1533527700, '115.47632396694', '38.878828808895', 2, 0.00, '<p>测试商品1</p>', 0, 0, 1533354940, 1534131584);
INSERT INTO `o2o_deal` VALUES (2, '测试商品2', 5, 9, 2, '2', '/upload\\20180804\\914e9f9948bc4454140b5dce51ce6fde.jpg', '<p>测试商品two</p>', 1534928400, 1535706000, 345.00, 0.01, 5, 4354350, 888, 01534237260, 1534323660, '115.47632396694', '38.878828808895', 2, 0.00, '<p>测试商品two</p>', 0, 1, 1533373296, 1533373296);
INSERT INTO `o2o_deal` VALUES (3, '甜萍1号', 2, 20, 2, '5', '/upload\\20180807\\58179d8b6235cd4f148d06bd45441b02.jpg', '&lt;p&gt;甜萍1号玩具，可供各种暴击&lt;/p&gt;', 1531388100, 1535621700, 250.00, 0.02, 8, 45350, 1, 01534239300, 1535016900, '115.47632396694', '38.878828808895', 2, 0.00, '&lt;p&gt;需要提前付费。。。。。。&lt;/p&gt;', 0, -1, 1533634581, 1534131637);
INSERT INTO `o2o_deal` VALUES (4, '甜萍2号', 4, 10, 2, '2', '/upload\\20180807\\de51b554da9c37c514ef9d283b726969.jpg', '&lt;p&gt;甜萍2号&lt;br/&gt;&lt;/p&gt;', 1533181980, 1535687580, 250.00, 0.08, 8, 120, 1, 01531108500, 1535082780, '115.47632396694', '38.878828808895', 2, 0.00, '&lt;p&gt;甜萍2号&lt;/p&gt;', 0, 1, 1533634653, 1534131656);
INSERT INTO `o2o_deal` VALUES (5, '食在自助美食', 1, 18, 2, '12', '/upload\\20180808\\918350d793472660b36f0e0765dc6318.jpg', '&lt;p&gt;每人只可申请一次&lt;/p&gt;', 1534928400, 1535706000, 67.00, 0.02, 8, 10, 45, 01534218660, 1534989660, '115.47632396694', '38.878828808895', 2, 0.00, '&lt;p&gt;没有退款服务&lt;/p&gt;', 0, 1, 1533693742, 1533693742);
INSERT INTO `o2o_deal` VALUES (6, '于小鱼炒鸡', 1, 17, 2, '10', '/upload\\20180808\\918350d793472660b36f0e0765dc6318.jpg', '&lt;p&gt;超级好吃的炒鸡等你你哦&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 1533693780, 1535514600, 65.00, 0.02, 8, 324140, 56, 01533607440, 1533693840, '115.47632396694', '38.878828808895', 2, 0.00, '&lt;p&gt;购买后无退款服务&lt;/p&gt;', 0, 1, 1533693879, 1533693879);
INSERT INTO `o2o_deal` VALUES (7, '江湖前--价值100元代金券', 1, 18, 2, '9', '/upload\\20180808\\fbcbfd459ca3d7b04ada0b90d10b2d3f.jpg', '&lt;p&gt;超级好吃&lt;/p&gt;', 1534928400, 1535706000, 121.00, 0.02, 8, 131230, 12, 01531108500, 1535082780, '115.47632396694', '38.878828808895', 2, 0.00, '&lt;p&gt;购买后无退款服务&lt;/p&gt;', 0, 1, 1533694000, 1534131651);
INSERT INTO `o2o_deal` VALUES (8, '牛太郎自助烧烤（军校店）', 1, 12, 2, '12', '/upload\\20180808\\72769742e9ec5c3219ca102b24de53e5.jpg', '&lt;p&gt;超好吃的烧烤&lt;br/&gt;&lt;/p&gt;', 1534928400, 1535706000, 190.00, 0.01, 8, 330, 34, 01531108500, 1533694020, '115.47632396694', '38.878828808895', 2, 0.00, '&lt;p&gt;购买后无退款服务&lt;/p&gt;', 0, 1, 1533694077, 1533694077);
INSERT INTO `o2o_deal` VALUES (9, '张三餐馆', 1, 17, 2, '10', '/upload\\20180808\\55632869d56bdc92fc8bdd1bccde3499.jpg', '&lt;p&gt;张三的饭贼好吃&lt;/p&gt;', 1534928400, 1535706000, 87.00, 0.01, 8, 0, 788, 01534737180, 1533785040, '115.47632396694', '38.878828808895', 2, 0.00, '&lt;p&gt;无退还服务&lt;/p&gt;', 0, 1, 1533698726, 1533698726);
INSERT INTO `o2o_deal` VALUES (10, '李四的米', 1, 7, 2, '11', '/upload\\20180808\\cd6d8ad63de1b87cbf15c55ef2dab6bf.jpg', '&lt;p&gt;李四的面贼好吃&lt;/p&gt;', 1534928400, 1535687580, 8777.00, 0.01, 8, 0, 78, 01533698700, 1533698700, '115.47632396694', '38.878828808895', 2, 0.00, '&lt;p&gt;无退还服务&lt;/p&gt;', 0, -1, 1533698778, 1533698778);
INSERT INTO `o2o_deal` VALUES (11, '王五的麻辣烫', 1, 11, 2, '12', '/upload\\20180808\\9894f6f83fde80fe750c5466262f41c7.jpg', '&lt;p&gt;王五的麻辣烫&lt;/p&gt;', 1533634440, 1535016900, 76.00, 0.01, 8, 0, 67, 01533116100, 1535535300, '115.47632396694', '38.878828808895', 2, 0.00, '&lt;p&gt;不支持退款&lt;/p&gt;', 0, 1, 1533720943, 1533720943);
INSERT INTO `o2o_deal` VALUES (12, '迪迦', 1, 18, 2, '12,11,10,9', '/upload\\20180813\\e7e8cd580336494f928643a2983abeec.jpg', '&lt;p&gt;迪迦专卖店&lt;/p&gt;', 1534128420, 1535514600, 43534.00, 0.01, 8, 0, 34535, 01534042080, 1535016900, '115.47632396694', '38.878828808895', 2, 0.00, '&lt;p&gt;无退款，售后服务。。。&lt;/p&gt;', 0, -1, 1534128521, 1534130905);

-- ----------------------------
-- Table structure for o2o_featured
-- ----------------------------
DROP TABLE IF EXISTS `o2o_featured`;
CREATE TABLE `o2o_featured`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '推荐位标',
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `title` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `listorder` int(8) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of o2o_featured
-- ----------------------------
INSERT INTO `o2o_featured` VALUES (1, 0, '推荐位1', '/upload\\20180806\\8e353e1baf0376f8ad5fe2ec737b9410.jpg', 'http://www.hebeilmt.com', '推荐位1', 0, -1, 1533526575, 1533691342);
INSERT INTO `o2o_featured` VALUES (2, 0, '推荐', '/upload\\20180808\\713d39e46ed9c50af480f4c20f5e470e.jpg', 'http://www.hebeilmt.com', '河北六面体', 0, 1, 1533691381, 1533691381);
INSERT INTO `o2o_featured` VALUES (3, 0, '推荐位2', '/upload\\20180808\\8d0535923e8a148c973817e2e60ae9c3.png', 'http://www.hebeilmt.com', '河北六面体', 0, 1, 1533691414, 1533691414);
INSERT INTO `o2o_featured` VALUES (4, 0, '推荐位3', '/upload\\20180808\\89f8bcfc6d3140b224d7aef49123865f.jpg', 'http://www.hebeilmt.com', '河北六面体', 0, 1, 1533691438, 1533691438);
INSERT INTO `o2o_featured` VALUES (5, 1, '右侧1', '/upload\\20180808\\8f189b2de19e9595524cf727cd5884a4.jpg', 'http://www.baidu.com', '河北六面体', 0, -1, 1533691482, 1533692301);
INSERT INTO `o2o_featured` VALUES (6, 1, '右侧2', '/upload\\20180808\\490477e852c08ed68a43f52149484c54.jpg', 'http://www.hebeilmt.com', '河北六面体', 0, -1, 1533692199, 1533692700);
INSERT INTO `o2o_featured` VALUES (7, 1, '右侧3', '/upload\\20180808\\d4724b06502601585b1b15f0fe126db5.jpg', 'www.hebeilmt.com', '河北六面体', 0, 1, 1533692688, 1533692695);

-- ----------------------------
-- Table structure for o2o_order
-- ----------------------------
DROP TABLE IF EXISTS `o2o_order`;
CREATE TABLE `o2o_order`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `out_trade_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `transaction_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信返回订单号',
  `user_id` int(11) NOT NULL,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pay_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信返回支付时间',
  `payment_id` tinyint(1) NOT NULL DEFAULT 1,
  `deal_id` int(11) NOT NULL DEFAULT 0 COMMENT '商品id',
  `deal_count` int(11) NOT NULL DEFAULT 0 COMMENT '商品数量',
  `pay_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '支付状态 0：未支付 1支付成功 2 支付失败',
  `total_price` decimal(20, 2) NOT NULL DEFAULT 0.00 COMMENT '总价',
  `pay_amount` decimal(20, 2) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `referer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of o2o_order
-- ----------------------------
INSERT INTO `o2o_order` VALUES (1, '1533889099346637177', '', 1, 'huxiaole', '', 1, 11, 1, 0, 0.01, 0.00, 1, 'http://www.fangnuomi.com/index/order/confirm.html?id=11&count=1', 1533889099, 1533889099);
INSERT INTO `o2o_order` VALUES (2, '1533896718293724331', '', 1, 'huxiaole', '', 1, 11, 1, 0, 0.01, 0.00, 1, 'http://www.fangnuomi.com/index/order/confirm.html?id=11&count=1', 1533896718, 1533896718);
INSERT INTO `o2o_order` VALUES (3, '1533954009525635144', '', 1, 'huxiaole', '', 1, 11, 1, 0, 0.01, 0.00, 1, 'http://www.fangnuomi.com/index/order/confirm.html?id=11&count=1', 1533954009, 1533954009);
INSERT INTO `o2o_order` VALUES (4, '1533955156567135622', '', 1, 'huxiaole', '', 1, 11, 1, 0, 0.01, 0.00, 1, 'http://www.fangnuomi.com/index/order/confirm.html?id=11&count=1', 1533955156, 1533955156);
INSERT INTO `o2o_order` VALUES (5, '1534128653859729772', '', 1, 'huxiaole', '', 1, 12, 1, 0, 0.01, 0.00, 1, 'http://www.fangnuomi.com/index/order/confirm.html?id=12&count=1', 1534128653, 1534238136);
INSERT INTO `o2o_order` VALUES (6, '1534237053479519393', '', 2, 'zhangsan', '', 1, 11, 1, 0, 0.01, 0.00, 1, 'http://www.fangnuomi.com/index/order/confirm.html?id=11&count=1', 1534237053, 1534237986);
INSERT INTO `o2o_order` VALUES (7, '1534237517355663519', '', 2, 'zhangsan', '', 1, 11, 4, 0, 0.04, 0.00, 1, 'http://www.fangnuomi.com/index/order/confirm.html?id=11&count=1', 1534237517, 1534237950);
INSERT INTO `o2o_order` VALUES (8, '1534237518544054846', '', 2, 'zhangsan', '', 1, 11, 4, 0, 0.04, 0.00, -1, 'http://www.fangnuomi.com/index/order/confirm.html?id=11&count=1', 1534237518, 1534237518);

-- ----------------------------
-- Table structure for o2o_user
-- ----------------------------
DROP TABLE IF EXISTS `o2o_user`;
CREATE TABLE `o2o_user`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '前台用户表',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `last_login_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `last_login_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `listorder` int(8) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT ' 状态  0 未审核   1 通过  -1未通过  2已删除',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of o2o_user
-- ----------------------------
INSERT INTO `o2o_user` VALUES (1, 'huxiaole', 'ad4ed9656e5a0e638b6fcc81d0479b7d', '4502', '127.0.0.1', 1534231142, '1746671042@qq.com', '15614480650', 0, 0, 1534231142, 1534231142);
INSERT INTO `o2o_user` VALUES (2, 'zhangsan', '870e0f15b70edb4a313c9f562059d01f', '3101', '127.0.0.1', 1534232164, '1746671043@qq.com', '15614480650', 0, 1, 1534232037, 1534232164);

SET FOREIGN_KEY_CHECKS = 1;
