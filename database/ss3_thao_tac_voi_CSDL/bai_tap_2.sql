create database ss3_bai_tap_2;
use ss3_bai_tap_2;

CREATE TABLE Customer (
    cId INT PRIMARY KEY,
    cName VARCHAR(20),
    cAge TINYINT
);

CREATE TABLE oDer (
    oId INT PRIMARY KEY,
    cId INT,
    FOREIGN KEY (cId)
        REFERENCES Customer (cId),
    oDate DATETIME,
    oTotalPrice INT
);

CREATE TABLE Product (
    pId INT PRIMARY KEY,
    pName VARCHAR(25),
    pPrice INT
);

CREATE TABLE oDer_detail (
    oId INT,
    pId INT,
    odQTY INT,
    PRIMARY KEY (pId , oId),
    FOREIGN KEY (pId)
        REFERENCES Product (pId),
    FOREIGN KEY (oId)
        REFERENCES oDer (oId)
);

insert into Customer(cID,cName,cAge) values
(1,'Minh Quan',10),
(2,'Ngoc Oanh',20),
(3,'Hong Ha',50);

insert into oDer(oID,cID,oDate) values
(1,1,'2006-03-21'),
(2,2,'2006-03-23'),
(3,1,'2006-03-16');

insert into Product(pId,pName,pPrice) values
(1,'May Giat',3),
(2,'Tu Lanh',5),
(3,'Dieu Hoa',7),
(4,'Quat',1),
(5,'Bep Dien',2);

insert into oDer_detail(oId,pId,odQTY) values
(1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);

SELECT 
    *
FROM
    oDer;
-- hiển thị danh sách khách hàng mua sản phẩm
SELECT 
    customer.cId, Customer.cName, Product.pName
FROM
    customer
        INNER JOIN
    oDer ON Customer.cID = oDer.cID
        INNER JOIN
    oDer_detail ON oDer.oID = oDer_detail.oID
        INNER JOIN
    Product ON oDer_detail.pID = Product.pID
ORDER BY Customer.cIdển thị danh sách khách hàng không mua sản phẩm nào
    
select 
Customer.cName
From customer
LEFT JOIN 
oDer on Customer.cID = oDer.cID
LEFT JOIN 
oDer_detail on oDer.oID = oDer_detail.oID
LEFT JOIN 
Product on oDer_detail.pID = Product.pID
WHERE oDer.oId IS NULL;

select 
oDer.oID,
oDer.oDate,
SUM(odQTY*pPrice) as totalPrice
from oDer
INNER JOIN 
oder_detail ON oDer.oID = oder_detail.oId
INNER JOIN 
Product on oder_detail.pId = product.pID
GROUP BY 
oDer.oID,oDer.oDate;
    