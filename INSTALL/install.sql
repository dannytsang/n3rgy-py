--
-- Create schema energyathome
--

CREATE DATABASE IF NOT EXISTS n3rgy;
USE n3rgy;

--
-- Definition of table `n3rgy`.`reading`
--

DROP TABLE IF EXISTS `n3rgy`.`unit`;
CREATE TABLE  `n3rgy`.`unit` (
  `unit_id` int(11) NOT NULL AUTO_INCREMENT,
  `unit` varchar(10) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`unit_id`),
  KEY `unit_idx` (`unit`)
) ENGINE=InnoDB;

--
-- Definition of table `n3rgy`.`reading`
--

DROP TABLE IF EXISTS `n3rgy`.`reading`;
CREATE TABLE  `n3rgy`.`readings` (
  `reading_id` int(11) NOT NULL auto_increment,
  `value` float default NULL,
  `unit_id` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`reading_id`),
  FOREIGN KEY (unit_id) REFERENCES unit(unit_id)
) ENGINE=InnoDB;

