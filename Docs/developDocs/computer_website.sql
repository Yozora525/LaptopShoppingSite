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

INSERT INTO manager VALUES ('M001','serverDG@123','1094412253');

SELECT * FROM  manager;

CREATE TABLE type_list( 
	product_type	VARCHAR	(32),
    PRIMARY KEY (product_type)
);

INSERT INTO type_list VALUES ("輕薄便攜");
INSERT INTO type_list VALUES ("商務");
INSERT INTO type_list VALUES ("電競");
INSERT INTO type_list VALUES ("創作設計");

#5.產品基本資料表
CREATE TABLE product_infor( 
	product_id	VARCHAR	(4) UNIQUE NOT NULL,
	product_name	VARCHAR	(32) UNIQUE NOT NULL,
	product_price	INTEGER	NOT NULL, #單價
	product_amount	INTEGER	NOT NULL, #庫存
	product_status	INTEGER	NOT NULL, #上/下架 1/0
	product_discript	TEXT NOT NULL,
	product_sold	INTEGER	NOT NULL, #銷售量(熱門)
	product_size	FLOAT NOT NULL,	
	product_brand	VARCHAR	(64) NOT NULL,
	product_touch	INTEGER	NOT NULL,
	product_type	VARCHAR	(32) NOT NULL,

    PRIMARY KEY (product_id),
	FOREIGN KEY (product_type) REFERENCES type_list(product_type)
);

