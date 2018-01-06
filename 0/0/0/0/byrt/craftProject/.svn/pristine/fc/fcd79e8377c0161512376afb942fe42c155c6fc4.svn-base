/*
Navicat MySQL Data Transfer

Source Server         : 139.196.235.134
Source Server Version : 50630
Source Host           : 139.196.235.134:3306
Source Database       : yepopscserver

Target Server Type    : MYSQL
Target Server Version : 50630
File Encoding         : 65001

Date: 2017-11-13 15:48:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bas_reg
-- ----------------------------
DROP TABLE IF EXISTS `bas_reg`;
CREATE TABLE `bas_reg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reg_nam` varchar(50) DEFAULT NULL COMMENT '地区名称',
  `reg_fat_id` int(11) DEFAULT '0' COMMENT '父级ID(上级地区ID)',
  `reg_lev` int(11) DEFAULT '0' COMMENT '区域级别（1代表省级，2代表市级，3代表区县级）',
  `fir_let` varchar(10) DEFAULT NULL COMMENT '首字母',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of bas_reg
-- ----------------------------
INSERT INTO `bas_reg` VALUES ('1', '北京市', '0', '1', 'B');
INSERT INTO `bas_reg` VALUES ('2', '山西省', '0', '1', 'S');
INSERT INTO `bas_reg` VALUES ('3', '浙江省', '0', '1', 'Z');
INSERT INTO `bas_reg` VALUES ('4', '广东省', '0', '1', 'G');
INSERT INTO `bas_reg` VALUES ('5', '甘肃省', '0', '1', 'G');
INSERT INTO `bas_reg` VALUES ('6', '东城区', '71', '3', 'D');
INSERT INTO `bas_reg` VALUES ('7', '西城区', '71', '3', 'X');
INSERT INTO `bas_reg` VALUES ('8', '朝阳区', '71', '3', 'C');
INSERT INTO `bas_reg` VALUES ('9', '丰台区', '71', '3', 'F');
INSERT INTO `bas_reg` VALUES ('10', '石景山区', '71', '3', 'S');
INSERT INTO `bas_reg` VALUES ('11', '海淀区', '71', '3', 'H');
INSERT INTO `bas_reg` VALUES ('12', '门头沟区', '71', '3', 'M');
INSERT INTO `bas_reg` VALUES ('13', '房山区', '71', '3', 'F');
INSERT INTO `bas_reg` VALUES ('14', '通州区', '71', '3', 'T');
INSERT INTO `bas_reg` VALUES ('22', '长治市', '2', '2', 'C');
INSERT INTO `bas_reg` VALUES ('23', '杭州市', '3', '2', 'H');
INSERT INTO `bas_reg` VALUES ('24', '舟山市', '3', '2', 'Z');
INSERT INTO `bas_reg` VALUES ('25', '深圳市', '4', '2', 'S');
INSERT INTO `bas_reg` VALUES ('26', '兰州市', '5', '2', 'L');
INSERT INTO `bas_reg` VALUES ('27', '城区', '22', '3', 'C');
INSERT INTO `bas_reg` VALUES ('28', '郊区', '22', '3', 'J');
INSERT INTO `bas_reg` VALUES ('29', '长治县', '22', '3', 'C');
INSERT INTO `bas_reg` VALUES ('30', '襄垣县', '22', '3', 'X');
INSERT INTO `bas_reg` VALUES ('31', '屯留县', '22', '3', 'T');
INSERT INTO `bas_reg` VALUES ('32', '平顺县', '22', '3', 'P');
INSERT INTO `bas_reg` VALUES ('33', '黎城县', '22', '3', 'L');
INSERT INTO `bas_reg` VALUES ('34', '壶关县', '22', '3', 'H');
INSERT INTO `bas_reg` VALUES ('35', '长子县', '22', '3', 'Z');
INSERT INTO `bas_reg` VALUES ('36', '武乡县', '22', '3', 'W');
INSERT INTO `bas_reg` VALUES ('37', '沁县', '22', '3', 'Q');
INSERT INTO `bas_reg` VALUES ('38', '沁源县', '22', '3', 'Q');
INSERT INTO `bas_reg` VALUES ('39', '潞城市', '22', '3', 'L');
INSERT INTO `bas_reg` VALUES ('40', '上城区', '23', '3', 'S');
INSERT INTO `bas_reg` VALUES ('41', '下城区', '23', '3', 'X');
INSERT INTO `bas_reg` VALUES ('42', '江干区', '23', '3', 'J');
INSERT INTO `bas_reg` VALUES ('43', '拱墅区', '23', '3', 'G');
INSERT INTO `bas_reg` VALUES ('44', '西湖区', '23', '3', 'X');
INSERT INTO `bas_reg` VALUES ('45', '滨江区', '23', '3', 'B');
INSERT INTO `bas_reg` VALUES ('46', '萧山区', '23', '3', 'X');
INSERT INTO `bas_reg` VALUES ('47', '余杭区', '23', '3', 'Y');
INSERT INTO `bas_reg` VALUES ('48', '桐庐县', '23', '3', 'T');
INSERT INTO `bas_reg` VALUES ('49', '淳安县', '23', '3', 'C');
INSERT INTO `bas_reg` VALUES ('50', '建德市', '23', '3', 'J');
INSERT INTO `bas_reg` VALUES ('51', '富阳市', '23', '3', 'F');
INSERT INTO `bas_reg` VALUES ('52', '临安市', '23', '3', 'L');
INSERT INTO `bas_reg` VALUES ('53', '定海区', '24', '3', 'D');
INSERT INTO `bas_reg` VALUES ('54', '普陀区', '24', '3', 'P');
INSERT INTO `bas_reg` VALUES ('55', '岱山县', '24', '3', 'D');
INSERT INTO `bas_reg` VALUES ('56', '嵊泗县', '24', '3', 'C');
INSERT INTO `bas_reg` VALUES ('57', '罗湖区', '25', '3', 'L');
INSERT INTO `bas_reg` VALUES ('58', '福田区', '25', '3', 'F');
INSERT INTO `bas_reg` VALUES ('59', '南山区', '25', '3', 'N');
INSERT INTO `bas_reg` VALUES ('60', '宝安区', '25', '3', 'B');
INSERT INTO `bas_reg` VALUES ('61', '龙岗区', '25', '3', 'L');
INSERT INTO `bas_reg` VALUES ('63', '城关区', '26', '3', 'C');
INSERT INTO `bas_reg` VALUES ('64', '七里河区', '26', '3', 'Q');
INSERT INTO `bas_reg` VALUES ('65', '西固区', '26', '3', 'X');
INSERT INTO `bas_reg` VALUES ('66', '安宁区', '26', '3', 'A');
INSERT INTO `bas_reg` VALUES ('67', '红古区', '26', '3', 'H');
INSERT INTO `bas_reg` VALUES ('68', '永登县', '26', '3', 'Y');
INSERT INTO `bas_reg` VALUES ('69', '皋兰县', '26', '3', 'G');
INSERT INTO `bas_reg` VALUES ('70', '榆中县', '26', '3', 'Y');
INSERT INTO `bas_reg` VALUES ('71', '北京市', '1', '2', 'B');
INSERT INTO `bas_reg` VALUES ('73', '临汾', '2', '2', 'ee');
INSERT INTO `bas_reg` VALUES ('86', '哈尔滨市', '85', '2', 'HEB');
INSERT INTO `bas_reg` VALUES ('87', '呼兰区', '86', '3', 'HLQ');
INSERT INTO `bas_reg` VALUES ('88', ' 阿城区', '86', '3', '');
INSERT INTO `bas_reg` VALUES ('89', '道外区', '86', '3', '');
INSERT INTO `bas_reg` VALUES ('90', '道里区', '86', '3', '');
INSERT INTO `bas_reg` VALUES ('91', '南岗区', '86', '3', '');
INSERT INTO `bas_reg` VALUES ('92', '香坊区', '86', '3', '');
INSERT INTO `bas_reg` VALUES ('93', '松北区', '86', '3', '');
INSERT INTO `bas_reg` VALUES ('94', '平房区', '86', '3', '');
INSERT INTO `bas_reg` VALUES ('95', '太原市', '2', '2', 'SXTY');
INSERT INTO `bas_reg` VALUES ('97', '杏花岭区', '95', '3', 'XHLQ');
INSERT INTO `bas_reg` VALUES ('98', '小店区', '95', '3', 'XDQ');
INSERT INTO `bas_reg` VALUES ('99', '迎泽区', '95', '3', 'YZQ');
INSERT INTO `bas_reg` VALUES ('100', '尖草坪区', '95', '3', 'JCPQ');
INSERT INTO `bas_reg` VALUES ('101', '万柏林区', '95', '3', 'WBLQ');
INSERT INTO `bas_reg` VALUES ('102', '晋源区', '95', '3', 'JYQ');
INSERT INTO `bas_reg` VALUES ('103', '古交市', '95', '3', 'GJS');
INSERT INTO `bas_reg` VALUES ('104', '清徐县', '95', '3', 'QXX');
INSERT INTO `bas_reg` VALUES ('105', '阳曲县', '95', '3', 'YQX');
INSERT INTO `bas_reg` VALUES ('106', '娄烦县', '95', '3', 'LFX');
INSERT INTO `bas_reg` VALUES ('107', '湖南省', '0', '1', 'HNS');
INSERT INTO `bas_reg` VALUES ('108', '湘潭市', '107', '2', 'HXTS');
INSERT INTO `bas_reg` VALUES ('109', '岳塘区', '108', '3', 'XYTQ');
INSERT INTO `bas_reg` VALUES ('112', '湖北省', '0', '1', 'HB');
INSERT INTO `bas_reg` VALUES ('113', '十堰市', '112', '2', 'SY');
INSERT INTO `bas_reg` VALUES ('114', '郧阳区', '113', '3', 'YY');
INSERT INTO `bas_reg` VALUES ('115', '昌平区', '71', '3', 'CP');
INSERT INTO `bas_reg` VALUES ('116', '昌平区', '71', '3', 'CP');
INSERT INTO `bas_reg` VALUES ('117', '大兴区', '71', '3', 'DX');
INSERT INTO `bas_reg` VALUES ('118', '茅箭区', '113', '3', 'MJ');
INSERT INTO `bas_reg` VALUES ('119', '张湾区', '113', '3', 'ZW');
INSERT INTO `bas_reg` VALUES ('121', '福建', '0', '1', 'F');
INSERT INTO `bas_reg` VALUES ('122', '安徽省', '0', '1', 'AH');
INSERT INTO `bas_reg` VALUES ('123', '合肥市', '122', '2', 'HF');
INSERT INTO `bas_reg` VALUES ('124', '高新区', '123', '3', 'GX');
SET FOREIGN_KEY_CHECKS=1;
