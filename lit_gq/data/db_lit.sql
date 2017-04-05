-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2017-04-05 04:48:21
-- 服务器版本： 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_lit`
--
CREATE DATABASE IF NOT EXISTS `db_lit` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `db_lit`;

-- --------------------------------------------------------

--
-- 表的结构 `activity`
--
-- 创建时间： 2017-04-04 07:26:29
--

DROP TABLE IF EXISTS `activity`;
CREATE TABLE IF NOT EXISTS `activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(40) NOT NULL,
  `abstract` varchar(300) NOT NULL,
  `acti_type_id` int(11) NOT NULL,
  `cover` varchar(50) NOT NULL,
  `organizer` varchar(50) NOT NULL,
  `place` varchar(50) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `start_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_time` datetime DEFAULT NULL,
  PRIMARY KEY (`activity_id`),
  KEY `from_user_id` (`user_id`),
  KEY `acti_type_id` (`acti_type_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- 表的关联 `activity`:
--   `acti_type_id`
--       `acti_type` -> `type_id`
--

--
-- 转存表中的数据 `activity`
--

INSERT INTO `activity` (`activity_id`, `user_id`, `title`, `abstract`, `acti_type_id`, `cover`, `organizer`, `place`, `create_time`, `start_time`, `end_time`) VALUES
(1, 1, '红海龟', '《红海龟》是由荷兰人迈克尔·度德威特导演，法国人帕斯卡尔·费兰联合编剧，日本人高畑勋担纲艺术指导的作品。<br>动画由法国arte&nbsp;France&nbsp;Cinéma公司、日本吉卜力工作室等联合制作，东宝国际等发行。<br>该片主要讲述了男主因航船失事流落到了无人岛，存活下的男人企图建造救生筏逃离荒岛，但他的计划却不断被一只神秘的巨型红海龟破坏，在他绝望时，一名神秘女子出现了并挽救其灵魂的故事', 8, 'cover_17040416011212.JPG', '日本吉卜力工作室', '孤岛', '2017-04-04 16:01:12', '2017-04-04 16:01:30', '2017-04-05 16:01:30'),
(2, 2, '四重奏', '匆忙浮躁的都市中，四个与音乐相关的男男女女“偶然”邂逅出于对音乐的共同志向，组建了四重奏乐队，同住在别府家位于轻井泽的别墅。<br />\r\n然而，所有人都在说谎，每个人都被自己的秘密牵扯纠缠，其实他们的相遇也并非偶然，而是隐藏着一个大秘密', 8, 'cover_17040510313151.JPG', 'TBS', '轻井泽', '2017-04-05 10:31:32', '2017-04-05 10:31:49', '2017-04-06 10:31:49');

-- --------------------------------------------------------

--
-- 表的结构 `acti_focus`
--
-- 创建时间： 2017-03-20 03:18:01
--

DROP TABLE IF EXISTS `acti_focus`;
CREATE TABLE IF NOT EXISTS `acti_focus` (
  `activity_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `activity_id` (`activity_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 表的关联 `acti_focus`:
--   `activity_id`
--       `activity` -> `activity_id`
--   `user_id`
--       `user` -> `user_id`
--

-- --------------------------------------------------------

--
-- 表的结构 `acti_log`
--
-- 创建时间： 2017-04-04 04:08:54
--

DROP TABLE IF EXISTS `acti_log`;
CREATE TABLE IF NOT EXISTS `acti_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `detail` varchar(50) NOT NULL,
  `add_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`),
  KEY `activity_id` (`activity_id`),
  KEY `user_id` (`user_id`),
  KEY `admin_id` (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- 表的关联 `acti_log`:
--

--
-- 转存表中的数据 `acti_log`
--

INSERT INTO `acti_log` (`log_id`, `activity_id`, `user_id`, `admin_id`, `detail`, `add_time`) VALUES
(1, 1, 1, 0, '创建活动直播成功', '2017-04-04 16:01:12'),
(2, 2, 2, 0, '创建活动直播成功', '2017-04-05 10:31:32');

-- --------------------------------------------------------

--
-- 表的结构 `acti_type`
--
-- 创建时间： 2017-03-16 06:56:41
--

DROP TABLE IF EXISTS `acti_type`;
CREATE TABLE IF NOT EXISTS `acti_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- 表的关联 `acti_type`:
--

--
-- 转存表中的数据 `acti_type`
--

INSERT INTO `acti_type` (`type_id`, `type`) VALUES
(1, '旅游'),
(2, '生活'),
(3, '艺术'),
(4, '实践'),
(5, '体育'),
(6, '科研'),
(7, '摄像'),
(8, '影视'),
(9, '人物'),
(10, '游戏');

-- --------------------------------------------------------

--
-- 表的结构 `acti_view`
--
-- 创建时间： 2017-03-20 12:09:03
--

DROP TABLE IF EXISTS `acti_view`;
CREATE TABLE IF NOT EXISTS `acti_view` (
  `activity_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `view_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `activity_id` (`activity_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 表的关联 `acti_view`:
--

--
-- 转存表中的数据 `acti_view`
--

INSERT INTO `acti_view` (`activity_id`, `user_id`, `view_time`) VALUES
(10, 20, '2017-04-04 15:35:12'),
(1, 1, '2017-04-04 16:01:14'),
(1, 1, '2017-04-04 16:01:31'),
(1, 1, '2017-04-04 16:02:30'),
(1, 1, '2017-04-04 16:03:22'),
(1, 0, '2017-04-05 10:21:50'),
(1, 0, '2017-04-05 10:22:11'),
(1, 0, '2017-04-05 10:24:30'),
(2, 2, '2017-04-05 10:31:33'),
(2, 2, '2017-04-05 10:31:50'),
(2, 2, '2017-04-05 10:34:43'),
(1, 0, '2017-04-05 10:39:12'),
(2, 2, '2017-04-05 10:44:23');

-- --------------------------------------------------------

--
-- 表的结构 `admin`
--
-- 创建时间： 2017-03-16 13:06:01
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin` int(11) NOT NULL,
  `password` varchar(30) NOT NULL,
  `admin_type` int(11) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 表的关联 `admin`:
--

-- --------------------------------------------------------

--
-- 表的结构 `admin_log`
--
-- 创建时间： 2017-04-04 04:09:25
--

DROP TABLE IF EXISTS `admin_log`;
CREATE TABLE IF NOT EXISTS `admin_log` (
  `admin_id` int(11) NOT NULL,
  `detail` int(11) NOT NULL,
  `add_time` int(11) NOT NULL,
  KEY `admin_id` (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 表的关联 `admin_log`:
--

-- --------------------------------------------------------

--
-- 表的结构 `comment`
--
-- 创建时间： 2017-04-04 04:24:45
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `to_comment_id` int(11) NOT NULL,
  `say` varchar(500) NOT NULL,
  `add_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`comment_id`),
  KEY `user_id` (`user_id`),
  KEY `content_id` (`content_id`),
  KEY `activity_id` (`activity_id`),
  KEY `to_comment_id` (`to_comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 表的关联 `comment`:
--

-- --------------------------------------------------------

--
-- 表的结构 `com_agree`
--
-- 创建时间： 2017-04-04 04:26:43
--

DROP TABLE IF EXISTS `com_agree`;
CREATE TABLE IF NOT EXISTS `com_agree` (
  `user_id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `user_agreewith_com` (`user_id`,`comment_id`),
  KEY `fk_comagree_comment` (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 表的关联 `com_agree`:
--

-- --------------------------------------------------------

--
-- 表的结构 `com_log`
--
-- 创建时间： 2017-04-04 04:09:10
--

DROP TABLE IF EXISTS `com_log`;
CREATE TABLE IF NOT EXISTS `com_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `detail` varchar(50) NOT NULL,
  `add_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`),
  KEY `admin_id` (`admin_id`),
  KEY `user_id` (`user_id`),
  KEY `comment_id` (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 表的关联 `com_log`:
--

-- --------------------------------------------------------

--
-- 表的结构 `content`
--
-- 创建时间： 2017-03-19 14:40:25
--

DROP TABLE IF EXISTS `content`;
CREATE TABLE IF NOT EXISTS `content` (
  `content_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `description` varchar(500) NOT NULL,
  `add_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`content_id`),
  KEY `from_user_id` (`user_id`),
  KEY `to_activity_id` (`activity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- 表的关联 `content`:
--   `activity_id`
--       `activity` -> `activity_id`
--

--
-- 转存表中的数据 `content`
--

INSERT INTO `content` (`content_id`, `user_id`, `activity_id`, `description`, `add_time`) VALUES
(1, 1, 1, '一次船舶失事后，存活下的男人企图建造救生筏逃离荒岛，但他的计划却不断被一只神秘的巨型红海龟破坏。随后一名红发女子游到海岛上，与其生活，并有了一个孩子。一场突如其来的海啸，让三人的天堂生活顿时堕入生命垂危的地狱。最后，男子在睡梦中安详死去，而她的妻子则重新幻化为海龟，朝大海深处游去', '2017-04-04 16:03:21'),
(2, 2, 2, '《四重奏》是日本TBS电视台2017年播出的悬疑情感剧，由土井裕泰、金子文纪、坪井敏雄执导，坂元裕二编剧，松隆子、满岛光、高桥一生、松田龙平共演，于2017年1月17日首播。', '2017-04-05 10:34:42');

-- --------------------------------------------------------

--
-- 表的结构 `cont_img`
--
-- 创建时间： 2017-03-16 12:21:22
--

DROP TABLE IF EXISTS `cont_img`;
CREATE TABLE IF NOT EXISTS `cont_img` (
  `img_id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `img_name` varchar(50) NOT NULL,
  PRIMARY KEY (`img_id`),
  KEY `content_id` (`content_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- 表的关联 `cont_img`:
--   `content_id`
--       `content` -> `content_id`
--

--
-- 转存表中的数据 `cont_img`
--

INSERT INTO `cont_img` (`img_id`, `content_id`, `user_id`, `img_name`) VALUES
(1, 1, 1, 'content_17040416032123.JPG'),
(2, 2, 2, 'content_17040510344229.JPG'),
(3, 2, 2, 'content_17040510344252.JPG'),
(4, 2, 2, 'content_17040510344210.JPG'),
(5, 2, 2, 'content_17040510344221.JPG');

-- --------------------------------------------------------

--
-- 表的结构 `cont_like`
--
-- 创建时间： 2017-03-20 03:29:29
--

DROP TABLE IF EXISTS `cont_like`;
CREATE TABLE IF NOT EXISTS `cont_like` (
  `user_id` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `content_id` (`content_id`),
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 表的关联 `cont_like`:
--   `content_id`
--       `content` -> `content_id`
--   `user_id`
--       `user` -> `user_id`
--

-- --------------------------------------------------------

--
-- 表的结构 `cont_log`
--
-- 创建时间： 2017-04-04 04:09:47
--

DROP TABLE IF EXISTS `cont_log`;
CREATE TABLE IF NOT EXISTS `cont_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `detail` varchar(50) NOT NULL,
  `add_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`),
  KEY `content_id` (`content_id`),
  KEY `user_id` (`user_id`),
  KEY `admin_id` (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- 表的关联 `cont_log`:
--

--
-- 转存表中的数据 `cont_log`
--

INSERT INTO `cont_log` (`log_id`, `content_id`, `user_id`, `admin_id`, `detail`, `add_time`) VALUES
(1, 1, 1, 0, '向(1)添加图文成功', '2017-04-04 16:03:21'),
(2, 1, 1, 0, '添加图片(1)成功', '2017-04-04 16:03:21'),
(3, 2, 2, 0, '向(2)添加图文成功', '2017-04-05 10:34:42'),
(4, 2, 2, 0, '添加图片(2)成功', '2017-04-05 10:34:42'),
(5, 2, 2, 0, '添加图片(3)成功', '2017-04-05 10:34:42'),
(6, 2, 2, 0, '添加图片(4)成功', '2017-04-05 10:34:42'),
(7, 2, 2, 0, '添加图片(5)成功', '2017-04-05 10:34:42');

-- --------------------------------------------------------

--
-- 表的结构 `message`
--
-- 创建时间： 2017-03-28 02:37:32
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE IF NOT EXISTS `message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `from_type` tinyint(1) NOT NULL COMMENT '判断id在哪个数据表中找。0-(统一显示为)管理员；1-通过用户id查找用户名',
  `from_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `detail` varchar(500) NOT NULL,
  `send_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`message_id`),
  KEY `to_user_id` (`to_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 表的关联 `message`:
--   `to_user_id`
--       `user` -> `user_id`
--

-- --------------------------------------------------------

--
-- 表的结构 `report`
--
-- 创建时间： 2017-03-20 10:44:39
--

DROP TABLE IF EXISTS `report`;
CREATE TABLE IF NOT EXISTS `report` (
  `report_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `reason` varchar(100) NOT NULL,
  `on_type` varchar(11) NOT NULL COMMENT '先判断举报内容,值可以有activity,content,comment',
  `on_id` int(11) NOT NULL COMMENT '对应id',
  `report_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_handled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否被管理员处理；0-未被处理；1-已处理，php更新状态',
  `admin_id` int(11) NOT NULL COMMENT '处理的管理员',
  `handle_time` datetime NOT NULL,
  PRIMARY KEY (`report_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 表的关联 `report`:
--

-- --------------------------------------------------------

--
-- 表的结构 `school`
--
-- 创建时间： 2017-03-19 14:17:31
--

DROP TABLE IF EXISTS `school`;
CREATE TABLE IF NOT EXISTS `school` (
  `school_id` int(11) NOT NULL AUTO_INCREMENT,
  `school_name` varchar(50) NOT NULL,
  PRIMARY KEY (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- 表的关联 `school`:
--

--
-- 转存表中的数据 `school`
--

INSERT INTO `school` (`school_id`, `school_name`) VALUES
(16, 'a'),
(17, '中国传媒大学'),
(18, '中国传媒大学 北广学院'),
(19, '中国传媒大学'),
(20, '北京大学');

-- --------------------------------------------------------

--
-- 表的结构 `security_question`
--
-- 创建时间： 2017-03-16 04:37:20
--

DROP TABLE IF EXISTS `security_question`;
CREATE TABLE IF NOT EXISTS `security_question` (
  `security_question_id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(50) NOT NULL,
  PRIMARY KEY (`security_question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- 表的关联 `security_question`:
--

--
-- 转存表中的数据 `security_question`
--

INSERT INTO `security_question` (`security_question_id`, `question`) VALUES
(1, '项目名'),
(2, '我的家有几口人');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--
-- 创建时间： 2017-03-16 14:36:51
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `logname` varchar(20) NOT NULL,
  `uname` varchar(20) NOT NULL,
  `password` varchar(30) NOT NULL,
  `type` smallint(6) NOT NULL DEFAULT '0' COMMENT '0-用户，1-发布者',
  `headimg` varchar(50) NOT NULL,
  `school_id` int(11) NOT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-未删除，1-已删除，用户名还是不能重复注册',
  `is_locked` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-未锁定，1-已锁定，并在log_lock数据表中记录',
  `introduction` varchar(500) NOT NULL,
  `security_question_id` int(11) NOT NULL,
  `security_answer` varchar(50) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastlogin_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `warned_times` int(11) NOT NULL DEFAULT '0',
  `warned_total` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  KEY `security_question_id` (`security_question_id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- 表的关联 `user`:
--   `school_id`
--       `school` -> `school_id`
--   `security_question_id`
--       `security_question` -> `security_question_id`
--

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`user_id`, `logname`, `uname`, `password`, `type`, `headimg`, `school_id`, `is_deleted`, `is_locked`, `introduction`, `security_question_id`, `security_answer`, `create_time`, `lastlogin_time`, `warned_times`, `warned_total`) VALUES
(1, 'a', 'a', 'a', 2, 'default1.jpg', 19, 0, 0, '', 1, '图文直播', '2017-04-04 15:37:45', '2017-04-05 10:24:39', 0, 0),
(2, 'b', 'b', 'b', 2, 'default4.jpg', 20, 0, 0, '', 2, '4', '2017-04-05 10:25:28', '2017-04-05 10:39:32', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `user_lock`
--
-- 创建时间： 2017-03-16 12:20:08
--

DROP TABLE IF EXISTS `user_lock`;
CREATE TABLE IF NOT EXISTS `user_lock` (
  `user_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `reason` varchar(100) NOT NULL,
  `lock_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `unlock_time` datetime DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `admin_id` (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 表的关联 `user_lock`:
--   `user_id`
--       `user` -> `user_id`
--

-- --------------------------------------------------------

--
-- 表的结构 `user_log`
--
-- 创建时间： 2017-04-04 04:10:00
--

DROP TABLE IF EXISTS `user_log`;
CREATE TABLE IF NOT EXISTS `user_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `detail` varchar(50) NOT NULL,
  `add_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`),
  KEY `user_id` (`user_id`),
  KEY `admin_id` (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- 表的关联 `user_log`:
--

--
-- 转存表中的数据 `user_log`
--

INSERT INTO `user_log` (`log_id`, `user_id`, `admin_id`, `detail`, `add_time`) VALUES
(1, 20, 0, '退出登录', '2017-04-04 15:36:27'),
(2, 1, 0, '用户注册', '2017-04-04 15:37:45'),
(3, 1, 0, '用户登录', '2017-04-04 15:40:56'),
(4, 1, 0, '退出登录', '2017-04-04 15:57:17'),
(5, 1, 0, '退出登录', '2017-04-04 15:57:33'),
(6, 1, 0, '用户登录', '2017-04-04 15:57:39'),
(7, 1, 0, '用户登录', '2017-04-04 15:58:30'),
(8, 1, 0, '用户登录', '2017-04-05 10:24:39'),
(9, 1, 0, '退出登录', '2017-04-05 10:24:53'),
(10, 2, 0, '用户注册', '2017-04-05 10:25:28'),
(11, 2, 0, '用户登录', '2017-04-05 10:39:32');

--
-- 限制导出的表
--

--
-- 限制表 `activity`
--
ALTER TABLE `activity`
  ADD CONSTRAINT `fk_activity_type` FOREIGN KEY (`acti_type_id`) REFERENCES `acti_type` (`type_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- 限制表 `acti_focus`
--
ALTER TABLE `acti_focus`
  ADD CONSTRAINT `fk_actifocus_activity` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`activity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_actifocus_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `content`
--
ALTER TABLE `content`
  ADD CONSTRAINT `fk_cont_activity` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`activity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `cont_img`
--
ALTER TABLE `cont_img`
  ADD CONSTRAINT `fk_contimg_content` FOREIGN KEY (`content_id`) REFERENCES `content` (`content_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `cont_like`
--
ALTER TABLE `cont_like`
  ADD CONSTRAINT `fk_contlike_content` FOREIGN KEY (`content_id`) REFERENCES `content` (`content_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_contlike_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `fk_message_user` FOREIGN KEY (`to_user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_user_school` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_sq` FOREIGN KEY (`security_question_id`) REFERENCES `security_question` (`security_question_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- 限制表 `user_lock`
--
ALTER TABLE `user_lock`
  ADD CONSTRAINT `fk_userlock_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;


--
-- Metadata
--
USE `phpmyadmin`;

--
-- Metadata for activity
--

--
-- Metadata for acti_focus
--

--
-- Metadata for acti_log
--

--
-- Metadata for acti_type
--

--
-- Metadata for acti_view
--

--
-- Metadata for admin
--

--
-- Metadata for admin_log
--

--
-- Metadata for comment
--

--
-- Metadata for com_agree
--

--
-- Metadata for com_log
--

--
-- Metadata for content
--

--
-- Metadata for cont_img
--

--
-- Metadata for cont_like
--

--
-- Metadata for cont_log
--

--
-- Metadata for message
--

--
-- Metadata for report
--

--
-- Metadata for school
--

--
-- Metadata for security_question
--

--
-- Metadata for user
--

--
-- Metadata for user_lock
--

--
-- Metadata for user_log
--

--
-- Metadata for db_lit
--

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
