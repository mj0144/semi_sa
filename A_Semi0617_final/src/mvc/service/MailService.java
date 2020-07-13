package mvc.service;

import java.io.PrintWriter;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import mvc.dao.MemberDao;
import mvc.vo.MemberVO;

@Service
public class MailService  {
	
	
	@Autowired
	MemberDao memberDao;

			//아이디 찾기
			public String find_id(HttpServletResponse response, String email) throws Exception {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				String id = memberDao.findId(email);
				System.out.println("email:"+id);
				if (id == null) {
					out.println("<script>");
					out.println("alert('가입된 아이디가 없습니다.');");
					out.println("history.go(-1);");
					out.println("</script>");
					out.close();
					return null;
				} else {
					return id;
				}
			}
			
			
			// 비밀번호 찾기
			public void find_pw(HttpServletResponse response, MemberVO vo) throws Exception {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				// 아이디가 없으면
				if (memberDao.idEmail(vo)==0) {
					out.print("아이디나 이메일을 잘못입력했습니다.");
					out.close();
					
				}else {
					out.print("이메일이 발송되었습니다.");
					out.close();
				}
			}
			
			
			//비밀번호 변경
			 public void pass_change(Map<String, Object> map, MemberVO vo) throws Exception {
				 memberDao.updatePw(map,vo);
			    }
			
	
}
