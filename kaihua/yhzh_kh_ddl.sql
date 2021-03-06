﻿-- ----------------------------
-- Table structure for `yh_user`用户表
-- ----------------------------
set character set utf8;
DROP TABLE IF EXISTS `yh_user`;
CREATE TABLE `yh_user` (
  `userid` varchar(12) NOT NULL COMMENT '用户id',
  `userenname` varchar(16) NOT NULL COMMENT '用户英文名',
  `usercnname` varchar(100) NOT NULL COMMENT '用户中文名',
  `roleid` varchar(12) DEFAULT NULL COMMENT '角色id',
  `password` varchar(200) NOT NULL COMMENT '密码',
  PRIMARY KEY (`userid`)
) COMMENT='用户表';

-- ----------------------------
-- 设备类型表(YH_DEV_TYPE)
-- ----------------------------
set character set utf8;
DROP TABLE IF EXISTS `YH_DEV_TYPE`;
CREATE TABLE `YH_DEV_TYPE` (
  `devTypeId` varchar(3) NOT NULL COMMENT '设备类型编号',
  `pareDevTypeId` varchar(3) DEFAULT NULL COMMENT '父设备编号',
  `devTypeName` varchar(100) NOT NULL COMMENT '设备类型名称',
  `isStoreHis` varchar(1) NOT NULL COMMENT '是否存储历史数据',
  `storeRate` int DEFAULT NULL COMMENT '数据存储频率(分钟)',
  `storeDays` int DEFAULT NULL COMMENT '数据存储时效(天数)',
  PRIMARY KEY (`devTypeId`)
) COMMENT='设备类型表';


-- ----------------------------
-- 设备类型属性表(YH_DEV_ATTR)
-- ----------------------------
set character set utf8;
DROP TABLE IF EXISTS `YH_DEV_ATTR`;
CREATE TABLE `YH_DEV_ATTR` (
  `devAttrId` varchar(16) NOT NULL COMMENT '属性编号(设备类型编号+3位编码)',
  `devtypeid` varchar(3) NOT NULL COMMENT '设备类型编号',
  `attrClass` varchar(60) DEFAULT NULL COMMENT '属性分类',
  `attrEnName` varchar(50) DEFAULT NULL COMMENT '属性英文名称',
  `attrCnName` varchar(50) NOT NULL COMMENT '属性中文名称',
  `attrUnit` varchar(20) DEFAULT NULL COMMENT '属性单位',
  `attrDict` varchar(60) DEFAULT NULL COMMENT '属性数据字典',
  `attrWidth` varchar(10) DEFAULT NULL COMMENT '列表宽度',
  `tabOrder` Int DEFAULT NULL COMMENT '列表展示顺序',
  PRIMARY KEY (`devAttrId`),
  INDEX(devtypeid)
) COMMENT='设备类型属性表';


-- ----------------------------
-- 设备信息表(YH_DEV_INFO)
-- ----------------------------
set character set utf8;
DROP TABLE IF EXISTS `YH_DEV_INFO`;
CREATE TABLE `YH_DEV_INFO` (
  `devId` varchar(16) NOT NULL COMMENT '设备编号',
  `pareDevId` varchar(16) DEFAULT NULL COMMENT '父设备编号',
  `devtypeid` varchar(3) NOT NULL COMMENT '设备类型编号',
  `devEnName` varchar(50) DEFAULT NULL COMMENT '设备英文名称',
  `devCnName` varchar(255) DEFAULT NULL COMMENT '设备中文名称',
  `devModel` varchar(255) DEFAULT NULL COMMENT '设备型号',
  `floor` varchar(16)  NOT NULL COMMENT '设备所在楼层',
  `location` varchar(100) DEFAULT NULL COMMENT '设备位置',
  PRIMARY KEY (`devId`),
  INDEX(devtypeid)
) COMMENT='设备信息表';

-- ----------------------------
-- 设备属性点映射表(YH_DEV_POINT_REF)
-- ----------------------------
set character set utf8;
DROP TABLE IF EXISTS `YH_DEV_POINT_REF`;
CREATE TABLE `YH_DEV_POINT_REF` (
  `adapterId` varchar(12) NOT NULL COMMENT '适配器编号',
  `controllerId` varchar(16) NOT NULL COMMENT '控制器编号',
  `pointId` varchar(20) NOT NULL COMMENT '点编号',
  `devId` varchar(16) NOT NULL COMMENT '设备编号',
  `devAttrId` varchar(16)  NOT NULL COMMENT '属性编号',
  PRIMARY KEY (`pointId`,`devId`),
  INDEX(devId),
  INDEX(devAttrId)
) COMMENT='设备属性点映射表';


-- ----------------------------
-- 序列号表(YH_SERIAL)
-- ----------------------------
set character set utf8;
DROP TABLE IF EXISTS `YH_SERIAL`;
CREATE TABLE `YH_SERIAL` (
  `tablekey` varchar(50) NOT NULL COMMENT '序列名',
  `currentNo` varchar(20) DEFAULT NULL COMMENT '当前序列号',
  `format` varchar(30) DEFAULT NULL COMMENT '格式，如c{yyyyMMddhhmmss}ddd',
  `currdate` varchar(20) DEFAULT NULL COMMENT '当前编号所在日期（格式为yyyymmdd）',
  PRIMARY KEY (`tablekey`)
) COMMENT='序列号表';


-- ----------------------------
-- 字典表(YH_DICT)
-- ----------------------------
set character set utf8;
DROP TABLE IF EXISTS `YH_DICT`;
CREATE TABLE `YH_DICT` (
  `dictname` varchar(60) NOT NULL COMMENT '字典名',
  `dictdesc` varchar(100) DEFAULT NULL COMMENT '字典描述',
  `mykey` varchar(50) DEFAULT NULL COMMENT '字典key',
  `val` varchar(255) DEFAULT NULL COMMENT '字典value',
  `myOrder` varchar(255) DEFAULT NULL COMMENT '顺序',
  UNIQUE INDEX IN_YH_DICT_1 (`dictname`,`mykey`)
) COMMENT='字典表';