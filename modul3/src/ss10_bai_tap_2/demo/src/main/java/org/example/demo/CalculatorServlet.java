package org.example.demo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name = "CalculatorServlet", urlPatterns = "/calculator-servlet")
public class CalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        float firstNumber = Integer.parseInt(req.getParameter("firstNumber"));
        float secondNumber = Integer.parseInt(req.getParameter("secondNumber"));
        char Calculations = req.getParameter("Calculations").charAt(0);
        float result = Calculator.calculator(firstNumber, secondNumber, Calculations);
        req.setAttribute("result", result);
        req.getRequestDispatcher("/result.jsp").forward(req, resp);
    }
}