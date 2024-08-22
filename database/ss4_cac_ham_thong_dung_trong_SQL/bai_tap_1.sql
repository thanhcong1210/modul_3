create database ss4_bai_tap;
use ss4_bai_tap;
use ss3_bai_tap_1;
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần


SELECT 
    *
FROM
    sub
WHERE
    credit = (SELECT 
            MAX(credit)
        FROM
            sub);

SELECT 
    SubName, MAX(Mark)
FROM
    sub
        JOIN
    mark ON mark.SubId = sub.SubId
GROUP BY SubName
HAVING MAX(Mark) in (SELECT 
        MAX(Mark)
    FROM
        Mark);

SELECT 
    StudentName, AVG(MarK) as avg_mark
FROM
    student
        JOIN
    mark ON mark.StudentId = student.StudentId
GROUP BY StudentName
ORDER BY avg_mark;

SELECT 
    student.StudentId,
    student.StudentName,
    AVG(mark.MarK) AS average_mark
FROM
    student
        JOIN
    mark ON mark.StudentId = student.StudentId
GROUP BY student.StudentId , student.StudentName
ORDER BY AVG(mark.MarK) DESC;