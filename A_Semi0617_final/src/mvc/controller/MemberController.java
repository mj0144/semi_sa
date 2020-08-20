package mvc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import mvc.service.MainService;
import mvc.service.MemberService;
import mvc.vo.MemberVO;

@Controller
public class MemberController {


	@Autowired
	private MemberService memberService;

	@Autowired
	MainService mainService;


	@RequestMapping(value = "/logindo")
	public String login(@ModelAttribute MemberVO vo, HttpSession session, RedirectAttributes ra) {
		boolean result = memberService.loginCheck(vo, session);
		String redirect ="";
	
		if (result == true) { // �α��� ����
			redirect = "redirect:/index";
		} else { // �α��� ����
			try {
				session.invalidate(); // �����ص� session�� �����־ ��� ����.
				ra.addAttribute("msg", "failure");
				return "redirect:/";
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}
		
		return redirect;
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


}
