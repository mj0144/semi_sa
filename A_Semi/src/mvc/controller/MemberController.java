package mvc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import mvc.dao.MemberDao;
import mvc.vo.MemberVO;

@Controller
public class MemberController {
   
      @Autowired
      private MemberDao memberDao;
      
      @RequestMapping(value = "/logindo")
      public String login(HttpSession session, MemberVO vo) {
         MemberVO v = memberDao.logindo(vo);
         
         String urlPah ="";
         if(v.getCnt()  ==  1 ) { //�α���
            session.setAttribute("user_num", v.getUser_num());
            System.out.println("session����: "+session.getAttribute("user_num"));
            
             urlPah ="redirect:index";
         }else {// �߸�
             urlPah ="redirect:error";
         }
         return urlPah;
      }
      
      
      @RequestMapping(value="/error")
      public String loginerr(Model m) {
         m.addAttribute("msg", "������");
         return "login/error";
      }
   }




