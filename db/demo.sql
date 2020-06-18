/*
 Navicat Premium Data Transfer

 Source Server         : mysql_pxc
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : 192.168.238.150:3306
 Source Schema         : demo

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 29/04/2020 11:33:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BLOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `SCHED_NAME`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RenrenScheduler', 'TASK_4', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TRIG_INST_NAME`(`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY`(`SCHED_NAME`, `INSTANCE_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_FT_J_G`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_T_G`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TG`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_J_REQ_RECOVERY`(`SCHED_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_J_GRP`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RenrenScheduler', 'TASK_4', 'DEFAULT', NULL, 'io.renren.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017155E0BCE07874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000474000672656E72656E74000CE58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------
INSERT INTO `QRTZ_LOCKS` VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `QRTZ_LOCKS` VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('RenrenScheduler', 'luosen-PC1588060744923', 1588131231266, 15000);
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('RenrenScheduler', 'luosen1586349611120', 1586591482088, 15000);
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('RenrenScheduler', 'luosen1586349846917', 1586591482075, 15000);
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('RenrenScheduler', 'luosen1586349987967', 1586591482089, 15000);
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('RenrenScheduler', 'luosen1586500599949', 1586591482119, 15000);

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `INT_PROP_1` int(11) NULL DEFAULT NULL,
  `INT_PROP_2` int(11) NULL DEFAULT NULL,
  `LONG_PROP_1` bigint(20) NULL DEFAULT NULL,
  `LONG_PROP_2` bigint(20) NULL DEFAULT NULL,
  `DEC_PROP_1` decimal(13, 4) NULL DEFAULT NULL,
  `DEC_PROP_2` decimal(13, 4) NULL DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) NULL DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) NULL DEFAULT NULL,
  `PRIORITY` int(11) NULL DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) NULL DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) NULL DEFAULT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_J`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_C`(`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_T_G`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_STATE`(`SCHED_NAME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_STATE`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_G_STATE`(`SCHED_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NEXT_FIRE_TIME`(`SCHED_NAME`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST`(`SCHED_NAME`, `TRIGGER_STATE`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RenrenScheduler', 'TASK_4', 'DEFAULT', 'TASK_4', 'DEFAULT', NULL, 1588132800000, 1588131000000, 5, 'WAITING', 'CRON', 1586347658000, 0, NULL, 2, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017155E0BCE07874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000474000CE7B3BBE7BB9FE6B58BE8AF9574000CE58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);

-- ----------------------------
-- Table structure for kill_result
-- ----------------------------
DROP TABLE IF EXISTS `kill_result`;
CREATE TABLE `kill_result`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '秒杀结果id',
  `user_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '秒杀用户名称',
  `number` int(11) NOT NULL COMMENT '秒杀结果数量',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '秒杀项名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1129 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '秒杀结果表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kill_result
-- ----------------------------
INSERT INTO `kill_result` VALUES (1114, 'admin', 3, '2020-04-28 15:36:17', 0, '123');
INSERT INTO `kill_result` VALUES (1119, 'admin', 3, '2020-04-28 15:51:26', 0, '123');

-- ----------------------------
-- Table structure for kill_seckill
-- ----------------------------
DROP TABLE IF EXISTS `kill_seckill`;
CREATE TABLE `kill_seckill`  (
  `seckill_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '秒杀测试项id',
  `name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '秒杀测试项名称',
  `number` int(11) NOT NULL COMMENT '秒杀测试项数量',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '秒杀开启时间',
  `end_time` datetime(0) NOT NULL COMMENT '秒杀结束时间',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0未开启秒杀　１已经进行了秒杀',
  `seckill_status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '0代表未进行秒杀　１代表正在进行秒杀',
  PRIMARY KEY (`seckill_id`) USING BTREE,
  INDEX `idx_start_time`(`start_time`) USING BTREE,
  INDEX `idx_end_time`(`end_time`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1089 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '秒杀测试项表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kill_seckill
-- ----------------------------
INSERT INTO `kill_seckill` VALUES (1, '秒杀项', 151, '2020-04-23 15:33:30', '2020-04-23 16:33:50', '2020-04-23 15:33:30', 0, '0');
INSERT INTO `kill_seckill` VALUES (1084, '123', 123, NULL, '2020-04-30 16:33:50', '2020-04-27 21:09:02', 1, '1');

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule_job
-- ----------------------------

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log`  (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`) USING BTREE,
  INDEX `job_id`(`job_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 624 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
INSERT INTO `schedule_job_log` VALUES (39, 4, 'testTask', '系统测试', 0, NULL, 1, '2020-04-09 11:57:06');
INSERT INTO `schedule_job_log` VALUES (44, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-09 12:00:00');
INSERT INTO `schedule_job_log` VALUES (49, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-09 12:30:00');
INSERT INTO `schedule_job_log` VALUES (54, 4, 'testTask', '系统测试', 0, NULL, 1, '2020-04-09 13:00:00');
INSERT INTO `schedule_job_log` VALUES (59, 4, 'testTask', '系统测试', 0, NULL, 2, '2020-04-09 13:30:00');
INSERT INTO `schedule_job_log` VALUES (64, 4, 'testTask', '系统测试', 0, NULL, 3, '2020-04-09 14:00:00');
INSERT INTO `schedule_job_log` VALUES (69, 4, 'testTask', '系统测试', 0, NULL, 1, '2020-04-09 14:30:00');
INSERT INTO `schedule_job_log` VALUES (74, 4, 'testTask', '系统测试', 0, NULL, 2, '2020-04-09 18:39:29');
INSERT INTO `schedule_job_log` VALUES (79, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-09 21:45:26');
INSERT INTO `schedule_job_log` VALUES (84, 4, 'testTask', '系统测试', 0, NULL, 2, '2020-04-08 20:30:00');
INSERT INTO `schedule_job_log` VALUES (89, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-10 10:30:00');
INSERT INTO `schedule_job_log` VALUES (94, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-10 19:21:29');
INSERT INTO `schedule_job_log` VALUES (99, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-10 19:30:00');
INSERT INTO `schedule_job_log` VALUES (104, 4, 'testTask', '系统测试', 0, NULL, 3, '2020-04-10 20:00:00');
INSERT INTO `schedule_job_log` VALUES (109, 4, 'testTask', '系统测试', 0, NULL, 2, '2020-04-10 20:30:00');
INSERT INTO `schedule_job_log` VALUES (114, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-13 08:30:00');
INSERT INTO `schedule_job_log` VALUES (119, 4, 'testTask', '系统测试', 0, NULL, 1, '2020-04-13 09:00:00');
INSERT INTO `schedule_job_log` VALUES (124, 4, 'testTask', '系统测试', 0, NULL, 2, '2020-04-13 09:30:00');
INSERT INTO `schedule_job_log` VALUES (129, 4, 'testTask', '系统测试', 0, NULL, 1, '2020-04-13 10:00:00');
INSERT INTO `schedule_job_log` VALUES (134, 4, 'testTask', '系统测试', 0, NULL, 2, '2020-04-13 10:30:00');
INSERT INTO `schedule_job_log` VALUES (139, 4, 'testTask', '系统测试', 0, NULL, 3, '2020-04-20 10:00:00');
INSERT INTO `schedule_job_log` VALUES (144, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-20 10:30:00');
INSERT INTO `schedule_job_log` VALUES (149, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-20 11:00:00');
INSERT INTO `schedule_job_log` VALUES (154, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-20 11:30:00');
INSERT INTO `schedule_job_log` VALUES (159, 4, 'testTask', '系统测试', 0, NULL, 1, '2020-04-20 12:00:00');
INSERT INTO `schedule_job_log` VALUES (164, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-20 12:30:00');
INSERT INTO `schedule_job_log` VALUES (169, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-20 13:00:00');
INSERT INTO `schedule_job_log` VALUES (174, 4, 'testTask', '系统测试', 0, NULL, 1, '2020-04-20 13:30:00');
INSERT INTO `schedule_job_log` VALUES (179, 4, 'testTask', '系统测试', 0, NULL, 1, '2020-04-20 14:00:00');
INSERT INTO `schedule_job_log` VALUES (184, 4, 'testTask', '系统测试', 0, NULL, 2, '2020-04-20 16:30:00');
INSERT INTO `schedule_job_log` VALUES (189, 4, 'testTask', '系统测试', 0, NULL, 11, '2020-04-20 17:00:00');
INSERT INTO `schedule_job_log` VALUES (194, 4, 'testTask', '系统测试', 0, NULL, 3, '2020-04-09 11:30:00');
INSERT INTO `schedule_job_log` VALUES (199, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-21 20:30:00');
INSERT INTO `schedule_job_log` VALUES (204, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-21 21:00:00');
INSERT INTO `schedule_job_log` VALUES (209, 4, 'testTask', '系统测试', 0, NULL, 2, '2020-04-22 15:00:00');
INSERT INTO `schedule_job_log` VALUES (214, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-22 15:30:00');
INSERT INTO `schedule_job_log` VALUES (219, 4, 'testTask', '系统测试', 0, NULL, 1, '2020-04-22 16:00:00');
INSERT INTO `schedule_job_log` VALUES (224, 4, 'testTask', '系统测试', 0, NULL, 1, '2020-04-22 16:30:00');
INSERT INTO `schedule_job_log` VALUES (229, 4, 'testTask', '系统测试', 0, NULL, 1, '2020-04-22 17:00:00');
INSERT INTO `schedule_job_log` VALUES (234, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-23 14:00:00');
INSERT INTO `schedule_job_log` VALUES (239, 4, 'testTask', '系统测试', 0, NULL, 1, '2020-04-23 14:30:00');
INSERT INTO `schedule_job_log` VALUES (244, 4, 'testTask', '系统测试', 0, NULL, 2, '2020-04-23 15:00:00');
INSERT INTO `schedule_job_log` VALUES (249, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-23 16:00:00');
INSERT INTO `schedule_job_log` VALUES (254, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-23 16:30:00');
INSERT INTO `schedule_job_log` VALUES (259, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-23 17:00:00');
INSERT INTO `schedule_job_log` VALUES (264, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-23 17:30:00');
INSERT INTO `schedule_job_log` VALUES (269, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-23 18:00:00');
INSERT INTO `schedule_job_log` VALUES (274, 4, 'testTask', '系统测试', 0, NULL, 1, '2020-04-23 18:30:00');
INSERT INTO `schedule_job_log` VALUES (279, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-23 19:00:00');
INSERT INTO `schedule_job_log` VALUES (284, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-23 19:30:00');
INSERT INTO `schedule_job_log` VALUES (289, 4, 'testTask', '系统测试', 0, NULL, 1, '2020-04-23 20:30:00');
INSERT INTO `schedule_job_log` VALUES (294, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-23 21:00:00');
INSERT INTO `schedule_job_log` VALUES (299, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-23 22:00:00');
INSERT INTO `schedule_job_log` VALUES (304, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-23 22:30:00');
INSERT INTO `schedule_job_log` VALUES (309, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-24 13:30:00');
INSERT INTO `schedule_job_log` VALUES (314, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-24 14:00:00');
INSERT INTO `schedule_job_log` VALUES (319, 4, 'testTask', '系统测试', 0, NULL, 1, '2020-04-24 14:30:00');
INSERT INTO `schedule_job_log` VALUES (324, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-24 15:00:00');
INSERT INTO `schedule_job_log` VALUES (329, 4, 'testTask', '系统测试', 0, NULL, 1, '2020-04-24 15:30:00');
INSERT INTO `schedule_job_log` VALUES (334, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-24 16:00:00');
INSERT INTO `schedule_job_log` VALUES (339, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-24 16:30:00');
INSERT INTO `schedule_job_log` VALUES (344, 4, 'testTask', '系统测试', 0, NULL, 1, '2020-04-24 17:00:00');
INSERT INTO `schedule_job_log` VALUES (349, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-25 10:00:00');
INSERT INTO `schedule_job_log` VALUES (354, 4, 'testTask', '系统测试', 0, NULL, 9, '2020-04-25 10:30:00');
INSERT INTO `schedule_job_log` VALUES (359, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-25 11:00:00');
INSERT INTO `schedule_job_log` VALUES (364, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-25 11:30:00');
INSERT INTO `schedule_job_log` VALUES (369, 4, 'testTask', '系统测试', 0, NULL, 1, '2020-04-25 12:00:00');
INSERT INTO `schedule_job_log` VALUES (374, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-25 12:30:00');
INSERT INTO `schedule_job_log` VALUES (379, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-25 13:00:00');
INSERT INTO `schedule_job_log` VALUES (384, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-25 13:30:00');
INSERT INTO `schedule_job_log` VALUES (389, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-26 10:00:00');
INSERT INTO `schedule_job_log` VALUES (394, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-26 10:30:00');
INSERT INTO `schedule_job_log` VALUES (399, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-26 11:00:00');
INSERT INTO `schedule_job_log` VALUES (404, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-26 11:30:00');
INSERT INTO `schedule_job_log` VALUES (409, 4, 'testTask', '系统测试', 0, NULL, 1, '2020-04-26 12:00:00');
INSERT INTO `schedule_job_log` VALUES (414, 4, 'testTask', '系统测试', 0, NULL, 1, '2020-04-26 12:30:00');
INSERT INTO `schedule_job_log` VALUES (419, 4, 'testTask', '系统测试', 0, NULL, 1, '2020-04-26 13:00:00');
INSERT INTO `schedule_job_log` VALUES (424, 4, 'testTask', '系统测试', 0, NULL, 1, '2020-04-26 14:30:00');
INSERT INTO `schedule_job_log` VALUES (429, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-26 15:00:00');
INSERT INTO `schedule_job_log` VALUES (434, 4, 'testTask', '系统测试', 0, NULL, 1, '2020-04-26 15:30:00');
INSERT INTO `schedule_job_log` VALUES (439, 4, 'testTask', '系统测试', 0, NULL, 1, '2020-04-26 20:30:00');
INSERT INTO `schedule_job_log` VALUES (444, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-26 21:00:00');
INSERT INTO `schedule_job_log` VALUES (449, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-26 21:30:00');
INSERT INTO `schedule_job_log` VALUES (454, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-26 22:00:00');
INSERT INTO `schedule_job_log` VALUES (459, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-26 22:30:00');
INSERT INTO `schedule_job_log` VALUES (464, 4, 'testTask', '系统测试', 0, NULL, 1, '2020-04-26 23:00:00');
INSERT INTO `schedule_job_log` VALUES (469, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-27 10:30:00');
INSERT INTO `schedule_job_log` VALUES (474, 4, 'testTask', '系统测试', 0, NULL, 1, '2020-04-27 11:00:00');
INSERT INTO `schedule_job_log` VALUES (479, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-27 11:30:00');
INSERT INTO `schedule_job_log` VALUES (484, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-27 12:00:00');
INSERT INTO `schedule_job_log` VALUES (489, 4, 'testTask', '系统测试', 0, NULL, 1, '2020-04-27 12:30:00');
INSERT INTO `schedule_job_log` VALUES (494, 4, 'testTask', '系统测试', 0, NULL, 1, '2020-04-27 13:00:00');
INSERT INTO `schedule_job_log` VALUES (499, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-27 13:30:00');
INSERT INTO `schedule_job_log` VALUES (504, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-27 14:00:00');
INSERT INTO `schedule_job_log` VALUES (509, 4, 'testTask', '系统测试', 0, NULL, 1, '2020-04-27 14:30:00');
INSERT INTO `schedule_job_log` VALUES (514, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-27 15:00:00');
INSERT INTO `schedule_job_log` VALUES (519, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-27 16:00:00');
INSERT INTO `schedule_job_log` VALUES (524, 4, 'testTask', '系统测试', 0, NULL, 7, '2020-04-27 16:30:00');
INSERT INTO `schedule_job_log` VALUES (529, 4, 'testTask', '系统测试', 0, NULL, 1, '2020-04-27 17:00:00');
INSERT INTO `schedule_job_log` VALUES (534, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-27 18:00:00');
INSERT INTO `schedule_job_log` VALUES (539, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-27 18:30:00');
INSERT INTO `schedule_job_log` VALUES (544, 4, 'testTask', '系统测试', 0, NULL, 1, '2020-04-27 19:00:00');
INSERT INTO `schedule_job_log` VALUES (549, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-27 19:30:00');
INSERT INTO `schedule_job_log` VALUES (554, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-27 20:00:00');
INSERT INTO `schedule_job_log` VALUES (559, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-27 20:30:00');
INSERT INTO `schedule_job_log` VALUES (564, 4, 'testTask', '系统测试', 0, NULL, 1, '2020-04-27 21:00:00');
INSERT INTO `schedule_job_log` VALUES (569, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-27 21:30:00');
INSERT INTO `schedule_job_log` VALUES (574, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-27 22:00:00');
INSERT INTO `schedule_job_log` VALUES (579, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-27 22:30:00');
INSERT INTO `schedule_job_log` VALUES (584, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-28 14:30:00');
INSERT INTO `schedule_job_log` VALUES (589, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-28 15:00:00');
INSERT INTO `schedule_job_log` VALUES (594, 4, 'testTask', '系统测试', 0, NULL, 1, '2020-04-28 15:30:00');
INSERT INTO `schedule_job_log` VALUES (599, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-28 16:00:00');
INSERT INTO `schedule_job_log` VALUES (604, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-29 10:00:00');
INSERT INTO `schedule_job_log` VALUES (609, 4, 'testTask', '系统测试', 0, NULL, 1, '2020-04-29 10:30:00');
INSERT INTO `schedule_job_log` VALUES (614, 4, 'testTask', '系统测试', 0, NULL, 0, '2020-04-29 11:00:00');
INSERT INTO `schedule_job_log` VALUES (619, 4, 'testTask', '系统测试', 0, NULL, 1, '2020-04-29 11:30:00');

-- ----------------------------
-- Table structure for sys_captcha
-- ----------------------------
DROP TABLE IF EXISTS `sys_captcha`;
CREATE TABLE `sys_captcha`  (
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'uuid',
  `code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '验证码',
  `expire_time` datetime(0) NULL DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统验证码' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_captcha
-- ----------------------------
INSERT INTO `sys_captcha` VALUES ('024c1f82-ff84-45c7-8070-1dc860be0599', 'nd2e3', '2020-04-09 00:08:39');
INSERT INTO `sys_captcha` VALUES ('1f632fe6-3fae-4d5e-83f1-94aeaf650c19', 'ypgnn', '2020-04-22 15:28:44');
INSERT INTO `sys_captcha` VALUES ('215ba9fe-28b1-4787-8290-e434949253f3', 'mnng7', '2020-04-08 21:15:57');
INSERT INTO `sys_captcha` VALUES ('45e8946c-285f-4885-8938-4cda4579c22b', 'ng755', '2020-04-09 00:14:43');
INSERT INTO `sys_captcha` VALUES ('49223e4b-d27d-4115-8594-29dc3c264d88', 'wecxd', '2020-04-09 18:58:39');
INSERT INTO `sys_captcha` VALUES ('4a63092c-60b0-4988-8fe8-265635ed393d', '8cgg4', '2020-04-09 03:23:37');
INSERT INTO `sys_captcha` VALUES ('5c8ab5ad-d60b-468a-8651-91a254754207', 'p7bg4', '2020-04-09 03:49:52');
INSERT INTO `sys_captcha` VALUES ('6527085e-6b2d-4a89-8708-b1dd408d1388', '2nfex', '2020-04-08 21:17:16');
INSERT INTO `sys_captcha` VALUES ('70413db6-1445-481b-8346-f2fc6547c6bd', '646pm', '2020-04-08 21:17:05');
INSERT INTO `sys_captcha` VALUES ('7c2e59c7-3522-406e-8a2b-e0fea9fdf939', '5cwxn', '2020-04-08 21:10:48');
INSERT INTO `sys_captcha` VALUES ('8272ba35-6e21-4e65-89d8-e57ff6ec8efa', 'yb7m7', '2020-04-08 21:10:26');
INSERT INTO `sys_captcha` VALUES ('8574cea3-35a2-4006-8e16-3cb130493c55', '667cc', '2020-04-08 21:18:07');
INSERT INTO `sys_captcha` VALUES ('92cbe249-2acb-4e6c-808a-064efd4f606d', 'pbd75', '2020-04-08 23:27:42');
INSERT INTO `sys_captcha` VALUES ('9dd865ab-626f-4dc1-81e7-eba38ec9b45d', '2ep44', '2020-04-08 21:18:08');
INSERT INTO `sys_captcha` VALUES ('ab4ac4aa-f7d9-4c1e-8a61-8299697f398a', '4pdx2', '2020-04-09 03:23:40');
INSERT INTO `sys_captcha` VALUES ('b5d90427-19a2-47ef-89b7-ac73277fa9a6', '37p8c', '2020-04-08 21:18:40');
INSERT INTO `sys_captcha` VALUES ('b774a7cf-2ed1-4b10-86c6-5fb1609cfcda', 'dccce', '2020-04-08 21:16:23');
INSERT INTO `sys_captcha` VALUES ('bd769d6a-787d-4126-840d-4f2c5ed8cecb', 'p82p3', '2020-04-09 03:45:57');
INSERT INTO `sys_captcha` VALUES ('c544c485-2305-47b2-8394-c5032bf2188b', 'ap4dm', '2020-04-08 21:11:35');
INSERT INTO `sys_captcha` VALUES ('ca90a09e-59df-41b8-8129-f90f71fb2955', 'ay8dd', '2020-04-09 19:13:49');
INSERT INTO `sys_captcha` VALUES ('da35aaa0-f7fc-4533-81f1-6a117833410d', 'eb62e', '2020-04-08 21:12:13');
INSERT INTO `sys_captcha` VALUES ('e209f848-136e-452c-853f-6ff24609027d', '6mnxa', '2020-04-09 02:09:20');
INSERT INTO `sys_captcha` VALUES ('e6ec3962-ed51-4013-86c5-445ec3f686f2', 'anbyx', '2020-04-09 02:05:49');
INSERT INTO `sys_captcha` VALUES ('f165f1bc-7156-4a4f-8fee-f072bbb45773', '4bpww', '2020-04-08 21:17:08');
INSERT INTO `sys_captcha` VALUES ('ff4a4940-99e4-467a-855c-2aa815f83b0b', 'a4faw', '2020-04-08 21:06:57');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) NULL DEFAULT 1 COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `job_status` tinyint(4) NOT NULL COMMENT '0 代表未执行 1 代表已执行',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `param_key`(`param_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 139 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统配置信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (9, '测试任务', '这是一个测试任务', 1, '再次测试1', 0);
INSERT INTO `sys_config` VALUES (24, '测试任', '这是另一个测试任务', 1, '是哒', 1);
INSERT INTO `sys_config` VALUES (34, '再次新增测试', '这是新的再次新增测试', 1, '123345', 0);
INSERT INTO `sys_config` VALUES (44, 'user', 'user增加的任务', 1, '123', 1);
INSERT INTO `sys_config` VALUES (104, '123', '123', 1, '123', 0);
INSERT INTO `sys_config` VALUES (109, '测试redis', '测试redis', 1, '123', 0);
INSERT INTO `sys_config` VALUES (114, '再次测试redis', '再次测试redis', 1, '再次测试redis', 0);
INSERT INTO `sys_config` VALUES (119, 'test', 'test', 1, 'test', 0);
INSERT INTO `sys_config` VALUES (134, 'redis', 'redis', 1, 'redis', 0);

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 374 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (4, 'admin', '修改定时任务', 'io.renren.modules.job.controller.ScheduleJobController.update()', '[{\"jobId\":4,\"beanName\":\"testTask\",\"params\":\"系统测试\",\"cronExpression\":\"0 0/30 * * * ?\",\"status\":0,\"remark\":\"参数测试\"}]', 560, '0:0:0:0:0:0:0:1', '2020-04-09 00:05:22');
INSERT INTO `sys_log` VALUES (9, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":1,\"username\":\"admin\",\"password\":\"5bae455e9b8e7e85f1d9b360f1782506fe0093c15f72a91e7ca7a72e02512bea\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@admin.com\",\"mobile\":\"12345678901\",\"status\":1,\"roleIdList\":[],\"createUserId\":1}]', 148, '0:0:0:0:0:0:0:1', '2020-04-09 11:53:22');
INSERT INTO `sys_log` VALUES (14, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":4,\"username\":\"root\",\"password\":\"aacca55f2ddd52efea5237d0575b8bd681129df84fd37a101564598dceee9b14\",\"salt\":\"hnC8elXBQ86Cem5UfDiT\",\"email\":\"root@root.com\",\"mobile\":\"13324634723\",\"status\":1,\"roleIdList\":[],\"createUserId\":1,\"createTime\":\"Apr 9, 2020 11:53:55 AM\"}]', 24, '0:0:0:0:0:0:0:1', '2020-04-09 11:53:55');
INSERT INTO `sys_log` VALUES (19, 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":4,\"roleName\":\"root\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,6,7,8,9,10,11,12,13,14,27,29,30,-666666],\"createTime\":\"Apr 9, 2020 11:55:20 AM\"}]', 107, '0:0:0:0:0:0:0:1', '2020-04-09 11:55:20');
INSERT INTO `sys_log` VALUES (24, 'admin', '删除角色', 'io.renren.modules.sys.controller.SysRoleController.delete()', '[[4]]', 19, '0:0:0:0:0:0:0:1', '2020-04-09 11:56:12');
INSERT INTO `sys_log` VALUES (29, 'admin', '立即执行任务', 'io.renren.modules.job.controller.ScheduleJobController.run()', '[[4]]', 41, '0:0:0:0:0:0:0:1', '2020-04-09 11:57:06');
INSERT INTO `sys_log` VALUES (34, 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":9,\"roleName\":\"root\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,6,7,8,9,10,11,12,13,14,27,29,-666666],\"createTime\":\"Apr 9, 2020 9:43:58 PM\"}]', 200, '0:0:0:0:0:0:0:1', '2020-04-09 21:43:59');
INSERT INTO `sys_log` VALUES (39, 'admin', '删除用户', 'io.renren.modules.sys.controller.SysUserController.delete()', '[[4]]', 11, '0:0:0:0:0:0:0:1', '2020-04-09 21:44:05');
INSERT INTO `sys_log` VALUES (44, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":9,\"username\":\"root\",\"password\":\"2bb0b76371ae34874b515ee186c4e2abb41acd4c03895fbfe77eb28dd2ad807d\",\"salt\":\"NFK0Mu2MwuVFolQTkSux\",\"email\":\"root@root.com\",\"mobile\":\"12312356734\",\"status\":1,\"roleIdList\":[9],\"createUserId\":1,\"createTime\":\"Apr 9, 2020 9:44:32 PM\"}]', 56, '0:0:0:0:0:0:0:1', '2020-04-09 21:44:32');
INSERT INTO `sys_log` VALUES (49, 'root', '立即执行任务', 'io.renren.modules.job.controller.ScheduleJobController.run()', '[[4]]', 22, '0:0:0:0:0:0:0:1', '2020-04-09 21:45:26');
INSERT INTO `sys_log` VALUES (54, 'root', '保存配置', 'io.renren.modules.sys.controller.SysConfigController.save()', '[{\"id\":9,\"paramKey\":\"测试任务\",\"paramValue\":\"这是一个测试任务\",\"remark\":\"123\"}]', 82, '0:0:0:0:0:0:0:1', '2020-04-10 19:19:35');
INSERT INTO `sys_log` VALUES (59, 'root', '立即执行任务', 'io.renren.modules.job.controller.ScheduleJobController.run()', '[[4]]', 27, '0:0:0:0:0:0:0:1', '2020-04-10 19:21:27');
INSERT INTO `sys_log` VALUES (64, 'root', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":14,\"username\":\"user1\",\"password\":\"0f41c1576da91266a178038a427bb24ed7e0944d93d0c8c3ac2bdb945f960026\",\"salt\":\"Fw6EB7ceOjgBrcmnl989\",\"email\":\"user1@root.com\",\"mobile\":\"12314324328\",\"status\":1,\"roleIdList\":[],\"createUserId\":9,\"createTime\":\"Apr 8, 2020 4:02:31 PM\"}]', 212, '192.168.238.129', '2020-04-09 00:02:32');
INSERT INTO `sys_log` VALUES (69, 'root', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":14,\"roleName\":\"user1\",\"remark\":\"\",\"createUserId\":9,\"menuIdList\":[27,-666666,1],\"createTime\":\"Apr 8, 2020 4:03:28 PM\"}]', 730, '192.168.238.129', '2020-04-09 00:03:29');
INSERT INTO `sys_log` VALUES (74, 'root', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":14,\"roleName\":\"user1\",\"remark\":\"\",\"createUserId\":9,\"menuIdList\":[4,23,24,25,26,6,7,8,9,10,11,12,13,14,27,-666666,1]}]', 148, '192.168.238.129', '2020-04-09 00:04:55');
INSERT INTO `sys_log` VALUES (79, 'root', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":14,\"username\":\"user1\",\"password\":\"0f41c1576da91266a178038a427bb24ed7e0944d93d0c8c3ac2bdb945f960026\",\"salt\":\"Fw6EB7ceOjgBrcmnl989\",\"email\":\"user1@root.com\",\"mobile\":\"12314324328\",\"status\":1,\"roleIdList\":[14],\"createUserId\":9}]', 477, '192.168.238.129', '2020-04-09 00:05:50');
INSERT INTO `sys_log` VALUES (84, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":9,\"roleName\":\"root\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,6,7,8,9,10,11,12,13,14,27,29,-666666]}]', 180, '192.168.238.129', '2020-04-09 01:28:36');
INSERT INTO `sys_log` VALUES (89, 'admin', '保存配置', 'io.renren.modules.sys.controller.SysConfigController.save()', '[{\"id\":24,\"paramKey\":\"测试任\",\"paramValue\":\"这是另一个测试任务\",\"remark\":\"是哒\"}]', 520, '192.168.238.129', '2020-04-09 01:30:03');
INSERT INTO `sys_log` VALUES (94, 'admin', '保存配置', 'io.renren.modules.sys.controller.SysConfigController.save()', '[{\"id\":29,\"paramKey\":\"表格测试\",\"paramValue\":\"这是一个表格样式测试\",\"remark\":\"345\"}]', 337, '192.168.238.129', '2020-04-09 08:33:30');
INSERT INTO `sys_log` VALUES (99, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":14,\"roleName\":\"user1\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[27,-666666,1]}]', 128, '192.168.238.129', '2020-04-09 12:00:23');
INSERT INTO `sys_log` VALUES (104, 'admin', '修改配置', 'io.renren.modules.sys.controller.SysConfigController.update()', '[{\"id\":9,\"paramKey\":\"测试任务\",\"paramValue\":\"这是一个测试任务\",\"remark\":\"再次测试\"}]', 320, '0:0:0:0:0:0:0:1', '2020-04-22 15:02:37');
INSERT INTO `sys_log` VALUES (109, 'admin', '删除配置', 'io.renren.modules.sys.controller.SysConfigController.delete()', '[[29]]', 36, '0:0:0:0:0:0:0:1', '2020-04-22 15:02:46');
INSERT INTO `sys_log` VALUES (114, 'admin', '保存配置', 'io.renren.modules.sys.controller.SysConfigController.save()', '[{\"id\":34,\"paramKey\":\"再次新增测试\",\"paramValue\":\"这是新的再次新增测试\",\"remark\":\"123345\",\"jobStatus\":0}]', 66, '0:0:0:0:0:0:0:1', '2020-04-22 15:09:35');
INSERT INTO `sys_log` VALUES (119, 'admin', '保存配置', 'io.renren.modules.sys.controller.SysConfigController.save()', '[{\"id\":39,\"paramKey\":\"任务\",\"paramValue\":\"123\",\"remark\":\"123\",\"jobStatus\":0}]', 5, '0:0:0:0:0:0:0:1', '2020-04-22 15:15:41');
INSERT INTO `sys_log` VALUES (124, 'admin', '删除用户', 'io.renren.modules.sys.controller.SysUserController.delete()', '[[14]]', 15, '0:0:0:0:0:0:0:1', '2020-04-22 15:19:13');
INSERT INTO `sys_log` VALUES (129, 'admin', '删除角色', 'io.renren.modules.sys.controller.SysRoleController.delete()', '[[14]]', 55, '0:0:0:0:0:0:0:1', '2020-04-22 15:19:20');
INSERT INTO `sys_log` VALUES (134, 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":19,\"roleName\":\"user\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[27,-666666,1],\"createTime\":\"Apr 22, 2020 3:19:41 PM\"}]', 92, '0:0:0:0:0:0:0:1', '2020-04-22 15:19:41');
INSERT INTO `sys_log` VALUES (139, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":19,\"username\":\"user\",\"password\":\"b08443fda4fd752ab54512079fbc0904c1f5cc4fab32452bb7e91bac860eaba0\",\"salt\":\"PKt3cgxwxYwOtfEJoN6f\",\"email\":\"user@qq.com\",\"mobile\":\"12345632455\",\"status\":1,\"roleIdList\":[19],\"createUserId\":1,\"createTime\":\"Apr 22, 2020 3:20:29 PM\"}]', 60, '0:0:0:0:0:0:0:1', '2020-04-22 15:20:30');
INSERT INTO `sys_log` VALUES (144, 'user', '保存配置', 'io.renren.modules.sys.controller.SysConfigController.save()', '[{\"id\":44,\"paramKey\":\"user\",\"paramValue\":\"user增加的任务\",\"remark\":\"123\",\"jobStatus\":0}]', 4, '0:0:0:0:0:0:0:1', '2020-04-22 15:21:31');
INSERT INTO `sys_log` VALUES (149, 'admin', '保存配置', 'io.renren.modules.sys.controller.SysConfigController.save()', '[{\"id\":49,\"paramKey\":\"管理员修改\",\"paramValue\":\"这一个管理员修改的测试\",\"remark\":\"123\",\"jobStatus\":0}]', 40, '0:0:0:0:0:0:0:1', '2020-04-22 15:53:48');
INSERT INTO `sys_log` VALUES (154, 'admin', '删除配置', 'io.renren.modules.sys.controller.SysConfigController.delete()', '[[49]]', 14, '0:0:0:0:0:0:0:1', '2020-04-22 15:54:19');
INSERT INTO `sys_log` VALUES (159, 'admin', '保存配置', 'io.renren.modules.sys.controller.SysConfigController.save()', '[{\"id\":54,\"paramKey\":\"4\",\"paramValue\":\"342\",\"remark\":\"34\",\"jobStatus\":0}]', 8, '0:0:0:0:0:0:0:1', '2020-04-22 15:59:50');
INSERT INTO `sys_log` VALUES (164, 'admin', '保存配置', 'io.renren.modules.sys.controller.SysConfigController.save()', '[{\"id\":59,\"paramKey\":\"1231\",\"paramValue\":\"324\",\"remark\":\"234\",\"jobStatus\":0}]', 17, '0:0:0:0:0:0:0:1', '2020-04-22 16:00:01');
INSERT INTO `sys_log` VALUES (169, 'admin', '保存配置', 'io.renren.modules.sys.controller.SysConfigController.save()', '[{\"id\":64,\"paramKey\":\"423\",\"paramValue\":\"234\",\"remark\":\"234\",\"jobStatus\":0}]', 18, '0:0:0:0:0:0:0:1', '2020-04-22 16:00:09');
INSERT INTO `sys_log` VALUES (174, 'admin', '保存配置', 'io.renren.modules.sys.controller.SysConfigController.save()', '[{\"id\":69,\"paramKey\":\"234\",\"paramValue\":\"243\",\"remark\":\"42\",\"jobStatus\":0}]', 6, '0:0:0:0:0:0:0:1', '2020-04-22 16:00:16');
INSERT INTO `sys_log` VALUES (179, 'admin', '保存配置', 'io.renren.modules.sys.controller.SysConfigController.save()', '[{\"id\":79,\"paramKey\":\"345\",\"paramValue\":\"42\",\"remark\":\"4234\",\"jobStatus\":0}]', 4, '0:0:0:0:0:0:0:1', '2020-04-22 16:00:31');
INSERT INTO `sys_log` VALUES (184, 'admin', '保存配置', 'io.renren.modules.sys.controller.SysConfigController.save()', '[{\"id\":84,\"paramKey\":\"4352\",\"paramValue\":\"23534\",\"remark\":\"435\",\"jobStatus\":0}]', 4, '0:0:0:0:0:0:0:1', '2020-04-22 16:00:42');
INSERT INTO `sys_log` VALUES (189, 'admin', '删除配置', 'io.renren.modules.sys.controller.SysConfigController.delete()', '[[79]]', 10, '0:0:0:0:0:0:0:1', '2020-04-22 16:01:14');
INSERT INTO `sys_log` VALUES (194, 'admin', '删除配置', 'io.renren.modules.sys.controller.SysConfigController.delete()', '[[84]]', 30, '0:0:0:0:0:0:0:1', '2020-04-22 16:01:18');
INSERT INTO `sys_log` VALUES (199, 'admin', '删除配置', 'io.renren.modules.sys.controller.SysConfigController.delete()', '[[69]]', 10, '0:0:0:0:0:0:0:1', '2020-04-22 16:01:22');
INSERT INTO `sys_log` VALUES (204, 'admin', '删除配置', 'io.renren.modules.sys.controller.SysConfigController.delete()', '[[64]]', 56, '0:0:0:0:0:0:0:1', '2020-04-22 16:01:25');
INSERT INTO `sys_log` VALUES (209, 'admin', '删除配置', 'io.renren.modules.sys.controller.SysConfigController.delete()', '[[59]]', 27, '0:0:0:0:0:0:0:1', '2020-04-22 16:01:32');
INSERT INTO `sys_log` VALUES (214, 'admin', '删除配置', 'io.renren.modules.sys.controller.SysConfigController.delete()', '[[54]]', 8, '0:0:0:0:0:0:0:1', '2020-04-22 16:01:35');
INSERT INTO `sys_log` VALUES (219, 'admin', '保存配置', 'io.renren.modules.sys.controller.SysConfigController.save()', '[{\"id\":89,\"paramKey\":\"123\",\"paramValue\":\"123\",\"remark\":\"123\",\"jobStatus\":0}]', 4, '0:0:0:0:0:0:0:1', '2020-04-22 16:02:01');
INSERT INTO `sys_log` VALUES (224, 'admin', '保存配置', 'io.renren.modules.sys.controller.SysConfigController.save()', '[{\"id\":94,\"paramKey\":\"345\",\"paramValue\":\"345\",\"remark\":\"345\",\"jobStatus\":0}]', 5, '0:0:0:0:0:0:0:1', '2020-04-22 16:02:49');
INSERT INTO `sys_log` VALUES (229, 'admin', '删除配置', 'io.renren.modules.sys.controller.SysConfigController.delete()', '[[89,94]]', 11, '0:0:0:0:0:0:0:1', '2020-04-22 16:02:55');
INSERT INTO `sys_log` VALUES (234, 'admin', '删除配置', 'io.renren.modules.sys.controller.SysConfigController.delete()', '[[]]', 3, '0:0:0:0:0:0:0:1', '2020-04-22 16:21:06');
INSERT INTO `sys_log` VALUES (239, 'admin', '删除配置', 'io.renren.modules.sys.controller.SysConfigController.delete()', '[[39]]', 34, '0:0:0:0:0:0:0:1', '2020-04-22 16:22:34');
INSERT INTO `sys_log` VALUES (244, 'admin', '保存配置', 'io.renren.modules.sys.controller.SysConfigController.save()', '[{\"id\":99,\"paramKey\":\"一个测试\",\"paramValue\":\"一个测试新增\",\"remark\":\"567\",\"jobStatus\":0}]', 14, '0:0:0:0:0:0:0:1', '2020-04-22 16:22:59');
INSERT INTO `sys_log` VALUES (249, 'admin', '删除配置', 'io.renren.modules.sys.controller.SysConfigController.delete()', '[[99]]', 12, '0:0:0:0:0:0:0:1', '2020-04-22 16:24:29');
INSERT INTO `sys_log` VALUES (254, 'admin', '保存配置', 'io.renren.modules.sys.controller.SysConfigController.save()', '[{\"id\":104,\"paramKey\":\"123\",\"paramValue\":\"123\",\"remark\":\"123\",\"jobStatus\":0}]', 32, '0:0:0:0:0:0:0:1', '2020-04-22 16:24:42');
INSERT INTO `sys_log` VALUES (259, 'admin', '修改配置', 'io.renren.modules.sys.controller.SysConfigController.update()', '[{\"id\":9,\"paramKey\":\"测试任务\",\"paramValue\":\"这是一个测试任务\",\"remark\":\"再次测试1\"}]', 94, '0:0:0:0:0:0:0:1', '2020-04-22 16:44:19');
INSERT INTO `sys_log` VALUES (264, 'admin', '执行配置', 'io.renren.modules.sys.controller.SysConfigController.run()', '[[104]]', 21, '0:0:0:0:0:0:0:1', '2020-04-22 17:02:25');
INSERT INTO `sys_log` VALUES (269, 'admin', '执行配置', 'io.renren.modules.sys.controller.SysConfigController.run()', '[[104]]', 4, '0:0:0:0:0:0:0:1', '2020-04-22 17:02:51');
INSERT INTO `sys_log` VALUES (274, 'admin', '执行配置', 'io.renren.modules.sys.controller.SysConfigController.run()', '[[104]]', 39102, '0:0:0:0:0:0:0:1', '2020-04-22 17:04:47');
INSERT INTO `sys_log` VALUES (279, 'admin', '执行配置', 'io.renren.modules.sys.controller.SysConfigController.run()', '[[104]]', 96, '0:0:0:0:0:0:0:1', '2020-04-22 17:05:06');
INSERT INTO `sys_log` VALUES (284, 'admin', '恢复配置', 'io.renren.modules.sys.controller.SysConfigController.resume()', '[[104]]', 30, '0:0:0:0:0:0:0:1', '2020-04-22 17:13:49');
INSERT INTO `sys_log` VALUES (289, 'admin', '恢复配置', 'io.renren.modules.sys.controller.SysConfigController.resume()', '[[24]]', 8, '0:0:0:0:0:0:0:1', '2020-04-23 13:49:50');
INSERT INTO `sys_log` VALUES (294, 'admin', '执行配置', 'io.renren.modules.sys.controller.SysConfigController.run()', '[[24]]', 44, '0:0:0:0:0:0:0:1', '2020-04-23 13:49:55');
INSERT INTO `sys_log` VALUES (299, 'admin', '执行配置', 'io.renren.modules.sys.controller.SysConfigController.run()', '[[44]]', 79, '0:0:0:0:0:0:0:1', '2020-04-23 14:37:36');
INSERT INTO `sys_log` VALUES (304, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":34,\"parentId\":0,\"name\":\"秒杀测试模块\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"shoucangfill\",\"orderNum\":0}]', 8, '0:0:0:0:0:0:0:1', '2020-04-23 14:43:33');
INSERT INTO `sys_log` VALUES (309, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":39,\"parentId\":34,\"name\":\"秒杀测试\",\"url\":\"kill/seckill\",\"perms\":\"\",\"type\":1,\"icon\":\"shoucang\",\"orderNum\":0}]', 6, '0:0:0:0:0:0:0:1', '2020-04-23 14:47:19');
INSERT INTO `sys_log` VALUES (314, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":44,\"parentId\":39,\"name\":\"新增\",\"url\":\"\",\"perms\":\"\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', 14, '0:0:0:0:0:0:0:1', '2020-04-23 15:58:34');
INSERT INTO `sys_log` VALUES (319, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":39,\"parentId\":34,\"name\":\"秒杀发布\",\"url\":\"kill/seckill\",\"perms\":\"\",\"type\":1,\"icon\":\"shoucang\",\"orderNum\":0}]', 11, '0:0:0:0:0:0:0:1', '2020-04-23 16:02:39');
INSERT INTO `sys_log` VALUES (324, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":49,\"parentId\":34,\"name\":\"秒杀活动\",\"url\":\"kill/activity\",\"perms\":\"\",\"type\":1,\"icon\":\"xiangqufill\",\"orderNum\":0}]', 18, '0:0:0:0:0:0:0:1', '2020-04-23 16:04:22');
INSERT INTO `sys_log` VALUES (329, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":54,\"parentId\":39,\"name\":\"修改\",\"url\":\"\",\"perms\":\"kill:seckill:update\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', 17, '0:0:0:0:0:0:0:1', '2020-04-23 20:03:17');
INSERT INTO `sys_log` VALUES (334, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":59,\"parentId\":39,\"name\":\"删除\",\"url\":\"\",\"perms\":\"kill:seckill:delete\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', 23, '0:0:0:0:0:0:0:1', '2020-04-23 20:03:48');
INSERT INTO `sys_log` VALUES (339, 'admin', '保存配置', 'io.renren.modules.sys.controller.SysConfigController.save()', '[{\"id\":109,\"paramKey\":\"测试redis\",\"paramValue\":\"测试redis\",\"remark\":\"123\",\"jobStatus\":0}]', 75, '0:0:0:0:0:0:0:1', '2020-04-24 13:52:53');
INSERT INTO `sys_log` VALUES (344, 'admin', '保存配置', 'io.renren.modules.sys.controller.SysConfigController.save()', '[{\"id\":114,\"paramKey\":\"再次测试redis\",\"paramValue\":\"再次测试redis\",\"remark\":\"再次测试redis\",\"jobStatus\":0}]', 17590, '0:0:0:0:0:0:0:1', '2020-04-24 13:53:52');
INSERT INTO `sys_log` VALUES (349, 'admin', '删除配置', 'io.renren.modules.sys.controller.SysConfigController.delete()', '[[124]]', 1643, '192.168.238.129', '2020-04-10 14:37:39');
INSERT INTO `sys_log` VALUES (354, 'admin', '保存配置', 'io.renren.modules.sys.controller.SysConfigController.save()', '[{\"id\":134,\"paramKey\":\"redis\",\"paramValue\":\"redis\",\"remark\":\"redis\",\"jobStatus\":0}]', 68, '192.168.238.129', '2020-04-10 14:37:56');
INSERT INTO `sys_log` VALUES (359, 'admin', '修改密码', 'io.renren.modules.sys.controller.SysUserController.password()', '[{\"password\":\"admin\",\"newPassword\":\"root\"}]', 17, '0:0:0:0:0:0:0:1', '2020-04-26 10:59:41');
INSERT INTO `sys_log` VALUES (364, 'admin', '修改密码', 'io.renren.modules.sys.controller.SysUserController.password()', '[{\"password\":\"admin\",\"newPassword\":\"root\"}]', 3, '0:0:0:0:0:0:0:1', '2020-04-26 10:59:48');
INSERT INTO `sys_log` VALUES (369, 'admin', '删除秒杀结果', 'io.renren.modules.generator.controller.KillResultController.delete()', '[[1124]]', 18, '0:0:0:0:0:0:0:1', '2020-04-28 16:00:45');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '业务测试模块', NULL, NULL, 0, 'system', 0);
INSERT INTO `sys_menu` VALUES (2, 1, '管理员列表', 'sys/user', NULL, 1, 'admin', 1);
INSERT INTO `sys_menu` VALUES (3, 1, '角色管理', 'sys/role', NULL, 1, 'role', 2);
INSERT INTO `sys_menu` VALUES (4, 1, '菜单管理', 'sys/menu', NULL, 1, 'menu', 3);
INSERT INTO `sys_menu` VALUES (6, 1, '执行任务', 'job/schedule', NULL, 1, 'job', 5);
INSERT INTO `sys_menu` VALUES (7, 6, '查看', NULL, 'sys:schedule:list,sys:schedule:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (8, 6, '新增', NULL, 'sys:schedule:save', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (9, 6, '修改', NULL, 'sys:schedule:update', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (10, 6, '删除', NULL, 'sys:schedule:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (11, 6, '暂停', NULL, 'sys:schedule:pause', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (12, 6, '恢复', NULL, 'sys:config:resume', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (13, 6, '立即执行', NULL, 'sys:config:run', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (14, 6, '日志列表', NULL, 'sys:schedule:log', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (15, 2, '查看', NULL, 'sys:user:list,sys:user:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (16, 2, '新增', NULL, 'sys:user:save,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (17, 2, '修改', NULL, 'sys:user:update,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (18, 2, '删除', NULL, 'sys:user:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (19, 3, '查看', NULL, 'sys:role:list,sys:role:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (20, 3, '新增', NULL, 'sys:role:save,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (21, 3, '修改', NULL, 'sys:role:update,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (22, 3, '删除', NULL, 'sys:role:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (23, 4, '查看', NULL, 'sys:menu:list,sys:menu:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (24, 4, '新增', NULL, 'sys:menu:save,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (25, 4, '修改', NULL, 'sys:menu:update,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (26, 4, '删除', NULL, 'sys:menu:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (27, 1, '任务管理', 'sys/config', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', 1, 'config', 6);
INSERT INTO `sys_menu` VALUES (34, 0, '秒杀测试模块', '', '', 0, 'shoucangfill', 0);
INSERT INTO `sys_menu` VALUES (39, 34, '秒杀发布', 'kill/seckill', 'kill:seckill:list,kill:seckill:save,kill:seckill:update,kill:seckill:delete,kill:seckill:info,kill:seckill:run', 1, 'shoucang', 0);
INSERT INTO `sys_menu` VALUES (44, 39, '新增', '', 'kill:seckill:save', 2, '', 0);
INSERT INTO `sys_menu` VALUES (49, 34, '秒杀活动', 'kill/activity', 'kill:activity:list,kill:activity:add,kill:activity:resultList,kill:result:finish,kill:result:delete', 1, 'xiangqufill', 0);
INSERT INTO `sys_menu` VALUES (54, 39, '修改', '', 'kill:seckill:update', 2, '', 0);
INSERT INTO `sys_menu` VALUES (59, 39, '删除', '', 'kill:seckill:delete', 2, '', 0);

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件上传' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oss
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (9, 'root', '', 1, '2020-04-09 21:43:59');
INSERT INTO `sys_role` VALUES (19, 'user', '', 1, '2020-04-22 15:19:41');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NULL DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 559 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色与菜单对应关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (389, 9, 1);
INSERT INTO `sys_role_menu` VALUES (394, 9, 2);
INSERT INTO `sys_role_menu` VALUES (399, 9, 15);
INSERT INTO `sys_role_menu` VALUES (404, 9, 16);
INSERT INTO `sys_role_menu` VALUES (409, 9, 17);
INSERT INTO `sys_role_menu` VALUES (414, 9, 18);
INSERT INTO `sys_role_menu` VALUES (419, 9, 3);
INSERT INTO `sys_role_menu` VALUES (424, 9, 19);
INSERT INTO `sys_role_menu` VALUES (429, 9, 20);
INSERT INTO `sys_role_menu` VALUES (434, 9, 21);
INSERT INTO `sys_role_menu` VALUES (439, 9, 22);
INSERT INTO `sys_role_menu` VALUES (444, 9, 4);
INSERT INTO `sys_role_menu` VALUES (449, 9, 23);
INSERT INTO `sys_role_menu` VALUES (454, 9, 24);
INSERT INTO `sys_role_menu` VALUES (459, 9, 25);
INSERT INTO `sys_role_menu` VALUES (464, 9, 26);
INSERT INTO `sys_role_menu` VALUES (469, 9, 6);
INSERT INTO `sys_role_menu` VALUES (474, 9, 7);
INSERT INTO `sys_role_menu` VALUES (479, 9, 8);
INSERT INTO `sys_role_menu` VALUES (484, 9, 9);
INSERT INTO `sys_role_menu` VALUES (489, 9, 10);
INSERT INTO `sys_role_menu` VALUES (494, 9, 11);
INSERT INTO `sys_role_menu` VALUES (499, 9, 12);
INSERT INTO `sys_role_menu` VALUES (504, 9, 13);
INSERT INTO `sys_role_menu` VALUES (509, 9, 14);
INSERT INTO `sys_role_menu` VALUES (514, 9, 27);
INSERT INTO `sys_role_menu` VALUES (519, 9, 29);
INSERT INTO `sys_role_menu` VALUES (524, 9, -666666);
INSERT INTO `sys_role_menu` VALUES (544, 19, 27);
INSERT INTO `sys_role_menu` VALUES (549, 19, -666666);
INSERT INTO `sys_role_menu` VALUES (554, 19, 1);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '盐',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '5bae455e9b8e7e85f1d9b360f1782506fe0093c15f72a91e7ca7a72e02512bea', 'YzcmCZNvbXocrsz9dm8e', 'root@admin.com', '12345678901', 1, 1, '2020-04-09 21:44:32');
INSERT INTO `sys_user` VALUES (9, 'root', '2bb0b76371ae34874b515ee186c4e2abb41acd4c03895fbfe77eb28dd2ad807d', 'NFK0Mu2MwuVFolQTkSux', 'root@root.com', '12312356734', 1, 1, '2020-04-09 00:02:32');
INSERT INTO `sys_user` VALUES (19, 'user', 'b08443fda4fd752ab54512079fbc0904c1f5cc4fab32452bb7e91bac860eaba0', 'PKt3cgxwxYwOtfEJoN6f', 'user@qq.com', '12345632455', 1, 1, '2020-04-22 15:20:30');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与角色对应关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (4, 9, 9);
INSERT INTO `sys_user_role` VALUES (14, 19, 19);

-- ----------------------------
-- Table structure for sys_user_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token`  (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'token',
  `expire_time` datetime(0) NULL DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `token`(`token`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统用户Token' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_token
-- ----------------------------
INSERT INTO `sys_user_token` VALUES (1, 'db218b9712996767db0ad7fb393f7a06', '2020-04-29 02:04:55', '2020-04-28 14:04:55');
INSERT INTO `sys_user_token` VALUES (4, '5a910ff65f9f59561e1c9eaebbb2b35a', '2020-04-09 23:55:43', '2020-04-09 11:55:43');
INSERT INTO `sys_user_token` VALUES (9, 'bb1cdd42e5a8012ed28731e79282db46', '2020-04-23 03:23:34', '2020-04-22 15:23:34');
INSERT INTO `sys_user_token` VALUES (14, '43fd4089329a57ff6f13c9e2045a98c3', '2020-04-10 00:22:24', '2020-04-09 12:22:24');
INSERT INTO `sys_user_token` VALUES (19, '02140cbd129ae484e1d72e5b12e62c56', '2020-04-23 03:21:04', '2020-04-22 15:21:04');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (4, 'mark', '13612345678', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2017-03-23 22:37:41');

SET FOREIGN_KEY_CHECKS = 1;
