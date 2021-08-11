/*
Navicat MySQL Data Transfer

Source Server         : Class
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : hms

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2021-08-11 17:57:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL COMMENT '主键ID',
  `name` varchar(100) DEFAULT NULL COMMENT '姓名',
  `card` varchar(100) DEFAULT NULL COMMENT '身份证号',
  `phone` varchar(40) DEFAULT NULL COMMENT '座机号',
  `mobile` varchar(50) DEFAULT NULL COMMENT '手机号',
  `remainder` float DEFAULT NULL COMMENT '会员余额',
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------

-- ----------------------------
-- Table structure for enter
-- ----------------------------
DROP TABLE IF EXISTS `enter`;
CREATE TABLE `enter` (
  `主键ID` int(11) NOT NULL COMMENT '主键ID',
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
  `state` varchar(255) DEFAULT NULL COMMENT '状态,比如是否已结账',
  `price` float DEFAULT NULL COMMENT '已谈好的房价',
  PRIMARY KEY (`主键ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of enter
-- ----------------------------

-- ----------------------------
-- Table structure for fee
-- ----------------------------
DROP TABLE IF EXISTS `fee`;
CREATE TABLE `fee` (
  `fee_id` int(11) NOT NULL COMMENT '主键id',
  `enter_id` int(11) DEFAULT NULL COMMENT '登记表的id',
  `direct` varchar(255) DEFAULT NULL COMMENT '缴费还是退费',
  `coustomer_id` int(11) DEFAULT NULL COMMENT '客户号',
  `money` float DEFAULT NULL COMMENT '房间号',
  `house_id` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL COMMENT '相关说明',
  `user_id` int(11) DEFAULT NULL COMMENT '操作员id',
  `fee_type` varchar(255) DEFAULT NULL COMMENT '现金、银行卡、微信、支付宝等等',
  PRIMARY KEY (`fee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fee
-- ----------------------------

-- ----------------------------
-- Table structure for floor
-- ----------------------------
DROP TABLE IF EXISTS `floor`;
CREATE TABLE `floor` (
  `floor_id` int(11) NOT NULL COMMENT '主键ID',
  `name` varchar(255) DEFAULT NULL COMMENT '楼层名',
  PRIMARY KEY (`floor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of floor
-- ----------------------------

-- ----------------------------
-- Table structure for house
-- ----------------------------
DROP TABLE IF EXISTS `house`;
CREATE TABLE `house` (
  `house_id` int(11) NOT NULL COMMENT '主键ID',
  `name` varchar(255) DEFAULT NULL COMMENT '房间号',
  `amount` varchar(255) DEFAULT NULL COMMENT '可容纳人数的文字性说明',
  `price` float(10,2) DEFAULT NULL COMMENT '单价',
  `floor_id` int(2) DEFAULT NULL COMMENT '所在楼层',
  `state` varchar(255) DEFAULT NULL COMMENT '状态，在住、空闲、维修、已订 等等',
  `customer_id` int(20) DEFAULT NULL COMMENT '当前在住的customer',
  PRIMARY KEY (`house_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of house
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` varchar(20) NOT NULL COMMENT '操作员id',
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键Id，同时可用于工牌编号',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `phone` varchar(255) NOT NULL,
  `state` varchar(255) DEFAULT NULL COMMENT '是否已禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
