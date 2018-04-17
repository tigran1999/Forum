package com.example.demo.controller;

import com.example.demo.model.*;
import com.example.demo.repositrory.*;
import com.example.demo.security.CurrentUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;


@Controller
public class MainController {
    @Autowired
    private PostRepository postRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private CategoryRepository categoryRepository;
    @Autowired
    private CommentRepository commentRepository;
    @Autowired
    private ViewRepository viewRepository;


    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String mainHome(ModelMap modelMap, @AuthenticationPrincipal UserDetails userDetails) {

//        Post[] posts = new Post[4];
//        for (int i = 0; i < posts.length; i++) {
//            posts[i] = postRepository.findLast4Posts().get(i);
//        }
//        modelMap.addAttribute("fristPost", posts[0]);
//        modelMap.addAttribute("secondPost", posts[1]);
//        modelMap.addAttribute("thirdPost", posts[2]);
//        modelMap.addAttribute("forthPost", posts[3]);
        modelMap.addAttribute("allCategories", categoryRepository.findAll());
        modelMap.addAttribute("AllPosts", postRepository.findAll());


        if(userDetails != null) {
            User user = ((CurrentUser) userDetails).getUser();
            modelMap.addAttribute("user", user);
        }
        return "index";
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String main() {
        return "redirect:/home";
    }


    @RequestMapping(value = "/post/{id}", method = RequestMethod.GET)
    public String singlePage(ModelMap modelMap, @PathVariable(name = "id") int id, @AuthenticationPrincipal UserDetails userDetails) {
        Post post = postRepository.findOne(id);
        post.setTimestamp(post.getTimestamp().substring(0,16));
        PostView postView = new PostView();
        postView.setPost(post);
        viewRepository.save(postView);
        for (Comment comment : commentRepository.findAllByPost(post)) {
            comment.setTimestamp(comment.getTimestamp().substring(0,16));
        }
        modelMap.addAttribute("viewCount", viewRepository.findAllByPost(post).size());
        modelMap.addAttribute("allComments", commentRepository.findAllByPost(post));
        modelMap.addAttribute("post", post);
        modelMap.addAttribute("comment", new Comment());
        modelMap.addAttribute("allCategories", categoryRepository.findAll());
        modelMap.addAttribute("AllPosts", postRepository.findAll());
        if(userDetails != null) {
            User user = ((CurrentUser) userDetails).getUser();
            modelMap.addAttribute("user", user);
        }
        return "single";
    }

    @RequestMapping(value = "/post", method = RequestMethod.GET)
    public String mainPost() {
        return "redirect:/home";
    }

    @RequestMapping(value = "/blog/{id}", method = RequestMethod.GET)
    public String blog(ModelMap modelMap, @PathVariable(name = "id") int id, @AuthenticationPrincipal UserDetails userDetails) {

        List<Post> pagePost = new ArrayList<>();
        List<Post> posts = postRepository.findAll();

        if (posts.size() < id) {
            for (int i = posts.size()-1; i >= 0; i--) {
                Post post = posts.get(i);
                post.setCommentCount(commentRepository.findAllByPost(post).size());
                post.setViewCount(viewRepository.findAllByPost(post).size());
                post.setTimestamp(post.getTimestamp().substring(0,16));
                pagePost.add(post);
            }
        } else {
            for (int i = id-1; i >=0; i--) {
                Post post = posts.get(i);
                post.setCommentCount(commentRepository.findAllByPost(post).size());
                post.setViewCount(viewRepository.findAllByPost(post).size());
                post.setTimestamp(post.getTimestamp().substring(0,16));
                pagePost.add(post);

            }
        }
        modelMap.addAttribute("allCategories", categoryRepository.findAll());
        modelMap.addAttribute("posts", pagePost);
        if(userDetails != null) {
            User user = ((CurrentUser) userDetails).getUser();
            modelMap.addAttribute("user", user);
        }
        return "blog";
        }
    @RequestMapping(value = "/blog", method = RequestMethod.GET)
    public String mainBlog() {
        return "redirect:/blog/"+5;
    }
    @RequestMapping(value = "/search")
    public String search(ModelMap map, @RequestParam("keyword") String keyword){
        String message = "The search has not given any results";
        List<Post> posts = postRepository.findAll();
        List<Post> postByKeyWord = new LinkedList<>();
        for (Post post : posts) {
            if(post.getTitle().contains(keyword) ||
               post.getText().contains(keyword) ||
               post.getUser().getName().contains(keyword)||
                    post.getUser().getSurname().contains(keyword)){
                post.setCommentCount(commentRepository.findAllByPost(post).size());
                post.setViewCount(viewRepository.findAllByPost(post).size());
                post.setTimestamp(post.getTimestamp().substring(0,16));
                postByKeyWord.add(post);
            }
        }
        if(postByKeyWord.size() == 0){

            return "redirect:/home";
        }else {
            map.addAttribute("allCategories", categoryRepository.findAll());
            map.addAttribute("posts", postByKeyWord);
        }
        return "blog";
    }

    @RequestMapping(value = "/postByCategory/{id}" ,method=RequestMethod.GET)
    public String postByCategoryId(ModelMap modelMap, @PathVariable(name = "id") int id){
        List<Post> allByCategory = postRepository.findAllByCategory(categoryRepository.getOne(id));
        for (Post post : allByCategory) {
            post.setCommentCount(commentRepository.findAllByPost(post).size());
            post.setViewCount(viewRepository.findAllByPost(post).size());
            post.setTimestamp(post.getTimestamp().substring(0,16));
        }
        modelMap.addAttribute("allCategories", categoryRepository.findAll());
        modelMap.addAttribute("posts", allByCategory);
        return "blog";
    }
    @RequestMapping(value = "/loginPage",method = RequestMethod.GET)
    public String login(@RequestParam(name="error",required = false) String message, ModelMap map){
        map.addAttribute("message",message);
        return "login";
    }

    @RequestMapping(value = "/loginPage/error")
    public String loginError(Model model){
        model.addAttribute("error",true);
        return "login";
    }

    @RequestMapping(value = "/register",method = RequestMethod.GET)
    public String register(ModelMap modelMap, @RequestParam(required = false,name = "errMessage") String errMessage){
        modelMap.addAttribute("message", errMessage);
        modelMap.addAttribute("user", new User());
        return "register";
    }
    @RequestMapping(value = "/loginSuccess", method = RequestMethod.GET)
    public String loginSuccess() {
        CurrentUser principal = (CurrentUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal.getUser().getType() == UserType.ADMIN) {
            return "redirect:/admin";
        }else if(principal.getUser().getType() == UserType.USER){
            return "redirect:/home";
        }
        return "redirect:/";
    }

    @RequestMapping(value = "/verifyError", method = RequestMethod.GET)
    public String verifyError() {

        return "verifyError";
    }
}
