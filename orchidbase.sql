-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 19, 2013 at 06:30 PM
-- Server version: 5.5.25
-- PHP Version: 5.4.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `cellar`
--

-- --------------------------------------------------------

--
-- Table structure for table `wine`
--

CREATE TABLE `wine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `genus` varchar(45) DEFAULT NULL,
  `fragrance` varchar(45) DEFAULT NULL,
  `species` varchar(45) DEFAULT NULL,
  `awards` varchar(45) DEFAULT NULL,
  `color` varchar(45) DEFAULT NULL,
  `sizeofplant` varchar(45) NOT NULL,
  `purchaseprice` varchar(45) NOT NULL,
  `purchasedate` varchar(45) NOT NULL,
  `description` blob,
  `picture` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=44 ;

--
-- Dumping data for table `wine`
--

INSERT INTO `wine` (`id`, `genus`, `fragrance`, `species`, `awards`, `color`, `sizeofplant`, `purchaseprice`, `purchasedate`, `description`, `picture`) VALUES
(39, ' Cattleya ', 'Yes', 'aurea', 'No', 'Olive', '7 inches', '$22.45', '09/10/2012', 0x436174746c65796120617572656120697320766572792073696d696c617220746f20436174746c65796120646f7769616e612062757420636f6d65732066726f6d206120646966666572656e742070617274206f662074686520776f726c6420616e6420626c6f6f6d73206120666577206d6f6e746873206c617465722e2054686973207370656369657320697320686967686c7920656e64616e676572656420696e2069747320686f6d6520636f756e7472792064756520746f2068616269746174206465737472756374696f6e20616e642073686f756c64206e6f74206265207075726368617365642061732061206a756e676c652d636f6c6c656374656420706c616e742e20436174746c6579612061757265612067726f77732077656c6c20756e646572207479706963616c20436174746c65796120636f6e646974696f6e7320616e64206c696768742e20536f6d652067726f776572732068617665207265706f7274656420646966666963756c7479206b656570696e672074686520706c616e74732067726f77696e6720666f72206d6f7265207468616e2061206665772079656172732e2050657268617073206173206d6f726520736565642d67726f776e20706c616e74732066726f6d20677265656e686f7573657320656e74657220746865207472616465207468652070726f626c656d2077696c6c206c657373656e2e, '1hkhkhkk.jpg'),
(40, 'Phalaenopsis', 'Yes', 'deliciosum', 'Alabama Orchid Society', 'WHITE / PINK', 'FLOWERING SIZE', '$15.65', '12/18/2012', 0x5068616c61656e6f7073697320284b696e67696469756d292064656c6963696f73756d2069732061207375706572206d696e696174757265206f726368696420666f756e6420616c6c206f76657220617369612c2074686973206f6e652068617320776869746520666c6f7765727320776974682074696e7920726f73652070696e6b20646f74732061726f756e64207468652063656e74726520616e642070726f6475636564206d6f7265207468616e206f6e63652061207965617220616e64206f6e206272616e6368696e67207370696b65732074686174206c61737420666f72206d6f6e7468732c20746865206c697020697320726f73652070696e6b, 'uuuuuuuf.jpg'),
(41, 'Stanhopea ', '', 'embreei', 'None', 'PInk', 'one long, plicate, elliptic leaf ', '$8.56', '05/20/2013', 0x5374616e686f70656120697320612067656e7573206f6620746865206f72636869642066616d696c792066726f6d2043656e7472616c20616e6420536f75746820416d65726963612e2054686520616262726576696174696f6e207573656420696e20686f72746963756c747572616c207472616465206973205374616e2e205468657365206570697068797469632c20627574206f63636173696f6e616c6c7920746572726573747269616c206f7263686964732063616e20626520666f756e6420696e2064616d7020666f72657374732066726f6d204d657869636f20746f204e5720417267656e74696e652e205468656972206f766174652070736575646f62756c62732063617272792066726f6d2074686520746f70206f6e65206c6f6e672c20706c69636174652c20656c6c6970746963206c6561662e0a0a4974206973206e6f74656420666f722069747320636f6d706c657820616e6420757375616c6c79206672616772616e7420666c6f776572732074686174206172652067656e6572616c6c792073706563746163756c617220616e642073686f72742d6c697665642e2054686569722070656e64616e7420696e666c6f72657363656e63657320617265206e6f74656420666f7220666c6f776572696e67206f7574206f662074686520626f74746f6d206f662074686520636f6e7461696e65727320696e20776869636820746865792067726f772c206c656e64696e67207468656d73656c76657320746f2063756c7475726520696e206261736b6574732074686174206861766520656e6f756768206f70656e20737061636520666f722074686520696e666c6f726573656e63652070757368207468726f7567682e, 'stanhopea-embreei-150x200.jpg'),
(42, 'Stanhopea ', '', 'costaricensis', 'Yes', 'Gold', 'Large', '$15.55', '01/07/2013', 0x4d7573742062652067726f776e20696e206261736b657473206f72206d6f756e7465642062656361757365206f66207468652070656e64756c6f757320696e666c6f72657363656e6365732e2053756767657374207573696e67206d6564696120746861742072657461696e73206d6f6973747572652c2073756368206173206c6f6e672d666962657265642073706861676e756d2077697468206261726b2f63686172636f616c20262073706f6e676520726f636b206f7220636f636f6e75742063686970732e204c696e65206261736b657473207769746820636f636f6e75742066696265722c2073706861676e756d2c206576656e206e65777370617065722c20746f2072657461696e206d6978207768696c6520726f6f742073797374656d206265636f6d65732065737461626c69736865642e, 'stanhopea-costaricensis-200x200.jpg'),
(43, 'Sophronitis ', '', 'mixta', 'Yes', 'short, ovoid, ', 'Large', '$22.00', '08/14/2012', 0x536f7068726f6e697469732c20616262726576696174656420536f706820696e20686f72746963756c747572616c2074726164652c206973206120666169726c7920736d616c6c2067656e7573206f66206f72636869642c20666f756e642067726f77696e6720696e207468652064616d70206d6f6e74616e6520666f72657374206f66206561737465726e204272617a696c2c20506172616775617920616e64204e4520417267656e74696e612e2043757272656e746c792c203635207370656369657320617265207265636f676e697a65642e, 'sophronitis-mixta-200x164.jpg');