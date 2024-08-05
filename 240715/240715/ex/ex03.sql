-- 공인중개사
-- 공인중개 사무실 이름 (office), 공인중개 사무실 연락처 (phoneNumber), 공인중개 사무실 주소(address), 공인증개 등급 (grade)
CREATE TABLE `realtor`(
	`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`office` VARCHAR(64) NOT NULL,
    `phoneNumber` VARCHAR(16) NOT NULL,
    `address` VARCHAR(64) NOT NULL,
    `grade` VARCHAR(8) NOT NULL,
    `createdAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 매물 
-- 매물 주소(address), 매물 면적(area), 거래 종류 (type), 거래 가격 (price), 월세 (rentPrice)
CREATE TABLE `real estate`(
	`id` INt NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `realtorId` INT NOT NULL,
    `address` VARCHAR(64) NOT NULL,
    `area` INT NOT NULL,
    `type` VARCHAR(4) NOT NULL,
    `price` INT,
    `rentPrice` INT,
    `createdAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 확인
DESC `realtor`;
DESC `real estate`;
SELECT * FROM `realtor`;
SELECT * FROM `real estate`;
DROP TABLE `real estate`;

-- realtor 값 삽입
INSERT INTO `realtor`
(`office`, `phoneNumber`, `address`, `grade`)
VALUES
('황금부동산', '02-300-2000', '서울시 서초구', '안심중개사'),
('대박 공인중개사', '02-000-7777', '서울시 동작구', '일반중개사');

-- id 확인
SELECT * FROM `realtor` WHERE `office` = '황금부동산';
SELECT * FROM `realtor` WHERE `office` = '대박 공인중개사';

-- real estate 값 삽입
INSERT INTO `real estate`
(`realtorId`, `address`, `area`, `type`, `price`, `rentPrice`)
VALUES
('1','레미얀 레이크 아파트 301동 905호','84','전세','40000', NULL),
('2','레알편한세상 시티 505동 101호','110','매매','120000', NULL),
('1','롱데캐슬 101동 402호','87','월세','20000','200'),
('1','슼뷰 오피스텔 1210호','55','월세','10000','100'),
('2','푸르지용 리버 203동 804호','123','매매','170000',NULL);

-- 매물 찾기 : 황금 부동산의 월세 매물, 매물 주소, 보증금, 월세
SELECT * FROM `realtor` WHERE `office` = '황금부동산';
SELECT `type`, `address`, `price`, `rentPrice` FROM `real estate` WHERE `realtorId` = 1 AND `type`='월세';

-- 옵션 리스트
-- 매물의 옵션정보를 저장하는 테이블을 만드세요
-- 옵션 종류
-- 에이컨, 세탁기, 냉장고, 옷장
-- 매물 정보와 연결되도록 테이블을 설계하세요.
CREATE TABLE `option`(
	`id` INt NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `realEstateId` INT NOT NULL,
    `option` VARCHAR(8) NOT NULL, -- 세탁기
    `createdAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `option`
(`realEstateId`, `option`)
VALUES
(5, '에어컨'),
(5, '냉장고'),
(5, '가스렌지'),
(3, '세탁기'),
(3, '에어컨');

