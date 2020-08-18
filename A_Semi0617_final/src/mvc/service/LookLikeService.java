package mvc.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import mvc.api.APIExamFace;
import mvc.dao.JoinDao;
import mvc.dao.UserInfoDao;
import mvc.utils.ImgUtils;
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
   
   @Autowired
	private ImgUtils imgUtils;
   
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
	   System.out.println("��������?"+user_num);
	    Map<String, Object> map = apiExamFace.face(image);
	    map.put("user_num", user_num);
	    userinfodao.looklike(map);
	    
	    System.out.println("����MAP:" + map);
	      System.out.println(vo.getUser_img());

   }
   
   public void findface(HttpSession session, HttpServletRequest request, MultipartFile file,MemberVO vo) {
	   
	   
	   System.out.println("���񽺿Ӵ�?");
	   //String img = (String) session.getAttribute("user_img");
	   String img = request.getParameter("file");
	   System.out.println("�̹����Ӵ�?"+img);
		vo.setUser_img(imgUtils.imgSave(request, file, "change", img)); // ���� ����.
		System.out.println("vo������ƴ�?"+vo.getUser_img());
		String new_img = imgUtils.root_path(request, vo.getUser_img());
		System.out.println("new_img:"+new_img);
		session.setAttribute("user_img", vo.getUser_img());
		updateLooklike(session,new_img, vo);
   }

}