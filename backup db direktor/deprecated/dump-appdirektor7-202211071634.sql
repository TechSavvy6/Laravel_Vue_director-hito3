/*
 Navicat Premium Data Transfer

 Source Server         : new
 Source Server Type    : MySQL
 Source Server Version : 100421
 Source Host           : localhost:3306
 Source Schema         : appdirektor7

 Target Server Type    : MySQL
 Target Server Version : 100421
 File Encoding         : 65001

 Date: 22/11/2022 21:38:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ana_integrantes
-- ----------------------------
DROP TABLE IF EXISTS `ana_integrantes`;
CREATE TABLE `ana_integrantes`  (
  `codProyecto` bigint NOT NULL,
  `codAnaRes` bigint NOT NULL,
  `codEstado` int NULL DEFAULT NULL,
  `dayFechaCreacion` datetime NULL DEFAULT NULL,
  `desUsuarioCreacion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  UNIQUE INDEX `XPKAna_Integrantes`(`codProyecto`, `codAnaRes`) USING BTREE,
  UNIQUE INDEX `XIF1Ana_Integrantes`(`codProyecto`, `codAnaRes`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ana_integrantes
-- ----------------------------

-- ----------------------------
-- Table structure for anares_actividad
-- ----------------------------
DROP TABLE IF EXISTS `anares_actividad`;
CREATE TABLE `anares_actividad`  (
  `codAnaResActividad` bigint NOT NULL,
  `desActividad` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `desRestriccion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `codTipoRestriccion` int NULL DEFAULT NULL,
  `dayFechaRequerida` datetime NULL DEFAULT NULL,
  `idUsuarioResponsable` bigint NULL DEFAULT NULL,
  `desAreaResponsable` char(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `codEstadoActividad` char(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `codUsuarioSolicitante` char(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `codAnaResFase` bigint NOT NULL,
  `codAnaResFrente` bigint NOT NULL,
  `codProyecto` bigint NOT NULL,
  `codAnaRes` bigint NOT NULL,
  UNIQUE INDEX `XPKAnaRes_Actividad`(`codAnaResActividad`, `codAnaResFase`, `codAnaResFrente`, `codProyecto`, `codAnaRes`) USING BTREE,
  INDEX `XIF1AnaRes_Actividad`(`codAnaResFase`, `codAnaResFrente`, `codProyecto`, `codAnaRes`) USING BTREE,
  CONSTRAINT `anares_actividad_ibfk_1` FOREIGN KEY (`codAnaResFase`, `codAnaResFrente`, `codProyecto`, `codAnaRes`) REFERENCES `anares_fase` (`codAnaResFase`, `codAnaResFrente`, `codProyecto`, `codAnaRes`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of anares_actividad
-- ----------------------------

-- ----------------------------
-- Table structure for anares_analisisrestricciones
-- ----------------------------
DROP TABLE IF EXISTS `anares_analisisrestricciones`;
CREATE TABLE `anares_analisisrestricciones`  (
  `codProyecto` bigint NOT NULL,
  `codEstado` int NULL DEFAULT NULL,
  `dayFechaCreacion` datetime NULL DEFAULT NULL,
  `desUsuarioCreacion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `indNoRetrasados` int NULL DEFAULT NULL,
  `indRetrasados` int NULL DEFAULT NULL,
  `codAnaRes` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`codAnaRes`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of anares_analisisrestricciones
-- ----------------------------
INSERT INTO `anares_analisisrestricciones` VALUES (88, 1, '2022-11-21 13:23:39', 'John Doe, James Lilley,', 55, 40, 1);
INSERT INTO `anares_analisisrestricciones` VALUES (89, 1, '2022-11-21 13:34:41', 'john@j.com, james@j.com,', 55, 40, 2);
INSERT INTO `anares_analisisrestricciones` VALUES (91, 1, '2022-11-21 13:55:39', 'james@d.com', 55, 40, 3);
INSERT INTO `anares_analisisrestricciones` VALUES (92, 1, '2022-11-22 08:42:53', 'peter@peter.com', 55, 40, 4);

-- ----------------------------
-- Table structure for anares_fase
-- ----------------------------
DROP TABLE IF EXISTS `anares_fase`;
CREATE TABLE `anares_fase`  (
  `codAnaResFase` bigint NOT NULL,
  `desAnaResFase` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dayFechaCreacion` datetime NULL DEFAULT NULL,
  `desUsuarioCreacion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `codAnaResFrente` bigint NOT NULL,
  `codProyecto` bigint NOT NULL,
  `codAnaRes` bigint NOT NULL,
  UNIQUE INDEX `XPKAnaRes_Fase`(`codAnaResFase`, `codAnaResFrente`, `codProyecto`, `codAnaRes`) USING BTREE,
  INDEX `XIF1AnaRes_Fase`(`codAnaResFrente`, `codProyecto`, `codAnaRes`) USING BTREE,
  CONSTRAINT `anares_fase_ibfk_1` FOREIGN KEY (`codAnaResFrente`, `codProyecto`, `codAnaRes`) REFERENCES `anares_frente` (`codAnaResFrente`, `codProyecto`, `codAnaRes`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of anares_fase
-- ----------------------------

-- ----------------------------
-- Table structure for anares_frente
-- ----------------------------
DROP TABLE IF EXISTS `anares_frente`;
CREATE TABLE `anares_frente`  (
  `codAnaResFrente` bigint NOT NULL,
  `desAnaResFrente` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dayFechaCreacion` datetime NULL DEFAULT NULL,
  `desUsuarioCreacion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `codProyecto` bigint NOT NULL,
  `codAnaRes` bigint NOT NULL,
  UNIQUE INDEX `XPKAnaRes_Frente`(`codAnaResFrente`, `codProyecto`, `codAnaRes`) USING BTREE,
  INDEX `XIF1AnaRes_Frente`(`codProyecto`, `codAnaRes`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of anares_frente
-- ----------------------------

-- ----------------------------
-- Table structure for animals
-- ----------------------------
DROP TABLE IF EXISTS `animals`;
CREATE TABLE `animals`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of animals
-- ----------------------------

-- ----------------------------
-- Table structure for conf_estado
-- ----------------------------
DROP TABLE IF EXISTS `conf_estado`;
CREATE TABLE `conf_estado`  (
  `codEstado` int NOT NULL,
  `desEstado` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `desModule` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  UNIQUE INDEX `XPKConf_Estado`(`codEstado`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of conf_estado
-- ----------------------------

-- ----------------------------
-- Table structure for conf_ubigeo
-- ----------------------------
DROP TABLE IF EXISTS `conf_ubigeo`;
CREATE TABLE `conf_ubigeo`  (
  `codUbigeo` int NOT NULL,
  `desUbigeo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Departamento` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Provincia` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Distrito` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  UNIQUE INDEX `XPKConf_Ubigeo`(`codUbigeo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of conf_ubigeo
-- ----------------------------

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------

-- ----------------------------
-- Table structure for other_notificaciones
-- ----------------------------
DROP TABLE IF EXISTS `other_notificaciones`;
CREATE TABLE `other_notificaciones`  (
  `codNotificacion` int NOT NULL,
  `desNombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `desDescripción` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `desPersonalizar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  UNIQUE INDEX `XPKother_Notificaciones`(`codNotificacion`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of other_notificaciones
-- ----------------------------

-- ----------------------------
-- Table structure for other_notificaciones_usuario
-- ----------------------------
DROP TABLE IF EXISTS `other_notificaciones_usuario`;
CREATE TABLE `other_notificaciones_usuario`  (
  `id` bigint NOT NULL,
  `codNotificacion` int NOT NULL,
  `codEstado` int NULL DEFAULT NULL,
  `dayFechaCreacion` datetime NULL DEFAULT NULL,
  `desUsuarioCreación` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  UNIQUE INDEX `XPKother_Notificaciones_Usuario`(`id`, `codNotificacion`) USING BTREE,
  INDEX `XIF1other_Notificaciones_Usuario`(`id`) USING BTREE,
  INDEX `XIF2other_Notificaciones_Usuario`(`codNotificacion`) USING BTREE,
  CONSTRAINT `other_notificaciones_usuario_ibfk_1` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `other_notificaciones_usuario_ibfk_2` FOREIGN KEY (`codNotificacion`) REFERENCES `other_notificaciones` (`codNotificacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of other_notificaciones_usuario
-- ----------------------------

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token`) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type`, `tokenable_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------
INSERT INTO `personal_access_tokens` VALUES (2, 'App\\Models\\User', 4, 'main', 'fad423794c19b2fcafa97ea7b3df90432ae38f84feb04d7876ae77e8c43749fd', '[\"*\"]', NULL, '2022-11-08 06:00:02', '2022-11-08 06:00:02');
INSERT INTO `personal_access_tokens` VALUES (3, 'App\\Models\\User', 4, 'main', '8b23b8515d0c16fa55307ada01558e8daa544f2cb148764486e7252fbcf40502', '[\"*\"]', NULL, '2022-11-08 06:00:25', '2022-11-08 06:00:25');
INSERT INTO `personal_access_tokens` VALUES (4, 'App\\Models\\User', 4, 'main', 'c7bf9c90bb85f93b443baf3ee8ead0f3da3de473fe798a3786ec450988c45b76', '[\"*\"]', NULL, '2022-11-08 16:38:39', '2022-11-08 16:38:39');
INSERT INTO `personal_access_tokens` VALUES (5, 'App\\Models\\User', 5, 'main', '0aa1e989c6969e6d10c6646cf74b3ab944df69d6152044c171a4d936288972a6', '[\"*\"]', NULL, '2022-11-10 19:18:15', '2022-11-10 19:18:15');
INSERT INTO `personal_access_tokens` VALUES (6, 'App\\Models\\User', 5, 'main', 'da842488d492df963f2820a0e4897de5a30e3d05b27d84150e4e1f83928e9133', '[\"*\"]', NULL, '2022-11-10 19:18:50', '2022-11-10 19:18:50');
INSERT INTO `personal_access_tokens` VALUES (7, 'App\\Models\\User', 5, 'main', '8e92ab3a7a4ad4da42c52fd6f1400095c016bfd9ec3bb302b18d363fda7bc889', '[\"*\"]', NULL, '2022-11-10 23:49:37', '2022-11-10 23:49:37');
INSERT INTO `personal_access_tokens` VALUES (8, 'App\\Models\\User', 5, 'main', '2a7a97c651cd5fb2fcf4d9c1dfd1d8d944a95193103303c141aac0982812dd91', '[\"*\"]', NULL, '2022-11-11 05:06:35', '2022-11-11 05:06:35');
INSERT INTO `personal_access_tokens` VALUES (9, 'App\\Models\\User', 5, 'main', 'c7d95e0a2148e561747b204d7154d1f40c44b17549aae17a8da6512c1903bdd9', '[\"*\"]', NULL, '2022-11-11 05:07:51', '2022-11-11 05:07:51');
INSERT INTO `personal_access_tokens` VALUES (10, 'App\\Models\\User', 5, 'main', '37d04b5f734555c1ac0da48ab605c44ed3a49aa5ec59c2cb18cf0087ec0dc768', '[\"*\"]', NULL, '2022-11-11 05:10:00', '2022-11-11 05:10:00');
INSERT INTO `personal_access_tokens` VALUES (11, 'App\\Models\\User', 5, 'main', '2f11262c47a6795de590094b52168449bf37ca353d13c68c5b3dbd70d2d8a671', '[\"*\"]', NULL, '2022-11-11 05:33:09', '2022-11-11 05:33:09');
INSERT INTO `personal_access_tokens` VALUES (12, 'App\\Models\\User', 5, 'main', '33f056e3e511f56ef8530326a2799d10b530b4273eaab0d593ea1a9e66bec7f4', '[\"*\"]', NULL, '2022-11-11 05:34:46', '2022-11-11 05:34:46');
INSERT INTO `personal_access_tokens` VALUES (13, 'App\\Models\\User', 5, 'main', '1d3e0128edeed25fe49c1b7f32234649909b225b54554749eb47e4c562bd5a9b', '[\"*\"]', NULL, '2022-11-11 05:39:32', '2022-11-11 05:39:32');
INSERT INTO `personal_access_tokens` VALUES (14, 'App\\Models\\User', 5, 'main', '4cab016e278c88a1e141cf1ad363d619f851475f4c1f2511c987bebc43970d41', '[\"*\"]', NULL, '2022-11-11 05:44:52', '2022-11-11 05:44:52');
INSERT INTO `personal_access_tokens` VALUES (15, 'App\\Models\\User', 5, 'main', 'a085b1189ee5434876835bc0e356830e26b446c54a442fec5b4f096b26f7756c', '[\"*\"]', NULL, '2022-11-11 13:20:13', '2022-11-11 13:20:13');
INSERT INTO `personal_access_tokens` VALUES (16, 'App\\Models\\User', 5, 'main', 'ec3da1d0dbbdfc1685ac78de7417e56226ba7f13df5cdd07b1de011d4f91fd58', '[\"*\"]', NULL, '2022-11-13 11:34:48', '2022-11-13 11:34:48');
INSERT INTO `personal_access_tokens` VALUES (17, 'App\\Models\\User', 6, 'main', 'c35d81587d6679cad0d462941e8b3d24f6057f4e7a1a539a0a2c664301d5a971', '[\"*\"]', NULL, '2022-11-15 04:22:22', '2022-11-15 04:22:22');
INSERT INTO `personal_access_tokens` VALUES (18, 'App\\Models\\User', 6, 'main', 'ce117f6577de5997021a35e2d05a8e9669bab2f744c97f435cec16968503bb04', '[\"*\"]', NULL, '2022-11-15 04:22:34', '2022-11-15 04:22:34');
INSERT INTO `personal_access_tokens` VALUES (19, 'App\\Models\\User', 7, 'main', '002d96e3164c3ace78cca5670d336dde247293a7771cd6c00c74256dcc84372e', '[\"*\"]', NULL, '2022-11-15 13:38:01', '2022-11-15 13:38:01');
INSERT INTO `personal_access_tokens` VALUES (20, 'App\\Models\\User', 7, 'main', 'c633a7156756adc12e54def5ddffdd27828e529de86e94b9b1806f575d386453', '[\"*\"]', NULL, '2022-11-15 13:38:16', '2022-11-15 13:38:16');
INSERT INTO `personal_access_tokens` VALUES (21, 'App\\Models\\User', 5, 'main', '066711ee3b2bc6ac0f388e03b56d3c8ce5e09ae6a81179bbce6afd86df179071', '[\"*\"]', NULL, '2022-11-17 00:03:26', '2022-11-17 00:03:26');
INSERT INTO `personal_access_tokens` VALUES (22, 'App\\Models\\User', 5, 'main', 'dbd3138ad438933d85d12b92d4afc21e95f30f04c2f97cfaba31e1f020b939e9', '[\"*\"]', NULL, '2022-11-17 16:40:30', '2022-11-17 16:40:30');
INSERT INTO `personal_access_tokens` VALUES (23, 'App\\Models\\User', 5, 'main', 'dc9f6f75376cdc7a6e887698f15c21ba08c5db28a52e327766b1e1273cc291c5', '[\"*\"]', NULL, '2022-11-18 01:49:24', '2022-11-18 01:49:24');
INSERT INTO `personal_access_tokens` VALUES (24, 'App\\Models\\User', 5, 'main', '4823fb622e5f1d691bac582faa0faf3043dd0a0554f4339d3010c18159a8deb6', '[\"*\"]', NULL, '2022-11-18 05:47:11', '2022-11-18 05:47:11');
INSERT INTO `personal_access_tokens` VALUES (25, 'App\\Models\\User', 6, 'main', 'f32a736b9f58fc341538407297f67141cf36bad581fcf9e19f45cef6676ec6bf', '[\"*\"]', NULL, '2022-11-18 05:47:49', '2022-11-18 05:47:49');
INSERT INTO `personal_access_tokens` VALUES (26, 'App\\Models\\User', 6, 'main', '5941cfbfc163e40db4a6b3f753aabad233ade3feaced5b2327bb6259c4773156', '[\"*\"]', NULL, '2022-11-18 05:49:06', '2022-11-18 05:49:06');
INSERT INTO `personal_access_tokens` VALUES (27, 'App\\Models\\User', 5, 'main', '355bcb5ced91a3e77b83b325968688a12fd7205dc70ddf62f969830417c0752a', '[\"*\"]', NULL, '2022-11-20 09:45:09', '2022-11-20 09:45:09');
INSERT INTO `personal_access_tokens` VALUES (28, 'App\\Models\\User', 6, 'main', '8193094a022a19d00c06774ec8ae0f089d5c0a57a2b5bd95fa62cc72764d5c36', '[\"*\"]', NULL, '2022-11-20 13:44:49', '2022-11-20 13:44:49');
INSERT INTO `personal_access_tokens` VALUES (29, 'App\\Models\\User', 6, 'main', 'def93eb74e74d92ea16f10fcaf0ebcc1496f753963fc17cdcd7442fee9323386', '[\"*\"]', NULL, '2022-11-21 15:25:03', '2022-11-21 15:25:03');
INSERT INTO `personal_access_tokens` VALUES (30, 'App\\Models\\User', 6, 'main', '93c913260bd3a10edefdd0d2cc3e1a8ba95f7bbccd8e868672013c4a8f12ccae', '[\"*\"]', NULL, '2022-11-22 09:16:17', '2022-11-22 09:16:17');
INSERT INTO `personal_access_tokens` VALUES (31, 'App\\Models\\User', 7, 'main', '1262a10de8a9ba54ff00c207791834275f013b4d05b5d9a1c46a789d87d142a3', '[\"*\"]', NULL, '2022-11-22 14:38:09', '2022-11-22 14:38:09');
INSERT INTO `personal_access_tokens` VALUES (32, 'App\\Models\\User', 5, 'main', '7b21d51c7031b2bcb03f59665900fc2b1c35f0b1a2103d152f684bf7bed4449c', '[\"*\"]', NULL, '2022-11-22 16:14:02', '2022-11-22 16:14:02');
INSERT INTO `personal_access_tokens` VALUES (33, 'App\\Models\\User', 6, 'main', '7c20ac3ce0b178133ac2666a10eacaa6a7bf0e35ea592e942abab05709eff183', '[\"*\"]', NULL, '2022-11-22 16:16:44', '2022-11-22 16:16:44');

-- ----------------------------
-- Table structure for proy_integrantes
-- ----------------------------
DROP TABLE IF EXISTS `proy_integrantes`;
CREATE TABLE `proy_integrantes`  (
  `codProyecto` bigint NOT NULL,
  `id` bigint NOT NULL,
  `codEstadoInvitacion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `desArea` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dayFechaInvitacion` datetime NULL DEFAULT NULL,
  `dayFechaInvitacionConfirmacion` datetime NULL DEFAULT NULL,
  `codRolIntegrante` int NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of proy_integrantes
-- ----------------------------
INSERT INTO `proy_integrantes` VALUES (60, 5, 'asdgasdg', NULL, '2022-11-11 08:45:55', NULL, 1);
INSERT INTO `proy_integrantes` VALUES (61, 5, 'asdgasdg', NULL, '2022-11-11 06:45:58', NULL, 2);
INSERT INTO `proy_integrantes` VALUES (62, 5, 'asdgasdg', NULL, '2022-11-12 19:07:56', NULL, 1);
INSERT INTO `proy_integrantes` VALUES (63, 5, 'zxcvzxcv', NULL, '2022-11-12 21:45:58', NULL, 2);
INSERT INTO `proy_integrantes` VALUES (63, 5, 'dasdadsadfsa', NULL, '2022-11-14 04:41:24', NULL, 1);
INSERT INTO `proy_integrantes` VALUES (65, 5, 'sky@sky.com', NULL, NULL, NULL, 1);
INSERT INTO `proy_integrantes` VALUES (65, 5, 'dream@dream.com', NULL, NULL, NULL, 2);
INSERT INTO `proy_integrantes` VALUES (66, 5, 'paul@p.com', NULL, NULL, NULL, 2);
INSERT INTO `proy_integrantes` VALUES (66, 5, 'vic@v.com', NULL, NULL, NULL, 2);
INSERT INTO `proy_integrantes` VALUES (67, 5, 'fdsdfg', NULL, NULL, NULL, 1);
INSERT INTO `proy_integrantes` VALUES (68, 5, 'zzxc', NULL, NULL, NULL, 1);
INSERT INTO `proy_integrantes` VALUES (69, 5, 'asdzxcv', NULL, NULL, NULL, 1);
INSERT INTO `proy_integrantes` VALUES (70, 5, 'asfdasdf', NULL, NULL, NULL, 2);
INSERT INTO `proy_integrantes` VALUES (71, 5, 'sdfasdf', NULL, NULL, NULL, 2);
INSERT INTO `proy_integrantes` VALUES (72, 5, 'asdfasdf', NULL, NULL, NULL, 1);
INSERT INTO `proy_integrantes` VALUES (72, 5, 'zcxvzxcv', NULL, NULL, NULL, 1);
INSERT INTO `proy_integrantes` VALUES (73, 5, 'asdfasdf', NULL, NULL, NULL, 2);
INSERT INTO `proy_integrantes` VALUES (73, 5, 'zxcvzxcv', NULL, NULL, NULL, 1);
INSERT INTO `proy_integrantes` VALUES (74, 5, 'oopop', NULL, NULL, NULL, 1);
INSERT INTO `proy_integrantes` VALUES (74, 5, 'xzcZxc', NULL, NULL, NULL, 2);
INSERT INTO `proy_integrantes` VALUES (75, 5, 'asdfasdf', NULL, NULL, NULL, 1);
INSERT INTO `proy_integrantes` VALUES (75, 5, 'zxcvzxcv', NULL, NULL, NULL, 2);
INSERT INTO `proy_integrantes` VALUES (76, 5, 'sdf', NULL, NULL, NULL, 1);
INSERT INTO `proy_integrantes` VALUES (76, 5, 'zxc', NULL, NULL, NULL, 1);
INSERT INTO `proy_integrantes` VALUES (77, 5, 'asdgasg', NULL, NULL, NULL, 1);
INSERT INTO `proy_integrantes` VALUES (77, 5, 'zxcvzxcv', NULL, NULL, NULL, 1);
INSERT INTO `proy_integrantes` VALUES (78, 5, 'zxcv', NULL, NULL, NULL, 1);
INSERT INTO `proy_integrantes` VALUES (78, 5, 'asdzxcv', NULL, NULL, NULL, 2);
INSERT INTO `proy_integrantes` VALUES (79, 5, 'peter@p.com', NULL, NULL, NULL, 2);
INSERT INTO `proy_integrantes` VALUES (79, 5, 'vector@v.com', NULL, NULL, NULL, 2);
INSERT INTO `proy_integrantes` VALUES (80, 6, 'Peter', NULL, NULL, NULL, 1);
INSERT INTO `proy_integrantes` VALUES (80, 6, 'David', NULL, NULL, NULL, 2);
INSERT INTO `proy_integrantes` VALUES (80, 6, 'James', NULL, NULL, NULL, 1);
INSERT INTO `proy_integrantes` VALUES (82, 6, 'asdfasdf', NULL, NULL, NULL, NULL);
INSERT INTO `proy_integrantes` VALUES (82, 6, 'zxcvzxcv', NULL, NULL, NULL, NULL);
INSERT INTO `proy_integrantes` VALUES (85, 6, 'james@j.com, alpha@a.com, top@t.com,', 'Peru', NULL, NULL, NULL);
INSERT INTO `proy_integrantes` VALUES (88, 6, 'John Doe, James Lilley,', 'Peru', NULL, NULL, NULL);
INSERT INTO `proy_integrantes` VALUES (89, 6, 'john@j.com, james@j.com,', 'Peru', NULL, NULL, NULL);
INSERT INTO `proy_integrantes` VALUES (91, 6, 'John, Liely,', 'Peru', NULL, NULL, NULL);
INSERT INTO `proy_integrantes` VALUES (92, 7, 'James@james.com, Peter@peter.com,', 'Peru', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for proy_proyecto
-- ----------------------------
DROP TABLE IF EXISTS `proy_proyecto`;
CREATE TABLE `proy_proyecto`  (
  `codProyecto` bigint NOT NULL AUTO_INCREMENT,
  `desNombreProyecto` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `codEstado` int NULL DEFAULT NULL,
  `id` bigint NOT NULL,
  `desEmpresa` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `numPlazo` int NULL DEFAULT NULL,
  `numAreaTechado` decimal(25, 2) NULL DEFAULT NULL,
  `desTipoProyecto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `codUbigeo` int NULL DEFAULT NULL,
  `dayFechaInicio` datetime NULL DEFAULT NULL,
  `numMontoReferencial` decimal(25, 2) NULL DEFAULT NULL,
  `numAreaTechada` decimal(25, 2) NULL DEFAULT NULL,
  `numAreaConstruida` decimal(25, 2) NULL DEFAULT NULL,
  `desDireccion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dayFechaCreacion` datetime NULL DEFAULT NULL,
  `desUsuarioCreacion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  UNIQUE INDEX `XPKProy_Proyecto`(`codProyecto`) USING BTREE,
  INDEX `XIF1Proy_Proyecto`(`id`) USING BTREE,
  INDEX `XIF2Proy_Proyecto`(`codUbigeo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 93 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of proy_proyecto
-- ----------------------------
INSERT INTO `proy_proyecto` VALUES (1, '2341', 1, 4, '1234', 1235, 1245.00, '1234', 452, NULL, 356234.00, 2346.00, 3456.00, '3456', '2022-11-08 15:07:29', NULL);
INSERT INTO `proy_proyecto` VALUES (8, 'RES', 1, 2, 'R', 2, 2.00, '2', 2, NULL, 2.00, 2.00, 2.00, '2', '2022-11-04 23:37:10', NULL);
INSERT INTO `proy_proyecto` VALUES (9, 'UUUU', 1, 20, 'UU', 20, 20.00, '20', 20, NULL, 20.00, 20.00, 20.00, '20', '2022-11-04 23:45:23', NULL);
INSERT INTO `proy_proyecto` VALUES (11, 'REST', 1, 20, 'FE', 20, 20.00, 'RES', 20, NULL, 20.00, 202.00, 20.00, '20', '2022-11-05 05:51:36', NULL);
INSERT INTO `proy_proyecto` VALUES (12, 'Test Project', 1, 30, 'Test Com', 30, 20.00, '20', 20, NULL, 400.00, 20.00, 20.00, '20', '2022-11-05 08:19:50', NULL);
INSERT INTO `proy_proyecto` VALUES (13, 'New Project', 1, 30, 'New Com', 30, 20.00, '30', 20, NULL, 30.00, 20.00, 30.00, '20', '2022-11-05 08:23:34', NULL);
INSERT INTO `proy_proyecto` VALUES (14, 'Ressss', 1, 20, 'sss', 20, 20.00, 'Res', 20, NULL, 2.00, 0.00, 20.00, '20', '2022-11-05 10:03:39', NULL);
INSERT INTO `proy_proyecto` VALUES (15, 'GJE', 1, 20, 'Gej', 20, 20.00, '20', 20, NULL, 20.00, 20.00, 20.00, '20', '2022-11-05 10:04:43', NULL);
INSERT INTO `proy_proyecto` VALUES (16, 'Re', 1, 20, 'Re', 20, 20.00, '20', 20, NULL, 20.00, 20.00, 20.00, '20', '2022-11-05 10:11:28', NULL);
INSERT INTO `proy_proyecto` VALUES (17, 'Re', 1, 20, 'Re', 20, 20.00, '20', 20, NULL, 20.00, 20.00, 20.00, '20', '2022-11-05 10:12:21', NULL);
INSERT INTO `proy_proyecto` VALUES (18, '222', 1, 2, '2', 2, 2.00, '2', 2, NULL, 2.00, 2.00, 2.00, '2', '2022-11-05 10:13:17', NULL);
INSERT INTO `proy_proyecto` VALUES (75, 'asdfasdf', 1, 5, 'zxcvzxcv', 20, 7.00, '7', 7, NULL, 7.00, 7.00, 7.00, '7', '2022-11-14 12:05:09', 'asdfasdf,');
INSERT INTO `proy_proyecto` VALUES (76, 'qweq', 1, 5, 'qwerq', 7, 7.00, '7', 7, NULL, 7.00, 77.00, 7.00, '7', '2022-11-14 12:08:06', 'sdf,');
INSERT INTO `proy_proyecto` VALUES (77, 'asdg', 1, 5, 'wertwe', 7, 7.00, '7', 7, NULL, 7.00, 7.00, 7.00, '7', '2022-11-14 12:12:07', 'asdgasg,');
INSERT INTO `proy_proyecto` VALUES (78, 'asdfasdf', 1, 5, 'wrqwer', 7, 7.00, '7', 7, NULL, 7.00, 7.00, 7.00, '7', '2022-11-14 12:13:46', 'peter@p.com, vector@v.com,');
INSERT INTO `proy_proyecto` VALUES (79, 'New Project', 1, 5, 'New Company', 100, 100.00, '100', 100, NULL, 100.00, 100.00, 100.00, '100', '2022-11-14 12:19:00', 'Peter, David, James,');
INSERT INTO `proy_proyecto` VALUES (80, 'New Project NEWNEW', 1, 6, 'New Company', 10, 10.00, 'Abierto', 10, '2022-11-20 10:23:25', 10.00, 10.00, 10.00, '10', '2022-11-20 20:43:07', 'Peter, David, James,');
INSERT INTO `proy_proyecto` VALUES (82, 'new', 1, 6, 'NEW', 7, 7.00, 'Abierto', 7, NULL, 7.00, 7.00, 7.00, '7', '2022-11-18 04:01:14', 'asdfasdf, zxcvzxcv,');
INSERT INTO `proy_proyecto` VALUES (83, 'New Laravel + Vue Project', 1, 6, 'Client Peru Diego', 500, 50.00, 'Cerrado', 75, '2022-11-20 10:23:25', 70.00, 70.00, 70.00, 'newnewnew', '2022-11-18 15:46:28', 'peter@p.com, vector@v.com, james@j.com, jack@j.com, new@n.com,');
INSERT INTO `proy_proyecto` VALUES (85, 'Des Project', 1, 6, 'em', 70, 70.00, 'Cerrado', 70, '2022-11-20 10:23:25', 70.00, 70.00, 70.00, '70', '2022-11-18 12:13:53', 'james@j.com, alpha@a.com, top@t.com,');
INSERT INTO `proy_proyecto` VALUES (88, 'New Pro new', 1, 6, 'new co', 70, 70.00, 'Abierto', 70, '2022-11-20 10:23:25', 70.00, 70.00, 70.00, 'ABC', '2022-11-21 13:23:39', 'John Doe, James Lilley,');
INSERT INTO `proy_proyecto` VALUES (89, 'PRoject New', 1, 6, 'Com new', 77, 77.00, 'Abierto', 77, '2022-11-20 10:23:25', 77.00, 77.00, 77.00, 'DDD', '2022-11-21 13:34:41', 'john@j.com, james@j.com,');
INSERT INTO `proy_proyecto` VALUES (91, 'MDmDMDM', 1, 6, 'md', 70, 70.00, 'Abierto', 70, '2022-11-20 10:23:25', 70.00, 70.00, 70.00, 'QQWWW', '2022-11-21 13:55:39', 'John, Liely,');
INSERT INTO `proy_proyecto` VALUES (92, 'New Project Laravel+Vue', 1, 7, 'New Company', 70, 70.00, 'Abierto', 70, '2022-11-20 10:23:25', 70.00, 70.00, 70.00, 'Peru', '2022-11-22 08:47:50', 'James@james.com, Peter@peter.com, Diego@diego.com,');

-- ----------------------------
-- Table structure for proy_proyectoreportes
-- ----------------------------
DROP TABLE IF EXISTS `proy_proyectoreportes`;
CREATE TABLE `proy_proyectoreportes`  (
  `codUtilReportes` int NOT NULL AUTO_INCREMENT,
  `codProyecto` bigint NOT NULL,
  `flagReporteMasivo` int NULL DEFAULT NULL,
  `codTipoFrecuencia` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dayFechaCreacion` datetime NULL DEFAULT NULL,
  `desUsuarioCreacion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `desCorreoEnvios` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `codfrecuenciaenvioreporte` int NULL DEFAULT NULL,
  PRIMARY KEY (`codUtilReportes`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of proy_proyectoreportes
-- ----------------------------
INSERT INTO `proy_proyectoreportes` VALUES (1, 63, 1, 'LV', '2022-11-14 11:49:09', NULL, 'sky@sky.com, dream@dream.com', NULL);
INSERT INTO `proy_proyectoreportes` VALUES (2, 71, 1, 'LV', '2022-11-14 11:52:19', '', 'sdfasdf,', 1);
INSERT INTO `proy_proyectoreportes` VALUES (3, 72, 1, 'LV', '2022-11-14 11:56:38', '', 'asdfasdf,', 2);
INSERT INTO `proy_proyectoreportes` VALUES (4, 73, 1, 'LV', '2022-11-14 11:57:58', '', 'asdfasdf,', 1);
INSERT INTO `proy_proyectoreportes` VALUES (5, 74, 1, 'LV', '2022-11-14 12:01:09', '', 'oopop,', 1);
INSERT INTO `proy_proyectoreportes` VALUES (6, 74, 1, 'LV', '2022-11-14 12:01:09', '', 'oopop, xzcZxc,', 2);
INSERT INTO `proy_proyectoreportes` VALUES (7, 75, 1, 'LV', '2022-11-14 12:05:09', '', 'asdfasdf,', 1);
INSERT INTO `proy_proyectoreportes` VALUES (8, 76, 1, 'LV', '2022-11-14 12:08:06', '', 'sdf,', 2);
INSERT INTO `proy_proyectoreportes` VALUES (9, 77, 1, 'LV', '2022-11-14 12:12:07', '', 'asdgasg,', 2);
INSERT INTO `proy_proyectoreportes` VALUES (10, 78, 1, 'LV', '2022-11-14 12:13:46', '', 'zxcv,', 1);
INSERT INTO `proy_proyectoreportes` VALUES (11, 78, 1, 'LV', '2022-11-14 12:13:46', '', 'zxcv, asdzxcv,', 2);
INSERT INTO `proy_proyectoreportes` VALUES (12, 79, 1, 'LV', '2022-11-14 12:19:00', '', 'peter@p.com,', 2);
INSERT INTO `proy_proyectoreportes` VALUES (13, 79, 1, 'LV', '2022-11-14 12:19:00', '', 'peter@p.com, vector@v.com,', 3);
INSERT INTO `proy_proyectoreportes` VALUES (14, 80, 1, 'LV', '2022-11-14 22:33:48', '', 'Peter, David, James,', 1);
INSERT INTO `proy_proyectoreportes` VALUES (15, 80, 0, 'LV', '2022-11-14 22:33:48', '', 'Peter,', 2);
INSERT INTO `proy_proyectoreportes` VALUES (16, 82, 1, 'LV', '2022-11-18 04:01:14', '', 'asdfasdf, zxcvzxcv,', 1);
INSERT INTO `proy_proyectoreportes` VALUES (17, 85, 1, 'LV', '2022-11-18 12:13:53', '', 'james@j.com, alpha@a.com, top@t.com,', 1);
INSERT INTO `proy_proyectoreportes` VALUES (18, 85, 0, 'LV', '2022-11-18 12:13:53', '', 'james@j.com, alpha@a.com, top@t.com,', 3);
INSERT INTO `proy_proyectoreportes` VALUES (19, 88, 1, 'LV', '2022-11-21 13:23:39', '', 'John Doe, James Lilley,', 1);
INSERT INTO `proy_proyectoreportes` VALUES (20, 88, 0, 'LV', '2022-11-21 13:23:39', '', 'John Doe, James Lilley,', 3);
INSERT INTO `proy_proyectoreportes` VALUES (21, 89, 1, 'LV', '2022-11-21 13:34:41', '', 'john@j.com, james@j.com,', 1);
INSERT INTO `proy_proyectoreportes` VALUES (22, 89, 0, 'LV', '2022-11-21 13:34:41', '', 'john@j.com,', 2);
INSERT INTO `proy_proyectoreportes` VALUES (23, 91, 1, 'LS', '2022-11-21 13:55:39', '', 'John, Liely,', 2);
INSERT INTO `proy_proyectoreportes` VALUES (24, 92, 1, 'LV', '2022-11-22 08:42:53', '', 'James@james.com, Peter@peter.com,', 1);
INSERT INTO `proy_proyectoreportes` VALUES (25, 92, 0, 'LV', '2022-11-22 08:42:53', '', 'James@james.com, Peter@peter.com,', 2);

-- ----------------------------
-- Table structure for proy_rolintegrante
-- ----------------------------
DROP TABLE IF EXISTS `proy_rolintegrante`;
CREATE TABLE `proy_rolintegrante`  (
  `codRolIntegrante` int NOT NULL,
  `desRolIntegrante` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  UNIQUE INDEX `XPKProy_RolIntegrante`(`codRolIntegrante`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of proy_rolintegrante
-- ----------------------------
INSERT INTO `proy_rolintegrante` VALUES (1, 'Editor');
INSERT INTO `proy_rolintegrante` VALUES (2, 'Visualizor');

-- ----------------------------
-- Table structure for sec_cargo
-- ----------------------------
DROP TABLE IF EXISTS `sec_cargo`;
CREATE TABLE `sec_cargo`  (
  `codCargo` int NOT NULL,
  `nameCargo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  UNIQUE INDEX `XPKSec_Cargo`(`codCargo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sec_cargo
-- ----------------------------

-- ----------------------------
-- Table structure for sec_membresia
-- ----------------------------
DROP TABLE IF EXISTS `sec_membresia`;
CREATE TABLE `sec_membresia`  (
  `codMembresia` bigint NOT NULL,
  `desMembresia` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `canDiasPrueba` int NULL DEFAULT NULL,
  `desMonto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `canProyectos` int NULL DEFAULT NULL,
  `desFrecuencia` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  UNIQUE INDEX `XPKSec_Membresia`(`codMembresia`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sec_membresia
-- ----------------------------

-- ----------------------------
-- Table structure for sec_membresiausuario
-- ----------------------------
DROP TABLE IF EXISTS `sec_membresiausuario`;
CREATE TABLE `sec_membresiausuario`  (
  `codMembresiaUsuario` bigint NOT NULL,
  `id` bigint NOT NULL,
  `codMembresia` bigint NOT NULL,
  `dayFechaInicio` datetime NULL DEFAULT NULL,
  `dayFechaFin` datetime NULL DEFAULT NULL,
  `codEstado` int NULL DEFAULT NULL,
  `des_PagoVerificado` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  UNIQUE INDEX `XPKSec_MembresiaUsuario`(`codMembresiaUsuario`, `id`, `codMembresia`) USING BTREE,
  INDEX `XIF1Sec_MembresiaUsuario`(`id`) USING BTREE,
  INDEX `XIF2Sec_MembresiaUsuario`(`codMembresia`) USING BTREE,
  CONSTRAINT `sec_membresiausuario_ibfk_1` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sec_membresiausuario_ibfk_2` FOREIGN KEY (`codMembresia`) REFERENCES `sec_membresia` (`codMembresia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sec_membresiausuario
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `celular` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lastname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nombreempresa` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `codCargo` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `XPKusersidunique`(`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE,
  UNIQUE INDEX `XPKuseremailunique`(`email`) USING BTREE,
  INDEX `XIF1users`(`codCargo`) USING BTREE,
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`codCargo`) REFERENCES `sec_cargo` (`codCargo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (4, 'AB', '1234567890', 'CD', 'Free', 'abcd@abcd.com', NULL, '$2y$10$fYcUrydJqze3tPW9b37u7OTpjcHRJQvUXfjXYMVMEEBaN9DJV/1NO', NULL, '2022-11-08 06:00:02', '2022-11-08 06:00:02', NULL);
INSERT INTO `users` VALUES (5, 'peter', '123123123', 'peter', 'free', 'peter@p.com', NULL, '$2y$10$GueBt.76Dks1GaW.WNGlSuiBMSJTR.9OKn9t6bT6w0ihyg5.hcXYq', NULL, '2022-11-10 19:18:14', '2022-11-10 19:18:14', NULL);
INSERT INTO `users` VALUES (6, 'James', '1234567890', 'David', 'Free', 'james@d.com', NULL, '$2y$10$ffdn5MwekjzF3QM8jQATlefu4/TjY0/GdSPIbrCbk0.Y3BDLYd5Yu', NULL, '2022-11-15 04:22:22', '2022-11-15 04:22:22', NULL);
INSERT INTO `users` VALUES (7, 'Peter', '1231231231', 'Fawzy', 'Free', 'peter@peter.com', NULL, '$2y$10$YixvPeyUEGgbD1Nukz6MM.KuvlLUSMzYyGBF6OSWlcIoS6.G2e.iy', NULL, '2022-11-15 13:38:00', '2022-11-15 13:38:00', NULL);

-- ----------------------------
-- Table structure for util_reportes
-- ----------------------------
DROP TABLE IF EXISTS `util_reportes`;
CREATE TABLE `util_reportes`  (
  `codUtilReportes` int NOT NULL,
  `desUtilReportes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `desDirReporte` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  UNIQUE INDEX `XPKUtil_Reportes`(`codUtilReportes`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of util_reportes
-- ----------------------------
INSERT INTO `util_reportes` VALUES (1, 'Reporte de análisis de restricciones', NULL);
INSERT INTO `util_reportes` VALUES (5, 'Reporte de análisis de restricciones', NULL);
INSERT INTO `util_reportes` VALUES (10, 'Reporte de análisis de restricciones', NULL);
INSERT INTO `util_reportes` VALUES (11, 'Reporte de avance gráfico', NULL);
INSERT INTO `util_reportes` VALUES (12, 'Reporte de análisis de restricciones', NULL);
INSERT INTO `util_reportes` VALUES (13, 'Reporte de avance gráfico', NULL);
INSERT INTO `util_reportes` VALUES (14, 'Reporte de análisis de restricciones', NULL);
INSERT INTO `util_reportes` VALUES (15, 'Reporte de avance gráfico', NULL);
INSERT INTO `util_reportes` VALUES (16, 'Reporte de análisis de restricciones', NULL);
INSERT INTO `util_reportes` VALUES (17, 'Reporte de análisis de restricciones', NULL);
INSERT INTO `util_reportes` VALUES (18, 'Reporte de avance gráfico', NULL);
INSERT INTO `util_reportes` VALUES (19, 'Reporte de análisis de restricciones', NULL);
INSERT INTO `util_reportes` VALUES (20, 'Reporte de avance gráfico', NULL);
INSERT INTO `util_reportes` VALUES (21, 'Reporte de avance gráfico', NULL);
INSERT INTO `util_reportes` VALUES (22, 'Reporte de avance gráfico', NULL);
INSERT INTO `util_reportes` VALUES (23, 'Reporte de análisis de restricciones', NULL);
INSERT INTO `util_reportes` VALUES (24, 'Reporte de análisis de restricciones', NULL);
INSERT INTO `util_reportes` VALUES (25, 'Reporte de avance gráfico', NULL);

SET FOREIGN_KEY_CHECKS = 1;
