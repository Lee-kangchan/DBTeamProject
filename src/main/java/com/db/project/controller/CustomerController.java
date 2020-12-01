package com.db.project.controller;

import com.db.project.card.CardService;
import com.db.project.customer.CustomerService;
import com.db.project.review.ReviewService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

@Controller
public class CustomerController {

    @Autowired
    CustomerService customerService;

    @Autowired
    CardService cardService;

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    // 로그인 화면
    @GetMapping("login")
    public String login(Model model){
        return "Login";
    }

    @PostMapping("login")
    public ModelAndView login(@RequestParam HashMap<String, Object> customer, Model model, HttpSession session) {


        ModelAndView mv = new ModelAndView();
        HashMap<String, Object> result = customerService.login(customer);


        session.setAttribute("customer_seq", result.get("customer_seq"));
        session.setAttribute("customer_id", result.get("customer_id"));
        session.setAttribute("customer_name", result.get("customer_name"));
        session.setAttribute("customer_nickname", result.get("customer_nickname"));
        session.setAttribute("customer_address_num", result.get("customer_address_num"));
        mv.setViewName("redirect:/home");
        return mv;
    }

    // 회원가입
    @GetMapping("signup")
    public String signup(Model model) {return "Signup";}

    @PostMapping("signup")
    public String signup(@RequestParam HashMap<String, Object> customer, @RequestParam List<Integer> category_seq, Model model) {

        // 여기서 부터 막혔음
        customerService.insertCustomer(customer, category_seq);

        return "redirect:/home";
    }

    // 카드 추가
    @GetMapping("addCard")
    public String addCard(Model model) {return "addCard";}

    @PostMapping("addCard")
    public String addCard(@RequestParam HashMap<String, Object> cardInfo, Model model, HttpSession session) {

        cardInfo.put("customer_seq", session.getAttribute("customer_seq"));
        cardService.insertCard(cardInfo);

        return "redirect:/myCard";
    }

    // 내 카드 목록
    @GetMapping("myCard")
    public String myCard(Model model, HttpSession session) {

        HashMap<String, Object> map = new HashMap<>();

        map.put("customer_seq", session.getAttribute("customer_seq"));

        logger.info(session.getAttribute("customer_seq") + "");

        logger.info(map + "");

        List<HashMap<String, Object>> cardInfo = cardService.selectCard(map);

        logger.info(cardInfo + "");

        model.addAttribute("cardInfo", cardInfo);

        return "myCard";

    }

    // 카드 삭제
}
