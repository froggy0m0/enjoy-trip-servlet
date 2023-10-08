use enjoytrip;

CREATE TABLE IF NOT EXISTS `enjoytrip`.`comment` (
    `commentNo` INT NOT NULL AUTO_INCREMENT,
    `article_no` INT NOT NULL,
    `user_id` VARCHAR(16) NULL DEFAULT NULL,
	`comment` VARCHAR(2000) NULL DEFAULT NULL,
	`like_count` int NULL default 0,
    `register_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
      PRIMARY KEY (`commentNo`)
  )
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;