-- 성적관리 테이블을 이용해서 아래문제를 풀어보세요.
SELECT * FROM `score`;

-- 1. 개수 제한
-- 10개의 성적 정보만 조회하세요.
SELECT * FROM `score` LIMIT 10;

-- 2. 정렬하기
-- score를 기준으로 높은 점수부터 모든 행을 내림차순으로 조회하세요.
SELECT * FROM `score` ORDER BY `score` DESC;

-- 3. 조건부 정렬
-- 2020년 1학기 기말고사 중 국어 과목의 시험을 가장 잘본 순서로 정렬하여 모든 필드를 조회하세요.
SELECT * FROM `score`
WHERE
	`year` = 2020
    AND `semester` = 1
    AND `term` = '기말고사'
    AND `subject` = '국어'
ORDER BY `score` DESC;

-- 4. 문자열 만들기
-- 성적 테이블 전체 결과를 concat을 활용해서 아래와 같은 형태로 조회하세요.
-- 조회 예시
-- score_info
-- 2020년1학기중간고사 유재석 - 국어80점
-- 2020년1학기중간고사 유재석 - 영어90점
-- 2020년1학기중간고사 유재석 - 수학95점
-- 2020년1학기중간고사 조세호 - 국어75점
-- 2020년1학기중간고사 조세호 - 영어100점
-- 2020년1학기중간고사 조세호 - 수학95점
-- 2020년1학기중간고사 이광수 - 국어80점
SELECT 
concat(
	`year`,'년',
    `semester`,'학기',
    `term`, ' ',
    `name`, ' - ',
    `subject`,
    `score`, '점')
AS `score_info` FROM `score`;
