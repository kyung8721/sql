-- 테이블 확인
DESC `review`;

-- 테이블 값 확인
SELECT * FROM `review`;

-- 리뷰 등록
INSERT INTO `review`
(`storeName`, `menu`, `userName`, `point`, `review`)
VALUES
('버거킹', '와퍼세트', '이정재', '4.0', '배달이 빨랐어요. 역시 와퍼 맛있네요'),
('교촌치킨', '오리지날 콤보', '이병헌', '4.5', '콤보는 항상 진리입니다'),
('원조 곱창볶음', '야채곱창볶음', '맛있으면짖는개', '4.0', '왈왈왈왈!! 왈왈!!!');

INSERT INTO `review`
(`storeName`, `menu`, `userName`, `point`)
VALUES
('안동찜닭', '찜닭(중)', '강동원', '5.0'),
('교촌치킨', '핫 콤보', '이정재', '4.5'),
('BHC', '뿌링클', '전지현', '4.5');
