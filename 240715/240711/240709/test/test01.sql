-- 테이블 확인
DESC `score`;

-- 테이블 값 확인
SELECT * FROM `score`;

-- 한줄씩 추가
INSERT INTO `score`
(`name`, `year`, `semester`, `term`, `subject`, `score`)
VALUE('유재석', '2020', '1', '중간고사', '국어', '80');

INSERT INTO `score`
(`name`, `year`, `semester`, `term`, `subject`, `score`)
VALUE('유재석', '2020', '1', '중간고사', '영어', '90');

INSERT INTO `score`
(`name`, `year`, `semester`, `term`, `subject`, `score`)
VALUE('유재석', '2020', '1', '중간고사', '수학', '95');

-- 한번에 추가
INSERT INTO `score`
(`name`, `year`, `semester`, `term`, `subject`, `score`)
VALUES
('조세호', '2020', '1', '중간고사', '국어', '75'),
('조세호', '2020', '1', '중간고사', '영어', '80'),
('조세호', '2020', '1', '중간고사', '수학', '95');