package org.example.demo1.controller;

import org.example.demo1.model.Product;
import org.example.demo1.service.IProductService;
import org.example.demo1.service.ImplProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductController", value = "/product")
public class ProductController extends HttpServlet{

    private static IProductService productService = new ImplProductService();
    private static List<Product> products = new ArrayList<Product>();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action) {
            case "create" :
                request.getRequestDispatcher("/product/create.jsp").forward(request, response);
                break;
            case "update" :
                int id = Integer.parseInt(request.getParameter("id"));
                Product productEdit = productService.findById(id);
                request.setAttribute("product", productEdit);
                request.getRequestDispatcher("/product/update.jsp").forward(request, response);
                break;
            case "search":
                String srearchProduct = request.getParameter("searchProduct");
                List<Product> searchProducts = productService.searchByName(srearchProduct);
                if (searchProducts.isEmpty()) {
                    request.setAttribute("message", "Không tìm thấy sản phẩm");
                } else {
                    request.setAttribute("searchProducts", searchProducts);
                }
                request.getRequestDispatcher("/product/search.jsp").forward(request, response);
                break;
            default:
                List<Product> products = productService.findAll();
                request.setAttribute("products", products);
                request.getRequestDispatcher("/product/list.jsp").forward(request, response);
                break;
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                String nameProduct = request.getParameter("name");
                int price = Integer.parseInt(request.getParameter("price"));
                String description = request.getParameter("description");
                String producer = request.getParameter("producer");
                Product product = new Product(nameProduct, price, description, producer);
                productService.save(product);
                response.sendRedirect("/product");
                break;
            case "delete":;
                int id = Integer.parseInt(request.getParameter("id"));
                Boolean isDelete = productService.remove(id);
                if (isDelete) {
                    response.sendRedirect("/product");
                } else {
                    request.setAttribute("message", "Xóa không thành công");
                    products = productService.findAll();
                    request.setAttribute("products", products);
                    request.getRequestDispatcher("/product/list.jsp").forward(request, response);
                }
                break;
            case "update":
                int idUpdate = Integer.parseInt(request.getParameter("id"));
                String updatedName = request.getParameter("name");
                int updatedPrice = Integer.parseInt(request.getParameter("price"));
                String updatedDescription = request.getParameter("description");
                String updatedProducer = request.getParameter("producer");
                boolean isUpdated = productService.updateProduct(idUpdate, updatedName,updatedPrice, updatedDescription, updatedProducer);
                if (isUpdated) {
                    response.sendRedirect("/product");
                } else {
                    request.setAttribute("message", "Cập nhật không thành công!!!");
                    List<Product> products = productService.findAll();
                    request.setAttribute("products", products);
                    request.getRequestDispatcher("/product/list.jsp").forward(request, response);
                }
                break;
            default:
                break;
        }
    }
}
