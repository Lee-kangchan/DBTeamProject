-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema cloudbook
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cloudbook
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cloudbook` DEFAULT CHARACTER SET utf8 ;
USE `cloudbook` ;

-- -----------------------------------------------------
-- Table `cloudbook`.`rental_membership`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cloudbook`.`rental_membership` (
  `rental_membership_seq` INT NOT NULL AUTO_INCREMENT,
  `rental_membership_name` VARCHAR(45) NOT NULL,
  `rental_membership_benefit` INT NOT NULL,
  PRIMARY KEY (`rental_membership_seq`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cloudbook`.`borrow_membership`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cloudbook`.`borrow_membership` (
  `borrow_membership_seq` INT NOT NULL AUTO_INCREMENT,
  `borrow_membership_name` VARCHAR(45) NOT NULL,
  `borrow_membership_benefit` INT NOT NULL,
  PRIMARY KEY (`borrow_membership_seq`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cloudbook`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cloudbook`.`customer` (
  `customer_seq` INT NOT NULL AUTO_INCREMENT,
  `customer_id` VARCHAR(45) NOT NULL,
  `customer_pw` VARCHAR(45) NOT NULL,
  `customer_name` VARCHAR(45) NOT NULL,
  `customer_nickname` VARCHAR(45) NOT NULL,
  `customer_deal_address` VARCHAR(45) NOT NULL,
  `customer_phone` VARCHAR(45) NOT NULL,
  `customer_address` VARCHAR(45) NOT NULL,
  `customer_point` VARCHAR(45) NOT NULL DEFAULT 0,
  `customer_bad_yn` ENUM("y", "n") NOT NULL DEFAULT 'n',
  `rental_membership_rental_membership_seq` INT NOT NULL,
  `borrow_membership_borrow_membership_seq` INT NOT NULL,
  PRIMARY KEY (`customer_seq`),
  INDEX `fk_customer_rental_membership1_idx` (`rental_membership_rental_membership_seq` ASC) ,
  INDEX `fk_customer_borrow_membership1_idx` (`borrow_membership_borrow_membership_seq` ASC) ,
  CONSTRAINT `fk_customer_rental_membership1`
    FOREIGN KEY (`rental_membership_rental_membership_seq`)
    REFERENCES `cloudbook`.`rental_membership` (`rental_membership_seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_customer_borrow_membership1`
    FOREIGN KEY (`borrow_membership_borrow_membership_seq`)
    REFERENCES `cloudbook`.`borrow_membership` (`borrow_membership_seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cloudbook`.`card`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cloudbook`.`card` (
  `card_seq` INT NOT NULL AUTO_INCREMENT,
  `card_num` VARCHAR(20) NOT NULL,
  `card_valitiy` VARCHAR(5) NOT NULL,
  `card_cvc` VARCHAR(5) NOT NULL,
  `card_pw` VARCHAR(5) NOT NULL,
  `card_approval_pw` VARCHAR(10) NOT NULL,
  `customer_customer_seq` INT NOT NULL,
  PRIMARY KEY (`card_seq`),
  INDEX `fk_card_customer_idx` (`customer_customer_seq` ASC) ,
  CONSTRAINT `fk_card_customer`
    FOREIGN KEY (`customer_customer_seq`)
    REFERENCES `cloudbook`.`customer` (`customer_seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cloudbook`.`approval`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cloudbook`.`approval` (
  `approval_seq` INT NOT NULL AUTO_INCREMENT,
  `approval_point` INT NOT NULL,
  `approval_yn` ENUM("+", "-") NOT NULL,
  `approval_detail` VARCHAR(100) NOT NULL,
  `approval_createAt` DATETIME NOT NULL DEFAULT now(),
  `customer_customer_seq` INT NOT NULL,
  PRIMARY KEY (`approval_seq`),
  INDEX `fk_approval_customer1_idx` (`customer_customer_seq` ASC) ,
  CONSTRAINT `fk_approval_customer1`
    FOREIGN KEY (`customer_customer_seq`)
    REFERENCES `cloudbook`.`customer` (`customer_seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cloudbook`.`book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cloudbook`.`book` (
  `book_isbn` INT NOT NULL,
  `book_name` VARCHAR(45) NOT NULL,
  `book_year` INT NOT NULL,
  `book_img` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`book_isbn`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cloudbook`.`review`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cloudbook`.`review` (
  `reivew_seq` INT NOT NULL AUTO_INCREMENT,
  `review_title` VARCHAR(45) NOT NULL,
  `reivew_detail` VARCHAR(45) NOT NULL,
  `review_score` VARCHAR(45) NOT NULL,
  `review_createAt` DATETIME NOT NULL DEFAULT now(),
  `customer_customer_seq` INT NOT NULL,
  `book_book_isbn` INT NOT NULL,
  PRIMARY KEY (`reivew_seq`),
  INDEX `fk_review_customer1_idx` (`customer_customer_seq` ASC) ,
  INDEX `fk_review_book1_idx` (`book_book_isbn` ASC) ,
  CONSTRAINT `fk_review_customer1`
    FOREIGN KEY (`customer_customer_seq`)
    REFERENCES `cloudbook`.`customer` (`customer_seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_review_book1`
    FOREIGN KEY (`book_book_isbn`)
    REFERENCES `cloudbook`.`book` (`book_isbn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cloudbook`.`review_report`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cloudbook`.`review_report` (
  `review_report_seq` INT NOT NULL AUTO_INCREMENT,
  `review_report_reason` VARCHAR(100) NOT NULL,
  `review_report_createAt` DATETIME NOT NULL DEFAULT now(),
  `review_reivew_seq` INT NOT NULL,
  PRIMARY KEY (`review_report_seq`),
  INDEX `fk_review_report_review1_idx` (`review_reivew_seq` ASC) ,
  CONSTRAINT `fk_review_report_review1`
    FOREIGN KEY (`review_reivew_seq`)
    REFERENCES `cloudbook`.`review` (`reivew_seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cloudbook`.`book_board`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cloudbook`.`book_board` (
  `book_board_seq` INT NOT NULL AUTO_INCREMENT,
  `book_deposit` INT NOT NULL,
  `book_board_genre` VARCHAR(10) NOT NULL,
  `book_board_comment` VARCHAR(100) NOT NULL,
  `book_image` VARCHAR(100) NOT NULL,
  `book_certification_yn` VARCHAR(45) NOT NULL,
  `customer_customer_seq` INT NOT NULL,
  `book_book_isbn` INT NOT NULL,
  PRIMARY KEY (`book_board_seq`),
  INDEX `fk_book_board_customer1_idx` (`customer_customer_seq` ASC) ,
  INDEX `fk_book_board_book1_idx` (`book_book_isbn` ASC) ,
  CONSTRAINT `fk_book_board_customer1`
    FOREIGN KEY (`customer_customer_seq`)
    REFERENCES `cloudbook`.`customer` (`customer_seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_book_board_book1`
    FOREIGN KEY (`book_book_isbn`)
    REFERENCES `cloudbook`.`book` (`book_isbn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cloudbook`.`match`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cloudbook`.`match` (
  `match_seq` INT NOT NULL AUTO_INCREMENT,
  `match_deal_address` VARCHAR(45) NOT NULL,
  `match_expected_endAt` VARCHAR(45) NOT NULL,
  `match_endAt` DATE NOT NULL,
  `match_type` ENUM("거래완료", "대여", "반납", "거래취소") NOT NULL,
  `book_board_book_board_seq` INT NOT NULL,
  PRIMARY KEY (`match_seq`),
  INDEX `fk_match_book_board1_idx` (`book_board_book_board_seq` ASC) ,
  CONSTRAINT `fk_match_book_board1`
    FOREIGN KEY (`book_board_book_board_seq`)
    REFERENCES `cloudbook`.`book_board` (`book_board_seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cloudbook`.`reservation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cloudbook`.`reservation` (
  `reservation_seq` INT NOT NULL AUTO_INCREMENT,
  `reservation_createAt` DATETIME NOT NULL DEFAULT now(),
  `reservation_yn` ENUM("rental", "loan") NOT NULL,
  `customer_customer_seq` INT NOT NULL,
  `match_match_seq` INT NOT NULL,
  PRIMARY KEY (`reservation_seq`),
  INDEX `fk_reservation_customer1_idx` (`customer_customer_seq` ASC) ,
  INDEX `fk_reservation_match1_idx` (`match_match_seq` ASC) ,
  CONSTRAINT `fk_reservation_customer1`
    FOREIGN KEY (`customer_customer_seq`)
    REFERENCES `cloudbook`.`customer` (`customer_seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reservation_match1`
    FOREIGN KEY (`match_match_seq`)
    REFERENCES `cloudbook`.`match` (`match_seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cloudbook`.`promotion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cloudbook`.`promotion` (
  `promotion_seq` INT NOT NULL AUTO_INCREMENT,
  `promotion_title` VARCHAR(45) NOT NULL,
  `promotion_image` VARCHAR(100) NULL,
  `promotion_type` ENUM("진행예정", "진행중", "진행마감") NOT NULL,
  `promotion_startAt` DATE NOT NULL,
  `promotion_endAt` DATE NOT NULL,
  PRIMARY KEY (`promotion_seq`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cloudbook`.`promotion_board`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cloudbook`.`promotion_board` (
  `promotion_board_seq` INT NOT NULL AUTO_INCREMENT,
  `promotion_board_comment` VARCHAR(45) NOT NULL,
  `promotion_board_recommend` INT NOT NULL DEFAULT 0,
  `customer_customer_seq` INT NOT NULL,
  `promotion_promotion_seq` INT NOT NULL,
  PRIMARY KEY (`promotion_board_seq`),
  INDEX `fk_promotion_board_customer1_idx` (`customer_customer_seq` ASC) ,
  INDEX `fk_promotion_board_promotion1_idx` (`promotion_promotion_seq` ASC) ,
  CONSTRAINT `fk_promotion_board_customer1`
    FOREIGN KEY (`customer_customer_seq`)
    REFERENCES `cloudbook`.`customer` (`customer_seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_promotion_board_promotion1`
    FOREIGN KEY (`promotion_promotion_seq`)
    REFERENCES `cloudbook`.`promotion` (`promotion_seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cloudbook`.`sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cloudbook`.`sales` (
  `sales_seq` INT NOT NULL AUTO_INCREMENT,
  `sales_money` INT NOT NULL,
  `sales_createAt` DATETIME NOT NULL DEFAULT now(),
  `sales_type` ENUM("+", "-") NOT NULL,
  `sales_detail` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`sales_seq`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cloudbook`.`match_customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cloudbook`.`match_customer` (
  `match_customer_number` INT NOT NULL,
  `match_customer_type` ENUM("rental", "borrow") NOT NULL,
  `customer_customer_seq` INT NOT NULL,
  `match_match_seq` INT NOT NULL,
  PRIMARY KEY (`customer_customer_seq`, `match_match_seq`),
  INDEX `fk_match_customer_match1_idx` (`match_match_seq` ASC) ,
  CONSTRAINT `fk_match_customer_customer1`
    FOREIGN KEY (`customer_customer_seq`)
    REFERENCES `cloudbook`.`customer` (`customer_seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_match_customer_match1`
    FOREIGN KEY (`match_match_seq`)
    REFERENCES `cloudbook`.`match` (`match_seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cloudbook`.`customer_report`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cloudbook`.`customer_report` (
  `customer_report_seq` INT NOT NULL AUTO_INCREMENT,
  `customer_report_image` VARCHAR(100) NULL,
  `customer_report_reason` VARCHAR(100) NOT NULL,
  `customer_report_createAt` DATETIME NOT NULL,
  `match_customer_customer_customer_seq` INT NOT NULL,
  `match_customer_match_match_seq` INT NOT NULL,
  PRIMARY KEY (`customer_report_seq`),
  INDEX `fk_customer_report_match_customer1_idx` (`match_customer_customer_customer_seq` ASC, `match_customer_match_match_seq` ASC) ,
  CONSTRAINT `fk_customer_report_match_customer1`
    FOREIGN KEY (`match_customer_customer_customer_seq` , `match_customer_match_match_seq`)
    REFERENCES `cloudbook`.`match_customer` (`customer_customer_seq` , `match_match_seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cloudbook`.`match_image`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cloudbook`.`match_image` (
  `match_image_seq` INT NOT NULL AUTO_INCREMENT,
  `match_image_path` VARCHAR(100) NOT NULL,
  `match_image_name` VARCHAR(45) NOT NULL,
  `match_image_type` ENUM("loan", "rental") NOT NULL,
  `match_match_seq` INT NOT NULL,
  PRIMARY KEY (`match_image_seq`),
  INDEX `fk_match_image_match1_idx` (`match_match_seq` ASC) ,
  CONSTRAINT `fk_match_image_match1`
    FOREIGN KEY (`match_match_seq`)
    REFERENCES `cloudbook`.`match` (`match_seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
