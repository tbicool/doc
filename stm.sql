/*
 Navicat Premium Data Transfer

 Source Server         : loc
 Source Server Type    : MySQL
 Source Server Version : 50525
 Source Host           : localhost
 Source Database       : stm

 Target Server Type    : MySQL
 Target Server Version : 50525
 File Encoding         : utf-8

 Date: 04/28/2014 13:15:22 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `qn_order`
-- ----------------------------
DROP TABLE IF EXISTS `qn_order`;
CREATE TABLE `qn_order` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(45) NOT NULL,
  `order_no` varchar(45) DEFAULT NULL,
  `all_price` varchar(45) DEFAULT NULL,
  `no_pay` varchar(45) DEFAULT NULL,
  `child_print_price` varchar(45) DEFAULT NULL,
  `child_face_value` varchar(45) DEFAULT NULL,
  `source` varchar(45) DEFAULT NULL,
  `policy_source` varchar(45) DEFAULT NULL,
  `ticket_mode` varchar(45) DEFAULT NULL,
  `policy_friendly` varchar(45) DEFAULT NULL,
  `pay_channel` varchar(45) DEFAULT NULL,
  `pay_status` varchar(45) DEFAULT NULL,
  `insurance_unit_price` varchar(45) DEFAULT NULL,
  `backnote` varchar(1024) DEFAULT NULL,
  `cabinnote` varchar(45) DEFAULT NULL,
  `insurance_cutting_price` varchar(45) DEFAULT NULL,
  `view_price` varchar(45) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  `pnr` varchar(45) DEFAULT NULL,
  `cpnr` varchar(45) DEFAULT NULL,
  `construction_fee` varchar(45) DEFAULT NULL,
  `fuel_tax` varchar(45) DEFAULT NULL,
  `child_fuel_tax` varchar(45) DEFAULT NULL,
  `policy_type` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `contact` varchar(45) DEFAULT NULL,
  `contact_mob` varchar(45) DEFAULT NULL,
  `contact_email` varchar(45) DEFAULT NULL,
  `create_time` varchar(45) DEFAULT NULL,
  `needps` varchar(45) DEFAULT NULL,
  `contact_tel` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `company` varchar(45) DEFAULT NULL,
  `exp_type` varchar(45) DEFAULT NULL,
  `ordernumber` varchar(45) DEFAULT NULL,
  `xcd_price` varchar(45) DEFAULT NULL,
  `xcd` varchar(45) DEFAULT NULL,
  `sjr` varchar(45) DEFAULT NULL,
  `sendtime` varchar(45) DEFAULT NULL,
  `refund_time` varchar(45) DEFAULT NULL COMMENT '退款时间，指定单变为退款完成的时间',
  `refund_price` varchar(45) DEFAULT NULL COMMENT '退款金额',
  `refund_no` varchar(45) DEFAULT NULL COMMENT '退款支付中心退款流水号',
  `refund_type` varchar(45) DEFAULT NULL COMMENT '退款类型，分为线上退款和线下退款',
  `purchanse_price` varchar(45) DEFAULT NULL COMMENT '采购金额',
  `issue_ticket_type` varchar(45) DEFAULT NULL COMMENT '采购：出票方式。取手工出票、订单代付、自动出票、B2C 出票、认证出票。',
  `issue_ticket_platform_code` varchar(45) DEFAULT NULL COMMENT '采购：出票平台',
  `source_transaction_id` varchar(45) DEFAULT NULL COMMENT '采购：支付平台流水号',
  `source_order_no` varchar(45) DEFAULT NULL COMMENT '采购源订单号',
  `tpp_type` varchar(45) DEFAULT NULL COMMENT '采购：支付方式。中文显示',
  `purchanse_status` varchar(45) DEFAULT NULL COMMENT '采购状态。取支付成功、待支付、支付成功有退款',
  `pay_commercial_no` varchar(45) DEFAULT NULL COMMENT '采购：支付商户订单号',
  `offline_pay_type` varchar(45) DEFAULT NULL COMMENT '采购：线下支付方式',
  `offline_pay_cardno` varchar(45) DEFAULT NULL COMMENT '采购：线下支付卡号',
  `platform_mem_id` varchar(45) DEFAULT NULL COMMENT ' 采购会员id',
  `operator` varchar(45) DEFAULT NULL COMMENT '采购：出票员',
  `pruchanse_refund_price` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Table structure for `qn_order_flight`
-- ----------------------------
DROP TABLE IF EXISTS `qn_order_flight`;
CREATE TABLE `qn_order_flight` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) DEFAULT NULL,
  `cabin` varchar(45) DEFAULT NULL,
  `ccabin` varchar(45) DEFAULT NULL,
  `dep` varchar(45) DEFAULT NULL,
  `arr` varchar(45) DEFAULT NULL,
  `dep_day` varchar(45) DEFAULT NULL,
  `dep_time` varchar(45) DEFAULT NULL,
  `arr_time` varchar(45) DEFAULT NULL,
  `real_code` varchar(45) DEFAULT NULL COMMENT '真实航班号,若不为空则是共享航班',
  `order_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Table structure for `qn_order_insurance`
-- ----------------------------
DROP TABLE IF EXISTS `qn_order_insurance`;
CREATE TABLE `qn_order_insurance` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `insurance_no` varchar(45) DEFAULT NULL COMMENT '保险单号null表示没有保单号数字表示有保单号',
  `bx_flight` varchar(45) DEFAULT NULL COMMENT '仅往返订单显示，第一程或第二程',
  `bx_status` varchar(45) DEFAULT NULL COMMENT '保险状态：待支付,出保中,已出保险,保单取消等待退款,退保成功等待退款,退款完成,已拆分',
  `order_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Table structure for `qn_order_log`
-- ----------------------------
DROP TABLE IF EXISTS `qn_order_log`;
CREATE TABLE `qn_order_log` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `operator` varchar(45) DEFAULT NULL,
  `time` varchar(45) DEFAULT NULL,
  `action` varchar(1024) DEFAULT NULL,
  `order_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2404 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Table structure for `qn_order_passenger`
-- ----------------------------
DROP TABLE IF EXISTS `qn_order_passenger`;
CREATE TABLE `qn_order_passenger` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `age_type` varchar(45) DEFAULT NULL COMMENT '乘机人类型0 为成人,1为儿童',
  `card_type` varchar(45) DEFAULT NULL COMMENT '乘机人证件类型:NI=身份证,PP=护照,ID=其他,HX=回乡证,TB=台胞证,GA=港澳通行证,HY=国际海员证',
  `price` varchar(45) DEFAULT NULL COMMENT '实际最终售价',
  `price_type` varchar(45) DEFAULT NULL COMMENT '报价类型，如：成人、成人套餐、儿童、儿童套餐、未知',
  `card_num` varchar(45) DEFAULT NULL COMMENT '乘机人证件号',
  `eticket_num` varchar(45) DEFAULT NULL COMMENT ' 票号',
  `insurance_count` varchar(45) DEFAULT NULL COMMENT '保险数量',
  `bx_source` varchar(45) DEFAULT NULL COMMENT '保单所在保险公司名字',
  `bx_name` varchar(45) DEFAULT NULL COMMENT '保单所属保险产品名字',
  `order_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Table structure for `st_common_count`
-- ----------------------------
DROP TABLE IF EXISTS `st_common_count`;
CREATE TABLE `st_common_count` (
  `id` bigint(20) NOT NULL,
  `type_name` varchar(45) DEFAULT NULL,
  `count` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

