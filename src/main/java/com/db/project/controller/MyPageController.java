package com.db.project.controller;

import com.db.project.customer.CustomerService;
import com.db.project.matching.MatchingService;
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
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Controller
public class MyPageController {

    @Autowired
    CustomerService customerService;

    @Autowired
    ReviewService reviewService;

    @Autowired
    MatchingService matchingService;

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @GetMapping("myPage")
    public String myPage(Model model, HttpSession session) {

        HashMap<String, Object> map = new HashMap<>();

        map.put("customer_seq", session.getAttribute("customer_seq"));
        map.put("customer_id", session.getAttribute("customer_id"));
        map.put("customer_pw", session.getAttribute("customer_pw"));

        HashMap<String, Object> customerInfo = customerService.customerMyPage(map);

        HashMap<String, Object> pointInfo = customerService.login(map);

        List<HashMap<String, Object>> rental = matchingService.selectRentalMatching(map);
        List<HashMap<String, Object>> borrow = matchingService.selectBorrowMatching(map);

        logger.info(borrow + "");
        logger.info(customerInfo+"");
        logger.info(pointInfo+"");
        if (customerInfo.get("borrowCount")!=null) {
            customerInfo.put("customer_point", pointInfo.get("customer_point"));
        }
        model.addAttribute("rental", rental);
        model.addAttribute("borrow", borrow);
        model.addAttribute("sess", session.getAttribute("customer_seq"));
        model.addAttribute("customerInfo", customerInfo);

        return "MyPage";
    }

    @GetMapping("updateUser")
    public String updateUser(Model model, HttpSession session) {
        HashMap<String, Object> map = new HashMap<>();

        map.put("customer_seq", session.getAttribute("customer_seq"));

        HashMap<String, Object> customerInfo = customerService.customerMyPage(map);

        model.addAttribute("sess", session.getAttribute("customer_seq"));
        model.addAttribute("customerInfo", customerInfo);
        return "updateUserinfo";
    }

    @PostMapping("updateUser")
    public String updateUser(@RequestParam HashMap<String, Object> customerInfo, Model model) {

        return "redirect:/myPage";
    }

    @GetMapping("myReserve")
    public String myReserve(Model model, HttpSession session) {
        HashMap<String, Object> map = new HashMap<>();

        map.put("customer_seq", session.getAttribute("customer_seq"));

        HashMap<String, Object> customerInfo = customerService.customerMyPage(map);
        List<HashMap<String, Object>> reservationInfo = matchingService.selectMyReservation(map);

        for(int i = 0; i < reservationInfo.size(); i++) {
            try {
                Calendar cal = Calendar.getInstance();
                Date date2 = new Date();
                cal.setTime(date2);
                int abcd = Integer.parseInt(reservationInfo.get(i).get("rank").toString());
                cal.add(Calendar.SECOND,  60 * 60 * 24 * 7 * abcd);
                reservationInfo.get(i).put("predict", new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime()));
            }
            catch (Exception e) {
                e.printStackTrace();
            }
        }

        model.addAttribute("reservationInfo", reservationInfo);
        model.addAttribute("sess", session.getAttribute("customer_seq"));
        model.addAttribute("customerInfo", customerInfo);
        return "myReserve";
    }

    @GetMapping("myReport")
    public String myReport(Model model, HttpSession session) {
        HashMap<String, Object> map = new HashMap<>();

        map.put("customer_seq", session.getAttribute("customer_seq"));

        HashMap<String, Object> customerInfo = customerService.customerMyPage(map);

        model.addAttribute("sess", session.getAttribute("customer_seq"));
        model.addAttribute("customerInfo", customerInfo);

        return "myReport";
    }

    @GetMapping("myReview")
    public String myReview(Model model, HttpSession session) {
        HashMap<String, Object> map = new HashMap<>();

        map.put("customer_seq", session.getAttribute("customer_seq"));

        HashMap<String, Object> customerInfo = customerService.customerMyPage(map);

        List<HashMap<String, Object>> myReview = reviewService.myReview(map);

        model.addAttribute("sess", session.getAttribute("customer_seq"));
        model.addAttribute("myReview", myReview);
        model.addAttribute("customerInfo", customerInfo);

        return "myReview";
    }

    @GetMapping("deleteReview/{num}")
    public String deleteReview(Model model, HttpSession session, @PathVariable("num") int num) {

        HashMap<String, Object> seq = new HashMap<>();

        seq.put("review_seq", num);

        reviewService.deleteReview(seq);

        return "redirect:/myReview";
    }
}
