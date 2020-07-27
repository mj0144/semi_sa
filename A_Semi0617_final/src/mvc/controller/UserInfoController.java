package mvc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import mvc.dao.MemberDao;
import mvc.dao.UserInfoDao;
import mvc.service.BoardService;
import mvc.service.LikeService;
import mvc.service.MemberService;
import mvc.utils.ImgUtils;
import mvc.vo.BoardVO;
import mvc.vo.MemberVO;

@Controller
public class UserInfoController {

	@Autowired
	private UserInfoDao userInfoDao;

	@Autowired
	private ImgUtils imgUtils;

	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private LikeService likeService;
	
	@Autowired
	private BoardService boardService;
	
	// ȸ�������� �̵� �� ���� ���� ���.
	@RequestMapping("/infochangepage")
	public ModelAndView pageChange(HttpSession session) {
		ModelAndView mav = new ModelAndView("userInfoChange");

		MemberVO vo = new MemberVO();
		vo = userInfoDao.info((int) session.getAttribute("user_num"));
		mav.addObject("vo", vo);

		return mav;
	}

	// ȸ������ ����.
	@RequestMapping("/infochange")
	public ModelAndView infoChange(HttpSession session, MemberVO vo, HttpServletRequest request, MultipartFile file) {
		ModelAndView mav = new ModelAndView("mypage");
		MemberService iljusetting = new MemberService();

		
		String img = (String) session.getAttribute("user_img");
		vo.setUser_img(imgUtils.imgSave(request, file, "change", img)); // ���� ����.
		vo.setUser_num((int) session.getAttribute("user_num"));
		// ���� ����.
		iljusetting.yunYeon(vo);
		vo.setIlju(memberDao.ilju(vo));

		try {
			userInfoDao.infoUpdate(vo);

		} catch (Exception e) {
			System.out.println("db����"); // db���� ��, ���ε��� ���� ����.
			imgUtils.deleteimg();
		}

		// �ٲﰪ���� ���� ������Ʈ.
		session.setAttribute("name", vo.getName());
		session.setAttribute("ilju", vo.getIlju());
		session.setAttribute("gender", vo.getSex());

		session.setAttribute("user_img", vo.getUser_img());
		mav.addObject("member", vo);
		
		
		//���� mypage�� �Ѱ�� �����͵� ó��.//////////////////////////////////
				int vo1=0;
				int cnt1 =likeService.like1(session);
				int cnt2 =likeService.like2(session);
				List<BoardVO> list = new ArrayList<BoardVO>();
				try {
					list = boardService.Board(session);
					vo1=boardService.Boardmax(session);

				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				mav.setViewName("mypage");
				mav.addObject("member", vo);
				mav.addObject("cnt2", cnt2);
				mav.addObject("cnt1", cnt1);
				mav.addObject("boardlist", list);
				mav.addObject("maxnum", vo1);
				//////////////////////////////////////////////////
		return mav;
	}
	
	//��й�ȣ ������ �̵�
	@RequestMapping("/pwdChange")
	public String pwdChange(HttpSession session, MemberVO vo) {	
		return "pwdChange";
	}
	
	// ��� ��ȣ ���� �� �α��� ��������
	@RequestMapping("/gologin")
	public String login(HttpSession session, MemberVO vo) {
		System.out.println("?");
		System.out.println(vo.getPwd());
		MemberVO svo = new MemberVO();
		
		int user_num = (int) session.getAttribute("user_num");
		svo.setUser_num(user_num);
		svo.setPwd(vo.getPwd());
		userinfodao.pwdChange(svo);
		return "login";
	}
	
	//1. new_pwd2�� �������� Ȯ��
	//2. �������� vo �����ؼ� user_num,pwd �ֱ� 
	//3. ���� ����
	
	
	@Autowired
	UserInfoDao userinfodao;
	
	//��й�ȣ ajaxó�� url
	@RequestMapping("/pwdchangechk")
	@ResponseBody
	public int pwdChangeChk(HttpSession session,String pwd) {
		
		int user_num = (int)session.getAttribute("user_num");
		String pwd2 = userinfodao.pwdchk(user_num);
		
		int chk =0;
		if(pwd2.equals(pwd)) {
			chk= 1;
		} else {
			chk=0;
		}
		return chk;
		
	}
}

