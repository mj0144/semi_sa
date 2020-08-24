package mvc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mvc.dao.FriendDao;
import mvc.dao.ProfileDao;
import mvc.service.BoardService;
import mvc.service.FriendService;
import mvc.vo.BoardVO;
import mvc.vo.IljuVO;
import mvc.vo.LikeVO;
import mvc.vo.MemberVO;

@Controller
public class FriendController {

	@Autowired
	private FriendDao friendDao;
	
	@Autowired
	private ProfileDao profileDao;

	@RequestMapping(value = "/friend")
	public ModelAndView friendprofile(HttpSession session, int user_num) throws Exception { 
		
		ModelAndView mav = new ModelAndView("friend");
		IljuVO ilvo = friendDao.friendprofile(user_num); 
		MemberVO vo = ilvo.getMem().get(0);

		//follow modal
		//follower list
	      List<HashMap<String, Object>> follower = profileDao.followerlist(user_num);
	      System.out.println(follower);
	      
	      //follow list      
	      List<HashMap<String, Object>> follow = profileDao.followlist(user_num);
	      System.out.println(follow);
		
		
		int like_cnt = friendDao.friendlike(user_num); 
		int liked_cnt = friendDao.friendliked(user_num);

		List<BoardVO> blist= friendDao.board_info(user_num); 
		int board_cnt = blist.size(); 
		
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("board_writer", user_num);
		map.put("user_num", (int) session.getAttribute("user_num"));

		int heartchk = friendDao.heartChk(map); 
		if (heartchk > 0) {
			heartchk = 1;
		} else {
			heartchk = 0;
		}
		
		int blockchk = friendDao.blockChk(map);

		mav.addObject("blist", blist);
		mav.addObject("membervo", vo);
		mav.addObject("board_cnt", board_cnt);
		mav.addObject("like_cnt", like_cnt);
		mav.addObject("liked_cnt", liked_cnt);
		mav.addObject("board_writer", user_num); 
		mav.addObject("heartchk", heartchk);
		mav.addObject("blockchk", blockchk);
		mav.addObject("follower", follower);
	    mav.addObject("follow", follow);
		mav.addObject("user_num", (int) session.getAttribute("user_num"));

		return mav;
	}
	
	
		// 유저 신고 ( 수연 )
		 @RequestMapping(value = "/reportUser", method = RequestMethod.POST) 
		 public String reportComment(HttpSession session, String friend_num, String report_comment, HttpServletRequest request) throws Exception { 
			 int user_num = (int) session.getAttribute("user_num");
			 String user_id = (String) session.getAttribute("user_id");
			 int report_user_num = Integer.parseInt(friend_num);
			 HashMap<String, Object> map = new HashMap<String, Object>();
			 map.put("user_num", user_num);
			 map.put("report_user_num", report_user_num);
			 map.put("reason", report_comment);
			 map.put("user_id", user_id);
			 friendDao.reportUser(map);
			 String referer = request.getHeader("Referer");
			 return "redirect:"+ referer;
		}
		

	

}
