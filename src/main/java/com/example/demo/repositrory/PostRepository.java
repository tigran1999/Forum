package com.example.demo.repositrory;

import com.example.demo.model.Category;
import com.example.demo.model.Comment;
import com.example.demo.model.Post;
import com.example.demo.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface PostRepository extends JpaRepository<Post,Integer> {

     List<Post> findAllByCategory(Category category);

    List<Post> findAllByUser(User user);
   @Query(value = " SELECT * FROM post ORDER BY id DESC LIMIT 4", nativeQuery = true)
    List<Post> findLast4Posts();


    List<Post> findAllByOrderByIdDesc();



}