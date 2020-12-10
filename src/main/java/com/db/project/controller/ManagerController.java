package com.db.project.controller;

import com.db.project.book.BookService;
import com.db.project.manager.ManagerService;
import com.db.project.promotion.PromotionService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.apache.juli.logging.LogFactory;
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
import java.awt.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Controller
public class ManagerController {

    Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired
    ManagerService managerService;

    @Autowired
    BookService bookService;
    @Autowired
    PromotionService promotionService;

    @GetMapping("/manager/promotion")
    public String managerPromotion(Model model) throws ParseException {

        List<HashMap<String, Object>> map = managerService.selectManagerPromotion();


        for(HashMap<String, Object> t : map) {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date();
            logger.info(t.get("promotion_startAt").toString());
            int start = Integer.parseInt(t.get("promotion_startAt").toString().toString().replace("-", ""));
            int end = Integer.parseInt(t.get("promotion_endAt").toString().toString().replace("-", ""));
            int now = Integer.parseInt(dateFormat.format(date).replace("-", ""));
            String name;
            if (now < start) {
                name = "진행예정";
            } else if (now <= end) {
                name = "진행중";
            } else {
                name = "진행마감";
            }
            t.put("name",name);
        }
        model.addAttribute("promotion", map);

        return "manager_promotion";
    }
    @GetMapping("/manager/book")
    public String managerBook(Model model){
        model.addAttribute("book", managerService.selectManagerBook());
        return "manager_book";
    }
    @GetMapping("/manager/main")
    public String managerMain(Model model){

        return "manager_main";
    }
    @GetMapping("/manager/report")
    public String managerReport(Model model)
    {
        model.addAttribute("customer", managerService.selectManagerCustomerReport());
        model.addAttribute("review", managerService.selectManagerReviewReport());
        return "manager_report";
    }
    @GetMapping("/manager/book/{book}")
    public  String managerBookDetail(Model model, @PathVariable int book)
    {
        HashMap<String, Object> map = new HashMap<>();
        map.put("customer_book_seq", book);
        model.addAttribute("book", bookService.selectDetailBook(map));
        model.addAttribute("bookImage", bookService.selectBookImage(map));
        logger.info(""+bookService.selectBookImage(map));
        return "manager_bookConfirm";
    }
    @PostMapping("/manager/book/yn")
    public String managerBookDetailYn(Model model, @RequestParam HashMap<String, Object> params){

        bookService.updateCustomerBookCertification(params);
        return "redirect:/manager/book";
    }
    @GetMapping("/manager/promotion/{promotion}")
    public String managerPromotionDetail(Model model, @PathVariable int promotion){
        HashMap<String, Object> map = new HashMap<>();
        map.put("promotion_seq", promotion);
        HashMap<String , Object> map2 = promotionService.selectDetailPromotion(map);

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        int start = Integer.parseInt(map2.get("promotion_startAt").toString().replace("-", ""));
        int end = Integer.parseInt(map2.get("promotion_endAt").toString().replace("-", ""));
        int now = Integer.parseInt(dateFormat.format(date).replace("-", ""));
        String name;
        if (now < start) {
            name = "진행예정";
        } else if (now <= end) {
            name = "진행중";
        } else {
            name = "진행마감";
        }
        map2.put("name",name);
        model.addAttribute("promotion",map2);
        return "manager_promotion_detail";
    }
    @GetMapping("/manager/promotion/insert")
    public String managerPromotionInsert(Model model){
        return "addPromotion";
    }

    @GetMapping("/manager/sales/1")
    public String managerSales1(Model model){
        return "manager_sales3";
    }
    @GetMapping("/manager/sales/2")
    public String managerSales3(Model model){
        return "manager_sales4";
    }
    @GetMapping("/manager/sales/3")
    public String managerSales2(Model model){
        return "manager_sales5";
    }
}
