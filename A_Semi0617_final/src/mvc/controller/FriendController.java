package mvc.controller;

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

	

}
