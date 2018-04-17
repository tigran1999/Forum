package com.example.demo.controller;

import com.example.demo.mail.EmailServiceImpl;
import com.example.demo.model.Comment;
import com.example.demo.model.Post;
import com.example.demo.model.User;
import com.example.demo.model.UserType;
import com.example.demo.repositrory.*;
import com.example.demo.security.CurrentUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.UUID;

@Controller
public class UserController {
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
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private EmailServiceImpl emailService;

    @Value("${forum.post.upload.path}")
    private String imageUploadPath;

    @RequestMapping(value = "user/addComment/{id}", method = RequestMethod.POST)
    public String addComment(@ModelAttribute(name = "comment") Comment comment, @PathVariable(name = "id") int postId
            , @AuthenticationPrincipal UserDetails userDetails) {
        comment.setPost(postRepository.getOne(postId));
        if (userDetails != null) {
            User user = ((CurrentUser) userDetails).getUser();
            comment.setUser(user);
        }


        commentRepository.save(comment);


        return "redirect:/post/" + comment.getPost().getId();
    }

    @RequestMapping(value = "user/deleteComment/{id}", method = RequestMethod.GET)
    public String deleteComment(@PathVariable(name = "id") int id) {
        Comment one = commentRepository.findOne(id);
        Post post = one.getPost();
        commentRepository.delete(one);


        return "redirect:/post/" + post.getId();
    }

    @RequestMapping(value = "/myPage", method = RequestMethod.GET)
    public String myPage(ModelMap modelMap, @AuthenticationPrincipal UserDetails userDetails, @RequestParam(required =false, name = "errMessage") String message) {

        modelMap.addAttribute("allCategories", categoryRepository.findAll());
        if (userDetails != null) {
            User user = ((CurrentUser) userDetails).getUser();
            modelMap.addAttribute("user", user);
            List<Post> posts = postRepository.findAllByOrderByIdDesc();
            List<Post> myPosts = new ArrayList<>();
            for (Post post : posts) {
                if(post.getUser().equals(user)) {
                    post.setCommentCount(commentRepository.findAllByPost(post).size());
                    post.setViewCount(viewRepository.findAllByPost(post).size());
                    post.setTimestamp(post.getTimestamp().substring(0, 16));
                    myPosts.add(post);
                }
            }


            modelMap.addAttribute("posts", myPosts);
        }
        modelMap.addAttribute("post", new Post());
        modelMap.addAttribute("message",message);


        return "mypage";
    }


    @RequestMapping(value = "/userPage/{id}", method = RequestMethod.GET)
    public String userPage(ModelMap modelMap, @AuthenticationPrincipal UserDetails userDetails, @PathVariable(name = "id") int id) {

        User user;
        User currentUser;
        if (userDetails != null) {
            currentUser = ((CurrentUser) userDetails).getUser();
            modelMap.addAttribute("currentUser", currentUser);
        } else {
            currentUser = null;
        }

        if (currentUser != null && currentUser.getId() == id) {
            return "redirect:/myPage";
        } else {
            user = userRepository.findOne(id);
        }


        List<Post> posts = postRepository.findAllByOrderByIdDesc();
        List<Post> myPosts = new ArrayList<>();
        for (Post post : posts) {
            if(post.getUser().equals(user)) {
                post.setCommentCount(commentRepository.findAllByPost(post).size());
                post.setViewCount(viewRepository.findAllByPost(post).size());
                post.setTimestamp(post.getTimestamp().substring(0, 16));
                myPosts.add(post);
            }
        }
        modelMap.addAttribute("posts", myPosts);
        modelMap.addAttribute("user", user);


        return "userPage";
    }

    @RequestMapping(value = "/user/addPost", method = RequestMethod.POST)
    public String addPost( @Valid @ModelAttribute(name = "post") Post post, BindingResult result, @RequestParam(value = "image") MultipartFile file, @AuthenticationPrincipal UserDetails userDetails) throws IOException {
        String message;
        if (result.hasErrors()) {
             message= "Post is not valid";
            return "redirect:/myPage?errMessage="+message;
        }


        if (file.getSize() != 0) {
            File dir = new File(imageUploadPath);
            if (!dir.exists()) {
                dir.mkdir();
            }
        }
        String picName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
        File picture = new File(imageUploadPath + picName);
        file.transferTo(picture);
        post.setPicUrl(picName);


        if (userDetails != null) {
            User user = ((CurrentUser) userDetails).getUser();
            post.setUser(user);
        }


        postRepository.save(post);
        return "redirect:/myPage";
    }

    @RequestMapping(value = "/user/updateUser", method = RequestMethod.POST)
    public String updateUser(@RequestParam(name = "name") String name, @RequestParam(name = "surname") String surname,
                             @RequestParam(value = "image") MultipartFile file,@AuthenticationPrincipal UserDetails userDetails) throws IOException {
        User user;
        if(userDetails != null){
            user = ((CurrentUser) userDetails).getUser();
        }else {
            user = null;
        }

        if(name == null || name.equals("") || surname == null || surname.equals("")){
            String message= "name or surname can not by empty";
            return "redirect:/myPage?errMessage="+message;
        }
        user.setName(name);
        user.setSurname(surname);
        if (file.getSize() != 0) {
            File dir = new File(imageUploadPath + user.getPicUrl());
            if (!dir.exists()) {
                dir.delete();
            }
            String picName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
            File picture = new File(imageUploadPath + picName);
            file.transferTo(picture);
            user.setPicUrl(picName);
        } else {
            user.setPicUrl("");
        }
        userRepository.save(user);
        return "redirect:/myPage";
    }

    @RequestMapping(value = "/user/changePassword", method = RequestMethod.POST)
    public String changePassword(@RequestParam(name = "old") String oldPassword, @RequestParam(name = "new") String newPassword,
            @AuthenticationPrincipal UserDetails userDetails) {
        User user;
        if(userDetails != null){
            user = ((CurrentUser) userDetails).getUser();
        }else {
            user = null;
        }



        if (passwordEncoder.matches(oldPassword,user.getPassword() )) {
            user.setPassword(passwordEncoder.encode(newPassword));
        }else{
            String message= "password change failed";
            return "redirect:/myPage?errMessage="+message;
        }
        userRepository.save(user);
        return "redirect:/myPage?errMessage=Your password changed";
    }

    @RequestMapping(value = "/user/deletePost/{id}", method = RequestMethod.GET)
    public String deletePost(@PathVariable(name = "id") int id) {
        postRepository.delete(postRepository.findOne(id));
        return "redirect:/myPage";
    }
    @RequestMapping(value="/forgotPassword", method = RequestMethod.POST)
    public String forgotPass(@RequestParam(name="email")String email) {

        User user = userRepository.findOneByEmail(email);
        if(user == null){
            String message = "No user for this email";
            return "redirect:/loginPage?error="+message;
        }
        Random random = new Random();
        String password = user.getName() +random.nextInt(1000) ;
        user.setPassword(passwordEncoder.encode(password));
        userRepository.save(user);

        String text = String.format("Hi %s , your new password` %s",user.getName(),password);
        try {
            emailService.sendSimpleMessage(user.getEmail(), "Welcome", text);
        }catch (Exception e){
            String message= "Your message is not delivered";
            return "redirect:/register?errMessage="+message;
        }
        return"redirect:/loginPage?error=Your new Password sended your email";
    }
    @RequestMapping(value="/forgotPassword", method = RequestMethod.GET)
    public String forgotPassword() {
        return "forgotPassword";
    }
}


