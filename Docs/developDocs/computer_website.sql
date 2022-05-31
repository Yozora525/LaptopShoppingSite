DROP DATABASE IF EXISTS computer_shop;

CREATE DATABASE computer_shop CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE computer_shop;

#11. 管理員帳密表
CREATE TABLE manager(
	man_id  VARCHAR (64) UNIQUE NOT NULL,
    man_account VARCHAR (512)  NOT NULL,
	man_password VARCHAR(32)  NOT NULL,
	PRIMARY KEY (man_id)
);

INSERT INTO manager VALUES ('M001','serverDG','1094412253');

SELECT * FROM  manager;


#5.產品基本資料表
CREATE TABLE product_infor( 
	product_id	VARCHAR	(4) UNIQUE NOT NULL,
	product_name	VARCHAR	(32) NOT NULL,
	product_price	INTEGER	, #單價
	product_amount	INTEGER	, #庫存
	product_status	INTEGER	, #上/下架 1/0
	product_discript	TEXT,
	product_sold	INTEGER	, #銷售量(熱門)

    PRIMARY KEY (product_id)
);

INSERT INTO product_infor VALUES ("P001", "X515", 17900, 200, 1, '', 20000);
INSERT INTO product_infor VALUES ("P002", "Zenbook14FlipOLED", 40900, 200, 1, '', 20200);
INSERT INTO product_infor VALUES ("P003", "TUFGamingF15", 33500, 200, 1, '', 20800);
INSERT INTO product_infor VALUES ("P004", "ZenBook13OLED", 34900, 200, 1, '', 20010);
INSERT INTO product_infor VALUES ("P005", "MacBookAir", 38900, 200, 1, '', 20300);
INSERT INTO product_infor VALUES ("P006", "MacBookPro", 104900, 200, 1, '', 20000);
INSERT INTO product_infor VALUES ("P007", "Nitro5", 39500, 200, 1, '', 20070);
INSERT INTO product_infor VALUES ("P008", "Swift5", 29900, 200, 1, '', 20800);
INSERT INTO product_infor VALUES ("P009", "Spin5", 11900, 200, 1, '', 28300);
INSERT INTO product_infor VALUES ("P010", "Stealth15M", 47900, 200, 1, '', 20100);
INSERT INTO product_infor VALUES ("P011", "Modern14", 23900, 200, 1, '', 20200);
INSERT INTO product_infor VALUES ("P012", "Alpha15", 34900, 200, 1, '', 20000);
INSERT INTO product_infor VALUES ("P013", "Prestige14", 30900, 200, 1, '', 20040);
INSERT INTO product_infor VALUES ("P014", "EliteDragonflyG2", 59900, 200, 1, '', 20700);
INSERT INTO product_infor VALUES ("P015", "470G8", 29999, 200, 1, '', 20600);
INSERT INTO product_infor VALUES ("P016", "14s-dq4001TU", 31900, 200, 1, '', 28000);
INSERT INTO product_infor VALUES ("P017", "OMEN16-C0668AX", 48900, 200, 1, '', 20600);
INSERT INTO product_infor VALUES ("P018", "TravelMateP214-53-78QY", 31900, 200, 1, '', 20090);
INSERT INTO product_infor VALUES ("P019", "E410", 9488, 200, 1, '', 20900);
INSERT INTO product_infor VALUES ("P020", "SummitE16Flip", 55900, 200, 1, '', 29000);

SELECT * FROM product_infor;

#6.產品規格表
CREATE TABLE product_form(
	product_id	VARCHAR	(4) UNIQUE NOT NULL,
	product_size	FLOAT,	
	product_brand	VARCHAR	(64),
	product_touch	INTEGER	,
	product_type	VARCHAR	(32),

    PRIMARY KEY (product_id),
	FOREIGN KEY (product_id) REFERENCES product_infor(product_id)

);

