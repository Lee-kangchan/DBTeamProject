package com.db.project.controller;

import com.db.project.book.BookService;
import com.db.project.card.CardService;
import com.db.project.customer.CustomerService;
import com.db.project.matching.MatchingService;
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
import java.util.*;

@Controller
public class BookController {
    @Autowired
    BookService bookService;

    @Autowired
    CustomerService customerService;
    @Autowired
    MatchingService matchingService;

    @Autowired
    CardService cardService;
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
        model.addAttribute("sess", session.getAttribute("customer_seq"));

        return "booklist";
    }

    @GetMapping("/bookInsert")
    public String bookInsert(Model model,@RequestParam HashMap<String, Object> map, HttpSession session){
        model.addAttribute("sess", session.getAttribute("customer_seq"));

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
        map.put("customer_address_num",session.getAttribute("customer_address_num"));
        book_image.transferTo(new File("",book_image_path));
        bookService.insertBook(map);
        List<HashMap<String, Object>> list = new ArrayList<>();
        HashMap<String, Object> image = new HashMap<>();
        for(MultipartFile file : customer_book_img){
            uuid = UUID.randomUUID();
            String book_image_path2 = "/static/img/"+uuid+".jpg";
            image.put("customer_book_img",book_image_path2);
            file.transferTo(new File("",book_image_path2));
            list.add(image);
        }

        bookService.insertBookImage(list);
        return "redirect:/home";
    }
    @GetMapping("/book/{seq}")
    public String bookDetail(@PathVariable Integer seq ,  Model model, HttpSession session){
        HashMap<String, Object> map = new HashMap<>();
        map.put("customer_book_seq", seq);
        model.addAttribute("book",bookService.selectDetailBook(map));
        model.addAttribute("sess", session.getAttribute("customer_seq"));

        return "Book_borrow1";
    }
    @GetMapping("/book/{seq}/check")
    public String bookCheck(@PathVariable Integer seq, Model model, HttpSession session){
        HashMap<String, Object> map = new HashMap<>();
        map.put("customer_book_seq", seq);
        map.put("customer_seq", session.getAttribute("customer_seq"));
        model.addAttribute("book",bookService.selectDetailBook(map));
        model.addAttribute("sale", customerService.customerSales(map));
        model.addAttribute("sess", session.getAttribute("customer_seq"));
        return "Book_borrow2";
    }
    @PostMapping("book/{seq}")
    public String bookMatching( HttpSession session, Model model,@PathVariable Integer seq, @RequestParam HashMap<String, Object> map){

        map.put("customer_book_seq", seq);
        map.put("customer_seq",session.getAttribute("customer_seq"));
        Random rd = new Random();
        int front =0;
        int back = 0;

        for(int i=0; i<4; i++){
            front = front + rd.nextInt(rd.nextInt(10) + 1);
            front = front *10;

            logger.info(front + "");
        }
        front = front / 10;
        for(int i=0; i<4; i++){
            back = back + rd.nextInt(rd.nextInt(10) + 1);
            back = back *10;
        }
        back /= 10;
        map.put("customer_secret_num", "070-"+String.valueOf(front)+ "-" + String.valueOf(back));
        matchingService.insertMatching(map);
        map.put("approval_point",map.get("money"));
        map.put("approval_detail", "매칭금액");
        cardService.updateCustomerMinusPoint(map);

        map.put("approval_point",map.get("deposit"));
        map.put("approval_detail", "예치금");
        cardService.updateCustomerMinusPoint(map);

        return "redirect:/home";
    }
    @PostMapping("book/reservation/{seq}")
    public String bookReservation(@PathVariable Integer seq, HttpSession session){
        HashMap<String, Object> map = new HashMap<>();
        map.put("customer_book_seq", seq);
        map.put("customer_seq",session.getAttribute("customer_seq"));
        bookService.insertBookReservation(map);
        return "redirect:/home";
    }

    @GetMapping("myBook")
    public String myBook(Model model, HttpSession session) {

        HashMap<String, Object> map = new HashMap<>();
        map.put("customer_seq", session.getAttribute("customer_seq"));

        List<HashMap<String, Object>> bookInfo = bookService.selectCustomerBook(map);

        model.addAttribute("bookInfo", bookInfo);
        model.addAttribute("sess", session.getAttribute("customer_seq"));

        return "myBook";
    }

    @GetMapping("deleteBook/{num}")
    public String deleteBook(@PathVariable Integer num, Model model, HttpSession session) {

        HashMap<String, Object> map = new HashMap<>();

        map.put("customer_book_seq", num);

        bookService.deleteCustomerBook(map);

        return "redirect:/myBook";
    }

}
