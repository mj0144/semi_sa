package mvc.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mvc.dao.MemberDao;
import mvc.vo.MemberVO;

@Controller
public class MemberController {

	@Autowired
	MemberDao memberDao;

	@RequestMapping(value = "/join")
	public ModelAndView join(MemberVO vo) {
		ModelAndView m = new ModelAndView("index");

		/*
		 * if (vo.getInfo_hh() == 23 && vo.getInfo_mm() > 30) { // ��? ���� year%4===0 &&
		 * year%100!=0||year%400 ==0 // �̹��ذ� �H�����ڳ�?
		 * 
		 * // 1. �����̰� 28�� �̸� 29�Ϸΰ���, // �����̰� 29�̸� ���� 3���� �ٲ�� �ϵ� 1�� �ٲ�� // 2. 1 3 5 7 8
		 * 10 12 -> 31�� // 4 6 9 11 -> 30��. if(vo.getInfo_day() >= 30) { switch
		 * (vo.getInfo_mon()) { case 1: case 3: case 5: case 7: case 8: case 10:
		 * vo.setInfo_mon(vo.getInfo_mon()+1); vo.setInfo_day(1); break; case 4: case 6:
		 * case 9: case 11: vo.setInfo_day(vo.getInfo_day()+1);
		 * 
		 * break;
		 * 
		 * default: break; } } if (vo.getInfo_day()) vo.setInfo_day(vo.getInfo_day() +
		 * 1);
		 * 
		 * }
		 */
		int res = memberDao.join(vo);
		if (res == 1) {
			m.setViewName("login");
			m.addObject("check", res); // 1�� ��
			return m;
		}
		m.setViewName("login");
		m.addObject("check", res); // 0�� ��.
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
