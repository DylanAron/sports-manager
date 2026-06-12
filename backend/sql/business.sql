/*
 Navicat Premium Data Transfer

 Source Server         : soccer
 Source Server Type    : MySQL
 Source Server Version : 80040
 Source Host           : localhost:3306
 Source Schema         : soccer

 Target Server Type    : MySQL
 Target Server Version : 80040
 File Encoding         : 65001

 Date: 19/04/2025 11:41:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '专家表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_expert
-- ----------------------------
INSERT INTO `t_expert` VALUES (2, '温格教练', '/profile/avatar/2025/04/15/温格教练_20250415095241A001.png', '近10中10', 8, 1, 2, '2025-04-06 13:30:37', '2025-04-06 13:30:37');
INSERT INTO `t_expert` VALUES (3, '许力国', '/profile/avatar/2025/04/13/许力国_20250413003414A001.png', '近10中8', 8, -1, 1, '2025-04-13 00:34:26', '2025-04-13 00:34:26');
INSERT INTO `t_expert` VALUES (5, '王麻子', '/profile/avatar/2025/04/15/王麻子_20250415095251A002.png', '近10中9', 9, 1, 3, '2025-04-13 13:09:54', '2025-04-13 13:09:54');

DROP TABLE IF EXISTS `t_half_full_group`;
DROP TABLE IF EXISTS `t_half_full_match`;
/*
DROP TABLE IF EXISTS `t_bill_record`;
*/

-- ----------------------------
-- Table structure for t_intelligence
-- ----------------------------
DROP TABLE IF EXISTS `t_intelligence`;
CREATE TABLE `t_intelligence`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `intel_date` date NULL DEFAULT NULL COMMENT '情报日期',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '情报描述',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_intel_date` (`intel_date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '情报配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_intel
-- ----------------------------
INSERT INTO `t_intel` VALUES (1, '/profile/upload/2025/04/15/intel_banner_20250415095301A003.jpeg', '<p>⚽ 绝密战术档案：探秘「蓝焰军团」的致命杀招！ </p><p>【核心情报】 </p><p>  深度解码对手的隐形弱点，打造破局关键—— </p><p><br></p><p>	1. 左路风暴： 当家边锋「洛佩斯」本赛季已贡献12次助攻，其招牌内切+倒三角传中成功率高达78%！但防守回追速度是致命短板——推荐对策：右后卫压上施压，迫使其用弱势脚处理球。</p><p><br></p><p>	2. 高压陷阱： 对手中卫组合习惯性前顶造越位，但转身速度仅排名联赛倒数！致命漏洞：长传打身后时，其失球率暴增300%！ </p><p><br></p><p>	3. 定位球玄机： 近5场80%进球源自角球战术，注意盯防1.93米高中卫「科瓦切维奇」的后点冲顶！破解密码：改用短角球战术切断其助跑空间。 </p><p><br></p><p>🔥 关键结论： 掐死左路发动机+闪电反击打身后，将直接撕裂对手攻防平衡！ </p><p><br></p><p>		附：近期对手阵型热图/传球路线解密，私讯获取完整分析报告</p><p><br></p><h1><br></h1>', '2025-04-07 22:31:52', '2025-04-07 22:31:52');

-- ----------------------------
-- Table structure for t_win_lose
-- ----------------------------
DROP TABLE IF EXISTS `t_win_lose`;
CREATE TABLE `t_win_lose`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `league_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联赛名称',
  `league_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联赛logo',
  `home_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '主队名称',
  `home_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '主队logo',
  `away_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客队名称',
  `away_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客队logo',
  `is_hit` tinyint(1) NULL DEFAULT -1 COMMENT '是否命中(-1未开奖0未中1命中)',
  `result` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '赛果',
  `recommend_content` json NULL COMMENT '推荐内容',
  `match_date` datetime NULL DEFAULT NULL COMMENT '比赛时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_match_date` (`match_date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '胜负竞猜表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_win_lose
