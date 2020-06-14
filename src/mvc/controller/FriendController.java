package mvc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@Autowired
	private FriendService friendservice;

	@RequestMapping(value = "/friend")
	public ModelAndView friendprofile(HttpSession session, int user_num) throws Exception {
		System.out.println("aaaaaaaaaaa"+user_num);
		IljuVO ilvo = friendDao.friendprofile(user_num);
		MemberVO vo1 = new MemberVO();
		int likevo = friendDao.friendlike(user_num);
		int likevo1 = friendDao.friendlike1(user_num);
		BoardVO vo = friendDao.boardlike(user_num);
		List<BoardVO> list = friendservice.Board(user_num);
		for (MemberVO voe : ilvo.getMem()) {
			vo1.setName(voe.getName());
			vo1.setUser_intro(voe.getUser_intro());
			vo1.setUser_img(voe.getUser_img());
			System.out.println("이름: " + voe.getName());
			System.out.println("자기소개: " + voe.getUser_intro());
			System.out.println("사진: " + voe.getUser_img());
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("friend");
		mav.addObject("name", vo1.getName());
		mav.addObject("intro", vo1.getUser_intro());
		mav.addObject("img_p", vo1.getUser_img());
		mav.addObject("follow",likevo);
		mav.addObject("follower",likevo1);
		mav.addObject("board", vo);
		mav.addObject("list", list);
		return mav;
	}

	
	/*
	 * @RequestMapping(value = "/friend") public ModelAndView
	 * friendfollow(HttpSession session, int user_num) { 
	 * LikeVO likevo = friendDao.friendlike(user_num); 
	 * ModelAndView mav = new ModelAndView();
	 * mav.setViewName("friend"); mav.addObject("follow", likevo);
	 * System.out.println("팔로우 :" + likevo.getCnt1()); return mav; }
	 */
	 

}
