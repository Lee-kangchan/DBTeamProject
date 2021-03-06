package com.db.project.controller;


import com.db.project.book.BookService;
import com.db.project.customer.CustomerDAO;
import com.db.project.customer.CustomerService;
import com.db.project.matching.MatchingDAO;
import com.db.project.matching.MatchingService;
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
	MatchingService matchingService;

	@Autowired
	ReviewService reviewService;

	@Autowired
	BookService bookService;

	@Autowired
	CustomerService customerService;

	@Autowired
	PromotionService promotionService;

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@GetMapping("hello")
	public String test(Model model){
		return "hello";
	}

	@GetMapping("home")
	public String home(Model model, HttpSession session){
		List<HashMap<String,Object>> review;

		String id = (String)session.getAttribute("customer_id");

		HashMap<String, Object> params = new HashMap<>();
		List<HashMap<String ,Object>> rank ;
		HashMap<String ,Object> customer;
		model.addAttribute("rank", params);
		if(id!=null){
			rank = customerService.selectBorrowArea();
			for(HashMap<String, Object> map : rank){
				logger.info("왼쪽 값은 " + session.getAttribute("customer_address")+"이며 오른쪽값은"+map.get("best_borrow_area_name"));
				if(session.getAttribute("customer_address").toString().contains(map.get("best_borrow_area_name").toString())){
					logger.info("확인됬네 들어온다");
					model.addAttribute("rank",map);
				}
			}
		}


		if(id!=null){
			params.put("customer_seq", session.getAttribute("customer_seq"));
			params.put("customer_address_num",session.getAttribute("customer_address_num"));
			review = reviewService.selectCurrentReview(params);
		}else{
			review = reviewService.selectMainReview();
		}

		List<HashMap<String, Object>> book = new ArrayList<>();

		if(id!=null){
			params.put("customer_seq", session.getAttribute("customer_seq"));
			params.put("customer_address_num",session.getAttribute("customer_address_num"));
			book= bookService.selectCurrentMainBook(params);
		}else{
			book = bookService.selectMainBook();
		}
		Date time = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String date = format.format(time);
		params.put("today",date);
		List<HashMap<String, Object>> promotion = promotionService.selectProcessPromotion(params);
		for(HashMap<String, Object> t :review){
			logger.info(t.get("currents_review_title").toString()+"");
		}

		model.addAttribute("sess", session.getAttribute("customer_seq"));
		model.addAttribute("review", review);
		model.addAttribute("book",book);
		model.addAttribute("promotion",promotion);
		return "MAIN";
	}

	@Scheduled(fixedDelay = 10000)
	public void scheduler(){
		logger.info("---------scheduling-----------");
		List<HashMap<String, Object>> map =matchingService.matchingList();
		int count=1;
		customerService.deleteBorrowArea();
		for(HashMap<String, Object> t : map) {
			t.put("seq", count);
			t.put("count",t.get("area"));
			t.put("name", t.get("name"));
			customerService.insertBorrowArea(t);
			count++;
		}
	}
}
