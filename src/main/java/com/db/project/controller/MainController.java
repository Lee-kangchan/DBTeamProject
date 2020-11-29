package com.db.project.controller;


import com.db.project.customer.CustomerService;
import com.db.project.review.ReviewService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;

@Controller
public class MainController {

	@Autowired
	ReviewService reviewService;

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@GetMapping("hello")
	public String test(Model model){
		return "hello";
	}

	@GetMapping("home")
	public String home(Model model){
		List<HashMap<String,Object>> result = reviewService.selectMainReview();
		for(HashMap<String, Object> t :result){
			logger.info(t.get("review_title").toString()+"");

		}

		model.addAttribute("review", result);
		return "MAIN";
	}
}
