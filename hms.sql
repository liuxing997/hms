/*
Navicat MySQL Data Transfer

Source Server         : Class
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : hms

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2021-08-12 10:24:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL COMMENT '主键ID',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `card` varchar(50) DEFAULT NULL COMMENT '身份证号',
  `phone` varchar(11) DEFAULT NULL COMMENT '座机号',
  `mobile` varchar(11) DEFAULT NULL COMMENT '手机号',
  `remainder` float(10,2) DEFAULT NULL COMMENT '会员余额',
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', '王五', '5002331999112022222', '134123456', '134123456', '6000.00');
INSERT INTO `customer` VALUES ('2', '狒兄', '5002331555115532122', '17347645215', '17347645215', '8000.00');
INSERT INTO `customer` VALUES ('3', '至尊兄', '5002331999112055222', '18626262625', '18626262625', '5000000.00');

-- ----------------------------
-- Table structure for enter
-- ----------------------------
DROP TABLE IF EXISTS `enter`;
CREATE TABLE `enter` (
  `enter_id` int(11) NOT NULL COMMENT '主键ID',
  `house_id` int(11) DEFAULT NULL COMMENT '房间id',
  `customer_id` int(11) DEFAULT NULL COMMENT '客人id',
  `customer_info` varchar(255) DEFAULT NULL COMMENT '客人详细信息因为一间屋子可以住多个人',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time_estimate` datetime DEFAULT NULL COMMENT '预估退房时间',
  `end_time_actual` datetime DEFAULT NULL COMMENT '实际退房时间',
  `order_customer_id` int(11) DEFAULT NULL COMMENT '订房者，订房者不一定是入住的人',
  `fee_total` float DEFAULT NULL COMMENT '已缴费总额',
  `fee_info` int(50) DEFAULT NULL COMMENT '缴费流水id集合',
  `user_id` int(11) DEFAULT NULL COMMENT '相关操作员id',
  `state` varchar(20) DEFAULT NULL COMMENT '状态,比如是否已结账',
  `price` float(10,2) DEFAULT NULL COMMENT '已谈好的房价',
  PRIMARY KEY (`enter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of enter
-- ----------------------------
INSERT INTO `enter` VALUES ('1', '1', '1', '1人', '2021-08-12 09:45:05', '2021-08-13 09:45:15', '2021-08-13 09:45:18', '3', '100', '1', '111111', '已结账', '100.00');

-- ----------------------------
-- Table structure for fee
-- ----------------------------
DROP TABLE IF EXISTS `fee`;
CREATE TABLE `fee` (
  `fee_id` int(11) NOT NULL COMMENT '主键id',
  `enter_id` int(11) DEFAULT NULL COMMENT '登记表的id',
  `direct` varchar(20) DEFAULT NULL COMMENT '缴费还是退费',
  `coustomer_id` int(11) DEFAULT NULL COMMENT '客户号',
  `money` float DEFAULT NULL COMMENT '房间号',
  `house_id` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL COMMENT '相关说明',
  `user_id` int(11) DEFAULT NULL COMMENT '操作员id',
  `fee_type` varchar(50) DEFAULT NULL COMMENT '现金、银行卡、微信、支付宝等等',
  PRIMARY KEY (`fee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fee
-- ----------------------------
INSERT INTO `fee` VALUES ('1', '1', '缴费', '3', '100', '1', '1人入住', '111111', '现金');

-- ----------------------------
-- Table structure for floor
-- ----------------------------
DROP TABLE IF EXISTS `floor`;
CREATE TABLE `floor` (
  `floor_id` int(11) NOT NULL COMMENT '主键ID',
  `name` varchar(50) DEFAULT NULL COMMENT '楼层名',
  PRIMARY KEY (`floor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of floor
-- ----------------------------
INSERT INTO `floor` VALUES ('1', '一楼');
INSERT INTO `floor` VALUES ('2', '二楼');
INSERT INTO `floor` VALUES ('3', '三楼');
INSERT INTO `floor` VALUES ('4', '四楼');
INSERT INTO `floor` VALUES ('5', '五楼');

-- ----------------------------
-- Table structure for house
-- ----------------------------
DROP TABLE IF EXISTS `house`;
CREATE TABLE `house` (
  `house_id` int(11) DEFAULT NULL COMMENT '主键ID',
  `name` varchar(50) DEFAULT NULL COMMENT '房间号',
  `amount` varchar(60) DEFAULT NULL COMMENT '可容纳人数的文字性说明',
  `price` float(10,2) DEFAULT NULL COMMENT '单价',
  `floor_id` int(2) DEFAULT NULL COMMENT '所在楼层',
  `state` varchar(60) DEFAULT NULL COMMENT '状态，在住、空闲、维修、已订 等等',
  `customer_id` int(20) DEFAULT NULL COMMENT '当前在住的customer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of house
-- ----------------------------
INSERT INTO `house` VALUES ('1', '101', '2', '100.00', '1', '入住', '1');
INSERT INTO `house` VALUES ('2', '102', '2', '100.00', '1', '空闲', null);
INSERT INTO `house` VALUES ('3', '103', '2', '100.00', '1', '空闲', null);
INSERT INTO `house` VALUES ('4', '104', '2', '100.00', '1', '空闲', null);
INSERT INTO `house` VALUES ('5', '105', '2', '100.00', '1', '空闲', null);
INSERT INTO `house` VALUES ('6', '201', '4', '150.00', '2', '空闲', null);
INSERT INTO `house` VALUES ('7', '202', '4', '150.00', '2', '空闲', null);
INSERT INTO `house` VALUES ('8', '203', '4', '150.00', '2', '空闲', null);
INSERT INTO `house` VALUES ('9', '204', '4', '150.00', '2', '空闲', null);
INSERT INTO `house` VALUES ('10', '205', '4', '150.00', '2', '空闲', null);
INSERT INTO `house` VALUES ('11', '301', '1', '200.00', '3', '空闲', null);
INSERT INTO `house` VALUES ('12', '302', '2', '100.00', '3', '空闲', null);
INSERT INTO `house` VALUES ('13', '303', '2', '100.00', '3', '空闲', null);
INSERT INTO `house` VALUES ('14', '304', '3', '240.00', '3', '空闲', null);
INSERT INTO `house` VALUES ('15', '305', '2', '100.00', '3', '空闲', null);
INSERT INTO `house` VALUES ('16', '401', '2', '100.00', '3', '空闲', null);
INSERT INTO `house` VALUES ('17', '402', '2', '100.00', '3', '空闲', null);
INSERT INTO `house` VALUES ('18', '403', '2', '100.00', '3', '空闲', null);
INSERT INTO `house` VALUES ('19', '404', '2', '100.00', '3', '空闲', null);
INSERT INTO `house` VALUES ('20', '405', '2', '240.00', '4', '空闲', null);
INSERT INTO `house` VALUES ('21', '501', '2', '240.00', '4', '空闲', null);
INSERT INTO `house` VALUES ('22', '502', '5', '666.00', '5', '空闲', null);
INSERT INTO `house` VALUES ('23', '503', '5', '666.00', '5', '空闲', null);
INSERT INTO `house` VALUES ('24', '504', '5', '666.00', '5', '空闲', null);
INSERT INTO `house` VALUES ('25', '505', '5', '666.00', '5', '空闲', null);
INSERT INTO `house` VALUES ('26', '601', '1', '100000', '6', '空闲', null);
-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(255) NOT NULL COMMENT '主键Id，同时可用于工牌编号',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `phone` varchar(50) NOT NULL COMMENT '联系电话',
  `state` varchar(5) DEFAULT NULL COMMENT '是否已禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('111111', 'lisi', '123456', '5233', '活动');
INSERT INTO `user` VALUES ('123456', 'zhangsan', '123456', '5244', '活动');
