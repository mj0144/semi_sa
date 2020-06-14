package mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import mvc.dao.UserInfoDao;
import mvc.service.MemberService;
import mvc.utils.ImgUtils;
import mvc.vo.MemberVO;

@Controller
public class UserInfoController {

	@Autowired
	private UserInfoDao userInfoDao;
	
	@Autowired
	private ImgUtils imgUtils;
	

	
	
	//회원페이지 이동 및 원래 정보 출력.
	@RequestMapping("/infochangepage")
	public ModelAndView pageChange(HttpSession session) {
		ModelAndView mav = new ModelAndView("userInfoChange");

		MemberVO vo = new MemberVO();
		vo = userInfoDao.info((int)session.getAttribute("user_num"));
		
		mav.addObject("vo", vo);
		
		return mav;
	}
	

	//회원정보 수정.
	@RequestMapping("/infochange")
	public ModelAndView infoChange(HttpSession session, MemberVO vo, HttpServletRequest request, MultipartFile file) {
		ModelAndView mav = new ModelAndView("mypage");
		MemberService iljusetting = new MemberService();

		vo.setUser_img(imgUtils.imgSave(request, file)); //파일 저장.
		vo.setUser_num((int)session.getAttribute("user_num"));
		//일주 세팅.
		iljusetting.yunYeon(vo); 
		
		try {
			userInfoDao.infoUpdate(vo);
		} catch (Exception e) {
			System.out.println("db오류");	//db오류 시, 업로드한 파일 삭제.
			imgUtils.deleteimg();
		}
		
		//바뀐값으로 세션 업데이트.
		session.setAttribute("name", vo.getName());
		session.setAttribute("user_ilju", vo.getIlju());
		session.setAttribute("gender", vo.getSex());
		session.setAttribute("user_img", vo.getUser_img());
				
		mav.addObject("member", vo);
			
		return mav;
	}
	
	

	
}
