package mvc.controller;

import java.util.HashMap;
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

//�������������� ����Ʈ��õ �ȷο� �ȷο� �Խñ� ����ǥ���ϱ�,  ȸ��Ż���ϱ� ������(����)
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

	@Autowired
	   private ProfileDao profileDao;

	   //����������
	   @RequestMapping(value = "/mypage")
	   public ModelAndView mypage(HttpSession session) throws Exception {
	      MemberVO vo= profileservice.result_basic(session);
	      
	      session.setAttribute("user_img", vo.getUser_img());
	      int user_num = (int)session.getAttribute("user_num");
	      
	      //�ȷο� �ȷο� �� ����
	      int cnt1 =likeService.like1(session);
	      int cnt2 =likeService.like2(session);
	      
	      //�� �Խù� ����
	      List<BoardVO> list = boardService.Board(session);
	      
	      //���� �� �Խù� ���� ����
	      int vo1=boardService.Boardmax(session);
	      ModelAndView mav = new ModelAndView();
	      
	      //follower list
	      List<HashMap<String, Object>> follower = profileDao.followerlist(user_num);
	      System.out.println(follower);
	      
	      //follow list      
	      List<HashMap<String, Object>> follow = profileDao.followlist(user_num);
	      System.out.println(follow);
	            
	      mav.setViewName("mypage");
	      mav.addObject("member", vo);
	      mav.addObject("cnt2", cnt2);
	      mav.addObject("cnt1", cnt1);
	      mav.addObject("boardlist", list);
	      mav.addObject("maxnum", vo1);
	      mav.addObject("follower", follower);
	      mav.addObject("follow", follow);
	      
	      return mav;
	      
	      
	      
	   }
	
	// ȸ��Ż��������
	@RequestMapping(value = "/deletepage")
	public ModelAndView userdelete(HttpSession session) throws Exception {
		
		MemberVO vo= deleteservice.delete(session);
		session.setAttribute("user_img", vo.getUser_img());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("delete");
		mav.addObject("vo", vo);
		return mav;
		
	}
	
	// ȸ��Ż���ϱ� (��й�ȣ�Է� ������ , Ż����� �Է½�)
	@RequestMapping(value = "/deleteconfirm" ,method = RequestMethod.POST)
	public ModelAndView deleteconfirm(MemberVO vo) throws Exception {

		deleteservice.deleteconfirm(vo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login");
		return mav;
	}
	
	
	
}
