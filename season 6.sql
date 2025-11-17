CREATE DATABASE IF NOT EXISTS QuanLyThuVien;
USE QuanLyThuVien;
CREATE TABLE TacGia (
    MaTacGia INT AUTO_INCREMENT PRIMARY KEY,
    TenTacGia VARCHAR(100) NOT NULL,
    QuocTich VARCHAR(50)
);
CREATE TABLE DocGia (
    MaDocGia INT AUTO_INCREMENT PRIMARY KEY,
    TenDocGia VARCHAR(100) NOT NULL,
    DiaChi VARCHAR(255),
    SoDienThoai VARCHAR(15) UNIQUE
);

-- CƠ BẢN 2 
INSERT INTO TacGia (TenTacGia, QuocTich)
VALUES 
('Nguyễn Nhật Ánh', 'Việt Nam'),
('J.K. Rowling', 'Anh'),
('Haruki Murakami', 'Nhật Bản'),
('Dale Carnegie', 'Mỹ');
INSERT INTO DocGia (TenDocGia, DiaChi, SoDienThoai)
VALUES
('Nguyễn Văn A', '123 Đường ABC, Hà Nội', '0901234567'),
('Trần Thị B', '456 Đường XYZ, TP.HCM', '0912345678'),
('Lê Văn C', '789 Đường LMN, Đà Nẵng', '0923456789'),
('Phạm Thị D', '101 Đường QRS, Hà Nội', '0934567890'),
('Hoàng Văn E', '202 Đường UVW, Cần Thơ', '0945678901');

-- CƠ BẢN 3 
SELECT *
FROM TacGia
WHERE QuocTich = 'Việt Nam';
SELECT *
FROM DocGia
WHERE DiaChi LIKE '%Hà Nội%';
SELECT TenDocGia, SoDienThoai
FROM DocGia;

-- CƠ BẢN 4 
UPDATE DocGia
SET DiaChi = '200 Đường XYZ, TP. Thủ Đức'
WHERE MaDocGia = 2;
DELETE FROM TacGia
WHERE MaTacGia = 3;

-- KHÁ 1 
CREATE TABLE Sach (
    MaSach INT AUTO_INCREMENT PRIMARY KEY,
    TenSach VARCHAR(200) NOT NULL,
    NamXuatBan INT,
    MaTacGia INT,
    FOREIGN KEY (MaTacGia) REFERENCES TacGia(MaTacGia)
);
INSERT INTO Sach (TenSach, NamXuatBan, MaTacGia)
VALUES
('Cho tôi xin một vé đi tuổi thơ', 2008, 1),
('Mắt biếc', 1990, 1),
('Harry Potter và Hòn đá Phù thủy', 1997, 2),
('Harry Potter và Phòng chứa Bí mật', 1998, 2),
('Đắc nhân tâm', 1936, 4);

-- KHÁ 2
SELECT *
FROM Sach
WHERE NamXuatBan >= 1990
  AND NamXuatBan <= 2000;
SELECT *
FROM Sach
WHERE NamXuatBan BETWEEN 1990 AND 2000;
SELECT *
FROM Sach
WHERE TenSach = 'Harry Potter và Hòn đá Phù thủy'
   OR TenSach = 'Harry Potter và Phòng chứa Bí mật';
SELECT *
FROM Sach
WHERE MaTacGia = 1
  AND NamXuatBan > 2000;

-- KHÁ 3 
SELECT *
FROM Sach
ORDER BY NamXuatBan DESC;
SELECT *
FROM DocGia
ORDER BY TenDocGia ASC;
CREATE TABLE PhieuMuon (
    MaPhieuMuon INT AUTO_INCREMENT PRIMARY KEY,
    NgayMuon DATE,
    NgayTra DATE,
    MaDocGia INT,
    MaSach INT,
    FOREIGN KEY (MaDocGia) REFERENCES DocGia(MaDocGia),
    FOREIGN KEY (MaSach) REFERENCES Sach(MaSach)
);

-- GIỎI 1
ALTER TABLE Sach
ADD COLUMN TrangThai VARCHAR(50);
SET SQL_SAFE_UPDATES = 0;
UPDATE Sach
SET TrangThai = 'Còn hàng'
WHERE NamXuatBan < 2000;
UPDATE Sach
SET TrangThai = 'Mới nhập'
WHERE NamXuatBan >= 2000;

-- GIỎI 2
INSERT INTO PhieuMuon (MaDocGia, MaSach, NgayMuon, NgayTra)
VALUES
(1, 1, '2024-01-10', '2024-01-25'),
(2, 3, '2024-02-15', NULL),
(1, 2, '2024-03-01', '2024-03-15'),
(3, 4, '2024-03-05', NULL),
(5, 5, '2024-04-20', '2024-05-01');
SELECT *
FROM PhieuMuon
WHERE MaDocGia = 1;
SELECT *
FROM PhieuMuon
WHERE NgayTra IS NULL;

-- XS
SELECT *
FROM PhieuMuon
WHERE MaDocGia = 1
  AND NgayTra IS NULL;
DELETE FROM PhieuMuon
WHERE MaDocGia = 1;
DELETE FROM DocGia
WHERE MaDocGia = 1;

