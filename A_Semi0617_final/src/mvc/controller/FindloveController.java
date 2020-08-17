package mvc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mvc.dao.BlockDao;
import mvc.dao.LikeDao;
import mvc.dao.LooklikeDao;
import mvc.vo.LikeVO;
import mvc.vo.LoveTypeVO;
import mvc.vo.MemberVO;

@Controller
public class FindloveController {
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

	// ���̹� ���ν� API��� �̻��� ��õ ( ����, ���� )
	@RequestMapping(value = "/lovesearch")
	public String lovelist(LoveTypeVO vo, Model model, HttpSession session
			) throws Exception {

		// ����� ��ȣ �������� �޾ƿ�
		int user_num = (int) session.getAttribute("user_num");

		// ������ ������ ��� ��� ��������
		List<Integer> blist = blockDao.blockList(user_num);

		// ������ ���ƿ� ���� ��� ����Ʈ ��������
		List<LikeVO> listheart = likeDao.likeornot(user_num);
		
		MemberVO lovelist = looklikeDao.lovelist(vo);
		int num = lovelist.getUser_num();
		System.out.println("wdwadwadawdawdw:"+num);
		String percent = looklikeDao.percent(num);
		
		model.addAttribute("lovelist", lovelist);
		model.addAttribute("percent", percent);
		model.addAttribute("heart", listheart);
		model.addAttribute("blist", blist);

		return "findlove2";

	}

}
