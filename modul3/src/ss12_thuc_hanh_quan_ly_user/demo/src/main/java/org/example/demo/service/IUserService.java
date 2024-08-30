package org.example.demo.service;

import org.example.demo.model.User;

import java.util.List;

public interface IUserService {
    void addUser(User user);

    User getUserById(int id);

    List<User> getAllUsers();

    boolean removeUser(int id);

    boolean modifyUser(User user);
}
