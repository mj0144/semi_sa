package mvc.controller;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import mvc.dao.BlockDao;
import mvc.dao.LikeDao;
import mvc.dao.LooklikeDao;
import mvc.dao.PageListDao;
import mvc.service.LookLikeService;
import mvc.vo.LikeVO;
import mvc.vo.LoveTypeVO;
import mvc.vo.MemberVO;

@Controller
public class FindloveController {
	@Autowired
	private PageListDao pagelistDao;

	@Autowired
	private LikeDao likeDao;

	@Autowired
	private BlockDao blockDao;

	@Autowired
	private LooklikeDao looklikeDao;

	@RequestMapping(value = "/looklike")
	   public ModelAndView looklike(HttpSession session) throws Exception{
	      ModelAndView mav = new ModelAndView();
	      mav.setViewName("looklike");
	      return mav;
	   }
	
	@RequestMapping(value = "/findlove")
	public ModelAndView findlove(HttpSession session) throws Exception {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("findlove");

		return mav;

	}

	// ���̹� ���ν� API ���� ( ����, ���� )
	@RequestMapping(value = "/lovesearch")
	public String lovelist(LoveTypeVO vo, Model model, HttpSession session,
			@RequestParam(value = "num", required = false, defaultValue = "1") int num) throws Exception {

		// ����� ��ȣ �������� �޾ƿ�
		int user_num = (int) session.getAttribute("user_num");

		// ������ ������ ��� ��� ��������
		List<Integer> blist = blockDao.blockList(user_num);

		// ������ ���ƿ� ���� ��� ����Ʈ ��������
		List<LikeVO> listheart = likeDao.likeornot(user_num);

		List<MemberVO> lovelist = looklikeDao.lovelist(vo);

		// ���� db�� ����� �� �� ���� ū ���� ������.
		int maxNum = pagelistDao.getaMaxnum(user_num);

		// ���� ���� ��������
		char sex2 = (char) session.getAttribute("gender");
		String sex3 = String.valueOf(sex2);

		// ��õ�� �̱� ���� �Ķ���� hashmap
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("user_num", user_num);
		map.put("sex2", sex3);
		map.put("blist", blist);
		map.put("num", num);

		// ��õ�� ���� ���� HashMap ����
		HashMap<String, Object> profile = null;
		;

		// ��õ�� ��ȣ�� ���� int ���� ����
		int user_num2 = 0;

		// ���ο� ���� ��õ�� �� ���
		if (num > maxNum) {

			System.out.println("���� ��õ�� �̱�");

			// ��õ�� �������� �̱�
			profile = pagelistDao.getRProfile(map);

			// �������� ��µ� ��õ�� DB�� ����
			HashMap<String, Object> map2 = new HashMap<String, Object>();

			user_num2 = ((BigDecimal) profile.get("USER_NUM")).intValue();

			map2.put("num", num);
			map2.put("user_num", user_num);
			map2.put("rec_num", user_num2);
			pagelistDao.setRecInsert(map2);

		} else if (num <= maxNum) { // ���� ��õ ����� ������ ���

			System.out.println("���� ��õ�� ��������");

			// ���� ��õ�� ��������
			profile = pagelistDao.getReProfile(map);
			System.out.println(profile);

			user_num2 = ((BigDecimal) profile.get("USER_NUM")).intValue();

		}

		model.addAttribute("lovelist", lovelist);
		model.addAttribute("heart", listheart);
		model.addAttribute("profile", profile);
		model.addAttribute("set", map);
		model.addAttribute("num", num);

		return "findlove2";

	}

}
