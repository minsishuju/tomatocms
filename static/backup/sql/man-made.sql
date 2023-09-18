-- ----------------------------
-- 调整ay_config value的长度   v310之前版本使用
-- ----------------------------
ALTER TABLE `ay_config` MODIFY COLUMN `value` varchar(300) NOT NULL COMMENT '值';
-- ----------------------------
-- 栏目分类改造 修改ay_content_sort 增加栏目描述、简介、轮播图、新标签打开   v310之前版本使用
-- ----------------------------
alter table `ay_content_sort` ADD COLUMN `def3` varchar(1000) NOT NULL COMMENT '栏目描述3' AFTER `subname`;
alter table `ay_content_sort` ADD COLUMN `def2` varchar(1000) NOT NULL COMMENT '栏目描述2' AFTER `subname`;
alter table `ay_content_sort` ADD COLUMN `def1` varchar(1000) NOT NULL COMMENT '栏目描述1' AFTER `subname`;
alter table `ay_content_sort` ADD COLUMN `situation` varchar(1000) NOT NULL COMMENT '栏目简介' AFTER `def3`;
alter table `ay_content_sort` ADD COLUMN `mpic` varchar(255) NOT NULL COMMENT 'M栏目轮播图' AFTER `pic`;
alter table `ay_content_sort` ADD COLUMN `mpics` varchar(255) NOT NULL COMMENT 'M栏目轮播图' AFTER `mpic`;
alter table `ay_content_sort` ADD COLUMN `ppics` varchar(255) NOT NULL COMMENT 'PC栏目轮播图' AFTER `mpic`;
alter table `ay_content_sort` ADD COLUMN `istarget` char(1) NOT NULL COMMENT '新标签打开' AFTER `filename`;
alter table `ay_content_sort` ADD COLUMN `ispost` char(1) NOT NULL COMMENT '备用投稿' AFTER `filename`;
-- ----------------------------
-- 修改 ay_content  多图的标题  310 	之前版本使用
-- ----------------------------
alter table `ay_content` ADD COLUMN `picstitle` varchar(1000) NOT NULL COMMENT '多图片标题' AFTER `pics`;
-- ----------------------------
-- 修改 ay_site  移动端logo  310 	之前版本使用
-- ----------------------------
alter table `ay_site` ADD COLUMN `mlogo` varchar(100) NOT NULL COMMENT '移动端LOGO' AFTER `logo`;
-- ----------------------------
-- 修改 ay_slide  轮播图   310 	之前版本使用
-- ----------------------------
ALTER TABLE `ay_slide` ADD COLUMN `ico` varchar(100) NOT NULL COMMENT '移动端图片' AFTER `pic`;
ALTER TABLE `ay_slide` ADD COLUMN `desc` varchar(255) NOT NULL COMMENT '图片描述' AFTER `subtitle`;
ALTER TABLE `ay_slide` ADD COLUMN `status` tinyint(1) NOT NULL DEFAULT 1 AFTER `sorting`;

-- ----------------------------
-- 新增加广告分类
-- ----------------------------

DROP TABLE IF EXISTS `ay_slide_sort`;
CREATE TABLE `ay_slide_sort`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `acode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sorting` int(10) NOT NULL,
  `note` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ay_slide_sort
-- ----------------------------
INSERT INTO `ay_slide_sort` VALUES (1, 'cn', '首页banner图', 1, '可备注图片尺寸大小等信息', '', 'admin', 'admin', '2020-07-26 21:25:49', '2021-08-14 09:31:42');

-- ----------------------------
-- Table structure for ay_spider 3.15升级
-- ----------------------------
DROP TABLE IF EXISTS `ay_spider`;
CREATE TABLE `ay_spider`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '日志编号',
  `level` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '信息等级',
  `event` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '事件',
  `user_ip` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '客户端IP',
  `user_os` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户端系统',
  `user_bs` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户端浏览器',
  `create_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人员',
  `create_time` datetime NOT NULL COMMENT '添加时间',
  `type` int(10) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;
