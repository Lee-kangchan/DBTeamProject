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
import org.springframework.web.bind.annotation.PathVariable;
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


        model.addAttribute("message","");
        return "Login";
    }

    @PostMapping("login")
    public ModelAndView login(@RequestParam HashMap<String, Object> customer, Model model, HttpSession session) {


        ModelAndView mv = new ModelAndView();
        HashMap<String, Object> result = customerService.login(customer);

        if(result!=null) {
            session.setAttribute("customer_seq", result.get("customer_seq"));
            session.setAttribute("customer_id", result.get("customer_id"));
            session.setAttribute("customer_pw", result.get("customer_pw"));
            session.setAttribute("customer_name", result.get("customer_name"));
            session.setAttribute("customer_nickname", result.get("customer_nickname"));
            session.setAttribute("customer_address_num", result.get("customer_address_num"));
            mv.setViewName("redirect:/home");
        }
        else {
            mv.addObject("message","아이디 및 비밀번호를 확인 해주세요");
            mv.setViewName("/Login");
        }
        return mv;
    }

    // 회원가입
    @GetMapping("signup")
    public String signup(Model model) {
        return "Signup";}

    @PostMapping("signup")
    public String signup(@RequestParam HashMap<String, Object> customer, @RequestParam List<Integer> category_seq, Model model) {

        // 여기서 부터 막혔음
        customerService.insertCustomer(customer, category_seq);

        return "redirect:/home";
    }

    // 카드 추가
    @GetMapping("addCard")
    public String addCard(Model model, HttpSession session) {
        HashMap<String, Object> map = new HashMap<>();

        map.put("customer_seq", session.getAttribute("customer_seq"));

        HashMap<String, Object> customerInfo = customerService.customerMyPage(map);

        model.addAttribute("sess", session.getAttribute("customer_seq"));
        model.addAttribute("customerInfo", customerInfo);

        return "addCard";
    }

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

        HashMap<String, Object> customerInfo = customerService.customerMyPage(map);

        List<HashMap<String, Object>> cardInfo = cardService.selectCard(map);

        model.addAttribute("sess", session.getAttribute("customer_seq"));
        model.addAttribute("customerInfo", customerInfo);
        model.addAttribute("cardInfo", cardInfo);

        return "myCard";

    }

    // 카드 삭제
    @GetMapping("deleteCard/{num}")
    public String deleteCard(Model model, HttpSession session, @PathVariable("num") int num) {

        HashMap<String, Object> map = new HashMap<>();

        map.put("card_num", num);

        cardService.deleteCard(map);

        return "redirect:/myCard";
    }

    // 포인트 충전
    @GetMapping("addPoint")
    public String addPoint(Model model, HttpSession session) {

        HashMap<String, Object> map = new HashMap<>();

        map.put("customer_seq", session.getAttribute("customer_seq"));

        HashMap<String, Object> customerInfo = customerService.customerMyPage(map);

        List<HashMap<String, Object>> cardInfo = cardService.selectCard(map);

        model.addAttribute("sess", session.getAttribute("customer_seq"));
        model.addAttribute("customerInfo", customerInfo);
        model.addAttribute("cardInfo", cardInfo);

        return "addPoint";
    }

    @PostMapping("addPoint")
    public String addPoint(@RequestParam HashMap<String, Object> pointInfo, Model model, HttpSession session) {

        pointInfo.put("customer_seq", session.getAttribute("customer_seq"));
        pointInfo.put("approval_point", pointInfo.get("customer_point"));
        pointInfo.put("approval_yn", "+");
        pointInfo.put("approval_detail", "충전");
        pointInfo.put("sales_money", pointInfo.get("customer_point"));
        pointInfo.put("sales_type", "+");
        pointInfo.put("sales_detail", pointInfo.get("card_num") + "으로 충전");

        cardService.updateCustomerPlusPoint(pointInfo);

        return "redirect:/myPoint";
    }

    @GetMapping("myPoint")
    public String myPoint(Model model, HttpSession session) {

        HashMap<String, Object> seq = new HashMap<>();

        seq.put("customer_seq", session.getAttribute("customer_seq"));
        seq.put("customer_id", session.getAttribute("customer_id"));
        seq.put("customer_pw", session.getAttribute("customer_pw"));

        HashMap<String, Object> userInfo = customerService.login(seq);
        HashMap<String, Object> customerInfo = customerService.customerMyPage(seq);

        List<HashMap<String, Object>> point = cardService.selectApproval(seq);

        model.addAttribute("sess", session.getAttribute("customer_seq"));
        model.addAttribute("customerInfo", customerInfo);
        model.addAttribute("userInfo", userInfo);
        model.addAttribute("point", point);

        return "point";
    }
    @GetMapping("logout")
    public String logout( HttpSession session){
        session.invalidate();
        return "redirect:/home";
    }
}
