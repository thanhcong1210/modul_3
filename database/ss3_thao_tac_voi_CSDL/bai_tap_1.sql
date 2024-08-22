create database ss3_bai_tap_1;
use ss3_bai_tap_1;

CREATE TABLE Class (
    ClassId INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ClassName VARCHAR(40) NOT NULL,
    StartDate DATE NOT NULL,
    Staturs BIT
);

CREATE TABLE Student (
    StudentId INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    StudentName VARCHAR(40) NOT NULL,
    Address VARCHAR(30),
    Phone VARCHAR(40),
    Staturs BIT,
    ClassId INT NOT NULL,
    FOREIGN KEY (ClassId)
        REFERENCES Class (ClassId)
);

CREATE TABLE sub (
    SubId INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    SubName VARCHAR(40) NOT NULL,
    Staturs BIT,
    Credit TINYINT NOT NULL DEFAULT 1 CHECK (Credit >= 1)
);

CREATE TABLE Mark (
    MarkId INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Mark FLOAT DEFAULT 0 CHECK (mark BETWEEN 0 AND 100),
    ExamTimes TINYINT DEFAULT 1,
    UNIQUE (SubId , StudentId),
    subId INT NOT NULL,
    studentId INT NOT NULL,
    FOREIGN KEY (SubId)
        REFERENCES Sub (SubId),
    FOREIGN KEY (StudentId)
        REFERENCES Student (StudentId)
);

insert into Class(ClassID,ClassName,StartDate,Staturs) values
(1,'A1','2008-12-20',1),
(2,'A2','2008-12-22',1),
(3,'B3',current_date(),1);
insert into Student(StudentID,StudentName,Address,Phone,Staturs,ClassID) values
(1,'HUNG','Ha Noi','09012113113',1,1),
(2,'Hoa','Hai Phong',null,1,1),
(3,'Manh','HCM','0123123123',0,2);
insert into sub(SubID,SubName,Credit,Staturs)values
(1,'CF',5,1),
(2,'C',6,1),
(3,'HDJ',5,1),
(4,'RDBMS',10,1);
insert into Mark(MarkID,SubID,StudentID,Mark,ExamTimes) values
(1,1,1,8,1),
(2,1,2,10,2),
(3,2,1,12,1);
insert into Mark(MarkID,SubID,StudentID,Mark,ExamTimes) values
(4,1,3,7,2),
(5,2,2,5,2);

SELECT 
    *
FROM
    sub
WHERE
    Credit = (SELECT 
            MAX(Credit)
        FROM
            sub);

SELECT 
    *
FROM
    Mark
WHERE
    Mark = (SELECT 
            MAX(Mark)
        FROM
            Mark);

SELECT 
    s.StudentID,
    s.StudentName,
    s.Address,
    s.Phone,
    COALESCE(AVG(m.Mark), 0) AS AverageMark
FROM
    Student s
        LEFT JOIN
    Mark m ON s.StudentID = m.StudentID
GROUP BY s.StudentID , s.StudentName , s.Address , s.Phone
ORDER BY AverageMark DESC;

