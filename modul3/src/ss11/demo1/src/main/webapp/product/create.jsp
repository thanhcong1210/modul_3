<%--
  Created by IntelliJ IDEA.
  User: dangl
  Date: 8/29/2024
  Time: 10:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="/product">Trang Chủ</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
                aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        </div>
    </div>
</nav>

<div class="container ">
    <div class="w-25 mx-auto shadow-sm p-3 mt-5 rounded">
        <h4 class="text-center mb-3">Thêm mới </h4>
        <form method="post">
            <div class="mb-3">
                <label for="name" class="form-label">Tên sản phẩm</label>
                <input type="text" class="form-control form-control-sm" id="name" name="name" required maxlength="100"
                       minlength="5">
            </div>
            <div class="mb-3">
                <label class="form-label" for="price">Giá</label>
                <input type="number" class="form-control form-control-sm" id="price" name="price" min="0" max="1000000">
            </div>
            <div class="mb-3">
                <label for="description" class="form-label">Mô tả sản phẩm</label>
                <input type="text" class="form-control form-control-sm" id="description" name="description" required>
            </div>
            <div class="mb-3">
                <label for="producer" class="form-label">Nhà sản xuất</label>
                <input type="text" class="form-control form-control-sm" id="producer" name="producer" required>
            </div>
            <div class="text-end">
                <a href="/product" class="btn btn-sm btn-secondary ">Trở lại</a>
                <button type="submit" class="btn btn-sm btn-primary">Xác nhận</button>
            </div>
        </form>
    </div>

</div>

</body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>

</html>
