package org.example.demo.service.impl;

import org.example.demo.model.User;
import org.example.demo.service.IUserService;

import java.util.Collections;
import java.util.List;

public class UserService implements IUserService {
    @Override
    public void addUser(User user) {

    }

    @Override
    public User getUserById(int id) {
        return null;
    }

    @Override
    public List<User> getAllUsers() {
        return Collections.emptyList();
    }

    @Override
    public boolean removeUser(int id) {
        return false;
    }

    @Override
    public boolean modifyUser(User user) {
        return false;
    }
}
