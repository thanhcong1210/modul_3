package org.example.demo1.service;

import org.example.demo1.model.Product;
import org.example.demo1.repository.IProductRepository;
import org.example.demo1.repository.ImplProductRepository;

import java.util.Collections;
import java.util.List;

public class ImplProductService implements IProductService{
    private static IProductRepository repository = new ImplProductRepository();

    @Override
    public List<Product> findAll() {
        return repository.findAll();
    }

    @Override
    public void save(Product product) {
        repository.save(product);
    }

    @Override
    public List<Product> searchByName(String name) {
        return repository.searchByName(name);
    }

    @Override
    public boolean updateProduct(int id, String nameProduct, int price, String description, String producer) {
        return repository.update(id, nameProduct, price, description, producer);
    }

    @Override
    public Boolean remove(int id) {
        return repository.remove(id);
    }

    @Override
    public Product findById(int id) {
        return repository.findById(id);
    }
}
