-- 과거 날씨 데이터
-- 과거 날씨 데이터가 아래와 같이 주어져있다.
-- 날짜 (date)	날씨 (weather)	기온 (temperatures)	강수량 (precipitation)	미세먼지 (microDust)	풍속(windSpeed)
-- 2015-07-01	비	21.9℃	83.5mm	보통	2.9km/h
-- 2015-07-02	비	22.6℃	59.5mm	보통	2.5km/h
-- 2015-07-03	흐림	27.4℃	0.0mm	좋음	2.9km/h
-- 2015-07-04	맑음	27.3℃	0.0mm	좋음	6.1km/h
-- 2015-07-05	구름조금	25.3℃	0.0mm	나쁨	4.3km/h
-- 2015-07-06	맑음	23.9℃	0.0mm	나쁨	6.5km/h
-- 2015-07-07	맑음	23.7℃	0.0mm	좋음	5.8km/h
-- 2015-07-08	흐림	23.3℃	0.0mm	좋음	5.4km/h
-- 2015-07-09	비	20.8℃	14.0mm	보통	4.0km/h
-- 2015-07-10	비	23.7℃	16.5mm	보통	2.5km/h
-- 2015-07-11	비	26.8℃	3.0mm	좋음	4.7km/h
-- 2015-07-12	비	26.6℃	1.0mm	나쁨	5.4km/h
-- 2015-07-13	구름조금	27.3℃	0.0mm	최악	6.5km/h
-- 2015-07-14	맑음	27.9℃	0.0mm	보통	6.8km/h
-- 1. 테이블 생성
-- 위 데이터를 기반으로 테이블을 설계하고 생성하세요.
-- 테이블 이름은 weatherhistory 으로 만드세요.
-- 컬럼 이름은 위 데이터의 괄호안에 단어를 이용하세요.
-- 자동으로 증가하는 id를 만드세요.
-- 생성시간과, 업데이트 시간을 관리하는 컬럼을 포함하세요.
-- 표에 있는 날짜와 생성시간은 따로 만들어 관리하세요.
CREATE TABLE `weatherhistory`(
	`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `date` DATETIME NOT NULL,
    `weather` VARCHAR(8) NOT NULL,
    `temperatures` DECIMAL(3,1) NOT NULL,
    `precipitation` DECIMAL(4,1) DEFAULT 0.0,
    `microDust` VARCHAR(4) DEFAULT '보통',
    `windSpeed` DECIMAL(4,1) NOT NULL,
    `createdAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DESC `weatherhistory`;
SELECT * FROM `weatherhistory`;
DROP TABLE `weatherhistory`;

-- 2. 데이터 저장
-- 생성된 테이블에 위 데이터를 모두 insert 하세요.
INSERT INTO `weatherhistory`
(`date`, `weather`, `temperatures`, `precipitation`, `microDust`, `windSpeed`)
VALUES
('2015-07-01', '비', 21.9, 83.5, '보통', 2.9),
('2015-07-02', '비', 22.6, 59.5, '보통', 2.5),
('2015-07-03', '흐림', 27.4, 0.0, '좋음', 2.9),
('2015-07-04', '맑음', 27.3, 0.0, '좋음', 6.1),
('2015-07-05', '구름조금', 25.3, 0.0, '나쁨', 4.3),
('2015-07-06', '맑음', 23.9, 0.0, '나쁨', 6.5),
('2015-07-07', '맑음', 23.7, 0.0, '좋음', 5.8),
('2015-07-08', '흐림', 23.3, 0.0, '좋음', 5.4),
('2015-07-09', '비', 20.8, 14.0, '보통', 4.0),
('2015-07-10', '비', 23.7, 16.5, '보통', 2.5),
('2015-07-11', '비', 26.8, 3.0, '좋음', 4.7),
('2015-07-12', '비', 26.6, 1.0, '나쁨', 5.4),
('2015-07-13', '구름조금', 27.3, 0.0, '최악', 6.5),
('2015-07-14', '맑음', 27.9, 0.0, '보통', 6.8);

-- 3. 가장 높은 기온
-- 기온이 가장 높은 날의 정보를 조회하세요.
-- 조회 예시
-- date	weather	temperatures
-- 2015-07-14	맑음	27.9
SELECT `date`, `weather`, `temperatures` FROM `weatherhistory` ORDER BY `temperatures` DESC LIMIT 1;

-- 4. 날씨 카운트
-- 각 날씨 별로 몇 일씩 존재하고 많은 순서대로 조회하세요.
-- 조회 컬럼은 아래 조회 예시를 참조하세요.
-- 조회 예시
-- weather	count
-- 비	6
-- 맑음	4
-- 흐림	2
-- 구름조금	2
SELECT `weather`, count(*) AS `count` FROM `weatherhistory` GROUP BY 

-- 5. 미세먼지와 강수량
-- 미세먼지 상태 별로 평균 강수량을 조회 하세요.
-- 단, 평균 강수량이 없는 경우 조회 하지마세요.
-- 조회 컬럼은 아래 조회 예시를 참조하세요.
-- 조회 예시
-- microDust	precipitation
-- 보통	34.7
-- 좋음	0.6
-- 나쁨	0.3

-- 6. 미세먼지 와 풍속
-- 미세먼지 상태 별로 평균 풍속을 구하고 평균 풍속이 높은 순으로 조회하세요.
-- 단, 평균 풍속이 4.0km/h 이상인 정보만 조회 하세요.
-- 조회 컬럼은 아래 조회 예시를 참조하세요.
-- 조회 예시
-- microDust	windSpeed
-- 최악	6.5
-- 나쁨	5.4
-- 좋음	4.98