-- ----------------------------
INSERT INTO `t_win_lose` VALUES (1, '英超', '/profile/upload/2025/06/01/league1.png', '阿森纳', '/profile/upload/2025/06/01/home1.png', '切尔西', '/profile/upload/2025/06/01/away1.png', -1, '胜', 1, '2025-06-05 20:00:00', '2025-06-05 10:00:00', '2025-06-05 10:00:00');
INSERT INTO `t_win_lose` VALUES (2, '西甲', '/profile/upload/2025/06/01/league2.png', '巴塞罗那', '/profile/upload/2025/06/01/home2.png', '皇马', '/profile/upload/2025/06/01/away2.png', -1, '', 1, '2025-06-05 22:00:00', '2025-06-05 10:00:00', '2025-06-05 10:00:00');
INSERT INTO `t_win_lose` VALUES (3, '德甲', '/profile/upload/2025/06/01/league3.png', '拜仁', '/profile/upload/2025/06/01/home3.png', '多特蒙德', '/profile/upload/2025/06/01/away3.png', -1, '', 1, '2025-06-05 21:00:00', '2025-06-05 10:00:00', '2025-06-05 10:00:00');
INSERT INTO `t_win_lose` VALUES (4, '意甲', '/profile/upload/2025/06/01/league4.png', 'AC米兰', '/profile/upload/2025/06/01/home4.png', '国际米兰', '/profile/upload/2025/06/01/away4.png', -1, '', 1, '2025-06-05 23:00:00', '2025-06-05 10:00:00', '2025-06-05 10:00:00');
INSERT INTO `t_win_lose` VALUES (5, '英超', '/profile/upload/2025/06/01/league1.png', '利物浦', '/profile/upload/2025/06/01/home5.png', '热刺', '/profile/upload/2025/06/01/away5.png', -1, '', 0, '2025-06-04 20:00:00', '2025-06-04 10:00:00', '2025-06-04 10:00:00');
INSERT INTO `t_win_lose` VALUES (6, '西甲', '/profile/upload/2025/06/01/league2.png', '马竞', '/profile/upload/2025/06/01/home6.png', '塞维利亚', '/profile/upload/2025/06/01/away6.png', 1, '主胜', 0, '2025-06-04 22:00:00', '2025-06-04 10:00:00', '2025-06-04 10:00:00');
INSERT INTO `t_win_lose` VALUES (7, '法甲', '/profile/upload/2025/06/01/league3.png', '巴黎', '/profile/upload/2025/06/01/home7.png', '马赛', '/profile/upload/2025/06/01/away7.png', 0, '客胜', 0, '2025-06-03 21:00:00', '2025-06-03 10:00:00', '2025-06-03 10:00:00');
INSERT INTO `t_win_lose` VALUES (8, '德甲', '/profile/upload/2025/06/01/league4.png', '莱比锡', '/profile/upload/2025/06/01/home8.png', '法兰克福', '/profile/upload/2025/06/01/away8.png', -1, '', 0, '2025-06-03 23:00:00', '2025-06-03 10:00:00', '2025-06-03 10:00:00');
INSERT INTO `t_win_lose` VALUES (9, '英超', '/profile/upload/2025/06/01/league1.png', '曼联', '/profile/upload/2025/06/01/home9.png', '曼城', '/profile/upload/2025/06/01/away9.png', 1, '主胜', 0, '2025-06-02 20:00:00', '2025-06-02 10:00:00', '2025-06-02 10:00:00');
INSERT INTO `t_win_lose` VALUES (10, '意甲', '/profile/upload/2025/06/01/league2.png', '尤文图斯', '/profile/upload/2025/06/01/home10.png', '那不勒斯', '/profile/upload/2025/06/01/away10.png', 0, '客胜', 0, '2025-06-02 22:00:00', '2025-06-02 10:00:00', '2025-06-02 10:00:00');
INSERT INTO `t_win_lose` VALUES (11, '欧冠', '/profile/upload/2025/06/01/league1.png', '曼城', '/profile/upload/2025/06/01/home11.png', '拜仁', '/profile/upload/2025/06/01/away11.png', -1, '', 1, '2025-06-05 23:59:00', '2025-06-05 10:00:00', '2025-06-05 10:00:00');

-- ----------------------------
-- Table structure for t_corner
-- ----------------------------
DROP TABLE IF EXISTS `t_corner`;
CREATE TABLE `t_corner`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `league_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联赛名称',
  `league_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联赛logo',
  `home_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '主队名称',
  `home_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '主队logo',
  `away_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客队名称',
  `away_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客队logo',
  `recommend_content` json NULL COMMENT '推荐内容',
  `is_hit` tinyint(1) NULL DEFAULT -1 COMMENT '是否命中(-1未开奖0未中1命中)',
  `match_date` datetime NULL DEFAULT NULL COMMENT '比赛时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_match_date` (`match_date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角球管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_corner
