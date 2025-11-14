create database HR_Management;
use HR_Management;
-- Tạo các bảng 
create table Department(
dept_i1 int primary key auto_increment,
dept_name varchar(225) not null unique
);
create table Employee(
emp_id int primary key auto_increment,
emp_fullname varchar(100) not null,
emp_email varchar(150) not null unique,
emp_hiredate date,
dept_id int,
foreign key(dept_id) references Department(dept_id)
);
-- thêm dữ liệu vào các bảng 
insert into department(dept_name)
values('Nhân sự'),
('Kế toán'),
('11');
Select * from department ;
--- thêm nhân viên thuộc phòng nhân sự , 1 nhân vật thuộc phòng kế toán
Insert into employee(emp_fullname,emp_email,emp_hire_date,dept_id)
values ('trần khánh an','khanhan@gmail.com','2026-06-20',1),
('Nguyễn quốc an', 'anqr@gmail.com','2024-06-04',3);
select * from employee;
-- hiển thị tất cả nhân viên thuộc phòng IT
select * 
from employee
where dept_id = 3;
-- cập nhật nhân viên Nguyễn quốc an sang phòng nhân sự 
set sql_safe_update=0; 
update employee
set dept_id = 2
where emp_fullname = 'Nguyễn quốc an';
-- xóa nhân viên trịnh mai hương
delete from employee 
where emp_fullname = ' trịnh mai hương ';
-- xóa phòng nhân sự khỏi hệ thống
delete from department
where dept_name = 'Nhân sự';
