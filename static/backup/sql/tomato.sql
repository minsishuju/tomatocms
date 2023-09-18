/*
 Navicat Premium Data Transfer

 Source Server         : host mysql
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : localhost:3306
 Source Schema         : tomato

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 14/09/2023 10:23:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ay_area
-- ----------------------------
DROP TABLE IF EXISTS `ay_area`;
CREATE TABLE `ay_area`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '区域编号',
  `acode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区域编码',
  `pcode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区域父编码',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区域名称',
  `domain` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区域绑定域名',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否默认',
  `create_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加人员',
  `update_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新人员',
  `create_time` datetime NOT NULL COMMENT '添加时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ay_area_acode`(`acode`) USING BTREE,
  INDEX `ay_area_pcode`(`pcode`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ay_area
-- ----------------------------
INSERT INTO `ay_area` VALUES (1, 'cn', '0', '中文', '', '1', 'admin', 'admin', '2017-11-30 13:55:37', '2018-04-13 11:40:49');

-- ----------------------------
-- Table structure for ay_company
-- ----------------------------
DROP TABLE IF EXISTS `ay_company`;
CREATE TABLE `ay_company`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '站点编号',
  `acode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区域代码',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司名称',
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司地址',
  `postcode` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮政编码',
  `contact` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司联系人',
  `mobile` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号码',
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话号码',
  `fax` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司传真',
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电子邮箱',
  `qq` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司QQ',
  `weixin` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信图标',
  `blicense` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '营业执照代码',
  `other` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '其他信息',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ay_company_acode`(`acode`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ay_company
-- ----------------------------
INSERT INTO `ay_company` VALUES (1, 'cn', '湖南某某网络科技有限公司', '湖南长沙岳麓区雷锋大道888号', '410000', '谢先生', '13988886666', '0731-88886666', '0731-88886666', 'admin@pbootcms.com', '88886666', '/static/upload/image/20180715/1531651052464521.png', '91430102567888888G', '');

-- ----------------------------
-- Table structure for ay_config
-- ----------------------------
DROP TABLE IF EXISTS `ay_config`;
CREATE TABLE `ay_config`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `value` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '值',
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '配置类型',
  `sorting` int(10) UNSIGNED NOT NULL DEFAULT 255 COMMENT '排序',
  `description` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述文本',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ay_config_name`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 75 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ay_config
-- ----------------------------
INSERT INTO `ay_config` VALUES (1, 'close_site', '0', '2', 255, '是否关站');
INSERT INTO `ay_config` VALUES (2, 'close_site_note', '', '2', 255, '关站提示');
INSERT INTO `ay_config` VALUES (3, 'open_wap', '0', '1', 255, '手机版');
INSERT INTO `ay_config` VALUES (4, 'wap_domain', '', '2', 255, '手机绑定域名');
INSERT INTO `ay_config` VALUES (5, 'gzip', '0', '2', 255, 'GZIP压缩');
INSERT INTO `ay_config` VALUES (6, 'main_domain', '', '2', 255, '网站主域名');
INSERT INTO `ay_config` VALUES (7, 'to_main_domain', '0', '2', 255, '自动转主域名');
INSERT INTO `ay_config` VALUES (8, 'to_https', '0', '2', 255, '自动转HTTPS');
INSERT INTO `ay_config` VALUES (9, 'lgautosw', '1', '2', 255, '跨语言自动切换');
INSERT INTO `ay_config` VALUES (10, 'spiderlog', '1', '2', 255, '记录蜘蛛访问');
INSERT INTO `ay_config` VALUES (11, 'weixin_appid', '', '2', 255, '微信APPID');
INSERT INTO `ay_config` VALUES (12, 'weixin_secret', '', '2', 255, '微信SECRET');
INSERT INTO `ay_config` VALUES (13, 'baidu_zz_token', '', '2', 255, '百度普通收录token');
INSERT INTO `ay_config` VALUES (14, 'baidu_ks_token', '', '2', 255, '百度快速收录token');
INSERT INTO `ay_config` VALUES (15, 'content_tags_replace_num', '', '2', 255, '内容关键字替换次数');
INSERT INTO `ay_config` VALUES (16, 'content_keyword_replace', '', '2', 255, '敏感词过滤');
INSERT INTO `ay_config` VALUES (17, 'sn', '281BE285D7,35E9771A7C,01D786847D', '2', 255, '授权码');
INSERT INTO `ay_config` VALUES (18, 'sn_user', '', '2', 255, '万能授权码');
INSERT INTO `ay_config` VALUES (19, 'licensecode', 'MjgxQkUyODVENywzNUU5NzcxQTdDLDAxRDc4Njg0N0Qv8', '2', 255, '最终授权码');
INSERT INTO `ay_config` VALUES (20, 'smtp_server', 'smtp.qq.com', '2', 255, '邮件SMTP服务器');
INSERT INTO `ay_config` VALUES (21, 'smtp_port', '465', '2', 255, '邮件SMTP端口');
INSERT INTO `ay_config` VALUES (22, 'smtp_ssl', '1', '1', 255, '邮件是否安全连接');
INSERT INTO `ay_config` VALUES (23, 'smtp_username', '', '2', 255, '邮件发送账号');
INSERT INTO `ay_config` VALUES (24, 'smtp_password', '', '2', 255, '邮件发送密码');
INSERT INTO `ay_config` VALUES (25, 'smtp_username_test', '', '2', 255, '测试邮箱');
INSERT INTO `ay_config` VALUES (26, 'message_send_mail', '1', '1', 255, '留言发送邮件开关');
INSERT INTO `ay_config` VALUES (27, 'form_send_mail', '0', '2', 255, '表单发送邮件');
INSERT INTO `ay_config` VALUES (28, 'comment_send_mail', '0', '2', 255, '评论发送邮件');
INSERT INTO `ay_config` VALUES (29, 'message_send_to', '', '1', 255, '留言发送到邮箱');
INSERT INTO `ay_config` VALUES (30, 'ip_deny', '', '2', 255, 'IP黑名单');
INSERT INTO `ay_config` VALUES (31, 'ip_allow', '', '2', 255, 'IP白名单');
INSERT INTO `ay_config` VALUES (32, 'api_open', '0', '2', 255, 'API开关');
INSERT INTO `ay_config` VALUES (33, 'api_auth', '1', '2', 255, 'API强制认证');
INSERT INTO `ay_config` VALUES (34, 'api_appid', '', '2', 255, 'API认证用户');
INSERT INTO `ay_config` VALUES (35, 'api_secret', '', '2', 255, 'API认证密钥');
INSERT INTO `ay_config` VALUES (36, 'collect_password', '', '2', 255, '采集入库密码');
INSERT INTO `ay_config` VALUES (37, 'watermark_open', '0', '2', 255, '水印开关');
INSERT INTO `ay_config` VALUES (38, 'watermark_text', 'TomatoCMS', '2', 255, '水印文本');
INSERT INTO `ay_config` VALUES (39, 'watermark_text_font', '', '2', 255, '水印文本字体');
INSERT INTO `ay_config` VALUES (40, 'watermark_text_size', '20', '2', 255, '水印文本字号');
INSERT INTO `ay_config` VALUES (41, 'watermark_text_color', '100,100,100', '2', 255, '水印文本字体颜色');
INSERT INTO `ay_config` VALUES (42, 'watermark_pic', '/static/images/admin/logo.webp', '2', 255, '水印图片');
INSERT INTO `ay_config` VALUES (43, 'watermark_position', '4', '2', 255, '水印位置');
INSERT INTO `ay_config` VALUES (44, 'message_status', '1', '2', 255, '留言开关');
INSERT INTO `ay_config` VALUES (45, 'message_check_code', '1', '1', 255, '留言验证码');
INSERT INTO `ay_config` VALUES (46, 'message_verify', '1', '2', 255, '留言审核');
INSERT INTO `ay_config` VALUES (47, 'message_rqlogin', '1', '2', 255, '留言需登录');
INSERT INTO `ay_config` VALUES (48, 'form_status', '1', '2', 255, '表单开关');
INSERT INTO `ay_config` VALUES (49, 'form_check_code', '0', '2', 255, '表单验证码');
INSERT INTO `ay_config` VALUES (50, 'tpl_html_dir', 'html', '2', 255, '模板HTML目录');
INSERT INTO `ay_config` VALUES (51, 'admin_check_code', '1', '1', 255, '后台验证码');
INSERT INTO `ay_config` VALUES (52, 'lock_count', '5', '2', 255, '登陆锁定阈值');
INSERT INTO `ay_config` VALUES (53, 'lock_time', '900', '2', 255, '登录锁定时间');
INSERT INTO `ay_config` VALUES (54, 'url_rule_type', '2', '2', 255, '路径类型');
INSERT INTO `ay_config` VALUES (55, 'url_rule_content_path', '0', '2', 255, '文章路径');
INSERT INTO `ay_config` VALUES (56, 'safemodel', '1', '2', 255, '安全模式');
INSERT INTO `ay_config` VALUES (57, 'url_deny', '', '2', 255, 'URL标识黑名单');
INSERT INTO `ay_config` VALUES (58, 'url_allow', 'ivk,tag,ext,search,Spider', '2', 255, 'URL标识白名单');
INSERT INTO `ay_config` VALUES (59, 'manger_tpl', 'default', '1', 255, '后台模板');
INSERT INTO `ay_config` VALUES (60, 'systemtitle', '', '2', 255, '自定义系统名称');
INSERT INTO `ay_config` VALUES (61, 'system_logo', '/static/images/admin/logo.webp', '2', 255, '自定义系统logo');
INSERT INTO `ay_config` VALUES (62, 'login_pics', '/static/images/admin/bg-screen1.webp,/static/images/admin/bg-screen2.webp,/static/images/admin/bg-screen3.webp,/static/images/admin/bg-screen4.webp,/static/images/admin/bg-screen5.webp,/static/images/admin/bg-screen6.webp', '2', 255, '登录页背景图');
INSERT INTO `ay_config` VALUES (67, 'storage_type', 'qiniu', '2', 255, '存储策略');
INSERT INTO `ay_config` VALUES (68, 'qiniu_ak', '', '2', 255, '七牛云ak');
INSERT INTO `ay_config` VALUES (69, 'qiniu_sk', '', '2', 255, '七牛云sk');
INSERT INTO `ay_config` VALUES (70, 'qiniu_bucket', '', '2', 255, '七牛云空间名称');
INSERT INTO `ay_config` VALUES (71, 'qiniu_domain', '', '2', 255, '七牛云域名');
INSERT INTO `ay_config` VALUES (72, 'upgrade_branch', '3.X', '2', 255, '更新分支');
INSERT INTO `ay_config` VALUES (73, 'upgrade_force', '0', '2', 255, '强制文件同步');
INSERT INTO `ay_config` VALUES (74, 'upgrade_url', 'http://nav.hnek.net/', '2', 255, '');

-- ----------------------------
-- Table structure for ay_content
-- ----------------------------
DROP TABLE IF EXISTS `ay_content`;
CREATE TABLE `ay_content`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '编号',
  `acode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区域',
  `scode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容栏目',
  `subscode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '副栏目',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `titlecolor` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题颜色',
  `subtitle` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '副标题',
  `filename` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '自定义文件名',
  `author` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者',
  `source` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '来源',
  `outlink` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '外链地址',
  `date` datetime NOT NULL COMMENT '发布日期',
  `ico` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '缩略图',
  `pics` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '多图片',
  `picstitle` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '多图片标题',
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `tags` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'tag关键字',
  `enclosure` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '附件',
  `keywords` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关键字',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述',
  `sorting` int(10) UNSIGNED NOT NULL DEFAULT 255 COMMENT '内容排序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '状态',
  `istop` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否置顶',
  `isrecommend` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `isheadline` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否头条',
  `visits` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '访问数',
  `likes` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '点赞数',
  `oppose` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '反对数',
  `create_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人员',
  `update_user` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新人员',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `gtype` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '4',
  `gid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `gnote` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ay_content_unique`(`sorting`, `istop`, `isrecommend`, `isheadline`, `date`, `id`) USING BTREE,
  INDEX `ay_content_scode`(`scode`) USING BTREE,
  INDEX `ay_content_subscode`(`subscode`) USING BTREE,
  INDEX `ay_content_acode`(`acode`) USING BTREE,
  INDEX `ay_content_filename`(`filename`) USING BTREE,
  INDEX `ay_content_date`(`date`) USING BTREE,
  INDEX `ay_content_sorting`(`sorting`) USING BTREE,
  INDEX `ay_content_status`(`status`) USING BTREE,
  INDEX `ay_content_title_index`(`title`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ay_content
-- ----------------------------

-- ----------------------------
-- Table structure for ay_content_ext
-- ----------------------------
DROP TABLE IF EXISTS `ay_content_ext`;
CREATE TABLE `ay_content_ext`  (
  `extid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `contentid` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`extid`) USING BTREE,
  INDEX `ay_content_ext_contentid`(`contentid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = FIXED;

-- ----------------------------
-- Records of ay_content_ext
-- ----------------------------

-- ----------------------------
-- Table structure for ay_content_sort
-- ----------------------------
DROP TABLE IF EXISTS `ay_content_sort`;
CREATE TABLE `ay_content_sort`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '编号',
  `acode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区域编码',
  `mcode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容模型编码',
  `pcode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '父编码',
  `scode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类编码',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `listtpl` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '列表页模板',
  `contenttpl` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容页模板',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '状态',
  `outlink` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '转外链接',
  `subname` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '附加名称',
  `def1` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '栏目描述1',
  `def2` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '栏目描述2',
  `def3` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '栏目描述3',
  `situation` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '栏目简介',
  `ico` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类缩略图',
  `pic` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类大图',
  `mpic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'M栏目轮播图',
  `ppics` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'PC栏目轮播图',
  `mpics` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'M栏目轮播图',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'seo标题',
  `keywords` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类关键字',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类描述',
  `filename` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '自定义文件名',
  `ispost` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备用投稿',
  `istarget` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '新标签打开',
  `sorting` int(10) UNSIGNED NOT NULL DEFAULT 255 COMMENT '排序',
  `create_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人员',
  `update_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新人员',
  `gtype` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '4' COMMENT '权限类型',
  `gid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '浏览权限',
  `gnote` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '权限不足提示',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ay_content_sort_scode`(`scode`) USING BTREE,
  INDEX `ay_content_sort_pcode`(`pcode`) USING BTREE,
  INDEX `ay_content_sort_acode`(`acode`) USING BTREE,
  INDEX `ay_content_sort_mcode`(`mcode`) USING BTREE,
  INDEX `ay_content_sort_filename`(`filename`) USING BTREE,
  INDEX `ay_content_sort_sorting`(`sorting`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ay_content_sort
-- ----------------------------
INSERT INTO `ay_content_sort` VALUES (1, 'cn', '1', '0', '1', '公司简介', '', 'about.html', '1', '', '网站建设「一站式」服务商', '', '', '', '', '', '', '', '', '', '', '', '', 'aboutus', '', '', 255, 'admin', 'admin', '4', '', '', '2018-04-11 17:26:11', '2018-04-11 17:26:11');
INSERT INTO `ay_content_sort` VALUES (2, 'cn', '2', '0', '2', '新闻中心', 'newslist.html', 'news.html', '1', '', '了解最新公司动态及行业资讯', '', '', '', '', '', '', '', '', '', '', '', '', 'article', '', '', 255, 'admin', 'admin', '4', '', '', '2018-04-11 17:26:46', '2018-04-11 17:26:46');
INSERT INTO `ay_content_sort` VALUES (3, 'cn', '2', '2', '3', '公司动态', 'newslist.html', 'news.html', '1', '', '了解最新公司动态及行业资讯', '', '', '', '', '', '', '', '', '', '', '', '', 'company', '', '', 255, 'admin', 'admin', '4', '', '', '2018-04-11 17:27:05', '2018-04-11 17:27:05');
INSERT INTO `ay_content_sort` VALUES (4, 'cn', '2', '2', '4', '行业动态', 'newslist.html', 'news.html', '1', '', '了解最新公司动态及行业资讯', '', '', '', '', '', '', '', '', '', '', '', '', 'industry', '', '', 255, 'admin', 'admin', '4', '', '', '2018-04-11 17:27:30', '2018-04-11 17:27:30');
INSERT INTO `ay_content_sort` VALUES (5, 'cn', '3', '0', '5', '产品中心', 'productlist.html', 'product.html', '1', '', '服务创造价值、存在造就未来', '', '', '', '', '', '', '', '', '', '', '', '', 'product', '', '', 255, 'admin', 'admin', '4', '', '', '2018-04-11 17:27:54', '2018-04-11 17:27:54');
INSERT INTO `ay_content_sort` VALUES (6, 'cn', '3', '5', '6', '网站建设', 'productlist.html', 'product.html', '1', '', '服务创造价值、存在造就未来', '', '', '', '', '', '', '', '', '', '', '', '', 'website', '', '', 255, 'admin', 'admin', '4', '', '', '2018-04-11 17:28:19', '2018-04-11 17:28:19');
INSERT INTO `ay_content_sort` VALUES (7, 'cn', '3', '5', '7', '域名空间', 'productlist.html', 'product.html', '1', '', '服务创造价值、存在造就未来', '', '', '', '', '', '', '', '', '', '', '', '', 'domain', '', '', 255, 'admin', 'admin', '4', '', '', '2018-04-11 17:28:38', '2018-04-11 17:28:38');
INSERT INTO `ay_content_sort` VALUES (8, 'cn', '4', '0', '8', '服务案例', 'caselist.html', 'case.html', '1', '', '服务创造价值、存在造就未来', '', '', '', '', '', '', '', '', '', '', '', '', 'case', '', '', 255, 'admin', 'admin', '4', '', '', '2018-04-11 17:29:16', '2018-04-11 17:29:16');
INSERT INTO `ay_content_sort` VALUES (9, 'cn', '5', '0', '9', '招贤纳士', 'joblist.html', 'job.html', '1', '', '诚聘优秀人士加入我们的团队', '', '', '', '', '', '', '', '', '', '', '', '', 'job', '', '', 255, 'admin', 'admin', '4', '', '', '2018-04-11 17:30:02', '2018-04-11 17:30:02');
INSERT INTO `ay_content_sort` VALUES (10, 'cn', '1', '0', '10', '在线留言', '', 'message.html', '1', '', '有什么问题欢迎您随时反馈', '', '', '', '', '', '', '', '', '', '', '', '', 'gbook', '', '', 255, 'admin', 'admin', '4', '', '', '2018-04-11 17:30:36', '2018-04-12 10:55:31');
INSERT INTO `ay_content_sort` VALUES (11, 'cn', '1', '0', '11', '联系我们', '', 'about.html', '1', '', '能为您服务是我们的荣幸', '', '', '', '', '', '', '', '', '', '', '', '', 'contact', '', '', 255, 'admin', 'admin', '4', '', '', '2018-04-11 17:31:29', '2018-04-11 17:31:29');

-- ----------------------------
-- Table structure for ay_diy_telephone
-- ----------------------------
DROP TABLE IF EXISTS `ay_diy_telephone`;
CREATE TABLE `ay_diy_telephone`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ay_diy_telephone
-- ----------------------------

-- ----------------------------
-- Table structure for ay_extfield
-- ----------------------------
DROP TABLE IF EXISTS `ay_extfield`;
CREATE TABLE `ay_extfield`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '编号',
  `mcode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模型编码',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段名称',
  `type` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段类型',
  `value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单选或多选值',
  `description` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述文本',
  `sorting` int(11) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ay_extfield_mcode`(`mcode`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ay_extfield
-- ----------------------------

-- ----------------------------
-- Table structure for ay_form
-- ----------------------------
DROP TABLE IF EXISTS `ay_form`;
CREATE TABLE `ay_form`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '编号',
  `fcode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单编码',
  `form_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单名称',
  `table_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表名称',
  `create_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加人员',
  `update_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新人员',
  `create_time` datetime NOT NULL COMMENT '添加时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ay_form_fcode`(`fcode`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ay_form
-- ----------------------------
INSERT INTO `ay_form` VALUES (1, '1', '在线留言', 'ay_message', 'admin', 'admin', '2018-04-11 17:31:29', '2018-04-11 17:31:29');
INSERT INTO `ay_form` VALUES (2, '2', '搜集电话', 'ay_diy_telephone', 'admin', 'admin', '2018-11-30 15:17:40', '2018-11-30 15:17:40');

-- ----------------------------
-- Table structure for ay_form_field
-- ----------------------------
DROP TABLE IF EXISTS `ay_form_field`;
CREATE TABLE `ay_form_field`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '编号',
  `fcode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单编码',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段名称',
  `length` int(10) UNSIGNED NOT NULL COMMENT '字段长度',
  `required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否必填',
  `description` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述文本',
  `sorting` int(10) UNSIGNED NOT NULL DEFAULT 255 COMMENT '排序',
  `create_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加人员',
  `update_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新人员',
  `create_time` datetime NOT NULL COMMENT '添加时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ay_form_field_fcode`(`fcode`) USING BTREE,
  INDEX `ay_form_field_sorting`(`sorting`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ay_form_field
-- ----------------------------
INSERT INTO `ay_form_field` VALUES (1, '1', 'contacts', 10, '1', '联系人', 255, 'admin', 'admin', '2018-07-14 18:24:02', '2018-07-15 17:47:43');
INSERT INTO `ay_form_field` VALUES (2, '1', 'mobile', 12, '1', '手机', 255, 'admin', 'admin', '2018-07-14 18:24:02', '2018-07-15 17:47:44');
INSERT INTO `ay_form_field` VALUES (3, '1', 'content', 500, '1', '内容', 255, 'admin', 'admin', '2018-07-14 18:24:02', '2018-07-15 17:47:45');
INSERT INTO `ay_form_field` VALUES (4, '2', 'tel', 20, '1', '电话号码', 255, 'admin', 'admin', '2018-11-30 15:18:00', '2018-11-30 15:18:00');

-- ----------------------------
-- Table structure for ay_label
-- ----------------------------
DROP TABLE IF EXISTS `ay_label`;
CREATE TABLE `ay_label`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '值',
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '字段类型',
  `description` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述',
  `create_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人员',
  `update_user` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新人员',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ay_label
-- ----------------------------

-- ----------------------------
-- Table structure for ay_link
-- ----------------------------
DROP TABLE IF EXISTS `ay_link`;
CREATE TABLE `ay_link`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '序号',
  `acode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区域编码',
  `gid` int(10) UNSIGNED NOT NULL COMMENT '分组序号',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '链接名称',
  `link` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '跳转链接',
  `logo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片地址',
  `sorting` int(11) NOT NULL COMMENT '排序',
  `create_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人员',
  `update_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新人员',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ay_link_acode`(`acode`) USING BTREE,
  INDEX `ay_link_gid`(`gid`) USING BTREE,
  INDEX `ay_link_sorting`(`sorting`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ay_link
-- ----------------------------
INSERT INTO `ay_link` VALUES (1, 'cn', 1, 'PbootCMS', 'https://www.pbootcms.com', '/static/upload/image/20180412/1523501605180536.png', 255, 'admin', 'admin', '2018-04-12 10:53:06', '2018-04-12 10:53:26');

-- ----------------------------
-- Table structure for ay_member
-- ----------------------------
DROP TABLE IF EXISTS `ay_member`;
CREATE TABLE `ay_member`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ucode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `useremail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `usermobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `nickname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `headpic` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `activation` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1',
  `gid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `wxid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `qqid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `wbid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `score` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `register_time` datetime NOT NULL,
  `login_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `last_login_ip` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login_time` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `birthday` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `telephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `qq` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ay_member_ucode`(`ucode`) USING BTREE,
  UNIQUE INDEX `ay_member_username`(`username`) USING BTREE,
  INDEX `ay_member_gid`(`gid`) USING BTREE,
  INDEX `ay_member_wxid`(`wxid`) USING BTREE,
  INDEX `ay_member_qqid`(`qqid`) USING BTREE,
  INDEX `ay_member_wbid`(`wbid`) USING BTREE,
  INDEX `ay_member_useremail`(`useremail`) USING BTREE,
  INDEX `ay_member_usermobile`(`usermobile`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ay_member
-- ----------------------------

-- ----------------------------
-- Table structure for ay_member_comment
-- ----------------------------
DROP TABLE IF EXISTS `ay_member_comment`;
CREATE TABLE `ay_member_comment`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `contentid` int(10) UNSIGNED NOT NULL,
  `comment` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `puid` int(10) UNSIGNED NOT NULL,
  `likes` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `oppose` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_ip` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_os` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_bs` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime NOT NULL,
  `update_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ay_member_comment_pid`(`pid`) USING BTREE,
  INDEX `ay_member_comment_contentid`(`contentid`) USING BTREE,
  INDEX `ay_member_comment_uid`(`uid`) USING BTREE,
  INDEX `ay_member_comment_puid`(`puid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ay_member_comment
-- ----------------------------

-- ----------------------------
-- Table structure for ay_member_field
-- ----------------------------
DROP TABLE IF EXISTS `ay_member_field`;
CREATE TABLE `ay_member_field`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `length` int(10) UNSIGNED NOT NULL,
  `required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sorting` int(10) UNSIGNED NOT NULL,
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ay_member_field
-- ----------------------------
INSERT INTO `ay_member_field` VALUES (1, 'sex', 2, '0', '性别', 255, '1', 'admin', 'admin', '2020-06-25 00:00:00', '2020-06-25 00:00:00');
INSERT INTO `ay_member_field` VALUES (2, 'birthday', 20, '0', '生日', 255, '1', 'admin', 'admin', '2020-06-25 00:00:00', '2020-06-25 00:00:00');
INSERT INTO `ay_member_field` VALUES (3, 'qq', 15, '0', 'QQ', 255, '1', 'admin', 'admin', '2020-06-25 00:00:00', '2020-06-25 00:00:00');

-- ----------------------------
-- Table structure for ay_member_group
-- ----------------------------
DROP TABLE IF EXISTS `ay_member_group`;
CREATE TABLE `ay_member_group`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `gcode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lscore` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `uscore` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `create_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ay_member_group_gcode`(`gcode`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ay_member_group
-- ----------------------------
INSERT INTO `ay_member_group` VALUES (1, '1', '初级会员', '初级会员具备基本的权限', '1', 0, 999, 'admin', 'admin', '2020-06-25 00:00:00', '2020-06-25 00:00:00');
INSERT INTO `ay_member_group` VALUES (2, '2', '中级会员', '中级会员具备部分特殊权限', '1', 1000, 9999, 'admin', 'admin', '2020-06-25 00:00:00', '2020-06-25 00:00:00');
INSERT INTO `ay_member_group` VALUES (3, '3', '高级会员', '高级会员具备全部特殊权限', '1', 10000, 4294967295, 'admin', 'admin', '2020-06-25 00:00:00', '2020-06-25 00:00:00');

-- ----------------------------
-- Table structure for ay_menu
-- ----------------------------
DROP TABLE IF EXISTS `ay_menu`;
CREATE TABLE `ay_menu`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '菜单编号',
  `mcode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单编码',
  `pcode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '上级菜单',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单地址',
  `sorting` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '菜单排序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '是否启用',
  `shortcut` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '桌面图标',
  `ico` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单图标',
  `create_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人员',
  `update_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新人员',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ay_menu_mcode`(`mcode`) USING BTREE,
  INDEX `ay_menu_pcode`(`pcode`) USING BTREE,
  INDEX `ay_menu_sorting`(`sorting`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 71 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ay_menu
-- ----------------------------
INSERT INTO `ay_menu` VALUES (1, 'M101', '0', '系统管理', '/admin/M101/index', 900, '1', '0', 'fa-cog', 'admin', 'admin', '2017-11-28 11:13:05', '2018-04-30 14:52:57');
INSERT INTO `ay_menu` VALUES (2, 'M102', 'M101', '数据区域', '/admin/Area/index', 901, '1', '1', 'fa-sitemap', 'admin', 'admin', '2017-11-28 11:13:05', '2018-04-30 14:54:23');
INSERT INTO `ay_menu` VALUES (3, 'M103', 'M101', '系统菜单', '/admin/Menu/index', 902, '1', '0', 'fa-bars', 'admin', 'admin', '2017-11-28 11:13:05', '2018-04-30 14:54:35');
INSERT INTO `ay_menu` VALUES (4, 'M104', 'M101', '系统角色', '/admin/Role/index', 903, '1', '1', 'fa-hand-stop-o', 'admin', 'admin', '2017-11-28 11:13:05', '2018-04-30 14:54:43');
INSERT INTO `ay_menu` VALUES (5, 'M105', 'M101', '系统用户', '/admin/User/index', 904, '1', '1', 'fa-users', 'admin', 'admin', '2017-11-28 11:13:05', '2018-04-30 14:54:51');
INSERT INTO `ay_menu` VALUES (6, 'M106', 'M101', '系统日志', '/admin/Syslog/index', 905, '1', '1', 'fa-history', 'admin', 'admin', '2017-11-28 11:13:05', '2018-04-30 14:55:00');
INSERT INTO `ay_menu` VALUES (7, 'M107', 'M101', '类型管理', '/admin/Type/index', 906, '0', '0', 'fa-tags', 'admin', 'admin', '2017-11-28 11:13:05', '2018-04-30 14:55:13');
INSERT INTO `ay_menu` VALUES (8, 'M108', 'M101', '数据库管理', '/admin/Database/index', 907, '1', '1', 'fa-database', 'admin', 'admin', '2017-11-28 11:13:05', '2018-04-30 14:55:24');
INSERT INTO `ay_menu` VALUES (9, 'M109', 'M101', '服务器信息', '/admin/Site/server', 908, '1', '1', 'fa-info-circle', 'admin', 'admin', '2017-11-28 11:13:05', '2018-04-30 14:55:34');
INSERT INTO `ay_menu` VALUES (10, 'M1101', 'M101', '图片清理', '/admin/ImageExt/index', 909, '1', '1', 'fa-trash', 'admin', 'admin', '2017-11-28 11:13:05', '2022-09-19 13:44:59');
INSERT INTO `ay_menu` VALUES (11, 'M110', '0', '基础内容', '/admin/M110/index', 300, '1', '0', 'fa-sliders', 'admin', 'admin', '2017-11-28 11:13:05', '2018-04-30 14:48:29');
INSERT INTO `ay_menu` VALUES (12, 'M112', 'M110', '站点信息', '/admin/Site/index', 301, '1', '1', 'fa-cog', 'admin', 'admin', '2017-11-28 11:13:05', '2018-04-07 18:45:57');
INSERT INTO `ay_menu` VALUES (13, 'M113', 'M110', '公司信息', '/admin/Company/index', 302, '1', '1', 'fa-copyright', 'admin', 'admin', '2017-11-28 11:13:05', '2018-04-07 18:46:09');
INSERT INTO `ay_menu` VALUES (29, 'M129', 'M110', '内容栏目', '/admin/ContentSort/index', 303, '1', '1', 'fa-bars', 'admin', 'admin', '2017-12-26 10:42:40', '2018-04-07 18:46:25');
INSERT INTO `ay_menu` VALUES (30, 'M130', '0', '文章内容', '/admin/M130/index', 400, '1', '0', 'fa-file-text-o', 'admin', 'admin', '2017-12-26 10:45:36', '2018-04-30 14:49:47');
INSERT INTO `ay_menu` VALUES (31, 'M131', 'M130', '单页内容', '/admin/Single/index', 401, '0', '0', 'fa-file-o', 'admin', 'admin', '2017-12-26 10:46:35', '2018-04-07 18:46:35');
INSERT INTO `ay_menu` VALUES (32, 'M132', 'M130', '列表内容', '/admin/Content/index', 402, '0', '0', 'fa-file-text-o', 'admin', 'admin', '2017-12-26 10:48:17', '2018-04-07 21:52:15');
INSERT INTO `ay_menu` VALUES (36, 'M136', 'M156', '定制标签', '/admin/Label/index', 203, '1', '1', 'fa-wrench', 'admin', 'admin', '2018-01-03 11:52:40', '2018-04-07 18:44:31');
INSERT INTO `ay_menu` VALUES (50, 'M150', 'M157', '留言信息', '/admin/Message/index', 501, '1', '1', 'fa-question-circle-o', 'admin', 'admin', '2018-02-01 13:20:17', '2018-07-07 23:45:09');
INSERT INTO `ay_menu` VALUES (51, 'M151', 'M157', '轮播图片', '/admin/Slide/index', 502, '0', '1', 'fa-picture-o', 'admin', 'admin', '2018-03-01 14:57:41', '2023-09-14 09:49:52');
INSERT INTO `ay_menu` VALUES (52, 'M152', 'M157', '友情链接', '/admin/Link/index', 503, '1', '1', 'fa-link', 'admin', 'admin', '2018-03-01 14:58:45', '2018-04-07 18:47:16');
INSERT INTO `ay_menu` VALUES (53, 'M153', 'M156', '配置参数', '/admin/Config/index', 201, '1', '1', 'fa-sliders', 'admin', 'admin', '2018-03-21 14:52:05', '2018-04-07 18:44:02');
INSERT INTO `ay_menu` VALUES (61, 'M1000', 'M157', '文章内链', '/admin/Tags/index', 505, '1', '0', 'fa-random', 'admin', 'admin', '2019-07-12 08:25:41', '2019-07-12 08:26:23');
INSERT INTO `ay_menu` VALUES (55, 'M155', 'M156', '模型管理', '/admin/Model/index', 204, '1', '1', 'fa-codepen', 'admin', 'admin', '2018-03-25 17:16:06', '2018-04-07 18:44:40');
INSERT INTO `ay_menu` VALUES (56, 'M156', '0', '全局配置', '/admin/M156/index', 200, '1', '0', 'fa-globe', 'admin', 'admin', '2018-03-25 17:20:43', '2018-04-30 14:43:56');
INSERT INTO `ay_menu` VALUES (58, 'M158', 'M156', '模型字段', '/admin/ExtField/index', 205, '1', '1', 'fa-external-link', 'admin', 'admin', '2018-03-25 21:24:43', '2018-04-07 18:44:49');
INSERT INTO `ay_menu` VALUES (57, 'M157', '0', '扩展内容', '/admin/M157/index', 500, '1', '0', 'fa-arrows-alt', 'admin', 'admin', '2018-03-25 17:27:57', '2018-04-30 14:50:34');
INSERT INTO `ay_menu` VALUES (60, 'M160', 'M157', '自定义表单', '/admin/Form/index', 504, '1', '1', 'fa-plus-square-o', 'admin', 'admin', '2018-05-30 18:25:41', '2018-05-31 23:55:10');
INSERT INTO `ay_menu` VALUES (62, 'M1001', '0', '会员中心', '/admin/M1001/index', 600, '0', '0', 'fa-user-o', 'admin', 'admin', '2019-10-04 08:25:41', '2023-09-14 09:56:09');
INSERT INTO `ay_menu` VALUES (63, 'M1002', 'M1001', '会员等级', '/admin/MemberGroup/index', 601, '0', '0', 'fa-signal', 'admin', 'admin', '2019-10-04 08:25:41', '2023-09-14 09:46:28');
INSERT INTO `ay_menu` VALUES (64, 'M1003', 'M1001', '会员字段', '/admin/MemberField/index', 602, '0', '0', 'fa-wpforms', 'admin', 'admin', '2019-10-04 08:25:41', '2023-09-14 09:46:32');
INSERT INTO `ay_menu` VALUES (65, 'M1004', 'M1001', '会员管理', '/admin/Member/index', 603, '0', '0', 'fa-users', 'admin', 'admin', '2019-10-04 08:25:41', '2023-09-14 09:46:35');
INSERT INTO `ay_menu` VALUES (66, 'M1005', 'M1001', '文章评论', '/admin/MemberComment/index', 604, '0', '0', 'fa-commenting-o', 'admin', 'admin', '2019-10-04 08:25:41', '2023-09-14 09:46:38');
INSERT INTO `ay_menu` VALUES (67, 'M161', 'M157', 'robots编辑', '/admin/Robots/index', 506, '1', '1', 'fa-file-text-o', 'admin', 'admin', '2021-12-11 17:02:05', '2021-12-11 17:13:31');
INSERT INTO `ay_menu` VALUES (68, 'M162', 'M157', '文件读写', '/admin/Sysfile/index', 507, '1', '1', 'fa-pencil-square-o', 'admin', 'admin', '2021-12-11 17:11:46', '2021-12-13 09:17:11');
INSERT INTO `ay_menu` VALUES (69, 'M163', 'M157', '广告管理', '/admin/SlideSort/index', 502, '1', '1', 'fa-picture-o', 'admin', 'admin', '2021-12-11 17:11:46', '2021-12-11 17:11:46');
INSERT INTO `ay_menu` VALUES (70, 'M164', 'M157', '蜘蛛来访', '/admin/Spider/index', 507, '1', '1', 'fa-pie-chart', 'admin', 'admin', '2021-12-11 17:11:46', '2021-12-11 17:11:46');

-- ----------------------------
-- Table structure for ay_menu_action
-- ----------------------------
DROP TABLE IF EXISTS `ay_menu_action`;
CREATE TABLE `ay_menu_action`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `mcode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单编码',
  `action` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型编码',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ay_menu_action_mcode`(`mcode`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 84 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ay_menu_action
-- ----------------------------
INSERT INTO `ay_menu_action` VALUES (1, 'M102', 'mod');
INSERT INTO `ay_menu_action` VALUES (2, 'M102', 'del');
INSERT INTO `ay_menu_action` VALUES (3, 'M102', 'add');
INSERT INTO `ay_menu_action` VALUES (4, 'M103', 'mod');
INSERT INTO `ay_menu_action` VALUES (5, 'M103', 'del');
INSERT INTO `ay_menu_action` VALUES (6, 'M103', 'add');
INSERT INTO `ay_menu_action` VALUES (7, 'M104', 'mod');
INSERT INTO `ay_menu_action` VALUES (8, 'M104', 'del');
INSERT INTO `ay_menu_action` VALUES (9, 'M104', 'add');
INSERT INTO `ay_menu_action` VALUES (10, 'M105', 'mod');
INSERT INTO `ay_menu_action` VALUES (11, 'M105', 'del');
INSERT INTO `ay_menu_action` VALUES (12, 'M105', 'add');
INSERT INTO `ay_menu_action` VALUES (13, 'M107', 'mod');
INSERT INTO `ay_menu_action` VALUES (14, 'M107', 'del');
INSERT INTO `ay_menu_action` VALUES (15, 'M107', 'add');
INSERT INTO `ay_menu_action` VALUES (16, 'M111', 'mod');
INSERT INTO `ay_menu_action` VALUES (17, 'M112', 'mod');
INSERT INTO `ay_menu_action` VALUES (18, 'M114', 'mod');
INSERT INTO `ay_menu_action` VALUES (19, 'M114', 'del');
INSERT INTO `ay_menu_action` VALUES (20, 'M114', 'add');
INSERT INTO `ay_menu_action` VALUES (21, 'M120', 'mod');
INSERT INTO `ay_menu_action` VALUES (22, 'M120', 'del');
INSERT INTO `ay_menu_action` VALUES (23, 'M120', 'add');
INSERT INTO `ay_menu_action` VALUES (24, 'M129', 'mod');
INSERT INTO `ay_menu_action` VALUES (25, 'M129', 'del');
INSERT INTO `ay_menu_action` VALUES (26, 'M129', 'add');
INSERT INTO `ay_menu_action` VALUES (27, 'M131', 'mod');
INSERT INTO `ay_menu_action` VALUES (28, 'M132', 'mod');
INSERT INTO `ay_menu_action` VALUES (29, 'M132', 'del');
INSERT INTO `ay_menu_action` VALUES (30, 'M132', 'add');
INSERT INTO `ay_menu_action` VALUES (31, 'M136', 'mod');
INSERT INTO `ay_menu_action` VALUES (32, 'M136', 'del');
INSERT INTO `ay_menu_action` VALUES (33, 'M136', 'add');
INSERT INTO `ay_menu_action` VALUES (34, 'M141', 'mod');
INSERT INTO `ay_menu_action` VALUES (35, 'M141', 'del');
INSERT INTO `ay_menu_action` VALUES (36, 'M141', 'add');
INSERT INTO `ay_menu_action` VALUES (37, 'M142', 'mod');
INSERT INTO `ay_menu_action` VALUES (38, 'M142', 'del');
INSERT INTO `ay_menu_action` VALUES (39, 'M142', 'add');
INSERT INTO `ay_menu_action` VALUES (40, 'M143', 'mod');
INSERT INTO `ay_menu_action` VALUES (41, 'M143', 'del');
INSERT INTO `ay_menu_action` VALUES (42, 'M143', 'add');
INSERT INTO `ay_menu_action` VALUES (43, 'M144', 'mod');
INSERT INTO `ay_menu_action` VALUES (44, 'M144', 'del');
INSERT INTO `ay_menu_action` VALUES (45, 'M144', 'add');
INSERT INTO `ay_menu_action` VALUES (46, 'M145', 'mod');
INSERT INTO `ay_menu_action` VALUES (47, 'M145', 'del');
INSERT INTO `ay_menu_action` VALUES (48, 'M145', 'add');
INSERT INTO `ay_menu_action` VALUES (49, 'M150', 'del');
INSERT INTO `ay_menu_action` VALUES (50, 'M150', 'mod');
INSERT INTO `ay_menu_action` VALUES (51, 'M163', 'submod');
INSERT INTO `ay_menu_action` VALUES (52, 'M163', 'subdel');
INSERT INTO `ay_menu_action` VALUES (53, 'M163', 'subadd');
INSERT INTO `ay_menu_action` VALUES (54, 'M152', 'mod');
INSERT INTO `ay_menu_action` VALUES (55, 'M152', 'del');
INSERT INTO `ay_menu_action` VALUES (56, 'M152', 'add');
INSERT INTO `ay_menu_action` VALUES (57, 'M155', 'mod');
INSERT INTO `ay_menu_action` VALUES (58, 'M155', 'del');
INSERT INTO `ay_menu_action` VALUES (59, 'M155', 'add');
INSERT INTO `ay_menu_action` VALUES (60, 'M158', 'mod');
INSERT INTO `ay_menu_action` VALUES (61, 'M158', 'del');
INSERT INTO `ay_menu_action` VALUES (62, 'M158', 'add');
INSERT INTO `ay_menu_action` VALUES (63, 'M160', 'add');
INSERT INTO `ay_menu_action` VALUES (64, 'M160', 'del');
INSERT INTO `ay_menu_action` VALUES (65, 'M160', 'mod');
INSERT INTO `ay_menu_action` VALUES (66, 'M161', 'mod');
INSERT INTO `ay_menu_action` VALUES (67, 'M162', 'mod');
INSERT INTO `ay_menu_action` VALUES (68, 'M163', 'add');
INSERT INTO `ay_menu_action` VALUES (69, 'M163', 'mod');
INSERT INTO `ay_menu_action` VALUES (70, 'M163', 'del');
INSERT INTO `ay_menu_action` VALUES (71, 'M1000', 'add');
INSERT INTO `ay_menu_action` VALUES (72, 'M1000', 'del');
INSERT INTO `ay_menu_action` VALUES (73, 'M1000', 'mod');
INSERT INTO `ay_menu_action` VALUES (74, 'M1002', 'add');
INSERT INTO `ay_menu_action` VALUES (75, 'M1002', 'del');
INSERT INTO `ay_menu_action` VALUES (76, 'M1002', 'mod');
INSERT INTO `ay_menu_action` VALUES (77, 'M1003', 'add');
INSERT INTO `ay_menu_action` VALUES (78, 'M1003', 'del');
INSERT INTO `ay_menu_action` VALUES (79, 'M1003', 'mod');
INSERT INTO `ay_menu_action` VALUES (80, 'M1004', 'add');
INSERT INTO `ay_menu_action` VALUES (81, 'M1004', 'del');
INSERT INTO `ay_menu_action` VALUES (82, 'M1004', 'mod');
INSERT INTO `ay_menu_action` VALUES (83, 'M1005', 'del');

-- ----------------------------
-- Table structure for ay_message
-- ----------------------------
DROP TABLE IF EXISTS `ay_message`;
CREATE TABLE `ay_message`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '编号',
  `acode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区域编码',
  `contacts` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `mobile` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '留言内容',
  `user_ip` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT 'IP地址',
  `user_os` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作系统',
  `user_bs` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '浏览器',
  `recontent` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '回复内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '是否前台显示',
  `create_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人员',
  `update_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新人员',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `uid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ay_message_acode`(`acode`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ay_message
-- ----------------------------

-- ----------------------------
-- Table structure for ay_model
-- ----------------------------
DROP TABLE IF EXISTS `ay_model`;
CREATE TABLE `ay_model`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '序号',
  `mcode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模型编号',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模型名称',
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '2' COMMENT '是否列表类型',
  `urlname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'URL名称',
  `listtpl` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '列表页模板',
  `contenttpl` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容页模板',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '模型状态',
  `issystem` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '系统模型',
  `create_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人员',
  `update_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新人员',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ay_model_mcode`(`mcode`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ay_model
-- ----------------------------
INSERT INTO `ay_model` VALUES (1, '1', '专题', '1', 'about', '', 'about.html', '1', '1', 'admin', 'admin', '2018-04-11 17:16:01', '2019-08-05 11:11:44');
INSERT INTO `ay_model` VALUES (2, '2', '新闻', '2', 'list', 'newslist.html', 'news.html', '1', '1', 'admin', 'admin', '2018-04-11 17:17:16', '2019-08-05 11:12:04');
INSERT INTO `ay_model` VALUES (3, '3', '产品', '2', 'list', 'productlist.html', 'product.html', '1', '0', 'admin', 'admin', '2018-04-11 17:17:46', '2019-08-05 11:12:17');
INSERT INTO `ay_model` VALUES (4, '4', '案例', '2', 'list', 'caselist.html', 'case.html', '1', '0', 'admin', 'admin', '2018-04-11 17:19:53', '2019-08-05 11:12:26');
INSERT INTO `ay_model` VALUES (5, '5', '招聘', '2', 'list', 'joblist.html', 'job.html', '1', '0', 'admin', 'admin', '2018-04-11 17:24:34', '2019-08-05 11:12:37');

-- ----------------------------
-- Table structure for ay_role
-- ----------------------------
DROP TABLE IF EXISTS `ay_role`;
CREATE TABLE `ay_role`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '角色编号',
  `rcode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色编码',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色描述',
  `create_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人员',
  `update_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新人员',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ay_role_rcode`(`rcode`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ay_role
-- ----------------------------
INSERT INTO `ay_role` VALUES (1, 'R101', '系统管理员', '系统管理员具有所有权限', 'admin', 'admin', '2017-03-22 11:33:32', '2019-08-05 11:22:02');
INSERT INTO `ay_role` VALUES (2, 'R102', '内容管理员', '内容管理员具有基本内容管理权限', 'admin', 'admin', '2017-06-01 00:32:02', '2023-09-14 09:50:34');

-- ----------------------------
-- Table structure for ay_role_area
-- ----------------------------
DROP TABLE IF EXISTS `ay_role_area`;
CREATE TABLE `ay_role_area`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `rcode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `acode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ay_role_area_rcode`(`rcode`) USING BTREE,
  INDEX `ay_role_area_acode`(`acode`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ay_role_area
-- ----------------------------
INSERT INTO `ay_role_area` VALUES (3, 'R101', 'cn');
INSERT INTO `ay_role_area` VALUES (5, 'R102', 'cn');

-- ----------------------------
-- Table structure for ay_role_level
-- ----------------------------
DROP TABLE IF EXISTS `ay_role_level`;
CREATE TABLE `ay_role_level`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '编号',
  `rcode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色编码',
  `level` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限地址',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ay_role_level_rcode`(`rcode`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 255 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ay_role_level
-- ----------------------------
INSERT INTO `ay_role_level` VALUES (165, 'R101', '/admin/Role/index');
INSERT INTO `ay_role_level` VALUES (164, 'R101', '/admin/Menu/mod');
INSERT INTO `ay_role_level` VALUES (163, 'R101', '/admin/Menu/del');
INSERT INTO `ay_role_level` VALUES (162, 'R101', '/admin/Menu/add');
INSERT INTO `ay_role_level` VALUES (161, 'R101', '/admin/Menu/index');
INSERT INTO `ay_role_level` VALUES (160, 'R101', '/admin/Area/mod');
INSERT INTO `ay_role_level` VALUES (159, 'R101', '/admin/Area/del');
INSERT INTO `ay_role_level` VALUES (158, 'R101', '/admin/Area/add');
INSERT INTO `ay_role_level` VALUES (157, 'R101', '/admin/Area/index');
INSERT INTO `ay_role_level` VALUES (156, 'R101', '/admin/M101/index');
INSERT INTO `ay_role_level` VALUES (155, 'R101', '/admin/Tags/mod');
INSERT INTO `ay_role_level` VALUES (154, 'R101', '/admin/Tags/del');
INSERT INTO `ay_role_level` VALUES (153, 'R101', '/admin/Tags/add');
INSERT INTO `ay_role_level` VALUES (152, 'R101', '/admin/Tags/index');
INSERT INTO `ay_role_level` VALUES (151, 'R101', '/admin/Form/mod');
INSERT INTO `ay_role_level` VALUES (150, 'R101', '/admin/Form/del');
INSERT INTO `ay_role_level` VALUES (149, 'R101', '/admin/Form/add');
INSERT INTO `ay_role_level` VALUES (148, 'R101', '/admin/Form/index');
INSERT INTO `ay_role_level` VALUES (147, 'R101', '/admin/Link/mod');
INSERT INTO `ay_role_level` VALUES (146, 'R101', '/admin/Link/del');
INSERT INTO `ay_role_level` VALUES (145, 'R101', '/admin/Link/add');
INSERT INTO `ay_role_level` VALUES (144, 'R101', '/admin/Link/index');
INSERT INTO `ay_role_level` VALUES (143, 'R101', '/admin/Slide/mod');
INSERT INTO `ay_role_level` VALUES (142, 'R101', '/admin/Slide/del');
INSERT INTO `ay_role_level` VALUES (141, 'R101', '/admin/Slide/add');
INSERT INTO `ay_role_level` VALUES (140, 'R101', '/admin/Slide/index');
INSERT INTO `ay_role_level` VALUES (139, 'R101', '/admin/Message/mod');
INSERT INTO `ay_role_level` VALUES (138, 'R101', '/admin/Message/del');
INSERT INTO `ay_role_level` VALUES (137, 'R101', '/admin/Message/index');
INSERT INTO `ay_role_level` VALUES (136, 'R101', '/admin/M157/index');
INSERT INTO `ay_role_level` VALUES (135, 'R101', '/admin/Content/mod');
INSERT INTO `ay_role_level` VALUES (134, 'R101', '/admin/Content/del');
INSERT INTO `ay_role_level` VALUES (133, 'R101', '/admin/Content/add');
INSERT INTO `ay_role_level` VALUES (132, 'R101', '/admin/Content/index');
INSERT INTO `ay_role_level` VALUES (131, 'R101', '/admin/Single/mod');
INSERT INTO `ay_role_level` VALUES (130, 'R101', '/admin/Single/index');
INSERT INTO `ay_role_level` VALUES (129, 'R101', '/admin/M130/index');
INSERT INTO `ay_role_level` VALUES (128, 'R101', '/admin/ContentSort/mod');
INSERT INTO `ay_role_level` VALUES (127, 'R101', '/admin/ContentSort/del');
INSERT INTO `ay_role_level` VALUES (126, 'R101', '/admin/ContentSort/add');
INSERT INTO `ay_role_level` VALUES (125, 'R101', '/admin/ContentSort/index');
INSERT INTO `ay_role_level` VALUES (124, 'R101', '/admin/Company/mod');
INSERT INTO `ay_role_level` VALUES (123, 'R101', '/admin/Company/index');
INSERT INTO `ay_role_level` VALUES (122, 'R101', '/admin/Site/mod');
INSERT INTO `ay_role_level` VALUES (121, 'R101', '/admin/Site/index');
INSERT INTO `ay_role_level` VALUES (120, 'R101', '/admin/M110/index');
INSERT INTO `ay_role_level` VALUES (119, 'R101', '/admin/ExtField/mod');
INSERT INTO `ay_role_level` VALUES (118, 'R101', '/admin/ExtField/del');
INSERT INTO `ay_role_level` VALUES (117, 'R101', '/admin/ExtField/add');
INSERT INTO `ay_role_level` VALUES (116, 'R101', '/admin/ExtField/index');
INSERT INTO `ay_role_level` VALUES (115, 'R101', '/admin/Model/mod');
INSERT INTO `ay_role_level` VALUES (114, 'R101', '/admin/Model/del');
INSERT INTO `ay_role_level` VALUES (113, 'R101', '/admin/Model/add');
INSERT INTO `ay_role_level` VALUES (112, 'R101', '/admin/Model/index');
INSERT INTO `ay_role_level` VALUES (111, 'R101', '/admin/Label/mod');
INSERT INTO `ay_role_level` VALUES (110, 'R101', '/admin/Label/del');
INSERT INTO `ay_role_level` VALUES (109, 'R101', '/admin/Label/add');
INSERT INTO `ay_role_level` VALUES (108, 'R101', '/admin/Label/index');
INSERT INTO `ay_role_level` VALUES (107, 'R101', '/admin/Config/index');
INSERT INTO `ay_role_level` VALUES (106, 'R101', '/admin/M156/index');
INSERT INTO `ay_role_level` VALUES (242, 'R102', '/admin/SlideSort/mod');
INSERT INTO `ay_role_level` VALUES (241, 'R102', '/admin/SlideSort/del');
INSERT INTO `ay_role_level` VALUES (240, 'R102', '/admin/SlideSort/add');
INSERT INTO `ay_role_level` VALUES (239, 'R102', '/admin/SlideSort/index');
INSERT INTO `ay_role_level` VALUES (238, 'R102', '/admin/SlideSort/submod');
INSERT INTO `ay_role_level` VALUES (237, 'R102', '/admin/SlideSort/subdel');
INSERT INTO `ay_role_level` VALUES (236, 'R102', '/admin/SlideSort/subadd');
INSERT INTO `ay_role_level` VALUES (235, 'R102', '/admin/Slide/index');
INSERT INTO `ay_role_level` VALUES (234, 'R102', '/admin/Message/mod');
INSERT INTO `ay_role_level` VALUES (233, 'R102', '/admin/Message/del');
INSERT INTO `ay_role_level` VALUES (232, 'R102', '/admin/Message/index');
INSERT INTO `ay_role_level` VALUES (231, 'R102', '/admin/M157/index');
INSERT INTO `ay_role_level` VALUES (230, 'R102', '/admin/Content/mod');
INSERT INTO `ay_role_level` VALUES (229, 'R102', '/admin/Content/del');
INSERT INTO `ay_role_level` VALUES (228, 'R102', '/admin/Content/add');
INSERT INTO `ay_role_level` VALUES (227, 'R102', '/admin/Content/index');
INSERT INTO `ay_role_level` VALUES (226, 'R102', '/admin/Single/mod');
INSERT INTO `ay_role_level` VALUES (225, 'R102', '/admin/Single/index');
INSERT INTO `ay_role_level` VALUES (224, 'R102', '/admin/M130/index');
INSERT INTO `ay_role_level` VALUES (223, 'R102', '/admin/ContentSort/mod');
INSERT INTO `ay_role_level` VALUES (166, 'R101', '/admin/Role/add');
INSERT INTO `ay_role_level` VALUES (167, 'R101', '/admin/Role/del');
INSERT INTO `ay_role_level` VALUES (168, 'R101', '/admin/Role/mod');
INSERT INTO `ay_role_level` VALUES (169, 'R101', '/admin/User/index');
INSERT INTO `ay_role_level` VALUES (170, 'R101', '/admin/User/add');
INSERT INTO `ay_role_level` VALUES (171, 'R101', '/admin/User/del');
INSERT INTO `ay_role_level` VALUES (172, 'R101', '/admin/User/mod');
INSERT INTO `ay_role_level` VALUES (173, 'R101', '/admin/Syslog/index');
INSERT INTO `ay_role_level` VALUES (174, 'R101', '/admin/Type/index');
INSERT INTO `ay_role_level` VALUES (175, 'R101', '/admin/Type/add');
INSERT INTO `ay_role_level` VALUES (176, 'R101', '/admin/Type/del');
INSERT INTO `ay_role_level` VALUES (177, 'R101', '/admin/Type/mod');
INSERT INTO `ay_role_level` VALUES (178, 'R101', '/admin/Database/index');
INSERT INTO `ay_role_level` VALUES (179, 'R101', '/admin/Site/server');
INSERT INTO `ay_role_level` VALUES (222, 'R102', '/admin/ContentSort/del');
INSERT INTO `ay_role_level` VALUES (221, 'R102', '/admin/ContentSort/add');
INSERT INTO `ay_role_level` VALUES (220, 'R102', '/admin/ContentSort/index');
INSERT INTO `ay_role_level` VALUES (219, 'R102', '/admin/Company/index');
INSERT INTO `ay_role_level` VALUES (218, 'R102', '/admin/Site/mod');
INSERT INTO `ay_role_level` VALUES (217, 'R102', '/admin/Site/index');
INSERT INTO `ay_role_level` VALUES (216, 'R102', '/admin/M110/index');
INSERT INTO `ay_role_level` VALUES (243, 'R102', '/admin/Link/index');
INSERT INTO `ay_role_level` VALUES (244, 'R102', '/admin/Link/add');
INSERT INTO `ay_role_level` VALUES (245, 'R102', '/admin/Link/del');
INSERT INTO `ay_role_level` VALUES (246, 'R102', '/admin/Link/mod');
INSERT INTO `ay_role_level` VALUES (247, 'R102', '/admin/Form/index');
INSERT INTO `ay_role_level` VALUES (248, 'R102', '/admin/Form/add');
INSERT INTO `ay_role_level` VALUES (249, 'R102', '/admin/Form/del');
INSERT INTO `ay_role_level` VALUES (250, 'R102', '/admin/Form/mod');
INSERT INTO `ay_role_level` VALUES (251, 'R102', '/admin/Tags/index');
INSERT INTO `ay_role_level` VALUES (252, 'R102', '/admin/Tags/add');
INSERT INTO `ay_role_level` VALUES (253, 'R102', '/admin/Tags/del');
INSERT INTO `ay_role_level` VALUES (254, 'R102', '/admin/Tags/mod');

-- ----------------------------
-- Table structure for ay_site
-- ----------------------------
DROP TABLE IF EXISTS `ay_site`;
CREATE TABLE `ay_site`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '站点编号',
  `acode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区域代码',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点标题',
  `subtitle` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点副标题',
  `domain` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点地址',
  `logo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点LOGO地址',
  `mlogo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '移动端LOGO',
  `keywords` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点关键字',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点描述',
  `icp` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点备案',
  `theme` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点主题',
  `statistical` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点统计码',
  `copyright` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '版权信息',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ay_site_acode`(`acode`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ay_site
-- ----------------------------
INSERT INTO `ay_site` VALUES (1, 'cn', 'TomatoCMS', '永久开源免费的PHP企业网站开发建设管理系统', 'www.TomatoCMS.me', '', '', 'cms,免费cms,开源cms,企业cms,建站cms', 'TomatoCMS是一套全新内核且永久开源免费的PHP企业网站开发建设管理系统，是一套高效、简洁、 强悍的可免费商用的PHP CMS源码，能够满足各类企业网站开发建设的需要。系统采用简单到想哭的模板标签，只要懂HTML就可快速开发企业网站。官方提供了大量网站模板免费下载和使用，将致力于为广大开发者和企业提供最佳的网站开发建设解决方案。', '湘ICP备88888888号', 'default', '', 'Copyright © 2018-2020 TomatoCMS All Rights Reserved.');

-- ----------------------------
-- Table structure for ay_slide
-- ----------------------------
DROP TABLE IF EXISTS `ay_slide`;
CREATE TABLE `ay_slide`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '序号',
  `acode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区域编码',
  `gid` int(10) UNSIGNED NOT NULL COMMENT '分组序号',
  `pic` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片地址',
  `ico` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `link` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '跳转链接',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '说明文字',
  `subtitle` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '副标题/描述',
  `desc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sorting` int(11) NOT NULL COMMENT '排序',
  `status` int(1) NOT NULL,
  `create_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人员',
  `update_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新人员',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ay_slide_acode`(`acode`) USING BTREE,
  INDEX `ay_slide_gid`(`gid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ay_slide
-- ----------------------------
INSERT INTO `ay_slide` VALUES (3, 'cn', 1, 'https://qncdn.zhaomi.cn/d09edf42ae6a219d57b9cd1fb1501e9b4386fc2b.jpg', '', '', '', '', '', 255, 1, 'admin', 'admin', '2023-09-14 09:05:35', '2023-09-14 09:05:35');

-- ----------------------------
-- Table structure for ay_slide_sort
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
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ay_slide_sort
-- ----------------------------
INSERT INTO `ay_slide_sort` VALUES (1, 'cn', '首页banner图', 1, '可备注图片尺寸大小等信息', '', 'admin', 'admin', '2020-07-26 21:25:49', '2021-08-14 09:31:42');

-- ----------------------------
-- Table structure for ay_spider
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

-- ----------------------------
-- Records of ay_spider
-- ----------------------------

-- ----------------------------
-- Table structure for ay_syslog
-- ----------------------------
DROP TABLE IF EXISTS `ay_syslog`;
CREATE TABLE `ay_syslog`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '日志编号',
  `level` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '信息等级',
  `event` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '事件',
  `user_ip` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '客户端IP',
  `user_os` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户端系统',
  `user_bs` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户端浏览器',
  `create_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人员',
  `create_time` datetime NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;



-- ----------------------------
-- Table structure for ay_tags
-- ----------------------------
DROP TABLE IF EXISTS `ay_tags`;
CREATE TABLE `ay_tags`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '编号',
  `acode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区域',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `link` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '链接',
  `create_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加人员',
  `update_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新人员',
  `create_time` datetime NOT NULL COMMENT '添加时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ay_tags_acode`(`acode`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ay_tags
-- ----------------------------
INSERT INTO `ay_tags` VALUES (1, 'cn', 'PbootCMS', 'https://www.pbootcms.com', 'admin', 'admin', '2019-07-12 14:33:13', '2019-07-12 14:33:13');

-- ----------------------------
-- Table structure for ay_type
-- ----------------------------
DROP TABLE IF EXISTS `ay_type`;
CREATE TABLE `ay_type`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '类型编号',
  `tcode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型编码',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型名称',
  `item` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型项',
  `value` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '类型值',
  `sorting` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `create_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加人员',
  `update_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新时间',
  `create_time` datetime NOT NULL COMMENT '添加时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ay_type_tcode`(`tcode`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ay_type
-- ----------------------------
INSERT INTO `ay_type` VALUES (1, 'T101', '菜单功能', '新增', 'add', 1, 'admin', 'admin', '2017-04-27 07:28:34', '2017-08-09 15:25:56');
INSERT INTO `ay_type` VALUES (2, 'T101', '菜单功能', '删除', 'del', 2, 'admin', 'admin', '2017-04-27 07:29:08', '2017-08-09 15:23:34');
INSERT INTO `ay_type` VALUES (3, 'T101', '菜单功能', '修改', 'mod', 3, 'admin', 'admin', '2017-04-27 07:29:34', '2017-08-09 15:23:32');
INSERT INTO `ay_type` VALUES (4, 'T101', '菜单功能', '导出', 'export', 4, 'admin', 'admin', '2017-04-27 07:30:42', '2017-08-09 15:23:29');
INSERT INTO `ay_type` VALUES (5, 'T101', '菜单功能', '导入', 'import', 5, 'admin', 'admin', '2017-04-27 07:31:38', '2017-08-09 15:23:27');

-- ----------------------------
-- Table structure for ay_user
-- ----------------------------
DROP TABLE IF EXISTS `ay_user`;
CREATE TABLE `ay_user`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `ucode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户编码',
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `realname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '真实名字',
  `password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '是否启用',
  `login_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '登录次数',
  `last_login_ip` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `create_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加人员',
  `update_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新用户',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ay_user_ucode`(`ucode`) USING BTREE,
  INDEX `ay_user_username`(`username`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ay_user
-- ----------------------------
INSERT INTO `ay_user` VALUES (1, '10001', 'admin', '超级管理员', '5cf9afb9197caad4b10ec2f038ecae68', '1', 13, '2130706433', 'admin', 'admin', '2017-05-08 18:50:30', '2023-09-14 09:58:48');

-- ----------------------------
-- Table structure for ay_user_role
-- ----------------------------
DROP TABLE IF EXISTS `ay_user_role`;
CREATE TABLE `ay_user_role`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '编号',
  `ucode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户编码',
  `rcode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色编码',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ay_user_role_ucode`(`ucode`) USING BTREE,
  INDEX `ay_user_role_rcode`(`rcode`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ay_user_role
-- ----------------------------
INSERT INTO `ay_user_role` VALUES (1, '10001', 'R101');

SET FOREIGN_KEY_CHECKS = 1;