INSERT INTO product_infor VALUES ("P001", "ASUS X515", 17900, 200, 1, "*搭載Intel® Core™ i5 處理器</br>*NVIDIA® GeForce® MX330 獨立顯示卡</br>*最高512GB SSD硬碟</br>*83% 螢幕占比 15.6吋FHD螢幕", 20000, 15.6, 'ASUS', 0, '輕薄便攜');
INSERT INTO product_infor VALUES ("P002", "ASUS Zenbook 14 Flip OLED", 40900, 200, 1, "*14 英寸 4K OLED HDR 顯示器</br>*16:10 寬高比</br>*15.9毫米/1.4公斤重</br>*搭載Intel® Core™ i7晶片", 20200, 14, 'ASUS', 1, '商務');
INSERT INTO product_infor VALUES ("P003", "ASUS TUF Gaming F15", 33500, 200, 1, "*最高 DDR5-4800MHz 的 RAM</br>*90Wh 的電池</br>*80% 螢幕機身比</br>*最高支援 FHD 144Hz", 20800, 15.6, 'ASUS', 0, '電競');
INSERT INTO product_infor VALUES ("P004", "ASUS ZenBook 13 OLED", 34900, 200, 1, "*搭載AMD Ryzen™ 5000 處理器</br>*512GB M.2 NVMe™ PCIe® 3.0 SSD</br>*13.3 吋, FHD (1920 x 1080) 16:9 窄邊框</br>*通過 PANTONE 認證, 螢幕佔比：88 ％", 20010, 13, 'ASUS', 0, '輕薄便攜');
INSERT INTO product_infor VALUES ("P005", "APPLE MacBook Air", 38900, 200, 1, "*13.3 英寸視網膜顯示螢幕</br>*蘋果M1芯片</br>*高達2TB 的存儲空間</br>*長達18 小時的電池壽命", 20300, 13.3, 'APPLE', 0, '創作設計');
INSERT INTO product_infor VALUES ("P006", "APPLE MacBook Pro", 104900, 200, 1, "*15.4 吋 (對角線) LED 背光顯示器</br>*亮度 500 尼特</br>*內建 16GB 2400MHz DDR4 記憶體</br>*最長可達 10 小時無線上網時間", 20000, 16, 'APPLE', 0, '創作設計');
INSERT INTO product_infor VALUES ("P007", "ACER Nitro5", 39500, 200, 1, "*Nvidia RTX3060 顯卡</br>*165Hz/3ms 電競螢幕</br>*Intel® Core™ i7-12700H</br>*搭載NVIDIA® GeForce RTX™ 3060 顯示卡", 20070, 15.6, 'ACER', 0, '電競');
INSERT INTO product_infor VALUES ("P008", "ACER Swift5", 29900, 200, 1, "*大猩猩®玻璃 的 WQXGA 1觸摸屏顯示器</br>*92.22%的占屏比</br>*12th Gen Intel® Core™</br>*陽極氧化處理以抵抗腐蝕和磨損，表面經久耐用", 20800, 14, 'ACER', 1, '輕薄便攜');
INSERT INTO product_infor VALUES ("P009", "ACER Aspire5", 11900, 200, 1, "*搭載 intel Core i5處理器</br>*高達83%屏佔比</br>*FHD廣視角14&quot;螢幕</br>*顯示晶片：NVIDIA® GeForce® MX350", 28300, 14, 'ACER', 1, '商務');
INSERT INTO product_infor VALUES ("P010", "MSI Stealth 15M", 47900, 200, 1, "*搭載12代Intel® Core™ i7處理器</br>*NVIDIA® GeForce® RTX™ 3060獨立顯示卡</br>*15.6吋FHD(1920x1080)</br>*144Hz螢幕更新率", 20100, 15.6, 'MSI', 0, '電競');
INSERT INTO product_infor VALUES ("P011", "MSI Modern14", 23900, 200, 1, "*搭載AMD Ryzen™ 5000 處理器</br>*超輕1.3kg</br>*薄邊框IPS級面板</br>*AMD Radeon™ 顯卡</br>*", 20200, 14, 'MSI', 0, '創作設計');
INSERT INTO product_infor VALUES ("P012", "MSI Alpha 15", 34900, 200, 1, "*搭載AMD Ryzen™ 4000 H 處理器</br>*AMD Radeon™ RX 5000 顯卡</br>*15.6&quot; FHD (1920x1080)</br>*支持 AMD Radeon FreeSync 技術", 20000, 15.6, 'MSI', 0, '電競');
INSERT INTO product_infor VALUES ("P013", "MSI Prestige 14", 30900, 200, 1, "*搭載第11代 Intel® Core™ i7 處理器</br>*14吋4K超高畫質 (3840x2160)</br>*接近100% sRGB, IPS等級窄邊框面板設計</br>*10 小時電池續航力", 20040, 14, 'MSI', 0, '創作設計');
INSERT INTO product_infor VALUES ("P014", "HP Elite Dragonfly G2", 59900, 200, 1, "*搭載Intel Core i7-1185G7 處理器</br>*33.8 公分 (13.3 吋) 對角線 FHD </br>*128 GB PCIe Gen 3 x2 NVMe M.2 TLC 固態硬碟 (SSD)</br>*2個 USB 3.2 Gen 1 Type-C 連接埠", 20700, 13, 'HP', 1, '商務');
INSERT INTO product_infor VALUES ("P015", "HP 470 G8", 29999, 200, 1, "*搭載Intel Core i7-1065G7 處理器</br>*16 GB DDR4-3200 SDRAM (2 x 8 GB)</br>*ntel AX201 Wi-Fi 6 (2x2) 與 Bluetooth 5 複合式介面卡</br>*43.9 公分 (17.3 吋) 對角線", 20600, 17.3, 'HP', 0, '商務'); 
INSERT INTO product_infor VALUES ("P016", "HP 14s", 31900, 200, 1, "*搭載Intel® Core™ i7-1195G7處理器</br>*Intel® Iris® Xᵉ Graphics(圖形卡)</br>*FHD (1920 x 1080)</br>*1.46公斤", 28000, 14, 'HP', 0, '輕薄便攜');			
INSERT INTO product_infor VALUES ("P017", "HP OMEN 16", 48900, 200, 1, "搭載AMD Ryzen™ 7 5800H處理器</br>*16 GB DDR4-3200 MHz RAM</br>*NVIDIA® GeForce RTX™ 3070 Laptop GPU顯卡</br>*1 TB PCIe® NVMe™ TLC M.2 固態硬碟", 20600, 16.1, 'HP', 0, '電競'); 			
INSERT INTO product_infor VALUES ("P018", "ACER TravelMate", 31900, 200, 1, "*搭載 intel Core i7處理器</br>*35.6 cm (14&quot;)螢幕尺寸</br>*8GB記憶體</br>*Bluetooth 5.0", 20090, 14, 'ACER', 0, '商務'); 
INSERT INTO product_infor VALUES ("P019", "ASUS E410", 9488, 200, 1, "*1.3公斤</br>*最高搭載 Intel 四核心處理器</br>*128GB儲存空間</br>*具備最高 12 小時電池續航力", 20900, 14, 'ASUS', 0, '輕薄便攜');
INSERT INTO product_infor VALUES ("P020", "MSI Summit E16 Flip", 55900, 200, 1, "*第11代Intel® Core™ i7 處理器</br>*Intel® Iris® Xe 顯示卡</br>*16吋 QHD+ (2560x1600), 16:10黃金比例觸控面板</br>*極致輕巧 2kg", 29000, 16, 'MSI', 1, '創作設計');
SELECT * FROM product_infor;


