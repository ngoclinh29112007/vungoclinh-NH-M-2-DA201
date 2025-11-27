-- cơ bản 1
create table Products(
  product_id int primary key,
  product_name varchar(100),
  price decimal,
  stock_quantity int
);

create table Customers(
  customer_id int primary key,
  customer_name varchar(100),
  city varchar(100)
);

create table orders(
order_id int primary key,
customer_id int,
foreign key(customer_id) references customers(customer_id),
order_date date,
total_date decimal
);

insert into products 
values (101,'Laptop AORUS 15X','35000.000','25'),
(102,'Bàn phím cơ Logitech G Pro','32500.000','50'),
(103,'Chuột không giây Logitech MX Master 3S','21900.000','75'),
(104,'Màn hình Dell UntraSharp U2723QE','18500.000','15'),
(105,'Tai nghe sony WH-1000XM5','69900.000','30');

insert into customers
values (1,'Nguyễn Văn An','Hà Nội'),
(2,'Trần Thị Bình','TP.HCM'),
(3,'Lê Công Minh','Đà Nẵng'),
(4,'Phạm Thu Hằng','Hải Phòng'),
(5,'Hoàng Đức Việt','Cần Thơ');

insert into orders
values (1001,1,'2025-11-20',35000.000),
(1002,2,'2025-11-21',54400.000),
(1003,3,'2025-11-21',18500.000),
(1004,4,'2025-11-22',69900.000),
(1005,5,'2025_11-22',21000.000);

-- 1 sử dụng hàm count 
select sum(product_id) as total_products
from products;

-- 2 sử dụng hàm sum
select sum(order_id) as total_revenue
from orders;

-- 3 sử dụng hàm AVG
select avg(price) as average_price
from products;

-- 4 Sử dụng min và max
select max(total_date) as max_order_amount
from orders;

select min(total_date) as min_order_amount
from orders;

-- 5 kết hợp với where
select count(city) as hanoi_customers_count
from customers 
where city like 'Hà Nội'

-- cơ bản 2 
      
create table employees(
employee_id int primary key,
full_name varchar(100),
department varchar(100),
salary decimal,
hire_date date
);
insert into employees
values
(101, 'Nguyễn Văn A', 'Sales', 55000.00, '2020-08-15'),
(102, 'Trần Thị B', 'IT', 68000.50, '2018-05-20'),
(103, 'Lê Văn C', 'HR', 48000.00, '2021-01-10'),
(104, 'Phạm Thị D', 'Marketing', 62500.25, '2019-11-01'),
(105, 'Hoàng Văn E', 'IT', 75000.00, '2017-03-25');

-- 1 sử dụng count 
select count(employee_id) 
as number_of_employees
from employees;

-- 2 sử dụng sum
select sum(salary) 
as total_monthly_salary
from employees;

-- 3 sử dụng AVG 
select avg(salary)
as average_salary
from employees;

-- 4 sử dụng min và max với số 
select max(salary) 
as highest_salary
from employees;

-- 5 sử dụng max min với ngày tháng
select min(hire_date)
as earliest_hire_date
from employees;

-- 6 kết hợp với where 
select sum(salary)
as it_department_salary
from employees
where department like 'IT';

-- cơ bản 3
create table Books(
  book_id int primary key,
  title varchar(100),
  author varchar(200),
  publication_year int,
  pages int
);

create table BorrowingRecords(
  record_id int primary key,
  book_id int,
  foreign key(book_id) references books(book_id),
  borrow_date date
);

INSERT INTO Books 
VALUES
(101, 'Tiểu thuyết Lửa', 'Nguyễn Nhật Ánh', 2018, 320),
(102, 'Tâm lý học về tiền', 'Morgan Housel', 2020, 280),
(103, 'Sử ký Tư Mã Thiên', 'Tư Mã Thiên', 1990, 850),
(104, 'Nguyên lý Marketing', 'Philip Kotler', 1999, 600),
(105, '1984', 'George Orwell', 1949, 304);

