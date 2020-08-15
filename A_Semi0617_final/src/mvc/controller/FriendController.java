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

//	@Autowired
//	private FriendService friendservice;

	@RequestMapping(value = "/friend")
	public ModelAndView friendprofile(HttpSession session, int user_num) throws Exception { // user_num : �۾���.
		
		ModelAndView mav = new ModelAndView("friend");
		
		IljuVO ilvo = friendDao.friendprofile(user_num); // �۾����� ����.
		MemberVO vo = ilvo.getMem().get(0);

		
		
		int like_cnt = friendDao.friendlike(user_num); //// ���� ���ƿ並 ���� ���� ī��Ʈ
		int liked_cnt = friendDao.friendliked(user_num);// ���� ���ƿ� ������ ���� ī��Ʈ

		List<BoardVO> blist= friendDao.board_info(user_num); //�۾����� �Խñ� ����.
		int board_cnt = blist.size(); //�Խñ� ����.
		
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("board_writer", user_num);
		map.put("user_num", (int) session.getAttribute("user_num"));

		int heartchk = friendDao.heartChk(map); //���� �α����� ������ �۾��̸� ���ƿ��ߴ��� ����.
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
		mav.addObject("board_writer", user_num); // �۾���
		mav.addObject("heartchk", heartchk);
		mav.addObject("blockchk", blockchk);

		return mav;
	}
	
	//유저 신고
	
		 @RequestMapping(value = "/reportUser", method = RequestMethod.POST) 
		 public String reportComment(HttpSession session, String friend_num, String report_comment, HttpServletRequest request) throws Exception { 
			 System.out.println("유저신고컨트롤러인데..왓니?");
			 int user_num = (int) session.getAttribute("user_num");
			 System.out.println(user_num);
			 String user_id = (String) session.getAttribute("user_id");
			 System.out.println(user_id);
			 int report_user_num = Integer.parseInt(friend_num);
			 System.out.println(report_user_num);
			 System.out.println("파람 왓니"+user_num+"/+"+user_id+"/+"+report_user_num+"/+"+report_comment);
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
