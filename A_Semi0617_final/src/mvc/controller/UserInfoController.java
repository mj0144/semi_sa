package mvc.controller;

import java.util.ArrayList;
import java.util.HashMap;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	@RequestMapping(value="/userInfoChange",method=RequestMethod.GET)
	public void infoChangeGet(HttpSession session, Model model) {
		HashMap<String, Object> map = userInfoDao.info((int) session.getAttribute("user_num"));
		System.out.println(map);
		model.addAttribute("vo", map);

	}
	
	// ȸ������ ����.
	@RequestMapping(value="/userInfoChange", method=RequestMethod.POST)
	public String infoChange(HttpSession session, MemberVO vo, HttpServletRequest request, MultipartFile file) {
		//�ٲ� ȸ������ ����
		userInfoService.userInfoSetting(session, vo, request,file); 	

		return "redirect:/mypage";

	}

	

	
	
	
	
	
	//��й�ȣ ������ �̵�
	@RequestMapping(value="/pwdChange", method=RequestMethod.GET)
	public void pwdChange() {			
	}
	
	// ��� ��ȣ ���� �� �α��� ��������
	@RequestMapping(value="/pwdChange", method=RequestMethod.POST)
	public String login(HttpSession session, MemberVO vo, RedirectAttributes ra) {
		vo.setUser_num((int) session.getAttribute("user_num"));

		try {
			userInfoDao.pwdChange(vo);
			session.invalidate(); //���ǰ� ��� ����

		} catch (Exception e) {
			e.printStackTrace();
		}
		ra.addAttribute("msg", "��й�ȣ ������ �Ǿ����ϴ�");
		return "redirect:/";
	}
	
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