INSERT INTO BorrowingRecords 
VALUES
(1, 101, '2025-10-01'), 
(2, 102, '2025-10-05'), 
(3, 101, '2025-10-10'), 
(4, 104, '2025-10-15'), 
(5, 105, '2025-10-20'); 

-- 1 Sử dụng count
select count(book_id) 
as total_books
from books;

-- 2 sử dụng sum
select sum(pages) 
as total_pages_in_library
from books;

-- 3 sử dụng hàm avg
select book_id, avg(pages) 
as total_pages_per_book
from books
group by book_id;

-- 4 sử dụng min, max với số
select min(publication_year) 
as oldest_book_year
from books;
select max(publication_year)
as firs_borrow_date
from books;

-- 5 sử dụng min với ngày tháng
select  min(borrow_date)
as first_borrow_date
from borrowingrecords;

-- 6 kết hợp where
select count(publication_year)
as books_after_2000
from Books
where year (publication_year) > 2000

-- khá 4
create table Productss(
product_id INT primary key,
product_name VARCHAR(100),
category VARCHAR(100), 
price DECIMAL(10,2)
);

create table Orderss(
order_id INT primary key,
customer_id INT,
order_date DATE,
total_amount DECIMAL(10,2)
);

INSERT INTO Productss (product_id, product_name, category, price)
VALUES
(1, 'Laptop XYZ', 'Electronics', 1200.00),
(2, 'Sách: Lịch sử Việt Nam', 'Books', 25.50),
(3, 'Áo phông Cotton', 'Clothing', 35.99),
(4, 'Điện thoại Z Flip', 'Electronics', 999.00),
(5, 'Truyện tranh One Piece Tập 1', 'Books', 10.00);

INSERT INTO Orderss (order_id, customer_id, order_date, total_amount) 
VALUES
(101, 1, '2025-10-20', 1235.99),  
(102, 2, '2025-10-22', 25.50),   
(103, 1, '2025-11-01', 999.00),  
(104, 3, '2025-11-05', 10.00);  

-- Đếm số lượng sản phẩm trong mỗi danh mục (category). Bảng kết quả cần có 2 cột: category và number_of_products.
select category, count(product_id)
as number_of_products
from productss
group by category;

-- Tính tổng doanh thu (total_amount) cho mỗi khách hàng (customer_id). Bảng kết quả cần có 2 cột: customer_id và total_spent.
select customer_id, sum(total_amount)
as total_spent
from orderss
group by customer_id;

-- Kết hợp nhiều hàm tổng hợp với group by
-- Với mỗi danh mục sản phẩm, hãy tính: số lượng sản phẩm, giá trung bình, giá cao nhất, và giá thấp nhất. Bảng kết quả cần có các cột: category, product_count, avg_price, max_price, min_price.
select category,
count(product_id) as product_count,
avg(price) as avg_price,
max(price) as max_price,
min(price) as min_price
from productss 
group by category;  

-- Sử dụng HAVING để lọc nhóm:
-- Tìm những khách hàng có tổng chi tiêu lớn hơn 1000. Chỉ hiển thị customer_id và total_spent của những khách hàng này.
select customer_id, sum(total_amount)
as total_spent
from orderss
group by customer_id
having sum(total_amount)>1000;

-- Sử dụng HAVING với COUNT:
-- Liệt kê các danh mục có nhiều hơn 5 sản phẩm. Chỉ hiển thị tên danh mục (category) và số lượng sản phẩm (product_count).
select category, count(product_id)
as product_count 
from productss
group by category
having count(product_id) > 5;

-- Kết hợp GROUP BY, ORDER BY và LIMIT:
-- Tìm ra 3 khách hàng có tổng chi tiêu cao nhất. Bảng kết quả cần hiển thị customer_id và total_spent, được sắp xếp giảm dần theo tổng chi tiêu.
select customer_id, sum(total_amount)
as total_spent 
from orderss
group by customer_id
order by sum(total_amount) desc
limit 3 