INSERT INTO product_form VALUES ('P001', 15.6, 'ASUS', 0, '輕薄便攜');
INSERT INTO product_form VALUES ('P002', 14, 'ASUS', 1, '商務');
INSERT INTO product_form VALUES ('P003', 15.6, 'ASUS', 0, '電競');
INSERT INTO product_form VALUES ('P004', 13, 'ASUS', 0, '輕薄便攜');
INSERT INTO product_form VALUES ('P005', 13.3, 'APPLE', 0, '創作設計');
INSERT INTO product_form VALUES ('P006', 16, 'APPLE', 0, '創作設計');
INSERT INTO product_form VALUES ('P007', 15.6, 'ACER', 0, '電競');
INSERT INTO product_form VALUES ('P008', 14, 'ACER', 1, '輕薄便攜');
INSERT INTO product_form VALUES ('P009', 11.6, 'ACER', 1, '商務');
INSERT INTO product_form VALUES ('P010', 15.6, 'MSI', 0, '電競');
INSERT INTO product_form VALUES ('P011', 14, 'MSI', 0, '創作設計');
INSERT INTO product_form VALUES ('P012', 15.6, 'MSI', 0, '電競');
INSERT INTO product_form VALUES ('P013', 14, 'MSI', 0, '創作設計');
INSERT INTO product_form VALUES ('P014', 13, 'HP', 1, '商務');
INSERT INTO product_form VALUES ('P015', 17.3, 'HP', 0, '商務');
INSERT INTO product_form VALUES ('P016', 14, 'HP', 0, '輕薄便攜');
INSERT INTO product_form VALUES ('P017', 16.1, 'HP', 0, '電競');
INSERT INTO product_form VALUES ('P018', 14, 'ACER', 0, '商務');
INSERT INTO product_form VALUES ('P019', 14, 'ASUS', 0, '輕薄便攜');
INSERT INTO product_form VALUES ('P020', 16, 'MSI', 1, '創作設計');

SELECT * FROM product_form;


#2.會員基本資料表
CREATE TABLE mem_infor(
	mem_id	VARCHAR	(20) UNIQUE NOT NULL,
	mem_name VARCHAR	(16) NOT NULL,
	mem_sex	VARCHAR	(2),
	mem_phone	VARCHAR	(12),
	mem_birth	VARCHAR	(10),
	mem_create	VARCHAR	(14),
	mem_email VARCHAR (512) UNIQUE NOT NULL,
    
    PRIMARY KEY (mem_id, mem_email)
);

INSERT INTO mem_infor VALUES ('MEM001','陳鈞真', 'M', '0911235813', '2000-09-28', '2022-06-01', 'adsasddsa@gmail.com');
INSERT INTO mem_infor VALUES ('MEM002','徐岱揚', 'F', '0924681012', '2000-10-31', '2022-05-31', 'abbcccddde@yahoo.com');
INSERT INTO mem_infor VALUES ('MEM003','吳季貞', 'F', '0913579111', '2001-12-25', '2022-06-09', 'ag128442da@gmail.com');
INSERT INTO mem_infor VALUES ('MEM004','張貞量', 'M', '0987654321', '2002-03-05', '2022-05-30', 'xyyz17rip976da@yahoo.com');
INSERT INTO mem_infor VALUES ('MEM005','李德芸', 'F', '0912345678', '2001-04-02', '2022-06-02', 'aqwert2yy@gmail.com');

#1.登入
CREATE TABLE login (
	mem_id	VARCHAR(64) NOT NULL,
	mem_account	VARCHAR	(512) unique NOT NULL,
	mem_password VARCHAR (32) NOT NULL,
    
    PRIMARY KEY (mem_id),
	FOREIGN KEY (mem_id) REFERENCES mem_infor(mem_id)
   	#FOREIGN KEY (account) REFERENCES mem_infor(mem_email)
);

INSERT INTO login VALUES ('MEM001', 'adsasddsa@gmail.com', 'unhappypi000');
INSERT INTO login VALUES ('MEM002', 'abbcccddde@yahoo.com', 'happeko988');
INSERT INTO login VALUES ('MEM003', 'ag128442da@gmail.com', 'pi4happy');
INSERT INTO login VALUES ('MEM004', 'xyyz17rip976da@gmail.com', 'happyhappypi8888');
INSERT INTO login VALUES ('MEM005', 'aqwert2yy@gmail.com', 'happi111');


#4.訂單明細
CREATE TABLE order_details(
	order_id	VARCHAR	(22)  NOT NULL, #--Order+售出日期10碼+購買時間
	product_id	VARCHAR	(4)  NOT NULL,
	order_time	DATETIME,	
	order_addr	VARCHAR	(64),
	howmuch	INTEGER	, #商品數量

    PRIMARY KEY (order_id,product_id),
    FOREIGN KEY (product_id) REFERENCES product_infor(product_id)
);