-- ----------------------------
INSERT INTO `t_corner` VALUES (1, '英超', '/profile/upload/2025/06/01/league1.png', '阿森纳', '/profile/upload/2025/06/01/home1.png', '切尔西', '/profile/upload/2025/06/01/away1.png', '主队胜', 1, -1, '2025-06-05 20:00:00', '2025-06-05 10:00:00', '2025-06-05 10:00:00');
INSERT INTO `t_corner` VALUES (2, '西甲', '/profile/upload/2025/06/01/league2.png', '巴塞罗那', '/profile/upload/2025/06/01/home2.png', '皇马', '/profile/upload/2025/06/01/away2.png', '', 1, -1, '2025-06-05 22:00:00', '2025-06-05 10:00:00', '2025-06-05 10:00:00');
INSERT INTO `t_corner` VALUES (3, '德甲', '/profile/upload/2025/06/01/league3.png', '拜仁', '/profile/upload/2025/06/01/home3.png', '多特蒙德', '/profile/upload/2025/06/01/away3.png', '', 1, -1, '2025-06-05 21:00:00', '2025-06-05 10:00:00', '2025-06-05 10:00:00');
INSERT INTO `t_corner` VALUES (4, '意甲', '/profile/upload/2025/06/01/league4.png', 'AC米兰', '/profile/upload/2025/06/01/home4.png', '国际米兰', '/profile/upload/2025/06/01/away4.png', '', 1, -1, '2025-06-05 23:00:00', '2025-06-05 10:00:00', '2025-06-05 10:00:00');
INSERT INTO `t_corner` VALUES (5, '英超', '/profile/upload/2025/06/01/league1.png', '利物浦', '/profile/upload/2025/06/01/home5.png', '热刺', '/profile/upload/2025/06/01/away5.png', '', 0, -1, '2025-06-04 20:00:00', '2025-06-04 10:00:00', '2025-06-04 10:00:00');
INSERT INTO `t_corner` VALUES (6, '西甲', '/profile/upload/2025/06/01/league2.png', '马竞', '/profile/upload/2025/06/01/home6.png', '塞维利亚', '/profile/upload/2025/06/01/away6.png', '主胜', 0, 1, '2025-06-04 22:00:00', '2025-06-04 10:00:00', '2025-06-04 10:00:00');
INSERT INTO `t_corner` VALUES (7, '法甲', '/profile/upload/2025/06/01/league3.png', '巴黎', '/profile/upload/2025/06/01/home7.png', '马赛', '/profile/upload/2025/06/01/away7.png', '客胜', 0, 0, '2025-06-03 21:00:00', '2025-06-03 10:00:00', '2025-06-03 10:00:00');
INSERT INTO `t_corner` VALUES (8, '德甲', '/profile/upload/2025/06/01/league4.png', '莱比锡', '/profile/upload/2025/06/01/home8.png', '法兰克福', '/profile/upload/2025/06/01/away8.png', '', 0, -1, '2025-06-03 23:00:00', '2025-06-03 10:00:00', '2025-06-03 10:00:00');
INSERT INTO `t_corner` VALUES (9, '英超', '/profile/upload/2025/06/01/league1.png', '曼联', '/profile/upload/2025/06/01/home9.png', '曼城', '/profile/upload/2025/06/01/away9.png', '主胜', 0, 1, '2025-06-02 20:00:00', '2025-06-02 10:00:00', '2025-06-02 10:00:00');
INSERT INTO `t_corner` VALUES (10, '意甲', '/profile/upload/2025/06/01/league2.png', '尤文图斯', '/profile/upload/2025/06/01/home10.png', '那不勒斯', '/profile/upload/2025/06/01/away10.png', '客胜', 0, 0, '2025-06-02 22:00:00', '2025-06-02 10:00:00', '2025-06-02 10:00:00');
INSERT INTO `t_corner` VALUES (11, '欧冠', '/profile/upload/2025/06/01/league1.png', '曼城', '/profile/upload/2025/06/01/home11.png', '拜仁', '/profile/upload/2025/06/01/away11.png', '', 1, -1, '2025-06-05 23:59:00', '2025-06-05 10:00:00', '2025-06-05 10:00:00');

-- ----------------------------
-- Table structure for t_goal
-- ----------------------------
DROP TABLE IF EXISTS `t_goal`;
CREATE TABLE `t_goal`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `league_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联赛名称',
  `league_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联赛logo',
  `home_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '主队名称',
  `home_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '主队logo',
  `away_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客队名称',
  `away_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客队logo',
  `recommend_content` json NULL COMMENT '推荐内容',
  `is_hit` tinyint(1) NULL DEFAULT -1 COMMENT '是否命中(-1未开奖0未中1命中)',
  `result` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '赛果',
  `is_today_data` tinyint(1) NULL DEFAULT 0 COMMENT '是否今日数据(0否1是)',
  `match_date` datetime NULL DEFAULT NULL COMMENT '比赛时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_match_date` (`match_date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '进球管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_goal
