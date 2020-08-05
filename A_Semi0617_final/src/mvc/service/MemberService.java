package mvc.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mvc.dao.MemberDao;
import mvc.dao.UserInfoDao;
import mvc.vo.IljuVO;
import mvc.vo.MemberVO;

@Service
public class MemberService {

	@Autowired
	MemberDao memberDao;

	public boolean loginCheck(MemberVO vo, HttpSession session) {
		boolean result = memberDao.loginCheck(vo); // ���⼭ �α��� üũ�ϰ�,

		if (result) { // true�ϰ�� ���ǿ� ���
			vo = viewMember(vo); // ���⼭ ���� ��������.
			session.setAttribute("user_num", vo.getUser_num());
			session.setAttribute("name", vo.getName());
			session.setAttribute("ilju", vo.getIlju());
			session.setAttribute("gender", vo.getSex());
			session.setAttribute("user_img", vo.getUser_img());
			session.setAttribute("user_id", vo.getUser_id());

		}
		return result;
	}

	// ȸ���α�������
	public MemberVO viewMember(MemberVO vo) {
		return memberDao.viewUser(vo);
	}

	// ȸ���α׾ƿ�
	public void logout(HttpSession session) {
		session.invalidate();
	}
	
	
	@Autowired
	UserInfoDao userinfodao;
		public void pwdChange(MemberVO vo) throws Exception{
			userinfodao.pwdChange(vo);
	}
	
}





