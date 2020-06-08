package mvc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mvc.dao.MemberDao;
import mvc.vo.MemberVO;
@Service
public class MemberService {

	@Autowired
	MemberDao memberDao;
	
	public boolean loginCheck(MemberVO vo,HttpSession session) {
		boolean result = memberDao.loginCheck(vo);
		if (result) { //true�ϰ�� ���ǿ� ���
			MemberVO vo2 = viewMember(vo);
			
			session.setAttribute("user_num", vo2.getUser_num());
			session.setAttribute("name", vo2.getName());
		}
		return result;
	}
	
	
	
	//ȸ���α�������
	public MemberVO viewMember(MemberVO vo) {
		return memberDao.viewUser(vo);
	}
	
	//ȸ���α׾ƿ�
	public void logout(HttpSession session) {
		session.invalidate();
	}
	
	
}
