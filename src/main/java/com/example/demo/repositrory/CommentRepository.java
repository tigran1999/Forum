package com.example.demo.repositrory;

import com.example.demo.model.Comment;

import com.example.demo.model.Post;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CommentRepository extends JpaRepository<Comment,Integer> {


    List<Comment> findAllByPost(Post post);

}
