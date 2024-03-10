/*
 Navicat Premium Data Transfer

 Source Server         : 10.1.1.3_3310
 Source Server Type    : MySQL
 Source Server Version : 50743
 Source Host           : 10.1.1.3:3310
 Source Schema         : market_emotion

 Target Server Type    : MySQL
 Target Server Version : 50743
 File Encoding         : 65001

 Date: 10/03/2024 18:52:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for marketemo
-- ----------------------------
DROP TABLE IF EXISTS `marketemo`;
CREATE TABLE `marketemo`  (
  `date` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '日期',
  `lbs` int(255) DEFAULT NULL COMMENT '连扳数',
  `bd` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '标的',
  `sjzt` int(255) DEFAULT NULL COMMENT '实际涨停',
  `sjdt` int(255) DEFAULT NULL COMMENT '实际跌停',
  PRIMARY KEY (`date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of marketemo
-- ----------------------------
INSERT INTO `marketemo` VALUES ('2023-12-01', 7, '东安动力', 50, 2);
INSERT INTO `marketemo` VALUES ('2023-12-04', 8, '东安动力', 54, 2);
INSERT INTO `marketemo` VALUES ('2023-12-05', 9, '东安动力', 39, 2);
INSERT INTO `marketemo` VALUES ('2023-12-06', 7, '南京商旅', 38, 6);
INSERT INTO `marketemo` VALUES ('2023-12-07', 6, '信雅达', 39, 16);
INSERT INTO `marketemo` VALUES ('2023-12-08', 3, '文投股份，四川金顶，标准股份', 33, 13);
INSERT INTO `marketemo` VALUES ('2023-12-11', 4, '文投股份，四川金顶', 39, 1);
INSERT INTO `marketemo` VALUES ('2023-12-12', 5, '文投股份，四川金顶', 43, 1);
INSERT INTO `marketemo` VALUES ('2023-12-13', 6, '文投股份，四川金顶', 36, 1);
INSERT INTO `marketemo` VALUES ('2023-12-14', 6, '苏州科达', 39, 9);
INSERT INTO `marketemo` VALUES ('2023-12-15', 5, '南宁百货', 44, 3);
INSERT INTO `marketemo` VALUES ('2023-12-18', 3, '实丰文化，内蒙新华，龙头股份', 36, 12);
INSERT INTO `marketemo` VALUES ('2023-12-19', 4, '实丰文化', 26, 13);
INSERT INTO `marketemo` VALUES ('2023-12-20', 4, '星光农机', 31, 9);
INSERT INTO `marketemo` VALUES ('2023-12-21', 5, '星光农机', 36, 4);
INSERT INTO `marketemo` VALUES ('2023-12-22', 4, '永达股份', 20, 50);
INSERT INTO `marketemo` VALUES ('2023-12-25', 4, '亚世光电', 33, 22);
INSERT INTO `marketemo` VALUES ('2023-12-26', 5, '亚世光电', 37, 9);
INSERT INTO `marketemo` VALUES ('2023-12-27', 6, '亚世光电', 29, 17);
INSERT INTO `marketemo` VALUES ('2023-12-28', 7, '亚世光电', 58, 8);
INSERT INTO `marketemo` VALUES ('2023-12-29', 8, '亚世光电', 62, 1);
INSERT INTO `marketemo` VALUES ('2024-01-02', 9, '亚世光电', 52, 2);
INSERT INTO `marketemo` VALUES ('2024-01-03', 5, '神马电力，力鼎光电', 36, 8);
INSERT INTO `marketemo` VALUES ('2024-01-04', 4, '利伯特', 39, 8);
INSERT INTO `marketemo` VALUES ('2024-01-05', 4, '长白山', 24, 8);
INSERT INTO `marketemo` VALUES ('2024-01-08', 5, '长白山', 33, 11);
INSERT INTO `marketemo` VALUES ('2024-01-09', 6, '长白山', 44, 6);
INSERT INTO `marketemo` VALUES ('2024-01-10', 7, '长白山', 38, 11);
INSERT INTO `marketemo` VALUES ('2024-01-11', 4, '中兴商业', 56, 0);
INSERT INTO `marketemo` VALUES ('2024-01-12', 4, '深中华A，公元股份', 26, 4);
INSERT INTO `marketemo` VALUES ('2024-01-15', 5, '深中华A', 36, 4);
INSERT INTO `marketemo` VALUES ('2024-01-16', 6, '深中华A', 32, 3);
INSERT INTO `marketemo` VALUES ('2024-01-17', 7, '深中华A', 33, 8);
INSERT INTO `marketemo` VALUES ('2024-01-18', 8, '深中华A', 38, 8);
INSERT INTO `marketemo` VALUES ('2024-01-19', 9, '深中华A', 40, 23);
INSERT INTO `marketemo` VALUES ('2024-01-22', 10, '深中华A', 17, 71);
INSERT INTO `marketemo` VALUES ('2024-01-23', 11, '深中华A', 44, 26);
INSERT INTO `marketemo` VALUES ('2024-01-24', 7, '哈桑股份', 74, 3);
INSERT INTO `marketemo` VALUES ('2024-01-25', 4, '特发信息', 104, 3);
INSERT INTO `marketemo` VALUES ('2024-01-26', 5, '特发信息', 60, 7);
INSERT INTO `marketemo` VALUES ('2024-01-29', 5, '中视传媒，长江投资，畅联股份，上海凤凰，浦东金桥，中华企业', 28, 55);
INSERT INTO `marketemo` VALUES ('2024-01-30', 6, '中视传媒，长江投资', 22, 64);
INSERT INTO `marketemo` VALUES ('2024-01-31', 7, '中视传媒', 27, 128);
INSERT INTO `marketemo` VALUES ('2024-02-01', 8, '中视传媒(10天9板)', 30, 47);
INSERT INTO `marketemo` VALUES ('2024-02-02', 4, '中马传动', 26, 47);
INSERT INTO `marketemo` VALUES ('2024-02-05', 4, '中基健康', 17, 1280);
INSERT INTO `marketemo` VALUES ('2024-02-06', 5, '中基健康', 135, 86);
INSERT INTO `marketemo` VALUES ('2024-02-07', 5, '克来机电', 93, 243);
INSERT INTO `marketemo` VALUES ('2024-02-08', 6, '克来机电', 504, 2);
INSERT INTO `marketemo` VALUES ('2024-02-19', 7, '克来机电', 237, 0);
INSERT INTO `marketemo` VALUES ('2024-02-20', 8, '克来机电', 104, 0);
INSERT INTO `marketemo` VALUES ('2024-02-21', 9, '克来机电', 131, 0);
INSERT INTO `marketemo` VALUES ('2024-02-22', 10, '克来机电', 78, 0);
INSERT INTO `marketemo` VALUES ('2024-02-23', 11, '克来机电', 114, 0);
INSERT INTO `marketemo` VALUES ('2024-02-26', 12, '克来机电', 106, 0);
INSERT INTO `marketemo` VALUES ('2024-02-27', 13, '克来机电', 97, 1);
INSERT INTO `marketemo` VALUES ('2024-02-28', 8, '国脉文化，华扬联众', 31, 275);
INSERT INTO `marketemo` VALUES ('2024-02-29', 5, '东方精工', 106, 1);
INSERT INTO `marketemo` VALUES ('2024-03-01', 6, '东方精工', 71, 3);
INSERT INTO `marketemo` VALUES ('2024-03-04', 5, '四川金顶，安奈儿', 73, 4);
INSERT INTO `marketemo` VALUES ('2024-03-05', 6, '安奈儿', 47, 2);
INSERT INTO `marketemo` VALUES ('2024-03-06', 7, '安奈儿', 84, 0);
INSERT INTO `marketemo` VALUES ('2024-03-07', 5, '文投控股', 66, 3);
INSERT INTO `marketemo` VALUES ('2024-03-08', 4, '艾艾精工,立航科技,安彩高科,上海护工', 63, 2);

SET FOREIGN_KEY_CHECKS = 1;
