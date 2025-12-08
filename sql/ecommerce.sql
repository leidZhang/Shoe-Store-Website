/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : localhost:3306
 Source Schema         : ecommerce

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 19/12/2023 03:54:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
INSERT INTO `auth_group` VALUES (2, 'administrator');
INSERT INTO `auth_group` VALUES (1, 'customer');

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------
INSERT INTO `auth_group_permissions` VALUES (43, 2, 13);
INSERT INTO `auth_group_permissions` VALUES (44, 2, 14);
INSERT INTO `auth_group_permissions` VALUES (1, 2, 16);
INSERT INTO `auth_group_permissions` VALUES (2, 2, 31);
INSERT INTO `auth_group_permissions` VALUES (3, 2, 32);
INSERT INTO `auth_group_permissions` VALUES (4, 2, 33);
INSERT INTO `auth_group_permissions` VALUES (5, 2, 34);
INSERT INTO `auth_group_permissions` VALUES (6, 2, 35);
INSERT INTO `auth_group_permissions` VALUES (7, 2, 36);
INSERT INTO `auth_group_permissions` VALUES (8, 2, 37);
INSERT INTO `auth_group_permissions` VALUES (9, 2, 38);
INSERT INTO `auth_group_permissions` VALUES (10, 2, 39);
INSERT INTO `auth_group_permissions` VALUES (11, 2, 40);
INSERT INTO `auth_group_permissions` VALUES (12, 2, 45);
INSERT INTO `auth_group_permissions` VALUES (13, 2, 46);
INSERT INTO `auth_group_permissions` VALUES (14, 2, 47);
INSERT INTO `auth_group_permissions` VALUES (15, 2, 48);
INSERT INTO `auth_group_permissions` VALUES (16, 2, 49);
INSERT INTO `auth_group_permissions` VALUES (17, 2, 50);
INSERT INTO `auth_group_permissions` VALUES (18, 2, 51);
INSERT INTO `auth_group_permissions` VALUES (19, 2, 52);
INSERT INTO `auth_group_permissions` VALUES (20, 2, 54);
INSERT INTO `auth_group_permissions` VALUES (21, 2, 56);
INSERT INTO `auth_group_permissions` VALUES (45, 2, 59);
INSERT INTO `auth_group_permissions` VALUES (22, 2, 60);
INSERT INTO `auth_group_permissions` VALUES (23, 2, 64);
INSERT INTO `auth_group_permissions` VALUES (24, 2, 68);
INSERT INTO `auth_group_permissions` VALUES (25, 2, 69);
INSERT INTO `auth_group_permissions` VALUES (26, 2, 70);
INSERT INTO `auth_group_permissions` VALUES (27, 2, 71);
INSERT INTO `auth_group_permissions` VALUES (28, 2, 72);
INSERT INTO `auth_group_permissions` VALUES (29, 2, 73);
INSERT INTO `auth_group_permissions` VALUES (30, 2, 74);
INSERT INTO `auth_group_permissions` VALUES (31, 2, 75);
INSERT INTO `auth_group_permissions` VALUES (32, 2, 76);
INSERT INTO `auth_group_permissions` VALUES (33, 2, 77);
INSERT INTO `auth_group_permissions` VALUES (34, 2, 78);
INSERT INTO `auth_group_permissions` VALUES (35, 2, 79);
INSERT INTO `auth_group_permissions` VALUES (36, 2, 80);
INSERT INTO `auth_group_permissions` VALUES (37, 2, 81);
INSERT INTO `auth_group_permissions` VALUES (38, 2, 82);
INSERT INTO `auth_group_permissions` VALUES (39, 2, 83);
INSERT INTO `auth_group_permissions` VALUES (40, 2, 84);
INSERT INTO `auth_group_permissions` VALUES (41, 2, 86);
INSERT INTO `auth_group_permissions` VALUES (42, 2, 88);

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id` ASC, `codename` ASC) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 89 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add Token', 7, 'add_token');
INSERT INTO `auth_permission` VALUES (26, 'Can change Token', 7, 'change_token');
INSERT INTO `auth_permission` VALUES (27, 'Can delete Token', 7, 'delete_token');
INSERT INTO `auth_permission` VALUES (28, 'Can view Token', 7, 'view_token');
INSERT INTO `auth_permission` VALUES (29, 'Can add token', 8, 'add_tokenproxy');
INSERT INTO `auth_permission` VALUES (30, 'Can change token', 8, 'change_tokenproxy');
INSERT INTO `auth_permission` VALUES (31, 'Can delete token', 8, 'delete_tokenproxy');
INSERT INTO `auth_permission` VALUES (32, 'Can view token', 8, 'view_tokenproxy');
INSERT INTO `auth_permission` VALUES (33, 'Can add brand', 9, 'add_brand');
INSERT INTO `auth_permission` VALUES (34, 'Can change brand', 9, 'change_brand');
INSERT INTO `auth_permission` VALUES (35, 'Can delete brand', 9, 'delete_brand');
INSERT INTO `auth_permission` VALUES (36, 'Can view brand', 9, 'view_brand');
INSERT INTO `auth_permission` VALUES (37, 'Can add category', 10, 'add_category');
INSERT INTO `auth_permission` VALUES (38, 'Can change category', 10, 'change_category');
INSERT INTO `auth_permission` VALUES (39, 'Can delete category', 10, 'delete_category');
INSERT INTO `auth_permission` VALUES (40, 'Can view category', 10, 'view_category');
INSERT INTO `auth_permission` VALUES (41, 'Can add administrator', 11, 'add_administrator');
INSERT INTO `auth_permission` VALUES (42, 'Can change administrator', 11, 'change_administrator');
INSERT INTO `auth_permission` VALUES (43, 'Can delete administrator', 11, 'delete_administrator');
INSERT INTO `auth_permission` VALUES (44, 'Can view administrator', 11, 'view_administrator');
INSERT INTO `auth_permission` VALUES (45, 'Can add customer', 12, 'add_customer');
INSERT INTO `auth_permission` VALUES (46, 'Can change customer', 12, 'change_customer');
INSERT INTO `auth_permission` VALUES (47, 'Can delete customer', 12, 'delete_customer');
INSERT INTO `auth_permission` VALUES (48, 'Can view customer', 12, 'view_customer');
INSERT INTO `auth_permission` VALUES (49, 'Can add product', 13, 'add_product');
INSERT INTO `auth_permission` VALUES (50, 'Can change product', 13, 'change_product');
INSERT INTO `auth_permission` VALUES (51, 'Can delete product', 13, 'delete_product');
INSERT INTO `auth_permission` VALUES (52, 'Can view product', 13, 'view_product');
INSERT INTO `auth_permission` VALUES (53, 'Can add order', 14, 'add_order');
INSERT INTO `auth_permission` VALUES (54, 'Can change order', 14, 'change_order');
INSERT INTO `auth_permission` VALUES (55, 'Can delete order', 14, 'delete_order');
INSERT INTO `auth_permission` VALUES (56, 'Can view order', 14, 'view_order');
INSERT INTO `auth_permission` VALUES (57, 'Can add order item', 15, 'add_orderitem');
INSERT INTO `auth_permission` VALUES (58, 'Can change order item', 15, 'change_orderitem');
INSERT INTO `auth_permission` VALUES (59, 'Can delete order item', 15, 'delete_orderitem');
INSERT INTO `auth_permission` VALUES (60, 'Can view order item', 15, 'view_orderitem');
INSERT INTO `auth_permission` VALUES (61, 'Can add cart', 16, 'add_cart');
INSERT INTO `auth_permission` VALUES (62, 'Can change cart', 16, 'change_cart');
INSERT INTO `auth_permission` VALUES (63, 'Can delete cart', 16, 'delete_cart');
INSERT INTO `auth_permission` VALUES (64, 'Can view cart', 16, 'view_cart');
INSERT INTO `auth_permission` VALUES (65, 'Can add cart item', 17, 'add_cartitem');
INSERT INTO `auth_permission` VALUES (66, 'Can change cart item', 17, 'change_cartitem');
INSERT INTO `auth_permission` VALUES (67, 'Can delete cart item', 17, 'delete_cartitem');
INSERT INTO `auth_permission` VALUES (68, 'Can view cart item', 17, 'view_cartitem');
INSERT INTO `auth_permission` VALUES (69, 'Can add color', 18, 'add_color');
INSERT INTO `auth_permission` VALUES (70, 'Can change color', 18, 'change_color');
INSERT INTO `auth_permission` VALUES (71, 'Can delete color', 18, 'delete_color');
INSERT INTO `auth_permission` VALUES (72, 'Can view color', 18, 'view_color');
INSERT INTO `auth_permission` VALUES (73, 'Can add size', 19, 'add_size');
INSERT INTO `auth_permission` VALUES (74, 'Can change size', 19, 'change_size');
INSERT INTO `auth_permission` VALUES (75, 'Can delete size', 19, 'delete_size');
INSERT INTO `auth_permission` VALUES (76, 'Can view size', 19, 'view_size');
INSERT INTO `auth_permission` VALUES (77, 'Can add inventory', 20, 'add_inventory');
INSERT INTO `auth_permission` VALUES (78, 'Can change inventory', 20, 'change_inventory');
INSERT INTO `auth_permission` VALUES (79, 'Can delete inventory', 20, 'delete_inventory');
INSERT INTO `auth_permission` VALUES (80, 'Can view inventory', 20, 'view_inventory');
INSERT INTO `auth_permission` VALUES (81, 'Can add inventory', 21, 'add_inventory');
INSERT INTO `auth_permission` VALUES (82, 'Can change inventory', 21, 'change_inventory');
INSERT INTO `auth_permission` VALUES (83, 'Can delete inventory', 21, 'delete_inventory');
INSERT INTO `auth_permission` VALUES (84, 'Can view inventory', 21, 'view_inventory');
INSERT INTO `auth_permission` VALUES (85, 'Can add customer info', 22, 'add_customerinfo');
INSERT INTO `auth_permission` VALUES (86, 'Can change customer info', 22, 'change_customerinfo');
INSERT INTO `auth_permission` VALUES (87, 'Can delete customer info', 22, 'delete_customerinfo');
INSERT INTO `auth_permission` VALUES (88, 'Can view customer info', 22, 'view_customerinfo');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$600000$MWT40CKVcjg3ofjl2pAtTV$30W6WVAzYaSsAwM8kwnE00/cGBwLxIDiLGSyQUedicw=', '2023-12-19 01:52:45.735410', 1, 'admin', 'Ad', 'Min', 'admin@ecommerce.com', 1, 1, '2023-10-29 21:07:18.000000');
INSERT INTO `auth_user` VALUES (6, 'pbkdf2_sha256$600000$cYgyHCPyoGpEqt5T1SePwz$y4tNPrZO1n2IRvwifCIg9+kn97kL4aIwQbgLxC1VmTU=', NULL, 0, 'lima', '', '', '', 0, 1, '2023-10-29 22:25:18.000000');
INSERT INTO `auth_user` VALUES (7, 'pbkdf2_sha256$600000$aypZmBtLLD1S07n7qS9GJe$SAXM1bWrS0c9wOMa5pfYQpzNM1/+XTifuT78QBVBq3c=', '2023-10-30 16:03:34.136379', 0, 'js288c', '', '', '', 0, 1, '2023-10-29 23:18:39.000000');
INSERT INTO `auth_user` VALUES (8, 'pbkdf2_sha256$600000$L47iA561Zh3bzDjb2zflWy$dERNVp9Tz3TU6mBVmLI7Sue7LKQn0XHqMQw0G7XNrhY=', NULL, 0, 'cindy', '', '', '', 0, 1, '2023-10-30 04:34:02.379567');
INSERT INTO `auth_user` VALUES (9, 'pbkdf2_sha256$600000$JsgBQic33qDjFYveyfKB24$Iii1OOL3ZaYPIcogN2MvqpnUI8+dhYuYKK1a/XfuTnc=', NULL, 0, 'test_user', '', '', '', 0, 1, '2023-11-04 22:05:37.000000');
INSERT INTO `auth_user` VALUES (10, 'pbkdf2_sha256$600000$9ND0vm7biTc9yoKwX1nxfx$SJFnG6e9rwpluCyfkZENspLBT7WYxuGwaPC+wDQ5RD0=', '2023-11-13 05:52:07.524621', 0, 'test_user_a', '', '', '', 0, 1, '2023-11-13 04:33:57.480062');
INSERT INTO `auth_user` VALUES (11, 'pbkdf2_sha256$600000$ilUB66TU2n6wKaWktfaYsY$7PmpR/mavgkmc0Q/TVFIwXJ4FJkW9w3fsB72wQxGHk8=', '2023-11-13 18:57:33.005584', 0, 'test_user_c', '', '', '', 0, 1, '2023-11-13 05:52:28.874859');
INSERT INTO `auth_user` VALUES (15, 'pbkdf2_sha256$600000$05GU7n6r8TrDzJ1KPhqnGy$t/cPThGVn/pxz1WWR0Qn6IJPlfzU6S9I3bdAVrL+g9o=', '2023-12-17 22:39:48.468879', 0, 'Saru', 'Mike', 'Green', '', 0, 1, '2023-12-17 22:08:30.000000');
INSERT INTO `auth_user` VALUES (16, 'pbkdf2_sha256$600000$mbmi5RHRIrCYqAUgVnbLlM$VnrYJdzKbMfuGw/mtJwH1FJJfSdMaWNuyx+wCWDcrOA=', '2023-12-18 06:43:00.000000', 0, 'admin11', '', '', '', 1, 1, '2023-12-18 06:42:27.000000');
INSERT INTO `auth_user` VALUES (17, 'pbkdf2_sha256$600000$iefrc2Aq3VvNyHSMSC1xfh$Jfh8o2Z0B9MWivj/ybkSvzbG6l6pphRq4PjdRvurpDA=', NULL, 0, 'Pita', '', '', '', 0, 1, '2023-12-18 17:54:51.672233');
INSERT INTO `auth_user` VALUES (18, 'pbkdf2_sha256$600000$r3x9NvyQrbNBlfsZQ14d9T$B5doN5xajtPXDPIR7mGKy8XGl+KFwkMS73QYNuA14XA=', NULL, 0, 'Peterson', '', '', '', 0, 1, '2023-12-18 18:01:29.023954');
INSERT INTO `auth_user` VALUES (19, 'pbkdf2_sha256$600000$7xtKksSsejKl8uocaO7shW$f9AOfGqvtU1YZ8hKiCmOdE3yDh4bFnWbUZ9aZfs8Qu0=', '2023-12-18 18:04:36.622614', 0, 'Lee', '', '', '', 0, 1, '2023-12-18 18:04:35.342786');
INSERT INTO `auth_user` VALUES (20, 'pbkdf2_sha256$600000$4dpC5S9EBFQUOtTbxTJ08h$0oiM+fE397vhwy3ry6D/dZwT2B0B6bpn4XZJMDmHeaY=', '2023-12-18 19:13:13.169861', 0, 'Kim', 'La', 'Kim', '', 0, 1, '2023-12-18 19:13:12.208109');
INSERT INTO `auth_user` VALUES (21, 'pbkdf2_sha256$600000$vhtaHzSuaYIeEe5sVWIESp$M+tALQUK5qlEn2ZyyP/fNjEGOfRoIqnZhoNsusuWZvA=', '2023-12-18 19:23:17.906542', 0, 'asfd', '', '', '', 0, 1, '2023-12-18 19:23:16.881770');
INSERT INTO `auth_user` VALUES (22, 'pbkdf2_sha256$600000$KZZOzV5sIoma7ch23CuKV9$XXuRhRaB14t08xZtTth9NGCvWALrcJY2Bcxgs/x2Bgk=', '2023-12-18 19:25:22.730693', 0, 'afds', '', '', '', 0, 1, '2023-12-18 19:25:21.802654');
INSERT INTO `auth_user` VALUES (23, 'pbkdf2_sha256$600000$L7vNwDInWhg5LdcndazgGT$/JObAQM2SX89w9AaXAfyCUP5XuPNWcPCzIHdaEENB2U=', '2023-12-18 19:26:13.783530', 0, 'adf', '', '', '', 0, 1, '2023-12-18 19:26:12.789365');
INSERT INTO `auth_user` VALUES (24, 'pbkdf2_sha256$600000$ppmUsb9m479bPrii2kFzfE$o0RZDC+8FEBDTSjj3qvBjXOGwD6X38LM6IosLwJBVJE=', '2023-12-18 19:27:16.701621', 0, 'advd', 'Grs', 'Fds', '', 0, 1, '2023-12-18 19:27:15.682920');
INSERT INTO `auth_user` VALUES (25, 'pbkdf2_sha256$600000$uN91Wg0dB2h2sn3mQFWz8B$dTguGqhFDDUGHrcSNGKMXch+dOs4c8Y5QHwJzN7g+bY=', '2023-12-18 19:32:14.704170', 0, 'fdsaafsd', 'Fd', 'Ad', '', 0, 1, '2023-12-18 19:32:13.707409');
INSERT INTO `auth_user` VALUES (26, 'pbkdf2_sha256$600000$RgrX7qQiTxFrpdCM428QWP$s67zoEHKaL8/i6uMD4TreSn0D26BT/zDVYC7qfpX3fU=', NULL, 0, 'admin2', '', '', '', 1, 1, '2023-12-18 21:53:36.000000');
INSERT INTO `auth_user` VALUES (27, 'pbkdf2_sha256$600000$1VrExFFHafweerUGZPCqxM$YLatmSamYHq8ARdmw0mNs6pP5a+zDSLbApeMr6OLB84=', '2023-12-18 21:55:27.226290', 0, 'admin3', '', '', '', 1, 1, '2023-12-18 21:54:55.000000');
INSERT INTO `auth_user` VALUES (28, 'pbkdf2_sha256$600000$q9P9JLU4u1v04jdseApl3f$N3nun6Uu1xxLk58HMqPgWTU3VcJoAyCcsLCFsaiDE3A=', '2023-12-18 23:16:25.000000', 0, 'Leek', 'Adfr', 'Ds', '', 0, 1, '2023-12-18 23:10:15.000000');
INSERT INTO `auth_user` VALUES (29, 'pbkdf2_sha256$600000$kj3d4eIGzF4eV2jyb5RDu6$Lex38xYg7NiomqG6H/uUG+OKKFR4qCcML+SMddBA/5I=', '2023-12-19 00:50:09.194683', 0, 'admin4', '', '', '', 1, 1, '2023-12-18 23:38:31.000000');
INSERT INTO `auth_user` VALUES (30, 'pbkdf2_sha256$600000$76QPx7xP7RgH29Wrcm5lKR$NQSx9Z3OW5haUFQwoTAt5FgXZN2Ru+hNWaH877DsRtc=', '2023-12-19 08:14:21.288184', 0, 'Gin', 'Jkd', 'Fgd', '', 0, 1, '2023-12-19 08:14:20.225494');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id` ASC, `group_id` ASC) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id` ASC) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------
INSERT INTO `auth_user_groups` VALUES (5, 6, 1);
INSERT INTO `auth_user_groups` VALUES (4, 7, 1);
INSERT INTO `auth_user_groups` VALUES (6, 8, 1);
INSERT INTO `auth_user_groups` VALUES (7, 9, 1);
INSERT INTO `auth_user_groups` VALUES (8, 10, 1);
INSERT INTO `auth_user_groups` VALUES (9, 11, 1);
INSERT INTO `auth_user_groups` VALUES (13, 15, 1);
INSERT INTO `auth_user_groups` VALUES (14, 16, 2);
INSERT INTO `auth_user_groups` VALUES (15, 17, 1);
INSERT INTO `auth_user_groups` VALUES (16, 18, 1);
INSERT INTO `auth_user_groups` VALUES (17, 19, 1);
INSERT INTO `auth_user_groups` VALUES (18, 20, 1);
INSERT INTO `auth_user_groups` VALUES (19, 21, 1);
INSERT INTO `auth_user_groups` VALUES (20, 22, 1);
INSERT INTO `auth_user_groups` VALUES (21, 23, 1);
INSERT INTO `auth_user_groups` VALUES (22, 24, 1);
INSERT INTO `auth_user_groups` VALUES (23, 25, 1);
INSERT INTO `auth_user_groups` VALUES (24, 26, 2);
INSERT INTO `auth_user_groups` VALUES (25, 27, 2);
INSERT INTO `auth_user_groups` VALUES (26, 28, 1);
INSERT INTO `auth_user_groups` VALUES (27, 29, 2);
INSERT INTO `auth_user_groups` VALUES (28, 30, 1);

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for authtoken_token
-- ----------------------------
DROP TABLE IF EXISTS `authtoken_token`;
CREATE TABLE `authtoken_token`  (
  `key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`key`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of authtoken_token
