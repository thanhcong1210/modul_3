package org.example.demo.repository.impl;

import org.example.demo.model.User;
import org.example.demo.repository.IUserRepository;

import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

public class UserRepository implements IUserRepository {
    @Override
    public void insertUser(User user) throws SQLException {

    }

    @Override
    public User selectUser(int id) {
        return null;
    }

    @Override
    public List<User> selectAllUsers() {
        return Collections.emptyList();
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return false;
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return false;
    }
}
