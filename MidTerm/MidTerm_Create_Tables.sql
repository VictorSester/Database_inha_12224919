CREATE TABLE `Vehicle`(
  `ID` VARCHAR NOT NULL,
  `Registration_ID` VARCHAR NOT NULL,
  `Manufacturer` VARCHAR NOT NULL,
  `Model` VARCHAR NOT NULL,
  `Color` VARCHAR NOT NULL,
  `Current_Odometer` BIGINT,
  `Passenger_capacity` TINYINT NOT NULL,
  `Repair_Action_type` CHAR NOT NULL,
  PRIMARY KEY(`ID`)
);

CREATE TABLE `Repair`(
  `Action_type` CHAR NOT NULL,
  `Odometer` BIGINT,
  `Final_cost` INT,
  `Action_desc` VARCHAR NOT NULL,
  `Date` DATE NOT NULL,
  `Vehicle_ID` VARCHAR NOT NULL,
  PRIMARY KEY(`Action_type`)
);

CREATE TABLE `Countries`
  (`Name` VARCHAR NOT NULL, `Languages_ID` INT NOT NULL, PRIMARY KEY(`Name`));

CREATE TABLE `Games_Officials`(
  `ID` INT NOT NULL,
  `Countries_Name` VARCHAR NOT NULL,
  `Based_city_ID` VARCHAR(8) NOT NULL,
  `Name` VARCHAR NOT NULL,
  `Role` VARCHAR NOT NULL,
  `Languages_ID` INT NOT NULL,
  PRIMARY KEY(`ID`)
);

CREATE TABLE `Drivers_Informations`(
  `ID` INT NOT NULL,
  `Name` VARCHAR NOT NULL,
  `License_number` BIGINT(18) NOT NULL,
  `Clerence_level` INT NOT NULL,
  `SLTVT_Level` INT,
  `FATL_Level` INT,
  `Languages_ID` INT NOT NULL,
  PRIMARY KEY(`ID`)
);

CREATE TABLE `FATL`(
  `Level` INT,
  `Qualification_date` DATE,
  `Drivers_Informations_ID` INT NOT NULL,
  PRIMARY KEY(`Level`)
);

CREATE TABLE `SLTVT`(
  `Level` INT,
  `Qualification_date` DATE,
  `Certifying_autho` VARCHAR,
  `Drivers_Informations_ID` INT NOT NULL,
  PRIMARY KEY(`Level`)
);

CREATE TABLE `Booking`(
  `ID` INT NOT NULL,
  `Trip_start` DATETIME NOT NULL,
  `Trip_end` DATETIME NOT NULL,
  `Odometer_start` BIGINT NOT NULL,
  `Odometer_end` BIGINT NOT NULL,
  `Games_Officials_ID` INT NOT NULL,
  `Drivers_Informations_ID` INT NOT NULL,
  `Vehicle_ID` VARCHAR NOT NULL,
  `Trip_ID` INT NOT NULL,
  PRIMARY KEY(`ID`)
);

CREATE TABLE `Trip`(
  `ID` INT NOT NULL,
  `Pick_Up_ID` INT NOT NULL,
  `Drop_Off_ID` INT NOT NULL,
  PRIMARY KEY(`ID`)
);

CREATE TABLE `Languages`(`ID` INT NOT NULL, PRIMARY KEY(`ID`));

CREATE TABLE `Pick_Up`(
  `ID` INT NOT NULL,
  `Adress` VARCHAR NOT NULL,
  `Location_Type` VARCHAR NOT NULL,
  PRIMARY KEY(`ID`)
);

CREATE TABLE `Drop_Off`(
  `ID` INT NOT NULL,
  `Adress` VARCHAR NOT NULL,
  `Location_Type` VARCHAR NOT NULL,
  PRIMARY KEY(`ID`)
);

ALTER TABLE `Repair`
  ADD CONSTRAINT `Vehicle_Repair`
    FOREIGN KEY (`Vehicle_ID`) REFERENCES `Vehicle` (`ID`);

ALTER TABLE `Drivers_Informations`
  ADD CONSTRAINT `SLTVT_Drivers informations`
    FOREIGN KEY (`SLTVT_Level`) REFERENCES `SLTVT` (`Level`);

ALTER TABLE `Drivers_Informations`
  ADD CONSTRAINT `FATL_Drivers informations`
    FOREIGN KEY (`FATL_Level`) REFERENCES `FATL` (`Level`);

ALTER TABLE `Games_Officials`
  ADD CONSTRAINT `Countries_Games Officials`
    FOREIGN KEY (`Countries_Name`) REFERENCES `Countries` (`Name`);

ALTER TABLE `Booking`
  ADD CONSTRAINT `Vehicle_Booking`
    FOREIGN KEY (`Vehicle_ID`) REFERENCES `Vehicle` (`ID`);

ALTER TABLE `Booking`
  ADD CONSTRAINT `Trip_Booking` FOREIGN KEY (`Trip_ID`) REFERENCES `Trip` (`ID`)
  ;

ALTER TABLE `Countries`
  ADD CONSTRAINT `Languages_Countries`
    FOREIGN KEY (`Languages_ID`) REFERENCES `Languages` (`ID`);

ALTER TABLE `Games_Officials`
  ADD CONSTRAINT `Languages_Games_Officials`
    FOREIGN KEY (`Languages_ID`) REFERENCES `Languages` (`ID`);

ALTER TABLE `Vehicle`
  ADD CONSTRAINT `Repair_Vehicle`
    FOREIGN KEY (`Repair_Action_type`) REFERENCES `Repair` (`Action_type`);

ALTER TABLE `Drivers_Informations`
  ADD CONSTRAINT `Languages_Drivers_Informations`
    FOREIGN KEY (`Languages_ID`) REFERENCES `Languages` (`ID`);

ALTER TABLE `Trip`
  ADD CONSTRAINT `Pick_Up_Trip`
    FOREIGN KEY (`Pick_Up_ID`) REFERENCES `Pick_Up` (`ID`);

ALTER TABLE `Trip`
  ADD CONSTRAINT `Drop_Off_Trip`
    FOREIGN KEY (`Drop_Off_ID`) REFERENCES `Drop_Off` (`ID`);

ALTER TABLE `FATL`
  ADD CONSTRAINT `Drivers_Informations_FATL`
    FOREIGN KEY (`Drivers_Informations_ID`) REFERENCES `Drivers_Informations` (`ID`)
  ;

ALTER TABLE `SLTVT`
  ADD CONSTRAINT `Drivers_Informations_SLTVT`
    FOREIGN KEY (`Drivers_Informations_ID`) REFERENCES `Drivers_Informations` (`ID`)
  ;

ALTER TABLE `Booking`
  ADD CONSTRAINT `Games_Officials_Booking`
    FOREIGN KEY (`Games_Officials_ID`) REFERENCES `Games_Officials` (`ID`);

ALTER TABLE `Booking`
  ADD CONSTRAINT `Drivers_Informations_Booking`
    FOREIGN KEY (`Drivers_Informations_ID`) REFERENCES `Drivers_Informations` (`ID`)
  ;
