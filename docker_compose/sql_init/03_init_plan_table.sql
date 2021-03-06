USE DAWN;
CREATE TABLE `PLAN` (
  `ID` INT(7) NOT NULL AUTO_INCREMENT,
  `TITLE` TEXT NOT NULL,
  `DESCRIPTION` TEXT NULL,
  `IMAGE` TEXT NULL,
  `CREATORID` INT NOT NULL ,
  PRIMARY KEY (`ID`),
  FOREIGN KEY `FK_CREATOR`(`CREATORID`) REFERENCES `CREATOR`(`ID`)
);

CREATE TABLE `CONDITION` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `PLANID` INT NOT NULL,
  `ESTIMATEDCHARGE` INT NOT NULL,
  PRIMARY KEY (`ID`),
  FOREIGN KEY `FK_PLAN`(`PLANID`) REFERENCES `PLAN`(`ID`)
);


CREATE TABLE `SEASONDEFINITION` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` TEXT NOT NULL,
  PRIMARY KEY(`ID`)
);

CREATE TABLE `SEASON` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `CONDITIONID` INT NOT NULL,
  `SEASONDEFINITIONID` INT NOT NULL,
  PRIMARY KEY(`ID`),
  FOREIGN KEY `FK_CONDITION`(`CONDITIONID`) REFERENCES `CONDITION`(`ID`),
  FOREIGN KEY `FK_DEFINITION`(`SEASONDEFINITIONID`) REFERENCES `SEASONDEFINITION`(`ID`)
);

CREATE TABLE `TIMESPANDEFINITION` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` TEXT NOT NULL,
  PRIMARY KEY(`ID`)
);

CREATE TABLE `TIMESPAN` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `CONDITIONID` INT NOT NULL,
  `TIMESPANDEFINITIONID` INT NOT NULL,
  PRIMARY KEY(`ID`),
  FOREIGN KEY `FK_CONDITION`(`CONDITIONID`) REFERENCES `CONDITION`(`ID`),
  FOREIGN KEY `FK_DEFINITION`(`TIMESPANDEFINITIONID`) REFERENCES `TIMESPANDEFINITION`(`ID`)
);

CREATE TABLE `CATEGORYDEFINITION` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` TEXT NOT NULL,
  PRIMARY KEY(`ID`)
);


CREATE TABLE `CATEGORY` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `CONDITIONID` INT NOT NULL,
  `CATEGORYDEFINITIONID` INT NOT NULL,
  FOREIGN KEY `FK_CONDITION`(`CONDITIONID`) REFERENCES `CONDITION`(`ID`),
  FOREIGN KEY `FK_DEFINITION`(`CATEGORYDEFINITIONID`) REFERENCES `CATEGORYDEFINITION`(`ID`),
  PRIMARY KEY(`ID`)
);
CREATE TABLE `DAY` (
	`ID`     INT NOT NULL AUTO_INCREMENT,
	`PLANID` INT NOT NULL,
	`NTHDAY` INT NOT NULL,
  PRIMARY KEY(`ID`),
  FOREIGN KEY `FK_PLAN`(`PLANID`) REFERENCES `PLAN`(`ID`)
);

CREATE TABLE `HEADING` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `DAYID` INT NOT NULL,
  `HEADINGTEXT` TEXT NOT NULL,
  `ORDER` INT NOT NULL,
  PRIMARY KEY(`ID`),
  FOREIGN KEY `FK_DAY`(`DAYID`) REFERENCES `DAY`(`ID`)
);

CREATE TABLE `SCHEDULE`(
  `ID`             INT NOT NULL AUTO_INCREMENT,
  `DAYID`          INT NOT NULL,
  `TITLE`           TEXT NOT NULL,
  `DESCRIPTION`     TEXT NULL,
  `STARTTIME`       TIME NULL,
  `ENDTIME`         TIME NULL,
  `PLACE`           INT NOT NULL,
  `HPLINK`          TEXT NULL,
  `RESERVATIONLINK` TEXT NULL,
  `ORDER`           INT NOT NULL,
  PRIMARY KEY(`ID`),
  FOREIGN KEY `FK_DAY`(`DAYID`) REFERENCES `DAY`(`ID`),
  FOREIGN KEY `FK_PLACE`(`PLACE`) REFERENCES `ADDRESS`(`ID`)
)