DROP DATABASE IF EXISTS computer_shop;

CREATE DATABASE computer_shop CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE computer_shop;

#11. 管理員帳密表
CREATE TABLE manager(
	man_id  VARCHAR (64) UNIQUE NOT NULL,
    man_account VARCHAR (512) UNIQUE NOT NULL,
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
	mem_birth	VARCHAR	(8),
	mem_email VARCHAR (512) UNIQUE NOT NULL,
    
    PRIMARY KEY (mem_id, mem_email)
);

#1.登入
CREATE TABLE login (
	mem_id	VARCHAR(64) UNIQUE NOT NULL,
	mem_account	VARCHAR	(512) UNIQUE NOT NULL,
	mem_password VARCHAR (32) NOT NULL,
    
    PRIMARY KEY (mem_id),
	FOREIGN KEY (mem_id) REFERENCES mem_infor(mem_id)
   	#FOREIGN KEY (account) REFERENCES mem_infor(mem_email)
);



#4.訂單明細
CREATE TABLE order_details(
	order_id	VARCHAR	(22) UNIQUE NOT NULL,
	product_id	VARCHAR	(4) UNIQUE NOT NULL,
	order_time	DATETIME,	
	order_addr	VARCHAR	(64),
	howmuch	INTEGER	, #商品數量

    PRIMARY KEY (order_id,product_id),
    FOREIGN KEY (product_id) REFERENCES product_infor(product_id)
);

#3.訂單清單
CREATE TABLE orders(
	order_id VARCHAR (22) UNIQUE NOT NULL,
	mem_id	VARCHAR	(64) UNIQUE NOT NULL,
    
    PRIMARY KEY (order_id),
	FOREIGN KEY (order_id) REFERENCES order_details(order_id),
    FOREIGN KEY (mem_id) REFERENCES mem_infor(mem_id)
);

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

#8.反饋單
CREATE TABLE contact(
	contact_id	VARCHAR	(5) UNIQUE NOT NULL,
	email	VARCHAR	(64) NOT NULL,
	content	TEXT,

    PRIMARY KEY (contact_id)
);

#9.購物車
CREATE TABLE cart(
	mem_id	VARCHAR	(64) UNIQUE NOT NULL,
	product_id	VARCHAR	(4) UNIQUE NOT NULL,
	order_amount INTEGER,

    PRIMARY KEY (mem_id,product_id),
	FOREIGN KEY (mem_id) REFERENCES mem_infor(mem_id),
	FOREIGN KEY (product_id) REFERENCES product_infor(product_id)

);

#10.商品圖片
CREATE TABLE product_img(
	product_id	VARCHAR	(4) UNIQUE NOT NULL,
	img_link VARCHAR(6),	#P001-1

    PRIMARY KEY (product_id,img_link),
    FOREIGN KEY (product_id) REFERENCES product_infor(product_id)
);