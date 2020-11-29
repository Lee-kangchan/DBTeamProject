package com.db.project.controller;

import com.db.project.review.ReviewService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.HashMap;
import java.util.List;

@Controller
public class ReviewController {

    @Autowired
    ReviewService reviewService;

    @GetMapping("review")
    public String review(Model model){
        List<HashMap<String,Object>> result = reviewService.selectReviewMain();
        
        model.addAttribute("review", result);
        return "review";
    }

}
