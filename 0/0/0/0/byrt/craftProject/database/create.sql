
DROP TABLE IF EXISTS user;
CREATE TABLE user (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `use_mal` varchar(20) DEFAULT NULL COMMENT '用户邮箱',
  `use_pas` varchar(32) DEFAULT NULL COMMENT '密码',
  `use_nam` varchar(10) DEFAULT NULL COMMENT '用户姓名',
  `use_sex` int(1) DEFAULT '0' COMMENT '用户性别(1为男，2为女，0为默认值，不予以显示)',
  age int(3) DEFAULT '0' COMMENT '年龄',
  `use_mob` varchar(11) DEFAULT '' COMMENT '用户手机号码',
  `use_idc` varchar(18) DEFAULT NULL COMMENT '用户身份证号码',
  `third_acc` varchar(10) DEFAULT NULL COMMENT '微信/QQ',
  `use_unit` varchar(30) DEFAULT NULL COMMENT '学习/单位',
  `use_profile` varchar(255) DEFAULT NULL COMMENT '个人简介',
  `use_add` varchar(100) DEFAULT NULL COMMENT '用户通讯地址',
  `use_sta` int(11) DEFAULT '0' COMMENT '用户状态',
  `use_typ` int(11)  NOT NULL COMMENT '用户类型（1.本站人员，2.参赛用户）',
  `rol_id` int(11) DEFAULT '0' COMMENT '角色ID',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',

  `create_time` datetime  DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT  CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COMMENT='用户基础信息表';



DROP TABLE IF EXISTS opus;
CREATE TABLE opus (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NOT NULL  COMMENT '作者id',
  `opus_name` varchar(30) NOT NULL  COMMENT '作品名称',
  `opus_hot` int(11) DEFAULT NULL  COMMENT '作品热度',
  `opus_type` int(11) NOT NULL  COMMENT '作品类型',
  `group_id` int(11) NOT NULL COMMENT '作品组别',
  `creative_time` datetime NOT NULL  COMMENT '创作时间',
  `state` int(2) DEFAULT '1'  COMMENT '作品状态（1、已提交等待审核，2、审核通过，3、审核不通过）',
  `material` VARCHAR(30) DEFAULT NULL  COMMENT '作品材质',
  `production_process` VARCHAR(100) DEFAULT NULL  COMMENT '制作工艺',
  `introduction` VARCHAR(300) DEFAULT NULL  COMMENT '作品简介',
  `img_orig_ids` int(2) NOT NULL  COMMENT '作品照片集合,原图',
  `img_thum_ids` int(2) NOT NULL  COMMENT '作品照片集合，缩略图',

  `create_time` datetime  DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT  CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COMMENT='作品表';

DROP TABLE IF EXISTS bas_pic;
CREATE TABLE `bas_pic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pic_nam` varchar(20) DEFAULT NULL COMMENT '图片名称',
  `pic_typ` int(11) DEFAULT '0' COMMENT '图片类型: 0-原图，1-缩略图',
  `pic_url` varchar(200) DEFAULT NULL COMMENT '图片地址',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_time` datetime  DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT  CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='基础图片信息';

DROP TABLE IF EXISTS match;
CREATE TABLE `match` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `match_name` varchar(30)  not NULL COMMENT '比赛名称',
  `match_intr` varchar(500) DEFAULT NULL COMMENT '比赛简介',
  `org_id` int(11) DEFAULT NULL COMMENT '组织机构id',
  `time_ids` int(11) DEFAULT NULL COMMENT '时间列表',
  `award_ids` int(11) DEFAULT NULL COMMENT '奖项列表',
  `judge_ids` int(11) DEFAULT NULL COMMENT '评委列表',
  `req_ids` int(11) DEFAULT NULL COMMENT '竞赛要求列表',
  `classification_ids` int(11) DEFAULT NULL COMMENT '竞赛分组列表',
  `create_time` datetime  DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT  CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='比赛信息表';

DROP TABLE IF EXISTS match_org;
CREATE TABLE `match_org` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guide_unit` varchar(50) DEFAULT NULL COMMENT '指导单位',
  `sponsor_unit` varchar(50) DEFAULT NULL COMMENT '主办单位',
  `co_org` varchar(50) DEFAULT NULL COMMENT '协办单位',
  `platform_partners` varchar(50) DEFAULT NULL COMMENT '平台合作伙伴',
  `media_coop` varchar(500) DEFAULT NULL COMMENT '媒体合作',
  `create_time` datetime  DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT  CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='比赛组织结构表';

DROP TABLE IF EXISTS collection_time;
CREATE TABLE `collection_time` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `match_id` int(11) NOT NULL  COMMENT '比赛id',
  `time_name` varchar(50) NOT NULL COMMENT '征集时间名称',
  `time_date` varchar(100) NOT NULL  COMMENT '征集时间日期',
  `sort` int(2) DEFAULT NULL  COMMENT '排序号',
  `create_time` datetime  DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT  CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='比赛征集时间表';

DROP TABLE IF EXISTS award;
CREATE TABLE `award` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `match_id` int(11) NOT NULL  COMMENT '比赛id',
  type int(2) DEFAULT '0' NOT NULL COMMENT '奖项类型，1-专题赛，2-单项赛，3-优秀奖，4-参与奖',
  name VARCHAR(20) NOT NULL COMMENT '奖项名称：金奖，银奖',
  award_num int(2) NOT NULL COMMENT '得奖人数',
  award_desc VARCHAR(100) NOT NULL COMMENT '奖项描述: 奖金xxx元+xxx称号',
  award_explain VARCHAR(100) NOT NULL COMMENT '奖项说明',
  `create_time` datetime  DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT  CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='比赛奖项表';

DROP TABLE IF EXISTS  judge;
CREATE TABLE judge (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `match_id` int(11) NOT NULL  COMMENT '比赛id',
  name VARCHAR(20) NOT NULL COMMENT '名字',
  judge_intr VARCHAR(200) NOT NULL COMMENT '评委介绍',
  judge_title VARCHAR(30)  COMMENT '评委职称',
  `create_time` datetime  DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT  CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='评委表';


DROP TABLE IF EXISTS  `match_requirement`;
CREATE TABLE match_requirement (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `match_id` int(11) NOT NULL  COMMENT '比赛id',
  sort VARCHAR(20) DEFAULT '0'  COMMENT '排序号',
  description VARCHAR(300) NOT NULL COMMENT '介绍,描述',
  type int(2) NOT NULL COMMENT '类型：1-参赛作品要求，2-参赛须知，3-作品实物交付',
  `create_time` datetime  DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT  CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='参赛要求表';

DROP TABLE IF EXISTS  classification;
CREATE TABLE classification (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `match_id` int(11) NOT NULL  COMMENT '比赛id',
  name VARCHAR(20) NOT NULL COMMENT '专题赛名字或组别',
  description VARCHAR(100) DEFAULT NULL COMMENT '介绍,描述',
  detail VARCHAR(500)  DEFAULT NULL COMMENT '详细说明',
  type int(2) DEFAULT '0' COMMENT '类型，1-属于专题赛，2-属于组别',
  parent_id int(11) DEFAULT '0' COMMENT '如果该记录是组别，那它的父id 就是专题赛id',
  `create_time` datetime  DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT  CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='竞赛单元(分类)表';

DROP TABLE IF EXISTS user_competition_info;
CREATE TABLE  user_competition_info  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `use_id` INT(11) NOT NULL  COMMENT 'user 表 id',
  `use_nam` varchar(10) DEFAULT NULL COMMENT '用户姓名',
  `use_sex` int(1) DEFAULT '0' COMMENT '用户性别(1为男，2为女，0为默认值，不予以显示)',
   age int(3) DEFAULT '0' COMMENT '年龄',
  `use_mob` varchar(11) DEFAULT '' COMMENT '户手机号码',
  `use_idc` varchar(18) DEFAULT NULL COMMENT '用户身份证号码',
  `third_acc` varchar(10) DEFAULT NULL COMMENT '微信/QQ',
  `use_unit` varchar(30) DEFAULT NULL COMMENT '学习/单位',
  `use_profile` varchar(255) DEFAULT NULL COMMENT '个人简介',
  `pro_id` int(11) DEFAULT NULL COMMENT '省',
  `city_id` int(11)  DEFAULT NULL COMMENT '市',
  `use_add` varchar(100) DEFAULT NULL COMMENT '用户通讯地址',

  `create_time` datetime  DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT  CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COMMENT='参赛信息表';

DROP TABLE IF EXISTS competition_info;
CREATE TABLE  competition_info  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `use_id` INT(11) NOT NULL  COMMENT '用户 id',
  `opus_id` INT(11) NOT NULL  COMMENT '作品 id',

  `create_time` datetime  DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT  CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COMMENT='投票信息表';