-- ----------------------------
INSERT INTO `t_goal` VALUES (1, '英超', '/profile/upload/2025/06/01/league1.png', '阿森纳', '/profile/upload/2025/06/01/home1.png', '切尔西', '/profile/upload/2025/06/01/away1.png', '3-1', 1, -1, '2025-06-05 20:00:00', '2025-06-05 10:00:00', '2025-06-05 10:00:00');
INSERT INTO `t_goal` VALUES (2, '西甲', '/profile/upload/2025/06/01/league2.png', '巴塞罗那', '/profile/upload/2025/06/01/home2.png', '皇马', '/profile/upload/2025/06/01/away2.png', '', 1, -1, '2025-06-05 22:00:00', '2025-06-05 10:00:00', '2025-06-05 10:00:00');
INSERT INTO `t_goal` VALUES (3, '德甲', '/profile/upload/2025/06/01/league3.png', '拜仁', '/profile/upload/2025/06/01/home3.png', '多特蒙德', '/profile/upload/2025/06/01/away3.png', '', 1, -1, '2025-06-05 21:00:00', '2025-06-05 10:00:00', '2025-06-05 10:00:00');
INSERT INTO `t_goal` VALUES (4, '意甲', '/profile/upload/2025/06/01/league4.png', 'AC米兰', '/profile/upload/2025/06/01/home4.png', '国际米兰', '/profile/upload/2025/06/01/away4.png', '', 1, -1, '2025-06-05 23:00:00', '2025-06-05 10:00:00', '2025-06-05 10:00:00');
INSERT INTO `t_goal` VALUES (5, '英超', '/profile/upload/2025/06/01/league1.png', '利物浦', '/profile/upload/2025/06/01/home5.png', '热刺', '/profile/upload/2025/06/01/away5.png', '', 0, -1, '2025-06-04 20:00:00', '2025-06-04 10:00:00', '2025-06-04 10:00:00');
INSERT INTO `t_goal` VALUES (6, '西甲', '/profile/upload/2025/06/01/league2.png', '马竞', '/profile/upload/2025/06/01/home6.png', '塞维利亚', '/profile/upload/2025/06/01/away6.png', '2-0', 0, 1, '2025-06-04 22:00:00', '2025-06-04 10:00:00', '2025-06-04 10:00:00');
INSERT INTO `t_goal` VALUES (7, '法甲', '/profile/upload/2025/06/01/league3.png', '巴黎', '/profile/upload/2025/06/01/home7.png', '马赛', '/profile/upload/2025/06/01/away7.png', '1-2', 0, 0, '2025-06-03 21:00:00', '2025-06-03 10:00:00', '2025-06-03 10:00:00');
INSERT INTO `t_goal` VALUES (8, '德甲', '/profile/upload/2025/06/01/league4.png', '莱比锡', '/profile/upload/2025/06/01/home8.png', '法兰克福', '/profile/upload/2025/06/01/away8.png', '', 0, -1, '2025-06-03 23:00:00', '2025-06-03 10:00:00', '2025-06-03 10:00:00');
INSERT INTO `t_goal` VALUES (9, '英超', '/profile/upload/2025/06/01/league1.png', '曼联', '/profile/upload/2025/06/01/home9.png', '曼城', '/profile/upload/2025/06/01/away9.png', '3-2', 0, 1, '2025-06-02 20:00:00', '2025-06-02 10:00:00', '2025-06-02 10:00:00');
INSERT INTO `t_goal` VALUES (10, '意甲', '/profile/upload/2025/06/01/league2.png', '尤文图斯', '/profile/upload/2025/06/01/home10.png', '那不勒斯', '/profile/upload/2025/06/01/away10.png', '0-1', 0, 0, '2025-06-02 22:00:00', '2025-06-02 10:00:00', '2025-06-02 10:00:00');
INSERT INTO `t_goal` VALUES (11, '欧冠', '/profile/upload/2025/06/01/league1.png', '曼城', '/profile/upload/2025/06/01/home11.png', '拜仁', '/profile/upload/2025/06/01/away11.png', '', 1, -1, '2025-06-05 23:59:00', '2025-06-05 10:00:00', '2025-06-05 10:00:00');

-- ----------------------------
-- Table structure for t_half_full
-- ----------------------------
DROP TABLE IF EXISTS `t_half_full`;
CREATE TABLE `t_half_full`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `league_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联赛名称',
  `league_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联赛logo',
  `home_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '主队名称',
  `home_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '主队logo',
  `away_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客队名称',
  `away_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客队logo',
  `half_score` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '半场比分',
  `full_score` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '全场比分',
  `recommend_content` json NULL COMMENT '推荐内容',
  `is_hit` tinyint(1) NULL DEFAULT -1 COMMENT '是否命中(-1未开奖0未中1命中)',
  `match_date` datetime NULL DEFAULT NULL COMMENT '比赛时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_match_date` (`match_date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '半全场管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_half_full
