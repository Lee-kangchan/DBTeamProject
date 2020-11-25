-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE=''ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION'';

-- -----------------------------------------------------
-- Schema db2020
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db2020
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db2020` DEFAULT CHARACTER SET utf8 ;
USE `db2020` ;

-- -----------------------------------------------------
-- Table `db2020`.`rental_membership`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db2020`.`rental_membership` (
  `rental_membership_seq` INT NOT NULL AUTO_INCREMENT,
  `rental_membership_name` VARCHAR(45) NOT NULL,
  `rental_membership_benefit` INT NOT NULL,
  PRIMARY KEY (`rental_membership_seq`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db2020`.`borrow_membership`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db2020`.`borrow_membership` (
  `borrow_membership_seq` INT NOT NULL AUTO_INCREMENT,
  `borrow_membership_name` VARCHAR(45) NOT NULL,
  `borrow_membership_benefit` INT NOT NULL,
  PRIMARY KEY (`borrow_membership_seq`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db2020`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db2020`.`customer` (
  `customer_seq` INT NOT NULL AUTO_INCREMENT,
  `customer_id` VARCHAR(45) NOT NULL,
  `customer_pw` VARCHAR(45) NOT NULL,
  `customer_name` VARCHAR(45) NOT NULL,
  `customer_nickname` VARCHAR(45) NOT NULL,
  `customer_deal_address` VARCHAR(45) NOT NULL,
  `customer_phone` VARCHAR(45) NOT NULL,
  `customer_address` VARCHAR(45) NOT NULL,
  `customer_point` VARCHAR(45) NOT NULL DEFAULT 0,
  `customer_bad_yn` ENUM("y", "n") NOT NULL DEFAULT ''n'',
  `rental_membership_rental_membership_seq` INT NOT NULL,
  `borrow_membership_borrow_membership_seq` INT NOT NULL,
  `customer_customer_seq` INT NOT NULL,
  PRIMARY KEY (`customer_seq`),
  INDEX `fk_customer_rental_membership1_idx` (`rental_membership_rental_membership_seq` ASC) ,
  INDEX `fk_customer_borrow_membership1_idx` (`borrow_membership_borrow_membership_seq` ASC) ,
  INDEX `fk_customer_customer1_idx` (`customer_customer_seq` ASC) ,
  CONSTRAINT `fk_customer_rental_membership1`
    FOREIGN KEY (`rental_membership_rental_membership_seq`)
    REFERENCES `db2020`.`rental_membership` (`rental_membership_seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_customer_borrow_membership1`
    FOREIGN KEY (`borrow_membership_borrow_membership_seq`)
    REFERENCES `db2020`.`borrow_membership` (`borrow_membership_seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_customer_customer1`
    FOREIGN KEY (`customer_customer_seq`)
    REFERENCES `db2020`.`customer` (`customer_seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db2020`.`card`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db2020`.`card` (
  `card_num` VARCHAR(20) NOT NULL,
  `customer_customer_seq` INT NOT NULL,
  `card_type` VARCHAR(45) NOT NULL,
  `card_valitiy` VARCHAR(5) NOT NULL,
  `card_cvc` VARCHAR(5) NOT NULL,
  `card_pw` VARCHAR(5) NOT NULL,
  `card_approval_pw` VARCHAR(10) NOT NULL,
  INDEX `fk_card_customer_idx` (`customer_customer_seq` ASC) ,
  PRIMARY KEY (`card_num`),
  CONSTRAINT `fk_card_customer`
    FOREIGN KEY (`customer_customer_seq`)
    REFERENCES `db2020`.`customer` (`customer_seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db2020`.`approval`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db2020`.`approval` (
  `approval_seq` INT NOT NULL AUTO_INCREMENT,
  `customer_customer_seq` INT NOT NULL,
  `approval_point` INT NOT NULL,
  `approval_yn` ENUM("+", "-") NOT NULL,
  `approval_detail` VARCHAR(100) NOT NULL,
  `approval_createAt` DATETIME NOT NULL DEFAULT now(),
  PRIMARY KEY (`approval_seq`),
  INDEX `fk_approval_customer1_idx` (`customer_customer_seq` ASC) ,
  CONSTRAINT `fk_approval_customer1`
    FOREIGN KEY (`customer_customer_seq`)
    REFERENCES `db2020`.`customer` (`customer_seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db2020`.`book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db2020`.`book` (
  `book_isbn` INT NOT NULL,
  `book_name` VARCHAR(45) NOT NULL,
  `book_year` INT NOT NULL,
  `book_img` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`book_isbn`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db2020`.`review`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db2020`.`review` (
  `reivew_seq` INT NOT NULL AUTO_INCREMENT,
  `customer_customer_seq` INT NOT NULL,
  `book_book_isbn` INT NOT NULL,
  `review_title` VARCHAR(45) NOT NULL,
  `reivew_detail` VARCHAR(45) NOT NULL,
  `review_score` VARCHAR(45) NOT NULL,
  `review_createAt` DATETIME NOT NULL DEFAULT now(),
  PRIMARY KEY (`reivew_seq`),
  INDEX `fk_review_customer1_idx` (`customer_customer_seq` ASC) ,
  INDEX `fk_review_book1_idx` (`book_book_isbn` ASC) ,
  CONSTRAINT `fk_review_customer1`
    FOREIGN KEY (`customer_customer_seq`)
    REFERENCES `db2020`.`customer` (`customer_seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_review_book1`
    FOREIGN KEY (`book_book_isbn`)
    REFERENCES `db2020`.`book` (`book_isbn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db2020`.`review_report`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db2020`.`review_report` (
  `review_report_seq` INT NOT NULL AUTO_INCREMENT,
  `review_reivew_seq` INT NOT NULL,
  `review_report_reason` VARCHAR(100) NOT NULL,
  `review_report_createAt` DATETIME NOT NULL DEFAULT now(),
  PRIMARY KEY (`review_report_seq`),
  INDEX `fk_review_report_review1_idx` (`review_reivew_seq` ASC) ,
  CONSTRAINT `fk_review_report_review1`
    FOREIGN KEY (`review_reivew_seq`)
    REFERENCES `db2020`.`review` (`reivew_seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db2020`.`customer_book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db2020`.`customer_book` (
  `book_board_seq` INT NOT NULL AUTO_INCREMENT,
  `customer_customer_seq` INT NOT NULL,
  `book_book_isbn` INT NOT NULL,
  `customer_book_category` VARCHAR(45) NOT NULL,
  `customer_book_deposit` INT NOT NULL,
  `customer_book_comment` VARCHAR(100) NOT NULL,
  `customer_book_type` VARCHAR(45) NOT NULL,
  `customer_book_certification_yn` VARCHAR(45) NOT NULL,
  `customer_book_reason` VARCHAR(45) NOT NULL,
  `customer_book_secret_number` VARCHAR(45) NOT NULL,
  `customer_book_createAt` DATETIME NOT NULL DEFAULT now(),
  PRIMARY KEY (`book_board_seq`),
  INDEX `fk_book_board_customer1_idx` (`customer_customer_seq` ASC) ,
  INDEX `fk_book_board_book1_idx` (`book_book_isbn` ASC) ,
  CONSTRAINT `fk_book_board_customer1`
    FOREIGN KEY (`customer_customer_seq`)
    REFERENCES `db2020`.`customer` (`customer_seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_book_board_book1`
    FOREIGN KEY (`book_book_isbn`)
    REFERENCES `db2020`.`book` (`book_isbn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db2020`.`match`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db2020`.`match` (
  `match_seq` INT NOT NULL AUTO_INCREMENT,
  `match_deal_address` VARCHAR(45) NOT NULL,
  `match_expected_endAt` VARCHAR(45) NOT NULL,
  `match_endAt` DATE NOT NULL,
  `match_type` ENUM("거래완료", "대여", "반납", "거래취소") NOT NULL,
  `match_rental_yn` INT NOT NULL,
  `match_borrow_yn` INT NOT NULL,
  `customer_secret_num` VARCHAR(45) NOT NULL,
  `book_board_book_board_seq` INT NOT NULL,
  `customer_customer_seq` INT NOT NULL,
  PRIMARY KEY (`match_seq`),
  INDEX `fk_match_book_board1_idx` (`book_board_book_board_seq` ASC) ,
  INDEX `fk_match_customer1_idx` (`customer_customer_seq` ASC) ,
  CONSTRAINT `fk_match_book_board1`
    FOREIGN KEY (`book_board_book_board_seq`)
    REFERENCES `db2020`.`customer_book` (`book_board_seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_match_customer1`
    FOREIGN KEY (`customer_customer_seq`)
    REFERENCES `db2020`.`customer` (`customer_seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db2020`.`reservation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db2020`.`reservation` (
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
    REFERENCES `db2020`.`customer` (`customer_seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reservation_match1`
    FOREIGN KEY (`match_match_seq`)
    REFERENCES `db2020`.`match` (`match_seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db2020`.`promotion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db2020`.`promotion` (
  `promotion_seq` INT NOT NULL AUTO_INCREMENT,
  `promotion_title` VARCHAR(45) NOT NULL,
  `promotion_image` VARCHAR(100) NULL,
  `promotion_startAt` DATE NOT NULL,
  `promotion_endAt` DATE NOT NULL,
  PRIMARY KEY (`promotion_seq`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db2020`.`promotion_board`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db2020`.`promotion_board` (
  `promotion_board_seq` INT NOT NULL AUTO_INCREMENT,
  `customer_customer_seq` INT NOT NULL,
  `promotion_promotion_seq` INT NOT NULL,
  `promotion_board_comment` VARCHAR(45) NOT NULL,
  `promotion_board_recommend` INT NOT NULL DEFAULT 0,
  `promotion_board_createAt` DATETIME NOT NULL DEFAULT now(),
  PRIMARY KEY (`promotion_board_seq`),
  INDEX `fk_promotion_board_customer1_idx` (`customer_customer_seq` ASC) ,
  INDEX `fk_promotion_board_promotion1_idx` (`promotion_promotion_seq` ASC) ,
  CONSTRAINT `fk_promotion_board_customer1`
    FOREIGN KEY (`customer_customer_seq`)
    REFERENCES `db2020`.`customer` (`customer_seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_promotion_board_promotion1`
    FOREIGN KEY (`promotion_promotion_seq`)
    REFERENCES `db2020`.`promotion` (`promotion_seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db2020`.`sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db2020`.`sales` (
  `sales_seq` INT NOT NULL AUTO_INCREMENT,
  `sales_money` INT NOT NULL,
  `sales_type` ENUM("+", "-") NOT NULL,
  `sales_detail` VARCHAR(100) NOT NULL,
  `sales_createAt` DATETIME NOT NULL DEFAULT now(),
  PRIMARY KEY (`sales_seq`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db2020`.`customer_report`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db2020`.`customer_report` (
  `customer_report_seq` INT NOT NULL AUTO_INCREMENT,
  `match_match_seq` INT NOT NULL,
  `customer_report_image` VARCHAR(100) NULL,
  `customer_report_reason` VARCHAR(100) NOT NULL,
  `customer_report_createAt` DATETIME NOT NULL,
  PRIMARY KEY (`customer_report_seq`),
  INDEX `fk_customer_report_match1_idx` (`match_match_seq` ASC) ,
  CONSTRAINT `fk_customer_report_match1`
    FOREIGN KEY (`match_match_seq`)
    REFERENCES `db2020`.`match` (`match_seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db2020`.`match_image`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db2020`.`match_image` (
  `match_image_seq` INT NOT NULL AUTO_INCREMENT,
  `match_match_seq` INT NOT NULL,
  `match_image_path` VARCHAR(100) NOT NULL,
  `match_image_name` VARCHAR(45) NOT NULL,
  `match_image_type` ENUM("returns", "rental") NOT NULL,
  PRIMARY KEY (`match_image_seq`),
  INDEX `fk_match_image_match1_idx` (`match_match_seq` ASC) ,
  CONSTRAINT `fk_match_image_match1`
    FOREIGN KEY (`match_match_seq`)
    REFERENCES `db2020`.`match` (`match_seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db2020`.`promotion_benefit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db2020`.`promotion_benefit` (
  `promotion_benefit_seq` INT NOT NULL AUTO_INCREMENT,
  `promotion_promotion_seq` INT NOT NULL,
  `promotion_benefit_name` VARCHAR(45) NOT NULL,
  `promotion_benefit_price` INT NOT NULL,
  `promotion_benefit_limit` INT NOT NULL,
  PRIMARY KEY (`promotion_benefit_seq`),
  INDEX `fk_promotion_win_promotion1_idx` (`promotion_promotion_seq` ASC) ,
  CONSTRAINT `fk_promotion_win_promotion1`
    FOREIGN KEY (`promotion_promotion_seq`)
    REFERENCES `db2020`.`promotion` (`promotion_seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db2020`.`best_rental`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db2020`.`best_rental` (
  `best_rental_seq` INT NOT NULL,
  `rental_membership_rental_membership_seq` INT NOT NULL,
  `best_rental_rank` INT NOT NULL,
  `best_rental_createAt` DATETIME NOT NULL DEFAULT now(),
  PRIMARY KEY (`best_rental_seq`),
  INDEX `fk_best_rental_rental_membership1_idx` (`rental_membership_rental_membership_seq` ASC) ,
  CONSTRAINT `fk_best_rental_rental_membership1`
    FOREIGN KEY (`rental_membership_rental_membership_seq`)
    REFERENCES `db2020`.`rental_membership` (`rental_membership_seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db2020`.`best_borrow`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db2020`.`best_borrow` (
  `best_borrow_seq` INT NOT NULL,
  `borrow_membership_borrow_membership_seq` INT NOT NULL,
  `best_borrow_rank` VARCHAR(45) NOT NULL,
  `best_borrow_createAt` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`best_borrow_seq`),
  INDEX `fk_best_borrow_borrow_membership1_idx` (`borrow_membership_borrow_membership_seq` ASC) ,
  CONSTRAINT `fk_best_borrow_borrow_membership1`
    FOREIGN KEY (`borrow_membership_borrow_membership_seq`)
    REFERENCES `db2020`.`borrow_membership` (`borrow_membership_seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db2020`.`promotion_winner`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db2020`.`promotion_winner` (
  `customer_customer_seq` INT NOT NULL,
  `promotion_benefit_promotion_benefit_seq` INT NOT NULL,
  PRIMARY KEY (`customer_customer_seq`, `promotion_benefit_promotion_benefit_seq`),
  INDEX `fk_promotion_winner_promotion_benefit1_idx` (`promotion_benefit_promotion_benefit_seq` ASC) ,
  CONSTRAINT `fk_promotion_winner_customer1`
    FOREIGN KEY (`customer_customer_seq`)
    REFERENCES `db2020`.`customer` (`customer_seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_promotion_winner_promotion_benefit1`
    FOREIGN KEY (`promotion_benefit_promotion_benefit_seq`)
    REFERENCES `db2020`.`promotion_benefit` (`promotion_benefit_seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db2020`.`book_board_image`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db2020`.`book_board_image` (
  `book_board_image_seq` INT NOT NULL,
  `book_board_book_board_seq` INT NOT NULL,
  `book_board_image_name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`book_board_image_seq`),
  INDEX `fk_book_board_image_book_board1_idx` (`book_board_book_board_seq` ASC) ,
  CONSTRAINT `fk_book_board_image_book_board1`
    FOREIGN KEY (`book_board_book_board_seq`)
    REFERENCES `db2020`.`customer_book` (`book_board_seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
