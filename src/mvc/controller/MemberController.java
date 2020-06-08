package mvc.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mvc.dao.MemberDao;
import mvc.service.MemberService;
import mvc.vo.MemberVO;

@Controller
public class MemberController {

	@Autowired
	private MemberDao memberDao;
	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/join")
	public ModelAndView join(MemberVO vo) {
		ModelAndView m = new ModelAndView("index");
		vo = memberService.yunYeon(vo); //생년월일 가공.

		String ilju= memberDao.ilju(vo);
		vo.setIlju(ilju);
				
		int res = memberDao.join(vo);
		
		if (res == 1) {
			m.setViewName("login");
			m.addObject("check", res); // 1일 때
			return m;
		}
		m.setViewName("login");
		m.addObject("check", res); // 0일 때.
		return m;
	}

	@RequestMapping("/idchk")
	@ResponseBody
	public int idChk(String id) {
		System.out.println(id);

		int res = memberDao.idchk(id);

		return res;

	}

	@RequestMapping("/nickchk")
	@ResponseBody
	public int nickChk(String nickname) {

		int res = memberDao.nickchk(nickname);

		return res;

	}

}