-- ----------------------------
INSERT INTO `t_half_full` VALUES (1, '英超', '/profile/upload/2025/06/01/league1.png', '阿森纳', '/profile/upload/2025/06/01/home1.png', '切尔西', '/profile/upload/2025/06/01/away1.png', '1-0', '3-1', '胜-胜', 1, -1, '2025-06-05 20:00:00', '2025-06-05 10:00:00', '2025-06-05 10:00:00');
INSERT INTO `t_half_full` VALUES (2, '西甲', '/profile/upload/2025/06/01/league2.png', '巴塞罗那', '/profile/upload/2025/06/01/home2.png', '皇马', '/profile/upload/2025/06/01/away2.png', '0-0', '1-1', '', 1, -1, '2025-06-05 22:00:00', '2025-06-05 10:00:00', '2025-06-05 10:00:00');
INSERT INTO `t_half_full` VALUES (3, '德甲', '/profile/upload/2025/06/01/league3.png', '拜仁', '/profile/upload/2025/06/01/home3.png', '多特蒙德', '/profile/upload/2025/06/01/away3.png', '2-0', '4-2', '', 1, -1, '2025-06-05 21:00:00', '2025-06-05 10:00:00', '2025-06-05 10:00:00');
INSERT INTO `t_half_full` VALUES (4, '意甲', '/profile/upload/2025/06/01/league4.png', 'AC米兰', '/profile/upload/2025/06/01/home4.png', '国际米兰', '/profile/upload/2025/06/01/away4.png', '0-1', '1-2', '', 1, -1, '2025-06-05 23:00:00', '2025-06-05 10:00:00', '2025-06-05 10:00:00');
INSERT INTO `t_half_full` VALUES (5, '英超', '/profile/upload/2025/06/01/league1.png', '利物浦', '/profile/upload/2025/06/01/home5.png', '热刺', '/profile/upload/2025/06/01/away5.png', '1-1', '2-2', '', 0, -1, '2025-06-04 20:00:00', '2025-06-04 10:00:00', '2025-06-04 10:00:00');
INSERT INTO `t_half_full` VALUES (6, '西甲', '/profile/upload/2025/06/01/league2.png', '马竞', '/profile/upload/2025/06/01/home6.png', '塞维利亚', '/profile/upload/2025/06/01/away6.png', '1-0', '2-0', '平-胜', 0, 1, '2025-06-04 22:00:00', '2025-06-04 10:00:00', '2025-06-04 10:00:00');
INSERT INTO `t_half_full` VALUES (7, '法甲', '/profile/upload/2025/06/01/league3.png', '巴黎', '/profile/upload/2025/06/01/home7.png', '马赛', '/profile/upload/2025/06/01/away7.png', '0-0', '1-2', '平-负', 0, 0, '2025-06-03 21:00:00', '2025-06-03 10:00:00', '2025-06-03 10:00:00');
INSERT INTO `t_half_full` VALUES (8, '德甲', '/profile/upload/2025/06/01/league4.png', '莱比锡', '/profile/upload/2025/06/01/home8.png', '法兰克福', '/profile/upload/2025/06/01/away8.png', '0-0', '0-0', '', 0, -1, '2025-06-03 23:00:00', '2025-06-03 10:00:00', '2025-06-03 10:00:00');
INSERT INTO `t_half_full` VALUES (9, '英超', '/profile/upload/2025/06/01/league1.png', '曼联', '/profile/upload/2025/06/01/home9.png', '曼城', '/profile/upload/2025/06/01/away9.png', '1-0', '3-2', '胜-胜', 0, 1, '2025-06-02 20:00:00', '2025-06-02 10:00:00', '2025-06-02 10:00:00');
INSERT INTO `t_half_full` VALUES (10, '意甲', '/profile/upload/2025/06/01/league2.png', '尤文图斯', '/profile/upload/2025/06/01/home10.png', '那不勒斯', '/profile/upload/2025/06/01/away10.png', '0-1', '0-1', '负-负', 0, 0, '2025-06-02 22:00:00', '2025-06-02 10:00:00', '2025-06-02 10:00:00');
INSERT INTO `t_half_full` VALUES (11, '欧冠', '/profile/upload/2025/06/01/league1.png', '曼城', '/profile/upload/2025/06/01/home11.png', '拜仁', '/profile/upload/2025/06/01/away11.png', '0-0', '2-1', '', 1, -1, '2025-06-05 23:59:00', '2025-06-05 10:00:00', '2025-06-05 10:00:00');

-- ----------------------------
-- Table structure for t_score
-- ----------------------------
DROP TABLE IF EXISTS `t_score`;
CREATE TABLE `t_score`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `league_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联赛名称',
  `league_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联赛logo',
  `home_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '主队名称',
  `home_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '主队logo',
  `away_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客队名称',
  `away_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客队logo',
  `recommend_content` json NULL COMMENT '推荐内容',
  `is_hit` tinyint(1) NULL DEFAULT -1 COMMENT '是否命中(-1未开奖0未中1命中)',
  `result` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '赛果',
  `is_today_data` tinyint(1) NULL DEFAULT 0 COMMENT '是否今日数据(0否1是)',
  `match_date` datetime NULL DEFAULT NULL COMMENT '比赛时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_match_date` (`match_date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '比分管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_score
