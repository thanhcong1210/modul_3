package org.example.demo.service;

import org.example.demo.model.Customer;
import org.example.demo.repository.CustomerRepository;

import java.util.List;

public class CustomerService {
    private CustomerRepository customerRepository = new CustomerRepository();

    public List<Customer> getAllCustomers() {
        return customerRepository.findAll();
    }
}
