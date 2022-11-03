/*
MySQL Data Transfer
Source Host: localhost
Source Database: wedding_planner
Target Host: localhost
Target Database: wedding_planner
Date: 2022-10-22 4:59:52 PM
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for booked_services
-- ----------------------------
DROP TABLE IF EXISTS `booked_services`;
CREATE TABLE `booked_services` (
  `user_name` varchar(50) NOT NULL,
  `service` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `sub-category` varchar(50) NOT NULL,
  `price` varchar(50) NOT NULL,
  `is_approved` int(11) NOT NULL default '0',
  PRIMARY KEY  (`user_name`,`service`,`category`,`sub-category`,`is_approved`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for booked_venue
-- ----------------------------
DROP TABLE IF EXISTS `booked_venue`;
CREATE TABLE `booked_venue` (
  `user_name` varchar(50) NOT NULL,
  `venue_id` int(11) NOT NULL,
  `is_approved` int(11) NOT NULL default '0',
  PRIMARY KEY  (`user_name`,`venue_id`,`is_approved`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for paid_services
-- ----------------------------
DROP TABLE IF EXISTS `paid_services`;
CREATE TABLE `paid_services` (
  `tranaction_id` bigint(20) NOT NULL,
  `service` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `sub-category` varchar(50) NOT NULL,
  PRIMARY KEY  (`tranaction_id`,`service`,`category`,`sub-category`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for paid_venue
-- ----------------------------
DROP TABLE IF EXISTS `paid_venue`;
CREATE TABLE `paid_venue` (
  `transaction_id` bigint(20) NOT NULL,
  `venue_id` int(11) NOT NULL,
  PRIMARY KEY  (`transaction_id`,`venue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for payment
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `transaction_id` bigint(20) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `amount` varchar(50) NOT NULL,
  `date` varchar(255) NOT NULL,
  PRIMARY KEY  (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for services
-- ----------------------------
DROP TABLE IF EXISTS `services`;
CREATE TABLE `services` (
  `user_name` varchar(50) NOT NULL,
  `service` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `sub-category` varchar(50) NOT NULL,
  `price` varchar(50) NOT NULL,
  PRIMARY KEY  (`user_name`,`service`,`category`,`sub-category`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `username` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone_no` varchar(12) NOT NULL,
  `email_id` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY  (`username`),
  KEY `username` (`username`,`first_name`,`last_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for venue
-- ----------------------------
DROP TABLE IF EXISTS `venue`;
CREATE TABLE `venue` (
  `venue_id` int(10) unsigned zerofill NOT NULL auto_increment,
  `venue_name` varchar(50) NOT NULL,
  `location` varchar(150) NOT NULL,
  `catogery` varchar(50) NOT NULL,
  `capacity` bigint(20) NOT NULL,
  `price` bigint(20) NOT NULL,
  PRIMARY KEY  (`venue_id`),
  KEY `venue_id` (`venue_id`,`venue_name`,`location`,`catogery`,`capacity`,`price`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for venue_booking_queue
-- ----------------------------
DROP TABLE IF EXISTS `venue_booking_queue`;
CREATE TABLE `venue_booking_queue` (
  `user_name` varchar(50) NOT NULL,
  `venue_id` int(11) NOT NULL,
  PRIMARY KEY  (`user_name`,`venue_id`),
  CONSTRAINT `user_name` FOREIGN KEY (`user_name`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `paid_venue` VALUES ('87181', '75');
INSERT INTO `payment` VALUES ('87181', 'yash', '150000', '2022-10-22');
INSERT INTO `user` VALUES ('yash', 'yashwanth', 'k', '9888989', 'yashwanth@gmail.com', 'password');
INSERT INTO `venue` VALUES ('0000000075', 'Venue_one', 'Bangalore', 'AC', '4000', '150000');
INSERT INTO `venue` VALUES ('0000000076', 'Venue_two', 'Jayanagar', 'Non-AC', '3000', '120000');
INSERT INTO `venue` VALUES ('0000000078', 'Venue_three', 'JP Nagar', 'AC', '5000', '200000');
INSERT INTO `venue` VALUES ('0000000079', 'Venue_four', 'Silk Board', 'Non-AC', '1000', '80000');
INSERT INTO `venue` VALUES ('0000000080', 'Venue_five', 'HSR Layout', 'AC', '4000', '115000');
INSERT INTO `venue` VALUES ('0000000081', 'Venue_six', 'Bommanahalli', 'Non-AC', '2000', '100000');
INSERT INTO `venue` VALUES ('0000000082', 'Venue_seven', 'Koramangala', 'AC', '6000', '300000');
INSERT INTO `venue` VALUES ('0000000083', 'Venue_Eight', 'White field', 'AC', '10000', '500000');
INSERT INTO `venue` VALUES ('0000000084', 'Venue_nine', 'Goa', 'Non-AC', '5000', '100000');
INSERT INTO `venue` VALUES ('0000000085', 'venue_ten', 'E-city', 'AC', '400', '40000');
INSERT INTO `venue` VALUES ('0000000086', 'venye', 'babg', 'Non-AC', '500', '100000');
