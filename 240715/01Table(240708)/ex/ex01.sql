-- 데이터 베이스 생성
CREATE DATABASE `dulmary`;

-- 사용자 정보 테이블
-- 이름, 생년월일(20040112), 취미, 자기소개alter

CREATE TABLE `person` (
	`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(16) NOT NULL,
    `birth` INT NOT NULL,
    `hobby` VARCHAR(64) NOT NULL,
    `introduce` TEXT,
    `createdAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 테이블 정보 확인
DESC `person`;
DESC `user`;

-- 테이블 삭제
DROP TABLE `person`;
DROP TABLE `user`;

-- 테이블 수정
-- 테이블 이름 변경
-- person -> user
ALTER TABLE `person` RENAME `user`;

-- 컬럼 추가
-- email 컬럼 추가
ALTER TABLE `user` ADD COLUMN `email` VARCHAR(16);

-- 컬럼 수정
-- email 컬럼의 최대 길이 수정
-- 수정항목만 작성하면 안됨
-- 컬럼에 대한 모든 항목을 다시 지정
ALTER TABLE `user`MODIFY COLUMN `email` VARCHAR(32);

-- 컬럼 이름 수정
-- birth -> yyyymmdd
-- 이름만 바꾸는 게 아니라 컬럼에 대한 모든 항목을 다시 지정
ALTER TABLE `user` CHANGE COLUMN `birth` `yyyymmdd` CHAR(8) NOT NULL;

ALTER TABLE `user` MODIFY COLUMN  `createdAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE `user` MODIFY COLUMN  `updatedAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
