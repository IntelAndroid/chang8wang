/*
Navicat MySQL Data Transfer

Source Server         : CSsaass
Source Server Version : 50546
Source Host           : 121.42.35.182:3306
Source Database       : chuangbatest

Target Server Type    : MYSQL
Target Server Version : 50546
File Encoding         : 65001

Date: 2018-04-26 11:37:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ibt_activity
-- ----------------------------
DROP TABLE IF EXISTS `ibt_activity`;
CREATE TABLE `ibt_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '活动名称',
  `iqbtId` int(11) DEFAULT NULL COMMENT '所属空间Id',
  `name` varchar(255) DEFAULT '' COMMENT '活动名称',
  `districtId` int(11) DEFAULT '0' COMMENT '地区ID',
  `address` varchar(255) DEFAULT '' COMMENT '地址',
  `starttime` int(11) DEFAULT '0' COMMENT '开始时间',
  `endtime` int(11) DEFAULT '0' COMMENT '结束时间',
  `poster` int(11) DEFAULT '0' COMMENT '上传活动海报',
  `total` int(11) DEFAULT '0' COMMENT '人数 0-标示不限人数',
  `detail` text COMMENT '详情',
  `tags` varchar(255) DEFAULT '' COMMENT '活动标签',
  `free` varchar(255) DEFAULT '7002001' COMMENT '是否免费 7002',
  `price` decimal(11,2) DEFAULT '0.00' COMMENT '单价',
  `contact` varchar(50) DEFAULT '' COMMENT '主办方联系人',
  `mobile` varchar(50) DEFAULT '' COMMENT '主办方电话',
  `email` varchar(255) DEFAULT '' COMMENT '主办方邮箱',
  `publish` varchar(50) DEFAULT '7002001' COMMENT '是否发布 7002',
  `audit` varchar(50) DEFAULT '7002002' COMMENT '是否需要审核 7002',
  `hots` int(11) DEFAULT '0' COMMENT '热度',
  `weight` int(11) DEFAULT '0' COMMENT '权重',
  `auditUserId` int(11) DEFAULT '0' COMMENT '审核人ID',
  `auditTime` int(11) DEFAULT '0' COMMENT '审核时间',
  `auditDesc` text COMMENT '审核备注',
  `status` varchar(50) DEFAULT '7001001' COMMENT '审核状态',
  `isDelete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  `lastupdateTime` int(11) DEFAULT '0' COMMENT '最后修改时间',
  `addtime` int(11) DEFAULT '0' COMMENT '注册时间',
  `adduserId` int(11) DEFAULT '0' COMMENT '11',
  `draft` varchar(50) DEFAULT '7002002' COMMENT '是否草稿 7002',
  `summary` text COMMENT '活动总结',
  `actfiles` varchar(125) DEFAULT '' COMMENT '图片文件',
  `sumtitle` varchar(128) DEFAULT '' COMMENT '活动总结标题',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='活动表';

-- ----------------------------
-- Records of ibt_activity
-- ----------------------------
INSERT INTO `ibt_activity` VALUES ('1', '1', '海尔家电日(100人)', '370213', '海尔路88号', '1585079040', '1585302300', '298', '0', '<p>&nbsp; &nbsp; &nbsp;&nbsp;</p><p><br></p><p><br></p><p><br></p><p><br></p><p>&nbsp; &nbsp; 是的</p>', '6017001,6017013', '7002001', '0.00', '', '', '', '7002001', '7002001', '0', '0', '0', '0', null, '7001001', '0', '1523524772', '1521106314', '2', '7002002', null, '', '');
INSERT INTO `ibt_activity` VALUES ('3', '1', '亚马逊喷泉节', '370213', '李村东桥', '1521475200', '1521907200', '75', '0', '详情介绍', '6017001,6017002,6017003', '7002002', '100.00', '', '', '', '7002001', '7002001', '0', '0', '0', '0', null, '7001001', '0', '1521420905', '1521420905', '2', '7002002', null, '', '');
INSERT INTO `ibt_activity` VALUES ('4', '1', '公益千里行', '370212', '青岛市崂山区海尔路27号', '1522166400', '1523462400', '166', '100', '<p>创业公益亲子<img style=\"width: 1387px;\" src=\"/public/files//notice//2-1521422413-22978-0.png\" data-filename=\"image name\"></p>', '6017001,6017002,6017003', '7002002', '100.00', 'lucys', '0532-88635321', '4922561@qq.com', '7002001', '7002001', '0', '0', '0', '0', null, '7001001', '0', '1524473975', '1521422431', '2', '7002002', '工艺活动', '340', '');
INSERT INTO `ibt_activity` VALUES ('5', '9', '公益千里行', '370212', '崂山区海尔路27号', '1521907200', '1522080000', '249', '100', '创业公益亲子', '6017001,6017002,6017003', '7002002', '100.00', '', '', '', '7002001', '7002001', '0', '0', '0', '0', null, '7001001', '0', '1521875250', '1521874590', '40', '7002002', null, '', '');
INSERT INTO `ibt_activity` VALUES ('6', '1', 'sadf asdfsad', '110102', 'asdfsad', '1523289000', '1523289300', '299', '0', 'asdfsad&nbsp;', '6017001,6017013', '7002002', '12.00', '', '', '', '7002001', '7002001', '0', '0', '0', '0', null, '7001001', '0', '1524548920', '1523259512', '2', '7002002', '<span style=\"background-color: yellow;\">活动圆满成功</span>', '341', '我是sad');
INSERT INTO `ibt_activity` VALUES ('7', '1', '张三阿斯蒂芬', '110109', '三生三世', '1523609760', '1608893100', '306', '1', '撒旦法', '6017001', '7002002', '1.00', '', '', '', '7002001', '7002001', '0', '0', '0', '0', null, '7001001', '0', '1523600115', '1523321888', '2', '7002002', null, '', '');
INSERT INTO `ibt_activity` VALUES ('8', '1', '草稿', '0', '三生三世', '0', '0', '360', '2', '撒旦法', '6017001', '7002002', '1.00', '', '', '', '7002001', '7002001', '0', '0', '0', '0', '', '7001001', '0', '1523947043', '1523321888', '2', '7002001', null, '', '');
INSERT INTO `ibt_activity` VALUES ('9', '1', '测试活动1111111111', '370202', '海门路79号', '1524527400', '1524646200', '428', '0', '111111111111111111111', '6017002', '7002002', '1.00', '', '', '', '7002001', '7002001', '0', '0', '0', '0', null, '7001001', '0', '1524473583', '1524473583', '2', '7002002', null, '', '');
INSERT INTO `ibt_activity` VALUES ('10', '1', '测试活动啊', '500103', '啊是的', '1524623400', '1524657000', '429', '0', '阿斯蒂芬', '6017001', '7002002', '12.00', '', '', '', '7002001', '7002001', '0', '0', '0', '0', null, '7001001', '0', '1524535825', '1524535825', '2', '7002002', null, '', '');

-- ----------------------------
-- Table structure for ibt_activity_apl
-- ----------------------------
DROP TABLE IF EXISTS `ibt_activity_apl`;
CREATE TABLE `ibt_activity_apl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `actId` int(11) DEFAULT '0' COMMENT '活动ID',
  `serialNo` varchar(125) DEFAULT '0' COMMENT '订单编号 ',
  `name` varchar(125) DEFAULT '' COMMENT '名称',
  `mobile` varchar(125) DEFAULT '' COMMENT '手机号',
  `etprs` varchar(125) DEFAULT '' COMMENT '企业名称',
  `sex` varchar(50) DEFAULT '7003001' COMMENT '性别7003',
  `num` int(11) DEFAULT '0' COMMENT '报名人数',
  `status` varchar(50) DEFAULT '7001001' COMMENT '审核状态',
  `isDelete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  `lastupdateTime` int(11) DEFAULT '0' COMMENT '最后修改时间',
  `addtime` int(11) DEFAULT '0' COMMENT '注册时间',
  `adduserId` int(11) DEFAULT '0' COMMENT '11',
  `auditUserId` int(11) DEFAULT '0' COMMENT '审核人ID',
  `auditTime` int(11) DEFAULT '0' COMMENT '审核时间',
  `auditDesc` text COMMENT '审核备注',
  `total` decimal(11,2) DEFAULT '0.00' COMMENT '总价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='活动申请';

-- ----------------------------
-- Records of ibt_activity_apl
-- ----------------------------
INSERT INTO `ibt_activity_apl` VALUES ('20', '1', '20180413000100020', '吾乃张震', '15555555555', '', '7003001', '11', '7001003', '0', '1524548286', '1523590643', '3', '0', '0', null, '0.00');
INSERT INTO `ibt_activity_apl` VALUES ('21', '1', '20180413000100021', '吾乃张正重新报', '18888888888', '', '7003001', '888', '7001003', '0', '1524548352', '1523600660', '3', '0', '0', null, '0.00');
INSERT INTO `ibt_activity_apl` VALUES ('22', '1', '20180413000100022', '旺旺', '15666666666', '', '7003001', '11', '7001002', '0', '1524548354', '1523601761', '3', '0', '0', null, '0.00');
INSERT INTO `ibt_activity_apl` VALUES ('48', '10', '20180424001000048', '量子', '15611111111', '利每家量子', '7003001', '1', '7001001', '0', '1524538775', '1524538448', '3', '0', '0', null, '12.00');
INSERT INTO `ibt_activity_apl` VALUES ('49', '10', '20180424001000049', '量子', '15611111111', '利每家量子', '7003001', '1', '7001001', '0', '1524538790', '1524538779', '3', '0', '0', null, '12.00');
INSERT INTO `ibt_activity_apl` VALUES ('50', '10', '20180424001000050', '量子', '15611111111', '利每家量子', '7003001', '1', '7001001', '0', '1524540708', '1524538792', '3', '0', '0', null, '12.00');
INSERT INTO `ibt_activity_apl` VALUES ('51', '10', '20180424001000051', '莉莉', '15666666666', '利每家量子', '7003001', '11', '7001001', '0', '1524540718', '1524540718', '3', '0', '0', null, '132.00');

-- ----------------------------
-- Table structure for ibt_build
-- ----------------------------
DROP TABLE IF EXISTS `ibt_build`;
CREATE TABLE `ibt_build` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iqbtId` int(11) DEFAULT '0' COMMENT '20180303楼座表孵化器ID  新加字段',
  `isDelete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  `lastupdateTime` int(11) DEFAULT '0' COMMENT '最后修改时间',
  `addtime` int(11) DEFAULT '0' COMMENT '注册时间',
  `adduserId` int(11) DEFAULT '0' COMMENT '11',
  `name` varchar(128) DEFAULT '' COMMENT '楼座名称',
  `floor` int(11) DEFAULT '0' COMMENT '楼层',
  `pic` int(11) DEFAULT '0' COMMENT '楼座展示图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=279 DEFAULT CHARSET=utf8 COMMENT='楼座楼层表';

-- ----------------------------
-- Records of ibt_build
-- ----------------------------
INSERT INTO `ibt_build` VALUES ('238', '1', '1', '1521769420', '1521593145', '2', 'D座', '0', '0');
INSERT INTO `ibt_build` VALUES ('250', '1', '1', '1521769420', '1521609209', '2', '1', '0', '0');
INSERT INTO `ibt_build` VALUES ('254', '1', '1', '1521769420', '1521614936', '2', 'c', '0', '0');
INSERT INTO `ibt_build` VALUES ('263', '1', '1', '1521769420', '1521696889', '2', 'f', '0', '0');
INSERT INTO `ibt_build` VALUES ('265', '1', '1', '1521769420', '1521697819', '2', 'A座', '0', '0');
INSERT INTO `ibt_build` VALUES ('266', '1', '1', '1521769420', '1521707250', '2', '吧座', '0', '0');
INSERT INTO `ibt_build` VALUES ('267', '1', '1', '1521769420', '1521709999', '2', 'B座', '0', '0');
INSERT INTO `ibt_build` VALUES ('268', '1', '0', '1521769420', '1521769420', '2', 'D座', '0', '0');
INSERT INTO `ibt_build` VALUES ('269', '1', '1', '1521772785', '1521771502', '2', '20座', '0', '0');
INSERT INTO `ibt_build` VALUES ('270', '1', '0', '1521772785', '1521772785', '2', '30座', '0', '0');
INSERT INTO `ibt_build` VALUES ('271', '9', '0', '1521868890', '1521868890', '40', 'C座', '0', '0');
INSERT INTO `ibt_build` VALUES ('272', '9', '0', '1521869032', '1521869032', '40', 'C', '0', '0');
INSERT INTO `ibt_build` VALUES ('273', '1', '0', '1522033972', '1522033972', '2', '环球金融城2栋', '0', '0');
INSERT INTO `ibt_build` VALUES ('274', '1', '0', '1522043914', '1522043914', '46', '杭盛科技孵化中心', '0', '0');
INSERT INTO `ibt_build` VALUES ('275', '1', '0', '1522050347', '1522050347', '2', '金座', '0', '0');
INSERT INTO `ibt_build` VALUES ('276', '1', '1', '1524639567', '1524639491', '2', '1', '0', '0');
INSERT INTO `ibt_build` VALUES ('277', '1', '0', '1524647918', '1524647918', '2', '1', '0', '0');
INSERT INTO `ibt_build` VALUES ('278', '1', '0', '1524713679', '1524713679', '2', 'A', '0', '0');

-- ----------------------------
-- Table structure for ibt_data_torch
-- ----------------------------
DROP TABLE IF EXISTS `ibt_data_torch`;
CREATE TABLE `ibt_data_torch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iqbtId` int(11) DEFAULT '0',
  `name` varchar(255) DEFAULT '' COMMENT '空间名称',
  `artificial` varchar(255) DEFAULT '' COMMENT '法人代表',
  `property` varchar(255) DEFAULT '' COMMENT '单位性质',
  `type` varchar(255) DEFAULT '' COMMENT '孵化器类型',
  `contact` varchar(255) DEFAULT '' COMMENT '联系人',
  `mobile` varchar(255) DEFAULT '' COMMENT '移动电话',
  `phone` varchar(255) DEFAULT '' COMMENT '固定电话',
  `fax` varchar(255) DEFAULT '' COMMENT '固定电话',
  `site` varchar(255) DEFAULT '' COMMENT '网址',
  `email` varchar(255) DEFAULT '' COMMENT '电子邮件',
  `zipcode` varchar(255) DEFAULT '' COMMENT '邮编',
  `rgsttime` varchar(255) DEFAULT '' COMMENT '注册时间',
  `districtId` int(11) DEFAULT '0' COMMENT '地区',
  `address` varchar(255) DEFAULT '' COMMENT '地址',
  `area` decimal(10,2) DEFAULT '0.00' COMMENT '占地面积',
  `structure` decimal(10,2) DEFAULT '0.00' COMMENT '建筑面积',
  `room` int(11) DEFAULT '0' COMMENT '房间数量',
  `unit` int(11) DEFAULT '0' COMMENT '工位数量',
  `magement` int(11) DEFAULT '0' COMMENT '管理人员数量',
  `junior` int(11) DEFAULT '0' COMMENT '大专以上学历数量',
  `juniorrate` decimal(10,2) DEFAULT '0.00' COMMENT '管理人员中具有大专以上学历的比例',
  `canuserarea` decimal(10,2) DEFAULT '0.00' COMMENT '可自主支配孵化场地使用面积（万平方米）',
  `userarea` decimal(10,2) DEFAULT '0.00' COMMENT '在孵企业使用场地（含公共服务场地）面积（万平方米）',
  `userate` decimal(10,2) DEFAULT '0.00' COMMENT '在孵企业使用场地（含公共服务场地）占比',
  `etprsnum` int(11) DEFAULT '0' COMMENT '可自主支配场地内的在孵企业数量',
  `patentetprs` int(11) DEFAULT '0' COMMENT '申请专利的在孵企业数量',
  `patentrate` decimal(10,2) DEFAULT '0.00' COMMENT '已申请专利的在孵企业占比',
  `graduate` int(10) DEFAULT '0' COMMENT '累计毕业企业数量',
  `job` int(11) DEFAULT '0' COMMENT '毕业企业和在孵企业提供的就业岗位数量',
  `etprsjuniorate` decimal(10,2) DEFAULT '0.00' COMMENT '在孵企业中的大专以上学历人数占企业总人数的比例',
  `total` decimal(10,2) DEFAULT '0.00' COMMENT '孵化器自有种子资金或孵化资金额',
  `trainrate` decimal(10,2) DEFAULT '0.00' COMMENT '接收孵化器专业培训人员的比例',
  `isDelete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  `lastupdateTime` int(11) DEFAULT '0' COMMENT '最后修改时间',
  `addtime` int(11) DEFAULT '0' COMMENT '注册时间',
  `adduserId` int(11) DEFAULT '0' COMMENT '11',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='火炬中心申报数据字段';

-- ----------------------------
-- Records of ibt_data_torch
-- ----------------------------

-- ----------------------------
-- Table structure for ibt_etprs
-- ----------------------------
DROP TABLE IF EXISTS `ibt_etprs`;
CREATE TABLE `ibt_etprs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT '' COMMENT '客户名称',
  `type` varchar(50) DEFAULT '' COMMENT '客户类型（企业、团队）字典表',
  `contact` varchar(128) DEFAULT '' COMMENT '联系人',
  `mobile` varchar(128) DEFAULT '0' COMMENT '联系电话',
  `source` varchar(50) DEFAULT '' COMMENT '来源渠道 字典表',
  `cstmstatus` varchar(50) DEFAULT '' COMMENT '客户状态 （客户关系中的状态）',
  `status` varchar(50) DEFAULT '' COMMENT '客户入住状态',
  `rqst` text COMMENT '客户需求',
  `rqst_build` varchar(50) DEFAULT '0' COMMENT '意向空间',
  `rqst_floor` varchar(50) DEFAULT '0' COMMENT '意向楼层',
  `rqst_roomNo` varchar(128) DEFAULT '' COMMENT '意向房间号',
  `rqst_start` int(11) DEFAULT '0' COMMENT '需求时间-开始时间',
  `rqst_end` int(11) DEFAULT '0' COMMENT '意向时间 结束时间',
  `addtime` int(11) DEFAULT '0' COMMENT '创建时间',
  `backlog` tinyint(2) DEFAULT '0' COMMENT '是否是待办工作',
  `flowtime` int(11) DEFAULT '0' COMMENT '最后跟进时间',
  `isDelete` tinyint(2) DEFAULT '0',
  `lastupdateTime` int(11) DEFAULT '0',
  `adduserId` int(11) DEFAULT '0',
  `legalname` varchar(128) DEFAULT '' COMMENT '法人名称',
  `bp` int(11) DEFAULT '0' COMMENT '项目计划书',
  `buslic` int(11) DEFAULT '0' COMMENT '营业执照上传',
  `iqbtId` int(11) DEFAULT '0' COMMENT '场地ID',
  `apltime` int(11) DEFAULT '0' COMMENT '申请时间，导入的项目没有申请时间',
  `datafrom` varchar(50) DEFAULT '' COMMENT '客户数据来源  6023',
  `entertime` int(11) DEFAULT '0' COMMENT '1发起入驻时生成 2无效变拟入驻状态生成 3导入数据时生成',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='客户表';

-- ----------------------------
-- Records of ibt_etprs
-- ----------------------------
INSERT INTO `ibt_etprs` VALUES ('1', '益农网络科技', '6003002', '陈霄', '15166666727', '6001004', '6002003', '6008006', '非标自动化设备生产线及工业机械手', '', '', '', '1521388800', '1521388800', '1521106124', '0', '0', '0', '1521705460', '2', '阿斯蒂芬', '89', '0', '1', '0', '', '0');
INSERT INTO `ibt_etprs` VALUES ('2', '小帅影院 ', '6003001', '韩旭', '18661971070', '6001002', '6002003', '6008006', '工业废水处理装置、环保材料、气凝胶、隔热棉等产品生产，源自北京亚西丽公司团队，拟在青岛注册科尔新材料公司，已入驻海创汇创业家。', '', '', '', '1521388800', '1521388800', '1521106124', '0', '1521180864', '1', '1521530493', '2', '韩旭', '80', '0', '1', '0', '', '0');
INSERT INTO `ibt_etprs` VALUES ('3', '利每家量子', '6003001', '王洪涛', '15615555555', '6001002', '6002003', '6008005', '空气净化、水处理', '', '', '1001', '1521043200', '1521043200', '1521106124', '0', '0', '0', '1523844415', '2', 'leader', '11', '106', '1', '0', '6023004', '1523254227');
INSERT INTO `ibt_etprs` VALUES ('9', '鹿班到家', '6003001', '孙明', '18605321366', '6001004', '6002003', '6008006', '', '266', '277', '1001', '1521475200', '1521907200', '1521426877', '0', '1521704611', '0', '1521768476', '2', '孙明', '90', '91', '1', '0', '6023004', '1521768396');
INSERT INTO `ibt_etprs` VALUES ('10', '青岛亚马逊', '6003001', '青岛亚马逊', '15369652652', '6001001', '6002003', '6008002', '', '1', '1', '1005', '0', '0', '1521436883', '0', '1521524644', '1', '1521530493', '2', '', '0', '0', '1', '0', '', '0');
INSERT INTO `ibt_etprs` VALUES ('11', '云梦电子', '6003001', '李洪国', '13280803195', '6001004', '6002003', '6008005', '需求描述', '', '', '', '1521734400', '1521734400', '1521524328', '0', '0', '0', '1521773633', '2', '李洪国', '196', '0', '1', '0', '6023004', '1521773599');
INSERT INTO `ibt_etprs` VALUES ('12', '作业平台', '6003002', '张凯', '15726426715', '6001002', '6002003', '6008006', '详细需求', '', '', '4001', '1521648000', '1521561600', '1521524328', '0', '1521525528', '0', '1521705454', '2', '张凯', '167', '0', '1', '0', '6023004', '1521683926');
INSERT INTO `ibt_etprs` VALUES ('13', '海淘精工', '6003001', '郭宏超', '15169232099', '6001003', '6002003', '6008002', '', '', '', '', '0', '0', '1521524328', '0', '0', '1', '1521530493', '2', '', '0', '0', '1', '0', '', '0');
INSERT INTO `ibt_etprs` VALUES ('14', '陈于文华', '6003001', '赵涛', '13566225432', '6001002', '6002003', '6008002', '', '0', '0', '', '0', '0', '1521526770', '0', '0', '1', '1521530493', '2', '赵涛', '0', '0', '1', '0', '', '0');
INSERT INTO `ibt_etprs` VALUES ('15', '医联体', '6003002', '张冲', '15688635231', '6001003', '6002003', '6008002', '', '0', '0', '', '0', '0', '1521526770', '0', '0', '1', '1521530493', '2', '张冲', '0', '0', '1', '0', '', '0');
INSERT INTO `ibt_etprs` VALUES ('16', '陈于文华', '6003001', '赵涛', '13688635622', '6001002', '6002003', '6008006', '', '270', '286', '6001', '1521648000', '1521648000', '1521530493', '0', '1521855008', '0', '1523587206', '2', '赵涛', '170', '0', '1', '0', '6023004', '1521855143');
INSERT INTO `ibt_etprs` VALUES ('17', '医联体', '6003002', '张冲', '13688225464', '6001003', '6002003', '6008005', '', '', '', '', '1521648000', '1521648000', '1521530493', '0', '0', '0', '1521704458', '2', '张冲', '169', '0', '1', '0', '6023004', '1521684487');
INSERT INTO `ibt_etprs` VALUES ('18', '立协高夫', '6003001', '王迪', '88665321', '6001002', '6002003', '6008005', '', '', '', '', '1521648000', '1521648000', '1521689903', '0', '1521702377', '0', '1521709026', '2', '王迪', '174', '0', '1', '0', '6023004', '1521708421');
INSERT INTO `ibt_etprs` VALUES ('19', '小鸡滴滴', '6003002', '李鹏', '18354332531', '6001003', '6002003', '6008005', 'dfd', '238', '244', '4001', '1521648000', '1521648000', '1521689903', '0', '0', '0', '1521704022', '2', '李鹏', '177', '0', '1', '0', '6023004', '1521698762');
INSERT INTO `ibt_etprs` VALUES ('20', '图文广告', '6003001', '张章', '13655226321', '6001002', '6002003', '6008003', '', '', '', '', '1524067200', '1524067200', '1521699684', '0', '1524102454', '0', '1524102485', '2', '张章', '178', '0', '1', '0', '6023004', '1524102485');
INSERT INTO `ibt_etprs` VALUES ('21', '网络电话-有信', '6003001', '丁磊', '0532-88888888', '6001002', '6002003', '6008006', '', '', '', '', '1521648000', '1521648000', '1521705841', '0', '1521705855', '0', '1523587292', '2', '丁磊', '179', '0', '1', '0', '6023004', '1521705868');
INSERT INTO `ibt_etprs` VALUES ('22', '青岛安诺思信信息', '6003001', '图文', '0532-88635431', '6001001', '6002003', '6008006', '', '', '', '', '0', '0', '1521707067', '0', '0', '0', '1521767570', '2', '图文', '180', '0', '1', '0', '6023004', '1521707067');
INSERT INTO `ibt_etprs` VALUES ('23', '新食器', '6003001', '刘北永', '13766985431', '6001003', '6002003', '6008006', '规范地方防守打法', '267', '278', '1001', '1521734400', '1521734400', '1521711701', '0', '1521767791', '0', '1523587266', '2', '刘北永', '189', '190', '1', '0', '6023004', '1521768268');
INSERT INTO `ibt_etprs` VALUES ('24', '阿斯蒂芬造字工厂', '6003002', '阿斯蒂芬', '18561913562', '6001003', '6002004', '6008001', '阿斯蒂芬', '', '', '', '0', '0', '1521788199', '0', '0', '0', '1523149486', '2', '阿斯蒂芬', '0', '0', '1', '0', '6023005', '1521788199');
INSERT INTO `ibt_etprs` VALUES ('25', '新智能', '6003002', '周超', '88635421', '6001001', '6002003', '6008002', '啊是的', '268', '282', 'D座/2层/D座/2层/D座/2层/D座/2层/2001', '1522857600', '1522857600', '1521854813', '0', '1524104211', '0', '1524104211', '2', '', '0', '0', '1', '0', '6023001', '0');
INSERT INTO `ibt_etprs` VALUES ('26', '新石器', '6003002', '刘丹', '0532-88635421', '6001001', '6002003', '6008005', '需求描述', '', '', '', '1521820800', '1521820800', '1521863427', '0', '1521870580', '0', '1521874979', '40', '刘丹', '235', '250', '9', '0', '6023004', '1521870960');
INSERT INTO `ibt_etprs` VALUES ('27', '小鸡滴滴', '6003001', '王迪', '88635421', '6001002', '6002002', '6008001', '描述需求', '0', '0', '', '0', '0', '1521863427', '0', '0', '0', '1521863427', '40', '', '0', '0', '9', '0', '6023002', '0');
INSERT INTO `ibt_etprs` VALUES ('28', '极素空间', '6003001', '张集', '15666662222', '6001002', '6002003', '6008004', '', '', '', '', '1521993600', '1521993600', '1521884239', '0', '0', '0', '1524103713', '2', '张集', '259', '0', '1', '0', '6023004', '1522047508');
INSERT INTO `ibt_etprs` VALUES ('29', '糖花蛋糕', '6003002', '张糖花', '15655555555', '6001003', '6002003', '6008002', '意向客户', '268', '282', '2001', '1522771200', '1522771200', '1522379921', '0', '1522807861', '0', '1522827776', '2', '士大夫', '0', '0', '1', '0', '6023005', '1522379921');
INSERT INTO `ibt_etprs` VALUES ('30', '海菊颗粒', '6003002', '真心', '15655553333', '6001003', '6002004', '6008001', '啊是的', '', '', '', '0', '0', '1522380393', '0', '1523517423', '0', '1523517423', '2', '', '0', '0', '1', '0', '6023002', '0');
INSERT INTO `ibt_etprs` VALUES ('31', '海花颗粒', '6003002', '15655552222', '15655553333', '6001003', '6002003', '6008002', '啊是的', '', '', '', '0', '0', '1522380393', '0', '0', '0', '1523149504', '2', '', '0', '0', '1', '0', '6023002', '0');
INSERT INTO `ibt_etprs` VALUES ('32', '海菊颗粒2', '6003002', '15655552222', '15655553333', '6001003', '6002003', '6008002', '啊是的', '', '', '', '0', '0', '1522380393', '0', '0', '0', '1522747631', '2', '', '0', '0', '1', '0', '6023002', '0');
INSERT INTO `ibt_etprs` VALUES ('33', '海菊颗粒3', '6003002', '15655552222', '15655553333', '6001003', '6002003', '6008002', '啊是的', '', '', '', '0', '0', '1522380393', '0', '0', '0', '1522747631', '2', '', '0', '0', '1', '0', '6023002', '0');
INSERT INTO `ibt_etprs` VALUES ('34', '海菊颗粒4', '6003002', '15655552227', '15655553337', '6001003', '6002003', '6008004', '啊是的', '', '', '', '1524153600', '1524153600', '1522380393', '0', '0', '0', '1524454131', '2', '法人', '0', '0', '1', '0', '6023004', '1524190161');
INSERT INTO `ibt_etprs` VALUES ('35', '海菊颗粒5', '6003002', '15655552222', '15655553333', '6001003', '6002003', '6008002', '啊是的', '', '', '', '0', '0', '1522380393', '0', '1523517932', '0', '1523517932', '2', '', '0', '0', '1', '0', '6023002', '0');
INSERT INTO `ibt_etprs` VALUES ('36', '海菊颗粒6', '6003002', '15655552222', '15655553333', '6001003', '6002003', '6008002', '啊是的', '', '', '', '0', '0', '1522380393', '0', '0', '0', '1522747631', '2', '', '0', '0', '1', '0', '6023002', '0');
INSERT INTO `ibt_etprs` VALUES ('37', '海菊颗粒7', '6003002', '15655552222', '15655553333', '6001003', '6002003', '6008002', '啊是的', '', '', '', '0', '0', '1522380393', '0', '0', '0', '1522747631', '2', '', '0', '0', '1', '0', '6023002', '0');
INSERT INTO `ibt_etprs` VALUES ('38', '测试', '6003001', '丽丽', '13563123489', '6001001', '6002003', '6008004', '', '', '', '212', '1524412800', '1524412800', '1524467142', '0', '1524467267', '0', '1524467473', '2', '莉莉', '0', '0', '1', '0', '6023004', '1524467362');

-- ----------------------------
-- Table structure for ibt_etprs_changelog
-- ----------------------------
DROP TABLE IF EXISTS `ibt_etprs_changelog`;
CREATE TABLE `ibt_etprs_changelog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isDelete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  `lastupdateTime` int(11) DEFAULT '0' COMMENT '最后修改时间',
  `addtime` int(11) DEFAULT '0' COMMENT '注册时间',
  `adduserId` int(11) DEFAULT '0' COMMENT '11',
  `oldIds` varchar(256) DEFAULT '' COMMENT '撤销房间',
  `newIds` varchar(256) DEFAULT '' COMMENT '新增房间编号',
  `etprsId` int(11) DEFAULT '0' COMMENT '企业ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='房间变更记录表';

-- ----------------------------
-- Records of ibt_etprs_changelog
-- ----------------------------
INSERT INTO `ibt_etprs_changelog` VALUES ('1', '0', '1521106402', '1521106402', '2', '', '2', '3');
INSERT INTO `ibt_etprs_changelog` VALUES ('2', '0', '1521180025', '1521180025', '8', '', '7', '6');
INSERT INTO `ibt_etprs_changelog` VALUES ('3', '0', '1521180695', '1521180695', '8', '', '10', '7');
INSERT INTO `ibt_etprs_changelog` VALUES ('4', '0', '1521180892', '1521180892', '8', '', '10', '8');
INSERT INTO `ibt_etprs_changelog` VALUES ('5', '0', '1521181972', '1521181972', '8', '', '7', '6');
INSERT INTO `ibt_etprs_changelog` VALUES ('6', '0', '1521182140', '1521182140', '8', '', '10', '8');
INSERT INTO `ibt_etprs_changelog` VALUES ('7', '0', '1521183329', '1521183329', '8', '', '8', '7');
INSERT INTO `ibt_etprs_changelog` VALUES ('8', '0', '1521183410', '1521183410', '8', '', '8', '7');
INSERT INTO `ibt_etprs_changelog` VALUES ('9', '0', '1521424336', '1521424336', '2', '', '3', '2');
INSERT INTO `ibt_etprs_changelog` VALUES ('10', '0', '1521426147', '1521426147', '2', '', '5', '1');
INSERT INTO `ibt_etprs_changelog` VALUES ('11', '0', '1521450806', '1521450806', '2', '', '3', '9');
INSERT INTO `ibt_etprs_changelog` VALUES ('12', '0', '1521684318', '1521684318', '2', '', '62', '12');
INSERT INTO `ibt_etprs_changelog` VALUES ('13', '0', '1521684543', '1521684543', '2', '62', '62,67', '12');
INSERT INTO `ibt_etprs_changelog` VALUES ('14', '0', '1521684605', '1521684605', '2', '62,67', '62', '12');
INSERT INTO `ibt_etprs_changelog` VALUES ('15', '0', '1521685195', '1521685195', '2', '62', '62,67', '12');
INSERT INTO `ibt_etprs_changelog` VALUES ('16', '0', '1521686581', '1521686581', '2', '', '68', '16');
INSERT INTO `ibt_etprs_changelog` VALUES ('17', '0', '1521695275', '1521695275', '2', '62,67', '62', '12');
INSERT INTO `ibt_etprs_changelog` VALUES ('18', '0', '1521699161', '1521699161', '2', '', '67', '19');
INSERT INTO `ibt_etprs_changelog` VALUES ('19', '0', '1521699691', '1521699691', '2', '', '79', '20');
INSERT INTO `ibt_etprs_changelog` VALUES ('20', '0', '1521704453', '1521704453', '2', '', '79', '17');
INSERT INTO `ibt_etprs_changelog` VALUES ('21', '0', '1521704571', '1521704571', '2', '', '5', '16');
INSERT INTO `ibt_etprs_changelog` VALUES ('22', '0', '1521704703', '1521704703', '2', '', '68', '9');
INSERT INTO `ibt_etprs_changelog` VALUES ('23', '0', '1521705293', '1521705293', '2', '79', '67', '17');
INSERT INTO `ibt_etprs_changelog` VALUES ('24', '0', '1521705381', '1521705381', '2', '5', '5,79', '19');
INSERT INTO `ibt_etprs_changelog` VALUES ('25', '0', '1521705410', '1521705410', '2', '5,79', '68', '19');
INSERT INTO `ibt_etprs_changelog` VALUES ('26', '0', '1521705872', '1521705872', '2', '', '79', '21');
INSERT INTO `ibt_etprs_changelog` VALUES ('27', '0', '1521707301', '1521707301', '2', '', '81', '22');
INSERT INTO `ibt_etprs_changelog` VALUES ('28', '0', '1521708430', '1521708430', '2', '', '80', '18');
INSERT INTO `ibt_etprs_changelog` VALUES ('29', '0', '1521708512', '1521708512', '2', '81', '81', '22');
INSERT INTO `ibt_etprs_changelog` VALUES ('30', '0', '1521708582', '1521708582', '2', '81', '5', '22');
INSERT INTO `ibt_etprs_changelog` VALUES ('31', '0', '1521708615', '1521708615', '2', '5', '5,81', '22');
INSERT INTO `ibt_etprs_changelog` VALUES ('32', '0', '1521768297', '1521768297', '2', '', '81', '23');
INSERT INTO `ibt_etprs_changelog` VALUES ('33', '0', '1521768409', '1521768409', '2', '', '5', '9');
INSERT INTO `ibt_etprs_changelog` VALUES ('34', '0', '1521768493', '1521768493', '2', '81', '81,5', '23');
INSERT INTO `ibt_etprs_changelog` VALUES ('35', '0', '1521768532', '1521768532', '2', '5,81', '81', '23');
INSERT INTO `ibt_etprs_changelog` VALUES ('36', '0', '1521773610', '1521773610', '2', '', '87', '11');
INSERT INTO `ibt_etprs_changelog` VALUES ('37', '0', '1521855152', '1521855152', '2', '', '84', '16');
INSERT INTO `ibt_etprs_changelog` VALUES ('38', '0', '1521871007', '1521871007', '40', '', '88', '26');
INSERT INTO `ibt_etprs_changelog` VALUES ('39', '0', '1522047402', '1522047402', '2', '84', '84,85', '16');
INSERT INTO `ibt_etprs_changelog` VALUES ('40', '0', '1523254238', '1523254238', '2', '', '95,96', '3');
INSERT INTO `ibt_etprs_changelog` VALUES ('41', '0', '1523589441', '1523589441', '2', '87', '87', '11');
INSERT INTO `ibt_etprs_changelog` VALUES ('42', '0', '1523589515', '1523589515', '2', '87', '87', '11');
INSERT INTO `ibt_etprs_changelog` VALUES ('43', '0', '1524103713', '1524103713', '2', '', '84', '28');
INSERT INTO `ibt_etprs_changelog` VALUES ('44', '0', '1524454131', '1524454131', '2', '', '100', '34');
INSERT INTO `ibt_etprs_changelog` VALUES ('45', '0', '1524467473', '1524467473', '2', '', '85', '38');

-- ----------------------------
-- Table structure for ibt_etprs_info
-- ----------------------------
DROP TABLE IF EXISTS `ibt_etprs_info`;
CREATE TABLE `ibt_etprs_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adduserId` int(11) DEFAULT '0',
  `addtime` int(11) DEFAULT '0',
  `isDelete` int(2) DEFAULT '0',
  `iqbtId` int(3) DEFAULT '0' COMMENT '孵化器ID',
  `worktype` varchar(255) DEFAULT '' COMMENT '1025 创业类型',
  `technical` varchar(20) DEFAULT '0' COMMENT '企业所属技术领域  ',
  `taxpayertype` varchar(20) DEFAULT '' COMMENT '纳税人类型',
  `industry` varchar(20) DEFAULT '' COMMENT '行业类型 6013',
  `etprsId` int(11) DEFAULT '0',
  `ognzCode` varchar(100) DEFAULT '' COMMENT '组织机构代码',
  `rgsttype` varchar(100) DEFAULT '' COMMENT '企业等级注册类型 dict 1030',
  `totutor` varchar(5) DEFAULT '0' COMMENT '与导师建立辅导关系 0-否 1-是',
  `cadut` varchar(10) DEFAULT '0' COMMENT '毕业企业 0-是 1-否',
  `ctubusnes` varchar(10) DEFAULT '0' COMMENT '是否连续创业 0-否 1-是',
  `investment` decimal(11,2) DEFAULT '0.00' COMMENT '天使投资额',
  `iqbtarea` decimal(11,2) DEFAULT '0.00' COMMENT '孵化场地面积',
  `rgstment` decimal(11,2) DEFAULT '0.00' COMMENT '注册资本',
  `income` decimal(11,2) DEFAULT '0.00' COMMENT '总收入',
  `profit` decimal(11,2) DEFAULT '0.00' COMMENT '净利润',
  `exptprofit` decimal(11,2) DEFAULT '0.00' COMMENT '出口创汇',
  `rdinput` decimal(11,2) DEFAULT '0.00' COMMENT 'R&D投入',
  `tax` decimal(11,2) DEFAULT '0.00' COMMENT '实际上缴税费',
  `total` int(11) DEFAULT '0' COMMENT '人员数量',
  `overseas` int(11) DEFAULT '0' COMMENT '留学人员',
  `doctor` int(11) DEFAULT '0' COMMENT '博士数量',
  `junior` int(11) DEFAULT '0' COMMENT '大专以上',
  `thousand` int(11) DEFAULT '0' COMMENT '千人计划',
  `student` int(11) DEFAULT '0' COMMENT '应届大学生',
  `iprapl` int(11) DEFAULT '0' COMMENT '知识产权申请数',
  `iprgrant` int(11) DEFAULT '0' COMMENT '当年知识产权授予数',
  `invent` int(11) DEFAULT '0' COMMENT '发明专利',
  `soft` int(11) DEFAULT '0' COMMENT '软件著作权',
  `plant` int(11) DEFAULT '0' COMMENT '植物',
  `circuit` int(11) DEFAULT '0' COMMENT '集成电路',
  `ipr` int(11) DEFAULT '0' COMMENT '拥有知识产权数',
  `patent` int(11) DEFAULT '0' COMMENT '购买外国专利',
  `techdealnum` int(11) DEFAULT '0' COMMENT '技术合同交易数量',
  `techdeal` int(11) DEFAULT '0' COMMENT '技术合同交易额',
  `project` int(11) DEFAULT '0' COMMENT '当年承担国家科技计划项目数',
  `reward` int(11) DEFAULT '0' COMMENT '当年获取省级以上奖励 ',
  `highetprs` int(11) DEFAULT '0' COMMENT '是否高新企业 0:否 1：是',
  `rgsttime` varchar(50) DEFAULT '0' COMMENT '注册时间',
  `isMarket` tinyint(2) DEFAULT '0' COMMENT '是否新三板、蓝海上市 0:否  1：是',
  `lealPerson` varchar(50) DEFAULT '' COMMENT '法人',
  `charter` varchar(255) DEFAULT '',
  `roFinace` varchar(255) DEFAULT '' COMMENT '融资轮次  sysdict 6014',
  `valuation` decimal(10,2) DEFAULT '0.00' COMMENT '当前估值',
  `etprsStatus` int(11) DEFAULT '0' COMMENT '企业状态 6015',
  `isMigrate` int(11) DEFAULT '0' COMMENT '0 否 1是',
  `isMerger` int(11) DEFAULT '0' COMMENT '0 否  1是',
  `isRgstHere` int(11) DEFAULT '0' COMMENT '知否注册在此 0 否  1是',
  `lastupdateTime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='企业信息扩展';

-- ----------------------------
-- Records of ibt_etprs_info
-- ----------------------------
INSERT INTO `ibt_etprs_info` VALUES ('1', '3', '1521445991', '0', '0', '', '0', '', '601301', '3', '', '', '0', '7002002', '0', '0.00', '100.00', '200.00', '1000.00', '800.00', '0.00', '0.00', '50.00', '10', '1', '1', '10', '0', '0', '10', '0', '0', '10', '0', '0', '0', '0', '0', '0', '0', '0', '7002001', '0', '0', '', '', '601401', '1000.00', '601502', '7002001', '7002001', '7002001', '1521449304');
INSERT INTO `ibt_etprs_info` VALUES ('2', '2', '1521447287', '0', '0', '', '0', '', '601305', '9', '', '', '0', '7002002', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '333.00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '7002001', '0', '0', '', '', '601404', '0.00', '601502', '7002001', '7002002', '7002002', '1521451953');
INSERT INTO `ibt_etprs_info` VALUES ('3', '2', '1521683983', '0', '0', '', '0', '', '601301', '12', '', '', '0', '7002002', '0', '0.00', '200.00', '200.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '7002001', '0', '0', '', '', '601401', '0.00', '601501', '7002001', '7002001', '7002001', '1521684081');
INSERT INTO `ibt_etprs_info` VALUES ('4', '40', '1521870864', '0', '0', '', '0', '', '601301', '26', '', '', '0', '7002002', '0', '0.00', '200.00', '200.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '7002001', '0', '0', '', '', '601401', '0.00', '0', '7002002', '7002002', '7002001', '1521870906');
INSERT INTO `ibt_etprs_info` VALUES ('5', '2', '1523850426', '0', '0', '', '0', '', '601301', '3', '', '', '0', '0', '0', '0.00', '100.00', '200.00', '1000.00', '800.00', '0.00', '0.00', '50.00', '10', '1', '1', '10', '0', '0', '10', '0', '0', '10', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '601401', '0.00', '601502', '0', '0', '0', '1523850426');
INSERT INTO `ibt_etprs_info` VALUES ('6', '2', '1523850439', '0', '0', '', '0', '', '601301', '3', '', '', '0', '0', '0', '0.00', '100.00', '200.00', '1000.00', '800.00', '0.00', '0.00', '50.00', '10', '1', '1', '10', '0', '0', '10', '0', '0', '10', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '601401', '0.00', '601502', '0', '0', '0', '1523850439');

-- ----------------------------
-- Table structure for ibt_etprs_pactlog
-- ----------------------------
DROP TABLE IF EXISTS `ibt_etprs_pactlog`;
CREATE TABLE `ibt_etprs_pactlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `etprsId` int(11) DEFAULT '0',
  `pact_start` int(11) DEFAULT '0' COMMENT '合同开始时间',
  `pact_end` int(11) DEFAULT '0' COMMENT '合同结束时间',
  `pactNo` varchar(128) DEFAULT '' COMMENT '合同编号',
  `pact` int(11) DEFAULT '0' COMMENT '合同文件ID',
  `isDelete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  `lastupdateTime` int(11) DEFAULT '0' COMMENT '最后修改时间',
  `addtime` int(11) DEFAULT '0' COMMENT '注册时间',
  `adduserId` int(11) DEFAULT '0' COMMENT '11',
  `pactTime` int(11) DEFAULT '0' COMMENT '合同时间统计  20180202自己加的，表中本来无此字段',
  `pactMoney` decimal(11,2) DEFAULT '0.00' COMMENT '此合同产生的费用  20180202自己加的  想计算下该合同价格',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='合同记录';

-- ----------------------------
-- Records of ibt_etprs_pactlog
-- ----------------------------
INSERT INTO `ibt_etprs_pactlog` VALUES ('1', '3', '1521043200', '1552492800', '', '0', '0', '1521106415', '1521106402', '2', '0', '0.00');
INSERT INTO `ibt_etprs_pactlog` VALUES ('2', '6', '1521129600', '1584201600', '', '0', '0', '1521180025', '1521180025', '8', '0', '0.00');
INSERT INTO `ibt_etprs_pactlog` VALUES ('3', '7', '1521129600', '1552579200', '', '0', '0', '1521180695', '1521180695', '8', '0', '0.00');
INSERT INTO `ibt_etprs_pactlog` VALUES ('4', '8', '1521129600', '1552579200', '', '0', '0', '1521180892', '1521180892', '8', '0', '0.00');
INSERT INTO `ibt_etprs_pactlog` VALUES ('5', '6', '1521129600', '1552579200', 'lx001', '59', '0', '1521181995', '1521181972', '8', '0', '0.00');
INSERT INTO `ibt_etprs_pactlog` VALUES ('6', '8', '1521129600', '1552579200', 'lx002', '60', '0', '1521182163', '1521182140', '8', '0', '0.00');
INSERT INTO `ibt_etprs_pactlog` VALUES ('7', '7', '1521129600', '1552579200', '', '0', '0', '1521183329', '1521183329', '8', '0', '0.00');
INSERT INTO `ibt_etprs_pactlog` VALUES ('8', '7', '1521129600', '1552579200', 'l003l', '65', '0', '1521183423', '1521183410', '8', '0', '0.00');
INSERT INTO `ibt_etprs_pactlog` VALUES ('9', '2', '1521388800', '1552838400', '', '0', '0', '1521424336', '1521424336', '2', '0', '0.00');
INSERT INTO `ibt_etprs_pactlog` VALUES ('10', '1', '1521388800', '1552838400', '', '0', '0', '1521426487', '1521426147', '2', '0', '0.00');
INSERT INTO `ibt_etprs_pactlog` VALUES ('11', '9', '1521388800', '1552838400', '', '0', '0', '1521450806', '1521450806', '2', '0', '0.00');
INSERT INTO `ibt_etprs_pactlog` VALUES ('12', '12', '1521648000', '1553097600', '1001', '168', '0', '1521685195', '1521684318', '2', '0', '0.00');
INSERT INTO `ibt_etprs_pactlog` VALUES ('13', '12', '1553184000', '1584720000', '', '0', '0', '1521684605', '1521684605', '2', '0', '0.00');
INSERT INTO `ibt_etprs_pactlog` VALUES ('14', '16', '1521648000', '1553097600', '', '0', '0', '1521686581', '1521686581', '2', '0', '0.00');
INSERT INTO `ibt_etprs_pactlog` VALUES ('15', '12', '1584806400', '1614441600', '', '0', '0', '1521695275', '1521695275', '2', '0', '0.00');
INSERT INTO `ibt_etprs_pactlog` VALUES ('16', '19', '1521648000', '1553097600', '', '0', '0', '1521705410', '1521699161', '2', '0', '0.00');
INSERT INTO `ibt_etprs_pactlog` VALUES ('17', '20', '1521648000', '1553097600', '', '0', '0', '1521699691', '1521699691', '2', '0', '0.00');
INSERT INTO `ibt_etprs_pactlog` VALUES ('18', '17', '1521648000', '1553097600', '', '0', '0', '1521705293', '1521704453', '2', '0', '0.00');
INSERT INTO `ibt_etprs_pactlog` VALUES ('19', '16', '1521648000', '1553097600', '', '0', '0', '1521704571', '1521704571', '2', '0', '0.00');
INSERT INTO `ibt_etprs_pactlog` VALUES ('20', '9', '1521648000', '1553097600', '', '0', '0', '1521704703', '1521704703', '2', '0', '0.00');
INSERT INTO `ibt_etprs_pactlog` VALUES ('21', '21', '1521648000', '1553097600', '', '0', '0', '1521705877', '1521705872', '2', '0', '0.00');
INSERT INTO `ibt_etprs_pactlog` VALUES ('22', '22', '1521648000', '1553097600', '', '0', '0', '1521707319', '1521707301', '2', '0', '0.00');
INSERT INTO `ibt_etprs_pactlog` VALUES ('23', '18', '1521648000', '1553097600', '', '0', '0', '1521708444', '1521708430', '2', '0', '0.00');
INSERT INTO `ibt_etprs_pactlog` VALUES ('24', '22', '1521648000', '1584720000', '', '0', '0', '1521708615', '1521708512', '2', '0', '0.00');
INSERT INTO `ibt_etprs_pactlog` VALUES ('25', '23', '1521734400', '1553184000', '', '0', '0', '1521768493', '1521768297', '2', '0', '0.00');
INSERT INTO `ibt_etprs_pactlog` VALUES ('26', '9', '1521734400', '1553184000', '', '0', '0', '1521768416', '1521768409', '2', '0', '0.00');
INSERT INTO `ibt_etprs_pactlog` VALUES ('27', '23', '1553270400', '1584806400', '', '0', '0', '1521768532', '1521768532', '2', '0', '0.00');
INSERT INTO `ibt_etprs_pactlog` VALUES ('28', '11', '1521734400', '1553184000', '', '0', '0', '1521773633', '1521773610', '2', '0', '0.00');
INSERT INTO `ibt_etprs_pactlog` VALUES ('29', '16', '1521648000', '1553270400', '1234', '213', '0', '1522047402', '1521855152', '2', '0', '0.00');
INSERT INTO `ibt_etprs_pactlog` VALUES ('30', '26', '1521820800', '1553270400', '', '0', '0', '1521871168', '1521871007', '40', '0', '0.00');
INSERT INTO `ibt_etprs_pactlog` VALUES ('31', '3', '1523203200', '1554652800', '', '0', '0', '1523254238', '1523254238', '2', '0', '0.00');
INSERT INTO `ibt_etprs_pactlog` VALUES ('32', '11', '1553270400', '1605715200', '', '0', '0', '1523589441', '1523589441', '2', '0', '0.00');
INSERT INTO `ibt_etprs_pactlog` VALUES ('33', '11', '1605801600', '1609257600', '', '0', '0', '1523589515', '1523589515', '2', '0', '0.00');
INSERT INTO `ibt_etprs_pactlog` VALUES ('34', '28', '1524067200', '1555516800', '', '0', '0', '1524103713', '1524103713', '2', '0', '0.00');
INSERT INTO `ibt_etprs_pactlog` VALUES ('35', '34', '1524412800', '1555862400', '', '0', '0', '1524454131', '1524454131', '2', '0', '0.00');
INSERT INTO `ibt_etprs_pactlog` VALUES ('36', '38', '1524412800', '1555862400', '', '0', '0', '1524467473', '1524467473', '2', '0', '0.00');

-- ----------------------------
-- Table structure for ibt_etprs_quit
-- ----------------------------
DROP TABLE IF EXISTS `ibt_etprs_quit`;
CREATE TABLE `ibt_etprs_quit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `etprsId` int(11) DEFAULT '0',
  `roomIds` varchar(250) DEFAULT '0' COMMENT '对应 房间  estateRoom表',
  `quitdate` varchar(50) DEFAULT '' COMMENT '申请退出时间',
  `renvtion` int(2) DEFAULT '0' COMMENT '是否二次装修 0-否 1-是',
  `renvtionremove` int(2) DEFAULT '0' COMMENT '二次装修是否拆除完毕 0-是 1-否',
  `isleave` int(2) DEFAULT '0' COMMENT '是否留下装修或物品 0-否 1-是',
  `desc` varchar(500) DEFAULT '' COMMENT '遗留物品说明',
  `mobile` varchar(50) DEFAULT '' COMMENT '联系电话',
  `contact` varchar(50) DEFAULT '' COMMENT '联系人',
  `status` int(11) DEFAULT '1028001' COMMENT 'dict表',
  `isDelete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  `lastupdateTime` int(11) DEFAULT '0' COMMENT '最后修改时间',
  `addtime` int(11) DEFAULT '0' COMMENT '注册时间',
  `adduserId` int(11) DEFAULT '0' COMMENT '11',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='退出申请';

-- ----------------------------
-- Records of ibt_etprs_quit
-- ----------------------------
INSERT INTO `ibt_etprs_quit` VALUES ('1', '2', '3', '2018-03-19 10:20:41', '1', '0', '0', '', '18661971070', '韩旭', '1028001', '0', '1521426041', '1521426041', '2');
INSERT INTO `ibt_etprs_quit` VALUES ('2', '12', '', '2018-03-22 15:57:34', '1', '0', '0', '', '15726426715', '张凯', '1028001', '0', '1521705454', '1521705454', '2');
INSERT INTO `ibt_etprs_quit` VALUES ('3', '1', '', '2018-03-22 15:57:40', '1', '0', '0', '', '15166666727', '陈霄', '1028001', '0', '1521705460', '1521705460', '2');
INSERT INTO `ibt_etprs_quit` VALUES ('4', '3', '', '2018-03-22 15:57:46', '1', '0', '0', '', '15615555555', '王洪涛', '1028001', '0', '1521705466', '1521705466', '2');
INSERT INTO `ibt_etprs_quit` VALUES ('5', '22', '5,81', '2018-03-23 09:12:50', '1', '0', '0', '', '0532-88635431', '图文', '1028001', '0', '1521767570', '1521767570', '2');
INSERT INTO `ibt_etprs_quit` VALUES ('6', '9', '5', '2018-03-23 09:27:56', '1', '0', '0', '', '18605321366', '孙明', '1028001', '0', '1521768476', '1521768476', '2');
INSERT INTO `ibt_etprs_quit` VALUES ('7', '16', '84,85', '2018-04-13 10:40:06', '0', '0', '0', '', '13688635622', '赵涛', '1028001', '0', '1523587206', '1523587206', '2');
INSERT INTO `ibt_etprs_quit` VALUES ('8', '23', '', '2018-04-13 10:41:06', '0', '0', '0', '', '13766985431', '刘北永', '1028001', '0', '1523587266', '1523587266', '2');
INSERT INTO `ibt_etprs_quit` VALUES ('9', '21', '', '2018-04-13 10:41:32', '0', '0', '0', '', '0532-88888888', '丁磊', '1028001', '0', '1523587292', '1523587292', '2');

-- ----------------------------
-- Table structure for ibt_etprs_renew
-- ----------------------------
DROP TABLE IF EXISTS `ibt_etprs_renew`;
CREATE TABLE `ibt_etprs_renew` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `etprsId` int(11) DEFAULT '0',
  `isDelete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  `lastupdateTime` int(11) DEFAULT '0' COMMENT '最后修改时间',
  `addtime` int(11) DEFAULT '0' COMMENT '注册时间',
  `adduserId` int(11) DEFAULT '0' COMMENT '11',
  `roomIds` varchar(50) DEFAULT '' COMMENT '续约房间编号',
  `pactId` int(11) DEFAULT '0' COMMENT '合同表 ',
  `status` varchar(50) DEFAULT '' COMMENT '续约状态 字典表（企业发起续约申请）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='续约记录';

-- ----------------------------
-- Records of ibt_etprs_renew
-- ----------------------------
INSERT INTO `ibt_etprs_renew` VALUES ('1', '12', '0', '1521684605', '1521684605', '2', '62', '13', '');
INSERT INTO `ibt_etprs_renew` VALUES ('2', '12', '0', '1521695275', '1521695275', '2', '62', '15', '');
INSERT INTO `ibt_etprs_renew` VALUES ('3', '22', '0', '1521708512', '1521708512', '2', '81', '24', '');
INSERT INTO `ibt_etprs_renew` VALUES ('4', '23', '0', '1521768532', '1521768532', '2', '81', '27', '');
INSERT INTO `ibt_etprs_renew` VALUES ('5', '11', '0', '1523589441', '1523589441', '2', '87', '32', '');
INSERT INTO `ibt_etprs_renew` VALUES ('6', '11', '0', '1523589515', '1523589515', '2', '87', '33', '');

-- ----------------------------
-- Table structure for ibt_floor
-- ----------------------------
DROP TABLE IF EXISTS `ibt_floor`;
CREATE TABLE `ibt_floor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iqbtId` int(2) DEFAULT NULL,
  `isDelete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  `lastupdateTime` int(11) DEFAULT '0' COMMENT '最后修改时间',
  `addtime` int(11) DEFAULT '0' COMMENT '注册时间',
  `adduserId` int(11) DEFAULT '0' COMMENT '11',
  `buildId` int(11) DEFAULT '0' COMMENT '楼座名称',
  `floor` int(11) DEFAULT '0' COMMENT '楼层',
  `pic` int(11) DEFAULT '0' COMMENT '楼座展示图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=295 DEFAULT CHARSET=utf8 COMMENT='楼座楼层表';

-- ----------------------------
-- Records of ibt_floor
-- ----------------------------
INSERT INTO `ibt_floor` VALUES ('244', '1', '0', '1521711250', '1521593145', '2', '238', '4', '188');
INSERT INTO `ibt_floor` VALUES ('259', '1', '0', '1521609209', '1521609209', '2', '250', '1', '0');
INSERT INTO `ibt_floor` VALUES ('263', '1', '0', '1521614936', '1521614936', '2', '254', '2', '0');
INSERT INTO `ibt_floor` VALUES ('264', '1', '0', '1521615087', '1521615087', '2', '254', '5', '0');
INSERT INTO `ibt_floor` VALUES ('265', '1', '0', '1521615242', '1521615242', '2', '254', '8', '0');
INSERT INTO `ibt_floor` VALUES ('274', '1', '1', '1521700520', '1521696889', '2', '263', '1', '0');
INSERT INTO `ibt_floor` VALUES ('276', '1', '0', '1521697819', '1521697819', '2', '265', '1', '0');
INSERT INTO `ibt_floor` VALUES ('277', '1', '0', '1521707250', '1521707250', '2', '266', '1', '0');
INSERT INTO `ibt_floor` VALUES ('278', '1', '1', '1521769030', '1521709999', '2', '267', '1', '0');
INSERT INTO `ibt_floor` VALUES ('279', '1', '0', '1521712019', '1521712019', '2', '238', '2', '0');
INSERT INTO `ibt_floor` VALUES ('282', '1', '0', '1521887782', '1521769420', '2', '268', '2', '252');
INSERT INTO `ibt_floor` VALUES ('283', '1', '0', '1521769420', '1521769420', '2', '268', '3', '0');
INSERT INTO `ibt_floor` VALUES ('284', '1', '0', '1521769420', '1521769420', '2', '268', '4', '0');
INSERT INTO `ibt_floor` VALUES ('285', '1', '1', '1521772785', '1521771502', '2', '269', '5', '0');
INSERT INTO `ibt_floor` VALUES ('286', '1', '0', '1521857242', '1521772785', '2', '270', '6', '214');
INSERT INTO `ibt_floor` VALUES ('287', '9', '0', '1521868890', '1521868890', '40', '271', '1', '0');
INSERT INTO `ibt_floor` VALUES ('288', '9', '0', '1521869032', '1521869032', '40', '272', '1', '0');
INSERT INTO `ibt_floor` VALUES ('289', '1', '0', '1522033972', '1522033972', '2', '273', '25', '0');
INSERT INTO `ibt_floor` VALUES ('290', '1', '0', '1522043914', '1522043914', '46', '274', '2', '0');
INSERT INTO `ibt_floor` VALUES ('291', '1', '0', '1522050347', '1522050347', '2', '275', '12', '0');
INSERT INTO `ibt_floor` VALUES ('292', '1', '1', '1524639567', '1524639491', '2', '276', '1', '0');
INSERT INTO `ibt_floor` VALUES ('293', '1', '0', '1524647918', '1524647918', '2', '277', '1', '0');
INSERT INTO `ibt_floor` VALUES ('294', '1', '0', '1524713679', '1524713679', '2', '278', '1', '0');

-- ----------------------------
-- Table structure for ibt_flow
-- ----------------------------
DROP TABLE IF EXISTS `ibt_flow`;
CREATE TABLE `ibt_flow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `etprsId` int(11) DEFAULT '0' COMMENT '项目ID',
  `isDelete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  `lastupdateTime` int(11) DEFAULT '0' COMMENT '最后修改时间',
  `addtime` int(11) DEFAULT '0' COMMENT '注册时间',
  `adduserId` int(11) DEFAULT '0' COMMENT '11',
  `desc` text COMMENT '跟进信息',
  `cstmstatus` varchar(50) DEFAULT '' COMMENT '客户状态',
  `reason` varchar(50) DEFAULT '' COMMENT '跟进原因 字典表',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='用户跟进';

-- ----------------------------
-- Records of ibt_flow
-- ----------------------------
INSERT INTO `ibt_flow` VALUES ('1', '2', '0', '1521180864', '1521180864', '2', '准备入驻', '6002003', '6002003001');
INSERT INTO `ibt_flow` VALUES ('3', '10', '0', '1521524644', '1521524644', '18', '最近确定', '6002002', '6002002001');
INSERT INTO `ibt_flow` VALUES ('4', '12', '0', '1521525493', '1521525493', '2', '明天联系', '6002001', '6002001001');
INSERT INTO `ibt_flow` VALUES ('5', '12', '0', '1521525528', '1521525528', '2', '已预约', '6002002', '6002002002');
INSERT INTO `ibt_flow` VALUES ('6', '18', '0', '1521697543', '1521697543', '2', 'zaimang', '6002001', '6002001002');
INSERT INTO `ibt_flow` VALUES ('7', '18', '0', '1521697545', '1521697545', '2', 'zaimang', '6002001', '6002001002');
INSERT INTO `ibt_flow` VALUES ('8', '18', '0', '1521702377', '1521702377', '2', '啊是的', '6002003', '6002003001');
INSERT INTO `ibt_flow` VALUES ('9', '9', '0', '1521704611', '1521704611', '2', '啊是的', '6002003', '6002003001');
INSERT INTO `ibt_flow` VALUES ('10', '21', '0', '1521705855', '1521705855', '2', '刚', '6002003', '6002003001');
INSERT INTO `ibt_flow` VALUES ('11', '23', '0', '1521767791', '1521767791', '2', '规划局和', '6002002', '6002002002');
INSERT INTO `ibt_flow` VALUES ('12', '16', '0', '1521855008', '1521855008', '2', '辅导费', '6002004', '6002004002');
INSERT INTO `ibt_flow` VALUES ('13', '26', '0', '1521870528', '1521870528', '40', '规范', '6002003', '6002003001');
INSERT INTO `ibt_flow` VALUES ('14', '26', '0', '1521870535', '1521870535', '40', '规范', '6002003', '6002003001');
INSERT INTO `ibt_flow` VALUES ('15', '26', '0', '1521870543', '1521870543', '40', '规范', '6002003', '6002003001');
INSERT INTO `ibt_flow` VALUES ('16', '26', '0', '1521870570', '1521870570', '40', '规范', '6002003', '6002003001');
INSERT INTO `ibt_flow` VALUES ('17', '26', '0', '1521870580', '1521870580', '40', '规范', '6002003', '6002003001');
INSERT INTO `ibt_flow` VALUES ('18', '25', '0', '1521889479', '1521889479', '2', '再沟通', '6002001', '6002001002');
INSERT INTO `ibt_flow` VALUES ('19', '20', '0', '1522144336', '1522144336', '2', '啊是的', '6002004', '6002004001');
INSERT INTO `ibt_flow` VALUES ('20', '24', '0', '1522144461', '1522144461', '2', '啊是的', '6002004', '6002004002');
INSERT INTO `ibt_flow` VALUES ('21', '25', '0', '1522805708', '1522805708', '2', '啊是的', '6002003', '6002003001');
INSERT INTO `ibt_flow` VALUES ('22', '29', '0', '1522806627', '1522806627', '2', '客户在忙', '6002001', '6002001001');
INSERT INTO `ibt_flow` VALUES ('23', '29', '0', '1522807051', '1522807051', '2', '还在忙', '6002001', '6002001001');
INSERT INTO `ibt_flow` VALUES ('24', '29', '0', '1522807119', '1522807119', '2', '还在忙', '6002001', '6002001001');
INSERT INTO `ibt_flow` VALUES ('25', '29', '0', '1522807861', '1522807861', '2', '真的忙,非常忙,真的忙,非常忙真的忙,非常忙真的忙,非常忙真的忙,非常忙真的忙,非常忙真的忙,非常忙真的忙,非常忙真的忙,非常忙真的忙,非常忙真的忙,非常忙真的忙,非常忙真的忙,非常忙', '6002001', '6002001001');
INSERT INTO `ibt_flow` VALUES ('26', '30', '0', '1523413484', '1523413484', '43', '啊是的', '6002002', '6002002001');
INSERT INTO `ibt_flow` VALUES ('27', '30', '0', '1523517229', '1523517229', '2', '微信端测试', '6002002', '6002002001');
INSERT INTO `ibt_flow` VALUES ('28', '30', '0', '1523517290', '1523517290', '2', '跳转测试', '6002002', '6002002001');
INSERT INTO `ibt_flow` VALUES ('29', '30', '0', '1523517423', '1523517423', '2', '已找到房子', '6002004', '6002004003');
INSERT INTO `ibt_flow` VALUES ('30', '35', '0', '1523517932', '1523517932', '2', '撒旦法', '6002003', '6002003001');
INSERT INTO `ibt_flow` VALUES ('31', '20', '0', '1524102454', '1524102454', '2', '1', '6002003', '6002003001');
INSERT INTO `ibt_flow` VALUES ('32', '25', '0', '1524104190', '1524104190', '2', '1', '6002002', '6002002001');
INSERT INTO `ibt_flow` VALUES ('33', '25', '0', '1524104211', '1524104211', '2', '1', '6002003', '6002003001');
INSERT INTO `ibt_flow` VALUES ('34', '38', '0', '1524467267', '1524467267', '2', 'pass', '6002003', '6002003001');

-- ----------------------------
-- Table structure for ibt_incubator
-- ----------------------------
DROP TABLE IF EXISTS `ibt_incubator`;
CREATE TABLE `ibt_incubator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT '',
  `address` varchar(256) DEFAULT '',
  `mobile` varchar(128) DEFAULT '' COMMENT '联系人',
  `leader` varchar(128) DEFAULT '' COMMENT '负责人',
  `email` varchar(128) DEFAULT '',
  `createtime` varchar(50) DEFAULT '' COMMENT '创建时间',
  `etprsIqbtId` int(11) DEFAULT '0' COMMENT '对应etprs_iqbt表ID',
  `districtId` int(11) DEFAULT '0' COMMENT '区域ID',
  `status` varchar(50) DEFAULT '' COMMENT '状态 6026',
  `aplnum` int(11) DEFAULT '0' COMMENT '孵化器认领前申请次数',
  `level` varchar(128) DEFAULT '' COMMENT '级别  dict 1031',
  `services` varchar(256) DEFAULT '' COMMENT '提供服务 dict 1032',
  `facility` varchar(256) DEFAULT '' COMMENT '配套设施 1033 dict',
  `property` varchar(128) DEFAULT '' COMMENT '孵化器属性dict 1041',
  `type` varchar(128) DEFAULT '' COMMENT '孵化器分类 dict 6004',
  `menuIds` text COMMENT '孵化器对应权限',
  `packageId` int(11) DEFAULT '0',
  `area` decimal(11,2) DEFAULT '0.00' COMMENT '占地面积',
  `roomarea` decimal(11,2) DEFAULT '0.00' COMMENT '房间面积',
  `unitnum` int(11) DEFAULT '0' COMMENT '工位数',
  `roomnum` int(11) DEFAULT '0' COMMENT '房间数',
  `domain` varchar(64) DEFAULT '' COMMENT '绑定的域名，不带http',
  `bgimg` varchar(128) DEFAULT '' COMMENT '背景图片',
  `exptime` int(11) DEFAULT '0' COMMENT '过期时间',
  `logo` int(11) DEFAULT '0' COMMENT 'logo图片',
  `openSms` tinyint(2) DEFAULT '1' COMMENT '是否开启注册页面短信验证，1：开启  0 不开启',
  `workstyle` varchar(255) DEFAULT '' COMMENT '办公方式 1021 可以多选 同时包含办公室和工位形式',
  `lat` varchar(255) DEFAULT '' COMMENT '经度',
  `lot` varchar(255) DEFAULT '' COMMENT '维度',
  `rate` varchar(255) DEFAULT '' COMMENT '星级',
  `field` varchar(255) DEFAULT '' COMMENT '关注领域 5002',
  `hot` int(11) DEFAULT '500' COMMENT '热度  浏览量',
  `contact` varchar(255) DEFAULT '' COMMENT '联系人',
  `busneslic` int(11) DEFAULT '0' COMMENT '营业执照',
  `honor` int(11) DEFAULT '0' COMMENT '场地资质及荣誉',
  `detail` text COMMENT '详细介绍',
  `isstrent` tinyint(2) DEFAULT '0' COMMENT '是否支持短租',
  `require` text COMMENT '招募要求',
  `weight` int(11) DEFAULT '500' COMMENT '权重',
  `roomprice` decimal(10,2) DEFAULT '0.00' COMMENT '房间价格',
  `unitprice` decimal(10,2) DEFAULT '0.00' COMMENT '工位价格',
  `desc` text COMMENT '简介',
  `credit` varchar(255) DEFAULT '' COMMENT '信用代码',
  `lealperson` varchar(255) DEFAULT '' COMMENT '法人',
  `idcard` int(11) DEFAULT '0' COMMENT '身份证',
  `ognzId` int(11) DEFAULT '0' COMMENT '协会ID',
  `spacepic` varchar(255) DEFAULT '' COMMENT '场地多图片 多个逗号分离',
  `poster` int(11) DEFAULT '0' COMMENT '场地封面图',
  `numberOffice` int(11) DEFAULT '0' COMMENT '办公人数',
  `isLock` int(11) DEFAULT '0' COMMENT '0展示  2锁定',
  `policyspt` varchar(50) DEFAULT '7002001' COMMENT '是否政策支持  7002001:是 7002002:否',
  `policy` text COMMENT '政策支持',
  `fundtion` text COMMENT '基金',
  `isfundtion` varchar(50) NOT NULL DEFAULT '7002001' COMMENT '是否有基金支持 7002001:是 7002002:否',
  `rgstspt` varchar(50) NOT NULL DEFAULT '7002001' COMMENT '是否提供注册 7002001:是 7002002:否',
  `isDelete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  `lastupdateTime` int(11) DEFAULT '0' COMMENT '最后修改时间',
  `addtime` int(11) DEFAULT '0' COMMENT '注册时间',
  `adduserId` int(11) DEFAULT '0' COMMENT '11',
  `apltime` int(11) DEFAULT '0' COMMENT '申请时间，导入的项目没有申请时间',
  `display` varchar(255) DEFAULT '' COMMENT '空间展示链接',
  `saleId` int(11) DEFAULT '0' COMMENT '对接人',
  `validTime` int(11) unsigned DEFAULT '0' COMMENT '账号过期时间',
  `from` varchar(50) DEFAULT '' COMMENT '来源',
  `company` varchar(255) DEFAULT '' COMMENT '公司名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='孵化器表';

-- ----------------------------
-- Records of ibt_incubator
-- ----------------------------
INSERT INTO `ibt_incubator` VALUES ('1', '海创汇', '海尔大道', '18888888888', '', '', '', '0', '370212', '1', '0', '', '6006001,6006002,6006003,6006004,6006005,6006006,6006007,6006008,6006009,6006010,6006011,6006012', '6005001,6005002,6005004,6005005,6005006,6005007,6005008,6005009,6005010', '', '6004001', null, '0', '0.00', '0.00', '0', '0', '', '', '0', '38', '1', '6007001', '', '', '', '', '500', '张震', '7', '0', '<p>海<span style=\"background-color: yellow;\">创</span>汇<img style=\"width: 534.51px; height: 354.91px;\" src=\"/public/files//notice//1-1521106019-45621-0.jpg\" data-filename=\"image name\">是打发点</p><p><span style=\"text-align: center; color: rgb(102, 102, 102); font-family: &quot;San Francisco&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; font-size: 16px;\">海创汇是海尔集团由“制造产品”向“孵化创客”转型的孵化平台品牌。依托海尔生态产业资源及开放的社会资源，海创汇区别于普通孵化器，实现了创新与创业、线上与线下、孵化与投资的系统结合，为创客提供包含投资、学院、供应链&amp;渠道加速、空间、工厂、创新技术等一站式孵化服务。</span><br></p>', '0', '招募', '500', '0.00', '0.00', null, '1414514515412', '张瑞敏', '0', '0', '', '423', '0', '0', '7002002', '', '海尔金融', '7002001', '7002001', '0', '1523956485', '1521106064', '1', '0', 'http://livetour.istaging.com.cn/5ab3486e44d90418a218678a', '0', '1840809599', '', '');
INSERT INTO `ibt_incubator` VALUES ('8', '联讯U谷', '兴宁区1号', '18878982225', '', '', '', '0', '450102', '1', '0', '', '6006001', '', '', '6004002', null, '0', '0.00', '0.00', '0', '0', '', '', '0', '0', '1', '6007001', '', '', '', '', '500', '张裕祥', '185', '0', '联讯U谷', '0', '', '500', '0.00', '0.00', null, '', '', '0', '0', '', '0', '0', '0', '7002002', '', '', '7002002', '7002001', '0', '1522235023', '1521710041', '27', '0', '', '0', '1553097599', '', '');
INSERT INTO `ibt_incubator` VALUES ('9', '齐河孵化器', '青岛李沧', '13800000000', '', '', '', '0', '370213', '1', '0', '', '6006001,6006002,6006003,6006004,6006005,6006006,6006007,6006008,6006009,6006010,6006011,6006012', '6005001,6005002,6005004,6005005,6005006,6005007,6005008,6005009,6005010', '', '6004001', null, '0', '0.00', '0.00', '0', '0', '', '', '0', '216', '1', '6007001,6007002', '', '', '', '', '500', '周超', '219', '0', '<p>&nbsp;创业培训，服务咖啡<br></p>', '0', '有需求的所有公司', '500', '0.00', '0.00', null, '123456', '刘丹', '0', '0', '', '215', '0', '0', '7002002', '', '', '7002002', '7002001', '0', '1521873733', '1521861087', '1', '0', '', '0', '0', '', '');
INSERT INTO `ibt_incubator` VALUES ('14', '1777+', '大所发生的', '17777777777', '', '', '', '0', '110102', '1', '0', '', '6006001,6006002,6006003,6006004,6006005,6006006,6006007,6006008,6006009,6006010,6006011,6006012', '', '', '6004001', null, '0', '0.00', '0.00', '0', '0', '', '', '0', '0', '1', '6007001', '', '', '', '', '500', '阿萨德发', '0', '0', '阿萨德发', '0', '', '500', '0.00', '0.00', null, '', '', '0', '0', '', '0', '0', '0', '7002002', '', '', '7002002', '7002001', '0', '1522234067', '1522213760', '52', '0', '', '0', '1523030399', '', '');
INSERT INTO `ibt_incubator` VALUES ('15', '假按揭啊', '阿斯蒂芬', '15655556666', '', '', '', '0', '340304', '1', '0', '', '6006001,6006002,6006003,6006004,6006005,6006006,6006007,6006008,6006009,6006010,6006011,6006012', '', '', '6004001', null, '0', '0.00', '0.00', '0', '0', '', '', '0', '0', '1', '6007001', '', '', '', '', '500', '执照', '0', '0', '啊是的', '0', '', '500', '0.00', '0.00', null, '', '', '0', '0', '', '0', '0', '0', '7002002', '', '', '7002002', '7002001', '0', '1522631461', '1522631450', '1', '0', '', '0', '0', '', '');
INSERT INTO `ibt_incubator` VALUES ('16', '测试空间', '阿斯蒂芬', '15666666666', '', '', '', '0', '340203', '1', '0', '', '6006001,6006002,6006003,6006004,6006005,6006006,6006007,6006008,6006009,6006010,6006011,6006012', '', '', '6004001', null, '0', '0.00', '0.00', '0', '0', '', '', '0', '0', '1', '6007001', '', '', '', '', '500', '张三', '0', '0', '阿斯蒂芬', '0', '', '500', '0.00', '0.00', null, '', '', '0', '0', '', '0', '0', '0', '7002002', '', '', '7002002', '7002001', '0', '1523262851', '1523261711', '3', '0', '', '0', '1513894399', '', '');
INSERT INTO `ibt_incubator` VALUES ('17', '张三空间', '阿斯蒂芬', '15653217396', '', '', '', '0', '340203', '1', '0', '', '6006001,6006002,6006003,6006004,6006005,6006006,6006007,6006008,6006009,6006010,6006011,6006012', '', '', '6004001', null, '0', '0.00', '0.00', '0', '0', '', '', '0', '0', '1', '6007001', '', '', '', '', '500', '1231', '0', '0', '阿斯蒂芬', '0', '', '500', '0.00', '0.00', null, '', '', '0', '0', '', '0', '0', '0', '7002002', '', '', '7002002', '7002001', '0', '1523409424', '1523263594', '3', '0', '', '0', '1523548799', '', '');
INSERT INTO `ibt_incubator` VALUES ('18', '418空间', '山东路', '13730928572', '', '', '', '0', '110105', '1', '0', '', '6006001', '', '', '6004001', null, '0', '0.00', '0.00', '0', '0', '', '', '0', '0', '1', '6007001', '', '', '', '', '500', '郭孝东', '0', '0', '空间详情', '0', '', '500', '0.00', '0.00', null, '', '', '0', '0', '', '0', '0', '0', '7002002', '', '', '7002002', '7002001', '0', '1524014708', '1524014708', '0', '0', '', '0', '0', '', '');
INSERT INTO `ibt_incubator` VALUES ('19', '', '', '', '', '', '', '0', '0', '6026003', '0', '', '', '', '', '', null, '0', '0.00', '0.00', '0', '0', '', '', '0', '0', '1', '', '', '', '', '', '500', '', '0', '0', null, '0', null, '500', '0.00', '0.00', null, '', '', '0', '0', '', '0', '0', '0', '7002001', null, null, '7002001', '7002001', '0', '1524652724', '1524652724', '0', '0', '', '0', '0', '', '');

-- ----------------------------
-- Table structure for ibt_iqbt_case
-- ----------------------------
DROP TABLE IF EXISTS `ibt_iqbt_case`;
CREATE TABLE `ibt_iqbt_case` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT '' COMMENT '孵化案例',
  `logo` varchar(255) DEFAULT '' COMMENT 'logo',
  `url` varchar(255) DEFAULT '' COMMENT '案例链接',
  `desc` text COMMENT '案例简介',
  `adduserId` int(11) DEFAULT '0',
  `addtime` int(11) DEFAULT '0',
  `iqbtId` int(11) DEFAULT '0',
  `isDelete` tinyint(2) DEFAULT '0',
  `lastupdateTime` int(11) DEFAULT '0' COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='孵化案例';

-- ----------------------------
-- Records of ibt_iqbt_case
-- ----------------------------
INSERT INTO `ibt_iqbt_case` VALUES ('1', '海尔夏家店', '8', 'http://www.ihaier.com', '大师傅', '1', '1521106062', '1', '0', '1521106064');
INSERT INTO `ibt_iqbt_case` VALUES ('2', '阿士大夫撒旦', '77', '', '阿斯蒂芬', '2', '1521422883', '1', '1', '1521429492');
INSERT INTO `ibt_iqbt_case` VALUES ('4', '张建', '92', '', '阿斯蒂芬', '2', '1521427550', '1', '0', '1523330370');
INSERT INTO `ibt_iqbt_case` VALUES ('5', '鹿班到家', '95', 'http://http://cbadmin.zlhuiyun.com/iqbt/Iqbt/editIqbt.html', '', '2', '1521427614', '1', '1', '1521537539');
INSERT INTO `ibt_iqbt_case` VALUES ('13', '大幅度', '247', 'http://cbadmin.zlhuiyun.com/iqbt/Iqbt/editIqbt.html', '地方的的地方', '40', '1521873603', '9', '0', '1521873644');
INSERT INTO `ibt_iqbt_case` VALUES ('14', '两面针企业形象VR展示', '254', 'http://livetour.istaging.com.cn/5a0696682f301e2c5cc4c199', '两面针企业形象VR展示由江苏两岸创客家孵化器运营管理有限公司整合界内VR资源，为企业定制了可接入视频、音乐、与电商交互的VR', '46', '1522035155', '1', '0', '1522035155');

-- ----------------------------
-- Table structure for ibt_iqbt_img
-- ----------------------------
DROP TABLE IF EXISTS `ibt_iqbt_img`;
CREATE TABLE `ibt_iqbt_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iqbtId` int(11) DEFAULT '0',
  `fileId` int(11) DEFAULT '0' COMMENT '文件ID',
  `code` varchar(50) DEFAULT '' COMMENT '配套设置字典代码',
  `isDelete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  `lastupdateTime` int(11) DEFAULT '0' COMMENT '最后修改时间',
  `addtime` int(11) DEFAULT '0' COMMENT '注册时间',
  `adduserId` int(11) DEFAULT '0' COMMENT '11',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='环境照片';

-- ----------------------------
-- Records of ibt_iqbt_img
-- ----------------------------
INSERT INTO `ibt_iqbt_img` VALUES ('1', '1', '3', '6005015', '1', '1523330749', '1521105966', '1');
INSERT INTO `ibt_iqbt_img` VALUES ('2', '1', '4', '6005018', '1', '1523330749', '1521105971', '1');
INSERT INTO `ibt_iqbt_img` VALUES ('3', '1', '5', '6005009', '1', '1523330749', '1521105978', '1');
INSERT INTO `ibt_iqbt_img` VALUES ('4', '0', '14', '6005015', '1', '1521163886', '1521163886', '1');
INSERT INTO `ibt_iqbt_img` VALUES ('8', '1', '36', '6005015', '1', '1523330749', '1521171487', '2');
INSERT INTO `ibt_iqbt_img` VALUES ('9', '1', '112', '6005017', '1', '1523330749', '1521526166', '2');
INSERT INTO `ibt_iqbt_img` VALUES ('10', '1', '115', '6005016', '1', '1523330749', '1521526760', '2');
INSERT INTO `ibt_iqbt_img` VALUES ('11', '1', '117', '6005005', '1', '1523330749', '1521526780', '2');
INSERT INTO `ibt_iqbt_img` VALUES ('12', '1', '118', '6005017', '1', '1523330749', '1521527380', '2');
INSERT INTO `ibt_iqbt_img` VALUES ('13', '1', '119', '6005016', '1', '1523330749', '1521527661', '2');
INSERT INTO `ibt_iqbt_img` VALUES ('14', '1', '120', 'undefined', '1', '1523330749', '1521527801', '2');
INSERT INTO `ibt_iqbt_img` VALUES ('15', '1', '121', 'undefined', '1', '1523330749', '1521527849', '2');
INSERT INTO `ibt_iqbt_img` VALUES ('16', '1', '122', 'undefined', '1', '1523330749', '1521527857', '2');
INSERT INTO `ibt_iqbt_img` VALUES ('17', '1', '123', 'undefined', '1', '1523330749', '1521527865', '2');
INSERT INTO `ibt_iqbt_img` VALUES ('18', '1', '124', 'undefined', '1', '1523330749', '1521527901', '2');
INSERT INTO `ibt_iqbt_img` VALUES ('19', '1', '125', '6005016', '1', '1523330749', '1521528933', '2');
INSERT INTO `ibt_iqbt_img` VALUES ('20', '0', '126', '6005016', '1', '1521528989', '1521528989', '2');
INSERT INTO `ibt_iqbt_img` VALUES ('21', '0', '127', '6005015', '1', '1521528996', '1521528996', '2');
INSERT INTO `ibt_iqbt_img` VALUES ('22', '0', '128', '6005016', '1', '1521529029', '1521529029', '2');
INSERT INTO `ibt_iqbt_img` VALUES ('23', '1', '129', 'undefined', '1', '1523330749', '1521529641', '2');
INSERT INTO `ibt_iqbt_img` VALUES ('24', '1', '130', 'undefined', '1', '1523330749', '1521529663', '2');
INSERT INTO `ibt_iqbt_img` VALUES ('25', '1', '133', '6005008', '1', '1523330749', '1521533657', '2');
INSERT INTO `ibt_iqbt_img` VALUES ('26', '1', '152', 'undefined', '1', '1523330749', '1521609331', '2');
INSERT INTO `ibt_iqbt_img` VALUES ('27', '1', '153', '6005002', '1', '1523330749', '1521613991', '2');
INSERT INTO `ibt_iqbt_img` VALUES ('28', '1', '154', '6005016', '1', '1523330749', '1521614059', '2');
INSERT INTO `ibt_iqbt_img` VALUES ('29', '1', '155', '6005017', '1', '1523330749', '1521614253', '2');
INSERT INTO `ibt_iqbt_img` VALUES ('30', '1', '156', '6005016', '1', '1523330749', '1521614279', '2');
INSERT INTO `ibt_iqbt_img` VALUES ('31', '1', '157', '6005006', '1', '1523330749', '1521614287', '2');
INSERT INTO `ibt_iqbt_img` VALUES ('32', '1', '158', '6005016', '1', '1523330749', '1521614310', '2');
INSERT INTO `ibt_iqbt_img` VALUES ('33', '1', '159', '6005004', '1', '1523330749', '1521614317', '2');
INSERT INTO `ibt_iqbt_img` VALUES ('34', '1', '160', '6005005', '1', '1523330749', '1521614322', '2');
INSERT INTO `ibt_iqbt_img` VALUES ('35', '1', '161', '6005007', '1', '1523330749', '1521614331', '2');
INSERT INTO `ibt_iqbt_img` VALUES ('36', '1', '162', '6005017', '1', '1523330749', '1521614342', '2');
INSERT INTO `ibt_iqbt_img` VALUES ('37', '1', '163', '6005016', '1', '1523330749', '1521614358', '2');
INSERT INTO `ibt_iqbt_img` VALUES ('38', '1', '164', '6005009', '1', '1523330749', '1521614440', '2');
INSERT INTO `ibt_iqbt_img` VALUES ('39', '1', '165', '6005016', '1', '1523330749', '1521614453', '2');
INSERT INTO `ibt_iqbt_img` VALUES ('40', '1', '183', '6005006', '1', '1523330749', '1521709800', '2');
INSERT INTO `ibt_iqbt_img` VALUES ('41', '1', '184', '6005017', '1', '1523330749', '1521709813', '2');
INSERT INTO `ibt_iqbt_img` VALUES ('42', '1', '205', '6005002', '1', '1523330749', '1521852089', '2');
INSERT INTO `ibt_iqbt_img` VALUES ('43', '1', '206', '6005007', '1', '1523330749', '1521852302', '2');
INSERT INTO `ibt_iqbt_img` VALUES ('44', '1', '207', '6005005', '1', '1523330749', '1521852307', '2');
INSERT INTO `ibt_iqbt_img` VALUES ('45', '1', '208', '6005004', '1', '1523330749', '1521852487', '2');
INSERT INTO `ibt_iqbt_img` VALUES ('46', '1', '209', '6005006', '1', '1523330749', '1521852499', '2');
INSERT INTO `ibt_iqbt_img` VALUES ('47', '1', '210', '6005005', '1', '1523330749', '1521852792', '2');
INSERT INTO `ibt_iqbt_img` VALUES ('48', '1', '211', '6005004', '1', '1523330749', '1521852803', '2');
INSERT INTO `ibt_iqbt_img` VALUES ('49', '1', '212', '6005005', '1', '1523330749', '1521854446', '2');
INSERT INTO `ibt_iqbt_img` VALUES ('50', '9', '217', '6005015', '0', '1521873733', '1521860904', '1');
INSERT INTO `ibt_iqbt_img` VALUES ('51', '9', '218', '6005016', '0', '1521873733', '1521860922', '1');
INSERT INTO `ibt_iqbt_img` VALUES ('52', '9', '248', '6005017', '0', '1521873733', '1521873724', '40');
INSERT INTO `ibt_iqbt_img` VALUES ('53', '0', '256', '6005016', '1', '1522035800', '1522035800', '2');
INSERT INTO `ibt_iqbt_img` VALUES ('54', '1', '257', '6005004', '1', '1523330749', '1522041967', '2');
INSERT INTO `ibt_iqbt_img` VALUES ('55', '1', '303', '6005015', '0', '1523330749', '1523330724', '2');
INSERT INTO `ibt_iqbt_img` VALUES ('56', '1', '304', '6005016', '0', '1523330749', '1523330730', '2');
INSERT INTO `ibt_iqbt_img` VALUES ('57', '1', '305', '6005001', '0', '1523330749', '1523330746', '2');

-- ----------------------------
-- Table structure for ibt_iqbt_pactlog
-- ----------------------------
DROP TABLE IF EXISTS `ibt_iqbt_pactlog`;
CREATE TABLE `ibt_iqbt_pactlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iqbtId` int(11) DEFAULT '0',
  `name` varchar(50) DEFAULT '' COMMENT '合同名称',
  `pact_start` int(11) DEFAULT '0' COMMENT '合同开始时间',
  `pact_end` int(11) DEFAULT '0' COMMENT '合同结束时间',
  `pactNo` varchar(128) DEFAULT '' COMMENT '合同编号',
  `pact` int(11) DEFAULT '0' COMMENT '合同文件ID',
  `total` decimal(10,2) DEFAULT '0.00' COMMENT '合同金额',
  `isDelete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  `lastupdateTime` int(11) DEFAULT '0' COMMENT '最后修改时间',
  `addtime` int(11) DEFAULT '0' COMMENT '注册时间',
  `adduserId` int(11) DEFAULT '0' COMMENT '11',
  `pactTime` int(11) DEFAULT '0' COMMENT '合同时间统计  20180202自己加的，表中本来无此字段',
  `pactTotal` decimal(11,2) DEFAULT '0.00' COMMENT '合同金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='合同记录';

-- ----------------------------
-- Records of ibt_iqbt_pactlog
-- ----------------------------

-- ----------------------------
-- Table structure for ibt_iqbt_visit
-- ----------------------------
DROP TABLE IF EXISTS `ibt_iqbt_visit`;
CREATE TABLE `ibt_iqbt_visit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iqbtId` int(11) DEFAULT '0',
  `name` varchar(255) DEFAULT '' COMMENT '公司名次',
  `contact` varchar(255) DEFAULT '' COMMENT '联系人',
  `mobile` varchar(255) DEFAULT '',
  `isDelete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  `lastupdateTime` int(11) DEFAULT '0' COMMENT '最后修改时间',
  `addtime` int(11) DEFAULT '0' COMMENT '注册时间',
  `adduserId` int(11) DEFAULT '0' COMMENT '11',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='预约参观';

-- ----------------------------
-- Records of ibt_iqbt_visit
-- ----------------------------

-- ----------------------------
-- Table structure for ibt_log
-- ----------------------------
DROP TABLE IF EXISTS `ibt_log`;
CREATE TABLE `ibt_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT '0',
  `rcdId` int(11) DEFAULT '0' COMMENT '操作记录的ID',
  `desc` varchar(256) DEFAULT '' COMMENT '详情',
  `isDelete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  `lastupdateTime` int(11) DEFAULT '0' COMMENT '最后修改时间',
  `addtime` int(11) DEFAULT '0' COMMENT '注册时间',
  `adduserId` int(11) DEFAULT '0' COMMENT '11',
  `code` varchar(50) DEFAULT '' COMMENT '标示',
  `table` varchar(255) DEFAULT '' COMMENT '操作表',
  `etprsId` int(11) DEFAULT '0' COMMENT '企业ID',
  `iqbtId` int(11) DEFAULT '0' COMMENT '空间ID',
  `privious` text COMMENT '修改前的值。',
  `after` text COMMENT '修改后的值',
  `ip` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1873 DEFAULT CHARSET=utf8 COMMENT='用户操作记录';

-- ----------------------------
-- Records of ibt_log
-- ----------------------------
INSERT INTO `ibt_log` VALUES ('1', '1', '1', '用户登录', '0', '1521105859', '1521105859', '1', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('2', '1', '1', '添加空间', '0', '1521106064', '1521106064', '1', '6012015', 'incubator', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('3', '2', '2', '用户登录', '0', '1521106104', '1521106104', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('4', '2', '0', '成功导入3条记录', '0', '1521106124', '1521106124', '2', '6012005', 'etprs', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('5', '2', '2', '用户登录', '0', '1521106378', '1521106378', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('6', '2', '3', '发起入驻-编辑入驻客户', '0', '1521106397', '1521106397', '2', '6012010', 'etprs', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('7', '2', '3', '正式分配房间', '0', '1521106402', '1521106402', '2', '6012009', 'etprs', '3', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('8', '2', '3', '发起入驻-签约合同', '0', '1521106415', '1521106415', '2', '6012008', 'etprs', '3', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('9', '3', '3', '用户登录', '0', '1521106435', '1521106435', '3', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('10', '2', '2', '用户登录', '0', '1521106503', '1521106503', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('11', '2', '2', '用户登录', '0', '1521160931', '1521160931', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('12', '1', '1', '用户登录', '0', '1521163652', '1521163652', '1', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('13', '1', '1', '用户登录', '0', '1521163655', '1521163655', '1', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('14', '1', '1', '用户登录', '0', '1521163721', '1521163721', '1', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('15', '4', '4', '用户登录', '0', '1521163777', '1521163777', '4', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('16', '1', '1', '用户登录', '0', '1521163819', '1521163819', '1', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('17', '1', '2', '添加空间', '0', '1521163867', '1521163867', '1', '6012015', 'incubator', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('19', '1', '4', '添加空间', '0', '1521164292', '1521164292', '1', '6012015', 'incubator', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('20', '1', '5', '添加空间', '0', '1521164394', '1521164394', '1', '6012015', 'incubator', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('21', '1', '1', '用户登录', '0', '1521164454', '1521164454', '1', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('22', '1', '1', '用户登录', '0', '1521165293', '1521165293', '1', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('24', '1', '1', '用户登录', '0', '1521165649', '1521165649', '1', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('25', '1', '1', '用户登录', '0', '1521166547', '1521166547', '1', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('26', '1', '6', '添加空间', '0', '1521166614', '1521166614', '1', '6012015', 'incubator', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('28', '1', '7', '添加空间', '0', '1521166679', '1521166679', '1', '6012015', 'incubator', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('30', '2', '2', '用户登录', '0', '1521166788', '1521166788', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('31', '2', '2', '用户登录', '0', '1521167176', '1521167176', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('32', '2', '2', '用户登录', '0', '1521167327', '1521167327', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('33', '2', '2', '用户登录', '0', '1521167423', '1521167423', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('36', '1', '1', '用户登录', '0', '1521169311', '1521169311', '1', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('37', '2', '2', '用户登录', '0', '1521169329', '1521169329', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('39', '2', '2', '用户登录', '0', '1521171061', '1521171061', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('40', '2', '0', '成功导入0条记录', '0', '1521171139', '1521171139', '2', '6012018', 'room', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('41', '2', '0', '成功导入0条记录', '0', '1521171139', '1521171139', '2', '6012018', 'room', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('42', '2', '0', '成功导入0条记录', '0', '1521171140', '1521171140', '2', '6012018', 'room', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('43', '2', '0', '成功导入0条记录', '0', '1521171140', '1521171140', '2', '6012018', 'room', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('44', '2', '1', '修改空间信息', '0', '1521171490', '1521171490', '2', '6012016', 'incubator', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('45', '2', '2', '用户登录', '0', '1521171510', '1521171510', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('46', '1', '1', '用户登录', '0', '1521171715', '1521171715', '1', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('47', '1', '1', '修改空间信息', '0', '1521172642', '1521172642', '1', '6012016', 'incubator', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('48', '1', '1', '用户登录', '0', '1521176870', '1521176870', '1', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('49', '2', '2', '用户登录', '0', '1521176896', '1521176896', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('59', '2', '2', '用户登录', '0', '1521180787', '1521180787', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('60', '2', '1', '跟进客户', '0', '1521180864', '1521180864', '2', '6012003', 'flow', '2', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('61', '2', '1', '跟进客户-更改客户状态,入驻状态', '0', '1521180864', '1521180864', '2', '6012003', 'flow', '2', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('65', '2', '2', '用户登录', '0', '1521181093', '1521181093', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('67', '2', '0', '成功导入1条记录', '0', '1521181143', '1521181143', '2', '6012018', 'room', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('68', '2', '0', '成功导入1条记录', '0', '1521181166', '1521181166', '2', '6012018', 'room', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('69', '2', '0', '成功导入1条记录', '0', '1521181172', '1521181172', '2', '6012018', 'room', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('73', '2', '2', '用户登录', '0', '1521181381', '1521181381', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('74', '2', '0', '成功导入1条记录', '0', '1521181463', '1521181463', '2', '6012018', 'room', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('75', '2', '0', '成功导入1条记录', '0', '1521181476', '1521181476', '2', '6012018', 'room', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('76', '2', '0', '成功导入1条记录', '0', '1521181479', '1521181479', '2', '6012018', 'room', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('77', '2', '0', '成功导入1条记录', '0', '1521181480', '1521181480', '2', '6012018', 'room', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('103', '2', '0', '成功导入1条记录', '0', '1521184799', '1521184799', '2', '6012018', 'room', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('105', '3', '3', '用户登录', '0', '1521185656', '1521185656', '3', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('106', '2', '2', '用户登录', '0', '1521185691', '1521185691', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('107', '3', '3', '用户登录', '0', '1521185746', '1521185746', '3', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('108', '3', '3', '用户登录', '0', '1521185857', '1521185857', '3', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('109', '3', '3', '用户登录', '0', '1521185871', '1521185871', '3', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('110', '2', '2', '用户登录', '0', '1521186680', '1521186680', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('111', '3', '3', '用户登录', '0', '1521186944', '1521186944', '3', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('112', '3', '3', '用户登录', '0', '1521188209', '1521188209', '3', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('113', '2', '2', '用户登录', '0', '1521189538', '1521189538', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('114', '2', '2', '用户登录', '0', '1521191635', '1521191635', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('115', '3', '3', '用户登录', '0', '1521191773', '1521191773', '3', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('116', '3', '3', '编辑客户信息', '0', '1521191806', '1521191806', '3', '6012002', 'etprs', '3', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('117', '2', '2', '用户登录', '0', '1521191877', '1521191877', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('119', '1', '1', '用户登录', '0', '1521419490', '1521419490', '1', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('120', '1', '1', '用户登录', '0', '1521420165', '1521420165', '1', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('121', '2', '2', '用户登录', '0', '1521420249', '1521420249', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('122', '3', '3', '用户登录', '0', '1521420353', '1521420353', '3', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('123', '1', '1', '用户登录', '0', '1521420409', '1521420409', '1', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('124', '1', '1', '用户登录', '0', '1521421060', '1521421060', '1', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('125', '1', '1', '用户登录', '0', '1521421065', '1521421065', '1', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('126', '2', '2', '用户登录', '0', '1521421369', '1521421369', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('127', '2', '2', '用户登录', '0', '1521421575', '1521421575', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('129', '3', '3', '用户登录', '0', '1521422258', '1521422258', '3', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('131', '2', '0', '导出活动', '0', '1521422494', '1521422494', '2', '6012004', 'etprs', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('132', '2', '2', '用户登录', '0', '1521422859', '1521422859', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('133', '1', '1', '用户登录', '0', '1521422903', '1521422903', '1', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('134', '2', '2', '用户登录', '0', '1521422983', '1521422983', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('135', '2', '2', '用户登录', '0', '1521423457', '1521423457', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('136', '2', '2', '用户登录', '0', '1521423749', '1521423749', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('137', '2', '2', '发起入驻-编辑入驻客户', '0', '1521424308', '1521424308', '2', '6012010', 'etprs', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('138', '2', '2', '正式分配房间', '0', '1521424336', '1521424336', '2', '6012009', 'etprs', '2', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('140', '2', '2', '编辑客户信息', '0', '1521424424', '1521424424', '2', '6012002', 'etprs', '2', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('141', '1', '1', '用户登录', '0', '1521425578', '1521425578', '1', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('142', '4', '4', '用户登录', '0', '1521425614', '1521425614', '4', '6012001', 'User', '0', null, null, null, '');
INSERT INTO `ibt_log` VALUES ('143', '4', '4', '用户登录', '0', '1521425614', '1521425614', '4', '6012001', 'User', '0', null, null, null, '');
INSERT INTO `ibt_log` VALUES ('144', '2', '2', '客户毕业', '0', '1521426041', '1521426041', '2', '6012012', 'etprs', '2', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('145', '2', '1', '编辑客户信息', '0', '1521426104', '1521426104', '2', '6012002', 'etprs', '1', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('146', '2', '1', '发起入驻-编辑入驻客户', '0', '1521426130', '1521426130', '2', '6012010', 'etprs', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('147', '2', '1', '正式分配房间', '0', '1521426147', '1521426147', '2', '6012009', 'etprs', '1', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('148', '2', '2', '用户登录', '0', '1521426160', '1521426160', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('149', '2', '1', '发起入驻-签约合同', '0', '1521426487', '1521426487', '2', '6012008', 'etprs', '1', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('150', '2', '2', '用户登录', '0', '1521426752', '1521426752', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('151', '2', '2', '用户登录', '0', '1521426798', '1521426798', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('152', '2', '9', '发起入驻-新增入驻客户', '0', '1521426877', '1521426877', '2', '6012010', 'etprs', '9', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('154', '2', '0', '导出报名信息', '0', '1521427191', '1521427191', '2', '6012004', 'etprs', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('155', '3', '3', '用户登录', '0', '1521427220', '1521427220', '3', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('156', '2', '1', '修改空间信息', '0', '1521427259', '1521427259', '2', '6012016', 'incubator', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('157', '2', '1', '修改空间信息', '0', '1521427337', '1521427337', '2', '6012016', 'incubator', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('158', '2', '1', '修改空间信息', '0', '1521427350', '1521427350', '2', '6012016', 'incubator', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('159', '2', '1', '修改空间信息', '0', '1521427351', '1521427351', '2', '6012016', 'incubator', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('160', '2', '1', '修改空间信息', '0', '1521427465', '1521427465', '2', '6012016', 'incubator', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('161', '2', '1', '修改空间信息', '0', '1521427479', '1521427479', '2', '6012016', 'incubator', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('163', '1', '1', '用户登录', '0', '1521428017', '1521428017', '1', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('164', '1', '2', '修改空间信息', '0', '1521428069', '1521428069', '1', '6012016', 'incubator', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('165', '2', '2', '用户登录', '0', '1521428195', '1521428195', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('166', '2', '1', '修改空间信息', '0', '1521428854', '1521428854', '2', '6012016', 'incubator', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('167', '2', '1', '修改空间信息', '0', '1521428867', '1521428867', '2', '6012016', 'incubator', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('168', '2', '2', '用户登录', '0', '1521428948', '1521428948', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('169', '2', '2', '用户登录', '0', '1521429407', '1521429407', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('170', '3', '3', '用户登录', '0', '1521429671', '1521429671', '3', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('173', '2', '2', '用户登录', '0', '1521432006', '1521432006', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('179', '3', '3', '用户登录', '0', '1521435963', '1521435963', '3', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('180', '2', '2', '用户登录', '0', '1521436002', '1521436002', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('182', '2', '2', '用户登录', '0', '1521436349', '1521436349', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('184', '1', '1', '用户登录', '0', '1521436657', '1521436657', '1', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('185', '2', '2', '用户登录', '0', '1521436670', '1521436670', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('186', '3', '3', '用户登录', '0', '1521436713', '1521436713', '3', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('187', '2', '9', '编辑客户信息', '0', '1521436766', '1521436766', '2', '6012002', 'etprs', '9', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('188', '2', '10', '新增客户', '0', '1521436883', '1521436883', '2', '6012006', 'etprs', '10', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('189', '2', '2', '用户登录', '0', '1521436966', '1521436966', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('190', '2', '2', '用户登录', '0', '1521437097', '1521437097', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('191', '2', '10', '编辑客户信息', '0', '1521437708', '1521437708', '2', '6012002', 'etprs', '10', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('192', '3', '3', '用户登录', '0', '1521438844', '1521438844', '3', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('193', '3', '3', '用户登录', '0', '1521438899', '1521438899', '3', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('194', '3', '3', '用户登录', '0', '1521438952', '1521438952', '3', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('195', '3', '3', '用户登录', '0', '1521439229', '1521439229', '3', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('196', '3', '3', '用户登录', '0', '1521439303', '1521439303', '3', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('197', '2', '2', '用户登录', '0', '1521439367', '1521439367', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('198', '3', '3', '用户登录', '0', '1521439409', '1521439409', '3', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('199', '3', '3', '用户登录', '0', '1521439480', '1521439480', '3', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('200', '2', '2', '用户登录', '0', '1521439790', '1521439790', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('201', '3', '3', '用户登录', '0', '1521442174', '1521442174', '3', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('203', '2', '17', '冻结/解冻用户', '0', '1521445092', '1521445092', '2', '6012025', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('204', '2', '17', '冻结/解冻用户', '0', '1521445100', '1521445100', '2', '6012024', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('205', '3', '3', '用户登录', '0', '1521445412', '1521445412', '3', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('206', '3', '3', '编辑客户信息', '0', '1521445434', '1521445434', '3', '6012002', 'etprs', '3', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('207', '3', '3', '编辑客户信息', '0', '1521445569', '1521445569', '3', '6012002', 'etprs', '3', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('208', '2', '2', '用户登录', '0', '1521445606', '1521445606', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('209', '3', '3', '用户登录', '0', '1521445666', '1521445666', '3', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('210', '3', '3', '编辑客户信息', '0', '1521445814', '1521445814', '3', '6012002', 'etprs', '3', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('211', '3', '3', '编辑客户信息', '0', '1521445887', '1521445887', '3', '6012002', 'etprs', '3', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('214', '3', '3', '用户登录', '0', '1521446891', '1521446891', '3', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('215', '3', '3', '用户登录', '0', '1521446894', '1521446894', '3', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('217', '3', '3', '编辑客户信息', '0', '1521447041', '1521447041', '3', '6012002', 'etprs', '3', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('219', '2', '2', '用户登录', '0', '1521447275', '1521447275', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('220', '3', '3', '编辑客户信息', '0', '1521447353', '1521447353', '3', '6012002', 'etprs', '3', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('221', '3', '3', '编辑客户信息', '0', '1521447407', '1521447407', '3', '6012002', 'etprs', '3', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('222', '3', '5', '活动报名', '0', '1521447610', '1521447610', '3', '6012029', 'activityApl', '3', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('223', '3', '5', '取消报名', '0', '1521447769', '1521447769', '3', '6012030', 'activityApl', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('224', '3', '6', '活动报名', '0', '1521447797', '1521447797', '3', '6012029', 'activityApl', '3', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('225', '2', '2', '用户登录', '0', '1521448870', '1521448870', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('226', '3', '3', '用户登录', '0', '1521448888', '1521448888', '3', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('227', '3', '3', '编辑客户信息', '0', '1521449371', '1521449371', '3', '6012002', 'etprs', '3', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('228', '3', '3', '编辑客户信息', '0', '1521449380', '1521449380', '3', '6012002', 'etprs', '3', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('230', '2', '2', '用户登录', '0', '1521450245', '1521450245', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('231', '2', '0', '导出客户', '0', '1521450341', '1521450341', '2', '6012004', 'etprs', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('232', '2', '2', '用户登录', '0', '1521450398', '1521450398', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('233', '17', '17', '用户登录', '0', '1521450488', '1521450488', '17', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('234', '16', '16', '用户登录', '0', '1521450586', '1521450586', '16', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('235', '17', '17', '用户登录', '0', '1521450622', '1521450622', '17', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('236', '2', '10', '编辑客户信息', '0', '1521450766', '1521450766', '2', '6012002', 'etprs', '10', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('237', '2', '9', '正式分配房间', '0', '1521450806', '1521450806', '2', '6012009', 'etprs', '9', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('238', '3', '3', '用户登录', '0', '1521450919', '1521450919', '3', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('239', '2', '2', '用户登录', '0', '1521507308', '1521507308', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('241', '2', '1', '修改空间信息', '0', '1521508264', '1521508264', '2', '6012016', 'incubator', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('242', '2', '2', '用户登录', '0', '1521508300', '1521508300', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('243', '2', '1', '修改空间信息', '0', '1521508385', '1521508385', '2', '6012016', 'incubator', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('244', '2', '2', '用户登录', '0', '1521508446', '1521508446', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('246', '2', '2', '用户登录', '0', '1521509760', '1521509760', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('250', '2', '2', '用户登录', '0', '1521512195', '1521512195', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('251', '2', '2', '用户登录', '0', '1521512332', '1521512332', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('252', '18', '18', '用户登录', '0', '1521512400', '1521512400', '18', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('253', '2', '2', '用户登录', '0', '1521513016', '1521513016', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('254', '18', '18', '用户登录', '0', '1521513157', '1521513157', '18', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('255', '18', '18', '用户登录', '0', '1521513232', '1521513232', '18', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('256', '18', '18', '用户登录', '0', '1521513343', '1521513343', '18', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('257', '2', '6', '报名审核', '0', '1521514998', '1521514998', '2', '6012031', 'activityApl', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('258', '2', '2', '用户登录', '0', '1521516475', '1521516475', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('259', '3', '3', '用户登录', '0', '1521516835', '1521516835', '3', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('260', '2', '2', '用户登录', '0', '1521523623', '1521523623', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('261', '2', '0', '成功导入3条记录', '0', '1521524328', '1521524328', '2', '6012005', 'etprs', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('262', '2', '0', '导出客户', '0', '1521524396', '1521524396', '2', '6012004', 'etprs', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('263', '2', '0', '导出客户', '0', '1521524451', '1521524451', '2', '6012004', 'etprs', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('264', '18', '18', '用户登录', '0', '1521524505', '1521524505', '18', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('265', '18', '3', '跟进客户', '0', '1521524644', '1521524644', '18', '6012003', 'flow', '10', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('266', '18', '3', '跟进客户-更改客户状态', '0', '1521524644', '1521524644', '18', '6012003', 'flow', '10', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('267', '2', '13', '编辑客户信息', '0', '1521525443', '1521525443', '2', '6012002', 'etprs', '13', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('268', '2', '11', '编辑客户信息', '0', '1521525459', '1521525459', '2', '6012002', 'etprs', '11', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('269', '2', '4', '跟进客户', '0', '1521525493', '1521525493', '2', '6012003', 'flow', '12', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('270', '2', '4', '跟进客户-更改客户状态', '0', '1521525493', '1521525493', '2', '6012003', 'flow', '12', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('271', '2', '5', '跟进客户', '0', '1521525528', '1521525528', '2', '6012003', 'flow', '12', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('272', '2', '5', '跟进客户-更改客户状态', '0', '1521525528', '1521525528', '2', '6012003', 'flow', '12', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('273', '3', '3', '用户登录', '0', '1521526057', '1521526057', '3', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('274', '2', '2', '用户登录', '0', '1521526080', '1521526080', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('275', '2', '2', '用户登录', '0', '1521526578', '1521526578', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('276', '2', '2', '用户登录', '0', '1521526693', '1521526693', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('277', '2', '0', '成功导入2条记录', '0', '1521526770', '1521526770', '2', '6012022', 'etprs', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('278', '2', '2', '用户登录', '0', '1521527310', '1521527310', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('279', '2', '2', '用户登录', '0', '1521527390', '1521527390', '2', '6012001', 'User', '0', '1', null, null, '');
INSERT INTO `ibt_log` VALUES ('280', '2', '21', '添加房间', '0', '1521528780', '1521528780', '2', '6012017', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('281', '2', '21', '编辑房间信息', '0', '1521528842', '1521528842', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('282', '18', '18', '用户登录', '0', '1521528950', '1521528950', '18', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('283', '18', '10', '编辑客户信息', '0', '1521528996', '1521528996', '18', '6012002', 'etprs', '10', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('284', '2', '2', '用户登录', '0', '1521529242', '1521529242', '2', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('285', '2', '22', '添加房间', '0', '1521529353', '1521529353', '2', '6012017', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('286', '2', '2', '用户登录', '0', '1521529488', '1521529488', '2', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('287', '2', '2', '用户登录', '0', '1521529782', '1521529782', '2', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('288', '2', '23', '添加房间', '0', '1521530096', '1521530096', '2', '6012017', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('289', '2', '0', '成功导入2条记录', '0', '1521530493', '1521530493', '2', '6012022', 'etprs', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('290', '2', '2', '用户登录', '0', '1521531732', '1521531732', '2', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('291', '3', '3', '用户登录', '0', '1521531845', '1521531845', '3', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('292', '3', '14', '预定会议室', '0', '1521531925', '1521531925', '3', '6012035', 'mtroomApl', '3', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('293', '2', '2', '用户登录', '0', '1521531934', '1521531934', '2', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('294', '2', '14', '会议室审核通过', '0', '1521531968', '1521531968', '2', '6012036', 'mtroomApl', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('295', '2', '2', '用户登录', '0', '1521532527', '1521532527', '2', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('296', '1', '1', '用户登录', '0', '1521533636', '1521533636', '1', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('297', '2', '1', '修改空间信息', '0', '1521533713', '1521533713', '2', '6012016', 'incubator', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('298', '2', '1', '修改空间信息', '0', '1521533818', '1521533818', '2', '6012016', 'incubator', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('299', '18', '18', '用户登录', '0', '1521534374', '1521534374', '18', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('300', '2', '2', '用户登录', '0', '1521534380', '1521534380', '2', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('301', '18', '18', '用户登录', '0', '1521534406', '1521534406', '18', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('302', '2', '0', '成功导入1条记录', '0', '1521534861', '1521534861', '2', '6012018', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('303', '2', '0', '导出房间信息', '0', '1521534953', '1521534953', '2', '6012019', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('304', '2', '0', '成功导入4条记录', '0', '1521535213', '1521535213', '2', '6012018', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('305', '2', '0', '成功导入4条记录', '0', '1521535216', '1521535216', '2', '6012018', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('306', '2', '1', '删除房间', '0', '1521535264', '1521535264', '2', '6012021', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('307', '2', '1', '删除房间', '0', '1521535376', '1521535376', '2', '6012021', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('308', '2', '1', '删除房间', '0', '1521535522', '1521535522', '2', '6012021', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('309', '2', '1', '删除房间', '0', '1521535571', '1521535571', '2', '6012021', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('310', '2', '1', '删除房间', '0', '1521535763', '1521535763', '2', '6012021', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('311', '2', '1', '删除房间', '0', '1521535767', '1521535767', '2', '6012021', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('312', '2', '1', '删除房间', '0', '1521535770', '1521535770', '2', '6012021', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('313', '2', '1', '删除房间', '0', '1521535774', '1521535774', '2', '6012021', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('314', '2', '0', '成功导入4条记录', '0', '1521535890', '1521535890', '2', '6012018', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('315', '2', '0', '导出房间信息', '0', '1521536614', '1521536614', '2', '6012019', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('316', '2', '1', '修改空间信息', '0', '1521537523', '1521537523', '2', '6012016', 'incubator', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('317', '2', '1', '修改空间信息', '0', '1521537543', '1521537543', '2', '6012016', 'incubator', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('318', '2', '33', '编辑房间信息', '0', '1521537850', '1521537850', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('319', '2', '33', '编辑房间信息', '0', '1521537944', '1521537944', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('320', '2', '1', '删除房间', '0', '1521537966', '1521537966', '2', '6012021', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('321', '2', '1', '删除房间', '0', '1521537969', '1521537969', '2', '6012021', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('322', '2', '1', '删除房间', '0', '1521537974', '1521537974', '2', '6012021', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('323', '2', '0', '成功导入3条记录', '0', '1521538017', '1521538017', '2', '6012018', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('324', '2', '1', '删除房间', '0', '1521538112', '1521538112', '2', '6012021', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('325', '2', '1', '删除房间', '0', '1521538115', '1521538115', '2', '6012021', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('326', '2', '1', '删除房间', '0', '1521538117', '1521538117', '2', '6012021', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('327', '2', '0', '成功导入3条记录', '0', '1521538132', '1521538132', '2', '6012018', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('328', '2', '33', '编辑房间信息', '0', '1521538167', '1521538167', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('329', '2', '1', '删除房间', '0', '1521538732', '1521538732', '2', '6012021', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('330', '2', '1', '删除房间', '0', '1521538734', '1521538734', '2', '6012021', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('331', '2', '1', '删除房间', '0', '1521538737', '1521538737', '2', '6012021', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('332', '2', '33', '编辑房间信息', '0', '1521538751', '1521538751', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('333', '2', '0', '成功导入3条记录', '0', '1521538845', '1521538845', '2', '6012018', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('334', '2', '1', '删除房间', '0', '1521538902', '1521538902', '2', '6012021', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('335', '2', '1', '删除房间', '0', '1521538905', '1521538905', '2', '6012021', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('336', '2', '1', '删除房间', '0', '1521538908', '1521538908', '2', '6012021', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('337', '2', '0', '成功导入3条记录', '0', '1521538978', '1521538978', '2', '6012018', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('338', '2', '0', '成功导入1条记录', '0', '1521539121', '1521539121', '2', '6012018', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('339', '2', '1', '删除房间', '0', '1521539130', '1521539130', '2', '6012021', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('340', '2', '0', '成功导入1条记录', '0', '1521539165', '1521539165', '2', '6012018', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('341', '2', '1', '删除房间', '0', '1521539194', '1521539194', '2', '6012021', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('342', '2', '1', '删除房间', '0', '1521539197', '1521539197', '2', '6012021', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('343', '2', '1', '删除房间', '0', '1521539200', '1521539200', '2', '6012021', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('344', '2', '0', '成功导入3条记录', '0', '1521539219', '1521539219', '2', '6012018', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('345', '2', '2', '用户登录', '0', '1521539568', '1521539568', '2', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('346', '2', '53', '编辑房间信息', '0', '1521539590', '1521539590', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('347', '2', '33', '编辑房间信息', '0', '1521539705', '1521539705', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('348', '2', '2', '用户登录', '0', '1521540310', '1521540310', '2', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('349', '2', '2', '用户登录', '0', '1521540609', '1521540609', '2', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('350', '2', '51', '编辑房间信息', '0', '1521540795', '1521540795', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('351', '2', '51', '编辑房间信息', '0', '1521540801', '1521540801', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('353', '2', '2', '用户登录', '0', '1521592655', '1521592655', '2', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('354', '2', '2', '用户登录', '0', '1521593019', '1521593019', '2', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('355', '2', '1', '删除房间', '0', '1521593051', '1521593051', '2', '6012021', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('356', '2', '53', '编辑房间信息', '0', '1521593075', '1521593075', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('357', '2', '1', '删除房间', '0', '1521593088', '1521593088', '2', '6012021', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('358', '2', '1', '删除房间', '0', '1521593108', '1521593108', '2', '6012021', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('359', '2', '1', '删除房间', '0', '1521593111', '1521593111', '2', '6012021', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('360', '2', '50', '编辑房间信息', '0', '1521593120', '1521593120', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('361', '2', '1', '删除房间', '0', '1521593125', '1521593125', '2', '6012021', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('362', '2', '0', '成功导入3条记录', '0', '1521593145', '1521593145', '2', '6012018', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('363', '2', '0', '导出房间信息', '0', '1521593173', '1521593173', '2', '6012019', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('364', '2', '0', '成功导入3条记录', '0', '1521593243', '1521593243', '2', '6012018', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('365', '2', '0', '成功导入3条记录', '0', '1521593294', '1521593294', '2', '6012018', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('366', '2', '60', '编辑房间信息', '0', '1521593868', '1521593868', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('367', '2', '61', '编辑房间信息', '0', '1521593915', '1521593915', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('368', '2', '60', '编辑房间信息', '0', '1521593966', '1521593966', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('369', '2', '2', '用户登录', '0', '1521594930', '1521594930', '2', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('370', '2', '2', '用户登录', '0', '1521595036', '1521595036', '2', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('371', '2', '57', '编辑房间信息', '0', '1521595345', '1521595345', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('372', '2', '57', '编辑房间信息', '0', '1521595521', '1521595521', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('373', '2', '57', '编辑房间信息', '0', '1521595566', '1521595566', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('374', '2', '60', '编辑房间信息', '0', '1521596180', '1521596180', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('375', '2', '61', '编辑房间信息', '0', '1521596220', '1521596220', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('376', '2', '61', '编辑房间信息', '0', '1521596254', '1521596254', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('377', '2', '1', '删除房间', '0', '1521596271', '1521596271', '2', '6012021', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('378', '2', '2', '用户登录', '0', '1521596713', '1521596713', '2', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('379', '2', '57', '编辑房间信息', '0', '1521596721', '1521596721', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('380', '2', '57', '编辑房间信息', '0', '1521596740', '1521596740', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('381', '2', '57', '编辑房间信息', '0', '1521596771', '1521596771', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('382', '2', '57', '编辑房间信息', '0', '1521596831', '1521596831', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('383', '2', '6', '报名审核', '0', '1521596832', '1521596832', '2', '6012031', 'activityApl', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('384', '2', '61', '编辑房间信息', '0', '1521597189', '1521597189', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('385', '2', '2', '用户登录', '0', '1521598409', '1521598409', '2', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('386', '2', '1', '删除房间', '0', '1521600455', '1521600455', '2', '6012021', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('387', '2', '1', '删除房间', '0', '1521600459', '1521600459', '2', '6012021', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('388', '2', '1', '删除房间', '0', '1521600463', '1521600463', '2', '6012021', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('389', '2', '1', '删除房间', '0', '1521600466', '1521600466', '2', '6012021', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('390', '2', '1', '删除房间', '0', '1521600469', '1521600469', '2', '6012021', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('391', '2', '2', '用户登录', '0', '1521601043', '1521601043', '2', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('392', '2', '2', '用户登录', '0', '1521604649', '1521604649', '2', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('393', '2', '56', '编辑房间信息', '0', '1521604723', '1521604723', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('394', '2', '2', '用户登录', '0', '1521609092', '1521609092', '2', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('395', '2', '62', '编辑房间信息', '0', '1521609100', '1521609100', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('396', '2', '59', '编辑房间信息', '0', '1521609108', '1521609108', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('397', '2', '62', '编辑房间信息', '0', '1521609112', '1521609112', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('398', '2', '62', '编辑房间信息', '0', '1521609168', '1521609168', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('399', '2', '62', '编辑房间信息', '0', '1521609191', '1521609191', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('400', '2', '63', '添加房间', '0', '1521609209', '1521609209', '2', '6012017', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('401', '2', '2', '用户登录', '0', '1521609294', '1521609294', '2', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('402', '2', '2', '用户登录', '0', '1521609934', '1521609934', '2', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('403', '2', '1', '报名审核', '0', '1521611496', '1521611496', '2', '6012031', 'activityApl', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('404', '2', '5', '报名审核', '0', '1521611600', '1521611600', '2', '6012031', 'activityApl', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('405', '2', '6', '报名审核', '0', '1521611612', '1521611612', '2', '6012031', 'activityApl', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('407', '2', '2', '用户登录', '0', '1521612557', '1521612557', '2', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('408', '2', '1', '报名审核', '0', '1521612612', '1521612612', '2', '6012031', 'activityApl', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('409', '2', '2', '用户登录', '0', '1521613871', '1521613871', '2', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('410', '2', '1', '修改空间信息', '0', '1521614222', '1521614222', '2', '6012016', 'incubator', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('411', '2', '1', '修改空间信息', '0', '1521614361', '1521614361', '2', '6012016', 'incubator', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('412', '2', '64', '添加房间', '0', '1521614686', '1521614686', '2', '6012017', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('413', '2', '64', '编辑房间信息', '0', '1521614715', '1521614715', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('414', '2', '64', '编辑房间信息', '0', '1521614733', '1521614733', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('415', '2', '65', '添加房间', '0', '1521614781', '1521614781', '2', '6012017', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('416', '2', '65', '编辑房间信息', '0', '1521614788', '1521614788', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('417', '2', '65', '编辑房间信息', '0', '1521614805', '1521614805', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('418', '2', '65', '编辑房间信息', '0', '1521614827', '1521614827', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('419', '2', '66', '添加房间', '0', '1521614893', '1521614893', '2', '6012017', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('420', '2', '67', '添加房间', '0', '1521614936', '1521614936', '2', '6012017', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('421', '2', '1', '删除房间', '0', '1521614949', '1521614949', '2', '6012021', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('422', '2', '1', '删除房间', '0', '1521614955', '1521614955', '2', '6012021', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('423', '2', '1', '删除房间', '0', '1521614958', '1521614958', '2', '6012021', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('424', '2', '68', '添加房间', '0', '1521615087', '1521615087', '2', '6012017', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('425', '2', '69', '添加房间', '0', '1521615242', '1521615242', '2', '6012017', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('426', '2', '70', '添加房间', '0', '1521615303', '1521615303', '2', '6012017', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('427', '2', '71', '添加房间', '0', '1521615330', '1521615330', '2', '6012017', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('428', '2', '72', '添加房间', '0', '1521615377', '1521615377', '2', '6012017', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('429', '2', '73', '添加房间', '0', '1521615418', '1521615418', '2', '6012017', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('430', '2', '74', '添加房间', '0', '1521615444', '1521615444', '2', '6012017', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('431', '2', '75', '添加房间', '0', '1521615505', '1521615505', '2', '6012017', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('432', '2', '74', '编辑房间信息', '0', '1521615508', '1521615508', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('433', '2', '75', '编辑房间信息', '0', '1521615535', '1521615535', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('434', '2', '75', '编辑房间信息', '0', '1521615542', '1521615542', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('435', '2', '75', '编辑房间信息', '0', '1521615548', '1521615548', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('436', '2', '75', '编辑房间信息', '0', '1521615567', '1521615567', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('437', '2', '75', '编辑房间信息', '0', '1521615575', '1521615575', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('438', '2', '75', '编辑房间信息', '0', '1521615593', '1521615593', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('439', '2', '2', '用户登录', '0', '1521616118', '1521616118', '2', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('440', '2', '75', '编辑房间信息', '0', '1521616126', '1521616126', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('441', '2', '75', '编辑房间信息', '0', '1521616133', '1521616133', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('442', '2', '75', '编辑房间信息', '0', '1521616140', '1521616140', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('443', '2', '75', '编辑房间信息', '0', '1521616170', '1521616170', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('444', '2', '75', '编辑房间信息', '0', '1521616203', '1521616203', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('445', '2', '75', '编辑房间信息', '0', '1521616261', '1521616261', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('446', '2', '75', '编辑房间信息', '0', '1521616280', '1521616280', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('447', '2', '76', '添加房间', '0', '1521616589', '1521616589', '2', '6012017', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('448', '2', '77', '添加房间', '0', '1521616643', '1521616643', '2', '6012017', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('449', '2', '1', '删除房间', '0', '1521618455', '1521618455', '2', '6012021', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('450', '2', '77', '编辑房间信息', '0', '1521618474', '1521618474', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('451', '2', '77', '编辑房间信息', '0', '1521618481', '1521618481', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('452', '2', '1', '删除房间', '0', '1521618485', '1521618485', '2', '6012021', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('453', '2', '70', '编辑房间信息', '0', '1521618685', '1521618685', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('454', '2', '1', '删除房间', '0', '1521618693', '1521618693', '2', '6012021', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('455', '2', '76', '编辑房间信息', '0', '1521618813', '1521618813', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('456', '2', '76', '编辑房间信息', '0', '1521618822', '1521618822', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('458', '2', '2', '用户登录', '0', '1521625965', '1521625965', '2', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('459', '2', '2', '用户登录', '0', '1521678897', '1521678897', '2', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('460', '2', '2', '用户登录', '0', '1521678986', '1521678986', '2', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('461', '3', '3', '用户登录', '0', '1521679017', '1521679017', '3', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('462', '16', '16', '用户登录', '0', '1521679298', '1521679298', '16', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('463', '16', '16', '用户登录', '0', '1521679686', '1521679686', '16', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('464', '2', '2', '用户登录', '0', '1521679704', '1521679704', '2', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('465', '16', '7', '活动报名', '0', '1521679755', '1521679755', '16', '6012029', 'activityApl', '1', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('466', '2', '7', '报名审核', '0', '1521679881', '1521679881', '2', '6012031', 'activityApl', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('467', '3', '3', '用户登录', '0', '1521679940', '1521679940', '3', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('468', '2', '2', '用户登录', '0', '1521680000', '1521680000', '2', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('469', '3', '3', '用户登录', '0', '1521680094', '1521680094', '3', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('470', '2', '0', '导出报名信息', '0', '1521680124', '1521680124', '2', '6017027', 'activity', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('471', '2', '0', '导出报名信息', '0', '1521680166', '1521680166', '2', '6017027', 'activity', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('473', '3', '3', '用户登录', '0', '1521680481', '1521680481', '3', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('474', '3', '4', '取消报名', '0', '1521680490', '1521680490', '3', '6012030', 'activityApl', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('475', '2', '2', '用户登录', '0', '1521680514', '1521680514', '2', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('476', '2', '0', '导出报名信息', '0', '1521680523', '1521680523', '2', '6017027', 'activity', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('477', '2', '0', '导出报名信息', '0', '1521681270', '1521681270', '2', '6017027', 'activity', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('478', '2', '0', '导出报名信息', '0', '1521681279', '1521681279', '2', '6017027', 'activity', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('479', '2', '0', '导出报名信息', '0', '1521681300', '1521681300', '2', '6017027', 'activity', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('480', '2', '2', '用户登录', '0', '1521681582', '1521681582', '2', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('481', '2', '0', '导出报名信息', '0', '1521681659', '1521681659', '2', '6017027', 'activity', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('482', '2', '0', '导出报名信息', '0', '1521681702', '1521681702', '2', '6017027', 'activity', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('483', '2', '0', '导出报名信息', '0', '1521681891', '1521681891', '2', '6017027', 'activity', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('484', '2', '3', '报名审核拒绝', '0', '1521681939', '1521681939', '2', '6012032', 'activityApl', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('485', '2', '4', '修改活动信息', '0', '1521682083', '1521682083', '2', '6012028', 'activity', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('486', '2', '4', '修改活动信息', '0', '1521682237', '1521682237', '2', '6012028', 'activity', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('487', '2', '1', '修改活动信息', '0', '1521682339', '1521682339', '2', '6012028', 'activity', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('488', '2', '4', '修改活动信息', '0', '1521682475', '1521682475', '2', '6012028', 'activity', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('489', '2', '1', '修改活动信息', '0', '1521682525', '1521682525', '2', '6012028', 'activity', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('490', '2', '2', '用户登录', '0', '1521682532', '1521682532', '2', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('491', '23', '23', '用户登录', '0', '1521682655', '1521682655', '23', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('492', '23', '23', '用户登录', '0', '1521682879', '1521682879', '23', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('493', '2', '12', '编辑客户信息', '0', '1521683168', '1521683168', '2', '6012002', 'etprs', '12', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('494', '2', '12', '编辑客户信息', '0', '1521683193', '1521683193', '2', '6012002', 'etprs', '12', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('495', '2', '12', '编辑客户信息', '0', '1521683348', '1521683348', '2', '6012002', 'etprs', '12', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('497', '2', '12', '编辑客户信息', '0', '1521683798', '1521683798', '2', '6012002', 'etprs', '12', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('498', '2', '12', '编辑客户信息', '0', '1521683855', '1521683855', '2', '6012002', 'etprs', '12', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('499', '2', '12', '发起入驻-编辑入驻客户', '0', '1521683926', '1521683926', '2', '6012010', 'etprs', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('500', '2', '12', '编辑客户信息', '0', '1521683952', '1521683952', '2', '6012002', 'etprs', '12', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('503', '2', '12', '编辑客户信息', '0', '1521684163', '1521684163', '2', '6012002', 'etprs', '12', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('504', '2', '12', '编辑客户信息', '0', '1521684177', '1521684177', '2', '6012002', 'etprs', '12', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('505', '2', '12', '编辑客户信息', '0', '1521684232', '1521684232', '2', '6012002', 'etprs', '12', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('506', '2', '12', '正式分配房间', '0', '1521684318', '1521684318', '2', '6012009', 'etprs', '12', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('507', '2', '12', '发起入驻-签约合同', '0', '1521684361', '1521684361', '2', '6012008', 'etprs', '12', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('508', '2', '17', '发起入驻-编辑入驻客户', '0', '1521684487', '1521684487', '2', '6012010', 'etprs', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('509', '2', '12', '房间变更', '0', '1521684543', '1521684543', '2', '6012007', 'etprs', '12', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('510', '2', '2', '用户登录', '0', '1521684602', '1521684602', '2', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('511', '2', '12', '企业续约', '0', '1521684605', '1521684605', '2', '6012011', 'etprs', '12', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('512', '2', '12', '房间变更', '0', '1521685195', '1521685195', '2', '6012007', 'etprs', '12', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('517', '2', '16', '发起入驻-编辑入驻客户', '0', '1521686558', '1521686558', '2', '6012010', 'etprs', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('518', '2', '16', '正式分配房间', '0', '1521686581', '1521686581', '2', '6012009', 'etprs', '16', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('521', '2', '16', '发起入驻-编辑入驻客户', '0', '1521686643', '1521686643', '2', '6012010', 'etprs', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('522', '2', '2', '用户登录', '0', '1521686665', '1521686665', '2', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('523', '2', '18', '冻结/解冻用户', '0', '1521686684', '1521686684', '2', '6012025', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('524', '2', '16', '编辑客户信息', '0', '1521686803', '1521686803', '2', '6012002', 'etprs', '16', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('525', '2', '2', '用户登录', '0', '1521686860', '1521686860', '2', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('526', '2', '2', '用户登录', '0', '1521687491', '1521687491', '2', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('527', '2', '1', '修改活动信息', '0', '1521687504', '1521687504', '2', '6012028', 'activity', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('528', '2', '1', '修改活动信息', '0', '1521687512', '1521687512', '2', '6012028', 'activity', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('529', '2', '1', '修改活动信息', '0', '1521687536', '1521687536', '2', '6012028', 'activity', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('530', '2', '1', '修改活动信息', '0', '1521687584', '1521687584', '2', '6012028', 'activity', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('531', '2', '1', '修改活动信息', '0', '1521687639', '1521687639', '2', '6012028', 'activity', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('532', '16', '16', '用户登录', '0', '1521687913', '1521687913', '16', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('533', '16', '8', '活动报名', '0', '1521687941', '1521687941', '16', '6012029', 'activityApl', '1', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('534', '2', '8', '报名审核拒绝', '0', '1521687998', '1521687998', '2', '6012032', 'activityApl', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('535', '16', '9', '活动报名', '0', '1521688057', '1521688057', '16', '6012029', 'activityApl', '1', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('536', '2', '9', '报名审核拒绝', '0', '1521688141', '1521688141', '2', '6012032', 'activityApl', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('537', '16', '10', '活动报名', '0', '1521688174', '1521688174', '16', '6012029', 'activityApl', '1', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('538', '1', '1', '用户登录', '0', '1521688212', '1521688212', '1', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('540', '2', '10', '报名审核通过', '0', '1521688690', '1521688690', '2', '6012031', 'activityApl', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('541', '2', '4', '修改活动信息', '0', '1521688714', '1521688714', '2', '6012028', 'activity', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('542', '2', '4', '修改活动信息', '0', '1521688738', '1521688738', '2', '6012028', 'activity', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('547', '2', '4', '修改活动信息', '0', '1521689330', '1521689330', '2', '6012028', 'activity', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('548', '2', '17', '编辑客户信息', '0', '1521689517', '1521689517', '2', '6012002', 'etprs', '17', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('549', '2', '16', '编辑客户信息', '0', '1521689614', '1521689614', '2', '6012002', 'etprs', '16', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('550', '2', '0', '成功导入2条记录', '0', '1521689903', '1521689903', '2', '6012022', 'etprs', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('551', '26', '26', '用户登录', '0', '1521689954', '1521689954', '26', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('552', '2', '18', '编辑客户信息', '0', '1521690143', '1521690143', '2', '6012002', 'etprs', '18', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('553', '21', '21', '用户登录', '0', '1521690166', '1521690166', '21', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('554', '2', '76', '编辑房间信息', '0', '1521690290', '1521690290', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('555', '2', '1', '删除房间', '0', '1521690296', '1521690296', '2', '6012021', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('556', '2', '75', '编辑房间信息', '0', '1521690322', '1521690322', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('557', '2', '1', '删除房间', '0', '1521690328', '1521690328', '2', '6012021', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('558', '2', '74', '编辑房间信息', '0', '1521690350', '1521690350', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('559', '2', '1', '删除房间', '0', '1521690357', '1521690357', '2', '6012021', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('560', '2', '73', '编辑房间信息', '0', '1521690409', '1521690409', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('561', '2', '1', '删除房间', '0', '1521690415', '1521690415', '2', '6012021', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('563', '2', '2', '用户登录', '0', '1521694884', '1521694884', '2', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('564', '21', '21', '用户登录', '0', '1521694919', '1521694919', '21', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('565', '2', '2', '用户登录', '0', '1521694945', '1521694945', '2', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('566', '1', '1', '用户登录', '0', '1521694985', '1521694985', '1', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('567', '4', '4', '用户登录', '0', '1521695091', '1521695091', '4', '6012001', 'User', '0', null, '', '', '');
INSERT INTO `ibt_log` VALUES ('568', '1', '1', '用户登录', '0', '1521695112', '1521695112', '1', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('569', '2', '12', '企业续约', '0', '1521695275', '1521695275', '2', '6012011', 'etprs', '12', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('570', '1', '1', '用户登录', '0', '1521695303', '1521695303', '1', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('571', '27', '27', '用户登录', '0', '1521695437', '1521695437', '27', '6012001', 'User', '0', null, '', '', '');
INSERT INTO `ibt_log` VALUES ('572', '2', '12', '编辑客户信息', '0', '1521695591', '1521695591', '2', '6012002', 'etprs', '12', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('573', '2', '18', '编辑客户信息', '0', '1521695785', '1521695785', '2', '6012002', 'etprs', '18', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('574', '1', '1', '用户登录', '0', '1521695834', '1521695834', '1', '6012001', 'User', '0', '0', '', '', '');
INSERT INTO `ibt_log` VALUES ('575', '1', '6', '修改空间信息', '0', '1521695939', '1521695939', '1', '6012016', 'incubator', '0', '0', '', '', '');
INSERT INTO `ibt_log` VALUES ('576', '2', '71', '编辑房间信息', '0', '1521696285', '1521696285', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('577', '2', '71', '编辑房间信息', '0', '1521696361', '1521696361', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('578', '2', '1', '删除房间', '0', '1521696794', '1521696794', '2', '6012021', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('579', '2', '78', '添加房间', '0', '1521696889', '1521696889', '2', '6012017', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('580', '27', '27', '用户登录', '0', '1521696919', '1521696919', '27', '6012001', 'User', '0', null, '', '', '');
INSERT INTO `ibt_log` VALUES ('581', '1', '1', '用户登录', '0', '1521696936', '1521696936', '1', '6012001', 'User', '0', '0', '', '', '');
INSERT INTO `ibt_log` VALUES ('583', '2', '79', '添加房间', '0', '1521697034', '1521697034', '2', '6012017', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('584', '2', '0', '导出房间信息', '0', '1521697268', '1521697268', '2', '6012019', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('585', '2', '0', '导出房间信息', '0', '1521697399', '1521697399', '2', '6012019', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('586', '2', '0', '导出房间信息', '0', '1521697511', '1521697511', '2', '6012019', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('587', '2', '2', '用户登录', '0', '1521697513', '1521697513', '2', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('588', '2', '0', '导出房间信息', '0', '1521697528', '1521697528', '2', '6012019', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('589', '2', '6', '跟进客户', '0', '1521697543', '1521697543', '2', '6012003', 'flow', '18', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('590', '2', '6', '招商客户状态变化', '0', '1521697543', '1521697543', '2', '6012040', 'etprs', '6', '1', '6002003', '6002001', '');
INSERT INTO `ibt_log` VALUES ('591', '2', '7', '跟进客户', '0', '1521697545', '1521697545', '2', '6012003', 'flow', '18', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('592', '2', '0', '导出房间信息', '0', '1521697553', '1521697553', '2', '6012019', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('593', '2', '5', '编辑房间信息', '0', '1521697575', '1521697575', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('594', '2', '68', '编辑房间信息', '0', '1521697597', '1521697597', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('595', '2', '62', '编辑房间信息', '0', '1521697615', '1521697615', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('596', '2', '5', '编辑房间信息', '0', '1521697799', '1521697799', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('597', '2', '5', '编辑房间信息', '0', '1521697819', '1521697819', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('598', '2', '2', '编辑房间信息', '0', '1521697968', '1521697968', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('599', '1', '1', '用户登录', '0', '1521698574', '1521698574', '1', '6012001', 'User', '0', '0', '', '', '');
INSERT INTO `ibt_log` VALUES ('600', '2', '19', '发起入驻-编辑入驻客户', '0', '1521698762', '1521698762', '2', '6012010', 'etprs', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('601', '2', '19', '正式分配房间', '0', '1521699161', '1521699161', '2', '6012009', 'etprs', '19', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('606', '2', '20', '发起入驻-新增入驻客户', '0', '1521699684', '1521699684', '2', '6012010', 'etprs', '20', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('607', '2', '20', '正式分配房间', '0', '1521699691', '1521699691', '2', '6012009', 'etprs', '20', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('614', '2', '2', '用户登录', '0', '1521700165', '1521700165', '2', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('615', '1', '1', '用户登录', '0', '1521700355', '1521700355', '1', '6012001', 'User', '0', '0', '', '', '');
INSERT INTO `ibt_log` VALUES ('616', '2', '2', '用户登录', '0', '1521700432', '1521700432', '2', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('617', '2', '1', '删除房间', '0', '1521700520', '1521700520', '2', '6012021', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('618', '2', '79', '编辑房间信息', '0', '1521700549', '1521700549', '2', '6012020', 'room', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('619', '2', '2', '用户登录', '0', '1521700604', '1521700604', '2', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('620', '2', '2', '用户登录', '0', '1521700820', '1521700820', '2', '6012001', 'User', '0', '1', '', '', '');
INSERT INTO `ibt_log` VALUES ('621', '2', '2', '用户登录', '0', '1521701956', '1521701956', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('622', '2', '8', '跟进客户', '0', '1521702377', '1521702377', '2', '6012003', 'flow', '18', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('624', '3', '3', '用户登录', '0', '1521702427', '1521702427', '3', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('625', '2', '2', '用户登录', '0', '1521702895', '1521702895', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('626', '2', '2', '用户登录', '0', '1521703148', '1521703148', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('627', '2', '4', '报名审核通过', '0', '1521703297', '1521703297', '2', '6012031', 'activityApl', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('628', '2', '2', '用户登录', '0', '1521703379', '1521703379', '2', '6012001', 'User', '0', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('629', '2', '2', '用户登录', '0', '1521703805', '1521703805', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('634', '2', '19', '发起入驻-签约合同', '0', '1521704022', '1521704022', '2', '6012008', 'etprs', '19', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('635', '2', '2', '用户登录', '0', '1521704068', '1521704068', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('637', '2', '17', '正式分配房间', '0', '1521704453', '1521704453', '2', '6012009', 'etprs', '17', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('638', '2', '17', '发起入驻-签约合同', '0', '1521704458', '1521704458', '2', '6012008', 'etprs', '17', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('639', '2', '16', '正式分配房间', '0', '1521704571', '1521704571', '2', '6012009', 'etprs', '16', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('640', '2', '9', '跟进客户', '0', '1521704611', '1521704611', '2', '6012003', 'flow', '9', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('642', '2', '9', '发起入驻-编辑入驻客户', '0', '1521704623', '1521704623', '2', '6012010', 'etprs', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('643', '2', '9', '正式分配房间', '0', '1521704703', '1521704703', '2', '6012009', 'etprs', '9', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('644', '2', '67', '编辑房间信息', '0', '1521704805', '1521704805', '2', '6012020', 'room', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('645', '2', '68', '编辑房间信息', '0', '1521704829', '1521704829', '2', '6012020', 'room', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('646', '2', '5', '编辑房间信息', '0', '1521704836', '1521704836', '2', '6012020', 'room', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('647', '2', '2', '用户登录', '0', '1521704924', '1521704924', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('648', '2', '79', '编辑房间信息', '0', '1521704981', '1521704981', '2', '6012020', 'room', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('649', '2', '79', '编辑房间信息', '0', '1521704989', '1521704989', '2', '6012020', 'room', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('650', '2', '17', '房间变更', '0', '1521705293', '1521705293', '2', '6012007', 'etprs', '17', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('651', '2', '19', '房间变更', '0', '1521705381', '1521705381', '2', '6012007', 'etprs', '19', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('652', '2', '19', '房间变更', '0', '1521705410', '1521705410', '2', '6012007', 'etprs', '19', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('653', '2', '12', '客户毕业', '0', '1521705454', '1521705454', '2', '6012012', 'etprs', '12', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('654', '2', '1', '客户毕业', '0', '1521705460', '1521705460', '2', '6012012', 'etprs', '1', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('655', '2', '3', '客户毕业', '0', '1521705466', '1521705466', '2', '6012012', 'etprs', '3', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('656', '2', '21', '新增客户', '0', '1521705841', '1521705841', '2', '6012006', 'etprs', '21', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('657', '2', '10', '跟进客户', '0', '1521705855', '1521705855', '2', '6012003', 'flow', '21', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('659', '2', '21', '发起入驻-编辑入驻客户', '0', '1521705868', '1521705868', '2', '6012010', 'etprs', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('660', '2', '21', '正式分配房间', '0', '1521705872', '1521705872', '2', '6012009', 'etprs', '21', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('661', '2', '21', '发起入驻-签约合同', '0', '1521705877', '1521705877', '2', '6012008', 'etprs', '21', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('662', '31', '31', '用户登录', '0', '1521705984', '1521705984', '31', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('663', '2', '22', '发起入驻-新增入驻客户', '0', '1521707067', '1521707067', '2', '6012010', 'etprs', '22', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('664', '2', '2', '用户登录', '0', '1521707125', '1521707125', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('665', '2', '80', '添加房间', '0', '1521707156', '1521707156', '2', '6012017', 'room', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('666', '2', '81', '添加房间', '0', '1521707250', '1521707250', '2', '6012017', 'room', '0', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('667', '2', '22', '正式分配房间', '0', '1521707301', '1521707301', '2', '6012009', 'etprs', '22', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('668', '2', '22', '发起入驻-签约合同', '0', '1521707319', '1521707319', '2', '6012008', 'etprs', '22', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('669', '32', '32', '用户登录', '0', '1521707331', '1521707331', '32', '6012001', 'User', '0', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('670', '2', '2', '用户登录', '0', '1521707395', '1521707395', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('671', '2', '2', '用户登录', '0', '1521707527', '1521707527', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('672', '2', '2', '用户登录', '0', '1521707552', '1521707552', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('673', '2', '81', '编辑房间信息', '0', '1521707908', '1521707908', '2', '6012020', 'room', '0', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('674', '2', '18', '发起入驻-编辑入驻客户', '0', '1521708421', '1521708421', '2', '6012010', 'etprs', '0', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('675', '2', '18', '正式分配房间', '0', '1521708430', '1521708430', '2', '6012009', 'etprs', '18', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('676', '2', '18', '发起入驻-签约合同', '0', '1521708444', '1521708444', '2', '6012008', 'etprs', '18', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('677', '2', '22', '企业续约', '0', '1521708512', '1521708512', '2', '6012011', 'etprs', '22', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('678', '2', '22', '房间变更', '0', '1521708582', '1521708582', '2', '6012007', 'etprs', '22', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('679', '2', '22', '房间变更', '0', '1521708615', '1521708615', '2', '6012007', 'etprs', '22', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('680', '2', '18', '编辑客户信息', '0', '1521709021', '1521709021', '2', '6012002', 'etprs', '18', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('681', '2', '18', '编辑客户信息', '0', '1521709026', '1521709026', '2', '6012002', 'etprs', '18', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('682', '2', '0', '导出房间信息', '0', '1521709108', '1521709108', '2', '6012019', 'room', '0', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('683', '2', '0', '导出房间信息', '0', '1521709122', '1521709122', '2', '6012019', 'room', '0', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('684', '2', '2', '用户登录', '0', '1521709282', '1521709282', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('685', '1', '1', '用户登录', '0', '1521709333', '1521709333', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('686', '1', '1', '用户登录', '0', '1521709485', '1521709485', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('687', '2', '22', '编辑客户信息', '0', '1521709493', '1521709493', '2', '6012002', 'etprs', '22', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('688', '27', '27', '用户登录', '0', '1521709517', '1521709517', '27', '6012001', 'User', '0', null, '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('689', '2', '0', '导出房间信息', '0', '1521709676', '1521709676', '2', '6012019', 'room', '0', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('690', '27', '27', '用户登录', '0', '1521709819', '1521709819', '27', '6012001', 'User', '0', null, '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('691', '2', '1', '修改空间信息', '0', '1521709847', '1521709847', '2', '6012016', 'incubator', '0', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('692', '2', '82', '添加房间', '0', '1521709999', '1521709999', '2', '6012017', 'room', '0', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('693', '27', '8', '添加空间', '0', '1521710041', '1521710041', '27', '6012015', 'incubator', '0', null, '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('694', '2', '2', '用户登录', '0', '1521710074', '1521710074', '2', '6012001', 'User', '0', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('695', '34', '34', '用户登录', '0', '1521710082', '1521710082', '34', '6012001', 'User', '0', '8', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('696', '2', '81', '编辑房间信息', '0', '1521710304', '1521710304', '2', '6012020', 'room', '0', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('697', '2', '23', '发起入驻-新增入驻客户', '0', '1521711701', '1521711701', '2', '6012010', 'etprs', '23', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('698', '2', '2', '用户登录', '0', '1521711755', '1521711755', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('699', '2', '2', '用户登录', '0', '1521711869', '1521711869', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('700', '2', '2', '用户登录', '0', '1521711933', '1521711933', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('701', '2', '83', '添加房间', '0', '1521712019', '1521712019', '2', '6012017', 'room', '0', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('702', '2', '2', '用户登录', '0', '1521765298', '1521765298', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('703', '2', '4', '修改活动信息', '0', '1521765357', '1521765357', '2', '6012028', 'activity', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('704', '1', '1', '用户登录', '0', '1521765375', '1521765375', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('705', '1', '1', '用户登录', '0', '1521765460', '1521765460', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('706', '1', '1', '用户登录', '0', '1521765468', '1521765468', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('707', '29', '29', '用户登录', '0', '1521765490', '1521765490', '29', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('708', '29', '11', '活动报名', '0', '1521765516', '1521765516', '29', '6012029', 'activityApl', '19', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('709', '2', '5', '会议室审核通过', '0', '1521765872', '1521765872', '2', '6012036', 'mtroomApl', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('710', '2', '12', '新增会议室', '0', '1521766354', '1521766354', '2', '6012033', 'mtroom', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('711', '29', '15', '预定会议室', '0', '1521766480', '1521766480', '29', '6012035', 'mtroomApl', '19', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('712', '2', '0', '导出会议室申请记录', '0', '1521766543', '1521766543', '2', '6012038', 'mtroomApl', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('713', '1', '1', '用户登录', '0', '1521767428', '1521767428', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('714', '2', '22', '客户毕业', '0', '1521767570', '1521767570', '2', '6012012', 'etprs', '22', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('715', '2', '11', '跟进客户', '0', '1521767791', '1521767791', '2', '6012003', 'flow', '23', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('716', '2', '11', '招商客户状态变化', '0', '1521767791', '1521767791', '2', '6012040', 'etprs', '11', '1', '6002004', '6002002', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('717', '2', '0', '导出客户', '0', '1521767830', '1521767830', '2', '6012004', 'etprs', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('718', '2', '23', '编辑客户信息', '0', '1521767883', '1521767883', '2', '6012002', 'etprs', '23', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('719', '2', '23', '招商客户状态变化', '0', '1521767883', '1521767883', '2', '6012040', 'etprs', '23', '1', '6002002', '6002003', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('720', '2', '23', '发起入驻-编辑入驻客户', '0', '1521768166', '1521768166', '2', '6012010', 'etprs', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('721', '2', '23', '发起入驻-编辑入驻客户', '0', '1521768230', '1521768230', '2', '6012010', 'etprs', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('722', '2', '23', '发起入驻-编辑入驻客户', '0', '1521768268', '1521768268', '2', '6012010', 'etprs', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('723', '2', '23', '正式分配房间', '0', '1521768297', '1521768297', '2', '6012009', 'etprs', '23', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('724', '2', '23', '发起入驻-签约合同', '0', '1521768324', '1521768324', '2', '6012008', 'etprs', '23', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('725', '2', '9', '编辑客户信息', '0', '1521768369', '1521768369', '2', '6012002', 'etprs', '9', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('727', '2', '9', '发起入驻-编辑入驻客户', '0', '1521768396', '1521768396', '2', '6012010', 'etprs', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('728', '2', '9', '正式分配房间', '0', '1521768409', '1521768409', '2', '6012009', 'etprs', '9', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('729', '2', '9', '发起入驻-签约合同', '0', '1521768416', '1521768416', '2', '6012008', 'etprs', '9', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('730', '2', '9', '客户毕业', '0', '1521768476', '1521768476', '2', '6012012', 'etprs', '9', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('731', '2', '23', '房间变更', '0', '1521768493', '1521768493', '2', '6012007', 'etprs', '23', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('732', '2', '23', '企业续约', '0', '1521768532', '1521768532', '2', '6012011', 'etprs', '23', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('733', '2', '83', '编辑房间信息', '0', '1521768999', '1521768999', '2', '6012020', 'room', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('734', '2', '1', '删除房间', '0', '1521769030', '1521769030', '2', '6012021', 'room', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('735', '2', '0', '成功导入3条记录', '0', '1521769420', '1521769420', '2', '6012018', 'room', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('736', '2', '2', '用户登录', '0', '1521769754', '1521769754', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('737', '2', '2', '用户登录', '0', '1521770757', '1521770757', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('738', '2', '0', '导出报名信息', '0', '1521771332', '1521771332', '2', '6017027', 'activity', '0', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('739', '2', '87', '添加房间', '0', '1521771502', '1521771502', '2', '6012017', 'room', '0', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('740', '2', '13', '新增会议室', '0', '1521771542', '1521771542', '2', '6012033', 'mtroom', '0', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('741', '29', '0', '导出会议室申请记录', '0', '1521771733', '1521771733', '29', '6012038', 'mtroomApl', '19', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('742', '29', '16', '预定会议室', '0', '1521771916', '1521771916', '29', '6012035', 'mtroomApl', '19', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('743', '2', '0', '导出会议室申请记录', '0', '1521772076', '1521772076', '2', '6012038', 'mtroomApl', '0', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('744', '2', '16', '会议室审核拒绝', '0', '1521772137', '1521772137', '2', '6012037', 'mtroomApl', '0', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('745', '29', '17', '预定会议室', '0', '1521772681', '1521772681', '29', '6012035', 'mtroomApl', '19', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('746', '2', '17', '会议室审核通过', '0', '1521772713', '1521772713', '2', '6012036', 'mtroomApl', '0', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('747', '2', '87', '编辑房间信息', '0', '1521772785', '1521772785', '2', '6012020', 'room', '0', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('748', '2', '0', '导出会议室申请记录', '0', '1521773411', '1521773411', '2', '6012038', 'mtroomApl', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('749', '2', '11', '编辑客户信息', '0', '1521773516', '1521773516', '2', '6012002', 'etprs', '11', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('750', '2', '11', '招商客户状态变化', '0', '1521773516', '1521773516', '2', '6012040', 'etprs', '11', '1', '6002004', '6002003', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('751', '3', '3', '用户登录', '0', '1521773537', '1521773537', '3', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('752', '2', '11', '编辑客户信息', '0', '1521773582', '1521773582', '2', '6012002', 'etprs', '11', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('753', '2', '11', '发起入驻-编辑入驻客户', '0', '1521773599', '1521773599', '2', '6012010', 'etprs', '0', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('754', '2', '2', '用户登录', '0', '1521773599', '1521773599', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('755', '2', '11', '正式分配房间', '0', '1521773610', '1521773610', '2', '6012009', 'etprs', '11', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('756', '2', '11', '发起入驻-签约合同', '0', '1521773633', '1521773633', '2', '6012008', 'etprs', '11', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('757', '2', '0', '导出房间信息', '0', '1521773797', '1521773797', '2', '6012019', 'room', '0', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('758', '3', '3', '用户登录', '0', '1521773979', '1521773979', '3', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('759', '2', '0', '导出会议室申请记录', '0', '1521774228', '1521774228', '2', '6012038', 'mtroomApl', '0', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('760', '2', '15', '会议室审核拒绝', '0', '1521774240', '1521774240', '2', '6012037', 'mtroomApl', '0', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('761', '2', '2', '用户登录', '0', '1521774686', '1521774686', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('762', '2', '2', '用户登录', '0', '1521775764', '1521775764', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('763', '2', '2', '用户登录', '0', '1521775822', '1521775822', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('764', '2', '2', '用户登录', '0', '1521776202', '1521776202', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('765', '2', '2', '用户登录', '0', '1521776694', '1521776694', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('766', '2', '2', '用户登录', '0', '1521776812', '1521776812', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('767', '2', '2', '用户登录', '0', '1521781895', '1521781895', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('768', '2', '0', '成功导入1条记录', '0', '1521788199', '1521788199', '2', '6012022', 'etprs', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('769', '2', '2', '用户登录', '0', '1521794285', '1521794285', '2', '6012001', 'User', '0', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('770', null, '0', '导出会议室申请记录', '0', '1521794845', '1521794845', '0', '6012038', 'mtroomApl', null, null, '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('771', null, '0', '导出会议室申请记录', '0', '1521794856', '1521794856', '0', '6012038', 'mtroomApl', null, null, '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('772', null, '0', '导出会议室申请记录', '0', '1521794937', '1521794937', '0', '6012038', 'mtroomApl', null, null, '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('773', null, '0', '导出会议室申请记录', '0', '1521794949', '1521794949', '0', '6012038', 'mtroomApl', null, null, '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('774', '2', '0', '导出房间信息', '0', '1521795957', '1521795957', '2', '6012019', 'room', '0', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('775', '34', '34', '用户登录', '0', '1521796062', '1521796062', '34', '6012001', 'User', '0', '8', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('776', '2', '2', '用户登录', '0', '1521797186', '1521797186', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('777', '2', '0', '导出会议室申请记录', '0', '1521798709', '1521798709', '2', '6012038', 'mtroomApl', '0', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('778', '2', '0', '导出会议室申请记录', '0', '1521798715', '1521798715', '2', '6012038', 'mtroomApl', '0', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('779', '2', '0', '导出客户', '0', '1521798725', '1521798725', '2', '6012004', 'etprs', '0', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('780', '2', '0', '导出客户', '0', '1521798733', '1521798733', '2', '6012004', 'etprs', '0', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('781', '2', '0', '导出客户', '0', '1521798743', '1521798743', '2', '6012004', 'etprs', '0', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('782', '2', '2', '用户登录', '0', '1521798941', '1521798941', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('783', '2', '2', '用户登录', '0', '1521800625', '1521800625', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('784', '2', '2', '用户登录', '0', '1521851371', '1521851371', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('785', '2', '0', '导出客户', '0', '1521851394', '1521851394', '2', '6012004', 'etprs', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('786', '2', '0', '导出会议室申请记录', '0', '1521851408', '1521851408', '2', '6012038', 'mtroomApl', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('787', '2', '0', '导出活动列表', '0', '1521851421', '1521851421', '2', '6012027', 'etprs', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('788', '2', '0', '导出报名信息', '0', '1521851444', '1521851444', '2', '6017027', 'activity', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('789', '2', '2', '用户登录', '0', '1521851483', '1521851483', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('790', '2', '0', '导出报名信息', '0', '1521851515', '1521851515', '2', '6017027', 'activity', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('791', '2', '0', '导出房间信息', '0', '1521851530', '1521851530', '2', '6012019', 'room', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('792', '2', '2', '用户登录', '0', '1521852220', '1521852220', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('793', '2', '2', '用户登录', '0', '1521852658', '1521852658', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('794', '2', '0', '导出会议室申请记录', '0', '1521852876', '1521852876', '2', '6012038', 'mtroomApl', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('795', '2', '2', '用户登录', '0', '1521852976', '1521852976', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('796', '2', '2', '用户登录', '0', '1521853045', '1521853045', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('797', '2', '2', '用户登录', '0', '1521853608', '1521853608', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('798', '2', '2', '用户登录', '0', '1521853832', '1521853832', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('799', '2', '2', '用户登录', '0', '1521854026', '1521854026', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('800', '2', '2', '用户登录', '0', '1521854219', '1521854219', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('801', '2', '2', '用户登录', '0', '1521854277', '1521854277', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('802', '2', '2', '用户登录', '0', '1521854400', '1521854400', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('803', '2', '18', '冻结/解冻用户', '0', '1521854416', '1521854416', '2', '6012024', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('804', '18', '18', '用户登录', '0', '1521854449', '1521854449', '18', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('805', '18', '18', '用户登录', '0', '1521854487', '1521854487', '18', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('806', '2', '2', '用户登录', '0', '1521854525', '1521854525', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('807', '2', '18', '冻结/解冻用户', '0', '1521854534', '1521854534', '2', '6012025', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('808', '2', '24', '编辑客户信息', '0', '1521854741', '1521854741', '2', '6012002', 'etprs', '24', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('809', '2', '25', '新增客户', '0', '1521854813', '1521854813', '2', '6012006', 'etprs', '25', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('810', '2', '25', '编辑客户信息', '0', '1521854892', '1521854892', '2', '6012002', 'etprs', '25', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('811', '2', '2', '用户登录', '0', '1521854900', '1521854900', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('812', '2', '25', '编辑客户信息', '0', '1521854904', '1521854904', '2', '6012002', 'etprs', '25', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('813', '2', '12', '跟进客户', '0', '1521855008', '1521855008', '2', '6012003', 'flow', '16', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('814', '2', '16', '编辑客户信息', '0', '1521855016', '1521855016', '2', '6012002', 'etprs', '16', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('815', '2', '16', '编辑客户信息', '0', '1521855076', '1521855076', '2', '6012002', 'etprs', '16', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('816', '2', '16', '招商客户状态变化', '0', '1521855076', '1521855076', '2', '6012040', 'etprs', '16', '1', '6002004', '6002003', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('817', '2', '16', '发起入驻-编辑入驻客户', '0', '1521855143', '1521855143', '2', '6012010', 'etprs', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('818', '2', '16', '正式分配房间', '0', '1521855152', '1521855152', '2', '6012009', 'etprs', '16', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('819', '2', '16', '发起入驻-签约合同', '0', '1521855180', '1521855180', '2', '6012008', 'etprs', '16', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('820', '2', '2', '用户登录', '0', '1521855412', '1521855412', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('821', '2', '2', '用户登录', '0', '1521856977', '1521856977', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('822', '2', '87', '编辑房间信息', '0', '1521857261', '1521857261', '2', '6012020', 'room', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('823', '1', '1', '用户登录', '0', '1521860626', '1521860626', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('824', '1', '9', '添加空间', '0', '1521861087', '1521861087', '1', '6012015', 'incubator', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('825', '40', '40', '用户登录', '0', '1521861146', '1521861146', '40', '6012001', 'User', '0', '9', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('826', '2', '2', '用户登录', '0', '1521861408', '1521861408', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('827', '2', '2', '用户登录', '0', '1521862200', '1521862200', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('828', '2', '2', '用户登录', '0', '1521862413', '1521862413', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('829', '2', '0', '成功导入0条记录', '0', '1521863139', '1521863139', '2', '6012005', 'etprs', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('830', '2', '0', '成功导入0条记录', '0', '1521863272', '1521863272', '2', '6012005', 'etprs', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('831', '40', '0', '成功导入2条记录', '0', '1521863427', '1521863427', '40', '6012005', 'etprs', '0', '9', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('832', '40', '0', '导出客户', '0', '1521863495', '1521863495', '40', '6012004', 'etprs', '0', '9', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('833', '40', '0', '导出客户', '0', '1521867697', '1521867697', '40', '6012004', 'etprs', '0', '9', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('834', '40', '0', '导出客户', '0', '1521867723', '1521867723', '40', '6012004', 'etprs', '0', '9', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('835', '40', '88', '添加房间', '0', '1521868890', '1521868890', '40', '6012017', 'room', '0', '9', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('836', '40', '89', '添加房间', '0', '1521868957', '1521868957', '40', '6012017', 'room', '0', '9', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('837', '40', '90', '添加房间', '0', '1521869032', '1521869032', '40', '6012017', 'room', '0', '9', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('838', '40', '91', '添加房间', '0', '1521869665', '1521869665', '40', '6012017', 'room', '0', '9', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('839', '40', '92', '添加房间', '0', '1521869665', '1521869665', '40', '6012017', 'room', '0', '9', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('840', '40', '89', '编辑房间信息', '0', '1521870066', '1521870066', '40', '6012020', 'room', '0', '9', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('841', '40', '90', '编辑房间信息', '0', '1521870077', '1521870077', '40', '6012020', 'room', '0', '9', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('842', '40', '92', '编辑房间信息', '0', '1521870086', '1521870086', '40', '6012020', 'room', '0', '9', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('843', '40', '91', '编辑房间信息', '0', '1521870095', '1521870095', '40', '6012020', 'room', '0', '9', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('844', '40', '91', '编辑房间信息', '0', '1521870431', '1521870431', '40', '6012020', 'room', '0', '9', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('845', '40', '26', '编辑客户信息', '0', '1521870506', '1521870506', '40', '6012002', 'etprs', '26', '9', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('846', '40', '26', '招商客户状态变化', '0', '1521870506', '1521870506', '40', '6012040', 'etprs', '26', '9', '6002001', '6002003', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('847', '40', '13', '跟进客户', '0', '1521870528', '1521870528', '40', '6012003', 'flow', '26', '9', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('848', '40', '14', '跟进客户', '0', '1521870535', '1521870535', '40', '6012003', 'flow', '26', '9', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('849', '40', '15', '跟进客户', '0', '1521870543', '1521870543', '40', '6012003', 'flow', '26', '9', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('850', '40', '16', '跟进客户', '0', '1521870570', '1521870570', '40', '6012003', 'flow', '26', '9', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('851', '40', '17', '跟进客户', '0', '1521870580', '1521870580', '40', '6012003', 'flow', '26', '9', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('852', '2', '2', '用户登录', '0', '1521870893', '1521870893', '2', '6012001', 'User', '0', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('853', '40', '26', '发起入驻-编辑入驻客户', '0', '1521870960', '1521870960', '40', '6012010', 'etprs', '0', '9', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('854', '40', '26', '正式分配房间', '0', '1521871007', '1521871007', '40', '6012009', 'etprs', '26', '9', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('855', '40', '26', '发起入驻-签约合同', '0', '1521871168', '1521871168', '40', '6012008', 'etprs', '26', '9', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('856', '1', '1', '用户登录', '0', '1521871369', '1521871369', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('857', '2', '2', '用户登录', '0', '1521871377', '1521871377', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('858', '2', '24', '编辑客户信息', '0', '1521871409', '1521871409', '2', '6012002', 'etprs', '24', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('859', '2', '24', '编辑客户信息', '0', '1521871423', '1521871423', '2', '6012002', 'etprs', '24', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('860', '2', '0', '成功导入0条记录', '0', '1521871496', '1521871496', '2', '6012018', 'room', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('861', '2', '0', '成功导入0条记录', '0', '1521871564', '1521871564', '2', '6012018', 'room', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('862', '40', '0', '导出房间信息', '0', '1521872311', '1521872311', '40', '6012019', 'room', '0', '9', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('863', '40', '0', '导出房间信息', '0', '1521872429', '1521872429', '40', '6012019', 'room', '0', '9', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('864', '40', '0', '导出房间信息', '0', '1521872453', '1521872453', '40', '6012019', 'room', '0', '9', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('865', '40', '0', '导出房间信息', '0', '1521872795', '1521872795', '40', '6012019', 'room', '0', '9', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('866', '40', '0', '导出房间信息', '0', '1521872811', '1521872811', '40', '6012019', 'room', '0', '9', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('867', '40', '0', '导出房间信息', '0', '1521872927', '1521872927', '40', '6012019', 'room', '0', '9', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('868', '40', '9', '修改空间信息', '0', '1521873655', '1521873655', '40', '6012016', 'incubator', '0', '9', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('869', '40', '9', '修改空间信息', '0', '1521873700', '1521873700', '40', '6012016', 'incubator', '0', '9', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('870', '40', '9', '修改空间信息', '0', '1521873733', '1521873733', '40', '6012016', 'incubator', '0', '9', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('871', '40', '0', '导出房间信息', '0', '1521874288', '1521874288', '40', '6012019', 'room', '0', '9', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('872', '40', '5', '发布活动', '0', '1521874590', '1521874590', '40', '6012026', 'activity', '0', '9', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('873', '40', '5', '修改活动信息', '0', '1521874635', '1521874635', '40', '6012028', 'activity', '0', '9', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('874', '40', '0', '导出活动列表', '0', '1521874652', '1521874652', '40', '6012027', 'etprs', '0', '9', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('875', '41', '41', '用户登录', '0', '1521874751', '1521874751', '41', '6012001', 'User', '0', '9', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('876', '41', '26', '编辑客户信息', '0', '1521874979', '1521874979', '41', '6012002', 'etprs', '26', '9', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('877', '41', '12', '活动报名', '0', '1521875059', '1521875059', '41', '6012029', 'activityApl', '26', '9', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('878', '41', '12', '取消报名', '0', '1521875096', '1521875096', '41', '6012030', 'activityApl', '0', '9', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('879', '41', '12', '取消报名', '0', '1521875096', '1521875096', '41', '6012030', 'activityApl', '0', '9', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('880', '41', '12', '取消报名', '0', '1521875096', '1521875096', '41', '6012030', 'activityApl', '0', '9', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('881', '41', '12', '取消报名', '0', '1521875097', '1521875097', '41', '6012030', 'activityApl', '0', '9', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('882', '41', '12', '取消报名', '0', '1521875098', '1521875098', '41', '6012030', 'activityApl', '0', '9', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('883', '41', '13', '活动报名', '0', '1521875129', '1521875129', '41', '6012029', 'activityApl', '26', '9', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('884', '40', '0', '导出报名信息', '0', '1521875154', '1521875154', '40', '6017027', 'activity', '0', '9', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('885', '40', '5', '修改活动信息', '0', '1521875205', '1521875205', '40', '6012028', 'activity', '0', '9', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('886', '40', '5', '修改活动信息', '0', '1521875244', '1521875244', '40', '6012028', 'activity', '0', '9', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('887', '40', '5', '修改活动信息', '0', '1521875250', '1521875250', '40', '6012028', 'activity', '0', '9', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('888', '40', '13', '报名审核通过', '0', '1521875268', '1521875268', '40', '6012031', 'activityApl', '0', '9', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('889', '40', '0', '导出报名信息', '0', '1521875275', '1521875275', '40', '6017027', 'activity', '0', '9', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('890', '1', '1', '用户登录', '0', '1521877598', '1521877598', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('891', '2', '2', '用户登录', '0', '1521878841', '1521878841', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('892', '1', '1', '用户登录', '0', '1521878858', '1521878858', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('893', '2', '15', '收藏成功', '0', '1521881108', '1521881108', '2', '6012034', 'MtroomColect', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('894', '1', '1', '用户登录', '0', '1521883214', '1521883214', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('895', '2', '2', '用户登录', '0', '1521883930', '1521883930', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('896', '2', '28', '新增客户', '0', '1521884239', '1521884239', '2', '6012006', 'etprs', '28', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('897', '2', '28', '编辑客户信息', '0', '1521884247', '1521884247', '2', '6012002', 'etprs', '28', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('898', '2', '28', '招商客户状态变化', '0', '1521884247', '1521884247', '2', '6012040', 'etprs', '28', '1', '6002001', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('899', '2', '0', '导出活动列表', '0', '1521884345', '1521884345', '2', '6012027', 'etprs', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('900', '2', '0', '导出活动列表', '0', '1521884366', '1521884366', '2', '6012027', 'etprs', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('901', '2', '2', '用户登录', '0', '1521887020', '1521887020', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('902', '2', '0', '导出房间信息', '0', '1521887568', '1521887568', '2', '6012019', 'room', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('903', '2', '0', '导出房间信息', '0', '1521887575', '1521887575', '2', '6012019', 'room', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('904', '2', '0', '导出报名信息', '0', '1521887846', '1521887846', '2', '6017027', 'activity', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('905', '2', '0', '导出报名信息', '0', '1521887862', '1521887862', '2', '6017027', 'activity', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('906', '2', '2', '用户登录', '0', '1521889275', '1521889275', '2', '6012001', 'User', '0', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('907', '2', '2', '用户登录', '0', '1521889443', '1521889443', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('908', '2', '18', '跟进客户', '0', '1521889479', '1521889479', '2', '6012003', 'flow', '25', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('909', '1', '1', '用户登录', '0', '1522027738', '1522027738', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('910', '2', '2', '用户登录', '0', '1522027754', '1522027754', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('911', '2', '2', '用户登录', '0', '1522028924', '1522028924', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('912', '34', '34', '用户登录', '0', '1522029283', '1522029283', '34', '6012001', 'User', '0', '8', '', '', '117.141.113.244');
INSERT INTO `ibt_log` VALUES ('913', '2', '2', '用户登录', '0', '1522029506', '1522029506', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('914', '2', '2', '用户登录', '0', '1522029678', '1522029678', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('915', '2', '2', '用户登录', '0', '1522030100', '1522030100', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('916', '2', '2', '用户登录', '0', '1522030147', '1522030147', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('917', '2', '2', '用户登录', '0', '1522030295', '1522030295', '2', '6012001', 'User', '0', '1', '', '', '101.81.222.248');
INSERT INTO `ibt_log` VALUES ('918', '2', '2', '用户登录', '0', '1522031007', '1522031007', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('919', '2', '2', '用户登录', '0', '1522032424', '1522032424', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('920', '2', '2', '用户登录', '0', '1522032606', '1522032606', '2', '6012001', 'User', '0', '1', '', '', '211.103.33.22');
INSERT INTO `ibt_log` VALUES ('921', '2', '2', '用户登录', '0', '1522032639', '1522032639', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('922', '2', '2', '用户登录', '0', '1522032803', '1522032803', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('923', '1', '1', '用户登录', '0', '1522033064', '1522033064', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('924', '2', '2', '用户登录', '0', '1522033270', '1522033270', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('925', '2', '2', '用户登录', '0', '1522033405', '1522033405', '2', '6012001', 'User', '0', '1', '', '', '211.103.33.22');
INSERT INTO `ibt_log` VALUES ('926', '3', '3', '用户登录', '0', '1522033817', '1522033817', '3', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('927', '2', '2', '用户登录', '0', '1522033834', '1522033834', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('928', '39', '39', '用户登录', '0', '1522033850', '1522033850', '39', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('929', '2', '93', '添加房间', '0', '1522033972', '1522033972', '2', '6012017', 'room', '0', '1', '', '', '211.103.33.22');
INSERT INTO `ibt_log` VALUES ('930', '2', '93', '编辑房间信息', '0', '1522034007', '1522034007', '2', '6012020', 'room', '0', '1', '', '', '211.103.33.22');
INSERT INTO `ibt_log` VALUES ('931', '45', '45', '用户登录', '0', '1522034153', '1522034153', '45', '6012001', 'User', '0', '1', '', '', '218.21.220.2');
INSERT INTO `ibt_log` VALUES ('932', '46', '46', '用户登录', '0', '1522034669', '1522034669', '46', '6012001', 'User', '0', '1', '', '', '211.103.33.22');
INSERT INTO `ibt_log` VALUES ('933', '2', '2', '用户登录', '0', '1522034837', '1522034837', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('934', '2', '2', '用户登录', '0', '1522035090', '1522035090', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('935', '2', '2', '用户登录', '0', '1522035149', '1522035149', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('936', '2', '1', '修改空间信息', '0', '1522035167', '1522035167', '2', '6012016', 'incubator', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('937', '2', '2', '用户登录', '0', '1522035259', '1522035259', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('938', '46', '46', '用户登录', '0', '1522035282', '1522035282', '46', '6012001', 'User', '0', '1', '', '', '211.103.33.22');
INSERT INTO `ibt_log` VALUES ('939', '2', '2', '用户登录', '0', '1522035606', '1522035606', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('940', '46', '93', '编辑房间信息', '0', '1522035887', '1522035887', '46', '6012020', 'room', '0', '1', '', '', '211.103.33.22');
INSERT INTO `ibt_log` VALUES ('941', '46', '93', '编辑房间信息', '0', '1522035899', '1522035899', '46', '6012020', 'room', '0', '1', '', '', '211.103.33.22');
INSERT INTO `ibt_log` VALUES ('942', '46', '93', '编辑房间信息', '0', '1522035945', '1522035945', '46', '6012020', 'room', '0', '1', '', '', '211.103.33.22');
INSERT INTO `ibt_log` VALUES ('943', '1', '1', '用户登录', '0', '1522035970', '1522035970', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('944', '46', '93', '编辑房间信息', '0', '1522035975', '1522035975', '46', '6012020', 'room', '0', '1', '', '', '211.103.33.22');
INSERT INTO `ibt_log` VALUES ('945', '2', '2', '用户登录', '0', '1522036001', '1522036001', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('946', '1', '1', '用户登录', '0', '1522036016', '1522036016', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('947', '46', '93', '编辑房间信息', '0', '1522036026', '1522036026', '46', '6012020', 'room', '0', '1', '', '', '211.103.33.22');
INSERT INTO `ibt_log` VALUES ('948', '46', '46', '用户登录', '0', '1522036038', '1522036038', '46', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('949', '46', '46', '用户登录', '0', '1522036050', '1522036050', '46', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('950', '46', '93', '编辑房间信息', '0', '1522036052', '1522036052', '46', '6012020', 'room', '0', '1', '', '', '211.103.33.22');
INSERT INTO `ibt_log` VALUES ('951', '1', '1', '用户登录', '0', '1522036066', '1522036066', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('952', '46', '93', '编辑房间信息', '0', '1522036075', '1522036075', '46', '6012020', 'room', '0', '1', '', '', '211.103.33.22');
INSERT INTO `ibt_log` VALUES ('953', '1', '1', '用户登录', '0', '1522036104', '1522036104', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('954', '23', '23', '用户登录', '0', '1522036117', '1522036117', '23', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('955', '46', '93', '编辑房间信息', '0', '1522036125', '1522036125', '46', '6012020', 'room', '0', '1', '', '', '211.103.33.22');
INSERT INTO `ibt_log` VALUES ('956', '46', '93', '编辑房间信息', '0', '1522036142', '1522036142', '46', '6012020', 'room', '0', '1', '', '', '211.103.33.22');
INSERT INTO `ibt_log` VALUES ('957', '1', '1', '用户登录', '0', '1522036160', '1522036160', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('958', '40', '40', '用户登录', '0', '1522036171', '1522036171', '40', '6012001', 'User', '0', '9', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('959', '2', '2', '用户登录', '0', '1522036217', '1522036217', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('960', '2', '2', '用户登录', '0', '1522040604', '1522040604', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('961', '2', '2', '用户登录', '0', '1522041498', '1522041498', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('962', '2', '2', '用户登录', '0', '1522041749', '1522041749', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('963', '2', '2', '用户登录', '0', '1522041750', '1522041750', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('964', '2', '2', '用户登录', '0', '1522041884', '1522041884', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('965', '46', '46', '用户登录', '0', '1522043177', '1522043177', '46', '6012001', 'User', '0', '1', '', '', '211.103.33.22');
INSERT INTO `ibt_log` VALUES ('966', '46', '93', '编辑房间信息', '0', '1522043223', '1522043223', '46', '6012020', 'room', '0', '1', '', '', '211.103.33.22');
INSERT INTO `ibt_log` VALUES ('967', '46', '93', '编辑房间信息', '0', '1522043252', '1522043252', '46', '6012020', 'room', '0', '1', '', '', '211.103.33.22');
INSERT INTO `ibt_log` VALUES ('968', '46', '94', '添加房间', '0', '1522043914', '1522043914', '46', '6012017', 'room', '0', '1', '', '', '211.103.33.22');
INSERT INTO `ibt_log` VALUES ('969', '2', '2', '用户登录', '0', '1522044630', '1522044630', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('970', '34', '34', '用户登录', '0', '1522045445', '1522045445', '34', '6012001', 'User', '0', '8', '', '', '117.141.113.244');
INSERT INTO `ibt_log` VALUES ('971', '47', '47', '用户登录', '0', '1522045585', '1522045585', '47', '6012001', 'User', '0', '8', '', '', '117.141.113.244');
INSERT INTO `ibt_log` VALUES ('972', '2', '2', '用户登录', '0', '1522046180', '1522046180', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('973', '2', '2', '用户登录', '0', '1522046199', '1522046199', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('974', '3', '3', '用户登录', '0', '1522046231', '1522046231', '3', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('975', '2', '2', '用户登录', '0', '1522046302', '1522046302', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('976', '35', '35', '用户登录', '0', '1522046374', '1522046374', '35', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('977', '45', '45', '用户登录', '0', '1522047193', '1522047193', '45', '6012001', 'User', '0', '1', '', '', '218.21.220.2');
INSERT INTO `ibt_log` VALUES ('978', '2', '2', '用户登录', '0', '1522047218', '1522047218', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('979', '2', '2', '用户登录', '0', '1522047236', '1522047236', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('980', '2', '16', '房间变更', '0', '1522047402', '1522047402', '2', '6012007', 'etprs', '16', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('981', '2', '28', '编辑入驻客户信息', '0', '1522047508', '1522047508', '2', '6012014', 'etprs', '28', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('982', '2', '28', '入驻客户状态变化', '0', '1522047508', '1522047508', '2', '6012041', 'etprs', '28', '1', '6008002', '6008003', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('983', '2', '2', '用户登录', '0', '1522047847', '1522047847', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('984', '2', '2', '用户登录', '0', '1522048489', '1522048489', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('985', '49', '49', '用户登录', '0', '1522049709', '1522049709', '49', '6012001', 'User', '0', '8', '', '', '117.141.113.244');
INSERT INTO `ibt_log` VALUES ('986', '2', '0', '成功导入5条记录', '0', '1522050347', '1522050347', '2', '6012018', 'room', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('987', '2', '95', '编辑房间信息', '0', '1522050756', '1522050756', '2', '6012020', 'room', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('988', '2', '2', '用户登录', '0', '1522051029', '1522051029', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('989', '1', '1', '用户登录', '0', '1522051598', '1522051598', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('990', '2', '2', '用户登录', '0', '1522051921', '1522051921', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('991', '35', '35', '用户登录', '0', '1522052697', '1522052697', '35', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('992', '48', '48', '用户登录', '0', '1522053320', '1522053320', '48', '6012001', 'User', '0', '8', '', '', '113.14.237.75');
INSERT INTO `ibt_log` VALUES ('993', '2', '2', '用户登录', '0', '1522054763', '1522054763', '2', '6012001', 'User', '0', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('994', '46', '46', '用户登录', '0', '1522054899', '1522054899', '46', '6012001', 'User', '0', '1', '', '', '211.103.33.22');
INSERT INTO `ibt_log` VALUES ('995', '46', '46', '用户登录', '0', '1522054973', '1522054973', '46', '6012001', 'User', '0', '1', '', '', '211.103.33.22');
INSERT INTO `ibt_log` VALUES ('996', '2', '2', '用户登录', '0', '1522055026', '1522055026', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('997', '46', '46', '用户登录', '0', '1522055029', '1522055029', '46', '6012001', 'User', '0', '1', '', '', '211.103.33.22');
INSERT INTO `ibt_log` VALUES ('998', '2', '2', '用户登录', '0', '1522055884', '1522055884', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('999', '2', '100', '添加房间', '0', '1522056562', '1522056562', '2', '6012017', 'room', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1000', '2', '2', '用户登录', '0', '1522060129', '1522060129', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1001', '2', '1', '修改活动信息', '0', '1522060914', '1522060914', '2', '6012028', 'activity', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1002', '2', '1', '修改活动信息', '0', '1522060967', '1522060967', '2', '6012028', 'activity', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1003', '2', '2', '用户登录', '0', '1522112623', '1522112623', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1004', '2', '2', '用户登录', '0', '1522115752', '1522115752', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1005', '2', '2', '用户登录', '0', '1522118392', '1522118392', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1006', '2', '2', '用户登录', '0', '1522130033', '1522130033', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1007', '2', '2', '用户登录', '0', '1522137059', '1522137059', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1008', '2', '2', '用户登录', '0', '1522142075', '1522142075', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1009', '50', '50', '用户登录', '0', '1522142307', '1522142307', '50', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1010', '2', '11', '入驻客户状态变化', '0', '1522047508', '1522047508', '2', '6012041', 'etprs', '11', '1', '6008004', '6008005', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1011', '2', '16', '入驻客户状态变化', '0', '1522047508', '1522047508', '2', '6012041', 'etprs', '16', '1', '6008004', '6008005', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1012', '2', '17', '入驻客户状态变化', '0', '1522047508', '1522047508', '2', '6012041', 'etprs', '17', '1', '6008004', '6008005', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1013', '2', '18', '入驻客户状态变化', '0', '1522047508', '1522047508', '2', '6012041', 'etprs', '18', '1', '6008004', '6008005', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1014', '2', '19', '入驻客户状态变化', '0', '1522047508', '1522047508', '2', '6012041', 'etprs', '19', '1', '6008004', '6008005', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1015', '2', '21', '入驻客户状态变化', '0', '1522047508', '1522047508', '2', '6012041', 'etprs', '21', '1', '6008004', '6008005', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1016', '2', '23', '入驻客户状态变化', '0', '1522047508', '1522047508', '2', '6012041', 'etprs', '23', '1', '6008004', '6008005', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1018', '0', '0', '', '0', '0', '0', '0', '', '', '0', '0', null, null, '');
INSERT INTO `ibt_log` VALUES ('1019', '0', '0', '', '0', '0', '0', '0', '', '', '0', '0', null, null, '');
INSERT INTO `ibt_log` VALUES ('1020', '2', '19', '跟进客户', '0', '1522144336', '1522144336', '2', '6012003', 'flow', '20', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1021', '2', '19', '跟进客户', '0', '1522144336', '1522144336', '2', '6012040', 'etprs', '20', '1', '6002004', '6002004', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1022', '2', '20', '跟进客户', '0', '1522144461', '1522144461', '2', '6012003', 'flow', '24', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1023', '2', '23', '入驻客户状态变化', '0', '1522047508', '1522047508', '2', '6012041', 'etprs', '23', '1', '6008004', '6008005', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1024', '0', '1', '入驻客户状态变化', '0', '1522047508', '1522047508', '2', '6012041', 'etprs', '1', '1', '6008005', '6008006', '');
INSERT INTO `ibt_log` VALUES ('1025', '0', '22', '入驻客户状态变化', '0', '1522047508', '1522047508', '2', '6012041', 'etprs', '22', '1', '6008005', '6008006', '');
INSERT INTO `ibt_log` VALUES ('1026', '0', '3', '入驻客户状态变化', '0', '1522047508', '1522047508', '2', '6012041', 'etprs', '3', '1', '6008005', '6008006', '');
INSERT INTO `ibt_log` VALUES ('1027', '0', '9', '入驻客户状态变化', '0', '1522047508', '1522047508', '2', '6012041', 'etprs', '9', '1', '6008005', '6008006', '');
INSERT INTO `ibt_log` VALUES ('1028', '0', '12', '入驻客户状态变化', '0', '1522047508', '1522047508', '2', '6012041', 'etprs', '12', '1', '6008005', '6008006', '');
INSERT INTO `ibt_log` VALUES ('1029', '51', '51', '用户登录', '0', '1522207205', '1522207205', '51', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1030', '51', '51', '用户登录', '0', '1522207286', '1522207286', '51', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1031', '51', '51', '用户登录', '0', '1522207299', '1522207299', '51', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1032', '51', '51', '用户登录', '0', '1522207348', '1522207348', '51', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1033', '51', '51', '用户登录', '0', '1522207351', '1522207351', '51', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1034', '51', '51', '用户登录', '0', '1522207352', '1522207352', '51', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1035', '51', '51', '用户登录', '0', '1522207352', '1522207352', '51', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1036', '51', '51', '用户登录', '0', '1522207365', '1522207365', '51', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1037', '51', '51', '用户登录', '0', '1522207365', '1522207365', '51', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1038', '51', '51', '用户登录', '0', '1522207366', '1522207366', '51', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1039', '51', '51', '用户登录', '0', '1522207366', '1522207366', '51', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1040', '51', '51', '用户登录', '0', '1522207366', '1522207366', '51', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1041', '51', '51', '用户登录', '0', '1522207366', '1522207366', '51', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1042', '51', '51', '用户登录', '0', '1522207366', '1522207366', '51', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1043', '51', '51', '用户登录', '0', '1522207383', '1522207383', '51', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1044', '51', '51', '用户登录', '0', '1522207419', '1522207419', '51', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1045', '51', '51', '用户登录', '0', '1522207420', '1522207420', '51', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1046', '51', '51', '用户登录', '0', '1522207451', '1522207451', '51', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1047', '51', '51', '用户登录', '0', '1522207478', '1522207478', '51', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1048', '51', '51', '用户登录', '0', '1522207479', '1522207479', '51', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1049', '51', '51', '用户登录', '0', '1522207479', '1522207479', '51', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1050', '51', '51', '用户登录', '0', '1522207534', '1522207534', '51', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1051', '51', '51', '用户登录', '0', '1522207552', '1522207552', '51', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1052', '51', '51', '用户登录', '0', '1522207587', '1522207587', '51', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1053', '51', '51', '用户登录', '0', '1522207674', '1522207674', '51', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1054', '51', '51', '用户登录', '0', '1522207701', '1522207701', '51', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1055', '51', '51', '用户登录', '0', '1522207739', '1522207739', '51', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1056', '51', '51', '用户登录', '0', '1522207780', '1522207780', '51', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1057', '51', '51', '用户登录', '0', '1522207802', '1522207802', '51', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1058', '51', '51', '用户登录', '0', '1522207812', '1522207812', '51', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1059', '51', '51', '用户登录', '0', '1522207869', '1522207869', '51', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1060', '51', '51', '用户登录', '0', '1522207870', '1522207870', '51', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1061', '51', '51', '用户登录', '0', '1522207882', '1522207882', '51', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1062', '51', '51', '用户登录', '0', '1522208323', '1522208323', '51', '6012001', 'User', '0', null, '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1063', '51', '51', '用户登录', '0', '1522208370', '1522208370', '51', '6012001', 'User', '0', null, '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1064', '51', '51', '用户登录', '0', '1522208377', '1522208377', '51', '6012001', 'User', '0', null, '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1065', '51', '51', '用户登录', '0', '1522208416', '1522208416', '51', '6012001', 'User', '0', null, '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1066', '51', '51', '用户登录', '0', '1522208557', '1522208557', '51', '6012001', 'User', '0', null, '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1067', '51', '51', '用户登录', '0', '1522208710', '1522208710', '51', '6012001', 'User', '0', null, '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1068', '51', '51', '用户登录', '0', '1522208736', '1522208736', '51', '6012001', 'User', '0', null, '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1069', '51', '51', '用户登录', '0', '1522208791', '1522208791', '51', '6012001', 'User', '0', null, '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1070', '51', '51', '用户登录', '0', '1522208851', '1522208851', '51', '6012001', 'User', '0', null, '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1071', '51', '51', '用户登录', '0', '1522208964', '1522208964', '51', '6012001', 'User', '0', null, '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1072', '51', '51', '用户登录', '0', '1522209030', '1522209030', '51', '6012001', 'User', '0', null, '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1073', '51', '13', '添加空间', '0', '1522213420', '1522213420', '51', '6012015', 'incubator', '0', null, '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1074', '52', '52', '用户登录', '0', '1522213709', '1522213709', '52', '6012001', 'User', '0', null, '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1075', '52', '52', '用户登录', '0', '1522213738', '1522213738', '52', '6012001', 'User', '0', null, '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1076', null, '14', '添加空间', '0', '1522213760', '1522213760', '0', '6012015', 'incubator', '0', null, '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1077', '1', '1', '用户登录', '0', '1522213931', '1522213931', '1', '6012001', 'User', '0', '0', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1078', '52', '52', '用户登录', '0', '1522227077', '1522227077', '52', '6012001', 'User', '0', '14', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1079', '52', '52', '用户登录', '0', '1522227090', '1522227090', '52', '6012001', 'User', '0', '14', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1080', '1', '1', '用户登录', '0', '1522227097', '1522227097', '1', '6012001', 'User', '0', '0', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1081', '52', '52', '用户登录', '0', '1522227807', '1522227807', '52', '6012001', 'User', '0', '14', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1082', '52', '52', '用户登录', '0', '1522227874', '1522227874', '52', '6012001', 'User', '0', '14', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1083', '1', '1', '用户登录', '0', '1522227886', '1522227886', '1', '6012001', 'User', '0', '0', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1084', '34', '34', '用户登录', '0', '1522235050', '1522235050', '34', '6012001', 'User', '0', '8', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1085', '34', '34', '用户登录', '0', '1522235117', '1522235117', '34', '6012001', 'User', '0', '8', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1086', '2', '2', '用户登录', '0', '1522235458', '1522235458', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1087', '54', '54', '用户登录', '0', '1522236638', '1522236638', '54', '6012001', 'User', '0', null, '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1088', '54', '54', '用户登录', '0', '1522236653', '1522236653', '54', '6012001', 'User', '0', null, '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1089', '2', '2', '用户登录', '0', '1522236700', '1522236700', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1090', '1', '1', '用户登录', '0', '1522236714', '1522236714', '1', '6012001', 'User', '0', '0', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1091', '2', '2', '用户登录', '0', '1522237134', '1522237134', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1092', '1', '1', '用户登录', '0', '1522237203', '1522237203', '1', '6012001', 'User', '0', '0', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1093', '52', '52', '用户登录', '0', '1522239019', '1522239019', '52', '6012001', 'User', '0', '14', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1094', '52', '52', '用户登录', '0', '1522239137', '1522239137', '52', '6012001', 'User', '0', '14', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1095', '52', '52', '用户登录', '0', '1522239160', '1522239160', '52', '6012001', 'User', '0', '14', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1096', '52', '52', '用户登录', '0', '1522284058', '1522284058', '52', '6012001', 'User', '0', '14', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1097', '52', '52', '用户登录', '0', '1522284577', '1522284577', '52', '6012001', 'User', '0', '14', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1098', '2', '2', '用户登录', '0', '1522284583', '1522284583', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1099', '2', '2', '用户登录', '0', '1522287078', '1522287078', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1100', '2', '2', '用户登录', '0', '1522299951', '1522299951', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1101', '2', '2', '用户登录', '0', '1522299982', '1522299982', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1102', '1', '1', '用户登录', '0', '1522300021', '1522300021', '1', '6012001', 'User', '0', '0', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1103', '2', '2', '用户登录', '0', '1522306639', '1522306639', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1104', '2', '2', '用户登录', '0', '1522370338', '1522370338', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1105', '2', '29', '导入入驻客户', '0', '1522379921', '1522379921', '2', '6012022', 'etprs', '29', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1106', '2', '29', '招商客户状态变化', '0', '1522379921', '1522379921', '2', '6012040', 'etprs', '29', '1', '0', '6002003', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1107', '2', '29', '入驻客户状态变化', '0', '1522379921', '1522379921', '2', '6012041', 'etprs', '29', '1', '0', '6008002', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1108', '2', '0', '成功导入1条记录', '0', '1522379921', '1522379921', '2', '6012022', 'etprs', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1109', '2', '0', '成功导入0条记录', '0', '1522380292', '1522380292', '2', '6012005', 'etprs', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1110', '2', '30', '新增客户', '0', '1522380393', '1522380393', '2', '6012006', 'etprs', '30', '1', '0', '6002003', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1111', '2', '0', '成功导入1条记录', '0', '1522380393', '1522380393', '2', '6012005', 'etprs', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1112', '2', '0', '成功导入0条记录', '0', '1522381636', '1522381636', '2', '6012018', 'room', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1113', '2', '0', '成功导入0条记录', '0', '1522381638', '1522381638', '2', '6012018', 'room', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1114', '2', '0', '成功导入0条记录', '0', '1522381639', '1522381639', '2', '6012018', 'room', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1115', '2', '0', '成功导入0条记录', '0', '1522381639', '1522381639', '2', '6012018', 'room', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1116', '2', '0', '成功导入0条记录', '0', '1522381640', '1522381640', '2', '6012018', 'room', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1117', '2', '0', '成功导入0条记录', '0', '1522381640', '1522381640', '2', '6012018', 'room', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1118', '2', '0', '成功导入0条记录', '0', '1522381641', '1522381641', '2', '6012018', 'room', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1119', '2', '0', '成功导入0条记录', '0', '1522381641', '1522381641', '2', '6012018', 'room', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1120', '2', '0', '成功导入0条记录', '0', '1522381641', '1522381641', '2', '6012018', 'room', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1121', '2', '0', '成功导入0条记录', '0', '1522381921', '1522381921', '2', '6012005', 'etprs', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1122', '2', '0', '成功导入0条记录', '0', '1522381929', '1522381929', '2', '6012005', 'etprs', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1123', '2', '0', '成功导入0条记录', '0', '1522381930', '1522381930', '2', '6012005', 'etprs', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1124', '2', '0', '成功导入0条记录', '0', '1522381931', '1522381931', '2', '6012005', 'etprs', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1125', '2', '0', '成功导入0条记录', '0', '1522386762', '1522386762', '2', '6012018', 'room', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1126', '2', '0', '成功导入0条记录', '0', '1522386763', '1522386763', '2', '6012018', 'room', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1127', '2', '0', '成功导入0条记录', '0', '1522386875', '1522386875', '2', '6012005', 'etprs', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1128', '2', '0', '成功导入0条记录', '0', '1522386876', '1522386876', '2', '6012005', 'etprs', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1129', '2', '2', '用户登录', '0', '1522387517', '1522387517', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1130', '2', '0', '成功导入0条记录', '0', '1522387648', '1522387648', '2', '6012005', 'etprs', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1131', '2', '0', '成功导入0条记录', '0', '1522387649', '1522387649', '2', '6012005', 'etprs', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1132', '2', '0', '成功导入0条记录', '0', '1522387649', '1522387649', '2', '6012005', 'etprs', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1133', '2', '0', '成功导入0条记录', '0', '1522387649', '1522387649', '2', '6012005', 'etprs', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1134', '2', '0', '成功导入0条记录', '0', '1522387650', '1522387650', '2', '6012005', 'etprs', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1135', '2', '0', '成功导入0条记录', '0', '1522387650', '1522387650', '2', '6012005', 'etprs', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1136', '2', '0', '成功导入0条记录', '0', '1522387651', '1522387651', '2', '6012005', 'etprs', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1137', '2', '0', '成功导入0条记录', '0', '1522387651', '1522387651', '2', '6012005', 'etprs', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1138', '2', '0', '成功导入0条记录', '0', '1522387651', '1522387651', '2', '6012005', 'etprs', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1139', '2', '0', '成功导入0条记录', '0', '1522387651', '1522387651', '2', '6012005', 'etprs', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1140', '2', '0', '成功导入0条记录', '0', '1522387652', '1522387652', '2', '6012005', 'etprs', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1141', '2', '0', '成功导入0条记录', '0', '1522387652', '1522387652', '2', '6012005', 'etprs', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1142', '2', '0', '成功导入0条记录', '0', '1522387652', '1522387652', '2', '6012005', 'etprs', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1143', '1', '1', '用户登录', '0', '1522391861', '1522391861', '1', '6012001', 'User', '0', '0', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1144', '2', '2', '用户登录', '0', '1522392256', '1522392256', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1145', '2', '2', '用户登录', '0', '1522396496', '1522396496', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1146', '1', '1', '用户登录', '0', '1522397012', '1522397012', '1', '6012001', 'User', '0', '0', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1147', '2', '2', '用户登录', '0', '1522401573', '1522401573', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1148', '2', '0', '导出活动列表', '0', '1522401768', '1522401768', '2', '6012027', 'etprs', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1149', '1', '1', '用户登录', '0', '1522629494', '1522629494', '1', '6012001', 'User', '0', '0', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1150', '1', '15', '添加空间', '0', '1522631450', '1522631450', '1', '6012015', 'incubator', '0', '0', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1151', '1', '15', '修改空间信息', '0', '1522631461', '1522631461', '1', '6012016', 'incubator', '0', '0', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1152', '2', '2', '用户登录', '0', '1522631800', '1522631800', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1153', '2', '2', '用户登录', '0', '1522633378', '1522633378', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1154', '2', '2', '用户登录', '0', '1522651329', '1522651329', '2', '6012001', 'User', '0', '1', '', '', '192.168.0.119');
INSERT INTO `ibt_log` VALUES ('1155', '2', '30', '编辑客户信息', '0', '1522651344', '1522651344', '2', '6012002', 'etprs', '30', '1', '', '', '192.168.0.119');
INSERT INTO `ibt_log` VALUES ('1156', '2', '30', '编辑客户信息', '0', '1522651358', '1522651358', '2', '6012002', 'etprs', '30', '1', '', '', '192.168.0.119');
INSERT INTO `ibt_log` VALUES ('1157', '2', '29', '编辑客户信息', '0', '1522651368', '1522651368', '2', '6012002', 'etprs', '29', '1', '', '', '192.168.0.119');
INSERT INTO `ibt_log` VALUES ('1158', '2', '100', '编辑房间信息', '0', '1522651633', '1522651633', '2', '6012020', 'room', '0', '1', '', '', '192.168.0.119');
INSERT INTO `ibt_log` VALUES ('1159', '2', '100', '编辑房间信息', '0', '1522651838', '1522651838', '2', '6012020', 'room', '0', '1', '', '', '192.168.0.119');
INSERT INTO `ibt_log` VALUES ('1160', '2', '2', '用户登录', '0', '1522715871', '1522715871', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1161', '2', '25', '编辑客户信息', '0', '1522724051', '1522724051', '2', '6012002', 'etprs', '25', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1162', '2', '25', '编辑客户信息', '0', '1522724159', '1522724159', '2', '6012002', 'etprs', '25', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1163', '2', '25', '编辑客户信息', '0', '1522724178', '1522724178', '2', '6012002', 'etprs', '25', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1164', '2', '25', '编辑客户信息', '0', '1522725202', '1522725202', '2', '6012002', 'etprs', '25', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1165', '2', '25', '编辑客户信息', '0', '1522725271', '1522725271', '2', '6012002', 'etprs', '25', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1166', '2', '16', '收藏成功', '0', '1522745092', '1522745092', '2', '6012034', 'MtroomColect', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1167', '2', '17', '收藏成功', '0', '1522745094', '1522745094', '2', '6012034', 'MtroomColect', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1168', '2', '1', '取消收藏', '0', '1522745094', '1522745094', '2', '6012034', 'MtroomColect', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1169', '2', '18', '收藏成功', '0', '1522745095', '1522745095', '2', '6012034', 'MtroomColect', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1170', '2', '1', '取消收藏', '0', '1522745095', '1522745095', '2', '6012034', 'MtroomColect', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1171', '2', '19', '收藏成功', '0', '1522745096', '1522745096', '2', '6012034', 'MtroomColect', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1172', '2', '1', '取消收藏', '0', '1522745096', '1522745096', '2', '6012034', 'MtroomColect', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1173', '2', '20', '收藏成功', '0', '1522745096', '1522745096', '2', '6012034', 'MtroomColect', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1174', '2', '1', '取消收藏', '0', '1522745097', '1522745097', '2', '6012034', 'MtroomColect', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1175', '2', '21', '收藏成功', '0', '1522745098', '1522745098', '2', '6012034', 'MtroomColect', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1176', '2', '1', '取消收藏', '0', '1522745104', '1522745104', '2', '6012034', 'MtroomColect', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1177', '2', '22', '收藏成功', '0', '1522745105', '1522745105', '2', '6012034', 'MtroomColect', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1178', '2', '1', '取消收藏', '0', '1522745109', '1522745109', '2', '6012034', 'MtroomColect', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1179', '2', '1', '取消收藏', '0', '1522745111', '1522745111', '2', '6012034', 'MtroomColect', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1180', '2', '23', '收藏成功', '0', '1522745113', '1522745113', '2', '6012034', 'MtroomColect', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1181', '2', '1', '取消收藏', '0', '1522745115', '1522745115', '2', '6012034', 'MtroomColect', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1182', '2', '24', '收藏成功', '0', '1522745116', '1522745116', '2', '6012034', 'MtroomColect', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1183', '2', '25', '收藏成功', '0', '1522745120', '1522745120', '2', '6012034', 'MtroomColect', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1184', '2', '1', '取消收藏', '0', '1522745121', '1522745121', '2', '6012034', 'MtroomColect', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1185', '2', '1', '取消收藏', '0', '1522745122', '1522745122', '2', '6012034', 'MtroomColect', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1186', '2', '26', '收藏成功', '0', '1522745123', '1522745123', '2', '6012034', 'MtroomColect', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1187', '2', '1', '取消收藏', '0', '1522745125', '1522745125', '2', '6012034', 'MtroomColect', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1188', '2', '27', '收藏成功', '0', '1522745125', '1522745125', '2', '6012034', 'MtroomColect', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1189', '2', '1', '取消收藏', '0', '1522745126', '1522745126', '2', '6012034', 'MtroomColect', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1190', '2', '28', '收藏成功', '0', '1522745126', '1522745126', '2', '6012034', 'MtroomColect', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1191', '2', '1', '取消收藏', '0', '1522745127', '1522745127', '2', '6012034', 'MtroomColect', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1192', '2', '29', '收藏成功', '0', '1522745133', '1522745133', '2', '6012034', 'MtroomColect', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1193', '2', '1', '取消收藏', '0', '1522745135', '1522745135', '2', '6012034', 'MtroomColect', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1194', '2', '30', '收藏成功', '0', '1522745136', '1522745136', '2', '6012034', 'MtroomColect', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1195', '2', '1', '取消收藏', '0', '1522745137', '1522745137', '2', '6012034', 'MtroomColect', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1196', '2', '31', '收藏成功', '0', '1522745138', '1522745138', '2', '6012034', 'MtroomColect', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1197', '2', '1', '取消收藏', '0', '1522745138', '1522745138', '2', '6012034', 'MtroomColect', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1198', '2', '32', '收藏成功', '0', '1522745138', '1522745138', '2', '6012034', 'MtroomColect', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1199', '2', '1', '取消收藏', '0', '1522745139', '1522745139', '2', '6012034', 'MtroomColect', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1200', '2', '33', '收藏成功', '0', '1522745140', '1522745140', '2', '6012034', 'MtroomColect', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1201', '2', '1', '取消收藏', '0', '1522745142', '1522745142', '2', '6012034', 'MtroomColect', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1202', '2', '34', '收藏成功', '0', '1522745143', '1522745143', '2', '6012034', 'MtroomColect', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1203', '2', '1', '取消收藏', '0', '1522745144', '1522745144', '2', '6012034', 'MtroomColect', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1204', '2', '35', '收藏成功', '0', '1522745144', '1522745144', '2', '6012034', 'MtroomColect', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1205', '2', '1', '取消收藏', '0', '1522745144', '1522745144', '2', '6012034', 'MtroomColect', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1206', '2', '36', '收藏成功', '0', '1522745145', '1522745145', '2', '6012034', 'MtroomColect', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1207', '2', '1', '取消收藏', '0', '1522745146', '1522745146', '2', '6012034', 'MtroomColect', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1208', '2', '37', '收藏成功', '0', '1522745148', '1522745148', '2', '6012034', 'MtroomColect', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1209', '2', '30', '编辑客户信息', '0', '1522747631', '1522747631', '2', '6012002', 'etprs', '30', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1210', '2', '2', '用户登录', '0', '1522802523', '1522802523', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1211', '2', '25', '编辑客户信息', '0', '1522805674', '1522805674', '2', '6012002', 'etprs', '25', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1212', '2', '25', '招商客户状态变化', '0', '1522805674', '1522805674', '2', '6012040', 'etprs', '25', '1', '6002001', '6002003', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1213', '2', '25', '入驻客户状态变化', '0', '1522805674', '1522805674', '2', '6012041', 'etprs', '25', '1', '6008001', '6008002', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1214', '2', '21', '跟进客户', '0', '1522805708', '1522805708', '2', '6012003', 'flow', '25', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1215', '2', '25', '编辑客户信息', '0', '1522805774', '1522805774', '2', '6012002', 'etprs', '25', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1216', '2', '29', '编辑客户信息', '0', '1522806583', '1522806583', '2', '6012002', 'etprs', '29', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1217', '2', '29', '招商客户状态变化', '0', '1522806583', '1522806583', '2', '6012040', 'etprs', '29', '1', '6002003', '6002001', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1218', '2', '29', '入驻客户状态变化', '0', '1522806583', '1522806583', '2', '6012041', 'etprs', '29', '1', '6008002', '6008001', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1219', '2', '22', '跟进客户', '0', '1522806627', '1522806627', '2', '6012003', 'flow', '29', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1220', '2', '23', '跟进客户', '0', '1522807051', '1522807051', '2', '6012003', 'flow', '29', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1221', '2', '24', '跟进客户', '0', '1522807119', '1522807119', '2', '6012003', 'flow', '29', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1222', '2', '25', '跟进客户', '0', '1522807861', '1522807861', '2', '6012003', 'flow', '29', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1223', '2', '2', '用户登录', '0', '1522810879', '1522810879', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1224', '2', '2', '用户登录', '0', '1522820456', '1522820456', '2', '6012001', 'User', '0', '1', '', '', '192.168.0.119');
INSERT INTO `ibt_log` VALUES ('1225', '2', '2', '用户登录', '0', '1522822237', '1522822237', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1226', '2', '29', '编辑客户信息', '0', '1522824674', '1522824674', '2', '6012002', 'etprs', '29', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1227', '2', '29', '编辑客户信息', '0', '1522824704', '1522824704', '2', '6012002', 'etprs', '29', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1228', '2', '29', '编辑客户信息', '0', '1522824847', '1522824847', '2', '6012002', 'etprs', '29', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1229', '2', '29', '招商客户状态变化', '0', '1522824847', '1522824847', '2', '6012040', 'etprs', '29', '1', '6002001', '6002002', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1230', '2', '29', '编辑客户信息', '0', '1522824862', '1522824862', '2', '6012002', 'etprs', '29', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1231', '2', '29', '招商客户状态变化', '0', '1522824862', '1522824862', '2', '6012040', 'etprs', '29', '1', '6002002', '6002001', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1232', '2', '29', '编辑客户信息', '0', '1522826496', '1522826496', '2', '6012002', 'etprs', '29', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1233', '2', '29', '编辑客户信息', '0', '1522826886', '1522826886', '2', '6012002', 'etprs', '29', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1234', '2', '29', '编辑客户信息', '0', '1522827038', '1522827038', '2', '6012002', 'etprs', '29', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1235', '2', '29', '编辑客户信息', '0', '1522827549', '1522827549', '2', '6012002', 'etprs', '29', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1236', '2', '29', '招商客户状态变化', '0', '1522827549', '1522827549', '2', '6012040', 'etprs', '29', '1', '6002001', '6002003', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1237', '2', '29', '入驻客户状态变化', '0', '1522827549', '1522827549', '2', '6012041', 'etprs', '29', '1', '6008001', '6008002', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1238', '2', '29', '编辑客户信息', '0', '1522827776', '1522827776', '2', '6012002', 'etprs', '29', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1239', '2', '25', '编辑客户信息', '0', '1522828117', '1522828117', '2', '6012002', 'etprs', '25', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1240', '2', '25', '编辑客户信息', '0', '1522828136', '1522828136', '2', '6012002', 'etprs', '25', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1241', '2', '25', '编辑客户信息', '0', '1522828161', '1522828161', '2', '6012002', 'etprs', '25', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1242', '2', '1', '修改活动信息', '0', '1522831071', '1522831071', '2', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1243', '2', '1', '修改活动信息', '0', '1522831736', '1522831736', '2', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1244', '2', '1', '修改活动信息', '0', '1522831749', '1522831749', '2', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1245', '2', '1', '修改活动信息', '0', '1522832015', '1522832015', '2', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1246', '2', '1', '修改活动信息', '0', '1522832016', '1522832016', '2', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1247', '2', '1', '修改活动信息', '0', '1522832062', '1522832062', '2', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1248', '2', '1', '修改活动信息', '0', '1522832087', '1522832087', '2', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1249', '2', '1', '修改活动信息', '0', '1522832865', '1522832865', '2', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1250', '2', '1', '修改活动信息', '0', '1522832980', '1522832980', '2', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1251', '2', '1', '修改活动信息', '0', '1522833061', '1522833061', '2', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1252', '2', '1', '修改活动信息', '0', '1522833082', '1522833082', '2', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1253', '2', '1', '修改活动信息', '0', '1522833093', '1522833093', '2', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1254', '2', '1', '修改活动信息', '0', '1522833101', '1522833101', '2', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1255', '2', '1', '修改活动信息', '0', '1522833909', '1522833909', '2', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1256', '2', '1', '修改活动信息', '0', '1522833918', '1522833918', '2', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1257', '2', '1', '修改活动信息', '0', '1522833936', '1522833936', '2', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1258', '2', '1', '修改活动信息', '0', '1522834912', '1522834912', '2', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1259', '2', '1', '修改活动信息', '0', '1522834949', '1522834949', '2', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1260', '2', '2', '用户登录', '0', '1523147570', '1523147570', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1261', '2', '24', '编辑客户信息', '0', '1523149486', '1523149486', '2', '6012002', 'etprs', '24', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1262', '2', '31', '编辑客户信息', '0', '1523149504', '1523149504', '2', '6012002', 'etprs', '31', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1263', '2', '2', '用户登录', '0', '1523164152', '1523164152', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1264', '2', '2', '用户登录', '0', '1523164208', '1523164208', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1265', '2', '2', '用户登录', '0', '1523164233', '1523164233', '2', '6012001', 'User', '0', '1', '', '', '192.168.0.119');
INSERT INTO `ibt_log` VALUES ('1266', '2', '30', '编辑客户信息', '0', '1523164784', '1523164784', '2', '6012002', 'etprs', '30', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1267', '2', '2', '用户登录', '0', '1523165101', '1523165101', '2', '6012001', 'User', '0', '1', '', '', '192.168.0.153');
INSERT INTO `ibt_log` VALUES ('1268', '2', '25', '编辑客户信息', '0', '1523169621', '1523169621', '2', '6012002', 'etprs', '25', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1269', '2', '25', '招商客户状态变化', '0', '1523169621', '1523169621', '2', '6012040', 'etprs', '25', '1', '6002003', '6002002', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1270', '2', '25', '入驻客户状态变化', '0', '1523169621', '1523169621', '2', '6012041', 'etprs', '25', '1', '6008002', '6008001', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1271', '2', '1', '修改活动信息', '0', '1523171916', '1523171916', '2', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1272', '2', '1', '修改活动信息', '0', '1523172143', '1523172143', '2', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1273', '2', '1', '修改活动信息', '0', '1523174340', '1523174340', '2', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1274', '2', '1', '修改活动信息', '0', '1523174352', '1523174352', '2', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1275', '2', '1', '修改活动信息', '0', '1523174554', '1523174554', '2', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1276', '2', '1', '修改活动信息', '0', '1523174562', '1523174562', '2', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1277', '2', '1', '修改活动信息', '0', '1523174582', '1523174582', '2', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1278', '2', '1', '修改活动信息', '0', '1523174607', '1523174607', '2', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1279', '2', '1', '修改活动信息', '0', '1523174637', '1523174637', '2', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1280', '2', '1', '修改活动信息', '0', '1523176017', '1523176017', '2', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1281', '2', '2', '用户登录', '0', '1523234384', '1523234384', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1282', '2', '1', '修改活动信息', '0', '1523235097', '1523235097', '2', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1283', '2', '25', '编辑客户信息', '0', '1523236170', '1523236170', '2', '6012002', 'etprs', '25', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1284', '3', '3', '用户登录', '0', '1523238746', '1523238746', '3', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1285', '3', '14', '活动报名', '0', '1523238823', '1523238823', '3', '6012029', 'activityApl', '3', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1286', '3', '15', '活动报名', '0', '1523238892', '1523238892', '3', '6012029', 'activityApl', '3', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1287', '3', '3', '用户登录', '0', '1523238906', '1523238906', '3', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1288', '3', '3', '用户登录', '0', '1523238917', '1523238917', '3', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1289', '3', '3', '用户登录', '0', '1523239070', '1523239070', '3', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1290', '3', '1', '修改活动信息', '0', '1523244800', '1523244800', '3', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1291', '3', '3', '用户登录', '0', '1523252438', '1523252438', '3', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1292', '3', '3', '用户登录', '0', '1523252454', '1523252454', '3', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1293', '3', '3', '用户登录', '0', '1523252456', '1523252456', '3', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1294', '3', '3', '用户登录', '0', '1523252464', '1523252464', '3', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1295', '3', '3', '用户登录', '0', '1523252467', '1523252467', '3', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1296', '3', '3', '用户登录', '0', '1523253056', '1523253056', '3', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1297', '3', '3', '用户登录', '0', '1523253082', '1523253082', '3', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1298', '3', '3', '用户登录', '0', '1523253270', '1523253270', '3', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1299', '2', '2', '用户登录', '0', '1523253641', '1523253641', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1300', '2', '1', '修改活动信息', '0', '1523254083', '1523254083', '2', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1301', '2', '3', '编辑入驻客户信息', '0', '1523254227', '1523254227', '2', '6012014', 'etprs', '3', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1302', '2', '3', '入驻客户状态变化', '0', '1523254227', '1523254227', '2', '6012041', 'etprs', '3', '1', '6008002', '6008003', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1303', '2', '3', '正式分配房间', '0', '1523254238', '1523254238', '2', '6012009', 'etprs', '3', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1304', '2', '3', '入驻客户状态变化', '0', '1523254238', '1523254238', '2', '6012041', 'etprs', '3', '1', '6008003', '6008004', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1307', '3', '3', '用户登录', '0', '1523254258', '1523254258', '3', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1308', '2', '2', '用户登录', '0', '1523254274', '1523254274', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1309', '3', '3', '用户登录', '0', '1523254289', '1523254289', '3', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1310', '2', '2', '用户登录', '0', '1523254558', '1523254558', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1311', '3', '3', '用户登录', '0', '1523254607', '1523254607', '3', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1312', '2', '2', '用户登录', '0', '1523254697', '1523254697', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1313', '2', '1', '修改活动信息', '0', '1523254898', '1523254898', '2', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1314', '3', '3', '用户登录', '0', '1523256686', '1523256686', '3', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1315', '2', '2', '用户登录', '0', '1523256783', '1523256783', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1316', '2', '2', '用户登录', '0', '1523256789', '1523256789', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1317', '2', '2', '用户登录', '0', '1523256813', '1523256813', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1318', '2', '6', '发布活动', '0', '1523259512', '1523259512', '2', '6012026', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1319', '57', '57', '用户登录', '0', '1523261665', '1523261665', '57', '6012001', 'User', '0', null, '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1320', null, '16', '添加空间', '0', '1523261711', '1523261711', '0', '6012015', 'incubator', '0', null, '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1321', '1', '1', '用户登录', '0', '1523261730', '1523261730', '1', '6012001', 'User', '0', '0', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1322', '1', '1', '用户登录', '0', '1523261733', '1523261733', '1', '6012001', 'User', '0', '0', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1323', '1', '1', '用户登录', '0', '1523261736', '1523261736', '1', '6012001', 'User', '0', '0', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1324', '1', '1', '用户登录', '0', '1523261745', '1523261745', '1', '6012001', 'User', '0', '0', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1325', '1', '1', '用户登录', '0', '1523261750', '1523261750', '1', '6012001', 'User', '0', '0', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1326', '1', '1', '用户登录', '0', '1523261819', '1523261819', '1', '6012001', 'User', '0', '0', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1327', '1', '1', '用户登录', '0', '1523261860', '1523261860', '1', '6012001', 'User', '0', '0', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1328', '1', '1', '用户登录', '0', '1523261866', '1523261866', '1', '6012001', 'User', '0', '0', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1329', '1', '1', '用户登录', '0', '1523262078', '1523262078', '1', '6012001', 'User', '0', '0', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1330', '2', '2', '用户登录', '0', '1523262381', '1523262381', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1331', '1', '1', '用户登录', '0', '1523262681', '1523262681', '1', '6012001', 'User', '0', '0', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1332', '57', '57', '用户登录', '0', '1523262874', '1523262874', '57', '6012001', 'User', '0', '16', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1333', null, '17', '添加空间', '0', '1523263594', '1523263594', '0', '6012015', 'incubator', '0', null, '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1334', '1', '1', '用户登录', '0', '1523263693', '1523263693', '1', '6012001', 'User', '0', '0', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1335', '59', '59', '用户登录', '0', '1523263721', '1523263721', '59', '6012001', 'User', '0', '17', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1336', '2', '2', '用户登录', '0', '1523263995', '1523263995', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1337', '59', '59', '用户登录', '0', '1523264040', '1523264040', '59', '6012001', 'User', '0', '17', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1338', '59', '59', '用户登录', '0', '1523264424', '1523264424', '59', '6012001', 'User', '0', '17', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1339', '59', '59', '用户登录', '0', '1523267259', '1523267259', '59', '6012001', 'User', '0', '17', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1340', '59', '59', '用户登录', '0', '1523267381', '1523267381', '59', '6012001', 'User', '0', '17', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1341', '59', '59', '用户登录', '0', '1523267415', '1523267415', '59', '6012001', 'User', '0', '17', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1342', '59', '59', '用户登录', '0', '1523267439', '1523267439', '59', '6012001', 'User', '0', '17', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1343', '59', '59', '用户登录', '0', '1523268059', '1523268059', '59', '6012001', 'User', '0', '17', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1344', '1', '1', '用户登录', '0', '1523268738', '1523268738', '1', '6012001', 'User', '0', '0', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1345', '1', '1', '用户登录', '0', '1523269547', '1523269547', '1', '6012001', 'User', '0', '0', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1346', '59', '59', '用户登录', '0', '1523270242', '1523270242', '59', '6012001', 'User', '0', '17', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1347', '59', '59', '用户登录', '0', '1523270269', '1523270269', '59', '6012001', 'User', '0', '17', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1348', '59', '59', '用户登录', '0', '1523270299', '1523270299', '59', '6012001', 'User', '0', '17', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1349', '59', '59', '用户登录', '0', '1523270334', '1523270334', '59', '6012001', 'User', '0', '17', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1350', '1', '1', '用户登录', '0', '1523321768', '1523321768', '1', '6012001', 'User', '0', '0', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1351', '2', '2', '用户登录', '0', '1523321784', '1523321784', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1352', '2', '1', '修改活动信息', '0', '1523321792', '1523321792', '2', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1353', '2', '7', '发布活动', '0', '1523321888', '1523321888', '2', '6012026', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1354', '1', '1', '用户登录', '0', '1523324373', '1523324373', '1', '6012001', 'User', '0', '0', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1355', '2', '2', '用户登录', '0', '1523324861', '1523324861', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1356', '2', '1', '修改空间信息', '0', '1523324967', '1523324967', '2', '6012016', 'incubator', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1357', '2', '1', '修改空间信息', '0', '1523324992', '1523324992', '2', '6012016', 'incubator', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1358', '2', '2', '用户登录', '0', '1523325855', '1523325855', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1359', '3', '3', '用户登录', '0', '1523325859', '1523325859', '3', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1360', '3', '16', '活动报名', '0', '1523325876', '1523325876', '3', '6012029', 'activityApl', '3', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1361', '3', '17', '活动报名', '0', '1523326034', '1523326034', '3', '6012029', 'activityApl', '3', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1362', '3', '3', '用户登录', '0', '1523326254', '1523326254', '3', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1363', '3', '3', '用户登录', '0', '1523326263', '1523326263', '3', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1364', '3', '18', '预定会议室', '0', '1523326330', '1523326330', '3', '6012035', 'mtroomApl', '3', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1365', '3', '18', '取消预定', '0', '1523326336', '1523326336', '3', '6012035', 'mtroomApl', '3', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1366', '3', '18', '取消预定', '0', '1523326370', '1523326370', '3', '6012035', 'mtroomApl', '3', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1367', '2', '2', '用户登录', '0', '1523330095', '1523330095', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1368', '2', '1', '修改空间信息', '0', '1523330749', '1523330749', '2', '6012016', 'incubator', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1369', '2', '2', '用户登录', '0', '1523331433', '1523331433', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1370', '2', '2', '用户登录', '0', '1523331439', '1523331439', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1371', '2', '2', '用户登录', '0', '1523331441', '1523331441', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1372', '2', '2', '用户登录', '0', '1523331444', '1523331444', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1373', '2', '2', '用户登录', '0', '1523331451', '1523331451', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1374', '2', '2', '用户登录', '0', '1523331453', '1523331453', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1375', '2', '2', '用户登录', '0', '1523331453', '1523331453', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1376', '2', '2', '用户登录', '0', '1523331455', '1523331455', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1377', '2', '2', '用户登录', '0', '1523331460', '1523331460', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1378', '2', '2', '用户登录', '0', '1523331464', '1523331464', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1379', '2', '2', '用户登录', '0', '1523331464', '1523331464', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1380', '2', '2', '用户登录', '0', '1523331464', '1523331464', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1381', '2', '2', '用户登录', '0', '1523331464', '1523331464', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1382', '2', '2', '用户登录', '0', '1523331465', '1523331465', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1383', '2', '2', '用户登录', '0', '1523331467', '1523331467', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1384', '2', '2', '用户登录', '0', '1523331467', '1523331467', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1385', '2', '2', '用户登录', '0', '1523331468', '1523331468', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1386', '2', '2', '用户登录', '0', '1523331468', '1523331468', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1387', '2', '2', '用户登录', '0', '1523331468', '1523331468', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1388', '2', '2', '用户登录', '0', '1523331470', '1523331470', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1389', '2', '2', '用户登录', '0', '1523331470', '1523331470', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1390', '2', '2', '用户登录', '0', '1523331470', '1523331470', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1391', '2', '2', '用户登录', '0', '1523331470', '1523331470', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1392', '2', '2', '用户登录', '0', '1523331471', '1523331471', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1393', '2', '2', '用户登录', '0', '1523331474', '1523331474', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1394', '2', '2', '用户登录', '0', '1523331475', '1523331475', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1395', '2', '2', '用户登录', '0', '1523331475', '1523331475', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1396', '2', '2', '用户登录', '0', '1523331475', '1523331475', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1397', '2', '2', '用户登录', '0', '1523331475', '1523331475', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1398', '2', '2', '用户登录', '0', '1523331475', '1523331475', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1399', '2', '2', '用户登录', '0', '1523331477', '1523331477', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1400', '2', '2', '用户登录', '0', '1523331477', '1523331477', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1401', '2', '2', '用户登录', '0', '1523331478', '1523331478', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1402', '2', '2', '用户登录', '0', '1523331478', '1523331478', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1403', '2', '2', '用户登录', '0', '1523331478', '1523331478', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1404', '2', '2', '用户登录', '0', '1523331643', '1523331643', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1405', '2', '2', '用户登录', '0', '1523331769', '1523331769', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1406', '2', '2', '用户登录', '0', '1523332555', '1523332555', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1407', '2', '2', '用户登录', '0', '1523336535', '1523336535', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1408', '2', '2', '用户登录', '0', '1523337776', '1523337776', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1409', '1', '1', '用户登录', '0', '1523339043', '1523339043', '1', '6012001', 'User', '0', '0', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1410', '1', '1', '用户登录', '0', '1523344541', '1523344541', '1', '6012001', 'User', '0', '0', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1411', '2', '2', '用户登录', '0', '1523346542', '1523346542', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1412', '2', '2', '用户登录', '0', '1523351939', '1523351939', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1413', '1', '1', '用户登录', '0', '1523351945', '1523351945', '1', '6012001', 'User', '0', '0', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1414', '1', '1', '用户登录', '0', '1523406906', '1523406906', '1', '6012001', 'User', '0', '0', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1415', '2', '2', '用户登录', '0', '1523407732', '1523407732', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1416', '1', '1', '用户登录', '0', '1523407967', '1523407967', '1', '6012001', 'User', '0', '0', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1417', '2', '2', '用户登录', '0', '1523412119', '1523412119', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1418', '2', '2', '用户登录', '0', '1523412128', '1523412128', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1419', '46', '46', '用户登录', '0', '1523412427', '1523412427', '46', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1420', '34', '34', '用户登录', '0', '1523412462', '1523412462', '34', '6012001', 'User', '0', '8', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1421', '2', '2', '用户登录', '0', '1523412549', '1523412549', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1422', '43', '43', '用户登录', '0', '1523413453', '1523413453', '43', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1423', '43', '26', '跟进客户', '0', '1523413484', '1523413484', '43', '6012003', 'flow', '30', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1424', '43', '30', '招商客户状态变化', '0', '1523413484', '1523413484', '43', '6012040', 'etprs', '30', '1', '6002003', '6002002', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1425', '43', '30', '入驻客户状态变化', '0', '1523413484', '1523413484', '43', '6012041', 'etprs', '30', '1', '6008002', '6008001', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1426', '3', '3', '用户登录', '0', '1523414308', '1523414308', '3', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1427', '3', '3', '用户登录', '0', '1523414417', '1523414417', '3', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1428', '3', '3', '用户登录', '0', '1523414449', '1523414449', '3', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1429', '3', '3', '用户登录', '0', '1523414488', '1523414488', '3', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1430', '3', '3', '用户登录', '0', '1523414543', '1523414543', '3', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1431', '3', '3', '用户登录', '0', '1523414574', '1523414574', '3', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1432', '3', '3', '用户登录', '0', '1523414738', '1523414738', '3', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1433', '3', '3', '用户登录', '0', '1523422098', '1523422098', '3', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1434', '3', '3', '用户登录', '0', '1523422847', '1523422847', '3', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1435', '3', '3', '用户登录', '0', '1523422967', '1523422967', '3', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1436', '2', '2', '用户登录', '0', '1523427218', '1523427218', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1437', '2', '2', '用户登录', '0', '1523427404', '1523427404', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1438', '2', '25', '编辑客户信息', '0', '1523432587', '1523432587', '2', '6012002', 'etprs', '25', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1439', '3', '3', '用户登录', '0', '1523434273', '1523434273', '3', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1440', null, '25', '编辑客户信息', '0', '1523434707', '1523434707', '0', '6012002', 'etprs', '25', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1441', null, '25', '招商客户状态变化', '0', '1523434707', '1523434707', '0', '6012040', 'etprs', '25', '1', '6002002', '6002003', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1442', null, '25', '入驻客户状态变化', '0', '1523434707', '1523434707', '0', '6012041', 'etprs', '25', '1', '6008001', '6008002', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1443', '3', '3', '用户登录', '0', '1523493679', '1523493679', '3', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1444', '2', '2', '用户登录', '0', '1523503184', '1523503184', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1445', '2', '27', '跟进客户', '0', '1523517229', '1523517229', '2', '6012003', 'flow', '30', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1446', '2', '28', '跟进客户', '0', '1523517290', '1523517290', '2', '6012003', 'flow', '30', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1447', '2', '29', '跟进客户', '0', '1523517423', '1523517423', '2', '6012003', 'flow', '30', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1448', '2', '30', '招商客户状态变化', '0', '1523517423', '1523517423', '2', '6012040', 'etprs', '30', '1', '6002002', '6002004', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1449', '2', '30', '跟进客户', '0', '1523517932', '1523517932', '2', '6012003', 'flow', '35', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1450', '2', '7', '修改活动信息', '0', '1523517965', '1523517965', '2', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1451', '2', '7', '修改活动信息', '0', '1523517975', '1523517975', '2', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1452', '2', '8', '发布活动', '0', '1523522853', '1523522853', '2', '6012026', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1453', '2', '9', '发布活动', '0', '1523522883', '1523522883', '2', '6012026', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1454', '2', '10', '发布活动', '0', '1523522957', '1523522957', '2', '6012026', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1455', '2', '11', '发布活动', '0', '1523522977', '1523522977', '2', '6012026', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1456', '2', '12', '发布活动', '0', '1523522984', '1523522984', '2', '6012026', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1457', '2', '7', '修改活动信息', '0', '1523523242', '1523523242', '2', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1458', '2', '7', '修改活动信息', '0', '1523523377', '1523523377', '2', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1459', '2', '7', '修改活动信息', '0', '1523523399', '1523523399', '2', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1460', '2', '7', '修改活动信息', '0', '1523523451', '1523523451', '2', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1461', '2', '7', '修改活动信息', '0', '1523523610', '1523523610', '2', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1462', '2', '1', '修改活动信息', '0', '1523523616', '1523523616', '2', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1463', '2', '1', '修改活动信息', '0', '1523523678', '1523523678', '2', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1464', '2', '7', '修改活动信息', '0', '1523523801', '1523523801', '2', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1465', '2', '1', '修改活动信息', '0', '1523523857', '1523523857', '2', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1466', '2', '1', '修改活动信息', '0', '1523523901', '1523523901', '2', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1467', '2', '1', '修改活动信息', '0', '1523523976', '1523523976', '2', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1468', '2', '1', '修改活动信息', '0', '1523524772', '1523524772', '2', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1469', '2', '1', '报名审核通过', '0', '1523526566', '1523526566', '2', '6012031', 'activityApl', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1470', '2', '4', '报名审核通过', '0', '1523526610', '1523526610', '2', '6012031', 'activityApl', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1471', '2', '14', '报名审核拒绝', '0', '1523526614', '1523526614', '2', '6012032', 'activityApl', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1472', '2', '15', '报名审核通过', '0', '1523526618', '1523526618', '2', '6012031', 'activityApl', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1473', '2', '7', '修改活动信息', '0', '1523526786', '1523526786', '2', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1474', '2', '16', '报名审核通过', '0', '1523526797', '1523526797', '2', '6012031', 'activityApl', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1475', '2', '17', '报名审核通过', '0', '1523526801', '1523526801', '2', '6012031', 'activityApl', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1476', '1', '1', '用户登录', '0', '1523528671', '1523528671', '1', '6012001', 'User', '0', '0', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1477', '3', '18', '活动报名', '0', '1523583610', '1523583610', '3', '6012029', 'activityApl', '3', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1478', '3', '19', '活动报名', '0', '1523583671', '1523583671', '3', '6012029', 'activityApl', '3', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1479', '2', '2', '用户登录', '0', '1523586648', '1523586648', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1480', '2', '16', '客户毕业', '0', '1523587206', '1523587206', '2', '6012012', 'etprs', '16', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1481', '2', '16', '入驻客户状态变化', '0', '1523587206', '1523587206', '2', '6012041', 'etprs', '16', '1', '6008005', '6008006', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1482', '2', '23', '客户毕业', '0', '1523587266', '1523587266', '2', '6012012', 'etprs', '23', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1483', '2', '23', '入驻客户状态变化', '0', '1523587266', '1523587266', '2', '6012041', 'etprs', '23', '1', '6008005', '6008006', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1484', '2', '21', '客户毕业', '0', '1523587292', '1523587292', '2', '6012012', 'etprs', '21', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1485', '2', '21', '入驻客户状态变化', '0', '1523587292', '1523587292', '2', '6012041', 'etprs', '21', '1', '6008005', '6008006', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1486', '2', '11', '企业续约', '0', '1523589441', '1523589441', '2', '6012011', 'etprs', '11', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1487', '2', '11', '企业续约', '0', '1523589515', '1523589515', '2', '6012011', 'etprs', '11', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1488', '3', '20', '活动报名', '0', '1523590643', '1523590643', '3', '6012029', 'activityApl', '3', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1489', '2', '2', '用户登录', '0', '1523598699', '1523598699', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1490', '2', '20', '报名审核拒绝', '0', '1523598713', '1523598713', '2', '6012032', 'activityApl', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1491', '2', '7', '修改活动信息', '0', '1523600104', '1523600104', '2', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1492', '2', '7', '修改活动信息', '0', '1523600115', '1523600115', '2', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1493', '3', '21', '活动报名', '0', '1523600660', '1523600660', '3', '6012029', 'activityApl', '3', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1494', '3', '21', '取消报名', '0', '1523601715', '1523601715', '3', '6012030', 'activityApl', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1495', '3', '22', '活动报名', '0', '1523601761', '1523601761', '3', '6012029', 'activityApl', '3', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1496', '3', '22', '取消报名', '0', '1523601767', '1523601767', '3', '6012030', 'activityApl', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1497', '2', '2', '用户登录', '0', '1523603014', '1523603014', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1498', '3', '19', '编辑会议室信息', '0', '1523667900', '1523667900', '3', '6012039', 'mtroom', '3', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1499', '3', '19', '编辑会议室信息', '0', '1523667926', '1523667926', '3', '6012039', 'mtroom', '3', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1500', '3', '19', '编辑会议室信息', '0', '1523668066', '1523668066', '3', '6012039', 'mtroom', '3', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1501', '3', '19', '编辑会议室信息', '0', '1523668082', '1523668082', '3', '6012039', 'mtroom', '3', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1502', '3', '19', '编辑会议室信息', '0', '1523668717', '1523668717', '3', '6012039', 'mtroom', '3', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1503', '3', '19', '编辑会议室信息', '0', '1523668818', '1523668818', '3', '6012039', 'mtroom', '3', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1504', '2', '17', '会议室审核通过', '0', '1523670348', '1523670348', '2', '6012036', 'mtroomApl', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1505', '2', '17', '会议室审核拒绝', '0', '1523670357', '1523670357', '2', '6012037', 'mtroomApl', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1506', '2', '16', '会议室审核通过', '0', '1523671056', '1523671056', '2', '6012036', 'mtroomApl', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1507', '2', '13', '编辑会议室信息', '0', '1523674238', '1523674238', '2', '6012039', 'mtroom', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1508', '2', '20', '新增会议室', '0', '1523675225', '1523675225', '2', '6012033', 'mtroom', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1509', '2', '21', '新增会议室', '0', '1523675343', '1523675343', '2', '6012033', 'mtroom', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1510', '2', '21', '编辑会议室信息', '0', '1523675398', '1523675398', '2', '6012039', 'mtroom', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1511', '2', '21', '编辑会议室信息', '0', '1523675492', '1523675492', '2', '6012039', 'mtroom', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1512', '2', '19', '预定会议室', '0', '1523687718', '1523687718', '2', '6012035', 'mtroomApl', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1513', '2', '20', '预定会议室', '0', '1523687789', '1523687789', '2', '6012035', 'mtroomApl', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1514', '2', '21', '预定会议室', '0', '1523687878', '1523687878', '2', '6012035', 'mtroomApl', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1515', '3', '3', '用户登录', '0', '1523697936', '1523697936', '3', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1516', '3', '3', '用户登录', '0', '1523842605', '1523842605', '3', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1517', '3', '3', '编辑客户信息', '0', '1523843555', '1523843555', '3', '6012002', 'etprs', '3', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1518', '3', '3', '编辑客户信息', '0', '1523844107', '1523844107', '3', '6012002', 'etprs', '3', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1519', '3', '3', '编辑客户信息', '0', '1523844124', '1523844124', '3', '6012002', 'etprs', '3', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1520', '3', '3', '编辑客户信息', '0', '1523844131', '1523844131', '3', '6012002', 'etprs', '3', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1521', '3', '3', '编辑客户信息', '0', '1523844319', '1523844319', '3', '6012002', 'etprs', '3', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1522', '3', '3', '编辑客户信息', '0', '1523844332', '1523844332', '3', '6012002', 'etprs', '3', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1523', '3', '3', '编辑客户信息', '0', '1523844344', '1523844344', '3', '6012002', 'etprs', '3', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1524', '3', '3', '编辑客户信息', '0', '1523844364', '1523844364', '3', '6012002', 'etprs', '3', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1525', '3', '3', '编辑客户信息', '0', '1523844366', '1523844366', '3', '6012002', 'etprs', '3', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1526', '3', '3', '编辑客户信息', '0', '1523844399', '1523844399', '3', '6012002', 'etprs', '3', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1527', '3', '3', '编辑客户信息', '0', '1523844415', '1523844415', '3', '6012002', 'etprs', '3', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1528', '2', '2', '用户登录', '0', '1523848388', '1523848388', '2', '6012001', 'User', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1529', '2', '20', '会议室审核通过', '0', '1523858626', '1523858626', '2', '6012036', 'mtroomApl', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1530', '2', '8', '修改活动信息', '0', '1523863405', '1523863405', '2', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1531', '2', '6', '活动总结', '0', '1523871493', '1523871493', '2', '6012042', 'activity', '6', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1532', null, '8', '修改活动信息', '0', '1523873782', '1523873782', '0', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1533', null, '8', '修改活动信息', '0', '1523874259', '1523874259', '0', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1534', '2', '21', '会议室审核通过', '0', '1523929465', '1523929465', '2', '6012036', 'mtroomApl', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1535', '2', '19', '会议室审核通过', '0', '1523929518', '1523929518', '2', '6012036', 'mtroomApl', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1536', '1', '1', '用户登录', '0', '1523931540', '1523931540', '1', '6012001', 'User', '0', '0', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1537', '2', '8', '修改活动信息', '0', '1523947030', '1523947030', '2', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1538', '2', '8', '修改活动信息', '0', '1523947036', '1523947036', '2', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1539', '2', '8', '修改活动信息', '0', '1523947043', '1523947043', '2', '6012028', 'activity', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1540', '2', '1', '修改空间信息', '0', '1523956485', '1523956485', '2', '6012016', 'incubator', '0', '1', '', '', '127.0.0.1');
INSERT INTO `ibt_log` VALUES ('1541', '2', '2', '用户登录', '0', '1523959613', '1523959613', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1542', '3', '3', '用户登录', '0', '1524011086', '1524011086', '3', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1543', '2', '2', '用户登录', '0', '1524011105', '1524011105', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1544', '2', '2', '用户登录', '0', '1524011456', '1524011456', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1545', '1', '1', '用户登录', '0', '1524012954', '1524012954', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1546', null, '18', '添加空间', '0', '1524014708', '1524014708', '0', '6012015', 'incubator', '0', null, '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1547', '1', '1', '用户登录', '0', '1524014854', '1524014854', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1548', '2', '2', '用户登录', '0', '1524029274', '1524029274', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1549', '2', '2', '用户登录', '0', '1524037694', '1524037694', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1550', '2', '2', '用户登录', '0', '1524038109', '1524038109', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1551', '2', '2', '用户登录', '0', '1524039830', '1524039830', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1552', null, '38', '收藏成功', '0', '1524045290', '1524045290', '0', '6012034', 'MtroomColect', null, null, '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1553', '2', '2', '用户登录', '0', '1524098180', '1524098180', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1554', '2', '2', '用户登录', '0', '1524099617', '1524099617', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1555', '2', '31', '跟进客户', '0', '1524102454', '1524102454', '2', '6012003', 'flow', '20', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1556', '2', '20', '招商客户状态变化', '0', '1524102454', '1524102454', '2', '6012040', 'etprs', '20', '1', '6002004', '6002003', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1557', '2', '20', '入驻客户状态变化', '0', '1524102454', '1524102454', '2', '6012041', 'etprs', '20', '1', '6008001', '6008002', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1558', '2', '20', '编辑入驻客户信息', '0', '1524102485', '1524102485', '2', '6012014', 'etprs', '20', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1559', '2', '20', '入驻客户状态变化', '0', '1524102485', '1524102485', '2', '6012041', 'etprs', '20', '1', '6008002', '6008003', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1560', '2', '28', '正式分配房间', '0', '1524103713', '1524103713', '2', '6012009', 'etprs', '28', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1561', '2', '28', '入驻客户状态变化', '0', '1524103713', '1524103713', '2', '6012041', 'etprs', '28', '1', '6008003', '6008004', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1562', '2', '32', '跟进客户', '0', '1524104190', '1524104190', '2', '6012003', 'flow', '25', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1563', '2', '25', '招商客户状态变化', '0', '1524104190', '1524104190', '2', '6012040', 'etprs', '25', '1', '6002003', '6002002', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1564', '2', '25', '入驻客户状态变化', '0', '1524104190', '1524104190', '2', '6012041', 'etprs', '25', '1', '6008002', '6008001', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1565', '2', '33', '跟进客户', '0', '1524104211', '1524104211', '2', '6012003', 'flow', '25', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1566', '2', '25', '招商客户状态变化', '0', '1524104211', '1524104211', '2', '6012040', 'etprs', '25', '1', '6002002', '6002003', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1567', '2', '25', '入驻客户状态变化', '0', '1524104211', '1524104211', '2', '6012041', 'etprs', '25', '1', '6008001', '6008002', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1568', '2', '2', '用户登录', '0', '1524115787', '1524115787', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1569', '2', '2', '用户登录', '0', '1524118155', '1524118155', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1570', '2', '2', '用户登录', '0', '1524126129', '1524126129', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1571', '2', '2', '用户登录', '0', '1524131077', '1524131077', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1572', '2', '2', '用户登录', '0', '1524131320', '1524131320', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1573', '2', '2', '用户登录', '0', '1524185232', '1524185232', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1574', '2', '2', '用户登录', '0', '1524189539', '1524189539', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1575', '2', '34', '编辑入驻客户信息', '0', '1524190161', '1524190161', '2', '6012014', 'etprs', '34', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1576', '2', '34', '入驻客户状态变化', '0', '1524190161', '1524190161', '2', '6012041', 'etprs', '34', '1', '6008002', '6008003', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1577', '3', '3', '用户登录', '0', '1524192230', '1524192230', '3', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1578', '2', '2', '用户登录', '0', '1524204410', '1524204410', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1579', '2', '2', '用户登录', '0', '1524214545', '1524214545', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1580', '2', '2', '用户登录', '0', '1524217660', '1524217660', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1581', '2', '2', '用户登录', '0', '1524444830', '1524444830', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1582', '3', '3', '用户登录', '0', '1524445391', '1524445391', '3', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1583', '3', '3', '用户登录', '0', '1524445938', '1524445938', '3', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1584', '3', '3', '用户登录', '0', '1524446312', '1524446312', '3', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1585', '2', '2', '用户登录', '0', '1524446325', '1524446325', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1586', '1', '1', '用户登录', '0', '1524446338', '1524446338', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1587', '1', '1', '用户登录', '0', '1524446398', '1524446398', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1588', '2', '2', '用户登录', '0', '1524447448', '1524447448', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1589', '2', '39', '收藏成功', '0', '1524448292', '1524448292', '2', '6012034', 'MtroomColect', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1590', '2', '1', '取消收藏', '0', '1524448295', '1524448295', '2', '6012034', 'MtroomColect', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1591', '2', '40', '收藏成功', '0', '1524448319', '1524448319', '2', '6012034', 'MtroomColect', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1592', '3', '3', '用户登录', '0', '1524448412', '1524448412', '3', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1593', '2', '2', '用户登录', '0', '1524448729', '1524448729', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1594', '1', '1', '用户登录', '0', '1524449760', '1524449760', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1595', '2', '2', '用户登录', '0', '1524454047', '1524454047', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1596', '2', '34', '正式分配房间', '0', '1524454131', '1524454131', '2', '6012009', 'etprs', '34', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1597', '2', '34', '入驻客户状态变化', '0', '1524454131', '1524454131', '2', '6012041', 'etprs', '34', '1', '6008003', '6008004', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1600', '1', '1', '用户登录', '0', '1524454537', '1524454537', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1601', '3', '3', '用户登录', '0', '1524454723', '1524454723', '3', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1602', '2', '2', '用户登录', '0', '1524462535', '1524462535', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1603', '2', '2', '用户登录', '0', '1524466096', '1524466096', '2', '6012001', 'User', '0', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('1604', '2', '2', '用户登录', '0', '1524467008', '1524467008', '2', '6012001', 'User', '0', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('1605', '2', '38', '新增客户', '0', '1524467142', '1524467142', '2', '6012006', 'etprs', '38', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('1606', '2', '38', '招商客户状态变化', '0', '1524467142', '1524467142', '2', '6012040', 'etprs', '38', '1', '0', '6002001', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('1607', '2', '38', '入驻客户状态变化', '0', '1524467142', '1524467142', '2', '6012041', 'etprs', '38', '1', '0', '6008001', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('1608', '2', '0', '导出客户', '0', '1524467179', '1524467179', '2', '6012004', 'etprs', '0', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('1609', null, '0', '导出客户', '0', '1524467239', '1524467239', '0', '6012004', 'etprs', '0', '1', '', '', '101.226.102.237');
INSERT INTO `ibt_log` VALUES ('1610', '2', '34', '跟进客户', '0', '1524467267', '1524467267', '2', '6012003', 'flow', '38', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('1611', '2', '38', '招商客户状态变化', '0', '1524467267', '1524467267', '2', '6012040', 'etprs', '38', '1', '6002001', '6002003', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('1612', '2', '38', '入驻客户状态变化', '0', '1524467267', '1524467267', '2', '6012041', 'etprs', '38', '1', '6008001', '6008002', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('1613', '2', '38', '编辑入驻客户信息', '0', '1524467362', '1524467362', '2', '6012014', 'etprs', '38', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('1614', '2', '38', '入驻客户状态变化', '0', '1524467362', '1524467362', '2', '6012041', 'etprs', '38', '1', '6008002', '6008003', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('1615', '2', '38', '正式分配房间', '0', '1524467473', '1524467473', '2', '6012009', 'etprs', '38', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('1616', '2', '38', '入驻客户状态变化', '0', '1524467473', '1524467473', '2', '6012041', 'etprs', '38', '1', '6008003', '6008004', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('1625', '3', '3', '用户登录', '0', '1524467679', '1524467679', '3', '6012001', 'User', '0', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('1626', '1', '1', '用户登录', '0', '1524467800', '1524467800', '1', '6012001', 'User', '0', '0', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('1627', '2', '2', '用户登录', '0', '1524467879', '1524467879', '2', '6012001', 'User', '0', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('1628', '2', '2', '用户登录', '0', '1524468848', '1524468848', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1629', '2', '2', '用户登录', '0', '1524468859', '1524468859', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1630', '1', '1', '用户登录', '0', '1524469190', '1524469190', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1631', '1', '1', '用户登录', '0', '1524470347', '1524470347', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1632', '3', '3', '用户登录', '0', '1524472310', '1524472310', '3', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1633', '2', '2', '用户登录', '0', '1524472398', '1524472398', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1634', '2', '2', '用户登录', '0', '1524473302', '1524473302', '2', '6012001', 'User', '0', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('1635', '2', '9', '发布活动', '0', '1524473583', '1524473583', '2', '6012026', 'activity', '0', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('1636', '1', '1', '用户登录', '0', '1524473616', '1524473616', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1637', '2', '2', '用户登录', '0', '1524473967', '1524473967', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1638', '2', '4', '活动总结', '0', '1524473975', '1524473975', '2', '6012042', 'activity', '4', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1639', '2', '2', '用户登录', '0', '1524474302', '1524474302', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1640', '2', '6', '活动总结', '0', '1524474346', '1524474346', '2', '6012042', 'activity', '6', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1641', '2', '2', '用户登录', '0', '1524474416', '1524474416', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1642', '3', '3', '用户登录', '0', '1524474745', '1524474745', '3', '6012001', 'User', '0', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('1643', '3', '3', '用户登录', '0', '1524474752', '1524474752', '3', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1644', '1', '1', '用户登录', '0', '1524474755', '1524474755', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1645', '2', '2', '用户登录', '0', '1524475960', '1524475960', '2', '6012001', 'User', '0', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('1646', '2', '2', '用户登录', '0', '1524476068', '1524476068', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1647', '2', '2', '用户登录', '0', '1524477626', '1524477626', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1648', '2', '2', '用户登录', '0', '1524477828', '1524477828', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1649', '1', '1', '用户登录', '0', '1524478504', '1524478504', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1650', '3', '3', '用户登录', '0', '1524478673', '1524478673', '3', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1651', '2', '2', '用户登录', '0', '1524530712', '1524530712', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1652', '1', '1', '用户登录', '0', '1524530720', '1524530720', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1653', '2', '2', '用户登录', '0', '1524530754', '1524530754', '2', '6012001', 'User', '0', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('1654', '2', '2', '用户登录', '0', '1524533253', '1524533253', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1655', '1', '1', '用户登录', '0', '1524533493', '1524533493', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1656', '3', '3', '用户登录', '0', '1524535670', '1524535670', '3', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1664', '2', '2', '用户登录', '0', '1524535770', '1524535770', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1665', '2', '10', '发布活动', '0', '1524535825', '1524535825', '2', '6012026', 'activity', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1666', '2', '6', '活动总结', '0', '1524536046', '1524536046', '2', '6012042', 'activity', '6', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1667', '39', '39', '用户登录', '0', '1524537588', '1524537588', '39', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1668', '3', '3', '用户登录', '0', '1524537634', '1524537634', '3', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1669', '1', '1', '用户登录', '0', '1524537830', '1524537830', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1670', '3', '3', '用户登录', '0', '1524537953', '1524537953', '3', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1696', '3', '48', '活动报名', '0', '1524538448', '1524538448', '3', '6012029', 'activityApl', '3', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1697', '3', '48', '取消报名', '0', '1524538775', '1524538775', '3', '6012030', 'activityApl', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1698', '3', '49', '活动报名', '0', '1524538779', '1524538779', '3', '6012029', 'activityApl', '3', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1699', '3', '49', '取消报名', '0', '1524538790', '1524538790', '3', '6012030', 'activityApl', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1700', '3', '50', '活动报名', '0', '1524538792', '1524538792', '3', '6012029', 'activityApl', '3', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1701', '3', '29', '预定会议室', '0', '1524538830', '1524538830', '3', '6012035', 'mtroomApl', '3', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1702', '3', '59', '会议室申请消息', '0', '1524538830', '1524538830', '3', '6012046', 'msg', '3', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1703', '1', '1', '用户登录', '0', '1524538844', '1524538844', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1704', '2', '2', '用户登录', '0', '1524538854', '1524538854', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1705', '3', '3', '用户登录', '0', '1524538866', '1524538866', '3', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1706', '1', '1', '用户登录', '0', '1524538991', '1524538991', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1707', '2', '2', '用户登录', '0', '1524539562', '1524539562', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1708', '1', '1', '用户登录', '0', '1524539660', '1524539660', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1709', '2', '2', '用户登录', '0', '1524540000', '1524540000', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1710', '2', '2', '用户登录', '0', '1524540152', '1524540152', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1711', '3', '3', '用户登录', '0', '1524540457', '1524540457', '3', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1712', '3', '3', '用户登录', '0', '1524540701', '1524540701', '3', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1713', '3', '50', '取消报名', '0', '1524540708', '1524540708', '3', '6012030', 'activityApl', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1714', '3', '51', '活动报名', '0', '1524540718', '1524540718', '3', '6012029', 'activityApl', '3', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1715', '2', '2', '用户登录', '0', '1524540725', '1524540725', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1716', '34', '34', '用户登录', '0', '1524541050', '1524541050', '34', '6012001', 'User', '0', '8', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1717', '2', '2', '用户登录', '0', '1524541088', '1524541088', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1718', '2', '2', '用户登录', '0', '1524541865', '1524541865', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1719', '1', '1', '用户登录', '0', '1524546454', '1524546454', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1720', '1', '1', '用户登录', '0', '1524546474', '1524546474', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1721', '2', '2', '用户登录', '0', '1524546526', '1524546526', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1722', '3', '3', '用户登录', '0', '1524546551', '1524546551', '3', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1723', '2', '2', '用户登录', '0', '1524546678', '1524546678', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1724', '1', '1', '用户登录', '0', '1524546718', '1524546718', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1725', '2', '2', '用户登录', '0', '1524546724', '1524546724', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1726', '2', '2', '用户登录', '0', '1524546749', '1524546749', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1727', '1', '1', '用户登录', '0', '1524546865', '1524546865', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1728', '3', '3', '用户登录', '0', '1524546891', '1524546891', '3', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1729', '35', '35', '用户登录', '0', '1524547000', '1524547000', '35', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1730', '2', '2', '用户登录', '0', '1524547024', '1524547024', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1731', '43', '43', '用户登录', '0', '1524547044', '1524547044', '43', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1732', '3', '3', '用户登录', '0', '1524547073', '1524547073', '3', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1733', '2', '2', '用户登录', '0', '1524547074', '1524547074', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1734', '3', '3', '用户登录', '0', '1524547111', '1524547111', '3', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1735', '2', '2', '用户登录', '0', '1524547117', '1524547117', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1736', '1', '1', '用户登录', '0', '1524547138', '1524547138', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1737', '3', '3', '用户登录', '0', '1524547176', '1524547176', '3', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1738', '1', '1', '用户登录', '0', '1524547236', '1524547236', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1739', '2', '2', '用户登录', '0', '1524547264', '1524547264', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1740', '3', '3', '用户登录', '0', '1524547444', '1524547444', '3', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1741', '3', '3', '用户登录', '0', '1524547470', '1524547470', '3', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1742', '3', '3', '用户登录', '0', '1524547499', '1524547499', '3', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1743', '2', '2', '用户登录', '0', '1524547509', '1524547509', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1744', '3', '3', '用户登录', '0', '1524547516', '1524547516', '3', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1745', '3', '3', '用户登录', '0', '1524548055', '1524548055', '3', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1746', '3', '3', '用户登录', '0', '1524548078', '1524548078', '3', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1747', '2', '2', '用户登录', '0', '1524548113', '1524548113', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1748', '2', '61', '报名审核拒绝', '0', '1524548144', '1524548144', '2', '6012032', 'activityApl', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1749', '1', '1', '用户登录', '0', '1524548146', '1524548146', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1750', '2', '2', '用户登录', '0', '1524548158', '1524548158', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1751', '2', '2', '用户登录', '0', '1524548169', '1524548169', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1752', '2', '62', '报名审核拒绝', '0', '1524548286', '1524548286', '2', '6012032', 'activityApl', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1753', '2', '63', '报名审核拒绝', '0', '1524548352', '1524548352', '2', '6012032', 'activityApl', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1754', '2', '64', '报名审核通过', '0', '1524548354', '1524548354', '2', '6012031', 'activityApl', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1755', '2', '2', '用户登录', '0', '1524548379', '1524548379', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1756', '3', '3', '用户登录', '0', '1524548442', '1524548442', '3', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1757', '2', '2', '用户登录', '0', '1524548455', '1524548455', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1758', '2', '2', '用户登录', '0', '1524548885', '1524548885', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1759', '2', '6', '活动总结', '0', '1524548920', '1524548920', '2', '6012042', 'activity', '6', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1760', '1', '1', '用户登录', '0', '1524549140', '1524549140', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1761', '2', '2', '用户登录', '0', '1524549170', '1524549170', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1762', '3', '3', '用户登录', '0', '1524549182', '1524549182', '3', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1763', '1', '1', '用户登录', '0', '1524549240', '1524549240', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1764', '3', '3', '用户登录', '0', '1524549293', '1524549293', '3', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1765', '2', '2', '用户登录', '0', '1524549341', '1524549341', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1766', '3', '3', '用户登录', '0', '1524549408', '1524549408', '3', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1767', '2', '2', '用户登录', '0', '1524549500', '1524549500', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1768', '2', '2', '用户登录', '0', '1524549803', '1524549803', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1769', '2', '2', '用户登录', '0', '1524549905', '1524549905', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1770', '3', '3', '用户登录', '0', '1524549973', '1524549973', '3', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1771', '1', '1', '用户登录', '0', '1524549984', '1524549984', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1772', '2', '2', '用户登录', '0', '1524550056', '1524550056', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1773', '2', '2', '用户登录', '0', '1524550723', '1524550723', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1774', '2', '2', '用户登录', '0', '1524552220', '1524552220', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1775', '1', '1', '用户登录', '0', '1524552256', '1524552256', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1776', '2', '2', '用户登录', '0', '1524552320', '1524552320', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1777', '2', '2', '用户登录', '0', '1524552449', '1524552449', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1778', '2', '2', '用户登录', '0', '1524552562', '1524552562', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1779', '1', '1', '用户登录', '0', '1524553019', '1524553019', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1780', '3', '3', '用户登录', '0', '1524553330', '1524553330', '3', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1781', '3', '3', '用户登录', '0', '1524553742', '1524553742', '3', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1782', '2', '2', '用户登录', '0', '1524553922', '1524553922', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1783', '3', '3', '用户登录', '0', '1524553967', '1524553967', '3', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1784', '3', '3', '用户登录', '0', '1524554040', '1524554040', '3', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1785', '2', '2', '用户登录', '0', '1524554232', '1524554232', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1786', '1', '1', '用户登录', '0', '1524554319', '1524554319', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1787', '2', '29', '会议室审核通过', '0', '1524554911', '1524554911', '2', '6012036', 'mtroomApl', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1788', '2', '10', '会议室申请审核结果消息', '0', '1524554911', '1524554911', '2', '6012051', 'msg', '2', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1789', '3', '3', '用户登录', '0', '1524556875', '1524556875', '3', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1790', '2', '2', '用户登录', '0', '1524557226', '1524557226', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1791', '1', '1', '用户登录', '0', '1524558615', '1524558615', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1792', '2', '2', '用户登录', '0', '1524558686', '1524558686', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1793', '1', '1', '用户登录', '0', '1524559200', '1524559200', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1794', '2', '2', '用户登录', '0', '1524559241', '1524559241', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1795', '1', '1', '用户登录', '0', '1524559438', '1524559438', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1796', '3', '3', '用户登录', '0', '1524559460', '1524559460', '3', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1797', '3', '3', '用户登录', '0', '1524559481', '1524559481', '3', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1798', '2', '2', '用户登录', '0', '1524559529', '1524559529', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1799', '3', '3', '用户登录', '0', '1524559602', '1524559602', '3', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1800', '2', '2', '用户登录', '0', '1524559656', '1524559656', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1801', '3', '3', '用户登录', '0', '1524561242', '1524561242', '3', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1802', '2', '2', '用户登录', '0', '1524561527', '1524561527', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1803', '2', '2', '用户登录', '0', '1524561535', '1524561535', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1804', '3', '3', '用户登录', '0', '1524561558', '1524561558', '3', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1805', '2', '2', '用户登录', '0', '1524561685', '1524561685', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1806', '2', '2', '用户登录', '0', '1524562754', '1524562754', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1807', '3', '3', '用户登录', '0', '1524562958', '1524562958', '3', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1808', '2', '2', '用户登录', '0', '1524562967', '1524562967', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1809', '2', '2', '用户登录', '0', '1524618020', '1524618020', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1810', '1', '1', '用户登录', '0', '1524618046', '1524618046', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1811', '2', '2', '用户登录', '0', '1524618109', '1524618109', '2', '6012001', 'User', '0', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('1812', '2', '2', '用户登录', '0', '1524618152', '1524618152', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1813', '2', '2', '用户登录', '0', '1524618481', '1524618481', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1814', '1', '1', '用户登录', '0', '1524618484', '1524618484', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1815', '1', '1', '用户登录', '0', '1524618569', '1524618569', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1816', '2', '2', '用户登录', '0', '1524618586', '1524618586', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1817', null, '0', '用户获取短信18562712360', '0', '1524619463', '1524619463', '0', '6000000', 'smsLog', '1', null, '0', '6445', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1818', '2', '2', '用户登录', '0', '1524619602', '1524619602', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1819', '2', '45', '冻结/解冻用户', '0', '1524619846', '1524619846', '2', '6012025', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1820', '2', '42', '冻结/解冻用户', '0', '1524619853', '1524619853', '2', '6012025', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1821', '2', '46', '冻结/解冻用户', '0', '1524619861', '1524619861', '2', '6012025', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1822', '2', '44', '冻结/解冻用户', '0', '1524619869', '1524619869', '2', '6012025', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1823', '2', '50', '冻结/解冻用户', '0', '1524619883', '1524619883', '2', '6012025', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1824', '2', '43', '冻结/解冻用户', '0', '1524619887', '1524619887', '2', '6012025', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1825', '2', '23', '冻结/解冻用户', '0', '1524619938', '1524619938', '2', '6012025', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1826', '2', '23', '冻结/解冻用户', '0', '1524619938', '1524619938', '2', '6012025', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1827', '3', '3', '用户登录', '0', '1524620101', '1524620101', '3', '6012001', 'User', '0', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('1828', '2', '2', '用户登录', '0', '1524620212', '1524620212', '2', '6012001', 'User', '0', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('1829', '2', '2', '用户登录', '0', '1524620344', '1524620344', '2', '6012001', 'User', '0', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('1830', '1', '1', '用户登录', '0', '1524623363', '1524623363', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1831', '2', '2', '用户登录', '0', '1524623405', '1524623405', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1832', '2', '2', '用户登录', '0', '1524623562', '1524623562', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1833', '2', '2', '用户登录', '0', '1524624961', '1524624961', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1834', '2', '2', '用户登录', '0', '1524626754', '1524626754', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1835', '3', '3', '用户登录', '0', '1524628003', '1524628003', '3', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1836', '3', '3', '用户登录', '0', '1524628004', '1524628004', '3', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1837', '2', '2', '用户登录', '0', '1524628169', '1524628169', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1838', '1', '1', '用户登录', '0', '1524634914', '1524634914', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1839', '1', '1', '用户登录', '0', '1524634932', '1524634932', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1840', '1', '1', '用户登录', '0', '1524635040', '1524635040', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1841', '2', '2', '用户登录', '0', '1524639427', '1524639427', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1842', '2', '101', '添加房间', '0', '1524639491', '1524639491', '2', '6012017', 'room', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1843', '2', '1', '删除房间', '0', '1524639567', '1524639567', '2', '6012021', 'room', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1844', '2', '2', '用户登录', '0', '1524639742', '1524639742', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1845', '2', '2', '用户登录', '0', '1524647198', '1524647198', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1846', '2', '102', '添加房间', '0', '1524647918', '1524647918', '2', '6012017', 'room', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1847', '1', '1', '用户登录', '0', '1524651471', '1524651471', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1848', '2', '2', '用户登录', '0', '1524651479', '1524651479', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1849', '1', '1', '用户登录', '0', '1524651556', '1524651556', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1850', '1', '1', '用户登录', '0', '1524651672', '1524651672', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1851', '2', '2', '用户登录', '0', '1524651828', '1524651828', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1852', '2', '103', '添加房间', '0', '1524651910', '1524651910', '2', '6012017', 'room', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1853', null, '0', '用户获取短信18678976835', '0', '1524652704', '1524652704', '0', '6000000', 'smsLog', '1', '1', '0', '1433', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1854', '63', '63', '用户登录', '0', '1524652744', '1524652744', '63', '6012001', 'User', '0', '19', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1855', '2', '2', '用户登录', '0', '1524652787', '1524652787', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1856', '1', '1', '用户登录', '0', '1524704405', '1524704405', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1857', '2', '2', '用户登录', '0', '1524704410', '1524704410', '2', '6012001', 'User', '0', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('1858', '2', '2', '用户登录', '0', '1524704725', '1524704725', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1859', '2', '2', '用户登录', '0', '1524704780', '1524704780', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1860', '3', '3', '用户登录', '0', '1524704821', '1524704821', '3', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1861', '3', '3', '用户登录', '0', '1524705136', '1524705136', '3', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1862', '1', '1', '用户登录', '0', '1524705167', '1524705167', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1863', '1', '1', '用户登录', '0', '1524705386', '1524705386', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1864', '3', '3', '用户登录', '0', '1524706818', '1524706818', '3', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1865', '2', '2', '用户登录', '0', '1524706827', '1524706827', '2', '6012001', 'User', '0', '1', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1866', '1', '1', '用户登录', '0', '1524708840', '1524708840', '1', '6012001', 'User', '0', '0', '', '', '112.255.173.28');
INSERT INTO `ibt_log` VALUES ('1867', '2', '2', '用户登录', '0', '1524709667', '1524709667', '2', '6012001', 'User', '0', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('1868', '2', '2', '用户登录', '0', '1524712945', '1524712945', '2', '6012001', 'User', '0', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('1869', '63', '63', '用户登录', '0', '1524713407', '1524713407', '63', '6012001', 'User', '0', '19', '', '', '112.255.41.161');
INSERT INTO `ibt_log` VALUES ('1870', '2', '2', '用户登录', '0', '1524713619', '1524713619', '2', '6012001', 'User', '0', '1', '', '', '144.123.36.18');
INSERT INTO `ibt_log` VALUES ('1871', '63', '63', '用户登录', '0', '1524713620', '1524713620', '63', '6012001', 'User', '0', '19', '', '', '112.255.41.161');
INSERT INTO `ibt_log` VALUES ('1872', '2', '104', '添加房间', '0', '1524713679', '1524713679', '2', '6012017', 'room', '0', '1', '', '', '144.123.36.18');

-- ----------------------------
-- Table structure for ibt_mould
-- ----------------------------
DROP TABLE IF EXISTS `ibt_mould`;
CREATE TABLE `ibt_mould` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileId` int(11) DEFAULT '0',
  `title` varchar(128) DEFAULT '',
  `desc` varchar(512) DEFAULT '0' COMMENT '描述',
  `code` varchar(50) DEFAULT '' COMMENT '标识码 系统固定，唯一标示。',
  `isDelete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  `lastupdateTime` int(11) DEFAULT '0' COMMENT '最后修改时间',
  `addtime` int(11) DEFAULT '0' COMMENT '注册时间',
  `adduserId` int(11) DEFAULT '0' COMMENT '11',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模板表';

-- ----------------------------
-- Records of ibt_mould
-- ----------------------------

-- ----------------------------
-- Table structure for ibt_msg
-- ----------------------------
DROP TABLE IF EXISTS `ibt_msg`;
CREATE TABLE `ibt_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT '',
  `content` text COMMENT '内容',
  `usertype` varchar(255) DEFAULT '' COMMENT '用户类型，对应字典表用户类型，如果为空：范围内全部用户',
  `iqbtId` int(11) DEFAULT '0' COMMENT '如果是孵化器公告，发送到孵化器下',
  `objId` int(11) DEFAULT '0' COMMENT '对应公告等的ID',
  `districtId` int(11) DEFAULT '0' COMMENT '地区管理',
  `msgType` int(11) DEFAULT '0' COMMENT '消息类型 字典表6012045',
  `isDelete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  `lastupdateTime` int(11) DEFAULT '0' COMMENT '最后修改时间',
  `addtime` int(11) DEFAULT '0' COMMENT '注册时间',
  `adduserId` int(11) DEFAULT '0' COMMENT '11',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息';

-- ----------------------------
-- Records of ibt_msg
-- ----------------------------

-- ----------------------------
-- Table structure for ibt_msg_rcd
-- ----------------------------
DROP TABLE IF EXISTS `ibt_msg_rcd`;
CREATE TABLE `ibt_msg_rcd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msgId` int(11) DEFAULT '0',
  `userId` int(11) DEFAULT '0' COMMENT '接收消息的urserId',
  `openId` varchar(50) DEFAULT '',
  `status` varchar(50) DEFAULT '' COMMENT '状态 字典表',
  `isDelete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  `lastupdateTime` int(11) DEFAULT '0' COMMENT '最后修改时间',
  `addtime` int(11) DEFAULT '0' COMMENT '注册时间',
  `adduserId` int(11) DEFAULT '0' COMMENT '11',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ibt_msg_rcd
-- ----------------------------

-- ----------------------------
-- Table structure for ibt_mtroom
-- ----------------------------
DROP TABLE IF EXISTS `ibt_mtroom`;
CREATE TABLE `ibt_mtroom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT '' COMMENT '会议室名称',
  `iqbtId` int(11) DEFAULT '0',
  `buildId` int(11) DEFAULT '0' COMMENT '楼座，对应build表',
  `accept` varchar(50) DEFAULT '' COMMENT '容纳人数 6016',
  `facility` varchar(255) DEFAULT '' COMMENT '配套设施 1033 dict',
  `desc` text COMMENT '会议室介绍',
  `free` varchar(50) DEFAULT '7002001' COMMENT '是否免费 7002',
  `price` decimal(11,2) DEFAULT '0.00' COMMENT '单价',
  `audit` varchar(50) DEFAULT '7002001' COMMENT '是否需要审核 7002',
  `publish` varchar(50) DEFAULT '7002001' COMMENT '是否发布 7002',
  `isDelete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  `lastupdateTime` int(11) DEFAULT '0' COMMENT '最后修改时间',
  `addtime` int(11) DEFAULT '0' COMMENT '注册时间',
  `adduserId` int(11) DEFAULT '0' COMMENT '11',
  `floorId` int(11) DEFAULT '0' COMMENT '楼层id，对应floor表',
  PRIMARY KEY (`id`),
  KEY `mtroom_iqbtid` (`iqbtId`),
  KEY `mtroom_isdelete` (`isDelete`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='会议室';

-- ----------------------------
-- Records of ibt_mtroom
-- ----------------------------
INSERT INTO `ibt_mtroom` VALUES ('13', '大会议室', '1', '268', '6016001', '6022003,6022004,6022005,6022006', '', '7002001', '0.00', '7002002', '7002001', '0', '1523674238', '1521771542', '2', '283');
INSERT INTO `ibt_mtroom` VALUES ('19', '对外会议室', '1', '268', '6016002', '6022001,6022004', '', '7002001', '0.00', '7002001', '7002001', '0', '1523668818', '1521771542', '2', '284');
INSERT INTO `ibt_mtroom` VALUES ('20', 'ASDF', '1', '268', '6016002', '', null, '7002002', '1000.00', '7002001', '7002002', '0', '1523675225', '1523675225', '2', '282');
INSERT INTO `ibt_mtroom` VALUES ('21', '多功能活动厅', '1', '268', '6016005', '6022001,6022002,6022003,6022004,6022005,6022006', '很大', '7002002', '500.00', '7002001', '7002002', '0', '1523675492', '1523675343', '2', '284');

-- ----------------------------
-- Table structure for ibt_mtroom_apl
-- ----------------------------
DROP TABLE IF EXISTS `ibt_mtroom_apl`;
CREATE TABLE `ibt_mtroom_apl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT '' COMMENT '会议名称',
  `etprsId` int(11) DEFAULT '0' COMMENT '企业ID',
  `mtroomId` int(11) DEFAULT '0' COMMENT '房间ID',
  `starttime` int(11) DEFAULT '0' COMMENT '开始时间',
  `endtime` int(11) DEFAULT '0' COMMENT '结束时间',
  `payable` decimal(11,2) DEFAULT '0.00',
  `paid` decimal(11,2) DEFAULT '0.00' COMMENT '实付',
  `desc` text COMMENT '申请说明',
  `status` varchar(255) DEFAULT '7001001' COMMENT '审核状态 。字段 7001',
  `auditUserId` int(11) DEFAULT '0' COMMENT '审核人',
  `auditdesc` text COMMENT '审核说明',
  `audittime` int(11) DEFAULT '0' COMMENT '审核时间',
  `isDelete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  `lastupdateTime` int(11) DEFAULT '0' COMMENT '最后修改时间',
  `addtime` int(11) DEFAULT '0' COMMENT '注册时间',
  `adduserId` int(11) DEFAULT '0' COMMENT '11',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='会议室申请';

-- ----------------------------
-- Records of ibt_mtroom_apl
-- ----------------------------
INSERT INTO `ibt_mtroom_apl` VALUES ('1', '阿斯蒂芬', '3', '13', '1521169200', '1521185400', '0.00', '0.00', null, '7001002', '0', null, '0', '0', '1521431005', '1521106485', '3');
INSERT INTO `ibt_mtroom_apl` VALUES ('4', '阿斯蒂芬', '3', '1', '1521208800', '1521214200', '0.00', '0.00', null, '7001003', '0', null, '0', '0', '1521431013', '1521185668', '3');
INSERT INTO `ibt_mtroom_apl` VALUES ('5', '大师傅', '3', '13', '1521435600', '1521451800', '450.00', '450.00', null, '7001002', '0', null, '0', '0', '1521765872', '1521435991', '3');
INSERT INTO `ibt_mtroom_apl` VALUES ('6', '需求会议', '3', '19', '1521482400', '1521486000', '0.00', '20.00', null, '7001002', '0', null, '0', '0', '1521437910', '1521436914', '3');
INSERT INTO `ibt_mtroom_apl` VALUES ('7', '订单会议', '3', '19', '1521455400', '1521462600', '200.00', '300.00', null, '7001002', '0', null, '0', '0', '1521439906', '1521439454', '3');
INSERT INTO `ibt_mtroom_apl` VALUES ('8', '销售会议', '3', '20', '1521428400', '1521441000', '0.00', '0.00', null, '7001002', '0', null, '0', '0', '1521444825', '1521439513', '3');
INSERT INTO `ibt_mtroom_apl` VALUES ('9', '开发会议', '3', '8', '1521446400', '1521455400', '0.00', '0.00', null, '7001000', '0', null, '0', '0', '1521443917', '1521439611', '3');
INSERT INTO `ibt_mtroom_apl` VALUES ('10', '健康访问会议', '3', '19', '1521457200', '1521459000', '50.00', '50.00', null, '7001002', '0', null, '0', '0', '1521441862', '1521441779', '3');
INSERT INTO `ibt_mtroom_apl` VALUES ('11', '销售', '3', '19', '1521518400', '1521525600', '200.00', '200.00', null, '7001002', '0', null, '0', '0', '1521442755', '1521442649', '3');
INSERT INTO `ibt_mtroom_apl` VALUES ('12', '销售', '3', '8', '1521518400', '1521527400', '0.00', '0.00', null, '7001001', '0', null, '0', '0', '1521443042', '1521443042', '3');
INSERT INTO `ibt_mtroom_apl` VALUES ('13', '4', '3', '11', '1521433800', '1521450000', '0.00', '0.00', null, '7001003', '0', null, '0', '0', '1521449063', '1521449000', '3');
INSERT INTO `ibt_mtroom_apl` VALUES ('14', '1', '3', '21', '1521514800', '1521534600', '0.00', '0.00', null, '7001002', '0', null, '0', '0', '1521531968', '1521531925', '3');
INSERT INTO `ibt_mtroom_apl` VALUES ('15', '分给发', '19', '19', '1521784800', '1521790200', '150.00', '150.00', null, '7001003', '0', null, '0', '0', '1521774240', '1521766480', '29');
INSERT INTO `ibt_mtroom_apl` VALUES ('16', '分担分担', '19', '19', '1531781200', '1531797400', '0.00', '0.00', null, '7001002', '0', null, '0', '0', '1523671056', '1521771916', '29');
INSERT INTO `ibt_mtroom_apl` VALUES ('17', '多个', '19', '19', '1531784800', '1531797400', '0.00', '0.00', null, '7001003', '0', null, '0', '0', '1523670357', '1521772681', '29');
INSERT INTO `ibt_mtroom_apl` VALUES ('18', '啊是的', '3', '19', '1523350800', '1523358000', '0.00', '0.00', null, '7001000', '0', null, '0', '0', '1523326370', '1523326330', '3');
INSERT INTO `ibt_mtroom_apl` VALUES ('19', '阿道夫', '3', '13', '1523714400', '1523721600', '0.00', '0.00', null, '7001002', '0', null, '0', '0', '1523929518', '1523687718', '2');
INSERT INTO `ibt_mtroom_apl` VALUES ('20', '阿斯蒂芬', '0', '13', '1523709000', '1523712600', '0.00', '0.00', null, '7001002', '0', null, '0', '0', '1523858626', '1523687789', '2');
INSERT INTO `ibt_mtroom_apl` VALUES ('21', '阿斯蒂芬', '3', '21', '1523710800', '1523721600', '1500.00', '500.00', null, '7001002', '0', null, '0', '0', '1523929465', '1523687878', '2');
INSERT INTO `ibt_mtroom_apl` VALUES ('29', '阿大声', '3', '21', '1524564000', '1524569400', '750.00', '750.00', null, '7001002', '0', null, '0', '0', '1524554911', '1524538830', '3');

-- ----------------------------
-- Table structure for ibt_mtroom_colect
-- ----------------------------
DROP TABLE IF EXISTS `ibt_mtroom_colect`;
CREATE TABLE `ibt_mtroom_colect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mtroomId` int(11) DEFAULT '0' COMMENT '会议室名称',
  `isDelete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  `lastupdateTime` int(11) DEFAULT '0' COMMENT '最后修改时间',
  `addtime` int(11) DEFAULT '0' COMMENT '注册时间',
  `adduserId` int(11) DEFAULT '0' COMMENT '11',
  PRIMARY KEY (`id`),
  KEY `mtroom_colect_isdelete` (`isDelete`),
  KEY `mtroom_mtroomId` (`mtroomId`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='收藏';

-- ----------------------------
-- Records of ibt_mtroom_colect
-- ----------------------------
INSERT INTO `ibt_mtroom_colect` VALUES ('1', '3', '1', '1521179091', '1521179090', '5');
INSERT INTO `ibt_mtroom_colect` VALUES ('2', '4', '1', '1521179093', '1521179090', '5');
INSERT INTO `ibt_mtroom_colect` VALUES ('3', '2', '1', '1521179098', '1521179092', '5');
INSERT INTO `ibt_mtroom_colect` VALUES ('4', '4', '1', '1521179099', '1521179096', '5');
INSERT INTO `ibt_mtroom_colect` VALUES ('5', '3', '1', '1521179100', '1521179097', '5');
INSERT INTO `ibt_mtroom_colect` VALUES ('6', '2', '1', '1521179100', '1521179099', '5');
INSERT INTO `ibt_mtroom_colect` VALUES ('7', '4', '1', '1521179101', '1521179100', '5');
INSERT INTO `ibt_mtroom_colect` VALUES ('8', '3', '1', '1521179101', '1521179100', '5');
INSERT INTO `ibt_mtroom_colect` VALUES ('9', '2', '1', '1521437431', '1521179101', '5');
INSERT INTO `ibt_mtroom_colect` VALUES ('10', '4', '1', '1521437429', '1521179101', '5');
INSERT INTO `ibt_mtroom_colect` VALUES ('11', '9', '1', '1521443819', '1521438449', '3');
INSERT INTO `ibt_mtroom_colect` VALUES ('12', '6', '1', '1521688766', '1521688765', '8');
INSERT INTO `ibt_mtroom_colect` VALUES ('13', '5', '0', '1521688768', '1521688768', '8');
INSERT INTO `ibt_mtroom_colect` VALUES ('14', '6', '0', '1521688772', '1521688772', '8');
INSERT INTO `ibt_mtroom_colect` VALUES ('15', '10', '0', '1521881108', '1521881108', '2');
INSERT INTO `ibt_mtroom_colect` VALUES ('16', '13', '1', '1522745094', '1522745092', '2');
INSERT INTO `ibt_mtroom_colect` VALUES ('17', '19', '1', '1522745095', '1522745094', '2');
INSERT INTO `ibt_mtroom_colect` VALUES ('18', '13', '1', '1522745096', '1522745095', '2');
INSERT INTO `ibt_mtroom_colect` VALUES ('19', '19', '1', '1522745097', '1522745096', '2');
INSERT INTO `ibt_mtroom_colect` VALUES ('20', '13', '1', '1522745104', '1522745096', '2');
INSERT INTO `ibt_mtroom_colect` VALUES ('21', '19', '1', '1522745109', '1522745098', '2');
INSERT INTO `ibt_mtroom_colect` VALUES ('22', '13', '1', '1522745111', '1522745105', '2');
INSERT INTO `ibt_mtroom_colect` VALUES ('23', '13', '1', '1522745115', '1522745113', '2');
INSERT INTO `ibt_mtroom_colect` VALUES ('24', '13', '1', '1522745121', '1522745116', '2');
INSERT INTO `ibt_mtroom_colect` VALUES ('25', '19', '1', '1522745122', '1522745120', '2');
INSERT INTO `ibt_mtroom_colect` VALUES ('26', '13', '1', '1522745125', '1522745123', '2');
INSERT INTO `ibt_mtroom_colect` VALUES ('27', '19', '1', '1522745126', '1522745125', '2');
INSERT INTO `ibt_mtroom_colect` VALUES ('28', '13', '1', '1522745127', '1522745126', '2');
INSERT INTO `ibt_mtroom_colect` VALUES ('29', '19', '1', '1522745135', '1522745133', '2');
INSERT INTO `ibt_mtroom_colect` VALUES ('30', '13', '1', '1522745137', '1522745136', '2');
INSERT INTO `ibt_mtroom_colect` VALUES ('31', '19', '1', '1522745138', '1522745138', '2');
INSERT INTO `ibt_mtroom_colect` VALUES ('32', '13', '1', '1522745139', '1522745138', '2');
INSERT INTO `ibt_mtroom_colect` VALUES ('33', '19', '1', '1522745142', '1522745140', '2');
INSERT INTO `ibt_mtroom_colect` VALUES ('34', '13', '1', '1522745144', '1522745143', '2');
INSERT INTO `ibt_mtroom_colect` VALUES ('35', '13', '1', '1522745144', '1522745144', '2');
INSERT INTO `ibt_mtroom_colect` VALUES ('36', '19', '1', '1522745146', '1522745145', '2');
INSERT INTO `ibt_mtroom_colect` VALUES ('37', '13', '1', '1524448295', '1522745148', '2');
INSERT INTO `ibt_mtroom_colect` VALUES ('38', '13', '0', '1524045290', '1524045290', '0');
INSERT INTO `ibt_mtroom_colect` VALUES ('39', '21', '0', '1524448292', '1524448292', '2');
INSERT INTO `ibt_mtroom_colect` VALUES ('40', '13', '0', '1524448319', '1524448319', '2');

-- ----------------------------
-- Table structure for ibt_notice
-- ----------------------------
DROP TABLE IF EXISTS `ibt_notice`;
CREATE TABLE `ibt_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '内容详情',
  `endtime` int(11) DEFAULT '0' COMMENT '截止时间',
  `iqbtId` int(11) DEFAULT '0',
  `des` text NOT NULL COMMENT '简介',
  `banner` int(11) DEFAULT '0' COMMENT 'banner图路径',
  `isDelete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  `lastupdateTime` int(11) DEFAULT '0' COMMENT '最后修改时间',
  `addtime` int(11) DEFAULT '0' COMMENT '注册时间',
  `adduserId` int(11) DEFAULT '0' COMMENT '11',
  `distinctId` int(11) DEFAULT '0' COMMENT '地区',
  `publish` tinyint(2) DEFAULT '0' COMMENT '是否发布，字典表7002',
  `usertype` varchar(255) DEFAULT '' COMMENT '8003 用户类型，如果为空，给所有用户发送',
  `source` varchar(255) DEFAULT '' COMMENT '公告发送方 6019',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='通知公告';

-- ----------------------------
-- Records of ibt_notice
-- ----------------------------

-- ----------------------------
-- Table structure for ibt_region
-- ----------------------------
DROP TABLE IF EXISTS `ibt_region`;
CREATE TABLE `ibt_region` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) DEFAULT '',
  `level` varchar(128) DEFAULT '',
  `provinceid` varchar(128) DEFAULT '',
  `cityid` varchar(128) DEFAULT '',
  `parentid` varchar(128) DEFAULT '',
  `isDelete` tinyint(2) DEFAULT '0',
  `haierId` int(11) DEFAULT '0',
  `code` varchar(50) DEFAULT '',
  `alsname` varchar(128) DEFAULT '' COMMENT '省的别名，为了跟地图对应',
  PRIMARY KEY (`id`),
  KEY `region_isdelete` (`isDelete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='区域表';

-- ----------------------------
-- Records of ibt_region
-- ----------------------------
INSERT INTO `ibt_region` VALUES ('11', '北京市', '1', '11', '0', '0', '0', '18', '', '北京');
INSERT INTO `ibt_region` VALUES ('12', '天津市', '1', '12', '0', '0', '0', '323', '', '天津');
INSERT INTO `ibt_region` VALUES ('13', '河北省', '1', '13', '0', '0', '0', null, '', '河北');
INSERT INTO `ibt_region` VALUES ('14', '山西省', '1', '14', '0', '0', '0', null, '', '山西');
INSERT INTO `ibt_region` VALUES ('15', '内蒙古自治区', '1', '15', '0', '0', '0', null, '', '内蒙古');
INSERT INTO `ibt_region` VALUES ('21', '辽宁省', '1', '21', '0', '0', '0', null, '', '辽宁');
INSERT INTO `ibt_region` VALUES ('22', '吉林省', '1', '22', '0', '0', '0', null, '', '吉林');
INSERT INTO `ibt_region` VALUES ('23', '黑龙江省', '1', '23', '0', '0', '0', null, '', '黑龙江');
INSERT INTO `ibt_region` VALUES ('31', '上海市', '1', '31', '0', '0', '0', '283', '', '上海');
INSERT INTO `ibt_region` VALUES ('32', '江苏省', '1', '32', '0', '0', '0', null, '', '江苏');
INSERT INTO `ibt_region` VALUES ('33', '浙江省', '1', '33', '0', '0', '0', null, '', '浙江');
INSERT INTO `ibt_region` VALUES ('34', '安徽省', '1', '34', '0', '0', '0', null, '', '安徽');
INSERT INTO `ibt_region` VALUES ('35', '福建省', '1', '35', '0', '0', '0', null, '', '福建');
INSERT INTO `ibt_region` VALUES ('36', '江西省', '1', '36', '0', '0', '0', null, '', '江西');
INSERT INTO `ibt_region` VALUES ('37', '山东省', '1', '37', '0', '0', '0', null, '', '山东');
INSERT INTO `ibt_region` VALUES ('41', '河南省', '1', '41', '0', '0', '0', null, '', '河南');
INSERT INTO `ibt_region` VALUES ('42', '湖北省', '1', '42', '0', '0', '0', null, '', '湖北');
INSERT INTO `ibt_region` VALUES ('43', '湖南省', '1', '43', '0', '0', '0', null, '', '湖南');
INSERT INTO `ibt_region` VALUES ('44', '广东省', '1', '44', '0', '0', '0', null, '', '广东');
INSERT INTO `ibt_region` VALUES ('45', '广西壮族自治区', '1', '45', '0', '0', '0', null, '', '广西');
INSERT INTO `ibt_region` VALUES ('46', '海南省', '1', '46', '0', '0', '0', null, '', '海南');
INSERT INTO `ibt_region` VALUES ('50', '重庆市', '1', '50', '0', '0', '0', '390', '', '重庆');
INSERT INTO `ibt_region` VALUES ('51', '四川省', '1', '51', '0', '0', '0', null, '', '四川');
INSERT INTO `ibt_region` VALUES ('52', '贵州省', '1', '52', '0', '0', '0', null, '', '贵州');
INSERT INTO `ibt_region` VALUES ('53', '云南省', '1', '53', '0', '0', '0', null, '', '云南');
INSERT INTO `ibt_region` VALUES ('54', '西藏自治区', '1', '54', '0', '0', '0', null, '', '西藏');
INSERT INTO `ibt_region` VALUES ('61', '陕西省', '1', '61', '0', '0', '0', null, '', '陕西');
INSERT INTO `ibt_region` VALUES ('62', '甘肃省', '1', '62', '0', '0', '0', null, '', '甘肃');
INSERT INTO `ibt_region` VALUES ('63', '青海省', '1', '63', '0', '0', '0', null, '', '青海');
INSERT INTO `ibt_region` VALUES ('64', '宁夏回族自治区', '1', '64', '0', '0', '0', null, '', '宁夏');
INSERT INTO `ibt_region` VALUES ('65', '新疆维吾尔自治区', '1', '65', '0', '0', '0', null, '', '新疆');
INSERT INTO `ibt_region` VALUES ('71', '台湾省', '1', '71', '0', '0', '0', null, '', '台湾');
INSERT INTO `ibt_region` VALUES ('81', '香港特别行政区', '1', '81', '0', '0', '0', null, '', '香港');
INSERT INTO `ibt_region` VALUES ('82', '澳门', '1', '82', '0', '0', '0', null, '', '澳门');
INSERT INTO `ibt_region` VALUES ('1101', '北京市', '2', '11', '1101', '11', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('1201', '天津市', '2', '12', '1201', '12', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('1301', '石家庄市', '2', '13', '1301', '13', '0', '112', '', '');
INSERT INTO `ibt_region` VALUES ('1302', '唐山市', '2', '13', '1302', '13', '0', '113', '', '');
INSERT INTO `ibt_region` VALUES ('1303', '秦皇岛市', '2', '13', '1303', '13', '0', '111', '', '');
INSERT INTO `ibt_region` VALUES ('1304', '邯郸市', '2', '13', '1304', '13', '0', '108', '', '');
INSERT INTO `ibt_region` VALUES ('1305', '邢台市', '2', '13', '1305', '13', '0', '114', '', '');
INSERT INTO `ibt_region` VALUES ('1306', '保定市', '2', '13', '1306', '13', '0', '105', '', '');
INSERT INTO `ibt_region` VALUES ('1307', '张家口市', '2', '13', '1307', '13', '0', '115', '', '');
INSERT INTO `ibt_region` VALUES ('1308', '承德市', '2', '13', '1308', '13', '0', '107', '', '');
INSERT INTO `ibt_region` VALUES ('1309', '沧州市', '2', '13', '1309', '13', '0', '106', '', '');
INSERT INTO `ibt_region` VALUES ('1310', '廊坊市', '2', '13', '1310', '13', '0', '110', '', '');
INSERT INTO `ibt_region` VALUES ('1311', '衡水市', '2', '13', '1311', '13', '0', '109', '', '');
INSERT INTO `ibt_region` VALUES ('1390', '省直辖县级行政区划', '2', '13', '1390', '13', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('1401', '太原市', '2', '14', '1401', '14', '0', '269', '', '');
INSERT INTO `ibt_region` VALUES ('1402', '大同市', '2', '14', '1402', '14', '0', '263', '', '');
INSERT INTO `ibt_region` VALUES ('1403', '阳泉市', '2', '14', '1403', '14', '0', '271', '', '');
INSERT INTO `ibt_region` VALUES ('1404', '长治市', '2', '14', '1404', '14', '0', '262', '', '');
INSERT INTO `ibt_region` VALUES ('1405', '晋城市', '2', '14', '1405', '14', '0', '264', '', '');
INSERT INTO `ibt_region` VALUES ('1406', '朔州市', '2', '14', '1406', '14', '0', '268', '', '');
INSERT INTO `ibt_region` VALUES ('1407', '晋中市', '2', '14', '1407', '14', '0', '265', '', '');
INSERT INTO `ibt_region` VALUES ('1408', '运城市', '2', '14', '1408', '14', '0', '272', '', '');
INSERT INTO `ibt_region` VALUES ('1409', '忻州市', '2', '14', '1409', '14', '0', '270', '', '');
INSERT INTO `ibt_region` VALUES ('1410', '临汾市', '2', '14', '1410', '14', '0', '266', '', '');
INSERT INTO `ibt_region` VALUES ('1411', '吕梁市', '2', '14', '1411', '14', '0', '267', '', '');
INSERT INTO `ibt_region` VALUES ('1501', '呼和浩特市', '2', '15', '1501', '15', '0', '225', '', '');
INSERT INTO `ibt_region` VALUES ('1502', '包头市', '2', '15', '1502', '15', '0', '222', '', '');
INSERT INTO `ibt_region` VALUES ('1503', '乌海市', '2', '15', '1503', '15', '0', '228', '', '');
INSERT INTO `ibt_region` VALUES ('1504', '赤峰市', '2', '15', '1504', '15', '0', '223', '', '');
INSERT INTO `ibt_region` VALUES ('1505', '通辽市', '2', '15', '1505', '15', '0', '227', '', '');
INSERT INTO `ibt_region` VALUES ('1506', '鄂尔多斯市', '2', '15', '1506', '15', '0', '224', '', '');
INSERT INTO `ibt_region` VALUES ('1507', '呼伦贝尔市', '2', '15', '1507', '15', '0', '226', '', '');
INSERT INTO `ibt_region` VALUES ('1508', '巴彦淖尔市', '2', '15', '1508', '15', '0', '221', '', '');
INSERT INTO `ibt_region` VALUES ('1509', '乌兰察布市', '2', '15', '1509', '15', '0', '229', '', '');
INSERT INTO `ibt_region` VALUES ('1522', '兴安盟', '2', '15', '1522', '15', '0', '231', '', '');
INSERT INTO `ibt_region` VALUES ('1525', '锡林郭勒盟', '2', '15', '1525', '15', '0', '230', '', '');
INSERT INTO `ibt_region` VALUES ('1529', '阿拉善盟', '2', '15', '1529', '15', '0', '220', '', '');
INSERT INTO `ibt_region` VALUES ('2101', '沈阳市', '2', '21', '2101', '21', '0', '217', '', '');
INSERT INTO `ibt_region` VALUES ('2102', '大连市', '2', '21', '2102', '21', '0', '209', '', '');
INSERT INTO `ibt_region` VALUES ('2103', '鞍山市', '2', '21', '2103', '21', '0', '206', '', '');
INSERT INTO `ibt_region` VALUES ('2104', '抚顺市', '2', '21', '2104', '21', '0', '211', '', '');
INSERT INTO `ibt_region` VALUES ('2105', '本溪市', '2', '21', '2105', '21', '0', '207', '', '');
INSERT INTO `ibt_region` VALUES ('2106', '丹东市', '2', '21', '2106', '21', '0', '210', '', '');
INSERT INTO `ibt_region` VALUES ('2107', '锦州市', '2', '21', '2107', '21', '0', '214', '', '');
INSERT INTO `ibt_region` VALUES ('2108', '营口市', '2', '21', '2108', '21', '0', '219', '', '');
INSERT INTO `ibt_region` VALUES ('2109', '阜新市', '2', '21', '2109', '21', '0', '212', '', '');
INSERT INTO `ibt_region` VALUES ('2110', '辽阳市', '2', '21', '2110', '21', '0', '215', '', '');
INSERT INTO `ibt_region` VALUES ('2111', '盘锦市', '2', '21', '2111', '21', '0', '216', '', '');
INSERT INTO `ibt_region` VALUES ('2112', '铁岭市', '2', '21', '2112', '21', '0', '218', '', '');
INSERT INTO `ibt_region` VALUES ('2113', '朝阳市', '2', '21', '2113', '21', '0', '208', '', '');
INSERT INTO `ibt_region` VALUES ('2114', '葫芦岛市', '2', '21', '2114', '21', '0', '213', '', '');
INSERT INTO `ibt_region` VALUES ('2201', '长春市', '2', '22', '2201', '22', '0', '175', '', '');
INSERT INTO `ibt_region` VALUES ('2202', '吉林市', '2', '22', '2202', '22', '0', '176', '', '');
INSERT INTO `ibt_region` VALUES ('2203', '四平市', '2', '22', '2203', '22', '0', '178', '', '');
INSERT INTO `ibt_region` VALUES ('2204', '辽源市', '2', '22', '2204', '22', '0', '177', '', '');
INSERT INTO `ibt_region` VALUES ('2205', '通化市', '2', '22', '2205', '22', '0', '180', '', '');
INSERT INTO `ibt_region` VALUES ('2206', '白山市', '2', '22', '2206', '22', '0', '174', '', '');
INSERT INTO `ibt_region` VALUES ('2207', '松原市', '2', '22', '2207', '22', '0', '179', '', '');
INSERT INTO `ibt_region` VALUES ('2208', '白城市', '2', '22', '2208', '22', '0', '173', '', '');
INSERT INTO `ibt_region` VALUES ('2224', '延边朝鲜族自治州', '2', '22', '2224', '22', '0', '181', '', '');
INSERT INTO `ibt_region` VALUES ('2301', '哈尔滨市', '2', '23', '2301', '23', '0', '135', '', '');
INSERT INTO `ibt_region` VALUES ('2302', '齐齐哈尔市', '2', '23', '2302', '23', '0', '142', '', '');
INSERT INTO `ibt_region` VALUES ('2303', '鸡西市', '2', '23', '2303', '23', '0', '138', '', '');
INSERT INTO `ibt_region` VALUES ('2304', '鹤岗市', '2', '23', '2304', '23', '0', '136', '', '');
INSERT INTO `ibt_region` VALUES ('2305', '双鸭山市', '2', '23', '2305', '23', '0', '143', '', '');
INSERT INTO `ibt_region` VALUES ('2306', '大庆市', '2', '23', '2306', '23', '0', '133', '', '');
INSERT INTO `ibt_region` VALUES ('2307', '伊春市', '2', '23', '2307', '23', '0', '145', '', '');
INSERT INTO `ibt_region` VALUES ('2308', '佳木斯市', '2', '23', '2308', '23', '0', '139', '', '');
INSERT INTO `ibt_region` VALUES ('2309', '七台河市', '2', '23', '2309', '23', '0', '141', '', '');
INSERT INTO `ibt_region` VALUES ('2310', '牡丹江市', '2', '23', '2310', '23', '0', '140', '', '');
INSERT INTO `ibt_region` VALUES ('2311', '黑河市', '2', '23', '2311', '23', '0', '137', '', '');
INSERT INTO `ibt_region` VALUES ('2312', '绥化市', '2', '23', '2312', '23', '0', '144', '', '');
INSERT INTO `ibt_region` VALUES ('2327', '大兴安岭地区', '2', '23', '2327', '23', '0', '134', '', '');
INSERT INTO `ibt_region` VALUES ('3101', '上海市', '2', '31', '3101', '31', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('3201', '南京市', '2', '32', '3201', '32', '0', '185', '', '');
INSERT INTO `ibt_region` VALUES ('3202', '无锡市', '2', '32', '3202', '32', '0', '190', '', '');
INSERT INTO `ibt_region` VALUES ('3203', '徐州市', '2', '32', '3203', '32', '0', '191', '', '');
INSERT INTO `ibt_region` VALUES ('3204', '常州市', '2', '32', '3204', '32', '0', '182', '', '');
INSERT INTO `ibt_region` VALUES ('3205', '苏州市', '2', '32', '3205', '32', '0', '187', '', '');
INSERT INTO `ibt_region` VALUES ('3206', '南通市', '2', '32', '3206', '32', '0', '186', '', '');
INSERT INTO `ibt_region` VALUES ('3207', '连云港市', '2', '32', '3207', '32', '0', '184', '', '');
INSERT INTO `ibt_region` VALUES ('3208', '淮安市', '2', '32', '3208', '32', '0', '183', '', '');
INSERT INTO `ibt_region` VALUES ('3209', '盐城市', '2', '32', '3209', '32', '0', '192', '', '');
INSERT INTO `ibt_region` VALUES ('3210', '扬州市', '2', '32', '3210', '32', '0', '193', '', '');
INSERT INTO `ibt_region` VALUES ('3211', '镇江市', '2', '32', '3211', '32', '0', '194', '', '');
INSERT INTO `ibt_region` VALUES ('3212', '泰州市', '2', '32', '3212', '32', '0', '189', '', '');
INSERT INTO `ibt_region` VALUES ('3213', '宿迁市', '2', '32', '3213', '32', '0', '188', '', '');
INSERT INTO `ibt_region` VALUES ('3301', '杭州市', '2', '33', '3301', '33', '0', '379', '', '');
INSERT INTO `ibt_region` VALUES ('3302', '宁波市', '2', '33', '3302', '33', '0', '384', '', '');
INSERT INTO `ibt_region` VALUES ('3303', '温州市', '2', '33', '3303', '33', '0', '387', '', '');
INSERT INTO `ibt_region` VALUES ('3304', '嘉兴市', '2', '33', '3304', '33', '0', '381', '', '');
INSERT INTO `ibt_region` VALUES ('3305', '湖州市', '2', '33', '3305', '33', '0', '380', '', '');
INSERT INTO `ibt_region` VALUES ('3306', '绍兴市', '2', '33', '3306', '33', '0', '385', '', '');
INSERT INTO `ibt_region` VALUES ('3307', '金华市', '2', '33', '3307', '33', '0', '382', '', '');
INSERT INTO `ibt_region` VALUES ('3308', '衢州市', '2', '33', '3308', '33', '0', '389', '', '');
INSERT INTO `ibt_region` VALUES ('3309', '舟山市', '2', '33', '3309', '33', '0', '388', '', '');
INSERT INTO `ibt_region` VALUES ('3310', '台州市', '2', '33', '3310', '33', '0', '386', '', '');
INSERT INTO `ibt_region` VALUES ('3311', '丽水市', '2', '33', '3311', '33', '0', '383', '', '');
INSERT INTO `ibt_region` VALUES ('3401', '合肥市', '2', '34', '3401', '34', '0', '7', '', '');
INSERT INTO `ibt_region` VALUES ('3402', '芜湖市', '2', '34', '3402', '34', '0', '15', '', '');
INSERT INTO `ibt_region` VALUES ('3403', '蚌埠市', '2', '34', '3403', '34', '0', '2', '', '');
INSERT INTO `ibt_region` VALUES ('3404', '淮南市', '2', '34', '3404', '34', '0', '9', '', '');
INSERT INTO `ibt_region` VALUES ('3405', '马鞍山市', '2', '34', '3405', '34', '0', '12', '', '');
INSERT INTO `ibt_region` VALUES ('3406', '淮北市', '2', '34', '3406', '34', '0', '8', '', '');
INSERT INTO `ibt_region` VALUES ('3407', '铜陵市', '2', '34', '3407', '34', '0', '14', '', '');
INSERT INTO `ibt_region` VALUES ('3408', '安庆市', '2', '34', '3408', '34', '0', '1', '', '');
INSERT INTO `ibt_region` VALUES ('3410', '黄山市', '2', '34', '3410', '34', '0', '10', '', '');
INSERT INTO `ibt_region` VALUES ('3411', '滁州市', '2', '34', '3411', '34', '0', '5', '', '');
INSERT INTO `ibt_region` VALUES ('3412', '阜阳市', '2', '34', '3412', '34', '0', '6', '', '');
INSERT INTO `ibt_region` VALUES ('3413', '宿州市', '2', '34', '3413', '34', '0', '13', '', '');
INSERT INTO `ibt_region` VALUES ('3415', '六安市', '2', '34', '3415', '34', '0', '11', '', '');
INSERT INTO `ibt_region` VALUES ('3416', '亳州市', '2', '34', '3416', '34', '0', '17', '', '');
INSERT INTO `ibt_region` VALUES ('3417', '池州市', '2', '34', '3417', '34', '0', '4', '', '');
INSERT INTO `ibt_region` VALUES ('3418', '宣城市', '2', '34', '3418', '34', '0', '16', '', '');
INSERT INTO `ibt_region` VALUES ('3501', '福州市', '2', '35', '3501', '35', '0', '36', '', '');
INSERT INTO `ibt_region` VALUES ('3502', '厦门市', '2', '35', '3502', '35', '0', '43', '', '');
INSERT INTO `ibt_region` VALUES ('3503', '莆田市', '2', '35', '3503', '35', '0', '40', '', '');
INSERT INTO `ibt_region` VALUES ('3504', '三明市', '2', '35', '3504', '35', '0', '42', '', '');
INSERT INTO `ibt_region` VALUES ('3505', '泉州市', '2', '35', '3505', '35', '0', '41', '', '');
INSERT INTO `ibt_region` VALUES ('3506', '漳州市', '2', '35', '3506', '35', '0', '44', '', '');
INSERT INTO `ibt_region` VALUES ('3507', '南平市', '2', '35', '3507', '35', '0', '38', '', '');
INSERT INTO `ibt_region` VALUES ('3508', '龙岩市', '2', '35', '3508', '35', '0', '37', '', '');
INSERT INTO `ibt_region` VALUES ('3509', '宁德市', '2', '35', '3509', '35', '0', '39', '', '');
INSERT INTO `ibt_region` VALUES ('3601', '南昌市', '2', '36', '3601', '36', '0', '200', '', '');
INSERT INTO `ibt_region` VALUES ('3602', '景德镇市', '2', '36', '3602', '36', '0', '198', '', '');
INSERT INTO `ibt_region` VALUES ('3603', '萍乡市', '2', '36', '3603', '36', '0', '201', '', '');
INSERT INTO `ibt_region` VALUES ('3604', '九江市', '2', '36', '3604', '36', '0', '199', '', '');
INSERT INTO `ibt_region` VALUES ('3605', '新余市', '2', '36', '3605', '36', '0', '203', '', '');
INSERT INTO `ibt_region` VALUES ('3606', '鹰潭市', '2', '36', '3606', '36', '0', '205', '', '');
INSERT INTO `ibt_region` VALUES ('3607', '赣州市', '2', '36', '3607', '36', '0', '196', '', '');
INSERT INTO `ibt_region` VALUES ('3608', '吉安市', '2', '36', '3608', '36', '0', '197', '', '');
INSERT INTO `ibt_region` VALUES ('3609', '宜春市', '2', '36', '3609', '36', '0', '204', '', '');
INSERT INTO `ibt_region` VALUES ('3610', '抚州市', '2', '36', '3610', '36', '0', '195', '', '');
INSERT INTO `ibt_region` VALUES ('3611', '上饶市', '2', '36', '3611', '36', '0', '202', '', '');
INSERT INTO `ibt_region` VALUES ('3701', '济南市', '2', '37', '3701', '37', '0', '249', '', '');
INSERT INTO `ibt_region` VALUES ('3702', '青岛市', '2', '37', '3702', '37', '0', '254', '', '');
INSERT INTO `ibt_region` VALUES ('3703', '淄博市', '2', '37', '3703', '37', '0', '261', '', '');
INSERT INTO `ibt_region` VALUES ('3704', '枣庄市', '2', '37', '3704', '37', '0', '260', '', '');
INSERT INTO `ibt_region` VALUES ('3705', '东营市', '2', '37', '3705', '37', '0', '247', '', '');
INSERT INTO `ibt_region` VALUES ('3706', '烟台市', '2', '37', '3706', '37', '0', '259', '', '');
INSERT INTO `ibt_region` VALUES ('3707', '潍坊市', '2', '37', '3707', '37', '0', '258', '', '');
INSERT INTO `ibt_region` VALUES ('3708', '济宁市', '2', '37', '3708', '37', '0', '250', '', '');
INSERT INTO `ibt_region` VALUES ('3709', '泰安市', '2', '37', '3709', '37', '0', '256', '', '');
INSERT INTO `ibt_region` VALUES ('3710', '威海市', '2', '37', '3710', '37', '0', '257', '', '');
INSERT INTO `ibt_region` VALUES ('3711', '日照市', '2', '37', '3711', '37', '0', '255', '', '');
INSERT INTO `ibt_region` VALUES ('3712', '莱芜市', '2', '37', '3712', '37', '0', '251', '', '');
INSERT INTO `ibt_region` VALUES ('3713', '临沂市', '2', '37', '3713', '37', '0', '253', '', '');
INSERT INTO `ibt_region` VALUES ('3714', '德州市', '2', '37', '3714', '37', '0', '246', '', '');
INSERT INTO `ibt_region` VALUES ('3715', '聊城市', '2', '37', '3715', '37', '0', '252', '', '');
INSERT INTO `ibt_region` VALUES ('3716', '滨州市', '2', '37', '3716', '37', '0', '245', '', '');
INSERT INTO `ibt_region` VALUES ('3717', '菏泽市', '2', '37', '3717', '37', '0', '248', '', '');
INSERT INTO `ibt_region` VALUES ('4101', '郑州市', '2', '41', '4101', '41', '0', '128', '', '');
INSERT INTO `ibt_region` VALUES ('4102', '开封市', '2', '41', '4102', '41', '0', '119', '', '');
INSERT INTO `ibt_region` VALUES ('4103', '洛阳市', '2', '41', '4103', '41', '0', '120', '', '');
INSERT INTO `ibt_region` VALUES ('4104', '平顶山市', '2', '41', '4104', '41', '0', '122', '', '');
INSERT INTO `ibt_region` VALUES ('4105', '安阳市', '2', '41', '4105', '41', '0', '116', '', '');
INSERT INTO `ibt_region` VALUES ('4106', '鹤壁市', '2', '41', '4106', '41', '0', '117', '', '');
INSERT INTO `ibt_region` VALUES ('4107', '新乡市', '2', '41', '4107', '41', '0', '125', '', '');
INSERT INTO `ibt_region` VALUES ('4108', '焦作市', '2', '41', '4108', '41', '0', '118', '', '');
INSERT INTO `ibt_region` VALUES ('4109', '濮阳市', '2', '41', '4109', '41', '0', '132', '', '');
INSERT INTO `ibt_region` VALUES ('4110', '许昌市', '2', '41', '4110', '41', '0', '127', '', '');
INSERT INTO `ibt_region` VALUES ('4111', '漯河市', '2', '41', '4111', '41', '0', '131', '', '');
INSERT INTO `ibt_region` VALUES ('4112', '三门峡市', '2', '41', '4112', '41', '0', '123', '', '');
INSERT INTO `ibt_region` VALUES ('4113', '南阳市', '2', '41', '4113', '41', '0', '121', '', '');
INSERT INTO `ibt_region` VALUES ('4114', '商丘市', '2', '41', '4114', '41', '0', '124', '', '');
INSERT INTO `ibt_region` VALUES ('4115', '信阳市', '2', '41', '4115', '41', '0', '126', '', '');
INSERT INTO `ibt_region` VALUES ('4116', '周口市', '2', '41', '4116', '41', '0', '129', '', '');
INSERT INTO `ibt_region` VALUES ('4117', '驻马店市', '2', '41', '4117', '41', '0', '130', '', '');
INSERT INTO `ibt_region` VALUES ('4190', '省直辖县级行政区划', '2', '41', '4190', '41', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('4201', '武汉市', '2', '42', '4201', '42', '0', '154', '', '');
INSERT INTO `ibt_region` VALUES ('4202', '黄石市', '2', '42', '4202', '42', '0', '149', '', '');
INSERT INTO `ibt_region` VALUES ('4203', '十堰市', '2', '42', '4203', '42', '0', '152', '', '');
INSERT INTO `ibt_region` VALUES ('4205', '宜昌市', '2', '42', '4205', '42', '0', '158', '', '');
INSERT INTO `ibt_region` VALUES ('4206', '襄阳市', '2', '42', '4206', '42', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('4207', '鄂州市', '2', '42', '4207', '42', '0', '146', '', '');
INSERT INTO `ibt_region` VALUES ('4208', '荆门市', '2', '42', '4208', '42', '0', '150', '', '');
INSERT INTO `ibt_region` VALUES ('4209', '孝感市', '2', '42', '4209', '42', '0', '157', '', '');
INSERT INTO `ibt_region` VALUES ('4210', '荆州市', '2', '42', '4210', '42', '0', '151', '', '');
INSERT INTO `ibt_region` VALUES ('4211', '黄冈市', '2', '42', '4211', '42', '0', '148', '', '');
INSERT INTO `ibt_region` VALUES ('4212', '咸宁市', '2', '42', '4212', '42', '0', '155', '', '');
INSERT INTO `ibt_region` VALUES ('4213', '随州市', '2', '42', '4213', '42', '0', '153', '', '');
INSERT INTO `ibt_region` VALUES ('4228', '恩施土家族苗族自治州', '2', '42', '4228', '42', '0', '147', '', '');
INSERT INTO `ibt_region` VALUES ('4290', '省直辖县级行政区划', '2', '42', '4290', '42', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('4301', '长沙市', '2', '43', '4301', '43', '0', '160', '', '');
INSERT INTO `ibt_region` VALUES ('4302', '株洲市', '2', '43', '4302', '43', '0', '172', '', '');
INSERT INTO `ibt_region` VALUES ('4303', '湘潭市', '2', '43', '4303', '43', '0', '166', '', '');
INSERT INTO `ibt_region` VALUES ('4304', '衡阳市', '2', '43', '4304', '43', '0', '162', '', '');
INSERT INTO `ibt_region` VALUES ('4305', '邵阳市', '2', '43', '4305', '43', '0', '165', '', '');
INSERT INTO `ibt_region` VALUES ('4306', '岳阳市', '2', '43', '4306', '43', '0', '170', '', '');
INSERT INTO `ibt_region` VALUES ('4307', '常德市', '2', '43', '4307', '43', '0', '159', '', '');
INSERT INTO `ibt_region` VALUES ('4308', '张家界市', '2', '43', '4308', '43', '0', '171', '', '');
INSERT INTO `ibt_region` VALUES ('4309', '益阳市', '2', '43', '4309', '43', '0', '168', '', '');
INSERT INTO `ibt_region` VALUES ('4310', '郴州市', '2', '43', '4310', '43', '0', '161', '', '');
INSERT INTO `ibt_region` VALUES ('4311', '永州市', '2', '43', '4311', '43', '0', '169', '', '');
INSERT INTO `ibt_region` VALUES ('4312', '怀化市', '2', '43', '4312', '43', '0', '163', '', '');
INSERT INTO `ibt_region` VALUES ('4313', '娄底市', '2', '43', '4313', '43', '0', '164', '', '');
INSERT INTO `ibt_region` VALUES ('4331', '湘西土家族苗族自治州', '2', '43', '4331', '43', '0', '167', '', '');
INSERT INTO `ibt_region` VALUES ('4401', '广州市', '2', '44', '4401', '44', '0', '62', '', '');
INSERT INTO `ibt_region` VALUES ('4402', '韶关市', '2', '44', '4402', '44', '0', '72', '', '');
INSERT INTO `ibt_region` VALUES ('4403', '深圳市', '2', '44', '4403', '44', '0', '73', '', '');
INSERT INTO `ibt_region` VALUES ('4404', '珠海市', '2', '44', '4404', '44', '0', '79', '', '');
INSERT INTO `ibt_region` VALUES ('4405', '汕头市', '2', '44', '4405', '44', '0', '70', '', '');
INSERT INTO `ibt_region` VALUES ('4406', '佛山市', '2', '44', '4406', '44', '0', '61', '', '');
INSERT INTO `ibt_region` VALUES ('4407', '江门市', '2', '44', '4407', '44', '0', '65', '', '');
INSERT INTO `ibt_region` VALUES ('4408', '湛江市', '2', '44', '4408', '44', '0', '76', '', '');
INSERT INTO `ibt_region` VALUES ('4409', '茂名市', '2', '44', '4409', '44', '0', '67', '', '');
INSERT INTO `ibt_region` VALUES ('4412', '肇庆市', '2', '44', '4412', '44', '0', '77', '', '');
INSERT INTO `ibt_region` VALUES ('4413', '惠州市', '2', '44', '4413', '44', '0', '64', '', '');
INSERT INTO `ibt_region` VALUES ('4414', '梅州市', '2', '44', '4414', '44', '0', '68', '', '');
INSERT INTO `ibt_region` VALUES ('4415', '汕尾市', '2', '44', '4415', '44', '0', '71', '', '');
INSERT INTO `ibt_region` VALUES ('4416', '河源市', '2', '44', '4416', '44', '0', '63', '', '');
INSERT INTO `ibt_region` VALUES ('4417', '阳江市', '2', '44', '4417', '44', '0', '74', '', '');
INSERT INTO `ibt_region` VALUES ('4418', '清远市', '2', '44', '4418', '44', '0', '69', '', '');
INSERT INTO `ibt_region` VALUES ('4419', '东莞市', '2', '44', '4419', '44', '0', '60', '', '');
INSERT INTO `ibt_region` VALUES ('4420', '中山市', '2', '44', '4420', '44', '0', '78', '', '');
INSERT INTO `ibt_region` VALUES ('4451', '潮州市', '2', '44', '4451', '44', '0', '59', '', '');
INSERT INTO `ibt_region` VALUES ('4452', '揭阳市', '2', '44', '4452', '44', '0', '66', '', '');
INSERT INTO `ibt_region` VALUES ('4453', '云浮市', '2', '44', '4453', '44', '0', '75', '', '');
INSERT INTO `ibt_region` VALUES ('4501', '南宁市', '2', '45', '4501', '45', '0', '90', '', '');
INSERT INTO `ibt_region` VALUES ('4502', '柳州市', '2', '45', '4502', '45', '0', '89', '', '');
INSERT INTO `ibt_region` VALUES ('4503', '桂林市', '2', '45', '4503', '45', '0', '84', '', '');
INSERT INTO `ibt_region` VALUES ('4504', '梧州市', '2', '45', '4504', '45', '0', '92', '', '');
INSERT INTO `ibt_region` VALUES ('4505', '北海市', '2', '45', '4505', '45', '0', '81', '', '');
INSERT INTO `ibt_region` VALUES ('4506', '防城港市', '2', '45', '4506', '45', '0', '83', '', '');
INSERT INTO `ibt_region` VALUES ('4507', '钦州市', '2', '45', '4507', '45', '0', '91', '', '');
INSERT INTO `ibt_region` VALUES ('4508', '贵港市', '2', '45', '4508', '45', '0', '85', '', '');
INSERT INTO `ibt_region` VALUES ('4509', '玉林市', '2', '45', '4509', '45', '0', '93', '', '');
INSERT INTO `ibt_region` VALUES ('4510', '百色市', '2', '45', '4510', '45', '0', '80', '', '');
INSERT INTO `ibt_region` VALUES ('4511', '贺州市', '2', '45', '4511', '45', '0', '87', '', '');
INSERT INTO `ibt_region` VALUES ('4512', '河池市', '2', '45', '4512', '45', '0', '86', '', '');
INSERT INTO `ibt_region` VALUES ('4513', '来宾市', '2', '45', '4513', '45', '0', '88', '', '');
INSERT INTO `ibt_region` VALUES ('4514', '崇左市', '2', '45', '4514', '45', '0', '82', '', '');
INSERT INTO `ibt_region` VALUES ('4601', '海口市', '2', '46', '4601', '46', '0', '103', '', '');
INSERT INTO `ibt_region` VALUES ('4602', '三亚市', '2', '46', '4602', '46', '0', '104', '', '');
INSERT INTO `ibt_region` VALUES ('4603', '三沙市', '2', '46', '4603', '46', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('4604', '儋州市', '2', '46', '4604', '46', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('4690', '省直辖县级行政区划', '2', '46', '4690', '46', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('5001', '重庆市', '2', '50', '5001', '50', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('5002', '县', '2', '50', '5002', '50', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('5101', '成都市', '2', '51', '5101', '51', '0', '304', '', '');
INSERT INTO `ibt_region` VALUES ('5103', '自贡市', '2', '51', '5103', '51', '0', '321', '', '');
INSERT INTO `ibt_region` VALUES ('5104', '攀枝花市', '2', '51', '5104', '51', '0', '316', '', '');
INSERT INTO `ibt_region` VALUES ('5105', '泸州市', '2', '51', '5105', '51', '0', '322', '', '');
INSERT INTO `ibt_region` VALUES ('5106', '德阳市', '2', '51', '5106', '51', '0', '306', '', '');
INSERT INTO `ibt_region` VALUES ('5107', '绵阳市', '2', '51', '5107', '51', '0', '313', '', '');
INSERT INTO `ibt_region` VALUES ('5108', '广元市', '2', '51', '5108', '51', '0', '309', '', '');
INSERT INTO `ibt_region` VALUES ('5109', '遂宁市', '2', '51', '5109', '51', '0', '317', '', '');
INSERT INTO `ibt_region` VALUES ('5110', '内江市', '2', '51', '5110', '51', '0', '315', '', '');
INSERT INTO `ibt_region` VALUES ('5111', '乐山市', '2', '51', '5111', '51', '0', '310', '', '');
INSERT INTO `ibt_region` VALUES ('5113', '南充市', '2', '51', '5113', '51', '0', '314', '', '');
INSERT INTO `ibt_region` VALUES ('5114', '眉山市', '2', '51', '5114', '51', '0', '312', '', '');
INSERT INTO `ibt_region` VALUES ('5115', '宜宾市', '2', '51', '5115', '51', '0', '319', '', '');
INSERT INTO `ibt_region` VALUES ('5116', '广安市', '2', '51', '5116', '51', '0', '308', '', '');
INSERT INTO `ibt_region` VALUES ('5117', '达州市', '2', '51', '5117', '51', '0', '305', '', '');
INSERT INTO `ibt_region` VALUES ('5118', '雅安市', '2', '51', '5118', '51', '0', '318', '', '');
INSERT INTO `ibt_region` VALUES ('5119', '巴中市', '2', '51', '5119', '51', '0', '303', '', '');
INSERT INTO `ibt_region` VALUES ('5120', '资阳市', '2', '51', '5120', '51', '0', '320', '', '');
INSERT INTO `ibt_region` VALUES ('5132', '阿坝藏族羌族自治州', '2', '51', '5132', '51', '0', '302', '', '');
INSERT INTO `ibt_region` VALUES ('5133', '甘孜藏族自治州', '2', '51', '5133', '51', '0', '307', '', '');
INSERT INTO `ibt_region` VALUES ('5134', '凉山彝族自治州', '2', '51', '5134', '51', '0', '311', '', '');
INSERT INTO `ibt_region` VALUES ('5201', '贵阳市', '2', '52', '5201', '52', '0', '96', '', '');
INSERT INTO `ibt_region` VALUES ('5202', '六盘水市', '2', '52', '5202', '52', '0', '97', '', '');
INSERT INTO `ibt_region` VALUES ('5203', '遵义市', '2', '52', '5203', '52', '0', '102', '', '');
INSERT INTO `ibt_region` VALUES ('5204', '安顺市', '2', '52', '5204', '52', '0', '94', '', '');
INSERT INTO `ibt_region` VALUES ('5205', '毕节市', '2', '52', '5205', '52', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('5206', '铜仁市', '2', '52', '5206', '52', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('5223', '黔西南布依族苗族自治州', '2', '52', '5223', '52', '0', '100', '', '');
INSERT INTO `ibt_region` VALUES ('5226', '黔东南苗族侗族自治州', '2', '52', '5226', '52', '0', '98', '', '');
INSERT INTO `ibt_region` VALUES ('5227', '黔南布依族苗族自治州', '2', '52', '5227', '52', '0', '99', '', '');
INSERT INTO `ibt_region` VALUES ('5301', '昆明市', '2', '53', '5301', '53', '0', '369', '', '');
INSERT INTO `ibt_region` VALUES ('5303', '曲靖市', '2', '53', '5303', '53', '0', '373', '', '');
INSERT INTO `ibt_region` VALUES ('5304', '玉溪市', '2', '53', '5304', '53', '0', '377', '', '');
INSERT INTO `ibt_region` VALUES ('5305', '保山市', '2', '53', '5305', '53', '0', '363', '', '');
INSERT INTO `ibt_region` VALUES ('5306', '昭通市', '2', '53', '5306', '53', '0', '378', '', '');
INSERT INTO `ibt_region` VALUES ('5307', '丽江市', '2', '53', '5307', '53', '0', '370', '', '');
INSERT INTO `ibt_region` VALUES ('5308', '普洱市', '2', '53', '5308', '53', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('5309', '临沧市', '2', '53', '5309', '53', '0', '371', '', '');
INSERT INTO `ibt_region` VALUES ('5323', '楚雄彝族自治州', '2', '53', '5323', '53', '0', '364', '', '');
INSERT INTO `ibt_region` VALUES ('5325', '红河哈尼族彝族自治州', '2', '53', '5325', '53', '0', '368', '', '');
INSERT INTO `ibt_region` VALUES ('5326', '文山壮族苗族自治州', '2', '53', '5326', '53', '0', '375', '', '');
INSERT INTO `ibt_region` VALUES ('5328', '西双版纳傣族自治州', '2', '53', '5328', '53', '0', '376', '', '');
INSERT INTO `ibt_region` VALUES ('5329', '大理白族自治州', '2', '53', '5329', '53', '0', '365', '', '');
INSERT INTO `ibt_region` VALUES ('5331', '德宏傣族景颇族自治州', '2', '53', '5331', '53', '0', '366', '', '');
INSERT INTO `ibt_region` VALUES ('5333', '怒江傈僳族自治州', '2', '53', '5333', '53', '0', '372', '', '');
INSERT INTO `ibt_region` VALUES ('5334', '迪庆藏族自治州', '2', '53', '5334', '53', '0', '367', '', '');
INSERT INTO `ibt_region` VALUES ('5401', '拉萨市', '2', '54', '5401', '54', '0', '343', '', '');
INSERT INTO `ibt_region` VALUES ('5402', '日喀则市', '2', '54', '5402', '54', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('5403', '昌都市', '2', '54', '5403', '54', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('5404', '林芝市', '2', '54', '5404', '54', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('5405', '山南市', '2', '54', '5405', '54', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('5424', '那曲地区', '2', '54', '5424', '54', '0', '345', '', '');
INSERT INTO `ibt_region` VALUES ('5425', '阿里地区', '2', '54', '5425', '54', '0', '341', '', '');
INSERT INTO `ibt_region` VALUES ('6101', '西安市', '2', '61', '6101', '61', '0', '279', '', '');
INSERT INTO `ibt_region` VALUES ('6102', '铜川市', '2', '61', '6102', '61', '0', '277', '', '');
INSERT INTO `ibt_region` VALUES ('6103', '宝鸡市', '2', '61', '6103', '61', '0', '274', '', '');
INSERT INTO `ibt_region` VALUES ('6104', '咸阳市', '2', '61', '6104', '61', '0', '280', '', '');
INSERT INTO `ibt_region` VALUES ('6105', '渭南市', '2', '61', '6105', '61', '0', '278', '', '');
INSERT INTO `ibt_region` VALUES ('6106', '延安市', '2', '61', '6106', '61', '0', '281', '', '');
INSERT INTO `ibt_region` VALUES ('6107', '汉中市', '2', '61', '6107', '61', '0', '275', '', '');
INSERT INTO `ibt_region` VALUES ('6108', '榆林市', '2', '61', '6108', '61', '0', '282', '', '');
INSERT INTO `ibt_region` VALUES ('6109', '安康市', '2', '61', '6109', '61', '0', '273', '', '');
INSERT INTO `ibt_region` VALUES ('6110', '商洛市', '2', '61', '6110', '61', '0', '276', '', '');
INSERT INTO `ibt_region` VALUES ('6201', '兰州市', '2', '62', '6201', '62', '0', '51', '', '');
INSERT INTO `ibt_region` VALUES ('6202', '嘉峪关市', '2', '62', '6202', '62', '0', '48', '', '');
INSERT INTO `ibt_region` VALUES ('6203', '金昌市', '2', '62', '6203', '62', '0', '49', '', '');
INSERT INTO `ibt_region` VALUES ('6204', '白银市', '2', '62', '6204', '62', '0', '45', '', '');
INSERT INTO `ibt_region` VALUES ('6205', '天水市', '2', '62', '6205', '62', '0', '56', '', '');
INSERT INTO `ibt_region` VALUES ('6206', '武威市', '2', '62', '6206', '62', '0', '57', '', '');
INSERT INTO `ibt_region` VALUES ('6207', '张掖市', '2', '62', '6207', '62', '0', '58', '', '');
INSERT INTO `ibt_region` VALUES ('6208', '平凉市', '2', '62', '6208', '62', '0', '54', '', '');
INSERT INTO `ibt_region` VALUES ('6209', '酒泉市', '2', '62', '6209', '62', '0', '50', '', '');
INSERT INTO `ibt_region` VALUES ('6210', '庆阳市', '2', '62', '6210', '62', '0', '55', '', '');
INSERT INTO `ibt_region` VALUES ('6211', '定西市', '2', '62', '6211', '62', '0', '46', '', '');
INSERT INTO `ibt_region` VALUES ('6212', '陇南市', '2', '62', '6212', '62', '0', '53', '', '');
INSERT INTO `ibt_region` VALUES ('6229', '临夏回族自治州', '2', '62', '6229', '62', '0', '52', '', '');
INSERT INTO `ibt_region` VALUES ('6230', '甘南藏族自治州', '2', '62', '6230', '62', '0', '47', '', '');
INSERT INTO `ibt_region` VALUES ('6301', '西宁市', '2', '63', '6301', '63', '0', '243', '', '');
INSERT INTO `ibt_region` VALUES ('6302', '海东市', '2', '63', '6302', '63', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('6322', '海北藏族自治州', '2', '63', '6322', '63', '0', '238', '', '');
INSERT INTO `ibt_region` VALUES ('6323', '黄南藏族自治州', '2', '63', '6323', '63', '0', '242', '', '');
INSERT INTO `ibt_region` VALUES ('6325', '海南藏族自治州', '2', '63', '6325', '63', '0', '240', '', '');
INSERT INTO `ibt_region` VALUES ('6326', '果洛藏族自治州', '2', '63', '6326', '63', '0', '237', '', '');
INSERT INTO `ibt_region` VALUES ('6327', '玉树藏族自治州', '2', '63', '6327', '63', '0', '244', '', '');
INSERT INTO `ibt_region` VALUES ('6328', '海西蒙古族藏族自治州', '2', '63', '6328', '63', '0', '241', '', '');
INSERT INTO `ibt_region` VALUES ('6401', '银川市', '2', '64', '6401', '64', '0', '235', '', '');
INSERT INTO `ibt_region` VALUES ('6402', '石嘴山市', '2', '64', '6402', '64', '0', '233', '', '');
INSERT INTO `ibt_region` VALUES ('6403', '吴忠市', '2', '64', '6403', '64', '0', '234', '', '');
INSERT INTO `ibt_region` VALUES ('6404', '固原市', '2', '64', '6404', '64', '0', '232', '', '');
INSERT INTO `ibt_region` VALUES ('6405', '中卫市', '2', '64', '6405', '64', '0', '236', '', '');
INSERT INTO `ibt_region` VALUES ('6501', '乌鲁木齐市', '2', '65', '6501', '65', '0', '361', '', '');
INSERT INTO `ibt_region` VALUES ('6502', '克拉玛依市', '2', '65', '6502', '65', '0', '356', '', '');
INSERT INTO `ibt_region` VALUES ('6504', '吐鲁番市', '2', '65', '6504', '65', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('6505', '哈密市', '2', '65', '6505', '65', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('6523', '昌吉回族自治州', '2', '65', '6523', '65', '0', '352', '', '');
INSERT INTO `ibt_region` VALUES ('6527', '博尔塔拉蒙古自治州', '2', '65', '6527', '65', '0', '351', '', '');
INSERT INTO `ibt_region` VALUES ('6528', '巴音郭楞蒙古自治州', '2', '65', '6528', '65', '0', '350', '', '');
INSERT INTO `ibt_region` VALUES ('6529', '阿克苏地区', '2', '65', '6529', '65', '0', '348', '', '');
INSERT INTO `ibt_region` VALUES ('6530', '克孜勒苏柯尔克孜自治州', '2', '65', '6530', '65', '0', '357', '', '');
INSERT INTO `ibt_region` VALUES ('6531', '喀什地区', '2', '65', '6531', '65', '0', '355', '', '');
INSERT INTO `ibt_region` VALUES ('6532', '和田地区', '2', '65', '6532', '65', '0', '354', '', '');
INSERT INTO `ibt_region` VALUES ('6540', '伊犁哈萨克自治州', '2', '65', '6540', '65', '0', '362', '', '');
INSERT INTO `ibt_region` VALUES ('6542', '塔城地区', '2', '65', '6542', '65', '0', '359', '', '');
INSERT INTO `ibt_region` VALUES ('6543', '阿勒泰地区', '2', '65', '6543', '65', '0', '349', '', '');
INSERT INTO `ibt_region` VALUES ('6590', '自治区直辖县级行政区划', '2', '65', '6590', '65', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('110101', '东城区', '3', '11', '1101', '1101', '0', '562', '', '');
INSERT INTO `ibt_region` VALUES ('110102', '西城区', '3', '11', '1101', '1101', '0', '551', '', '');
INSERT INTO `ibt_region` VALUES ('110105', '朝阳区', '3', '11', '1101', '1101', '0', '565', '', '');
INSERT INTO `ibt_region` VALUES ('110106', '丰台区', '3', '11', '1101', '1101', '0', '560', '', '');
INSERT INTO `ibt_region` VALUES ('110107', '石景山区', '3', '11', '1101', '1101', '0', '554', '', '');
INSERT INTO `ibt_region` VALUES ('110108', '海淀区', '3', '11', '1101', '1101', '0', '559', '', '');
INSERT INTO `ibt_region` VALUES ('110109', '门头沟区', '3', '11', '1101', '1101', '0', '557', '', '');
INSERT INTO `ibt_region` VALUES ('110111', '房山区', '3', '11', '1101', '1101', '0', '561', '', '');
INSERT INTO `ibt_region` VALUES ('110112', '通州区', '3', '11', '1101', '1101', '0', '552', '', '');
INSERT INTO `ibt_region` VALUES ('110113', '顺义区', '3', '11', '1101', '1101', '0', '553', '', '');
INSERT INTO `ibt_region` VALUES ('110114', '昌平区', '3', '11', '1101', '1101', '0', '566', '', '');
INSERT INTO `ibt_region` VALUES ('110115', '大兴区', '3', '11', '1101', '1101', '0', '563', '', '');
INSERT INTO `ibt_region` VALUES ('110116', '怀柔区', '3', '11', '1101', '1101', '0', '558', '', '');
INSERT INTO `ibt_region` VALUES ('110117', '平谷区', '3', '11', '1101', '1101', '0', '555', '', '');
INSERT INTO `ibt_region` VALUES ('110118', '密云区', '3', '11', '1101', '1101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('110119', '延庆区', '3', '11', '1101', '1101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('120101', '和平区', '3', '12', '1201', '1201', '0', '543', '', '');
INSERT INTO `ibt_region` VALUES ('120102', '河东区', '3', '12', '1201', '1201', '0', '541', '', '');
INSERT INTO `ibt_region` VALUES ('120103', '河西区', '3', '12', '1201', '1201', '0', '540', '', '');
INSERT INTO `ibt_region` VALUES ('120104', '南开区', '3', '12', '1201', '1201', '0', '534', '', '');
INSERT INTO `ibt_region` VALUES ('120105', '河北区', '3', '12', '1201', '1201', '0', '542', '', '');
INSERT INTO `ibt_region` VALUES ('120106', '红桥区', '3', '12', '1201', '1201', '0', '539', '', '');
INSERT INTO `ibt_region` VALUES ('120110', '东丽区', '3', '12', '1201', '1201', '0', '545', '', '');
INSERT INTO `ibt_region` VALUES ('120111', '西青区', '3', '12', '1201', '1201', '0', '531', '', '');
INSERT INTO `ibt_region` VALUES ('120112', '津南区', '3', '12', '1201', '1201', '0', '537', '', '');
INSERT INTO `ibt_region` VALUES ('120113', '北辰区', '3', '12', '1201', '1201', '0', '547', '', '');
INSERT INTO `ibt_region` VALUES ('120114', '武清区', '3', '12', '1201', '1201', '0', '532', '', '');
INSERT INTO `ibt_region` VALUES ('120115', '宝坻区', '3', '12', '1201', '1201', '0', '548', '', '');
INSERT INTO `ibt_region` VALUES ('120116', '滨海新区', '3', '12', '1201', '1201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('120117', '宁河区', '3', '12', '1201', '1201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('120118', '静海区', '3', '12', '1201', '1201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('120119', '蓟州区', '3', '12', '1201', '1201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130101', '市辖区', '3', '13', '1301', '1301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130102', '长安区', '3', '13', '1301', '1301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130104', '桥西区', '3', '13', '1301', '1301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130105', '新华区', '3', '13', '1301', '1301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130107', '井陉矿区', '3', '13', '1301', '1301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130108', '裕华区', '3', '13', '1301', '1301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130109', '藁城区', '3', '13', '1301', '1301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130110', '鹿泉区', '3', '13', '1301', '1301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130111', '栾城区', '3', '13', '1301', '1301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130121', '井陉县', '3', '13', '1301', '1301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130123', '正定县', '3', '13', '1301', '1301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130125', '行唐县', '3', '13', '1301', '1301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130126', '灵寿县', '3', '13', '1301', '1301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130127', '高邑县', '3', '13', '1301', '1301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130128', '深泽县', '3', '13', '1301', '1301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130129', '赞皇县', '3', '13', '1301', '1301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130130', '无极县', '3', '13', '1301', '1301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130131', '平山县', '3', '13', '1301', '1301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130132', '元氏县', '3', '13', '1301', '1301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130133', '赵县', '3', '13', '1301', '1301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130183', '晋州市', '3', '13', '1301', '1301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130184', '新乐市', '3', '13', '1301', '1301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130201', '市辖区', '3', '13', '1302', '1302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130202', '路南区', '3', '13', '1302', '1302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130203', '路北区', '3', '13', '1302', '1302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130204', '古冶区', '3', '13', '1302', '1302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130205', '开平区', '3', '13', '1302', '1302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130207', '丰南区', '3', '13', '1302', '1302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130208', '丰润区', '3', '13', '1302', '1302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130209', '曹妃甸区', '3', '13', '1302', '1302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130223', '滦县', '3', '13', '1302', '1302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130224', '滦南县', '3', '13', '1302', '1302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130225', '乐亭县', '3', '13', '1302', '1302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130227', '迁西县', '3', '13', '1302', '1302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130229', '玉田县', '3', '13', '1302', '1302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130281', '遵化市', '3', '13', '1302', '1302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130283', '迁安市', '3', '13', '1302', '1302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130301', '市辖区', '3', '13', '1303', '1303', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130302', '海港区', '3', '13', '1303', '1303', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130303', '山海关区', '3', '13', '1303', '1303', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130304', '北戴河区', '3', '13', '1303', '1303', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130306', '抚宁区', '3', '13', '1303', '1303', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130321', '青龙满族自治县', '3', '13', '1303', '1303', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130322', '昌黎县', '3', '13', '1303', '1303', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130324', '卢龙县', '3', '13', '1303', '1303', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130401', '市辖区', '3', '13', '1304', '1304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130402', '邯山区', '3', '13', '1304', '1304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130403', '丛台区', '3', '13', '1304', '1304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130404', '复兴区', '3', '13', '1304', '1304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130406', '峰峰矿区', '3', '13', '1304', '1304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130421', '邯郸县', '3', '13', '1304', '1304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130423', '临漳县', '3', '13', '1304', '1304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130424', '成安县', '3', '13', '1304', '1304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130425', '大名县', '3', '13', '1304', '1304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130426', '涉县', '3', '13', '1304', '1304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130427', '磁县', '3', '13', '1304', '1304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130428', '肥乡县', '3', '13', '1304', '1304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130429', '永年县', '3', '13', '1304', '1304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130430', '邱县', '3', '13', '1304', '1304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130431', '鸡泽县', '3', '13', '1304', '1304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130432', '广平县', '3', '13', '1304', '1304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130433', '馆陶县', '3', '13', '1304', '1304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130434', '魏县', '3', '13', '1304', '1304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130435', '曲周县', '3', '13', '1304', '1304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130481', '武安市', '3', '13', '1304', '1304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130501', '市辖区', '3', '13', '1305', '1305', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130502', '桥东区', '3', '13', '1305', '1305', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130503', '桥西区', '3', '13', '1305', '1305', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130521', '邢台县', '3', '13', '1305', '1305', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130522', '临城县', '3', '13', '1305', '1305', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130523', '内丘县', '3', '13', '1305', '1305', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130524', '柏乡县', '3', '13', '1305', '1305', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130525', '隆尧县', '3', '13', '1305', '1305', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130526', '任县', '3', '13', '1305', '1305', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130527', '南和县', '3', '13', '1305', '1305', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130528', '宁晋县', '3', '13', '1305', '1305', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130529', '巨鹿县', '3', '13', '1305', '1305', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130530', '新河县', '3', '13', '1305', '1305', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130531', '广宗县', '3', '13', '1305', '1305', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130532', '平乡县', '3', '13', '1305', '1305', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130533', '威县', '3', '13', '1305', '1305', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130534', '清河县', '3', '13', '1305', '1305', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130535', '临西县', '3', '13', '1305', '1305', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130581', '南宫市', '3', '13', '1305', '1305', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130582', '沙河市', '3', '13', '1305', '1305', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130601', '市辖区', '3', '13', '1306', '1306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130602', '竞秀区', '3', '13', '1306', '1306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130606', '莲池区', '3', '13', '1306', '1306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130607', '满城区', '3', '13', '1306', '1306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130608', '清苑区', '3', '13', '1306', '1306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130609', '徐水区', '3', '13', '1306', '1306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130623', '涞水县', '3', '13', '1306', '1306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130624', '阜平县', '3', '13', '1306', '1306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130626', '定兴县', '3', '13', '1306', '1306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130627', '唐县', '3', '13', '1306', '1306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130628', '高阳县', '3', '13', '1306', '1306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130629', '容城县', '3', '13', '1306', '1306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130630', '涞源县', '3', '13', '1306', '1306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130631', '望都县', '3', '13', '1306', '1306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130632', '安新县', '3', '13', '1306', '1306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130633', '易县', '3', '13', '1306', '1306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130634', '曲阳县', '3', '13', '1306', '1306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130635', '蠡县', '3', '13', '1306', '1306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130636', '顺平县', '3', '13', '1306', '1306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130637', '博野县', '3', '13', '1306', '1306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130638', '雄县', '3', '13', '1306', '1306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130681', '涿州市', '3', '13', '1306', '1306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130683', '安国市', '3', '13', '1306', '1306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130684', '高碑店市', '3', '13', '1306', '1306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130701', '市辖区', '3', '13', '1307', '1307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130702', '桥东区', '3', '13', '1307', '1307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130703', '桥西区', '3', '13', '1307', '1307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130705', '宣化区', '3', '13', '1307', '1307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130706', '下花园区', '3', '13', '1307', '1307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130708', '万全区', '3', '13', '1307', '1307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130709', '崇礼区', '3', '13', '1307', '1307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130722', '张北县', '3', '13', '1307', '1307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130723', '康保县', '3', '13', '1307', '1307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130724', '沽源县', '3', '13', '1307', '1307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130725', '尚义县', '3', '13', '1307', '1307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130726', '蔚县', '3', '13', '1307', '1307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130727', '阳原县', '3', '13', '1307', '1307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130728', '怀安县', '3', '13', '1307', '1307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130730', '怀来县', '3', '13', '1307', '1307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130731', '涿鹿县', '3', '13', '1307', '1307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130732', '赤城县', '3', '13', '1307', '1307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130801', '市辖区', '3', '13', '1308', '1308', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130802', '双桥区', '3', '13', '1308', '1308', '0', '492', '', '');
INSERT INTO `ibt_region` VALUES ('130803', '双滦区', '3', '13', '1308', '1308', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130804', '鹰手营子矿区', '3', '13', '1308', '1308', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130821', '承德县', '3', '13', '1308', '1308', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130822', '兴隆县', '3', '13', '1308', '1308', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130823', '平泉县', '3', '13', '1308', '1308', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130824', '滦平县', '3', '13', '1308', '1308', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130825', '隆化县', '3', '13', '1308', '1308', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130826', '丰宁满族自治县', '3', '13', '1308', '1308', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130827', '宽城满族自治县', '3', '13', '1308', '1308', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130828', '围场满族蒙古族自治县', '3', '13', '1308', '1308', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130901', '市辖区', '3', '13', '1309', '1309', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130902', '新华区', '3', '13', '1309', '1309', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130903', '运河区', '3', '13', '1309', '1309', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130921', '沧县', '3', '13', '1309', '1309', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130922', '青县', '3', '13', '1309', '1309', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130923', '东光县', '3', '13', '1309', '1309', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130924', '海兴县', '3', '13', '1309', '1309', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130925', '盐山县', '3', '13', '1309', '1309', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130926', '肃宁县', '3', '13', '1309', '1309', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130927', '南皮县', '3', '13', '1309', '1309', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130928', '吴桥县', '3', '13', '1309', '1309', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130929', '献县', '3', '13', '1309', '1309', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130930', '孟村回族自治县', '3', '13', '1309', '1309', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130981', '泊头市', '3', '13', '1309', '1309', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130982', '任丘市', '3', '13', '1309', '1309', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130983', '黄骅市', '3', '13', '1309', '1309', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('130984', '河间市', '3', '13', '1309', '1309', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('131001', '市辖区', '3', '13', '1310', '1310', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('131002', '安次区', '3', '13', '1310', '1310', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('131003', '广阳区', '3', '13', '1310', '1310', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('131022', '固安县', '3', '13', '1310', '1310', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('131023', '永清县', '3', '13', '1310', '1310', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('131024', '香河县', '3', '13', '1310', '1310', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('131025', '大城县', '3', '13', '1310', '1310', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('131026', '文安县', '3', '13', '1310', '1310', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('131028', '大厂回族自治县', '3', '13', '1310', '1310', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('131081', '霸州市', '3', '13', '1310', '1310', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('131082', '三河市', '3', '13', '1310', '1310', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('131101', '市辖区', '3', '13', '1311', '1311', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('131102', '桃城区', '3', '13', '1311', '1311', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('131103', '冀州区', '3', '13', '1311', '1311', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('131121', '枣强县', '3', '13', '1311', '1311', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('131122', '武邑县', '3', '13', '1311', '1311', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('131123', '武强县', '3', '13', '1311', '1311', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('131124', '饶阳县', '3', '13', '1311', '1311', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('131125', '安平县', '3', '13', '1311', '1311', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('131126', '故城县', '3', '13', '1311', '1311', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('131127', '景县', '3', '13', '1311', '1311', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('131128', '阜城县', '3', '13', '1311', '1311', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('131182', '深州市', '3', '13', '1311', '1311', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('139001', '定州市', '3', '13', '1390', '1390', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('139002', '辛集市', '3', '13', '1390', '1390', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140101', '市辖区', '3', '14', '1401', '1401', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140105', '小店区', '3', '14', '1401', '1401', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140106', '迎泽区', '3', '14', '1401', '1401', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140107', '杏花岭区', '3', '14', '1401', '1401', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140108', '尖草坪区', '3', '14', '1401', '1401', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140109', '万柏林区', '3', '14', '1401', '1401', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140110', '晋源区', '3', '14', '1401', '1401', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140121', '清徐县', '3', '14', '1401', '1401', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140122', '阳曲县', '3', '14', '1401', '1401', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140123', '娄烦县', '3', '14', '1401', '1401', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140181', '古交市', '3', '14', '1401', '1401', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140201', '市辖区', '3', '14', '1402', '1402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140202', '城区', '3', '14', '1402', '1402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140203', '矿区', '3', '14', '1402', '1402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140211', '南郊区', '3', '14', '1402', '1402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140212', '新荣区', '3', '14', '1402', '1402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140221', '阳高县', '3', '14', '1402', '1402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140222', '天镇县', '3', '14', '1402', '1402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140223', '广灵县', '3', '14', '1402', '1402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140224', '灵丘县', '3', '14', '1402', '1402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140225', '浑源县', '3', '14', '1402', '1402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140226', '左云县', '3', '14', '1402', '1402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140227', '大同县', '3', '14', '1402', '1402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140301', '市辖区', '3', '14', '1403', '1403', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140302', '城区', '3', '14', '1403', '1403', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140303', '矿区', '3', '14', '1403', '1403', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140311', '郊区', '3', '14', '1403', '1403', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140321', '平定县', '3', '14', '1403', '1403', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140322', '盂县', '3', '14', '1403', '1403', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140401', '市辖区', '3', '14', '1404', '1404', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140402', '城区', '3', '14', '1404', '1404', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140411', '郊区', '3', '14', '1404', '1404', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140421', '长治县', '3', '14', '1404', '1404', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140423', '襄垣县', '3', '14', '1404', '1404', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140424', '屯留县', '3', '14', '1404', '1404', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140425', '平顺县', '3', '14', '1404', '1404', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140426', '黎城县', '3', '14', '1404', '1404', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140427', '壶关县', '3', '14', '1404', '1404', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140428', '长子县', '3', '14', '1404', '1404', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140429', '武乡县', '3', '14', '1404', '1404', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140430', '沁县', '3', '14', '1404', '1404', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140431', '沁源县', '3', '14', '1404', '1404', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140481', '潞城市', '3', '14', '1404', '1404', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140501', '市辖区', '3', '14', '1405', '1405', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140502', '城区', '3', '14', '1405', '1405', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140521', '沁水县', '3', '14', '1405', '1405', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140522', '阳城县', '3', '14', '1405', '1405', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140524', '陵川县', '3', '14', '1405', '1405', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140525', '泽州县', '3', '14', '1405', '1405', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140581', '高平市', '3', '14', '1405', '1405', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140601', '市辖区', '3', '14', '1406', '1406', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140602', '朔城区', '3', '14', '1406', '1406', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140603', '平鲁区', '3', '14', '1406', '1406', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140621', '山阴县', '3', '14', '1406', '1406', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140622', '应县', '3', '14', '1406', '1406', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140623', '右玉县', '3', '14', '1406', '1406', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140624', '怀仁县', '3', '14', '1406', '1406', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140701', '市辖区', '3', '14', '1407', '1407', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140702', '榆次区', '3', '14', '1407', '1407', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140721', '榆社县', '3', '14', '1407', '1407', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140722', '左权县', '3', '14', '1407', '1407', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140723', '和顺县', '3', '14', '1407', '1407', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140724', '昔阳县', '3', '14', '1407', '1407', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140725', '寿阳县', '3', '14', '1407', '1407', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140726', '太谷县', '3', '14', '1407', '1407', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140727', '祁县', '3', '14', '1407', '1407', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140728', '平遥县', '3', '14', '1407', '1407', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140729', '灵石县', '3', '14', '1407', '1407', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140781', '介休市', '3', '14', '1407', '1407', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140801', '市辖区', '3', '14', '1408', '1408', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140802', '盐湖区', '3', '14', '1408', '1408', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140821', '临猗县', '3', '14', '1408', '1408', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140822', '万荣县', '3', '14', '1408', '1408', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140823', '闻喜县', '3', '14', '1408', '1408', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140824', '稷山县', '3', '14', '1408', '1408', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140825', '新绛县', '3', '14', '1408', '1408', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140826', '绛县', '3', '14', '1408', '1408', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140827', '垣曲县', '3', '14', '1408', '1408', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140828', '夏县', '3', '14', '1408', '1408', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140829', '平陆县', '3', '14', '1408', '1408', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140830', '芮城县', '3', '14', '1408', '1408', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140881', '永济市', '3', '14', '1408', '1408', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140882', '河津市', '3', '14', '1408', '1408', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140901', '市辖区', '3', '14', '1409', '1409', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140902', '忻府区', '3', '14', '1409', '1409', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140921', '定襄县', '3', '14', '1409', '1409', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140922', '五台县', '3', '14', '1409', '1409', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140923', '代县', '3', '14', '1409', '1409', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140924', '繁峙县', '3', '14', '1409', '1409', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140925', '宁武县', '3', '14', '1409', '1409', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140926', '静乐县', '3', '14', '1409', '1409', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140927', '神池县', '3', '14', '1409', '1409', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140928', '五寨县', '3', '14', '1409', '1409', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140929', '岢岚县', '3', '14', '1409', '1409', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140930', '河曲县', '3', '14', '1409', '1409', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140931', '保德县', '3', '14', '1409', '1409', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140932', '偏关县', '3', '14', '1409', '1409', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('140981', '原平市', '3', '14', '1409', '1409', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('141001', '市辖区', '3', '14', '1410', '1410', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('141002', '尧都区', '3', '14', '1410', '1410', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('141021', '曲沃县', '3', '14', '1410', '1410', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('141022', '翼城县', '3', '14', '1410', '1410', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('141023', '襄汾县', '3', '14', '1410', '1410', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('141024', '洪洞县', '3', '14', '1410', '1410', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('141025', '古县', '3', '14', '1410', '1410', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('141026', '安泽县', '3', '14', '1410', '1410', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('141027', '浮山县', '3', '14', '1410', '1410', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('141028', '吉县', '3', '14', '1410', '1410', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('141029', '乡宁县', '3', '14', '1410', '1410', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('141030', '大宁县', '3', '14', '1410', '1410', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('141031', '隰县', '3', '14', '1410', '1410', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('141032', '永和县', '3', '14', '1410', '1410', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('141033', '蒲县', '3', '14', '1410', '1410', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('141034', '汾西县', '3', '14', '1410', '1410', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('141081', '侯马市', '3', '14', '1410', '1410', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('141082', '霍州市', '3', '14', '1410', '1410', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('141101', '市辖区', '3', '14', '1411', '1411', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('141102', '离石区', '3', '14', '1411', '1411', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('141121', '文水县', '3', '14', '1411', '1411', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('141122', '交城县', '3', '14', '1411', '1411', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('141123', '兴县', '3', '14', '1411', '1411', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('141124', '临县', '3', '14', '1411', '1411', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('141125', '柳林县', '3', '14', '1411', '1411', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('141126', '石楼县', '3', '14', '1411', '1411', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('141127', '岚县', '3', '14', '1411', '1411', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('141128', '方山县', '3', '14', '1411', '1411', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('141129', '中阳县', '3', '14', '1411', '1411', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('141130', '交口县', '3', '14', '1411', '1411', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('141181', '孝义市', '3', '14', '1411', '1411', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('141182', '汾阳市', '3', '14', '1411', '1411', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150101', '市辖区', '3', '15', '1501', '1501', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150102', '新城区', '3', '15', '1501', '1501', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150103', '回民区', '3', '15', '1501', '1501', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150104', '玉泉区', '3', '15', '1501', '1501', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150105', '赛罕区', '3', '15', '1501', '1501', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150121', '土默特左旗', '3', '15', '1501', '1501', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150122', '托克托县', '3', '15', '1501', '1501', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150123', '和林格尔县', '3', '15', '1501', '1501', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150124', '清水河县', '3', '15', '1501', '1501', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150125', '武川县', '3', '15', '1501', '1501', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150201', '市辖区', '3', '15', '1502', '1502', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150202', '东河区', '3', '15', '1502', '1502', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150203', '昆都仑区', '3', '15', '1502', '1502', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150204', '青山区', '3', '15', '1502', '1502', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150205', '石拐区', '3', '15', '1502', '1502', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150206', '白云鄂博矿区', '3', '15', '1502', '1502', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150207', '九原区', '3', '15', '1502', '1502', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150221', '土默特右旗', '3', '15', '1502', '1502', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150222', '固阳县', '3', '15', '1502', '1502', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150223', '达尔罕茂明安联合旗', '3', '15', '1502', '1502', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150301', '市辖区', '3', '15', '1503', '1503', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150302', '海勃湾区', '3', '15', '1503', '1503', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150303', '海南区', '3', '15', '1503', '1503', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150304', '乌达区', '3', '15', '1503', '1503', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150401', '市辖区', '3', '15', '1504', '1504', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150402', '红山区', '3', '15', '1504', '1504', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150403', '元宝山区', '3', '15', '1504', '1504', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150404', '松山区', '3', '15', '1504', '1504', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150421', '阿鲁科尔沁旗', '3', '15', '1504', '1504', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150422', '巴林左旗', '3', '15', '1504', '1504', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150423', '巴林右旗', '3', '15', '1504', '1504', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150424', '林西县', '3', '15', '1504', '1504', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150425', '克什克腾旗', '3', '15', '1504', '1504', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150426', '翁牛特旗', '3', '15', '1504', '1504', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150428', '喀喇沁旗', '3', '15', '1504', '1504', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150429', '宁城县', '3', '15', '1504', '1504', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150430', '敖汉旗', '3', '15', '1504', '1504', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150501', '市辖区', '3', '15', '1505', '1505', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150502', '科尔沁区', '3', '15', '1505', '1505', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150521', '科尔沁左翼中旗', '3', '15', '1505', '1505', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150522', '科尔沁左翼后旗', '3', '15', '1505', '1505', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150523', '开鲁县', '3', '15', '1505', '1505', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150524', '库伦旗', '3', '15', '1505', '1505', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150525', '奈曼旗', '3', '15', '1505', '1505', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150526', '扎鲁特旗', '3', '15', '1505', '1505', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150581', '霍林郭勒市', '3', '15', '1505', '1505', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150601', '市辖区', '3', '15', '1506', '1506', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150602', '东胜区', '3', '15', '1506', '1506', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150603', '康巴什区', '3', '15', '1506', '1506', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150621', '达拉特旗', '3', '15', '1506', '1506', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150622', '准格尔旗', '3', '15', '1506', '1506', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150623', '鄂托克前旗', '3', '15', '1506', '1506', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150624', '鄂托克旗', '3', '15', '1506', '1506', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150625', '杭锦旗', '3', '15', '1506', '1506', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150626', '乌审旗', '3', '15', '1506', '1506', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150627', '伊金霍洛旗', '3', '15', '1506', '1506', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150701', '市辖区', '3', '15', '1507', '1507', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150702', '海拉尔区', '3', '15', '1507', '1507', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150703', '扎赉诺尔区', '3', '15', '1507', '1507', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150721', '阿荣旗', '3', '15', '1507', '1507', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150722', '莫力达瓦达斡尔族自治旗', '3', '15', '1507', '1507', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150723', '鄂伦春自治旗', '3', '15', '1507', '1507', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150724', '鄂温克族自治旗', '3', '15', '1507', '1507', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150725', '陈巴尔虎旗', '3', '15', '1507', '1507', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150726', '新巴尔虎左旗', '3', '15', '1507', '1507', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150727', '新巴尔虎右旗', '3', '15', '1507', '1507', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150781', '满洲里市', '3', '15', '1507', '1507', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150782', '牙克石市', '3', '15', '1507', '1507', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150783', '扎兰屯市', '3', '15', '1507', '1507', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150784', '额尔古纳市', '3', '15', '1507', '1507', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150785', '根河市', '3', '15', '1507', '1507', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150801', '市辖区', '3', '15', '1508', '1508', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150802', '临河区', '3', '15', '1508', '1508', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150821', '五原县', '3', '15', '1508', '1508', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150822', '磴口县', '3', '15', '1508', '1508', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150823', '乌拉特前旗', '3', '15', '1508', '1508', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150824', '乌拉特中旗', '3', '15', '1508', '1508', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150825', '乌拉特后旗', '3', '15', '1508', '1508', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150826', '杭锦后旗', '3', '15', '1508', '1508', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150901', '市辖区', '3', '15', '1509', '1509', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150902', '集宁区', '3', '15', '1509', '1509', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150921', '卓资县', '3', '15', '1509', '1509', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150922', '化德县', '3', '15', '1509', '1509', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150923', '商都县', '3', '15', '1509', '1509', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150924', '兴和县', '3', '15', '1509', '1509', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150925', '凉城县', '3', '15', '1509', '1509', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150926', '察哈尔右翼前旗', '3', '15', '1509', '1509', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150927', '察哈尔右翼中旗', '3', '15', '1509', '1509', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150928', '察哈尔右翼后旗', '3', '15', '1509', '1509', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150929', '四子王旗', '3', '15', '1509', '1509', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('150981', '丰镇市', '3', '15', '1509', '1509', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('152201', '乌兰浩特市', '3', '15', '1522', '1522', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('152202', '阿尔山市', '3', '15', '1522', '1522', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('152221', '科尔沁右翼前旗', '3', '15', '1522', '1522', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('152222', '科尔沁右翼中旗', '3', '15', '1522', '1522', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('152223', '扎赉特旗', '3', '15', '1522', '1522', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('152224', '突泉县', '3', '15', '1522', '1522', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('152501', '二连浩特市', '3', '15', '1525', '1525', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('152502', '锡林浩特市', '3', '15', '1525', '1525', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('152522', '阿巴嘎旗', '3', '15', '1525', '1525', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('152523', '苏尼特左旗', '3', '15', '1525', '1525', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('152524', '苏尼特右旗', '3', '15', '1525', '1525', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('152525', '东乌珠穆沁旗', '3', '15', '1525', '1525', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('152526', '西乌珠穆沁旗', '3', '15', '1525', '1525', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('152527', '太仆寺旗', '3', '15', '1525', '1525', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('152528', '镶黄旗', '3', '15', '1525', '1525', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('152529', '正镶白旗', '3', '15', '1525', '1525', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('152530', '正蓝旗', '3', '15', '1525', '1525', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('152531', '多伦县', '3', '15', '1525', '1525', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('152921', '阿拉善左旗', '3', '15', '1529', '1529', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('152922', '阿拉善右旗', '3', '15', '1529', '1529', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('152923', '额济纳旗', '3', '15', '1529', '1529', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210101', '市辖区', '3', '21', '2101', '2101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210102', '和平区', '3', '21', '2101', '2101', '0', '543', '', '');
INSERT INTO `ibt_region` VALUES ('210103', '沈河区', '3', '21', '2101', '2101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210104', '大东区', '3', '21', '2101', '2101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210105', '皇姑区', '3', '21', '2101', '2101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210106', '铁西区', '3', '21', '2101', '2101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210111', '苏家屯区', '3', '21', '2101', '2101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210112', '浑南区', '3', '21', '2101', '2101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210113', '沈北新区', '3', '21', '2101', '2101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210114', '于洪区', '3', '21', '2101', '2101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210115', '辽中区', '3', '21', '2101', '2101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210123', '康平县', '3', '21', '2101', '2101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210124', '法库县', '3', '21', '2101', '2101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210181', '新民市', '3', '21', '2101', '2101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210201', '市辖区', '3', '21', '2102', '2102', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210202', '中山区', '3', '21', '2102', '2102', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210203', '西岗区', '3', '21', '2102', '2102', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210204', '沙河口区', '3', '21', '2102', '2102', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210211', '甘井子区', '3', '21', '2102', '2102', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210212', '旅顺口区', '3', '21', '2102', '2102', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210213', '金州区', '3', '21', '2102', '2102', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210214', '普兰店区', '3', '21', '2102', '2102', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210224', '长海县', '3', '21', '2102', '2102', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210281', '瓦房店市', '3', '21', '2102', '2102', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210283', '庄河市', '3', '21', '2102', '2102', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210301', '市辖区', '3', '21', '2103', '2103', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210302', '铁东区', '3', '21', '2103', '2103', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210303', '铁西区', '3', '21', '2103', '2103', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210304', '立山区', '3', '21', '2103', '2103', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210311', '千山区', '3', '21', '2103', '2103', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210321', '台安县', '3', '21', '2103', '2103', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210323', '岫岩满族自治县', '3', '21', '2103', '2103', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210381', '海城市', '3', '21', '2103', '2103', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210401', '市辖区', '3', '21', '2104', '2104', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210402', '新抚区', '3', '21', '2104', '2104', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210403', '东洲区', '3', '21', '2104', '2104', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210404', '望花区', '3', '21', '2104', '2104', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210411', '顺城区', '3', '21', '2104', '2104', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210421', '抚顺县', '3', '21', '2104', '2104', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210422', '新宾满族自治县', '3', '21', '2104', '2104', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210423', '清原满族自治县', '3', '21', '2104', '2104', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210501', '市辖区', '3', '21', '2105', '2105', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210502', '平山区', '3', '21', '2105', '2105', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210503', '溪湖区', '3', '21', '2105', '2105', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210504', '明山区', '3', '21', '2105', '2105', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210505', '南芬区', '3', '21', '2105', '2105', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210521', '本溪满族自治县', '3', '21', '2105', '2105', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210522', '桓仁满族自治县', '3', '21', '2105', '2105', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210601', '市辖区', '3', '21', '2106', '2106', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210602', '元宝区', '3', '21', '2106', '2106', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210603', '振兴区', '3', '21', '2106', '2106', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210604', '振安区', '3', '21', '2106', '2106', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210624', '宽甸满族自治县', '3', '21', '2106', '2106', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210681', '东港市', '3', '21', '2106', '2106', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210682', '凤城市', '3', '21', '2106', '2106', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210701', '市辖区', '3', '21', '2107', '2107', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210702', '古塔区', '3', '21', '2107', '2107', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210703', '凌河区', '3', '21', '2107', '2107', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210711', '太和区', '3', '21', '2107', '2107', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210726', '黑山县', '3', '21', '2107', '2107', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210727', '义县', '3', '21', '2107', '2107', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210781', '凌海市', '3', '21', '2107', '2107', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210782', '北镇市', '3', '21', '2107', '2107', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210801', '市辖区', '3', '21', '2108', '2108', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210802', '站前区', '3', '21', '2108', '2108', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210803', '西市区', '3', '21', '2108', '2108', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210804', '鲅鱼圈区', '3', '21', '2108', '2108', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210811', '老边区', '3', '21', '2108', '2108', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210881', '盖州市', '3', '21', '2108', '2108', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210882', '大石桥市', '3', '21', '2108', '2108', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210901', '市辖区', '3', '21', '2109', '2109', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210902', '海州区', '3', '21', '2109', '2109', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210903', '新邱区', '3', '21', '2109', '2109', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210904', '太平区', '3', '21', '2109', '2109', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210905', '清河门区', '3', '21', '2109', '2109', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210911', '细河区', '3', '21', '2109', '2109', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210921', '阜新蒙古族自治县', '3', '21', '2109', '2109', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('210922', '彰武县', '3', '21', '2109', '2109', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('211001', '市辖区', '3', '21', '2110', '2110', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('211002', '白塔区', '3', '21', '2110', '2110', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('211003', '文圣区', '3', '21', '2110', '2110', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('211004', '宏伟区', '3', '21', '2110', '2110', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('211005', '弓长岭区', '3', '21', '2110', '2110', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('211011', '太子河区', '3', '21', '2110', '2110', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('211021', '辽阳县', '3', '21', '2110', '2110', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('211081', '灯塔市', '3', '21', '2110', '2110', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('211101', '市辖区', '3', '21', '2111', '2111', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('211102', '双台子区', '3', '21', '2111', '2111', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('211103', '兴隆台区', '3', '21', '2111', '2111', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('211104', '大洼区', '3', '21', '2111', '2111', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('211122', '盘山县', '3', '21', '2111', '2111', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('211201', '市辖区', '3', '21', '2112', '2112', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('211202', '银州区', '3', '21', '2112', '2112', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('211204', '清河区', '3', '21', '2112', '2112', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('211221', '铁岭县', '3', '21', '2112', '2112', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('211223', '西丰县', '3', '21', '2112', '2112', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('211224', '昌图县', '3', '21', '2112', '2112', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('211281', '调兵山市', '3', '21', '2112', '2112', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('211282', '开原市', '3', '21', '2112', '2112', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('211301', '市辖区', '3', '21', '2113', '2113', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('211302', '双塔区', '3', '21', '2113', '2113', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('211303', '龙城区', '3', '21', '2113', '2113', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('211321', '朝阳县', '3', '21', '2113', '2113', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('211322', '建平县', '3', '21', '2113', '2113', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('211324', '喀喇沁左翼蒙古族自治县', '3', '21', '2113', '2113', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('211381', '北票市', '3', '21', '2113', '2113', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('211382', '凌源市', '3', '21', '2113', '2113', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('211401', '市辖区', '3', '21', '2114', '2114', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('211402', '连山区', '3', '21', '2114', '2114', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('211403', '龙港区', '3', '21', '2114', '2114', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('211404', '南票区', '3', '21', '2114', '2114', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('211421', '绥中县', '3', '21', '2114', '2114', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('211422', '建昌县', '3', '21', '2114', '2114', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('211481', '兴城市', '3', '21', '2114', '2114', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220101', '市辖区', '3', '22', '2201', '2201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220102', '南关区', '3', '22', '2201', '2201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220103', '宽城区', '3', '22', '2201', '2201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220104', '朝阳区', '3', '22', '2201', '2201', '0', '565', '', '');
INSERT INTO `ibt_region` VALUES ('220105', '二道区', '3', '22', '2201', '2201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220106', '绿园区', '3', '22', '2201', '2201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220112', '双阳区', '3', '22', '2201', '2201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220113', '九台区', '3', '22', '2201', '2201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220122', '农安县', '3', '22', '2201', '2201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220182', '榆树市', '3', '22', '2201', '2201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220183', '德惠市', '3', '22', '2201', '2201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220201', '市辖区', '3', '22', '2202', '2202', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220202', '昌邑区', '3', '22', '2202', '2202', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220203', '龙潭区', '3', '22', '2202', '2202', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220204', '船营区', '3', '22', '2202', '2202', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220211', '丰满区', '3', '22', '2202', '2202', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220221', '永吉县', '3', '22', '2202', '2202', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220281', '蛟河市', '3', '22', '2202', '2202', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220282', '桦甸市', '3', '22', '2202', '2202', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220283', '舒兰市', '3', '22', '2202', '2202', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220284', '磐石市', '3', '22', '2202', '2202', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220301', '市辖区', '3', '22', '2203', '2203', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220302', '铁西区', '3', '22', '2203', '2203', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220303', '铁东区', '3', '22', '2203', '2203', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220322', '梨树县', '3', '22', '2203', '2203', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220323', '伊通满族自治县', '3', '22', '2203', '2203', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220381', '公主岭市', '3', '22', '2203', '2203', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220382', '双辽市', '3', '22', '2203', '2203', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220401', '市辖区', '3', '22', '2204', '2204', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220402', '龙山区', '3', '22', '2204', '2204', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220403', '西安区', '3', '22', '2204', '2204', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220421', '东丰县', '3', '22', '2204', '2204', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220422', '东辽县', '3', '22', '2204', '2204', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220501', '市辖区', '3', '22', '2205', '2205', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220502', '东昌区', '3', '22', '2205', '2205', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220503', '二道江区', '3', '22', '2205', '2205', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220521', '通化县', '3', '22', '2205', '2205', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220523', '辉南县', '3', '22', '2205', '2205', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220524', '柳河县', '3', '22', '2205', '2205', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220581', '梅河口市', '3', '22', '2205', '2205', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220582', '集安市', '3', '22', '2205', '2205', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220601', '市辖区', '3', '22', '2206', '2206', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220602', '浑江区', '3', '22', '2206', '2206', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220605', '江源区', '3', '22', '2206', '2206', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220621', '抚松县', '3', '22', '2206', '2206', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220622', '靖宇县', '3', '22', '2206', '2206', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220623', '长白朝鲜族自治县', '3', '22', '2206', '2206', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220681', '临江市', '3', '22', '2206', '2206', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220701', '市辖区', '3', '22', '2207', '2207', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220702', '宁江区', '3', '22', '2207', '2207', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220721', '前郭尔罗斯蒙古族自治县', '3', '22', '2207', '2207', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220722', '长岭县', '3', '22', '2207', '2207', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220723', '乾安县', '3', '22', '2207', '2207', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220781', '扶余市', '3', '22', '2207', '2207', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220801', '市辖区', '3', '22', '2208', '2208', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220802', '洮北区', '3', '22', '2208', '2208', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220821', '镇赉县', '3', '22', '2208', '2208', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220822', '通榆县', '3', '22', '2208', '2208', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220881', '洮南市', '3', '22', '2208', '2208', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('220882', '大安市', '3', '22', '2208', '2208', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('222401', '延吉市', '3', '22', '2224', '2224', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('222402', '图们市', '3', '22', '2224', '2224', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('222403', '敦化市', '3', '22', '2224', '2224', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('222404', '珲春市', '3', '22', '2224', '2224', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('222405', '龙井市', '3', '22', '2224', '2224', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('222406', '和龙市', '3', '22', '2224', '2224', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('222424', '汪清县', '3', '22', '2224', '2224', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('222426', '安图县', '3', '22', '2224', '2224', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230101', '市辖区', '3', '23', '2301', '2301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230102', '道里区', '3', '23', '2301', '2301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230103', '南岗区', '3', '23', '2301', '2301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230104', '道外区', '3', '23', '2301', '2301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230108', '平房区', '3', '23', '2301', '2301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230109', '松北区', '3', '23', '2301', '2301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230110', '香坊区', '3', '23', '2301', '2301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230111', '呼兰区', '3', '23', '2301', '2301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230112', '阿城区', '3', '23', '2301', '2301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230113', '双城区', '3', '23', '2301', '2301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230123', '依兰县', '3', '23', '2301', '2301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230124', '方正县', '3', '23', '2301', '2301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230125', '宾县', '3', '23', '2301', '2301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230126', '巴彦县', '3', '23', '2301', '2301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230127', '木兰县', '3', '23', '2301', '2301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230128', '通河县', '3', '23', '2301', '2301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230129', '延寿县', '3', '23', '2301', '2301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230183', '尚志市', '3', '23', '2301', '2301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230184', '五常市', '3', '23', '2301', '2301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230201', '市辖区', '3', '23', '2302', '2302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230202', '龙沙区', '3', '23', '2302', '2302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230203', '建华区', '3', '23', '2302', '2302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230204', '铁锋区', '3', '23', '2302', '2302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230205', '昂昂溪区', '3', '23', '2302', '2302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230206', '富拉尔基区', '3', '23', '2302', '2302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230207', '碾子山区', '3', '23', '2302', '2302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230208', '梅里斯达斡尔族区', '3', '23', '2302', '2302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230221', '龙江县', '3', '23', '2302', '2302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230223', '依安县', '3', '23', '2302', '2302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230224', '泰来县', '3', '23', '2302', '2302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230225', '甘南县', '3', '23', '2302', '2302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230227', '富裕县', '3', '23', '2302', '2302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230229', '克山县', '3', '23', '2302', '2302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230230', '克东县', '3', '23', '2302', '2302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230231', '拜泉县', '3', '23', '2302', '2302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230281', '讷河市', '3', '23', '2302', '2302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230301', '市辖区', '3', '23', '2303', '2303', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230302', '鸡冠区', '3', '23', '2303', '2303', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230303', '恒山区', '3', '23', '2303', '2303', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230304', '滴道区', '3', '23', '2303', '2303', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230305', '梨树区', '3', '23', '2303', '2303', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230306', '城子河区', '3', '23', '2303', '2303', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230307', '麻山区', '3', '23', '2303', '2303', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230321', '鸡东县', '3', '23', '2303', '2303', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230381', '虎林市', '3', '23', '2303', '2303', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230382', '密山市', '3', '23', '2303', '2303', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230401', '市辖区', '3', '23', '2304', '2304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230402', '向阳区', '3', '23', '2304', '2304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230403', '工农区', '3', '23', '2304', '2304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230404', '南山区', '3', '23', '2304', '2304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230405', '兴安区', '3', '23', '2304', '2304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230406', '东山区', '3', '23', '2304', '2304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230407', '兴山区', '3', '23', '2304', '2304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230421', '萝北县', '3', '23', '2304', '2304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230422', '绥滨县', '3', '23', '2304', '2304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230501', '市辖区', '3', '23', '2305', '2305', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230502', '尖山区', '3', '23', '2305', '2305', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230503', '岭东区', '3', '23', '2305', '2305', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230505', '四方台区', '3', '23', '2305', '2305', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230506', '宝山区', '3', '23', '2305', '2305', '0', '490', '', '');
INSERT INTO `ibt_region` VALUES ('230521', '集贤县', '3', '23', '2305', '2305', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230522', '友谊县', '3', '23', '2305', '2305', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230523', '宝清县', '3', '23', '2305', '2305', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230524', '饶河县', '3', '23', '2305', '2305', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230601', '市辖区', '3', '23', '2306', '2306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230602', '萨尔图区', '3', '23', '2306', '2306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230603', '龙凤区', '3', '23', '2306', '2306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230604', '让胡路区', '3', '23', '2306', '2306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230605', '红岗区', '3', '23', '2306', '2306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230606', '大同区', '3', '23', '2306', '2306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230621', '肇州县', '3', '23', '2306', '2306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230622', '肇源县', '3', '23', '2306', '2306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230623', '林甸县', '3', '23', '2306', '2306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230624', '杜尔伯特蒙古族自治县', '3', '23', '2306', '2306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230701', '市辖区', '3', '23', '2307', '2307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230702', '伊春区', '3', '23', '2307', '2307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230703', '南岔区', '3', '23', '2307', '2307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230704', '友好区', '3', '23', '2307', '2307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230705', '西林区', '3', '23', '2307', '2307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230706', '翠峦区', '3', '23', '2307', '2307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230707', '新青区', '3', '23', '2307', '2307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230708', '美溪区', '3', '23', '2307', '2307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230709', '金山屯区', '3', '23', '2307', '2307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230710', '五营区', '3', '23', '2307', '2307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230711', '乌马河区', '3', '23', '2307', '2307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230712', '汤旺河区', '3', '23', '2307', '2307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230713', '带岭区', '3', '23', '2307', '2307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230714', '乌伊岭区', '3', '23', '2307', '2307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230715', '红星区', '3', '23', '2307', '2307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230716', '上甘岭区', '3', '23', '2307', '2307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230722', '嘉荫县', '3', '23', '2307', '2307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230781', '铁力市', '3', '23', '2307', '2307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230801', '市辖区', '3', '23', '2308', '2308', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230803', '向阳区', '3', '23', '2308', '2308', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230804', '前进区', '3', '23', '2308', '2308', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230805', '东风区', '3', '23', '2308', '2308', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230811', '郊区', '3', '23', '2308', '2308', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230822', '桦南县', '3', '23', '2308', '2308', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230826', '桦川县', '3', '23', '2308', '2308', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230828', '汤原县', '3', '23', '2308', '2308', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230881', '同江市', '3', '23', '2308', '2308', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230882', '富锦市', '3', '23', '2308', '2308', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230883', '抚远市', '3', '23', '2308', '2308', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230901', '市辖区', '3', '23', '2309', '2309', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230902', '新兴区', '3', '23', '2309', '2309', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230903', '桃山区', '3', '23', '2309', '2309', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230904', '茄子河区', '3', '23', '2309', '2309', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('230921', '勃利县', '3', '23', '2309', '2309', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('231001', '市辖区', '3', '23', '2310', '2310', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('231002', '东安区', '3', '23', '2310', '2310', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('231003', '阳明区', '3', '23', '2310', '2310', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('231004', '爱民区', '3', '23', '2310', '2310', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('231005', '西安区', '3', '23', '2310', '2310', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('231025', '林口县', '3', '23', '2310', '2310', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('231081', '绥芬河市', '3', '23', '2310', '2310', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('231083', '海林市', '3', '23', '2310', '2310', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('231084', '宁安市', '3', '23', '2310', '2310', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('231085', '穆棱市', '3', '23', '2310', '2310', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('231086', '东宁市', '3', '23', '2310', '2310', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('231101', '市辖区', '3', '23', '2311', '2311', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('231102', '爱辉区', '3', '23', '2311', '2311', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('231121', '嫩江县', '3', '23', '2311', '2311', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('231123', '逊克县', '3', '23', '2311', '2311', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('231124', '孙吴县', '3', '23', '2311', '2311', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('231181', '北安市', '3', '23', '2311', '2311', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('231182', '五大连池市', '3', '23', '2311', '2311', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('231201', '市辖区', '3', '23', '2312', '2312', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('231202', '北林区', '3', '23', '2312', '2312', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('231221', '望奎县', '3', '23', '2312', '2312', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('231222', '兰西县', '3', '23', '2312', '2312', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('231223', '青冈县', '3', '23', '2312', '2312', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('231224', '庆安县', '3', '23', '2312', '2312', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('231225', '明水县', '3', '23', '2312', '2312', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('231226', '绥棱县', '3', '23', '2312', '2312', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('231281', '安达市', '3', '23', '2312', '2312', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('231282', '肇东市', '3', '23', '2312', '2312', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('231283', '海伦市', '3', '23', '2312', '2312', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('232721', '呼玛县', '3', '23', '2327', '2327', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('232722', '塔河县', '3', '23', '2327', '2327', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('232723', '漠河县', '3', '23', '2327', '2327', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('310101', '黄浦区', '3', '31', '3101', '3101', '0', '485', '', '');
INSERT INTO `ibt_region` VALUES ('310104', '徐汇区', '3', '31', '3101', '3101', '0', '475', '', '');
INSERT INTO `ibt_region` VALUES ('310105', '长宁区', '3', '31', '3101', '3101', '0', '489', '', '');
INSERT INTO `ibt_region` VALUES ('310106', '静安区', '3', '31', '3101', '3101', '0', '482', '', '');
INSERT INTO `ibt_region` VALUES ('310107', '普陀区', '3', '31', '3101', '3101', '0', '479', '', '');
INSERT INTO `ibt_region` VALUES ('310109', '虹口区', '3', '31', '3101', '3101', '0', '486', '', '');
INSERT INTO `ibt_region` VALUES ('310110', '杨浦区', '3', '31', '3101', '3101', '0', '474', '', '');
INSERT INTO `ibt_region` VALUES ('310112', '闵行区', '3', '31', '3101', '3101', '0', '472', '', '');
INSERT INTO `ibt_region` VALUES ('310113', '宝山区', '3', '31', '3101', '3101', '0', '490', '', '');
INSERT INTO `ibt_region` VALUES ('310114', '嘉定区', '3', '31', '3101', '3101', '0', '484', '', '');
INSERT INTO `ibt_region` VALUES ('310115', '浦东新区', '3', '31', '3101', '3101', '0', '478', '', '');
INSERT INTO `ibt_region` VALUES ('310116', '金山区', '3', '31', '3101', '3101', '0', '483', '', '');
INSERT INTO `ibt_region` VALUES ('310117', '松江区', '3', '31', '3101', '3101', '0', '476', '', '');
INSERT INTO `ibt_region` VALUES ('310118', '青浦区', '3', '31', '3101', '3101', '0', '477', '', '');
INSERT INTO `ibt_region` VALUES ('310120', '奉贤区', '3', '31', '3101', '3101', '0', '487', '', '');
INSERT INTO `ibt_region` VALUES ('310151', '崇明区', '3', '31', '3101', '3101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320101', '市辖区', '3', '32', '3201', '3201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320102', '玄武区', '3', '32', '3201', '3201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320104', '秦淮区', '3', '32', '3201', '3201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320105', '建邺区', '3', '32', '3201', '3201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320106', '鼓楼区', '3', '32', '3201', '3201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320111', '浦口区', '3', '32', '3201', '3201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320113', '栖霞区', '3', '32', '3201', '3201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320114', '雨花台区', '3', '32', '3201', '3201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320115', '江宁区', '3', '32', '3201', '3201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320116', '六合区', '3', '32', '3201', '3201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320117', '溧水区', '3', '32', '3201', '3201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320118', '高淳区', '3', '32', '3201', '3201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320201', '市辖区', '3', '32', '3202', '3202', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320205', '锡山区', '3', '32', '3202', '3202', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320206', '惠山区', '3', '32', '3202', '3202', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320211', '滨湖区', '3', '32', '3202', '3202', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320213', '梁溪区', '3', '32', '3202', '3202', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320214', '新吴区', '3', '32', '3202', '3202', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320281', '江阴市', '3', '32', '3202', '3202', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320282', '宜兴市', '3', '32', '3202', '3202', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320301', '市辖区', '3', '32', '3203', '3203', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320302', '鼓楼区', '3', '32', '3203', '3203', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320303', '云龙区', '3', '32', '3203', '3203', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320305', '贾汪区', '3', '32', '3203', '3203', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320311', '泉山区', '3', '32', '3203', '3203', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320312', '铜山区', '3', '32', '3203', '3203', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320321', '丰县', '3', '32', '3203', '3203', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320322', '沛县', '3', '32', '3203', '3203', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320324', '睢宁县', '3', '32', '3203', '3203', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320381', '新沂市', '3', '32', '3203', '3203', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320382', '邳州市', '3', '32', '3203', '3203', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320401', '市辖区', '3', '32', '3204', '3204', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320402', '天宁区', '3', '32', '3204', '3204', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320404', '钟楼区', '3', '32', '3204', '3204', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320411', '新北区', '3', '32', '3204', '3204', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320412', '武进区', '3', '32', '3204', '3204', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320413', '金坛区', '3', '32', '3204', '3204', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320481', '溧阳市', '3', '32', '3204', '3204', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320501', '市辖区', '3', '32', '3205', '3205', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320505', '虎丘区', '3', '32', '3205', '3205', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320506', '吴中区', '3', '32', '3205', '3205', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320507', '相城区', '3', '32', '3205', '3205', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320508', '姑苏区', '3', '32', '3205', '3205', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320509', '吴江区', '3', '32', '3205', '3205', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320581', '常熟市', '3', '32', '3205', '3205', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320582', '张家港市', '3', '32', '3205', '3205', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320583', '昆山市', '3', '32', '3205', '3205', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320585', '太仓市', '3', '32', '3205', '3205', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320601', '市辖区', '3', '32', '3206', '3206', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320602', '崇川区', '3', '32', '3206', '3206', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320611', '港闸区', '3', '32', '3206', '3206', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320612', '通州区', '3', '32', '3206', '3206', '0', '552', '', '');
INSERT INTO `ibt_region` VALUES ('320621', '海安县', '3', '32', '3206', '3206', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320623', '如东县', '3', '32', '3206', '3206', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320681', '启东市', '3', '32', '3206', '3206', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320682', '如皋市', '3', '32', '3206', '3206', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320684', '海门市', '3', '32', '3206', '3206', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320701', '市辖区', '3', '32', '3207', '3207', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320703', '连云区', '3', '32', '3207', '3207', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320706', '海州区', '3', '32', '3207', '3207', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320707', '赣榆区', '3', '32', '3207', '3207', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320722', '东海县', '3', '32', '3207', '3207', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320723', '灌云县', '3', '32', '3207', '3207', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320724', '灌南县', '3', '32', '3207', '3207', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320801', '市辖区', '3', '32', '3208', '3208', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320803', '淮安区', '3', '32', '3208', '3208', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320804', '淮阴区', '3', '32', '3208', '3208', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320812', '清江浦区', '3', '32', '3208', '3208', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320813', '洪泽区', '3', '32', '3208', '3208', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320826', '涟水县', '3', '32', '3208', '3208', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320830', '盱眙县', '3', '32', '3208', '3208', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320831', '金湖县', '3', '32', '3208', '3208', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320901', '市辖区', '3', '32', '3209', '3209', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320902', '亭湖区', '3', '32', '3209', '3209', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320903', '盐都区', '3', '32', '3209', '3209', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320904', '大丰区', '3', '32', '3209', '3209', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320921', '响水县', '3', '32', '3209', '3209', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320922', '滨海县', '3', '32', '3209', '3209', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320923', '阜宁县', '3', '32', '3209', '3209', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320924', '射阳县', '3', '32', '3209', '3209', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320925', '建湖县', '3', '32', '3209', '3209', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('320981', '东台市', '3', '32', '3209', '3209', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('321001', '市辖区', '3', '32', '3210', '3210', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('321002', '广陵区', '3', '32', '3210', '3210', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('321003', '邗江区', '3', '32', '3210', '3210', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('321012', '江都区', '3', '32', '3210', '3210', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('321023', '宝应县', '3', '32', '3210', '3210', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('321081', '仪征市', '3', '32', '3210', '3210', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('321084', '高邮市', '3', '32', '3210', '3210', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('321101', '市辖区', '3', '32', '3211', '3211', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('321102', '京口区', '3', '32', '3211', '3211', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('321111', '润州区', '3', '32', '3211', '3211', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('321112', '丹徒区', '3', '32', '3211', '3211', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('321181', '丹阳市', '3', '32', '3211', '3211', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('321182', '扬中市', '3', '32', '3211', '3211', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('321183', '句容市', '3', '32', '3211', '3211', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('321201', '市辖区', '3', '32', '3212', '3212', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('321202', '海陵区', '3', '32', '3212', '3212', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('321203', '高港区', '3', '32', '3212', '3212', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('321204', '姜堰区', '3', '32', '3212', '3212', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('321281', '兴化市', '3', '32', '3212', '3212', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('321282', '靖江市', '3', '32', '3212', '3212', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('321283', '泰兴市', '3', '32', '3212', '3212', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('321301', '市辖区', '3', '32', '3213', '3213', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('321302', '宿城区', '3', '32', '3213', '3213', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('321311', '宿豫区', '3', '32', '3213', '3213', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('321322', '沭阳县', '3', '32', '3213', '3213', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('321323', '泗阳县', '3', '32', '3213', '3213', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('321324', '泗洪县', '3', '32', '3213', '3213', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330101', '市辖区', '3', '33', '3301', '3301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330102', '上城区', '3', '33', '3301', '3301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330103', '下城区', '3', '33', '3301', '3301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330104', '江干区', '3', '33', '3301', '3301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330105', '拱墅区', '3', '33', '3301', '3301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330106', '西湖区', '3', '33', '3301', '3301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330108', '滨江区', '3', '33', '3301', '3301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330109', '萧山区', '3', '33', '3301', '3301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330110', '余杭区', '3', '33', '3301', '3301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330111', '富阳区', '3', '33', '3301', '3301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330122', '桐庐县', '3', '33', '3301', '3301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330127', '淳安县', '3', '33', '3301', '3301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330182', '建德市', '3', '33', '3301', '3301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330185', '临安市', '3', '33', '3301', '3301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330201', '市辖区', '3', '33', '3302', '3302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330203', '海曙区', '3', '33', '3302', '3302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330204', '江东区', '3', '33', '3302', '3302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330205', '江北区', '3', '33', '3302', '3302', '0', '504', '', '');
INSERT INTO `ibt_region` VALUES ('330206', '北仑区', '3', '33', '3302', '3302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330211', '镇海区', '3', '33', '3302', '3302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330212', '鄞州区', '3', '33', '3302', '3302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330225', '象山县', '3', '33', '3302', '3302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330226', '宁海县', '3', '33', '3302', '3302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330281', '余姚市', '3', '33', '3302', '3302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330282', '慈溪市', '3', '33', '3302', '3302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330283', '奉化市', '3', '33', '3302', '3302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330301', '市辖区', '3', '33', '3303', '3303', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330302', '鹿城区', '3', '33', '3303', '3303', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330303', '龙湾区', '3', '33', '3303', '3303', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330304', '瓯海区', '3', '33', '3303', '3303', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330305', '洞头区', '3', '33', '3303', '3303', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330324', '永嘉县', '3', '33', '3303', '3303', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330326', '平阳县', '3', '33', '3303', '3303', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330327', '苍南县', '3', '33', '3303', '3303', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330328', '文成县', '3', '33', '3303', '3303', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330329', '泰顺县', '3', '33', '3303', '3303', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330381', '瑞安市', '3', '33', '3303', '3303', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330382', '乐清市', '3', '33', '3303', '3303', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330401', '市辖区', '3', '33', '3304', '3304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330402', '南湖区', '3', '33', '3304', '3304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330411', '秀洲区', '3', '33', '3304', '3304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330421', '嘉善县', '3', '33', '3304', '3304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330424', '海盐县', '3', '33', '3304', '3304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330481', '海宁市', '3', '33', '3304', '3304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330482', '平湖市', '3', '33', '3304', '3304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330483', '桐乡市', '3', '33', '3304', '3304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330501', '市辖区', '3', '33', '3305', '3305', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330502', '吴兴区', '3', '33', '3305', '3305', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330503', '南浔区', '3', '33', '3305', '3305', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330521', '德清县', '3', '33', '3305', '3305', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330522', '长兴县', '3', '33', '3305', '3305', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330523', '安吉县', '3', '33', '3305', '3305', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330601', '市辖区', '3', '33', '3306', '3306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330602', '越城区', '3', '33', '3306', '3306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330603', '柯桥区', '3', '33', '3306', '3306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330604', '上虞区', '3', '33', '3306', '3306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330624', '新昌县', '3', '33', '3306', '3306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330681', '诸暨市', '3', '33', '3306', '3306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330683', '嵊州市', '3', '33', '3306', '3306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330701', '市辖区', '3', '33', '3307', '3307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330702', '婺城区', '3', '33', '3307', '3307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330703', '金东区', '3', '33', '3307', '3307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330723', '武义县', '3', '33', '3307', '3307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330726', '浦江县', '3', '33', '3307', '3307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330727', '磐安县', '3', '33', '3307', '3307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330781', '兰溪市', '3', '33', '3307', '3307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330782', '义乌市', '3', '33', '3307', '3307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330783', '东阳市', '3', '33', '3307', '3307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330784', '永康市', '3', '33', '3307', '3307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330801', '市辖区', '3', '33', '3308', '3308', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330802', '柯城区', '3', '33', '3308', '3308', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330803', '衢江区', '3', '33', '3308', '3308', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330822', '常山县', '3', '33', '3308', '3308', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330824', '开化县', '3', '33', '3308', '3308', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330825', '龙游县', '3', '33', '3308', '3308', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330881', '江山市', '3', '33', '3308', '3308', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330901', '市辖区', '3', '33', '3309', '3309', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330902', '定海区', '3', '33', '3309', '3309', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330903', '普陀区', '3', '33', '3309', '3309', '0', '479', '', '');
INSERT INTO `ibt_region` VALUES ('330921', '岱山县', '3', '33', '3309', '3309', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('330922', '嵊泗县', '3', '33', '3309', '3309', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('331001', '市辖区', '3', '33', '3310', '3310', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('331002', '椒江区', '3', '33', '3310', '3310', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('331003', '黄岩区', '3', '33', '3310', '3310', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('331004', '路桥区', '3', '33', '3310', '3310', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('331021', '玉环县', '3', '33', '3310', '3310', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('331022', '三门县', '3', '33', '3310', '3310', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('331023', '天台县', '3', '33', '3310', '3310', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('331024', '仙居县', '3', '33', '3310', '3310', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('331081', '温岭市', '3', '33', '3310', '3310', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('331082', '临海市', '3', '33', '3310', '3310', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('331101', '市辖区', '3', '33', '3311', '3311', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('331102', '莲都区', '3', '33', '3311', '3311', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('331121', '青田县', '3', '33', '3311', '3311', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('331122', '缙云县', '3', '33', '3311', '3311', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('331123', '遂昌县', '3', '33', '3311', '3311', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('331124', '松阳县', '3', '33', '3311', '3311', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('331125', '云和县', '3', '33', '3311', '3311', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('331126', '庆元县', '3', '33', '3311', '3311', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('331127', '景宁畲族自治县', '3', '33', '3311', '3311', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('331181', '龙泉市', '3', '33', '3311', '3311', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340101', '市辖区', '3', '34', '3401', '3401', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340102', '瑶海区', '3', '34', '3401', '3401', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340103', '庐阳区', '3', '34', '3401', '3401', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340104', '蜀山区', '3', '34', '3401', '3401', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340111', '包河区', '3', '34', '3401', '3401', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340121', '长丰县', '3', '34', '3401', '3401', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340122', '肥东县', '3', '34', '3401', '3401', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340123', '肥西县', '3', '34', '3401', '3401', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340124', '庐江县', '3', '34', '3401', '3401', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340181', '巢湖市', '3', '34', '3401', '3401', '0', '3', '', '');
INSERT INTO `ibt_region` VALUES ('340201', '市辖区', '3', '34', '3402', '3402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340202', '镜湖区', '3', '34', '3402', '3402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340203', '弋江区', '3', '34', '3402', '3402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340207', '鸠江区', '3', '34', '3402', '3402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340208', '三山区', '3', '34', '3402', '3402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340221', '芜湖县', '3', '34', '3402', '3402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340222', '繁昌县', '3', '34', '3402', '3402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340223', '南陵县', '3', '34', '3402', '3402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340225', '无为县', '3', '34', '3402', '3402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340301', '市辖区', '3', '34', '3403', '3403', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340302', '龙子湖区', '3', '34', '3403', '3403', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340303', '蚌山区', '3', '34', '3403', '3403', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340304', '禹会区', '3', '34', '3403', '3403', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340311', '淮上区', '3', '34', '3403', '3403', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340321', '怀远县', '3', '34', '3403', '3403', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340322', '五河县', '3', '34', '3403', '3403', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340323', '固镇县', '3', '34', '3403', '3403', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340401', '市辖区', '3', '34', '3404', '3404', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340402', '大通区', '3', '34', '3404', '3404', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340403', '田家庵区', '3', '34', '3404', '3404', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340404', '谢家集区', '3', '34', '3404', '3404', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340405', '八公山区', '3', '34', '3404', '3404', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340406', '潘集区', '3', '34', '3404', '3404', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340421', '凤台县', '3', '34', '3404', '3404', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340422', '寿县', '3', '34', '3404', '3404', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340501', '市辖区', '3', '34', '3405', '3405', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340503', '花山区', '3', '34', '3405', '3405', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340504', '雨山区', '3', '34', '3405', '3405', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340506', '博望区', '3', '34', '3405', '3405', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340521', '当涂县', '3', '34', '3405', '3405', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340522', '含山县', '3', '34', '3405', '3405', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340523', '和县', '3', '34', '3405', '3405', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340601', '市辖区', '3', '34', '3406', '3406', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340602', '杜集区', '3', '34', '3406', '3406', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340603', '相山区', '3', '34', '3406', '3406', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340604', '烈山区', '3', '34', '3406', '3406', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340621', '濉溪县', '3', '34', '3406', '3406', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340701', '市辖区', '3', '34', '3407', '3407', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340705', '铜官区', '3', '34', '3407', '3407', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340706', '义安区', '3', '34', '3407', '3407', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340711', '郊区', '3', '34', '3407', '3407', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340722', '枞阳县', '3', '34', '3407', '3407', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340801', '市辖区', '3', '34', '3408', '3408', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340802', '迎江区', '3', '34', '3408', '3408', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340803', '大观区', '3', '34', '3408', '3408', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340811', '宜秀区', '3', '34', '3408', '3408', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340822', '怀宁县', '3', '34', '3408', '3408', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340824', '潜山县', '3', '34', '3408', '3408', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340825', '太湖县', '3', '34', '3408', '3408', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340826', '宿松县', '3', '34', '3408', '3408', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340827', '望江县', '3', '34', '3408', '3408', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340828', '岳西县', '3', '34', '3408', '3408', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('340881', '桐城市', '3', '34', '3408', '3408', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341001', '市辖区', '3', '34', '3410', '3410', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341002', '屯溪区', '3', '34', '3410', '3410', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341003', '黄山区', '3', '34', '3410', '3410', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341004', '徽州区', '3', '34', '3410', '3410', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341021', '歙县', '3', '34', '3410', '3410', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341022', '休宁县', '3', '34', '3410', '3410', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341023', '黟县', '3', '34', '3410', '3410', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341024', '祁门县', '3', '34', '3410', '3410', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341101', '市辖区', '3', '34', '3411', '3411', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341102', '琅琊区', '3', '34', '3411', '3411', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341103', '南谯区', '3', '34', '3411', '3411', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341122', '来安县', '3', '34', '3411', '3411', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341124', '全椒县', '3', '34', '3411', '3411', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341125', '定远县', '3', '34', '3411', '3411', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341126', '凤阳县', '3', '34', '3411', '3411', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341181', '天长市', '3', '34', '3411', '3411', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341182', '明光市', '3', '34', '3411', '3411', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341201', '市辖区', '3', '34', '3412', '3412', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341202', '颍州区', '3', '34', '3412', '3412', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341203', '颍东区', '3', '34', '3412', '3412', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341204', '颍泉区', '3', '34', '3412', '3412', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341221', '临泉县', '3', '34', '3412', '3412', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341222', '太和县', '3', '34', '3412', '3412', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341225', '阜南县', '3', '34', '3412', '3412', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341226', '颍上县', '3', '34', '3412', '3412', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341282', '界首市', '3', '34', '3412', '3412', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341301', '市辖区', '3', '34', '3413', '3413', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341302', '埇桥区', '3', '34', '3413', '3413', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341321', '砀山县', '3', '34', '3413', '3413', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341322', '萧县', '3', '34', '3413', '3413', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341323', '灵璧县', '3', '34', '3413', '3413', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341324', '泗县', '3', '34', '3413', '3413', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341501', '市辖区', '3', '34', '3415', '3415', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341502', '金安区', '3', '34', '3415', '3415', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341503', '裕安区', '3', '34', '3415', '3415', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341504', '叶集区', '3', '34', '3415', '3415', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341522', '霍邱县', '3', '34', '3415', '3415', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341523', '舒城县', '3', '34', '3415', '3415', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341524', '金寨县', '3', '34', '3415', '3415', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341525', '霍山县', '3', '34', '3415', '3415', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341601', '市辖区', '3', '34', '3416', '3416', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341602', '谯城区', '3', '34', '3416', '3416', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341621', '涡阳县', '3', '34', '3416', '3416', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341622', '蒙城县', '3', '34', '3416', '3416', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341623', '利辛县', '3', '34', '3416', '3416', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341701', '市辖区', '3', '34', '3417', '3417', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341702', '贵池区', '3', '34', '3417', '3417', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341721', '东至县', '3', '34', '3417', '3417', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341722', '石台县', '3', '34', '3417', '3417', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341723', '青阳县', '3', '34', '3417', '3417', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341801', '市辖区', '3', '34', '3418', '3418', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341802', '宣州区', '3', '34', '3418', '3418', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341821', '郎溪县', '3', '34', '3418', '3418', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341822', '广德县', '3', '34', '3418', '3418', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341823', '泾县', '3', '34', '3418', '3418', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341824', '绩溪县', '3', '34', '3418', '3418', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341825', '旌德县', '3', '34', '3418', '3418', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('341881', '宁国市', '3', '34', '3418', '3418', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350101', '市辖区', '3', '35', '3501', '3501', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350102', '鼓楼区', '3', '35', '3501', '3501', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350103', '台江区', '3', '35', '3501', '3501', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350104', '仓山区', '3', '35', '3501', '3501', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350105', '马尾区', '3', '35', '3501', '3501', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350111', '晋安区', '3', '35', '3501', '3501', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350121', '闽侯县', '3', '35', '3501', '3501', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350122', '连江县', '3', '35', '3501', '3501', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350123', '罗源县', '3', '35', '3501', '3501', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350124', '闽清县', '3', '35', '3501', '3501', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350125', '永泰县', '3', '35', '3501', '3501', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350128', '平潭县', '3', '35', '3501', '3501', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350181', '福清市', '3', '35', '3501', '3501', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350182', '长乐市', '3', '35', '3501', '3501', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350201', '市辖区', '3', '35', '3502', '3502', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350203', '思明区', '3', '35', '3502', '3502', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350205', '海沧区', '3', '35', '3502', '3502', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350206', '湖里区', '3', '35', '3502', '3502', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350211', '集美区', '3', '35', '3502', '3502', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350212', '同安区', '3', '35', '3502', '3502', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350213', '翔安区', '3', '35', '3502', '3502', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350301', '市辖区', '3', '35', '3503', '3503', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350302', '城厢区', '3', '35', '3503', '3503', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350303', '涵江区', '3', '35', '3503', '3503', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350304', '荔城区', '3', '35', '3503', '3503', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350305', '秀屿区', '3', '35', '3503', '3503', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350322', '仙游县', '3', '35', '3503', '3503', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350401', '市辖区', '3', '35', '3504', '3504', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350402', '梅列区', '3', '35', '3504', '3504', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350403', '三元区', '3', '35', '3504', '3504', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350421', '明溪县', '3', '35', '3504', '3504', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350423', '清流县', '3', '35', '3504', '3504', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350424', '宁化县', '3', '35', '3504', '3504', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350425', '大田县', '3', '35', '3504', '3504', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350426', '尤溪县', '3', '35', '3504', '3504', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350427', '沙县', '3', '35', '3504', '3504', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350428', '将乐县', '3', '35', '3504', '3504', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350429', '泰宁县', '3', '35', '3504', '3504', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350430', '建宁县', '3', '35', '3504', '3504', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350481', '永安市', '3', '35', '3504', '3504', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350501', '市辖区', '3', '35', '3505', '3505', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350502', '鲤城区', '3', '35', '3505', '3505', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350503', '丰泽区', '3', '35', '3505', '3505', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350504', '洛江区', '3', '35', '3505', '3505', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350505', '泉港区', '3', '35', '3505', '3505', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350521', '惠安县', '3', '35', '3505', '3505', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350524', '安溪县', '3', '35', '3505', '3505', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350525', '永春县', '3', '35', '3505', '3505', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350526', '德化县', '3', '35', '3505', '3505', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350527', '金门县', '3', '35', '3505', '3505', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350581', '石狮市', '3', '35', '3505', '3505', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350582', '晋江市', '3', '35', '3505', '3505', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350583', '南安市', '3', '35', '3505', '3505', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350601', '市辖区', '3', '35', '3506', '3506', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350602', '芗城区', '3', '35', '3506', '3506', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350603', '龙文区', '3', '35', '3506', '3506', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350622', '云霄县', '3', '35', '3506', '3506', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350623', '漳浦县', '3', '35', '3506', '3506', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350624', '诏安县', '3', '35', '3506', '3506', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350625', '长泰县', '3', '35', '3506', '3506', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350626', '东山县', '3', '35', '3506', '3506', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350627', '南靖县', '3', '35', '3506', '3506', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350628', '平和县', '3', '35', '3506', '3506', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350629', '华安县', '3', '35', '3506', '3506', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350681', '龙海市', '3', '35', '3506', '3506', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350701', '市辖区', '3', '35', '3507', '3507', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350702', '延平区', '3', '35', '3507', '3507', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350703', '建阳区', '3', '35', '3507', '3507', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350721', '顺昌县', '3', '35', '3507', '3507', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350722', '浦城县', '3', '35', '3507', '3507', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350723', '光泽县', '3', '35', '3507', '3507', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350724', '松溪县', '3', '35', '3507', '3507', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350725', '政和县', '3', '35', '3507', '3507', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350781', '邵武市', '3', '35', '3507', '3507', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350782', '武夷山市', '3', '35', '3507', '3507', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350783', '建瓯市', '3', '35', '3507', '3507', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350801', '市辖区', '3', '35', '3508', '3508', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350802', '新罗区', '3', '35', '3508', '3508', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350803', '永定区', '3', '35', '3508', '3508', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350821', '长汀县', '3', '35', '3508', '3508', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350823', '上杭县', '3', '35', '3508', '3508', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350824', '武平县', '3', '35', '3508', '3508', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350825', '连城县', '3', '35', '3508', '3508', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350881', '漳平市', '3', '35', '3508', '3508', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350901', '市辖区', '3', '35', '3509', '3509', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350902', '蕉城区', '3', '35', '3509', '3509', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350921', '霞浦县', '3', '35', '3509', '3509', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350922', '古田县', '3', '35', '3509', '3509', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350923', '屏南县', '3', '35', '3509', '3509', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350924', '寿宁县', '3', '35', '3509', '3509', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350925', '周宁县', '3', '35', '3509', '3509', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350926', '柘荣县', '3', '35', '3509', '3509', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350981', '福安市', '3', '35', '3509', '3509', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('350982', '福鼎市', '3', '35', '3509', '3509', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360101', '市辖区', '3', '36', '3601', '3601', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360102', '东湖区', '3', '36', '3601', '3601', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360103', '西湖区', '3', '36', '3601', '3601', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360104', '青云谱区', '3', '36', '3601', '3601', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360105', '湾里区', '3', '36', '3601', '3601', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360111', '青山湖区', '3', '36', '3601', '3601', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360112', '新建区', '3', '36', '3601', '3601', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360121', '南昌县', '3', '36', '3601', '3601', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360123', '安义县', '3', '36', '3601', '3601', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360124', '进贤县', '3', '36', '3601', '3601', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360201', '市辖区', '3', '36', '3602', '3602', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360202', '昌江区', '3', '36', '3602', '3602', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360203', '珠山区', '3', '36', '3602', '3602', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360222', '浮梁县', '3', '36', '3602', '3602', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360281', '乐平市', '3', '36', '3602', '3602', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360301', '市辖区', '3', '36', '3603', '3603', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360302', '安源区', '3', '36', '3603', '3603', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360313', '湘东区', '3', '36', '3603', '3603', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360321', '莲花县', '3', '36', '3603', '3603', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360322', '上栗县', '3', '36', '3603', '3603', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360323', '芦溪县', '3', '36', '3603', '3603', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360401', '市辖区', '3', '36', '3604', '3604', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360402', '濂溪区', '3', '36', '3604', '3604', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360403', '浔阳区', '3', '36', '3604', '3604', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360421', '九江县', '3', '36', '3604', '3604', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360423', '武宁县', '3', '36', '3604', '3604', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360424', '修水县', '3', '36', '3604', '3604', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360425', '永修县', '3', '36', '3604', '3604', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360426', '德安县', '3', '36', '3604', '3604', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360428', '都昌县', '3', '36', '3604', '3604', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360429', '湖口县', '3', '36', '3604', '3604', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360430', '彭泽县', '3', '36', '3604', '3604', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360481', '瑞昌市', '3', '36', '3604', '3604', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360482', '共青城市', '3', '36', '3604', '3604', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360483', '庐山市', '3', '36', '3604', '3604', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360501', '市辖区', '3', '36', '3605', '3605', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360502', '渝水区', '3', '36', '3605', '3605', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360521', '分宜县', '3', '36', '3605', '3605', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360601', '市辖区', '3', '36', '3606', '3606', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360602', '月湖区', '3', '36', '3606', '3606', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360622', '余江县', '3', '36', '3606', '3606', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360681', '贵溪市', '3', '36', '3606', '3606', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360701', '市辖区', '3', '36', '3607', '3607', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360702', '章贡区', '3', '36', '3607', '3607', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360703', '南康区', '3', '36', '3607', '3607', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360721', '赣县', '3', '36', '3607', '3607', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360722', '信丰县', '3', '36', '3607', '3607', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360723', '大余县', '3', '36', '3607', '3607', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360724', '上犹县', '3', '36', '3607', '3607', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360725', '崇义县', '3', '36', '3607', '3607', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360726', '安远县', '3', '36', '3607', '3607', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360727', '龙南县', '3', '36', '3607', '3607', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360728', '定南县', '3', '36', '3607', '3607', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360729', '全南县', '3', '36', '3607', '3607', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360730', '宁都县', '3', '36', '3607', '3607', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360731', '于都县', '3', '36', '3607', '3607', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360732', '兴国县', '3', '36', '3607', '3607', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360733', '会昌县', '3', '36', '3607', '3607', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360734', '寻乌县', '3', '36', '3607', '3607', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360735', '石城县', '3', '36', '3607', '3607', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360781', '瑞金市', '3', '36', '3607', '3607', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360801', '市辖区', '3', '36', '3608', '3608', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360802', '吉州区', '3', '36', '3608', '3608', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360803', '青原区', '3', '36', '3608', '3608', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360821', '吉安县', '3', '36', '3608', '3608', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360822', '吉水县', '3', '36', '3608', '3608', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360823', '峡江县', '3', '36', '3608', '3608', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360824', '新干县', '3', '36', '3608', '3608', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360825', '永丰县', '3', '36', '3608', '3608', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360826', '泰和县', '3', '36', '3608', '3608', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360827', '遂川县', '3', '36', '3608', '3608', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360828', '万安县', '3', '36', '3608', '3608', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360829', '安福县', '3', '36', '3608', '3608', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360830', '永新县', '3', '36', '3608', '3608', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360881', '井冈山市', '3', '36', '3608', '3608', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360901', '市辖区', '3', '36', '3609', '3609', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360902', '袁州区', '3', '36', '3609', '3609', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360921', '奉新县', '3', '36', '3609', '3609', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360922', '万载县', '3', '36', '3609', '3609', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360923', '上高县', '3', '36', '3609', '3609', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360924', '宜丰县', '3', '36', '3609', '3609', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360925', '靖安县', '3', '36', '3609', '3609', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360926', '铜鼓县', '3', '36', '3609', '3609', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360981', '丰城市', '3', '36', '3609', '3609', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360982', '樟树市', '3', '36', '3609', '3609', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('360983', '高安市', '3', '36', '3609', '3609', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('361001', '市辖区', '3', '36', '3610', '3610', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('361002', '临川区', '3', '36', '3610', '3610', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('361021', '南城县', '3', '36', '3610', '3610', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('361022', '黎川县', '3', '36', '3610', '3610', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('361023', '南丰县', '3', '36', '3610', '3610', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('361024', '崇仁县', '3', '36', '3610', '3610', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('361025', '乐安县', '3', '36', '3610', '3610', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('361026', '宜黄县', '3', '36', '3610', '3610', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('361027', '金溪县', '3', '36', '3610', '3610', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('361028', '资溪县', '3', '36', '3610', '3610', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('361029', '东乡县', '3', '36', '3610', '3610', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('361030', '广昌县', '3', '36', '3610', '3610', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('361101', '市辖区', '3', '36', '3611', '3611', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('361102', '信州区', '3', '36', '3611', '3611', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('361103', '广丰区', '3', '36', '3611', '3611', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('361121', '上饶县', '3', '36', '3611', '3611', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('361123', '玉山县', '3', '36', '3611', '3611', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('361124', '铅山县', '3', '36', '3611', '3611', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('361125', '横峰县', '3', '36', '3611', '3611', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('361126', '弋阳县', '3', '36', '3611', '3611', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('361127', '余干县', '3', '36', '3611', '3611', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('361128', '鄱阳县', '3', '36', '3611', '3611', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('361129', '万年县', '3', '36', '3611', '3611', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('361130', '婺源县', '3', '36', '3611', '3611', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('361181', '德兴市', '3', '36', '3611', '3611', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370101', '市辖区', '3', '37', '3701', '3701', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370102', '历下区', '3', '37', '3701', '3701', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370103', '市中区', '3', '37', '3701', '3701', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370104', '槐荫区', '3', '37', '3701', '3701', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370105', '天桥区', '3', '37', '3701', '3701', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370112', '历城区', '3', '37', '3701', '3701', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370113', '长清区', '3', '37', '3701', '3701', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370124', '平阴县', '3', '37', '3701', '3701', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370125', '济阳县', '3', '37', '3701', '3701', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370126', '商河县', '3', '37', '3701', '3701', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370181', '章丘市', '3', '37', '3701', '3701', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370201', '市辖区', '3', '37', '3702', '3702', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370202', '市南区', '3', '37', '3702', '3702', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370203', '市北区', '3', '37', '3702', '3702', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370211', '黄岛区', '3', '37', '3702', '3702', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370212', '崂山区', '3', '37', '3702', '3702', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370213', '李沧区', '3', '37', '3702', '3702', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370214', '城阳区', '3', '37', '3702', '3702', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370281', '胶州市', '3', '37', '3702', '3702', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370282', '即墨市', '3', '37', '3702', '3702', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370283', '平度市', '3', '37', '3702', '3702', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370285', '莱西市', '3', '37', '3702', '3702', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370301', '市辖区', '3', '37', '3703', '3703', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370302', '淄川区', '3', '37', '3703', '3703', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370303', '张店区', '3', '37', '3703', '3703', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370304', '博山区', '3', '37', '3703', '3703', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370305', '临淄区', '3', '37', '3703', '3703', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370306', '周村区', '3', '37', '3703', '3703', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370321', '桓台县', '3', '37', '3703', '3703', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370322', '高青县', '3', '37', '3703', '3703', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370323', '沂源县', '3', '37', '3703', '3703', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370401', '市辖区', '3', '37', '3704', '3704', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370402', '市中区', '3', '37', '3704', '3704', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370403', '薛城区', '3', '37', '3704', '3704', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370404', '峄城区', '3', '37', '3704', '3704', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370405', '台儿庄区', '3', '37', '3704', '3704', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370406', '山亭区', '3', '37', '3704', '3704', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370481', '滕州市', '3', '37', '3704', '3704', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370501', '市辖区', '3', '37', '3705', '3705', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370502', '东营区', '3', '37', '3705', '3705', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370503', '河口区', '3', '37', '3705', '3705', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370505', '垦利区', '3', '37', '3705', '3705', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370522', '利津县', '3', '37', '3705', '3705', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370523', '广饶县', '3', '37', '3705', '3705', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370601', '市辖区', '3', '37', '3706', '3706', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370602', '芝罘区', '3', '37', '3706', '3706', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370611', '福山区', '3', '37', '3706', '3706', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370612', '牟平区', '3', '37', '3706', '3706', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370613', '莱山区', '3', '37', '3706', '3706', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370634', '长岛县', '3', '37', '3706', '3706', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370681', '龙口市', '3', '37', '3706', '3706', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370682', '莱阳市', '3', '37', '3706', '3706', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370683', '莱州市', '3', '37', '3706', '3706', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370684', '蓬莱市', '3', '37', '3706', '3706', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370685', '招远市', '3', '37', '3706', '3706', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370686', '栖霞市', '3', '37', '3706', '3706', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370687', '海阳市', '3', '37', '3706', '3706', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370701', '市辖区', '3', '37', '3707', '3707', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370702', '潍城区', '3', '37', '3707', '3707', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370703', '寒亭区', '3', '37', '3707', '3707', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370704', '坊子区', '3', '37', '3707', '3707', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370705', '奎文区', '3', '37', '3707', '3707', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370724', '临朐县', '3', '37', '3707', '3707', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370725', '昌乐县', '3', '37', '3707', '3707', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370781', '青州市', '3', '37', '3707', '3707', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370782', '诸城市', '3', '37', '3707', '3707', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370783', '寿光市', '3', '37', '3707', '3707', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370784', '安丘市', '3', '37', '3707', '3707', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370785', '高密市', '3', '37', '3707', '3707', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370786', '昌邑市', '3', '37', '3707', '3707', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370801', '市辖区', '3', '37', '3708', '3708', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370811', '任城区', '3', '37', '3708', '3708', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370812', '兖州区', '3', '37', '3708', '3708', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370826', '微山县', '3', '37', '3708', '3708', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370827', '鱼台县', '3', '37', '3708', '3708', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370828', '金乡县', '3', '37', '3708', '3708', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370829', '嘉祥县', '3', '37', '3708', '3708', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370830', '汶上县', '3', '37', '3708', '3708', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370831', '泗水县', '3', '37', '3708', '3708', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370832', '梁山县', '3', '37', '3708', '3708', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370881', '曲阜市', '3', '37', '3708', '3708', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370883', '邹城市', '3', '37', '3708', '3708', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370901', '市辖区', '3', '37', '3709', '3709', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370902', '泰山区', '3', '37', '3709', '3709', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370911', '岱岳区', '3', '37', '3709', '3709', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370921', '宁阳县', '3', '37', '3709', '3709', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370923', '东平县', '3', '37', '3709', '3709', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370982', '新泰市', '3', '37', '3709', '3709', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('370983', '肥城市', '3', '37', '3709', '3709', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371001', '市辖区', '3', '37', '3710', '3710', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371002', '环翠区', '3', '37', '3710', '3710', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371003', '文登区', '3', '37', '3710', '3710', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371082', '荣成市', '3', '37', '3710', '3710', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371083', '乳山市', '3', '37', '3710', '3710', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371101', '市辖区', '3', '37', '3711', '3711', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371102', '东港区', '3', '37', '3711', '3711', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371103', '岚山区', '3', '37', '3711', '3711', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371121', '五莲县', '3', '37', '3711', '3711', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371122', '莒县', '3', '37', '3711', '3711', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371201', '市辖区', '3', '37', '3712', '3712', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371202', '莱城区', '3', '37', '3712', '3712', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371203', '钢城区', '3', '37', '3712', '3712', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371301', '市辖区', '3', '37', '3713', '3713', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371302', '兰山区', '3', '37', '3713', '3713', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371311', '罗庄区', '3', '37', '3713', '3713', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371312', '河东区', '3', '37', '3713', '3713', '0', '541', '', '');
INSERT INTO `ibt_region` VALUES ('371321', '沂南县', '3', '37', '3713', '3713', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371322', '郯城县', '3', '37', '3713', '3713', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371323', '沂水县', '3', '37', '3713', '3713', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371324', '兰陵县', '3', '37', '3713', '3713', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371325', '费县', '3', '37', '3713', '3713', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371326', '平邑县', '3', '37', '3713', '3713', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371327', '莒南县', '3', '37', '3713', '3713', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371328', '蒙阴县', '3', '37', '3713', '3713', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371329', '临沭县', '3', '37', '3713', '3713', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371401', '市辖区', '3', '37', '3714', '3714', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371402', '德城区', '3', '37', '3714', '3714', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371403', '陵城区', '3', '37', '3714', '3714', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371422', '宁津县', '3', '37', '3714', '3714', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371423', '庆云县', '3', '37', '3714', '3714', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371424', '临邑县', '3', '37', '3714', '3714', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371425', '齐河县', '3', '37', '3714', '3714', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371426', '平原县', '3', '37', '3714', '3714', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371427', '夏津县', '3', '37', '3714', '3714', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371428', '武城县', '3', '37', '3714', '3714', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371481', '乐陵市', '3', '37', '3714', '3714', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371482', '禹城市', '3', '37', '3714', '3714', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371501', '市辖区', '3', '37', '3715', '3715', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371502', '东昌府区', '3', '37', '3715', '3715', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371521', '阳谷县', '3', '37', '3715', '3715', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371522', '莘县', '3', '37', '3715', '3715', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371523', '茌平县', '3', '37', '3715', '3715', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371524', '东阿县', '3', '37', '3715', '3715', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371525', '冠县', '3', '37', '3715', '3715', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371526', '高唐县', '3', '37', '3715', '3715', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371581', '临清市', '3', '37', '3715', '3715', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371601', '市辖区', '3', '37', '3716', '3716', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371602', '滨城区', '3', '37', '3716', '3716', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371603', '沾化区', '3', '37', '3716', '3716', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371621', '惠民县', '3', '37', '3716', '3716', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371622', '阳信县', '3', '37', '3716', '3716', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371623', '无棣县', '3', '37', '3716', '3716', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371625', '博兴县', '3', '37', '3716', '3716', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371626', '邹平县', '3', '37', '3716', '3716', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371701', '市辖区', '3', '37', '3717', '3717', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371702', '牡丹区', '3', '37', '3717', '3717', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371703', '定陶区', '3', '37', '3717', '3717', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371721', '曹县', '3', '37', '3717', '3717', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371722', '单县', '3', '37', '3717', '3717', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371723', '成武县', '3', '37', '3717', '3717', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371724', '巨野县', '3', '37', '3717', '3717', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371725', '郓城县', '3', '37', '3717', '3717', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371726', '鄄城县', '3', '37', '3717', '3717', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('371728', '东明县', '3', '37', '3717', '3717', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410101', '市辖区', '3', '41', '4101', '4101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410102', '中原区', '3', '41', '4101', '4101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410103', '二七区', '3', '41', '4101', '4101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410104', '管城回族区', '3', '41', '4101', '4101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410105', '金水区', '3', '41', '4101', '4101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410106', '上街区', '3', '41', '4101', '4101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410108', '惠济区', '3', '41', '4101', '4101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410122', '中牟县', '3', '41', '4101', '4101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410181', '巩义市', '3', '41', '4101', '4101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410182', '荥阳市', '3', '41', '4101', '4101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410183', '新密市', '3', '41', '4101', '4101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410184', '新郑市', '3', '41', '4101', '4101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410185', '登封市', '3', '41', '4101', '4101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410201', '市辖区', '3', '41', '4102', '4102', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410202', '龙亭区', '3', '41', '4102', '4102', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410203', '顺河回族区', '3', '41', '4102', '4102', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410204', '鼓楼区', '3', '41', '4102', '4102', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410205', '禹王台区', '3', '41', '4102', '4102', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410211', '金明区', '3', '41', '4102', '4102', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410212', '祥符区', '3', '41', '4102', '4102', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410221', '杞县', '3', '41', '4102', '4102', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410222', '通许县', '3', '41', '4102', '4102', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410223', '尉氏县', '3', '41', '4102', '4102', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410225', '兰考县', '3', '41', '4102', '4102', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410301', '市辖区', '3', '41', '4103', '4103', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410302', '老城区', '3', '41', '4103', '4103', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410303', '西工区', '3', '41', '4103', '4103', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410304', '瀍河回族区', '3', '41', '4103', '4103', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410305', '涧西区', '3', '41', '4103', '4103', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410306', '吉利区', '3', '41', '4103', '4103', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410311', '洛龙区', '3', '41', '4103', '4103', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410322', '孟津县', '3', '41', '4103', '4103', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410323', '新安县', '3', '41', '4103', '4103', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410324', '栾川县', '3', '41', '4103', '4103', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410325', '嵩县', '3', '41', '4103', '4103', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410326', '汝阳县', '3', '41', '4103', '4103', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410327', '宜阳县', '3', '41', '4103', '4103', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410328', '洛宁县', '3', '41', '4103', '4103', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410329', '伊川县', '3', '41', '4103', '4103', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410381', '偃师市', '3', '41', '4103', '4103', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410401', '市辖区', '3', '41', '4104', '4104', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410402', '新华区', '3', '41', '4104', '4104', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410403', '卫东区', '3', '41', '4104', '4104', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410404', '石龙区', '3', '41', '4104', '4104', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410411', '湛河区', '3', '41', '4104', '4104', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410421', '宝丰县', '3', '41', '4104', '4104', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410422', '叶县', '3', '41', '4104', '4104', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410423', '鲁山县', '3', '41', '4104', '4104', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410425', '郏县', '3', '41', '4104', '4104', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410481', '舞钢市', '3', '41', '4104', '4104', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410482', '汝州市', '3', '41', '4104', '4104', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410501', '市辖区', '3', '41', '4105', '4105', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410502', '文峰区', '3', '41', '4105', '4105', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410503', '北关区', '3', '41', '4105', '4105', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410505', '殷都区', '3', '41', '4105', '4105', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410506', '龙安区', '3', '41', '4105', '4105', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410522', '安阳县', '3', '41', '4105', '4105', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410523', '汤阴县', '3', '41', '4105', '4105', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410526', '滑县', '3', '41', '4105', '4105', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410527', '内黄县', '3', '41', '4105', '4105', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410581', '林州市', '3', '41', '4105', '4105', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410601', '市辖区', '3', '41', '4106', '4106', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410602', '鹤山区', '3', '41', '4106', '4106', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410603', '山城区', '3', '41', '4106', '4106', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410611', '淇滨区', '3', '41', '4106', '4106', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410621', '浚县', '3', '41', '4106', '4106', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410622', '淇县', '3', '41', '4106', '4106', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410701', '市辖区', '3', '41', '4107', '4107', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410702', '红旗区', '3', '41', '4107', '4107', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410703', '卫滨区', '3', '41', '4107', '4107', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410704', '凤泉区', '3', '41', '4107', '4107', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410711', '牧野区', '3', '41', '4107', '4107', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410721', '新乡县', '3', '41', '4107', '4107', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410724', '获嘉县', '3', '41', '4107', '4107', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410725', '原阳县', '3', '41', '4107', '4107', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410726', '延津县', '3', '41', '4107', '4107', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410727', '封丘县', '3', '41', '4107', '4107', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410728', '长垣县', '3', '41', '4107', '4107', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410781', '卫辉市', '3', '41', '4107', '4107', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410782', '辉县市', '3', '41', '4107', '4107', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410801', '市辖区', '3', '41', '4108', '4108', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410802', '解放区', '3', '41', '4108', '4108', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410803', '中站区', '3', '41', '4108', '4108', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410804', '马村区', '3', '41', '4108', '4108', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410811', '山阳区', '3', '41', '4108', '4108', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410821', '修武县', '3', '41', '4108', '4108', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410822', '博爱县', '3', '41', '4108', '4108', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410823', '武陟县', '3', '41', '4108', '4108', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410825', '温县', '3', '41', '4108', '4108', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410882', '沁阳市', '3', '41', '4108', '4108', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410883', '孟州市', '3', '41', '4108', '4108', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410901', '市辖区', '3', '41', '4109', '4109', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410902', '华龙区', '3', '41', '4109', '4109', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410922', '清丰县', '3', '41', '4109', '4109', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410923', '南乐县', '3', '41', '4109', '4109', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410926', '范县', '3', '41', '4109', '4109', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410927', '台前县', '3', '41', '4109', '4109', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('410928', '濮阳县', '3', '41', '4109', '4109', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411001', '市辖区', '3', '41', '4110', '4110', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411002', '魏都区', '3', '41', '4110', '4110', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411023', '许昌县', '3', '41', '4110', '4110', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411024', '鄢陵县', '3', '41', '4110', '4110', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411025', '襄城县', '3', '41', '4110', '4110', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411081', '禹州市', '3', '41', '4110', '4110', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411082', '长葛市', '3', '41', '4110', '4110', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411101', '市辖区', '3', '41', '4111', '4111', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411102', '源汇区', '3', '41', '4111', '4111', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411103', '郾城区', '3', '41', '4111', '4111', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411104', '召陵区', '3', '41', '4111', '4111', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411121', '舞阳县', '3', '41', '4111', '4111', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411122', '临颍县', '3', '41', '4111', '4111', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411201', '市辖区', '3', '41', '4112', '4112', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411202', '湖滨区', '3', '41', '4112', '4112', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411203', '陕州区', '3', '41', '4112', '4112', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411221', '渑池县', '3', '41', '4112', '4112', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411224', '卢氏县', '3', '41', '4112', '4112', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411281', '义马市', '3', '41', '4112', '4112', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411282', '灵宝市', '3', '41', '4112', '4112', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411301', '市辖区', '3', '41', '4113', '4113', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411302', '宛城区', '3', '41', '4113', '4113', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411303', '卧龙区', '3', '41', '4113', '4113', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411321', '南召县', '3', '41', '4113', '4113', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411322', '方城县', '3', '41', '4113', '4113', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411323', '西峡县', '3', '41', '4113', '4113', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411324', '镇平县', '3', '41', '4113', '4113', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411325', '内乡县', '3', '41', '4113', '4113', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411326', '淅川县', '3', '41', '4113', '4113', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411327', '社旗县', '3', '41', '4113', '4113', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411328', '唐河县', '3', '41', '4113', '4113', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411329', '新野县', '3', '41', '4113', '4113', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411330', '桐柏县', '3', '41', '4113', '4113', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411381', '邓州市', '3', '41', '4113', '4113', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411401', '市辖区', '3', '41', '4114', '4114', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411402', '梁园区', '3', '41', '4114', '4114', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411403', '睢阳区', '3', '41', '4114', '4114', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411421', '民权县', '3', '41', '4114', '4114', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411422', '睢县', '3', '41', '4114', '4114', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411423', '宁陵县', '3', '41', '4114', '4114', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411424', '柘城县', '3', '41', '4114', '4114', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411425', '虞城县', '3', '41', '4114', '4114', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411426', '夏邑县', '3', '41', '4114', '4114', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411481', '永城市', '3', '41', '4114', '4114', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411501', '市辖区', '3', '41', '4115', '4115', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411502', '浉河区', '3', '41', '4115', '4115', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411503', '平桥区', '3', '41', '4115', '4115', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411521', '罗山县', '3', '41', '4115', '4115', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411522', '光山县', '3', '41', '4115', '4115', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411523', '新县', '3', '41', '4115', '4115', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411524', '商城县', '3', '41', '4115', '4115', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411525', '固始县', '3', '41', '4115', '4115', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411526', '潢川县', '3', '41', '4115', '4115', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411527', '淮滨县', '3', '41', '4115', '4115', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411528', '息县', '3', '41', '4115', '4115', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411601', '市辖区', '3', '41', '4116', '4116', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411602', '川汇区', '3', '41', '4116', '4116', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411621', '扶沟县', '3', '41', '4116', '4116', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411622', '西华县', '3', '41', '4116', '4116', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411623', '商水县', '3', '41', '4116', '4116', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411624', '沈丘县', '3', '41', '4116', '4116', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411625', '郸城县', '3', '41', '4116', '4116', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411626', '淮阳县', '3', '41', '4116', '4116', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411627', '太康县', '3', '41', '4116', '4116', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411628', '鹿邑县', '3', '41', '4116', '4116', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411681', '项城市', '3', '41', '4116', '4116', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411701', '市辖区', '3', '41', '4117', '4117', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411702', '驿城区', '3', '41', '4117', '4117', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411721', '西平县', '3', '41', '4117', '4117', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411722', '上蔡县', '3', '41', '4117', '4117', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411723', '平舆县', '3', '41', '4117', '4117', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411724', '正阳县', '3', '41', '4117', '4117', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411725', '确山县', '3', '41', '4117', '4117', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411726', '泌阳县', '3', '41', '4117', '4117', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411727', '汝南县', '3', '41', '4117', '4117', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411728', '遂平县', '3', '41', '4117', '4117', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('411729', '新蔡县', '3', '41', '4117', '4117', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('419001', '济源市', '3', '41', '4190', '4190', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420101', '市辖区', '3', '42', '4201', '4201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420102', '江岸区', '3', '42', '4201', '4201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420103', '江汉区', '3', '42', '4201', '4201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420104', '硚口区', '3', '42', '4201', '4201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420105', '汉阳区', '3', '42', '4201', '4201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420106', '武昌区', '3', '42', '4201', '4201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420107', '青山区', '3', '42', '4201', '4201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420111', '洪山区', '3', '42', '4201', '4201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420112', '东西湖区', '3', '42', '4201', '4201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420113', '汉南区', '3', '42', '4201', '4201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420114', '蔡甸区', '3', '42', '4201', '4201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420115', '江夏区', '3', '42', '4201', '4201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420116', '黄陂区', '3', '42', '4201', '4201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420117', '新洲区', '3', '42', '4201', '4201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420201', '市辖区', '3', '42', '4202', '4202', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420202', '黄石港区', '3', '42', '4202', '4202', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420203', '西塞山区', '3', '42', '4202', '4202', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420204', '下陆区', '3', '42', '4202', '4202', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420205', '铁山区', '3', '42', '4202', '4202', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420222', '阳新县', '3', '42', '4202', '4202', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420281', '大冶市', '3', '42', '4202', '4202', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420301', '市辖区', '3', '42', '4203', '4203', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420302', '茅箭区', '3', '42', '4203', '4203', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420303', '张湾区', '3', '42', '4203', '4203', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420304', '郧阳区', '3', '42', '4203', '4203', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420322', '郧西县', '3', '42', '4203', '4203', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420323', '竹山县', '3', '42', '4203', '4203', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420324', '竹溪县', '3', '42', '4203', '4203', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420325', '房县', '3', '42', '4203', '4203', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420381', '丹江口市', '3', '42', '4203', '4203', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420501', '市辖区', '3', '42', '4205', '4205', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420502', '西陵区', '3', '42', '4205', '4205', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420503', '伍家岗区', '3', '42', '4205', '4205', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420504', '点军区', '3', '42', '4205', '4205', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420505', '猇亭区', '3', '42', '4205', '4205', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420506', '夷陵区', '3', '42', '4205', '4205', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420525', '远安县', '3', '42', '4205', '4205', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420526', '兴山县', '3', '42', '4205', '4205', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420527', '秭归县', '3', '42', '4205', '4205', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420528', '长阳土家族自治县', '3', '42', '4205', '4205', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420529', '五峰土家族自治县', '3', '42', '4205', '4205', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420581', '宜都市', '3', '42', '4205', '4205', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420582', '当阳市', '3', '42', '4205', '4205', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420583', '枝江市', '3', '42', '4205', '4205', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420601', '市辖区', '3', '42', '4206', '4206', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420602', '襄城区', '3', '42', '4206', '4206', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420606', '樊城区', '3', '42', '4206', '4206', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420607', '襄州区', '3', '42', '4206', '4206', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420624', '南漳县', '3', '42', '4206', '4206', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420625', '谷城县', '3', '42', '4206', '4206', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420626', '保康县', '3', '42', '4206', '4206', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420682', '老河口市', '3', '42', '4206', '4206', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420683', '枣阳市', '3', '42', '4206', '4206', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420684', '宜城市', '3', '42', '4206', '4206', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420701', '市辖区', '3', '42', '4207', '4207', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420702', '梁子湖区', '3', '42', '4207', '4207', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420703', '华容区', '3', '42', '4207', '4207', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420704', '鄂城区', '3', '42', '4207', '4207', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420801', '市辖区', '3', '42', '4208', '4208', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420802', '东宝区', '3', '42', '4208', '4208', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420804', '掇刀区', '3', '42', '4208', '4208', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420821', '京山县', '3', '42', '4208', '4208', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420822', '沙洋县', '3', '42', '4208', '4208', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420881', '钟祥市', '3', '42', '4208', '4208', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420901', '市辖区', '3', '42', '4209', '4209', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420902', '孝南区', '3', '42', '4209', '4209', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420921', '孝昌县', '3', '42', '4209', '4209', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420922', '大悟县', '3', '42', '4209', '4209', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420923', '云梦县', '3', '42', '4209', '4209', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420981', '应城市', '3', '42', '4209', '4209', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420982', '安陆市', '3', '42', '4209', '4209', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('420984', '汉川市', '3', '42', '4209', '4209', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('421001', '市辖区', '3', '42', '4210', '4210', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('421002', '沙市区', '3', '42', '4210', '4210', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('421003', '荆州区', '3', '42', '4210', '4210', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('421022', '公安县', '3', '42', '4210', '4210', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('421023', '监利县', '3', '42', '4210', '4210', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('421024', '江陵县', '3', '42', '4210', '4210', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('421081', '石首市', '3', '42', '4210', '4210', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('421083', '洪湖市', '3', '42', '4210', '4210', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('421087', '松滋市', '3', '42', '4210', '4210', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('421101', '市辖区', '3', '42', '4211', '4211', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('421102', '黄州区', '3', '42', '4211', '4211', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('421121', '团风县', '3', '42', '4211', '4211', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('421122', '红安县', '3', '42', '4211', '4211', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('421123', '罗田县', '3', '42', '4211', '4211', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('421124', '英山县', '3', '42', '4211', '4211', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('421125', '浠水县', '3', '42', '4211', '4211', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('421126', '蕲春县', '3', '42', '4211', '4211', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('421127', '黄梅县', '3', '42', '4211', '4211', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('421181', '麻城市', '3', '42', '4211', '4211', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('421182', '武穴市', '3', '42', '4211', '4211', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('421201', '市辖区', '3', '42', '4212', '4212', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('421202', '咸安区', '3', '42', '4212', '4212', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('421221', '嘉鱼县', '3', '42', '4212', '4212', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('421222', '通城县', '3', '42', '4212', '4212', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('421223', '崇阳县', '3', '42', '4212', '4212', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('421224', '通山县', '3', '42', '4212', '4212', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('421281', '赤壁市', '3', '42', '4212', '4212', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('421301', '市辖区', '3', '42', '4213', '4213', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('421303', '曾都区', '3', '42', '4213', '4213', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('421321', '随县', '3', '42', '4213', '4213', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('421381', '广水市', '3', '42', '4213', '4213', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('422801', '恩施市', '3', '42', '4228', '4228', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('422802', '利川市', '3', '42', '4228', '4228', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('422822', '建始县', '3', '42', '4228', '4228', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('422823', '巴东县', '3', '42', '4228', '4228', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('422825', '宣恩县', '3', '42', '4228', '4228', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('422826', '咸丰县', '3', '42', '4228', '4228', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('422827', '来凤县', '3', '42', '4228', '4228', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('422828', '鹤峰县', '3', '42', '4228', '4228', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('429004', '仙桃市', '3', '42', '4290', '4290', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('429005', '潜江市', '3', '42', '4290', '4290', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('429006', '天门市', '3', '42', '4290', '4290', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('429021', '神农架林区', '3', '42', '4290', '4290', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430101', '市辖区', '3', '43', '4301', '4301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430102', '芙蓉区', '3', '43', '4301', '4301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430103', '天心区', '3', '43', '4301', '4301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430104', '岳麓区', '3', '43', '4301', '4301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430105', '开福区', '3', '43', '4301', '4301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430111', '雨花区', '3', '43', '4301', '4301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430112', '望城区', '3', '43', '4301', '4301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430121', '长沙县', '3', '43', '4301', '4301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430124', '宁乡县', '3', '43', '4301', '4301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430181', '浏阳市', '3', '43', '4301', '4301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430201', '市辖区', '3', '43', '4302', '4302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430202', '荷塘区', '3', '43', '4302', '4302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430203', '芦淞区', '3', '43', '4302', '4302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430204', '石峰区', '3', '43', '4302', '4302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430211', '天元区', '3', '43', '4302', '4302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430221', '株洲县', '3', '43', '4302', '4302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430223', '攸县', '3', '43', '4302', '4302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430224', '茶陵县', '3', '43', '4302', '4302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430225', '炎陵县', '3', '43', '4302', '4302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430281', '醴陵市', '3', '43', '4302', '4302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430301', '市辖区', '3', '43', '4303', '4303', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430302', '雨湖区', '3', '43', '4303', '4303', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430304', '岳塘区', '3', '43', '4303', '4303', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430321', '湘潭县', '3', '43', '4303', '4303', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430381', '湘乡市', '3', '43', '4303', '4303', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430382', '韶山市', '3', '43', '4303', '4303', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430401', '市辖区', '3', '43', '4304', '4304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430405', '珠晖区', '3', '43', '4304', '4304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430406', '雁峰区', '3', '43', '4304', '4304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430407', '石鼓区', '3', '43', '4304', '4304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430408', '蒸湘区', '3', '43', '4304', '4304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430412', '南岳区', '3', '43', '4304', '4304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430421', '衡阳县', '3', '43', '4304', '4304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430422', '衡南县', '3', '43', '4304', '4304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430423', '衡山县', '3', '43', '4304', '4304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430424', '衡东县', '3', '43', '4304', '4304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430426', '祁东县', '3', '43', '4304', '4304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430481', '耒阳市', '3', '43', '4304', '4304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430482', '常宁市', '3', '43', '4304', '4304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430501', '市辖区', '3', '43', '4305', '4305', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430502', '双清区', '3', '43', '4305', '4305', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430503', '大祥区', '3', '43', '4305', '4305', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430511', '北塔区', '3', '43', '4305', '4305', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430521', '邵东县', '3', '43', '4305', '4305', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430522', '新邵县', '3', '43', '4305', '4305', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430523', '邵阳县', '3', '43', '4305', '4305', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430524', '隆回县', '3', '43', '4305', '4305', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430525', '洞口县', '3', '43', '4305', '4305', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430527', '绥宁县', '3', '43', '4305', '4305', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430528', '新宁县', '3', '43', '4305', '4305', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430529', '城步苗族自治县', '3', '43', '4305', '4305', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430581', '武冈市', '3', '43', '4305', '4305', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430601', '市辖区', '3', '43', '4306', '4306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430602', '岳阳楼区', '3', '43', '4306', '4306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430603', '云溪区', '3', '43', '4306', '4306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430611', '君山区', '3', '43', '4306', '4306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430621', '岳阳县', '3', '43', '4306', '4306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430623', '华容县', '3', '43', '4306', '4306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430624', '湘阴县', '3', '43', '4306', '4306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430626', '平江县', '3', '43', '4306', '4306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430681', '汨罗市', '3', '43', '4306', '4306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430682', '临湘市', '3', '43', '4306', '4306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430701', '市辖区', '3', '43', '4307', '4307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430702', '武陵区', '3', '43', '4307', '4307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430703', '鼎城区', '3', '43', '4307', '4307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430721', '安乡县', '3', '43', '4307', '4307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430722', '汉寿县', '3', '43', '4307', '4307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430723', '澧县', '3', '43', '4307', '4307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430724', '临澧县', '3', '43', '4307', '4307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430725', '桃源县', '3', '43', '4307', '4307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430726', '石门县', '3', '43', '4307', '4307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430781', '津市市', '3', '43', '4307', '4307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430801', '市辖区', '3', '43', '4308', '4308', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430802', '永定区', '3', '43', '4308', '4308', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430811', '武陵源区', '3', '43', '4308', '4308', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430821', '慈利县', '3', '43', '4308', '4308', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430822', '桑植县', '3', '43', '4308', '4308', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430901', '市辖区', '3', '43', '4309', '4309', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430902', '资阳区', '3', '43', '4309', '4309', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430903', '赫山区', '3', '43', '4309', '4309', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430921', '南县', '3', '43', '4309', '4309', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430922', '桃江县', '3', '43', '4309', '4309', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430923', '安化县', '3', '43', '4309', '4309', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('430981', '沅江市', '3', '43', '4309', '4309', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('431001', '市辖区', '3', '43', '4310', '4310', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('431002', '北湖区', '3', '43', '4310', '4310', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('431003', '苏仙区', '3', '43', '4310', '4310', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('431021', '桂阳县', '3', '43', '4310', '4310', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('431022', '宜章县', '3', '43', '4310', '4310', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('431023', '永兴县', '3', '43', '4310', '4310', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('431024', '嘉禾县', '3', '43', '4310', '4310', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('431025', '临武县', '3', '43', '4310', '4310', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('431026', '汝城县', '3', '43', '4310', '4310', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('431027', '桂东县', '3', '43', '4310', '4310', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('431028', '安仁县', '3', '43', '4310', '4310', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('431081', '资兴市', '3', '43', '4310', '4310', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('431101', '市辖区', '3', '43', '4311', '4311', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('431102', '零陵区', '3', '43', '4311', '4311', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('431103', '冷水滩区', '3', '43', '4311', '4311', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('431121', '祁阳县', '3', '43', '4311', '4311', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('431122', '东安县', '3', '43', '4311', '4311', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('431123', '双牌县', '3', '43', '4311', '4311', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('431124', '道县', '3', '43', '4311', '4311', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('431125', '江永县', '3', '43', '4311', '4311', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('431126', '宁远县', '3', '43', '4311', '4311', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('431127', '蓝山县', '3', '43', '4311', '4311', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('431128', '新田县', '3', '43', '4311', '4311', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('431129', '江华瑶族自治县', '3', '43', '4311', '4311', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('431201', '市辖区', '3', '43', '4312', '4312', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('431202', '鹤城区', '3', '43', '4312', '4312', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('431221', '中方县', '3', '43', '4312', '4312', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('431222', '沅陵县', '3', '43', '4312', '4312', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('431223', '辰溪县', '3', '43', '4312', '4312', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('431224', '溆浦县', '3', '43', '4312', '4312', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('431225', '会同县', '3', '43', '4312', '4312', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('431226', '麻阳苗族自治县', '3', '43', '4312', '4312', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('431227', '新晃侗族自治县', '3', '43', '4312', '4312', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('431228', '芷江侗族自治县', '3', '43', '4312', '4312', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('431229', '靖州苗族侗族自治县', '3', '43', '4312', '4312', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('431230', '通道侗族自治县', '3', '43', '4312', '4312', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('431281', '洪江市', '3', '43', '4312', '4312', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('431301', '市辖区', '3', '43', '4313', '4313', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('431302', '娄星区', '3', '43', '4313', '4313', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('431321', '双峰县', '3', '43', '4313', '4313', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('431322', '新化县', '3', '43', '4313', '4313', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('431381', '冷水江市', '3', '43', '4313', '4313', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('431382', '涟源市', '3', '43', '4313', '4313', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('433101', '吉首市', '3', '43', '4331', '4331', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('433122', '泸溪县', '3', '43', '4331', '4331', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('433123', '凤凰县', '3', '43', '4331', '4331', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('433124', '花垣县', '3', '43', '4331', '4331', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('433125', '保靖县', '3', '43', '4331', '4331', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('433126', '古丈县', '3', '43', '4331', '4331', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('433127', '永顺县', '3', '43', '4331', '4331', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('433130', '龙山县', '3', '43', '4331', '4331', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440101', '市辖区', '3', '44', '4401', '4401', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440103', '荔湾区', '3', '44', '4401', '4401', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440104', '越秀区', '3', '44', '4401', '4401', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440105', '海珠区', '3', '44', '4401', '4401', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440106', '天河区', '3', '44', '4401', '4401', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440111', '白云区', '3', '44', '4401', '4401', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440112', '黄埔区', '3', '44', '4401', '4401', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440113', '番禺区', '3', '44', '4401', '4401', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440114', '花都区', '3', '44', '4401', '4401', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440115', '南沙区', '3', '44', '4401', '4401', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440117', '从化区', '3', '44', '4401', '4401', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440118', '增城区', '3', '44', '4401', '4401', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440201', '市辖区', '3', '44', '4402', '4402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440203', '武江区', '3', '44', '4402', '4402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440204', '浈江区', '3', '44', '4402', '4402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440205', '曲江区', '3', '44', '4402', '4402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440222', '始兴县', '3', '44', '4402', '4402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440224', '仁化县', '3', '44', '4402', '4402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440229', '翁源县', '3', '44', '4402', '4402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440232', '乳源瑶族自治县', '3', '44', '4402', '4402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440233', '新丰县', '3', '44', '4402', '4402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440281', '乐昌市', '3', '44', '4402', '4402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440282', '南雄市', '3', '44', '4402', '4402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440301', '市辖区', '3', '44', '4403', '4403', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440303', '罗湖区', '3', '44', '4403', '4403', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440304', '福田区', '3', '44', '4403', '4403', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440305', '南山区', '3', '44', '4403', '4403', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440306', '宝安区', '3', '44', '4403', '4403', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440307', '龙岗区', '3', '44', '4403', '4403', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440308', '盐田区', '3', '44', '4403', '4403', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440401', '市辖区', '3', '44', '4404', '4404', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440402', '香洲区', '3', '44', '4404', '4404', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440403', '斗门区', '3', '44', '4404', '4404', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440404', '金湾区', '3', '44', '4404', '4404', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440501', '市辖区', '3', '44', '4405', '4405', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440507', '龙湖区', '3', '44', '4405', '4405', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440511', '金平区', '3', '44', '4405', '4405', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440512', '濠江区', '3', '44', '4405', '4405', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440513', '潮阳区', '3', '44', '4405', '4405', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440514', '潮南区', '3', '44', '4405', '4405', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440515', '澄海区', '3', '44', '4405', '4405', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440523', '南澳县', '3', '44', '4405', '4405', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440601', '市辖区', '3', '44', '4406', '4406', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440604', '禅城区', '3', '44', '4406', '4406', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440605', '南海区', '3', '44', '4406', '4406', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440606', '顺德区', '3', '44', '4406', '4406', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440607', '三水区', '3', '44', '4406', '4406', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440608', '高明区', '3', '44', '4406', '4406', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440701', '市辖区', '3', '44', '4407', '4407', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440703', '蓬江区', '3', '44', '4407', '4407', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440704', '江海区', '3', '44', '4407', '4407', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440705', '新会区', '3', '44', '4407', '4407', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440781', '台山市', '3', '44', '4407', '4407', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440783', '开平市', '3', '44', '4407', '4407', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440784', '鹤山市', '3', '44', '4407', '4407', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440785', '恩平市', '3', '44', '4407', '4407', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440801', '市辖区', '3', '44', '4408', '4408', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440802', '赤坎区', '3', '44', '4408', '4408', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440803', '霞山区', '3', '44', '4408', '4408', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440804', '坡头区', '3', '44', '4408', '4408', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440811', '麻章区', '3', '44', '4408', '4408', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440823', '遂溪县', '3', '44', '4408', '4408', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440825', '徐闻县', '3', '44', '4408', '4408', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440881', '廉江市', '3', '44', '4408', '4408', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440882', '雷州市', '3', '44', '4408', '4408', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440883', '吴川市', '3', '44', '4408', '4408', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440901', '市辖区', '3', '44', '4409', '4409', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440902', '茂南区', '3', '44', '4409', '4409', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440904', '电白区', '3', '44', '4409', '4409', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440981', '高州市', '3', '44', '4409', '4409', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440982', '化州市', '3', '44', '4409', '4409', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('440983', '信宜市', '3', '44', '4409', '4409', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('441201', '市辖区', '3', '44', '4412', '4412', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('441202', '端州区', '3', '44', '4412', '4412', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('441203', '鼎湖区', '3', '44', '4412', '4412', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('441204', '高要区', '3', '44', '4412', '4412', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('441223', '广宁县', '3', '44', '4412', '4412', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('441224', '怀集县', '3', '44', '4412', '4412', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('441225', '封开县', '3', '44', '4412', '4412', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('441226', '德庆县', '3', '44', '4412', '4412', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('441284', '四会市', '3', '44', '4412', '4412', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('441301', '市辖区', '3', '44', '4413', '4413', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('441302', '惠城区', '3', '44', '4413', '4413', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('441303', '惠阳区', '3', '44', '4413', '4413', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('441322', '博罗县', '3', '44', '4413', '4413', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('441323', '惠东县', '3', '44', '4413', '4413', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('441324', '龙门县', '3', '44', '4413', '4413', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('441401', '市辖区', '3', '44', '4414', '4414', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('441402', '梅江区', '3', '44', '4414', '4414', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('441403', '梅县区', '3', '44', '4414', '4414', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('441422', '大埔县', '3', '44', '4414', '4414', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('441423', '丰顺县', '3', '44', '4414', '4414', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('441424', '五华县', '3', '44', '4414', '4414', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('441426', '平远县', '3', '44', '4414', '4414', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('441427', '蕉岭县', '3', '44', '4414', '4414', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('441481', '兴宁市', '3', '44', '4414', '4414', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('441501', '市辖区', '3', '44', '4415', '4415', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('441502', '城区', '3', '44', '4415', '4415', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('441521', '海丰县', '3', '44', '4415', '4415', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('441523', '陆河县', '3', '44', '4415', '4415', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('441581', '陆丰市', '3', '44', '4415', '4415', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('441601', '市辖区', '3', '44', '4416', '4416', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('441602', '源城区', '3', '44', '4416', '4416', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('441621', '紫金县', '3', '44', '4416', '4416', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('441622', '龙川县', '3', '44', '4416', '4416', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('441623', '连平县', '3', '44', '4416', '4416', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('441624', '和平县', '3', '44', '4416', '4416', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('441625', '东源县', '3', '44', '4416', '4416', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('441701', '市辖区', '3', '44', '4417', '4417', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('441702', '江城区', '3', '44', '4417', '4417', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('441704', '阳东区', '3', '44', '4417', '4417', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('441721', '阳西县', '3', '44', '4417', '4417', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('441781', '阳春市', '3', '44', '4417', '4417', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('441801', '市辖区', '3', '44', '4418', '4418', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('441802', '清城区', '3', '44', '4418', '4418', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('441803', '清新区', '3', '44', '4418', '4418', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('441821', '佛冈县', '3', '44', '4418', '4418', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('441823', '阳山县', '3', '44', '4418', '4418', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('441825', '连山壮族瑶族自治县', '3', '44', '4418', '4418', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('441826', '连南瑶族自治县', '3', '44', '4418', '4418', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('441881', '英德市', '3', '44', '4418', '4418', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('441882', '连州市', '3', '44', '4418', '4418', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('445101', '市辖区', '3', '44', '4451', '4451', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('445102', '湘桥区', '3', '44', '4451', '4451', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('445103', '潮安区', '3', '44', '4451', '4451', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('445122', '饶平县', '3', '44', '4451', '4451', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('445201', '市辖区', '3', '44', '4452', '4452', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('445202', '榕城区', '3', '44', '4452', '4452', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('445203', '揭东区', '3', '44', '4452', '4452', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('445222', '揭西县', '3', '44', '4452', '4452', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('445224', '惠来县', '3', '44', '4452', '4452', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('445281', '普宁市', '3', '44', '4452', '4452', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('445301', '市辖区', '3', '44', '4453', '4453', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('445302', '云城区', '3', '44', '4453', '4453', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('445303', '云安区', '3', '44', '4453', '4453', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('445321', '新兴县', '3', '44', '4453', '4453', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('445322', '郁南县', '3', '44', '4453', '4453', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('445381', '罗定市', '3', '44', '4453', '4453', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450101', '市辖区', '3', '45', '4501', '4501', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450102', '兴宁区', '3', '45', '4501', '4501', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450103', '青秀区', '3', '45', '4501', '4501', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450105', '江南区', '3', '45', '4501', '4501', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450107', '西乡塘区', '3', '45', '4501', '4501', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450108', '良庆区', '3', '45', '4501', '4501', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450109', '邕宁区', '3', '45', '4501', '4501', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450110', '武鸣区', '3', '45', '4501', '4501', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450123', '隆安县', '3', '45', '4501', '4501', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450124', '马山县', '3', '45', '4501', '4501', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450125', '上林县', '3', '45', '4501', '4501', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450126', '宾阳县', '3', '45', '4501', '4501', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450127', '横县', '3', '45', '4501', '4501', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450201', '市辖区', '3', '45', '4502', '4502', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450202', '城中区', '3', '45', '4502', '4502', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450203', '鱼峰区', '3', '45', '4502', '4502', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450204', '柳南区', '3', '45', '4502', '4502', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450205', '柳北区', '3', '45', '4502', '4502', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450206', '柳江区', '3', '45', '4502', '4502', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450222', '柳城县', '3', '45', '4502', '4502', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450223', '鹿寨县', '3', '45', '4502', '4502', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450224', '融安县', '3', '45', '4502', '4502', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450225', '融水苗族自治县', '3', '45', '4502', '4502', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450226', '三江侗族自治县', '3', '45', '4502', '4502', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450301', '市辖区', '3', '45', '4503', '4503', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450302', '秀峰区', '3', '45', '4503', '4503', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450303', '叠彩区', '3', '45', '4503', '4503', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450304', '象山区', '3', '45', '4503', '4503', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450305', '七星区', '3', '45', '4503', '4503', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450311', '雁山区', '3', '45', '4503', '4503', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450312', '临桂区', '3', '45', '4503', '4503', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450321', '阳朔县', '3', '45', '4503', '4503', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450323', '灵川县', '3', '45', '4503', '4503', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450324', '全州县', '3', '45', '4503', '4503', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450325', '兴安县', '3', '45', '4503', '4503', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450326', '永福县', '3', '45', '4503', '4503', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450327', '灌阳县', '3', '45', '4503', '4503', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450328', '龙胜各族自治县', '3', '45', '4503', '4503', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450329', '资源县', '3', '45', '4503', '4503', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450330', '平乐县', '3', '45', '4503', '4503', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450331', '荔浦县', '3', '45', '4503', '4503', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450332', '恭城瑶族自治县', '3', '45', '4503', '4503', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450401', '市辖区', '3', '45', '4504', '4504', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450403', '万秀区', '3', '45', '4504', '4504', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450405', '长洲区', '3', '45', '4504', '4504', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450406', '龙圩区', '3', '45', '4504', '4504', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450421', '苍梧县', '3', '45', '4504', '4504', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450422', '藤县', '3', '45', '4504', '4504', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450423', '蒙山县', '3', '45', '4504', '4504', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450481', '岑溪市', '3', '45', '4504', '4504', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450501', '市辖区', '3', '45', '4505', '4505', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450502', '海城区', '3', '45', '4505', '4505', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450503', '银海区', '3', '45', '4505', '4505', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450512', '铁山港区', '3', '45', '4505', '4505', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450521', '合浦县', '3', '45', '4505', '4505', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450601', '市辖区', '3', '45', '4506', '4506', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450602', '港口区', '3', '45', '4506', '4506', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450603', '防城区', '3', '45', '4506', '4506', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450621', '上思县', '3', '45', '4506', '4506', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450681', '东兴市', '3', '45', '4506', '4506', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450701', '市辖区', '3', '45', '4507', '4507', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450702', '钦南区', '3', '45', '4507', '4507', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450703', '钦北区', '3', '45', '4507', '4507', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450721', '灵山县', '3', '45', '4507', '4507', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450722', '浦北县', '3', '45', '4507', '4507', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450801', '市辖区', '3', '45', '4508', '4508', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450802', '港北区', '3', '45', '4508', '4508', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450803', '港南区', '3', '45', '4508', '4508', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450804', '覃塘区', '3', '45', '4508', '4508', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450821', '平南县', '3', '45', '4508', '4508', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450881', '桂平市', '3', '45', '4508', '4508', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450901', '市辖区', '3', '45', '4509', '4509', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450902', '玉州区', '3', '45', '4509', '4509', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450903', '福绵区', '3', '45', '4509', '4509', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450921', '容县', '3', '45', '4509', '4509', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450922', '陆川县', '3', '45', '4509', '4509', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450923', '博白县', '3', '45', '4509', '4509', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450924', '兴业县', '3', '45', '4509', '4509', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('450981', '北流市', '3', '45', '4509', '4509', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('451001', '市辖区', '3', '45', '4510', '4510', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('451002', '右江区', '3', '45', '4510', '4510', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('451021', '田阳县', '3', '45', '4510', '4510', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('451022', '田东县', '3', '45', '4510', '4510', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('451023', '平果县', '3', '45', '4510', '4510', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('451024', '德保县', '3', '45', '4510', '4510', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('451026', '那坡县', '3', '45', '4510', '4510', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('451027', '凌云县', '3', '45', '4510', '4510', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('451028', '乐业县', '3', '45', '4510', '4510', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('451029', '田林县', '3', '45', '4510', '4510', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('451030', '西林县', '3', '45', '4510', '4510', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('451031', '隆林各族自治县', '3', '45', '4510', '4510', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('451081', '靖西市', '3', '45', '4510', '4510', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('451101', '市辖区', '3', '45', '4511', '4511', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('451102', '八步区', '3', '45', '4511', '4511', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('451103', '平桂区', '3', '45', '4511', '4511', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('451121', '昭平县', '3', '45', '4511', '4511', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('451122', '钟山县', '3', '45', '4511', '4511', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('451123', '富川瑶族自治县', '3', '45', '4511', '4511', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('451201', '市辖区', '3', '45', '4512', '4512', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('451202', '金城江区', '3', '45', '4512', '4512', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('451221', '南丹县', '3', '45', '4512', '4512', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('451222', '天峨县', '3', '45', '4512', '4512', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('451223', '凤山县', '3', '45', '4512', '4512', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('451224', '东兰县', '3', '45', '4512', '4512', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('451225', '罗城仫佬族自治县', '3', '45', '4512', '4512', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('451226', '环江毛南族自治县', '3', '45', '4512', '4512', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('451227', '巴马瑶族自治县', '3', '45', '4512', '4512', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('451228', '都安瑶族自治县', '3', '45', '4512', '4512', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('451229', '大化瑶族自治县', '3', '45', '4512', '4512', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('451281', '宜州市', '3', '45', '4512', '4512', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('451301', '市辖区', '3', '45', '4513', '4513', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('451302', '兴宾区', '3', '45', '4513', '4513', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('451321', '忻城县', '3', '45', '4513', '4513', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('451322', '象州县', '3', '45', '4513', '4513', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('451323', '武宣县', '3', '45', '4513', '4513', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('451324', '金秀瑶族自治县', '3', '45', '4513', '4513', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('451381', '合山市', '3', '45', '4513', '4513', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('451401', '市辖区', '3', '45', '4514', '4514', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('451402', '江州区', '3', '45', '4514', '4514', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('451421', '扶绥县', '3', '45', '4514', '4514', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('451422', '宁明县', '3', '45', '4514', '4514', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('451423', '龙州县', '3', '45', '4514', '4514', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('451424', '大新县', '3', '45', '4514', '4514', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('451425', '天等县', '3', '45', '4514', '4514', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('451481', '凭祥市', '3', '45', '4514', '4514', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('460101', '市辖区', '3', '46', '4601', '4601', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('460105', '秀英区', '3', '46', '4601', '4601', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('460106', '龙华区', '3', '46', '4601', '4601', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('460107', '琼山区', '3', '46', '4601', '4601', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('460108', '美兰区', '3', '46', '4601', '4601', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('460201', '市辖区', '3', '46', '4602', '4602', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('460202', '海棠区', '3', '46', '4602', '4602', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('460203', '吉阳区', '3', '46', '4602', '4602', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('460204', '天涯区', '3', '46', '4602', '4602', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('460205', '崖州区', '3', '46', '4602', '4602', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('469001', '五指山市', '3', '46', '4690', '4690', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('469002', '琼海市', '3', '46', '4690', '4690', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('469005', '文昌市', '3', '46', '4690', '4690', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('469006', '万宁市', '3', '46', '4690', '4690', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('469007', '东方市', '3', '46', '4690', '4690', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('469021', '定安县', '3', '46', '4690', '4690', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('469022', '屯昌县', '3', '46', '4690', '4690', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('469023', '澄迈县', '3', '46', '4690', '4690', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('469024', '临高县', '3', '46', '4690', '4690', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('469025', '白沙黎族自治县', '3', '46', '4690', '4690', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('469026', '昌江黎族自治县', '3', '46', '4690', '4690', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('469027', '乐东黎族自治县', '3', '46', '4690', '4690', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('469028', '陵水黎族自治县', '3', '46', '4690', '4690', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('469029', '保亭黎族苗族自治县', '3', '46', '4690', '4690', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('469030', '琼中黎族苗族自治县', '3', '46', '4690', '4690', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('500101', '万州区', '3', '50', '5001', '5001', '0', '517', '', '');
INSERT INTO `ibt_region` VALUES ('500102', '涪陵区', '3', '50', '5001', '5001', '0', '506', '', '');
INSERT INTO `ibt_region` VALUES ('500103', '渝中区', '3', '50', '5001', '5001', '0', '525', '', '');
INSERT INTO `ibt_region` VALUES ('500104', '大渡口区', '3', '50', '5001', '5001', '0', '511', '', '');
INSERT INTO `ibt_region` VALUES ('500105', '江北区', '3', '50', '5001', '5001', '0', '504', '', '');
INSERT INTO `ibt_region` VALUES ('500106', '沙坪坝区', '3', '50', '5001', '5001', '0', '494', '', '');
INSERT INTO `ibt_region` VALUES ('500107', '九龙坡区', '3', '50', '5001', '5001', '0', '502', '', '');
INSERT INTO `ibt_region` VALUES ('500108', '南岸区', '3', '50', '5001', '5001', '0', '499', '', '');
INSERT INTO `ibt_region` VALUES ('500109', '北碚区', '3', '50', '5001', '5001', '0', '514', '', '');
INSERT INTO `ibt_region` VALUES ('500110', '綦江区', '3', '50', '5001', '5001', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('500111', '大足区', '3', '50', '5001', '5001', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('500112', '渝北区', '3', '50', '5001', '5001', '0', '524', '', '');
INSERT INTO `ibt_region` VALUES ('500113', '巴南区', '3', '50', '5001', '5001', '0', '515', '', '');
INSERT INTO `ibt_region` VALUES ('500114', '黔江区', '3', '50', '5001', '5001', '0', '496', '', '');
INSERT INTO `ibt_region` VALUES ('500115', '长寿区', '3', '50', '5001', '5001', '0', '513', '', '');
INSERT INTO `ibt_region` VALUES ('500116', '江津区', '3', '50', '5001', '5001', '0', '503', '', '');
INSERT INTO `ibt_region` VALUES ('500117', '合川区', '3', '50', '5001', '5001', '0', '505', '', '');
INSERT INTO `ibt_region` VALUES ('500118', '永川区', '3', '50', '5001', '5001', '0', '522', '', '');
INSERT INTO `ibt_region` VALUES ('500119', '南川区', '3', '50', '5001', '5001', '0', '498', '', '');
INSERT INTO `ibt_region` VALUES ('500120', '璧山区', '3', '50', '5001', '5001', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('500151', '铜梁区', '3', '50', '5001', '5001', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('500152', '潼南区', '3', '50', '5001', '5001', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('500153', '荣昌区', '3', '50', '5001', '5001', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('500154', '开州区', '3', '50', '5001', '5001', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('500228', '梁平县', '3', '50', '5002', '5002', '0', '500', '', '');
INSERT INTO `ibt_region` VALUES ('500229', '城口县', '3', '50', '5002', '5002', '0', '512', '', '');
INSERT INTO `ibt_region` VALUES ('500230', '丰都县', '3', '50', '5002', '5002', '0', '508', '', '');
INSERT INTO `ibt_region` VALUES ('500231', '垫江县', '3', '50', '5002', '5002', '0', '510', '', '');
INSERT INTO `ibt_region` VALUES ('500232', '武隆县', '3', '50', '5002', '5002', '0', '520', '', '');
INSERT INTO `ibt_region` VALUES ('500233', '忠县', '3', '50', '5002', '5002', '0', '527', '', '');
INSERT INTO `ibt_region` VALUES ('500235', '云阳县', '3', '50', '5002', '5002', '0', '526', '', '');
INSERT INTO `ibt_region` VALUES ('500236', '奉节县', '3', '50', '5002', '5002', '0', '507', '', '');
INSERT INTO `ibt_region` VALUES ('500237', '巫山县', '3', '50', '5002', '5002', '0', '518', '', '');
INSERT INTO `ibt_region` VALUES ('500238', '巫溪县', '3', '50', '5002', '5002', '0', '519', '', '');
INSERT INTO `ibt_region` VALUES ('500240', '石柱土家族自治县', '3', '50', '5002', '5002', '0', '493', '', '');
INSERT INTO `ibt_region` VALUES ('500241', '秀山土家族苗族自治县', '3', '50', '5002', '5002', '0', '521', '', '');
INSERT INTO `ibt_region` VALUES ('500242', '酉阳土家族苗族自治县', '3', '50', '5002', '5002', '0', '523', '', '');
INSERT INTO `ibt_region` VALUES ('500243', '彭水苗族土家族自治县', '3', '50', '5002', '5002', '0', '497', '', '');
INSERT INTO `ibt_region` VALUES ('510101', '市辖区', '3', '51', '5101', '5101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510104', '锦江区', '3', '51', '5101', '5101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510105', '青羊区', '3', '51', '5101', '5101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510106', '金牛区', '3', '51', '5101', '5101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510107', '武侯区', '3', '51', '5101', '5101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510108', '成华区', '3', '51', '5101', '5101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510112', '龙泉驿区', '3', '51', '5101', '5101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510113', '青白江区', '3', '51', '5101', '5101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510114', '新都区', '3', '51', '5101', '5101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510115', '温江区', '3', '51', '5101', '5101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510116', '双流区', '3', '51', '5101', '5101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510121', '金堂县', '3', '51', '5101', '5101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510124', '郫县', '3', '51', '5101', '5101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510129', '大邑县', '3', '51', '5101', '5101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510131', '蒲江县', '3', '51', '5101', '5101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510132', '新津县', '3', '51', '5101', '5101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510181', '都江堰市', '3', '51', '5101', '5101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510182', '彭州市', '3', '51', '5101', '5101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510183', '邛崃市', '3', '51', '5101', '5101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510184', '崇州市', '3', '51', '5101', '5101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510185', '简阳市', '3', '51', '5101', '5101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510301', '市辖区', '3', '51', '5103', '5103', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510302', '自流井区', '3', '51', '5103', '5103', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510303', '贡井区', '3', '51', '5103', '5103', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510304', '大安区', '3', '51', '5103', '5103', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510311', '沿滩区', '3', '51', '5103', '5103', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510321', '荣县', '3', '51', '5103', '5103', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510322', '富顺县', '3', '51', '5103', '5103', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510401', '市辖区', '3', '51', '5104', '5104', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510402', '东区', '3', '51', '5104', '5104', '0', '432', '', '');
INSERT INTO `ibt_region` VALUES ('510403', '西区', '3', '51', '5104', '5104', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510411', '仁和区', '3', '51', '5104', '5104', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510421', '米易县', '3', '51', '5104', '5104', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510422', '盐边县', '3', '51', '5104', '5104', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510501', '市辖区', '3', '51', '5105', '5105', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510502', '江阳区', '3', '51', '5105', '5105', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510503', '纳溪区', '3', '51', '5105', '5105', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510504', '龙马潭区', '3', '51', '5105', '5105', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510521', '泸县', '3', '51', '5105', '5105', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510522', '合江县', '3', '51', '5105', '5105', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510524', '叙永县', '3', '51', '5105', '5105', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510525', '古蔺县', '3', '51', '5105', '5105', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510601', '市辖区', '3', '51', '5106', '5106', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510603', '旌阳区', '3', '51', '5106', '5106', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510623', '中江县', '3', '51', '5106', '5106', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510626', '罗江县', '3', '51', '5106', '5106', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510681', '广汉市', '3', '51', '5106', '5106', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510682', '什邡市', '3', '51', '5106', '5106', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510683', '绵竹市', '3', '51', '5106', '5106', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510701', '市辖区', '3', '51', '5107', '5107', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510703', '涪城区', '3', '51', '5107', '5107', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510704', '游仙区', '3', '51', '5107', '5107', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510705', '安州区', '3', '51', '5107', '5107', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510722', '三台县', '3', '51', '5107', '5107', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510723', '盐亭县', '3', '51', '5107', '5107', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510725', '梓潼县', '3', '51', '5107', '5107', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510726', '北川羌族自治县', '3', '51', '5107', '5107', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510727', '平武县', '3', '51', '5107', '5107', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510781', '江油市', '3', '51', '5107', '5107', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510801', '市辖区', '3', '51', '5108', '5108', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510802', '利州区', '3', '51', '5108', '5108', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510811', '昭化区', '3', '51', '5108', '5108', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510812', '朝天区', '3', '51', '5108', '5108', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510821', '旺苍县', '3', '51', '5108', '5108', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510822', '青川县', '3', '51', '5108', '5108', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510823', '剑阁县', '3', '51', '5108', '5108', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510824', '苍溪县', '3', '51', '5108', '5108', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510901', '市辖区', '3', '51', '5109', '5109', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510903', '船山区', '3', '51', '5109', '5109', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510904', '安居区', '3', '51', '5109', '5109', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510921', '蓬溪县', '3', '51', '5109', '5109', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510922', '射洪县', '3', '51', '5109', '5109', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('510923', '大英县', '3', '51', '5109', '5109', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511001', '市辖区', '3', '51', '5110', '5110', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511002', '市中区', '3', '51', '5110', '5110', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511011', '东兴区', '3', '51', '5110', '5110', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511024', '威远县', '3', '51', '5110', '5110', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511025', '资中县', '3', '51', '5110', '5110', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511028', '隆昌县', '3', '51', '5110', '5110', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511101', '市辖区', '3', '51', '5111', '5111', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511102', '市中区', '3', '51', '5111', '5111', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511111', '沙湾区', '3', '51', '5111', '5111', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511112', '五通桥区', '3', '51', '5111', '5111', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511113', '金口河区', '3', '51', '5111', '5111', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511123', '犍为县', '3', '51', '5111', '5111', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511124', '井研县', '3', '51', '5111', '5111', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511126', '夹江县', '3', '51', '5111', '5111', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511129', '沐川县', '3', '51', '5111', '5111', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511132', '峨边彝族自治县', '3', '51', '5111', '5111', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511133', '马边彝族自治县', '3', '51', '5111', '5111', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511181', '峨眉山市', '3', '51', '5111', '5111', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511301', '市辖区', '3', '51', '5113', '5113', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511302', '顺庆区', '3', '51', '5113', '5113', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511303', '高坪区', '3', '51', '5113', '5113', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511304', '嘉陵区', '3', '51', '5113', '5113', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511321', '南部县', '3', '51', '5113', '5113', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511322', '营山县', '3', '51', '5113', '5113', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511323', '蓬安县', '3', '51', '5113', '5113', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511324', '仪陇县', '3', '51', '5113', '5113', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511325', '西充县', '3', '51', '5113', '5113', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511381', '阆中市', '3', '51', '5113', '5113', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511401', '市辖区', '3', '51', '5114', '5114', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511402', '东坡区', '3', '51', '5114', '5114', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511403', '彭山区', '3', '51', '5114', '5114', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511421', '仁寿县', '3', '51', '5114', '5114', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511423', '洪雅县', '3', '51', '5114', '5114', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511424', '丹棱县', '3', '51', '5114', '5114', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511425', '青神县', '3', '51', '5114', '5114', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511501', '市辖区', '3', '51', '5115', '5115', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511502', '翠屏区', '3', '51', '5115', '5115', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511503', '南溪区', '3', '51', '5115', '5115', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511521', '宜宾县', '3', '51', '5115', '5115', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511523', '江安县', '3', '51', '5115', '5115', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511524', '长宁县', '3', '51', '5115', '5115', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511525', '高县', '3', '51', '5115', '5115', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511526', '珙县', '3', '51', '5115', '5115', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511527', '筠连县', '3', '51', '5115', '5115', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511528', '兴文县', '3', '51', '5115', '5115', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511529', '屏山县', '3', '51', '5115', '5115', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511601', '市辖区', '3', '51', '5116', '5116', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511602', '广安区', '3', '51', '5116', '5116', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511603', '前锋区', '3', '51', '5116', '5116', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511621', '岳池县', '3', '51', '5116', '5116', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511622', '武胜县', '3', '51', '5116', '5116', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511623', '邻水县', '3', '51', '5116', '5116', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511681', '华蓥市', '3', '51', '5116', '5116', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511701', '市辖区', '3', '51', '5117', '5117', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511702', '通川区', '3', '51', '5117', '5117', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511703', '达川区', '3', '51', '5117', '5117', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511722', '宣汉县', '3', '51', '5117', '5117', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511723', '开江县', '3', '51', '5117', '5117', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511724', '大竹县', '3', '51', '5117', '5117', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511725', '渠县', '3', '51', '5117', '5117', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511781', '万源市', '3', '51', '5117', '5117', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511801', '市辖区', '3', '51', '5118', '5118', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511802', '雨城区', '3', '51', '5118', '5118', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511803', '名山区', '3', '51', '5118', '5118', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511822', '荥经县', '3', '51', '5118', '5118', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511823', '汉源县', '3', '51', '5118', '5118', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511824', '石棉县', '3', '51', '5118', '5118', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511825', '天全县', '3', '51', '5118', '5118', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511826', '芦山县', '3', '51', '5118', '5118', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511827', '宝兴县', '3', '51', '5118', '5118', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511901', '市辖区', '3', '51', '5119', '5119', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511902', '巴州区', '3', '51', '5119', '5119', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511903', '恩阳区', '3', '51', '5119', '5119', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511921', '通江县', '3', '51', '5119', '5119', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511922', '南江县', '3', '51', '5119', '5119', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('511923', '平昌县', '3', '51', '5119', '5119', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('512001', '市辖区', '3', '51', '5120', '5120', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('512002', '雁江区', '3', '51', '5120', '5120', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('512021', '安岳县', '3', '51', '5120', '5120', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('512022', '乐至县', '3', '51', '5120', '5120', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('513201', '马尔康市', '3', '51', '5132', '5132', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('513221', '汶川县', '3', '51', '5132', '5132', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('513222', '理县', '3', '51', '5132', '5132', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('513223', '茂县', '3', '51', '5132', '5132', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('513224', '松潘县', '3', '51', '5132', '5132', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('513225', '九寨沟县', '3', '51', '5132', '5132', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('513226', '金川县', '3', '51', '5132', '5132', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('513227', '小金县', '3', '51', '5132', '5132', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('513228', '黑水县', '3', '51', '5132', '5132', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('513230', '壤塘县', '3', '51', '5132', '5132', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('513231', '阿坝县', '3', '51', '5132', '5132', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('513232', '若尔盖县', '3', '51', '5132', '5132', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('513233', '红原县', '3', '51', '5132', '5132', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('513301', '康定市', '3', '51', '5133', '5133', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('513322', '泸定县', '3', '51', '5133', '5133', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('513323', '丹巴县', '3', '51', '5133', '5133', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('513324', '九龙县', '3', '51', '5133', '5133', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('513325', '雅江县', '3', '51', '5133', '5133', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('513326', '道孚县', '3', '51', '5133', '5133', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('513327', '炉霍县', '3', '51', '5133', '5133', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('513328', '甘孜县', '3', '51', '5133', '5133', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('513329', '新龙县', '3', '51', '5133', '5133', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('513330', '德格县', '3', '51', '5133', '5133', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('513331', '白玉县', '3', '51', '5133', '5133', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('513332', '石渠县', '3', '51', '5133', '5133', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('513333', '色达县', '3', '51', '5133', '5133', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('513334', '理塘县', '3', '51', '5133', '5133', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('513335', '巴塘县', '3', '51', '5133', '5133', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('513336', '乡城县', '3', '51', '5133', '5133', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('513337', '稻城县', '3', '51', '5133', '5133', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('513338', '得荣县', '3', '51', '5133', '5133', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('513401', '西昌市', '3', '51', '5134', '5134', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('513422', '木里藏族自治县', '3', '51', '5134', '5134', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('513423', '盐源县', '3', '51', '5134', '5134', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('513424', '德昌县', '3', '51', '5134', '5134', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('513425', '会理县', '3', '51', '5134', '5134', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('513426', '会东县', '3', '51', '5134', '5134', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('513427', '宁南县', '3', '51', '5134', '5134', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('513428', '普格县', '3', '51', '5134', '5134', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('513429', '布拖县', '3', '51', '5134', '5134', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('513430', '金阳县', '3', '51', '5134', '5134', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('513431', '昭觉县', '3', '51', '5134', '5134', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('513432', '喜德县', '3', '51', '5134', '5134', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('513433', '冕宁县', '3', '51', '5134', '5134', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('513434', '越西县', '3', '51', '5134', '5134', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('513435', '甘洛县', '3', '51', '5134', '5134', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('513436', '美姑县', '3', '51', '5134', '5134', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('513437', '雷波县', '3', '51', '5134', '5134', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520101', '市辖区', '3', '52', '5201', '5201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520102', '南明区', '3', '52', '5201', '5201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520103', '云岩区', '3', '52', '5201', '5201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520111', '花溪区', '3', '52', '5201', '5201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520112', '乌当区', '3', '52', '5201', '5201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520113', '白云区', '3', '52', '5201', '5201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520115', '观山湖区', '3', '52', '5201', '5201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520121', '开阳县', '3', '52', '5201', '5201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520122', '息烽县', '3', '52', '5201', '5201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520123', '修文县', '3', '52', '5201', '5201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520181', '清镇市', '3', '52', '5201', '5201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520201', '钟山区', '3', '52', '5202', '5202', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520203', '六枝特区', '3', '52', '5202', '5202', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520221', '水城县', '3', '52', '5202', '5202', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520222', '盘县', '3', '52', '5202', '5202', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520301', '市辖区', '3', '52', '5203', '5203', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520302', '红花岗区', '3', '52', '5203', '5203', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520303', '汇川区', '3', '52', '5203', '5203', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520304', '播州区', '3', '52', '5203', '5203', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520322', '桐梓县', '3', '52', '5203', '5203', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520323', '绥阳县', '3', '52', '5203', '5203', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520324', '正安县', '3', '52', '5203', '5203', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520325', '道真仡佬族苗族自治县', '3', '52', '5203', '5203', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520326', '务川仡佬族苗族自治县', '3', '52', '5203', '5203', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520327', '凤冈县', '3', '52', '5203', '5203', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520328', '湄潭县', '3', '52', '5203', '5203', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520329', '余庆县', '3', '52', '5203', '5203', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520330', '习水县', '3', '52', '5203', '5203', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520381', '赤水市', '3', '52', '5203', '5203', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520382', '仁怀市', '3', '52', '5203', '5203', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520401', '市辖区', '3', '52', '5204', '5204', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520402', '西秀区', '3', '52', '5204', '5204', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520403', '平坝区', '3', '52', '5204', '5204', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520422', '普定县', '3', '52', '5204', '5204', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520423', '镇宁布依族苗族自治县', '3', '52', '5204', '5204', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520424', '关岭布依族苗族自治县', '3', '52', '5204', '5204', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520425', '紫云苗族布依族自治县', '3', '52', '5204', '5204', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520501', '市辖区', '3', '52', '5205', '5205', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520502', '七星关区', '3', '52', '5205', '5205', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520521', '大方县', '3', '52', '5205', '5205', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520522', '黔西县', '3', '52', '5205', '5205', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520523', '金沙县', '3', '52', '5205', '5205', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520524', '织金县', '3', '52', '5205', '5205', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520525', '纳雍县', '3', '52', '5205', '5205', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520526', '威宁彝族回族苗族自治县', '3', '52', '5205', '5205', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520527', '赫章县', '3', '52', '5205', '5205', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520601', '市辖区', '3', '52', '5206', '5206', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520602', '碧江区', '3', '52', '5206', '5206', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520603', '万山区', '3', '52', '5206', '5206', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520621', '江口县', '3', '52', '5206', '5206', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520622', '玉屏侗族自治县', '3', '52', '5206', '5206', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520623', '石阡县', '3', '52', '5206', '5206', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520624', '思南县', '3', '52', '5206', '5206', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520625', '印江土家族苗族自治县', '3', '52', '5206', '5206', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520626', '德江县', '3', '52', '5206', '5206', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520627', '沿河土家族自治县', '3', '52', '5206', '5206', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('520628', '松桃苗族自治县', '3', '52', '5206', '5206', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('522301', '兴义市', '3', '52', '5223', '5223', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('522322', '兴仁县', '3', '52', '5223', '5223', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('522323', '普安县', '3', '52', '5223', '5223', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('522324', '晴隆县', '3', '52', '5223', '5223', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('522325', '贞丰县', '3', '52', '5223', '5223', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('522326', '望谟县', '3', '52', '5223', '5223', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('522327', '册亨县', '3', '52', '5223', '5223', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('522328', '安龙县', '3', '52', '5223', '5223', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('522601', '凯里市', '3', '52', '5226', '5226', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('522622', '黄平县', '3', '52', '5226', '5226', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('522623', '施秉县', '3', '52', '5226', '5226', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('522624', '三穗县', '3', '52', '5226', '5226', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('522625', '镇远县', '3', '52', '5226', '5226', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('522626', '岑巩县', '3', '52', '5226', '5226', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('522627', '天柱县', '3', '52', '5226', '5226', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('522628', '锦屏县', '3', '52', '5226', '5226', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('522629', '剑河县', '3', '52', '5226', '5226', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('522630', '台江县', '3', '52', '5226', '5226', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('522631', '黎平县', '3', '52', '5226', '5226', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('522632', '榕江县', '3', '52', '5226', '5226', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('522633', '从江县', '3', '52', '5226', '5226', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('522634', '雷山县', '3', '52', '5226', '5226', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('522635', '麻江县', '3', '52', '5226', '5226', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('522636', '丹寨县', '3', '52', '5226', '5226', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('522701', '都匀市', '3', '52', '5227', '5227', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('522702', '福泉市', '3', '52', '5227', '5227', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('522722', '荔波县', '3', '52', '5227', '5227', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('522723', '贵定县', '3', '52', '5227', '5227', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('522725', '瓮安县', '3', '52', '5227', '5227', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('522726', '独山县', '3', '52', '5227', '5227', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('522727', '平塘县', '3', '52', '5227', '5227', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('522728', '罗甸县', '3', '52', '5227', '5227', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('522729', '长顺县', '3', '52', '5227', '5227', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('522730', '龙里县', '3', '52', '5227', '5227', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('522731', '惠水县', '3', '52', '5227', '5227', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('522732', '三都水族自治县', '3', '52', '5227', '5227', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530101', '市辖区', '3', '53', '5301', '5301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530102', '五华区', '3', '53', '5301', '5301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530103', '盘龙区', '3', '53', '5301', '5301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530111', '官渡区', '3', '53', '5301', '5301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530112', '西山区', '3', '53', '5301', '5301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530113', '东川区', '3', '53', '5301', '5301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530114', '呈贡区', '3', '53', '5301', '5301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530122', '晋宁县', '3', '53', '5301', '5301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530124', '富民县', '3', '53', '5301', '5301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530125', '宜良县', '3', '53', '5301', '5301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530126', '石林彝族自治县', '3', '53', '5301', '5301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530127', '嵩明县', '3', '53', '5301', '5301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530128', '禄劝彝族苗族自治县', '3', '53', '5301', '5301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530129', '寻甸回族彝族自治县', '3', '53', '5301', '5301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530181', '安宁市', '3', '53', '5301', '5301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530301', '市辖区', '3', '53', '5303', '5303', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530302', '麒麟区', '3', '53', '5303', '5303', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530303', '沾益区', '3', '53', '5303', '5303', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530321', '马龙县', '3', '53', '5303', '5303', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530322', '陆良县', '3', '53', '5303', '5303', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530323', '师宗县', '3', '53', '5303', '5303', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530324', '罗平县', '3', '53', '5303', '5303', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530325', '富源县', '3', '53', '5303', '5303', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530326', '会泽县', '3', '53', '5303', '5303', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530381', '宣威市', '3', '53', '5303', '5303', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530401', '市辖区', '3', '53', '5304', '5304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530402', '红塔区', '3', '53', '5304', '5304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530403', '江川区', '3', '53', '5304', '5304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530422', '澄江县', '3', '53', '5304', '5304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530423', '通海县', '3', '53', '5304', '5304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530424', '华宁县', '3', '53', '5304', '5304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530425', '易门县', '3', '53', '5304', '5304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530426', '峨山彝族自治县', '3', '53', '5304', '5304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530427', '新平彝族傣族自治县', '3', '53', '5304', '5304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530428', '元江哈尼族彝族傣族自治县', '3', '53', '5304', '5304', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530501', '市辖区', '3', '53', '5305', '5305', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530502', '隆阳区', '3', '53', '5305', '5305', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530521', '施甸县', '3', '53', '5305', '5305', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530523', '龙陵县', '3', '53', '5305', '5305', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530524', '昌宁县', '3', '53', '5305', '5305', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530581', '腾冲市', '3', '53', '5305', '5305', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530601', '市辖区', '3', '53', '5306', '5306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530602', '昭阳区', '3', '53', '5306', '5306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530621', '鲁甸县', '3', '53', '5306', '5306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530622', '巧家县', '3', '53', '5306', '5306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530623', '盐津县', '3', '53', '5306', '5306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530624', '大关县', '3', '53', '5306', '5306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530625', '永善县', '3', '53', '5306', '5306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530626', '绥江县', '3', '53', '5306', '5306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530627', '镇雄县', '3', '53', '5306', '5306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530628', '彝良县', '3', '53', '5306', '5306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530629', '威信县', '3', '53', '5306', '5306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530630', '水富县', '3', '53', '5306', '5306', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530701', '市辖区', '3', '53', '5307', '5307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530702', '古城区', '3', '53', '5307', '5307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530721', '玉龙纳西族自治县', '3', '53', '5307', '5307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530722', '永胜县', '3', '53', '5307', '5307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530723', '华坪县', '3', '53', '5307', '5307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530724', '宁蒗彝族自治县', '3', '53', '5307', '5307', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530801', '市辖区', '3', '53', '5308', '5308', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530802', '思茅区', '3', '53', '5308', '5308', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530821', '宁洱哈尼族彝族自治县', '3', '53', '5308', '5308', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530822', '墨江哈尼族自治县', '3', '53', '5308', '5308', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530823', '景东彝族自治县', '3', '53', '5308', '5308', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530824', '景谷傣族彝族自治县', '3', '53', '5308', '5308', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530825', '镇沅彝族哈尼族拉祜族自治县', '3', '53', '5308', '5308', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530826', '江城哈尼族彝族自治县', '3', '53', '5308', '5308', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530827', '孟连傣族拉祜族佤族自治县', '3', '53', '5308', '5308', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530828', '澜沧拉祜族自治县', '3', '53', '5308', '5308', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530829', '西盟佤族自治县', '3', '53', '5308', '5308', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530901', '市辖区', '3', '53', '5309', '5309', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530902', '临翔区', '3', '53', '5309', '5309', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530921', '凤庆县', '3', '53', '5309', '5309', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530922', '云县', '3', '53', '5309', '5309', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530923', '永德县', '3', '53', '5309', '5309', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530924', '镇康县', '3', '53', '5309', '5309', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530925', '双江拉祜族佤族布朗族傣族自治县', '3', '53', '5309', '5309', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530926', '耿马傣族佤族自治县', '3', '53', '5309', '5309', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('530927', '沧源佤族自治县', '3', '53', '5309', '5309', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('532301', '楚雄市', '3', '53', '5323', '5323', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('532322', '双柏县', '3', '53', '5323', '5323', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('532323', '牟定县', '3', '53', '5323', '5323', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('532324', '南华县', '3', '53', '5323', '5323', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('532325', '姚安县', '3', '53', '5323', '5323', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('532326', '大姚县', '3', '53', '5323', '5323', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('532327', '永仁县', '3', '53', '5323', '5323', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('532328', '元谋县', '3', '53', '5323', '5323', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('532329', '武定县', '3', '53', '5323', '5323', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('532331', '禄丰县', '3', '53', '5323', '5323', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('532501', '个旧市', '3', '53', '5325', '5325', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('532502', '开远市', '3', '53', '5325', '5325', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('532503', '蒙自市', '3', '53', '5325', '5325', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('532504', '弥勒市', '3', '53', '5325', '5325', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('532523', '屏边苗族自治县', '3', '53', '5325', '5325', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('532524', '建水县', '3', '53', '5325', '5325', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('532525', '石屏县', '3', '53', '5325', '5325', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('532527', '泸西县', '3', '53', '5325', '5325', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('532528', '元阳县', '3', '53', '5325', '5325', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('532529', '红河县', '3', '53', '5325', '5325', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('532530', '金平苗族瑶族傣族自治县', '3', '53', '5325', '5325', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('532531', '绿春县', '3', '53', '5325', '5325', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('532532', '河口瑶族自治县', '3', '53', '5325', '5325', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('532601', '文山市', '3', '53', '5326', '5326', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('532622', '砚山县', '3', '53', '5326', '5326', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('532623', '西畴县', '3', '53', '5326', '5326', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('532624', '麻栗坡县', '3', '53', '5326', '5326', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('532625', '马关县', '3', '53', '5326', '5326', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('532626', '丘北县', '3', '53', '5326', '5326', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('532627', '广南县', '3', '53', '5326', '5326', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('532628', '富宁县', '3', '53', '5326', '5326', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('532801', '景洪市', '3', '53', '5328', '5328', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('532822', '勐海县', '3', '53', '5328', '5328', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('532823', '勐腊县', '3', '53', '5328', '5328', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('532901', '大理市', '3', '53', '5329', '5329', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('532922', '漾濞彝族自治县', '3', '53', '5329', '5329', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('532923', '祥云县', '3', '53', '5329', '5329', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('532924', '宾川县', '3', '53', '5329', '5329', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('532925', '弥渡县', '3', '53', '5329', '5329', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('532926', '南涧彝族自治县', '3', '53', '5329', '5329', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('532927', '巍山彝族回族自治县', '3', '53', '5329', '5329', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('532928', '永平县', '3', '53', '5329', '5329', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('532929', '云龙县', '3', '53', '5329', '5329', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('532930', '洱源县', '3', '53', '5329', '5329', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('532931', '剑川县', '3', '53', '5329', '5329', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('532932', '鹤庆县', '3', '53', '5329', '5329', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('533102', '瑞丽市', '3', '53', '5331', '5331', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('533103', '芒市', '3', '53', '5331', '5331', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('533122', '梁河县', '3', '53', '5331', '5331', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('533123', '盈江县', '3', '53', '5331', '5331', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('533124', '陇川县', '3', '53', '5331', '5331', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('533301', '泸水市', '3', '53', '5333', '5333', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('533323', '福贡县', '3', '53', '5333', '5333', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('533324', '贡山独龙族怒族自治县', '3', '53', '5333', '5333', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('533325', '兰坪白族普米族自治县', '3', '53', '5333', '5333', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('533401', '香格里拉市', '3', '53', '5334', '5334', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('533422', '德钦县', '3', '53', '5334', '5334', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('533423', '维西傈僳族自治县', '3', '53', '5334', '5334', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540101', '市辖区', '3', '54', '5401', '5401', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540102', '城关区', '3', '54', '5401', '5401', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540103', '堆龙德庆区', '3', '54', '5401', '5401', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540121', '林周县', '3', '54', '5401', '5401', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540122', '当雄县', '3', '54', '5401', '5401', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540123', '尼木县', '3', '54', '5401', '5401', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540124', '曲水县', '3', '54', '5401', '5401', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540126', '达孜县', '3', '54', '5401', '5401', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540127', '墨竹工卡县', '3', '54', '5401', '5401', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540202', '桑珠孜区', '3', '54', '5402', '5402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540221', '南木林县', '3', '54', '5402', '5402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540222', '江孜县', '3', '54', '5402', '5402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540223', '定日县', '3', '54', '5402', '5402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540224', '萨迦县', '3', '54', '5402', '5402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540225', '拉孜县', '3', '54', '5402', '5402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540226', '昂仁县', '3', '54', '5402', '5402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540227', '谢通门县', '3', '54', '5402', '5402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540228', '白朗县', '3', '54', '5402', '5402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540229', '仁布县', '3', '54', '5402', '5402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540230', '康马县', '3', '54', '5402', '5402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540231', '定结县', '3', '54', '5402', '5402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540232', '仲巴县', '3', '54', '5402', '5402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540233', '亚东县', '3', '54', '5402', '5402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540234', '吉隆县', '3', '54', '5402', '5402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540235', '聂拉木县', '3', '54', '5402', '5402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540236', '萨嘎县', '3', '54', '5402', '5402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540237', '岗巴县', '3', '54', '5402', '5402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540302', '卡若区', '3', '54', '5403', '5403', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540321', '江达县', '3', '54', '5403', '5403', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540322', '贡觉县', '3', '54', '5403', '5403', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540323', '类乌齐县', '3', '54', '5403', '5403', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540324', '丁青县', '3', '54', '5403', '5403', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540325', '察雅县', '3', '54', '5403', '5403', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540326', '八宿县', '3', '54', '5403', '5403', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540327', '左贡县', '3', '54', '5403', '5403', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540328', '芒康县', '3', '54', '5403', '5403', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540329', '洛隆县', '3', '54', '5403', '5403', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540330', '边坝县', '3', '54', '5403', '5403', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540402', '巴宜区', '3', '54', '5404', '5404', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540421', '工布江达县', '3', '54', '5404', '5404', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540422', '米林县', '3', '54', '5404', '5404', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540423', '墨脱县', '3', '54', '5404', '5404', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540424', '波密县', '3', '54', '5404', '5404', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540425', '察隅县', '3', '54', '5404', '5404', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540426', '朗县', '3', '54', '5404', '5404', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540501', '市辖区', '3', '54', '5405', '5405', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540502', '乃东区', '3', '54', '5405', '5405', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540521', '扎囊县', '3', '54', '5405', '5405', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540522', '贡嘎县', '3', '54', '5405', '5405', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540523', '桑日县', '3', '54', '5405', '5405', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540524', '琼结县', '3', '54', '5405', '5405', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540525', '曲松县', '3', '54', '5405', '5405', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540526', '措美县', '3', '54', '5405', '5405', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540527', '洛扎县', '3', '54', '5405', '5405', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540528', '加查县', '3', '54', '5405', '5405', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540529', '隆子县', '3', '54', '5405', '5405', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540530', '错那县', '3', '54', '5405', '5405', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('540531', '浪卡子县', '3', '54', '5405', '5405', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('542421', '那曲县', '3', '54', '5424', '5424', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('542422', '嘉黎县', '3', '54', '5424', '5424', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('542423', '比如县', '3', '54', '5424', '5424', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('542424', '聂荣县', '3', '54', '5424', '5424', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('542425', '安多县', '3', '54', '5424', '5424', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('542426', '申扎县', '3', '54', '5424', '5424', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('542427', '索县', '3', '54', '5424', '5424', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('542428', '班戈县', '3', '54', '5424', '5424', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('542429', '巴青县', '3', '54', '5424', '5424', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('542430', '尼玛县', '3', '54', '5424', '5424', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('542431', '双湖县', '3', '54', '5424', '5424', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('542521', '普兰县', '3', '54', '5425', '5425', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('542522', '札达县', '3', '54', '5425', '5425', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('542523', '噶尔县', '3', '54', '5425', '5425', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('542524', '日土县', '3', '54', '5425', '5425', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('542525', '革吉县', '3', '54', '5425', '5425', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('542526', '改则县', '3', '54', '5425', '5425', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('542527', '措勤县', '3', '54', '5425', '5425', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610101', '市辖区', '3', '61', '6101', '6101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610102', '新城区', '3', '61', '6101', '6101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610103', '碑林区', '3', '61', '6101', '6101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610104', '莲湖区', '3', '61', '6101', '6101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610111', '灞桥区', '3', '61', '6101', '6101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610112', '未央区', '3', '61', '6101', '6101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610113', '雁塔区', '3', '61', '6101', '6101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610114', '阎良区', '3', '61', '6101', '6101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610115', '临潼区', '3', '61', '6101', '6101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610116', '长安区', '3', '61', '6101', '6101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610117', '高陵区', '3', '61', '6101', '6101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610122', '蓝田县', '3', '61', '6101', '6101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610124', '周至县', '3', '61', '6101', '6101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610125', '户县', '3', '61', '6101', '6101', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610201', '市辖区', '3', '61', '6102', '6102', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610202', '王益区', '3', '61', '6102', '6102', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610203', '印台区', '3', '61', '6102', '6102', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610204', '耀州区', '3', '61', '6102', '6102', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610222', '宜君县', '3', '61', '6102', '6102', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610301', '市辖区', '3', '61', '6103', '6103', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610302', '渭滨区', '3', '61', '6103', '6103', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610303', '金台区', '3', '61', '6103', '6103', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610304', '陈仓区', '3', '61', '6103', '6103', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610322', '凤翔县', '3', '61', '6103', '6103', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610323', '岐山县', '3', '61', '6103', '6103', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610324', '扶风县', '3', '61', '6103', '6103', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610326', '眉县', '3', '61', '6103', '6103', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610327', '陇县', '3', '61', '6103', '6103', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610328', '千阳县', '3', '61', '6103', '6103', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610329', '麟游县', '3', '61', '6103', '6103', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610330', '凤县', '3', '61', '6103', '6103', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610331', '太白县', '3', '61', '6103', '6103', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610401', '市辖区', '3', '61', '6104', '6104', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610402', '秦都区', '3', '61', '6104', '6104', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610403', '杨陵区', '3', '61', '6104', '6104', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610404', '渭城区', '3', '61', '6104', '6104', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610422', '三原县', '3', '61', '6104', '6104', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610423', '泾阳县', '3', '61', '6104', '6104', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610424', '乾县', '3', '61', '6104', '6104', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610425', '礼泉县', '3', '61', '6104', '6104', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610426', '永寿县', '3', '61', '6104', '6104', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610427', '彬县', '3', '61', '6104', '6104', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610428', '长武县', '3', '61', '6104', '6104', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610429', '旬邑县', '3', '61', '6104', '6104', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610430', '淳化县', '3', '61', '6104', '6104', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610431', '武功县', '3', '61', '6104', '6104', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610481', '兴平市', '3', '61', '6104', '6104', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610501', '市辖区', '3', '61', '6105', '6105', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610502', '临渭区', '3', '61', '6105', '6105', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610503', '华州区', '3', '61', '6105', '6105', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610522', '潼关县', '3', '61', '6105', '6105', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610523', '大荔县', '3', '61', '6105', '6105', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610524', '合阳县', '3', '61', '6105', '6105', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610525', '澄城县', '3', '61', '6105', '6105', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610526', '蒲城县', '3', '61', '6105', '6105', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610527', '白水县', '3', '61', '6105', '6105', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610528', '富平县', '3', '61', '6105', '6105', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610581', '韩城市', '3', '61', '6105', '6105', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610582', '华阴市', '3', '61', '6105', '6105', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610601', '市辖区', '3', '61', '6106', '6106', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610602', '宝塔区', '3', '61', '6106', '6106', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610603', '安塞区', '3', '61', '6106', '6106', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610621', '延长县', '3', '61', '6106', '6106', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610622', '延川县', '3', '61', '6106', '6106', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610623', '子长县', '3', '61', '6106', '6106', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610625', '志丹县', '3', '61', '6106', '6106', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610626', '吴起县', '3', '61', '6106', '6106', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610627', '甘泉县', '3', '61', '6106', '6106', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610628', '富县', '3', '61', '6106', '6106', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610629', '洛川县', '3', '61', '6106', '6106', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610630', '宜川县', '3', '61', '6106', '6106', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610631', '黄龙县', '3', '61', '6106', '6106', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610632', '黄陵县', '3', '61', '6106', '6106', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610701', '市辖区', '3', '61', '6107', '6107', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610702', '汉台区', '3', '61', '6107', '6107', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610721', '南郑县', '3', '61', '6107', '6107', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610722', '城固县', '3', '61', '6107', '6107', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610723', '洋县', '3', '61', '6107', '6107', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610724', '西乡县', '3', '61', '6107', '6107', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610725', '勉县', '3', '61', '6107', '6107', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610726', '宁强县', '3', '61', '6107', '6107', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610727', '略阳县', '3', '61', '6107', '6107', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610728', '镇巴县', '3', '61', '6107', '6107', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610729', '留坝县', '3', '61', '6107', '6107', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610730', '佛坪县', '3', '61', '6107', '6107', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610801', '市辖区', '3', '61', '6108', '6108', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610802', '榆阳区', '3', '61', '6108', '6108', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610803', '横山区', '3', '61', '6108', '6108', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610821', '神木县', '3', '61', '6108', '6108', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610822', '府谷县', '3', '61', '6108', '6108', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610824', '靖边县', '3', '61', '6108', '6108', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610825', '定边县', '3', '61', '6108', '6108', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610826', '绥德县', '3', '61', '6108', '6108', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610827', '米脂县', '3', '61', '6108', '6108', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610828', '佳县', '3', '61', '6108', '6108', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610829', '吴堡县', '3', '61', '6108', '6108', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610830', '清涧县', '3', '61', '6108', '6108', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610831', '子洲县', '3', '61', '6108', '6108', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610901', '市辖区', '3', '61', '6109', '6109', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610902', '汉滨区', '3', '61', '6109', '6109', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610921', '汉阴县', '3', '61', '6109', '6109', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610922', '石泉县', '3', '61', '6109', '6109', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610923', '宁陕县', '3', '61', '6109', '6109', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610924', '紫阳县', '3', '61', '6109', '6109', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610925', '岚皋县', '3', '61', '6109', '6109', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610926', '平利县', '3', '61', '6109', '6109', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610927', '镇坪县', '3', '61', '6109', '6109', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610928', '旬阳县', '3', '61', '6109', '6109', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('610929', '白河县', '3', '61', '6109', '6109', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('611001', '市辖区', '3', '61', '6110', '6110', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('611002', '商州区', '3', '61', '6110', '6110', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('611021', '洛南县', '3', '61', '6110', '6110', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('611022', '丹凤县', '3', '61', '6110', '6110', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('611023', '商南县', '3', '61', '6110', '6110', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('611024', '山阳县', '3', '61', '6110', '6110', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('611025', '镇安县', '3', '61', '6110', '6110', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('611026', '柞水县', '3', '61', '6110', '6110', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620101', '市辖区', '3', '62', '6201', '6201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620102', '城关区', '3', '62', '6201', '6201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620103', '七里河区', '3', '62', '6201', '6201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620104', '西固区', '3', '62', '6201', '6201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620105', '安宁区', '3', '62', '6201', '6201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620111', '红古区', '3', '62', '6201', '6201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620121', '永登县', '3', '62', '6201', '6201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620122', '皋兰县', '3', '62', '6201', '6201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620123', '榆中县', '3', '62', '6201', '6201', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620201', '市辖区', '3', '62', '6202', '6202', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620301', '市辖区', '3', '62', '6203', '6203', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620302', '金川区', '3', '62', '6203', '6203', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620321', '永昌县', '3', '62', '6203', '6203', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620401', '市辖区', '3', '62', '6204', '6204', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620402', '白银区', '3', '62', '6204', '6204', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620403', '平川区', '3', '62', '6204', '6204', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620421', '靖远县', '3', '62', '6204', '6204', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620422', '会宁县', '3', '62', '6204', '6204', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620423', '景泰县', '3', '62', '6204', '6204', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620501', '市辖区', '3', '62', '6205', '6205', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620502', '秦州区', '3', '62', '6205', '6205', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620503', '麦积区', '3', '62', '6205', '6205', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620521', '清水县', '3', '62', '6205', '6205', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620522', '秦安县', '3', '62', '6205', '6205', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620523', '甘谷县', '3', '62', '6205', '6205', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620524', '武山县', '3', '62', '6205', '6205', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620525', '张家川回族自治县', '3', '62', '6205', '6205', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620601', '市辖区', '3', '62', '6206', '6206', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620602', '凉州区', '3', '62', '6206', '6206', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620621', '民勤县', '3', '62', '6206', '6206', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620622', '古浪县', '3', '62', '6206', '6206', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620623', '天祝藏族自治县', '3', '62', '6206', '6206', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620701', '市辖区', '3', '62', '6207', '6207', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620702', '甘州区', '3', '62', '6207', '6207', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620721', '肃南裕固族自治县', '3', '62', '6207', '6207', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620722', '民乐县', '3', '62', '6207', '6207', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620723', '临泽县', '3', '62', '6207', '6207', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620724', '高台县', '3', '62', '6207', '6207', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620725', '山丹县', '3', '62', '6207', '6207', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620801', '市辖区', '3', '62', '6208', '6208', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620802', '崆峒区', '3', '62', '6208', '6208', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620821', '泾川县', '3', '62', '6208', '6208', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620822', '灵台县', '3', '62', '6208', '6208', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620823', '崇信县', '3', '62', '6208', '6208', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620824', '华亭县', '3', '62', '6208', '6208', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620825', '庄浪县', '3', '62', '6208', '6208', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620826', '静宁县', '3', '62', '6208', '6208', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620901', '市辖区', '3', '62', '6209', '6209', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620902', '肃州区', '3', '62', '6209', '6209', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620921', '金塔县', '3', '62', '6209', '6209', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620922', '瓜州县', '3', '62', '6209', '6209', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620923', '肃北蒙古族自治县', '3', '62', '6209', '6209', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620924', '阿克塞哈萨克族自治县', '3', '62', '6209', '6209', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620981', '玉门市', '3', '62', '6209', '6209', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('620982', '敦煌市', '3', '62', '6209', '6209', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('621001', '市辖区', '3', '62', '6210', '6210', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('621002', '西峰区', '3', '62', '6210', '6210', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('621021', '庆城县', '3', '62', '6210', '6210', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('621022', '环县', '3', '62', '6210', '6210', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('621023', '华池县', '3', '62', '6210', '6210', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('621024', '合水县', '3', '62', '6210', '6210', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('621025', '正宁县', '3', '62', '6210', '6210', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('621026', '宁县', '3', '62', '6210', '6210', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('621027', '镇原县', '3', '62', '6210', '6210', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('621101', '市辖区', '3', '62', '6211', '6211', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('621102', '安定区', '3', '62', '6211', '6211', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('621121', '通渭县', '3', '62', '6211', '6211', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('621122', '陇西县', '3', '62', '6211', '6211', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('621123', '渭源县', '3', '62', '6211', '6211', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('621124', '临洮县', '3', '62', '6211', '6211', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('621125', '漳县', '3', '62', '6211', '6211', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('621126', '岷县', '3', '62', '6211', '6211', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('621201', '市辖区', '3', '62', '6212', '6212', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('621202', '武都区', '3', '62', '6212', '6212', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('621221', '成县', '3', '62', '6212', '6212', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('621222', '文县', '3', '62', '6212', '6212', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('621223', '宕昌县', '3', '62', '6212', '6212', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('621224', '康县', '3', '62', '6212', '6212', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('621225', '西和县', '3', '62', '6212', '6212', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('621226', '礼县', '3', '62', '6212', '6212', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('621227', '徽县', '3', '62', '6212', '6212', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('621228', '两当县', '3', '62', '6212', '6212', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('622901', '临夏市', '3', '62', '6229', '6229', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('622921', '临夏县', '3', '62', '6229', '6229', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('622922', '康乐县', '3', '62', '6229', '6229', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('622923', '永靖县', '3', '62', '6229', '6229', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('622924', '广河县', '3', '62', '6229', '6229', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('622925', '和政县', '3', '62', '6229', '6229', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('622926', '东乡族自治县', '3', '62', '6229', '6229', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('622927', '积石山保安族东乡族撒拉族自治县', '3', '62', '6229', '6229', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('623001', '合作市', '3', '62', '6230', '6230', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('623021', '临潭县', '3', '62', '6230', '6230', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('623022', '卓尼县', '3', '62', '6230', '6230', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('623023', '舟曲县', '3', '62', '6230', '6230', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('623024', '迭部县', '3', '62', '6230', '6230', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('623025', '玛曲县', '3', '62', '6230', '6230', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('623026', '碌曲县', '3', '62', '6230', '6230', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('623027', '夏河县', '3', '62', '6230', '6230', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('630101', '市辖区', '3', '63', '6301', '6301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('630102', '城东区', '3', '63', '6301', '6301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('630103', '城中区', '3', '63', '6301', '6301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('630104', '城西区', '3', '63', '6301', '6301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('630105', '城北区', '3', '63', '6301', '6301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('630121', '大通回族土族自治县', '3', '63', '6301', '6301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('630122', '湟中县', '3', '63', '6301', '6301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('630123', '湟源县', '3', '63', '6301', '6301', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('630202', '乐都区', '3', '63', '6302', '6302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('630203', '平安区', '3', '63', '6302', '6302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('630222', '民和回族土族自治县', '3', '63', '6302', '6302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('630223', '互助土族自治县', '3', '63', '6302', '6302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('630224', '化隆回族自治县', '3', '63', '6302', '6302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('630225', '循化撒拉族自治县', '3', '63', '6302', '6302', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('632221', '门源回族自治县', '3', '63', '6322', '6322', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('632222', '祁连县', '3', '63', '6322', '6322', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('632223', '海晏县', '3', '63', '6322', '6322', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('632224', '刚察县', '3', '63', '6322', '6322', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('632321', '同仁县', '3', '63', '6323', '6323', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('632322', '尖扎县', '3', '63', '6323', '6323', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('632323', '泽库县', '3', '63', '6323', '6323', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('632324', '河南蒙古族自治县', '3', '63', '6323', '6323', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('632521', '共和县', '3', '63', '6325', '6325', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('632522', '同德县', '3', '63', '6325', '6325', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('632523', '贵德县', '3', '63', '6325', '6325', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('632524', '兴海县', '3', '63', '6325', '6325', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('632525', '贵南县', '3', '63', '6325', '6325', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('632621', '玛沁县', '3', '63', '6326', '6326', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('632622', '班玛县', '3', '63', '6326', '6326', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('632623', '甘德县', '3', '63', '6326', '6326', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('632624', '达日县', '3', '63', '6326', '6326', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('632625', '久治县', '3', '63', '6326', '6326', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('632626', '玛多县', '3', '63', '6326', '6326', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('632701', '玉树市', '3', '63', '6327', '6327', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('632722', '杂多县', '3', '63', '6327', '6327', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('632723', '称多县', '3', '63', '6327', '6327', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('632724', '治多县', '3', '63', '6327', '6327', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('632725', '囊谦县', '3', '63', '6327', '6327', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('632726', '曲麻莱县', '3', '63', '6327', '6327', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('632801', '格尔木市', '3', '63', '6328', '6328', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('632802', '德令哈市', '3', '63', '6328', '6328', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('632821', '乌兰县', '3', '63', '6328', '6328', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('632822', '都兰县', '3', '63', '6328', '6328', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('632823', '天峻县', '3', '63', '6328', '6328', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('640101', '市辖区', '3', '64', '6401', '6401', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('640104', '兴庆区', '3', '64', '6401', '6401', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('640105', '西夏区', '3', '64', '6401', '6401', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('640106', '金凤区', '3', '64', '6401', '6401', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('640121', '永宁县', '3', '64', '6401', '6401', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('640122', '贺兰县', '3', '64', '6401', '6401', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('640181', '灵武市', '3', '64', '6401', '6401', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('640201', '市辖区', '3', '64', '6402', '6402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('640202', '大武口区', '3', '64', '6402', '6402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('640205', '惠农区', '3', '64', '6402', '6402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('640221', '平罗县', '3', '64', '6402', '6402', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('640301', '市辖区', '3', '64', '6403', '6403', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('640302', '利通区', '3', '64', '6403', '6403', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('640303', '红寺堡区', '3', '64', '6403', '6403', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('640323', '盐池县', '3', '64', '6403', '6403', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('640324', '同心县', '3', '64', '6403', '6403', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('640381', '青铜峡市', '3', '64', '6403', '6403', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('640401', '市辖区', '3', '64', '6404', '6404', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('640402', '原州区', '3', '64', '6404', '6404', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('640422', '西吉县', '3', '64', '6404', '6404', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('640423', '隆德县', '3', '64', '6404', '6404', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('640424', '泾源县', '3', '64', '6404', '6404', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('640425', '彭阳县', '3', '64', '6404', '6404', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('640501', '市辖区', '3', '64', '6405', '6405', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('640502', '沙坡头区', '3', '64', '6405', '6405', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('640521', '中宁县', '3', '64', '6405', '6405', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('640522', '海原县', '3', '64', '6405', '6405', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('650101', '市辖区', '3', '65', '6501', '6501', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('650102', '天山区', '3', '65', '6501', '6501', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('650103', '沙依巴克区', '3', '65', '6501', '6501', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('650104', '新市区', '3', '65', '6501', '6501', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('650105', '水磨沟区', '3', '65', '6501', '6501', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('650106', '头屯河区', '3', '65', '6501', '6501', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('650107', '达坂城区', '3', '65', '6501', '6501', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('650109', '米东区', '3', '65', '6501', '6501', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('650121', '乌鲁木齐县', '3', '65', '6501', '6501', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('650201', '市辖区', '3', '65', '6502', '6502', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('650202', '独山子区', '3', '65', '6502', '6502', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('650203', '克拉玛依区', '3', '65', '6502', '6502', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('650204', '白碱滩区', '3', '65', '6502', '6502', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('650205', '乌尔禾区', '3', '65', '6502', '6502', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('650402', '高昌区', '3', '65', '6504', '6504', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('650421', '鄯善县', '3', '65', '6504', '6504', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('650422', '托克逊县', '3', '65', '6504', '6504', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('650502', '伊州区', '3', '65', '6505', '6505', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('650521', '巴里坤哈萨克自治县', '3', '65', '6505', '6505', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('650522', '伊吾县', '3', '65', '6505', '6505', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('652301', '昌吉市', '3', '65', '6523', '6523', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('652302', '阜康市', '3', '65', '6523', '6523', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('652323', '呼图壁县', '3', '65', '6523', '6523', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('652324', '玛纳斯县', '3', '65', '6523', '6523', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('652325', '奇台县', '3', '65', '6523', '6523', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('652327', '吉木萨尔县', '3', '65', '6523', '6523', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('652328', '木垒哈萨克自治县', '3', '65', '6523', '6523', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('652701', '博乐市', '3', '65', '6527', '6527', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('652702', '阿拉山口市', '3', '65', '6527', '6527', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('652722', '精河县', '3', '65', '6527', '6527', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('652723', '温泉县', '3', '65', '6527', '6527', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('652801', '库尔勒市', '3', '65', '6528', '6528', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('652822', '轮台县', '3', '65', '6528', '6528', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('652823', '尉犁县', '3', '65', '6528', '6528', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('652824', '若羌县', '3', '65', '6528', '6528', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('652825', '且末县', '3', '65', '6528', '6528', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('652826', '焉耆回族自治县', '3', '65', '6528', '6528', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('652827', '和静县', '3', '65', '6528', '6528', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('652828', '和硕县', '3', '65', '6528', '6528', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('652829', '博湖县', '3', '65', '6528', '6528', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('652901', '阿克苏市', '3', '65', '6529', '6529', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('652922', '温宿县', '3', '65', '6529', '6529', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('652923', '库车县', '3', '65', '6529', '6529', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('652924', '沙雅县', '3', '65', '6529', '6529', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('652925', '新和县', '3', '65', '6529', '6529', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('652926', '拜城县', '3', '65', '6529', '6529', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('652927', '乌什县', '3', '65', '6529', '6529', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('652928', '阿瓦提县', '3', '65', '6529', '6529', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('652929', '柯坪县', '3', '65', '6529', '6529', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('653001', '阿图什市', '3', '65', '6530', '6530', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('653022', '阿克陶县', '3', '65', '6530', '6530', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('653023', '阿合奇县', '3', '65', '6530', '6530', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('653024', '乌恰县', '3', '65', '6530', '6530', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('653101', '喀什市', '3', '65', '6531', '6531', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('653121', '疏附县', '3', '65', '6531', '6531', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('653122', '疏勒县', '3', '65', '6531', '6531', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('653123', '英吉沙县', '3', '65', '6531', '6531', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('653124', '泽普县', '3', '65', '6531', '6531', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('653125', '莎车县', '3', '65', '6531', '6531', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('653126', '叶城县', '3', '65', '6531', '6531', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('653127', '麦盖提县', '3', '65', '6531', '6531', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('653128', '岳普湖县', '3', '65', '6531', '6531', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('653129', '伽师县', '3', '65', '6531', '6531', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('653130', '巴楚县', '3', '65', '6531', '6531', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('653131', '塔什库尔干塔吉克自治县', '3', '65', '6531', '6531', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('653201', '和田市', '3', '65', '6532', '6532', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('653221', '和田县', '3', '65', '6532', '6532', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('653222', '墨玉县', '3', '65', '6532', '6532', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('653223', '皮山县', '3', '65', '6532', '6532', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('653224', '洛浦县', '3', '65', '6532', '6532', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('653225', '策勒县', '3', '65', '6532', '6532', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('653226', '于田县', '3', '65', '6532', '6532', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('653227', '民丰县', '3', '65', '6532', '6532', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('654002', '伊宁市', '3', '65', '6540', '6540', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('654003', '奎屯市', '3', '65', '6540', '6540', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('654004', '霍尔果斯市', '3', '65', '6540', '6540', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('654021', '伊宁县', '3', '65', '6540', '6540', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('654022', '察布查尔锡伯自治县', '3', '65', '6540', '6540', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('654023', '霍城县', '3', '65', '6540', '6540', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('654024', '巩留县', '3', '65', '6540', '6540', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('654025', '新源县', '3', '65', '6540', '6540', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('654026', '昭苏县', '3', '65', '6540', '6540', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('654027', '特克斯县', '3', '65', '6540', '6540', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('654028', '尼勒克县', '3', '65', '6540', '6540', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('654201', '塔城市', '3', '65', '6542', '6542', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('654202', '乌苏市', '3', '65', '6542', '6542', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('654221', '额敏县', '3', '65', '6542', '6542', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('654223', '沙湾县', '3', '65', '6542', '6542', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('654224', '托里县', '3', '65', '6542', '6542', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('654225', '裕民县', '3', '65', '6542', '6542', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('654226', '和布克赛尔蒙古自治县', '3', '65', '6542', '6542', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('654301', '阿勒泰市', '3', '65', '6543', '6543', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('654321', '布尔津县', '3', '65', '6543', '6543', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('654322', '富蕴县', '3', '65', '6543', '6543', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('654323', '福海县', '3', '65', '6543', '6543', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('654324', '哈巴河县', '3', '65', '6543', '6543', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('654325', '青河县', '3', '65', '6543', '6543', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('654326', '吉木乃县', '3', '65', '6543', '6543', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('659001', '石河子市', '3', '65', '6590', '6590', '0', '358', '', '');
INSERT INTO `ibt_region` VALUES ('659002', '阿拉尔市', '3', '65', '6590', '6590', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('659003', '图木舒克市', '3', '65', '6590', '6590', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('659004', '五家渠市', '3', '65', '6590', '6590', '0', null, '', '');
INSERT INTO `ibt_region` VALUES ('659006', '铁门关市', '3', '65', '6590', '6590', '0', null, '', '');

-- ----------------------------
-- Table structure for ibt_room
-- ----------------------------
DROP TABLE IF EXISTS `ibt_room`;
CREATE TABLE `ibt_room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `etprsId` int(11) DEFAULT '0' COMMENT '所属企业ID 对应enterprise表',
  `buildId` int(11) DEFAULT '0' COMMENT '所属楼',
  `floorId` int(11) DEFAULT '0' COMMENT '所属楼层ID',
  `roomNo` varchar(50) DEFAULT '' COMMENT '房间编号',
  `area` decimal(11,2) DEFAULT '0.00' COMMENT '面积',
  `num` int(11) DEFAULT '0' COMMENT '工位个数',
  `iqbtId` int(6) DEFAULT '0' COMMENT '孵化器ID',
  `type` int(2) DEFAULT '0' COMMENT '类型：0-集中办公 1-独立办公室',
  `status` int(11) DEFAULT '0' COMMENT '状态：0-空闲 1-已占用   2-正常使用 3-自用',
  `unit` varchar(50) DEFAULT '' COMMENT '单位',
  `price` decimal(11,2) DEFAULT '0.00' COMMENT '单价',
  `dection` varchar(50) DEFAULT '' COMMENT '装修 字典表',
  `total` decimal(11,2) DEFAULT '0.00' COMMENT '月租',
  `selfuse` int(11) DEFAULT '7002002' COMMENT '是否自用',
  `isDelete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  `lastupdateTime` int(11) DEFAULT '0' COMMENT '最后修改时间',
  `addtime` int(11) DEFAULT '0' COMMENT '注册时间',
  `adduserId` int(11) DEFAULT '0' COMMENT '11',
  `roomPics` varchar(255) DEFAULT '' COMMENT '20180203新增  房间图片 多个逗号隔开',
  PRIMARY KEY (`id`),
  KEY `room_iqbtId` (`iqbtId`),
  KEY `room_etprsId` (`etprsId`),
  KEY `room_isDelet` (`isDelete`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8 COMMENT='物业-房屋分配管理 ';

-- ----------------------------
-- Records of ibt_room
-- ----------------------------
INSERT INTO `ibt_room` VALUES ('84', '28', '268', '282', '2001', '200.00', '0', '1', '6011001', '1', '6009001', '20.00', '6010001', '4000.00', '7002002', '0', '1524103713', '1521769420', '2', '');
INSERT INTO `ibt_room` VALUES ('85', '38', '268', '283', '3001', '0.00', '50', '1', '6011002', '1', '6009004', '100.00', '6010002', '5000.00', '7002002', '0', '1524467473', '1521769420', '2', '');
INSERT INTO `ibt_room` VALUES ('86', '0', '268', '284', '4001', '0.00', '50', '1', '6011002', '3', '6009003', '100.00', '6010004', '5000.00', '7002002', '0', '1521769420', '1521769420', '2', '');
INSERT INTO `ibt_room` VALUES ('87', '11', '270', '286', '5001', '100.00', '0', '1', '6011001', '2', '6009002', '20.00', '6010003', '2000.00', '7002002', '0', '1521857261', '1521771502', '2', '204');
INSERT INTO `ibt_room` VALUES ('88', '26', '271', '287', '1001', '100.00', '0', '9', '6011001', '2', '6009002', '20.00', '6010001', '2000.00', '7002002', '0', '1521871168', '1521868890', '40', '');
INSERT INTO `ibt_room` VALUES ('89', '0', '271', '287', '1002', '0.00', '1', '9', '6011002', '0', '6009003', '50.00', '6010002', '1500.00', '7002002', '0', '1521870066', '1521868957', '40', '');
INSERT INTO `ibt_room` VALUES ('90', '0', '272', '288', '1003', '0.00', '1', '9', '6011002', '3', '', '0.00', '6010003', '0.00', '7002002', '0', '1521870077', '1521869032', '40', '');
INSERT INTO `ibt_room` VALUES ('91', '0', '271', '287', '1004', '0.00', '1', '9', '6011002', '3', '', '0.00', '6010005', '0.00', '7002002', '0', '1521870431', '1521869665', '40', '');
INSERT INTO `ibt_room` VALUES ('92', '0', '271', '287', '1005', '0.00', '0', '9', '6011001', '3', '', '0.00', '6010004', '0.00', '7002002', '0', '1521870086', '1521869665', '40', '');
INSERT INTO `ibt_room` VALUES ('93', '0', '273', '289', '2501', '600.00', '0', '1', '6011001', '3', '6009001', '1.60', '6010003', '28800.00', '7002002', '0', '1522043252', '1522033972', '2', '253');
INSERT INTO `ibt_room` VALUES ('94', '0', '274', '290', '201--203,210', '500.00', '0', '1', '6011001', '3', '6009001', '1.00', '6010003', '15000.00', '7002002', '0', '1522044249', '1522043914', '46', '258');
INSERT INTO `ibt_room` VALUES ('95', '3', '275', '291', '1209', '0.00', '1', '1', '6011002', '1', '6009003', '50.00', '6010001', '5000.00', '7002002', '0', '1523254238', '1522050347', '2', '267');
INSERT INTO `ibt_room` VALUES ('96', '3', '275', '291', '1208', '50.00', '0', '1', '6011001', '1', '6009002', '50.00', '', '5000.00', '7002002', '0', '1523254238', '1522050347', '2', '');
INSERT INTO `ibt_room` VALUES ('97', '0', '275', '291', '1207', '0.00', '1', '1', '6011002', '3', '6009003', '50.00', '', '5000.00', '7002002', '0', '1522199642', '1522050347', '2', '268');
INSERT INTO `ibt_room` VALUES ('98', '0', '275', '291', '1206', '0.00', '1', '1', '6011002', '3', '6009004', '50.00', '', '5000.00', '7002002', '0', '1522050347', '1522050347', '2', '');
INSERT INTO `ibt_room` VALUES ('99', '0', '275', '291', '1205', '50.00', '0', '1', '6011001', '3', '6009002', '50.00', '', '5000.00', '7002002', '0', '1522050347', '1522050347', '2', '');
INSERT INTO `ibt_room` VALUES ('100', '34', '275', '291', '120610001-11111111111111111111111111', '100.00', '0', '1', '6011001', '1', '6009001', '10.00', '6010002', '30000.00', '7002002', '0', '1524618215', '1522056562', '2', '312,313');
INSERT INTO `ibt_room` VALUES ('101', '0', '276', '292', '11', '111.00', '0', '1', '6011001', '0', '6009001', '11.00', '', '36630.00', '7002002', '1', '1524639567', '1524639491', '2', '');
INSERT INTO `ibt_room` VALUES ('102', '0', '277', '293', '11', '0.00', '1', '1', '6011002', '0', '6009003', '1.00', '', '30.00', '7002002', '0', '1524647918', '1524647918', '2', '');
INSERT INTO `ibt_room` VALUES ('103', '0', '277', '293', '1', '11.00', '0', '1', '6011001', '0', '6009001', '1.00', '6010001', '330.00', '7002002', '0', '1524651910', '1524651910', '2', '');
INSERT INTO `ibt_room` VALUES ('104', '0', '278', '294', '1', '11.00', '0', '1', '6011001', '0', '6009002', '1.00', '', '11.00', '7002002', '0', '1524713679', '1524713679', '2', '');

-- ----------------------------
-- Table structure for ibt_room_rcd
-- ----------------------------
DROP TABLE IF EXISTS `ibt_room_rcd`;
CREATE TABLE `ibt_room_rcd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `etprsId` int(11) DEFAULT '0' COMMENT '所属企业ID 对应enterprise表',
  `roomId` int(11) DEFAULT '0' COMMENT '房间',
  `iqbtId` int(3) DEFAULT '0' COMMENT '孵化器ID',
  `startTime` int(11) DEFAULT '0' COMMENT '开始时间',
  `endTime` int(11) DEFAULT '0' COMMENT '结束时间',
  `status` int(2) DEFAULT '0' COMMENT '状态：1-正常使用  2-空闲',
  `isDelete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  `lastupdateTime` int(11) DEFAULT '0' COMMENT '最后修改时间',
  `addtime` int(11) DEFAULT '0' COMMENT '注册时间',
  `adduserId` int(11) DEFAULT '0' COMMENT '11',
  PRIMARY KEY (`id`),
  KEY `room_rcd_isDelte` (`isDelete`),
  KEY `room_rcd_etprsId` (`etprsId`),
  KEY `room_rcd_iqbtId` (`iqbtId`),
  KEY `room_rcd_roomid` (`roomId`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='房间分配历史记录';

-- ----------------------------
-- Records of ibt_room_rcd
-- ----------------------------
INSERT INTO `ibt_room_rcd` VALUES ('1', '3', '2', '1', '1521043200', '1552492800', '1', '0', '1521106402', '1521106402', '2');
INSERT INTO `ibt_room_rcd` VALUES ('2', '6', '7', '6', '1521129600', '1584201600', '1', '0', '1521181972', '1521180025', '8');
INSERT INTO `ibt_room_rcd` VALUES ('3', '7', '10', '6', '1521129600', '1552579200', '2', '0', '1521180750', '1521180695', '8');
INSERT INTO `ibt_room_rcd` VALUES ('4', '8', '10', '6', '1521129600', '1552579200', '1', '0', '1521182140', '1521180892', '8');
INSERT INTO `ibt_room_rcd` VALUES ('5', '7', '8', '6', '1521129600', '1552579200', '1', '0', '1521183410', '1521183329', '8');
INSERT INTO `ibt_room_rcd` VALUES ('6', '2', '3', '1', '1521388800', '1552838400', '2', '0', '1521426041', '1521424336', '2');
INSERT INTO `ibt_room_rcd` VALUES ('7', '1', '5', '1', '1521388800', '1552838400', '1', '0', '1521426147', '1521426147', '2');
INSERT INTO `ibt_room_rcd` VALUES ('8', '9', '3', '1', '1521388800', '1552838400', '1', '0', '1521450806', '1521450806', '2');
INSERT INTO `ibt_room_rcd` VALUES ('9', '12', '62', '1', '1584806400', '1614441600', '1', '0', '1521695275', '1521684318', '2');
INSERT INTO `ibt_room_rcd` VALUES ('10', '12', '67', '1', '1584806400', '1614441600', '2', '0', '1521695275', '1521684543', '2');
INSERT INTO `ibt_room_rcd` VALUES ('11', '16', '68', '1', '1521648000', '1553097600', '1', '0', '1521686581', '1521686581', '2');
INSERT INTO `ibt_room_rcd` VALUES ('12', '19', '67', '1', '1521648000', '1553097600', '1', '0', '1521699161', '1521699161', '2');
INSERT INTO `ibt_room_rcd` VALUES ('13', '20', '79', '1', '1521648000', '1553097600', '2', '0', '1521704447', '1521699691', '2');
INSERT INTO `ibt_room_rcd` VALUES ('14', '17', '79', '1', '1521648000', '1553097600', '2', '0', '1521705293', '1521704453', '2');
INSERT INTO `ibt_room_rcd` VALUES ('15', '16', '5', '1', '1521648000', '1553097600', '1', '0', '1521704571', '1521704571', '2');
INSERT INTO `ibt_room_rcd` VALUES ('16', '9', '68', '1', '1521648000', '1553097600', '1', '0', '1521704703', '1521704703', '2');
INSERT INTO `ibt_room_rcd` VALUES ('17', '17', '67', '1', '1521648000', '1553097600', '1', '0', '1521705293', '1521705293', '2');
INSERT INTO `ibt_room_rcd` VALUES ('18', '19', '5', '1', '1521648000', '1553097600', '2', '0', '1521705410', '1521705381', '2');
INSERT INTO `ibt_room_rcd` VALUES ('19', '19', '79', '1', '1521648000', '1553097600', '2', '0', '1521705410', '1521705381', '2');
INSERT INTO `ibt_room_rcd` VALUES ('20', '19', '68', '1', '1521648000', '1553097600', '1', '0', '1521705410', '1521705410', '2');
INSERT INTO `ibt_room_rcd` VALUES ('21', '21', '79', '1', '1521648000', '1553097600', '1', '0', '1521705872', '1521705872', '2');
INSERT INTO `ibt_room_rcd` VALUES ('22', '22', '81', '1', '1521648000', '1584720000', '2', '0', '1521767570', '1521707301', '2');
INSERT INTO `ibt_room_rcd` VALUES ('23', '18', '80', '1', '1521648000', '1553097600', '1', '0', '1521708430', '1521708430', '2');
INSERT INTO `ibt_room_rcd` VALUES ('24', '22', '5', '1', '1521648000', '1584720000', '2', '0', '1521767570', '1521708582', '2');
INSERT INTO `ibt_room_rcd` VALUES ('25', '23', '81', '1', '1553270400', '1584806400', '1', '0', '1521768532', '1521768297', '2');
INSERT INTO `ibt_room_rcd` VALUES ('26', '9', '5', '1', '1521734400', '1553184000', '2', '0', '1521768476', '1521768409', '2');
INSERT INTO `ibt_room_rcd` VALUES ('27', '23', '5', '1', '1553270400', '1584806400', '2', '0', '1521768532', '1521768493', '2');
INSERT INTO `ibt_room_rcd` VALUES ('28', '11', '87', '1', '1605801600', '1609257600', '1', '0', '1523589515', '1521773610', '2');
INSERT INTO `ibt_room_rcd` VALUES ('29', '16', '84', '1', '1521820800', '1553270400', '2', '0', '1523587206', '1521855152', '2');
INSERT INTO `ibt_room_rcd` VALUES ('30', '26', '88', '9', '1521820800', '1553270400', '1', '0', '1521871007', '1521871007', '40');
INSERT INTO `ibt_room_rcd` VALUES ('31', '16', '85', '1', '1521648000', '1553270400', '2', '0', '1523587206', '1522047402', '2');
INSERT INTO `ibt_room_rcd` VALUES ('32', '3', '95', '1', '1523203200', '1554652800', '1', '0', '1523254238', '1523254238', '2');
INSERT INTO `ibt_room_rcd` VALUES ('33', '3', '96', '1', '1523203200', '1554652800', '1', '0', '1523254238', '1523254238', '2');
INSERT INTO `ibt_room_rcd` VALUES ('34', '28', '84', '1', '1524067200', '1555516800', '1', '0', '1524103713', '1524103713', '2');
INSERT INTO `ibt_room_rcd` VALUES ('35', '34', '100', '1', '1524412800', '1555862400', '1', '0', '1524454131', '1524454131', '2');
INSERT INTO `ibt_room_rcd` VALUES ('36', '38', '85', '1', '1524412800', '1555862400', '1', '0', '1524467473', '1524467473', '2');

-- ----------------------------
-- Table structure for ibt_sms_log
-- ----------------------------
DROP TABLE IF EXISTS `ibt_sms_log`;
CREATE TABLE `ibt_sms_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '短信验证码ID',
  `iqbtId` int(11) DEFAULT '0',
  `adduserId` int(11) DEFAULT '0',
  `isDelete` tinyint(2) DEFAULT '0',
  `addtime` int(11) DEFAULT '0',
  `mobile` varchar(20) DEFAULT '' COMMENT '手机号',
  `msg` varchar(100) DEFAULT '' COMMENT '发送内容，验证码或者其他短信消息',
  `type` tinyint(2) DEFAULT '0' COMMENT '类型：0：注册短信验证， 其他类型待定  4、催发报表',
  `etprsId` int(11) DEFAULT '0',
  `fromUserId` int(11) DEFAULT '0' COMMENT '来自哪个用户的ID',
  `toUserId` int(11) DEFAULT '0' COMMENT '给哪个用户发的',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='短信验证码表';

-- ----------------------------
-- Records of ibt_sms_log
-- ----------------------------
INSERT INTO `ibt_sms_log` VALUES ('1', '0', '0', '0', '1522238720', '17777777777', '1637', '0', '0', '0', '0');
INSERT INTO `ibt_sms_log` VALUES ('2', '0', '0', '0', '1522236589', '17799999999', '1289', '0', '0', '0', '0');
INSERT INTO `ibt_sms_log` VALUES ('3', '0', '0', '0', '1522238132', '15555554242', '8985', '0', '0', '0', '0');
INSERT INTO `ibt_sms_log` VALUES ('4', '0', '0', '0', '1522238316', '15555556666', '9856', '0', '0', '0', '0');
INSERT INTO `ibt_sms_log` VALUES ('5', '0', '0', '0', '1522299908', '18888888888', '6372', '0', '0', '0', '0');
INSERT INTO `ibt_sms_log` VALUES ('6', '0', '0', '0', '1523261600', '15666666666', '8820', '0', '0', '0', '0');
INSERT INTO `ibt_sms_log` VALUES ('7', '0', '0', '0', '1523270214', '15653217396', '1291', '0', '0', '0', '0');
INSERT INTO `ibt_sms_log` VALUES ('8', '0', '0', '0', '1523263463', '15653217397', '4174', '0', '0', '0', '0');
INSERT INTO `ibt_sms_log` VALUES ('9', '0', '0', '0', '1524032652', '13730928572', '1709', '0', '0', '0', '0');
INSERT INTO `ibt_sms_log` VALUES ('10', '0', '0', '0', '1524029923', '13730928571', '7063', '0', '0', '0', '0');
INSERT INTO `ibt_sms_log` VALUES ('11', '0', '0', '0', '1524619463', '18562712360', '6445', '0', '0', '0', '0');
INSERT INTO `ibt_sms_log` VALUES ('12', '0', '0', '0', '1524652704', '18678976835', '1433', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for ibt_sys_action
-- ----------------------------
DROP TABLE IF EXISTS `ibt_sys_action`;
CREATE TABLE `ibt_sys_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `objectType` varchar(128) DEFAULT NULL COMMENT '表名',
  `actionType` varchar(128) DEFAULT NULL COMMENT '操作类型',
  `objectId` int(1) DEFAULT '0' COMMENT '记录ID',
  `extra` varchar(128) DEFAULT NULL COMMENT '预留字段',
  `actorId` int(11) DEFAULT '0' COMMENT '操作人ID',
  `actTime` varchar(50) DEFAULT NULL COMMENT '操作时间',
  `isDelete` int(2) DEFAULT '0',
  `iqbtId` int(11) DEFAULT '0' COMMENT '孵化器',
  `comments` text COMMENT '说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据库变动记录表';

-- ----------------------------
-- Records of ibt_sys_action
-- ----------------------------

-- ----------------------------
-- Table structure for ibt_sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `ibt_sys_dict`;
CREATE TABLE `ibt_sys_dict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL COMMENT '企业状态  ',
  `code` varchar(50) DEFAULT NULL,
  `level` varchar(255) DEFAULT '2',
  `flag` int(11) DEFAULT '0' COMMENT '标示，各字段根据自身情况而定',
  `isDelete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  `lastupdateTime` int(11) DEFAULT '0' COMMENT '最后修改时间',
  `addtime` int(11) DEFAULT '0' COMMENT '注册时间',
  `adduserId` int(11) DEFAULT '0' COMMENT '11',
  PRIMARY KEY (`id`),
  KEY `dict_flag` (`code`),
  KEY `dict_isdelete` (`isDelete`)
) ENGINE=InnoDB AUTO_INCREMENT=905 DEFAULT CHARSET=utf8 COMMENT='系统字典表';

-- ----------------------------
-- Records of ibt_sys_dict
-- ----------------------------
INSERT INTO `ibt_sys_dict` VALUES ('1', '客户来源渠道', '6001', '1', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('2', '创8平台', '6001001', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('3', '电话咨询', '6001002', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('4', '老客户介绍', '6001003', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('5', '上门', '6001004', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('6', '客户状态', '6002', '1', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('7', '潜在客户', '6002001', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('8', '意向客户', '6002002', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('9', '拟入驻客户', '6002003', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('10', '无效客户', '6002004', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('11', '客户在忙,再联系', '6002001001', '3', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('12', '无法接通,再联系', '6002001002', '3', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('13', '已发资料考虑中', '6002002001', '3', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('14', '预约看房', '6002002002', '3', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('15', '已看房考虑中', '6002002003', '3', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('16', '客户敲定意向', '6002003001', '3', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('17', '无法联系', '6002004001', '3', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('18', '不来看房', '6002004002', '3', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('19', '已找到房', '6002004003', '3', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('20', '无法注册', '6002004004', '3', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('21', '位置不合适', '6002004005', '3', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('22', '预算太低', '6002004006', '3', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('23', '其他渠道已推', '6002004007', '3', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('24', '客户无需求', '6002004008', '3', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('25', '其他原因', '6002004009', '3', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('26', '客户类型', '6003', '1', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('27', '企业', '6003001', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('28', '团队', '6003002', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('29', '空间类型', '6004', '1', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('30', '创业园区', '6004001', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('31', '孵化器', '6004002', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('32', '大学科技园', '6004003', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('33', '众创空间', '6004004', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('34', '其他', '6004005', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('35', '配套设施', '6005', '1', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('36', '会议室', '6005001', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('37', '咖啡厅', '6005002', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('38', '公共前台', '6005003', '2', '0', '1', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('39', '活动厅', '6005004', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('40', '洽谈区', '6005005', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('41', '休闲区', '6005006', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('42', '健身房', '6005007', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('43', '茶水区', '6005008', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('44', '餐厅', '6005009', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('45', '其他', '6005010', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('46', '提供服务', '6006', '1', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('47', '创业培训', '6006001', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('48', '创业咖啡', '6006002', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('49', '工商注册', '6006003', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('50', '财税服务', '6006004', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('51', '融资服务', '6006005', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('52', '人力服务', '6006006', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('53', '导师指导', '6006007', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('54', '法律服务', '6006008', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('55', '政务服务', '6006009', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('56', '金融服务', '6006010', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('57', '行政服务', '6006011', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('58', '营销推广', '6006012', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('59', '办公方式', '6007', '1', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('60', '办公室', '6007001', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('61', '工位', '6007002', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('62', '虚拟入驻', '6007003', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('63', '客户入驻状态', '6008', '1', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('64', '发起入驻前', '6008001', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('65', '发起入驻', '6008002', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('66', '待分配', '6008003', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('67', '待签约', '6008004', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('68', '正式入驻', '6008005', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('69', '已毕业', '6008006', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('70', '房间价格单位', '6009', '1', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('71', '元/平米/天', '6009001', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('72', '元/平米/月', '6009002', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('73', '元/工位/天', '6009003', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('74', '元/工位/月', '6009004', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('75', '元/间/月', '6009005', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('76', '房间装修情况', '6010', '1', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('77', '毛坯', '6010001', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('78', '简装', '6010002', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('79', '精装', '6010003', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('80', '豪装', '6010004', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('81', '遗留装修', '6010005', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('82', '房间类型', '6011', '1', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('83', '办公室', '6011001', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('84', '开放工位', '6011002', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('85', '提交审核状态', '7001', '1', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('86', '已提交', '7001001', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('87', '通过', '7001002', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('88', '拒绝', '7001003', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('89', '是否', '7002', '1', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('90', '是', '7002001', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('93', '否', '7002002', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('94', '性别', '7003', '1', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('95', '男', '7003001', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('100', '女', '7003002', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('101', '外景', '6005015', '2', '0', '1', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('102', '公共前台', '6005016', '2', '0', '1', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('103', '独立办公室', '6005017', '2', '0', '1', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('104', '开放工位', '6005018', '2', '0', '1', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('105', '日志代码', '6012', '1', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('106', '登录', '6012001', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('107', '编辑客户信息', '6012002', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('108', '跟进客户', '6012003', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('109', '导出客户', '6012004', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('110', '导入客户信息', '6012005', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('111', '新增客户', '6012006', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('112', '房间变更', '6012007', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('113', '发起入驻-签约合同', '6012008', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('114', '发起入驻-房间分配', '6012009', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('115', '添加入驻客户', '6012010', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('116', '客户续约', '6012011', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('117', '客户退出', '6012012', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('118', '完善扩展信息', '6012013', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('119', '编辑入驻客户信息', '6012014', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('120', '添加空间', '6012015', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('121', '修改空间信息', '6012016', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('122', '添加房间', '6012017', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('123', '导入房间信息', '6012018', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('124', '导出房间信息', '6012019', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('125', '编辑房间信息', '6012020', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('126', '删除房间', '6012021', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('127', '导入入驻客户', '6012022', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('128', '导出入驻客户', '6012023', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('129', '技术领域', '6013', '1', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('130', '电子信息', '601301', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('131', '先进制造', '601302', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('132', '航空航天', '601303', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('133', '现代交通', '601304', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('134', '生物医药与医疗器械', '601305', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('135', '新材料', '601306', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('136', '新能源与节能', '601307', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('137', '环境保护', '601308', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('138', '地球、空间与海洋', '601309', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('139', '核应用技术', '601310', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('140', '现代农业', '601311', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('141', '融资轮次', '6014', '1', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('142', '公司成立', '601401', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('143', '天使轮', '601402', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('144', 'Pre-A轮', '601403', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('145', 'A轮', '601404', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('146', 'B轮', '601405', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('147', 'C轮', '601406', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('148', 'D轮及以上', '601407', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('149', 'Pre-IPO', '601408', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('150', 'IPO', '601409', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('151', '企业状态', '6015', '1', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('152', '存续', '601501', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('153', '经营异常', '601502', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('154', '僵尸状态', '601503', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('155', '容纳人数', '6016', '1', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('156', '0~5人', '6016001', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('157', '6-10人', '6016002', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('158', '11~20人', '6016003', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('159', '20~50人', '6016004', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('160', '50人以上', '6016005', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('161', '已取消', '7001000', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('162', '会议室配套', '6022', '1', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('163', '桌椅', '6022001', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('164', '投影设备', '6022002', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('165', '移动白板', '6022003', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('166', '电视机', '6022004', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('167', '音响设备', '6022005', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('168', '其他', '6022006', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('169', '活动标签', '6017', '1', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('170', '创业', '6017001', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('171', '公益', '6017002', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('172', '亲子', '6017003', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('173', '科技', '6017004', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('174', '运动', '6017005', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('175', '互联网', '6017006', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('176', '音乐', '6017007', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('177', '交友', '6017008', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('178', '教育', '6017009', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('179', '校园', '6017010', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('180', '电影', '6017011', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('181', 'IT', '6017012', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('182', '健康', '6017013', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('183', '职场', '6017014', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('184', '文艺', '6017015', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('185', '户外', '6017016', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('186', '心理', '6017017', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('187', '金融', '6017018', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('188', '手工', '6017019', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('189', '营销', '6017020', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('190', '旅行', '6017021', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('191', '读书', '6017022', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('192', '电商', '6017023', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('193', '时尚', '6017024', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('194', '设计', '6017025', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('195', '游戏', '6017026', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('196', '用户状态', '6018', '1', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('197', '正常', '6018001', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('198', '异常', '6018002', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('199', '冻结', '6018003', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('200', '用户分类', '6019', '1', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('201', '孵化器管理员', '6019001', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('202', '企业用户', '6019002', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('203', '系统管理员', '6019003', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('204', '冻结用户', '6012024', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('205', '解冻用户', '6012025', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('206', '发布活动', '6012026', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('207', '导出活动列表', '6012027', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('208', '修改活动信息', '6012028', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('209', '活动报名', '6012029', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('210', '取消报名', '6012030', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('211', '报名审核通过', '6012031', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('800', '活动标签', '8001', '1', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('801', '创业', '8001001', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('802', '公益', '8001002', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('803', '亲子', '8001003', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('804', '科技', '8001004', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('805', '运动', '8001005', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('806', '互联网', '8001006', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('807', '音乐', '8001007', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('808', '交友', '8001008', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('809', '教育', '8001009', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('810', '校园', '8001010', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('811', '电影', '8001011', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('812', 'IT', '8001012', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('813', '健康', '8001013', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('814', '职场', '8001014', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('815', '文艺', '8001015', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('816', '户外', '8001016', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('817', '心理', '8001017', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('818', '金融', '8001018', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('819', '手工', '8001019', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('820', '营销', '8001020', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('821', '旅行', '8001021', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('822', '读书', '8001022', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('823', '电商', '8001023', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('824', '时尚', '8001024', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('825', '设计', '8001025', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('826', '游戏', '8001026', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('827', '用户状态', '8002', '1', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('828', '正常', '8002001', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('829', '异常', '8002002', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('830', '冻结', '8002003', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('831', '用户分类', '8003', '1', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('832', '孵化器管理员', '8003001', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('833', '企业用户', '8003002', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('834', '系统维护员', '8003003', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('835', '会议室配套', '8004', '1', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('836', '桌椅', '8004001', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('837', '投影设备', '8004002', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('838', '移动白板', '8004003', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('839', '电视机', '8004004', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('840', '音响设备', '8004005', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('841', '其他', '8004006', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('842', '提交审核状态', '8005', '1', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('843', '已取消', '8005000', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('844', '已提交', '8005001', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('845', '通过', '8005002', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('846', '拒绝', '8005003', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('847', '报名审核拒绝', '6012032', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('848', '新增会议室', '6012033', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('849', '收藏会议室', '6012034', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('850', '会议室预定', '6012035', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('851', '会议室审核通过', '6012036', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('852', '会议室审核拒绝', '6012037', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('853', '导出会议室申请记录', '6012038', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('854', '编辑会议室信息', '6012039', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('855', '招商客户状态变化', '6012040', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('856', '入驻客户状态变化', '6012041', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('858', '客户数据来源', '6023', '1', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('859', '新建客户', '6023001', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('860', '批量导入', '6023002', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('861', '其他招商客户来源', '6023003', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('862', '发起入驻', '6023004', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('863', '数据导入', '6023005', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('864', '其他客户来源', '6023006', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('865', '活动总结', '6012042', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('866', '分配客户给对接人', '6012043', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('867', '用户绑定公众号', '6012044', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('868', '新增角色', '6012057', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('869', '编辑角色信息', '6012058', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('870', '删除角色', '6012059', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('871', '消息状态', '6024', '1', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('872', '未发送', '6024001', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('873', '发送失败', '6024002', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('874', '发送成功', '6024003', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('875', '已读', '6024004', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('876', '了解渠道', '6025', '1', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('877', '朋友介绍', '6025001', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('878', '报刊杂志', '6025002', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('879', '新闻网站', '6025003', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('880', '销售推介', '6025004', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('883', '孵化器状态', '6026', '1', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('884', '未认领', '6026003', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('885', '审核中', '6026006', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('886', '试用', '6026009', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('887', '正式', '6026012', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('888', '已退出', '6026015', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('889', '申请试用中', '6018004', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('890', '申请试用审核中', '6018005', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('891', '新增用户', '6012060', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('892', '编辑用户', '6012061', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('893', '活动申请消息', '6012045', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('894', '会议室申请消息', '6012046', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('895', '活动申请消息', '6012047', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('896', '预约参观申请消息', '6012048', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('897', '注册申请消息', '6012049', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('898', '活动申请审核结果消息', '6012050', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('899', '会议室申请审核结果消息', '6012051', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('900', '注册通过消息', '6012052', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('901', '续约成功消息', '6012054', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('902', '毕业成功消息', '6012055', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('903', '到期提醒消息', '6012056', '2', '0', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('904', '系统维护员', '6019004', '2', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for ibt_sys_file
-- ----------------------------
DROP TABLE IF EXISTS `ibt_sys_file`;
CREATE TABLE `ibt_sys_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileName` varchar(512) DEFAULT NULL COMMENT '文件名称',
  `saveName` varchar(512) DEFAULT NULL COMMENT '保存名称',
  `exts` varchar(50) DEFAULT NULL COMMENT '文件类型',
  `uploadUserId` int(11) DEFAULT '0' COMMENT '上传用户ID',
  `uploadTime` varchar(50) DEFAULT NULL COMMENT '上传时间',
  `isDelete` int(2) DEFAULT '0',
  `iqbtId` int(3) DEFAULT '0' COMMENT '孵化器ID',
  `savePath` varchar(512) DEFAULT NULL,
  `size` char(20) DEFAULT '' COMMENT '大小',
  PRIMARY KEY (`id`),
  KEY `file_isdelete` (`isDelete`)
) ENGINE=InnoDB AUTO_INCREMENT=435 DEFAULT CHARSET=utf8 COMMENT='上传文件记录表';

-- ----------------------------
-- Records of ibt_sys_file
-- ----------------------------
INSERT INTO `ibt_sys_file` VALUES ('1', '房间导入.xlsx', '2-1521171075-72481-0.xlsx', 'xlsx', '2', '2018-03-16 11:31', '0', '0', '/mould/1.xlsx', '0.0099897384643555');
INSERT INTO `ibt_sys_file` VALUES ('2', 'Wps模板.xlsx', '2-1522380289-18985-0.xlsx', 'xlsx', '2', '2018-03-30 11:24', '0', '0', '/files//xlsData\\/2-1522380289-18985-0.xlsx', '0.0086584091186523');
INSERT INTO `ibt_sys_file` VALUES ('3', '入驻客户.xlsx', '2-1521168905-78868-0.xlsx', 'xlsx', '2', '2018-03-16 10:55', '0', '0', '/files//xlsData//2-1521168905-78868-0.xlsx', '0.0098915100097656');
INSERT INTO `ibt_sys_file` VALUES ('4', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1521105971.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('5', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1521105978.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('6', 'u=588644352,3347655268&fm=27&gp=0.jpg', '1-1521106019-45621-0.jpg', 'jpg', '1', '2018-03-15 17:26', '0', '0', '/files//notice//1-1521106019-45621-0.jpg', '0.031237602233887');
INSERT INTO `ibt_sys_file` VALUES ('7', 'u_3283709014,1979275479_fm_27_gp_0.jpg', '1-1521106039-48804-0.jpg', 'jpg', '1', '2018-03-15 17:27', '0', '0', '/files/default//1-1521106039-48804-0.jpg', '0.012147903442383');
INSERT INTO `ibt_sys_file` VALUES ('8', 'u=337207630,3051931999&fm=27&gp=0.jpg', '1-1521106061-11333-0.jpg', 'jpg', '1', '2018-03-15 17:27', '0', '0', '/files/buildpic//1-1521106061-11333-0.jpg', '0.047836303710938');
INSERT INTO `ibt_sys_file` VALUES ('9', '招商客户.xlsx', '2-1521106122-48423-0.xlsx', 'xlsx', '2', '2018-03-15 17:28', '0', '0', '/files//xlsData//2-1521106122-48423-0.xlsx', '0.010654449462891');
INSERT INTO `ibt_sys_file` VALUES ('10', 'c3479bb2f6bd139e871ca4739c093ca8.jpg', '2-1521106282-37070-0.jpg', 'jpg', '2', '2018-03-15 17:31', '0', '0', '/files/buildpic//2-1521106282-37070-0.jpg', '0.19394874572754');
INSERT INTO `ibt_sys_file` VALUES ('11', '小bp.pptx', '2-1521106397-50750-0.pptx', 'pptx', '2', '2018-03-15 17:33', '0', '0', '/files/default//2-1521106397-50750-0.pptx', '0.053146362304688');
INSERT INTO `ibt_sys_file` VALUES ('12', '3-1P30GFH5.jpg', '2-1521161585-92765-0.jpg', 'jpg', '2', '2018-03-16 08:53', '0', '0', '/files/buildpic//2-1521161585-92765-0.jpg', '0.1338415145874');
INSERT INTO `ibt_sys_file` VALUES ('13', 'logo.png', '1-1521163862-52466-0.png', 'png', '1', '2018-03-16 09:31', '0', '0', '/files/default//1-1521163862-52466-0.png', '0.007288932800293');
INSERT INTO `ibt_sys_file` VALUES ('14', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1521163886.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('15', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1521163918.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('16', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1521163920.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('17', 'timg.jpg', '1-1521164279-11859-0.jpg', 'jpg', '1', '2018-03-16 09:37', '0', '0', '/files/default//1-1521164279-11859-0.jpg', '0.059253692626953');
INSERT INTO `ibt_sys_file` VALUES ('18', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1521164372.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('19', 'timg.jpg', '1-1521164383-2076-0.jpg', 'jpg', '1', '2018-03-16 09:39', '0', '0', '/files/default//1-1521164383-2076-0.jpg', '0.059253692626953');
INSERT INTO `ibt_sys_file` VALUES ('20', '1521166598_1_.png', '1-1521166611-64293-0.png', 'png', '1', '2018-03-16 10:16', '0', '0', '/files/default//1-1521166611-64293-0.png', '0.0019044876098633');
INSERT INTO `ibt_sys_file` VALUES ('21', 'timg _1_.jpg', '1-1521166652-22108-0.jpg', 'jpg', '1', '2018-03-16 10:17', '0', '0', '/files/default//1-1521166652-22108-0.jpg', '0.89047241210938');
INSERT INTO `ibt_sys_file` VALUES ('22', '招商客户.xlsx', '2-1521168699-36628-0.xlsx', 'xlsx', '2', '2018-03-16 10:51', '0', '0', '/files//xlsData//2-1521168699-36628-0.xlsx', '0.010171890258789');
INSERT INTO `ibt_sys_file` VALUES ('23', '入驻客户.xlsx', '2-1521168905-78868-0.xlsx', 'xlsx', '2', '2018-03-16 10:55', '0', '0', '/files//xlsData//2-1521168905-78868-0.xlsx', '0.0098915100097656');
INSERT INTO `ibt_sys_file` VALUES ('24', '房间导入.xlsx', '2-1521169390-68115-0.xlsx', 'xlsx', '2', '2018-03-16 11:03', '0', '0', '/files//xlsData//2-1521169390-68115-0.xlsx', '0.010273933410645');
INSERT INTO `ibt_sys_file` VALUES ('25', '招商客户 (1).xlsx', '2-1521169401-24629-0.xlsx', 'xlsx', '2', '2018-03-16 11:03', '0', '0', '/files//xlsData//2-1521169401-24629-0.xlsx', '0.010110855102539');
INSERT INTO `ibt_sys_file` VALUES ('26', '招商客户.xlsx', '2-1521169406-32418-0.xlsx', 'xlsx', '2', '2018-03-16 11:03', '0', '0', '/files//xlsData//2-1521169406-32418-0.xlsx', '0.010171890258789');
INSERT INTO `ibt_sys_file` VALUES ('27', '房间导入.xlsx', '2-1521169490-19804-0.xlsx', 'xlsx', '2', '2018-03-16 11:04', '0', '0', '/files//xlsData//2-1521169490-19804-0.xlsx', '0.010154724121094');
INSERT INTO `ibt_sys_file` VALUES ('28', '房间导入.xlsx', '2-1521169529-19087-0.xlsx', 'xlsx', '2', '2018-03-16 11:05', '0', '0', '/files//xlsData//2-1521169529-19087-0.xlsx', '0.010154724121094');
INSERT INTO `ibt_sys_file` VALUES ('29', 'poster.jpg', '5-1521169652-45291-0.jpg', 'jpg', '5', '2018-03-16 11:07', '0', '0', '/files/buildpic//5-1521169652-45291-0.jpg', '0.16673278808594');
INSERT INTO `ibt_sys_file` VALUES ('30', '房间导入 (3).xlsx', '2-1521169659-8021-0.xlsx', 'xlsx', '2', '2018-03-16 11:07', '0', '0', '/files//xlsData//2-1521169659-8021-0.xlsx', '0.010163307189941');
INSERT INTO `ibt_sys_file` VALUES ('31', '房间导入 (4).xlsx', '2-1521169690-46137-0.xlsx', 'xlsx', '2', '2018-03-16 11:08', '0', '0', '/files//xlsData//2-1521169690-46137-0.xlsx', '0.010154724121094');
INSERT INTO `ibt_sys_file` VALUES ('32', '房间导入.xlsx', '2-1521171075-72481-0.xlsx', 'xlsx', '2', '2018-03-16 11:31', '0', '0', '/files//xlsData//2-1521171075-72481-0.xlsx', '0.0099897384643555');
INSERT INTO `ibt_sys_file` VALUES ('33', '房间导入 (5).xlsx', '2-1521171128-59185-0.xlsx', 'xlsx', '2', '2018-03-16 11:32', '0', '0', '/files//xlsData//2-1521171128-59185-0.xlsx', '0.0099897384643555');
INSERT INTO `ibt_sys_file` VALUES ('34', '3-1P30GFH5.jpg', '2-1521171482-40827-0.jpg', 'jpg', '2', '2018-03-16 11:38', '0', '0', '/files/buildpic//2-1521171482-40827-0.jpg', '0.1338415145874');
INSERT INTO `ibt_sys_file` VALUES ('35', '3-1P30GFH5.jpg', '2-1521171484-45411-0.jpg', 'jpg', '2', '2018-03-16 11:38', '0', '0', '/files/buildpic//2-1521171484-45411-0.jpg', '0.1338415145874');
INSERT INTO `ibt_sys_file` VALUES ('36', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1521171487.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('37', '772-1513841357-13039-0.jpg', '1-1521172632-70302-0.jpg', 'jpg', '1', '2018-03-16 11:57', '0', '0', '/files/buildpic//1-1521172632-70302-0.jpg', '0.040027618408203');
INSERT INTO `ibt_sys_file` VALUES ('38', 'logo.png', '1-1521172638-89615-0.png', 'png', '1', '2018-03-16 11:57', '0', '0', '/files/buildpic//1-1521172638-89615-0.png', '0.015220642089844');
INSERT INTO `ibt_sys_file` VALUES ('39', '房间导入 (7).xlsx', '2-1521176952-57569-0.xlsx', 'xlsx', '2', '2018-03-16 13:09', '0', '0', '/files//xlsData//2-1521176952-57569-0.xlsx', '0.0099897384643555');
INSERT INTO `ibt_sys_file` VALUES ('40', '房间导入 (8).xlsx', '-1521179176-37338-0.xlsx', 'xlsx', null, '2018-03-16 13:46', '0', '0', '/files//xlsData//-1521179176-37338-0.xlsx', '0.010148048400879');
INSERT INTO `ibt_sys_file` VALUES ('41', '关于开展全市深化人才发展体制机制改革调研工作的通知 _1_.pdf', '8-1521179885-17334-0.pdf', 'pdf', '8', '2018-03-16 13:58', '0', '0', '/files/default//8-1521179885-17334-0.pdf', '1.1238040924072');
INSERT INTO `ibt_sys_file` VALUES ('42', 'timg.jpg', '8-1521180366-98220-0.jpg', 'jpg', '8', '2018-03-16 14:06', '0', '0', '/files/default//8-1521180366-98220-0.jpg', '0.026702880859375');
INSERT INTO `ibt_sys_file` VALUES ('43', '金竹草商业计划书_大赛 .ppt', '8-1521180665-55731-0.ppt', 'ppt', '8', '2018-03-16 14:11', '0', '0', '/files/default//8-1521180665-55731-0.ppt', '5.3134508132935');
INSERT INTO `ibt_sys_file` VALUES ('44', '金竹草商业计划书_大赛 .ppt', '8-1521180805-19822-0.ppt', 'ppt', '8', '2018-03-16 14:13', '0', '0', '/files/default//8-1521180805-19822-0.ppt', '5.3134508132935');
INSERT INTO `ibt_sys_file` VALUES ('45', 'A栋入驻企业分布图1.2.jpg', '8-1521180976-70457-0.jpg', 'jpg', '8', '2018-03-16 14:16', '0', '0', '/files/buildpic//8-1521180976-70457-0.jpg', '0.37708187103271');
INSERT INTO `ibt_sys_file` VALUES ('46', 'WeChat Image_20171212093111.png', '8-1521181013-52483-0.png', 'png', '8', '2018-03-16 14:16', '0', '0', '/files/buildpic//8-1521181013-52483-0.png', '0.43906688690186');
INSERT INTO `ibt_sys_file` VALUES ('47', 'WeChat Image_20171212093111.png', '8-1521181013-94100-0.png', 'png', '8', '2018-03-16 14:16', '0', '0', '/files/buildpic//8-1521181013-94100-0.png', '0.43906688690186');
INSERT INTO `ibt_sys_file` VALUES ('48', '效果图１.jpg', '8-1521181030-26653-0.jpg', 'jpg', '8', '2018-03-16 14:17', '0', '0', '/files/buildpic//8-1521181030-26653-0.jpg', '0.23476314544678');
INSERT INTO `ibt_sys_file` VALUES ('49', '房间导入 (8).xlsx', '-1521181071-80728-0.xlsx', 'xlsx', null, '2018-03-16 14:17', '0', '0', '/files//xlsData//-1521181071-80728-0.xlsx', '0.010149955749512');
INSERT INTO `ibt_sys_file` VALUES ('50', '房间导入 (8).xlsx', '2-1521181121-73330-0.xlsx', 'xlsx', '2', '2018-03-16 14:18', '0', '0', '/files//xlsData//2-1521181121-73330-0.xlsx', '0.010149955749512');
INSERT INTO `ibt_sys_file` VALUES ('51', '效果图１.jpg', '8-1521181131-84567-0.jpg', 'jpg', '8', '2018-03-16 14:18', '0', '0', '/files/buildpic//8-1521181131-84567-0.jpg', '0.23476314544678');
INSERT INTO `ibt_sys_file` VALUES ('52', '房间导入 (8).xlsx', '2-1521181276-39701-0.xlsx', 'xlsx', '2', '2018-03-16 14:21', '0', '0', '/files//xlsData//2-1521181276-39701-0.xlsx', '0.010149955749512');
INSERT INTO `ibt_sys_file` VALUES ('53', 'C栋入驻企业分布图1.2.jpg', '8-1521181342-24349-0.jpg', 'jpg', '8', '2018-03-16 14:22', '0', '0', '/files/default//8-1521181342-24349-0.jpg', '0.2804126739502');
INSERT INTO `ibt_sys_file` VALUES ('54', 'Lighthouse.jpg', '2-1521181424-82517-0.jpg', 'jpg', '2', '2018-03-16 14:23', '0', '0', '/files/default//2-1521181424-82517-0.jpg', '0.53527450561523');
INSERT INTO `ibt_sys_file` VALUES ('55', '房间导入 (8).xlsx', '2-1521181474-58379-0.xlsx', 'xlsx', '2', '2018-03-16 14:24', '0', '0', '/files//xlsData//2-1521181474-58379-0.xlsx', '0.010149955749512');
INSERT INTO `ibt_sys_file` VALUES ('56', 'B1栋入驻企业分布图4.jpg', '8-1521181478-19609-0.jpg', 'jpg', '8', '2018-03-16 14:24', '0', '0', '/files/default//8-1521181478-19609-0.jpg', '0.31013870239258');
INSERT INTO `ibt_sys_file` VALUES ('57', '房间导入 (8).xlsx', '2-1521181518-93274-0.xlsx', 'xlsx', '2', '2018-03-16 14:25', '0', '0', '/files//xlsData//2-1521181518-93274-0.xlsx', '0.010149955749512');
INSERT INTO `ibt_sys_file` VALUES ('58', 'LOGO小.png', '8-1521181828-58199-0.png', 'png', '8', '2018-03-16 14:30', '0', '0', '/files/buildpic//8-1521181828-58199-0.png', '0.058615684509277');
INSERT INTO `ibt_sys_file` VALUES ('59', 'C栋入驻企业分布图3.4.jpg', '8-1521181993-6351-0.jpg', 'jpg', '8', '2018-03-16 14:33', '0', '0', '/files/default//8-1521181993-6351-0.jpg', '0.27477264404297');
INSERT INTO `ibt_sys_file` VALUES ('60', 'B1栋入驻企业分布图6.jpg', '8-1521182161-68793-0.jpg', 'jpg', '8', '2018-03-16 14:36', '0', '0', '/files/default//8-1521182161-68793-0.jpg', '0.29369735717773');
INSERT INTO `ibt_sys_file` VALUES ('61', '房间导入 (9).xlsx', '2-1521182298-83273-0.xlsx', 'xlsx', '2', '2018-03-16 14:38', '0', '0', '/files//xlsData//2-1521182298-83273-0.xlsx', '0.010127067565918');
INSERT INTO `ibt_sys_file` VALUES ('62', '房间导入 (9).xlsx', '2-1521182443-50631-0.xlsx', 'xlsx', '2', '2018-03-16 14:40', '0', '0', '/files//xlsData//2-1521182443-50631-0.xlsx', '0.010127067565918');
INSERT INTO `ibt_sys_file` VALUES ('63', '房间导入 (9).xlsx', '2-1521182462-45480-0.xlsx', 'xlsx', '2', '2018-03-16 14:41', '0', '0', '/files//xlsData//2-1521182462-45480-0.xlsx', '0.010127067565918');
INSERT INTO `ibt_sys_file` VALUES ('64', 'D栋入驻企业分布图3.4.jpg', '8-1521183340-33646-0.jpg', 'jpg', '8', '2018-03-16 14:55', '0', '0', '/files/default//8-1521183340-33646-0.jpg', '0.24321365356445');
INSERT INTO `ibt_sys_file` VALUES ('65', 'D栋入驻企业分布图5.6.jpg', '8-1521183418-14029-0.jpg', 'jpg', '8', '2018-03-16 14:56', '0', '0', '/files/default//8-1521183418-14029-0.jpg', '0.2347526550293');
INSERT INTO `ibt_sys_file` VALUES ('66', '房间导入 (9).xlsx', '2-1521184790-5146-0.xlsx', 'xlsx', '2', '2018-03-16 15:19', '0', '0', '/files//xlsData//2-1521184790-5146-0.xlsx', '0.010127067565918');
INSERT INTO `ibt_sys_file` VALUES ('67', '房间导入1.xlsx', '2-1521191988-41901-0.xlsx', 'xlsx', '2', '2018-03-16 17:19', '0', '0', '/files//xlsData//2-1521191988-41901-0.xlsx', '0.011185646057129');
INSERT INTO `ibt_sys_file` VALUES ('68', '房间导入1.xlsx', '2-1521192058-90943-0.xlsx', 'xlsx', '2', '2018-03-16 17:20', '0', '0', '/files//xlsData//2-1521192058-90943-0.xlsx', '0.01117992401123');
INSERT INTO `ibt_sys_file` VALUES ('69', '房间导入1.xlsx', '2-1521192136-9893-0.xlsx', 'xlsx', '2', '2018-03-16 17:22', '0', '0', '/files//xlsData//2-1521192136-9893-0.xlsx', '0.010354042053223');
INSERT INTO `ibt_sys_file` VALUES ('70', '房间导入1.xlsx', '2-1521192194-48926-0.xlsx', 'xlsx', '2', '2018-03-16 17:23', '0', '0', '/files//xlsData//2-1521192194-48926-0.xlsx', '0.010353088378906');
INSERT INTO `ibt_sys_file` VALUES ('71', '房间导入1.xlsx', '2-1521192225-15891-0.xlsx', 'xlsx', '2', '2018-03-16 17:23', '0', '0', '/files//xlsData//2-1521192225-15891-0.xlsx', '0.010296821594238');
INSERT INTO `ibt_sys_file` VALUES ('72', '房间导入1.xlsx', '2-1521192297-89853-0.xlsx', 'xlsx', '2', '2018-03-16 17:24', '0', '0', '/files//xlsData//2-1521192297-89853-0.xlsx', '0.010322570800781');
INSERT INTO `ibt_sys_file` VALUES ('73', '房间导入1.xlsx', '2-1521192326-66329-0.xlsx', 'xlsx', '2', '2018-03-16 17:25', '0', '0', '/files//xlsData//2-1521192326-66329-0.xlsx', '0.010319709777832');
INSERT INTO `ibt_sys_file` VALUES ('74', '房间导入1.xlsx', '2-1521192402-98440-0.xlsx', 'xlsx', '2', '2018-03-16 17:26', '0', '0', '/files//xlsData//2-1521192402-98440-0.xlsx', '0.010319709777832');
INSERT INTO `ibt_sys_file` VALUES ('75', '8.jpg', '2-1521420848-85719-0.jpg', 'jpg', '2', '2018-03-19 08:54', '0', '0', '/files/buildpic//2-1521420848-85719-0.jpg', '0.083102226257324');
INSERT INTO `ibt_sys_file` VALUES ('76', 'image.png', '2-1521422413-22978-0.png', 'png', '2', '2018-03-19 09:20', '0', '0', '/files//notice//2-1521422413-22978-0.png', '0.13790988922119');
INSERT INTO `ibt_sys_file` VALUES ('77', 'TIM截图20180103154020.png', '2-1521422881-48678-0.png', 'png', '2', '2018-03-19 09:28', '0', '0', '/files/buildpic//2-1521422881-48678-0.png', '0.15880012512207');
INSERT INTO `ibt_sys_file` VALUES ('78', 'TIM截图20180103154020.png', '1-1521422912-46889-0.png', 'png', '1', '2018-03-19 09:28', '0', '0', '/files/buildpic//1-1521422912-46889-0.png', '0.15880012512207');
INSERT INTO `ibt_sys_file` VALUES ('79', '慧云孵化园区解决方案（单园区）.pdf', '2-1521423691-16547-0.pdf', 'pdf', '2', '2018-03-19 09:41', '0', '0', '/files/default//2-1521423691-16547-0.pdf', '2.2744693756104');
INSERT INTO `ibt_sys_file` VALUES ('80', '慧云孵化园区解决方案（单园区）.pdf', '2-1521424301-90884-0.pdf', 'pdf', '2', '2018-03-19 09:51', '0', '0', '/files/default//2-1521424301-90884-0.pdf', '2.2744693756104');
INSERT INTO `ibt_sys_file` VALUES ('81', 'timg.jpg', '2-1521424730-29235-0.jpg', 'jpg', '2', '2018-03-19 09:58', '0', '0', '/files/buildpic//2-1521424730-29235-0.jpg', '0.14095783233643');
INSERT INTO `ibt_sys_file` VALUES ('82', 'timg.jpg', '2-1521424834-13272-0.jpg', 'jpg', '2', '2018-03-19 10:00', '0', '0', '/files/buildpic//2-1521424834-13272-0.jpg', '0.14095783233643');
INSERT INTO `ibt_sys_file` VALUES ('83', 'u=2749268660,4042561407&fm=27&gp=0.jpg', '2-1521424838-56175-0.jpg', 'jpg', '2', '2018-03-19 10:00', '0', '0', '/files/buildpic//2-1521424838-56175-0.jpg', '0.022774696350098');
INSERT INTO `ibt_sys_file` VALUES ('84', 'timg.jpg', '2-1521424842-70695-0.jpg', 'jpg', '2', '2018-03-19 10:00', '0', '0', '/files/buildpic//2-1521424842-70695-0.jpg', '0.14095783233643');
INSERT INTO `ibt_sys_file` VALUES ('85', 'timg.jpg', '2-1521424907-8704-0.jpg', 'jpg', '2', '2018-03-19 10:01', '0', '0', '/files/buildpic//2-1521424907-8704-0.jpg', '0.14095783233643');
INSERT INTO `ibt_sys_file` VALUES ('86', 'timg.jpg', '2-1521424931-55138-0.jpg', 'jpg', '2', '2018-03-19 10:02', '0', '0', '/files/buildpic//2-1521424931-55138-0.jpg', '0.14095783233643');
INSERT INTO `ibt_sys_file` VALUES ('87', 'timg.jpg', '2-1521424937-16489-0.jpg', 'jpg', '2', '2018-03-19 10:02', '0', '0', '/files/buildpic//2-1521424937-16489-0.jpg', '0.14095783233643');
INSERT INTO `ibt_sys_file` VALUES ('88', 'timg.jpg', '2-1521424943-12837-0.jpg', 'jpg', '2', '2018-03-19 10:02', '0', '0', '/files/buildpic//2-1521424943-12837-0.jpg', '0.14095783233643');
INSERT INTO `ibt_sys_file` VALUES ('89', '小bp.pptx', '2-1521426128-47427-0.pptx', 'pptx', '2', '2018-03-19 10:22', '0', '0', '/files/default//2-1521426128-47427-0.pptx', '0.053146362304688');
INSERT INTO `ibt_sys_file` VALUES ('90', '慧云孵化园区解决方案（单园区）.pdf', '2-1521426863-16574-0.pdf', 'pdf', '2', '2018-03-19 10:34', '0', '0', '/files/default//2-1521426863-16574-0.pdf', '2.2744693756104');
INSERT INTO `ibt_sys_file` VALUES ('91', '21_1515383931_46085_0.jpg', '2-1521426872-6580-0.jpg', 'jpg', '2', '2018-03-19 10:34', '0', '0', '/files/default//2-1521426872-6580-0.jpg', '0.043353080749512');
INSERT INTO `ibt_sys_file` VALUES ('92', 'u=337207630,3051931999&fm=27&gp=0.jpg', '2-1521427540-65953-0.jpg', 'jpg', '2', '2018-03-19 10:45', '0', '0', '/files/buildpic//2-1521427540-65953-0.jpg', '0.047836303710938');
INSERT INTO `ibt_sys_file` VALUES ('93', '772-1513841357-13039-0.jpg', '2-1521427567-79327-0.jpg', 'jpg', '2', '2018-03-19 10:46', '0', '0', '/files/buildpic//2-1521427567-79327-0.jpg', '0.040027618408203');
INSERT INTO `ibt_sys_file` VALUES ('94', '3-1P30GFH5.jpg', '2-1521427573-12373-0.jpg', 'jpg', '2', '2018-03-19 10:46', '0', '0', '/files/buildpic//2-1521427573-12373-0.jpg', '0.1338415145874');
INSERT INTO `ibt_sys_file` VALUES ('95', '-1515551806-20362-0.jpg', '2-1521427609-49363-0.jpg', 'jpg', '2', '2018-03-19 10:46', '0', '0', '/files/buildpic//2-1521427609-49363-0.jpg', '0.015449523925781');
INSERT INTO `ibt_sys_file` VALUES ('96', '3-1P30GFH5.jpg', '2-1521427622-5191-0.jpg', 'jpg', '2', '2018-03-19 10:47', '0', '0', '/files/buildpic//2-1521427622-5191-0.jpg', '0.1338415145874');
INSERT INTO `ibt_sys_file` VALUES ('97', '21-1515383931-46085-0.jpg', '2-1521427754-71709-0.jpg', 'jpg', '2', '2018-03-19 10:49', '0', '0', '/files/buildpic//2-1521427754-71709-0.jpg', '0.043353080749512');
INSERT INTO `ibt_sys_file` VALUES ('98', '21.jpg', '2-1521427779-58181-0.jpg', 'jpg', '2', '2018-03-19 10:49', '0', '0', '/files/buildpic//2-1521427779-58181-0.jpg', '0.049197196960449');
INSERT INTO `ibt_sys_file` VALUES ('99', '-1516067013-17508-0.png', '2-1521427805-3788-0.png', 'png', '2', '2018-03-19 10:50', '0', '0', '/files/buildpic//2-1521427805-3788-0.png', '0.11903476715088');
INSERT INTO `ibt_sys_file` VALUES ('100', '-1516067013-17508-0.png', '2-1521427823-87742-0.png', 'png', '2', '2018-03-19 10:50', '0', '0', '/files/buildpic//2-1521427823-87742-0.png', '0.11903476715088');
INSERT INTO `ibt_sys_file` VALUES ('101', '772-1513841357-13039-0.jpg', '2-1521427868-19668-0.jpg', 'jpg', '2', '2018-03-19 10:51', '0', '0', '/files/buildpic//2-1521427868-19668-0.jpg', '0.040027618408203');
INSERT INTO `ibt_sys_file` VALUES ('102', 'c3479bb2f6bd139e871ca4739c093ca8.jpg', '2-1521427893-92396-0.jpg', 'jpg', '2', '2018-03-19 10:51', '0', '0', '/files/buildpic//2-1521427893-92396-0.jpg', '0.19394874572754');
INSERT INTO `ibt_sys_file` VALUES ('103', '21-1515383931-46085-0.jpg', '2-1521427961-90810-0.jpg', 'jpg', '2', '2018-03-19 10:52', '0', '0', '/files/buildpic//2-1521427961-90810-0.jpg', '0.043353080749512');
INSERT INTO `ibt_sys_file` VALUES ('104', '20.jpg', '1-1521428055-71441-0.jpg', 'jpg', '1', '2018-03-19 10:54', '0', '0', '/files/buildpic//1-1521428055-71441-0.jpg', '0.044642448425293');
INSERT INTO `ibt_sys_file` VALUES ('105', '9.jpg', '1-1521428063-8820-0.jpg', 'jpg', '1', '2018-03-19 10:54', '0', '0', '/files/buildpic//1-1521428063-8820-0.jpg', '0.031193733215332');
INSERT INTO `ibt_sys_file` VALUES ('106', '_1516067013_17508_0.png', '3-1521447399-42756-0.png', 'png', '3', '2018-03-19 16:16', '0', '0', '/files/default//3-1521447399-42756-0.png', '0.11903476715088');
INSERT INTO `ibt_sys_file` VALUES ('107', 'logo.png', '5-1521512008-25170-0.png', 'png', '5', '2018-03-20 10:13', '0', '0', '/files/buildpic//5-1521512008-25170-0.png', '0.007288932800293');
INSERT INTO `ibt_sys_file` VALUES ('108', 'lockscreen.jpg', '5-1521512033-18232-0.jpg', 'jpg', '5', '2018-03-20 10:13', '0', '0', '/files/buildpic//5-1521512033-18232-0.jpg', '0.16961097717285');
INSERT INTO `ibt_sys_file` VALUES ('109', '招商客户.xlsx', '2-1521524314-77981-0.xlsx', 'xlsx', '2', '2018-03-20 13:38', '0', '0', '/files//xlsData//2-1521524314-77981-0.xlsx', '0.0098562240600586');
INSERT INTO `ibt_sys_file` VALUES ('110', '沙发2.jpg', '18-1521524774-36625-0.jpg', 'jpg', '18', '2018-03-20 13:46', '0', '0', '/files/default//18-1521524774-36625-0.jpg', '0.10723209381104');
INSERT INTO `ibt_sys_file` VALUES ('111', '入驻客户.xlsx', '2-1521526060-7231-0.xlsx', 'xlsx', '2', '2018-03-20 14:07', '0', '0', '/files//xlsData//2-1521526060-7231-0.xlsx', '0.0095434188842773');
INSERT INTO `ibt_sys_file` VALUES ('112', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1521526166.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('113', '入驻客户.xlsx', '2-1521526568-39039-0.xlsx', 'xlsx', '2', '2018-03-20 14:16', '0', '0', '/files//xlsData//2-1521526568-39039-0.xlsx', '0.0095434188842773');
INSERT INTO `ibt_sys_file` VALUES ('114', '入驻客户.xlsx', '2-1521526660-46994-0.xlsx', 'xlsx', '2', '2018-03-20 14:17', '0', '0', '/files//xlsData//2-1521526660-46994-0.xlsx', '0.0095338821411133');
INSERT INTO `ibt_sys_file` VALUES ('115', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1521526760.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('116', '入驻客户.xlsx', '2-1521526767-57657-0.xlsx', 'xlsx', '2', '2018-03-20 14:19', '0', '0', '/files//xlsData//2-1521526767-57657-0.xlsx', '0.0095376968383789');
INSERT INTO `ibt_sys_file` VALUES ('117', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1521526780.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('118', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1521527380.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('119', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1521527661.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('120', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1521527801.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('121', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1521527849.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('122', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1521527857.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('123', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1521527865.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('124', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1521527901.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('125', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1521528933.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('126', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1521528989.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('127', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1521528996.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('128', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1521529029.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('129', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1521529641.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('130', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1521529663.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('131', '入驻客户.xlsx', '2-1521530479-78914-0.xlsx', 'xlsx', '2', '2018-03-20 15:21', '0', '0', '/files//xlsData//2-1521530479-78914-0.xlsx', '0.0095386505126953');
INSERT INTO `ibt_sys_file` VALUES ('132', '房间导入.xlsx', '2-1521532249-97316-0.xlsx', 'xlsx', '2', '2018-03-20 15:50', '0', '0', '/files//xlsData//2-1521532249-97316-0.xlsx', '0.0099115371704102');
INSERT INTO `ibt_sys_file` VALUES ('133', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1521533657.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('134', '房间导入.xlsx', '2-1521534046-6228-0.xlsx', 'xlsx', '2', '2018-03-20 16:20', '0', '0', '/files//xlsData//2-1521534046-6228-0.xlsx', '0.0099248886108398');
INSERT INTO `ibt_sys_file` VALUES ('135', '房间导入.xlsx', '2-1521534242-66172-0.xlsx', 'xlsx', '2', '2018-03-20 16:24', '0', '0', '/files//xlsData//2-1521534242-66172-0.xlsx', '0.0099058151245117');
INSERT INTO `ibt_sys_file` VALUES ('136', '房间导入.xlsx', '2-1521534858-512-0.xlsx', 'xlsx', '2', '2018-03-20 16:34', '0', '0', '/files//xlsData//2-1521534858-512-0.xlsx', '0.010523796081543');
INSERT INTO `ibt_sys_file` VALUES ('137', '房间导入.xlsx', '2-1521534861-62183-0.xlsx', 'xlsx', '2', '2018-03-20 16:34', '0', '0', '/files//xlsData//2-1521534861-62183-0.xlsx', '0.0099058151245117');
INSERT INTO `ibt_sys_file` VALUES ('138', '房间导入.xlsx', '2-1521535198-55187-0.xlsx', 'xlsx', '2', '2018-03-20 16:39', '0', '0', '/files//xlsData//2-1521535198-55187-0.xlsx', '0.0099058151245117');
INSERT INTO `ibt_sys_file` VALUES ('139', '房间导入.xlsx', '2-1521535799-68674-0.xlsx', 'xlsx', '2', '2018-03-20 16:49', '0', '0', '/files//xlsData//2-1521535799-68674-0.xlsx', '0.0099058151245117');
INSERT INTO `ibt_sys_file` VALUES ('140', '房间导入.xlsx', '2-1521535882-59592-0.xlsx', 'xlsx', '2', '2018-03-20 16:51', '0', '0', '/files//xlsData//2-1521535882-59592-0.xlsx', '0.0099058151245117');
INSERT INTO `ibt_sys_file` VALUES ('141', '11.jpg', '2-1521537634-71953-0.jpg', 'jpg', '2', '2018-03-20 17:20', '0', '0', '/files/buildpic//2-1521537634-71953-0.jpg', '0.04365062713623');
INSERT INTO `ibt_sys_file` VALUES ('142', '房间导入.xlsx', '2-1521538011-54431-0.xlsx', 'xlsx', '2', '2018-03-20 17:26', '0', '0', '/files//xlsData//2-1521538011-54431-0.xlsx', '0.0098457336425781');
INSERT INTO `ibt_sys_file` VALUES ('143', '房间导入.xlsx', '2-1521538130-15313-0.xlsx', 'xlsx', '2', '2018-03-20 17:28', '0', '0', '/files//xlsData//2-1521538130-15313-0.xlsx', '0.0098285675048828');
INSERT INTO `ibt_sys_file` VALUES ('144', '房间导入.xlsx', '2-1521538833-5059-0.xlsx', 'xlsx', '2', '2018-03-20 17:40', '0', '0', '/files//xlsData//2-1521538833-5059-0.xlsx', '0.0098285675048828');
INSERT INTO `ibt_sys_file` VALUES ('145', '房间导入.xlsx', '2-1521538976-63801-0.xlsx', 'xlsx', '2', '2018-03-20 17:42', '0', '0', '/files//xlsData//2-1521538976-63801-0.xlsx', '0.0098447799682617');
INSERT INTO `ibt_sys_file` VALUES ('146', '房间导入.xlsx', '2-1521539120-29219-0.xlsx', 'xlsx', '2', '2018-03-20 17:45', '0', '0', '/files//xlsData//2-1521539120-29219-0.xlsx', '0.010524749755859');
INSERT INTO `ibt_sys_file` VALUES ('147', '房间导入.xlsx', '2-1521539163-21043-0.xlsx', 'xlsx', '2', '2018-03-20 17:46', '0', '0', '/files//xlsData//2-1521539163-21043-0.xlsx', '0.010524749755859');
INSERT INTO `ibt_sys_file` VALUES ('148', '房间导入.xlsx', '2-1521539218-46008-0.xlsx', 'xlsx', '2', '2018-03-20 17:46', '0', '0', '/files//xlsData//2-1521539218-46008-0.xlsx', '0.0098447799682617');
INSERT INTO `ibt_sys_file` VALUES ('149', '房间导入.xlsx', '2-1521593139-62547-0.xlsx', 'xlsx', '2', '2018-03-21 08:45', '0', '0', '/files//xlsData//2-1521593139-62547-0.xlsx', '0.0098447799682617');
INSERT INTO `ibt_sys_file` VALUES ('150', '房间导入.xlsx', '2-1521593240-94245-0.xlsx', 'xlsx', '2', '2018-03-21 08:47', '0', '0', '/files//xlsData//2-1521593240-94245-0.xlsx', '0.0098848342895508');
INSERT INTO `ibt_sys_file` VALUES ('151', '房间导入.xlsx', '2-1521593290-98152-0.xlsx', 'xlsx', '2', '2018-03-21 08:48', '0', '0', '/files//xlsData//2-1521593290-98152-0.xlsx', '0.0098848342895508');
INSERT INTO `ibt_sys_file` VALUES ('152', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1521609331.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('153', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1521613991.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('154', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1521614059.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('155', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1521614253.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('156', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1521614279.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('157', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1521614287.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('158', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1521614310.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('159', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1521614317.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('160', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1521614322.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('161', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1521614331.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('162', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1521614342.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('163', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1521614358.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('164', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1521614440.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('165', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1521614453.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('166', '81d4bb1e881648e8a1c5f1841c6e55ae_th.png.jpg', '2-1521682054-63367-0.jpg', 'jpg', '2', '2018-03-22 09:27', '0', '0', '/files/buildpic//2-1521682054-63367-0.jpg', '0.051105499267578');
INSERT INTO `ibt_sys_file` VALUES ('167', '慧云孵化园区解决方案（单园区）.pdf', '2-1521683795-35149-0.pdf', 'pdf', '2', '2018-03-22 09:56', '0', '0', '/files/default//2-1521683795-35149-0.pdf', '2.2744693756104');
INSERT INTO `ibt_sys_file` VALUES ('168', '21_1515383931_46085_0.jpg', '2-1521684356-44245-0.jpg', 'jpg', '2', '2018-03-22 10:05', '0', '0', '/files/default//2-1521684356-44245-0.jpg', '0.043353080749512');
INSERT INTO `ibt_sys_file` VALUES ('169', '慧云孵化园区解决方案（单园区）.pdf', '2-1521684485-78664-0.pdf', 'pdf', '2', '2018-03-22 10:08', '0', '0', '/files/default//2-1521684485-78664-0.pdf', '2.2744693756104');
INSERT INTO `ibt_sys_file` VALUES ('170', '慧云孵化园区解决方案（单园区）.pdf', '2-1521686551-86869-0.pdf', 'pdf', '2', '2018-03-22 10:42', '0', '0', '/files/default//2-1521686551-86869-0.pdf', '2.2744693756104');
INSERT INTO `ibt_sys_file` VALUES ('171', '入驻客户.xlsx', '2-1521689706-84572-0.xlsx', 'xlsx', '2', '2018-03-22 11:35', '0', '0', '/files//xlsData//2-1521689706-84572-0.xlsx', '0.0095386505126953');
INSERT INTO `ibt_sys_file` VALUES ('172', '招商客户.xlsx', '2-1521689884-56152-0.xlsx', 'xlsx', '2', '2018-03-22 11:38', '0', '0', '/files//xlsData//2-1521689884-56152-0.xlsx', '0.0098562240600586');
INSERT INTO `ibt_sys_file` VALUES ('173', '入驻客户.xlsx', '2-1521689895-87616-0.xlsx', 'xlsx', '2', '2018-03-22 11:38', '0', '0', '/files//xlsData//2-1521689895-87616-0.xlsx', '0.009516716003418');
INSERT INTO `ibt_sys_file` VALUES ('174', '慧云孵化器管理软件使用说明书（单园区）.pdf', '2-1521690140-5628-0.pdf', 'pdf', '2', '2018-03-22 11:42', '0', '0', '/files/default//2-1521690140-5628-0.pdf', '1.8380403518677');
INSERT INTO `ibt_sys_file` VALUES ('175', '10.jpg', '2-1521698282-59223-0.jpg', 'jpg', '2', '2018-03-22 13:58', '0', '0', '/files/buildpic//2-1521698282-59223-0.jpg', '0.049860000610352');
INSERT INTO `ibt_sys_file` VALUES ('176', '慧云孵化园区解决方案（单园区）.pdf', '2-1521698741-89942-0.pdf', 'pdf', '2', '2018-03-22 14:05', '0', '0', '/files/default//2-1521698741-89942-0.pdf', '2.2744693756104');
INSERT INTO `ibt_sys_file` VALUES ('177', '慧云孵化园区解决方案（单园区）.pdf', '2-1521698754-71815-0.pdf', 'pdf', '2', '2018-03-22 14:05', '0', '0', '/files/default//2-1521698754-71815-0.pdf', '2.2744693756104');
INSERT INTO `ibt_sys_file` VALUES ('178', '慧云孵化园区解决方案（单园区）.pdf', '2-1521699681-18307-0.pdf', 'pdf', '2', '2018-03-22 14:21', '0', '0', '/files/default//2-1521699681-18307-0.pdf', '2.2744693756104');
INSERT INTO `ibt_sys_file` VALUES ('179', '小bp.pptx', '2-1521705868-19412-0.pptx', 'pptx', '2', '2018-03-22 16:04', '0', '0', '/files/default//2-1521705868-19412-0.pptx', '0.053146362304688');
INSERT INTO `ibt_sys_file` VALUES ('180', '慧云孵化园区解决方案（单园区）.pdf', '2-1521707063-82406-0.pdf', 'pdf', '2', '2018-03-22 16:24', '0', '0', '/files/default//2-1521707063-82406-0.pdf', '2.2744693756104');
INSERT INTO `ibt_sys_file` VALUES ('181', '21-1515383931-46085-0.jpg', '2-1521709572-98877-0.jpg', 'jpg', '2', '2018-03-22 17:06', '0', '0', '/files/buildpic//2-1521709572-98877-0.jpg', '0.043353080749512');
INSERT INTO `ibt_sys_file` VALUES ('182', '20.jpg', '2-1521709621-70744-0.jpg', 'jpg', '2', '2018-03-22 17:07', '0', '0', '/files/buildpic//2-1521709621-70744-0.jpg', '0.044642448425293');
INSERT INTO `ibt_sys_file` VALUES ('183', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1521709800.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('184', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1521709813.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('185', 'Desert.jpg', '27-1521709990-58442-0.jpg', 'jpg', '27', '2018-03-22 17:13', '0', '0', '/files/default//27-1521709990-58442-0.jpg', '0.80675220489502');
INSERT INTO `ibt_sys_file` VALUES ('186', '11.jpg', '2-1521711164-21312-0.jpg', 'jpg', '2', '2018-03-22 17:32', '0', '0', '/files/buildpic//2-1521711164-21312-0.jpg', '0.04365062713623');
INSERT INTO `ibt_sys_file` VALUES ('187', '20.jpg', '2-1521711218-40293-0.jpg', 'jpg', '2', '2018-03-22 17:33', '0', '0', '/files/buildpic//2-1521711218-40293-0.jpg', '0.044642448425293');
INSERT INTO `ibt_sys_file` VALUES ('188', '11.jpg', '2-1521711247-21557-0.jpg', 'jpg', '2', '2018-03-22 17:34', '0', '0', '/files/buildpic//2-1521711247-21557-0.jpg', '0.04365062713623');
INSERT INTO `ibt_sys_file` VALUES ('189', '慧云孵化园区解决方案（单园区）.pdf', '2-1521711694-45600-0.pdf', 'pdf', '2', '2018-03-22 17:41', '0', '0', '/files/default//2-1521711694-45600-0.pdf', '2.2744693756104');
INSERT INTO `ibt_sys_file` VALUES ('190', '21_1515383931_46085_0.jpg', '2-1521768219-17894-0.jpg', 'jpg', '2', '2018-03-23 09:23', '0', '0', '/files/default//2-1521768219-17894-0.jpg', '0.043353080749512');
INSERT INTO `ibt_sys_file` VALUES ('191', 'timg.jpg', '2-1521768752-17118-0.jpg', 'jpg', '2', '2018-03-23 09:32', '0', '0', '/files/default//2-1521768752-17118-0.jpg', '0.013174057006836');
INSERT INTO `ibt_sys_file` VALUES ('192', '-1516067013-17508-0.png', '2-1521768795-18944-0.png', 'png', '2', '2018-03-23 09:33', '0', '0', '/files/default//2-1521768795-18944-0.png', '0.11903476715088');
INSERT INTO `ibt_sys_file` VALUES ('193', '房间导入.xlsx', '2-1521769201-43087-0.xlsx', 'xlsx', '2', '2018-03-23 09:40', '0', '0', '/files//xlsData//2-1521769201-43087-0.xlsx', '0.0098848342895508');
INSERT INTO `ibt_sys_file` VALUES ('194', '房间导入.xlsx', '2-1521769411-39485-0.xlsx', 'xlsx', '2', '2018-03-23 09:43', '0', '0', '/files//xlsData//2-1521769411-39485-0.xlsx', '0.0098848342895508');
INSERT INTO `ibt_sys_file` VALUES ('195', '房间导入.xlsx', '2-1521772572-94288-0.xlsx', 'xlsx', '2', '2018-03-23 10:36', '0', '0', '/files//xlsData//2-1521772572-94288-0.xlsx', '0.0098848342895508');
INSERT INTO `ibt_sys_file` VALUES ('196', '慧云孵化园区解决方案（单园区）.pdf', '2-1521773580-78787-0.pdf', 'pdf', '2', '2018-03-23 10:53', '0', '0', '/files/default//2-1521773580-78787-0.pdf', '2.2744693756104');
INSERT INTO `ibt_sys_file` VALUES ('197', '房间导入.xlsx', '2-1521773696-61421-0.xlsx', 'xlsx', '2', '2018-03-23 10:54', '0', '0', '/files//xlsData//2-1521773696-61421-0.xlsx', '0.0098848342895508');
INSERT INTO `ibt_sys_file` VALUES ('198', '3-1P30GFH5.jpg', '2-1521776637-14246-0.jpg', 'jpg', '2', '2018-03-23 11:43', '0', '0', '/files/default//2-1521776637-14246-0.jpg', '0.1338415145874');
INSERT INTO `ibt_sys_file` VALUES ('199', '3-1P30GFH5.jpg', '2-1521776746-81872-0.jpg', 'jpg', '2', '2018-03-23 11:45', '0', '0', '/files/default//2-1521776746-81872-0.jpg', '0.1338415145874');
INSERT INTO `ibt_sys_file` VALUES ('200', '3-1P30GFH5.jpg', '2-1521776787-55808-0.jpg', 'jpg', '2', '2018-03-23 11:46', '0', '0', '/files/default//2-1521776787-55808-0.jpg', '0.1338415145874');
INSERT INTO `ibt_sys_file` VALUES ('201', '3-1P30GFH5.jpg', '2-1521776939-95506-0.jpg', 'jpg', '2', '2018-03-23 11:48', '0', '0', '/files/default//2-1521776939-95506-0.jpg', '0.1338415145874');
INSERT INTO `ibt_sys_file` VALUES ('202', '3-1P30GFH5.jpg', '2-1521781902-30641-0.jpg', 'jpg', '2', '2018-03-23 13:11', '0', '0', '/files/default//2-1521781902-30641-0.jpg', '0.1338415145874');
INSERT INTO `ibt_sys_file` VALUES ('203', '入驻客户 (3).xlsx', '2-1521788196-44929-0.xlsx', 'xlsx', '2', '2018-03-23 14:56', '0', '0', '/files//xlsData//2-1521788196-44929-0.xlsx', '0.0098752975463867');
INSERT INTO `ibt_sys_file` VALUES ('204', '20.jpg', '2-1521794424-49571-0.jpg', 'jpg', '2', '2018-03-23 16:40', '0', '0', '/files/buildpic//2-1521794424-49571-0.jpg', '0.044642448425293');
INSERT INTO `ibt_sys_file` VALUES ('205', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1521852088.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('206', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1521852302.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('207', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1521852307.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('208', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1521852487.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('209', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1521852499.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('210', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1521852792.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('211', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1521852803.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('212', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1521854446.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('213', '21_1515383931_46085_0.jpg', '2-1521855171-87168-0.jpg', 'jpg', '2', '2018-03-24 09:32', '0', '0', '/files/default//2-1521855171-87168-0.jpg', '0.043353080749512');
INSERT INTO `ibt_sys_file` VALUES ('214', '5.jpg', '2-1521857240-81092-0.jpg', 'jpg', '2', '2018-03-24 10:07', '0', '0', '/files/buildpic//2-1521857240-81092-0.jpg', '0.098702430725098');
INSERT INTO `ibt_sys_file` VALUES ('215', '21.jpg', '1-1521860886-6929-0.jpg', 'jpg', '1', '2018-03-24 11:08', '0', '0', '/files/buildpic//1-1521860886-6929-0.jpg', '0.049197196960449');
INSERT INTO `ibt_sys_file` VALUES ('216', '-1516067013-17508-0.png', '1-1521860892-59719-0.png', 'png', '1', '2018-03-24 11:08', '0', '0', '/files/buildpic//1-1521860892-59719-0.png', '0.11903476715088');
INSERT INTO `ibt_sys_file` VALUES ('217', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1521860904.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('218', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1521860922.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('219', '_1516067013_17508_0.png', '1-1521861072-39078-0.png', 'png', '1', '2018-03-24 11:11', '0', '0', '/files/default//1-1521861072-39078-0.png', '0.11903476715088');
INSERT INTO `ibt_sys_file` VALUES ('220', '入驻客户.xlsx', '40-1521861669-75443-0.xlsx', 'xlsx', '40', '2018-03-24 11:21', '0', '0', '/files//xlsData//40-1521861669-75443-0.xlsx', '0.0095806121826172');
INSERT INTO `ibt_sys_file` VALUES ('221', '招商客户.xlsx', '40-1521862633-79820-0.xlsx', 'xlsx', '40', '2018-03-24 11:37', '0', '0', '/files//xlsData//40-1521862633-79820-0.xlsx', '0.009608268737793');
INSERT INTO `ibt_sys_file` VALUES ('222', '招商客户.xlsx', '40-1521862678-47750-0.xlsx', 'xlsx', '40', '2018-03-24 11:37', '0', '0', '/files//xlsData//40-1521862678-47750-0.xlsx', '0.009608268737793');
INSERT INTO `ibt_sys_file` VALUES ('223', '招商客户 (7).xlsx', '2-1521862930-99990-0.xlsx', 'xlsx', '2', '2018-03-24 11:42', '0', '0', '/files//xlsData//2-1521862930-99990-0.xlsx', '0.01015567779541');
INSERT INTO `ibt_sys_file` VALUES ('224', '招商客户.xlsx', '40-1521862949-1323-0.xlsx', 'xlsx', '40', '2018-03-24 11:42', '0', '0', '/files//xlsData//40-1521862949-1323-0.xlsx', '0.0098028182983398');
INSERT INTO `ibt_sys_file` VALUES ('225', '招商客户 (7).xlsx', '2-1521862973-20174-0.xlsx', 'xlsx', '2', '2018-03-24 11:42', '0', '0', '/files//xlsData//2-1521862973-20174-0.xlsx', '0.01014232635498');
INSERT INTO `ibt_sys_file` VALUES ('226', '招商客户 (7).xlsx', '2-1521862993-30476-0.xlsx', 'xlsx', '2', '2018-03-24 11:43', '0', '0', '/files//xlsData//2-1521862993-30476-0.xlsx', '0.010148048400879');
INSERT INTO `ibt_sys_file` VALUES ('227', '招商客户 (7).xlsx', '2-1521863047-17395-0.xlsx', 'xlsx', '2', '2018-03-24 11:44', '0', '0', '/files//xlsData//2-1521863047-17395-0.xlsx', '0.0099391937255859');
INSERT INTO `ibt_sys_file` VALUES ('228', '招商客户 (7).xlsx', '2-1521863056-17474-0.xlsx', 'xlsx', '2', '2018-03-24 11:44', '0', '0', '/files//xlsData//2-1521863056-17474-0.xlsx', '0.0099391937255859');
INSERT INTO `ibt_sys_file` VALUES ('229', '招商客户 (7).xlsx', '2-1521863137-73853-0.xlsx', 'xlsx', '2', '2018-03-24 11:45', '0', '0', '/files//xlsData//2-1521863137-73853-0.xlsx', '0.0097560882568359');
INSERT INTO `ibt_sys_file` VALUES ('230', '招商客户 (8).xlsx', '2-1521863182-29722-0.xlsx', 'xlsx', '2', '2018-03-24 11:46', '0', '0', '/files//xlsData//2-1521863182-29722-0.xlsx', '0.010171890258789');
INSERT INTO `ibt_sys_file` VALUES ('231', '招商客户.xlsx', '40-1521863240-91090-0.xlsx', 'xlsx', '40', '2018-03-24 11:47', '0', '0', '/files//xlsData//40-1521863240-91090-0.xlsx', '0.0098028182983398');
INSERT INTO `ibt_sys_file` VALUES ('232', '招商客户 (10).xlsx', '2-1521863270-19221-0.xlsx', 'xlsx', '2', '2018-03-24 11:47', '0', '0', '/files//xlsData//2-1521863270-19221-0.xlsx', '0.0097627639770508');
INSERT INTO `ibt_sys_file` VALUES ('233', '招商客户.xlsx', '40-1521863419-16829-0.xlsx', 'xlsx', '40', '2018-03-24 11:50', '0', '0', '/files//xlsData//40-1521863419-16829-0.xlsx', '0.0095987319946289');
INSERT INTO `ibt_sys_file` VALUES ('234', '房间导入.xlsx', '40-1521868007-26453-0.xlsx', 'xlsx', '40', '2018-03-24 13:06', '0', '0', '/files//xlsData//40-1521868007-26453-0.xlsx', '0.0098838806152344');
INSERT INTO `ibt_sys_file` VALUES ('235', '慧云孵化器管理软件使用说明书（单园区）.pdf', '40-1521870950-7066-0.pdf', 'pdf', '40', '2018-03-24 13:55', '0', '0', '/files/default//40-1521870950-7066-0.pdf', '1.8380403518677');
INSERT INTO `ibt_sys_file` VALUES ('236', '房间导入 (11).xlsx', '2-1521871459-98355-0.xlsx', 'xlsx', '2', '2018-03-24 14:04', '0', '0', '/files//xlsData//2-1521871459-98355-0.xlsx', '0.010164260864258');
INSERT INTO `ibt_sys_file` VALUES ('237', '房间导入 (12).xlsx', '2-1521871495-99226-0.xlsx', 'xlsx', '2', '2018-03-24 14:04', '0', '0', '/files//xlsData//2-1521871495-99226-0.xlsx', '0.0099897384643555');
INSERT INTO `ibt_sys_file` VALUES ('238', '房间导入 (12).xlsx', '2-1521871567-62882-0.xlsx', 'xlsx', '2', '2018-03-24 14:06', '0', '0', '/files//xlsData//2-1521871567-62882-0.xlsx', '0.010149955749512');
INSERT INTO `ibt_sys_file` VALUES ('239', '房间导入 (12).xlsx', '2-1521871587-58283-0.xlsx', 'xlsx', '2', '2018-03-24 14:06', '0', '0', '/files//xlsData//2-1521871587-58283-0.xlsx', '0.010162353515625');
INSERT INTO `ibt_sys_file` VALUES ('240', '房间导入 (12).xlsx', '2-1521871616-91299-0.xlsx', 'xlsx', '2', '2018-03-24 14:06', '0', '0', '/files//xlsData//2-1521871616-91299-0.xlsx', '0.010162353515625');
INSERT INTO `ibt_sys_file` VALUES ('241', '房间导入 (12).xlsx', '2-1521871671-44649-0.xlsx', 'xlsx', '2', '2018-03-24 14:07', '0', '0', '/files//xlsData//2-1521871671-44649-0.xlsx', '0.010162353515625');
INSERT INTO `ibt_sys_file` VALUES ('242', '房间导入 (12).xlsx', '2-1521871695-16550-0.xlsx', 'xlsx', '2', '2018-03-24 14:08', '0', '0', '/files//xlsData//2-1521871695-16550-0.xlsx', '0.010162353515625');
INSERT INTO `ibt_sys_file` VALUES ('243', '房间导入 (12).xlsx', '2-1521871724-74739-0.xlsx', 'xlsx', '2', '2018-03-24 14:08', '0', '0', '/files//xlsData//2-1521871724-74739-0.xlsx', '0.010162353515625');
INSERT INTO `ibt_sys_file` VALUES ('244', '房间导入 (12).xlsx', '2-1521872270-21080-0.xlsx', 'xlsx', '2', '2018-03-24 14:17', '0', '0', '/files//xlsData//2-1521872270-21080-0.xlsx', '0.010162353515625');
INSERT INTO `ibt_sys_file` VALUES ('245', '房间导入 (12).xlsx', '2-1521872320-61340-0.xlsx', 'xlsx', '2', '2018-03-24 14:18', '0', '0', '/files//xlsData//2-1521872320-61340-0.xlsx', '0.010162353515625');
INSERT INTO `ibt_sys_file` VALUES ('246', '房间导入 (12).xlsx', '2-1521872355-20640-0.xlsx', 'xlsx', '2', '2018-03-24 14:19', '0', '0', '/files//xlsData//2-1521872355-20640-0.xlsx', '0.010162353515625');
INSERT INTO `ibt_sys_file` VALUES ('247', '21-1515383931-46085-0.jpg', '40-1521873621-64958-0.jpg', 'jpg', '40', '2018-03-24 14:40', '0', '0', '/files/buildpic//40-1521873621-64958-0.jpg', '0.043353080749512');
INSERT INTO `ibt_sys_file` VALUES ('248', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1521873724.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('249', '81d4bb1e881648e8a1c5f1841c6e55ae_th.png.jpg', '40-1521874486-65574-0.jpg', 'jpg', '40', '2018-03-24 14:54', '0', '0', '/files/buildpic//40-1521874486-65574-0.jpg', '0.051105499267578');
INSERT INTO `ibt_sys_file` VALUES ('250', '21_1515383931_46085_0.jpg', '41-1521874975-82746-0.jpg', 'jpg', '41', '2018-03-24 15:02', '0', '0', '/files/default//41-1521874975-82746-0.jpg', '0.043353080749512');
INSERT INTO `ibt_sys_file` VALUES ('251', '3-1P30GFH5.jpg', '2-1521887773-94966-0.jpg', 'jpg', '2', '2018-03-24 18:36', '0', '0', '/files/buildpic//2-1521887773-94966-0.jpg', '0.1338415145874');
INSERT INTO `ibt_sys_file` VALUES ('252', 'timg (2).jpg', '2-1521887781-93143-0.jpg', 'jpg', '2', '2018-03-24 18:36', '0', '0', '/files/buildpic//2-1521887781-93143-0.jpg', '0.048199653625488');
INSERT INTO `ibt_sys_file` VALUES ('253', '微信图片_20180326111702.jpg', '2-1522034241-19196-0.jpg', 'jpg', '2', '2018-03-26 11:17', '0', '0', '/files/buildpic//2-1522034241-19196-0.jpg', '0.12648296356201');
INSERT INTO `ibt_sys_file` VALUES ('254', '两面针logo.jpg', '46-1522035025-42867-0.jpg', 'jpg', '46', '2018-03-26 11:30', '0', '0', '/files/buildpic//46-1522035025-42867-0.jpg', '0.0080080032348633');
INSERT INTO `ibt_sys_file` VALUES ('255', '两面针logo.jpg', '46-1522035192-76783-0.jpg', 'jpg', '46', '2018-03-26 11:33', '0', '0', '/files/buildpic//46-1522035192-76783-0.jpg', '0.0080080032348633');
INSERT INTO `ibt_sys_file` VALUES ('256', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1522035800.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('257', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1522041967.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('258', '杭集.jpg', '46-1522044247-70084-0.jpg', 'jpg', '46', '2018-03-26 14:04', '0', '0', '/files/buildpic//46-1522044247-70084-0.jpg', '0.080410957336426');
INSERT INTO `ibt_sys_file` VALUES ('259', '慧云智慧孵化园区系统介绍.pdf', '2-1522047507-38365-0.pdf', 'pdf', '2', '2018-03-26 14:58', '0', '0', '/files/default//2-1522047507-38365-0.pdf', '6.072943687439');
INSERT INTO `ibt_sys_file` VALUES ('260', '房间导入 (3).xlsx', '2-1522049100-91076-0.xlsx', 'xlsx', '2', '2018-03-26 15:25', '0', '0', '/files//xlsData//2-1522049100-91076-0.xlsx', '0.011460304260254');
INSERT INTO `ibt_sys_file` VALUES ('261', '房间导入 (3).xlsx', '2-1522049215-9694-0.xlsx', 'xlsx', '2', '2018-03-26 15:26', '0', '0', '/files//xlsData//2-1522049215-9694-0.xlsx', '0.011122703552246');
INSERT INTO `ibt_sys_file` VALUES ('262', '房间导入 (3).xlsx', '2-1522049274-95790-0.xlsx', 'xlsx', '2', '2018-03-26 15:27', '0', '0', '/files//xlsData//2-1522049274-95790-0.xlsx', '0.011221885681152');
INSERT INTO `ibt_sys_file` VALUES ('263', '房间导入 (3).xlsx', '2-1522049333-65231-0.xlsx', 'xlsx', '2', '2018-03-26 15:28', '0', '0', '/files//xlsData//2-1522049333-65231-0.xlsx', '0.011265754699707');
INSERT INTO `ibt_sys_file` VALUES ('264', '房间导入 (3).xlsx', '2-1522049467-23297-0.xlsx', 'xlsx', '2', '2018-03-26 15:31', '0', '0', '/files//xlsData//2-1522049467-23297-0.xlsx', '0.011444091796875');
INSERT INTO `ibt_sys_file` VALUES ('265', '房间导入 (3).xlsx', '2-1522049546-30333-0.xlsx', 'xlsx', '2', '2018-03-26 15:32', '0', '0', '/files//xlsData//2-1522049546-30333-0.xlsx', '0.011444091796875');
INSERT INTO `ibt_sys_file` VALUES ('266', '房间导入 (1).xlsx', '2-1522050343-55803-0.xlsx', 'xlsx', '2', '2018-03-26 15:45', '0', '0', '/files//xlsData//2-1522050343-55803-0.xlsx', '0.011444091796875');
INSERT INTO `ibt_sys_file` VALUES ('267', '103831151.jpg.thumb.jpg', '2-1522050700-28478-0.jpg', 'jpg', '2', '2018-03-26 15:51', '0', '0', '/files/buildpic//2-1522050700-28478-0.jpg', '0.012866020202637');
INSERT INTO `ibt_sys_file` VALUES ('268', 'u=4235024099,1787969098&fm=27&gp=0.jpg', '2-1522199641-5762-0.jpg', 'jpg', '2', '2018-03-28 09:14', '0', '0', '/files/buildpic\\/2-1522199641-5762-0.jpg', '0.025529861450195');
INSERT INTO `ibt_sys_file` VALUES ('269', '招商客户wps创建导入.xlsx', '2-1522379877-82099-0.xlsx', 'xlsx', '2', '2018-03-30 11:17', '0', '0', '/files//xlsData\\/2-1522379877-82099-0.xlsx', '0.0088958740234375');
INSERT INTO `ibt_sys_file` VALUES ('270', '招商客户wps创建导入.xlsx', '2-1522379893-13288-0.xlsx', 'xlsx', '2', '2018-03-30 11:18', '0', '0', '/files//xlsData\\/2-1522379893-13288-0.xlsx', '0.0089216232299805');
INSERT INTO `ibt_sys_file` VALUES ('271', '招商客户wps创建导入.xlsx', '2-1522379917-66852-0.xlsx', 'xlsx', '2', '2018-03-30 11:18', '0', '0', '/files//xlsData\\/2-1522379917-66852-0.xlsx', '0.0088624954223633');
INSERT INTO `ibt_sys_file` VALUES ('272', '招商客户wps创建导入.xlsx', '2-1522380054-15174-0.xlsx', 'xlsx', '2', '2018-03-30 11:20', '0', '0', '/files//xlsData\\/2-1522380054-15174-0.xlsx', '0.0088624954223633');
INSERT INTO `ibt_sys_file` VALUES ('273', '招商客户wps创建导入 (1).xlsx', '2-1522380145-34302-0.xlsx', 'xlsx', '2', '2018-03-30 11:22', '0', '0', '/files//xlsData\\/2-1522380145-34302-0.xlsx', '0.0088624954223633');
INSERT INTO `ibt_sys_file` VALUES ('274', '招商客户wps创建导入 (1).xlsx', '2-1522380195-87546-0.xlsx', 'xlsx', '2', '2018-03-30 11:23', '0', '0', '/files//xlsData\\/2-1522380195-87546-0.xlsx', '0.0087480545043945');
INSERT INTO `ibt_sys_file` VALUES ('275', 'Wps模板.xlsx', '2-1522380289-18985-0.xlsx', 'xlsx', '2', '2018-03-30 11:24', '0', '0', '/files//xlsData\\/2-1522380289-18985-0.xlsx', '0.0086584091186523');
INSERT INTO `ibt_sys_file` VALUES ('276', 'Wps模板 (excel编辑.xlsx', '2-1522380391-52497-0.xlsx', 'xlsx', '2', '2018-03-30 11:26', '0', '0', '/files//xlsData\\/2-1522380391-52497-0.xlsx', '0.0086297988891602');
INSERT INTO `ibt_sys_file` VALUES ('277', '房间导入-模板.xlsx', '2-1522381293-60685-0.xlsx', 'xlsx', '2', '2018-03-30 11:41', '0', '0', '/files//xlsData\\/2-1522381293-60685-0.xlsx', '0.0091285705566406');
INSERT INTO `ibt_sys_file` VALUES ('278', '房间导入-模板.xlsx', '2-1522381302-1404-0.xlsx', 'xlsx', '2', '2018-03-30 11:41', '0', '0', '/files//xlsData\\/2-1522381302-1404-0.xlsx', '0.0091285705566406');
INSERT INTO `ibt_sys_file` VALUES ('279', '房间导入-模板.xlsx', '2-1522381324-22876-0.xlsx', 'xlsx', '2', '2018-03-30 11:42', '0', '0', '/files//xlsData\\/2-1522381324-22876-0.xlsx', '0.0091285705566406');
INSERT INTO `ibt_sys_file` VALUES ('280', '房间导入-模板.xlsx', '2-1522381331-3357-0.xlsx', 'xlsx', '2', '2018-03-30 11:42', '0', '0', '/files//xlsData\\/2-1522381331-3357-0.xlsx', '0.0091285705566406');
INSERT INTO `ibt_sys_file` VALUES ('281', '房间导入-模板 (1).xlsx', '2-1522381566-94156-0.xlsx', 'xlsx', '2', '2018-03-30 11:46', '0', '0', '/files//xlsData\\/2-1522381566-94156-0.xlsx', '0.0091428756713867');
INSERT INTO `ibt_sys_file` VALUES ('282', '房间导入-模板 (1).xlsx', '2-1522381597-50660-0.xlsx', 'xlsx', '2', '2018-03-30 11:46', '0', '0', '/files//xlsData\\/2-1522381597-50660-0.xlsx', '0.0091428756713867');
INSERT INTO `ibt_sys_file` VALUES ('283', '房间导入-模板.xlsx', '2-1522381606-41160-0.xlsx', 'xlsx', '2', '2018-03-30 11:46', '0', '0', '/files//xlsData\\/2-1522381606-41160-0.xlsx', '0.0091285705566406');
INSERT INTO `ibt_sys_file` VALUES ('284', 'Wps模板 (excel编辑.xlsx', '2-1522381629-53183-0.xlsx', 'xlsx', '2', '2018-03-30 11:47', '0', '0', '/files//xlsData\\/2-1522381629-53183-0.xlsx', '0.0086297988891602');
INSERT INTO `ibt_sys_file` VALUES ('285', 'Wps模板 (1).xlsx', '2-1522381634-57746-0.xlsx', 'xlsx', '2', '2018-03-30 11:47', '0', '0', '/files//xlsData\\/2-1522381634-57746-0.xlsx', '0.0086584091186523');
INSERT INTO `ibt_sys_file` VALUES ('286', '招商客户 (13).xlsx', '2-1522381868-2405-0.xlsx', 'xlsx', '2', '2018-03-30 11:51', '0', '0', '/files//xlsData\\/2-1522381868-2405-0.xlsx', '0.0086345672607422');
INSERT INTO `ibt_sys_file` VALUES ('287', 'Wps模板 (1).xlsx', '2-1522381920-11149-0.xlsx', 'xlsx', '2', '2018-03-30 11:52', '0', '0', '/files//xlsData\\/2-1522381920-11149-0.xlsx', '0.0086584091186523');
INSERT INTO `ibt_sys_file` VALUES ('288', 'wps创建房间导入模板.xlsx', '2-1522386753-54938-0.xlsx', 'xlsx', '2', '2018-03-30 13:12', '0', '0', '/files//xlsData\\/2-1522386753-54938-0.xlsx', '0.0091428756713867');
INSERT INTO `ibt_sys_file` VALUES ('289', 'Wps模板.xlsx', '2-1522386761-60749-0.xlsx', 'xlsx', '2', '2018-03-30 13:12', '0', '0', '/files//xlsData\\/2-1522386761-60749-0.xlsx', '0.0086584091186523');
INSERT INTO `ibt_sys_file` VALUES ('290', 'wps创建房间导入模板.xlsx', '2-1522386786-15510-0.xlsx', 'xlsx', '2', '2018-03-30 13:13', '0', '0', '/files//xlsData\\/2-1522386786-15510-0.xlsx', '0.0091428756713867');
INSERT INTO `ibt_sys_file` VALUES ('291', 'wps创建房间导入模板.xlsx', '2-1522386790-16819-0.xlsx', 'xlsx', '2', '2018-03-30 13:13', '0', '0', '/files//xlsData\\/2-1522386790-16819-0.xlsx', '0.0091428756713867');
INSERT INTO `ibt_sys_file` VALUES ('292', 'wps创建房间导入模板.xlsx', '2-1522386807-19571-0.xlsx', 'xlsx', '2', '2018-03-30 13:13', '0', '0', '/files//xlsData\\/2-1522386807-19571-0.xlsx', '0.0091428756713867');
INSERT INTO `ibt_sys_file` VALUES ('293', 'wps创建房间导入模板.xlsx', '2-1522386822-30875-0.xlsx', 'xlsx', '2', '2018-03-30 13:13', '0', '0', '/files//xlsData\\/2-1522386822-30875-0.xlsx', '0.0091390609741211');
INSERT INTO `ibt_sys_file` VALUES ('294', 'wps房间模板3.0.xlsx', '2-1522386873-69489-0.xlsx', 'xlsx', '2', '2018-03-30 13:14', '0', '0', '/files//xlsData\\/2-1522386873-69489-0.xlsx', '0.0087261199951172');
INSERT INTO `ibt_sys_file` VALUES ('295', '3.xlsx', '2-1522387523-23551-0.xlsx', 'xlsx', '2', '2018-03-30 13:25', '0', '0', '/files//xlsData\\/2-1522387523-23551-0.xlsx', '0.0098714828491211');
INSERT INTO `ibt_sys_file` VALUES ('296', '入驻管理模板.xlsx', '2-1522387553-79416-0.xlsx', 'xlsx', '2', '2018-03-30 13:25', '0', '0', '/files//xlsData\\/2-1522387553-79416-0.xlsx', '0.0086088180541992');
INSERT INTO `ibt_sys_file` VALUES ('297', '入住管理模板1.xlsx', '2-1522387646-93122-0.xlsx', 'xlsx', '2', '2018-03-30 13:27', '0', '0', '/files//xlsData\\/2-1522387646-93122-0.xlsx', '0.0085792541503906');
INSERT INTO `ibt_sys_file` VALUES ('298', '-1515388581-73876-0.jpg', '2-1523235094-55457-0.jpg', 'jpg', '2', '2018-04-09 08:51', '0', '0', '/files/buildpic\\/2-1523235094-55457-0.jpg', '0.013291358947754');
INSERT INTO `ibt_sys_file` VALUES ('299', '21-1516083972-15396-0.jpg', '2-1523259486-87174-0.jpg', 'jpg', '2', '2018-04-09 15:38', '0', '0', '/files/buildpic\\/2-1523259486-87174-0.jpg', '0.017516136169434');
INSERT INTO `ibt_sys_file` VALUES ('300', '21-1515578327-89142-0.jpg', '2-1523321871-67295-0.jpg', 'jpg', '2', '2018-04-10 08:57', '0', '0', '/files/buildpic\\/2-1523321871-67295-0.jpg', '0.01750659942627');
INSERT INTO `ibt_sys_file` VALUES ('301', '478-1515751975-36002-0.png', '2-1523324887-14506-0.png', 'png', '2', '2018-04-10 09:48', '0', '0', '/files/buildpic\\/2-1523324887-14506-0.png', '0.0083675384521484');
INSERT INTO `ibt_sys_file` VALUES ('302', '21-1516083972-15396-0.jpg', '2-1523324979-66706-0.jpg', 'jpg', '2', '2018-04-10 09:49', '0', '0', '/files/buildpic\\/2-1523324979-66706-0.jpg', '0.017516136169434');
INSERT INTO `ibt_sys_file` VALUES ('303', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1523330723.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('304', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1523330730.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('305', 'cut', null, null, '0', null, '0', '0', '/files/cutimg/1523330746.jpeg', '');
INSERT INTO `ibt_sys_file` VALUES ('306', '21-1516089965-65356-0.jpg', '2-1523517974-45734-0.jpg', 'jpg', '2', '2018-04-12 15:26', '0', '0', '/files/buildpic\\/2-1523517974-45734-0.jpg', '0.0085000991821289');
INSERT INTO `ibt_sys_file` VALUES ('307', '21-1516083972-15396-0.jpg', '2-1523865048-84742-0.jpg', 'jpg', '2', '2018-04-16 15:50', '0', '0', '/files/buildpic\\/2-1523865048-84742-0.jpg', '0.017516136169434');
INSERT INTO `ibt_sys_file` VALUES ('308', '21-1516083972-15396-0.jpg', '2-1523865085-36738-0.jpg', 'jpg', '2', '2018-04-16 15:51', '0', '0', '/files/buildpic\\/2-1523865085-36738-0.jpg', '0.017516136169434');
INSERT INTO `ibt_sys_file` VALUES ('309', '21-1516085057-20883-0.jpg', '2-1523865131-90665-0.jpg', 'jpg', '2', '2018-04-16 15:52', '0', '0', '/files/buildpic\\/2-1523865131-90665-0.jpg', '0.039094924926758');
INSERT INTO `ibt_sys_file` VALUES ('310', '21-1516083972-15396-0.jpg', '2-1523865141-15061-0.jpg', 'jpg', '2', '2018-04-16 15:52', '0', '0', '/files/buildpic\\/2-1523865141-15061-0.jpg', '0.017516136169434');
INSERT INTO `ibt_sys_file` VALUES ('311', '21-1516085057-20883-0.jpg', '2-1523865142-11637-0.jpg', 'jpg', '2', '2018-04-16 15:52', '0', '0', '/files/buildpic\\/2-1523865142-11637-0.jpg', '0.039094924926758');
INSERT INTO `ibt_sys_file` VALUES ('312', '21-1516083972-15396-0.jpg', '2-1523865158-65085-0.jpg', 'jpg', '2', '2018-04-16 15:52', '0', '0', '/files/buildpic\\/2-1523865158-65085-0.jpg', '0.017516136169434');
INSERT INTO `ibt_sys_file` VALUES ('313', '21-1516085021-35261-0.jpg', '2-1523865164-73404-0.jpg', 'jpg', '2', '2018-04-16 15:52', '0', '0', '/files/buildpic\\/2-1523865164-73404-0.jpg', '0.039094924926758');
INSERT INTO `ibt_sys_file` VALUES ('314', '21-1516083972-15396-0.jpg', '2-1523865346-81171-0.jpg', 'jpg', '2', '2018-04-16 15:55', '0', '0', '/files/buildpic\\/2-1523865346-81171-0.jpg', '0.017516136169434');
INSERT INTO `ibt_sys_file` VALUES ('315', '21-1516085057-20883-0.jpg', '2-1523865349-62421-0.jpg', 'jpg', '2', '2018-04-16 15:55', '0', '0', '/files/buildpic\\/2-1523865349-62421-0.jpg', '0.039094924926758');
INSERT INTO `ibt_sys_file` VALUES ('316', '21-1516083972-15396-0.jpg', '2-1523865368-59171-0.jpg', 'jpg', '2', '2018-04-16 15:56', '0', '0', '/files/buildpic\\/2-1523865368-59171-0.jpg', '0.017516136169434');
INSERT INTO `ibt_sys_file` VALUES ('317', '21-1516083972-15396-0.jpg', '2-1523865699-25141-0.jpg', 'jpg', '2', '2018-04-16 16:01', '0', '0', '/files/buildpic\\/2-1523865699-25141-0.jpg', '0.017516136169434');
INSERT INTO `ibt_sys_file` VALUES ('318', '21-1516069993-92939-0.jpg', '2-1523865717-30011-0.jpg', 'jpg', '2', '2018-04-16 16:01', '0', '0', '/files/buildpic\\/2-1523865717-30011-0.jpg', '0.039094924926758');
INSERT INTO `ibt_sys_file` VALUES ('319', '21-1516083972-15396-0.jpg', '2-1523865726-65775-0.jpg', 'jpg', '2', '2018-04-16 16:02', '0', '0', '/files/buildpic\\/2-1523865726-65775-0.jpg', '0.017516136169434');
INSERT INTO `ibt_sys_file` VALUES ('320', '21-1516070002-92872-0.jpg', '2-1523865731-98902-0.jpg', 'jpg', '2', '2018-04-16 16:02', '0', '0', '/files/buildpic\\/2-1523865731-98902-0.jpg', '0.012794494628906');
INSERT INTO `ibt_sys_file` VALUES ('321', '21-1516083972-15396-0.jpg', '2-1523865793-24653-0.jpg', 'jpg', '2', '2018-04-16 16:03', '0', '0', '/files/buildpic\\/2-1523865793-24653-0.jpg', '0.017516136169434');
INSERT INTO `ibt_sys_file` VALUES ('322', '21-1516083972-15396-0.jpg', '2-1523865951-53605-0.jpg', 'jpg', '2', '2018-04-16 16:05', '0', '0', '/files/buildpic\\/2-1523865951-53605-0.jpg', '0.017516136169434');
INSERT INTO `ibt_sys_file` VALUES ('323', '21-1516085057-20883-0.jpg', '2-1523865957-51236-0.jpg', 'jpg', '2', '2018-04-16 16:05', '0', '0', '/files/buildpic\\/2-1523865957-51236-0.jpg', '0.039094924926758');
INSERT INTO `ibt_sys_file` VALUES ('324', '21-1516083972-15396-0.jpg', '2-1523866025-25840-0.jpg', 'jpg', '2', '2018-04-16 16:07', '0', '0', '/files/buildpic\\/2-1523866025-25840-0.jpg', '0.017516136169434');
INSERT INTO `ibt_sys_file` VALUES ('325', '21-1516085057-20883-0.jpg', '2-1523866028-29786-0.jpg', 'jpg', '2', '2018-04-16 16:07', '0', '0', '/files/buildpic\\/2-1523866028-29786-0.jpg', '0.039094924926758');
INSERT INTO `ibt_sys_file` VALUES ('326', '21-1516083972-15396-0.jpg', '2-1523866128-41895-0.jpg', 'jpg', '2', '2018-04-16 16:08', '0', '0', '/files/buildpic\\/2-1523866128-41895-0.jpg', '0.017516136169434');
INSERT INTO `ibt_sys_file` VALUES ('327', '21-1516069993-92939-0.jpg', '2-1523866135-87851-0.jpg', 'jpg', '2', '2018-04-16 16:08', '0', '0', '/files/buildpic\\/2-1523866135-87851-0.jpg', '0.039094924926758');
INSERT INTO `ibt_sys_file` VALUES ('328', '21-1516082885-44973-0.jpg', '2-1523866140-39411-0.jpg', 'jpg', '2', '2018-04-16 16:09', '0', '0', '/files/buildpic\\/2-1523866140-39411-0.jpg', '0.039094924926758');
INSERT INTO `ibt_sys_file` VALUES ('329', '21-1516083972-15396-0.jpg', '2-1523867573-12067-0.jpg', 'jpg', '2', '2018-04-16 16:32', '0', '0', '/files/buildpic\\/2-1523867573-12067-0.jpg', '0.017516136169434');
INSERT INTO `ibt_sys_file` VALUES ('330', '21-1516085021-35261-0.jpg', '2-1523867595-84748-0.jpg', 'jpg', '2', '2018-04-16 16:33', '0', '0', '/files/buildpic\\/2-1523867595-84748-0.jpg', '0.039094924926758');
INSERT INTO `ibt_sys_file` VALUES ('331', '21-1516083972-15396-0.jpg', '2-1523867705-76536-0.jpg', 'jpg', '2', '2018-04-16 16:35', '0', '0', '/files/buildpic\\/2-1523867705-76536-0.jpg', '0.017516136169434');
INSERT INTO `ibt_sys_file` VALUES ('332', '21-1516069993-92939-0.jpg', '2-1523868113-80106-0.jpg', 'jpg', '2', '2018-04-16 16:41', '0', '0', '/files/buildpic\\/2-1523868113-80106-0.jpg', '0.039094924926758');
INSERT INTO `ibt_sys_file` VALUES ('333', '21-1516069993-92939-0.jpg', '2-1523868230-35828-0.jpg', 'jpg', '2', '2018-04-16 16:43', '0', '0', '/files/buildpic\\/2-1523868230-35828-0.jpg', '0.039094924926758');
INSERT INTO `ibt_sys_file` VALUES ('334', '21-1515578327-89142-0.jpg', '2-1523868232-51999-0.jpg', 'jpg', '2', '2018-04-16 16:43', '0', '0', '/files/buildpic\\/2-1523868232-51999-0.jpg', '0.01750659942627');
INSERT INTO `ibt_sys_file` VALUES ('335', '21-1515578327-89142-0.jpg', '2-1523868390-46830-0.jpg', 'jpg', '2', '2018-04-16 16:46', '0', '0', '/files/buildpic\\/2-1523868390-46830-0.jpg', '0.01750659942627');
INSERT INTO `ibt_sys_file` VALUES ('336', '21-1516069993-92939-0.jpg', '2-1523868442-58426-0.jpg', 'jpg', '2', '2018-04-16 16:47', '0', '0', '/files/buildpic\\/2-1523868442-58426-0.jpg', '0.039094924926758');
INSERT INTO `ibt_sys_file` VALUES ('337', '21-1515578327-89142-0.jpg', '2-1523869541-83793-0.jpg', 'jpg', '2', '2018-04-16 17:05', '0', '0', '/files/buildpic\\/2-1523869541-83793-0.jpg', '0.01750659942627');
INSERT INTO `ibt_sys_file` VALUES ('338', '21-1516069993-92939-0.jpg', '2-1523870584-27765-0.jpg', 'jpg', '2', '2018-04-16 17:23', '0', '0', '/files/buildpic\\/2-1523870584-27765-0.jpg', '0.039094924926758');
INSERT INTO `ibt_sys_file` VALUES ('339', '21-1516070002-92872-0.jpg', '2-1523870609-30341-0.jpg', 'jpg', '2', '2018-04-16 17:23', '0', '0', '/files/buildpic\\/2-1523870609-30341-0.jpg', '0.012794494628906');
INSERT INTO `ibt_sys_file` VALUES ('340', '21-1516086473-36055-0.jpg', '2-1523870954-40705-0.jpg', 'jpg', '2', '2018-04-16 17:29', '0', '0', '/files/buildpic\\/2-1523870954-40705-0.jpg', '0.015172004699707');
INSERT INTO `ibt_sys_file` VALUES ('341', '-1515388581-73876-0.jpg', '2-1523871492-34144-0.jpg', 'jpg', '2', '2018-04-16 17:38', '0', '0', '/files/buildpic\\/2-1523871492-34144-0.jpg', '0.013291358947754');
INSERT INTO `ibt_sys_file` VALUES ('342', '21-1515578327-89142-0.jpg', '2-1523871953-87714-0.jpg', 'jpg', '2', '2018-04-16 17:45', '0', '0', '/files/buildpic\\/2-1523871953-87714-0.jpg', '0.01750659942627');
INSERT INTO `ibt_sys_file` VALUES ('343', '21-1516083972-15396-0.jpg', '2-1523871967-34461-0.jpg', 'jpg', '2', '2018-04-16 17:46', '0', '0', '/files/buildpic\\/2-1523871967-34461-0.jpg', '0.017516136169434');
INSERT INTO `ibt_sys_file` VALUES ('344', '21-1515578327-89142-0.jpg', '-1523872616-2146-0.jpg', 'jpg', null, '2018-04-16 17:56', '0', '0', '/files/buildpic\\/-1523872616-2146-0.jpg', '0.01750659942627');
INSERT INTO `ibt_sys_file` VALUES ('345', '21-1515578327-89142-0.jpg', '-1523872785-82844-0.jpg', 'jpg', null, '2018-04-16 17:59', '0', '0', '/files/buildpic\\/-1523872785-82844-0.jpg', '0.01750659942627');
INSERT INTO `ibt_sys_file` VALUES ('346', '21-1515578327-89142-0.jpg', '-1523872794-57044-0.jpg', 'jpg', null, '2018-04-16 17:59', '0', '0', '/files/buildpic\\/-1523872794-57044-0.jpg', '0.01750659942627');
INSERT INTO `ibt_sys_file` VALUES ('347', '21-1515578327-89142-0.jpg', '-1523872813-22971-0.jpg', 'jpg', null, '2018-04-16 18:00', '0', '0', '/files/buildpic\\/-1523872813-22971-0.jpg', '0.01750659942627');
INSERT INTO `ibt_sys_file` VALUES ('348', '21-1515578327-89142-0.jpg', '-1523872841-42685-0.jpg', 'jpg', null, '2018-04-16 18:00', '0', '0', '/files/buildpic\\/-1523872841-42685-0.jpg', '0.01750659942627');
INSERT INTO `ibt_sys_file` VALUES ('349', '21-1515578327-89142-0.jpg', '-1523873036-78345-0.jpg', 'jpg', null, '2018-04-16 18:03', '0', '0', '/files/buildpic\\/-1523873036-78345-0.jpg', '0.01750659942627');
INSERT INTO `ibt_sys_file` VALUES ('350', '21-1515578327-89142-0.jpg', '-1523873059-3696-0.jpg', 'jpg', null, '2018-04-16 18:04', '0', '0', '/files/buildpic\\/-1523873059-3696-0.jpg', '0.01750659942627');
INSERT INTO `ibt_sys_file` VALUES ('351', '21-1515578327-89142-0.jpg', '-1523873283-85553-0.jpg', 'jpg', null, '2018-04-16 18:08', '0', '0', '/files/buildpic\\/-1523873283-85553-0.jpg', '0.01750659942627');
INSERT INTO `ibt_sys_file` VALUES ('352', '21-1516069993-92939-0.jpg', '-1523873539-30292-0.jpg', 'jpg', null, '2018-04-16 18:12', '0', '0', '/files/buildpic\\/-1523873539-30292-0.jpg', '0.039094924926758');
INSERT INTO `ibt_sys_file` VALUES ('353', '21-1516083972-15396-0.jpg', '-1523873545-62085-0.jpg', 'jpg', null, '2018-04-16 18:12', '0', '0', '/files/buildpic\\/-1523873545-62085-0.jpg', '0.017516136169434');
INSERT INTO `ibt_sys_file` VALUES ('354', '21-1515578327-89142-0.jpg', '-1523873589-16251-0.jpg', 'jpg', null, '2018-04-16 18:13', '0', '0', '/files/buildpic\\/-1523873589-16251-0.jpg', '0.01750659942627');
INSERT INTO `ibt_sys_file` VALUES ('355', '21-1515578327-89142-0.jpg', '-1523873620-89457-0.jpg', 'jpg', null, '2018-04-16 18:13', '0', '0', '/files/buildpic\\/-1523873620-89457-0.jpg', '0.01750659942627');
INSERT INTO `ibt_sys_file` VALUES ('356', '21-1515578327-89142-0.jpg', '-1523873667-59766-0.jpg', 'jpg', null, '2018-04-16 18:14', '0', '0', '/files/buildpic\\/-1523873667-59766-0.jpg', '0.01750659942627');
INSERT INTO `ibt_sys_file` VALUES ('357', '21-1515578327-89142-0.jpg', '-1523873754-37989-0.jpg', 'jpg', null, '2018-04-16 18:15', '0', '0', '/files/buildpic\\/-1523873754-37989-0.jpg', '0.01750659942627');
INSERT INTO `ibt_sys_file` VALUES ('358', '21-1515578327-89142-0.jpg', '-1523873767-9073-0.jpg', 'jpg', null, '2018-04-16 18:16', '0', '0', '/files/buildpic\\/-1523873767-9073-0.jpg', '0.01750659942627');
INSERT INTO `ibt_sys_file` VALUES ('359', '21-1515578327-89142-0.jpg', '-1523873777-8979-0.jpg', 'jpg', null, '2018-04-16 18:16', '0', '0', '/files/buildpic\\/-1523873777-8979-0.jpg', '0.01750659942627');
INSERT INTO `ibt_sys_file` VALUES ('360', '21-1516069993-92939-0.jpg', '-1523874253-82584-0.jpg', 'jpg', null, '2018-04-16 18:24', '0', '0', '/files/buildpic\\/-1523874253-82584-0.jpg', '0.039094924926758');
INSERT INTO `ibt_sys_file` VALUES ('361', '21-1515578327-89142-0.jpg', '-1523874454-82673-0.jpg', 'jpg', null, '2018-04-16 18:27', '0', '0', '/files/buildpic\\/-1523874454-82673-0.jpg', '0.01750659942627');
INSERT INTO `ibt_sys_file` VALUES ('362', '21-1516069993-92939-0.jpg', '-1523874621-35627-0.jpg', 'jpg', null, '2018-04-16 18:30', '0', '0', '/files/buildpic\\/-1523874621-35627-0.jpg', '0.039094924926758');
INSERT INTO `ibt_sys_file` VALUES ('363', '21-1516083972-15396-0.jpg', '-1523874623-48804-0.jpg', 'jpg', null, '2018-04-16 18:30', '0', '0', '/files/buildpic\\/-1523874623-48804-0.jpg', '0.017516136169434');
INSERT INTO `ibt_sys_file` VALUES ('364', '21-1516069993-92939-0.jpg', '-1523874717-57724-0.jpg', 'jpg', null, '2018-04-16 18:31', '0', '0', '/files/buildpic\\/-1523874717-57724-0.jpg', '0.039094924926758');
INSERT INTO `ibt_sys_file` VALUES ('365', '21-1516069993-92939-0.jpg', '-1523874735-30854-0.jpg', 'jpg', null, '2018-04-16 18:32', '0', '0', '/files/buildpic\\/-1523874735-30854-0.jpg', '0.039094924926758');
INSERT INTO `ibt_sys_file` VALUES ('366', '21-1516069993-92939-0.jpg', '-1523874750-25980-0.jpg', 'jpg', null, '2018-04-16 18:32', '0', '0', '/files/buildpic\\/-1523874750-25980-0.jpg', '0.039094924926758');
INSERT INTO `ibt_sys_file` VALUES ('367', '21-1515578327-89142-0.jpg', '3-1523877160-69565-0.jpg', 'jpg', '3', '2018-04-16 19:12', '0', '0', '/files/buildpic\\/3-1523877160-69565-0.jpg', '0.01750659942627');
INSERT INTO `ibt_sys_file` VALUES ('368', '21-1516069993-92939-0.jpg', '3-1523877206-49137-0.jpg', 'jpg', '3', '2018-04-16 19:13', '0', '0', '/files/buildpic\\/3-1523877206-49137-0.jpg', '0.039094924926758');
INSERT INTO `ibt_sys_file` VALUES ('369', '21-1516069993-92939-0.jpg', '3-1523877209-48395-0.jpg', 'jpg', '3', '2018-04-16 19:13', '0', '0', '/files/buildpic\\/3-1523877209-48395-0.jpg', '0.039094924926758');
INSERT INTO `ibt_sys_file` VALUES ('370', '21-1516083972-15396-0.jpg', '3-1523877218-89396-0.jpg', 'jpg', '3', '2018-04-16 19:13', '0', '0', '/files/buildpic\\/3-1523877218-89396-0.jpg', '0.017516136169434');
INSERT INTO `ibt_sys_file` VALUES ('371', '21-1515578327-89142-0.jpg', '3-1523877330-42011-0.jpg', 'jpg', '3', '2018-04-16 19:15', '0', '0', '/files/buildpic\\/3-1523877330-42011-0.jpg', '0.01750659942627');
INSERT INTO `ibt_sys_file` VALUES ('372', '21-1516069993-92939-0.jpg', '3-1523877373-31479-0.jpg', 'jpg', '3', '2018-04-16 19:16', '0', '0', '/files/buildpic\\/3-1523877373-31479-0.jpg', '0.039094924926758');
INSERT INTO `ibt_sys_file` VALUES ('373', '21-1516069993-92939-0.jpg', '3-1523877849-83201-0.jpg', 'jpg', '3', '2018-04-16 19:24', '0', '0', '/files/buildpic\\/3-1523877849-83201-0.jpg', '0.039094924926758');
INSERT INTO `ibt_sys_file` VALUES ('374', '21-1516069993-92939-0.jpg', '3-1523877897-86780-0.jpg', 'jpg', '3', '2018-04-16 19:24', '0', '0', '/files/buildpic\\/3-1523877897-86780-0.jpg', '0.039094924926758');
INSERT INTO `ibt_sys_file` VALUES ('375', '21-1515578327-89142-0.jpg', '3-1523877903-51444-0.jpg', 'jpg', '3', '2018-04-16 19:25', '0', '0', '/files/buildpic\\/3-1523877903-51444-0.jpg', '0.01750659942627');
INSERT INTO `ibt_sys_file` VALUES ('376', '21-1515578327-89142-0.jpg', '3-1523877905-27475-0.jpg', 'jpg', '3', '2018-04-16 19:25', '0', '0', '/files/buildpic\\/3-1523877905-27475-0.jpg', '0.01750659942627');
INSERT INTO `ibt_sys_file` VALUES ('377', '21-1515578327-89142-0.jpg', '2-1523927375-46915-0.jpg', 'jpg', '2', '2018-04-17 09:09', '0', '0', '/files/buildpic\\/2-1523927375-46915-0.jpg', '0.01750659942627');
INSERT INTO `ibt_sys_file` VALUES ('378', '21-1515578327-89142-0.jpg', '2-1523927391-84614-0.jpg', 'jpg', '2', '2018-04-17 09:09', '0', '0', '/files/buildpic\\/2-1523927391-84614-0.jpg', '0.01750659942627');
INSERT INTO `ibt_sys_file` VALUES ('379', '21-1516069993-92939-0.jpg', '2-1523927439-9702-0.jpg', 'jpg', '2', '2018-04-17 09:10', '0', '0', '/files/buildpic\\/2-1523927439-9702-0.jpg', '0.039094924926758');
INSERT INTO `ibt_sys_file` VALUES ('380', '21-1516069993-92939-0.jpg', '2-1523927464-91324-0.jpg', 'jpg', '2', '2018-04-17 09:11', '0', '0', '/files/buildpic\\/2-1523927464-91324-0.jpg', '0.039094924926758');
INSERT INTO `ibt_sys_file` VALUES ('381', '21-1516069993-92939-0.jpg', '2-1523927541-11503-0.jpg', 'jpg', '2', '2018-04-17 09:12', '0', '0', '/files/buildpic\\/2-1523927541-11503-0.jpg', '0.039094924926758');
INSERT INTO `ibt_sys_file` VALUES ('382', '21-1516069993-92939-0.jpg', '2-1523927603-98758-0.jpg', 'jpg', '2', '2018-04-17 09:13', '0', '0', '/files/buildpic\\/2-1523927603-98758-0.jpg', '0.039094924926758');
INSERT INTO `ibt_sys_file` VALUES ('383', '21-1516083972-15396-0.jpg', '2-1523927773-4139-0.jpg', 'jpg', '2', '2018-04-17 09:16', '0', '0', '/files/buildpic\\/2-1523927773-4139-0.jpg', '0.017516136169434');
INSERT INTO `ibt_sys_file` VALUES ('384', '21-1516069993-92939-0.jpg', '2-1523927845-21500-0.jpg', 'jpg', '2', '2018-04-17 09:17', '0', '0', '/files/buildpic\\/2-1523927845-21500-0.jpg', '0.039094924926758');
INSERT INTO `ibt_sys_file` VALUES ('385', '21-1516085021-35261-0.jpg', '2-1523927850-97016-0.jpg', 'jpg', '2', '2018-04-17 09:17', '0', '0', '/files/buildpic\\/2-1523927850-97016-0.jpg', '0.039094924926758');
INSERT INTO `ibt_sys_file` VALUES ('386', '21-1516069993-92939-0.jpg', '2-1523927852-64560-0.jpg', 'jpg', '2', '2018-04-17 09:17', '0', '0', '/files/buildpic\\/2-1523927852-64560-0.jpg', '0.039094924926758');
INSERT INTO `ibt_sys_file` VALUES ('387', '21-1516083972-15396-0.jpg', '2-1523927855-98954-0.jpg', 'jpg', '2', '2018-04-17 09:17', '0', '0', '/files/buildpic\\/2-1523927855-98954-0.jpg', '0.017516136169434');
INSERT INTO `ibt_sys_file` VALUES ('388', '21-1516083972-15396-0.jpg', '2-1523927862-76829-0.jpg', 'jpg', '2', '2018-04-17 09:17', '0', '0', '/files/buildpic\\/2-1523927862-76829-0.jpg', '0.017516136169434');
INSERT INTO `ibt_sys_file` VALUES ('389', '21-1516083972-15396-0.jpg', '2-1523927870-73609-0.jpg', 'jpg', '2', '2018-04-17 09:17', '0', '0', '/files/buildpic\\/2-1523927870-73609-0.jpg', '0.017516136169434');
INSERT INTO `ibt_sys_file` VALUES ('390', '21-1516070002-92872-0.jpg', '2-1523927872-21311-0.jpg', 'jpg', '2', '2018-04-17 09:17', '0', '0', '/files/buildpic\\/2-1523927872-21311-0.jpg', '0.012794494628906');
INSERT INTO `ibt_sys_file` VALUES ('391', '21-1516069993-92939-0.jpg', '2-1523927892-26343-0.jpg', 'jpg', '2', '2018-04-17 09:18', '0', '0', '/files/buildpic\\/2-1523927892-26343-0.jpg', '0.039094924926758');
INSERT INTO `ibt_sys_file` VALUES ('392', '21-1515578327-89142-0.jpg', '2-1523927893-30051-0.jpg', 'jpg', '2', '2018-04-17 09:18', '0', '0', '/files/buildpic\\/2-1523927893-30051-0.jpg', '0.01750659942627');
INSERT INTO `ibt_sys_file` VALUES ('393', '21-1516069993-92939-0.jpg', '2-1523927945-22822-0.jpg', 'jpg', '2', '2018-04-17 09:19', '0', '0', '/files/buildpic\\/2-1523927945-22822-0.jpg', '0.039094924926758');
INSERT INTO `ibt_sys_file` VALUES ('394', '21-1516083972-15396-0.jpg', '2-1523927947-1929-0.jpg', 'jpg', '2', '2018-04-17 09:19', '0', '0', '/files/buildpic\\/2-1523927947-1929-0.jpg', '0.017516136169434');
INSERT INTO `ibt_sys_file` VALUES ('395', '21-1516085057-20883-0.jpg', '2-1523927949-35080-0.jpg', 'jpg', '2', '2018-04-17 09:19', '0', '0', '/files/buildpic\\/2-1523927949-35080-0.jpg', '0.039094924926758');
INSERT INTO `ibt_sys_file` VALUES ('396', '478-1515751975-36002-0.png', '2-1523927952-46015-0.png', 'png', '2', '2018-04-17 09:19', '0', '0', '/files/buildpic\\/2-1523927952-46015-0.png', '0.0083675384521484');
INSERT INTO `ibt_sys_file` VALUES ('397', '21-1515578327-89142-0.jpg', '2-1523927957-66559-0.jpg', 'jpg', '2', '2018-04-17 09:19', '0', '0', '/files/buildpic\\/2-1523927957-66559-0.jpg', '0.01750659942627');
INSERT INTO `ibt_sys_file` VALUES ('398', '21-1516069993-92939-0.jpg', '2-1523928044-41330-0.jpg', 'jpg', '2', '2018-04-17 09:20', '0', '0', '/files/buildpic\\/2-1523928044-41330-0.jpg', '0.039094924926758');
INSERT INTO `ibt_sys_file` VALUES ('399', '21-1515578327-89142-0.jpg', '2-1523928066-68509-0.jpg', 'jpg', '2', '2018-04-17 09:21', '0', '0', '/files/buildpic\\/2-1523928066-68509-0.jpg', '0.01750659942627');
INSERT INTO `ibt_sys_file` VALUES ('400', '21-1516069993-92939-0.jpg', '2-1523928244-27884-0.jpg', 'jpg', '2', '2018-04-17 09:24', '0', '0', '/files/buildpic\\/2-1523928244-27884-0.jpg', '0.039094924926758');
INSERT INTO `ibt_sys_file` VALUES ('401', '21-1516083972-15396-0.jpg', '2-1523928414-22977-0.jpg', 'jpg', '2', '2018-04-17 09:26', '0', '0', '/files/buildpic\\/2-1523928414-22977-0.jpg', '0.017516136169434');
INSERT INTO `ibt_sys_file` VALUES ('402', '-1515389435-58615-0.png', '2-1523928426-32837-0.png', 'png', '2', '2018-04-17 09:27', '0', '0', '/files/buildpic\\/2-1523928426-32837-0.png', '0.019758224487305');
INSERT INTO `ibt_sys_file` VALUES ('403', '-1515492330-18564-0.jpg', '2-1523928438-61155-0.jpg', 'jpg', '2', '2018-04-17 09:27', '0', '0', '/files/buildpic\\/2-1523928438-61155-0.jpg', '0.05704402923584');
INSERT INTO `ibt_sys_file` VALUES ('404', '-1515569697-60321-0.jpg', '2-1523928446-22590-0.jpg', 'jpg', '2', '2018-04-17 09:27', '0', '0', '/files/buildpic\\/2-1523928446-22590-0.jpg', '0.077643394470215');
INSERT INTO `ibt_sys_file` VALUES ('405', '-1515468589-59161-0.png', '2-1523928449-88920-0.png', 'png', '2', '2018-04-17 09:27', '0', '0', '/files/buildpic\\/2-1523928449-88920-0.png', '0.4278039932251');
INSERT INTO `ibt_sys_file` VALUES ('406', '21-1516069993-92939-0.jpg', '2-1523928451-18638-0.jpg', 'jpg', '2', '2018-04-17 09:27', '0', '0', '/files/buildpic\\/2-1523928451-18638-0.jpg', '0.039094924926758');
INSERT INTO `ibt_sys_file` VALUES ('407', '21-1516069993-92939-0.jpg', '2-1523929215-73404-0.jpg', 'jpg', '2', '2018-04-17 09:40', '0', '0', '/files/buildpic\\/2-1523929215-73404-0.jpg', '0.039094924926758');
INSERT INTO `ibt_sys_file` VALUES ('408', '21-1516069993-92939-0.jpg', '2-1523930481-59928-0.jpg', 'jpg', '2', '2018-04-17 10:01', '0', '0', '/files/buildpic\\/2-1523930481-59928-0.jpg', '0.039094924926758');
INSERT INTO `ibt_sys_file` VALUES ('409', '21-1516083972-15396-0.jpg', '2-1523930676-73459-0.jpg', 'jpg', '2', '2018-04-17 10:04', '0', '0', '/files/buildpic\\/2-1523930676-73459-0.jpg', '0.017516136169434');
INSERT INTO `ibt_sys_file` VALUES ('410', '21-1515578327-89142-0.jpg', '2-1523942192-54987-0.jpg', 'jpg', '2', '2018-04-17 13:16', '0', '0', '/files/buildpic\\/2-1523942192-54987-0.jpg', '0.01750659942627');
INSERT INTO `ibt_sys_file` VALUES ('411', '21-1515578327-89142-0.jpg', '2-1523942270-9092-0.jpg', 'jpg', '2', '2018-04-17 13:17', '0', '0', '/files/buildpic\\/2-1523942270-9092-0.jpg', '0.01750659942627');
INSERT INTO `ibt_sys_file` VALUES ('412', '21-1515578327-89142-0.jpg', '2-1523942523-24894-0.jpg', 'jpg', '2', '2018-04-17 13:22', '0', '0', '/files/buildpic\\/2-1523942523-24894-0.jpg', '0.01750659942627');
INSERT INTO `ibt_sys_file` VALUES ('413', '21-1515578327-89142-0.jpg', '2-1523942570-24277-0.jpg', 'jpg', '2', '2018-04-17 13:22', '0', '0', '/files/buildpic\\/2-1523942570-24277-0.jpg', '0.01750659942627');
INSERT INTO `ibt_sys_file` VALUES ('414', '21-1515578327-89142-0.jpg', '2-1523942611-60987-0.jpg', 'jpg', '2', '2018-04-17 13:23', '0', '0', '/files/buildpic\\/2-1523942611-60987-0.jpg', '0.01750659942627');
INSERT INTO `ibt_sys_file` VALUES ('415', '21-1515578327-89142-0.jpg', '2-1523942680-3446-0.jpg', 'jpg', '2', '2018-04-17 13:24', '0', '0', '/files/buildpic\\/2-1523942680-3446-0.jpg', '0.01750659942627');
INSERT INTO `ibt_sys_file` VALUES ('416', '21-1515578327-89142-0.jpg', '2-1523942816-96787-0.jpg', 'jpg', '2', '2018-04-17 13:26', '0', '0', '/files/buildpic\\/2-1523942816-96787-0.jpg', '0.01750659942627');
INSERT INTO `ibt_sys_file` VALUES ('417', '21-1515578327-89142-0.jpg', '2-1523942849-69211-0.jpg', 'jpg', '2', '2018-04-17 13:27', '0', '0', '/files/buildpic\\/2-1523942849-69211-0.jpg', '0.01750659942627');
INSERT INTO `ibt_sys_file` VALUES ('418', '21-1515578327-89142-0.jpg', '2-1523942874-797-0.jpg', 'jpg', '2', '2018-04-17 13:27', '0', '0', '/files/buildpic\\/2-1523942874-797-0.jpg', '0.01750659942627');
INSERT INTO `ibt_sys_file` VALUES ('419', '21-1515578327-89142-0.jpg', '2-1523942944-90839-0.jpg', 'jpg', '2', '2018-04-17 13:29', '0', '0', '/files/buildpic\\/2-1523942944-90839-0.jpg', '0.01750659942627');
INSERT INTO `ibt_sys_file` VALUES ('420', '21-1516069993-92939-0.jpg', '2-1523942947-22126-0.jpg', 'jpg', '2', '2018-04-17 13:29', '0', '0', '/files/buildpic\\/2-1523942947-22126-0.jpg', '0.039094924926758');
INSERT INTO `ibt_sys_file` VALUES ('421', '21-1516083972-15396-0.jpg', '2-1523942963-6598-0.jpg', 'jpg', '2', '2018-04-17 13:29', '0', '0', '/files/buildpic\\/2-1523942963-6598-0.jpg', '0.017516136169434');
INSERT INTO `ibt_sys_file` VALUES ('422', '-1515388581-73876-0.jpg', '2-1523942971-1401-0.jpg', 'jpg', '2', '2018-04-17 13:29', '0', '0', '/files/buildpic\\/2-1523942971-1401-0.jpg', '0.013291358947754');
INSERT INTO `ibt_sys_file` VALUES ('423', '-1515565495-15912-0.png', '2-1523956484-45313-0.png', 'png', '2', '2018-04-17 17:14', '0', '0', '/files/buildpic\\/2-1523956484-45313-0.png', '0.15880012512207');
INSERT INTO `ibt_sys_file` VALUES ('424', '-1515663723-93968-0.jpg', '2-1524037728-23945-0.jpg', 'jpg', '2', '2018-04-18 15:48', '0', '0', '/files/buildpic//2-1524037728-23945-0.jpg', '0.053804397583008');
INSERT INTO `ibt_sys_file` VALUES ('425', '-1515663723-93968-0.jpg', '2-1524037739-21701-0.jpg', 'jpg', '2', '2018-04-18 15:48', '0', '0', '/files/buildpic//2-1524037739-21701-0.jpg', '0.053804397583008');
INSERT INTO `ibt_sys_file` VALUES ('426', '-1515663723-93968-0.jpg', '2-1524037744-53743-0.jpg', 'jpg', '2', '2018-04-18 15:49', '0', '0', '/files/buildpic//2-1524037744-53743-0.jpg', '0.053804397583008');
INSERT INTO `ibt_sys_file` VALUES ('427', '软件测试_田珍慧.docx', '2-1524467601-81202-0.docx', 'docx', '2', '2018-04-23 15:13', '0', '0', '/files/default//2-1524467601-81202-0.docx', '0.17317581176758');
INSERT INTO `ibt_sys_file` VALUES ('428', 'u=2313565743,3593633298&fm=173&app=25&f=JPEG.jpg', '2-1524473551-37580-0.jpg', 'jpg', '2', '2018-04-23 16:52', '0', '0', '/files/buildpic//2-1524473551-37580-0.jpg', '0.0056352615356445');
INSERT INTO `ibt_sys_file` VALUES ('429', '21-1516089965-65356-0.jpg', '2-1524535806-1679-0.jpg', 'jpg', '2', '2018-04-24 10:10', '0', '0', '/files/buildpic//2-1524535806-1679-0.jpg', '0.0085000991821289');
INSERT INTO `ibt_sys_file` VALUES ('430', 'image.png', '2-1524548825-80479-0.png', 'png', '2', '2018-04-24 13:47', '0', '0', '/files//notice//2-1524548825-80479-0.png', '0.39282035827637');
INSERT INTO `ibt_sys_file` VALUES ('431', 'night.jpg', '2-1524560035-8268-0.jpg', 'jpg', '2', '2018-04-24 16:53', '0', '0', '/files//notice//2-1524560035-8268-0.jpg', '3.1309289932251');
INSERT INTO `ibt_sys_file` VALUES ('432', 'u=1021857289,1532312388&fm=173&app=25&f=JPEG.jpg', '2-1524618206-64455-0.jpg', 'jpg', '2', '2018-04-25 09:03', '0', '0', '/files/buildpic//2-1524618206-64455-0.jpg', '0.0041770935058594');
INSERT INTO `ibt_sys_file` VALUES ('433', 'TIM截图20171215125026.png', '2-1524623593-97322-0.png', 'png', '2', '2018-04-25 10:33', '0', '0', '/files/buildpic//2-1524623593-97322-0.png', '0.024099349975586');
INSERT INTO `ibt_sys_file` VALUES ('434', 'TIM截图20180227092403.png', '2-1524623620-26405-0.png', 'png', '2', '2018-04-25 10:33', '0', '0', '/files/buildpic//2-1524623620-26405-0.png', '0.068340301513672');

-- ----------------------------
-- Table structure for ibt_sys_history
-- ----------------------------
DROP TABLE IF EXISTS `ibt_sys_history`;
CREATE TABLE `ibt_sys_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `actionId` int(11) DEFAULT '0' COMMENT '操作记录ID',
  `field` varchar(128) DEFAULT NULL COMMENT '字段',
  `old` text COMMENT '原值',
  `new` text COMMENT '新值',
  `isDelete` int(2) DEFAULT '0',
  `iqbtId` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='修改记录';

-- ----------------------------
-- Records of ibt_sys_history
-- ----------------------------

-- ----------------------------
-- Table structure for ibt_user
-- ----------------------------
DROP TABLE IF EXISTS `ibt_user`;
CREATE TABLE `ibt_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) DEFAULT '1' COMMENT '对应role表ID 1维护员2管理员3企业',
  `name` varchar(128) DEFAULT '' COMMENT '登录名（默认为手机号）',
  `password` varchar(128) DEFAULT '',
  `realname` varchar(128) DEFAULT '' COMMENT '真实姓名',
  `etprsId` int(11) DEFAULT '0' COMMENT '企业ID',
  `iqbtId` varchar(255) DEFAULT '',
  `lastloginIp` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `lastloginTime` int(11) DEFAULT '0' COMMENT '最后登录时间',
  `loginerrTime` int(11) DEFAULT '0' COMMENT '错误登录次数',
  `lastupdateTime` int(11) DEFAULT '0' COMMENT '最后修改时间',
  `addtime` int(11) DEFAULT '0' COMMENT '注册时间',
  `adduserId` int(11) NOT NULL DEFAULT '0' COMMENT '11',
  `type` varchar(128) DEFAULT '' COMMENT '用户类型',
  `status` varchar(128) DEFAULT '' COMMENT '用户状态',
  `mobile` varchar(128) DEFAULT '' COMMENT '联系电话',
  `email` varchar(128) DEFAULT '' COMMENT '电子邮件',
  `openId` varchar(128) DEFAULT '' COMMENT '公众号对应的openID',
  `token` varchar(128) DEFAULT '' COMMENT 'app对应的token',
  `jpush_rgst_id` varchar(128) DEFAULT '' COMMENT '极光推送ID 后期app使用',
  `avatar` int(11) DEFAULT '0' COMMENT '头像',
  `isDelete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  `qrcodeId` int(11) DEFAULT '0' COMMENT '微信二维码',
  `qr_img` varchar(255) DEFAULT '' COMMENT '微信二维码',
  PRIMARY KEY (`id`),
  KEY `user_name` (`name`),
  KEY `user_iqbtId` (`iqbtId`),
  KEY `user_isDelete` (`isDelete`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of ibt_user
-- ----------------------------
INSERT INTO `ibt_user` VALUES ('1', '4', 'admin', '202cb962ac59075b964b07152d234b70', '管理员', '0', '0', '', '1524708840', '0', '1524708840', '0', '0', '6019004', '6018001', '', '', '', '', '', '0', '0', '0', '');
INSERT INTO `ibt_user` VALUES ('2', '2', '18888888888', '21218cca77804d2ba1922c33e0151105', '张震', '0', '1', '', '1524713619', '0', '1524713619', '1521106064', '1', '6019001', '6018001', '18888888888', '', '', '', '', '408', '0', '0', '');
INSERT INTO `ibt_user` VALUES ('3', '3', '15615555555', '21218cca77804d2ba1922c33e0151105', '王洪涛', '3', '1', '', '1524706818', '0', '1524706818', '1521106415', '2', '6019002', '6018001', '15615555555', '', '', '', '', '376', '0', '0', '');
INSERT INTO `ibt_user` VALUES ('4', '1', '18763902773', '21218cca77804d2ba1922c33e0151105', '123456', '0', '', '', '1521695091', '0', '1521695091', '1521163680', '1', '6019003', '6018001', '18763902773', '', '', '', '', '0', '0', '0', '');
INSERT INTO `ibt_user` VALUES ('16', '3', '15166666727', '21218cca77804d2ba1922c33e0151105', '陈霄', '1', '1', '', '1521687913', '0', '1521687913', '1521426487', '2', '6019002', '6018001', '15166666727', '', '', '', '', '0', '0', '0', '');
INSERT INTO `ibt_user` VALUES ('18', '2', '18952656466', '21218cca77804d2ba1922c33e0151105', '邰东方', '0', '1', '', '1521854487', '0', '1521854534', '1521446882', '2', '6019001', '6018003', '18952656466', '', '', '', '', '0', '0', '0', '');
INSERT INTO `ibt_user` VALUES ('23', '2', '18202871673', '21218cca77804d2ba1922c33e0151105', '刘女士', '0', '1', '', '1522036117', '0', '1524619938', '1521682610', '2', '6019001', '6018003', '18202871673', '', '', '', '', '0', '0', '0', '');
INSERT INTO `ibt_user` VALUES ('24', '3', '15726426715', '21218cca77804d2ba1922c33e0151105', '张凯', '12', '1', '', '0', '0', '1521684361', '1521684361', '2', '6019002', '6018001', '15726426715', '', '', '', '', '0', '0', '0', '');
INSERT INTO `ibt_user` VALUES ('27', '1', '13021663989', '21218cca77804d2ba1922c33e0151105', '张志坤', '0', '', '', '1521709819', '0', '1521709819', '1521695421', '1', '6019003', '6018001', '13021663989', '', '', '', '', '0', '0', '0', '');
INSERT INTO `ibt_user` VALUES ('29', '3', '18354332531', '21218cca77804d2ba1922c33e0151105', '李鹏', '19', '1', '', '1521765490', '0', '1521765490', '1521704022', '2', '6019002', '6018001', '18354332531', '', '', '', '', '0', '0', '0', '');
INSERT INTO `ibt_user` VALUES ('30', '3', '13688225464', '21218cca77804d2ba1922c33e0151105', '张冲', '17', '1', '', '0', '0', '1521704458', '1521704458', '2', '6019002', '6018001', '13688225464', '', '', '', '', '0', '0', '0', '');
INSERT INTO `ibt_user` VALUES ('31', '3', '0532-88888888', '21218cca77804d2ba1922c33e0151105', '丁磊', '21', '1', '', '1521705984', '0', '1521705984', '1521705877', '2', '6019002', '6018001', '0532-88888888', '', '', '', '', '0', '0', '0', '');
INSERT INTO `ibt_user` VALUES ('32', '3', '0532-88635431', '21218cca77804d2ba1922c33e0151105', '图文', '22', '1', '', '1521707331', '0', '1521707331', '1521707319', '2', '6019002', '6018001', '0532-88635431', '', '', '', '', '0', '0', '0', '');
INSERT INTO `ibt_user` VALUES ('33', '3', '88665321', '21218cca77804d2ba1922c33e0151105', '王迪', '18', '1', '', '0', '0', '1521708444', '1521708444', '2', '6019002', '6018001', '88665321', '', '', '', '', '0', '0', '0', '');
INSERT INTO `ibt_user` VALUES ('34', '2', '18878982225', '21218cca77804d2ba1922c33e0151105', '张裕祥', '0', '8', '', '1524541050', '0', '1524541050', '1521710041', '27', '6019001', '6018001', '18878982225', '', '', '', '', '0', '0', '0', '');
INSERT INTO `ibt_user` VALUES ('35', '3', '13766985431', '21218cca77804d2ba1922c33e0151105', '刘北永', '23', '1', '', '1524547000', '0', '1524547000', '1521768324', '2', '6019002', '6018001', '13766985431', '', '', '', '', '0', '0', '0', '');
INSERT INTO `ibt_user` VALUES ('36', '3', '18605321366', '21218cca77804d2ba1922c33e0151105', '孙明', '9', '1', '', '0', '0', '1521768416', '1521768416', '2', '6019002', '6018001', '18605321366', '', '', '', '', '0', '0', '0', '');
INSERT INTO `ibt_user` VALUES ('37', '3', '13280803195', '21218cca77804d2ba1922c33e0151105', '李洪国', '11', '1', '', '0', '0', '1521773633', '1521773633', '2', '6019002', '6018001', '13280803195', '', '', '', '', '0', '0', '0', '');
INSERT INTO `ibt_user` VALUES ('38', '3', '18561913562', '21218cca77804d2ba1922c33e0151105', '阿斯蒂芬', '24', '1', '', '0', '0', '1521788199', '1521788199', '2', '6019002', '6018001', '18561913562', '', '', '', '', '0', '0', '0', '');
INSERT INTO `ibt_user` VALUES ('39', '3', '13688635622', '21218cca77804d2ba1922c33e0151105', '赵涛', '16', '1', '', '1524537588', '0', '1524537588', '1521855180', '2', '6019002', '6018001', '13688635622', '', '', '', '', '0', '0', '0', '');
INSERT INTO `ibt_user` VALUES ('40', '2', '13800000000', '21218cca77804d2ba1922c33e0151105', '周超', '0', '9', '', '1522036171', '0', '1522036171', '1521861087', '1', '6019001', '6018001', '13800000000', '', '', '', '', '0', '0', '0', '');
INSERT INTO `ibt_user` VALUES ('41', '3', '0532-88635421', '21218cca77804d2ba1922c33e0151105', '刘丹', '26', '9', '', '1521874751', '0', '1521874751', '1521871168', '40', '6019002', '6018001', '0532-88635421', '', '', '', '', '0', '0', '0', '');
INSERT INTO `ibt_user` VALUES ('42', '2', '13927470617', '21218cca77804d2ba1922c33e0151105', '纳微创谷', '0', '1', '', '0', '0', '1524619853', '1522029193', '2', '6019001', '6018003', '13927470617', '', '', '', '', '0', '0', '0', '');
INSERT INTO `ibt_user` VALUES ('43', '2', '18985133455', '21218cca77804d2ba1922c33e0151105', '蒋总', '0', '1', '', '1524547043', '0', '1524619887', '1522029658', '2', '6019001', '6018003', '18985133455', '', '', '', '', '0', '0', '0', '');
INSERT INTO `ibt_user` VALUES ('44', '2', '15064803290', '21218cca77804d2ba1922c33e0151105', '陈女士', '0', '1', '', '0', '0', '1524619869', '1522030866', '2', '6019001', '6018003', '15064803290', '', '', '', '', '0', '0', '0', '');
INSERT INTO `ibt_user` VALUES ('45', '2', '15049400123', '21218cca77804d2ba1922c33e0151105', '天骄众创园', '0', '1', '', '1522047193', '0', '1524619846', '1522032986', '2', '6019001', '6018003', '15049400123', '', '', '', '', '0', '0', '0', '');
INSERT INTO `ibt_user` VALUES ('46', '2', '18912143577', '21218cca77804d2ba1922c33e0151105', '江苏两岸创客家孵化器运营管理有限公司', '0', '1', '', '1523412427', '0', '1524619861', '1522034586', '2', '6019001', '6018003', '18912143577', '', '', '', '', '0', '0', '0', '');
INSERT INTO `ibt_user` VALUES ('47', '2', '15277063457', '21218cca77804d2ba1922c33e0151105', '覃伟枝', '0', '8', '', '1522045585', '0', '1522045585', '1522045563', '34', '6019001', '6018001', '15277063457', '', '', '', '', '0', '0', '0', '');
INSERT INTO `ibt_user` VALUES ('48', '2', '15677177869', '21218cca77804d2ba1922c33e0151105', '陆丽月', '0', '8', '', '1522053320', '0', '1522053320', '1522046115', '47', '6019001', '6018001', '15677177869', '', '', '', '', '0', '0', '0', '');
INSERT INTO `ibt_user` VALUES ('49', '2', '13826064628', '21218cca77804d2ba1922c33e0151105', '陈玉美', '0', '8', '', '1522049709', '0', '1522049709', '1522048872', '47', '6019001', '6018001', '13826064628', '', '', '', '', '0', '0', '0', '');
INSERT INTO `ibt_user` VALUES ('50', '2', '17767106138', '21218cca77804d2ba1922c33e0151105', '商女士', '0', '1', '', '1522142307', '0', '1524619883', '1522142287', '2', '6019001', '6018003', '17767106138', '', '', '', '', '0', '0', '0', '');
INSERT INTO `ibt_user` VALUES ('52', '2', '17777777777', '21218cca77804d2ba1922c33e0151105', '阿萨德发', '0', '14', '', '1522284577', '0', '1523429592', '1522213696', '0', '6019001', '6018001', '17777777777', '', '', '', '', '0', '0', '0', '');
INSERT INTO `ibt_user` VALUES ('53', '1', '', '', '', '0', '', '', '0', '0', '0', '0', '0', '', '', '', '', '', '', '', '0', '0', '0', '');
INSERT INTO `ibt_user` VALUES ('54', '2', '17799999999', '21218cca77804d2ba1922c33e0151105', '', '0', '', '', '1522236653', '0', '1522236653', '1522236613', '0', '6019001', '6018004', '17799999999', '', '', '', '', '0', '0', '0', '');
INSERT INTO `ibt_user` VALUES ('55', '2', '17777777777', '21218cca77804d2ba1922c33e0151105', '', '0', '', '', '0', '0', '1522238900', '1522238900', '0', '6019001', '6018004', '17777777777', '', '', '', '', '0', '0', '0', '');
INSERT INTO `ibt_user` VALUES ('56', '2', '15655556666', '21218cca77804d2ba1922c33e0151105', '执照', '0', '15', '', '0', '0', '1522631450', '1522631450', '1', '6019001', '6018001', '15655556666', '', '', '', '', '0', '0', '0', '');
INSERT INTO `ibt_user` VALUES ('57', '2', '15666666666', '21218cca77804d2ba1922c33e0151105', '张三', '0', '16', '', '1523262874', '0', '1523262874', '1523261642', '0', '6019001', '6018001', '15666666666', '', '', '', '', '0', '0', '0', '');
INSERT INTO `ibt_user` VALUES ('59', '2', '15653217396', 'f379eaf3c831b04de153469d1bec345e', '1231', '0', '17', '', '1523270334', '0', '1523409424', '1523263561', '0', '6019001', '6018001', '15653217396', '', '', '', '', '0', '0', '0', '');
INSERT INTO `ibt_user` VALUES ('61', '2', '13730928572', '21218cca77804d2ba1922c33e0151105', '', '0', '', '', '0', '0', '1524032669', '1524032669', '0', '6019001', '6018004', '13730928572', '', '', '', '', '0', '0', '0', '');
INSERT INTO `ibt_user` VALUES ('62', '2', '18562712360', '21218cca77804d2ba1922c33e0151105', '', '0', '', '', '0', '0', '1524619517', '1524619517', '0', '6019001', '6018004', '18562712360', '', '', '', '', '0', '0', '0', '');
INSERT INTO `ibt_user` VALUES ('63', '2', '18678976835', '1e1ebb97b61d4bf50d4ca274ecd8eae2', '', '0', '19', '', '1524713620', '0', '1524713620', '1524652724', '0', '6019001', '6018005', '18678976835', '', '', '', '', '0', '0', '0', '');

-- ----------------------------
-- Table structure for ibt_user_menu
-- ----------------------------
DROP TABLE IF EXISTS `ibt_user_menu`;
CREATE TABLE `ibt_user_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '' COMMENT '菜单名称',
  `code` varchar(255) DEFAULT '',
  `parentId` int(11) DEFAULT '0' COMMENT '父菜单ID',
  `level` int(2) DEFAULT '1' COMMENT '菜单级别',
  `icon` varchar(50) DEFAULT NULL COMMENT 'icon图表',
  `isDelete` int(2) DEFAULT '0',
  `desc` varchar(1024) DEFAULT '' COMMENT '说明',
  `sort` int(5) DEFAULT '0' COMMENT '排序',
  `url` varchar(256) DEFAULT '' COMMENT '地址',
  `lastupdateTime` int(11) DEFAULT '0' COMMENT '最后修改时间',
  `addtime` int(11) DEFAULT '0' COMMENT '注册时间',
  `adduserId` int(11) DEFAULT '0' COMMENT '11',
  `ismenu` tinyint(2) DEFAULT '1' COMMENT '是否菜单。',
  `flag` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='角色菜单表 针对孵化器内部人员和企业用户，系统管理员';

-- ----------------------------
-- Records of ibt_user_menu
-- ----------------------------
INSERT INTO `ibt_user_menu` VALUES ('1', '系统菜单', '048', '0', '1', 'wb-grid-4', '0', '', '0', '', '1524703725', '1522804953', '1', '1', '');
INSERT INTO `ibt_user_menu` VALUES ('3', '招商管理', '04804', '1', '2', 'kehuguanli', '0', '', '0', '/customer/Customer/index', '1524703725', '1523872043', '1', '0', 'invest');
INSERT INTO `ibt_user_menu` VALUES ('4', '入驻管理', '04805', '1', '2', 'tubiaolunkuo-', '0', '', '0', '/etprs/etprs/etprslist', '1524703725', '1523875784', '1', '0', 'enter');
INSERT INTO `ibt_user_menu` VALUES ('5', '房间管理', '04806', '1', '2', 'wodefangjian', '0', '', '0', '/room/Room/roomInfo', '1524703725', '1523952671', '1', '0', 'room');
INSERT INTO `ibt_user_menu` VALUES ('8', '空间管理', '04807', '1', '2', 'tijikongjian-xianxing', '0', '', '0', '/iqbt/Iqbt/index', '1524703725', '1523953266', '1', '0', 'space');
INSERT INTO `ibt_user_menu` VALUES ('9', '活动管理', '04808', '1', '2', 'tubiao-', '0', '', '0', '#/activity/Activity/index', '1524703725', '1523953266', '1', '0', 'activity');
INSERT INTO `ibt_user_menu` VALUES ('10', '会议室', '04809', '1', '2', 'huiyishi', '0', '', '0', '/meetroom/Meetroom/mtroomlist', '1524703725', '1523953266', '1', '0', 'mtroom');
INSERT INTO `ibt_user_menu` VALUES ('11', '我的入驻', '048010', '1', '2', 'tijikongjian-xianxing', '0', '', '0', '/iqbt/Iqbt/myiqbt', '1524703725', '1523953266', '1', '0', 'kehuguanli');
INSERT INTO `ibt_user_menu` VALUES ('12', '活动报名', '048011', '1', '2', 'tubiao-', '0', '', '0', '/activity/Activity/etprsactlist', '1524703725', '1523953266', '1', '0', 'activity');
INSERT INTO `ibt_user_menu` VALUES ('13', '会议室', '048012', '1', '2', 'huiyishi', '0', '', '0', '/meetroom/Meetroom/mtroometprslist', '1524703725', '1523953266', '1', '0', 'mtroom');
INSERT INTO `ibt_user_menu` VALUES ('14', '空间管理', '048013', '1', '2', 'tijikongjian-xianxing', '0', '', '0', '/iqbt/Iqbt/iqbtlist', '1524703725', '1523953266', '1', '0', 'space');
INSERT INTO `ibt_user_menu` VALUES ('15', '系统设置', '044011', '1', '2', 'shezhi', '1', '', '0', '/user/User/myusers', '1524624181', '1523953266', '1', '0', 'cfg');
INSERT INTO `ibt_user_menu` VALUES ('16', '空间管理', '048014', '1', '2', 'tijikongjian-xianxing', '0', '', '0', '/iqbt/Iqbt/iqbtlist', '1524703725', '1523953266', '1', '0', 'space');
INSERT INTO `ibt_user_menu` VALUES ('17', '客户管理', '044013', '1', '2', 'kehuguanli', '1', '', '0', '/user/user/auditlist', '1524624181', '1523953266', '1', '0', 'customer');
INSERT INTO `ibt_user_menu` VALUES ('18', '系统设置', '044014', '1', '2', 'shezhi', '1', '', '0', '/user/User/users', '1524624181', '1523953266', '1', '0', 'cfg');
INSERT INTO `ibt_user_menu` VALUES ('19', '公告管理', '048015', '1', '2', 'remind', '0', '', '0', '/user/user/publicsay', '1524703725', '1524618258', '1', '0', 'notice');
INSERT INTO `ibt_user_menu` VALUES ('20', '用户管理', '048016', '1', '2', 'account', '0', '', '0', '/user/Index/sysuserlist', '1524703725', '1524618327', '1', '0', 'user');
INSERT INTO `ibt_user_menu` VALUES ('21', '用户管理', '048017', '1', '2', 'account', '0', '', '0', '/user/Index/iqbtuserlist', '1524703725', '1524618423', '1', '0', 'user');
INSERT INTO `ibt_user_menu` VALUES ('24', '用户管理', '048018', '1', '2', 'account', '0', '', '0', '/user/Index/userlist', '1524703725', '1524618777', '1', '0', 'user');
INSERT INTO `ibt_user_menu` VALUES ('25', '公告管理', '048019', '1', '2', 'remind', '0', '', '0', '/user/user/iqbtpublic', '1524703725', '1524623852', '1', '0', 'notice');
INSERT INTO `ibt_user_menu` VALUES ('27', '菜单管理', '048020', '1', '2', 'category', '0', '', '0', '/user/Index/menuinfo', '1524703725', '1524623882', '1', '0', 'menu');
INSERT INTO `ibt_user_menu` VALUES ('28', '工作台', '04801', '1', '2', 'gongzuotai', '0', '', '10000', '/user/user/bhd-index', '1524703725', '1524654662', '1', '0', 'plat');
INSERT INTO `ibt_user_menu` VALUES ('30', '工作台', '04803', '1', '2', 'gongzuotai', '0', '', '10000', '/work/Work/index', '1524703725', '1524654695', '1', '0', 'plat');
INSERT INTO `ibt_user_menu` VALUES ('31', '数据申报', '04802', '1', '2', 'service', '0', '', '0', '/iqbt/Iqbt/serview', '1524703725', '1524703725', '1', '0', 'torch');

-- ----------------------------
-- Table structure for ibt_user_role
-- ----------------------------
DROP TABLE IF EXISTS `ibt_user_role`;
CREATE TABLE `ibt_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(50) DEFAULT NULL COMMENT '角色名称',
  `menuIds` text COMMENT '菜单ID字符串 多个ID之间用 , 隔开',
  `desc` varchar(512) DEFAULT NULL COMMENT '说明',
  `isDelete` int(2) DEFAULT '0',
  `parentId` int(11) DEFAULT '0' COMMENT '父级角色ID',
  `level` int(2) DEFAULT '0' COMMENT '级别',
  `iqbtId` int(3) DEFAULT '0' COMMENT '孵化器ID',
  `sort` int(5) DEFAULT '0' COMMENT '排序',
  `lastupdateTime` int(11) DEFAULT '0' COMMENT '最后修改时间',
  `addtime` int(11) DEFAULT '0' COMMENT '注册时间',
  `adduserId` int(11) DEFAULT '0' COMMENT '11',
  `lock` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ibt_user_role
-- ----------------------------
INSERT INTO `ibt_user_role` VALUES ('1', '系统管理员', ',1,14,15,20,19', null, '0', '0', '0', '0', '0', '1524645698', '0', '0', '1');
INSERT INTO `ibt_user_role` VALUES ('2', '管理员', '3,4,5,6,7,8,10,1,21,22,23,25,26,30', null, '0', '0', '0', '0', '0', '1524654695', '0', '0', '1');
INSERT INTO `ibt_user_role` VALUES ('3', '企业用户', ',11,12,13,1,28,29,31', null, '0', '0', '0', '0', '0', '1524703725', '0', '0', '1');
INSERT INTO `ibt_user_role` VALUES ('4', '系统维护员', ',16,17,18,1,24,27', null, '0', '0', '0', '0', '0', '1524645698', '0', '0', '1');
INSERT INTO `ibt_user_role` VALUES ('7', '华北', '', null, '0', '1', '1', '0', '0', '1523952328', '1523935200', '1', '0');
