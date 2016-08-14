/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.1.73-community : Database - db_zssm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_zssm` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db_zssm`;

/*Table structure for table `settings` */

DROP TABLE IF EXISTS `settings`;

CREATE TABLE `settings` (
  `settings_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `parent_id` int(10) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `value` int(10) DEFAULT NULL,
  `options` varchar(50) DEFAULT NULL,
  `sys_default` tinyint(4) DEFAULT NULL,
  `state` tinyint(4) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`settings_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `settings` */

/*Table structure for table `t_permission` */

DROP TABLE IF EXISTS `t_permission`;

CREATE TABLE `t_permission` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '权限名',
  `sign` varchar(128) DEFAULT NULL COMMENT '权限标识,程序中判断使用,如"user:create"',
  `desc` varchar(255) DEFAULT NULL COMMENT '权限描述,UI界面显示使用'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_permission` */

insert  into `t_permission`(`id`,`name`,`sign`,`desc`) values (1,'user','user:select','用户查看'),(2,'user','user:create','用户新增');

/*Table structure for table `t_role` */

DROP TABLE IF EXISTS `t_role`;

CREATE TABLE `t_role` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `sign` varchar(100) DEFAULT NULL COMMENT '角色标识',
  `desc` varchar(255) DEFAULT NULL COMMENT '角色描述'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_role` */

insert  into `t_role`(`id`,`name`,`sign`,`desc`) values (1,'管理员','admin','管理员'),(2,'业务管理员','bus','业务管理员'),(3,'系统管理员','system','系统管理员');

/*Table structure for table `t_role_permission` */

DROP TABLE IF EXISTS `t_role_permission`;

CREATE TABLE `t_role_permission` (
  `id` int(11) DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL COMMENT '角色id',
  `permissionId` int(11) DEFAULT NULL COMMENT '权限id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_role_permission` */

insert  into `t_role_permission`(`id`,`roleId`,`permissionId`) values (1,1,1),(2,1,2),(3,2,2);

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginName` varchar(20) DEFAULT NULL COMMENT '用户名',
  `password` varchar(20) DEFAULT NULL COMMENT '用户密码',
  `name` varchar(100) DEFAULT NULL COMMENT '用户姓名',
  `salt` varchar(100) DEFAULT NULL COMMENT '密码加盐',
  `locked` varchar(1) DEFAULT '0' COMMENT '用户是否锁定(0未锁定,1锁定)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

insert  into `t_user`(`id`,`loginName`,`password`,`name`,`salt`,`locked`) values (1,'admin','123','管理员',NULL,'0'),(2,'sumonian','123','苏陌年',NULL,'0');

/*Table structure for table `t_user_role` */

DROP TABLE IF EXISTS `t_user_role`;

CREATE TABLE `t_user_role` (
  `id` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL COMMENT '用户id',
  `roleId` int(11) DEFAULT NULL COMMENT '角色id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_user_role` */

insert  into `t_user_role`(`id`,`userId`,`roleId`) values (1,1,1),(2,1,2);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `age` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`name`,`age`) values (13,'AAA',20);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
