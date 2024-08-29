package org.example.demo1.repository;

import org.example.demo1.model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> findAll();

    void save(Product product);

    Boolean remove(int id);

    boolean update(int id, String name, int price, String description, String producer);

    List<Product> searchByName(String name);

    Product findById(int id);
}
