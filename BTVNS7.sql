USE BTVNS6;
-- CƠ BẢN 1 
CREATE TABLE san_pham (
    id INT PRIMARY KEY,
    ten_san_pham VARCHAR(255),
    danh_muc VARCHAR(100),
    gia_ban INT,
    so_luong_ton INT
);
INSERT INTO san_pham (id, ten_san_pham, danh_muc, gia_ban, so_luong_ton) VALUES
(1, 'Laptop Dell XPS 13', 'Laptop', 28000000, 15),
(2, 'iPhone 14 Pro Max', 'Điện thoại', 32000000, 30),
(3, 'Bàn phím cơ Logitech', 'Phụ kiện', 2500000, 50),
(4, 'Laptop MacBook Air M2', 'Laptop', 29500000, 20),
(5, 'Samsung Galaxy S23 Ultra', 'Điện thoại', 26000000, 25),
(6, 'Chuột không dây Fuhlen', 'Phụ kiện', 450000, 100),
(7, 'Tai nghe Sony WH-1000XM5', 'Phụ kiện', 8500000, 40),
(8, 'Laptop HP Envy 15', 'Laptop', 24000000, 18);
SELECT *
FROM san_pham
WHERE gia_ban BETWEEN 20000000 AND 30000000;
SELECT *
FROM san_pham
WHERE ten_san_pham LIKE '%Laptop%';
SELECT COUNT(*) AS so_luong_phu_kien
FROM san_pham
WHERE danh_muc = 'Phụ kiện';
SELECT *
FROM san_pham
ORDER BY gia_ban DESC
LIMIT 3;

-- CƠ BẢN 2 
CREATE TABLE SACH (
ID INT PRIMARY KEY,
TIEU_DE VARCHAR(255),
TAC_GIA VARCHAR(255),
THE_LOAI VARCHAR(100),
NAM_XUAT_BAN INT,
TRANG_THAI VARCHAR(50)
);
INSERT INTO SACH ( TIEU_DE, TAC_GIA, THE_LOAI, NAM_XUAT_BAN, TRANG_THAI)
VALUES 
(1, 'Dế Mèn phiêu lưu ký', 'Tô Hoài', 'Văn học', 1941, 'Có sẵn'),

(2, 'Cho tôi xin một vé đi tuổi thơ', 'Nguyễn Nhật Ánh', 'Văn học', 2008, 'Đã mượn'),

(3, 'Số đỏ', 'Vũ Trọng Phụng', 'Tiểu thuyết', 1936, 'Có sẵn'),

(4, 'Nhà giả kim', 'Paulo Coelho', 'Tiểu thuyết', 1988, 'Có sẵn'),

(5, 'Mắt biếc', 'Nguyễn Nhật Ánh', 'Văn học', 1990, 'Đã mượn'),

(6, 'Trên đường băng', 'Tony Buổi Sáng', 'Kỹ năng sống', 2015, 'Có sẵn'),

(7, 'Đắc nhân tâm', 'Dale Carnegie', 'Kỹ năng sống', 1936, 'Có sẵn');
SELECT * FROM SACH
WHERE TAC_GIA = 'NGUYỄN NHẬT ÁNH';
SELECT * FROM SACH
WHERE THE_LOAI IN ('VĂN HỌC' , 'TIỂU THUYẾT');
SELECT COUNT(*) AS TOTAL 
FROM SACH 
WHERE TRANG_THAI = 'ĐÃ MƯỢN';
SELECT * FROM SACH
ORDER BY NMA_XUAT_BAN ASC
LIMIT 2;

-- CƠ BẢN 3 
CREATE TABLE PHIM (
ID INT PRIMARY KEY,
TIEU_DE VARCHAR(255),
DAO_DIEN VARCHAR(255),
NAM_PHAT_HANH INT,
THE_LOAI VARCHAR(100),
DIEM_DANH_GIA DECIMAL(3,1)
);
INSERT INTO PHIM ( ID,TIEU_DE, DAO_DIEN,NMA_PHAT_HANH,THE_LOAI,DIEM_DANH_GIA)
VALUES 
(1, 'Inception', 'Christopher Nolan', 2010, 'Khoa học viễn tưởng', 8.8),

(2, 'The Dark Knight', 'Christopher Nolan', 2008, 'Hành động', 9.0),

(3, 'Parasite', 'Bong Joon Ho', 2019, 'Tâm lý', 8.5),

(4, 'Mắt Biếc', 'Victor Vũ', 2019, 'Lãng mạn', 7.8),

(5, 'Interstellar', 'Christopher Nolan', 2014, 'Khoa học viễn tưởng', 8.6),

