-- ----------------------------
-- 升级接口升级版
-- ----------------------------
INSERT INTO `ay_config` (`name`,`value`,`type`,`sorting`,`description`) VALUES ('upgrade_url', 'update.zhimazhihui.com', '2', 255, '升级接口');
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
