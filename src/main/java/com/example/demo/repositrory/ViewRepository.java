package com.example.demo.repositrory;

import com.example.demo.model.Category;
import com.example.demo.model.Post;
import com.example.demo.model.PostView;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ViewRepository extends JpaRepository<PostView,Integer> {

   public List<PostView> findAllByPost(Post post);
}
