package com.db.project.controller;


import com.db.project.customer.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class MainController {

	@GetMapping("hello")
	public String test(Model model){
		return "hello";
	}

	@GetMapping("home")
	public String home(Model model){
		return "home";
	}
}
