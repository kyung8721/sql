CREATE TABLE `url`(
	`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(64) NOT NULL,
    `url` TEXT NOT NULL,
    `createdAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

SELECT * FROM `url`;

INSERT INTO `url`
(`name`, `url`)
VALUES
('마론달', 'http://marondal.com'),
('구글', 'https://google.com'),
('네이버', 'https://naver.com'),
('다음', 'https://daum.net');

INSERT INTO `url`
(`name`, `url`)
VALUE
('', '');

DELETE FROM `url`
	WHERE `name` = ''AND `url` ='';