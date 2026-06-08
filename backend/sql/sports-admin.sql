/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80046
 Source Host           : localhost:3306
 Source Schema         : sports-admin

 Target Server Type    : MySQL
 Target Server Version : 80046
 File Encoding         : 65001

 Date: 07/06/2026 22:11:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(0) NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 99 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2025-04-04 14:12:14', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2025-04-04 14:12:14', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2025-04-04 14:12:14', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2025-04-04 14:12:14', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2025-04-04 14:12:14', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2025-04-04 14:12:14', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 199 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-04-04 14:12:14', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-04-04 14:12:14', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-04-04 14:12:14', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-04-04 14:12:14', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-04-04 14:12:14', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-04-04 14:12:14', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-04-04 14:12:14', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-04-04 14:12:14', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-04-04 14:12:14', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-04-04 14:12:14', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(0) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 99 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2025-04-04 14:12:14', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-04-04 14:12:14', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-04-04 14:12:14', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2025-04-04 14:12:14', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2025-04-04 14:12:14', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2025-04-04 14:12:14', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2025-04-04 14:12:14', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2025-04-04 14:12:14', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2025-04-04 14:12:14', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2025-04-04 14:12:14', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2025-04-04 14:12:14', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2025-04-04 14:12:14', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2025-04-04 14:12:14', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2025-04-04 14:12:14', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2025-04-04 14:12:14', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2025-04-04 14:12:14', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2025-04-04 14:12:14', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-04-04 14:12:14', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-04-04 14:12:14', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-04-04 14:12:14', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-04-04 14:12:14', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2025-04-04 14:12:14', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-04-04 14:12:14', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-04-04 14:12:14', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-04-04 14:12:14', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-04-04 14:12:14', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-04-04 14:12:14', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2025-04-04 14:12:14', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2025-04-04 14:12:14', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2025-04-04 14:12:14', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2025-04-04 14:12:14', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2025-04-04 14:12:14', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2025-04-04 14:12:14', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2025-04-04 14:12:14', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2025-04-04 14:12:14', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2025-04-04 14:12:14', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2025-04-04 14:12:14', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2025-04-04 14:12:14', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2025-04-04 14:12:14', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 99 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2025-04-04 14:12:14', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 214 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-04 15:10:14');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-04 15:28:52');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-04 20:14:09');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-04 20:20:32');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-04 20:27:07');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-04 21:49:11');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-05 20:30:00');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-05 21:03:03');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-06 10:10:04');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-06 12:27:32');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-06 20:44:10');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-06 21:57:36');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-07 19:41:23');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-07 21:49:33');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-07 22:22:54');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-07 23:01:12');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-09 19:56:53');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-09 21:56:55');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-09 22:43:51');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-09 23:25:02');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-10 15:07:49');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-10 15:57:29');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-10 16:36:53');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-11 09:28:17');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-11 11:47:04');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-11 11:50:11');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-11 11:50:18');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-11 13:38:17');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-11 14:38:45');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-11 15:32:12');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-11 16:25:32');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-11 16:58:44');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-04-11 22:54:12');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-11 22:54:16');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-12 15:04:45');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2025-04-12 15:45:03');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-12 22:17:23');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-13 00:06:19');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-13 13:01:13');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2025-04-13 20:05:36');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码已失效', '2025-04-13 20:30:47');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-13 20:30:53');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-14 20:03:22');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-14 23:16:38');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '113.87.239.18', 'XX XX', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-18 09:25:25');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '113.87.239.18', 'XX XX', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-18 11:00:55');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '113.87.239.18', 'XX XX', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-18 11:07:58');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '113.87.239.18', 'XX XX', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-04-18 11:48:27');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '113.87.239.18', 'XX XX', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-18 11:48:30');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '113.87.239.18', 'XX XX', 'Chrome 13', 'Windows 10', '1', '验证码已失效', '2025-04-18 14:36:38');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '113.87.239.18', 'XX XX', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-04-18 14:36:41');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '113.87.239.18', 'XX XX', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-18 14:36:45');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '113.87.239.18', 'XX XX', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-18 14:41:14');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '211.20.52.91', 'XX XX', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-18 18:29:58');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '211.20.52.91', 'XX XX', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-18 18:36:55');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '211.20.52.91', 'XX XX', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-18 18:37:07');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '211.20.52.91', 'XX XX', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-18 18:38:47');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '211.20.52.91', 'XX XX', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2025-04-18 18:38:55');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '211.20.52.91', 'XX XX', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-18 18:39:00');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '223.104.68.56', 'XX XX', 'Firefox Mobile (iOS)', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2025-04-18 18:55:04');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '223.104.68.56', 'XX XX', 'Firefox Mobile (iOS)', 'Mac OS X (iPhone)', '1', '验证码错误', '2025-04-18 18:55:16');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '223.104.68.56', 'XX XX', 'Firefox Mobile (iOS)', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2025-04-18 18:55:21');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '223.104.68.56', 'XX XX', 'Firefox Mobile (iOS)', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-18 18:56:55');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '188.253.120.200', 'XX XX', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-04-19 10:36:03');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '60.248.49.19', 'XX XX', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-20 21:02:59');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '60.248.49.19', 'XX XX', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-22 18:31:20');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '188.253.120.200', 'XX XX', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-04-23 23:07:37');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '211.72.235.82', 'XX XX', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-24 16:02:55');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '60.249.87.139', 'XX XX', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-27 17:18:15');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2025-05-02 11:01:41');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-02 11:01:56');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-02 12:07:07');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-02 15:24:06');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-03 10:42:56');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-03 13:13:40');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-15 21:43:54');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-17 22:00:04');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2025-05-31 11:42:17');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-31 11:42:43');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-01 12:37:39');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-01 15:23:26');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-10 21:15:41');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-15 13:49:11');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-15 14:22:33');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-15 15:07:58');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-06-28 13:29:44');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-28 13:29:47');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码已失效', '2025-06-28 13:46:57');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-28 17:25:40');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-28 19:44:57');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-28 21:48:46');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-13 10:31:59');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-13 11:44:50');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2026-06-05 13:38:49');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2026-06-05 13:39:27');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2026-06-05 13:39:34');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-06-05 13:46:24');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-06-05 13:48:21');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2026-06-05 13:48:22');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-06-05 13:50:02');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2026-06-05 13:50:03');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-06-05 14:03:18');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2026-06-05 14:03:37');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-06-05 14:03:49');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2026-06-05 14:05:50');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-06-05 14:06:02');
