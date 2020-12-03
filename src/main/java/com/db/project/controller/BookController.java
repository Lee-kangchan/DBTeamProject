package com.db.project.controller;

import com.db.project.book.BookService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

@Controller
public class BookController {
    @Autowired
    BookService bookService;

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @GetMapping("/book")
    public String bookList(Model model, HttpSession session){
        HashMap<String, Object> map = new HashMap<>();
        map.put("customer_address_num", session.getAttribute("customer_address_num"));

        List<HashMap<String, Object>> book = bookService.selectCurrentBook(map);

        for(HashMap<String, Object> b : book) {
            String[] address = b.get("customer_address").toString().split(" ");

            String addr = address[0] + " " + address[1] + " " + address[2];

            b.put("customer_address", addr);

            int distance = Math.abs(Integer.parseInt(b.get("customer_address_num").toString()) - Integer.parseInt(session.getAttribute("customer_address_num").toString()));

            double distance1 = (double)distance * 0.063;

            if(distance1 == 0) {
                b.put("distance", "0km");
            }
            else {
                b.put("distance", String.format("%.2f", distance1) + "km");
            }
        }

        model.addAttribute("book", book);

        return "booklist";
    }

}
