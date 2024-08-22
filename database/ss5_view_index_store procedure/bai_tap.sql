SELECT * FROM ss5_bai_tap.products;

CREATE UNIQUE INDEX idx_productCode ON Products(productCode);
CREATE INDEX idx_productName_price ON Products(productName, productPrice);
EXPLAIN SELECT * FROM Products WHERE productName = 'Product 1' AND productPrice = 100.00;

-- tạo view lấy về các thông tin
CREATE VIEW ProductView AS
SELECT productCode, productName, productPrice, productStatus
FROM Products;

-- sửa đổi
ALTER VIEW ProductView AS
SELECT productCode, productName, productPrice, productStatus, productAmount
FROM Products;

-- xóa
DROP VIEW ProductView;

-- tạo và lấy tất cả thông tin sản phẩm trong bảng product
DELIMITER //
CREATE PROCEDURE GetAllProducts()
BEGIN
    SELECT * FROM Products;
END //
DELIMITER ;

-- thêm một sản phẩm
DELIMITER //
CREATE PROCEDURE AddProduct(
    IN p_productCode VARCHAR(50),
    IN p_productName VARCHAR(100),
    IN p_productPrice DECIMAL(10,2),
    IN p_productAmount INT,
    IN p_productDescription TEXT,
    IN p_productStatus VARCHAR(50)
)
BEGIN
    INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
    VALUES (p_productCode, p_productName, p_productPrice, p_productAmount, p_productDescription, p_productStatus);
END //
DELIMITER ;

-- sửa thông tin sản phẩm theo id
DELIMITER //
CREATE PROCEDURE UpdateProduct(
    IN p_id INT,
    IN p_productCode VARCHAR(50),
    IN p_productName VARCHAR(100),
    IN p_productPrice DECIMAL(10,2),
    IN p_productAmount INT,
    IN p_productDescription TEXT,
    IN p_productStatus VARCHAR(50)
)
BEGIN
    UPDATE Products
    SET 
        productCode = p_productCode,
        productName = p_productName,
        productPrice = p_productPrice,
        productAmount = p_productAmount,
        productDescription = p_productDescription,
        productStatus = p_productStatus
    WHERE Id = p_id;
END //
DELIMITER ;

-- xóa sản phẩm theo id
DELIMITER //
CREATE PROCEDURE DeleteProduct(IN p_id INT)
BEGIN
    DELETE FROM Products WHERE Id = p_id;
END //
DELIMITER ;