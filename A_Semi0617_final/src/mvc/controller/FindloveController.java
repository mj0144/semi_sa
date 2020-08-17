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

	// 네이버 얼굴인식 API기반 이상형 추천 ( 성현, 수연 )
	@RequestMapping(value = "/lovesearch")
	public String lovelist(LoveTypeVO vo, Model model, HttpSession session
			) throws Exception {

		// 사용자 번호 세션으로 받아옴
		int user_num = (int) session.getAttribute("user_num");

		// 유저가 차단한 사람 목록 가져오기
		List<Integer> blist = blockDao.blockList(user_num);

		// 유저가 좋아요 누른 사람 리스트 가져오기
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
