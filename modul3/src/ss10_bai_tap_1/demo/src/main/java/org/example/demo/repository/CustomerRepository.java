package org.example.demo.repository;

import org.example.demo.model.Customer;

import java.util.ArrayList;
import java.util.List;

public class CustomerRepository {
    private List<Customer> customers = new ArrayList<>();

    public CustomerRepository(){
        customers.add(new Customer("Thanh Cong", "1996-08-10", "295 Nguyen Tat Thanh"));
        customers.add(new Customer("Trung Hieu", "1990-08-10", "295 Nguyen Tat Thanh"));
        customers.add(new Customer("Van Vy", "2000-08-10", "295 Nguyen Tat Thanh"));
    }

    public List<Customer> findAll(){
        return customers;
    }
}
