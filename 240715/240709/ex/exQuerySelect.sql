-- SELECT
DESC `user`;

-- 모든 행 조회
SELECT * FROM `user`;

-- 특정 컬럼 조회
SELECT `name`, `yyyymmdd`, `email` FROM `user`;

-- 컬럼명 별명 붙이기
SELECT `name`, `hobby`, `email` FROM `user`;

-- 컬럼명 별명 붙이기
SELECT `name` AS `이름`, `hobby` AS `취미`, `email` FROM `user`;

-- 중복 제거
-- 동명 이인 제외 이름 조회
SELECT DISTINCT `name` FROM `user`;

-- 행 개수 조회
-- 예전버전에선 달랐지만 지금은 같음
-- 별을 더 자주 쓰는 편이긴 함
SELECT count(*) FROM `user`;
SELECT count(1) FROM `user`;
-- count()를 count로 바꿔서 보여주기(이름만 별명으로)
SELECT count(1) AS `count` FROM `user`;

-- 조건 조회
-- id가 3인 행 조회
SELECT * FROM `user` WHERE `id` = 3;

-- 이름이 김바다인 사용자 생년월일 조회 
SELECT `yyyymmdd` FROM `user` WHERE `name` = '김바다';

-- 이름이 김인규가 아닌 사용자 조회
SELECT  * FROM `user` WHERE `name` != '김인규';

-- 날짜 시간 조건
-- 행 저장 시간이 2024-07-09 20:34:41 이후인
SELECT * FROM `user` WHERE `createdAt` > '2024-07-09 20:34:41';

-- 이름이 김인규인 사용자의 행 조회 
SELECT count(*) FROM `user` WHERE `name` = '김인규';

-- 자기소개가 없는 행 조회(introduce NULL 인 행 조회)
SELECT * FROM `user` WHERE `introduce` IS NULL; 

-- 자기소개사 있는 행 조회(introduce NULL이 아닌 행 조회)
SELECT * FROM `user` WHERE `introduce` IS NOT NULL;