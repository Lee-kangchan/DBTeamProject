package com.db.project.controller;

import com.db.project.manager.ManagerService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
public class ManagerController {

    @Autowired
    ManagerService managerService;

    @GetMapping("/manager/promotion")
    public String managerPromotion(Model model){
        model.addAttribute("promotion", managerService.selectManagerPromotion());
        return "manager_promotion";
    }
    @GetMapping("/manager/book")
    public String managerBook(Model model){
        model.addAttribute("book", managerService.selectManagerBook());
        return "manager_book";
    }
    @GetMapping("/manager/main")
    public String managerMain(Model model){

        return "manager_main";
    }
    @GetMapping("/manager/report")
    public String managerReport(Model model)
    {
        model.addAttribute("customer", managerService.selectManagerCustomerReport());
        model.addAttribute("review", managerService.selectManagerReviewReport());
        return "manager_report";
    }

}
