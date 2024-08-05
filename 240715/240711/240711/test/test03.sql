-- 리뷰 관리 테이블을 이용해서 아래 문제를 풀어보세요.
SELECT * FROM `review`;

-- 1. 그룹별 개수 세기
-- 리뷰 작성자별로 몇 개의 리뷰를 작성했는지 조회하세요.
-- 조회 결과
-- userName	count
-- 이정재	5
-- 이병헌	4
-- 맛있으면짖는개	3
-- 강동원	4
-- 전지현	4
SELECT `userName`, count(*) AS `count`FROM `review` GROUP BY `userName`;

-- 2. 그룹별 평균 구하기
-- 가게 별 별점의 평균점수를 조회하세요.
-- 조회 결과
-- storeName	average
-- 버거킹	4.00000
-- 교촌치킨	4.12500
-- 원조 곱창볶음	3.25000
-- 안동찜닭	4.50000
-- BHC	4.87500
-- 배달삼겹	4.16667
-- 도미노피자	4.50000
-- BBQ	4.50000
-- 피자반올림	2.00000
SELECT `storeName`, avg(`point`) AS `average` FROM `review` GROUP BY `storeName`; 

-- 3. 그룹 조건
-- -- 리뷰 작성 건수가 4건 이상인 작성자를 조회하세요.
-- 조회 결과
-- userName
-- 이정재
-- 이병헌
-- 강동원
-- 전지현
SELECT `userName` FROM `review` GROUP BY `userName` HAVING count(*) >= 4;


-- 성적 관리 테이블을 이용해서 아래 문제를 풀어 보세요.
SELECT * FROM `score`;

-- 4. 학생별 평균
-- 2020년 1학기 기말고사 학생별 평균을 조회하세요.
-- 조회 결과
-- name	average
-- 조세호	70.0000
-- 유재석	95.0000
-- 이광수	81.6667
SELECT `name`, avg(`score`) AS `average` FROM `score`
WHERE
	`year` = 2020
    AND `semester` = 1
    AND `term` = '기말고사'
GROUP BY `name` ;

-- 5. 과목별 평균
-- 2020년 과목별 평균을 조회하세요.
-- 조회 결과
-- subject	average
-- 국어	79.1667
-- 영어	89.1667
-- 수학	86.6667
SELECT `subject`, avg(`score`) AS `average` FROM `score` WHERE `year` = 2020 GROUP BY `subject`;

-- 6. 석차 구하기
-- 2020년 모든 시험의 학생별 평균을 구하고 석차 순서로 조회하세요.
-- 조회 결과
-- name	average
-- 유재석	91.6667
-- 이광수	83.3333
-- 조세호	80.0000
SELECT `name`, avg(`score`) AS `average` FROM `score`
WHERE `year` = 2020
GROUP BY `name`
ORDER BY `average` DESC;
