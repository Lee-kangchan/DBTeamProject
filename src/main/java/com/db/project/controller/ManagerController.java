package com.db.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
public class ManagerController {


    @GetMapping("/manager/promotion")
    public String managerPromotion(){

        return "manager_promotion";
    }
    @GetMapping("/manager/book")
    public String managerBook(){

        return "manager_book";
    }
    @GetMapping("/manager/main")
    public String managerMain(){

        return "manager_main";
    }
    @GetMapping("/manager/report")
    public String managerReport(){
        return "manager_report";
    }
    @GetMapping("/manager/login")
    public String managerLogin(){
        return "manager_login";
    }
    @PostMapping("/manager/login")
    public String managerLogin(HttpSession session, @RequestParam HashMap<String, Object> map){

        return "redirect:/manager/book";
    }
}