#2.會員基本資料表
CREATE TABLE mem_infor(
	mem_id	VARCHAR	(20) UNIQUE NOT NULL,
	mem_name VARCHAR (16) DEFAULT '匿名的使用者',
	mem_sex	VARCHAR	(2) DEFAULT '',
	mem_phone	VARCHAR	(10) DEFAULT '',
	mem_birth	DATE NOT NULL DEFAULT '0000-00-00',
	mem_create	timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	mem_email VARCHAR (512) UNIQUE NOT NULL DEFAULT '',
    
    PRIMARY KEY (mem_id, mem_email)
);

INSERT INTO mem_infor VALUES ('MEM20220601112045001','陳鈞真', 'M', '0911235813', '2000-09-28', '2022-06-01 11:20:45', 'adsasddsa@gmail.com');
INSERT INTO mem_infor VALUES ('MEM20220531100430002','徐岱揚', 'F', '0924681012', '2000-10-31', '2022-05-31 10:04:30', 'abbcccddde@yahoo.com');
INSERT INTO mem_infor VALUES ('MEM20220609222218003','吳季貞', 'F', '0913579111', '2001-12-25', '2022-06-09 22:22:18', 'ag128442da@gmail.com');
INSERT INTO mem_infor VALUES ('MEM20220530130455004','張貞量', 'M', '0987654321', '2002-03-05', '2022-05-30 13:04:55', 'xyyz17rip976da@yahoo.com');
INSERT INTO mem_infor VALUES ('MEM20220602194439005','李德芸', 'F', '0912345678', '2001-04-02', '2022-06-02 19:44:39', 'aqwert2yy@gmail.com');
UPDATE mem_infor SET mem_name = '陳鈞真', mem_email='adsasddsa@gmail.com', mem_phone='0911235813',mem_birth='2000-09-28' WHERE mem_id ='MEM20220601112045001';

#1.登入
CREATE TABLE login (
	mem_id	VARCHAR(20) unique NOT NULL,
	mem_account	VARCHAR	(512) unique NOT NULL,
	mem_password VARCHAR (32) NOT NULL,
    
    PRIMARY KEY (mem_id),
	FOREIGN KEY (mem_id) REFERENCES mem_infor(mem_id)
   	#FOREIGN KEY (account) REFERENCES mem_infor(mem_email)
);

INSERT INTO login VALUES ('MEM20220601112045001', 'adsasddsa@gmail.com', 'unhappypi000');
INSERT INTO login VALUES ('MEM20220531100430002', 'abbcccddde@yahoo.com', 'happeko988');
INSERT INTO login VALUES ('MEM20220609222218003', 'ag128442da@gmail.com', 'pi4happy');
INSERT INTO login VALUES ('MEM20220530130455004', 'xyyz17rip976da@gmail.com', 'happyhappypi8888');
INSERT INTO login VALUES ('MEM20220602194439005', 'aqwert2yy@gmail.com', 'happi111');
#SELECT * FROM login WHERE mem_account = 'fffffffff@gmail.com';

#4.訂單明細
CREATE TABLE order_details(
	order_id	VARCHAR	(22)  NOT NULL, 
	product_id	VARCHAR	(4)  NOT NULL,
	order_time	timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,	
	order_addr	VARCHAR	(64) NOT NULL,
	howmuch	INTEGER	NOT NULL, #商品數量

    PRIMARY KEY (order_id,product_id),
    FOREIGN KEY (product_id) REFERENCES product_infor(product_id)
);

INSERT INTO order_details VALUES ('order20220610223210001', 'P001', '2022-06-10 22:32:10','320桃園市中壢區中北路200號','2');
INSERT INTO order_details VALUES ('order20220613121215015', 'P015', '2022-06-13 12:12:15','320桃園市中壢區大仁街6號','1');
INSERT INTO order_details VALUES ('order20220611161715101', 'P002', '2022-06-11 16:17:25','100台北市中正區重慶南路一段122號','64');
INSERT INTO order_details VALUES ('order20220611161715101', 'P012', '2022-06-11 16:17:25','100台北市中正區重慶南路一段122號','3');
INSERT INTO order_details VALUES ('order20220611161715101', 'P007', '2022-06-11 16:17:25','100台北市中正區重慶南路一段122號','10');
INSERT INTO order_details VALUES ('order20220610111139987', 'P004', '2022-06-10 14:11:39','320桃園市中壢區中北路131號','5');
INSERT INTO order_details VALUES ('order20220610111139987', 'P018', '2022-06-10 14:11:39','320桃園市中壢區中北路131號','15');
INSERT INTO order_details VALUES ('order20220615205144324', 'P001', '2022-06-15 20:51:44','106台北市大安區基隆路二段207號','90');
INSERT INTO order_details VALUES ('order20220615205144324', 'P014', '2022-06-15 20:51:44','106台北市大安區基隆路二段207號','13');
INSERT INTO order_details VALUES ('order20220615205144324', 'P003', '2022-06-15 20:51:44','106台北市大安區基隆路二段207號','6');