INSERT INTO `sys_logininfor` VALUES (206, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2026-06-05 14:11:25');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-06-05 14:11:29');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-06-05 15:11:02');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-06-05 21:37:33');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '127.0.0.1', '内网IP', 'Downloading Tool', 'Unknown', '1', '验证码已失效', '2026-06-05 22:51:34');
INSERT INTO `sys_logininfor` VALUES (211, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2026-06-06 18:02:45');
INSERT INTO `sys_logininfor` VALUES (212, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-06-06 18:03:24');
INSERT INTO `sys_logininfor` VALUES (213, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-06-06 18:13:21');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由名称',
  `is_frame` int(0) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(0) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2017 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 5, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2025-04-04 14:12:14', 'admin', '2025-04-07 21:09:01', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 6, 'monitor', NULL, '', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2025-04-04 14:12:14', 'admin', '2025-04-07 21:09:07', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 7, 'tool', NULL, '', '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2025-04-04 14:12:14', 'admin', '2025-04-07 21:09:12', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2025-04-04 14:12:14', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2025-04-04 14:12:14', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2025-04-04 14:12:14', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2025-04-04 14:12:14', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2025-04-04 14:12:14', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2025-04-04 14:12:14', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2025-04-04 14:12:14', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2025-04-04 14:12:14', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2025-04-04 14:12:14', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2025-04-04 14:12:14', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2025-04-04 14:12:14', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2025-04-04 14:12:14', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2025-04-04 14:12:14', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2025-04-04 14:12:14', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2025-04-04 14:12:14', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2025-04-04 14:12:14', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2025-04-04 14:12:14', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2025-04-04 14:12:14', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2025-04-04 14:12:14', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2025-04-04 14:12:14', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2001, 'AI管理', 0, 3, 'ai', '', NULL, '', 1, 0, 'M', '0', '0', '', 'drag', 'admin', '2025-04-04 20:33:32', 'admin', '2025-04-09 19:59:08', '');
INSERT INTO `sys_menu` VALUES (2005, '情报管理', 2001, 4, 'intel', 'intel/intel', NULL, '', 1, 0, 'C', '0', '0', '', 'textarea', 'admin', '2025-04-07 21:08:49', 'admin', '2026-06-05 14:31:33', '');
INSERT INTO `sys_menu` VALUES (2011, '胜负管理', 2001, 1, 'winLose', 'ai/WinLose', NULL, '', 1, 0, 'C', '0', '0', '', 'monitor', 'admin', '2026-06-05 16:13:01', 'admin', '2026-06-05 16:14:15', '');
INSERT INTO `sys_menu` VALUES (2012, '角球管理', 2001, 2, 'corner', 'ai/Corner', NULL, '', 1, 0, 'C', '0', '0', NULL, 'eye', 'admin', '2026-06-05 21:39:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '进球管理', 2001, 3, 'goal', 'ai/Goal', NULL, '', 1, 0, 'C', '0', '0', NULL, 'eye', 'admin', '2026-06-05 21:40:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2014, '半全场', 2001, 5, 'halfFull', 'ai/HalfFull', NULL, '', 1, 0, 'C', '0', '0', '', 'eye', 'admin', '2026-06-05 21:41:09', 'admin', '2026-06-05 21:42:11', '');
INSERT INTO `sys_menu` VALUES (2015, '比分管理', 2001, 6, 'score', 'ai/Score', NULL, '', 1, 0, 'C', '0', '0', NULL, 'eye', 'admin', '2026-06-05 21:41:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '分析管理', 0, 1, 'analysis', 'analysis/Analysis', NULL, '', 1, 0, 'C', '0', '0', '', 'druid', 'admin', '2026-06-06 18:04:57', 'admin', '2026-06-06 18:22:28', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2025-04-04 14:12:14', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2025-04-04 14:12:14', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(0) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(0) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(0) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(0) NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 476 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (222, '添加半全场狙击', 1, 'com.soccer.project.business.controller.HalfFullSnipeController.add()', 'POST', 1, 'admin', '研发部门', '/snipe/add', '127.0.0.1', '内网IP', '{\"matchDate\":\"2025-04-11\",\"matchList\":[{\"fullScore\":\"2-0\",\"groupId\":18,\"guestName\":\"拉齐奥\",\"halfScore\":\"0-0\",\"homeName\":\"博多格林特\",\"id\":8,\"isHit\":0,\"leagueName\":\"欧罗巴杯\",\"matchTime\":\"2025-04-10 16:00:00\",\"recommendContent\":\"[\\\"平-胜 1.00\\\",\\\"平-平 5.60\\\"]\",\"serialize\":\"周四001\"}],\"rateOfReturn\":\"100%~200%\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-04-11 23:31:09', 84);
INSERT INTO `sys_oper_log` VALUES (223, '添加赛事', 1, 'com.soccer.project.business.controller.KoiFishController.add()', 'POST', 1, 'admin', '研发部门', '/koiFish/add', '127.0.0.1', '内网IP', '{\"fullScore\":\"1-0\",\"guestName\":\"啊飒飒\",\"homeName\":\"啊飒飒\",\"id\":9,\"leagueName\":\"撒\",\"matchStatus\":0,\"matchTime\":\"2025-04-12 15:34:04\",\"recommendContent\":\"[\\\"胜\\\"]\",\"serialize\":\"啊飒飒\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-04-12 15:34:30', 89);
INSERT INTO `sys_oper_log` VALUES (224, '修改赛事', 1, 'com.soccer.project.business.controller.KoiFishController.update()', 'POST', 1, 'admin', '研发部门', '/koiFish/update', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-04-12 15:34:30\",\"fullScore\":\"1-0\",\"guestName\":\"啊飒飒\",\"hitIndex\":0,\"homeName\":\"啊飒飒\",\"id\":9,\"isHit\":1,\"leagueName\":\"撒\",\"matchStatus\":1,\"matchTime\":\"2025-04-12 15:34:04\",\"recommendContent\":\"[\\\"胜\\\"]\",\"serialize\":\"啊飒飒\",\"status\":0,\"updateTime\":\"2025-04-12 15:34:30\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-04-12 15:52:27', 43);
INSERT INTO `sys_oper_log` VALUES (225, '修改赛事', 1, 'com.soccer.project.business.controller.KoiFishController.update()', 'POST', 1, 'admin', '研发部门', '/koiFish/update', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-04-12 15:34:30\",\"fullScore\":\"1-0\",\"guestName\":\"啊飒飒\",\"hitIndex\":0,\"homeName\":\"啊飒飒\",\"id\":9,\"isHit\":1,\"leagueName\":\"撒\",\"matchStatus\":1,\"matchTime\":\"2025-04-12 15:34:04\",\"recommendContent\":\"[\\\"胜\\\"]\",\"serialize\":\"啊飒飒\",\"status\":0,\"updateTime\":\"2025-04-12 15:34:30\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-04-12 15:52:48', 6);
INSERT INTO `sys_oper_log` VALUES (226, '修改赛事', 1, 'com.soccer.project.business.controller.KoiFishController.update()', 'POST', 1, 'admin', '研发部门', '/koiFish/update', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-04-12 15:34:30\",\"fullScore\":\"1-0\",\"guestName\":\"啊飒飒\",\"hitIndex\":0,\"homeName\":\"啊飒飒\",\"id\":9,\"isHit\":0,\"leagueName\":\"撒\",\"matchStatus\":1,\"matchTime\":\"2025-04-12 15:34:04\",\"recommendContent\":\"[\\\"胜\\\"]\",\"serialize\":\"啊飒飒\",\"status\":0,\"updateTime\":\"2025-04-12 15:34:30\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-04-12 15:53:19', 17);
INSERT INTO `sys_oper_log` VALUES (227, '修改赛事', 1, 'com.soccer.project.business.controller.KoiFishController.update()', 'POST', 1, 'admin', '研发部门', '/koiFish/update', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-04-12 15:34:30\",\"fullScore\":\"1-0\",\"guestName\":\"啊飒飒\",\"hitIndex\":0,\"homeName\":\"啊飒飒\",\"id\":9,\"isHit\":0,\"leagueName\":\"撒\",\"matchStatus\":1,\"matchTime\":\"2025-04-12 15:34:04\",\"recommendContent\":\"[\\\"胜\\\"]\",\"serialize\":\"啊飒飒\",\"status\":0,\"updateTime\":\"2025-04-12 15:34:30\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-04-12 15:53:40', 5);
INSERT INTO `sys_oper_log` VALUES (228, '修改赛事', 1, 'com.soccer.project.business.controller.KoiFishController.update()', 'POST', 1, 'admin', '研发部门', '/koiFish/update', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-04-12 15:34:30\",\"fullScore\":\"1-0\",\"guestName\":\"啊飒飒\",\"hitIndex\":0,\"homeName\":\"啊飒飒\",\"id\":9,\"isHit\":0,\"leagueName\":\"撒\",\"matchStatus\":1,\"matchTime\":\"2025-04-12 15:34:04\",\"recommendContent\":\"[\\\"胜\\\"]\",\"serialize\":\"啊飒飒\",\"status\":0,\"updateTime\":\"2025-04-12 15:34:30\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-04-12 15:54:53', 8);
INSERT INTO `sys_oper_log` VALUES (229, '修改状态', 2, 'com.soccer.project.business.controller.KoiFishController.updateStatus()', 'POST', 1, 'admin', '研发部门', '/koiFish/updateStatus', '127.0.0.1', '内网IP', '{\"id\":9,\"status\":1}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-04-12 15:59:00', 67);
INSERT INTO `sys_oper_log` VALUES (230, '修改状态', 2, 'com.soccer.project.business.controller.KoiFishController.updateStatus()', 'POST', 1, 'admin', '研发部门', '/koiFish/updateStatus', '127.0.0.1', '内网IP', '{\"id\":9,\"status\":99}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-04-12 15:59:04', 18);
INSERT INTO `sys_oper_log` VALUES (231, '专家头像', 1, 'com.soccer.project.business.controller.ExpertController.uploadAvatar()', 'POST', 1, 'admin', '研发部门', '/business/expert/uploadAvatar', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/avatar/2025/04/13/温格教练_20250413002328A001.png\",\"message\":\"请求成功\"}', 0, NULL, '2025-04-13 00:23:28', 50);
INSERT INTO `sys_oper_log` VALUES (232, '修改专家', 2, 'com.soccer.project.business.controller.ExpertController.edit()', 'POST', 1, 'admin', '研发部门', '/business/expert/edit', '127.0.0.1', '内网IP', '{\"avatar\":\"/profile/avatar/2025/04/13/温格教练_20250413002328A001.png\",\"continueNum\":8,\"hitText\":\"近10中10\",\"id\":2,\"name\":\"温格教练\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-04-13 00:23:29', 17);
INSERT INTO `sys_oper_log` VALUES (233, '专家头像', 1, 'com.soccer.project.business.controller.ExpertController.uploadAvatar()', 'POST', 1, 'admin', '研发部门', '/business/expert/uploadAvatar', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/avatar/2025/04/13/许力国_20250413002426A002.png\",\"message\":\"请求成功\"}', 0, NULL, '2025-04-13 00:24:26', 12);
INSERT INTO `sys_oper_log` VALUES (234, '添加专家', 1, 'com.soccer.project.business.controller.ExpertController.add()', 'POST', 1, 'admin', '研发部门', '/business/expert/add', '127.0.0.1', '内网IP', '{\"avatar\":\"/profile/avatar/2025/04/13/许力国_20250413002426A002.png\",\"continueNum\":8,\"hitText\":\"近10中8\",\"name\":\"许力国\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'许力国\' for key \'t_expert.expert_name\'\r\n### The error may exist in com/soccer/project/business/mapper/ExpertMapper.java (best guess)\r\n### The error may involve com.soccer.project.business.mapper.ExpertMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO t_expert  ( name, avatar, hit_text, continue_num )  VALUES  ( ?, ?, ?, ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'许力国\' for key \'t_expert.expert_name\'\n; Duplicate entry \'许力国\' for key \'t_expert.expert_name\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'许力国\' for key \'t_expert.expert_name\'', '2025-04-13 00:24:37', 59);
INSERT INTO `sys_oper_log` VALUES (235, '添加专家', 1, 'com.soccer.project.business.controller.ExpertController.add()', 'POST', 1, 'admin', '研发部门', '/business/expert/add', '127.0.0.1', '内网IP', '{\"avatar\":\"/profile/avatar/2025/04/13/许力国_20250413002426A002.png\",\"continueNum\":8,\"hitText\":\"近10中8\",\"id\":3,\"name\":\"许力国\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-04-13 00:31:46', 3686);
INSERT INTO `sys_oper_log` VALUES (236, '专家头像', 1, 'com.soccer.project.business.controller.ExpertController.uploadAvatar()', 'POST', 1, 'admin', '研发部门', '/business/expert/uploadAvatar', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/avatar/2025/04/13/许力国_20250413003414A001.png\",\"message\":\"请求成功\"}', 0, NULL, '2025-04-13 00:34:14', 55);
INSERT INTO `sys_oper_log` VALUES (237, '添加专家', 1, 'com.soccer.project.business.controller.ExpertController.add()', 'POST', 1, 'admin', '研发部门', '/business/expert/add', '127.0.0.1', '内网IP', '{\"avatar\":\"/profile/avatar/2025/04/13/许力国_20250413003414A001.png\",\"continueNum\":8,\"createTime\":\"2025-04-13 00:34:25\",\"hitText\":\"近10中8\",\"id\":3,\"name\":\"许力国\",\"status\":0,\"updateTime\":\"2025-04-13 00:34:25\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-04-13 00:34:25', 3990);
INSERT INTO `sys_oper_log` VALUES (238, '修改专家', 2, 'com.soccer.project.business.controller.ExpertController.edit()', 'POST', 1, 'admin', '研发部门', '/business/expert/edit', '127.0.0.1', '内网IP', '{\"avatar\":\"/profile/avatar/2025/04/13/许力国_20250413003414A001.png\",\"continueNum\":8,\"createTime\":\"2025-04-13 00:34:26\",\"hitText\":\"近10中8\",\"id\":3,\"name\":\"许力国\",\"sort\":1,\"status\":0,\"updateTime\":\"2025-04-13 00:34:26\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-04-13 00:46:19', 12);
INSERT INTO `sys_oper_log` VALUES (239, '修改专家', 2, 'com.soccer.project.business.controller.ExpertController.edit()', 'POST', 1, 'admin', '研发部门', '/business/expert/edit', '127.0.0.1', '内网IP', '{\"avatar\":\"/profile/avatar/2025/04/13/温格教练_20250413002328A001.png\",\"continueNum\":8,\"createTime\":\"2025-04-06 13:30:37\",\"hitText\":\"近10中10\",\"id\":2,\"name\":\"温格教练\",\"sort\":2,\"status\":1,\"updateTime\":\"2025-04-06 13:30:37\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-04-13 00:47:23', 9);
INSERT INTO `sys_oper_log` VALUES (240, '修改专家', 2, 'com.soccer.project.business.controller.ExpertController.edit()', 'POST', 1, 'admin', '研发部门', '/business/expert/edit', '127.0.0.1', '内网IP', '{\"avatar\":\"/profile/avatar/2025/04/13/许力国_20250413003414A001.png\",\"continueNum\":8,\"createTime\":\"2025-04-13 00:34:26\",\"hitText\":\"近10中8\",\"id\":3,\"name\":\"许力国\",\"sort\":3,\"status\":0,\"updateTime\":\"2025-04-13 00:34:26\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-04-13 00:48:20', 10);
INSERT INTO `sys_oper_log` VALUES (241, '修改专家', 2, 'com.soccer.project.business.controller.ExpertController.edit()', 'POST', 1, 'admin', '研发部门', '/business/expert/edit', '127.0.0.1', '内网IP', '{\"avatar\":\"/profile/avatar/2025/04/13/许力国_20250413003414A001.png\",\"continueNum\":8,\"createTime\":\"2025-04-13 00:34:26\",\"hitText\":\"近10中8\",\"id\":3,\"name\":\"许力国\",\"sort\":1,\"status\":0,\"updateTime\":\"2025-04-13 00:34:26\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-04-13 00:49:44', 23);
INSERT INTO `sys_oper_log` VALUES (242, '专家头像', 1, 'com.soccer.project.business.controller.ExpertController.uploadAvatar()', 'POST', 1, 'admin', '研发部门', '/business/expert/uploadAvatar', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/avatar/2025/04/13/王麻子_20250413130934A001.png\",\"message\":\"请求成功\"}', 0, NULL, '2025-04-13 13:09:34', 93);
INSERT INTO `sys_oper_log` VALUES (243, '添加专家', 1, 'com.soccer.project.business.controller.ExpertController.add()', 'POST', 1, 'admin', '研发部门', '/business/expert/add', '127.0.0.1', '内网IP', '{\"avatar\":\"/profile/avatar/2025/04/13/王麻子_20250413130934A001.png\",\"continueNum\":9,\"hitText\":\"近10中9\",\"id\":5,\"name\":\"王麻子\",\"sort\":3,\"status\":1}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-04-13 13:09:55', 73);
INSERT INTO `sys_oper_log` VALUES (244, '修改专家', 2, 'com.soccer.project.business.controller.ExpertController.edit()', 'POST', 1, 'admin', '研发部门', '/business/expert/edit', '127.0.0.1', '内网IP', '{\"id\":3,\"status\":99}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-04-13 13:37:39', 46);
INSERT INTO `sys_oper_log` VALUES (245, '修改专家', 2, 'com.soccer.project.business.controller.ExpertController.edit()', 'POST', 1, 'admin', '研发部门', '/business/expert/edit', '127.0.0.1', '内网IP', '{\"id\":3,\"status\":-1}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-04-13 13:38:49', 17);
INSERT INTO `sys_oper_log` VALUES (246, '修改方案', 2, 'com.soccer.project.business.controller.SchemeController.edit()', 'POST', 1, 'admin', '研发部门', '/business/scheme/edit', '127.0.0.1', '内网IP', '{\"ballNum\":1,\"createTime\":\"2025-04-07 20:35:08\",\"expertId\":2,\"guestName\":\"sdsd\",\"homeName\":\"sdsd\",\"id\":5,\"isHit\":0,\"leagueName\":\"3sdfsd\",\"likeNum\":12,\"matchTime\":\"2025-04-07 20:34:36\",\"oddsList\":\"[1, 1]\",\"payCode\":\"/profile/avatar/2025/04/07/pay-code_20250407203502A001.jpg\",\"playType\":1,\"status\":0,\"type\":1,\"updateTime\":\"2025-04-07 20:35:08\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-04-13 13:58:30', 24);
INSERT INTO `sys_oper_log` VALUES (247, '修改方案', 2, 'com.soccer.project.business.controller.SchemeController.edit()', 'POST', 1, 'admin', '研发部门', '/business/scheme/edit', '127.0.0.1', '内网IP', '{\"id\":1,\"status\":1}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-04-13 14:09:59', 35);
INSERT INTO `sys_oper_log` VALUES (248, '修改方案', 2, 'com.soccer.project.business.controller.SchemeController.edit()', 'POST', 1, 'admin', '研发部门', '/business/scheme/edit', '127.0.0.1', '内网IP', '{\"id\":5,\"publishTime\":\"2025-04-13 20:45:34\",\"status\":1}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-04-13 20:45:35', 26);
INSERT INTO `sys_oper_log` VALUES (249, '修改方案', 2, 'com.soccer.project.business.controller.SchemeController.edit()', 'POST', 1, 'admin', '研发部门', '/business/scheme/edit', '127.0.0.1', '内网IP', '{\"id\":5,\"status\":99}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-04-13 20:46:31', 16);
INSERT INTO `sys_oper_log` VALUES (250, '专家头像', 1, 'com.soccer.project.business.controller.ExpertController.uploadAvatar()', 'POST', 1, 'admin', '研发部门', '/business/expert/uploadAvatar', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/avatar/2025/04/14/温格教练_20250414200340A001.png\",\"message\":\"请求成功\"}', 0, NULL, '2025-04-14 20:03:40', 77);
INSERT INTO `sys_oper_log` VALUES (251, '修改专家', 2, 'com.soccer.project.business.controller.ExpertController.edit()', 'POST', 1, 'admin', '研发部门', '/business/expert/edit', '127.0.0.1', '内网IP', '{\"avatar\":\"/profile/avatar/2025/04/14/温格教练_20250414200340A001.png\",\"continueNum\":8,\"createTime\":\"2025-04-06 13:30:37\",\"hitText\":\"近10中10\",\"id\":2,\"name\":\"温格教练\",\"sort\":2,\"status\":1,\"updateTime\":\"2025-04-06 13:30:37\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-04-14 20:03:41', 30);
INSERT INTO `sys_oper_log` VALUES (252, '专家头像', 1, 'com.soccer.project.business.controller.ExpertController.uploadAvatar()', 'POST', 1, 'admin', '研发部门', '/business/expert/uploadAvatar', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/avatar/2025/04/14/王麻子_20250414200346A002.png\",\"message\":\"请求成功\"}', 0, NULL, '2025-04-14 20:03:46', 10);
INSERT INTO `sys_oper_log` VALUES (253, '修改专家', 2, 'com.soccer.project.business.controller.ExpertController.edit()', 'POST', 1, 'admin', '研发部门', '/business/expert/edit', '127.0.0.1', '内网IP', '{\"avatar\":\"/profile/avatar/2025/04/14/王麻子_20250414200346A002.png\",\"continueNum\":9,\"createTime\":\"2025-04-13 13:09:54\",\"hitText\":\"近10中9\",\"id\":5,\"name\":\"王麻子\",\"sort\":3,\"status\":1,\"updateTime\":\"2025-04-13 13:09:54\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-04-14 20:03:47', 8);
INSERT INTO `sys_oper_log` VALUES (254, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/upload/2025/04/14/pay-code_20250414200723A003.jpg\",\"message\":\"请求成功\"}', 0, NULL, '2025-04-14 20:07:23', 13);
INSERT INTO `sys_oper_log` VALUES (255, '修改方案', 2, 'com.soccer.project.business.controller.SchemeController.edit()', 'POST', 1, 'admin', '研发部门', '/business/scheme/edit', '127.0.0.1', '内网IP', '{\"ballNum\":\"3\",\"content\":\"【⚡️闪电购单·无忧保障】 \\n ✅ 支付即享专业团队AI精算方案 \\n ✅ 赛果未达预期自动触发极速退款 \\n ✅ 加密支付通道保障资金零风险 \\n 🔐 安全支付 \\n 🔥 立即解锁 » [立即扫码支付] \",\"createTime\":\"2025-04-06 22:54:21\",\"expertId\":2,\"guestName\":\"波鸡\",\"homeName\":\"勒沃库森\",\"id\":1,\"isHit\":0,\"leagueName\":\"德甲\",\"likeNum\":15,\"matchTime\":\"2025-04-06 22:53:14\",\"oddsList\":\"[\\\"-1.75\\\", \\\"1.75\\\"]\",\"payCode\":\"/profile/upload/2025/04/14/pay-code_20250414200723A003.jpg\",\"playType\":1,\"publishTime\":\"2025-04-13 20:45:34\",\"status\":1,\"type\":1,\"updateTime\":\"2025-04-06 22:54:21\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-04-14 20:07:24', 23);
INSERT INTO `sys_oper_log` VALUES (256, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/upload/2025/04/14/intel_banner_20250414200813A004.jpeg\",\"message\":\"请求成功\"}', 0, NULL, '2025-04-14 20:08:13', 9);
INSERT INTO `sys_oper_log` VALUES (257, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/upload/2025/04/14/pay-code_20250414202351A005.jpg\",\"message\":\"请求成功\"}', 0, NULL, '2025-04-14 20:23:51', 11);
INSERT INTO `sys_oper_log` VALUES (258, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/upload/2025/04/14/intel_banner_20250414202355A006.jpeg\",\"message\":\"请求成功\"}', 0, NULL, '2025-04-14 20:23:55', 12);
INSERT INTO `sys_oper_log` VALUES (259, '修改半全场狙击的状态', 2, 'com.soccer.project.business.controller.HalfFullSnipeController.updateStatus()', 'POST', 1, 'admin', '研发部门', '/business/snipe/updateStatus', '127.0.0.1', '内网IP', '{\"id\":18,\"status\":1}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-04-14 21:37:01', 32);
INSERT INTO `sys_oper_log` VALUES (260, '修改半全场狙击', 1, 'com.soccer.project.business.controller.HalfFullSnipeController.update()', 'POST', 1, 'admin', '研发部门', '/business/snipe/update', '127.0.0.1', '内网IP', '{\"id\":18,\"matchDate\":\"2025-04-14\",\"matchList\":[{\"createTime\":\"2025-04-11 23:31:09\",\"fullScore\":\"2-0\",\"groupId\":18,\"guestName\":\"拉齐奥\",\"halfScore\":\"0-0\",\"homeName\":\"博多格林特\",\"id\":8,\"isHit\":0,\"leagueName\":\"欧罗巴杯\",\"matchStatus\":0,\"matchTime\":\"2025-04-10 16:00:00\",\"recommendContent\":\"[\\\"平-胜 1.00\\\", \\\"平-平 5.60\\\"]\",\"serialize\":\"周四001\",\"updateTime\":\"2025-04-11 23:31:09\"}],\"rateOfReturn\":\"100%~200%\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-04-14 23:16:51', 35);
INSERT INTO `sys_oper_log` VALUES (261, '修改半全场狙击', 1, 'com.soccer.project.business.controller.HalfFullSnipeController.update()', 'POST', 1, 'admin', '研发部门', '/business/snipe/update', '127.0.0.1', '内网IP', '{\"id\":18,\"matchDate\":\"2025-04-14\",\"matchList\":[{\"createTime\":\"2025-04-11 23:31:09\",\"fullScore\":\"2-0\",\"groupId\":18,\"guestName\":\"拉齐奥\",\"halfScore\":\"0-0\",\"homeName\":\"博多格林特\",\"id\":8,\"isHit\":0,\"leagueName\":\"欧罗巴杯\",\"matchStatus\":0,\"matchTime\":\"2025-04-10 16:00:00\",\"recommendContent\":\"[\\\"平-胜 1.00\\\", \\\"平-平 5.60\\\"]\",\"serialize\":\"周四001\",\"updateTime\":\"2025-04-11 23:31:09\"}],\"rateOfReturn\":\"100%~300%\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-04-14 23:31:26', 14);
INSERT INTO `sys_oper_log` VALUES (262, '专家头像', 1, 'com.soccer.project.business.controller.ExpertController.uploadAvatar()', 'POST', 1, 'admin', '研发部门', '/business/expert/uploadAvatar', '113.87.239.18', 'XX XX', '', '{\"code\":200,\"data\":\"/profile/avatar/2025/04/18/温格教练_20250418115438A001.png\",\"message\":\"请求成功\"}', 0, NULL, '2025-04-18 11:54:38', 109);
INSERT INTO `sys_oper_log` VALUES (263, '修改专家', 2, 'com.soccer.project.business.controller.ExpertController.edit()', 'POST', 1, 'admin', '研发部门', '/business/expert/edit', '113.87.239.18', 'XX XX', '{\"avatar\":\"/profile/avatar/2025/04/18/温格教练_20250418115438A001.png\",\"continueNum\":8,\"createTime\":\"2025-04-06 13:30:37\",\"hitText\":\"近10中10\",\"id\":2,\"name\":\"温格教练\",\"sort\":2,\"status\":1,\"updateTime\":\"2025-04-06 13:30:37\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-04-18 11:54:39', 30);
INSERT INTO `sys_oper_log` VALUES (264, '专家头像', 1, 'com.soccer.project.business.controller.ExpertController.uploadAvatar()', 'POST', 1, 'admin', '研发部门', '/business/expert/uploadAvatar', '113.87.239.18', 'XX XX', '', '{\"code\":200,\"data\":\"/profile/avatar/2025/04/18/王麻子_20250418115445A002.png\",\"message\":\"请求成功\"}', 0, NULL, '2025-04-18 11:54:45', 3);
INSERT INTO `sys_oper_log` VALUES (265, '修改专家', 2, 'com.soccer.project.business.controller.ExpertController.edit()', 'POST', 1, 'admin', '研发部门', '/business/expert/edit', '113.87.239.18', 'XX XX', '{\"avatar\":\"/profile/avatar/2025/04/18/王麻子_20250418115445A002.png\",\"continueNum\":9,\"createTime\":\"2025-04-13 13:09:54\",\"hitText\":\"近10中9\",\"id\":5,\"name\":\"王麻子\",\"sort\":3,\"status\":1,\"updateTime\":\"2025-04-13 13:09:54\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-04-18 11:54:46', 10);
INSERT INTO `sys_oper_log` VALUES (266, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '113.87.239.18', 'XX XX', '', '{\"code\":200,\"data\":\"/profile/upload/2025/04/18/intel_banner_20250418115503A003.jpeg\",\"message\":\"请求成功\"}', 0, NULL, '2025-04-18 11:55:03', 9);
INSERT INTO `sys_oper_log` VALUES (267, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '113.87.239.18', 'XX XX', '', '{\"code\":200,\"data\":\"/profile/upload/2025/04/18/pay-code_20250418144019A004.jpg\",\"message\":\"请求成功\"}', 0, NULL, '2025-04-18 14:40:19', 2);
INSERT INTO `sys_oper_log` VALUES (268, '修改方案', 2, 'com.soccer.project.business.controller.SchemeController.edit()', 'POST', 1, 'admin', '研发部门', '/business/scheme/edit', '113.87.239.18', 'XX XX', '{\"ballNum\":\"3\",\"content\":\"【⚡️闪电购单·无忧保障】 \\n ✅ 支付即享专业团队AI精算方案 \\n ✅ 赛果未达预期自动触发极速退款 \\n ✅ 加密支付通道保障资金零风险 \\n 🔐 安全支付 \\n 🔥 立即解锁 » [立即扫码支付] \",\"createTime\":\"2025-04-06 22:54:21\",\"expertId\":2,\"fullScore\":\"1-0\",\"guestName\":\"波鸡\",\"hitIndex\":0,\"homeName\":\"勒沃库森\",\"id\":1,\"isHit\":1,\"leagueName\":\"德甲\",\"likeNum\":15,\"matchTime\":\"2025-04-06 22:53:14\",\"oddsList\":\"[\\\"-1.75\\\", \\\"1.75\\\"]\",\"payCode\":\"/profile/upload/2025/04/18/pay-code_20250418144019A004.jpg\",\"playType\":1,\"publishTime\":\"2025-04-13 20:45:34\",\"recommendIndex\":0,\"status\":1,\"type\":1,\"updateTime\":\"2025-04-06 22:54:21\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-04-18 14:40:21', 28);
INSERT INTO `sys_oper_log` VALUES (269, '个人信息', 2, 'com.soccer.project.system.controller.SysProfileController.updatePwd()', 'PUT', 1, 'admin', '研发部门', '/system/user/profile/updatePwd', '211.20.52.91', 'XX XX', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 18:36:48', 386);
INSERT INTO `sys_oper_log` VALUES (270, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '60.248.49.19', 'XX XX', '', '{\"code\":200,\"data\":\"/profile/upload/2025/04/20/intel_banner_20250420211540A001.jpeg\",\"message\":\"请求成功\"}', 0, NULL, '2025-04-20 21:15:40', 118);
INSERT INTO `sys_oper_log` VALUES (271, '专家头像', 1, 'com.soccer.project.business.controller.ExpertController.uploadAvatar()', 'POST', 1, 'admin', '研发部门', '/business/expert/uploadAvatar', '60.248.49.19', 'XX XX', '', '{\"code\":200,\"data\":\"/profile/avatar/2025/04/20/温格教练_20250420211645A002.png\",\"message\":\"请求成功\"}', 0, NULL, '2025-04-20 21:16:45', 3);
INSERT INTO `sys_oper_log` VALUES (272, '修改专家', 2, 'com.soccer.project.business.controller.ExpertController.edit()', 'POST', 1, 'admin', '研发部门', '/business/expert/edit', '60.248.49.19', 'XX XX', '{\"avatar\":\"/profile/avatar/2025/04/20/温格教练_20250420211645A002.png\",\"continueNum\":8,\"createTime\":\"2025-04-06 13:30:37\",\"hitText\":\"近10中10\",\"id\":2,\"name\":\"温格教练\",\"sort\":2,\"status\":1,\"updateTime\":\"2025-04-06 13:30:37\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-04-20 21:16:47', 130);
INSERT INTO `sys_oper_log` VALUES (273, '专家头像', 1, 'com.soccer.project.business.controller.ExpertController.uploadAvatar()', 'POST', 1, 'admin', '研发部门', '/business/expert/uploadAvatar', '60.248.49.19', 'XX XX', '', '{\"code\":200,\"data\":\"/profile/avatar/2025/04/20/王麻子_20250420211656A003.png\",\"message\":\"请求成功\"}', 0, NULL, '2025-04-20 21:16:56', 4);
INSERT INTO `sys_oper_log` VALUES (274, '修改专家', 2, 'com.soccer.project.business.controller.ExpertController.edit()', 'POST', 1, 'admin', '研发部门', '/business/expert/edit', '60.248.49.19', 'XX XX', '{\"avatar\":\"/profile/avatar/2025/04/20/王麻子_20250420211656A003.png\",\"continueNum\":9,\"createTime\":\"2025-04-13 13:09:54\",\"hitText\":\"近10中9\",\"id\":5,\"name\":\"王麻子\",\"sort\":3,\"status\":1,\"updateTime\":\"2025-04-13 13:09:54\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-04-20 21:16:57', 155);
INSERT INTO `sys_oper_log` VALUES (275, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '60.248.49.19', 'XX XX', '', '{\"code\":200,\"data\":\"/profile/upload/2025/04/20/pay-code_20250420211725A004.jpg\",\"message\":\"请求成功\"}', 0, NULL, '2025-04-20 21:17:25', 2);
INSERT INTO `sys_oper_log` VALUES (276, '修改方案', 2, 'com.soccer.project.business.controller.SchemeController.edit()', 'POST', 1, 'admin', '研发部门', '/business/scheme/edit', '60.248.49.19', 'XX XX', '{\"ballNum\":\"3\",\"content\":\"【⚡️闪电购单·无忧保障】 \\n ✅ 支付即享专业团队AI精算方案 \\n ✅ 赛果未达预期自动触发极速退款 \\n ✅ 加密支付通道保障资金零风险 \\n 🔐 安全支付 \\n 🔥 立即解锁 » [立即扫码支付] \",\"createTime\":\"2025-04-06 22:54:21\",\"expertId\":2,\"fullScore\":\"1-0\",\"guestName\":\"波鸡\",\"hitIndex\":0,\"homeName\":\"勒沃库森\",\"id\":1,\"isHit\":1,\"leagueName\":\"德甲\",\"likeNum\":15,\"matchTime\":\"2025-04-06 22:53:14\",\"oddsList\":\"[\\\"-1.75\\\", \\\"1.75\\\"]\",\"payCode\":\"/profile/upload/2025/04/20/pay-code_20250420211725A004.jpg\",\"playType\":1,\"publishTime\":\"2025-04-13 20:45:34\",\"recommendIndex\":0,\"status\":1,\"type\":1,\"updateTime\":\"2025-04-06 22:54:21\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-04-20 21:17:26', 78);
INSERT INTO `sys_oper_log` VALUES (277, '专家头像', 1, 'com.soccer.project.business.controller.ExpertController.uploadAvatar()', 'POST', 1, 'admin', '研发部门', '/business/expert/uploadAvatar', '188.253.120.200', 'XX XX', '', '{\"code\":200,\"data\":\"/profile/avatar/2025/04/23/1_20250423231636A005.jpg\",\"message\":\"请求成功\"}', 0, NULL, '2025-04-23 23:16:36', 3);
INSERT INTO `sys_oper_log` VALUES (278, '添加专家', 1, 'com.soccer.project.business.controller.ExpertController.add()', 'POST', 1, 'admin', '研发部门', '/business/expert/add', '188.253.120.200', 'XX XX', '{\"avatar\":\"/profile/avatar/2025/04/23/1_20250423231636A005.jpg\",\"continueNum\":9,\"hitText\":\"\",\"name\":\"解说员涛爷\",\"sort\":3,\"status\":1}', '{\"code\":411,\"message\":\"字段不能为空\"}', 0, NULL, '2025-04-23 23:16:54', 1);
INSERT INTO `sys_oper_log` VALUES (279, '添加专家', 1, 'com.soccer.project.business.controller.ExpertController.add()', 'POST', 1, 'admin', '研发部门', '/business/expert/add', '188.253.120.200', 'XX XX', '{\"avatar\":\"/profile/avatar/2025/04/23/1_20250423231636A005.jpg\",\"continueNum\":9,\"hitText\":\"1\",\"id\":6,\"name\":\"解说员涛爷\",\"sort\":3,\"status\":1}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-04-23 23:16:58', 24);
INSERT INTO `sys_oper_log` VALUES (280, '修改专家', 2, 'com.soccer.project.business.controller.ExpertController.edit()', 'POST', 1, 'admin', '研发部门', '/business/expert/edit', '188.253.120.200', 'XX XX', '{\"avatar\":\"/profile/avatar/2025/04/23/1_20250423231636A005.jpg\",\"continueNum\":9,\"createTime\":\"2025-04-23 23:16:58\",\"hitText\":\"9连红\",\"id\":6,\"name\":\"解说员涛爷\",\"sort\":3,\"status\":1,\"updateTime\":\"2025-04-23 23:16:58\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-04-23 23:17:14', 8);
INSERT INTO `sys_oper_log` VALUES (281, '专家头像', 1, 'com.soccer.project.business.controller.ExpertController.uploadAvatar()', 'POST', 1, 'admin', '研发部门', '/business/expert/uploadAvatar', '188.253.120.200', 'XX XX', '', '{\"code\":200,\"data\":\"/profile/avatar/2025/04/23/2_20250423231957A006.png\",\"message\":\"请求成功\"}', 0, NULL, '2025-04-23 23:19:57', 8);
INSERT INTO `sys_oper_log` VALUES (282, '修改专家', 2, 'com.soccer.project.business.controller.ExpertController.edit()', 'POST', 1, 'admin', '研发部门', '/business/expert/edit', '188.253.120.200', 'XX XX', '{\"avatar\":\"/profile/avatar/2025/04/23/2_20250423231957A006.png\",\"continueNum\":9,\"createTime\":\"2025-04-23 23:16:58\",\"hitText\":\"9连红\",\"id\":6,\"name\":\"解说员涛爷\",\"sort\":3,\"status\":1,\"updateTime\":\"2025-04-23 23:16:58\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-04-23 23:20:00', 10);
INSERT INTO `sys_oper_log` VALUES (283, '修改半全场狙击', 1, 'com.soccer.project.business.controller.HalfFullSnipeController.update()', 'POST', 1, 'admin', '研发部门', '/business/snipe/update', '127.0.0.1', '内网IP', '{\"id\":19,\"matchDate\":\"2025-04-15\",\"matchList\":[{\"createTime\":\"2025-04-15 17:40:56\",\"fullScore\":\"\",\"groupId\":19,\"guestName\":\"富勒姆\",\"halfScore\":\"\",\"homeName\":\"伯恩茅斯\",\"id\":9,\"isHit\":0,\"leagueName\":\"英超\",\"matchStatus\":1,\"matchTime\":\"2025-04-15 09:40:05\",\"recommendContent\":\"[\\\"胜-胜 3.30\\\", \\\"平-胜 5.10\\\"]\",\"serialize\":\"周一004\",\"updateTime\":\"2025-04-15 17:40:56\"}],\"rateOfReturn\":\"2570%~3672%\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-04-27 22:14:23', 87);
INSERT INTO `sys_oper_log` VALUES (284, '添加半全场狙击', 1, 'com.soccer.project.business.controller.HalfFullSnipeController.add()', 'POST', 1, 'admin', '研发部门', '/business/snipe/add', '127.0.0.1', '内网IP', '{\"matchDate\":\"2025-04-24\",\"matchList\":[{\"groupId\":20,\"guestName\":\"asd\",\"homeName\":\"asd\",\"id\":13,\"isHit\":0,\"leagueName\":\"asd\",\"matchStatus\":0,\"matchTime\":\"2025-04-16 16:00:00\",\"serialize\":\"asd\"}],\"rateOfReturn\":\"esd\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-04-27 22:14:37', 62);
INSERT INTO `sys_oper_log` VALUES (285, '修改半全场狙击', 1, 'com.soccer.project.business.controller.HalfFullSnipeController.update()', 'POST', 1, 'admin', '研发部门', '/business/snipe/update', '127.0.0.1', '内网IP', '{\"id\":20,\"matchDate\":\"2025-04-24\",\"matchList\":[{\"groupId\":20,\"guestName\":\"asd\",\"homeName\":\"asd\",\"id\":13,\"isHit\":0,\"leagueName\":\"asd\",\"matchStatus\":0,\"matchTime\":\"2025-04-16 16:00:00\",\"serialize\":\"asd\",\"updateTime\":\"2025-04-27 22:14:37\"}],\"rateOfReturn\":\"esd\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-04-27 22:14:40', 16);
INSERT INTO `sys_oper_log` VALUES (286, '添加北单锦囊', 1, 'com.soccer.project.business.controller.LightningSecretController.add()', 'POST', 1, 'admin', '研发部门', '/business/lightningSecret/add', '127.0.0.1', '内网IP', '{\"matchDate\":\"2025-04-22\",\"matchList\":[{\"groupId\":2,\"guestName\":\"sd\",\"homeName\":\"sd\",\"id\":3,\"isHit\":0,\"leagueName\":\"sd\",\"matchTime\":\"2025-04-27 14:33:53\",\"serialize\":\"sd\"}],\"rateOfReturn\":\"dsd\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-04-27 22:34:06', 62);
INSERT INTO `sys_oper_log` VALUES (287, '修改北单的状态', 2, 'com.soccer.project.business.controller.LightningSecretController.updateStatus()', 'POST', 1, 'admin', '研发部门', '/business/lightningSecret/updateStatus', '127.0.0.1', '内网IP', '{\"id\":2,\"status\":-1}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-04-27 22:35:28', 25);
INSERT INTO `sys_oper_log` VALUES (288, '添加北单锦囊', 1, 'com.soccer.project.business.controller.LightningSecretController.add()', 'POST', 1, 'admin', '研发部门', '/business/lightningSecret/add', '127.0.0.1', '内网IP', '{\"matchDate\":\"2025-04-27\",\"matchList\":[{\"groupId\":3,\"guestName\":\"sd\",\"homeName\":\"sd\",\"id\":4,\"isHit\":0,\"leagueName\":\"sd\",\"matchTime\":\"2025-04-22 16:00:00\",\"serialize\":\"sd\"}],\"rateOfReturn\":\"sd\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-04-27 22:35:42', 13);
INSERT INTO `sys_oper_log` VALUES (289, '修改北单锦囊', 2, 'com.soccer.project.business.controller.LightningSecretController.update()', 'POST', 1, 'admin', '研发部门', '/business/lightningSecret/update', '127.0.0.1', '内网IP', '{\"id\":3,\"matchDate\":\"2025-04-27\",\"matchList\":[{\"groupId\":3,\"guestName\":\"sd\",\"homeName\":\"sd\",\"id\":4,\"isHit\":0,\"leagueName\":\"sd\",\"matchStatus\":0,\"matchTime\":\"2025-04-22 16:00:00\",\"serialize\":\"sd\",\"updateTime\":\"2025-04-27 22:35:42\"}],\"rateOfReturn\":\"sd\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-04-27 22:35:47', 19);
INSERT INTO `sys_oper_log` VALUES (290, '修改北单锦囊', 2, 'com.soccer.project.business.controller.LightningSecretController.update()', 'POST', 1, 'admin', '研发部门', '/business/lightningSecret/update', '127.0.0.1', '内网IP', '{\"id\":3,\"matchDate\":\"2025-04-27\",\"matchList\":[{\"groupId\":3,\"guestName\":\"sd\",\"homeName\":\"sd\",\"id\":4,\"isHit\":0,\"leagueName\":\"sd\",\"matchStatus\":1,\"matchTime\":\"2025-04-22 16:00:00\",\"serialize\":\"sd\",\"updateTime\":\"2025-04-27 22:35:42\"}],\"rateOfReturn\":\"sd\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-04-27 22:35:55', 11);
INSERT INTO `sys_oper_log` VALUES (291, '添加赛事', 1, 'com.soccer.project.business.controller.KoiFishController.add()', 'POST', 1, 'admin', '研发部门', '/business/koiFish/add', '127.0.0.1', '内网IP', '{\"guestName\":\"sd\",\"homeName\":\"sd\",\"id\":11,\"leagueName\":\"sd\",\"matchDate\":\"2025-04-09\",\"matchStatus\":0,\"matchTime\":\"2025-04-08 00:00:00\",\"serialize\":\"sd\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-04-27 22:48:04', 54);
INSERT INTO `sys_oper_log` VALUES (292, '修改赛事', 1, 'com.soccer.project.business.controller.KoiFishController.update()', 'POST', 1, 'admin', '研发部门', '/business/koiFish/update', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-04-12 15:34:30\",\"fullScore\":\"1-0\",\"guestName\":\"西部联\",\"hitIndex\":0,\"homeName\":\"布里斯班狮吼\",\"id\":9,\"isHit\":1,\"leagueName\":\"澳洲甲\",\"matchDate\":\"2025-04-18\",\"matchStatus\":0,\"matchTime\":\"2025-04-17 15:34:04\",\"recommendContent\":\"[\\\"胜\\\"]\",\"serialize\":\"周四001\",\"status\":99,\"updateTime\":\"2025-04-12 15:34:30\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-04-27 22:51:31', 13);
INSERT INTO `sys_oper_log` VALUES (293, '修改赛事', 1, 'com.soccer.project.business.controller.KoiFishController.update()', 'POST', 1, 'admin', '研发部门', '/business/koiFish/update', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-04-12 15:34:30\",\"fullScore\":\"1-0\",\"guestName\":\"西部联\",\"hitIndex\":0,\"homeName\":\"布里斯班狮吼\",\"id\":9,\"isHit\":1,\"leagueName\":\"澳洲甲\",\"matchDate\":\"2025-04-18\",\"matchStatus\":1,\"matchTime\":\"2025-04-17 15:34:04\",\"recommendContent\":\"[\\\"胜\\\"]\",\"serialize\":\"周四001\",\"status\":99,\"updateTime\":\"2025-04-12 15:34:30\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-04-27 22:51:36', 11);
INSERT INTO `sys_oper_log` VALUES (294, '专家头像', 1, 'com.soccer.project.business.controller.ExpertController.uploadAvatar()', 'POST', 1, 'admin', '研发部门', '/business/expert/uploadAvatar', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/avatar/2025/04/27/温格教练_20250427225916A001.png\",\"message\":\"请求成功\"}', 0, NULL, '2025-04-27 22:59:16', 82);
INSERT INTO `sys_oper_log` VALUES (295, '修改专家', 2, 'com.soccer.project.business.controller.ExpertController.edit()', 'POST', 1, 'admin', '研发部门', '/business/expert/edit', '127.0.0.1', '内网IP', '{\"avatar\":\"/profile/avatar/2025/04/27/温格教练_20250427225916A001.png\",\"continueNum\":8,\"createTime\":\"2025-04-06 13:30:37\",\"hitText\":\"近10中10\",\"id\":2,\"name\":\"温格教练\",\"sort\":2,\"status\":1,\"updateTime\":\"2025-04-06 13:30:37\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-04-27 22:59:17', 19);
INSERT INTO `sys_oper_log` VALUES (296, '专家头像', 1, 'com.soccer.project.business.controller.ExpertController.uploadAvatar()', 'POST', 1, 'admin', '研发部门', '/business/expert/uploadAvatar', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/avatar/2025/04/27/王麻子_20250427230009A002.png\",\"message\":\"请求成功\"}', 0, NULL, '2025-04-27 23:00:09', 15);
INSERT INTO `sys_oper_log` VALUES (297, '修改专家', 2, 'com.soccer.project.business.controller.ExpertController.edit()', 'POST', 1, 'admin', '研发部门', '/business/expert/edit', '127.0.0.1', '内网IP', '{\"avatar\":\"/profile/avatar/2025/04/27/王麻子_20250427230009A002.png\",\"continueNum\":9,\"createTime\":\"2025-04-13 13:09:54\",\"hitText\":\"近10中9\",\"id\":5,\"name\":\"王麻子\",\"sort\":3,\"status\":1,\"updateTime\":\"2025-04-13 13:09:54\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-04-27 23:00:10', 6);
INSERT INTO `sys_oper_log` VALUES (298, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/upload/2025/05/02/pay-code_20250502111554A001.jpg\",\"message\":\"请求成功\"}', 0, NULL, '2025-05-02 11:15:54', 100);
INSERT INTO `sys_oper_log` VALUES (299, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/upload/2025/05/02/ai-banner_20250502111729A002.jpeg\",\"message\":\"请求成功\"}', 0, NULL, '2025-05-02 11:17:29', 12);
INSERT INTO `sys_oper_log` VALUES (300, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/upload/2025/05/02/ai-banner_20250502111835A003.jpeg\",\"message\":\"请求成功\"}', 0, NULL, '2025-05-02 11:18:35', 18);
INSERT INTO `sys_oper_log` VALUES (301, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/upload/2025/05/02/pay-code_20250502111841A004.jpg\",\"message\":\"请求成功\"}', 0, NULL, '2025-05-02 11:18:41', 9);
INSERT INTO `sys_oper_log` VALUES (302, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/upload/2025/05/02/pay-code_20250502111851A005.jpg\",\"message\":\"请求成功\"}', 0, NULL, '2025-05-02 11:18:51', 17);
INSERT INTO `sys_oper_log` VALUES (303, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/upload/2025/05/02/pay-code_20250502112052A006.jpg\",\"message\":\"请求成功\"}', 0, NULL, '2025-05-02 11:20:52', 14);
INSERT INTO `sys_oper_log` VALUES (304, '添加半全场狙击', 1, 'com.soccer.project.business.controller.HalfFullSnipeController.add()', 'POST', 1, 'admin', '研发部门', '/business/snipe/add', '127.0.0.1', '内网IP', '{\"matchDate\":\"2025-05-02\",\"matchList\":[{\"groupId\":21,\"guestName\":\"狼队\",\"homeName\":\"曼彻斯特城\",\"id\":14,\"isHit\":0,\"leagueName\":\"英超\",\"matchStatus\":0,\"matchTime\":\"2025-05-02 03:22:11\",\"serialize\":\"周五013\"}],\"rateOfReturn\":\"100%~200%\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-05-02 11:22:40', 83);
INSERT INTO `sys_oper_log` VALUES (305, '修改半全场狙击的状态', 2, 'com.soccer.project.business.controller.HalfFullSnipeController.updateStatus()', 'POST', 1, 'admin', '研发部门', '/business/snipe/updateStatus', '127.0.0.1', '内网IP', '{\"id\":20,\"status\":-1}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-05-02 11:28:55', 44);
INSERT INTO `sys_oper_log` VALUES (306, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/upload/2025/05/02/pay-code_20250502121901A001.jpg\",\"message\":\"请求成功\"}', 0, NULL, '2025-05-02 12:19:01', 85);
INSERT INTO `sys_oper_log` VALUES (307, '修改半全场狙击', 1, 'com.soccer.project.business.controller.HalfFullSnipeController.update()', 'POST', 1, 'admin', '研发部门', '/business/snipe/update', '127.0.0.1', '内网IP', '{\"id\":21,\"matchDate\":\"2025-05-02\",\"matchList\":[{\"groupId\":21,\"guestName\":\"狼队\",\"homeName\":\"曼彻斯特城\",\"id\":14,\"isHit\":0,\"leagueName\":\"英超\",\"matchStatus\":0,\"matchTime\":\"2025-05-02 03:22:11\",\"serialize\":\"周五013\",\"updateTime\":\"2025-05-02 11:22:40\"}],\"payCode\":\"/profile/upload/2025/05/02/pay-code_20250502121901A001.jpg\",\"rateOfReturn\":\"100%~200%\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-05-02 12:19:02', 61);
INSERT INTO `sys_oper_log` VALUES (308, '修改半全场狙击的状态', 2, 'com.soccer.project.business.controller.HalfFullSnipeController.updateStatus()', 'POST', 1, 'admin', '研发部门', '/business/snipe/updateStatus', '127.0.0.1', '内网IP', '{\"id\":21,\"status\":1}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-05-02 12:33:17', 23);
INSERT INTO `sys_oper_log` VALUES (309, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/upload/2025/05/02/pay-code_20250502123519A001.jpg\",\"message\":\"请求成功\"}', 0, NULL, '2025-05-02 12:35:19', 25);
INSERT INTO `sys_oper_log` VALUES (310, '添加半全场狙击', 1, 'com.soccer.project.business.controller.HalfFullSnipeController.add()', 'POST', 1, 'admin', '研发部门', '/business/snipe/add', '127.0.0.1', '内网IP', '{\"matchDate\":\"2025-05-02\",\"matchList\":[{\"groupId\":22,\"guestName\":\"赫塔菲\",\"homeName\":\"巴列卡诺\",\"id\":15,\"isHit\":0,\"leagueName\":\"西甲\",\"matchStatus\":0,\"matchTime\":\"2025-05-02 04:35:37\",\"serialize\":\"周五014\"}],\"payCode\":\"/profile/upload/2025/05/02/pay-code_20250502123519A001.jpg\",\"rateOfReturn\":\"100%~200%\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-05-02 12:35:56', 42);
INSERT INTO `sys_oper_log` VALUES (311, '修改半全场狙击的状态', 2, 'com.soccer.project.business.controller.HalfFullSnipeController.updateStatus()', 'POST', 1, 'admin', '研发部门', '/business/snipe/updateStatus', '127.0.0.1', '内网IP', '{\"id\":22,\"status\":1}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-05-02 12:37:23', 59);
INSERT INTO `sys_oper_log` VALUES (312, '修改半全场狙击的状态', 2, 'com.soccer.project.business.controller.HalfFullSnipeController.updateStatus()', 'POST', 1, 'admin', '研发部门', '/business/snipe/updateStatus', '127.0.0.1', '内网IP', '{\"id\":22,\"status\":-1}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-05-02 12:40:18', 31);
INSERT INTO `sys_oper_log` VALUES (313, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/upload/2025/05/02/pay-code_20250502125852A001.jpg\",\"message\":\"请求成功\"}', 0, NULL, '2025-05-02 12:58:52', 103);
INSERT INTO `sys_oper_log` VALUES (314, '添加北单锦囊', 1, 'com.soccer.project.business.controller.SingleBagController.add()', 'POST', 1, 'admin', '研发部门', '/business/singleBag/add', '127.0.0.1', '内网IP', '{\"matchDate\":\"2025-05-02\",\"matchList\":[{\"groupId\":27,\"guestName\":\"金泉尚武\",\"homeName\":\"浦项制铁\",\"id\":8,\"isHit\":0,\"leagueName\":\"韩K联\",\"matchStatus\":0,\"matchTime\":\"2025-05-02 04:59:22\",\"serialize\":\"北单067\"}]}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-05-02 13:01:57', 125);
INSERT INTO `sys_oper_log` VALUES (315, '修改北单的状态', 2, 'com.soccer.project.business.controller.SingleBagController.updateStatus()', 'POST', 1, 'admin', '研发部门', '/business/singleBag/updateStatus', '127.0.0.1', '内网IP', '{\"id\":27,\"status\":1}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-05-02 13:02:04', 14);
INSERT INTO `sys_oper_log` VALUES (316, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/upload/2025/05/02/pay-code_20250502130523A001.jpg\",\"message\":\"请求成功\"}', 0, NULL, '2025-05-02 13:05:23', 41);
INSERT INTO `sys_oper_log` VALUES (317, '修改北单锦囊', 2, 'com.soccer.project.business.controller.SingleBagController.update()', 'POST', 1, 'admin', '研发部门', '/business/singleBag/update', '127.0.0.1', '内网IP', '{\"id\":27,\"matchDate\":\"2025-05-02\",\"matchList\":[{\"groupId\":27,\"guestName\":\"金泉尚武\",\"homeName\":\"浦项制铁\",\"id\":8,\"isHit\":0,\"leagueName\":\"韩K联\",\"matchStatus\":0,\"matchTime\":\"2025-05-02 04:59:22\",\"serialize\":\"北单067\",\"updateTime\":\"2025-05-02 13:01:57\"}],\"payCode\":\"/profile/upload/2025/05/02/pay-code_20250502130523A001.jpg\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-05-02 13:05:25', 37);
INSERT INTO `sys_oper_log` VALUES (318, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/upload/2025/05/02/pay-code_20250502130544A002.jpg\",\"message\":\"请求成功\"}', 0, NULL, '2025-05-02 13:05:44', 14);
INSERT INTO `sys_oper_log` VALUES (319, '修改北单锦囊', 2, 'com.soccer.project.business.controller.SingleBagController.update()', 'POST', 1, 'admin', '研发部门', '/business/singleBag/update', '127.0.0.1', '内网IP', '{\"id\":27,\"matchDate\":\"2025-05-02\",\"matchList\":[{\"groupId\":27,\"guestName\":\"金泉尚武\",\"homeName\":\"浦项制铁\",\"id\":8,\"isHit\":0,\"leagueName\":\"韩K联\",\"matchStatus\":0,\"matchTime\":\"2025-05-02 04:59:22\",\"serialize\":\"北单067\",\"updateTime\":\"2025-05-02 13:01:57\"}],\"payCode\":\"/profile/upload/2025/05/02/pay-code_20250502130544A002.jpg\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-05-02 13:07:02', 28898);
INSERT INTO `sys_oper_log` VALUES (320, '修改北单锦囊', 2, 'com.soccer.project.business.controller.SingleBagController.update()', 'POST', 1, 'admin', '研发部门', '/business/singleBag/update', '127.0.0.1', '内网IP', '{\"id\":27,\"matchDate\":\"2025-05-02\",\"matchList\":[{\"groupId\":27,\"guestName\":\"金泉尚武\",\"homeName\":\"浦项制铁\",\"id\":8,\"isHit\":0,\"leagueName\":\"韩K联\",\"matchStatus\":0,\"matchTime\":\"2025-05-02 04:59:22\",\"serialize\":\"北单067\",\"updateTime\":\"2025-05-02 13:01:57\"}],\"payCode\":\"/profile/upload/2025/05/02/pay-code_20250502130544A002.jpg\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-05-02 13:07:22', 4504);
INSERT INTO `sys_oper_log` VALUES (321, '修改北单的状态', 2, 'com.soccer.project.business.controller.SingleBagController.updateStatus()', 'POST', 1, 'admin', '研发部门', '/business/singleBag/updateStatus', '127.0.0.1', '内网IP', '{\"id\":19,\"status\":1}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-05-02 13:17:40', 31);
INSERT INTO `sys_oper_log` VALUES (322, '修改北单锦囊', 2, 'com.soccer.project.business.controller.SingleBagController.update()', 'POST', 1, 'admin', '研发部门', '/business/singleBag/update', '127.0.0.1', '内网IP', '{\"id\":27,\"matchDate\":\"2025-05-02\",\"matchList\":[{\"groupId\":27,\"guestName\":\"金泉尚武\",\"homeName\":\"浦项制铁\",\"id\":8,\"isHit\":0,\"leagueName\":\"韩K联\",\"matchStatus\":0,\"matchTime\":\"2025-05-02 04:59:22\",\"serialize\":\"北单067\",\"updateTime\":\"2025-05-02 13:01:57\"},{\"guestName\":\"干亚斯堡\",\"homeName\":\"安塔利亚体育\",\"isHit\":0,\"leagueName\":\"土超\",\"matchStatus\":0,\"matchTime\":\"2025-05-02 05:44:35\",\"serialize\":\"北单083\"}],\"payCode\":\"/profile/upload/2025/05/02/pay-code_20250502130544A002.jpg\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'group_id\' cannot be null\r\n### The error may exist in file [D:\\workspace\\soccer-manager-admin\\target\\classes\\mybatis\\business\\SingleBagMatchMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO t_single_bag_match         (id,group_id,league_name,match_time,match_status,serialize,home_name,guest_name,half_score,full_score,recommend_content,         is_hit,hit_index         )         VALUES                        (?,?,?,?,?,?,             ?,?,?,?,?             ,? ,?             )          ,              (?,?,?,?,?,?,             ?,?,?,?,?             ,? ,?             )                   ON DUPLICATE KEY UPDATE         group_id=VALUES(group_id),         league_name=VALUES(league_name),         match_time=VALUES(match_time),         match_status=VALUES(match_status),         serialize=VALUES(serialize),         home_name=VALUES(home_name),         guest_name=VALUES(guest_name),         half_score=VALUES(half_score),         full_score=VALUES(full_score),         recommend_content=VALUES(recommend_content),         is_hit=VALUES(is_hit),         hit_index=VALUES(hit_index);\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'group_id\' cannot be null\n; Column \'group_id\' cannot be null; nested exception is java.sql.SQLIntegrityConstraintViolationException: Column \'group_id\' cannot be null', '2025-05-02 13:44:57', 99);
INSERT INTO `sys_oper_log` VALUES (323, '修改北单锦囊', 2, 'com.soccer.project.business.controller.SingleBagController.update()', 'POST', 1, 'admin', '研发部门', '/business/singleBag/update', '127.0.0.1', '内网IP', '{\"id\":27,\"matchDate\":\"2025-05-02\",\"matchList\":[{\"groupId\":27,\"guestName\":\"金泉尚武\",\"homeName\":\"浦项制铁\",\"id\":8,\"isHit\":0,\"leagueName\":\"韩K联\",\"matchStatus\":0,\"matchTime\":\"2025-05-02 04:59:22\",\"serialize\":\"北单067\",\"updateTime\":\"2025-05-02 13:01:57\"},{\"guestName\":\"干亚斯堡\",\"homeName\":\"安塔利亚体育\",\"isHit\":0,\"leagueName\":\"土超\",\"matchStatus\":0,\"matchTime\":\"2025-05-02 05:44:35\",\"serialize\":\"北单083\"}],\"payCode\":\"/profile/upload/2025/05/02/pay-code_20250502130544A002.jpg\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'group_id\' cannot be null\r\n### The error may exist in file [D:\\workspace\\soccer-manager-admin\\target\\classes\\mybatis\\business\\SingleBagMatchMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO t_single_bag_match         (id,group_id,league_name,match_time,match_status,serialize,home_name,guest_name,half_score,full_score,recommend_content,         is_hit,hit_index         )         VALUES                        (?,?,?,?,?,?,             ?,?,?,?,?             ,? ,?             )          ,              (?,?,?,?,?,?,             ?,?,?,?,?             ,? ,?             )                   ON DUPLICATE KEY UPDATE         group_id=VALUES(group_id),         league_name=VALUES(league_name),         match_time=VALUES(match_time),         match_status=VALUES(match_status),         serialize=VALUES(serialize),         home_name=VALUES(home_name),         guest_name=VALUES(guest_name),         half_score=VALUES(half_score),         full_score=VALUES(full_score),         recommend_content=VALUES(recommend_content),         is_hit=VALUES(is_hit),         hit_index=VALUES(hit_index);\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'group_id\' cannot be null\n; Column \'group_id\' cannot be null; nested exception is java.sql.SQLIntegrityConstraintViolationException: Column \'group_id\' cannot be null', '2025-05-02 13:45:07', 24);
INSERT INTO `sys_oper_log` VALUES (324, '修改北单锦囊', 2, 'com.soccer.project.business.controller.SingleBagController.update()', 'POST', 1, 'admin', '研发部门', '/business/singleBag/update', '127.0.0.1', '内网IP', '{\"id\":27,\"matchDate\":\"2025-05-02\",\"matchList\":[{\"groupId\":27,\"guestName\":\"金泉尚武\",\"homeName\":\"浦项制铁\",\"id\":8,\"isHit\":0,\"leagueName\":\"韩K联\",\"matchStatus\":0,\"matchTime\":\"2025-05-02 04:59:22\",\"serialize\":\"北单067\",\"updateTime\":\"2025-05-02 13:01:57\"},{\"guestName\":\"干亚斯堡\",\"homeName\":\"安塔利亚体育\",\"isHit\":0,\"leagueName\":\"土超\",\"matchStatus\":0,\"matchTime\":\"2025-05-02 05:44:35\",\"serialize\":\"北单083\"}],\"payCode\":\"/profile/upload/2025/05/02/pay-code_20250502130544A002.jpg\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'group_id\' cannot be null\r\n### The error may exist in file [D:\\workspace\\soccer-manager-admin\\target\\classes\\mybatis\\business\\SingleBagMatchMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO t_single_bag_match         (id,group_id,league_name,match_time,match_status,serialize,home_name,guest_name,half_score,full_score,recommend_content,         is_hit,hit_index         )         VALUES                        (?,?,?,?,?,?,             ?,?,?,?,?             ,? ,?             )          ,              (?,?,?,?,?,?,             ?,?,?,?,?             ,? ,?             )                   ON DUPLICATE KEY UPDATE         group_id=VALUES(group_id),         league_name=VALUES(league_name),         match_time=VALUES(match_time),         match_status=VALUES(match_status),         serialize=VALUES(serialize),         home_name=VALUES(home_name),         guest_name=VALUES(guest_name),         half_score=VALUES(half_score),         full_score=VALUES(full_score),         recommend_content=VALUES(recommend_content),         is_hit=VALUES(is_hit),         hit_index=VALUES(hit_index);\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'group_id\' cannot be null\n; Column \'group_id\' cannot be null; nested exception is java.sql.SQLIntegrityConstraintViolationException: Column \'group_id\' cannot be null', '2025-05-02 13:46:36', 65456);
INSERT INTO `sys_oper_log` VALUES (325, '修改北单锦囊', 2, 'com.soccer.project.business.controller.SingleBagController.update()', 'POST', 1, 'admin', '研发部门', '/business/singleBag/update', '127.0.0.1', '内网IP', '{\"id\":27,\"matchDate\":\"2025-05-02\",\"matchList\":[{\"groupId\":27,\"guestName\":\"金泉尚武\",\"homeName\":\"浦项制铁\",\"id\":8,\"isHit\":0,\"leagueName\":\"韩K联\",\"matchStatus\":0,\"matchTime\":\"2025-05-02 04:59:22\",\"serialize\":\"北单067\",\"updateTime\":\"2025-05-02 13:01:57\"},{\"groupId\":27,\"guestName\":\"干亚斯堡\",\"homeName\":\"安塔利亚体育\",\"isHit\":0,\"leagueName\":\"土超\",\"matchStatus\":0,\"matchTime\":\"2025-05-02 05:46:50\",\"serialize\":\"北单083\"}],\"payCode\":\"/profile/upload/2025/05/02/pay-code_20250502130544A002.jpg\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-05-02 13:47:03', 22);
INSERT INTO `sys_oper_log` VALUES (326, '修改北单的状态', 2, 'com.soccer.project.business.controller.LightningSecretController.updateStatus()', 'POST', 1, 'admin', '研发部门', '/business/lightningSecret/updateStatus', '127.0.0.1', '内网IP', '{\"id\":3,\"status\":-1}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-05-02 15:32:49', 19);
INSERT INTO `sys_oper_log` VALUES (327, '修改北单的状态', 2, 'com.soccer.project.business.controller.LightningSecretController.updateStatus()', 'POST', 1, 'admin', '研发部门', '/business/lightningSecret/updateStatus', '127.0.0.1', '内网IP', '{\"id\":1,\"status\":-1}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-05-02 15:32:51', 7);
INSERT INTO `sys_oper_log` VALUES (328, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/upload/2025/05/02/pay-code_20250502154357A001.jpg\",\"message\":\"请求成功\"}', 0, NULL, '2025-05-02 15:43:57', 37);
INSERT INTO `sys_oper_log` VALUES (329, '添加闪电秘籍', 1, 'com.soccer.project.business.controller.LightningSecretController.add()', 'POST', 1, 'admin', '研发部门', '/business/lightningSecret/add', '127.0.0.1', '内网IP', '{\"matchDate\":\"2025-05-02\",\"matchList\":[{\"groupId\":4,\"guestName\":\"乌契\",\"homeName\":\"卡洛治\",\"id\":5,\"isHit\":0,\"leagueName\":\"瑞士甲\",\"matchStatus\":0,\"matchTime\":\"2025-05-02 07:44:49\"}],\"payCode\":\"/profile/upload/2025/05/02/pay-code_20250502154357A001.jpg\",\"rateOfReturn\":\"100%~200%\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-05-02 15:45:23', 27);
INSERT INTO `sys_oper_log` VALUES (330, '修改闪电秘籍', 2, 'com.soccer.project.business.controller.LightningSecretController.update()', 'POST', 1, 'admin', '研发部门', '/business/lightningSecret/update', '127.0.0.1', '内网IP', '{\"id\":4,\"matchDate\":\"2025-05-02\",\"matchList\":[{\"groupId\":4,\"guestName\":\"乌契\",\"homeName\":\"卡洛治\",\"id\":5,\"isHit\":0,\"leagueName\":\"瑞士甲\",\"matchStatus\":0,\"matchTime\":\"2025-05-02 07:44:49\",\"serialize\":\"周一001\",\"updateTime\":\"2025-05-02 15:45:23\"}],\"payCode\":\"/profile/upload/2025/05/02/pay-code_20250502154357A001.jpg\",\"rateOfReturn\":\"100%~200%\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-05-02 15:46:47', 16);
INSERT INTO `sys_oper_log` VALUES (331, '修改闪电秘籍', 2, 'com.soccer.project.business.controller.LightningSecretController.update()', 'POST', 1, 'admin', '研发部门', '/business/lightningSecret/update', '127.0.0.1', '内网IP', '{\"id\":4,\"matchDate\":\"2025-05-02\",\"matchList\":[{\"groupId\":4,\"guestName\":\"乌契\",\"homeName\":\"卡洛治\",\"id\":5,\"isHit\":0,\"leagueName\":\"瑞士甲\",\"matchStatus\":0,\"matchTime\":\"2025-05-02 07:44:49\",\"serialize\":\"\",\"updateTime\":\"2025-05-02 15:45:23\"},{\"guestName\":\"罗德兹\",\"homeName\":\"梅斯\",\"isHit\":0,\"leagueName\":\"法乙\",\"matchStatus\":0,\"matchTime\":\"2025-05-02 07:47:15\",\"serialize\":\"周五008\"}],\"payCode\":\"/profile/upload/2025/05/02/pay-code_20250502154357A001.jpg\",\"rateOfReturn\":\"100%~200%\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'group_id\' cannot be null\r\n### The error may exist in file [D:\\workspace\\soccer-manager-admin\\target\\classes\\mybatis\\business\\LightningSecretMatchMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO t_lightning_secret_match         (id,group_id,league_name,match_time,match_status,serialize,home_name,guest_name,half_score,full_score,recommend_content,         is_hit,hit_index         )         VALUES                        (?,?,?,?,?,?,             ?,?,?,?,?             ,? ,?             )          ,              (?,?,?,?,?,?,             ?,?,?,?,?             ,? ,?             )                   ON DUPLICATE KEY UPDATE         group_id=VALUES(group_id),         league_name=VALUES(league_name),         match_time=VALUES(match_time),         match_status=VALUES(match_status),         serialize=VALUES(serialize),         home_name=VALUES(home_name),         guest_name=VALUES(guest_name),         half_score=VALUES(half_score),         full_score=VALUES(full_score),         recommend_content=VALUES(recommend_content),         is_hit=VALUES(is_hit),         hit_index=VALUES(hit_index);\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'group_id\' cannot be null\n; Column \'group_id\' cannot be null; nested exception is java.sql.SQLIntegrityConstraintViolationException: Column \'group_id\' cannot be null', '2025-05-02 15:47:26', 24);
INSERT INTO `sys_oper_log` VALUES (332, '修改闪电秘籍', 2, 'com.soccer.project.business.controller.LightningSecretController.update()', 'POST', 1, 'admin', '研发部门', '/business/lightningSecret/update', '127.0.0.1', '内网IP', '{\"id\":4,\"matchDate\":\"2025-05-02\",\"matchList\":[{\"groupId\":4,\"guestName\":\"乌契\",\"homeName\":\"卡洛治\",\"id\":5,\"isHit\":0,\"leagueName\":\"瑞士甲\",\"matchStatus\":0,\"matchTime\":\"2025-05-02 07:44:49\",\"serialize\":\"周一001\",\"updateTime\":\"2025-05-02 15:45:23\"},{\"groupId\":4,\"guestName\":\"罗德兹\",\"homeName\":\"梅斯\",\"isHit\":0,\"leagueName\":\"法乙\",\"matchStatus\":0,\"matchTime\":\"2025-05-02 07:48:36\",\"serialize\":\"周五008\"}],\"payCode\":\"/profile/upload/2025/05/02/pay-code_20250502154357A001.jpg\",\"rateOfReturn\":\"100%~200%\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-05-02 15:48:47', 15);
INSERT INTO `sys_oper_log` VALUES (333, '修改闪电秘籍', 2, 'com.soccer.project.business.controller.LightningSecretController.update()', 'POST', 1, 'admin', '研发部门', '/business/lightningSecret/update', '127.0.0.1', '内网IP', '{\"id\":4,\"matchDate\":\"2025-05-02\",\"matchList\":[{\"groupId\":4,\"guestName\":\"乌契\",\"homeName\":\"卡洛治\",\"id\":5,\"isHit\":0,\"leagueName\":\"瑞士甲\",\"matchStatus\":0,\"matchTime\":\"2025-05-02 07:44:49\",\"serialize\":\"\",\"updateTime\":\"2025-05-02 15:45:23\"},{\"createTime\":\"2025-05-02 15:48:47\",\"groupId\":4,\"guestName\":\"罗德兹\",\"homeName\":\"梅斯\",\"id\":6,\"isHit\":0,\"leagueName\":\"法乙\",\"matchStatus\":0,\"matchTime\":\"2025-05-02 07:48:36\",\"serialize\":\"周五008\",\"updateTime\":\"2025-05-02 15:48:47\"}],\"payCode\":\"/profile/upload/2025/05/02/pay-code_20250502154357A001.jpg\",\"rateOfReturn\":\"100%~200%\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-05-02 15:48:58', 10);
INSERT INTO `sys_oper_log` VALUES (334, '添加闪电秘籍', 1, 'com.soccer.project.business.controller.LightningSecretController.add()', 'POST', 1, 'admin', '研发部门', '/business/lightningSecret/add', '127.0.0.1', '内网IP', '{\"matchDate\":\"2025-05-01\",\"matchList\":[{\"groupId\":5,\"guestName\":\"北京国安\",\"homeName\":\"上海海港\",\"id\":8,\"isHit\":0,\"leagueName\":\"中超\",\"matchStatus\":1,\"matchTime\":\"2025-04-30 16:00:00\"}],\"rateOfReturn\":\"100%~200%\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-05-02 16:10:41', 55);
INSERT INTO `sys_oper_log` VALUES (335, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/upload/2025/05/03/ai-banner_20250503113345A001.jpeg\",\"message\":\"请求成功\"}', 0, NULL, '2025-05-03 11:33:45', 89);
INSERT INTO `sys_oper_log` VALUES (336, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/upload/2025/05/03/ai-banner_20250503113358A002.jpeg\",\"message\":\"请求成功\"}', 0, NULL, '2025-05-03 11:33:58', 17);
INSERT INTO `sys_oper_log` VALUES (337, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/upload/2025/05/03/ai-banner_20250503113537A003.jpeg\",\"message\":\"请求成功\"}', 0, NULL, '2025-05-03 11:35:37', 15);
INSERT INTO `sys_oper_log` VALUES (338, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/upload/2025/05/03/folding_20250503113542A004.png\",\"message\":\"请求成功\"}', 0, NULL, '2025-05-03 11:35:42', 31);
INSERT INTO `sys_oper_log` VALUES (339, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/upload/2025/05/03/ai-banner_20250503113645A005.jpeg\",\"message\":\"请求成功\"}', 0, NULL, '2025-05-03 11:36:45', 21);
INSERT INTO `sys_oper_log` VALUES (340, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/upload/2025/05/03/ai-banner_20250503113706A006.jpeg\",\"message\":\"请求成功\"}', 0, NULL, '2025-05-03 11:37:06', 14);
INSERT INTO `sys_oper_log` VALUES (341, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/upload/2025/05/03/ai-banner_20250503113716A007.jpeg\",\"message\":\"请求成功\"}', 0, NULL, '2025-05-03 11:37:16', 21);
INSERT INTO `sys_oper_log` VALUES (342, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/upload/2025/05/03/ai-banner_20250503113725A008.jpeg\",\"message\":\"请求成功\"}', 0, NULL, '2025-05-03 11:37:25', 22);
INSERT INTO `sys_oper_log` VALUES (343, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/upload/2025/05/03/ai-banner_20250503113734A009.jpeg\",\"message\":\"请求成功\"}', 0, NULL, '2025-05-03 11:37:34', 15);
INSERT INTO `sys_oper_log` VALUES (344, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/upload/2025/05/03/ai-banner_20250503115907A010.jpeg\",\"message\":\"请求成功\"}', 0, NULL, '2025-05-03 11:59:07', 18);
INSERT INTO `sys_oper_log` VALUES (345, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/upload/2025/05/03/ai-banner_20250503115923A011.jpeg\",\"message\":\"请求成功\"}', 0, NULL, '2025-05-03 11:59:23', 14);
INSERT INTO `sys_oper_log` VALUES (346, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/upload/2025/05/03/ai-banner_20250503120002A012.jpeg\",\"message\":\"请求成功\"}', 0, NULL, '2025-05-03 12:00:02', 10);
INSERT INTO `sys_oper_log` VALUES (347, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/upload/2025/05/03/ai-banner_20250503120008A013.jpeg\",\"message\":\"请求成功\"}', 0, NULL, '2025-05-03 12:00:08', 11);
INSERT INTO `sys_oper_log` VALUES (348, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/upload/2025/05/03/ai-banner_20250503120016A014.jpeg\",\"message\":\"请求成功\"}', 0, NULL, '2025-05-03 12:00:16', 16);
INSERT INTO `sys_oper_log` VALUES (349, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/upload/2025/05/03/ai-banner_20250503120023A015.jpeg\",\"message\":\"请求成功\"}', 0, NULL, '2025-05-03 12:00:23', 16);
INSERT INTO `sys_oper_log` VALUES (350, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/upload/2025/05/03/ai-banner_20250503120124A016.jpeg\",\"message\":\"请求成功\"}', 0, NULL, '2025-05-03 12:01:24', 19);
INSERT INTO `sys_oper_log` VALUES (351, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/upload/2025/05/03/ai-banner_20250503120635A017.jpeg\",\"message\":\"请求成功\"}', 0, NULL, '2025-05-03 12:06:35', 16);
INSERT INTO `sys_oper_log` VALUES (352, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/upload/2025/05/03/ai-banner_20250503120711A018.jpeg\",\"message\":\"请求成功\"}', 0, NULL, '2025-05-03 12:07:11', 15);
INSERT INTO `sys_oper_log` VALUES (353, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/upload/2025/05/03/ai-banner_20250503120811A019.jpeg\",\"message\":\"请求成功\"}', 0, NULL, '2025-05-03 12:08:11', 18);
INSERT INTO `sys_oper_log` VALUES (354, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/upload/2025/05/03/ai-banner_20250503120832A020.jpeg\",\"message\":\"请求成功\"}', 0, NULL, '2025-05-03 12:08:32', 16);
INSERT INTO `sys_oper_log` VALUES (355, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/upload/2025/05/03/ai-banner_20250503123924A001.jpeg\",\"message\":\"请求成功\"}', 0, NULL, '2025-05-03 12:39:25', 70);
INSERT INTO `sys_oper_log` VALUES (356, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/upload/2025/05/03/ai-banner_20250503124946A001.jpeg\",\"message\":\"请求成功\"}', 0, NULL, '2025-05-03 12:49:46', 35);
INSERT INTO `sys_oper_log` VALUES (357, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/upload/2025/05/03/ai-banner_20250503125044A002.jpeg\",\"message\":\"请求成功\"}', 0, NULL, '2025-05-03 12:50:44', 19);
INSERT INTO `sys_oper_log` VALUES (358, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/upload/2025/05/03/ai-banner_20250503125341A003.jpeg\",\"message\":\"请求成功\"}', 0, NULL, '2025-05-03 12:53:41', 17);
INSERT INTO `sys_oper_log` VALUES (359, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/upload/2025/05/03/ai-banner_20250503125609A004.jpeg\",\"message\":\"请求成功\"}', 0, NULL, '2025-05-03 12:56:09', 16);
INSERT INTO `sys_oper_log` VALUES (360, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/upload/2025/05/03/pay-code_20250503131349A001.jpg\",\"message\":\"请求成功\"}', 0, NULL, '2025-05-03 13:13:49', 27);
INSERT INTO `sys_oper_log` VALUES (361, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/upload/2025/05/03/pay-code_20250503131931A002.jpg\",\"message\":\"请求成功\"}', 0, NULL, '2025-05-03 13:19:31', 20);
INSERT INTO `sys_oper_log` VALUES (362, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/upload/2025/05/03/pay-code_20250503132047A001.jpg\",\"message\":\"请求成功\"}', 0, NULL, '2025-05-03 13:20:47', 98);
INSERT INTO `sys_oper_log` VALUES (363, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/upload/2025/05/17/ai-banner_20250517220011A001.jpeg\",\"message\":\"请求成功\"}', 0, NULL, '2025-05-17 22:00:11', 205);
INSERT INTO `sys_oper_log` VALUES (364, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/upload/2025/05/17/intel_banner_20250517220015A002.jpeg\",\"message\":\"请求成功\"}', 0, NULL, '2025-05-17 22:00:15', 8);
INSERT INTO `sys_oper_log` VALUES (365, '修改专家', 2, 'com.soccer.project.business.controller.ExpertController.edit()', 'POST', 1, 'admin', '研发部门', '/business/expert/edit', '127.0.0.1', '内网IP', '{\"avatar\":\"/profile/avatar/2025/04/27/温格教练_20250427225916A001.png\",\"continueNum\":8,\"createTime\":\"2025-04-06 13:30:37\",\"hitText\":\"近10中10\",\"id\":2,\"name\":\"温格教练\",\"sort\":2,\"status\":1,\"updateTime\":\"2025-04-06 13:30:37\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-05-17 22:00:42', 17);
INSERT INTO `sys_oper_log` VALUES (366, '专家头像', 1, 'com.soccer.project.business.controller.ExpertController.uploadAvatar()', 'POST', 1, 'admin', '研发部门', '/business/expert/uploadAvatar', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/avatar/2025/05/17/温格教练_20250517220052A003.png\",\"message\":\"请求成功\"}', 0, NULL, '2025-05-17 22:00:52', 17);
INSERT INTO `sys_oper_log` VALUES (367, '修改专家', 2, 'com.soccer.project.business.controller.ExpertController.edit()', 'POST', 1, 'admin', '研发部门', '/business/expert/edit', '127.0.0.1', '内网IP', '{\"avatar\":\"/profile/avatar/2025/05/17/温格教练_20250517220052A003.png\",\"continueNum\":8,\"createTime\":\"2025-04-06 13:30:37\",\"hitText\":\"近10中10\",\"id\":2,\"name\":\"温格教练\",\"sort\":2,\"status\":1,\"updateTime\":\"2025-04-06 13:30:37\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-05-17 22:00:53', 14);
INSERT INTO `sys_oper_log` VALUES (368, '修改北单锦囊', 2, 'com.soccer.project.business.controller.SingleBagController.update()', 'POST', 1, 'admin', '研发部门', '/business/singleBag/update', '127.0.0.1', '内网IP', '{\"id\":27,\"matchDate\":\"2025-05-02\",\"matchList\":[{\"groupId\":27,\"guestName\":\"金泉尚武\",\"homeName\":\"浦项制铁\",\"id\":8,\"isHit\":1,\"leagueName\":\"韩K联\",\"matchStatus\":1,\"matchTime\":\"2025-05-02 04:59:22\",\"serialize\":\"北单067\",\"updateTime\":\"2025-05-02 13:01:57\"},{\"createTime\":\"2025-05-02 13:47:03\",\"groupId\":27,\"guestName\":\"干亚斯堡\",\"homeName\":\"安塔利亚体育\",\"id\":9,\"isHit\":0,\"leagueName\":\"土超\",\"matchStatus\":0,\"matchTime\":\"2025-05-02 05:46:50\",\"serialize\":\"北单083\",\"updateTime\":\"2025-05-02 13:47:03\"}],\"payCode\":\"/profile/upload/2025/05/02/pay-code_20250502130544A002.jpg\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-05-31 11:43:04', 4555);
INSERT INTO `sys_oper_log` VALUES (369, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/upload/2025/05/31/pay-code_20250414200723A003_20250531115329A001.jpg\",\"message\":\"请求成功\"}', 0, NULL, '2025-05-31 11:53:29', 58);
INSERT INTO `sys_oper_log` VALUES (370, '添加北单锦囊', 1, 'com.soccer.project.business.controller.SingleBagController.add()', 'POST', 1, 'admin', '研发部门', '/business/singleBag/add', '127.0.0.1', '内网IP', '{\"matchDate\":\"2025-05-31\",\"matchList\":[{\"fullScore\":\"1-2\",\"groupId\":28,\"guestName\":\"是的是的\",\"halfScore\":\"2-1\",\"homeName\":\"是的是的\",\"id\":10,\"isHit\":0,\"leagueName\":\"是多少\",\"matchStatus\":1,\"matchTime\":\"2025-05-30 16:07:00\",\"serialize\":\"是的是的\"}],\"payCode\":\"/profile/upload/2025/05/31/pay-code_20250414200723A003_20250531115329A001.jpg\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-05-31 11:54:23', 4222);
INSERT INTO `sys_oper_log` VALUES (371, '修改北单的状态', 2, 'com.soccer.project.business.controller.SingleBagController.updateStatus()', 'POST', 1, 'admin', '研发部门', '/business/singleBag/updateStatus', '127.0.0.1', '内网IP', '{\"id\":28,\"status\":1}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-05-31 11:54:27', 15);
INSERT INTO `sys_oper_log` VALUES (372, '修改北单锦囊', 2, 'com.soccer.project.business.controller.SingleBagController.update()', 'POST', 1, 'admin', '研发部门', '/business/singleBag/update', '127.0.0.1', '内网IP', '{\"id\":28,\"matchDate\":\"2025-05-31\",\"matchList\":[{\"fullScore\":\"1-2\",\"groupId\":28,\"guestName\":\"是的是的\",\"halfScore\":\"2-1\",\"homeName\":\"是的是的\",\"id\":10,\"isHit\":0,\"leagueName\":\"是多少\",\"matchStatus\":1,\"matchTime\":\"2025-05-30 23:07:00\",\"serialize\":\"是的是的\",\"updateTime\":\"2025-05-31 11:54:23\"}],\"payCode\":\"/profile/upload/2025/05/31/pay-code_20250414200723A003_20250531115329A001.jpg\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-05-31 11:56:03', 48);
INSERT INTO `sys_oper_log` VALUES (373, '修改北单锦囊', 2, 'com.soccer.project.business.controller.SingleBagController.update()', 'POST', 1, 'admin', '研发部门', '/business/singleBag/update', '127.0.0.1', '内网IP', '{\"id\":28,\"matchDate\":\"2025-05-31\",\"matchList\":[{\"fullScore\":\"1-2\",\"groupId\":28,\"guestName\":\"是的是的\",\"halfScore\":\"2-1\",\"homeName\":\"是的是的\",\"id\":10,\"isHit\":0,\"leagueName\":\"是多少\",\"matchStatus\":1,\"matchTime\":\"2025-05-29 23:04:00\",\"serialize\":\"是的是的\",\"updateTime\":\"2025-05-31 11:54:23\"}],\"payCode\":\"/profile/upload/2025/05/31/pay-code_20250414200723A003_20250531115329A001.jpg\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-05-31 11:56:29', 9);
INSERT INTO `sys_oper_log` VALUES (374, '修改北单锦囊', 2, 'com.soccer.project.business.controller.SingleBagController.update()', 'POST', 1, 'admin', '研发部门', '/business/singleBag/update', '127.0.0.1', '内网IP', '{\"id\":28,\"matchDate\":\"2025-05-31\",\"matchList\":[{\"fullScore\":\"1-2\",\"groupId\":28,\"guestName\":\"是的是的\",\"halfScore\":\"2-1\",\"homeName\":\"是的是的\",\"id\":10,\"isHit\":0,\"leagueName\":\"是多少\",\"matchStatus\":1,\"matchTime\":\"2025-05-29 01:04:00\",\"serialize\":\"是的是的\",\"updateTime\":\"2025-05-31 11:54:23\"}],\"payCode\":\"/profile/upload/2025/05/31/pay-code_20250414200723A003_20250531115329A001.jpg\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-05-31 12:03:08', 8);
INSERT INTO `sys_oper_log` VALUES (375, '修改北单锦囊', 2, 'com.soccer.project.business.controller.SingleBagController.update()', 'POST', 1, 'admin', '研发部门', '/business/singleBag/update', '127.0.0.1', '内网IP', '{\"id\":28,\"matchDate\":\"2025-05-31\",\"matchList\":[{\"fullScore\":\"1-2\",\"groupId\":28,\"guestName\":\"是的是的\",\"halfScore\":\"2-1\",\"homeName\":\"是的是的\",\"id\":10,\"isHit\":0,\"leagueName\":\"是多少\",\"matchStatus\":1,\"matchTime\":\"2025-05-31 01:04:00\",\"serialize\":\"是的是的\",\"updateTime\":\"2025-05-31 11:54:23\"}],\"payCode\":\"/profile/upload/2025/05/31/pay-code_20250414200723A003_20250531115329A001.jpg\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-05-31 12:08:26', 163197);
INSERT INTO `sys_oper_log` VALUES (376, '修改北单锦囊', 2, 'com.soccer.project.business.controller.SingleBagController.update()', 'POST', 1, 'admin', '研发部门', '/business/singleBag/update', '127.0.0.1', '内网IP', '{\"id\":28,\"matchDate\":\"2025-05-31\",\"matchList\":[{\"fullScore\":\"1-2\",\"groupId\":28,\"guestName\":\"是的是的\",\"halfScore\":\"2-1\",\"homeName\":\"是的是的\",\"id\":10,\"isHit\":0,\"leagueName\":\"是多少\",\"matchStatus\":1,\"matchTime\":\"2025-05-31 01:04:00\",\"serialize\":\"是的是的\",\"updateTime\":\"2025-05-31 11:54:23\"}],\"payCode\":\"/profile/upload/2025/05/31/pay-code_20250414200723A003_20250531115329A001.jpg\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-05-31 12:09:00', 3529);
INSERT INTO `sys_oper_log` VALUES (377, '修改北单锦囊', 2, 'com.soccer.project.business.controller.SingleBagController.update()', 'POST', 1, 'admin', '研发部门', '/business/singleBag/update', '127.0.0.1', '内网IP', '{\"id\":28,\"matchDate\":\"2025-05-31\",\"matchList\":[{\"fullScore\":\"1-2\",\"groupId\":28,\"guestName\":\"是的是的\",\"halfScore\":\"2-1\",\"homeName\":\"是的是的\",\"id\":10,\"isHit\":0,\"leagueName\":\"是多少\",\"matchStatus\":1,\"matchTime\":\"2025-05-31 01:04:00\",\"serialize\":\"是的是的\",\"updateTime\":\"2025-05-31 11:54:23\"}],\"payCode\":\"/profile/upload/2025/05/31/pay-code_20250414200723A003_20250531115329A001.jpg\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-05-31 12:09:17', 8);
INSERT INTO `sys_oper_log` VALUES (378, '修改北单锦囊', 2, 'com.soccer.project.business.controller.SingleBagController.update()', 'POST', 1, 'admin', '研发部门', '/business/singleBag/update', '127.0.0.1', '内网IP', '{\"id\":28,\"matchDate\":\"2025-05-31\",\"matchList\":[{\"fullScore\":\"1-2\",\"groupId\":28,\"guestName\":\"是的是的\",\"halfScore\":\"2-1\",\"homeName\":\"是的是的\",\"id\":10,\"isHit\":0,\"leagueName\":\"是多少\",\"matchStatus\":1,\"matchTime\":\"2025-05-31 01:04:00\",\"serialize\":\"是的是的\",\"updateTime\":\"2025-05-31 11:54:23\"}],\"payCode\":\"/profile/upload/2025/05/31/pay-code_20250414200723A003_20250531115329A001.jpg\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-06-01 12:38:06', 44);
INSERT INTO `sys_oper_log` VALUES (379, '修改北单锦囊', 2, 'com.soccer.project.business.controller.SingleBagController.update()', 'POST', 1, 'admin', '研发部门', '/business/singleBag/update', '127.0.0.1', '内网IP', '{\"id\":28,\"matchDate\":\"2025-05-31\",\"matchList\":[{\"fullScore\":\"1-2\",\"groupId\":28,\"guestName\":\"是的是的\",\"halfScore\":\"2-1\",\"homeName\":\"是的是的\",\"id\":10,\"isHit\":0,\"leagueName\":\"是多少\",\"matchStatus\":1,\"matchTime\":\"2025-05-31 02:04:00\",\"serialize\":\"是的是的\",\"updateTime\":\"2025-05-31 11:54:23\"}],\"payCode\":\"/profile/upload/2025/05/31/pay-code_20250414200723A003_20250531115329A001.jpg\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-06-01 12:47:04', 68);
INSERT INTO `sys_oper_log` VALUES (380, '修改北单锦囊', 2, 'com.soccer.project.business.controller.SingleBagController.update()', 'POST', 1, 'admin', '研发部门', '/business/singleBag/update', '127.0.0.1', '内网IP', '{\"id\":28,\"matchDate\":\"2025-05-31\",\"matchList\":[{\"fullScore\":\"1-2\",\"groupId\":28,\"guestName\":\"是的是的\",\"halfScore\":\"2-1\",\"homeName\":\"是的是的\",\"id\":10,\"isHit\":0,\"leagueName\":\"是多少\",\"matchStatus\":1,\"matchTime\":\"2025-05-31 01:04:00\",\"serialize\":\"是的是的\",\"updateTime\":\"2025-05-31 11:54:23\"}],\"payCode\":\"/profile/upload/2025/05/31/pay-code_20250414200723A003_20250531115329A001.jpg\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-06-01 12:47:22', 16);
INSERT INTO `sys_oper_log` VALUES (381, '修改北单锦囊', 2, 'com.soccer.project.business.controller.SingleBagController.update()', 'POST', 1, 'admin', '研发部门', '/business/singleBag/update', '127.0.0.1', '内网IP', '{\"id\":28,\"matchDate\":\"2025-05-31\",\"matchList\":[{\"fullScore\":\"1-2\",\"groupId\":28,\"guestName\":\"是的是的\",\"halfScore\":\"2-1\",\"homeName\":\"是的是的\",\"id\":10,\"isHit\":0,\"leagueName\":\"是多少\",\"matchStatus\":1,\"matchTime\":\"2025-05-31 01:04:00\",\"serialize\":\"是的是的\",\"updateTime\":\"2025-05-31 11:54:23\"}],\"payCode\":\"/profile/upload/2025/05/31/pay-code_20250414200723A003_20250531115329A001.jpg\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-06-01 12:49:31', 11);
INSERT INTO `sys_oper_log` VALUES (382, '修改北单锦囊', 2, 'com.soccer.project.business.controller.SingleBagController.update()', 'POST', 1, 'admin', '研发部门', '/business/singleBag/update', '127.0.0.1', '内网IP', '{\"id\":28,\"matchDate\":\"2025-05-31\",\"matchList\":[{\"fullScore\":\"1-2\",\"groupId\":28,\"guestName\":\"是的是的\",\"halfScore\":\"2-1\",\"homeName\":\"是的是的\",\"id\":10,\"isHit\":0,\"leagueName\":\"是多少\",\"matchStatus\":1,\"matchTime\":\"2025-05-31 01:07:00\",\"serialize\":\"是的是的\",\"updateTime\":\"2025-05-31 11:54:23\"}],\"payCode\":\"/profile/upload/2025/05/31/pay-code_20250414200723A003_20250531115329A001.jpg\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-06-01 12:52:23', 95768);
INSERT INTO `sys_oper_log` VALUES (383, '修改北单锦囊', 2, 'com.soccer.project.business.controller.SingleBagController.update()', 'POST', 1, 'admin', '研发部门', '/business/singleBag/update', '127.0.0.1', '内网IP', '{\"id\":28,\"matchDate\":\"2025-05-31\",\"matchList\":[{\"fullScore\":\"1-2\",\"groupId\":28,\"guestName\":\"是的是的\",\"halfScore\":\"2-1\",\"homeName\":\"是的是的\",\"id\":10,\"isHit\":0,\"leagueName\":\"是多少\",\"matchStatus\":1,\"matchTime\":\"2025-05-31 01:07:00\",\"serialize\":\"是的是的\",\"updateTime\":\"2025-05-31 11:54:23\"}],\"payCode\":\"/profile/upload/2025/05/31/pay-code_20250414200723A003_20250531115329A001.jpg\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-06-01 12:56:01', 198418);
INSERT INTO `sys_oper_log` VALUES (384, '修改北单锦囊', 2, 'com.soccer.project.business.controller.SingleBagController.update()', 'POST', 1, 'admin', '研发部门', '/business/singleBag/update', '127.0.0.1', '内网IP', '{\"id\":28,\"matchDate\":\"2025-05-31\",\"matchList\":[{\"fullScore\":\"1-2\",\"groupId\":28,\"guestName\":\"是的是的\",\"halfScore\":\"2-1\",\"homeName\":\"是的是的\",\"id\":10,\"isHit\":0,\"leagueName\":\"是多少\",\"matchStatus\":1,\"matchTime\":\"2025-06-01 10:55:25\",\"serialize\":\"是的是的\",\"updateTime\":\"2025-05-31 11:54:23\"}],\"payCode\":\"/profile/upload/2025/05/31/pay-code_20250414200723A003_20250531115329A001.jpg\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-06-01 12:57:15', 53);
INSERT INTO `sys_oper_log` VALUES (385, '修改北单锦囊', 2, 'com.soccer.project.business.controller.SingleBagController.update()', 'POST', 1, 'admin', '研发部门', '/business/singleBag/update', '127.0.0.1', '内网IP', '{\"id\":28,\"matchDate\":\"2025-05-31\",\"matchList\":[{\"fullScore\":\"1-2\",\"groupId\":28,\"guestName\":\"是的是的\",\"halfScore\":\"2-1\",\"homeName\":\"是的是的\",\"id\":10,\"isHit\":1,\"leagueName\":\"是多少\",\"matchStatus\":1,\"matchTime\":\"2025-06-01 10:55:25\",\"serialize\":\"是的是的\",\"updateTime\":\"2025-05-31 11:54:23\"}],\"payCode\":\"/profile/upload/2025/05/31/pay-code_20250414200723A003_20250531115329A001.jpg\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-06-01 12:58:52', 15);
INSERT INTO `sys_oper_log` VALUES (386, '修改闪电秘籍', 2, 'com.soccer.project.business.controller.LightningSecretController.update()', 'POST', 1, 'admin', '研发部门', '/business/lightningSecret/update', '127.0.0.1', '内网IP', '{\"id\":4,\"matchDate\":\"2025-06-01\",\"matchList\":[{\"fullScore\":\"1-2\",\"groupId\":4,\"guestName\":\"乌契\",\"halfScore\":\"1-0\",\"hitIndex\":0,\"homeName\":\"卡洛治\",\"id\":5,\"isHit\":1,\"leagueName\":\"瑞士甲\",\"matchStatus\":1,\"matchTime\":\"2025-05-31 23:00:00\",\"recommendContent\":\"[\\\"大2.5\\\"]\",\"serialize\":\"\",\"updateTime\":\"2025-05-02 15:45:23\"},{\"createTime\":\"2025-05-02 15:48:47\",\"fullScore\":\"2-3\",\"groupId\":4,\"guestName\":\"罗德兹\",\"halfScore\":\"2-2\",\"homeName\":\"梅斯\",\"id\":6,\"isHit\":0,\"leagueName\":\"法乙\",\"matchStatus\":1,\"matchTime\":\"2025-05-31 16:00:00\",\"recommendContent\":\"[\\\"大5.5\\\"]\",\"serialize\":\"周五008\",\"updateTime\":\"2025-05-02 15:48:47\"}],\"payCode\":\"/profile/upload/2025/05/02/pay-code_20250502154357A001.jpg\",\"rateOfReturn\":\"100%~200%\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-06-01 15:40:42', 59);
INSERT INTO `sys_oper_log` VALUES (387, '修改北单的状态', 2, 'com.soccer.project.business.controller.LightningSecretController.updateStatus()', 'POST', 1, 'admin', '研发部门', '/business/lightningSecret/updateStatus', '127.0.0.1', '内网IP', '{\"id\":4,\"status\":1}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-06-01 15:40:59', 14);
INSERT INTO `sys_oper_log` VALUES (388, '修改闪电秘籍', 2, 'com.soccer.project.business.controller.LightningSecretController.update()', 'POST', 1, 'admin', '研发部门', '/business/lightningSecret/update', '127.0.0.1', '内网IP', '{\"id\":4,\"matchDate\":\"2025-06-01\",\"matchList\":[{\"fullScore\":\"1-2\",\"groupId\":4,\"guestName\":\"乌契\",\"halfScore\":\"1-0\",\"hitIndex\":0,\"homeName\":\"卡洛治\",\"id\":5,\"isHit\":1,\"leagueName\":\"瑞士甲\",\"matchStatus\":1,\"matchTime\":\"2025-05-31 23:00:00\",\"recommendContent\":\"[\\\"大2.5\\\"]\",\"serialize\":\"\",\"updateTime\":\"2025-05-02 15:45:23\"},{\"createTime\":\"2025-05-02 15:48:47\",\"fullScore\":\"2-3\",\"groupId\":4,\"guestName\":\"罗德兹\",\"halfScore\":\"2-2\",\"homeName\":\"梅斯\",\"id\":6,\"isHit\":0,\"leagueName\":\"法乙\",\"matchStatus\":1,\"matchTime\":\"2025-05-31 16:00:00\",\"recommendContent\":\"[\\\"大5.5\\\"]\",\"serialize\":\"周五008\",\"updateTime\":\"2025-05-02 15:48:47\"}],\"payCode\":\"/profile/upload/2025/05/02/pay-code_20250502154357A001.jpg\",\"rateOfReturn\":\"100%~200%\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-06-01 15:47:41', 62);
INSERT INTO `sys_oper_log` VALUES (389, '修改闪电秘籍', 2, 'com.soccer.project.business.controller.LightningSecretController.update()', 'POST', 1, 'admin', '研发部门', '/business/lightningSecret/update', '127.0.0.1', '内网IP', '{\"id\":4,\"matchDate\":\"2025-06-01\",\"matchList\":[{\"fullScore\":\"1-2\",\"groupId\":4,\"guestName\":\"乌契\",\"halfScore\":\"1-0\",\"hitIndex\":0,\"homeName\":\"卡洛治\",\"id\":5,\"isHit\":1,\"leagueName\":\"瑞士甲\",\"matchStatus\":1,\"matchTime\":\"2025-05-31 23:00:00\",\"recommendContent\":\"[\\\"大2.5\\\"]\",\"serialize\":\"\",\"updateTime\":\"2025-05-02 15:45:23\"},{\"createTime\":\"2025-05-02 15:48:47\",\"fullScore\":\"2-3\",\"groupId\":4,\"guestName\":\"罗德兹\",\"halfScore\":\"2-2\",\"homeName\":\"梅斯\",\"id\":6,\"isHit\":0,\"leagueName\":\"法乙\",\"matchStatus\":1,\"matchTime\":\"2025-05-31 16:00:00\",\"recommendContent\":\"[\\\"大5.5\\\"]\",\"serialize\":\"周五008\",\"updateTime\":\"2025-05-02 15:48:47\"}],\"payCode\":\"/profile/upload/2025/05/02/pay-code_20250502154357A001.jpg\",\"rateOfReturn\":\"100%~200%\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-06-01 15:48:34', 50);
INSERT INTO `sys_oper_log` VALUES (390, '菜单管理', 1, 'com.soccer.project.system.controller.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"component\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"票据管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"bill\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-15 13:52:10', 24);
INSERT INTO `sys_oper_log` VALUES (391, '菜单管理', 2, 'com.soccer.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"bill/index\",\"createTime\":\"2025-06-15 13:52:10\",\"icon\":\"component\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2010,\"menuName\":\"票据管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"bill\",\"perms\":\"bill:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-15 13:53:42', 16);
INSERT INTO `sys_oper_log` VALUES (392, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/upload/2025/06/28/pay-code_20250628134716A001.jpg\",\"message\":\"请求成功\"}', 0, NULL, '2025-06-28 13:47:16', 140);
INSERT INTO `sys_oper_log` VALUES (393, '添加半全场狙击', 1, 'com.soccer.project.business.controller.HalfFullSnipeController.add()', 'POST', 1, 'admin', '研发部门', '/business/snipe/add', '127.0.0.1', '内网IP', '{\"matchDate\":\"2025-06-28\",\"matchList\":[],\"payCode\":\"/profile/upload/2025/06/28/pay-code_20250628134716A001.jpg\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'league_names\' doesn\'t have a default value\r\n### The error may exist in com/soccer/project/business/mapper/HalfFullGroupMapper.java (best guess)\r\n### The error may involve com.soccer.project.business.mapper.HalfFullGroupMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO t_half_full_group  ( pay_code, total,   match_date )  VALUES  ( ?, ?,   ? )\r\n### Cause: java.sql.SQLException: Field \'league_names\' doesn\'t have a default value\n; Field \'league_names\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'league_names\' doesn\'t have a default value', '2025-06-28 13:47:40', 335);
INSERT INTO `sys_oper_log` VALUES (394, '添加半全场狙击', 1, 'com.soccer.project.business.controller.HalfFullSnipeController.add()', 'POST', 1, 'admin', '研发部门', '/business/snipe/add', '127.0.0.1', '内网IP', '{\"matchDate\":\"2025-06-28\",\"matchList\":[],\"payCode\":\"/profile/upload/2025/06/28/pay-code_20250628134716A001.jpg\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-06-28 13:48:10', 27);
INSERT INTO `sys_oper_log` VALUES (395, '修改半全场狙击的状态', 2, 'com.soccer.project.business.controller.HalfFullSnipeController.updateStatus()', 'POST', 1, 'admin', '研发部门', '/business/snipe/updateStatus', '127.0.0.1', '内网IP', '{\"id\":23,\"status\":1}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-06-28 13:48:33', 29);
INSERT INTO `sys_oper_log` VALUES (396, '添加北单锦囊', 1, 'com.soccer.project.business.controller.SingleBagController.add()', 'POST', 1, 'admin', '研发部门', '/business/singleBag/add', '127.0.0.1', '内网IP', '{\"matchDate\":\"2025-06-28\",\"matchList\":[]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'league_names\' doesn\'t have a default value\r\n### The error may exist in com/soccer/project/business/mapper/SingleBagGroupMapper.java (best guess)\r\n### The error may involve com.soccer.project.business.mapper.SingleBagGroupMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO t_single_bag_group  ( total,    match_date )  VALUES  ( ?,    ? )\r\n### Cause: java.sql.SQLException: Field \'league_names\' doesn\'t have a default value\n; Field \'league_names\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'league_names\' doesn\'t have a default value', '2025-06-28 17:31:55', 126);
INSERT INTO `sys_oper_log` VALUES (397, '添加北单锦囊', 1, 'com.soccer.project.business.controller.SingleBagController.add()', 'POST', 1, 'admin', '研发部门', '/business/singleBag/add', '127.0.0.1', '内网IP', '{\"matchDate\":\"2025-06-28\",\"matchList\":[]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in com/soccer/project/business/mapper/SingleBagMatchMapper.java (best guess)\r\n### The error may involve com.soccer.project.business.mapper.SingleBagMatchMapper.insertBatchSomeColumn-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT IGNORE  INTO t_single_bag_match (group_id,league_name,match_time,match_status,serialize,home_name,guest_name,half_score,full_score,recommend_content,is_hit,hit_index,create_time) VALUES\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2025-06-28 17:32:41', 24);
INSERT INTO `sys_oper_log` VALUES (398, '添加北单锦囊', 1, 'com.soccer.project.business.controller.SingleBagController.add()', 'POST', 1, 'admin', '研发部门', '/business/singleBag/add', '127.0.0.1', '内网IP', '{\"matchDate\":\"2025-06-28\",\"matchList\":[]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in com/soccer/project/business/mapper/SingleBagMatchMapper.java (best guess)\r\n### The error may involve com.soccer.project.business.mapper.SingleBagMatchMapper.insertBatchSomeColumn-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT IGNORE  INTO t_single_bag_match (group_id,league_name,match_time,match_status,serialize,home_name,guest_name,half_score,full_score,recommend_content,is_hit,hit_index,create_time) VALUES\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2025-06-28 17:33:51', 36203);
INSERT INTO `sys_oper_log` VALUES (399, '添加北单锦囊', 1, 'com.soccer.project.business.controller.SingleBagController.add()', 'POST', 1, 'admin', '研发部门', '/business/singleBag/add', '127.0.0.1', '内网IP', '{\"matchDate\":\"2025-06-28\",\"matchList\":[]}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-06-28 17:34:29', 3671);
INSERT INTO `sys_oper_log` VALUES (400, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/upload/2025/06/28/pay-code_20250628173501A001.jpg\",\"message\":\"请求成功\"}', 0, NULL, '2025-06-28 17:35:01', 55);
INSERT INTO `sys_oper_log` VALUES (401, '修改北单锦囊', 2, 'com.soccer.project.business.controller.SingleBagController.update()', 'POST', 1, 'admin', '研发部门', '/business/singleBag/update', '127.0.0.1', '内网IP', '{\"id\":31,\"matchDate\":\"2025-06-28\",\"matchList\":[],\"payCode\":\"/profile/upload/2025/06/28/pay-code_20250628173501A001.jpg\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'ON DUPLICATE KEY UPDATE\n        group_id=VALUES(group_id),\n        league_name=V\' at line 7\r\n### The error may exist in file [D:\\workspace\\soccer-manager-admin\\target\\classes\\mybatis\\business\\SingleBagMatchMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO t_single_bag_match         (id,group_id,league_name,match_time,match_status,serialize,home_name,guest_name,half_score,full_score,recommend_content,         is_hit,hit_index         )         VALUES                   ON DUPLICATE KEY UPDATE         group_id=VALUES(group_id),         league_name=VALUES(league_name),         match_time=VALUES(match_time),         match_status=VALUES(match_status),         serialize=VALUES(serialize),         home_name=VALUES(home_name),         guest_name=VALUES(guest_name),         half_score=VALUES(half_score),         full_score=VALUES(full_score),         recommend_content=VALUES(recommend_content),         is_hit=VALUES(is_hit),         hit_index=VALUES(hit_index);\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'ON DUPLICATE KEY UPDATE\n        group_id=VALUES(group_id),\n        league_name=V\' at line 7\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'ON DUPLICATE KEY UPDATE\n        group_id=VALUES(group_id),\n        league_name=V\' at line 7', '2025-06-28 17:38:14', 4647);
INSERT INTO `sys_oper_log` VALUES (402, '修改北单锦囊', 2, 'com.soccer.project.business.controller.SingleBagController.update()', 'POST', 1, 'admin', '研发部门', '/business/singleBag/update', '127.0.0.1', '内网IP', '{\"id\":31,\"matchDate\":\"2025-06-28\",\"matchList\":[],\"payCode\":\"/profile/upload/2025/06/28/pay-code_20250628173501A001.jpg\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'ON DUPLICATE KEY UPDATE\n        group_id=VALUES(group_id),\n        league_name=V\' at line 7\r\n### The error may exist in file [D:\\workspace\\soccer-manager-admin\\target\\classes\\mybatis\\business\\SingleBagMatchMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO t_single_bag_match         (id,group_id,league_name,match_time,match_status,serialize,home_name,guest_name,half_score,full_score,recommend_content,         is_hit,hit_index         )         VALUES                   ON DUPLICATE KEY UPDATE         group_id=VALUES(group_id),         league_name=VALUES(league_name),         match_time=VALUES(match_time),         match_status=VALUES(match_status),         serialize=VALUES(serialize),         home_name=VALUES(home_name),         guest_name=VALUES(guest_name),         half_score=VALUES(half_score),         full_score=VALUES(full_score),         recommend_content=VALUES(recommend_content),         is_hit=VALUES(is_hit),         hit_index=VALUES(hit_index);\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'ON DUPLICATE KEY UPDATE\n        group_id=VALUES(group_id),\n        league_name=V\' at line 7\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'ON DUPLICATE KEY UPDATE\n        group_id=VALUES(group_id),\n        league_name=V\' at line 7', '2025-06-28 17:39:41', 61352);
INSERT INTO `sys_oper_log` VALUES (403, '修改北单锦囊', 2, 'com.soccer.project.business.controller.SingleBagController.update()', 'POST', 1, 'admin', '研发部门', '/business/singleBag/update', '127.0.0.1', '内网IP', '{\"id\":31,\"matchDate\":\"2025-06-28\",\"matchList\":[],\"payCode\":\"/profile/upload/2025/06/28/pay-code_20250628173501A001.jpg\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-06-28 17:39:54', 45);
INSERT INTO `sys_oper_log` VALUES (404, '修改北单的状态', 2, 'com.soccer.project.business.controller.SingleBagController.updateStatus()', 'POST', 1, 'admin', '研发部门', '/business/singleBag/updateStatus', '127.0.0.1', '内网IP', '{\"id\":31,\"status\":1}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-06-28 17:40:00', 14);
INSERT INTO `sys_oper_log` VALUES (405, '修改闪电秘籍', 2, 'com.soccer.project.business.controller.LightningSecretController.update()', 'POST', 1, 'admin', '研发部门', '/business/lightningSecret/update', '127.0.0.1', '内网IP', '{\"id\":4,\"matchDate\":\"2025-06-01\",\"matchList\":[{\"createTime\":\"2025-05-02 15:48:47\",\"fullScore\":\"2-3\",\"groupId\":4,\"guestName\":\"罗德兹\",\"halfScore\":\"2-2\",\"homeName\":\"梅斯\",\"id\":6,\"isHit\":0,\"leagueName\":\"法乙\",\"matchStatus\":1,\"matchTime\":\"2025-05-31 16:00:00\",\"recommendContent\":\"大5.5,小2.2\",\"serialize\":\"周五008\",\"updateTime\":\"2025-05-02 15:48:47\"}],\"payCode\":\"/profile/upload/2025/05/02/pay-code_20250502154357A001.jpg\",\"rateOfReturn\":\"100%~200%\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-06-28 19:45:34', 43);
INSERT INTO `sys_oper_log` VALUES (406, '修改闪电秘籍', 2, 'com.soccer.project.business.controller.LightningSecretController.update()', 'POST', 1, 'admin', '研发部门', '/business/lightningSecret/update', '127.0.0.1', '内网IP', '{\"id\":4,\"matchDate\":\"2025-06-01\",\"matchList\":[{\"createTime\":\"2025-05-02 15:48:47\",\"fullScore\":\"2-3\",\"groupId\":4,\"guestName\":\"罗德兹\",\"halfScore\":\"2-2\",\"hitIndex\":0,\"homeName\":\"梅斯\",\"id\":6,\"isHit\":1,\"leagueName\":\"法乙\",\"matchStatus\":1,\"matchTime\":\"2025-05-31 16:00:00\",\"recommendContent\":\"大5.5,小2.2\",\"serialize\":\"周五008\",\"updateTime\":\"2025-05-02 15:48:47\"}],\"payCode\":\"/profile/upload/2025/05/02/pay-code_20250502154357A001.jpg\",\"rateOfReturn\":\"100%~200%\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-06-28 19:56:49', 178);
INSERT INTO `sys_oper_log` VALUES (407, '修改北单锦囊', 2, 'com.soccer.project.business.controller.SingleBagController.update()', 'POST', 1, 'admin', '研发部门', '/business/singleBag/update', '127.0.0.1', '内网IP', '{\"id\":19,\"matchDate\":\"2025-04-16\",\"matchList\":[{\"createTime\":\"2025-04-16 13:56:13\",\"fullScore\":\"0-2\",\"groupId\":19,\"guestName\":\"赫尔辛堡\",\"halfScore\":\"0-0\",\"hitIndex\":0,\"homeName\":\"奥雷布洛\",\"id\":1,\"isHit\":1,\"leagueName\":\"瑞典甲\",\"matchStatus\":1,\"matchTime\":\"2025-04-15 16:00:00\",\"recommendContent\":\"[\\\"赫尔辛堡 +0.5\\\"]\",\"serialize\":\"北单001\",\"updateTime\":\"2025-04-16 13:56:13\"},{\"createTime\":\"2025-04-16 13:56:13\",\"fullScore\":\"1-0\",\"groupId\":19,\"guestName\":\"普埃布拉\",\"halfScore\":\"1-0\",\"homeName\":\"瓜达拉哈拉\",\"id\":2,\"isHit\":0,\"leagueName\":\"墨西联\",\"matchStatus\":1,\"matchTime\":\"2025-04-16 05:55:14\",\"recommendContent\":\"普埃布拉 +0.5\",\"serialize\":\"北单008\",\"updateTime\":\"2025-04-16 13:56:13\"}]}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Invalid JSON text: \"Invalid value.\" at position 0 in value for column \'t_single_bag_match.recommend_content\'.\r\n### The error may exist in file [D:\\workspace\\soccer-manager-admin\\target\\classes\\mybatis\\business\\SingleBagMatchMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO t_single_bag_match         (id,group_id,league_name,match_time,match_status,serialize,home_name,guest_name,half_score,full_score,recommend_content,         is_hit,hit_index         )         VALUES                        (?,?,?,?,?,?,             ?,?,?,?,?             ,? ,?             )          ,              (?,?,?,?,?,?,             ?,?,?,?,?             ,? ,?             )                   ON DUPLICATE KEY UPDATE         group_id=VALUES(group_id),         league_name=VALUES(league_name),         match_time=VALUES(match_time),         match_status=VALUES(match_status),         serialize=VALUES(serialize),         home_name=VALUES(home_name),         guest_name=VALUES(guest_name),         half_score=VALUES(half_score),         full_score=VALUES(full_score),         recommend_content=VALUES(recommend_content),         is_hit=VALUES(is_hit),         hit_index=VALUES(hit_index);\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Invalid JSON text: \"Invalid value.\" at position 0 in value for column \'t_single_bag_match.recommend_content\'.\n; Data truncation: Invalid JSON text: \"Invalid value.\" at position 0 in value for column \'t_single_bag_match.recommend_content\'.; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Invalid JSON text: \"Invalid value.\" at position 0 in value for column \'t_single_bag_match.recommend_content\'.', '2025-06-28 20:05:33', 2523);
INSERT INTO `sys_oper_log` VALUES (408, '修改北单锦囊', 2, 'com.soccer.project.business.controller.SingleBagController.update()', 'POST', 1, 'admin', '研发部门', '/business/singleBag/update', '127.0.0.1', '内网IP', '{\"id\":19,\"matchDate\":\"2025-04-16\",\"matchList\":[{\"createTime\":\"2025-04-16 13:56:13\",\"fullScore\":\"0-2\",\"groupId\":19,\"guestName\":\"赫尔辛堡\",\"halfScore\":\"0-0\",\"hitIndex\":0,\"homeName\":\"奥雷布洛\",\"id\":1,\"isHit\":1,\"leagueName\":\"瑞典甲\",\"matchStatus\":1,\"matchTime\":\"2025-04-15 16:00:00\",\"recommendContent\":\"[\\\"赫尔辛堡 +0.5\\\"]\",\"serialize\":\"北单001\",\"updateTime\":\"2025-04-16 13:56:13\"},{\"createTime\":\"2025-04-16 13:56:13\",\"fullScore\":\"1-0\",\"groupId\":19,\"guestName\":\"普埃布拉\",\"halfScore\":\"1-0\",\"homeName\":\"瓜达拉哈拉\",\"id\":2,\"isHit\":0,\"leagueName\":\"墨西联\",\"matchStatus\":1,\"matchTime\":\"2025-04-16 05:55:14\",\"recommendContent\":\"普埃布拉 +0.5\",\"serialize\":\"北单008\",\"updateTime\":\"2025-04-16 13:56:13\"}]}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-06-28 20:06:27', 26);
INSERT INTO `sys_oper_log` VALUES (409, '修改北单锦囊', 2, 'com.soccer.project.business.controller.SingleBagController.update()', 'POST', 1, 'admin', '研发部门', '/business/singleBag/update', '127.0.0.1', '内网IP', '{\"id\":19,\"matchDate\":\"2025-04-16\",\"matchList\":[{\"createTime\":\"2025-04-16 13:56:13\",\"fullScore\":\"0-2\",\"groupId\":19,\"guestName\":\"赫尔辛堡\",\"halfScore\":\"0-0\",\"hitIndex\":0,\"homeName\":\"奥雷布洛\",\"id\":1,\"isHit\":1,\"leagueName\":\"瑞典甲\",\"matchStatus\":1,\"matchTime\":\"2025-04-15 16:00:00\",\"recommendContent\":\"赫尔辛堡 +0.5\",\"serialize\":\"北单001\",\"updateTime\":\"2025-04-16 13:56:13\"},{\"createTime\":\"2025-04-16 13:56:13\",\"fullScore\":\"1-0\",\"groupId\":19,\"guestName\":\"普埃布拉\",\"halfScore\":\"1-0\",\"hitIndex\":0,\"homeName\":\"瓜达拉哈拉\",\"id\":2,\"isHit\":1,\"leagueName\":\"墨西联\",\"matchStatus\":1,\"matchTime\":\"2025-04-16 05:55:14\",\"recommendContent\":\"普埃布拉 +0.5\",\"serialize\":\"北单008\",\"updateTime\":\"2025-04-16 13:56:13\"}]}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-06-28 20:17:30', 19);
INSERT INTO `sys_oper_log` VALUES (410, '修改北单锦囊', 2, 'com.soccer.project.business.controller.SingleBagController.update()', 'POST', 1, 'admin', '研发部门', '/business/singleBag/update', '127.0.0.1', '内网IP', '{\"id\":19,\"matchDate\":\"2025-04-16\",\"matchList\":[{\"createTime\":\"2025-04-16 13:56:13\",\"fullScore\":\"0-2\",\"groupId\":19,\"guestName\":\"赫尔辛堡\",\"halfScore\":\"0-0\",\"hitIndex\":0,\"homeName\":\"奥雷布洛\",\"id\":1,\"isHit\":1,\"leagueName\":\"瑞典甲\",\"matchStatus\":1,\"matchTime\":\"2025-04-15 16:00:00\",\"recommendContent\":\"赫尔辛堡 +0.5\",\"serialize\":\"北单001\",\"updateTime\":\"2025-04-16 13:56:13\"},{\"createTime\":\"2025-04-16 13:56:13\",\"fullScore\":\"1-0\",\"groupId\":19,\"guestName\":\"普埃布拉\",\"halfScore\":\"1-0\",\"hitIndex\":0,\"homeName\":\"瓜达拉哈拉\",\"id\":2,\"isHit\":1,\"leagueName\":\"墨西联\",\"matchStatus\":1,\"matchTime\":\"2025-04-16 05:55:14\",\"recommendContent\":\"普埃布拉 +0.5\",\"serialize\":\"北单008\",\"updateTime\":\"2025-04-16 13:56:13\"}]}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-06-28 20:18:07', 8);
INSERT INTO `sys_oper_log` VALUES (411, '添加半全场狙击', 1, 'com.soccer.project.business.controller.HalfFullSnipeController.add()', 'POST', 1, 'admin', '研发部门', '/business/snipe/add', '127.0.0.1', '内网IP', '{\"matchDate\":\"2025-06-27\",\"matchList\":[{\"fullScore\":\"1-1\",\"groupId\":24,\"guestName\":\"dsd\",\"halfScore\":\"0-0\",\"hitIndex\":0,\"homeName\":\"sdd\",\"id\":16,\"isHit\":1,\"leagueName\":\"大师傅似的\",\"matchStatus\":1,\"matchTime\":\"2025-06-26 16:00:00\",\"recommendContent\":\"sdsd,ffgf\",\"serialize\":\"是的是的\"}]}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-06-28 20:24:11', 52);
INSERT INTO `sys_oper_log` VALUES (412, '修改半全场狙击的状态', 2, 'com.soccer.project.business.controller.HalfFullSnipeController.updateStatus()', 'POST', 1, 'admin', '研发部门', '/business/snipe/updateStatus', '127.0.0.1', '内网IP', '{\"id\":24,\"status\":1}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-06-28 20:24:17', 21);
INSERT INTO `sys_oper_log` VALUES (413, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/upload/2025/06/28/pay-code_20250628202900A001.jpg\",\"message\":\"请求成功\"}', 0, NULL, '2025-06-28 20:29:00', 340);
INSERT INTO `sys_oper_log` VALUES (414, '添加闪电秘籍', 1, 'com.soccer.project.business.controller.LightningSecretController.add()', 'POST', 1, 'admin', '研发部门', '/business/lightningSecret/add', '127.0.0.1', '内网IP', '{\"matchDate\":\"2025-06-28\",\"matchList\":[],\"payCode\":\"/profile/upload/2025/06/28/pay-code_20250628202900A001.jpg\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in com/soccer/project/business/mapper/LightningSecretMatchMapper.java (best guess)\r\n### The error may involve com.soccer.project.business.mapper.LightningSecretMatchMapper.insertBatchSomeColumn-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT IGNORE  INTO t_lightning_secret_match (group_id,league_name,match_time,match_status,serialize,home_name,guest_name,half_score,full_score,recommend_content,is_hit,hit_index,create_time) VALUES\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2025-06-28 20:29:15', 56);
INSERT INTO `sys_oper_log` VALUES (415, '添加闪电秘籍', 1, 'com.soccer.project.business.controller.LightningSecretController.add()', 'POST', 1, 'admin', '研发部门', '/business/lightningSecret/add', '127.0.0.1', '内网IP', '{\"matchDate\":\"2025-06-28\",\"matchList\":[],\"payCode\":\"/profile/upload/2025/06/28/pay-code_20250628202900A001.jpg\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'league_names\' doesn\'t have a default value\r\n### The error may exist in com/soccer/project/business/mapper/LightningSecretGroupMapper.java (best guess)\r\n### The error may involve com.soccer.project.business.mapper.LightningSecretGroupMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO t_lightning_secret_group  ( total,   pay_code,   match_date )  VALUES  ( ?,   ?,   ? )\r\n### Cause: java.sql.SQLException: Field \'league_names\' doesn\'t have a default value\n; Field \'league_names\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'league_names\' doesn\'t have a default value', '2025-06-28 20:32:24', 94);
INSERT INTO `sys_oper_log` VALUES (416, '添加闪电秘籍', 1, 'com.soccer.project.business.controller.LightningSecretController.add()', 'POST', 1, 'admin', '研发部门', '/business/lightningSecret/add', '127.0.0.1', '内网IP', '{\"matchDate\":\"2025-06-28\",\"matchList\":[],\"payCode\":\"/profile/upload/2025/06/28/pay-code_20250628202900A001.jpg\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-06-28 20:33:10', 29);
INSERT INTO `sys_oper_log` VALUES (417, '修改北单的状态', 2, 'com.soccer.project.business.controller.LightningSecretController.updateStatus()', 'POST', 1, 'admin', '研发部门', '/business/lightningSecret/updateStatus', '127.0.0.1', '内网IP', '{\"id\":7,\"status\":1}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-06-28 20:33:14', 38);
INSERT INTO `sys_oper_log` VALUES (418, '添加赛事', 1, 'com.soccer.project.business.controller.KoiFishController.add()', 'POST', 1, 'admin', '研发部门', '/business/koiFish/add', '127.0.0.1', '内网IP', '{\"fullScore\":\"1-0\",\"guestName\":\"的功夫\",\"homeName\":\"发的地方\",\"id\":12,\"isHit\":1,\"leagueName\":\"是的是的\",\"matchDate\":\"2025-06-28\",\"matchStatus\":1,\"matchTime\":\"2025-06-28 21:49:02\",\"serialize\":\"222\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-06-28 21:49:41', 24);
INSERT INTO `sys_oper_log` VALUES (419, '添加北单锦囊', 1, 'com.soccer.project.business.controller.SingleBagController.add()', 'POST', 1, 'admin', '研发部门', '/business/singleBag/add', '127.0.0.1', '内网IP', '{\"matchDate\":\"2025-06-27\",\"matchList\":[]}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-06-28 21:54:10', 26);
INSERT INTO `sys_oper_log` VALUES (420, '添加半全场狙击', 1, 'com.soccer.project.business.controller.HalfFullSnipeController.add()', 'POST', 1, 'admin', '研发部门', '/business/snipe/add', '127.0.0.1', '内网IP', '{\"matchDate\":\"2025-07-14\",\"matchList\":[{\"groupId\":25,\"guestName\":\"1\",\"homeName\":\"1\",\"id\":17,\"isHit\":0,\"leagueName\":\"1\",\"matchStatus\":0,\"matchTime\":\"2025-07-13 16:00:00\",\"serialize\":\"2\"}]}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-07-13 10:33:03', 64);
INSERT INTO `sys_oper_log` VALUES (421, '修改半全场狙击', 1, 'com.soccer.project.business.controller.HalfFullSnipeController.update()', 'POST', 1, 'admin', '研发部门', '/business/snipe/update', '127.0.0.1', '内网IP', '{\"id\":25,\"matchDate\":\"2025-07-14\",\"matchList\":[{\"groupId\":25,\"guestName\":\"1\",\"homeName\":\"1\",\"id\":17,\"isHit\":0,\"leagueName\":\"1\",\"matchStatus\":0,\"matchTime\":\"2025-07-14 08:00:00\",\"serialize\":\"2\",\"updateTime\":\"2025-07-13 10:33:03\"}]}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-07-13 10:36:31', 137);
INSERT INTO `sys_oper_log` VALUES (422, '修改半全场狙击', 1, 'com.soccer.project.business.controller.HalfFullSnipeController.update()', 'POST', 1, 'admin', '研发部门', '/business/snipe/update', '127.0.0.1', '内网IP', '{\"id\":25,\"matchDate\":\"2025-07-14\",\"matchList\":[{\"groupId\":25,\"guestName\":\"1\",\"homeName\":\"1\",\"id\":17,\"isHit\":0,\"leagueName\":\"1\",\"matchStatus\":0,\"matchTime\":\"2025-07-14 00:00:00\",\"serialize\":\"2\",\"updateTime\":\"2025-07-13 10:36:30\"}]}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-07-13 10:36:45', 25);
INSERT INTO `sys_oper_log` VALUES (423, '修改半全场狙击', 1, 'com.soccer.project.business.controller.HalfFullSnipeController.update()', 'POST', 1, 'admin', '研发部门', '/business/snipe/update', '127.0.0.1', '内网IP', '{\"id\":25,\"matchDate\":\"2025-07-14\",\"matchList\":[{\"groupId\":25,\"guestName\":\"1\",\"homeName\":\"1\",\"id\":17,\"isHit\":0,\"leagueName\":\"1\",\"matchStatus\":0,\"matchTime\":\"2025-07-14 00:00:00\",\"serialize\":\"2\",\"updateTime\":\"2025-07-13 10:36:45\"}]}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-07-13 10:37:53', 84);
INSERT INTO `sys_oper_log` VALUES (424, '修改半全场狙击', 1, 'com.soccer.project.business.controller.HalfFullSnipeController.update()', 'POST', 1, 'admin', '研发部门', '/business/snipe/update', '127.0.0.1', '内网IP', '{\"id\":25,\"matchDate\":\"2025-07-14\",\"matchList\":[{\"groupId\":25,\"guestName\":\"1\",\"homeName\":\"1\",\"id\":17,\"isHit\":0,\"leagueName\":\"1\",\"matchStatus\":0,\"matchTime\":\"2025-07-15 00:00:00\",\"serialize\":\"2\",\"updateTime\":\"2025-07-13 10:37:53\"}]}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-07-13 10:39:53', 26);
INSERT INTO `sys_oper_log` VALUES (425, '添加北单锦囊', 1, 'com.soccer.project.business.controller.SingleBagController.add()', 'POST', 1, 'admin', '研发部门', '/business/singleBag/add', '127.0.0.1', '内网IP', '{\"matchDate\":\"2025-07-15\",\"matchList\":[{\"groupId\":33,\"guestName\":\"1\",\"homeName\":\"1\",\"id\":11,\"isHit\":0,\"leagueName\":\"1\",\"matchStatus\":0,\"matchTime\":\"2025-07-15 00:00:00\",\"recommendContent\":\"1\",\"serialize\":\"1\"}]}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-07-13 10:40:44', 45);
INSERT INTO `sys_oper_log` VALUES (426, '修改北单锦囊', 2, 'com.soccer.project.business.controller.SingleBagController.update()', 'POST', 1, 'admin', '研发部门', '/business/singleBag/update', '127.0.0.1', '内网IP', '{\"id\":33,\"matchDate\":\"2025-07-15\",\"matchList\":[{\"groupId\":33,\"guestName\":\"1\",\"homeName\":\"1\",\"id\":11,\"isHit\":0,\"leagueName\":\"1\",\"matchStatus\":0,\"matchTime\":\"2025-07-23 00:00:00\",\"recommendContent\":\"1\",\"serialize\":\"1\",\"updateTime\":\"2025-07-13 10:40:44\"}]}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-07-13 10:40:58', 33);
INSERT INTO `sys_oper_log` VALUES (427, '添加闪电秘籍', 1, 'com.soccer.project.business.controller.LightningSecretController.add()', 'POST', 1, 'admin', '研发部门', '/business/lightningSecret/add', '127.0.0.1', '内网IP', '{\"matchDate\":\"2025-07-15\",\"matchList\":[{\"groupId\":8,\"guestName\":\"1\",\"homeName\":\"1\",\"id\":9,\"isHit\":0,\"leagueName\":\"1\",\"matchStatus\":0,\"matchTime\":\"2025-07-14 16:00:00\",\"serialize\":\"1\"}]}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-07-13 10:41:22', 28);
INSERT INTO `sys_oper_log` VALUES (428, '修改闪电秘籍', 2, 'com.soccer.project.business.controller.LightningSecretController.update()', 'POST', 1, 'admin', '研发部门', '/business/lightningSecret/update', '127.0.0.1', '内网IP', '{\"id\":8,\"matchDate\":\"2025-07-15\",\"matchList\":[{\"groupId\":8,\"guestName\":\"1\",\"homeName\":\"1\",\"id\":9,\"isHit\":0,\"leagueName\":\"1\",\"matchStatus\":0,\"matchTime\":\"2025-07-15 16:00:00\",\"serialize\":\"1\",\"updateTime\":\"2025-07-13 10:41:22\"}]}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-07-13 10:43:25', 135);
INSERT INTO `sys_oper_log` VALUES (429, '修改闪电秘籍', 2, 'com.soccer.project.business.controller.LightningSecretController.update()', 'POST', 1, 'admin', '研发部门', '/business/lightningSecret/update', '127.0.0.1', '内网IP', '{\"id\":8,\"matchDate\":\"2025-07-15\",\"matchList\":[{\"groupId\":8,\"guestName\":\"1\",\"homeName\":\"1\",\"id\":9,\"isHit\":0,\"leagueName\":\"1\",\"matchStatus\":0,\"matchTime\":\"2025-07-15 15:00:00\",\"serialize\":\"1\",\"updateTime\":\"2025-07-13 10:43:25\"}]}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-07-13 10:43:35', 28);
INSERT INTO `sys_oper_log` VALUES (430, '添加赛事', 1, 'com.soccer.project.business.controller.KoiFishController.add()', 'POST', 1, 'admin', '研发部门', '/business/koiFish/add', '127.0.0.1', '内网IP', '{\"guestName\":\"1\",\"homeName\":\"1\",\"id\":13,\"leagueName\":\"1\",\"matchDate\":\"2025-07-15\",\"matchStatus\":0,\"matchTime\":\"2025-07-15 00:00:00\",\"serialize\":\"1\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-07-13 10:44:34', 47);
INSERT INTO `sys_oper_log` VALUES (431, '上传图片', 1, 'com.soccer.project.common.CommonController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/common/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/upload/2025/07/13/pay-code_20250628173501A001_20250713115611A001.jpg\",\"message\":\"请求成功\"}', 0, NULL, '2025-07-13 11:56:12', 152);
INSERT INTO `sys_oper_log` VALUES (432, '添加半全场狙击', 1, 'com.soccer.project.business.controller.HalfFullSnipeController.add()', 'POST', 1, 'admin', '研发部门', '/business/snipe/add', '127.0.0.1', '内网IP', '{\"matchDate\":\"2025-07-16\",\"matchList\":[],\"payCode\":\"/profile/upload/2025/07/13/pay-code_20250628173501A001_20250713115611A001.jpg\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2025-07-13 11:56:13', 104);
INSERT INTO `sys_oper_log` VALUES (433, '用户头像', 2, 'com.soccer.project.system.controller.SysProfileController.avatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2026/06/05/ai_half_full_20260605140436A001.jpg\",\"code\":200}', 0, NULL, '2026-06-05 14:04:36', 95);
INSERT INTO `sys_oper_log` VALUES (434, '用户头像', 2, 'com.soccer.project.system.controller.SysProfileController.avatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', NULL, 1, '文件[favicon.ico]后缀[ico]不正确，请上传[bmp, gif, jpg, jpeg, png]格式', '2026-06-05 14:11:51', 13);
INSERT INTO `sys_oper_log` VALUES (435, '用户头像', 2, 'com.soccer.project.system.controller.SysProfileController.avatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2026/06/05/logo_20260605141208A002.png\",\"code\":200}', 0, NULL, '2026-06-05 14:12:08', 8);
INSERT INTO `sys_oper_log` VALUES (436, '菜单管理', 3, 'com.soccer.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2010', '127.0.0.1', '内网IP', '2010', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-05 14:12:21', 28);
INSERT INTO `sys_oper_log` VALUES (437, '菜单管理', 3, 'com.soccer.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2000', '127.0.0.1', '内网IP', '2000', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-05 14:19:22', 9);
INSERT INTO `sys_oper_log` VALUES (438, '菜单管理', 2, 'com.soccer.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"intel/intel\",\"createTime\":\"2025-04-07 21:08:49\",\"icon\":\"textarea\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"情报管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2001,\"path\":\"intel\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-05 14:31:33', 18);
INSERT INTO `sys_oper_log` VALUES (439, '菜单管理', 3, 'com.soccer.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2006', '127.0.0.1', '内网IP', '2006', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-05 15:52:46', 34);
INSERT INTO `sys_oper_log` VALUES (440, '菜单管理', 3, 'com.soccer.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2007', '127.0.0.1', '内网IP', '2007', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-05 15:52:49', 8);
INSERT INTO `sys_oper_log` VALUES (441, '菜单管理', 3, 'com.soccer.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2008', '127.0.0.1', '内网IP', '2008', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-05 15:52:51', 7);
INSERT INTO `sys_oper_log` VALUES (442, '菜单管理', 3, 'com.soccer.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2009', '127.0.0.1', '内网IP', '2009', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-05 15:52:54', 8);
INSERT INTO `sys_oper_log` VALUES (443, '菜单管理', 3, 'com.soccer.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2002', '127.0.0.1', '内网IP', '2002', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2026-06-05 15:52:58', 2);
INSERT INTO `sys_oper_log` VALUES (444, '菜单管理', 3, 'com.soccer.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2004', '127.0.0.1', '内网IP', '2004', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-05 15:53:02', 8);
INSERT INTO `sys_oper_log` VALUES (445, '菜单管理', 3, 'com.soccer.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2003', '127.0.0.1', '内网IP', '2003', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-05 15:53:04', 18);
INSERT INTO `sys_oper_log` VALUES (446, '菜单管理', 3, 'com.soccer.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2002', '127.0.0.1', '内网IP', '2002', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-05 15:53:06', 11);
INSERT INTO `sys_oper_log` VALUES (447, '菜单管理', 1, 'com.soccer.project.system.controller.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"/ai/WinLose\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"胜负管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"winLose\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-05 16:13:01', 37);
INSERT INTO `sys_oper_log` VALUES (448, '菜单管理', 2, 'com.soccer.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"ai/WinLose\",\"createTime\":\"2026-06-05 16:13:01\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2011,\"menuName\":\"胜负管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"winLose\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-05 16:13:28', 14);
INSERT INTO `sys_oper_log` VALUES (449, '菜单管理', 2, 'com.soccer.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"ai/WinLose\",\"createTime\":\"2026-06-05 16:13:01\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2011,\"menuName\":\"胜负管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"winLose\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-05 16:14:16', 11);
INSERT INTO `sys_oper_log` VALUES (450, '图片上传', 1, 'com.soccer.project.business.controller.WinLoseController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/business/winlose/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/avatar/2026/06/05/logo_20260605161945A001.png\",\"message\":\"请求成功\"}', 0, NULL, '2026-06-05 16:19:45', 111);
INSERT INTO `sys_oper_log` VALUES (451, '图片上传', 1, 'com.soccer.project.business.controller.WinLoseController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/business/winlose/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/avatar/2026/06/05/logo_20260605161949A002.png\",\"message\":\"请求成功\"}', 0, NULL, '2026-06-05 16:19:49', 2);
INSERT INTO `sys_oper_log` VALUES (452, '图片上传', 1, 'com.soccer.project.business.controller.WinLoseController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/business/winlose/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/avatar/2026/06/05/logo_20260605161952A003.png\",\"message\":\"请求成功\"}', 0, NULL, '2026-06-05 16:19:52', 3);
INSERT INTO `sys_oper_log` VALUES (453, '添加胜负', 1, 'com.soccer.project.business.controller.WinLoseController.add()', 'POST', 1, 'admin', '研发部门', '/business/winlose/add', '127.0.0.1', '内网IP', '{\"awayLogo\":\"/profile/avatar/2026/06/05/logo_20260605161952A003.png\",\"awayName\":\"巴功联队\",\"homeLogo\":\"/profile/avatar/2026/06/05/logo_20260605161949A002.png\",\"homeName\":\"巴功联队\",\"isHit\":0,\"leagueLogo\":\"/profile/avatar/2026/06/05/logo_20260605161945A001.png\",\"leagueName\":\"印尼丁\",\"recommendContent\":\"主胜\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in com/soccer/project/business/mapper/WinLoseMapper.java (best guess)\r\n### The error may involve com.soccer.project.business.mapper.WinLoseMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO t_win_lose  ( league_name, league_logo, home_name, home_logo, away_name, away_logo, is_hit, recommend_content )  VALUES (  ?, ?, ?, ?, ?, ?, ?, ?  )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value', '2026-06-05 16:21:15', 26);
INSERT INTO `sys_oper_log` VALUES (454, '添加胜负', 1, 'com.soccer.project.business.controller.WinLoseController.add()', 'POST', 1, 'admin', '研发部门', '/business/winlose/add', '127.0.0.1', '内网IP', '{\"awayLogo\":\"/profile/avatar/2026/06/05/logo_20260605161952A003.png\",\"awayName\":\"巴功联队\",\"homeLogo\":\"/profile/avatar/2026/06/05/logo_20260605161949A002.png\",\"homeName\":\"巴功联队\",\"isHit\":0,\"leagueLogo\":\"/profile/avatar/2026/06/05/logo_20260605161945A001.png\",\"leagueName\":\"印尼丁\",\"recommendContent\":\"主胜\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'match_date\' doesn\'t have a default value\r\n### The error may exist in com/soccer/project/business/mapper/WinLoseMapper.java (best guess)\r\n### The error may involve com.soccer.project.business.mapper.WinLoseMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO t_win_lose  ( league_name, league_logo, home_name, home_logo, away_name, away_logo, is_hit, recommend_content )  VALUES (  ?, ?, ?, ?, ?, ?, ?, ?  )\r\n### Cause: java.sql.SQLException: Field \'match_date\' doesn\'t have a default value\n; Field \'match_date\' doesn\'t have a default value', '2026-06-05 16:21:29', 5);
INSERT INTO `sys_oper_log` VALUES (455, '图片上传', 1, 'com.soccer.project.business.controller.WinLoseController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/business/winlose/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/avatar/2026/06/05/logo_20260605162921A001.png\",\"message\":\"请求成功\"}', 0, NULL, '2026-06-05 16:29:21', 30);
INSERT INTO `sys_oper_log` VALUES (456, '图片上传', 1, 'com.soccer.project.business.controller.WinLoseController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/business/winlose/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/avatar/2026/06/05/logo_20260605162925A002.png\",\"message\":\"请求成功\"}', 0, NULL, '2026-06-05 16:29:25', 1);
INSERT INTO `sys_oper_log` VALUES (457, '图片上传', 1, 'com.soccer.project.business.controller.WinLoseController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/business/winlose/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/avatar/2026/06/05/logo_20260605162940A003.png\",\"message\":\"请求成功\"}', 0, NULL, '2026-06-05 16:29:40', 1);
INSERT INTO `sys_oper_log` VALUES (458, '添加胜负', 1, 'com.soccer.project.business.controller.WinLoseController.add()', 'POST', 1, 'admin', '研发部门', '/business/winlose/add', '127.0.0.1', '内网IP', '{\"awayLogo\":\"/profile/avatar/2026/06/05/logo_20260605162940A003.png\",\"awayName\":\"巴功外\",\"homeLogo\":\"/profile/avatar/2026/06/05/logo_20260605162925A002.png\",\"homeName\":\"巴功内\",\"id\":1,\"isHit\":-1,\"leagueLogo\":\"/profile/avatar/2026/06/05/logo_20260605162921A001.png\",\"leagueName\":\"印尼丁\",\"matchDate\":\"2026-06-05\",\"recommendContent\":\"主胜\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2026-06-05 16:30:03', 25);
INSERT INTO `sys_oper_log` VALUES (459, '图片上传', 1, 'com.soccer.project.business.controller.WinLoseController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/business/winlose/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/avatar/2026/06/05/logo_20260605171158A001.png\",\"message\":\"请求成功\"}', 0, NULL, '2026-06-05 17:11:58', 115);
INSERT INTO `sys_oper_log` VALUES (460, '图片上传', 1, 'com.soccer.project.business.controller.WinLoseController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/business/winlose/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/avatar/2026/06/05/logo_20260605171213A002.png\",\"message\":\"请求成功\"}', 0, NULL, '2026-06-05 17:12:13', 2);
INSERT INTO `sys_oper_log` VALUES (461, '图片上传', 1, 'com.soccer.project.business.controller.WinLoseController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/business/winlose/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/avatar/2026/06/05/logo_20260605171215A003.png\",\"message\":\"请求成功\"}', 0, NULL, '2026-06-05 17:12:15', 1);
INSERT INTO `sys_oper_log` VALUES (462, '添加胜负', 1, 'com.soccer.project.business.controller.WinLoseController.add()', 'POST', 1, 'admin', '研发部门', '/business/winlose/add', '127.0.0.1', '内网IP', '{\"awayLogo\":\"/profile/avatar/2026/06/05/logo_20260605171215A003.png\",\"awayName\":\"摩顿城精英\",\"homeLogo\":\"/profile/avatar/2026/06/05/logo_20260605171213A002.png\",\"homeName\":\"伊斯顿沙伯\\t\",\"id\":2,\"isHit\":-1,\"leagueLogo\":\"/profile/avatar/2026/06/05/logo_20260605171158A001.png\",\"leagueName\":\"澳昆超\",\"matchDate\":\"2026-06-01 17:10:32\",\"recommendContent\":\"主胜\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2026-06-05 17:12:48', 41);
INSERT INTO `sys_oper_log` VALUES (463, '删除胜负', 3, 'com.soccer.project.business.controller.WinLoseController.delete()', 'POST', 1, 'admin', '研发部门', '/business/winlose/delete', '127.0.0.1', '内网IP', '{\"id\":\"1\"}', '{\"code\":200,\"message\":\"请求成功\"}', 0, NULL, '2026-06-05 17:12:52', 31);
INSERT INTO `sys_oper_log` VALUES (464, '菜单管理', 1, 'com.soccer.project.system.controller.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"ai/Corner\",\"createBy\":\"admin\",\"icon\":\"eye\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"角球管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2001,\"path\":\"corner\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-05 21:39:01', 33);
INSERT INTO `sys_oper_log` VALUES (465, '菜单管理', 1, 'com.soccer.project.system.controller.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"ai/Goal\",\"createBy\":\"admin\",\"icon\":\"eye\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"进球管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2001,\"path\":\"goal\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-05 21:40:12', 12);
INSERT INTO `sys_oper_log` VALUES (466, '菜单管理', 1, 'com.soccer.project.system.controller.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"ai/HalfFull\",\"createBy\":\"admin\",\"icon\":\"eye\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"半全场\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2001,\"path\":\"halfFull\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-05 21:41:09', 10);
INSERT INTO `sys_oper_log` VALUES (467, '菜单管理', 1, 'com.soccer.project.system.controller.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"ai/Score\",\"createBy\":\"admin\",\"icon\":\"eye\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"比分管理\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":2001,\"path\":\"score\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-05 21:41:53', 9);
INSERT INTO `sys_oper_log` VALUES (468, '菜单管理', 2, 'com.soccer.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"ai/HalfFull\",\"createTime\":\"2026-06-05 21:41:09\",\"icon\":\"eye\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2014,\"menuName\":\"半全场\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":2001,\"path\":\"halfFull\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-05 21:42:05', 11);
INSERT INTO `sys_oper_log` VALUES (469, '菜单管理', 2, 'com.soccer.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"ai/HalfFull\",\"createTime\":\"2026-06-05 21:41:09\",\"icon\":\"eye\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2014,\"menuName\":\"半全场\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2001,\"path\":\"halfFull\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-05 21:42:11', 12);
INSERT INTO `sys_oper_log` VALUES (470, '图片上传', 1, 'com.soccer.project.business.controller.CornerController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/business/corner/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/avatar/2026/06/05/logo_20260605220023A001.png\",\"message\":\"请求成功\"}', 0, NULL, '2026-06-05 22:00:24', 134);
INSERT INTO `sys_oper_log` VALUES (471, '图片上传', 1, 'com.soccer.project.business.controller.CornerController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/business/corner/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/avatar/2026/06/05/logo_20260605220049A002.png\",\"message\":\"请求成功\"}', 0, NULL, '2026-06-05 22:00:49', 7);
INSERT INTO `sys_oper_log` VALUES (472, '图片上传', 1, 'com.soccer.project.business.controller.CornerController.uploadImage()', 'POST', 1, 'admin', '研发部门', '/business/corner/uploadImage', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":\"/profile/avatar/2026/06/05/logo_20260605220100A003.png\",\"message\":\"请求成功\"}', 0, NULL, '2026-06-05 22:01:00', 9);
INSERT INTO `sys_oper_log` VALUES (473, '添加角球', 1, 'com.soccer.project.business.controller.CornerController.add()', 'POST', 1, 'admin', '研发部门', '/business/corner/add', '127.0.0.1', '内网IP', '{\"awayLogo\":\"/profile/avatar/2026/06/05/logo_20260605220100A003.png\",\"awayName\":\"金海\",\"awayScore\":\"9\",\"homeLogo\":\"/profile/avatar/2026/06/05/logo_20260605220049A002.png\",\"homeName\":\"城南FC\",\"homeScore\":\"4\",\"isHit\":-1,\"leagueLogo\":\"/profile/avatar/2026/06/05/logo_20260605220023A001.png\",\"leagueName\":\"韩k2联\",\"matchDate\":\"2026-06-05 18:30:00\",\"recommendContent\":\"大10\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'home_score\' in \'field list\'\r\n### The error may exist in com/soccer/project/business/mapper/CornerMapper.java (best guess)\r\n### The error may involve com.soccer.project.business.mapper.CornerMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO t_corner  ( league_name, league_logo, home_name, home_logo, away_name, away_logo, home_score, away_score, recommend_content, is_hit, match_date )  VALUES (  ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?  )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'home_score\' in \'field list\'\n; bad SQL grammar []', '2026-06-05 22:02:32', 259);
INSERT INTO `sys_oper_log` VALUES (474, '菜单管理', 1, 'com.soccer.project.system.controller.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"analysis/index\",\"createBy\":\"admin\",\"icon\":\"druid\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"分析管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"analysis\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 18:04:57', 50);
INSERT INTO `sys_oper_log` VALUES (475, '菜单管理', 2, 'com.soccer.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"analysis/Analysis\",\"createTime\":\"2026-06-06 18:04:57\",\"icon\":\"druid\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2016,\"menuName\":\"分析管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"analysis\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 18:22:29', 15);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(0) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2025-04-04 14:12:14', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2025-04-04 14:12:14', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(0) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 99 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2025-04-04 14:12:14', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2025-04-04 14:12:14', 'admin', '2025-04-04 15:10:36', '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(0) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(0) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(0) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 99 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '/profile/avatar/2026/06/05/logo_20260605141208A002.png', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2026-06-06 18:13:21', 'admin', '2025-04-04 14:12:14', '', '2026-06-06 18:13:20', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-04-04 14:12:14', 'admin', '2025-04-04 14:12:14', '', NULL, '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `post_id` bigint(0) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

-- ----------------------------
-- Table structure for t_analysis
-- ----------------------------
DROP TABLE IF EXISTS `t_analysis`;
CREATE TABLE `t_analysis`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `league_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `league_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '联赛名称',
  `home_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '主队logo',
  `home_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主队名称',
  `away_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客队logo',
  `away_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '客队名称',
  `match_time` datetime(0) NOT NULL COMMENT '赛事时间',
  `score_result` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '比分结果',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '推荐内容',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '分析表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_analysis
-- ----------------------------
INSERT INTO `t_analysis` VALUES (1, NULL, '英超', NULL, '曼彻斯特城', NULL, '阿森纳', '2025-06-07 20:00:00', '2-1', '<p><strong>曼城主场强势取胜</strong></p><p>本场比赛曼城凭借哈兰德的梅开二度，2-1击败阿森纳。从全场数据来看，曼城控球率55%，射门14次，射正6次，展现出了强大的主场统治力。</p><p><span style=\"color: #E74C3C;\"><strong>关键分析：</strong></span>曼城本赛季主场胜率高达85%，面对阿森纳的历史交锋也占据明显优势。考虑到曼城目前争冠关键期的战意加成，本场推荐主胜。</p>', '2026-06-06 18:26:06');
INSERT INTO `t_analysis` VALUES (2, NULL, '西甲', NULL, '巴塞罗那', NULL, '皇家马德里', '2025-06-07 22:00:00', '3-2', '<p><strong>国家德比巴萨笑到最后</strong></p><p>巴萨在主场3-2力克皇马，莱万、佩德里和拉菲尼亚各入一球。皇马方面维尼修斯和贝林厄姆分别建功，但未能挽回败局。</p><p><span style=\"color: #E74C3C;\"><strong>关键分析：</strong></span>巴萨本赛季主场进攻火力凶猛，场均进球2.3个。皇马后防核心缺阵对球队影响较大。本场大球方向顺利打出。</p>', '2026-06-06 18:26:06');
INSERT INTO `t_analysis` VALUES (3, NULL, '德甲', NULL, '拜仁慕尼黑', NULL, '多特蒙德', '2025-06-08 01:30:00', '4-0', '<p><strong>拜仁主场大胜多特</strong></p><p>拜仁慕尼黑在安联球场4-0横扫多特蒙德，凯恩上演帽子戏法，穆西亚拉锦上添花。多特蒙德全场仅3次射门，毫无还手之力。</p><p><span style=\"color: #E74C3C;\"><strong>关键分析：</strong></span>拜仁周中无欧战任务，体能占优。多特客场防守漏洞明显，近5个客场场均失球2.4个。推荐主队大胜。</p>', '2026-06-06 18:26:06');
INSERT INTO `t_analysis` VALUES (4, NULL, '意甲', NULL, 'AC米兰', NULL, '国际米兰', '2025-06-08 02:45:00', '1-1', '<p><strong>米兰德比握手言和</strong></p><p>AC米兰与国际米兰1-1战平，莱奥和劳塔罗分别为各自球队建功。全场比赛双方互有攻守，场面十分激烈。</p><p><span style=\"color: #E74C3C;\"><strong>关键分析：</strong></span>米兰德比历来以胶着著称，双方近6次交手有4场打出平局。本场比赛双方防线均表现稳健，推荐的平局方向顺利命中。</p>', '2026-06-06 18:26:06');
INSERT INTO `t_analysis` VALUES (5, NULL, '法甲', NULL, '巴黎圣日耳曼', NULL, '马赛', '2025-06-08 21:00:00', '3-0', '<p><strong>巴黎主场轻取马赛</strong></p><p>巴黎圣日耳曼3-0完胜马赛，姆巴佩贡献两射一传，登贝莱也打入一球。巴黎全场控球率达到65%，完全掌控了比赛节奏。</p><p><span style=\"color: #E74C3C;\"><strong>关键分析：</strong></span>巴黎主场对阵马赛已连续7场不败（6胜1平）。巴黎阵容齐整，而马赛伤病满营，实力差距明显。推荐主胜。</p>', '2026-06-06 18:26:06');
INSERT INTO `t_analysis` VALUES (6, NULL, '英超', NULL, '利物浦', NULL, '切尔西', '2025-06-09 00:30:00', '2-2', '<p><strong>利物浦切尔西激情对攻</strong></p><p>利物浦主场2-2战平切尔西，萨拉赫点球破门，努涅斯头球建功；切尔西方面帕尔默和杰克逊分别进球。全场比赛双方共完成30次射门，场面极为开放。</p><p><span style=\"color: #E74C3C;\"><strong>关键分析：</strong></span>两队近期进攻状态出色，但防守都存在隐患。本场大球方向是最优选择，双方都有能力取得进球。</p>', '2026-06-06 18:26:06');
INSERT INTO `t_analysis` VALUES (7, NULL, '西甲', NULL, '马德里竞技', NULL, '毕尔巴鄂竞技', '2025-06-09 22:00:00', '1-0', '<p><strong>马竞小胜毕尔巴鄂</strong></p><p>马德里竞技主场1-0小胜毕尔巴鄂竞技，格列兹曼打入全场唯一进球。马竞延续了西蒙尼治下的铁血防守风格，全场仅让对手获得2次射正机会。</p><p><span style=\"color: #E74C3C;\"><strong>关键分析：</strong></span>马竞主场防守固若金汤，本赛季主场场均失球仅0.6个。毕尔巴鄂客场进攻乏力，看好马竞小胜和小球方向。</p>', '2026-06-06 18:26:06');
INSERT INTO `t_analysis` VALUES (8, NULL, '德甲', NULL, '勒沃库森', NULL, '莱比锡红牛', '2025-06-10 01:30:00', '2-1', '<p><strong>勒沃库森逆转莱比锡</strong></p><p>勒沃库森主场2-1逆转莱比锡红牛，维尔茨和希克在下半场连入两球。药厂在落后一球的情况下展现了极强的韧性，全场控球率58%，射门16次。</p><p><span style=\"color: #E74C3C;\"><strong>关键分析：</strong></span>勒沃库森本赛季主场让球盘表现出色，近8个主场赢下6个盘口。球队下半场进球能力突出，占总进球的65%。推荐勒沃库森主场取胜。</p>', '2026-06-06 18:26:06');

-- ----------------------------
-- Table structure for t_corner
-- ----------------------------
DROP TABLE IF EXISTS `t_corner`;
CREATE TABLE `t_corner`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `league_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `league_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `home_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `home_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `away_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `away_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `recommend_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `is_today_data` tinyint(1) NOT NULL DEFAULT 0,
  `is_hit` tinyint(1) NOT NULL DEFAULT -1,
  `match_date` datetime(0) NOT NULL,
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_corner
-- ----------------------------
INSERT INTO `t_corner` VALUES (1, '英超', NULL, '阿森纳', NULL, NULL, '切尔西', '主队角球占优', 1, -1, '2025-06-05 20:00:00', '2025-06-05 10:00:00');
INSERT INTO `t_corner` VALUES (2, '西甲', NULL, '巴塞罗那', NULL, NULL, '皇家马德里', '巴萨角球压制', 1, -1, '2025-06-05 22:00:00', '2025-06-05 10:00:00');
INSERT INTO `t_corner` VALUES (3, '德甲', NULL, '拜仁慕尼黑', NULL, NULL, '多特蒙德', '拜仁边路进攻多', 1, -1, '2025-06-05 21:00:00', '2025-06-05 10:00:00');
INSERT INTO `t_corner` VALUES (4, '意甲', NULL, 'AC米兰', NULL, NULL, '国际米兰', '米兰角球数领先', 1, -1, '2025-06-05 23:00:00', '2025-06-05 10:00:00');
INSERT INTO `t_corner` VALUES (5, '英超', NULL, '利物浦', NULL, NULL, '热刺', '利物浦角球较多', 0, -1, '2025-06-04 20:00:00', '2025-06-04 10:00:00');
INSERT INTO `t_corner` VALUES (6, '西甲', NULL, '马德里竞技', NULL, NULL, '塞维利亚', '马竞防守角球少', 0, 1, '2025-06-04 22:00:00', '2025-06-04 10:00:00');
INSERT INTO `t_corner` VALUES (7, '法甲', NULL, '巴黎圣日耳曼', NULL, NULL, '马赛', '马赛角球意外领先', 0, 0, '2025-06-03 21:00:00', '2025-06-03 10:00:00');
INSERT INTO `t_corner` VALUES (8, '德甲', NULL, '莱比锡红牛', NULL, NULL, '法兰克福', '莱比锡角球占优', 0, -1, '2025-06-03 23:00:00', '2025-06-03 10:00:00');
INSERT INTO `t_corner` VALUES (9, '英超', NULL, '曼联', NULL, NULL, '曼城', '曼联角球造威胁', 0, 1, '2025-06-02 20:00:00', '2025-06-02 10:00:00');
INSERT INTO `t_corner` VALUES (10, '意甲', NULL, '尤文图斯', NULL, NULL, '那不勒斯', '那不勒斯角球反击', 0, 0, '2025-06-02 22:00:00', '2025-06-02 10:00:00');
INSERT INTO `t_corner` VALUES (11, '欧冠', NULL, '曼城', NULL, NULL, '拜仁慕尼黑', '曼城控球角球多', 1, -1, '2025-06-05 23:59:00', '2025-06-05 10:00:00');

-- ----------------------------
-- Table structure for t_expert
-- ----------------------------
DROP TABLE IF EXISTS `t_expert`;
CREATE TABLE `t_expert`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '行id 主键',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '专家名称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '头像',
  `hit_text` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '命中描述（近10中9）',
  `continue_num` int(0) NULL DEFAULT NULL COMMENT '连红次数',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0未启用 1已生效 -1已删除',
  `sort` int(0) NOT NULL DEFAULT 1 COMMENT '排序',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `expert_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '专家表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_expert
-- ----------------------------
INSERT INTO `t_expert` VALUES (2, '温格教练', '/profile/avatar/2025/04/15/温格教练_20250415095241A001.png', '近10中10', 8, 1, 2, '2025-04-06 13:30:37', '2025-04-06 13:30:37');
INSERT INTO `t_expert` VALUES (3, '许力国', '/profile/avatar/2025/04/13/许力国_20250413003414A001.png', '近10中8', 8, -1, 1, '2025-04-13 00:34:26', '2025-04-13 00:34:26');
INSERT INTO `t_expert` VALUES (5, '王麻子', '/profile/avatar/2025/04/15/王麻子_20250415095251A002.png', '近10中9', 9, 1, 3, '2025-04-13 13:09:54', '2025-04-13 13:09:54');

-- ----------------------------
-- Table structure for t_goal
-- ----------------------------
DROP TABLE IF EXISTS `t_goal`;
CREATE TABLE `t_goal`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `league_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `league_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `home_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `home_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `away_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `away_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `recommend_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `is_today_data` tinyint(1) NOT NULL DEFAULT 0,
  `is_hit` tinyint(1) NOT NULL DEFAULT -1,
  `match_date` datetime(0) NOT NULL,
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_goal
-- ----------------------------
INSERT INTO `t_goal` VALUES (1, '英超', NULL, '阿森纳', NULL, NULL, '切尔西', '总进球数2-3球', 1, -1, '2025-06-05 20:00:00', '2025-06-05 10:00:00');
INSERT INTO `t_goal` VALUES (2, '西甲', NULL, '巴塞罗那', NULL, NULL, '皇家马德里', '国家德比进球不会少', 1, -1, '2025-06-05 22:00:00', '2025-06-05 10:00:00');
INSERT INTO `t_goal` VALUES (3, '德甲', NULL, '拜仁慕尼黑', NULL, NULL, '多特蒙德', '拜仁火力全开', 1, -1, '2025-06-05 21:00:00', '2025-06-05 10:00:00');
INSERT INTO `t_goal` VALUES (4, '意甲', NULL, 'AC米兰', NULL, NULL, '国际米兰', '米兰德比进球数不多', 1, -1, '2025-06-05 23:00:00', '2025-06-05 10:00:00');
INSERT INTO `t_goal` VALUES (5, '英超', NULL, '利物浦', NULL, NULL, '热刺', '红军进攻犀利', 0, -1, '2025-06-04 20:00:00', '2025-06-04 10:00:00');
INSERT INTO `t_goal` VALUES (6, '西甲', NULL, '马德里竞技', NULL, NULL, '塞维利亚', '马竞进球效率高', 0, 1, '2025-06-04 22:00:00', '2025-06-04 10:00:00');
INSERT INTO `t_goal` VALUES (7, '法甲', NULL, '巴黎圣日耳曼', NULL, NULL, '马赛', '马赛反击进球', 0, 0, '2025-06-03 21:00:00', '2025-06-03 10:00:00');
INSERT INTO `t_goal` VALUES (8, '德甲', NULL, '莱比锡红牛', NULL, NULL, '法兰克福', '莱比锡进球能力强', 0, -1, '2025-06-03 23:00:00', '2025-06-03 10:00:00');
INSERT INTO `t_goal` VALUES (9, '英超', NULL, '曼联', NULL, NULL, '曼城', '曼市德比进球大战', 0, 1, '2025-06-02 20:00:00', '2025-06-02 10:00:00');
INSERT INTO `t_goal` VALUES (10, '意甲', NULL, '尤文图斯', NULL, NULL, '那不勒斯', '那不勒斯反击效率高', 0, 0, '2025-06-02 22:00:00', '2025-06-02 10:00:00');
INSERT INTO `t_goal` VALUES (11, '欧冠', NULL, '曼城', NULL, NULL, '拜仁慕尼黑', '欧冠淘汰赛进球值得期待', 1, -1, '2025-06-05 23:59:00', '2025-06-05 10:00:00');

-- ----------------------------
-- Table structure for t_half_full
-- ----------------------------
DROP TABLE IF EXISTS `t_half_full`;
CREATE TABLE `t_half_full`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `league_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `league_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `home_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `home_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `away_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `away_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `half_score` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `full_score` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `recommend_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `is_today_data` tinyint(1) NOT NULL DEFAULT 0,
  `is_hit` tinyint(1) NOT NULL DEFAULT -1,
  `match_date` datetime(0) NOT NULL,
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_half_full
-- ----------------------------
INSERT INTO `t_half_full` VALUES (1, '英超', NULL, '阿森纳', NULL, NULL, '切尔西', '1-0', '3-1', '阿森纳半场领先全场大胜', 1, -1, '2025-06-05 20:00:00', '2025-06-05 10:00:00');
INSERT INTO `t_half_full` VALUES (2, '西甲', NULL, '巴塞罗那', NULL, NULL, '皇家马德里', '0-0', '1-1', '半场闷平全场握手言和', 1, -1, '2025-06-05 22:00:00', '2025-06-05 10:00:00');
INSERT INTO `t_half_full` VALUES (3, '德甲', NULL, '拜仁慕尼黑', NULL, NULL, '多特蒙德', '2-0', '4-2', '拜仁半场奠定胜局', 1, -1, '2025-06-05 21:00:00', '2025-06-05 10:00:00');
INSERT INTO `t_half_full` VALUES (4, '意甲', NULL, 'AC米兰', NULL, NULL, '国际米兰', '0-1', '1-2', '国米半场领先最终取胜', 1, -1, '2025-06-05 23:00:00', '2025-06-05 10:00:00');
INSERT INTO `t_half_full` VALUES (5, '英超', NULL, '利物浦', NULL, NULL, '热刺', '1-1', '2-2', '半场平局全场各取一分', 0, -1, '2025-06-04 20:00:00', '2025-06-04 10:00:00');
INSERT INTO `t_half_full` VALUES (6, '西甲', NULL, '马德里竞技', NULL, NULL, '塞维利亚', '1-0', '2-0', '马竞半场领先全场完胜', 0, 1, '2025-06-04 22:00:00', '2025-06-04 10:00:00');
INSERT INTO `t_half_full` VALUES (7, '法甲', NULL, '巴黎圣日耳曼', NULL, NULL, '马赛', '0-0', '1-2', '半场僵持马赛下半场逆转', 0, 0, '2025-06-03 21:00:00', '2025-06-03 10:00:00');
INSERT INTO `t_half_full` VALUES (8, '德甲', NULL, '莱比锡红牛', NULL, NULL, '法兰克福', '0-0', '0-0', '半场全场皆闷平', 0, -1, '2025-06-03 23:00:00', '2025-06-03 10:00:00');
INSERT INTO `t_half_full` VALUES (9, '英超', NULL, '曼联', NULL, NULL, '曼城', '1-0', '3-2', '曼联半场领先曼城反扑未果', 0, 1, '2025-06-02 20:00:00', '2025-06-02 10:00:00');
INSERT INTO `t_half_full` VALUES (10, '意甲', NULL, '尤文图斯', NULL, NULL, '那不勒斯', '0-1', '0-1', '那不勒斯半场领先保持到终场', 0, 0, '2025-06-02 22:00:00', '2025-06-02 10:00:00');
INSERT INTO `t_half_full` VALUES (11, '欧冠', NULL, '曼城', NULL, NULL, '拜仁慕尼黑', '0-0', '2-1', '半场僵持曼城下半场发力', 1, -1, '2025-06-05 23:59:00', '2025-06-05 10:00:00');

-- ----------------------------
-- Table structure for t_intelligence
-- ----------------------------
DROP TABLE IF EXISTS `t_intelligence`;
CREATE TABLE `t_intelligence`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `intel_date` date NULL DEFAULT NULL COMMENT '情报日期',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '情报描述',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_intel_date`(`intel_date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '情报配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_intelligence
-- ----------------------------
INSERT INTO `t_intelligence` VALUES (1, '2026-06-06', '今日重点赛事：英超曼城对阵阿森纳，曼城主场优势明显，近10场主场胜率80%。阿森纳客场表现稳定，但历史交锋处于劣势。预测曼城控球率60%以上，角球数8-10个。重点关注曼城边路突破创造的定位球机会。', '2026-06-06 02:15:57', '2026-06-06 02:15:57');
INSERT INTO `t_intelligence` VALUES (2, '2026-06-05', '欧冠半决赛前瞻：皇马 vs 拜仁。皇马主场伯纳乌球场氛围热烈，球队欧冠经验丰富。拜仁慕尼黑本赛季客场表现强势，近5个客场全胜。关键看点在于两队中场控制权的争夺，皇马莫德里奇 vs 拜仁基米希的对决将决定比赛走向。', '2026-06-06 02:15:57', '2026-06-06 02:15:57');
INSERT INTO `t_intelligence` VALUES (3, '2026-06-04', '意甲焦点战：AC米兰 vs 国际米兰。米兰德比向来激烈，本赛季两队状态都不错。AC米兰主场进攻火力旺盛，场均进球2.1个。国米防守稳固，失球数联赛最少。预计比赛节奏较快，角球数不会少。推荐关注上半场进球。', '2026-06-06 02:15:57', '2026-06-06 02:15:57');
INSERT INTO `t_intelligence` VALUES (4, '2026-06-03', '西甲巴萨vs马竞前瞻：巴萨主场诺坎普球场威力无穷，本赛季主场保持不败。马竞西蒙尼的球队客场以防守反击为主，近期状态有所回升。历史交锋巴萨占据明显优势，但马竞每次德比都会全力以赴。', '2026-06-06 02:15:57', '2026-06-06 02:15:57');
INSERT INTO `t_intelligence` VALUES (5, '2026-06-02', '法甲巴黎圣日耳曼对阵里昂：巴黎主场实力碾压，MNM组合状态火热。里昂客场战绩一般，防守端存在隐患。预计巴黎控球率65%以上，全场进球数3-4个。重点关注姆巴佩的个人突破和内切射门。', '2026-06-06 02:15:57', '2026-06-06 02:15:57');
INSERT INTO `t_intelligence` VALUES (6, '2026-06-01', '英超保级大战：埃弗顿 vs 利兹联。两队都在为保级而战，战意十足。埃弗顿主场球迷支持力度大，近期防守有所改善。利兹联打法激进，进攻端有一定威胁。本场比赛预计进球数不会少，平局可能性较大。', '2026-06-06 02:15:57', '2026-06-06 02:15:57');
INSERT INTO `t_intelligence` VALUES (7, '2026-05-31', '德甲多特蒙德vs莱比锡红牛：多特蒙德主场威斯特法伦球场气氛火爆，球队近期进攻状态出色。莱比锡红牛客场反击犀利，速度型前锋威胁大。历史交锋两队互有胜负，本场看好对攻大战。', '2026-06-06 02:15:57', '2026-06-06 02:15:57');

-- ----------------------------
-- Table structure for t_score
-- ----------------------------
DROP TABLE IF EXISTS `t_score`;
CREATE TABLE `t_score`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `league_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `league_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `home_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `home_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `away_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `away_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `recommend_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `is_today_data` tinyint(1) NOT NULL DEFAULT 0,
  `is_hit` tinyint(1) NOT NULL DEFAULT -1,
  `match_date` datetime(0) NOT NULL,
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_score
-- ----------------------------
INSERT INTO `t_score` VALUES (1, '英超', NULL, '阿森纳', NULL, NULL, '切尔西', '阿森纳2-0切尔西', 1, -1, '2025-06-05 20:00:00', '2025-06-05 10:00:00');
INSERT INTO `t_score` VALUES (2, '西甲', NULL, '巴塞罗那', NULL, NULL, '皇家马德里', '巴萨2-1皇马', 1, -1, '2025-06-05 22:00:00', '2025-06-05 10:00:00');
INSERT INTO `t_score` VALUES (3, '德甲', NULL, '拜仁慕尼黑', NULL, NULL, '多特蒙德', '拜仁3-1多特', 1, -1, '2025-06-05 21:00:00', '2025-06-05 10:00:00');
INSERT INTO `t_score` VALUES (4, '意甲', NULL, 'AC米兰', NULL, NULL, '国际米兰', 'AC米兰1-0国米', 1, -1, '2025-06-05 23:00:00', '2025-06-05 10:00:00');
INSERT INTO `t_score` VALUES (5, '英超', NULL, '利物浦', NULL, NULL, '热刺', '利物浦2-1热刺', 0, -1, '2025-06-04 20:00:00', '2025-06-04 10:00:00');
INSERT INTO `t_score` VALUES (6, '西甲', NULL, '马德里竞技', NULL, NULL, '塞维利亚', '马竞1-0塞维利亚', 0, 1, '2025-06-04 22:00:00', '2025-06-04 10:00:00');
INSERT INTO `t_score` VALUES (7, '法甲', NULL, '巴黎圣日耳曼', NULL, NULL, '马赛', '巴黎1-2马赛', 0, 0, '2025-06-03 21:00:00', '2025-06-03 10:00:00');
INSERT INTO `t_score` VALUES (8, '德甲', NULL, '莱比锡红牛', NULL, NULL, '法兰克福', '莱比锡2-0法兰克福', 0, -1, '2025-06-03 23:00:00', '2025-06-03 10:00:00');
INSERT INTO `t_score` VALUES (9, '英超', NULL, '曼联', NULL, NULL, '曼城', '曼联3-2曼城', 0, 1, '2025-06-02 20:00:00', '2025-06-02 10:00:00');
INSERT INTO `t_score` VALUES (10, '意甲', NULL, '尤文图斯', NULL, NULL, '那不勒斯', '尤文0-1那不勒斯', 0, 0, '2025-06-02 22:00:00', '2025-06-02 10:00:00');
INSERT INTO `t_score` VALUES (11, '欧冠', NULL, '曼城', NULL, NULL, '拜仁慕尼黑', '曼城2-1拜仁', 1, -1, '2025-06-05 23:59:00', '2025-06-05 10:00:00');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '涓婚敭ID',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鐢ㄦ埛鍚',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '瀵嗙爜锛堝姞瀵嗗瓨鍌?級',
  `nickname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '鏄电О',
  `avatar` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '澶村儚URL',
  `bio` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '涓?汉浠嬬粛',
  `status` tinyint(0) NULL DEFAULT 1 COMMENT '鐘舵? 1:姝ｅ父 0:绂佺敤',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '鍒涘缓鏃堕棿',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '鏇存柊鏃堕棿',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '鐢ㄦ埛琛' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'sports_user', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '体育爱好者', NULL, NULL, 1, '2026-06-06 00:15:18', '2026-06-06 00:15:18');
INSERT INTO `t_user` VALUES (2, 'lisi', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '李四', NULL, '无人扶我青云志', 1, '2026-06-06 00:41:31', '2026-06-06 00:41:31');
INSERT INTO `t_user` VALUES (3, 'zsan', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '张三', NULL, '无人扶我青云志', 1, '2026-06-06 03:59:07', '2026-06-06 03:59:07');

-- ----------------------------
-- Table structure for t_win_lose
-- ----------------------------
DROP TABLE IF EXISTS `t_win_lose`;
CREATE TABLE `t_win_lose`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `league_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `league_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `home_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `home_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `away_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `away_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `match_date` datetime(0) NOT NULL,
  `recommend_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `result` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_hit` tinyint(1) NOT NULL DEFAULT -1,
  `is_today_data` tinyint(1) NOT NULL DEFAULT 0,
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_win_lose
-- ----------------------------
INSERT INTO `t_win_lose` VALUES (1, '英超', NULL, '阿森纳', NULL, NULL, '切尔西', '2025-06-05 20:00:00', '阿森纳主场胜面较大', '胜', -1, 1, '2025-06-05 10:00:00');
INSERT INTO `t_win_lose` VALUES (2, '西甲', NULL, '巴塞罗那', NULL, NULL, '皇家马德里', '2025-06-05 22:00:00', '巴萨主场优势明显', '', -1, 1, '2025-06-05 10:00:00');
INSERT INTO `t_win_lose` VALUES (3, '德甲', NULL, '拜仁慕尼黑', NULL, NULL, '多特蒙德', '2025-06-05 21:00:00', '拜仁状态正佳', '', -1, 1, '2025-06-05 10:00:00');
INSERT INTO `t_win_lose` VALUES (4, '意甲', NULL, 'AC米兰', NULL, NULL, '国际米兰', '2025-06-05 23:00:00', '米兰德比看好主队', '', -1, 1, '2025-06-05 10:00:00');
INSERT INTO `t_win_lose` VALUES (5, '英超', NULL, '利物浦', NULL, NULL, '热刺', '2025-06-04 20:00:00', '利物浦主场强势', '', -1, 0, '2025-06-04 10:00:00');
INSERT INTO `t_win_lose` VALUES (6, '西甲', NULL, '马德里竞技', NULL, NULL, '塞维利亚', '2025-06-04 22:00:00', '马竞防守稳固', '主胜', 1, 0, '2025-06-04 10:00:00');
INSERT INTO `t_win_lose` VALUES (7, '法甲', NULL, '巴黎圣日耳曼', NULL, NULL, '马赛', '2025-06-03 21:00:00', '马赛客场爆冷', '客胜', 0, 0, '2025-06-03 10:00:00');
INSERT INTO `t_win_lose` VALUES (8, '德甲', NULL, '莱比锡红牛', NULL, NULL, '法兰克福', '2025-06-03 23:00:00', '莱比锡主场占优', '', -1, 0, '2025-06-03 10:00:00');
INSERT INTO `t_win_lose` VALUES (9, '英超', NULL, '曼联', NULL, NULL, '曼城', '2025-06-02 20:00:00', '曼联主场逆转', '主胜', 1, 0, '2025-06-02 10:00:00');
INSERT INTO `t_win_lose` VALUES (10, '意甲', NULL, '尤文图斯', NULL, NULL, '那不勒斯', '2025-06-02 22:00:00', '那不勒斯客场取胜', '客胜', 0, 0, '2025-06-02 10:00:00');
INSERT INTO `t_win_lose` VALUES (11, '欧冠', NULL, '曼城', NULL, NULL, '拜仁慕尼黑', '2025-06-05 23:59:00', '欧冠强强对话', '', -1, 1, '2025-06-05 10:00:00');

SET FOREIGN_KEY_CHECKS = 1;
