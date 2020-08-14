package mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import mvc.dao.LikeDao;
import mvc.vo.LikeVO;

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
         //���⼭ ���۸� insert ������ ���� �;��ϰ�
         likeDao.likePush(likevo);
      }else if (like.equals("false")) {
         //���⼭ delete �� ����
         likeDao.likeCancel(likevo);
      } 
   }
}