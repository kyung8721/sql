-- id, 학생이름(name), 년도(year), 고사 이름(term), 과목(title), 성적(score), 입력 날짜(createdAt), 수정 날짜(updatedAt)

-- 테이블 생성
CREATE TABLE `score`(
	`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(8) NOT NULL,
    `year` INT NOT NULL,
    `term` CHAR(4) NOT NULL,
    `title` VARCHAR(4) NOT NULL,
    `score` TINYINT NOT NULL,
    `createdAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 테이블 확인
DESC `score`;

-- 컬럼 추가
ALTER TABLE `score` ADD COLUMN `semester` TINYINT NOT NULL AFTER `year`;

-- 테이블 삭제
DROP TABLE `score`;

-- 컬럼 이름 수정
ALTER TABLE `score` CHANGE COLUMN `title` `subject` VARCHAR(4) NOT NULL;

-- 컬럼 타입 수정
ALTER TABLE `score` MODIFY COLUMN `name` VARCHAR(32) NOT NULL;
ALTER TABLE `score` MODIFY COLUMN `subject` VARCHAR(16) NOT NULL;