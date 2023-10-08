use enjoytrip;

DROP TABLE IF EXISTS `enjoytrip`.`board` ;

CREATE TABLE IF NOT EXISTS `enjoytrip`.`board` (
  `article_no` INT NOT NULL AUTO_INCREMENT,
  `user_id` VARCHAR(16) NULL DEFAULT NULL,
  `subject` VARCHAR(100) NULL DEFAULT NULL,
  `content` VARCHAR(2000) NULL DEFAULT NULL,
  `hit` INT NULL DEFAULT 0,
  `register_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`article_no`)
  
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

select * from board;

insert into board(user_id, subject, content) 
values
("테스트용아이디1", "테에에제목스트", "내용내용"),
("ssafy55", "ssafy제목1111", "ssafy1내용111"),
("곰곰곰곰곰", "곰곰곰제목곰곰", "곰곰곰내용곰곰"),
("강아지강아지", "강아지제목강아지", "강아지내용강아지"),
("토끼토끼", "토끼제목토끼", "토끼내용토끼"),
("대전대전", "대전제목대전", "대전내용대전"),
("싸피싸피", "싸피제목싸피", "싸피내용싸피"),
("안녕아녕", "안녕제목아녕", "안녕내용아녕"),
("방가방가", "방가제목방가", "방가내용방가");

insert into board(user_id, subject, content) 
values
("그냥그냥아이디", "아아아", "내용내용1"),
("두두둥", "두두아두두", "내용내용2");

insert into board(user_id, subject, content) 
values
("아아아이디", "아아아", "내용내용1"),
("우우우아", "그그그그", "내용내용2");