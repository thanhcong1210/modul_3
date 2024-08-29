<%--
  Created by IntelliJ IDEA.
  User: dangl
  Date: 8/29/2024
  Time: 10:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>

<div class="container">
    <form class="w-50 mx-auto mt-5" action="/product" method="post">
        <input type="hidden" name="action" value="update">
        <h1 class="text-center my-5">Chỉnh Sửa Sản Phẩm</h1>
        <div class="mb-3">
            <label for="id" class="form-label">ID sản phẩm</label>
            <input type="text" class="form-control" id="id" name="id" value="${product.id}" readonly>
        </div>
        <div class="mb-3">
            <label for="name" class="form-label">Tên Sản Phẩm</label>
            <input type="text" class="form-control" id="name" name="name" value="${product.name}" required>
        </div>
        <div class="mb-3">
            <label for="price" class="form-label">Giá Sản Phẩm</label>
            <input type="text" class="form-control" id="price" name="price" value="${product.price}" required>
        </div>
        <div class="mb-3">
            <label for="description" class="form-label">Mô Tả Sản Phẩm</label>
            <input type="text" class="form-control" id="description" name="description" value="${product.description}"
                   required>
        </div>
        <div class="mb-3">
            <label for="producer" class="form-label">Nhà Sản Xuất</label>
            <input type="text" class="form-control" id="producer" name="producer" value="${product.producer}" required>
        </div>
        <button type="submit" class="btn btn-primary">Xác Nhận</button>
    </form>
</div>

</body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>

</html>
