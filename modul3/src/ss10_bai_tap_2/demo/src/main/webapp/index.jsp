<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<form action="/calculator-servlet" method="post">
    <table>
        <tr>
            <td>First operand :</td>
            <td><input type="text" name="firstNumber"></td>
        </tr>
        <tr>
            <td>Operator :</td>
            <td>
                <select name="Calculations">
                    <option value="+">Add</option>
                    <option value="-">Sub</option>
                    <option value="*">Mul</option>
                    <option value="/">Div</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>Second operand:</td>
            <td><input name="secondNumber" type="text"/></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Calculate"/></td>
        </tr>
    </table>
</form>

</body>
</html>