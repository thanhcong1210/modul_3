<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>

<div class="form-container">
    <h2>Calculate Discount</h2>
    <form action="discount-amount" method="post">
        <div class="form-group">
            <label for="Description">Product Description</label>
            <input type="text" id="Description" name="description" required>
        </div>
        <div class="form-group">
            <label for="Price">List Price</label>
            <input type="text" id="Price" name="price" required>
        </div>
        <div class="form-group">
            <label for="Discount">Discount Percent</label>
            <input type="text" id="Discount" name="discountPercentage" required>
        </div>
        <div class="form-group">
            <input type="submit" value="Calculate Discount">
        </div>
    </form>
</div>

</body>
</html>