/*
Navicat MySQL Data Transfer

Source Server         : 本机
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : sass

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-03-05 14:37:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ibt_activity
-- ----------------------------
DROP TABLE IF EXISTS `ibt_activity`;
CREATE TABLE `ibt_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '活动名称',
  `name` varchar(255) DEFAULT NULL,
  `districtId` int(11) DEFAULT '0' COMMENT '地区ID',
  `address` varchar(255) DEFAULT '' COMMENT '地址',
  `starttime` int(11) DEFAULT NULL COMMENT '开始时间',
  `endtime` int(11) DEFAULT '0' COMMENT '结束时间',
  `poster` int(11) DEFAULT '0' COMMENT '上传活动海报',
  `total` int(11) DEFAULT '0' COMMENT '人数 0-标示不限人数',
  `detail` text COMMENT '详情',
  `tags` varchar(255) DEFAULT '' COMMENT '活动标签',
  `free` varchar(255) DEFAULT '7002001' COMMENT '是否免费 7002',
  `price` decimal(11,2) DEFAULT '0.00' COMMENT '单价',
  `contact` varchar(50) DEFAULT '' COMMENT '主办方联系人',
  `mobile` varchar(50) DEFAULT NULL COMMENT '主办方电话',
  `email` varchar(255) DEFAULT NULL COMMENT '主办方邮箱',
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='活动表';

-- ----------------------------
-- Records of ibt_activity
-- ----------------------------

-- ----------------------------
-- Table structure for ibt_activity_apl
-- ----------------------------
DROP TABLE IF EXISTS `ibt_activity_apl`;
CREATE TABLE `ibt_activity_apl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `actId` int(11) DEFAULT '0' COMMENT '活动ID',
  `name` varchar(125) DEFAULT '' COMMENT '名称',
  `mobile` varchar(125) DEFAULT '' COMMENT '手机号',
  `etprs` varchar(125) DEFAULT '' COMMENT '企业名称',
  `sex` varchar(50) DEFAULT '7003001' COMMENT '性别7003',
  `status` varchar(50) DEFAULT '7001001' COMMENT '审核状态',
  `isDelete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  `lastupdateTime` int(11) DEFAULT '0' COMMENT '最后修改时间',
  `addtime` int(11) DEFAULT '0' COMMENT '注册时间',
  `adduserId` int(11) DEFAULT '0' COMMENT '11',
  `auditUserId` int(11) DEFAULT '0' COMMENT '审核人ID',
  `auditTime` int(11) DEFAULT '0' COMMENT '审核时间',
  `auditDesc` text COMMENT '审核备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='活动申请';

-- ----------------------------
-- Records of ibt_activity_apl
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='楼座楼层表';

-- ----------------------------
-- Records of ibt_build
-- ----------------------------
INSERT INTO `ibt_build` VALUES ('1', '1', '0', '1520211267', '1520211071', '1', '金座', '1', '14');
INSERT INTO `ibt_build` VALUES ('2', '1', '0', '1520211094', '1520211094', '1', '金座', '2', '0');
INSERT INTO `ibt_build` VALUES ('3', '1', '0', '1520211115', '1520211115', '1', '银座', '1', '0');
INSERT INTO `ibt_build` VALUES ('4', '1', '0', '1520211135', '1520211135', '1', '银座', '3', '0');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='客户表';

-- ----------------------------
-- Records of ibt_etprs
-- ----------------------------
INSERT INTO `ibt_etprs` VALUES ('1', '20180305测试01', '6003001', '20180305测试01', '15369858785', '6001002', '6002002', '6008005', '', '', '', '', '0', '0', '1520211011', '0', '0', '0', '1520211331', '1', '20180305测试01', '8', '0', '1', '0');
INSERT INTO `ibt_etprs` VALUES ('2', '20180305测试02', '6003001', '20180305测试02', '15369858786', '6001002', '6002002', '6008002', '', '', '', '', '0', '0', '1520211011', '0', '0', '0', '1520211331', '1', '20180305测试03', '8', '0', '1', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='房间变更记录表';

-- ----------------------------
-- Records of ibt_etprs_changelog
-- ----------------------------
INSERT INTO `ibt_etprs_changelog` VALUES ('1', '0', '1520211308', '1520211308', '1', '', '1', '1');
INSERT INTO `ibt_etprs_changelog` VALUES ('2', '0', '1520211369', '1520211369', '1', '1', '2', '1');

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
  `techdealnum` int(11) DEFAULT NULL COMMENT '技术合同交易数量',
  `techdeal` int(11) DEFAULT '0' COMMENT '技术合同交易额',
  `project` int(11) DEFAULT '0' COMMENT '当年承担国家科技计划项目数',
  `reward` int(11) DEFAULT '0' COMMENT '当年获取省级以上奖励 ',
  `highetprs` int(11) DEFAULT '0' COMMENT '是否高新企业 0:否 1：是',
  `rgsttime` varchar(50) DEFAULT '0' COMMENT '注册时间',
  `isMarket` tinyint(2) DEFAULT '0' COMMENT '是否新三板、蓝海上市 0:否  1：是',
  `lealPerson` varchar(50) DEFAULT NULL COMMENT '法人',
  `charter` varchar(255) DEFAULT NULL,
  `roFinace` varchar(255) DEFAULT '' COMMENT '融资轮次  sysdict 6014',
  `valuation` decimal(10,2) DEFAULT '0.00' COMMENT '当前估值',
  `etprsStatus` int(11) DEFAULT '0' COMMENT '企业状态 6015',
  `isMigrate` int(11) DEFAULT '0' COMMENT '0 否 1是',
  `isMerger` int(11) DEFAULT '0' COMMENT '0 否  1是',
  `isRgstHere` int(11) DEFAULT '0' COMMENT '知否注册在此 0 否  1是',
  `lastupdateTime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='企业信息扩展';

-- ----------------------------
-- Records of ibt_etprs_info
-- ----------------------------

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
  `pactTime` int(11) DEFAULT NULL COMMENT '合同时间统计  20180202自己加的，表中本来无此字段',
  `pactMoney` decimal(11,2) DEFAULT NULL COMMENT '此合同产生的费用  20180202自己加的  想计算下该合同价格',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='合同记录';

-- ----------------------------
-- Records of ibt_etprs_pactlog
-- ----------------------------
INSERT INTO `ibt_etprs_pactlog` VALUES ('1', '1', '1520265600', '1522857600', 'C88888888888888', '15', '0', '1520211369', '1520211308', '1', '30', '0.00');

-- ----------------------------
-- Table structure for ibt_etprs_quit
-- ----------------------------
DROP TABLE IF EXISTS `ibt_etprs_quit`;
CREATE TABLE `ibt_etprs_quit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `etprsId` int(11) DEFAULT '0',
  `roomIds` varchar(250) DEFAULT '0' COMMENT '对应 房间  estateRoom表',
  `quitdate` varchar(50) DEFAULT NULL COMMENT '申请退出时间',
  `renvtion` int(2) DEFAULT '0' COMMENT '是否二次装修 0-否 1-是',
  `renvtionremove` int(2) DEFAULT '0' COMMENT '二次装修是否拆除完毕 0-是 1-否',
  `isleave` int(2) DEFAULT '0' COMMENT '是否留下装修或物品 0-否 1-是',
  `desc` varchar(500) DEFAULT NULL COMMENT '遗留物品说明',
  `mobile` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `contact` varchar(50) DEFAULT NULL COMMENT '联系人',
  `status` int(11) DEFAULT '1028001' COMMENT 'dict表',
  `isDelete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  `lastupdateTime` int(11) DEFAULT '0' COMMENT '最后修改时间',
  `addtime` int(11) DEFAULT '0' COMMENT '注册时间',
  `adduserId` int(11) DEFAULT '0' COMMENT '11',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='退出申请';

-- ----------------------------
-- Records of ibt_etprs_quit
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='续约记录';

-- ----------------------------
-- Records of ibt_etprs_renew
-- ----------------------------

-- ----------------------------
-- Table structure for ibt_floor
-- ----------------------------
DROP TABLE IF EXISTS `ibt_floor`;
CREATE TABLE `ibt_floor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iqbtId` int(11) DEFAULT '0' COMMENT '20180303楼座表孵化器ID  新加字段',
  `isDelete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  `lastupdateTime` int(11) DEFAULT '0' COMMENT '最后修改时间',
  `addtime` int(11) DEFAULT '0' COMMENT '注册时间',
  `adduserId` int(11) DEFAULT '0' COMMENT '11',
  `buildId` int(11) DEFAULT '0' COMMENT '楼座ID 对应build',
  `floor` int(11) DEFAULT '0' COMMENT '楼层',
  `pic` int(11) DEFAULT '0' COMMENT '楼座展示图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='楼座楼层表';

-- ----------------------------
-- Records of ibt_floor
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户跟进';

-- ----------------------------
-- Records of ibt_flow
-- ----------------------------

-- ----------------------------
-- Table structure for ibt_incubator
-- ----------------------------
DROP TABLE IF EXISTS `ibt_incubator`;
CREATE TABLE `ibt_incubator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `address` varchar(256) DEFAULT NULL,
  `mobile` varchar(128) DEFAULT '' COMMENT '联系人',
  `leader` varchar(128) DEFAULT NULL COMMENT '负责人',
  `email` varchar(128) DEFAULT NULL,
  `createtime` varchar(50) DEFAULT '' COMMENT '创建时间',
  `etprsIqbtId` int(11) DEFAULT '0' COMMENT '对应etprs_iqbt表ID',
  `districtId` int(11) DEFAULT '0' COMMENT '区域ID',
  `status` int(11) DEFAULT '0' COMMENT '0-未认领 1-已认领 2-审核中 3-不对外显示',
  `aplnum` int(11) DEFAULT '0' COMMENT '孵化器认领前申请次数',
  `level` varchar(128) DEFAULT '' COMMENT '级别  dict 1031',
  `services` varchar(256) DEFAULT '' COMMENT '提供服务 dict 1032',
  `facility` varchar(256) DEFAULT '' COMMENT '配套设施 1033 dict',
  `property` varchar(128) DEFAULT '' COMMENT '孵化器属性dict 1041',
  `type` varchar(128) DEFAULT '' COMMENT '孵化器分类 dict 1034',
  `menuIds` text COMMENT '孵化器对应权限',
  `packageId` int(11) DEFAULT '0',
  `area` decimal(11,2) DEFAULT '0.00' COMMENT '占地面积',
  `roomarea` decimal(11,2) DEFAULT '0.00' COMMENT '房间面积',
  `unitnum` int(11) DEFAULT NULL COMMENT '工位数',
  `roomnum` int(11) DEFAULT '0' COMMENT '房间数',
  `domain` varchar(64) DEFAULT NULL COMMENT '绑定的域名，不带http',
  `bgimg` varchar(128) DEFAULT NULL COMMENT '背景图片',
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
  `idcard` int(11) DEFAULT NULL COMMENT '身份证',
  `ognzId` int(11) DEFAULT '0' COMMENT '协会ID',
  `spacepic` varchar(255) DEFAULT '' COMMENT '场地多图片 多个逗号分离',
  `poster` int(11) DEFAULT '0' COMMENT '场地封面图',
  `numberOffice` int(11) DEFAULT NULL COMMENT '办公人数',
  `isLock` int(11) DEFAULT '0' COMMENT '0展示  2锁定',
  `policyspt` tinyint(2) DEFAULT '0' COMMENT '是否政策支持 0-有 1-无',
  `policy` text COMMENT '政策支持',
  `fundtion` text COMMENT '基金',
  `isfundtion` tinyint(2) DEFAULT '0' COMMENT '是否有基金支持 0-有 1-无',
  `rgstspt` tinyint(2) DEFAULT '0' COMMENT '是否提供注册',
  `isDelete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  `lastupdateTime` int(11) DEFAULT '0' COMMENT '最后修改时间',
  `addtime` int(11) DEFAULT '0' COMMENT '注册时间',
  `adduserId` int(11) DEFAULT '0' COMMENT '11',
  `apltime` int(11) DEFAULT '0' COMMENT '申请时间，导入的项目没有申请时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='孵化器表';

-- ----------------------------
-- Records of ibt_incubator
-- ----------------------------
INSERT INTO `ibt_incubator` VALUES ('1', '海创汇', '山东青岛', '15365214521', null, null, '', '0', '231005', '0', '0', '', '6006002,6006003', '6005003', '', '请选择', null, '0', '0.00', '0.00', null, '0', null, null, '0', '62', '1', '6007003', '', '', '', '', '500', '123', '20', '0', 'qqq', '0', '', '500', '0.00', '0.00', null, '', '', null, '0', '', '61', null, '0', '0', '', '', '0', '0', '0', '1519643849', '0', '0', '0');

-- ----------------------------
-- Table structure for ibt_iqbt_case
-- ----------------------------
DROP TABLE IF EXISTS `ibt_iqbt_case`;
CREATE TABLE `ibt_iqbt_case` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iqbtId` int(11) DEFAULT '0',
  `name` varchar(255) DEFAULT '' COMMENT '孵化案例',
  `logo` varchar(255) DEFAULT '' COMMENT 'logo',
  `url` varchar(255) DEFAULT '' COMMENT '案例链接',
  `desc` text COMMENT '案例简介',
  `adduserId` int(11) DEFAULT '0',
  `addtime` int(11) DEFAULT '0',
  `isDelete` tinyint(2) DEFAULT '0',
  `lastupdateTime` int(11) DEFAULT '0' COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='孵化案例';

-- ----------------------------
-- Records of ibt_iqbt_case
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='环境照片';

-- ----------------------------
-- Records of ibt_iqbt_img
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
  `iqbtId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户操作记录';

-- ----------------------------
-- Records of ibt_log
-- ----------------------------
INSERT INTO `ibt_log` VALUES ('1', '1', '1', '正式分配房间', '0', '1520211308', '1520211308', '1', '6012009', 'etprs', '1', null);
INSERT INTO `ibt_log` VALUES ('2', '1', '1', '发起入驻-签约合同', '0', '1520211310', '1520211310', '1', '6012008', 'etprs', '1', null);
INSERT INTO `ibt_log` VALUES ('3', '1', '1', '房间变更', '0', '1520211369', '1520211369', '1', '6012007', 'etprs', '1', null);

-- ----------------------------
-- Table structure for ibt_mould
-- ----------------------------
DROP TABLE IF EXISTS `ibt_mould`;
CREATE TABLE `ibt_mould` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileId` int(11) DEFAULT '0',
  `title` varchar(128) DEFAULT NULL,
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='会议室';

-- ----------------------------
-- Records of ibt_mtroom
-- ----------------------------
INSERT INTO `ibt_mtroom` VALUES ('1', '会议室01', '1', '1', '6019003', '6016002', '会议室01', '7002002', '59.00', '7002001', '7002001', '0', '0', '0', '1');
INSERT INTO `ibt_mtroom` VALUES ('2', '会议室02', '1', '1', '6019004', '6016002', '会议室02', '7002001', '0.00', '7002001', '7002002', '0', '0', '0', '1');
INSERT INTO `ibt_mtroom` VALUES ('3', '会议室06', '1', '2', '6019005', '6016003', '大撒大撒大撒', '7002001', '0.00', '7002001', '7002002', '0', '1519783409', '1519783409', '1');
INSERT INTO `ibt_mtroom` VALUES ('4', '打撒对', '1', '2', '6019002', '6016003,6016004', '大萨达萨达', '7002001', '20.00', '7002001', '7002002', '0', '1519959380', '1519959380', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='会议室申请';

-- ----------------------------
-- Records of ibt_mtroom_apl
-- ----------------------------
INSERT INTO `ibt_mtroom_apl` VALUES ('1', '销售会议', '1', '1', '1519788600', '1519790400', '59.00', '59.00', '销售会议', '7001002', '0', null, '0', '0', '1520221095', '0', '1');
INSERT INTO `ibt_mtroom_apl` VALUES ('2', '财务会议', '2', '1', '1519797600', '1519799400', '59.00', '0.00', '财务会议', '7001002', '0', null, '0', '0', '1519975196', '0', '1');
INSERT INTO `ibt_mtroom_apl` VALUES ('3', '啊哈哈会议', '2', '1', '1519804800', '1519810200', '59.00', '0.00', '财务会议', '7001001', '0', '', '0', '0', '1520221104', '0', '1');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收藏';

-- ----------------------------
-- Records of ibt_mtroom_colect
-- ----------------------------

-- ----------------------------
-- Table structure for ibt_region
-- ----------------------------
DROP TABLE IF EXISTS `ibt_region`;
CREATE TABLE `ibt_region` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) DEFAULT NULL,
  `level` varchar(128) DEFAULT '',
  `provinceid` varchar(128) DEFAULT '',
  `cityid` varchar(128) DEFAULT '',
  `parentid` varchar(128) DEFAULT '',
  `isDelete` tinyint(2) DEFAULT '0',
  `haierId` int(11) DEFAULT '0',
  `code` varchar(50) DEFAULT '',
  `alsname` varchar(128) DEFAULT '' COMMENT '省的别名，为了跟地图对应',
  PRIMARY KEY (`id`)
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
  `roomNo` varchar(50) DEFAULT NULL COMMENT '房间编号',
  `area` decimal(11,2) DEFAULT NULL COMMENT '面积',
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
  `roomPics` varchar(255) DEFAULT '' COMMENT '20180203新增  房价图片 多个逗号隔开',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='物业-房屋分配管理 ';

-- ----------------------------
-- Records of ibt_room
-- ----------------------------
INSERT INTO `ibt_room` VALUES ('1', '0', '1', '1001', '20.00', '0', '1', '6011001', '0', '6009002', '20.00', '6010002', '400.00', '7002002', '0', '1520211369', '1520211071', '1', '9');
INSERT INTO `ibt_room` VALUES ('2', '1', '2', '2002', '0.00', '1', '1', '6011002', '2', '6009003', '10.00', '6010003', '300.00', '7002002', '0', '1520211369', '1520211094', '1', '10');
INSERT INTO `ibt_room` VALUES ('3', '0', '3', '1005', '20.00', '0', '1', '6011001', '0', '6009002', '202.00', '6010002', '4040.00', '7002002', '0', '1520211184', '1520211115', '1', '11');
INSERT INTO `ibt_room` VALUES ('4', '0', '4', '3005', '0.00', '1', '1', '6011002', '0', '6009004', '12.00', '6010002', '12.00', '7002002', '0', '1520211202', '1520211135', '1', '12,13');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='房间分配历史记录';

-- ----------------------------
-- Records of ibt_room_rcd
-- ----------------------------
INSERT INTO `ibt_room_rcd` VALUES ('1', '1', '1', '1', '1520265600', '1522857600', '1', '0', '1520211308', '1520211308', '1');
INSERT INTO `ibt_room_rcd` VALUES ('2', '1', '2', '1', '1520265600', '1522857600', '1', '0', '1520211369', '1520211369', '1');
INSERT INTO `ibt_room_rcd` VALUES ('3', '1', '1', '1', '1520265600', '1522857600', '2', '0', '1520211369', '1520211369', '1');

-- ----------------------------
-- Table structure for ibt_sms_log
-- ----------------------------
DROP TABLE IF EXISTS `ibt_sms_log`;
CREATE TABLE `ibt_sms_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '短信验证码ID',
  `iqbtId` int(11) DEFAULT NULL,
  `adduserId` int(11) DEFAULT NULL,
  `isDelete` tinyint(2) DEFAULT '0',
  `addtime` int(11) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号',
  `msg` varchar(100) DEFAULT NULL COMMENT '发送内容，验证码或者其他短信消息',
  `type` tinyint(2) DEFAULT '0' COMMENT '类型：0：注册短信验证， 其他类型待定  4、催发报表',
  `etprsId` int(11) DEFAULT NULL,
  `fromUserId` int(11) DEFAULT NULL COMMENT '来自哪个用户的ID',
  `toUserId` int(11) DEFAULT NULL COMMENT '给哪个用户发的',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='短信验证码表';

-- ----------------------------
-- Records of ibt_sms_log
-- ----------------------------

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
  `flag` varchar(50) DEFAULT '' COMMENT '标示，各字段根据自身情况而定',
  `isDelete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  `lastupdateTime` int(11) DEFAULT '0' COMMENT '最后修改时间',
  `addtime` int(11) DEFAULT '0' COMMENT '注册时间',
  `adduserId` int(11) DEFAULT '0' COMMENT '11',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8 COMMENT='系统字典表';

-- ----------------------------
-- Records of ibt_sys_dict
-- ----------------------------
INSERT INTO `ibt_sys_dict` VALUES ('1', '客户来源渠道', '6001', '1', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('2', '创8', '6001001', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('3', '电话咨询', '6001002', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('4', '老客户介绍', '6001003', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('5', '上门', '6001004', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('6', '客户状态', '6002', '1', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('7', '潜在客户', '6002001', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('8', '意向客户', '6002002', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('9', '拟入驻客户', '6002003', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('10', '无效客户', '6002004', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('11', '客户在忙,再联系', '6002001001', '3', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('12', '无法接通,再联系', '6002001002', '3', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('13', '已发资料考虑中', '6002002001', '3', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('14', '预约看房', '6002002002', '3', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('15', '已看房考虑中', '6002002003', '3', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('16', '客户敲定意向', '6002003001', '3', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('17', '无法联系', '6002004001', '3', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('18', '不来看房', '6002004002', '3', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('19', '已找到房', '6002004003', '3', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('20', '无法注册', '6002004004', '3', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('21', '位置不合适', '6002004005', '3', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('22', '预算太低', '6002004006', '3', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('23', '其他渠道已推', '6002004007', '3', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('24', '客户无需求', '6002004008', '3', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('25', '其他原因', '6002004009', '3', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('26', '客户类型', '6003', '1', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('27', '企业', '6003001', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('28', '团队', '6003002', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('29', '空间类型', '6004', '1', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('30', '创业园区', '6004001', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('31', '孵化器', '6004002', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('32', '大学科技园', '6004003', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('33', '众创空间', '6004004', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('34', '其他', '6004005', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('35', '配套设施', '6005', '1', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('36', '会议室', '6005001', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('37', '咖啡厅', '6005002', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('38', '公共前台', '6005003', '2', '', '1', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('39', '活动厅', '6005004', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('40', '洽谈区', '6005005', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('41', '休闲区', '6005006', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('42', '健身房', '6005007', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('43', '茶水区', '6005008', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('44', '餐厅', '6005009', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('45', '其他', '6005010', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('46', '提供服务', '6006', '1', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('47', '创业培训', '6006001', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('48', '创业咖啡', '6006002', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('49', '工商注册', '6006003', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('50', '财税服务', '6006004', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('51', '融资服务', '6006005', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('52', '人力服务', '6006006', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('53', '导师指导', '6006007', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('54', '法律服务', '6006008', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('55', '政务服务', '6006009', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('56', '金融服务', '6006010', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('57', '行政服务', '6006011', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('58', '营销推广', '6006012', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('59', '办公方式', '6007', '1', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('60', '办公室', '6007001', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('61', '工位', '6007002', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('62', '虚拟入驻', '6007003', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('63', '客户入驻状态', '6008', '1', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('64', '发起入驻前', '6008001', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('65', '发起入驻', '6008002', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('66', '房间分配', '6008003', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('67', '签约合同', '6008004', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('68', '正式入驻', '6008005', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('69', '已毕业', '6008006', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('70', '房间价格单位', '6009', '1', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('71', '元/平米/天', '6009001', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('72', '元/平米/月', '6009002', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('73', '元/工位/天', '6009003', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('74', '元/工位/月', '6009004', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('75', '元/间/月', '6009005', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('76', '房间装修情况', '6010', '1', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('77', '毛坯', '6010001', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('78', '简装', '6010002', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('79', '精装', '6010003', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('80', '豪装', '6010004', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('81', '遗留装修', '6010005', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('82', '房间类型', '6011', '1', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('83', '办公室', '6011001', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('84', '开放工位', '6011002', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('85', '提交审核状态', '7001', '1', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('86', '已提交', '7001001', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('87', '通过', '7001002', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('88', '拒绝', '7001003', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('89', '是否', '7002', '1', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('90', '是', '7002001', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('93', '否', '7002002', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('94', '性别', '7003', '1', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('95', '男', '7003001', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('100', '女', '7003002', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('101', '外景', '6005015', '2', '', '1', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('102', '公共前台', '6005016', '2', '', '1', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('103', '独立办公室', '6005017', '2', '', '1', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('104', '开放工位', '6005018', '2', '', '1', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('105', '日志代码', '6012', '1', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('106', '登录', '6012001', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('107', '编辑客户信息', '6012002', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('108', '跟进客户', '6012003', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('109', '导出客户', '6012004', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('110', '导入客户信息', '6012005', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('111', '新增客户', '6012006', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('112', '房间变更', '6012007', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('113', '发起入驻-签约合同', '6012008', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('114', '发起入驻-房间分配', '6012009', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('115', '添加入驻客户', '6012010', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('116', '客户续约', '6012011', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('117', '客户退出', '6012012', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('118', '完善扩展信息', '6012013', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('119', '编辑入驻客户信息', '6012014', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('120', '添加空间', '6012015', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('121', '修改空间信息', '6012016', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('122', '添加房间', '6012017', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('123', '导入房间信息', '6012018', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('124', '导出房间信息', '6012019', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('125', '编辑房间信息', '6012020', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('126', '删除房间', '6012021', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('127', '导入入驻客户', '6012022', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('128', '导出入驻客户', '6012023', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('129', '技术领域', '6013', '1', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('130', '电子信息', '601301', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('131', '先进制造', '601302', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('132', '航空航天', '601303', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('133', '现代交通', '601304', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('134', '生物医药与医疗器械', '601305', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('135', '新材料', '601306', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('136', '新能源与节能', '601307', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('137', '环境保护', '601308', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('138', '地球、空间与海洋', '601309', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('139', '核应用技术', '601310', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('140', '现代农业', '601311', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('141', '融资轮次', '6014', '1', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('142', '公司成立', '601401', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('143', '天使轮', '601402', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('144', 'Pre-A轮', '601403', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('145', 'A轮', '601404', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('146', 'B轮', '601405', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('147', 'C轮', '601406', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('148', 'D轮及以上', '601407', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('149', 'Pre-IPO', '601408', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('150', 'IPO', '601409', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('151', '企业状态', '6015', '1', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('152', '存续', '601501', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('153', '经营异常', '601502', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('154', '僵尸状态', '601503', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('155', '容纳人数', '6019', '1', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('156', '0-5人', '6019001', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('157', '6-10人', '6019002', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('158', '11-20人', '6019003', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('159', '20-50人', '6019004', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('160', '50人以上', '6019005', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('161', '已取消', '7001000', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('162', '会议室配套', '6016', '1', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('163', '桌椅', '6016001', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('164', '投影设备', '6016002', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('165', '移动白板', '6016003', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('166', '电视机', '6016004', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('167', '音响设备', '6016005', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('168', '其他', '6016006', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('169', '活动标签', '6017', '1', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('170', '创业', '6017001', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('171', '公益', '6017002', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('172', '亲子', '6017003', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('173', '科技', '6017004', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('174', '运动', '6017005', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('175', '互联网', '6017006', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('176', '音乐', '6017007', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('177', '交友', '6017008', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('178', '教育', '6017009', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('179', '校园', '6017010', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('180', '电影', '6017011', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('181', 'IT', '6017012', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('182', '健康', '6017013', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('183', '职场', '6017014', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('184', '文艺', '6017015', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('185', '户外', '6017016', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('186', '心理', '6017017', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('187', '金融', '6017018', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('188', '手工', '6017019', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('189', '营销', '6017020', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('190', '旅行', '6017021', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('191', '读书', '6017022', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('192', '电商', '6017023', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('193', '时尚', '6017024', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('194', '设计', '6017025', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('195', '游戏', '6017026', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('196', '用户状态', '6018', '1', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('197', '正常', '6018001', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('198', '异常', '6018002', '2', '', '0', '0', '0', '0');
INSERT INTO `ibt_sys_dict` VALUES ('199', '冻结', '6018003', '2', '', '0', '0', '0', '0');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='上传文件记录表';

-- ----------------------------
-- Records of ibt_sys_file
-- ----------------------------
INSERT INTO `ibt_sys_file` VALUES ('1', '项目计划书 _ 副本.pptx', '1-1519982160-52466-0.pptx', 'pptx', '1', '2018-03-02 17:16:00', '0', '0', '/files/default\\/1-1519982160-52466-0.pptx', '0');
INSERT INTO `ibt_sys_file` VALUES ('2', '项目计划书.pptx', '1-1519982260-19401-0.pptx', 'pptx', '1', '2018-03-02 17:17:40', '0', '0', '/files/default\\/1-1519982260-19401-0.pptx', '0');
INSERT INTO `ibt_sys_file` VALUES ('3', '20180223续约合同.png', '1-1519982579-97034-0.png', 'png', '1', '2018-03-02 17:22:59', '0', '0', '/files/default\\/1-1519982579-97034-0.png', '0.12979030609131');
INSERT INTO `ibt_sys_file` VALUES ('4', '404.png', '1-1519982605-58677-0.png', 'png', '1', '2018-03-02 17:23:25', '0', '0', '/files/default\\/1-1519982605-58677-0.png', '0.028461456298828');
INSERT INTO `ibt_sys_file` VALUES ('5', '1491902619617464.jpg', '1-1519983726-78687-0.jpg', 'jpg', '1', '2018-03-02 17:42:06', '0', '0', '/files/buildpic\\/1-1519983726-78687-0.jpg', '0.017516136169434');
INSERT INTO `ibt_sys_file` VALUES ('6', '1491902619617464.jpg', '1-1519983767-67396-0.jpg', 'jpg', '1', '2018-03-02 17:42:47', '0', '0', '/files/buildpic\\/1-1519983767-67396-0.jpg', '0.017516136169434');
INSERT INTO `ibt_sys_file` VALUES ('7', '1490197144760184.jpg', '1-1519983776-27482-0.jpg', 'jpg', '1', '2018-03-02 17:42:56', '0', '0', '/files/buildpic\\/1-1519983776-27482-0.jpg', '0.024412155151367');
INSERT INTO `ibt_sys_file` VALUES ('8', '项目计划书.pptx', '1-1520211006-70365-0.pptx', 'pptx', '1', '2018-03-05 08:50:06', '0', '0', '/files/default\\/1-1520211006-70365-0.pptx', '0');
INSERT INTO `ibt_sys_file` VALUES ('9', '1491902619617464.jpg', '1-1520211166-43329-0.jpg', 'jpg', '1', '2018-03-05 08:52:46', '0', '0', '/files/buildpic\\/1-1520211166-43329-0.jpg', '0.017516136169434');
INSERT INTO `ibt_sys_file` VALUES ('10', '1490197144760184.jpg', '1-1520211175-51145-0.jpg', 'jpg', '1', '2018-03-05 08:52:55', '0', '0', '/files/buildpic\\/1-1520211175-51145-0.jpg', '0.024412155151367');
INSERT INTO `ibt_sys_file` VALUES ('11', '404.png', '1-1520211183-63978-0.png', 'png', '1', '2018-03-05 08:53:03', '0', '0', '/files/buildpic\\/1-1520211183-63978-0.png', '0.028461456298828');
INSERT INTO `ibt_sys_file` VALUES ('12', '2.jpg', '1-1520211188-4923-0.jpg', 'jpg', '1', '2018-03-05 08:53:08', '0', '0', '/files/buildpic\\/1-1520211188-4923-0.jpg', '0.062335968017578');
INSERT INTO `ibt_sys_file` VALUES ('13', 'b.jpg', '1-1520211201-31827-0.jpg', 'jpg', '1', '2018-03-05 08:53:21', '0', '0', '/files/buildpic\\/1-1520211201-31827-0.jpg', '0.030880928039551');
INSERT INTO `ibt_sys_file` VALUES ('14', '1490197144760184.jpg', '1-1520211266-66413-0.jpg', 'jpg', '1', '2018-03-05 08:54:26', '0', '0', '/files/buildpic\\/1-1520211266-66413-0.jpg', '0.024412155151367');
INSERT INTO `ibt_sys_file` VALUES ('15', '20180223续约合同.png', '1-1520211328-90564-0.png', 'png', '1', '2018-03-05 08:55:28', '0', '0', '/files/default\\/1-1520211328-90564-0.png', '0.12979030609131');

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
  `name` varchar(128) DEFAULT '' COMMENT '登录名（默认为手机号）',
  `password` varchar(128) DEFAULT '',
  `realname` varchar(128) DEFAULT '' COMMENT '真实姓名',
  `etprsId` int(11) DEFAULT '0' COMMENT '企业ID',
  `iqbtId` int(11) DEFAULT '0',
  `lastloginIp` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `lastloginTime` int(11) DEFAULT '0' COMMENT '最后登录时间',
  `loginerrTime` int(11) DEFAULT '0' COMMENT '错误登录次数',
  `lastupdateTime` int(11) DEFAULT '0' COMMENT '最后修改时间',
  `addtime` int(11) DEFAULT '0' COMMENT '注册时间',
  `adduserId` int(11) DEFAULT '0' COMMENT '11',
  `type` varchar(128) DEFAULT '' COMMENT '用户类型',
  `status` varchar(128) DEFAULT '' COMMENT '用户状态',
  `mobile` varchar(128) DEFAULT '' COMMENT '联系电话',
  `email` varchar(128) DEFAULT '' COMMENT '电子邮件',
  `openId` varchar(128) DEFAULT '' COMMENT '公众号对应的openID',
  `token` varchar(128) DEFAULT '' COMMENT 'app对应的token',
  `jpush_rgst_id` varchar(128) DEFAULT '' COMMENT '极光推送ID 后期app使用',
  `avatar` int(11) DEFAULT '0' COMMENT '头像',
  `isDelete` tinyint(2) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of ibt_user
-- ----------------------------
INSERT INTO `ibt_user` VALUES ('1', 'lippor', '202cb962ac59075b964b07152d234b70', 'lippor', '1', '1', '', '1519983830', '0', '1519983830', '0', '0', '', '6018001', '18685878574', '', '', '', '', '0', '0');
INSERT INTO `ibt_user` VALUES ('12', '15369521541', '21218cca77804d2ba1922c33e0151105', '', '1', '0', '', '0', '0', '1519866485', '1519866485', '1', '', '6018001', '15369521541', '', '', '', '', '0', '0');
INSERT INTO `ibt_user` VALUES ('13', '15365258584', '21218cca77804d2ba1922c33e0151105', '', '4', '0', '', '0', '0', '1519889092', '1519889092', '1', '', '6018001', '15365258584', '', '', '', '', '0', '0');
INSERT INTO `ibt_user` VALUES ('14', '15254857854', '21218cca77804d2ba1922c33e0151105', '', '5', '0', '', '0', '0', '1519951531', '1519951531', '1', '', '6018001', '15254857854', '', '', '', '', '0', '0');
INSERT INTO `ibt_user` VALUES ('15', '15369685695', '21218cca77804d2ba1922c33e0151105', '', '1', '0', '', '0', '0', '1519982161', '1519982161', '1', '', '6018001', '15369685695', '', '', '', '', '0', '0');
INSERT INTO `ibt_user` VALUES ('16', '15685458451', '21218cca77804d2ba1922c33e0151105', '', '3', '0', '', '0', '0', '1519982261', '1519982261', '1', '', '6018001', '15685458451', '', '', '', '', '0', '0');
INSERT INTO `ibt_user` VALUES ('17', '15369858785', '21218cca77804d2ba1922c33e0151105', '', '1', '0', '', '0', '0', '1520211011', '1520211011', '1', '', '6018001', '15369858785', '', '', '', '', '0', '0');
