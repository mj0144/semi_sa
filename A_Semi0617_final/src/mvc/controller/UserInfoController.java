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
	
	
	// 회원페이지 이동 및 원래 정보 출력.
	@RequestMapping("/infochangepage")
	public ModelAndView pageChange(HttpSession session) {
		ModelAndView mav = new ModelAndView("userInfoChange");

		MemberVO vo = new MemberVO();
		vo = userInfoDao.info((int) session.getAttribute("user_num"));
		mav.addObject("vo", vo);

		return mav;
	}

	
	
	// 회원정보 수정.
	@RequestMapping("/infochange")
	public ModelAndView infoChange(HttpSession session, MemberVO vo, HttpServletRequest request, MultipartFile file) {
		ModelAndView mav = new ModelAndView();

		vo = userInfoService.userInfoSetting(session, vo, request,file); 	//바뀐 회원정보 세팅
		mav = userInfoService.mypageSetting(session, vo, mav); //마이페이지로 다시 넘어가기 위한 값 세팅

				
		return mav;
	}
	
	//비밀번호 페이지 이동
	@RequestMapping("/pwdChange")
	public String pwdChange(HttpSession session, MemberVO vo) {	
		return "pwdChange";
	}
	
	// 비밀 번호 변경 후 로그인 페이지로
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
	
	//1. new_pwd2가 들어오는지 확인
	//2. 들어왔으면 vo 생성해서 user_num,pwd 넣기 
	//3. 세션 끊기
	

	//비밀번호 ajax처리 url
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

