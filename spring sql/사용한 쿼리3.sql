SELECT * FROM `seller`;

SELECT * FROM `weatherhistory`;

SELECT * FROM `new_user`;


SELECT * FROM `booking`;

SELECT * FROM `url`;

SELECT
		*
FROM
		`url`
WHERE
		`url` = 'https://getbootstrap.kr/docs/5.0/components/buttons/3';
        
        
SELECT
	`id`
	, `name`
	, `headcount`
	, `day`
	, `date`
	, `phoneNumber`
	, `state`
FROM
	`booking`
WHERE
	`name` = 'name2'
	AND `phoneNumber` = '010-222-2222';

SELECT * FROM `student`;

CREATE TABLE `student` (
	`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(32) NOT NULL, 
    `phoneNumber` VARCHAR(16) NOT NULL, 
    `email` VARCHAR(16) NOT NULL, 
    `dreamJob` VARCHAR(16) NOT NULL,
    `createdAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- 시험 성적 정보 
CREATE TABLE `new_score` (
	`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `studentId` INT NOT NULL,
    `year` INT NOT NULL, 
    `semester` TINYINT  NOT NULL, 
    `term` VARCHAR(8) NOT NULL, 
    `subject` VARCHAR(16) NOT NULL, 
    `score` TINYINT NOT NULL, 
    `createdAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 학생 정보 저장
INSERT INTO `student` 
(`name`, `phoneNumber`, `email`, `dreamJob`)
VALUES 
('유재석', '01000001111', 'mc_u@naver.com', '프로그래머'),
('조세호', '01011110000', 'mrjo@gmail.com', '모델');

INSERT INTO `new_score`
(`studentId`, `year`, `semester`, `term`, `subject`, `score`)
VALUES 
(1, 2020, 1, '중간고사', '국어', 80),
(1, 2020, 1, '중간고사', '영어', 95),
(1, 2020, 1, '중간고사', '수학', 90),
(2, 2020, 1, '중간고사', '국어', 85),
(2, 2020, 1, '중간고사', '영어', 90),
(2, 2020, 1, '중간고사', '수학', 70);