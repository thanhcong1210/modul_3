create database demo;
use demo;

CREATE TABLE jame_account (
    user_name VARCHAR(50) PRIMARY KEY,
    password VARCHAR(50)
);

CREATE TABLE class (
    class_id INT PRIMARY KEY AUTO_INCREMENT,
    class_name VARCHAR(50)
);

CREATE TABLE student (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(50),
    student_birthday DATE,
    student_gender BIT,
    student_email VARCHAR(50),
    student_point DOUBLE,
    user_name VARCHAR(50),
    class_id INT,
    FOREIGN KEY (user_name)
        REFERENCES jame_account (user_name),
    FOREIGN KEY (class_id)
        REFERENCES class (class_id)
);

CREATE TABLE instructor (
    instructor_id INT PRIMARY KEY AUTO_INCREMENT,
    instructor_name VARCHAR(50),
    instructor_birthday DATE,
    instructor_salary DOUBLE
);

CREATE TABLE instructor_class (
    class_id INT,
    instructor_id INT,
    PRIMARY KEY (class_id , instructor_id),
    FOREIGN KEY (class_id)
        REFERENCES class (class_id),
    FOREIGN KEY (instructor_id)
        REFERENCES instructor (instructor_id)
);

insert into class (class_name) values ('c1121g1'), ('c1221g1'),('a0821i1'),('a0921i1');

insert into jame_account(user_name,password)
 values('cunn','12345'),('chunglh','12345'),('hoanhh','12345'),('dungd','12345'),('huynhtd','12345'),
 ('hainm','12345'),('namtv','12345'),('hieuvm','12345'),('kynx','12345'),('vulm','12345'),('anv','12345'),('bnv','12345');


insert into instructor(instructor_name,instructor_birthday, instructor_salary)
 values('tran van chanh','1985-02-03',100),('dang chi trung','1985-02-03',200),('nguyen vu thanh tien','1985-02-03',300);

 
 insert into student(student_name,student_birthday, student_gender,student_point, class_id,user_name) 
 values ('nguyen ngoc cu','1981-12-12',1,8,1,'cunn'),('le hai chung','1981-12-12',1,5,1,'chunglh'),
 ('hoang huu hoan','1990-12-12',1,6,2,'hoanhh'),('dau dung','1987-12-12',1,8,1,'dungd'),
 ('ta dinh huynh','1981-12-12',1,7,2,'huynhtd'),('nguyen minh hai','1987-12-12',1,9,1,'hainm'),
 ('tran van nam','1989-12-12',1,4,2,'namtv'),('vo minh hieu','1981-12-12',1,3,1,'hieuvm'),
 ('le xuan ky','1981-12-12',1,7,2,'kynx'),('le minh vu','1981-12-12',1,7,1,'vulm'),
 ('nguyen van a','1981-12-12',1,8,null,'anv'),('tran van b','1981-12-12',1,5,null,'bnv');

 insert into instructor_class(class_id,instructor_id) values (1,1),(1,2),(2,1),(2,2),(3,1),(3,2);
 
 -- 1. Lấy ra thông tin các học viên, 
SELECT 
    s.student_name, c.class_name
FROM
    student s
        JOIN
    class c ON class_id = class_id ;
-- cho biết các học viên đang theo học lớp nào và cả các bạn đã đăng ký nhưng chưa có lớp học.
 -- xác định loại join cần sử dụng : học viên left join lớp 
 
 -- 2.1 lấy ra thông tin giảng viên và cho biết giảng viên đó đang dạy lớp nào
SELECT 
    i.instructor_name, c.class_name
FROM
    instructor i
        JOIN
    instructor_class IC ON i.instructor_id = IC.instructor_id
        JOIN
    class c ON IC.class_id = c.class_id; 

 -- 3. Lấy thông tin của các học viên tên “Hai” và 'Huynh’
select *
from student
where student_name like "% hai" or student_name like "% huynh";
    
 -- 4. Lấy ra học viên có điểm lớn hơn 5 .
 select student_name
 from student
 where student_point > 5;
 
 -- 5. Lấy ra học viên có họ là “nguyen”
 select *
 from student
 where student_name like "%nguyen";
 
 -- 6. Thông kế số lượng học sinh theo từng loại điểm.
 SELECT 
    student_point, 
    COUNT(*) AS number_of_students 
FROM 
    student 
GROUP BY 
    student_point;
    
 -- 7. Thông kế số lượng học sinh theo điểm và điểm phải lớn hơn 5
 SELECT 
    student_point, 
    COUNT(*) AS number_of_students 
FROM 
    student 
WHERE 
    student_point > 5
GROUP BY 
    student_point;
    
 -- 8. Thông kế số lượng học sinh theo điểm lớn hơn 5 và chỉ hiện thị với số lượng >= 2
 SELECT 
    student_point, 
    COUNT(*) AS number_of_students 
FROM 
    student 
WHERE 
    student_point > 5
GROUP BY 
    student_point
HAVING 
    COUNT(*) >= 2;
    
 -- 9. Lấy ra danh sách học viên của lớp c1121g1 và sắp xếp tên học viên theo alphabet.
 SELECT 
    s.student_name AS 'tên học viên',
    c.class_name AS 'tên lớp'
FROM
    student s
        JOIN
    class c ON s.class_id = c.class_id 
    where c.class_name = 'c1121g1'
    order by substring_index(s.student_name, " ", -1);