-- ----------------------------
INSERT INTO `t_score` VALUES (1, '英超', '/profile/upload/2025/06/01/league1.png', '阿森纳', '/profile/upload/2025/06/01/home1.png', '切尔西', '/profile/upload/2025/06/01/away1.png', '3-1', 1, -1, '2025-06-05 20:00:00', '2025-06-05 10:00:00', '2025-06-05 10:00:00');
INSERT INTO `t_score` VALUES (2, '西甲', '/profile/upload/2025/06/01/league2.png', '巴塞罗那', '/profile/upload/2025/06/01/home2.png', '皇马', '/profile/upload/2025/06/01/away2.png', '', 1, -1, '2025-06-05 22:00:00', '2025-06-05 10:00:00', '2025-06-05 10:00:00');
INSERT INTO `t_score` VALUES (3, '德甲', '/profile/upload/2025/06/01/league3.png', '拜仁', '/profile/upload/2025/06/01/home3.png', '多特蒙德', '/profile/upload/2025/06/01/away3.png', '', 1, -1, '2025-06-05 21:00:00', '2025-06-05 10:00:00', '2025-06-05 10:00:00');
INSERT INTO `t_score` VALUES (4, '意甲', '/profile/upload/2025/06/01/league4.png', 'AC米兰', '/profile/upload/2025/06/01/home4.png', '国际米兰', '/profile/upload/2025/06/01/away4.png', '', 1, -1, '2025-06-05 23:00:00', '2025-06-05 10:00:00', '2025-06-05 10:00:00');
INSERT INTO `t_score` VALUES (5, '英超', '/profile/upload/2025/06/01/league1.png', '利物浦', '/profile/upload/2025/06/01/home5.png', '热刺', '/profile/upload/2025/06/01/away5.png', '', 0, -1, '2025-06-04 20:00:00', '2025-06-04 10:00:00', '2025-06-04 10:00:00');
INSERT INTO `t_score` VALUES (6, '西甲', '/profile/upload/2025/06/01/league2.png', '马竞', '/profile/upload/2025/06/01/home6.png', '塞维利亚', '/profile/upload/2025/06/01/away6.png', '2-0', 0, 1, '2025-06-04 22:00:00', '2025-06-04 10:00:00', '2025-06-04 10:00:00');
INSERT INTO `t_score` VALUES (7, '法甲', '/profile/upload/2025/06/01/league3.png', '巴黎', '/profile/upload/2025/06/01/home7.png', '马赛', '/profile/upload/2025/06/01/away7.png', '1-2', 0, 0, '2025-06-03 21:00:00', '2025-06-03 10:00:00', '2025-06-03 10:00:00');
INSERT INTO `t_score` VALUES (8, '德甲', '/profile/upload/2025/06/01/league4.png', '莱比锡', '/profile/upload/2025/06/01/home8.png', '法兰克福', '/profile/upload/2025/06/01/away8.png', '', 0, -1, '2025-06-03 23:00:00', '2025-06-03 10:00:00', '2025-06-03 10:00:00');
INSERT INTO `t_score` VALUES (9, '英超', '/profile/upload/2025/06/01/league1.png', '曼联', '/profile/upload/2025/06/01/home9.png', '曼城', '/profile/upload/2025/06/01/away9.png', '3-2', 0, 1, '2025-06-02 20:00:00', '2025-06-02 10:00:00', '2025-06-02 10:00:00');
INSERT INTO `t_score` VALUES (10, '意甲', '/profile/upload/2025/06/01/league2.png', '尤文图斯', '/profile/upload/2025/06/01/home10.png', '那不勒斯', '/profile/upload/2025/06/01/away10.png', '0-1', 0, 0, '2025-06-02 22:00:00', '2025-06-02 10:00:00', '2025-06-02 10:00:00');
INSERT INTO `t_score` VALUES (11, '欧冠', '/profile/upload/2025/06/01/league1.png', '曼城', '/profile/upload/2025/06/01/home11.png', '拜仁', '/profile/upload/2025/06/01/away11.png', '', 1, -1, '2025-06-05 23:59:00', '2025-06-05 10:00:00', '2025-06-05 10:00:00');

-- ----------------------------
-- Table structure for t_koi_fish_match
-- ----------------------------
DROP TABLE IF EXISTS `t_koi_fish_match`;
CREATE TABLE `t_koi_fish_match`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id主键',
  `league_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '联赛名称',
  `match_time` datetime(0) NOT NULL COMMENT '比赛时间',
  `match_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '比赛状态0未完场1已完场',
  `match_date` date NULL DEFAULT NULL COMMENT '赛事日期',
  `serialize` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '序列号 (周二003)',
  `home_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主队名称',
  `guest_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '客队名称',
  `full_score` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '全场比分',
  `recommend_content` json NULL COMMENT '推荐内容  胜平负 JSON字符串',
  `is_hit` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否命中 0 未命中 1命中',
  `hit_index` tinyint(0) NULL DEFAULT NULL COMMENT '命中的下标',
  `status` tinyint(0) NOT NULL DEFAULT 0 COMMENT '0未发布1已发布-1已删除',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '闪电秘籍赛事表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_koi_fish_match
-- ----------------------------
INSERT INTO `t_koi_fish_match` VALUES (9, '澳洲甲', '2025-04-17 15:34:04', 1, '2025-04-18', '周四001', '布里斯班狮吼', '西部联', '1-0', '[\"胜\"]', 1, 0, 99, '2025-04-12 15:34:30', '2025-04-12 15:34:30');
INSERT INTO `t_koi_fish_match` VALUES (10, '日职联', '2025-04-15 00:00:00', 1, '2025-04-15', '周三001', '横滨水手', '清水鼓动', '2-3', NULL, 1, NULL, 0, '2025-04-19 10:14:29', '2025-04-19 10:14:29');

