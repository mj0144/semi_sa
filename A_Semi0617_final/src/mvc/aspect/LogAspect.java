package mvc.aspect;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import mvc.vo.MemberVO;

@Aspect
public class LogAspect {
	
	protected Logger log = LoggerFactory.getLogger(LogAspect.class);


	

	
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
	
}
