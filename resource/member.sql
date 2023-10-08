use enjoytrip;
-- drop table members; 
CREATE TABLE members (
user_id varchar(20) NOT NULL,
user_password varchar(60) NOT NULL,
user_email varchar(20) NOT NULL,
user_name varchar(20) NOT NULL,
user_age int(20) NOT NULL,
PRIMARY KEY (user_id)
);

insert into members(user_id, user_password, user_email, user_name, user_age)
values('ssafy','1234','ssafy@s.com','싸피', 20);