-- khá 5 
-- Tạo bảng Sales
CREATE TABLE Sales (
    transaction_id INT,
    transaction_date DATE,
    customer_id INT,
    total_amount DECIMAL(10, 2)
);

-- Chèn dữ liệu mẫu
INSERT INTO Sales (transaction_id, transaction_date, customer_id, total_amount) 
VALUES
(101, '2023-10-02', 21, 75000.00),
(102, '2023-10-02', 35, 120000.00),
(103, '2023-10-03', 42, 350000.00),
(104, '2023-10-05', 21, 55000.00),
(105, '2023-10-07', 50, 210000.00),
(106, '2023-10-10', 35, 85000.00),
(107, '2023-10-11', 61, 450000.00),
(108, '2023-10-15', 21, 150000.00),
(109, '2023-10-18', 73, 95000.00),
(110, '2023-10-20', 42, 25000.00),
(111, '2023-10-22', 50, 320000.00),
(112, '2023-10-25', 21, 110000.00),
(113, '2023-10-27', 88, 180000.00),
(114, '2023-10-29', 35, 65000.00),
(115, '2023-10-30', 91, 295000.00);

-- Tổng quan về Doanh thu
-- Tổng doanh thu trong tháng là bao nhiêu?
select sum(total_amount)
from sales;

-- Có tất cả bao nhiêu giao dịch đã được thực hiện?
select count(transaction_id)
from sales; 

-- Phân tích Giá trị Giao dịch
-- Giá trị hóa đơn trung bình của một giao dịch là bao nhiêu?
select avg(total_amount)
from sales;
-- Giá trị hóa đơn cao nhất và thấp nhất trong tháng là bao nhiêu?
select sum(total_amount) ,
min(total_amount)
from sales;

-- Phân tích Hoạt động Bán hàng
-- Ngày nào diễn ra giao dịch đầu tiên và cuối cùng của tháng? (Dựa trên cột transaction_date)
select max(transaction_date) as last_day, 
min(transaction_date) as firts_day
from sales 

-- giỏi 6 
-- Tạo bảng DangKyGoi

CREATE TABLE DangKyGoi (
    ma_dang_ky INT,
    ma_khach_hang INT,
    ten_goi VARCHAR(50), 
    phi_hang_thang DECIMAL(10, 2),
    ngay_bat_dau DATE
);

 
-- Chèn dữ liệu mẫu
INSERT INTO DangKyGoi (ma_dang_ky, ma_khach_hang, ten_goi, phi_hang_thang, ngay_bat_dau) 
VALUES
(1, 101, 'Cơ Bản', 99000.00, '2022-01-15'),
(2, 102, 'Cao Cấp', 259000.00, '2021-06-20'),
(3, 103, 'Tiêu Chuẩn', 179000.00, '2023-03-10'),
(4, 101, 'Tiêu Chuẩn', 179000.00, '2023-05-20'),
(5, 104, 'Cao Cấp', 259000.00, '2021-11-01'),
(6, 102, 'Tiêu Chuẩn', 179000.00, '2023-01-30'),
(7, 105, 'Cơ Bản', 99000.00, '2023-08-12'),
(8, 104, 'Cao Cấp', 259000.00, '2022-11-01'),
(9, 102, 'Cơ Bản', 99000.00, '2023-09-05'),
(10, 104, 'Tiêu Chuẩn', 179000.00, '2023-02-15'),
(11, 101, 'Cao Cấp', 259000.00, '2023-10-01');

