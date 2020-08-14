package mvc.service;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mvc.dao.MemberDao;
import mvc.vo.MemberVO;

//(����)
@Service
public class MailService  {
	
	
	@Autowired
	MemberDao memberDao;

			//���̵� ã��
			public String find_id(HttpServletResponse response, String email) throws Exception {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				String id = memberDao.findId(email);
				System.out.println("email:"+id);
				if (id == null) {
					out.println("<script>");
					out.println("alert('���Ե� ���̵� �����ϴ�.');");
					out.println("history.go(-1);");
					out.println("</script>");
					out.close();
					return null;
				} else {
					return id;
				}
			}
			
			
			// ��й�ȣ ã��
			public void find_pw(HttpServletResponse response, MemberVO vo) throws Exception {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				// ���̵� ������
				if (memberDao.idEmail(vo)==0) {
					out.print("���̵� �̸����� �߸��Է��߽��ϴ�.");
					out.close();
					
				}else {
					out.print("�̸����� �߼۵Ǿ����ϴ�.");
					out.close();
				}
			}
			
			
			//��й�ȣ ����
			 public void pass_change(Map<String, Object> map, MemberVO vo) throws Exception {
				 memberDao.updatePw(map,vo);
			    }
			
	
}
