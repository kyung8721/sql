-- INSERT

DESC `user`;

INSERT INTO `user`
(`name`, `yyyymmdd`, `hobby`, `email`, `introduce`, `createdAt`, `updatedAt`)
value('김인규', '19991106', '독서,노래,영화', 'lecture@hagulu.com', '안녕하세요 소개입니다', now(), now());

-- 조회하기
SELECT * FROM `user`;

-- 여러 행 저장 
INSERT INTO `user`
(`name`, `yyyymmdd`, `hobby`, `email`, `introduce`, `createdAt`, `updatedAt`)
VALUES
('김바다', '20190104', '사냥하기, 물먹기', 'bada@gmail.com', '나랑 놀아줄 집사 구합니다', now(), now()),
('유재석', '19780701', '진행하기, 수다떨기', 'yu@naver.com', '안녕하세요 국민 MC 유재석입니다', now(), now()),
('김인규', '20021005', '코딩', 'hagulu@naver.com', NULL, now(), now());