-- Nhiệm vụ 1: Phân tích Tổng quan theo Gói Dịch vụ.
-- Viết một truy vấn SQL để thống kê hiệu suất của từng gói dịch vụ (ten_goi). Báo cáo cần hiển thị:
-- Tên gói dịch vụ.
-- Tổng số lượt đăng ký cho mỗi gói (AS so_luot_dang_ky).
-- Tổng doanh thu từ mỗi gói (AS tong_doanh_thu).
select ten_goi,
count(ma_dang_ky) as so_luong_dang_ky,
count(ma_dang_ky)*sum(phi_hang_thang) as tong_doanh_thu
from Dangkygoi 
group by ten_goi;

-- Nhiệm vụ 2: Xây dựng Hồ sơ Khách hàng "VIP".
-- Viết một truy vấn SQL khác để tạo hồ sơ chi tiêu cho từng khách hàng (ma_khach_hang). Báo cáo này phải nhóm theo ma_khach_hang và hiển thị:
-- Mã khách hàng.
-- Tổng số tiền họ đã chi trả (AS tong_chi_tieu).
-- Tổng số gói dịch vụ họ đã đăng ký (AS so_goi_da_mua).
-- Ngày đầu tiên họ đăng ký dịch vụ (dấu hiệu của sự trung thành) (AS ngay_tham_gia_dau_tien).
select ma_khach_hang,
sum(phi_hang_thang) as tong_chi_tieu,
count(ma_dang_ky) as so_goi_da_mua,
min(ngay_bat_dau) as ngay_tham_gia_dau_tien
from Dangkygoi
group by ma_khach_hang 

-- giỏi 7 
-- Tạo bảng ChiTietDonHang
CREATE TABLE ChiTietDonHang (
    ma_chi_tiet INT,
    ma_don_hang INT,
    ten_san_pham VARCHAR(100),
    so_luong INT,
    don_gia DECIMAL(10, 2),
    thanh_tien DECIMAL(10, 2)
);

-- Chèn dữ liệu mẫu
INSERT INTO ChiTietDonHang (ma_chi_tiet, ma_don_hang, ten_san_pham, so_luong, don_gia, thanh_tien) VALUES
(1, 1001, 'Cà Phê Sữa', 2, 29000.00, 58000.00),
(2, 1001, 'Bạc Xỉu', 1, 35000.00, 35000.00),
(3, 1002, 'Trà Đào Cam Sả', 1, 45000.00, 45000.00),
(4, 1003, 'Cà Phê Sữa', 1, 29000.00, 29000.00),
(5, 1004, 'Trà Sữa Trân Châu Đường Đen', 2, 55000.00, 110000.00),
(6, 1005, 'Bạc Xỉu', 1, 35000.00, 35000.00),
(7, 1006, 'Cà Phê Sữa', 3, 29000.00, 87000.00),
(8, 1006, 'Trà Chanh Gừng Mật Ong', 1, 42000.00, 42000.00),
(9, 1007, 'Trà Đào Cam Sả', 2, 45000.00, 90000.00),
(10, 1008, 'Trà Sữa Trân Châu Đường Đen', 1, 55000.00, 55000.00),
(11, 1009, 'Cà Phê Sữa', 1, 29000.00, 29000.00),
(12, 1010, 'Trà Chanh Gừng Mật Ong', 1, 42000.00, 42000.00);

-- Nhiệm vụ 1: Xây dựng Báo cáo Hiệu suất Sản phẩm.
-- Tên sản phẩm.
-- Tổng số ly đã bán (AS tong_so_ly_ban).
-- Tổng doanh thu của sản phẩm đó (AS tong_doanh_thu).
-- Số đơn hàng có chứa sản phẩm này (cho biết mức độ phổ biến) (AS so_don_hang_chua_sp)
select ten_san_pham,
sum(so_luong) as tong_so_ly_ban,
sum(thanh_tien) as tong_doanh_thu,
count(distinct ma_don_hang) as so_don_hang_chua_sp 
from chitietdonhang 
group by ten_san_pham;

-- Nhiệm vụ 2: Phân tích và Đề xuất Chiến lược.
-- Dựa trên báo cáo bạn vừa tạo ở Nhiệm vụ 1, hãy trả lời các câu hỏi sau bên dưới câu lệnh SQL của bạn, sử dụng khối comment nhiều dòng (/* ... */):

