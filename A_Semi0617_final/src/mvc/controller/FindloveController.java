package mvc.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import mvc.dao.BlockDao;
import mvc.dao.LikeDao;
import mvc.dao.LooklikeDao;
import mvc.jsoup.ImageCrawling;
import mvc.service.LookLikeService;
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

	@Autowired
	private LookLikeService looklikeService;

	@Autowired
	private ImageCrawling imagecrawling;
	   
	   
	   @RequestMapping(value = "/changeP", method = RequestMethod.POST)
	   public String changeP(MultipartFile file,HttpServletRequest request, HttpSession session, MemberVO vo) throws Exception {
	      looklikeService.findface(session, request, file, vo);
	      String referer = request.getHeader("Referer");
	        return "redirect:"+ referer;
	   }
	   
	   @RequestMapping(value = "/looklike")
	      public ModelAndView looklike(HttpSession session,HttpServletRequest request) throws Exception{
	         ModelAndView mav = new ModelAndView();
	         int user_num = (int)session.getAttribute("user_num");
	         HashMap<String, Object> mylist = looklikeDao.mylook(user_num);
	         
	         imagecrawling.imgage(mylist ,request);
	         
	         System.out.println(mylist);
	         mav.addObject("mylist", mylist);
	         mav.setViewName("looklike");
	         return mav;
	      }
	
	
	@RequestMapping(value = "/findlove")
	public ModelAndView findlove(HttpSession session) throws Exception {

		  // 사용자 번호 세션으로 받아옴
        int user_num = (int) session.getAttribute("user_num");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("findlove");

		return mav;

	}

	   // 네이버 얼굴인식 API기반 이상형 추천 ( 성현, 수연 )
	   @RequestMapping(value = "/lovesearch")
	   public String lovelist(LoveTypeVO vo, Model model, HttpSession session, String looklike,HttpServletResponse response,HttpServletRequest request
	         ) throws Exception {

	      //text입력한거 잘 왔는지 확인
	      System.out.println(looklike);
	      
	      // 사용자 번호 세션으로 받아옴
	      int user_num = (int) session.getAttribute("user_num");

	      // 유저가 차단한 사람 목록 가져오기
	      List<Integer> blist = blockDao.blockList(user_num);

	      // 유저가 좋아요 누른 사람 리스트 가져오기
	      List<LikeVO> listheart = likeDao.likeornot(user_num);
	      
	      List<String> nameList = looklikeDao.findname();
	      System.out.println("nameList"+nameList);
	      if (nameList.contains(looklike)) {
	         MemberVO lovelist = looklikeDao.lovelist(vo);
	         
	         int num = lovelist.getUser_num();
	         System.out.println("wdwadwadawdawdw:"+num);
	         String percent = looklikeDao.percent(num);
	         
	         model.addAttribute("lovelist", lovelist);
	         model.addAttribute("percent", percent);
	      }else {
	         response.setContentType("text/html; charset=UTF-8");
	         PrintWriter out =response.getWriter();
	         out.println("<script>alert('검색한 연예인을 닮은 유저가 없습니다.'); history.go(-1);</script>");
	         out.flush();
	      }
	      
	      model.addAttribute("heart", listheart);
	      model.addAttribute("blist", blist);

	      return "findlove2";   

	   }

}
