package com.db.project.controller;

import com.db.project.book.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
public class BookController {
    @Autowired
    BookService bookService;

    @GetMapping("/book")
    public String bookList(Model model, HttpSession session){
        HashMap<String, Object> map = new HashMap<>();
        map.put("customer_address_num", 46577);

        model.addAttribute("book",bookService.selectCurrentBook(map));

        return "booklist";
    }

}
