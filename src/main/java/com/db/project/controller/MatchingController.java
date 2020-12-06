package com.db.project.controller;

import com.db.project.matching.MatchingService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
public class MatchingController {

    @Autowired
    MatchingService matchingService;
    @PostMapping("/insert/matching/{book_seq}")
    public String insertMatching(@PathVariable Integer book_seq, HttpSession session){
        HashMap<String, Object> map = new HashMap<>();
        map.put("book_seq",book_seq);
        map.put("customer_seq", session.getAttribute("customer_seq"));
        matchingService.insertMatching(map);
        return "redirect:/home";
    }
    @GetMapping("rental")
    public String selectRentalMatching(Model model,HttpSession session){
        HashMap<String , Object> map = new HashMap<>();
        map.put("customer_seq", session.getAttribute("customer_seq"));
        model.addAttribute("matching",matchingService.selectRentalMatching(map));
        return "RentalBook";
    }
    @GetMapping("borrow")
    public String selectBorrowMatching(Model model, HttpSession session){
        HashMap<String , Object> map = new HashMap<>();
        map.put("customer_seq", session.getAttribute("customer_seq"));
        model.addAttribute("matching",matchingService.selectRentalMatching(map));
        return "borrowBook";
    }
    @GetMapping("/matching/{seq}/rental/check")
    public String  updateRentalCheck(@PathVariable Integer seq, Model model, HttpSession session){
        HashMap<String, Object> hashMap = new HashMap<>();
        hashMap.put("customer_seq",session.getAttribute("customer_seq"));
        hashMap.put("matching_seq", seq);
        matchingService.updateRentalMatching(hashMap);
        return "redirect:/myPage";
    }
    @GetMapping("/matching/{seq}/borrow/chcek")
    public String  updateBorrowCheck(@PathVariable Integer seq, Model model, HttpSession session){
        HashMap<String, Object> hashMap = new HashMap<>();
        hashMap.put("customer_seq",session.getAttribute("customer_seq"));
        hashMap.put("matching_seq",seq);
        matchingService.updateBorrowMatching(hashMap);
        return "redirect:/myPage";
    }
    @GetMapping("/matching/{seq}/cancel")
    public String cancel(@PathVariable Integer seq, Model model, HttpSession session){
        HashMap<String, Object> hashMap = new HashMap<>();
        hashMap.put("customer_Seq", session.getAttribute("customer_seq"));
        hashMap.put("matching_seq", seq);
        hashMap.put("matching_type", "거래취소");

        return "redirect:/myPage";
    }

}
