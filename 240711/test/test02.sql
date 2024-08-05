-- 리뷰 관리 테이블을 이용해서 아래 문제를 풀어보세요.
SELECT * FROM `review`;

-- 1. 문자열 찾기
-- 맛있으면짖는개의 리뷰중 왈왈로 시작하는 리뷰의 전체 필드 정보를 조회하세요.
-- 결과 행 개수
-- 2
SELECT * FROM `review` WHERE `userName`='맛있으면짖는개' AND `review` LIKE '왈왈%';

-- 2. 정렬 하기
-- createdAt을 기준으로 최신 10개의 리뷰만 전체 필드 정보를 조회하세요.
-- SELECT * FROM `review` ORDER BY `createdAt` DESC LIMIT 10;
-- id는 생성될 때마다 쌓이므로 id 숫자가 적음 = 빨리 생성됨이라서 id 기반으로 정렬하는게 좋다
SELECT * FROM `review` ORDER BY `id` DESC LIMIt 10;

-- 3. 별점 높은순
-- 교촌치킨의 전체 필드를 별점 높은 순으로 조회하세요.
SELECT * FROM `review` WHERE `storeName` = '교촌치킨' ORDER BY `point` DESC;

-- 4. 가장 낮은 별점
-- 전체 별점 중 가장 낮은 별점을 준 작성자와 가게명을 조회하세요.
SELECT `point`, `userName`, `storeName` FROM `review` ORDER BY `point` LIMIT 1;
