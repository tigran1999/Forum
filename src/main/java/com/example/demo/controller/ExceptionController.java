
package com.example.demo.controller;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;

@Controller
public class ExceptionController {


    @RequestMapping(value = "/errors", method = RequestMethod.GET)
    public String ErrorPage() {
        return "error";
    }

    @RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
    public String AccessDeniedPage() {
        return "accessDenied";
    }

}