-- ----------------------------
INSERT INTO `authtoken_token` VALUES ('8780a47844b232b59b42b6c93cdfe1f1acd99053', '2023-12-19 08:14:21.264994', 30);
INSERT INTO `authtoken_token` VALUES ('ad3a1a9f1ed58d9893b38a67e2e96f6ab3c7af11', '2023-11-13 05:52:07.362556', 10);

-- ----------------------------
-- Table structure for catalog_inventory
-- ----------------------------
DROP TABLE IF EXISTS `catalog_inventory`;
CREATE TABLE `catalog_inventory`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `stock` int NOT NULL,
  `color_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `size_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `catalog_inventory_product_id_size_id_color_id_5ef39032_uniq`(`product_id` ASC, `size_id` ASC, `color_id` ASC) USING BTREE,
  INDEX `catalog_inventory_color_id_85767061_fk_data_access_color_id`(`color_id` ASC) USING BTREE,
  INDEX `catalog_inventory_size_id_8beb3028_fk_data_access_size_id`(`size_id` ASC) USING BTREE,
  CONSTRAINT `catalog_inventory_color_id_85767061_fk_data_access_color_id` FOREIGN KEY (`color_id`) REFERENCES `data_access_color` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `catalog_inventory_product_id_6f683a4a_fk_data_access_product_id` FOREIGN KEY (`product_id`) REFERENCES `data_access_product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `catalog_inventory_size_id_8beb3028_fk_data_access_size_id` FOREIGN KEY (`size_id`) REFERENCES `data_access_size` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of catalog_inventory
-- ----------------------------
INSERT INTO `catalog_inventory` VALUES (1, 96, 1, 1, 6);
INSERT INTO `catalog_inventory` VALUES (2, 94, 3, 2, 4);
INSERT INTO `catalog_inventory` VALUES (3, 100, 3, 3, 6);
INSERT INTO `catalog_inventory` VALUES (4, 10, 2, 4, 5);
INSERT INTO `catalog_inventory` VALUES (5, 10, 3, 5, 6);
INSERT INTO `catalog_inventory` VALUES (6, 100, 2, 1, 4);
INSERT INTO `catalog_inventory` VALUES (7, 0, 1, 1, 3);
INSERT INTO `catalog_inventory` VALUES (8, 0, 3, 2, 3);
INSERT INTO `catalog_inventory` VALUES (9, 0, 2, 3, 1);
INSERT INTO `catalog_inventory` VALUES (10, 0, 2, 4, 2);
INSERT INTO `catalog_inventory` VALUES (11, 0, 2, 5, 2);
INSERT INTO `catalog_inventory` VALUES (12, 0, 3, 6, 4);
INSERT INTO `catalog_inventory` VALUES (13, 12, 2, 7, 5);
INSERT INTO `catalog_inventory` VALUES (14, 13, 3, 8, 3);
INSERT INTO `catalog_inventory` VALUES (15, 25, 1, 9, 4);
INSERT INTO `catalog_inventory` VALUES (16, 14, 3, 10, 4);
INSERT INTO `catalog_inventory` VALUES (17, 15, 2, 11, 4);
INSERT INTO `catalog_inventory` VALUES (18, 146, 3, 12, 3);
INSERT INTO `catalog_inventory` VALUES (19, 14, 3, 13, 4);
INSERT INTO `catalog_inventory` VALUES (20, 12, 3, 14, 4);
INSERT INTO `catalog_inventory` VALUES (21, 13, 2, 15, 5);
INSERT INTO `catalog_inventory` VALUES (22, 8, 2, 16, 4);
INSERT INTO `catalog_inventory` VALUES (23, 45, 2, 17, 4);
INSERT INTO `catalog_inventory` VALUES (24, 45, 3, 18, 4);
INSERT INTO `catalog_inventory` VALUES (25, 48, 2, 19, 4);
INSERT INTO `catalog_inventory` VALUES (26, 15, 3, 20, 3);
INSERT INTO `catalog_inventory` VALUES (27, 10, 2, 21, 5);
INSERT INTO `catalog_inventory` VALUES (28, 18, 2, 22, 3);
INSERT INTO `catalog_inventory` VALUES (29, 18, 3, 23, 3);
INSERT INTO `catalog_inventory` VALUES (30, 15, 3, 24, 2);
INSERT INTO `catalog_inventory` VALUES (31, 17, 2, 25, 3);

-- ----------------------------
-- Table structure for data_access_brand
-- ----------------------------
DROP TABLE IF EXISTS `data_access_brand`;
CREATE TABLE `data_access_brand`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_access_brand
-- ----------------------------
INSERT INTO `data_access_brand` VALUES (1, 'Nike');
INSERT INTO `data_access_brand` VALUES (2, 'Air Jordan');
INSERT INTO `data_access_brand` VALUES (3, 'Converse');
INSERT INTO `data_access_brand` VALUES (4, 'Umbro');
INSERT INTO `data_access_brand` VALUES (5, 'Hurley');

-- ----------------------------
-- Table structure for data_access_category
-- ----------------------------
DROP TABLE IF EXISTS `data_access_category`;
CREATE TABLE `data_access_category`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_access_category
-- ----------------------------
INSERT INTO `data_access_category` VALUES (1, 'Men');
INSERT INTO `data_access_category` VALUES (2, 'Women');
INSERT INTO `data_access_category` VALUES (3, 'Kids');

-- ----------------------------
-- Table structure for data_access_color
-- ----------------------------
DROP TABLE IF EXISTS `data_access_color`;
CREATE TABLE `data_access_color`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_access_color
-- ----------------------------
INSERT INTO `data_access_color` VALUES (1, 'Blue');
INSERT INTO `data_access_color` VALUES (2, 'Red');
INSERT INTO `data_access_color` VALUES (3, 'Green');

-- ----------------------------
-- Table structure for data_access_product
-- ----------------------------
DROP TABLE IF EXISTS `data_access_product`;
CREATE TABLE `data_access_product`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `brand_id` bigint NOT NULL,
  `category_id` bigint NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `data_access_product_brand_id_99f569a1_fk_data_access_brand_id`(`brand_id` ASC) USING BTREE,
  INDEX `data_access_product_category_id_c488bb0a_fk_data_acce`(`category_id` ASC) USING BTREE,
  CONSTRAINT `data_access_product_brand_id_99f569a1_fk_data_access_brand_id` FOREIGN KEY (`brand_id`) REFERENCES `data_access_brand` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `data_access_product_category_id_c488bb0a_fk_data_acce` FOREIGN KEY (`category_id`) REFERENCES `data_access_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_access_product
