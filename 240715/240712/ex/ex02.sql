-- sakila 데이터 베이스 사용alter

SELECT * FROM `customer`;

-- pk를 통한 조회
-- customer_id 컬럼이 3인 행 조회
EXPLAIN SELECT * FROM `customer` WHERE `customer_id` = 3;