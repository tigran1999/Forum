package com.example.demo.repositrory;

import com.example.demo.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


public interface UserRepository extends JpaRepository<User, Integer> {

    public User findOneByEmail(String email);

}
