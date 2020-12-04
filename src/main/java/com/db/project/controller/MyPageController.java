package com.db.project.controller;

import com.db.project.customer.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
public class MyPageController {

    @Autowired
    CustomerService customerService;

    @GetMapping("myPage")
    public String myPage(Model model, HttpSession session) {

        HashMap<String, Object> map = new HashMap<>();

        map.put("customer_seq", session.getAttribute("customer_seq"));

        HashMap<String, Object> customerInfo = customerService.customerMyPage(map);

        model.addAttribute("customerInfo", customerInfo);

        return "MyPage";
    }
}
