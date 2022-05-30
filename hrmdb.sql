/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 80018
Source Host           : localhost:3306
Source Database       : hrmdb

Target Server Type    : MYSQL
Target Server Version : 80018
File Encoding         : 65001

Date: 2022-05-30 13:47:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_department`
-- ----------------------------
DROP TABLE IF EXISTS `t_department`;
CREATE TABLE `t_department` (
  `deptId` int(11) NOT NULL AUTO_INCREMENT,
  `deptName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `deptDescription` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`deptId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_department
-- ----------------------------
INSERT INTO `t_department` VALUES ('1', 'Civil Eng', 'Civil Eng');
INSERT INTO `t_department` VALUES ('2', 'IT', 'IT');
INSERT INTO `t_department` VALUES ('3', 'bb', 'bb');
INSERT INTO `t_department` VALUES ('4', 'tttt', 'ttt');

-- ----------------------------
-- Table structure for `t_message`
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message` (
  `messageid` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `senderid` int(11) DEFAULT NULL,
  `receiverid` int(11) DEFAULT NULL,
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`messageid`),
  KEY `fk_sender` (`senderid`),
  KEY `fk_receiver` (`receiverid`),
  CONSTRAINT `fk_receiver` FOREIGN KEY (`receiverid`) REFERENCES `t_user` (`userid`),
  CONSTRAINT `fk_sender` FOREIGN KEY (`senderid`) REFERENCES `t_user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_message
-- ----------------------------
INSERT INTO `t_message` VALUES ('1', 'oiuyto', 'iuytoiuyoiuypoiuypoiuyuiopoiuypoiuyioiuy', '3', '1', '2022-05-25 19:51:17', 'read');
INSERT INTO `t_message` VALUES ('2', 'qqee', 'certificate', '1', '2', '2022-05-25 19:56:41', 'read');
INSERT INTO `t_message` VALUES ('3', 'aaaa', 'gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg', '1', '3', '2022-05-25 19:59:25', 'sent');
INSERT INTO `t_message` VALUES ('4', 'aaaa', 'aaaaa', '1', '3', '2022-05-25 20:02:23', 'sent');
INSERT INTO `t_message` VALUES ('5', 'weeewew', 'ewewweeeeeeeeeeeeeet wteeeeeeeeeeee', '1', '2', '2022-05-26 14:10:47', 'sent');
INSERT INTO `t_message` VALUES ('6', 'RE: oiuyto', 'rrrrrrrrreeee rereretertert', '2', '1', '2022-05-26 14:18:27', 'sent');
INSERT INTO `t_message` VALUES ('7', 'RE: aaaa', 'qqeeqeqqee', '3', '1', '2022-05-27 19:00:08', 'read');
INSERT INTO `t_message` VALUES ('8', 'aaaaa', 'eqeqeqettttttttt', '1', '3', '2022-05-27 19:07:28', 'sent');
INSERT INTO `t_message` VALUES ('10', 'jytuiytuio', 'jshdhjdhjdhj \r\nhhfhf', '1', '3', '2022-05-27 23:26:59', 'sent');
INSERT INTO `t_message` VALUES ('11', 'tttt', 'ttt ttttt tttt t  t t t t  t  t', '4', '3', '2022-05-28 11:16:52', 'read');
INSERT INTO `t_message` VALUES ('12', 'ddddd', 'ddddd ddddd ddddd ddddd', '4', '3', '2022-05-28 11:24:08', 'read');
INSERT INTO `t_message` VALUES ('13', 'jjjjj', 'jjj jjjj jjjjj jjjj', '3', '1', '2022-05-28 11:26:20', 'read');
INSERT INTO `t_message` VALUES ('14', 'yyy', 'yyy yyyyyy  y y y y y', '4', '3', '2022-05-28 11:32:44', 'sent');
INSERT INTO `t_message` VALUES ('15', 'dddd', 'asdasada', '4', '3', '2022-05-28 11:42:28', 'read');
INSERT INTO `t_message` VALUES ('16', 'dddd', '123313131331 13131 1 1  131', '4', '3', '2022-05-28 11:56:33', 'sent');
INSERT INTO `t_message` VALUES ('17', 'admin', 'admin', '1', '3', '2022-05-28 11:59:37', 'sent');
INSERT INTO `t_message` VALUES ('20', 's yvon11', 'a yvon11 yvon11', '1', '4', '2022-05-28 12:44:29', 'read');
INSERT INTO `t_message` VALUES ('21', 'qwqweweq', 'qweqweqeqe', '1', '6', '2022-05-28 12:58:38', 'sent');
INSERT INTO `t_message` VALUES ('22', 'Drererer', 'ererr ererrre', '2', '5', '2022-05-28 13:33:38', 'sent');
INSERT INTO `t_message` VALUES ('23', 'hi', 'hi', '5', '2', '2022-05-30 08:36:08', 'read');
INSERT INTO `t_message` VALUES ('24', 'RE: hi', 'hello', '2', '2', '2022-05-30 08:36:48', 'sent');

-- ----------------------------
-- Table structure for `t_project`
-- ----------------------------
DROP TABLE IF EXISTS `t_project`;
CREATE TABLE `t_project` (
  `projectId` int(11) NOT NULL AUTO_INCREMENT,
  `projectTitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `issueDate` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `dueDate` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `managerId` int(11) DEFAULT NULL,
  `employeeId` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`projectId`),
  KEY `fk_manager` (`managerId`),
  KEY `fk_employee` (`employeeId`),
  CONSTRAINT `fk_employee` FOREIGN KEY (`employeeId`) REFERENCES `t_user` (`userid`),
  CONSTRAINT `fk_manager` FOREIGN KEY (`managerId`) REFERENCES `t_user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_project
-- ----------------------------
INSERT INTO `t_project` VALUES ('1', 'QQQQQQ', '2022-06-02', '2021-04-28', '1', '2', 'incomplete', 'aaaaaaaaa');
INSERT INTO `t_project` VALUES ('2', 'AAAAAA', '2022-05-14', '2022-05-20', '5', '2', 'completed', 'assaaassas');
INSERT INTO `t_project` VALUES ('3', 'eeeeerrr', '2022-05-04', '2022-06-04', '5', '3', 'completed', 'jjjj');
INSERT INTO `t_project` VALUES ('4', 'ttttt', '2022-05-31', '2022-06-06', '1', '1', 'incomplete', 'aaaaaaaaa');
INSERT INTO `t_project` VALUES ('5', 'aaaaaaaaaaaaaaaaa', '2022-05-28', '2022-06-02', '1', '1', 'complete', 'aaaaaaaaa');
INSERT INTO `t_project` VALUES ('6', 'ewewewew', '2022-06-06', '2022-06-03', '3', '1', 'incomplete', 'aaaaaaaa');
INSERT INTO `t_project` VALUES ('7', 'ggggg', '2022-05-24', '2022-05-31', '1', '2', 'in progress', 'adadad');
INSERT INTO `t_project` VALUES ('8', 'TTTTTTT', '2022-05-31', '2022-05-31', '1', '2', 'in progress', 'aaaaa');

-- ----------------------------
-- Table structure for `t_salary`
-- ----------------------------
DROP TABLE IF EXISTS `t_salary`;
CREATE TABLE `t_salary` (
  `salaryId` int(11) NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,2) NOT NULL,
  `issueDate` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `employeeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`salaryId`),
  KEY `fk_employee_salary` (`employeeId`),
  CONSTRAINT `fk_employee_salary` FOREIGN KEY (`employeeId`) REFERENCES `t_user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_salary
-- ----------------------------
INSERT INTO `t_salary` VALUES ('1', '9990.00', '2022-05-19', 'qqqq', '2');
INSERT INTO `t_salary` VALUES ('2', '7750.00', '2022-05-27', 'assaaassas', '1');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lastname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `dob` varchar(20) NOT NULL,
  `telephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `hiredate` varchar(20) DEFAULT NULL,
  `deptid` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `usertypeId` int(11) DEFAULT NULL,
  `photourl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE,
  KEY `fk_emp_dept` (`deptid`),
  KEY `fk_usertype` (`usertypeId`),
  CONSTRAINT `fk_emp_dept` FOREIGN KEY (`deptid`) REFERENCES `t_department` (`deptId`),
  CONSTRAINT `fk_usertype` FOREIGN KEY (`usertypeId`) REFERENCES `t_usertype` (`usertypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'yvon', 'yvon', null, '2022-05-11', '+8615587063891', 'yvesapedo03@gmail.com', 'Guanjun Road', '2022-05-23', '3', 'yvon', '3333', '1', 'normal.jpg');
