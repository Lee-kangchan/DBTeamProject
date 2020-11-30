package com.db.project.controller;

import com.db.project.customer.CustomerService;
import com.db.project.review.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

public class CustomerController {

    @Autowired
    CustomerService customerService;

    // 로그인 화면
    @GetMapping("login")
    public String login(Model model){
        return "Login";
    }
}
