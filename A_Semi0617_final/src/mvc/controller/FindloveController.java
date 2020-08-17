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

	// 네이버 얼굴인식 API 예제 ( 성현, 수연 )
	@RequestMapping(value = "/lovesearch")
	public String lovelist(LoveTypeVO vo, Model model, HttpSession session,
			@RequestParam(value = "num", required = false, defaultValue = "1") int num) throws Exception {

		// 사용자 번호 세션으로 받아옴
		int user_num = (int) session.getAttribute("user_num");

		// 유저가 차단한 사람 목록 가져오기
		List<Integer> blist = blockDao.blockList(user_num);

		// 유저가 좋아요 누른 사람 리스트 가져오기
		List<LikeVO> listheart = likeDao.likeornot(user_num);

		List<MemberVO> lovelist = looklikeDao.lovelist(vo);

		// 현재 db에 저장된 값 중 가장 큰 값을 가져옴.
		int maxNum = pagelistDao.getaMaxnum(user_num);

		// 유저 성별 가져오기
		char sex2 = (char) session.getAttribute("gender");
		String sex3 = String.valueOf(sex2);

		// 추천인 뽑기 위한 파라미터 hashmap
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("user_num", user_num);
		map.put("sex2", sex3);
		map.put("blist", blist);
		map.put("num", num);

		// 추천인 정보 넣을 HashMap 생성
		HashMap<String, Object> profile = null;
		;

		// 추천인 번호를 넣을 int 변수 생성
		int user_num2 = 0;

		// 새로운 랜덤 추천을 할 경우
		if (num > maxNum) {

			System.out.println("랜덤 추천인 뽑기");

			// 추천인 랜덤으로 뽑기
			profile = pagelistDao.getRProfile(map);

			// 랜덤으로 출력된 추천인 DB에 저장
			HashMap<String, Object> map2 = new HashMap<String, Object>();

			user_num2 = ((BigDecimal) profile.get("USER_NUM")).intValue();

			map2.put("num", num);
			map2.put("user_num", user_num);
			map2.put("rec_num", user_num2);
			pagelistDao.setRecInsert(map2);

		} else if (num <= maxNum) { // 이전 추천 목록을 가져올 경우

			System.out.println("이전 추천인 가져오기");

			// 이전 추천인 가져오기
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
