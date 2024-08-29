<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <style>
        table {
            width: 50%;
            border-collapse: collapse;
            margin: 20px auto;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        a {
            display: block;
            width: 200px;
            text-align: center;
            margin: 20px auto;
            padding: 10px;
            text-decoration: none;
            border: 1px solid #ddd;
            background-color: #f2f2f2;
            color: black;
            border-radius: 5px;
            font-weight: bold;
        }

        a:hover {
            background-color: #ddd;
        }
    </style>
</head>
<body>
<h1 style="text-align: center;">Customer List</h1>
<table>
    <thead>
    <tr>
        <th>Name</th>
        <th>BirthDate</th>
        <th>Address</th>
    </tr>
    </thead>
    <tBody>
    <c:forEach var="customer" items="${customerList}">
        <tr>
            <td>${customer.name}</td>
            <td>${customer.birthDate}</td>
            <td>${customer.address}</td>
        </tr>
    </c:forEach>
    <a href="http://localhost:8080/customer">Hien thi danh sach</a>
    </tBody>
</table>
<%--<c:redirect url="/customer"/>--%>
</body>
</html>