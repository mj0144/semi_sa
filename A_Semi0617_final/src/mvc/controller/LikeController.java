package mvc.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mvc.dao.LikeDao;
import mvc.service.LikeService;
import mvc.vo.LikeVO;
import mvc.vo.MemberVO;

@Controller
public class LikeController {

   @Autowired
   private LikeDao likeDao;

   @ResponseBody   
   @RequestMapping("/likeox")
   public void likeox(String like, int liked_user, int user_num ) {
         

      LikeVO likevo = new LikeVO();
      likevo.setUser_num(user_num);
      likevo.setLiked_user(liked_user);
      System.out.println("like : " + like);

      
      if (like.equals("true")) {
         //여기서 매퍼를 insert 문으로 갖고 와야하고
         likeDao.likePush(likevo);
      }else if (like.equals("false")) {
         //여기서 delete 로 삭제
         likeDao.likeCancel(likevo);
      } 
   }
}