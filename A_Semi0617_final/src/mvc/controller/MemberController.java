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

import mvc.dao.MemberDao;
import mvc.resources.SNSLogin;
import mvc.resources.SnsValue;
import mvc.service.MailService;
import mvc.service.MainSerivce;
import mvc.service.MemberService;
import mvc.utils.ImgUtils;
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

	@Autowired
	ImgUtils imgUtils;

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
				session.invalidate(); //실패해도 session이 남아있어서 모두 제거.
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

	// 회원가입
	@RequestMapping(value = "/join")
	public ModelAndView join(MemberVO vo) {
		ModelAndView m = new ModelAndView("index");

		vo = memberService.yunYeon(vo); // 생년월일 가공.

		String ilju = memberDao.ilju(vo);
		vo.setIlju(ilju);

		int res = memberDao.join(vo);

		if (res == 1) {
			m.setViewName("singinprofile"); // 프로필 입력할 페이지로 이동.
			int user_num = memberDao.userNumber(vo); // 다음페이지에서 user_num필요.
			m.addObject("user_num", user_num);
			return m;
		}
		System.out.println("insert 오류");
		m.setViewName("signin");
		m.addObject("check", res); // 0일 때.
		return m;
	}

	// 아이디 중복확인
	@RequestMapping("/idchk")
	@ResponseBody
	public int idChk(String id) {
		System.out.println(id);

		int res = memberDao.idChk(id);

		return res;

	}

	// 별명 중복확인.
	@RequestMapping("/nickchk")
	@ResponseBody
	public int nickChk(String nickname) {
		System.out.println(nickname);
		int res = memberDao.nickChk(nickname);
		System.out.println("별명체크 : " + res);
		return res;

	}

//이메일 중복확인.
	@RequestMapping("/emailchk")
	@ResponseBody
	public int emailchk(String email) {
		System.out.println(email);
		int res = memberDao.emailChk(email);
		System.out.println("이메일체크 : " + res);
		return res;

	}

	// 가입시 프로필 작성한 데이터
	@RequestMapping("/joinprofile")
	public String joinProfile(MemberVO vo, HttpServletRequest request, MultipartFile file) {
		System.out.println("유저 넘버 : " + vo.getUser_num());
		vo.setUser_img(imgUtils.imgSave(request, file, "in", null)); // 파일 저장.

		if (vo.getUser_intro().equals(null)) { // 자기소개를 입력하지 않았으면, 기본값 넣어주기.
			vo.setUser_intro("자기소개를 입력해주세요");
		}
		memberDao.joinprofile(vo);

		return "login";

	}

}
