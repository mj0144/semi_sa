package mvc.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mvc.api.APIExamFace;
import mvc.dao.JoinDao;
import mvc.dao.UserInfoDao;
import mvc.vo.IdealVO;
import mvc.vo.MemberVO;

//���̹� ���ν� API ���� ( ����, ���� )
@Service
public class LookLikeService {

   @Autowired
   private APIExamFace apiExamFace;
   
   @Autowired
   private UserInfoDao userinfodao;
   
   @Autowired
   private JoinDao joinDao;
   
   public void insertLooklike(String images, MemberVO vo,IdealVO ivo) {
	      
	      Map<String, Object> map = apiExamFace.face(images);
	      System.out.println("�ƴ�?");
	      System.out.println(vo.getUser_id());
	      int user_num = joinDao.user_num(vo.getUser_id());
	      map.put("user_num", user_num);
	      System.out.println("����MAP:" + map);
	      //System.out.println(vo.getUser_img());

	      joinDao.looklike(map);
	   }

   public void updateLooklike(HttpSession session,String image, MemberVO vo) {
	   int user_num =(int) session.getAttribute("user_num");
	    Map<String, Object> map = apiExamFace.face(image);
	    map.put("user_num", user_num);
	    userinfodao.looklike(map);
	    
	    System.out.println("����MAP:" + map);
	      System.out.println(vo.getUser_img());

   }

}