package web;


import entity.Book;
import entity.Borrowingrecord;
import entity.Yonghu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import server.impl.UserServerImpl;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@Controller
public class BookController {

    @Autowired
    UserServerImpl userServerImpl;

    @RequestMapping(value = {"","main"})
    public String hello(Yonghu yonghu, Model model){
        model.addAttribute("account", yonghu);
        return "main";
    }

    @RequestMapping(value = "logining")
    public String logining(Yonghu yonghu, Model model, HttpSession session) throws IOException {
        yonghu = userServerImpl.getYonghu(yonghu);
        session.setAttribute("yonghu",yonghu);
        if (yonghu !=null){
            yonghu = userServerImpl.getBooks(yonghu);
            model.addAttribute("yonghu",yonghu);
            ArrayList<Borrowingrecord> records = userServerImpl.getRecord(yonghu.getId());
            model.addAttribute("records",records);
            System.out.println(yonghu);
            System.out.println(records.size());
            for (Borrowingrecord record:records){
                System.out.println(record);
            }
            return "mymain";
        }
        else {
            System.out.println("账号或密码错误！");
        }

        return "error";
    }

    @RequestMapping("regist")
    public String regist(Yonghu yonghu, Model model){
        model.addAttribute("yonghu", yonghu);
        System.out.println(yonghu);
        userServerImpl.addYonghu(yonghu);
        return "ressuccess";
    }

    @RequestMapping("search")
    public String search(String search, Model model, HttpSession session){
        Yonghu yonghu = new Yonghu();
        if (session.getAttribute("yonghu") != null){
            yonghu = (Yonghu) session.getAttribute("yonghu");
        }else {
            yonghu.setId("0");
        }
        model.addAttribute("yonghu",yonghu);
        if (search!=null){
//            System.out.println("去除空格");
            search = search.trim();
        }
        System.out.println(search);
        ArrayList<Book> books = new ArrayList<>();
        if (search==null || search.equals("")){
            System.out.println(1);
            books = userServerImpl.getAll();
        }else {
            System.out.println(2);
            books = userServerImpl.searchAll(search);
        }
        model.addAttribute("books",books);
        System.out.println(books.size());
        return "search";
    }

    @RequestMapping("search2")
    @ResponseBody
    public ArrayList<Book> search2(String search,Model model){
        if (search!=null){
//            System.out.println("去除空格");
            search = search.trim();
        }
        System.out.println(search);
        ArrayList<Book> books = new ArrayList<>();
        if (search==null || search.equals("")){
            System.out.println(1);
            books = userServerImpl.getAll();
        }else {
            System.out.println(2);
            books = userServerImpl.searchAll(search);
        }

        System.out.println(books.size());

        return books;
    }
}
