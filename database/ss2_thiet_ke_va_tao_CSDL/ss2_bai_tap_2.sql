create database ss2_quan_ly_ban_hang;
CREATE TABLE Customer (
    cID INT PRIMARY KEY AUTO_INCREMENT,
    cName VARCHAR(50),
    cAge INT
);

CREATE TABLE `Order` (
    oID INT PRIMARY KEY AUTO_INCREMENT,
    oDate DATETIME,
    oTotalPrice INT,
    cID INT,
    FOREIGN KEY (cID)
        REFERENCES Customer (cID)
);

CREATE TABLE Product (
    pID INT PRIMARY KEY AUTO_INCREMENT,
    pName VARCHAR(30),
    pPrice INT
);

CREATE TABLE OrderDetail (
    odQTY INT,
    pID INT,
    oID INT,
    PRIMARY KEY (oID , pID),
    FOREIGN KEY (pID)
        REFERENCES Product (pID),
    FOREIGN KEY (oID)
        REFERENCES `Order` (oID)
)