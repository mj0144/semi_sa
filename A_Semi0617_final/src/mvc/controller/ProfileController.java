package mvc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import mvc.dao.MemberDao;
import mvc.dao.ProfileDao;
import mvc.service.BoardService;
import mvc.service.DeleteService;
import mvc.service.LikeService;
import mvc.service.ProfileService;
import mvc.vo.BoardVO;
import mvc.vo.LikeVO;
import mvc.vo.MemberVO;

//마이페이지에서 리스트추천 팔로우 팔로워 게시글 숫자표시하기,  회원탈퇴하기 페이지(성현)
@Controller
public class ProfileController {

	@Autowired
	private ProfileService profileservice;
	
	@Autowired
	private LikeService likeService;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private DeleteService deleteservice;

	//마이페이지
	@RequestMapping(value = "/mypage")
	public ModelAndView mypage(HttpSession session) throws Exception {
		MemberVO vo= profileservice.result_basic(session);
		
		session.setAttribute("user_img", vo.getUser_img());

		//팔로우 팔로워 수 띄우기
		int cnt1 =likeService.like1(session);
		int cnt2 =likeService.like2(session);
		
		//내 게시물 띄우기
		List<BoardVO> list = boardService.Board(session);
		
		//내가 쓴 게시물 숫자 띄우기
		int vo1=boardService.Boardmax(session);
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("mypage");
		mav.addObject("member", vo);
		mav.addObject("cnt2", cnt2);
		mav.addObject("cnt1", cnt1);
		mav.addObject("boardlist", list);
		mav.addObject("maxnum", vo1);
		return mav;
		
		
		
	}
	
	// 회원탈퇴페이지
	@RequestMapping(value = "/deletepage")
	public ModelAndView userdelete(HttpSession session) throws Exception {
		
		MemberVO vo= deleteservice.delete(session);
		session.setAttribute("user_img", vo.getUser_img());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("delete");
		mav.addObject("vo", vo);
		return mav;
		
	}
	
	// 회원탈퇴하기 (비밀번호입력 맞을시 , 탈퇴사유 입력시)
	@RequestMapping(value = "/deleteconfirm" ,method = RequestMethod.POST)
	public ModelAndView deleteconfirm(MemberVO vo) throws Exception {

		deleteservice.deleteconfirm(vo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login");
		return mav;
	}
	
	
	
}
