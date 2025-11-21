USE TRAINING_MANAGEMENT;
CREATE TABLE COURSE ( 
COURSE_ID VARCHAR(10) PRIMARY KEY,
COURSE_NAME VARCHAR(100),
CATEGORY VARCHAR(100),
START_DATE DATE,
END_DATE DATE,
FEE DECIMAL
);
CREATE TABLE STUDENT (
STUDENT_ID VARCHAR(10) PRIMARY KEY,
STUDENT_FULL_NAME VARCHAR(150) NOT NULL,
STUDENT_EMAIL VARCHAR(255) UNIQUE NOT NULL,
STUDENT_PHONE VARCHAR(15) UNIQUE NOT NULL,
STUDENT_DOB DATE,
GENDER ENUM ('Male', 'Female', 'Other')
);
CREATE TABLE ENROLLMENT (
ENROLLMENT_ID INT PRIMARY KEY AUTO_INCREMENT,
STUDENT_ID  VARCHAR(10) NOT NULL,
COURSE_ID VARCHAR(10) NOT NULL,
ENROLL_DATE DATE,
ENROLLMENT_STATUS ENUM ('Confirmed', 'Cancelled', 'Pending'),
SLOT_COUNT INTEGER NOT NULL DEFAULT(1),
FOREIGN KEY (STUDENT_ID) REFERENCES STUDENT(STUDENT_ID),
FOREIGN KEY (COURSE_ID) REFERENCES COURSE(COURSE_ID)
);
CREATE TABLE PAYMENT (
PAYMENT_ID INT PRIMARY KEY AUTO_INCREMENT,
ENROLLMENT_ID INT NOT NULL,
PAYMENT_METHOD ENUM ('Credit Card', 'Bank Transfer', 'Cash'),
PAYMENT_AMOUNT DECIMAL,
PAYMENT_DATE DATE,
PAYMENT_STATUS ENUM('Success', 'Failed', 'Pending'),
FOREIGN KEY (ENROLLMENT_ID) REFERENCES ENROLLMENT(ENROLLMENT_ID)
);
INSERT INTO COURSE 
VALUES 
('C001','Lập trình cơ bản','Lập trình','2025-05-01','2025-06-01',1500000),
('C002','Quản trị cơ sở dữ liệu MySQL','Cơ sở dữ liệu','2025-06-15','2025-07-15',2000000),
('C003','Thiết kế đồ họa','Thiết kế','2025-07-01','2025-08-01',1800000),
('C004','Digital Marketing','Marketing','2025-08-10','2025-09-10',1700000),
('C005','Kỹ năng giao tiếp','Kỹ năng mềm','2025-09-01','2025-09-20',1200000);
INSERT INTO STUDENT 
VALUES
('S001','Nguyễn Văn An','a.nguyen@gmail.com','0987000001','1999-03-15','Male'),
('S002','Nguyễn Văn B','b.nguyen@gmail.com','0987000002','2003-07-22','Female'),
('S003','Vũ Ngọc Linh','ngoc.linh@gmail.com','0987000003','1995-12-05','Female'),
('S004','Vũ Thị C','c.vu@gmail.com','0987000004','2001-01-30','Male'),
('S005','Vũ Văn D','d.vu@gmail.com','0987000005','1998-11-29','Female');
INSERT INTO ENROLLMENT(student_id, course_id, enroll_date, enrollment_status, slot_count)
VALUES
('S001','C001','2025-04-20','Confirmed',1),
('S002','C002','2025-06-16','Pending',2),
('S003','C002','2025-06-20','Cancelled',1),
('S004','C003','2025-07-05','Confirmed',3),
('S005','C004','2025-08-12','Confirmed',2),
('S005','C005','2025-09-02','Pending',1);
INSERT INTO payment (enrollment_id, payment_method, payment_amount, payment_date, payment_status) 
VALUES
(7,'Cash',150000000,'2025-04-21','Pending'),
(9,'Cash',5000000,'2025-06-17','Pending'),
(10,'Cash',1000,'2025-06-21','Pending'),
(8,'Credit Card',5400000,'2025-07-06','Pending'),
(9,'Credit Card',1700000,'2025-08-13','Success');

-- 3 
SET SQL_SAFE_UPDATES = 0;
UPDATE payment
SET payment_status = 'Success'
WHERE payment_method = 'Credit Card'
  AND payment_amount > 0
  AND payment_date < CURRENT_DATE;
UPDATE payment
SET payment_status = 'Pending'
WHERE payment_method = 'Bank Transfer'
AND payment_amount < 100
AND payment_date < CURRENT_DATE;
  
-- 4 
DELETE FROM PAYMENT  
WHERE PAYMENT_STATUS = 'PENDING' 
AND PAYMENT_METHOD = 'CASH';

