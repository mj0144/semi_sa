package mvc.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import mvc.api.APIExamFace;
import mvc.dao.JoinDao;
import mvc.dao.LooklikeDao;
import mvc.dao.UserInfoDao;
import mvc.utils.ImgUtils;
import mvc.vo.IdealVO;
import mvc.vo.MemberVO;

//네이버 얼굴인식 API 예제 ( 성현, 수연 )
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
   
   @Autowired
   	private LooklikeDao looklikedao;
   public boolean insertLooklike(String images, MemberVO vo,IdealVO ivo) {
       
       Map<String, Object> map = apiExamFace.face(images);
       System.out.println(vo.getUser_id());
       int user_num = joinDao.user_num(vo.getUser_id());
       map.put("user_num", user_num);
       //System.out.println(vo.getUser_img());
       if (map.containsKey("looklike")) {
       joinDao.looklike(map);
       return true;
    }else {
       return false;
    }
       
    }

   public boolean updateLooklike(HttpSession session,String image, MemberVO vo) {
	   int user_num =(int) session.getAttribute("user_num");
	    Map<String, Object> map = apiExamFace.face(image);
	    map.put("user_num", user_num);
	    if (map.containsKey("looklike")) {
	    	userinfodao.looklike(map);
	        return true;
	     }else {
	        return false;
	     }
	    
	    
   }
   
   
   public void findface(HttpSession session, HttpServletRequest request, MultipartFile file,MemberVO vo) {
	   
	   
	   System.out.println("서비스왓니?");
	   //String img = (String) session.getAttribute("user_img");
	   String img = request.getParameter("file");
	   System.out.println("이미지왓니?"+img);
		vo.setUser_img(imgUtils.imgSave(request, file, "change", img)); // 파일 저장.
		System.out.println("vo에저장됐니?"+vo.getUser_img());
		String new_img = imgUtils.root_path(request, vo.getUser_img());
		System.out.println("new_img:"+new_img);
		//session.setAttribute("user_img", vo.getUser_img());
		//updatephoto(session,request,new_img, vo);
   }

}