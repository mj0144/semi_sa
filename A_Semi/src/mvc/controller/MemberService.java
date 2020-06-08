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
		if (result) { //true일경우 세션에 등록
			MemberVO vo2 = viewMember(vo);
			
			session.setAttribute("user_num", vo2.getUser_num());
			session.setAttribute("name", vo2.getName());
		}
		return result;
	}
	
	
	
	//회원로그인정보
	public MemberVO viewMember(MemberVO vo) {
		return memberDao.viewUser(vo);
	}
	
	//회원로그아웃
	public void logout(HttpSession session) {
		session.invalidate();
	}
	
	
}
