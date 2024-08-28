package org.example.demo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DiscountAmount", value = "/discount-amount")
public class DiscountAmount extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String description = req.getParameter("description");
        double price = Double.parseDouble(req.getParameter("price"));
        double discountPercentage = Double.parseDouble(req.getParameter("discountPercentage"));
        double discountAmount = price * (discountPercentage / 100);
        req.setAttribute("description", description);
        req.setAttribute("price", price);
        req.setAttribute("discountPercentage", discountPercentage);
        req.setAttribute("discountAmount", discountAmount);
        req.getRequestDispatcher("discount-result.jsp").forward(req, resp);
    }
}
