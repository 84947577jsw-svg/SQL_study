-- =====================================================
-- W Concept 크롤링 데이터베이스 스키마
-- =====================================================

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema wconcept_260909
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `wconcept_260909`
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_unicode_ci;
USE `wconcept_260909`;


-- -----------------------------------------------------
-- Table `brands`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `brands` (
  `brand_id`   INT NOT NULL AUTO_INCREMENT,
  `brand_name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`brand_id`),
  UNIQUE INDEX `uq_brands_brand_name` (`brand_name` ASC)
) ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `products` (
  `product_id`        INT NOT NULL AUTO_INCREMENT,
  `source_product_id` INT NOT NULL COMMENT 'W컨셉 사이트의 원본 상품 ID',
  `product_name`      VARCHAR(300) NOT NULL,
  `product_url`       VARCHAR(300) NOT NULL,
  `brand_id`          INT NOT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE INDEX `uq_products_source_product_id` (`source_product_id` ASC),
  UNIQUE INDEX `uq_products_product_url` (`product_url` ASC),
  INDEX `idx_products_brand_id` (`brand_id` ASC),
  CONSTRAINT `fk_products_brands`
    FOREIGN KEY (`brand_id`)
    REFERENCES `brands` (`brand_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `product_snapshots`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `product_snapshots` (
  `snapshot_id`    INT NOT NULL AUTO_INCREMENT,
  `product_id`     INT NOT NULL,
  `original_price` INT NULL,
  `sale_price`     INT NULL,
  `discount_rate`  DECIMAL(5,2) NULL,
  `rating`         DECIMAL(3,2) NULL,
  `review_count`   INT NULL,
  `like_count`     INT NULL,
  `collected_at`   DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`snapshot_id`),
  UNIQUE INDEX `uq_snapshots_product_time` (`product_id` ASC, `collected_at` ASC),
  INDEX `idx_snapshots_collected_at` (`collected_at` ASC),
  CONSTRAINT `fk_snapshots_products`
    FOREIGN KEY (`product_id`)
    REFERENCES `products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `best_rankings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `best_rankings` (
  `ranking_id`   INT NOT NULL AUTO_INCREMENT,
  `product_id`   INT NOT NULL,
  `ranking_no`   INT NOT NULL,
  `collected_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ranking_id`),
  UNIQUE INDEX `uq_rankings_product_time` (`product_id` ASC, `collected_at` ASC),
  INDEX `idx_rankings_collected_at` (`collected_at` ASC),
  CONSTRAINT `fk_rankings_products`
    FOREIGN KEY (`product_id`)
    REFERENCES `products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `raw_wconcept_products`
-- 크롤링 원본 적재용. FK 제약 없음.
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `raw_wconcept_products` (
  `raw_id`         INT NOT NULL AUTO_INCREMENT,
  `brand_id`       INT NULL COMMENT 'W컨셉 사이트의 원본 브랜드 ID',
  `brand_name`     VARCHAR(100) NULL,
  `product_id`     INT NULL COMMENT 'W컨셉 사이트의 원본 상품 ID',
  `product_name`   VARCHAR(300) NULL,
  `product_url`    VARCHAR(300) NULL,
  `original_price` INT NULL,
  `sale_price`     INT NULL,
  `discount_rate`  DECIMAL(5,2) NULL,
  `rating`         DECIMAL(3,2) NULL,
  `review_count`   INT NULL,
  `like_count`     INT NULL,
  `ranking_no`     INT NULL,
  `collected_at`   DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`raw_id`),
  INDEX `idx_raw_collected_at` (`collected_at` ASC),
  INDEX `idx_raw_product_id` (`product_id` ASC)
) ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

USE wconcept_260909;
SHOW TABLES;