#INSERT INTO order_details VALUES ('', 'P001', '','320桃園市中壢區中北路200號','2');
#INSERT INTO order_details VALUES ('', 'P015', '','320桃園市中壢區大仁街6號','1');
#INSERT INTO order_details VALUES ('', 'P002', '','100台北市中正區重慶南路一段122號','64');
#INSERT INTO order_details VALUES ('', 'P012', '','100台北市中正區重慶南路一段122號','3');
#INSERT INTO order_details VALUES ('', 'P007', '','100台北市中正區重慶南路一段122號','10');
#INSERT INTO order_details VALUES ('', 'P004', '','320桃園市中壢區中北路131號','5');
#INSERT INTO order_details VALUES ('', 'P018', '','320桃園市中壢區中北路131號','15');
#INSERT INTO order_details VALUES ('', 'P001', '','106台北市大安區基隆路二段207號','90');
#INSERT INTO order_details VALUES ('', 'P014', '','106台北市大安區基隆路二段207號','13');
#INSERT INTO order_details VALUES ('', 'P003', '','106台北市大安區基隆路二段207號','6');

#3.訂單清單
CREATE TABLE orders(
	order_id VARCHAR (22)  NOT NULL,
	mem_id	VARCHAR	(64)  NOT NULL,
    
    PRIMARY KEY (order_id),
	FOREIGN KEY (order_id) REFERENCES order_details(order_id),
    FOREIGN KEY (mem_id) REFERENCES mem_infor(mem_id)
);

#INSERT INTO orders VALUES ('', '');
#INSERT INTO orders VALUES ('', '');
#INSERT INTO orders VALUES ('', '');
#INSERT INTO orders VALUES ('', '');
#INSERT INTO orders VALUES ('', '');

SELECT * FROM orders;


#7.會員評論
CREATE TABLE comment(
	mem_id	VARCHAR	(64) UNIQUE NOT NULL,
	product_id	VARCHAR	(4) UNIQUE NOT NULL,
	mem_comment	TEXT,
	star	INTEGER,	
	comment_time	DATETIME,

    PRIMARY KEY (mem_id,product_id),
   	FOREIGN KEY (mem_id) REFERENCES mem_infor(mem_id),
	FOREIGN KEY (product_id) REFERENCES product_infor(product_id)

);

#INSERT INTO comment VALUES ('', 'P001', '超級好用，人生用過最好的筆電。', '5', '');
#INSERT INTO comment VALUES ('', 'P012', '會分享給親朋好友，效能極佳。', '5', '');
#INSERT INTO comment VALUES ('', 'P001', '推薦，但並沒有很符合我的需求。', '4', '');
#INSERT INTO comment VALUES ('', 'P006', '期待越高，失望越大。', '2', '');
#INSERT INTO comment VALUES ('', 'P018', '介面清操作容易且非常清楚易懂。', '5', '');
#INSERT INTO comment VALUES ('', 'P003', '中規中矩，CP值普普。', '3', '');
#INSERT INTO comment VALUES ('', 'P016', '還不錯，但仍有可進步空間。', '4', '');
#INSERT INTO comment VALUES ('', 'P015', '與想像中效果有些落差。', '2', '');
#INSERT INTO comment VALUES ('', 'P006', '功能極強，非常喜歡。', '5', '');

#8.反饋單
#CREATE TABLE contact(
#	contact_id	VARCHAR	(5) UNIQUE NOT NULL,
#	email	VARCHAR	(64) NOT NULL,
#	content	TEXT,
#	uploaddate DATE,
    
 #   PRIMARY KEY (contact_id)
#);

#9.購物車
CREATE TABLE cart(
	mem_id	VARCHAR	(64)  NOT NULL,
	product_id	VARCHAR	(4) UNIQUE NOT NULL,
	order_amount INTEGER,

    PRIMARY KEY (mem_id,product_id),
	FOREIGN KEY (mem_id) REFERENCES mem_infor(mem_id),
	FOREIGN KEY (product_id) REFERENCES product_infor(product_id)

);

#INSERT INTO cart VALUES ('', 'P011', '5');
#INSERT INTO cart VALUES ('', 'P007', '3');
#INSERT INTO cart VALUES ('', 'P001', '10');
#INSERT INTO cart VALUES ('', 'P016', '4');
#INSERT INTO cart VALUES ('', 'P005', '2');
#INSERT INTO cart VALUES ('', 'P019', '1');
#INSERT INTO cart VALUES ('', 'P012', '13');
#INSERT INTO cart VALUES ('', 'P015', '6');
#INSERT INTO cart VALUES ('', 'P020', '9');

