SELECT * FROM `used_goods`;

INSERT INTO `used_goods`
(`sellerId`, `title`, `price`, `description`)
VALUE
(3, '고양이 간식 팝니다', 2000, '안 먹어서 팔아요');

SELECT * FROM `real estate`;

INSERT INTO `real estate`
(`realtorId`, `address`, `area`, `type`, `price`)
VALUE
(3, '헤라펠리스 101동 5305호', 350, '매매', 1500000);

SELECT re.id, re.address, re.area, re.type
FROM `real estate` AS re
ORDER BY re.id
LIMIT 10;

SELECT `address`, `area`, `type` FROM `real estate`;

SELECT * FROM `new_user`;

INSERT INTO `new_user`
(`name`, `yyyymmdd`, `email`)
VALUE
('유재석', 20030123, 'yu@gmail.com');

