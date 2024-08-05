
-- 이름이 김인규 이면서, 취미가 코딩인 행 조회
SELECT * FROM `user` WHERE `name` = '김인규' AND `hobby` = '코딩';

-- id가 3이거나 id가 4인 행 조회
SELECT * FROM `user` WHERE `id` = 3 OR `id` = 4;

-- 하나의 컬럼에 대해서 일치하는 여러 값 조건
SELECT * FROM `user` WHERE `id` IN (3,4);