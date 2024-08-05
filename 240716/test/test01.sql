DROP TABLE `review`;
DROP TABLE `store`;

CREATE TABLE `new_review` (
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `storeId` INT NOT NULL,
    `menu` VARCHAR(32) NOT NULL,
    `userName` VARCHAR(32) NOT NULL, 
    `point` DECIMAL(2, 1) DEFAULT 3.5,
    `review` VARCHAR(256),
    `createdAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `store` (
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(32) NOT NULL, 
    `phoneNumber` VARCHAR(16) NOT NULL,
    `address` VARCHAR(64) NOT NULL,
    `businessNumber` VARCHAR(32) NOT NULL,
    `introduce` TEXT, 
    `createdAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `store` 
(`name`, `phoneNumber`, `address`, `businessNumber`, `introduce`)
VALUES ("교촌치킨", '02-000-0000', '서울시 서초구', '111-111-1111', '항상 맛있는 닭을 선사 합니다.'),
("BHC", '02-111-0000', '서울시 서초구', '111-222-1111', '전지현씨 BHC'),
("버거킹", '02-222-1111', '서울시 서초구', '333-222-12222', '맥도날드 가지말고 여기로와요'),
("도미노피자", '02-222-2222', '서울시 서초구', '111-222-12222', '방문포장 반값!!!'),
("피자알볼로", '02-000-1111', '서울시 서초구', '123-010-12222', NULL),
("할머니순대국", '02-123-4567', '서울시 서초구', '100-200-14000', '12시간 푹고은 육수'),
("배달삼겹", '02-222-8888', '서울시 서초구', '333-5454-9999', '우리돼지 한돈만 사용합니다!!'),
("가장맛있는족발", '02-012-8080', '서울시 서초구', '133-253-1243', '리뷰이벤트 막국수 드려요!!');

INSERT INTO `new_review` 
(`storeId`, `menu`, `userName`, `point`, `review`) 
VALUES 
(1, '오리지날 콤보', '이병헌', 4.5, '콤보는 항상 진리입니다.'),
(2, '핫후라이드', '전지현', 5, NULL),
(2, '뿌링클', '이정재', 3.5, '내가 뿌링클 상인가?'),
(3, '와퍼세트', '이병헌', 4.0, '패티 너무좋아요'),
(1, '오리지날 콤보', '맛있으면짖는개', 4.5, '왈왈왈!! 왈왈!'),
(2, '뿌링클', '전지현', 5, NULL),
(8, '족발(앞다리)', '이병헌', 4.5, '막국수 서비스 좋아요!'),
(7, '삼겹혼밥세트', '정우성', 4.0, '항상 맛있어요 같이오는 김치찌개 짱맛'),
(2, '마쵸킹', '전지현', 5, NULL),
(1, '오리지날 콤보', '정우성', 4.5, NULL),
(4, '도미노피자', '이정재', 4.5, '피자알볼로보다 맛있어요'),
(5, '피자알볼로', '이정재', 4.5, '도미노피자 보다 맛있어요'),
(7, '삼겹혼밥세트', '이병헌', 4.0, NULL),
(8, '매운족발', '정우성', 4.5, '메뉴가 반반족발로 잘못왔어요. 맛있어서 그냥 먹었어요'),
(7, '삽겹이인세트', '이정재', 1.5, '다탔어!! XX 열받네'),
(5, '피자알볼로', '맛있으면짖는개', 3.0, '....'),
(2, '뿌링클', '전지현', 5, NULL),
(8, '족발(앞다리)', '이병헌', 4.5, '빠른배달 칭찬해!'),
(7, '목살 고기만', '이정재', 2.0, '고기가 덜익어서 왔어요!'),
(4, '도미노피자', '맛있으면짖는개', 4.5, '왈왈왈!! 왈왈!!'), 
(8, '반반족발', '이병헌', 3.5, NULL);

-- 1. inner join
-- 두 테이블을 JOIN문을 이용해서 아래와 같은 형태로 조회하세요.
-- name	phoneNumber	menu	userName	point	review
-- 교촌치킨	02-000-0000	오리지날 콤보	이병헌	4.5	콤보는 항상 진리입니다.
-- BHC	02-111-0000	핫후라이드	전지현	5.0	NULL
-- BHC	02-111-0000	뿌링클	이정재	3.5	내가 뿌링클 상인가?
-- .					
-- .					
SELECT S.name, S.phoneNumber, NR.menu, NR.userName, NR.point, NR.review
FROM `store` AS `S`
JOIN `new_review` AS `NR`
ON S.id=NR.storeId;

-- 2. left join
-- 두 테이블을 left join 을 통해서 아래와 같은 내용으로 조회하세요.
-- name	phoneNumber	menu	userName	point	review
-- 교촌치킨	02-000-0000	오리지날 콤보	이병헌	4.5	콤보는 항상 진리입니다.
-- 교촌치킨	02-000-0000	오리지날 콤보	맛있으면짖는개	4.5	왈왈왈!! 왈왈!
-- .					
-- .					
-- 할머니순대국	02-123-4567	NULL	NULL	NULL	NULL
-- .					
-- .					
-- 배달삼겹	02-222-8888	삼겹혼밥세트	정우성	4.0	항상 맛있어요 같이 오는 김치찌개 짱맛
SELECT S.name, S.phoneNumber, NR.menu, NR.userName, NR.point, NR.review
FROM `store` AS `S`
LEFT JOIN `new_review` AS `NR`
ON S.id = NR.storeId;

-- 3. 낮은 리뷰 추출
-- 배달삼겹 가게의 3.0 미만의 별점 리뷰를 오름차순으로 조회하세요.
-- 조회 컬럼은 메뉴, 작성자, 별점, 리뷰내용 입니다.
SELECT NR.menu, NR.userName, NR.point, NR.review
FROM `store` AS `S`
JOIN `new_review` AS NR
ON S.id=NR.storeId
WHERE S.name = '배달삼겹'
	AND NR.point < 3.0
ORDER BY NR.point;

-- 4. 리뷰내용 있는 리스트
-- 이병헌의 리뷰중 4.5 이상이고 리뷰내용이 존재하는 리뷰만 조회하세요
-- 조회 컬럼은 가게이름, 메뉴, 별점, 리뷰내용 입니다.
SELECT S.name, NR.menu, NR.point, NR.review
FROM `store` AS `S`
JOIN `new_review` AS `NR`
ON S.id=NR.storeId
WHERE NR.userName = '이병헌'
AND NR.point >= 4.5
AND NR.review is NOT NULL;

-- 5. 맛집 랭킹
-- 별점 평균이 높은 순서로 5개만 조회하세요
-- 조회 컬럼은 가게이름, 가게전화 번호, 평균별점 입니다.
-- name	phoneNumber	averagePoint
-- BHC	02-111-0000	4.70000
-- 교촌치킨	02-000-0000	4.50000
-- 도미노피자	02-222-2222	4.50000
-- 가장맛있는족발	02-012-8080	4.25000
-- 버거킹	02-222-1111	4.00000
SELECT *
FROM `store` AS `S`
JOIN `new_review` AS `NR`
ON S.id = NR.storeId;

SELECT S.name, S.phoneNumber, avg(NR.point) AS `averagePoint`
FROM `store` AS `S`
JOIN `new_review` AS `NR`
ON S.id = NR.storeId
-- 내가 한 방법 : GROUP BY S.name, S.phoneNumber
-- 하나의 가게인데 다른 전화번호라면 무엇을 보여줄건가
-- 만약 전화번호가 다르면 다른 그룹으로 표시해야 함
-- 또 다른 예시(PRIMARY KEY를 사용하는것)
GROUP BY S.id
ORDER BY `averagePoint` DESC
LIMIT 5;