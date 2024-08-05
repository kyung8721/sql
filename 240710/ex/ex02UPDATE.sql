SELECT * FROM `user`;

-- 수정하기
-- id가 4인 행에 email 컬럼 값을 hagulu@gmail.com으로 수정
UPDATE `user` SET `email` = 'hagulu@gmail.com'
WHERE id=4;

-- id가 2인 행의 취미를 맛집 탐방으로 바꾸고 자기소개를 강남 맛집 전문가 로 수정
-- 업데이트 할 땐 업데이트한 시간으로 바뀌도록 updatedAt도 now()로 바꿔주기
UPDATE `user`
SET 
	`hobby`='맛집 탐방',
    `introduce`='강남 맛집 전문가',
    `updatedAt` = now()
WHERE `id`=2;

-- 삭제
-- id가 1인 행 삭제
SELECT * FROM `user` WHERE `id`=1;
DELETE FROM `user` WHERE `id`=1;

-- 모든 행 삭제
-- 설정 조작 : 메뉴 -> Edit -> Preference -> SQL Editor -> Safe Update~
DELETE FROM `user`;

-- 테이블 완전 초기화(삭제 후 재생성)
-- 기존 설정 그대로 만들어줌
TRUNCATE TABLE `user`;