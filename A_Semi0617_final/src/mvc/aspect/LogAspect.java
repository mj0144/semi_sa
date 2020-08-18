package mvc.aspect;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import mvc.service.GradeService;
import mvc.vo.MemberVO;

@Aspect
public class LogAspect {
	
	protected Logger log = LoggerFactory.getLogger(LogAspect.class);

	@Autowired
	private GradeService gradeService;
	

	
	//JoinPoint��ü�� ���Ը��ϸ� �� ��Ʈ�ѷ��� ���ǵ� �޼ҵ���� args(�Ű�����)������ ��� �ִ� ��ü
	@After("execution(* mvc.controller.MemberController.login(..))")
	public void loginbefore(JoinPoint jp) {
		Object[] obj = jp.getArgs(); 
		MemberVO vo = (MemberVO) obj[0];
		HttpSession session = (HttpSession)obj[1];
		int num=0;
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
		Date d = new Date();		
		String date = format1.format(d);
		try {
			num = (int) session.getAttribute("user_num");
			//1: �α��� ����, 0:�α��ν���.
			log.info("/"+date+"/"+vo.getUser_id() +"/"+1);
		} catch (Exception e) {
			log.info("/"+date+"/"+vo.getUser_id() +"/"+0);
		}
	}
	
	
//	@Before("execution(* mvc.controller.PageListController.listWhole3(..))")
//	public String gradeAccess(JoinPoint jp, RedirectAttributes ra, HttpSession session) {
//
//		int user_num = (int) session.getAttribute("user_num");
//		
//		//�ش� ������ ������ �ִ� ���� �ڵ��.
//		List<String> code_list = new ArrayList<String>();
//
//		code_list = gradeService.gradeChk(user_num);
//		int code_sum =0;
//		for (String e : code_list) {
//			code_sum+=Integer.parseInt(e, 2);
//		}
//		
//
//		ra.addAttribute("sex", "");
//		ra.addAttribute("samb", "");
//		ra.addAttribute("num", "");
//		if(code_sum == 8) {					
//			ra.addAttribute("paymember", "true");					
//		}else {
//			ra.addAttribute("paymember", "false");
//		}
//		return "redirect:/listWhole";
//		
//	}
	
	
	
	
	
	
}
