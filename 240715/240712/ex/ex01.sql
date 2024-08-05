-- 학생 정보 테이블
-- 이름, 전공, 학번

CREATE TABLE `student` (
	`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(16) NOT NULL,
    `major` VARCHAR(16) NOT NULL,
    `number` VARCHAR(16) NOT NULL,
    INDEX `idx_name`(`name`),
    UNIQUE INDEX `idx_number` (`number`), -- 중복된 값이 저장되지 않는 컬럼
    INDEX `idx_name_major` (`name`, `major`)
);

DROP TABLE  `student`;

CREATE TABLE `student` (
	`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(16) NOT NULL,
    `major` VARCHAR(16) NOT NULL,
    `number` VARCHAR(16) NOT NULL
);

-- 기본 인덱스 추가
ALTER TABLE `student` ADD INDEX `idx_name`(`name`);

-- 유니크 인덱스 추가
ALTER TABLE `student` ADD UNIQUE INDEX `idx_number`(`number`);