-- ----------------------------
-- Table structure for t_lightning_secret_group
-- ----------------------------
DROP TABLE IF EXISTS `t_lightning_secret_group`;
CREATE TABLE `t_lightning_secret_group`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rate_of_return` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '回报率',
  `total` int(0) NOT NULL DEFAULT 0 COMMENT '总场次',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '-1已删除 0未发布1已发布',
  `league_names` json NOT NULL COMMENT '联赛名称集合（查询用）',
  `match_date` date NOT NULL DEFAULT (CURRENT_DATE()),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '闪电秘籍分组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_lightning_secret_group
-- ----------------------------
INSERT INTO `t_lightning_secret_group` VALUES (1, '+360%', 2, '2025-04-16 16:36:05', 0, '[\"摩西联\", \"巴西甲\"]', '2025-04-12');

-- ----------------------------
-- Table structure for t_lightning_secret_match
-- ----------------------------
DROP TABLE IF EXISTS `t_lightning_secret_match`;
CREATE TABLE `t_lightning_secret_match`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id主键',
  `group_id` int(0) NOT NULL COMMENT '分组id',
  `league_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '联赛名称',
  `match_time` datetime(0) NOT NULL COMMENT '比赛时间',
  `match_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '比赛状态0未完场1已完场',
  `serialize` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '序列号 (周二003)',
  `home_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主队名称',
  `guest_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '客队名称',
  `half_score` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '半场比分',
  `full_score` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '全场比分',
  `recommend_content` json NOT NULL COMMENT '推荐内容  胜平负 JSON字符串',
  `is_hit` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否命中 0 未命中 1命中',
  `hit_index` tinyint(0) NULL DEFAULT NULL COMMENT '命中的下标',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `half_full_match_index`(`group_id`) USING BTREE COMMENT 'groupId索引'
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '闪电秘籍赛事表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_lightning_secret_match
-- ----------------------------
INSERT INTO `t_lightning_secret_match` VALUES (1, 1, '巴西甲', '2025-04-11 16:30:00', 1, NULL, '塞阿拉', '瓦斯科达伽玛', '1-0', '2-1', '[\"大于2 (0.83)\"]', 1, 0, '2025-04-16 16:36:05', '0000-00-00 00:00:00');
INSERT INTO `t_lightning_secret_match` VALUES (2, 1, '摩西联', '2025-04-12 01:05:00', 1, NULL, '瓜达哈拉哈', '普埃布拉', '1-0', '1-0', '[\"大于2.75 (1.00)\"]', 0, NULL, '2025-04-16 16:36:05', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for t_scheme
-- ----------------------------
DROP TABLE IF EXISTS `t_scheme`;
CREATE TABLE `t_scheme`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键id 自增',
  `expert_id` int(0) NULL DEFAULT NULL COMMENT '专家id（外键）可以为空',
  `home_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主队名称',
  `guest_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '客队名称',
  `league_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '联赛名称',
  `match_time` datetime(0) NOT NULL COMMENT '赛事时间',
  `publish_time` datetime(0) NULL DEFAULT NULL COMMENT '发布时间',
  `like_num` int(0) NOT NULL DEFAULT 0 COMMENT '感兴趣人数',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0未发布1已发布-1删除',
  `type` tinyint(1) NOT NULL COMMENT '0免费方案1专家方案',
  `play_type` tinyint(1) NOT NULL COMMENT '玩法类型（0竞足1让球2总进球）',
  `ball_num` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '玩法球数',
  `odds_list` json NOT NULL COMMENT '指数集合',
  `is_hit` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否命中，默认0',
  `hit_index` tinyint(0) NULL DEFAULT NULL COMMENT '命中索引',
  `recommend_index` tinyint(0) NULL DEFAULT NULL COMMENT '推荐值索引',
  `pay_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '收款二维码',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '文章分析',
  `full_score` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '全场比分',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '方案表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_scheme
-- ----------------------------
INSERT INTO `t_scheme` VALUES (1, 2, '勒沃库森', '波鸡', '德甲', '2025-04-06 22:53:14', '2025-04-13 20:45:34', 15, 1, 1, 1, '3', '[\"-1.75\", \"1.75\"]', 1, 0, 0, '/profile/upload/2025/04/15/pay-code_20250415095545A004.jpg', '【⚡️闪电购单·无忧保障】 \n ✅ 支付即享专业团队AI精算方案 \n ✅ 赛果未达预期自动触发极速退款 \n ✅ 加密支付通道保障资金零风险 \n 🔐 安全支付 \n 🔥 立即解锁 » [立即扫码支付] ', '1-0', '2025-04-06 22:54:21', '2025-04-06 22:54:21');
INSERT INTO `t_scheme` VALUES (3, 2, '大苏打', '实打实', '大苏打', '2025-04-07 00:11:12', NULL, 1, -1, 0, 1, '1', '[1.75, 1.75, 1.75]', 0, NULL, NULL, NULL, 'sdfsdf hyy', NULL, '2025-04-07 00:15:56', '2025-04-07 00:15:56');
INSERT INTO `t_scheme` VALUES (4, 2, 'wewewe', 'wewew', 'wewewe', '2025-04-07 20:15:19', NULL, 23, -1, 0, 1, '1', '[1.75, 1.75]', 0, NULL, NULL, '', NULL, NULL, '2025-04-07 20:15:35', '2025-04-07 20:15:35');
INSERT INTO `t_scheme` VALUES (5, 2, 'sdsd', 'sdsd', '3sdfsd', '2025-04-07 20:34:36', '2025-04-13 20:45:34', 12, -1, 1, 1, '1', '[1, 1]', 0, NULL, NULL, '/profile/avatar/2025/04/07/pay-code_20250407203502A001.jpg', NULL, NULL, '2025-04-07 20:35:08', '2025-04-07 20:35:08');
INSERT INTO `t_scheme` VALUES (6, 5, '魔力伦斯', '里奥艾维', '葡超', '2025-04-14 11:44:22', '2025-04-14 14:33:51', 14, 1, 0, 0, '3', '[-0.25, 1.75, 1.35]', 1, 1, 0, '', '【⚡️闪电购单·无忧保障】 \n ✅ 支付即享专业团队AI精算方案 \n ✅ 赛果未达预期自动触发极速退款 \n ✅ 加密支付通道保障资金零风险 \n 🔐 安全支付 \n 🔥 立即解锁 » [立即扫码支付] ', '1-1', '2025-04-14 11:48:01', '2025-04-14 11:48:01');
INSERT INTO `t_scheme` VALUES (7, 2, '诺丁韩僧林', '爱否吨', '英超', '2025-04-14 15:46:19', '2025-04-14 15:50:59', 12, 1, 0, 1, '0', '[1.94, 2.99, 3.6]', 0, NULL, 0, '', NULL, '1-2', '2025-04-14 15:49:13', '2025-04-14 15:49:13');

-- ----------------------------
-- Table structure for t_single_bag_group
-- ----------------------------
DROP TABLE IF EXISTS `t_single_bag_group`;
CREATE TABLE `t_single_bag_group`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rate_of_return` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '回报率',
  `total` int(0) NOT NULL DEFAULT 0 COMMENT '总场次',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '-1已删除 0未发布1已发布',
  `league_names` json NOT NULL COMMENT '联赛名称集合（查询用）',
  `match_date` date NOT NULL DEFAULT (CURRENT_DATE()),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '北单分组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_single_bag_group
