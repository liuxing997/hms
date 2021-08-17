/*
Navicat MySQL Data Transfer

Source Server         : Class
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : hms

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2021-08-17 22:27:22
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
INSERT INTO `customer` VALUES ('1', '王五', '500233199911208888', '13522222222', '18555555555', '300.00');
INSERT INTO `customer` VALUES ('2', '狒兄', '5002331555115532122', '17347645215', '17347645215', '0.00');
INSERT INTO `customer` VALUES ('3', '至尊兄', '5002331999112055222', '18626262625', '18626262625', '4498900.00');
INSERT INTO `customer` VALUES ('4', '钱六', '505201198906020103', '18795471230', '18795471230', '11680.00');
INSERT INTO `customer` VALUES ('5', '韩寒', '500110192107212011', '13889444051', '13889444051', '210.00');
INSERT INTO `customer` VALUES ('6', 'hyh', '5002331111111111111', '1111111111', '11111111111', '2201.00');
INSERT INTO `customer` VALUES ('7', '测试', '501103201002100301', '17825063210', '17825063210', '12410.00');

-- ----------------------------
-- Table structure for enter
-- ----------------------------
DROP TABLE IF EXISTS `enter`;
CREATE TABLE `enter` (
  `enter_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `house_id` int(11) DEFAULT NULL COMMENT '房间id',
  `customer_id` int(11) DEFAULT NULL COMMENT '客人id',
  `customer_info` int(11) DEFAULT NULL COMMENT '客人详细信息因为一间屋子可以住多个人',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time_estimate` datetime DEFAULT NULL COMMENT '预估退房时间',
  `end_time_actual` datetime DEFAULT NULL COMMENT '实际退房时间',
  `fee_total` float DEFAULT NULL COMMENT '已缴费总额',
  `fee_info` varchar(255) DEFAULT NULL COMMENT '缴费流水id集合',
  `user_id` int(11) DEFAULT NULL COMMENT '相关操作员id',
  `state` varchar(20) DEFAULT NULL COMMENT '状态,比如是否已结账',
  `price` float(10,2) DEFAULT NULL COMMENT '已谈好的房价',
  PRIMARY KEY (`enter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of enter
-- ----------------------------
INSERT INTO `enter` VALUES ('1', '1', '1', '1', '2021-08-12 09:45:05', '2021-08-13 09:45:15', '2021-08-17 12:57:03', '100', '1', '111111', '未结账', '100.00');
INSERT INTO `enter` VALUES ('38', '5', '2', '2', '2021-08-16 12:59:48', '2021-08-18 12:59:48', '2021-08-16 13:24:04', '200', '1', '222222', '已结账', '100.00');
INSERT INTO `enter` VALUES ('39', '3', '1', '1', '2021-08-16 13:10:01', '2021-08-18 13:10:01', '2021-08-16 13:40:54', '1000', '1', '222222', '已结账', '500.00');
INSERT INTO `enter` VALUES ('40', '4', '2', '1', '2021-08-16 13:43:05', '2021-08-18 13:43:05', '2021-08-16 13:48:15', '200', '1', '222222', '已结账', '100.00');
INSERT INTO `enter` VALUES ('41', '6', '1', '2', '2021-08-16 13:45:43', '2021-08-18 13:45:43', '2021-08-16 14:24:59', '300', '1', '222222', '已结账', '150.00');
INSERT INTO `enter` VALUES ('42', '1', '2', '1', '2021-08-16 13:47:58', '2021-08-19 13:47:58', '2021-08-16 13:48:06', '450', '1', '222222', '已结账', '150.00');
INSERT INTO `enter` VALUES ('45', '3', '3', '2', '2021-08-16 14:17:55', '2021-08-18 14:17:55', '2021-08-16 14:24:46', '1000', '1', '222222', '已结账', '500.00');
INSERT INTO `enter` VALUES ('46', '6', '1', '2', '2021-08-16 14:20:37', '2021-08-18 14:20:37', '2021-08-16 14:24:59', '300', '1', '222222', '已结账', '150.00');
INSERT INTO `enter` VALUES ('47', '5', '3', '3', '2021-08-16 14:36:40', '2021-08-19 14:36:40', '2021-08-16 16:07:21', '300', '1', '222222', '已结账', '100.00');
INSERT INTO `enter` VALUES ('50', '11', '3', '3', '2021-08-16 14:58:19', '2021-08-19 14:58:19', '2021-08-16 16:07:37', '600', '1', '222222', '已结账', '200.00');
INSERT INTO `enter` VALUES ('51', '12', '4', '1', '2021-08-16 15:21:27', '2021-08-18 15:21:27', '2021-08-16 16:07:46', '200', '1', '222222', '已结账', '100.00');
INSERT INTO `enter` VALUES ('52', '4', '4', '2', '2021-08-16 15:48:25', '2021-08-18 15:48:25', '2021-08-16 16:07:15', '200', '1', '555555', '已结账', '100.00');
INSERT INTO `enter` VALUES ('53', '5', '2', '2', '2021-08-17 08:45:53', '2021-08-19 08:45:53', '2021-08-16 16:07:15', '200', '1', '111111', '已结账', '100.00');
INSERT INTO `enter` VALUES ('54', '10', '5', '2', '2021-08-17 08:46:08', '2021-08-22 08:46:08', '2021-08-17 09:58:58', '750', '1', '111111', '已结账', '150.00');
INSERT INTO `enter` VALUES ('55', '1', '5', '2', '2021-08-17 08:48:17', '2021-08-19 08:48:17', '2021-08-17 09:21:04', '300', '1', '222222', '已结账 ', '150.00');
INSERT INTO `enter` VALUES ('56', '2', '2', '2', '2021-08-17 09:25:17', '2021-08-19 09:25:17', '2021-08-17 11:50:04', '1000', '1', '222222', '未结账', '500.00');
INSERT INTO `enter` VALUES ('57', '10', '3', '2', '2021-08-17 09:49:46', '2021-08-19 09:49:46', '2021-08-17 09:50:08', '300', '1', '222222', '待结账', '150.00');
INSERT INTO `enter` VALUES ('58', '9', '1', '1', '2021-08-17 09:51:45', '2021-08-18 09:51:45', '2021-08-17 09:52:18', '150', '1', '222222', '待结账', '150.00');
INSERT INTO `enter` VALUES ('59', '10', '5', '1', '2021-08-17 09:58:51', '2021-08-19 09:58:51', '2021-08-17 09:58:58', '300', '1', '222222', '已结账', '150.00');
INSERT INTO `enter` VALUES ('60', '7', '6', '2', '2021-08-17 10:01:34', '2021-08-23 10:01:34', '2021-08-17 10:01:59', '900', '1', '222222', '已结账', '150.00');
INSERT INTO `enter` VALUES ('62', '4', '1', '1', '2021-08-17 10:42:38', '2021-08-18 10:42:38', '2021-08-17 10:42:49', '100', '1', '222222', '已结账', '100.00');
INSERT INTO `enter` VALUES ('67', '4', '6', '2', '2021-08-17 12:52:35', '2021-08-19 12:52:35', '2021-08-17 12:52:50', '200', '122240158', '222222', '已结账', '100.00');
INSERT INTO `enter` VALUES ('68', '6', '2', '2', '2021-08-17 13:48:23', '2021-08-19 13:48:23', '2021-08-17 13:58:34', '300', '1', '222222', '已结账', '150.00');
INSERT INTO `enter` VALUES ('69', '7', '3', '2', '2021-08-17 13:49:20', '2021-08-19 13:49:20', '2021-08-17 13:49:36', '300', '1', '222222', '已结账', '150.00');
INSERT INTO `enter` VALUES ('70', '12', '6', '2', '2021-08-17 13:50:45', '2021-08-19 13:50:45', '2021-08-17 13:51:33', '200', '1', '222222', '已结账', '100.00');
INSERT INTO `enter` VALUES ('71', '24', '3', '1', '2021-08-17 14:27:20', '2021-08-22 14:27:20', '2021-08-17 14:27:50', '2500000', '1', '222222', '已结账', '500000.00');
INSERT INTO `enter` VALUES ('72', '2', '6', '1', '2021-08-17 14:29:03', '2021-08-22 14:29:03', '2021-08-17 14:29:26', '2500', '501698573', '222222', '已结账', '500.00');
INSERT INTO `enter` VALUES ('73', '4', '5', '1', '2021-08-17 14:30:25', '2021-08-19 14:30:25', '2021-08-17 21:16:09', '200', '501698194', '222222', '未结账', '100.00');
INSERT INTO `enter` VALUES ('74', '15', '5', '2', '2021-08-17 15:58:39', '2021-08-18 15:58:39', '2021-08-17 15:59:05', '100', '1', '222222', '已结账', '100.00');
INSERT INTO `enter` VALUES ('75', '16', '5', '2', '2021-08-17 15:59:21', '2021-08-19 15:59:21', '2021-08-17 15:59:45', '200', '501698195', '222222', '已结账', '100.00');
INSERT INTO `enter` VALUES ('76', '6', '5', '1', '2021-08-17 16:05:52', '2021-08-18 16:05:52', '2021-08-17 20:23:44', '150', '1', '222222', '已结账', '150.00');
INSERT INTO `enter` VALUES ('77', '7', '5', '1', '2021-08-17 16:06:57', '2021-08-19 16:06:57', '2021-08-17 22:22:41', '300', '719543278', '222222', '未结账', '150.00');
INSERT INTO `enter` VALUES ('78', '2', '2', '2', '2021-08-17 19:06:27', '2021-08-19 19:06:27', null, '1000', '1629198387606', '222222', '已结账', '500.00');
INSERT INTO `enter` VALUES ('79', '3', '5', '1', '2021-08-17 19:10:45', '2021-08-20 19:10:45', '2021-08-17 20:53:29', '1500', '202181719111433', '222222', '未结账', '500.00');
INSERT INTO `enter` VALUES ('80', '6', '5', '2', '2021-08-17 19:14:16', '2021-08-19 19:14:16', '2021-08-17 20:23:44', '300', '1629198856670', '222222', '已结账', '150.00');
INSERT INTO `enter` VALUES ('81', '8', '5', '1', '2021-08-17 19:15:19', '2021-08-22 19:15:19', '2021-08-17 19:19:24', '750', '202181719193372', '222222', '已结账', '150.00');
INSERT INTO `enter` VALUES ('82', '11', '5', '2', '2021-08-17 20:22:23', '2021-08-19 20:22:23', '2021-08-17 21:15:15', '400', '1629202943867', '222222', '已结账', '200.00');
INSERT INTO `enter` VALUES ('83', '4', '5', '2', '2021-08-17 20:23:11', '2021-08-19 20:23:11', '2021-08-17 21:16:09', '200', '2021817202411994', '222222', '未结账', '100.00');
INSERT INTO `enter` VALUES ('84', '3', '5', '1', '2021-08-17 20:53:17', '2021-08-22 20:53:17', '2021-08-17 20:53:29', '2500', '2021817205341106', '222222', '已结账', '500.00');
INSERT INTO `enter` VALUES ('85', '4', '5', '1', '2021-08-17 21:14:13', '2021-08-18 21:14:13', '2021-08-17 21:16:09', '100', '2021817211612324', '222222', '已结账', '100.00');
INSERT INTO `enter` VALUES ('86', '6', '5', '1', '2021-08-17 21:20:55', '2021-08-20 21:20:55', null, '0', '1629206455176', '222222', '未结账', '150.00');
INSERT INTO `enter` VALUES ('87', '7', '5', '2', '2021-08-17 22:22:21', '2021-08-19 22:22:21', '2021-08-17 22:22:41', '300', '2021817222245224', '222222', '已结账', '150.00');

-- ----------------------------
-- Table structure for fee
-- ----------------------------
DROP TABLE IF EXISTS `fee`;
CREATE TABLE `fee` (
  `fee_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `enter_id` int(11) DEFAULT NULL COMMENT '登记表的id',
  `direct` varchar(20) DEFAULT NULL COMMENT '缴费还是退费',
  `coustomer_id` int(11) DEFAULT NULL COMMENT '客户号',
  `money` float DEFAULT NULL COMMENT '金额',
  `house_id` int(11) DEFAULT NULL COMMENT '房间号',
  `description` varchar(255) DEFAULT NULL COMMENT '相关说明',
  `user_id` int(11) DEFAULT NULL COMMENT '操作员id',
  `fee_type` varchar(50) DEFAULT NULL COMMENT '现金、银行卡、微信、支付宝等等',
  PRIMARY KEY (`fee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fee
-- ----------------------------
INSERT INTO `fee` VALUES ('1', '1', '缴费', '3', '100', '1', '1人入住', '111111', '现金');
INSERT INTO `fee` VALUES ('10', '33', '缴费', '1', '1500', '3', '1人已入住', '444444', '会员卡扣费');
INSERT INTO `fee` VALUES ('11', '34', '缴费', '2', '200', '4', '1人已入住', '444444', '会员卡扣费');
INSERT INTO `fee` VALUES ('12', '35', '缴费', '2', '1000', '3', '1人已入住', '444444', '会员卡扣费');
INSERT INTO `fee` VALUES ('13', '36', '缴费', '1', '200', '5', '1人已入住', '444444', '会员卡扣费');
INSERT INTO `fee` VALUES ('14', '37', '缴费', '2', '200', '4', '2人已入住', '222222', '会员卡扣费');
INSERT INTO `fee` VALUES ('15', '38', '缴费', '2', '200', '5', '2人已入住', '222222', '会员卡扣费');
INSERT INTO `fee` VALUES ('16', '39', '缴费', '1', '1000', '3', '1人已入住', '222222', '会员卡扣费');
INSERT INTO `fee` VALUES ('17', '40', '缴费', '2', '200', '4', '1人已入住', '222222', '会员卡扣费');
INSERT INTO `fee` VALUES ('18', '41', '缴费', '1', '300', '6', '2人已入住', '222222', '会员卡扣费');
INSERT INTO `fee` VALUES ('19', '42', '缴费', '2', '450', '1', '1人已入住', '222222', '会员卡扣费');
INSERT INTO `fee` VALUES ('20', '43', '缴费', '1', '200', '5', '2人已入住', '222222', '会员卡扣费');
INSERT INTO `fee` VALUES ('21', '45', '缴费', '3', '1000', '3', '2人已入住', '222222', '会员卡扣费');
INSERT INTO `fee` VALUES ('22', '46', '缴费', '1', '300', '6', '2人已入住', '222222', '会员卡扣费');
INSERT INTO `fee` VALUES ('23', '47', '缴费', '3', '300', '5', '3人已入住', '222222', '会员卡扣费');
INSERT INTO `fee` VALUES ('24', '48', '缴费', '1', '300', '7', '2人已入住', '222222', '现金');
INSERT INTO `fee` VALUES ('25', '49', '缴费', '1', '300', '9', '2人已入住', '222222', '现金');
INSERT INTO `fee` VALUES ('26', '50', '缴费', '3', '600', '11', '3人已入住', '222222', '会员卡扣费');
INSERT INTO `fee` VALUES ('27', '51', '缴费', '4', '200', '12', '1人已入住', '222222', '会员卡扣费');
INSERT INTO `fee` VALUES ('28', '52', '缴费', '4', '200', '4', '2人已入住', '555555', '会员卡扣费');
INSERT INTO `fee` VALUES ('29', '53', '缴费', '2', '200', '5', '2人已入住', '111111', '会员卡扣费');
INSERT INTO `fee` VALUES ('30', '54', '缴费', '5', '750', '10', '2人已入住', '111111', '现金');
INSERT INTO `fee` VALUES ('31', '55', '缴费', '5', '300', '1', '2人已入住', '222222', '现金');
INSERT INTO `fee` VALUES ('32', '56', '缴费', '2', '1000', '2', '2人已入住', '222222', '现金');
INSERT INTO `fee` VALUES ('33', '57', '缴费', '3', '300', '10', '2人已入住', '222222', '会员卡扣费');
INSERT INTO `fee` VALUES ('34', '58', '缴费', '1', '150', '9', '1人已入住', '222222', '会员卡扣费');
INSERT INTO `fee` VALUES ('35', '59', '缴费', '5', '300', '10', '1人已入住', '222222', '会员卡扣费');
INSERT INTO `fee` VALUES ('36', '60', '缴费', '6', '900', '7', '2人已入住', '222222', '现金');
INSERT INTO `fee` VALUES ('37', '61', '缴费', '6', '400', '11', '2人已入住', '222222', '现金');
INSERT INTO `fee` VALUES ('38', '62', '缴费', '1', '100', '4', '1人已入住', '222222', '会员卡扣费');
INSERT INTO `fee` VALUES ('39', '63', '缴费', '1', '450', '1', '2人已入住', '222222', '支付宝');
INSERT INTO `fee` VALUES ('40', '64', '缴费', '1', '600', '1', '2人已入住', '222222', '现金');
INSERT INTO `fee` VALUES ('41', '65', '未缴费', '5', '1000', '3', '1人已入住', '222222', '未缴费');
INSERT INTO `fee` VALUES ('42', '66', '缴费', '2', '1000', '2', '2人已入住', '222222', '现金');
INSERT INTO `fee` VALUES ('43', '67', '缴费', '6', '200', '4', '2人已入住', '222222', '支付宝');
INSERT INTO `fee` VALUES ('44', '68', '缴费', '2', '300', '6', '2人已入住', '222222', '会员卡扣费');
INSERT INTO `fee` VALUES ('45', '69', '缴费', '3', '300', '7', '2人已入住', '222222', '会员卡扣费');
INSERT INTO `fee` VALUES ('46', '70', '缴费', '6', '200', '12', '2人已入住', '222222', '现金');
INSERT INTO `fee` VALUES ('47', '71', '缴费', '3', '2500000', '24', '1人已入住', '222222', '会员卡扣费');
INSERT INTO `fee` VALUES ('48', '72', '缴费', '6', '2500', '2', '1人已入住', '222222', '支付宝');
INSERT INTO `fee` VALUES ('49', '73', '缴费', '5', '200', '4', '1人已入住', '222222', '支付宝');
INSERT INTO `fee` VALUES ('50', '74', '缴费', '5', '100', '15', '2人已入住', '222222', '会员卡扣费');
INSERT INTO `fee` VALUES ('51', '75', '缴费', '5', '200', '16', '2人已入住', '222222', '支付宝');
INSERT INTO `fee` VALUES ('52', '76', '缴费', '5', '150', '6', '1人已入住', '222222', '会员卡扣费');
INSERT INTO `fee` VALUES ('53', '77', '未缴费', '5', '300', '7', '1人已入住', '222222', '支付宝支付中');
INSERT INTO `fee` VALUES ('54', '78', '缴费', '2', '1000', '2', '2人已入住', '222222', '会员卡扣费');
INSERT INTO `fee` VALUES ('55', '79', '未缴费', '5', '1500', '3', '1人已入住', '222222', '支付宝支付中');
INSERT INTO `fee` VALUES ('56', '80', '缴费', '5', '300', '6', '2人已入住', '222222', '会员卡扣费');
INSERT INTO `fee` VALUES ('57', '81', '未缴费', '5', '750', '8', '1人已入住', '222222', '支付宝支付中');
INSERT INTO `fee` VALUES ('58', '82', '缴费', '5', '400', '11', '2人已入住', '222222', '会员卡扣费');
INSERT INTO `fee` VALUES ('59', '83', '未缴费', '5', '200', '4', '2人已入住', '222222', '支付宝支付中');
INSERT INTO `fee` VALUES ('60', '84', '未缴费', '5', '2500', '3', '1人已入住', '222222', '支付宝支付中');
INSERT INTO `fee` VALUES ('61', '85', '未缴费', '5', '100', '4', '1人已入住', '222222', '支付宝支付中');
INSERT INTO `fee` VALUES ('62', '86', '未缴费', '5', '450', '6', '1人已入住', '222222', '未缴费');
INSERT INTO `fee` VALUES ('63', '87', '未缴费', '5', '300', '7', '2人已入住', '222222', '支付宝支付中');

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
INSERT INTO `house` VALUES ('1', '101', '2', '150.00', '1', '维修', null);
INSERT INTO `house` VALUES ('2', '102', '2', '500.00', '1', '入住', '2');
INSERT INTO `house` VALUES ('3', '103', '2', '500.00', '1', '打扫', null);
INSERT INTO `house` VALUES ('4', '104', '2', '100.00', '1', '打扫', null);
INSERT INTO `house` VALUES ('5', '105', '2', '100.00', '1', '已定', '1');
INSERT INTO `house` VALUES ('6', '201', '4', '150.00', '2', '入住', '5');
INSERT INTO `house` VALUES ('7', '202', '4', '150.00', '2', '打扫', null);
INSERT INTO `house` VALUES ('8', '203', '4', '150.00', '2', '空闲', null);
INSERT INTO `house` VALUES ('11', '301', '1', '200.00', '3', '打扫', null);
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
INSERT INTO `house` VALUES ('24', '504', '2', '500000.00', '5', '空闲', null);
INSERT INTO `house` VALUES ('25', '505', '4', '5000.00', '5', '空闲', null);
INSERT INTO `house` VALUES ('26', '701', '50', '500000.00', '7', '空闲', null);

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
INSERT INTO `user` VALUES ('111111', 'liuxing', 'e5ec17526b31f0f788adda998ca90985', '18888888888', '活动');
INSERT INTO `user` VALUES ('222222', 'nrd', '12ce18a8d6c0b9978cfe0a843ddfbc9d', '13667777777', '活动');
INSERT INTO `user` VALUES ('232424', 'liuxing1', '62ff374856390347d73118985c06abb5', '1141412414', '活动');
INSERT INTO `user` VALUES ('333333', 'zzy', '4b452940e12efbce7fb939fb80d816fc', '19823234224', '活动');
INSERT INTO `user` VALUES ('444444', 'fj', 'a00fbd7d2fb7e08f8c48cb2887548a15', '1366999999999', '禁用');
INSERT INTO `user` VALUES ('555555', 'hjh', '7077f7f20b9e45faf464d862191c80c9', '12411415985', '禁用');
INSERT INTO `user` VALUES ('888888', 'zhangsan', '464417c490a2935ed383be70975dfc7d', '14141531515', '其他');
INSERT INTO `user` VALUES ('999999', 'lisi', '72fc30577f51cea8641b745bbc292c6e', '12397129721', '禁用');