INSERT INTO order_details VALUES ('order20220615205144324', 'P015', '2022-06-15 20:51:44','106台北市大安區基隆路二段207號','1');
SELECT * FROM order_details;
#3.訂單清單
CREATE TABLE orders(
	order_id VARCHAR (22) UNIQUE NOT NULL,
	mem_id	VARCHAR	(64)  NOT NULL,
    PRIMARY KEY (order_id),
	FOREIGN KEY (order_id) REFERENCES order_details(order_id),
    FOREIGN KEY (mem_id) REFERENCES mem_infor(mem_id)
);

INSERT INTO orders VALUES ('order20220613121215015', 'MEM20220601112045001');
INSERT INTO orders VALUES ('order20220610223210001', 'MEM20220531100430002');
INSERT INTO orders VALUES ('order20220610111139987', 'MEM20220609222218003');
INSERT INTO orders VALUES ('order20220611161715101', 'MEM20220530130455004');
INSERT INTO orders VALUES ('order20220615205144324', 'MEM20220602194439005');

SELECT * FROM orders;
SELECT order_time FROM order_details WHERE order_id='order20220615205144324';

#7.會員評論
CREATE TABLE comment(
	mem_id	VARCHAR	(64) NOT NULL,
	product_id	VARCHAR	(4) NOT NULL,
	mem_comment	TEXT NOT NULL,
	star	INTEGER NOT NULL,
	comment_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (mem_id,product_id),
   	FOREIGN KEY (mem_id) REFERENCES mem_infor(mem_id),
	FOREIGN KEY (product_id) REFERENCES product_infor(product_id)

);

INSERT INTO comment VALUES ('MEM20220601112045001', 'P001', '超級好用，人生用過最好的筆電。', '5', '2022-05-31 10:45:36');
INSERT INTO comment VALUES ('MEM20220531100430002', 'P012', '會分享給親朋好友，效能極佳。', '5', '2022-05-31 09:08:23');
INSERT INTO comment VALUES ('MEM20220530130455004', 'P001', '推薦，但並沒有很符合我的需求。', '4', '2022-06-01 23:15:04');
INSERT INTO comment VALUES ('MEM20220609222218003', 'P006', '期待越高，失望越大。', '2', '2022-06-09 07:12:55');
INSERT INTO comment VALUES ('MEM20220602194439005', 'P018', '介面清楚、操作容易好懂。', '5', '2022-06-17 11:23:48');
INSERT INTO comment VALUES ('MEM20220530130455004', 'P003', '中規中矩，CP值普普。', '3', '2022-06-13 03:00:01');
INSERT INTO comment VALUES ('MEM20220602194439005', 'P016', '還不錯，但仍有可進步空間。', '4', '2022-06-11 01:30:23');
INSERT INTO comment VALUES ('MEM20220601112045001', 'P015', '與想像中效果有些落差。', '2', '2022-06-16 17:59:59');
INSERT INTO comment VALUES ('MEM20220531100430002', 'P006', '功能極強，非常喜歡。', '5', '2022-06-17 20:55:45');

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
	product_id	VARCHAR	(4) NOT NULL,
	order_amount INTEGER NOT NULL,

    PRIMARY KEY (mem_id,product_id),
	FOREIGN KEY (mem_id) REFERENCES mem_infor(mem_id),
	FOREIGN KEY (product_id) REFERENCES product_infor(product_id)

);

INSERT INTO cart VALUES ('MEM20220601112045001', 'P011', '5');
INSERT INTO cart VALUES ('MEM20220601112045001', 'P007', '5');
INSERT INTO cart VALUES ('MEM20220601112045001', 'P016', '5');
INSERT INTO cart VALUES ('MEM20220601112045001', 'P005', '5');
INSERT INTO cart VALUES ('MEM20220531100430002', 'P007', '3');
INSERT INTO cart VALUES ('MEM20220531100430002', 'P001', '10');
INSERT INTO cart VALUES ('MEM20220609222218003', 'P016', '4');
INSERT INTO cart VALUES ('MEM20220609222218003', 'P005', '2');
INSERT INTO cart VALUES ('MEM20220609222218003', 'P019', '1');
INSERT INTO cart VALUES ('MEM20220530130455004', 'P012', '13');
INSERT INTO cart VALUES ('MEM20220602194439005', 'P015', '6');
INSERT INTO cart VALUES ('MEM20220602194439005', 'P020', '9');
INSERT INTO cart VALUES ('MEM20220602194439005', 'P011', '5');
INSERT INTO cart VALUES ('MEM20220530130455004', 'P011', '5');
INSERT INTO cart VALUES ('MEM20220609222218003', 'P011', '5');

