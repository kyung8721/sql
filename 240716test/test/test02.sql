CREATE TABLE `real_estate` (
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `realtorId` INT NOT NULL,
    `address` VARCHAR(64) NOT NULL,
    `area` INT NOT NULL,
    `type` CHAR(2) NOT NULL,
    `price` INT NOT NULL,
    `rentPrice` INT,
    `createdAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `realtor` (
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `office` VARCHAR(16) NOT NULL,
    `phoneNumber` VARCHAR(16) NOT NULL,
    `address` VARCHAR(64) NOT NULL,
    `grade` VARCHAR(8) NOT NULL,
    `createdAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `realtor` 
(`office`, `phoneNumber`, `address`, `grade`)
VALUES 
('황금부동산', '02-300-2000', '서울시 서초구', '안심중개사'),
('대박공인중개사', '02-000-7777', '서울시 동작구', '일반중개사'), 
('굿모닝부동산', '02-999-1111', '서울시 강남구', '안심중개사'), 
('희망공인중개사', '02-222-0909', '서울시 송파구', '일반중개사'),
('럭키공인중개사', '02-777-7777', '서울시 동작구', '일반중개사'),
('믿음부동산', '02-333-9999', '서울시 서초구', '프리미엄중개사');

INSERT INTO `real_estate` 
(`realtorId`, `address`,  `area`, `type`, `price`, `rentPrice`)
VALUES (1, '레이얀 레이크 아파트 301동 905호', 84, '전세', 40000, NULL),
(5, '레알편한세상 시티 505동 101호', 110, '매매', 120000, NULL), 
(1, '롱데캐슬 101동 402호', 87, '월세', 20000, 200), 
(5, '슼뷰 오피스텔 1210호', 55, '월세', 10000, 100), 
(2, '푸르지용 파크 701동 2104호', 97, '매매', 90000, NULL),
(1, '굿타워 오피스텔 804호', 65, '전세', 20000, NULL), 
(4, '미래 홈타운 103동 104호', 88, '전세', 65000, NULL),
(2, '강남 헤리티지 시티 902동 606호', 90, '매매', 130000, NULL), 
(4, '푸르지용 리버 203동 804호', 123, '매매', 170000, NULL),
(1, '롱데캐슬 503동 802호', 107, '월세', 90000, 150), 
(2, '레알편한세상 시티 105동 806호', 110, '매매', 150000, NULL),
(6, '루체스타 오피스텔 1105호', 53, '월세', 10000, 50), 
(2, '와이파크 시티 205동 1603호', 113, '매매', 120000, NULL), 
(4, '썅떼빌리버 오피스텔 2214호', 45, '월세', 20000, 80), 
(6, '쉐리빌 아파트 603동 1904호', 75, '전세', 50000, NULL),
(1, '그랑시아 103동 306호', 145, '전세', 230000, NULL),
(4, '그랑샤 굿윌 베스트 뷰 파크 502동 1402호', 88, '월세', 40000, 150), 
(5, '풍님 하버 파크빌 402동 702호', 87, '월세', 70000, 100), 
(6, '샤이 리버뷰 파크 803동 1704호', 145, '매매', 230000, NULL),
(1, '휴먼시아 드림빌 208동 604호', 111, '전세', 60000, NULL);

-- 1. 매물 정보 확인
-- 매매 13억 이하(130,000만원) 매물을 면적 내림차순으로 조회하세요.
-- 조회 컬럼은 공인중개사 사무실명, 공인중개사 사무실 전화번호, 매물 주소, 면적, 금액 입니다.
-- 조회 결과
-- office	phoneNumber	address	area	price
-- 대박공인중개사	02-000-7777	와이파크 시티 205동 1603호	113	120000
-- 럭키공인중개사	02-777-7777	레알편한세상 시티 505동 101호	110	120000
-- 대박공인중개사	02-000-7777	푸르지용 파크 701동 2104호	97	90000
-- 대박공인중개사	02-000-7777	강남 헤리티지 시티 902동 606호	90	130000
SELECT R.office, R.phoneNumber, RE.address, RE.area, RE.price
FROM `realtor` AS `R`
JOIN `real_estate` AS `RE`
ON R.id = RE.realtorId
WHERE RE.price <= 130000
	AND RE.type='매매'
ORDER BY area DESC;

-- 2. 안심 중개사
-- '안심중개사' 등급의 공인중개사가 등록한 월세 매물을 월세 금액 오름차순으로 조회하세요.
-- 조회 컬럼은 공인중개사 사무실명, 공인중개사 사무실 전화번호, 매물 주소, 보증금액, 월세금액, 면적 입니다.
-- 보증금액 컬럼: price
-- 월세금액 컬럼: rentPrice
SELECT R.office, R.phoneNumber, RE.address, RE.price, RE.rentPrice, RE.area
FROM `realtor` AS `R`
JOIN `real_estate` AS `RE`
ON R.id = RE.realtorId
WHERE R.grade='안심중개사'
	AND RE.type = '월세'
ORDER BY RE.rentPrice;

-- 3. 매물 확인
-- 서울시 서초구에 있는 공인중개사 사무실 매물 중 전세 7억 이하 매물을 보증금액 오름차순으로 조회하세요.
-- 조회 컬럼은 공인중개사 사무실명, 공인중개사 사무실 전화번호, 매물 주소, 보증금액, 면적 입니다.
-- 조회 결과
-- office	phoneNumber	address	price	area
-- 황금부동산	02-300-2000	굿타워 오피스텔 804호	20000	65
-- 황금부동산	02-300-2000	레이얀 레이크 아파트 301동 905호	40000	84
-- 믿음부동산	02-333-9999	쉐리빌 아파트 603동 1904호	50000	75
-- 황금부동산	02-300-2000	휴먼시아 드림빌 208동 604호	60000	111
SELECT R.office, R.phoneNumber, RE.address, RE.price, RE.area
FROM `realtor` AS `R`
JOIN `real_estate` AS `RE`
ON R.id = RE.realtorId
WHERE RE.price <= 70000
	AND RE.type = '전세'
    AND R.address = '서울시 서초구'
ORDER BY RE.price;

-- 4. 공인중개상 매물 개수
-- 공인중개사 별로 매물 개수를 내림차순으로 조회하세요.
-- 조회 컬럼은 공인중개사 사무실명, 매물 개수 입니다.
-- 조회 결과
-- office	count
-- 황금부동산	6
-- 대박공인중개사	4
-- 희망공인중개사	4
-- 럭키공인중개사	3
-- 믿음부동산	3
SELECT R.office, count(*) AS `count`
FROM `realtor` AS `R`
JOIN `real_estate` AS `RE`
ON R.id = RE.realtorId
GROUP BY R.id
ORDER BY `count` DESC;

-- 5. 매물 확인
-- 대박공인중개사 매물중 매매, 전세 중 100평방미터 이상의 매물을 금액 오름차순으로 조회하세요.
-- 조회 컬럼은 공인중개사 사무실명, 공인중개사 사무실 전화번호, 매물 주소, 금액, 면적 입니다.
-- 조회 결과
-- office	phoneNumber	address	price	area
-- 대박공인중개사	02-000-7777	와이파크 시티 205동 1603호	120000	113
-- 대박공인중개사	02-000-7777	레알편한세상 시티 105동 806호	150000	110
SELECT R.office, R.phoneNumber, RE.address, RE.price, RE.area
FROM `realtor` AS `R`
JOIN `real_estate` AS `RE`
ON R.id = RE.realtorId
WHERE R.office = '대박공인중개사'
	AND RE.type IN('매매','전세')
    AND RE.area >= 100
ORDER BY RE.price;