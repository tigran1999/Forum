package com.example.demo.controller;

import com.example.demo.mail.EmailServiceImpl;
import com.example.demo.model.Category;
import com.example.demo.model.Post;
import com.example.demo.model.User;
import com.example.demo.model.UserType;
import com.example.demo.repositrory.CategoryRepository;
import com.example.demo.repositrory.PostRepository;
import com.example.demo.repositrory.UserRepository;
import com.example.demo.security.CurrentUser;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

@Controller
public class AdminController {
    @Autowired
    private PostRepository postRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private CategoryRepository categoryRepository;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private EmailServiceImpl emailService;

    @Value("${forum.post.upload.path}")
    private String imageUploadPath;

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String adminMain(ModelMap modelMap,@AuthenticationPrincipal UserDetails userDetails) {

        modelMap.addAttribute("allPosts", postRepository.findAll());
        modelMap.addAttribute("allUsers", userRepository.findAll());
        modelMap.addAttribute("allCategories", categoryRepository.findAll());

        if(userDetails != null) {
            User user = ((CurrentUser) userDetails).getUser();
            modelMap.addAttribute("user", user);
        }
        return "adminControll";
    }

    @RequestMapping(value = "/admin/deleteCategory/{id}", method = RequestMethod.GET)
    public String deleteCategory(@PathVariable() int id) {
        categoryRepository.delete(id);
        return "redirect:/admin";
    }
    @RequestMapping(value = "/admin/deleteUser/{id}", method = RequestMethod.GET)
    public String deleteUser(@PathVariable() int id) {
        userRepository.delete(id);
        return "redirect:/admin";
    }
    @RequestMapping(value = "/admin/deletePost/{id}", method = RequestMethod.GET)
    public String deletePost(@PathVariable() int id) {
        postRepository.delete(id);
        return "redirect:/admin";
    }
    @RequestMapping(value = "/admin/panel", method = RequestMethod.GET)
    public String adminPage(ModelMap map,@AuthenticationPrincipal UserDetails userDetails,@RequestParam(required = false,name = "errMessage")String message) {
        map.addAttribute("message",message);
        map.addAttribute("category", new Category());
        map.addAttribute("post", new Post());
        map.addAttribute("allCategories", categoryRepository.findAll());
        if(userDetails != null) {
            User user = ((CurrentUser) userDetails).getUser();
            map.addAttribute("user", user);
        }
        return "adminPanel";
    }

    @RequestMapping(value = "/admin/addCategory", method = RequestMethod.POST)
    public String addCategory(@Valid@ModelAttribute(name = "category") Category category,BindingResult result) {
        String message;
        if (result.hasErrors()) {
            message= "Category is not valid";
            return "redirect:/admin/panel?errMessage="+message;
        }
        categoryRepository.save(category);
        return "redirect:/admin";
    }

    @RequestMapping(value = "/admin/addPost", method = RequestMethod.POST)
    public String addPost(@Valid @ModelAttribute(name = "post") Post post,BindingResult result, @RequestParam(value = "image") MultipartFile file, @AuthenticationPrincipal UserDetails userDetails) throws IOException {
        String message;
        if (result.hasErrors()) {
            message= "Post is not valid";
            return "redirect:/admin/panel?errMessage="+message;
        }


        if(userDetails != null){
            User user = ((CurrentUser) userDetails).getUser();
            post.setUser(user);
        }

        File dir = new File(imageUploadPath);
        if (!dir.exists()) {
            dir.mkdir();
        }

        String picName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
        File picture = new File(imageUploadPath + picName);
        file.transferTo(picture);

        post.setPicUrl(picName);
        postRepository.save(post);
        return "redirect:/admin";
    }
    @RequestMapping(value = "/image", method = RequestMethod.GET)
    public void getImageAsByteArray(HttpServletResponse response, @RequestParam("fileName") String fileName) throws IOException {
        InputStream in = new FileInputStream(imageUploadPath + fileName);
        response.setContentType(MediaType.IMAGE_JPEG_VALUE);
        IOUtils.copy(in, response.getOutputStream());
    }

    @RequestMapping(value="/register", method = RequestMethod.POST)
    public String register(@Valid @ModelAttribute(name="user") User user, BindingResult result, @RequestParam(value = "image") MultipartFile file
                          ) throws IOException {
        if(result.hasErrors()){
            String message= "Please input the correct details";
            return "redirect:/register?errMessage="+message;
        }

        if(file.getSize()!=0) {
            File dir = new File(imageUploadPath);
            if (!dir.exists()) {
                dir.mkdir();
            }
            String picName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
            File picture = new File(imageUploadPath + picName);
            file.transferTo(picture);
            user.setPicUrl(picName);
        }else {
            user.setPicUrl("");
        }

        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setType(UserType.USER);
        user.setToken(UUID.randomUUID().toString());
        user.setVerify(false);
        userRepository.save(user);
        String url = String.format("http://localhost:8080/verify?token=%s&email=%s",user.getToken(),user.getEmail());
        String text = String.format("Dear %s Thank you, you have successfully registred to our armforum, " +
                "please visit by link in order to activate your profile. %s",user.getName(),url);
        try {
            emailService.sendSimpleMessage(user.getEmail(), "Welcome", text);
        }catch (Exception e){
            String message= "Your message is not delivered";
            return "redirect:/register?errMessage="+message;
        }
        return"redirect:/loginPage";
    }
    @GetMapping("/verify")
    public  String verify(@RequestParam("token") String token,@RequestParam("email")String email){
        User oneByEmail = userRepository.findOneByEmail(email);
        if (oneByEmail != null){
            if(oneByEmail.getToken() != null && oneByEmail.getToken().equals(token)){
                oneByEmail.setToken(null);
                oneByEmail.setVerify(true);
                userRepository.save(oneByEmail);
            }
        }
        return "redirect:/home";
    }
    @PostMapping(value = "/admin/updateUser")
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

    @PostMapping(value = "/admin/changePassword")
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

}
