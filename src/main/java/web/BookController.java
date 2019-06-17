package web;


import entity.Yonghu;
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
    public String hello(Yonghu yonghu, Model model){
        model.addAttribute("account", yonghu);
        return "main";
    }

    @RequestMapping(value = "logining")
    public String logining(Yonghu yonghu, Model model){
        yonghu = userServerImpl.getYonghu(yonghu);
        if (yonghu !=null){
            System.out.println(yonghu);
            model.addAttribute("time","10:30");
            return "success";
        }
        else {
            System.out.println("账号或密码错误！");
        }

        return "error";
    }

    @RequestMapping("regist")
    public String regist(Yonghu yonghu, Model model){
        model.addAttribute("account", yonghu);
        return "login";
    }
}
