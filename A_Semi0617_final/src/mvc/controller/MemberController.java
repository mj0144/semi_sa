package mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import mvc.dao.JoinDao;
import mvc.dao.MemberDao;
import mvc.resources.SNSLogin;
import mvc.resources.SnsValue;
import mvc.service.JoinService;
import mvc.service.MailService;
import mvc.service.MainSerivce;
import mvc.service.MemberService;
import mvc.utils.ImgUtils;
import mvc.vo.IdealVO;
import mvc.vo.MemberVO;

@Controller
public class MemberController {

	@Autowired
	private MemberDao memberDao;

	@Autowired
	private MemberService memberService;

	@Autowired
	private MailService mailService;

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	MainSerivce mainservice;




	@RequestMapping(value = "/logindo")
	public ModelAndView login(@ModelAttribute MemberVO vo, HttpSession session) {
		boolean result = memberService.loginCheck(vo, session);
		ModelAndView mav = new ModelAndView();

		if (result == true) { // 로그인 성공
			System.out.println("login() logging is running ");
			mav = mainservice.main1(session);
//			mav.setViewName("index");
//			mav.addObject("msg", "success");

		} else { // 로그인 실패
			try {
				session.invalidate(); // 실패해도 session이 남아있어서 모두 제거.
			} catch (Exception e) {
				e.printStackTrace();
			} finally {

				mav.setViewName("login");
				mav.addObject("msg", "failure");

			}
		}
		return mav;

	}

	// 로그아웃처리
	@RequestMapping(value = "/logoutdo")
	public ModelAndView logout(HttpSession session) {
		memberService.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login");
		mav.addObject("msg", "logout");
		return mav;
	}


}
