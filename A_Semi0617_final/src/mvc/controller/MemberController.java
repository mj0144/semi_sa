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

		if (result == true) { // �α��� ����
			System.out.println("login() logging is running ");
			mav = mainservice.main1(session);
//			mav.setViewName("index");
//			mav.addObject("msg", "success");

		} else { // �α��� ����
			try {
				session.invalidate(); //�����ص� session�� �����־ ��� ����.
			} catch (Exception e) {
				e.printStackTrace();
			} finally {

				mav.setViewName("login");
				mav.addObject("msg", "failure");

			}
		}
		return mav;

	}

	// �α׾ƿ�ó��
	@RequestMapping(value = "/logoutdo")
	public ModelAndView logout(HttpSession session) {
		memberService.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login");
		mav.addObject("msg", "logout");
		return mav;
	}

	// ȸ������
	@RequestMapping(value = "/join")
	public ModelAndView join(MemberVO vo) {
		ModelAndView m = new ModelAndView("index");

		vo = memberService.yunYeon(vo); // ������� ����.

		String ilju = memberDao.ilju(vo);
		vo.setIlju(ilju);

		int res = memberDao.join(vo);

		if (res == 1) {
			m.setViewName("singinprofile"); // ������ �Է��� �������� �̵�.
			int user_num = memberDao.userNumber(vo); // �������������� user_num�ʿ�.
			m.addObject("user_num", user_num);
			return m;
		}
		System.out.println("insert ����");
		m.setViewName("signin");
		m.addObject("check", res); // 0�� ��.
		return m;
	}

	// ���̵� �ߺ�Ȯ��
	@RequestMapping("/idchk")
	@ResponseBody
	public int idChk(String id) {
		System.out.println(id);

		int res = memberDao.idChk(id);

		return res;

	}

	// ���� �ߺ�Ȯ��.
	@RequestMapping("/nickchk")
	@ResponseBody
	public int nickChk(String nickname) {
		System.out.println(nickname);
		int res = memberDao.nickChk(nickname);
		System.out.println("����üũ : " + res);
		return res;

	}

//�̸��� �ߺ�Ȯ��.
	@RequestMapping("/emailchk")
	@ResponseBody
	public int emailchk(String email) {
		System.out.println(email);
		int res = memberDao.emailChk(email);
		System.out.println("�̸���üũ : " + res);
		return res;

	}

	// ���Խ� ������ �ۼ��� ������
	@RequestMapping("/joinprofile")
	public String joinProfile(MemberVO vo, HttpServletRequest request, MultipartFile file) {
		System.out.println("���� �ѹ� : " + vo.getUser_num());
		vo.setUser_img(imgUtils.imgSave(request, file, "in", null)); // ���� ����.

		if (vo.getUser_intro().equals(null)) { // �ڱ�Ұ��� �Է����� �ʾ�����, �⺻�� �־��ֱ�.
			vo.setUser_intro("�ڱ�Ұ��� �Է����ּ���");
		}
		memberDao.joinprofile(vo);

		return "login";

	}

}
