package com.db.project.controller;

import com.db.project.book.BookService;
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

    @GetMapping("/book")
    public String bookList(Model model, HttpSession session){
        HashMap<String, Object> map = new HashMap<>();
        map.put("customer_address_num", 46577);

        List<HashMap<String, Object>> book = bookService.selectCurrentBook(map);

        for(HashMap<String, Object> b : book) {
            String[] address = b.get("customer_address").toString().split(" ");

            String addr = address[0] + " " + address[1] + " " + address[2];

            b.put("customer_address", addr);
        }

        model.addAttribute("book", book);

        return "booklist";
    }

}
