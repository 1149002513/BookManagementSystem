package web;


import entity.Account;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import server.impl.UserServerImpl;

@Controller
public class BookController {

    @Autowired
    UserServerImpl userServerImpl;

    @RequestMapping(value = {"","main"})
    public String hello(Account account, Model model){
        model.addAttribute("account",account);
        return "main";
    }

    @RequestMapping(value = "logining")
    public String logining(Account account,Model model){
        account = userServerImpl.getAccount(account);
        if (account!=null){
            System.out.println(account);
            model.addAttribute("time","10:30");
            return "success";
        }
        else {
            System.out.println("账号或密码错误！");
        }

        return "error";
    }

    @RequestMapping("regist")
    public String regist(Account account,Model model){
        model.addAttribute("account",account);
        return "regist";
    }
}
