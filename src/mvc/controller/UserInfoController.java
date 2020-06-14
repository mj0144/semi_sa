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
	

	
	
	//ȸ�������� �̵� �� ���� ���� ���.
	@RequestMapping("/infochangepage")
	public ModelAndView pageChange(HttpSession session) {
		ModelAndView mav = new ModelAndView("userInfoChange");

		MemberVO vo = new MemberVO();
		vo = userInfoDao.info((int)session.getAttribute("user_num"));
		
		mav.addObject("vo", vo);
		
		return mav;
	}
	

	//ȸ������ ����.
	@RequestMapping("/infochange")
	public ModelAndView infoChange(HttpSession session, MemberVO vo, HttpServletRequest request, MultipartFile file) {
		ModelAndView mav = new ModelAndView("mypage");
		MemberService iljusetting = new MemberService();

		vo.setUser_img(imgUtils.imgSave(request, file)); //���� ����.
		vo.setUser_num((int)session.getAttribute("user_num"));
		//���� ����.
		iljusetting.yunYeon(vo); 
		
		try {
			userInfoDao.infoUpdate(vo);
		} catch (Exception e) {
			System.out.println("db����");	//db���� ��, ���ε��� ���� ����.
			imgUtils.deleteimg();
		}
		
		//�ٲﰪ���� ���� ������Ʈ.
		session.setAttribute("name", vo.getName());
		session.setAttribute("user_ilju", vo.getIlju());
		session.setAttribute("gender", vo.getSex());
		session.setAttribute("user_img", vo.getUser_img());
				
		mav.addObject("member", vo);
			
		return mav;
	}
	
	

	
}