#10.商品圖片
CREATE TABLE product_img(
	product_id	VARCHAR	(4)  NOT NULL,
	img_link VARCHAR(6),	#P001-1

    PRIMARY KEY (product_id,img_link),
    FOREIGN KEY (product_id) REFERENCES product_infor(product_id)
);

INSERT INTO product_img VALUES ('P001', 'P001-1');
INSERT INTO product_img VALUES ('P001', 'P001-2');
INSERT INTO product_img VALUES ('P001', 'P001-3');

INSERT INTO product_img VALUES ('P002', 'P002-1');
INSERT INTO product_img VALUES ('P002', 'P002-2');
INSERT INTO product_img VALUES ('P002', 'P002-3');

INSERT INTO product_img VALUES ('P003', 'P003-1');
INSERT INTO product_img VALUES ('P003', 'P003-2');
INSERT INTO product_img VALUES ('P003', 'P003-3');

INSERT INTO product_img VALUES ('P004', 'P004-1');
INSERT INTO product_img VALUES ('P004', 'P004-2');
INSERT INTO product_img VALUES ('P004', 'P004-3');

INSERT INTO product_img VALUES ('P005', 'P005-1');
INSERT INTO product_img VALUES ('P005', 'P005-2');
INSERT INTO product_img VALUES ('P005', 'P005-3');

INSERT INTO product_img VALUES ('P006', 'P006-1');
INSERT INTO product_img VALUES ('P006', 'P006-2');
INSERT INTO product_img VALUES ('P006', 'P006-3');

INSERT INTO product_img VALUES ('P007', 'P007-1');
INSERT INTO product_img VALUES ('P007', 'P007-2');
INSERT INTO product_img VALUES ('P007', 'P007-3');

INSERT INTO product_img VALUES ('P008', 'P008-1');
INSERT INTO product_img VALUES ('P008', 'P008-2');
INSERT INTO product_img VALUES ('P008', 'P008-3');

INSERT INTO product_img VALUES ('P009', 'P009-1');
INSERT INTO product_img VALUES ('P009', 'P009-2');
INSERT INTO product_img VALUES ('P009', 'P009-3');

INSERT INTO product_img VALUES ('P010', 'P010-1');
INSERT INTO product_img VALUES ('P010', 'P010-2');
INSERT INTO product_img VALUES ('P010', 'P010-3');

INSERT INTO product_img VALUES ('P011', 'P011-1');
INSERT INTO product_img VALUES ('P011', 'P011-2');
INSERT INTO product_img VALUES ('P011', 'P011-3');

INSERT INTO product_img VALUES ('P012', 'P012-1');
INSERT INTO product_img VALUES ('P012', 'P012-2');
INSERT INTO product_img VALUES ('P012', 'P012-3');

INSERT INTO product_img VALUES ('P013', 'P013-1');
INSERT INTO product_img VALUES ('P013', 'P013-2');
INSERT INTO product_img VALUES ('P013', 'P013-3');

INSERT INTO product_img VALUES ('P014', 'P014-1');
INSERT INTO product_img VALUES ('P014', 'P014-2');
INSERT INTO product_img VALUES ('P014', 'P014-3');

INSERT INTO product_img VALUES ('P015', 'P015-1');
INSERT INTO product_img VALUES ('P015', 'P015-2');
INSERT INTO product_img VALUES ('P015', 'P015-3');

INSERT INTO product_img VALUES ('P016', 'P016-1');
INSERT INTO product_img VALUES ('P016', 'P016-2');
INSERT INTO product_img VALUES ('P016', 'P016-3');

INSERT INTO product_img VALUES ('P017', 'P017-1');
INSERT INTO product_img VALUES ('P017', 'P017-2');
INSERT INTO product_img VALUES ('P017', 'P017-3');

INSERT INTO product_img VALUES ('P018', 'P018-1');
INSERT INTO product_img VALUES ('P018', 'P018-2');
INSERT INTO product_img VALUES ('P018', 'P018-3');

INSERT INTO product_img VALUES ('P019', 'P019-1');
INSERT INTO product_img VALUES ('P019', 'P019-2');
INSERT INTO product_img VALUES ('P019', 'P019-3');

INSERT INTO product_img VALUES ('P020', 'P020-1');
INSERT INTO product_img VALUES ('P020', 'P020-2');
INSERT INTO product_img VALUES ('P020', 'P020-3');