-- 5 
SELECT STUDENT_ID , STUDENT_FULL_NAME, STUDENT_EMAIL, STUDENT_DOB, GENDER
FROM STUDENT 
ORDER BY STUDENT_FULL_NAME ASC
LIMIT 5;
-- Lấy thông tin các khóa học gồm mã, tên, danh mục, sắp xếp theo học phí giảm dần.
SELECT COURSE_ID, COURSE_NAME, CATEGORY, FEE
FROM COURSE 
ORDER BY FEE DESC;
-- Lấy thông tin các học viên gồm mã học viên, tên học viên, khoá học đã đăng ký và trạng thái Enrollment là "Cancelled"
SELECT E.STUDENT_ID , S.STUDENT_FULL_NAME , E.COURSE_ID, E.ENROLLMENT_STATUS 
FROM ENROLLMENT E
JOIN STUDENT S ON E.STUDENT_ID = S.STUDENT_ID 
WHERE E.ENROLLMENT_STATUS = 'CANCELLED';
-- Lấy danh sách các khoá học gồm mã khoá học, mã học viên, khoá học đã đặt, và số lượng slot_count cho các khoá học có trạng thái "Confirmed", sắp xếp theo số lượng slot_count giảm dần  
SELECT E.COURSE_ID , E.STUDENT_ID, C.COURSE_NAME, E.SLOT_COUNT 
FROM ENROLLMENT E 
JOIN COURSE C ON E.COURSE_ID = C.COURSE_ID 
WHERE E.ENROLLMENT_STATUS = 'CONFIRM'
ORDER BY E.SLOT_COUNT DESC;
-- Lấy danh sách các học viên gồm mã khoá học, tên học viên, khoá học đã đăng ký, và số lượng slot_count cho các học viên có số lượng slot_count trong khoảng từ 2 đến 3, sắp xếp theo tên học viên
SELECT E.COURSE_ID , S.STUDENT_FULL_NAME, C.COURSE_NAME, E.SLOT_COUNT 
FROM ENROLLMENT E 
JOIN STUDENT S ON E.STUDENT_ID = S.STUDENT_ID 
JOIN COURSE C ON E.COURSE_ID = C.COURSE_ID
WHERE E.SLOT_COUNT BETWEEN 2 AND 3
ORDER BY S.STUDENT_FULL_NAME ASC; 
-- Lấy danh sách các học viên có ít nhất 2 slot và thanh toán ở trạng thái 'Pending'. 
SELECT DISTINCT S.STUDENT_ID, S.STUDENT_FULL_NAME, E.SLOT_COUNT, P.PAYMENT_STATUS
FROM ENROLLMENT E 
JOIN STUDENT S ON E.STUDENT_ID = S.STUDENT_ID 
JOIN PAYMENT P ON E.ENROLLMENT_ID = P.ENROLLMENT_ID 
WHERE E.SLOT_COUNT >=2 
AND P.PAYMENT_STATUS = 'PENDING';
-- Lấy danh sách các học viên và số tiền đã thanh toán với trạng thái 'Success'.  
SELECT s.student_id, s.student_full_name, SUM(p.payment_amount) as total_paid
FROM student s
JOIN enrollment e ON s.student_id = e.student_id
JOIN payment p ON e.enrollment_id = p.enrollment_id
WHERE p.payment_status = 'Success'
GROUP BY s.student_id, s.student_full_name;
-- Lấy danh sách 5 học viên đầu tiên có số lượng slot_count lớn hơn 1, sắp xếp theo số lượng slot_count giảm dần, gồm mã học viên, tên học viên, số lượng slot_count và trạng thái enrollment 
SELECT s.student_id, s.student_full_name, e.slot_count, e.enrollment_status
FROM student s
JOIN enrollment e ON s.student_id = e.student_id
WHERE e.slot_count > 1
ORDER BY e.slot_count DESC;
-- Lấy thông tin khoá học có số lượng đăng ký nhiều nhất 
SELECT c.course_id, c.course_name, COUNT(e.enrollment_id) as enrollment_count
FROM course c
JOIN enrollment e ON c.course_id = e.course_id
WHERE e.enrollment_status = 'Confirmed'
GROUP BY c.course_id, c.course_name
ORDER BY enrollment_count DESC
LIMIT 1;
-- Lấy danh sách các học viên có ngày sinh trước năm 2000 và đã thanh toán thành công.
SELECT DISTINCT s.student_id, s.student_full_name, s.student_dob, p.payment_status
FROM student s
JOIN enrollment e ON s.student_id = e.student_id
JOIN payment p ON e.enrollment_id = p.enrollment_id
WHERE YEAR(s.student_dob) < 2000 
AND p.payment_status = 'Success';