-- ----------------------------
INSERT INTO `data_access_product` VALUES (1, 'Nike Air Max 90', 'Lace up and feel the legacy. Produced at the intersection of art, music and culture, this champion running shoe helped define the ‘90s.', 130.00, 1, 1, 'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/323fe23a-d7ff-4ecc-98a1-9c9ca472a91a/air-max-90-mens-shoes-JdKKmQ.png');
INSERT INTO `data_access_product` VALUES (2, 'Nike Air Max Alpha Trainer 5', 'Finish your last rep with power and rack it with a roar that stuns the gym floor in the Nike Air Max Alpha Trainer 5.', 95.00, 1, 1, 'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/c70443ce-eea5-4c0c-a8a1-44c645165882/air-max-alpha-trainer-5-mens-workout-shoes-7LjRM6.png');
INSERT INTO `data_access_product` VALUES (3, 'Nike Air Max 1 SC', 'Premium leather adorns the wavy mudguard and Swoosh logo, while soft suede and airy underlays nod to the \'87 original. It\'s timeless for a reason.', 150.00, 1, 1, 'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/56630978-24cf-4364-a876-7eeb525a0246/air-max-1-sc-mens-shoes-bNNbQl.png');
INSERT INTO `data_access_product` VALUES (4, 'Nike Air Max 91', 'Lace up and feel the legacy. Produced at the intersection of art, music and culture, this champion running shoe helped define the ‘90s', 110.97, 1, 1, 'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/23fd664e-2962-4ea1-8389-cf98ac2dd2fc/air-max-90-mens-shoes-mVHjHQ.png');
INSERT INTO `data_access_product` VALUES (5, 'Nike Air Max 90 GORE-TEX', 'Lace up and feel the legacy. These AM90s will keep up with you on all your adventures thanks to a mix of GORE-TEX and mesh materials.', 160.00, 1, 1, 'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/2bfeb732-b691-4a21-b8fe-2a4fd3a1cbc7/air-max-90-gore-tex-mens-shoes-cZwz8t.png');
INSERT INTO `data_access_product` VALUES (6, 'Nike Air Max 1 Premium', 'The Air Max 1 \"Dirty Denim\" nods to the coveted 2003 drop that brought an aged-to-perfection look to the leader of the sneaker pack', 150.00, 1, 1, 'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/2bfeb732-b691-4a21-b8fe-2a4fd3a1cbc7/air-max-90-gore-tex-mens-shoes-cZwz8t.png');
INSERT INTO `data_access_product` VALUES (7, 'Nike Air Max Genome', 'The low-profile, full-length Air unit adds comfort to match its sleek design that\'s sure to become your new favorite Air Max. This product is made with at least 20% recycled materials by weight.', 180.00, 1, 1, 'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/8dcf0af6-4fc8-4f0d-b8b2-0f8104ede799/air-max-genome-mens-shoes-f4SHr3.png');
INSERT INTO `data_access_product` VALUES (8, 'Nike Air Max 92', 'Lace up and feel the legacy. Produced at the intersection of art, music and culture, this champion running shoe helped define the \'90s.', 140.00, 1, 1, 'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/693986ef-9586-461d-acbd-88fe9163d733/air-max-90-shoes-NKzt71.png');
INSERT INTO `data_access_product` VALUES (9, 'Nike Air Max 97', 'Push your look full speed ahead with the Nike Air Max 97. Its iconic design takes inspiration from Japanese bullet trains while fresh colors and prints add fast-paced style.', 185.00, 1, 1, 'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/1019e829-18a1-452e-80c4-bff500c2750b/air-max-97-mens-shoes-6mZC1L.png');
INSERT INTO `data_access_product` VALUES (10, 'Nike Air Max 1 Premium 2', 'Casual flair 101: Hemp canvas, check. Suede mudguard, check. Crepe outsole aesthetic, check.', 180.00, 1, 1, 'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/15030137-f3e4-44c6-8c90-1ec2f210f3bb/air-max-1-premium-2-shoes-Zl7x8b.png');
INSERT INTO `data_access_product` VALUES (11, 'Nike Air Max 1 \'86 OG G NRG', 'It sports the vintage Air Max 1 details you love: Clean lines, no-sew overlays, unmistakable colors and melds them with an outsole ready for the links. Details throughout nod to this prestigious tournament.', 180.00, 1, 1, 'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/f7a97c2b-22c3-4a3f-bfd6-7f33960fc723/air-max-1-86-og-g-nrg-mens-golf-shoes-q2mp7S.png');
INSERT INTO `data_access_product` VALUES (12, 'Nike Air Force 1 Shadow', 'Layered materials like linen-evoking textiles and synthetic leather pair with an exaggerated midsole and a pop of pastels to bring you double the style.', 170.00, 1, 2, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/0a588d2e-8d93-4937-8091-ec1270a953cf/air-force-1-shadow-shoes-FP6HDr.png');
INSERT INTO `data_access_product` VALUES (13, 'Nike Dunk Low LX NBHD', 'It\'s always a good day when a fresh Dunk drops. This one pairs smooth leather with denim for a look that\'s harmonious but never boring.', 165.00, 5, 2, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/d015d68b-1318-4c9d-bc79-9ac67c01cae4/dunk-low-lx-nbhd-shoes-FSR49l.png');
INSERT INTO `data_access_product` VALUES (14, 'Nike Dunk Low By You', 'Created for the hardwood but taken to the streets, the \'80s b-ball icon returns with a new design thought up by you', 160.00, 5, 2, 'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/faaf3507-02d4-4e48-b7d9-899b2a971988/custom-nike-dunk-low-by-you.png');
INSERT INTO `data_access_product` VALUES (15, 'Nike Dunk Low', 'Durable synthetic leather gives you a classic \'80s feel while the rubber sole offers grip and traction.', 120.00, 5, 3, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/a499ec53-6b2e-4ec9-81b3-2438f991c362/dunk-low-older-shoes-M4W67n.png');
INSERT INTO `data_access_product` VALUES (16, 'Air Jordan 1 Low SE', 'These season-ready kicks come with a bevy of wintry details: iced clear outsole, \"frozen\" textured leather overlays and that glitter-filled Swoosh inspired by a swirling snow globe. Shake up your winter look.', 110.00, 2, 1, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/dbacc76d-503e-44ba-9311-6e25ddc70372/air-jordan-1-low-se-older-shoes-nMMSgD.png');
INSERT INTO `data_access_product` VALUES (17, 'Air Jordan 2 Low SE', 'And with premium materials and Nike Air cushioning, this pair will stay in your sneaker rotation for seasons to come.', 110.00, 2, 3, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/b1ec68c1-af29-49c6-908b-50053f33ff60/air-jordan-1-low-se-older-shoes-L4whnR.png');
INSERT INTO `data_access_product` VALUES (18, 'Superfly 9 Pro', 'Zoom Air cushioning under the heel gives them bouncy comfort that lasts the entire game. Plus, they\'re laceless for a slip-on fit.', 155.00, 1, 3, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/7de822b1-2a73-4997-b1bd-ea68ccdd50cd/jr-mercurial-superfly-9-pro-mercurial-dream-speed-younger-older-fg-high-top-football-boot-GB97x6.png');
INSERT INTO `data_access_product` VALUES (19, 'KM FG/MG', 'Designed for versatility from artificial grass to real grass, they have the traction you need to run and cut on all different types of pitches.', 150.00, 1, 3, 'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/5634ed97-c418-4d45-b48f-027cfb26d481/jr-mercurial-superfly-9-pro-km-fg-mg-younger-older-multi-ground-high-top-football-boot-m91NFk.png');
INSERT INTO `data_access_product` VALUES (20, 'Nike Phantom Luna FG By You', 'Empower your design eye and open a world of on-pitch possibilities in the Phantom Luna By You.', 190.00, 1, 2, 'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/7a350330-cbf0-43d2-b51f-f22de99ce74f/custom-phantom-luna-academy-by-you.png');
INSERT INTO `data_access_product` VALUES (21, 'Superfly 9 Academy By You', 'Express your creative side with an array of vibrant, eye-catching colours that are tuned for your distinct, brash style.', 165.00, 1, 2, 'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/5b636d2d-0487-4151-97aa-7d9a150839a8/custom-mercurial-superfly-9-academy-shoes-by-you.png');
INSERT INTO `data_access_product` VALUES (22, '9 Academy Mercurial Dream', 'Loaded with a football-specific Zoom Air unit, the Academy boot helps you take your game to the next level and put the pedal down in the waning minutes of a match—when it matters most.', 145.00, 3, 2, 'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/31d522b5-cd12-4593-b2da-02ce5563d978/superfly-9-academy-mercurial-dream-speed-mg-high-top-football-boot-39fWKG.png');
INSERT INTO `data_access_product` VALUES (23, 'Nike Phantom GX Elite SE', 'Designed for those obsessed with perfecting their craft, it helps you make precision cuts when the game\'s intensity heats up, while innovative Nike Gripknit offers exceptional touch.', 375.00, 1, 1, 'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/d7a05137-69bd-4e56-825b-498f5617360c/phantom-gx-elite-se-fg-low-top-football-boot-kDqHBX.png');
INSERT INTO `data_access_product` VALUES (24, '9 Elite Mercurial Dream', 'You\'ve perfected your skill through endless training and channelled your inner fire into your craft. Now, when the weight of the match is squarely on your shoulders, rise to the occasion and deliver', 385.00, 3, 1, 'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/36a7d256-5bf5-4eb8-a73a-26c483bd7329/superfly-9-elite-mercurial-dream-speed-fg-high-top-football-boot-5bSdgn.png');
INSERT INTO `data_access_product` VALUES (25, 'Nike Phantom Luna Elite SE', 'Designed for those obsessed with perfecting their craft, it helps you make precision cuts when the game\'s intensity heats up, while innovative Nike Gripknit offers exceptional touch.', 385.00, 1, 1, 'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/4cdc966c-3c8c-469e-90b8-9373b5f59e04/phantom-luna-elite-se-fg-football-boot-5JHJmH.png');

-- ----------------------------
-- Table structure for data_access_size
-- ----------------------------
DROP TABLE IF EXISTS `data_access_size`;
CREATE TABLE `data_access_size`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_access_size
-- ----------------------------
INSERT INTO `data_access_size` VALUES (1, '5');
INSERT INTO `data_access_size` VALUES (2, '5.5');
INSERT INTO `data_access_size` VALUES (3, '6');
INSERT INTO `data_access_size` VALUES (4, '6.5');
INSERT INTO `data_access_size` VALUES (5, '7');
INSERT INTO `data_access_size` VALUES (6, '7 Wide');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int NULL DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id` ASC) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_chk_1` CHECK (`action_flag` >= 0)
) ENGINE = InnoDB AUTO_INCREMENT = 134 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2023-10-29 21:09:43.185004', '1', 'customer', 1, '[{\"added\": {}}]', 3, 1);
INSERT INTO `django_admin_log` VALUES (2, '2023-10-29 21:10:05.169603', '2', 'administrator', 1, '[{\"added\": {}}]', 3, 1);
INSERT INTO `django_admin_log` VALUES (3, '2023-10-29 21:10:57.477876', '2', 'test_customer_1', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (4, '2023-10-29 21:11:07.476354', '2', 'test_customer_1', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (5, '2023-10-29 21:11:45.711605', '3', 'test_customer_2', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (6, '2023-10-29 21:11:53.578384', '3', 'test_customer_2', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (7, '2023-10-29 21:12:18.193594', '4', 'test_admin_1', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (8, '2023-10-29 22:23:51.700338', '4', 'test_admin_1', 3, '', 4, 1);
INSERT INTO `django_admin_log` VALUES (9, '2023-10-29 22:23:52.226336', '2', 'test_customer_1', 3, '', 4, 1);
INSERT INTO `django_admin_log` VALUES (10, '2023-10-29 22:23:52.340339', '3', 'test_customer_2', 3, '', 4, 1);
INSERT INTO `django_admin_log` VALUES (11, '2023-10-29 22:24:12.454165', '5', 'lima', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (12, '2023-10-29 22:24:23.846297', '5', 'lima', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (13, '2023-10-29 22:24:54.673562', '5', 'lima', 3, '', 4, 1);
INSERT INTO `django_admin_log` VALUES (14, '2023-10-29 22:25:18.595877', '6', 'lima', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (15, '2023-10-30 04:31:18.418658', '7', 'js288c', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (16, '2023-10-30 04:31:23.893906', '6', 'lima', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (17, '2023-10-30 14:17:50.412504', '1', 'test_brand', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (18, '2023-10-30 14:17:59.481918', '1', 'test_category', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (19, '2023-10-30 14:36:02.022424', '1', 'test_product', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (20, '2023-11-04 22:05:37.376774', '9', 'test_user', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (21, '2023-11-04 22:05:43.550791', '9', 'test_user', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (22, '2023-11-25 18:05:43.823461', '7', 'js288c', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"cart item\", \"object\": \"product\"}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (23, '2023-12-10 02:03:09.389053', '1', 'Blue', 1, '[{\"added\": {}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (24, '2023-12-10 02:03:14.106511', '2', 'Red', 1, '[{\"added\": {}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (25, '2023-12-10 02:03:18.314768', '3', 'Green', 1, '[{\"added\": {}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (26, '2023-12-10 02:04:47.113241', '1', '5', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (27, '2023-12-10 02:04:51.671868', '2', '5.5', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (28, '2023-12-10 02:04:59.147377', '3', '6', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (29, '2023-12-10 02:05:06.174476', '4', '6.5', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (30, '2023-12-10 02:05:09.514635', '5', '7', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (31, '2023-12-10 02:05:16.586506', '6', '7 Wide', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (32, '2023-12-10 02:10:17.236696', '1', 'Inventory object (1)', 1, '[{\"added\": {}}]', 21, 1);
INSERT INTO `django_admin_log` VALUES (33, '2023-12-10 02:11:48.256671', '2', 'Inventory object (2)', 1, '[{\"added\": {}}]', 21, 1);
INSERT INTO `django_admin_log` VALUES (34, '2023-12-10 02:13:28.686317', '3', 'Inventory object (3)', 1, '[{\"added\": {}}]', 21, 1);
INSERT INTO `django_admin_log` VALUES (35, '2023-12-10 02:20:13.971531', '4', 'Inventory object (4)', 1, '[{\"added\": {}}]', 21, 1);
INSERT INTO `django_admin_log` VALUES (36, '2023-12-10 02:20:22.406269', '5', 'Inventory object (5)', 1, '[{\"added\": {}}]', 21, 1);
INSERT INTO `django_admin_log` VALUES (37, '2023-12-10 02:59:30.232001', '6', 'Inventory object (6)', 1, '[{\"added\": {}}]', 21, 1);
INSERT INTO `django_admin_log` VALUES (38, '2023-12-17 21:05:29.581249', '14', '14', 3, '', 14, 1);
INSERT INTO `django_admin_log` VALUES (39, '2023-12-17 21:05:34.311034', '13', '13', 3, '', 14, 1);
INSERT INTO `django_admin_log` VALUES (40, '2023-12-17 21:11:41.944379', '5', 'test_product_5-7 Wide-Green', 2, '[{\"changed\": {\"fields\": [\"Stock\"]}}]', 21, 1);
INSERT INTO `django_admin_log` VALUES (41, '2023-12-17 22:07:16.501973', '13', 'Saru', 3, '', 4, 1);
INSERT INTO `django_admin_log` VALUES (42, '2023-12-17 22:07:22.072914', '12', 'Kalita', 3, '', 4, 1);
INSERT INTO `django_admin_log` VALUES (43, '2023-12-17 22:08:24.471389', '14', 'Saru', 3, '', 4, 1);
INSERT INTO `django_admin_log` VALUES (44, '2023-12-17 22:38:15.242087', '15', 'Saru', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (45, '2023-12-17 23:13:00.000741', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (46, '2023-12-18 06:36:49.754441', '4', 'test_product_4-7-Red', 2, '[{\"changed\": {\"fields\": [\"Stock\"]}}]', 21, 1);
INSERT INTO `django_admin_log` VALUES (47, '2023-12-18 06:42:27.633929', '16', 'admin1', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (48, '2023-12-18 06:42:37.862393', '16', 'admin1', 2, '[{\"changed\": {\"fields\": [\"Staff status\", \"Groups\"]}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (49, '2023-12-18 15:00:55.845824', '6', 'test_product_6', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (50, '2023-12-18 15:02:04.615481', '7', 'test_product_7', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (51, '2023-12-18 21:52:37.138947', '2', 'administrator', 2, '[{\"changed\": {\"fields\": [\"Permissions\"]}}]', 3, 1);
INSERT INTO `django_admin_log` VALUES (52, '2023-12-18 21:53:20.012923', '2', 'administrator', 2, '[{\"changed\": {\"fields\": [\"Permissions\"]}}]', 3, 1);
INSERT INTO `django_admin_log` VALUES (53, '2023-12-18 21:53:36.669802', '26', 'admin2', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (54, '2023-12-18 21:54:16.467933', '26', 'admin2', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (55, '2023-12-18 21:54:55.552671', '27', 'admin3', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (56, '2023-12-18 21:55:03.072890', '27', 'admin3', 2, '[{\"changed\": {\"fields\": [\"Staff status\", \"Groups\"]}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (57, '2023-12-18 21:55:07.436724', '26', 'admin2', 2, '[{\"changed\": {\"fields\": [\"Staff status\"]}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (58, '2023-12-18 21:55:11.707314', '26', 'admin2', 2, '[]', 4, 1);
INSERT INTO `django_admin_log` VALUES (59, '2023-12-18 21:55:16.018647', '16', 'admin1', 2, '[]', 4, 1);
INSERT INTO `django_admin_log` VALUES (60, '2023-12-18 23:36:37.910852', '28', 'Leek', 2, '[{\"changed\": {\"fields\": [\"First name\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (61, '2023-12-18 23:36:49.963830', '16', 'admin11', 2, '[{\"changed\": {\"fields\": [\"Username\"]}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (62, '2023-12-18 23:38:31.379948', '29', 'admin4', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (63, '2023-12-18 23:38:37.579807', '29', 'admin4', 2, '[{\"changed\": {\"fields\": [\"Staff status\", \"Groups\"]}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (64, '2023-12-19 00:02:03.890413', '28', 'Leek', 2, '[{\"changed\": {\"fields\": [\"First name\"]}}]', 12, 29);
INSERT INTO `django_admin_log` VALUES (65, '2023-12-19 00:49:55.537804', '2', 'administrator', 2, '[{\"changed\": {\"fields\": [\"Permissions\"]}}]', 3, 1);
INSERT INTO `django_admin_log` VALUES (66, '2023-12-19 06:13:58.983138', '1', 'Men', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (67, '2023-12-19 06:14:07.175293', '2', 'Women', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (68, '2023-12-19 06:14:17.611454', '3', 'Kids', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (69, '2023-12-19 07:40:24.712160', '1', 'Nike', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (70, '2023-12-19 07:40:38.613362', '2', 'Air Jordan', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (71, '2023-12-19 07:40:45.692225', '3', 'Converse', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (72, '2023-12-19 07:45:28.842105', '1', 'Nike Air Max 90', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Description\", \"Price\", \"Category\", \"Brand\", \"Image\"]}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (73, '2023-12-19 07:46:00.575050', '2', 'Nike Air Max Alpha Trainer 5', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Description\", \"Price\", \"Brand\", \"Image\"]}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (74, '2023-12-19 07:46:38.805714', '3', 'Nike Air Max 1 SC', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Description\", \"Price\", \"Brand\", \"Image\"]}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (75, '2023-12-19 07:47:11.768771', '4', 'Nike Air Max 90', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Description\", \"Price\", \"Category\", \"Image\"]}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (76, '2023-12-19 07:47:33.882459', '5', 'Nike Air Max 90 GORE-TEX', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Description\", \"Price\", \"Image\"]}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (77, '2023-12-19 07:48:05.783536', '6', 'Nike Air Max 1 Premium', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Description\", \"Price\", \"Category\", \"Brand\", \"Image\"]}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (78, '2023-12-19 07:48:34.857251', '7', 'Nike Air Max Genome', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Description\", \"Price\", \"Brand\", \"Image\"]}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (79, '2023-12-19 07:49:00.661480', '8', 'Nike Air Max 90', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (80, '2023-12-19 07:49:26.911058', '9', 'Nike Air Max 97', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (81, '2023-12-19 07:49:54.397672', '10', 'Nike Air Max 1 Premium 2', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (82, '2023-12-19 07:50:20.093411', '11', 'Nike Air Max 1 \'86 OG G NRG', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (83, '2023-12-19 07:50:41.562978', '12', 'Nike Air Force 1 Shadow', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (84, '2023-12-19 07:51:18.893919', '13', 'Nike Dunk Low LX NBHD', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (85, '2023-12-19 07:51:32.500431', '12', 'Nike Air Force 1 Shadow', 2, '[{\"changed\": {\"fields\": [\"Category\"]}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (86, '2023-12-19 07:51:55.613882', '14', 'Nike Dunk Low By You', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (87, '2023-12-19 07:52:45.731943', '15', 'Nike Dunk Low', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (88, '2023-12-19 07:53:11.405573', '16', 'Air Jordan 1 Low SE', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (89, '2023-12-19 07:53:42.331661', '17', 'Air Jordan 2 Low SE', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (90, '2023-12-19 07:54:15.516276', '18', 'Superfly 9 Pro', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (91, '2023-12-19 07:57:31.555875', '19', 'KM FG/MG', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (92, '2023-12-19 07:57:56.445575', '20', 'Nike Phantom Luna FG By You', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (93, '2023-12-19 07:59:21.900556', '21', 'Superfly 9 Academy By You', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (94, '2023-12-19 07:59:49.503634', '22', '9 Academy Mercurial Dream', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (95, '2023-12-19 08:00:12.892758', '23', 'Nike Phantom GX Elite SE', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (96, '2023-12-19 08:00:35.789113', '24', '9 Elite Mercurial Dream', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (97, '2023-12-19 08:00:57.284031', '25', 'Nike Phantom Luna Elite SE', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (98, '2023-12-19 08:01:41.385269', '4', 'Umbro', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (99, '2023-12-19 08:01:48.681574', '5', 'Hurley', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (100, '2023-12-19 08:02:15.951119', '24', '9 Elite Mercurial Dream', 2, '[{\"changed\": {\"fields\": [\"Brand\"]}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (101, '2023-12-19 08:02:23.545500', '22', '9 Academy Mercurial Dream', 2, '[{\"changed\": {\"fields\": [\"Brand\"]}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (102, '2023-12-19 08:02:37.181049', '15', 'Nike Dunk Low', 2, '[{\"changed\": {\"fields\": [\"Brand\"]}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (103, '2023-12-19 08:02:41.885820', '14', 'Nike Dunk Low By You', 2, '[{\"changed\": {\"fields\": [\"Brand\"]}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (104, '2023-12-19 08:02:45.910450', '14', 'Nike Dunk Low By You', 2, '[]', 13, 1);
INSERT INTO `django_admin_log` VALUES (105, '2023-12-19 08:02:51.098196', '13', 'Nike Dunk Low LX NBHD', 2, '[{\"changed\": {\"fields\": [\"Brand\"]}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (106, '2023-12-19 08:03:18.039013', '7', 'Nike Air Max 90-6-Blue', 1, '[{\"added\": {}}]', 21, 1);
INSERT INTO `django_admin_log` VALUES (107, '2023-12-19 08:03:32.273044', '8', 'Nike Air Max Alpha Trainer 5-6-Green', 1, '[{\"added\": {}}]', 21, 1);
INSERT INTO `django_admin_log` VALUES (108, '2023-12-19 08:03:39.355735', '9', 'Nike Air Max 1 SC-5-Red', 1, '[{\"added\": {}}]', 21, 1);
INSERT INTO `django_admin_log` VALUES (109, '2023-12-19 08:03:45.170488', '10', 'Nike Air Max 90-5.5-Red', 1, '[{\"added\": {}}]', 21, 1);
INSERT INTO `django_admin_log` VALUES (110, '2023-12-19 08:03:52.014648', '11', 'Nike Air Max 90 GORE-TEX-5.5-Red', 1, '[{\"added\": {}}]', 21, 1);
INSERT INTO `django_admin_log` VALUES (111, '2023-12-19 08:04:03.812230', '12', 'Nike Air Max 1 Premium-6.5-Green', 1, '[{\"added\": {}}]', 21, 1);
INSERT INTO `django_admin_log` VALUES (112, '2023-12-19 08:04:15.454705', '13', 'Nike Air Max Genome-7-Red', 1, '[{\"added\": {}}]', 21, 1);
INSERT INTO `django_admin_log` VALUES (113, '2023-12-19 08:04:23.926717', '14', 'Nike Air Max 90-6-Green', 1, '[{\"added\": {}}]', 21, 1);
INSERT INTO `django_admin_log` VALUES (114, '2023-12-19 08:04:31.958653', '15', 'Nike Air Max 97-6.5-Blue', 1, '[{\"added\": {}}]', 21, 1);
INSERT INTO `django_admin_log` VALUES (115, '2023-12-19 08:04:39.714246', '16', 'Nike Air Max 1 Premium 2-6.5-Green', 1, '[{\"added\": {}}]', 21, 1);
INSERT INTO `django_admin_log` VALUES (116, '2023-12-19 08:04:47.008513', '17', 'Nike Air Max 1 \'86 OG G NRG-6.5-Red', 1, '[{\"added\": {}}]', 21, 1);
INSERT INTO `django_admin_log` VALUES (117, '2023-12-19 08:04:56.219913', '18', 'Nike Air Force 1 Shadow-6-Green', 1, '[{\"added\": {}}]', 21, 1);
INSERT INTO `django_admin_log` VALUES (118, '2023-12-19 08:05:04.162790', '19', 'Nike Dunk Low LX NBHD-6.5-Green', 1, '[{\"added\": {}}]', 21, 1);
INSERT INTO `django_admin_log` VALUES (119, '2023-12-19 08:05:21.738624', '20', 'Nike Dunk Low By You-6.5-Green', 1, '[{\"added\": {}}]', 21, 1);
INSERT INTO `django_admin_log` VALUES (120, '2023-12-19 08:05:34.258533', '21', 'Nike Dunk Low-7-Red', 1, '[{\"added\": {}}]', 21, 1);
INSERT INTO `django_admin_log` VALUES (121, '2023-12-19 08:05:43.936983', '22', 'Air Jordan 1 Low SE-6.5-Red', 1, '[{\"added\": {}}]', 21, 1);
INSERT INTO `django_admin_log` VALUES (122, '2023-12-19 08:05:49.869104', '23', 'Air Jordan 2 Low SE-6.5-Red', 1, '[{\"added\": {}}]', 21, 1);
INSERT INTO `django_admin_log` VALUES (123, '2023-12-19 08:05:58.955557', '24', 'Superfly 9 Pro-6.5-Green', 1, '[{\"added\": {}}]', 21, 1);
INSERT INTO `django_admin_log` VALUES (124, '2023-12-19 08:06:06.598983', '25', 'KM FG/MG-6.5-Red', 1, '[{\"added\": {}}]', 21, 1);
INSERT INTO `django_admin_log` VALUES (125, '2023-12-19 08:06:14.077864', '26', 'Nike Phantom Luna FG By You-6-Green', 1, '[{\"added\": {}}]', 21, 1);
INSERT INTO `django_admin_log` VALUES (126, '2023-12-19 08:06:25.235432', '27', 'Superfly 9 Academy By You-7-Red', 1, '[{\"added\": {}}]', 21, 1);
INSERT INTO `django_admin_log` VALUES (127, '2023-12-19 08:06:34.793590', '28', '9 Academy Mercurial Dream-6-Red', 1, '[{\"added\": {}}]', 21, 1);
INSERT INTO `django_admin_log` VALUES (128, '2023-12-19 08:06:43.100297', '29', 'Nike Phantom GX Elite SE-6-Green', 1, '[{\"added\": {}}]', 21, 1);
INSERT INTO `django_admin_log` VALUES (129, '2023-12-19 08:06:56.266138', '30', '9 Elite Mercurial Dream-5.5-Green', 1, '[{\"added\": {}}]', 21, 1);
INSERT INTO `django_admin_log` VALUES (130, '2023-12-19 08:07:13.580128', '31', 'Nike Phantom Luna Elite SE-6-Red', 1, '[{\"added\": {}}]', 21, 1);
INSERT INTO `django_admin_log` VALUES (131, '2023-12-19 08:07:26.825893', '1', 'admin', 3, '', 16, 1);
INSERT INTO `django_admin_log` VALUES (132, '2023-12-19 08:53:36.724186', '4', 'Nike Air Max 91', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (133, '2023-12-19 08:53:46.182325', '8', 'Nike Air Max 92', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 13, 1);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label` ASC, `model` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (7, 'authtoken', 'token');
INSERT INTO `django_content_type` VALUES (8, 'authtoken', 'tokenproxy');
INSERT INTO `django_content_type` VALUES (21, 'catalog', 'inventory');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (9, 'data_access', 'brand');
INSERT INTO `django_content_type` VALUES (10, 'data_access', 'category');
INSERT INTO `django_content_type` VALUES (18, 'data_access', 'color');
INSERT INTO `django_content_type` VALUES (20, 'data_access', 'inventory');
INSERT INTO `django_content_type` VALUES (13, 'data_access', 'product');
INSERT INTO `django_content_type` VALUES (19, 'data_access', 'size');
INSERT INTO `django_content_type` VALUES (11, 'identity', 'administrator');
INSERT INTO `django_content_type` VALUES (12, 'identity', 'customer');
INSERT INTO `django_content_type` VALUES (22, 'identity', 'customerinfo');
INSERT INTO `django_content_type` VALUES (14, 'ordering', 'order');
INSERT INTO `django_content_type` VALUES (15, 'ordering', 'orderitem');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (16, 'shopping_cart', 'cart');
INSERT INTO `django_content_type` VALUES (17, 'shopping_cart', 'cartitem');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2023-10-29 21:06:03.093861');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2023-10-29 21:06:06.068990');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2023-10-29 21:06:06.623821');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2023-10-29 21:06:06.662564');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2023-10-29 21:06:06.698130');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2023-10-29 21:06:07.044659');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2023-10-29 21:06:07.345578');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2023-10-29 21:06:07.427114');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2023-10-29 21:06:07.469319');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2023-10-29 21:06:07.699112');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2023-10-29 21:06:07.731619');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2023-10-29 21:06:07.762524');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2023-10-29 21:06:07.982393');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2023-10-29 21:06:08.252163');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2023-10-29 21:06:08.321783');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2023-10-29 21:06:08.362438');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0012_alter_user_first_name_max_length', '2023-10-29 21:06:08.618237');
INSERT INTO `django_migrations` VALUES (18, 'sessions', '0001_initial', '2023-10-29 21:06:08.830195');
INSERT INTO `django_migrations` VALUES (19, 'authtoken', '0001_initial', '2023-10-29 22:11:47.172795');
INSERT INTO `django_migrations` VALUES (20, 'authtoken', '0002_auto_20160226_1747', '2023-10-29 22:11:47.224235');
INSERT INTO `django_migrations` VALUES (21, 'authtoken', '0003_tokenproxy', '2023-10-29 22:11:47.249164');
INSERT INTO `django_migrations` VALUES (22, 'data_access', '0001_initial', '2023-10-30 14:13:09.085872');
INSERT INTO `django_migrations` VALUES (23, 'identity', '0001_initial', '2023-10-30 14:13:09.247704');
INSERT INTO `django_migrations` VALUES (24, 'data_access', '0002_brand_image', '2023-10-30 14:25:32.959807');
INSERT INTO `django_migrations` VALUES (25, 'data_access', '0003_product', '2023-10-30 14:34:46.209490');
INSERT INTO `django_migrations` VALUES (26, 'ordering', '0001_initial', '2023-11-04 21:29:22.970086');
INSERT INTO `django_migrations` VALUES (27, 'shopping_cart', '0001_initial', '2023-11-04 21:29:23.884596');
INSERT INTO `django_migrations` VALUES (28, 'shopping_cart', '0002_rename_items_cart_products_and_more', '2023-11-04 22:17:27.602342');
INSERT INTO `django_migrations` VALUES (29, 'ordering', '0002_rename_items_order_products_and_more', '2023-11-04 22:44:42.498651');
INSERT INTO `django_migrations` VALUES (30, 'data_access', '0004_product_inventory', '2023-11-04 23:14:02.287708');
INSERT INTO `django_migrations` VALUES (31, 'ordering', '0003_order_status', '2023-11-04 23:58:45.976459');
INSERT INTO `django_migrations` VALUES (32, 'data_access', '0005_product_image_url', '2023-11-25 23:21:15.931318');
INSERT INTO `django_migrations` VALUES (33, 'data_access', '0006_rename_image_url_product_image', '2023-11-26 00:08:16.456304');
INSERT INTO `django_migrations` VALUES (34, 'ordering', '0002_order_address_1_order_address_2_order_city_and_more', '2023-12-08 21:26:58.355338');
INSERT INTO `django_migrations` VALUES (35, 'data_access', '0002_color_size_remove_product_inventory_inventory', '2023-12-10 02:01:12.123009');
INSERT INTO `django_migrations` VALUES (36, 'data_access', '0003_rename_color_id_inventory_color_and_more', '2023-12-10 02:01:54.196665');
INSERT INTO `django_migrations` VALUES (37, 'data_access', '0004_delete_inventory', '2023-12-10 02:08:55.142318');
INSERT INTO `django_migrations` VALUES (38, 'catalog', '0001_initial', '2023-12-10 02:08:56.121673');
INSERT INTO `django_migrations` VALUES (39, 'catalog', '0002_alter_inventory_unique_together', '2023-12-10 02:13:03.859564');
INSERT INTO `django_migrations` VALUES (40, 'identity', '0002_customerinfo', '2023-12-17 21:49:25.126106');
INSERT INTO `django_migrations` VALUES (41, 'identity', '0003_remove_customerinfo_id_alter_customerinfo_customer', '2023-12-17 21:52:45.683953');
INSERT INTO `django_migrations` VALUES (42, 'identity', '0004_alter_customerinfo_address_2', '2023-12-18 01:01:25.959035');
INSERT INTO `django_migrations` VALUES (43, 'shopping_cart', '0002_alter_cart_total', '2023-12-18 01:01:26.169179');
INSERT INTO `django_migrations` VALUES (44, 'ordering', '0002_alter_order_status', '2023-12-18 22:02:26.845814');
INSERT INTO `django_migrations` VALUES (45, 'ordering', '0003_alter_orderitem_options_alter_order_status', '2023-12-19 02:57:53.133212');
INSERT INTO `django_migrations` VALUES (46, 'data_access', '0005_remove_brand_image', '2023-12-19 07:40:20.151395');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('4qgcyovx2r3rox4czscz7v2cla4jjzwx', '.eJxVjEEOwiAQRe_C2pBC6VBduvcMZGZgpGogKe3KeHfbpAvd_vfef6uA65LD2tIcpqguyqjT70bIz1R2EB9Y7lVzLcs8kd4VfdCmbzWm1_Vw_w4ytrzVePYDgQxg2GLksUvSi2OyBg11CAnAO8vkI_eb2rMAS_JudERRHKnPF_7-OPE:1r40MW:crm3r0NmT45pN8fqQE-4FyNPzBTDIXiuP16nvQ0UnSE', '2023-12-01 15:02:28.480215');
INSERT INTO `django_session` VALUES ('7kbt2bk2nknmyjag85cakahhn99e07r5', '.eJxVjEEOwiAQRe_C2pBC6VBduvcMZGZgpGogKe3KeHfbpAvd_vfef6uA65LD2tIcpqguyqjT70bIz1R2EB9Y7lVzLcs8kd4VfdCmbzWm1_Vw_w4ytrzVePYDgQxg2GLksUvSi2OyBg11CAnAO8vkI_eb2rMAS_JudERRHKnPF_7-OPE:1qxUCR:rJd59Ee2Cw8TJc_EDSNaKK6U-d5geX0RlaFP7zk4rL8', '2023-11-13 15:29:07.696748');
INSERT INTO `django_session` VALUES ('7nlew0pqj9jvol1u1sskqmvoazbv68ru', '.eJxVjD0OwyAUg-_CXCF-HgE6ds8ZEDygpK1ACslU9e4NUoZ2sSx_tt_E-X0rbu9pdUskV8LJ5TcLHp-pDhAfvt4bxVa3dQl0VOhJO51bTK_b2f07KL6XsfZZMWvRCIHaGAYcWeJZCJVsiOCnSbLDMtBKQwZpEkcU-hCulTRAPl_Mjjbo:1qxD0V:4Z3AuRHumOYauBNaT_Y26f1VZaomOXImfDQfnq3g2xQ', '2023-11-12 21:07:39.652874');
INSERT INTO `django_session` VALUES ('anyd7ant53rf5jdlcq8ewtesigocvtk7', '.eJxVjEEOwiAQRe_C2pBC6VBduvcMZGZgpGogKe3KeHfbpAvd_vfef6uA65LD2tIcpqguyqjT70bIz1R2EB9Y7lVzLcs8kd4VfdCmbzWm1_Vw_w4ytrzVePYDgQxg2GLksUvSi2OyBg11CAnAO8vkI_eb2rMAS_JudERRHKnPF_7-OPE:1r8jxr:vjLH2JrOCR1ZZWtKdx8-01bOzxr63SY2d5vgR2tSj4Q', '2023-12-14 16:32:35.498684');
INSERT INTO `django_session` VALUES ('dubo8l7wb4do5m9ej0rpg0jq1h9cnci5', '.eJxVjEEOwiAQRe_C2pBC6VBduvcMZGZgpGogKe3KeHfbpAvd_vfef6uA65LD2tIcpqguyqjT70bIz1R2EB9Y7lVzLcs8kd4VfdCmbzWm1_Vw_w4ytrzVePYDgQxg2GLksUvSi2OyBg11CAnAO8vkI_eb2rMAS_JudERRHKnPF_7-OPE:1rFOut:-edu4ZspGoaW0MWSMjItNJnRA9XZTJ28XxVch1rGGzA', '2024-01-02 01:29:03.278264');
INSERT INTO `django_session` VALUES ('gfxpzji35fhqxqhpe69akl24d5s6s6wk', '.eJxVjEEOwiAQRe_C2pBC6VBduvcMZGZgpGogKe3KeHfbpAvd_vfef6uA65LD2tIcpqguyqjT70bIz1R2EB9Y7lVzLcs8kd4VfdCmbzWm1_Vw_w4ytrzVePYDgQxg2GLksUvSi2OyBg11CAnAO8vkI_eb2rMAS_JudERRHKnPF_7-OPE:1qzOlZ:PhGt4YP0UT-tnt2FTNBc9RPYcKDTNwfLY-QE_zuzP0s', '2023-11-18 22:05:17.577668');
INSERT INTO `django_session` VALUES ('gmyj5ak95qq1558m55nfg96vy0bcq71h', '.eJxVjEEOwiAQRe_C2pBC6VBduvcMZGZgpGogKe3KeHfbpAvd_vfef6uA65LD2tIcpqguyqjT70bIz1R2EB9Y7lVzLcs8kd4VfdCmbzWm1_Vw_w4ytrzVePYDgQxg2GLksUvSi2OyBg11CAnAO8vkI_eb2rMAS_JudERRHKnPF_7-OPE:1r3KlA:6DQ1uulptici9KOoaD8bu3Zrje1gCngyJ484zm8lzag', '2023-11-29 18:37:08.031665');
INSERT INTO `django_session` VALUES ('qkhu7c38owwhma0pytcvvmp64ga67im4', '.eJxVjD0OwyAUg-_CXCF-HgE6ds8ZEDygpK1ACslU9e4NUoZ2sSx_tt_E-X0rbu9pdUskV8LJ5TcLHp-pDhAfvt4bxVa3dQl0VOhJO51bTK_b2f07KL6XsfZZMWvRCIHaGAYcWeJZCJVsiOCnSbLDMtBKQwZpEkcU-hCulTRAPl_Mjjbo:1qxF3Y:lDPdtOHdF2W8R-4PWjRw1CfX-N8ajBDeHNCqK2j4WiI', '2023-11-12 23:18:56.906549');
INSERT INTO `django_session` VALUES ('qovrewrw9i1de7j96f44767ywbbv01ha', '.eJxVjMEOwiAQRP-FsyHFXSj16N1vIEt3kaqBpLQn47_bJj3obTLvzbxVoHXJYW0yh4nVRRmjTr9lpPEpZSf8oHKveqxlmaeod0UftOlbZXldD_fvIFPL21pYkMgx2YiDt4aSG2AAJHQevJyNT5YjYOoJtuxGQGQnmGwnfYegPl8TeDfj:1r2c7p:Ve9zbjeI90JW9HUQAdlo26Izd0MZBYrEe6tBLLDW0vg', '2023-11-27 18:57:33.070914');
INSERT INTO `django_session` VALUES ('sm25rqoehnmfpeaemrk5t52qa87721xd', '.eJxVjEEOwiAQRe_C2pBC6VBduvcMZGZgpGogKe3KeHfbpAvd_vfef6uA65LD2tIcpqguyqjT70bIz1R2EB9Y7lVzLcs8kd4VfdCmbzWm1_Vw_w4ytrzVePYDgQxg2GLksUvSi2OyBg11CAnAO8vkI_eb2rMAS_JudERRHKnPF_7-OPE:1rF7LS:AS9Uce1ux42IOxIDBIH0RJoytLi9ZcONr0CHNkFVI6k', '2024-01-01 06:43:18.282260');
INSERT INTO `django_session` VALUES ('wardq6z5t42x0zklbqrvsfwdjbf6i5rb', '.eJxVjEEOwiAQRe_C2pBC6VBduvcMZGZgpGogKe3KeHfbpAvd_vfef6uA65LD2tIcpqguyqjT70bIz1R2EB9Y7lVzLcs8kd4VfdCmbzWm1_Vw_w4ytrzVePYDgQxg2GLksUvSi2OyBg11CAnAO8vkI_eb2rMAS_JudERRHKnPF_7-OPE:1rF2ej:C9LbjlRAaW-WmnPWbxn3tH22r40uR01THpyzu4n6rBs', '2024-01-01 01:42:53.005743');
INSERT INTO `django_session` VALUES ('xfsu8qqtn8wsiy288diuhj7nqlr7yebh', '.eJxVjEEOwiAQRe_C2pBC6VBduvcMZGZgpGogKe3KeHfbpAvd_vfef6uA65LD2tIcpqguyqjT70bIz1R2EB9Y7lVzLcs8kd4VfdCmbzWm1_Vw_w4ytrzVePYDgQxg2GLksUvSi2OyBg11CAnAO8vkI_eb2rMAS_JudERRHKnPF_7-OPE:1r38YG:A6NQmuAjC8_MQqj5jYKDFE2kxkvUlc3bGli-a-Rrqd4', '2023-11-29 05:35:00.461903');

-- ----------------------------
-- Table structure for identity_customerinfo
-- ----------------------------
DROP TABLE IF EXISTS `identity_customerinfo`;
CREATE TABLE `identity_customerinfo`  (
  `phone_num` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `address_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `address_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `province` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `postal_code` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `customer_id` int NOT NULL,
  PRIMARY KEY (`customer_id`) USING BTREE,
  CONSTRAINT `identity_customerinfo_customer_id_6263a0a4_fk_auth_user_id` FOREIGN KEY (`customer_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of identity_customerinfo
-- ----------------------------
INSERT INTO `identity_customerinfo` VALUES ('4368971562', '123 Marco Cir', '', 'Toronto', 'ON', 'M3K 4Z9', 1);
INSERT INTO `identity_customerinfo` VALUES ('6432587589', '', '', '', '', '', 15);
INSERT INTO `identity_customerinfo` VALUES ('', '', '', '', '', '', 17);
INSERT INTO `identity_customerinfo` VALUES ('', '', '', '', '', '', 18);
INSERT INTO `identity_customerinfo` VALUES ('', '', '', '', '', '', 19);
INSERT INTO `identity_customerinfo` VALUES ('4896521475', '158 Nf St', '', 'AAD', 'AB', 'M5M 4X8', 20);
INSERT INTO `identity_customerinfo` VALUES ('', '', '', '', '', '', 21);
INSERT INTO `identity_customerinfo` VALUES ('', '', '', '', '', '', 22);
INSERT INTO `identity_customerinfo` VALUES ('', '', '', '', '', '', 23);
INSERT INTO `identity_customerinfo` VALUES ('4569871598', '123 Fls st', '', 'Faad', 'PE', 'M1C 9J8', 24);
INSERT INTO `identity_customerinfo` VALUES ('1598632158', '123 Yonge St', '', 'Cdfte', 'ON', 'K9F 9J8', 25);
INSERT INTO `identity_customerinfo` VALUES ('4567891598', '123 Abcde Dr', '', 'Toronto', 'ON', 'C4F 9G1', 28);
INSERT INTO `identity_customerinfo` VALUES ('1234567895', '123 Rainbow St', '', 'Tornto', 'ON', 'K9C 8C9', 30);

-- ----------------------------
-- Table structure for ordering_order
-- ----------------------------
DROP TABLE IF EXISTS `ordering_order`;
CREATE TABLE `ordering_order`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `total` decimal(6, 2) NOT NULL,
  `date` date NOT NULL,
  `customer_id` int NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `address_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `address_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `payment_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phone_num` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `postal_code` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `province` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ordering_order_customer_id_db5570b3_fk_auth_user_id`(`customer_id` ASC) USING BTREE,
  INDEX `ordering_order_date_69350568`(`date` ASC) USING BTREE,
  CONSTRAINT `ordering_order_customer_id_db5570b3_fk_auth_user_id` FOREIGN KEY (`customer_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ordering_order
-- ----------------------------
INSERT INTO `ordering_order` VALUES (22, 299.00, '2023-12-19', 30, 'processing', '123 Rainbow St', '', 'Tornto', 'Jkd', 'Fgd', 'Debit Card', '1234567895', 'K9C 8C9', 'ON');
INSERT INTO `ordering_order` VALUES (23, 523.25, '2023-12-19', 30, 'processing', '123 Rainbow St', '', 'Tornto', 'Jkd', 'Fgd', 'Debit Card', '1234567895', 'K9C 8C9', 'ON');

-- ----------------------------
-- Table structure for ordering_orderitem
-- ----------------------------
DROP TABLE IF EXISTS `ordering_orderitem`;
CREATE TABLE `ordering_orderitem`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `inventory_id` bigint NOT NULL,
  `order_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ordering_orderitem_inventory_id_452852de_fk_catalog_inventory_id`(`inventory_id` ASC) USING BTREE,
  INDEX `ordering_orderitem_order_id_050e4dc5_fk_ordering_order_id`(`order_id` ASC) USING BTREE,
  CONSTRAINT `ordering_orderitem_ibfk_1` FOREIGN KEY (`inventory_id`) REFERENCES `catalog_inventory` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ordering_orderitem_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `ordering_order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ordering_orderitem
-- ----------------------------
INSERT INTO `ordering_orderitem` VALUES (11, 2, 1, 22);
INSERT INTO `ordering_orderitem` VALUES (12, 1, 19, 23);
INSERT INTO `ordering_orderitem` VALUES (13, 1, 21, 23);
INSERT INTO `ordering_orderitem` VALUES (14, 1, 18, 23);

-- ----------------------------
-- Table structure for shopping_cart_cart
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart_cart`;
CREATE TABLE `shopping_cart_cart`  (
  `customer_id` int NOT NULL,
  `total` decimal(6, 2) NOT NULL,
  PRIMARY KEY (`customer_id`) USING BTREE,
  CONSTRAINT `shopping_cart_cart_customer_id_154999cc_fk_auth_user_id` FOREIGN KEY (`customer_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shopping_cart_cart
-- ----------------------------
INSERT INTO `shopping_cart_cart` VALUES (6, 0.00);
INSERT INTO `shopping_cart_cart` VALUES (7, 0.00);
INSERT INTO `shopping_cart_cart` VALUES (15, 0.00);
INSERT INTO `shopping_cart_cart` VALUES (17, 0.00);
INSERT INTO `shopping_cart_cart` VALUES (18, 0.00);
INSERT INTO `shopping_cart_cart` VALUES (19, 0.00);
INSERT INTO `shopping_cart_cart` VALUES (20, 0.00);
INSERT INTO `shopping_cart_cart` VALUES (21, 0.00);
INSERT INTO `shopping_cart_cart` VALUES (22, 0.00);
INSERT INTO `shopping_cart_cart` VALUES (23, 0.00);
INSERT INTO `shopping_cart_cart` VALUES (24, 0.00);
INSERT INTO `shopping_cart_cart` VALUES (25, 0.00);
INSERT INTO `shopping_cart_cart` VALUES (28, 0.00);
INSERT INTO `shopping_cart_cart` VALUES (30, 120.00);

-- ----------------------------
-- Table structure for shopping_cart_cartitem
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart_cartitem`;
CREATE TABLE `shopping_cart_cartitem`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `cart_id` int NOT NULL,
  `inventory_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `shopping_cart_cartit_cart_id_adaf8330_fk_shopping_`(`cart_id` ASC) USING BTREE,
  INDEX `shopping_cart_cartit_inventory_id_d1a64bb4_fk_catalog_i`(`inventory_id` ASC) USING BTREE,
  CONSTRAINT `shopping_cart_cartitem_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `shopping_cart_cart` (`customer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `shopping_cart_cartitem_ibfk_2` FOREIGN KEY (`inventory_id`) REFERENCES `catalog_inventory` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shopping_cart_cartitem
-- ----------------------------
INSERT INTO `shopping_cart_cartitem` VALUES (18, 1, 30, 21);

SET FOREIGN_KEY_CHECKS = 1;