(6, 'Avengers: Endgame', 'Anthony Russo', 2019, 'Hành động', 8.4),

(7, 'Joker', 'Todd Phillips', 2019, 'Tâm lý', 8.4);
SELECT * FROM PHIM
WHERE DAO_DIEM = 'CHRISTOPHER NOLAN';
SELECT * FROM PHIM
WHERE NAM_PHAT_HANH BETWEEN 2010 AND 2019;
SELECT AVG(DIEM_DANH_GIA) AS DIEM_TRUNG_BINH
FROM PHIM;
SELECT * FROM PHIM
ORDER BY DIEM_DANH_GIA DESC 
LIMIT 3;

-- CƠ BẢN 4
CREATE TABLE MON_AN (
ID INT PRIMARY KEY,
TEN_MON VARCHAR(255),
DANH_MUC VARCHAR(100),
GIA_TIEN INT,
TRANG_THAI_PHUC_VU VARCHAR(50)
);
INSERT INTO MON_AN (TEN_MON, DANH_MUC, GIA_TIEN,TRANG_THAI_PHUC_VU)
VALUES 
(1, 'Phở Bò Tái', 'Món chính', 50000, 'Đang phục vụ'),

(2, 'Cơm Gà Xối Mỡ', 'Món chính', 45000, 'Đang phục vụ'),

(3, 'Gỏi Cuốn Tôm Thịt', 'Khai vị', 30000, 'Đang phục vụ'),

(4, 'Bún Bò Huế', 'Món chính', 55000, 'Tạm ngưng'),

(5, 'Nước Cam Ép', 'Đồ uống', 25000, 'Đang phục vụ'),

(6, 'Chè Hạt Sen', 'Tráng miệng', 20000, 'Đang phục vụ'),

(7, 'Cà Phê Sữa Đá', 'Đồ uống', 22000, 'Đang phục vụ'),

(8, 'Bò Lúc Lắc', 'Món chính', 70000, 'Đang phục vụ');
SELECT * FROM MON_AN 
WHERE DANH_MUC IN ( 'MÓN CHÍNH' , 'KHAI VỊ');
SELECT MIN(GIA_TIEN) 
WHERE TRANG_THAI_PHUC_VU = 'ĐANG PHỤC VỤ';
SELECT * FROM MON_AN
WHERE TEN_MON LIKE '%Bò%' ;
SELECT * FROM MON_AN 
ORDER BY GIA_TIEN ASC
LIMIT 3;

-- KHÁ 1 
CREATE TABLE DON_HANG ( 
ID_DON_HANG INT PRIMARY KEY,
ID_KHACH_HANG INT,
DANH_MUC VARCHAR(100),
TONG_TIEN INT,
NGAY_DAT DATE,
TRANG_THAI VARCHAR(50)
);
INSERT INTO DON_HANG 
VALUES 
(1, 101, 'Dien tu', 15000000, '2023-01-15', 'Hoan thanh'),

(2, 102, 'Thoi trang', 2500000, '2023-01-20', 'Hoan thanh'),

(3, 101, 'Dien tu', 8000000, '2023-02-10', 'Hoan thanh'),

(4, 103, 'Gia dung', 5000000, '2023-02-12', 'Da huy'),

(5, 102, 'Thoi trang', 3000000, '2023-03-05', 'Hoan thanh'),

(6, 101, 'Gia dung', 4500000, '2023-03-08', 'Hoan thanh'),

(7, 104, 'Dien tu', 22000000, '2023-04-18', 'Hoan thanh'),

(8, 103, 'Thoi trang', 1800000, '2023-04-22', 'Hoan thanh'),

(9, 102, 'Dien tu', 12000000, '2022-12-10', 'Hoan thanh');
SELECT ID_KHACH_HANG,
SUM(TONG_TIEN) AS TONG_CHI_TIEU
FROM DON_HANG
GROUP BY ID_KHACH_HANG
ORDER BY TONG_CHI_TIEU DESC;
SELECT DANH_MUC,
COUNT(ID_DON_HANG) AS SO_LUONG_DON 
FROM DON_HANG
GROUP BY DANH_MUC;
SELECT ID_KHACH_HANG, COUNT(ID_DON_HANG)
FROM DON_HANG 
GROUP BY ID_KHACH_HANG 
HAVING COUNT(ID_DON_HANG) >1;
SELECT DANH_MUC,
SUM(TONG_TIEN) AS TONG_DOANH_THU 
WHERE TRANG_THAI LIKE 'Hoan thanh'
GROUP BY DANH_MUC 
HAVING SUM(TONG_TIEN) >10000000;

