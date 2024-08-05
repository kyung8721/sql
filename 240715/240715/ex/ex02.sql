-- 홍당무 마켓
-- 중고거래 서비스
-- 제목, 가격, 제품 설명, 제품 사진, 작성자 닉네임, 작성자 매너 온도, 판매자 프로필 사진

-- 판매자 정보
-- 닉네임, 매너온도, 프로필 사진
CREATE TABLE `seller` (
	`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nickname` VARCHAR(32) NOT NULL,
    `temperature` DECIMAL(3,1) DEFAULT 36.5,
    `profileImage` VARCHAR(128), -- 이미지는 경로로 저장해서 사용
    `createdAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)ENGINE=innoDB DEFAULT CHARSET=utf8mb4;

DESC `seller`;

-- 제품 정보
-- 제목, 가격, 설명, 사진
CREATE TABLE `used_goods` (
	`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `sellerId` INT NOT NULL,
    `title` VARCHAR(64) NOT NULL,
    `price` INT NOT NULL,
    `description` TEXT NOT NULL,
    `image` VARCHAR(128),
	`createdAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)ENGINE=innoDB DEFAULT CHARSET=utf8mb4;

DESC `used_goods`;

INSERT INTO `seller`
(`nickname`, `temperature`, `profileImage`)
VALUES
('마로비', 36.6, 'https://cdn.pixabay.com/photo/2024/05/09/17/24/shih-tzu-8751508_1280.jpg'),
('아메리카노', 48.2, NULL),
('동네주민', 29.0, 'https://cdn.pixabay.com/photo/2024/06/23/12/06/sparrow-8848051_1280.jpg'),
('네고왕', 36.5, NULL),
('하구루', 36.5, 'https://cdn.pixabay.com/photo/2023/09/28/21/22/highland-cattle-8282564_1280.jpg');

SELECT * FROM `seller`;

INSERT INTO `used_goods`
(`sellerId`, `title`, `price`, `description`, `image`)
VALUES
(5, '플스5 팝니다', 300000, '쿨거래 하실분 연락주세요!', 'https://cdn.pixabay.com/photo/2017/05/19/14/05/ps4-2326600_960_720.jpg'),
(5, '원피스 팝니다', 20000, '살이 빠져서 사이즈가 안 맞아서 팝니다', 'https://cdn.pixabay.com/photo/2021/03/22/16/07/woman-6115105_1280.jpg'),
(3, '후라다 여성지갑 팝니다', 45000, '오늘 선물하려고 샀는데 헤어졌어요', 'https://cdn.pixabay.com/photo/2017/12/24/15/00/pouch-3037112_1280.jpg'),
(2, '바퀴벌레 잡아주세요ㅠ', 5000, '제발 점 잡아주세요 날아다녀요ㅠㅠ', NULL);

SELECT * FROM `used_goods`;

-- 하구루 닉네임 사용자의 등록 상품 조회
SELECT * FROM `seller` WHERE `nickname` = '하구루';

SELECT * FROM `used_goods` WHERE `sellerId`=5;