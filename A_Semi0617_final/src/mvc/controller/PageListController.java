package mvc.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import mvc.dao.BlockDao;
import mvc.dao.LikeDao;
import mvc.dao.PageListDao;
import mvc.vo.LikeVO;


//이동현
@Controller
public class PageListController {
	
	@Autowired
	private PageListDao pagelistDao;
	
	@Autowired
	private LikeDao likeDao;
	
	@Autowired
	private BlockDao blockDao;

	//리스트 뽑기
	@RequestMapping(value= "/listWhole")
	public String listWhole3(Model model, HttpSession session, 
			@RequestParam(value = "sex", required = false, defaultValue = "m,f,a") String sex,
			@RequestParam(value = "samb", required = false, defaultValue = "all") String samb,
			@RequestParam(value = "num", required = false, defaultValue = "1") int num) {
		
		//사용자 번호 세션으로 받아옴
		int user_num=(int)session.getAttribute("user_num");	
		
		// 성별 값이 male, female 이 동시에 들어올 때 null값으로 처리
		if (sex.length() > 1) {
			sex = null;
		}
		
		// 유저가 차단한 사람 목록 가져오기
		List<Integer> blist = blockDao.blockList(user_num);
		
		// 유저가 좋아요 누른 사람 리스트 가져오기
		List<LikeVO> listheart = likeDao.likeornot(user_num);
		
		//현재 db에 저장된 값 중 가장 큰 값을 가져옴.
		int maxNum = pagelistDao.getaMaxnum(user_num);
		
		// 유저 성별 가져오기
		char sex2 = (char) session.getAttribute("gender");
		String sex3 = String.valueOf(sex2);
		
		//추천인 뽑기 위한 파라미터 hashmap
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("user_num", user_num);
		map.put("sex2", sex3);
		map.put("blist", blist);
		map.put("sex", sex);
		map.put("samb", samb);
		map.put("num", num);
		
		//추천인 정보 넣을 HashMap 생성
		HashMap<String, Object> profile = null;;
		
		//추천인 번호를 넣을 int 변수 생성
		int user_num2=0;
		
		// 새로운 랜덤 추천을 할 경우
		if (num > maxNum) {
			
			System.out.println("랜덤 추천인 뽑기");
			
			// 추천인 랜덤으로 뽑기
			profile = pagelistDao.getRProfile(map);
			
			// 랜덤으로 출력된 추천인 DB에 저장
			HashMap<String, Object> map2 = new HashMap<String, Object>();
			
			user_num2 = ((BigDecimal)profile.get("USER_NUM")).intValue();
			
			map2.put("num", num);
			map2.put("user_num", user_num);
			map2.put("rec_num", user_num2);
			pagelistDao.setRecInsert(map2);
			
		}else if (num <= maxNum) { // 이전 추천 목록을 가져올 경우
			
			System.out.println("이전 추천인 가져오기");
			
			//이전 추천인 가져오기
			profile = pagelistDao.getReProfile(map);
			System.out.println(profile);
			
			user_num2 = ((BigDecimal)profile.get("USER_NUM")).intValue();
		
		}
		
		
		// 추천인 사주 가져오기
		HashMap<String, Object> ilju = pagelistDao.getilju(user_num2);
		
		// 추천인 MBTI 가져오기
		HashMap<String, Object> mbti = pagelistDao.getmbti(user_num2);

		// 90점 이상인 사람이 전체에서 몇 퍼센트인지 가져오기
		int over90 = pagelistDao.getover90(map);
		
		model.addAttribute("heart", listheart);
		model.addAttribute("profile", profile);
		model.addAttribute("ilju", ilju);
		model.addAttribute("mbti", mbti); 
		model.addAttribute("over90", over90);
		model.addAttribute("set", map);
		model.addAttribute("num", num);
		
		return "dailyRecommand";
		
	}
	
	//체크박스로 조건을 변경할 경우
	@RequestMapping(value = "/listchk")
	public String listChk(RedirectAttributes rd, HttpSession session, String sex, String samb) {
		
		int user_num = (int) session.getAttribute("user_num");
		int num = pagelistDao.getaMaxnum(user_num)+1;
		
		System.out.println(num);
		
		rd.addAttribute("sex", sex);
		rd.addAttribute("samb", samb);
		rd.addAttribute("num", num);
		
		return "redirect:listWhole";		
	}
	
	
	//사주 모달 뽑기
	@RequestMapping(value = "/sajumodal", method = RequestMethod.GET)
	public ModelAndView sajumodal(int user_num) {
		
		System.out.println(user_num);
		ModelAndView mav = new ModelAndView("sajumodal");
		
		HashMap<String,Object> map = pagelistDao.getilju(user_num);
		
		mav.addObject("result", map);
		
		return mav;
		
	}
	
	//mbti모달 가져오기
	@RequestMapping(value = "/mbtimodal", method = RequestMethod.GET)
	public ModelAndView mbtimodal(int user_num) {
		
		System.out.println("mbti"+user_num);
		ModelAndView mav = new ModelAndView("mbtimodal");
		
		HashMap<String,Object> map = pagelistDao.getmbti(user_num);
		
		mav.addObject("result", map);
		
		return mav;
		
	}
	

	

}
