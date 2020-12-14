package com.db.project.controller;

import com.db.project.book.BookService;
import com.db.project.matching.MatchingService;
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

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

@Controller
public class MatchingController {

    Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired
    MatchingService matchingService;
    @Autowired
    BookService bookService;

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
        model.addAttribute("matching",matchingService.selectBorrowMatching(map));
        return "borrowBook";
    }
    @GetMapping("/matching/{seq}/rental/check/{yn}")
    public String  updateRentalCheck(@PathVariable Integer seq, @PathVariable Integer yn, Model model, HttpSession session){
        HashMap<String, Object> hashMap = new HashMap<>();
        hashMap.put("customer_seq",session.getAttribute("customer_seq"));
        hashMap.put("matching_seq", seq);
        hashMap.put("matching_rental_yn", yn);
        logger.info(hashMap+"");
        matchingService.updateRentalMatching(hashMap);
        return "redirect:/myPage";
    }
    @GetMapping("/matching/{seq}/borrow/check/{yn}")
    public String  updateBorrowCheck(@PathVariable Integer seq, @PathVariable Integer yn, Model model, HttpSession session){
        HashMap<String, Object> hashMap = new HashMap<>();
        hashMap.put("customer_seq",session.getAttribute("customer_seq"));
        hashMap.put("matching_seq",seq);
        hashMap.put("matching_borrow_yn", yn);
        matchingService.updateBorrowMatching(hashMap);
        HashMap<String, Object> map = matchingService.selectDetailMatching(hashMap);

        if(map.get("matching_type").equals("반납")){
            List<HashMap<String, Object>> map2 = bookService.reservation(hashMap);
            if(map2.get(0).get("reservation_seq")!=null){
                bookService.updateReservation(map2.get(0));
                map.put("customer_seq", map2.get(0).get("customer_seq"));
                matchingService.insertMatching(map);
            }
            else{
                hashMap.put("customer_book_type","대여가능");
                bookService.updateCustomerBookYn(hashMap);
            }
        }else{
            hashMap.put("customer_book_type","대여가능");
            bookService.updateCustomerBookYn(hashMap);
        }

        return "redirect:/myPage";
    }
    @GetMapping("/matching/{seq}/cancel")
    public String cancel(@PathVariable Integer seq, Model model, HttpSession session){
        HashMap<String, Object> hashMap = new HashMap<>();
        hashMap.put("customer_Seq", session.getAttribute("customer_seq"));
        hashMap.put("matching_seq", seq);
        hashMap.put("matching_type", "거래취소");

        matchingService.updateCancelMatching(hashMap);
        HashMap<String, Object> map = matchingService.selectDetailMatching(hashMap);
        if(map.get("customer_book_seq")!=null){
            List<HashMap<String, Object>> map2 = bookService.reservation(map);
            if(map2.get(0).get("reservation_seq")!=null){
                bookService.updateReservation(map2.get(0));
                map.put("customer_seq", map2.get(0).get("customer_seq"));
                matchingService.insertMatching(map);
            }
            else{
                hashMap.put("customer_book_type","대여가능");
                bookService.updateCustomerBookYn(hashMap);
            }
        }else{
            hashMap.put("customer_book_type","대여가능");
            bookService.updateCustomerBookYn(hashMap);
        }
        return "redirect:/myPage";
    }

}
