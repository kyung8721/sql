-- 예약 내역 데이터

-- 1. 테이블 생성
-- 위 데이터를 기반으로 테이블을 설계하고 생성하세요.
-- 테이블 이름은 booking 으로 만드세요.
-- 컬럼 이름은 위 데이터의 괄호안에 단어를 이용하세요.
-- 자동으로 증가하는 id를 만드세요.
-- 생성시간과, 업데이트 시간을 관리하는 컬럼을 포함하세요.
CREATE TABLE `booking`(
	`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(16) NOT NULL,
    `headcount` TINYINT NOT NULL,
    `day` TINYINT NOT NULL,
    `date` DATETIME NOT NULL,
    `phoneNumber` VARCHAR(16) NOT NULL,
    `state` VARCHAR(4) DEFAULT '대기중',
    `createdAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- 숫자 애매하면 2의 제곱으로 잡기

DESC `booking`;
SELECT * FROM `booking`;
DROP TABLE `booking`;

-- 2. 데이터 저장
-- 생성된 테이블에 위 데이터를 모두 insert 하세요.
INSERT INTO `booking`
(`name`,`headcount`,`day`,`date`,`phoneNumber`, `state`,`createdAt`,`updatedAt`)
VALUES
('강하늘', 2, 1, '2025-07-21', '010-1234-1111','대기중', now(), now()),
('김종국', 4, 1, '2025-08-04', '010-1212-2121', '확정',now(), now()),
('박명수', 2, 4, '2025-06-12', '010-0000-0000','취소',now(), now()),
('마동석', 2, 1, '2025-10-30','010-1010-0101','대기중',now(), now() ),
('박나래', 10, 3, '2025-06-23', '010-1111-2222', '확정',now(), now()),
('혜리', 2,2,'2025-04-12','010-9999-9999', '확정', now(), now()),
('황찬성',25,1,'2025-09-11','010-0000-2222', '확정', now(), now()),
('탁재훈',4,3,'2025-07-12','010-1111-0000','대기중', now(), now()),
('장나라',2,1,'2025-09-12','010-2222-0000', '확정', now(), now());


-- 3. 날짜 조건
-- 2025 년 8월 부터 예약된 예약내역을 모두 조회하세요.
SELECT `name`, `date`, `state` FROM `booking` WHERE `date` >= '2025-08-01 00:00:00';

-- 4. 복합 조건
-- 예약상태가 확정 인 내역중에 숙박인원이 4명 이상이거나 숙박일수가 2일 이상인 경우를 모두 조회하세요.
SELECT `name`, `headcount`, `day`, `state` FROM `booking`
WHERE `state` = '확정' AND(`headcount` >= 4 OR `day` >= 2);

-- 5. 카운트
-- 숙박일수가 1일이고 예약상태가 대기중인 내역의 개수를 조회하세요.
-- 결과 : 2
SELECT count(*) FROM `booking`
WHERE `day`=1 AND `state`='대기중';

-- 6. 예약 상태 변경
-- 마동석과 탁재훈의 예약 상태를 취소로 변경하세요.
UPDATE `booking`
SET
	`state` = '취소',
    `updatedAt` = now()
WHERE `name` = '마동석' OR `name`='탁재훈';

-- 이렇게도 가능
-- UPDATE `booking`
-- SET
-- 	   `state` = '취소',
--     `updatedAt` = now()
-- WHERE `name` IN ('마동석', '탁재훈');

-- 7. 취소 삭제
-- 예약상태가 취소인 내역을 모두 삭제하세요.
SELECT * FROM `booking` WHERE `state` = '취소';
DELETE FROM `booking` WHERE `state` = '취소';