INSERT INTO `t_user` VALUES ('2', 'ee', 'ee', null, '2022-05-17', '11444141', '', '', '', '2', 'yves', '1111', '1', 'normal.jpg');
INSERT INTO `t_user` VALUES ('3', 'admin', 'admin', 'female', '2022-05-10', '+8615587063891', 'yvonapedo@gmail.com', 'Yunnan Province Kunming City Songming District  Landscape Guanjun Road,No. 10', '2022-05-24', '1', 'admin', '1111', '3', 'normal.jpg');
INSERT INTO `t_user` VALUES ('4', 'Yvon', 'APEDO', null, '2022-05-19', '+8615587063891', 'yvonapedo@gmail.com', 'Yunnan Province Kunming City Songming District  Landscape Guanjun Road,No. 10', '2022-05-16', '1', 'yvon11', '1111', '1', 'normal.jpg');
INSERT INTO `t_user` VALUES ('5', 'Anti', 'ddd', null, '2022-05-12', '+8615587063891', 'yvonapedo@gmail.com', 'Yunnan Province Kunming City Songming District  Landscape Guanjun Road,No. 10', '2022-05-10', '2', 'yvon22', '1111', '2', 'normal.jpg');
INSERT INTO `t_user` VALUES ('6', 'KOMI ', 'APEDO', null, '2022-05-09', '+8615587063891', 'yvonapedo@gmail.com', 'Yunnan Province Kunming City', '2022-05-03', '3', 'rrrrr', '1111', '1', 'bbbb.jpg');

-- ----------------------------
-- Table structure for `t_usertype`
-- ----------------------------
DROP TABLE IF EXISTS `t_usertype`;
CREATE TABLE `t_usertype` (
  `usertypeId` int(11) NOT NULL AUTO_INCREMENT,
  `usertypeDesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `usertype` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`usertypeId`),
  KEY `usertype_id` (`usertypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_usertype
-- ----------------------------
INSERT INTO `t_usertype` VALUES ('1', 'Normal employee', 'Normal Employee');
INSERT INTO `t_usertype` VALUES ('2', 'manager', 'Manager');
INSERT INTO `t_usertype` VALUES ('3', 'Administrator', 'Administrator');