#10.商品圖片
CREATE TABLE product_img(
	product_id	VARCHAR	(4)  NOT NULL,
	img_link VARCHAR(100), #P001-1
	img_link_two VARCHAR(100),	

    PRIMARY KEY (product_id,img_link,img_link_two),
    FOREIGN KEY (product_id) REFERENCES product_infor(product_id)
);

INSERT INTO product_img VALUES ('P001', '../assets/img/pro/ASUS/ASUS X515_1.png', '../assets/img/pro/ASUS/ASUS X515_2.png');

INSERT INTO product_img VALUES ('P002', '../assets/img/pro/ASUS/ASUS Zenbook 14 Flip OLED_1.png', '../assets/img/pro/ASUS/ASUS Zenbook 14 Flip OLED_2.png');

INSERT INTO product_img VALUES ('P003','../assets/img/pro/ASUS/ASUS TUF Gaming F15_1.png', '../assets/img/pro/ASUS/ASUS TUF Gaming F15_2.png');

INSERT INTO product_img VALUES ('P004','../assets/img/pro/ASUS/ASUS ZenBook 13 OLED_1.png', '../assets/img/pro/ASUS/ASUS ZenBook 13 OLED_2.png');

INSERT INTO product_img VALUES ('P005', '../assets/img/pro/APPLE/APPLE MacBook Air_1.png', '../assets/img/pro/APPLE/APPLE MacBook Air_2.png');

INSERT INTO product_img VALUES ('P006', '../assets/img/pro/APPLE/APPLE MacBook Pro_1.png', '../assets/img/pro/APPLE/APPLE MacBook Pro_2.png');

INSERT INTO product_img VALUES ('P007', '../assets/img/pro/ACER/ACER Nitro5_1.png', '../assets/img/pro/ACER/ACER Nitro5_2.png');

INSERT INTO product_img VALUES ('P008', '../assets/img/pro/ACER/ACER Swift5_1.png', '../assets/img/pro/ACER/ACER Swift5_2.png');

INSERT INTO product_img VALUES ('P009', '../assets/img/pro/ACER/ACER Aspire5_1.png', '../assets/img/pro/ACER/ACER Aspire5_2.png');

INSERT INTO product_img VALUES ('P010', '../assets/img/pro/MSI/MSI Stealth 15M_1.png', '../assets/img/pro/MSI/MSI Stealth 15M_2.png');

INSERT INTO product_img VALUES ('P011', '../assets/img/pro/MSI/MSI Modern14_1.png', '../assets/img/pro/MSI/MSI Modern14_2.png');

INSERT INTO product_img VALUES ('P012', '../assets/img/pro/MSI/MSI Alpha 15_1.png', '../assets/img/pro/MSI/MSI Alpha 15_2.png');

INSERT INTO product_img VALUES ('P013', '../assets/img/pro/MSI/MSI Prestige 14_1.png', '../assets/img/pro/MSI/MSI Prestige 14_2.png');

INSERT INTO product_img VALUES ('P014', '../assets/img/pro/HP/HP Elite Dragonfly G2_1.png', '../assets/img/pro/HP/HP Elite Dragonfly G2_2.png');

INSERT INTO product_img VALUES ('P015', '../assets/img/pro/HP/HP 470 G8_1.png', '../assets/img/pro/HP/HP 470 G8_2.png');

INSERT INTO product_img VALUES ('P016', '../assets/img/pro/HP/HP 14s_1.png', '../assets/img/pro/HP/HP 14s_2.png');

INSERT INTO product_img VALUES ('P017', '../assets/img/pro/HP/HP OMEN 16_1.png', '../assets/img/pro/HP/HP OMEN 16_2.png');

INSERT INTO product_img VALUES ('P018', '../assets/img/pro/ACER/ACER TravelMate_1.png', '../assets/img/pro/ACER/ACER TravelMate_2.png');

INSERT INTO product_img VALUES ('P019', '../assets/img/pro/ASUS/ASUS E410_1.png', '../assets/img/pro/ASUS/ASUS E410_2.png');

INSERT INTO product_img VALUES ('P020', '../assets/img/pro/MSI/MSI Summit E16 Flip_1.png', '../assets/img/pro/MSI/MSI Summit E16 Flip_2.png');