-- Phân loại sản phẩm:
-- Xác định 2 sản phẩm "ngôi sao" (có hiệu suất tốt nhất).
-- Xác định 2 sản phẩm "cần xem xét" (có hiệu suất thấp nhất).
-- Lập luận: Giải thích lý do tại sao bạn lại phân loại chúng như vậy. Hãy xem xét cả hai yếu tố: tổng doanh thu và mức độ phổ biến (số đơn hàng).
-- Đề xuất chiến lược:
-- Đối với một sản phẩm "ngôi sao", hãy đề xuất một chương trình khuyến mãi để thúc đẩy doanh số hơn nữa.
-- Đối với một sản phẩm "cần xem xét", hãy đề xuất một hành động cụ thể (Ví dụ: thay đổi công thức, giảm giá dùng thử, hoặc loại bỏ khỏi thực đơn).
/* 
- 2 sản phẩm 'ngôi sao' là cà phê sữa và trà sữa trân châu đường đen.
- 2 sản phẩm 'cần xem xét' là bạc xỉu và trà chanh gừng mật ong.
- Với nhóm 'ngôi sao', cà phê sữa có doanh thu cao nhất và số đơn hàng chứa sản phẩm cũng cao nhất,
ở vị trí thứ 2 về doanh thu là trà sữa trân châu đường đen với số đơn hàng có sản phẩm ở mức trung bình(2).
Với nhóm 'cần xem xét', bạc xỉu có doanh thu thấp nhất và số lượng hàng chứa sản phẩm ở mức trung bình(2)
còn trà chanh gừng mật ong có doanh thu chỉ hơn bạc xỉu và số luọng hàng chứa sản phẩm cũng ở mức trung bình.

1. Đối với sản phẩm "Ngôi sao" (Cà Phê Sữa):
   - Chương trình khuyến mãi: "Mua Cà Phê Sữa, Thêm Bánh Giảm 50%".
   - Mục tiêu: Tận dụng mức độ phổ biến cao của Cà Phê Sữa để thúc đẩy doanh số bán kèm (up-sell) cho các mặt hàng khác 
   (ví dụ: bánh ngọt, snack) và tăng giá trị đơn hàng trung bình.

2. Đối với sản phẩm "Cần xem xét" (Bạc Xỉu):
   - Hành động cụ thể: Giảm giá dùng thử hoặc Thử nghiệm A/B với Công thức mới.
   - Lý do: Bạc Xỉu có doanh thu thấp nhất (70,000.00). Nên giới thiệu "Tuần lễ Khám phá Bạc Xỉu"
   với mức giảm 20% hoặc quảng cáo một "Phiên bản Bạc Xỉu Đặc Biệt" (Ví dụ: thêm kem muối biển) để thu hút khách hàng thử lại 
   và cải thiện nhận thức về sản phẩm này. Nếu doanh số vẫn không tăng sau 1 tháng, nên cân nhắc loại bỏ.
*/

-- btth 
-- COUNT: Có bao nhiêu đơn hàng trong bảng Orders?
select count(order_id)
from orders; 
-- SUM: Tổng số lượng sản phẩm đã bán là bao nhiêu?
select sum(quantity)
from orders; 
-- AVG: Giá trung bình của các sản phẩm là bao nhiêu?
select avg(price)
from orders;
-- MIN: Tìm giá thấp nhất của sản phẩm.
 select min(price)
 from orders;
-- MAX: Tìm giá cao nhất của sản phẩm.
 select max(price)
 from orders;
-- COUNT + GROUP BY: Đếm số đơn hàng theo từng quốc gia (country).
 select country, count(order_id)
 from orders
 group by country;
-- AVG + GROUP BY: Tính giá trung bình của sản phẩm theo từng quốc gia.
select country, avg(price)
from orders
group by country 