-- ----------------------------
INSERT INTO `t_single_bag_group` VALUES (19, NULL, 2, '2025-04-16 13:56:13', 0, '[\"墨西联\", \"瑞典甲\"]', '2025-04-16');

-- ----------------------------
-- Table structure for t_single_bag_match
-- ----------------------------
DROP TABLE IF EXISTS `t_single_bag_match`;
CREATE TABLE `t_single_bag_match`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id主键',
  `group_id` int(0) NOT NULL COMMENT '分组id',
  `league_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '联赛名称',
  `match_time` datetime(0) NOT NULL COMMENT '比赛时间',
  `match_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '比赛状态0未完场1已完场',
  `serialize` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '序列号 (周二003)',
  `home_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主队名称',
  `guest_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '客队名称',
  `half_score` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '半场比分',
  `full_score` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '全场比分',
  `recommend_content` json NOT NULL COMMENT '推荐内容  胜平负 JSON字符串',
  `is_hit` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否命中 0 未命中 1命中',
  `hit_index` tinyint(0) NULL DEFAULT NULL COMMENT '命中的下标',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `half_full_match_index`(`group_id`) USING BTREE COMMENT 'groupId索引'
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '北单赛事表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_single_bag_match
-- ----------------------------
INSERT INTO `t_single_bag_match` VALUES (1, 19, '瑞典甲', '2025-04-15 16:00:00', 1, '北单001', '奥雷布洛', '赫尔辛堡', '0-0', '0-2', '[\"赫尔辛堡 +0.5\"]', 1, 0, '2025-04-16 13:56:13', '0000-00-00 00:00:00');
INSERT INTO `t_single_bag_match` VALUES (2, 19, '墨西联', '2025-04-16 05:55:14', 1, '北单008', '瓜达拉哈拉', '普埃布拉', '1-0', '1-0', '[\"普埃布拉\"]', 0, NULL, '2025-04-16 13:56:13', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for t_app_activation
-- ----------------------------
DROP TABLE IF EXISTS `t_app_activation`;
CREATE TABLE `t_app_activation` (
  `id`          int          NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `device_id`   varchar(128) NOT NULL COMMENT '设备ID (ANDROID_ID / IDFV)',
  `market_id`   tinyint      NOT NULL DEFAULT 1 COMMENT '市场ID: 1=百度 2=华为 3=小米 4=应用宝 5=Oppo 6=Vivo 7=360 99=其他',
  `package_id`  varchar(64)  NOT NULL COMMENT '渠道包ID',
  `report_time` datetime     NOT NULL COMMENT '激活上报时间',
  `create_time` datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_device_id` (`device_id`) USING BTREE COMMENT '设备ID唯一索引',
  KEY `idx_report_time` (`report_time`) USING BTREE COMMENT '上报时间索引'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='App激活记录表';

SET FOREIGN_KEY_CHECKS = 1;
