package com.db.project.controller;


import com.db.project.book.BookService;
import com.db.project.customer.CustomerService;
import com.db.project.promotion.PromotionService;
import com.db.project.review.ReviewService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Controller
public class MainController {

	@Autowired
	ReviewService reviewService;

	@Autowired
	BookService bookService;

	@Autowired
	PromotionService promotionService;

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@GetMapping("hello")
	public String test(Model model){
		return "hello";
	}

	@GetMapping("home")
	public String home(Model model, HttpSession session){
		List<HashMap<String,Object>> review = reviewService.selectMainReview();

		String id = (String)session.getAttribute("customer_id");
		List<HashMap<String, Object>> book = new ArrayList<>();
		HashMap<String, Object> params = new HashMap<>();

		if(id!=null){
			params.put("customer_seq", session.getAttribute("customer_seq"));
			params.put("customer_address_num",session.getAttribute("customer_address_num"));
			book= bookService.selectNewBook(params);
		}else{
			book = bookService.selectMainBook();
		}
		Date time = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String date = format.format(time);
		params.put("today",date);
		List<HashMap<String, Object>> promotion = promotionService.selectProcessPromotion(params);
		for(HashMap<String, Object> t :review){
			logger.info(t.get("review_title").toString()+"");
		}

		model.addAttribute("sess", session.getAttribute("customer_seq"));
		model.addAttribute("review", review);
		model.addAttribute("book",book);
		model.addAttribute("promotion",promotion);
		return "MAIN";
	}

	@Scheduled(fixedDelay = 1000)
	public void scheduler(){
		logger.info("---------scheduling-----------");

	}
}
