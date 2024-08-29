package org.example.demo1.service;

import org.example.demo1.model.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll();
    void save(Product product);
    List<Product> searchByName(String name);
    boolean updateProduct(int id, String nameProduct, int price, String description, String producer);
    Boolean remove(int id);
    Product findById(int id);
}
