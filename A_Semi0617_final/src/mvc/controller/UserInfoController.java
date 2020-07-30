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

import mvc.dao.JoinDao;
import mvc.dao.MemberDao;
import mvc.dao.UserInfoDao;
import mvc.service.BoardService;
import mvc.service.JoinService;
import mvc.service.LikeService;
import mvc.service.MemberService;
import mvc.service.UserInfoService;
import mvc.utils.ImgUtils;
import mvc.vo.BoardVO;
import mvc.vo.MemberVO;

@Controller
public class UserInfoController {

	@Autowired
	private UserInfoDao userInfoDao;
	
	@Autowired
	private UserInfoService userInfoService;
	
	
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
		ModelAndView mav = new ModelAndView();

		vo = userInfoService.userInfoSetting(session, vo, request,file); 	//�ٲ� ȸ������ ����
		mav = userInfoService.mypageSetting(session, vo, mav); //������������ �ٽ� �Ѿ�� ���� �� ����

				
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
		userInfoDao.pwdChange(svo);
		return "login";
	}
	
	//1. new_pwd2�� �������� Ȯ��
	//2. �������� vo �����ؼ� user_num,pwd �ֱ� 
	//3. ���� ����
	

	//��й�ȣ ajaxó�� url
	@RequestMapping("/pwdchangechk")
	@ResponseBody
	public int pwdChangeChk(HttpSession session,String pwd) {
		
		int user_num = (int)session.getAttribute("user_num");
		String pwd2 = userInfoDao.pwdchk(user_num);
		
		int chk =0;
		if(pwd2.equals(pwd)) {
			chk= 1;
		} else {
			chk=0;
		}
		return chk;
		
	}
}

