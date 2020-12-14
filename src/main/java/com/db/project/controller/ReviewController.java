package com.db.project.controller;

import com.db.project.book.BookService;
import com.db.project.review.ReviewService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

@Controller
public class ReviewController {

    @Autowired
    ReviewService reviewService;

    @Autowired
    BookService bookService;

    @GetMapping("review")
    public String review(Model model, HttpSession session){
        List<HashMap<String,Object>> result = reviewService.selectReviewMain();

        model.addAttribute("sess", session.getAttribute("customer_seq"));
        model.addAttribute("review", result);
        return "review";
    }

    @GetMapping("bookReview/{num}")
    public String bookReview(@PathVariable Integer num, Model model, HttpSession session) {

        HashMap<String, Object> map = new HashMap<>();

        map.put("book_isbn", num);

        HashMap<String, Object> bookInfo = bookService.reviewBook(map);

        List<HashMap<String, Object>> reviewInfo = reviewService.selectReviewContent(map);

        model.addAttribute("sess", session.getAttribute("customer_seq"));
        model.addAttribute("bookInfo", bookInfo);
        model.addAttribute("reviewInfo", reviewInfo);

        return "bookReview";
    }

    @GetMapping("addReview/{num}")
    public String addReview(@PathVariable Integer num, Model model, HttpSession session) {


        model.addAttribute("book_isbn", num);
        model.addAttribute("sess", session.getAttribute("customer_seq"));

        return "addReview";
    }

    @PostMapping("addReview/{num}")
    public String addReview(@PathVariable Integer num, @RequestParam HashMap<String, Object> reviewInfo, HttpSession session) {

        reviewInfo.put("book_isbn", num);
        reviewInfo.put("customer_seq", session.getAttribute("customer_seq"));
        reviewInfo.put("customer_address_num", session.getAttribute("customer_address_num"));
        reviewInfo.put("name",session.getAttribute("customer_nickname"));
        reviewService.insertReview(reviewInfo);

        return "redirect:/myReview";
    }

}
