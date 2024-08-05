-- sakila Database 사용

SELECT * FROM `city`;

-- 조회 개수 제한
-- 50개 조회
SELECT * FROM `city` LIMIT 50;

-- 범위 지정
-- 101번째부터 50개
SELECT * FROM `city` LIMIT 100, 50;

-- 포함된 문자열 조회(대소문자 구분 없이 조회)
-- C로 시작하는 도시 이름 조회
SELECT * FROM `city` WHERE `city` LIKE 'C%';

-- C로 끝나는 도시 이름
SELECT * FROM `city` WHERE `city` LIKE '%C';

-- C를 포함하는 도시 이름
SELECT * FROM `city` WHERE `city` LIKE '%C%';

-- 대소문자 구분해서 도시 이름 조회
SELECT * FROM `city` WHERE `city` LIKE binary('%C%');
SELECT * FROM `city` WHERE `city` LIKE binary('%c%');

-- 정렬하기
-- country_id를 기준으로 정렬(기본 : 오름차순)
SELECT * FROM `city` ORDER BY `country_id`;
-- 내림차순
SELECT * FROM `city` ORDER BY `country_id` DESC;

-- 도시 이름 내림차순 조회
SELECT * FROM `city` ORDER BY `city` DESC;

-- C로 시작하는 도시를 country_id로 오름차순으로 정렬해서 10개 조회
-- 조건, 정렬, 제한 순
-- 필터링해서 행 줄이고 정렬해서 잘라냄
SELECT * FROM `city` WHERE `city` LIKE 'C%' ORDER BY `country_id` LIMIT 10;

-- 컬럼의 값들을 조합해서 문자열로 조회
-- concat 함수
SELECT concat('Hello', 'World');

-- 도시 이름 : .... 나라코드 : ...
SELECT concat('도시이름 : ', `city`, ' 나라코드 : ', `country_id`) AS `결과` FROM `city`; 

