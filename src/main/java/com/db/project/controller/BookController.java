package com.db.project.controller;

import com.db.project.book.BookService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

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

    @GetMapping("/bookInsert")
    public String bookInsert(@RequestParam HashMap<String, Object> map, HttpSession session){

        return "addBook";
    }
    @PostMapping("/addBook")
    public String bookInsert(HttpServletRequest request, Model model, HttpSession session , @RequestParam HashMap<String, Object> map, @RequestParam("book_image") MultipartFile book_image, @RequestParam("customer_book_img") List<MultipartFile> customer_book_img) throws IOException {

        UUID uuid ;
        uuid = UUID.randomUUID();

        String root_path = request.getSession().getServletContext().getRealPath("/");
        logger.info(root_path);
        String path = "C:/Users/abc/AllWorkBench/TeamWorkBench/DBTeamProject/src/main/resources";
        String book_image_path = "/static/img/"+uuid+".jpg";
        map.put("book_img",book_image_path);
        map.put("customer_seq", session.getAttribute("customer_seq"));
        book_image.transferTo(new File(path, book_image_path));
        bookService.insertBook(map);
        List<HashMap<String, Object>> list = new ArrayList<>();
        HashMap<String, Object> image = new HashMap<>();
        for(MultipartFile file : customer_book_img){
            uuid = UUID.randomUUID();
            String book_image_path2 = "/static/img/"+uuid+".jpg";
            image.put("customer_book_img",book_image_path2);
            file.transferTo(new File(path, book_image_path2));
            list.add(image);
        }

        bookService.insertBookImage(list);
        return "redirect:/home";
    }
    @GetMapping("/book/{seq}")
    public String bookDetail(@PathVariable Integer seq ,  Model model, HttpSession session){

        return "Book_borrow1";
    }
    @GetMapping("/book/{seq}/check")
    public String bookCheck(@PathVariable Integer seq, Model model, HttpSession session){
        return "Book_borrow2";
    }
    @PostMapping("book/{seq}")
    public String bookCheckInsert(@RequestParam HashMap<String, Object> map, HttpSession session, Model model){
        return "";
    }

}