-- KHÁ 2
CREATE TABLE NHAT_KY_NGUOI_DUNG ( 
ID_NHAT_KY INT PRIMARY KEY,
ID_NGUOI_DUNG INT,
ID_BAI_VIET INT,
CHUYEN_MUC VARCHAR(100),
THOI_GIAN_DOC_GIAY INT,
NGAY_GHI_NHAT_KY DATE
);
INSERT INTO NHAT_KY_NGUOI_DUNG 
VALUES
(1, 1, 101, 'Lap trinh', 300, '2023-10-01'),

(2, 2, 102, 'Thiet ke', 180, '2023-10-01'),

(3, 1, 103, 'Lap trinh', 450, '2023-10-02'),

(4, 3, 104, 'Bao mat', 600, '2023-10-03'),

(5, 2, 101, 'Lap trinh', 240, '2023-10-03'),

(6, 1, 104, 'Bao mat', 500, '2023-10-04'),

(7, 4, 102, 'Thiet ke', 120, '2023-10-04'),

(8, 3, 101, 'Lap trinh', 320, '2023-10-05'),

(9, 2, 105, 'Thiet ke', 200, '2023-10-05');
SELECT ID_NGUOI_DUNG , 
SUM(THOI_GIAN_DOC_GIAY) AS TONG_THOI_GIAN_DOC 
FROM NHAT_KY_NGUOI_DUNG 
GROUP BY ID_NGUOI_DUNG
ORDER BY TONG_THOI_GIAN_DOC DESC;
SELECT CHUYEN_MUC,
	   COUNT(*) AS SO_LUOT_DOC
FROM NHAT_KY_NGUOI_DUNG 
GROUP BY CHUYEN_MUC;
SELECT ID_BAI_VIET
FROM NHAT_KY_NGUOI_DUNG 
GROUP BY ID_BAI_VIET 
HAVING COUNT(ID_BAI_VIET)  > 1;
SELECT ID_NGUOI_DUNG,
	   AVG(THOI_GIAN_DOC_GIAY)
 FROM NHAT_KY_NGUOI_DUNG 
 GROUP BY ID_NGUOI_DUNG 
 HAVING AVG(THOI_GIAN_DOC_GIAY) > 350;
 

-- GIỎI 
CREATE TABLE GIAO_DICH (
ID_GIAO_DICH INT PRIMARY KEY,
ID_KHACH_HANG INT,
ID_SAN_PHAM INT,
ten_san_pham VARCHAR(255),

danh_muc VARCHAR(100),

so_luong INT,

don_gia INT,

ngay_giao_dich DATE,

khu_vuc VARCHAR(100) -- Ví dụ: 'Ha Noi', 'Da Nang', 'TP.HCM'
);
INSERT INTO GIAO_DICH 
VALUES 
(1, 101, 1, 'Laptop A', 'Dien tu', 1, 20000000, '2023-01-15', 'Ha Noi'),

(2, 102, 2, 'Dien thoai B', 'Dien tu', 2, 15000000, '2023-02-20', 'TP.HCM'),

(3, 101, 3, 'Ao so mi C', 'Thoi trang', 5, 500000, '2023-03-10', 'Ha Noi'),

(4, 103, 1, 'Laptop A', 'Dien tu', 1, 20000000, '2023-03-12', 'Da Nang'),

(5, 102, 4, 'Quan jean D', 'Thoi trang', 3, 700000, '2023-04-05', 'TP.HCM'),

(6, 101, 2, 'Dien thoai B', 'Dien tu', 1, 15000000, '2023-05-08', 'Ha Noi'),

(7, 104, 5, 'Noi com dien E', 'Gia dung', 2, 2000000, '2023-05-18', 'TP.HCM'),

(8, 103, 3, 'Ao so mi C', 'Thoi trang', 10, 500000, '2023-06-22', 'Da Nang'),

(9, 102, 1, 'Laptop A', 'Dien tu', 1, 21000000, '2023-07-10', 'TP.HCM'),

(10, 105, 6, 'May xay sinh to F', 'Gia dung', 1, 1500000, '2022-12-01', 'Ha Noi'),

(11, 101, 4, 'Quan jean D', 'Thoi trang', 2, 700000, '2023-08-15', 'Ha Noi');
SELECT ID_KHACH_HANG,
	   SUM(DON_GIA) AS TONG_CHI_TIEU_2023 
FROM GIAO_DICH
WHERE YEAR(NGAY_GIAO_DICH) LIKE '2023'
GROUP BY ID_KHACH_HANG 
HAVING TONG_CHI_TIEU_2023 > 30000000;








