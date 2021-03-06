package mvc.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mvc.dao.MemberDao;
import mvc.dao.PayDao;
import mvc.dao.UserInfoDao;
import mvc.vo.MemberVO;

// (수연 )
	
@Service
public class MemberService {

	@Autowired
	MemberDao memberDao;
	
	@Autowired
	private PayDao payDao;


	public boolean loginCheck(MemberVO vo, HttpSession session) {
		boolean result = memberDao.loginCheck(vo); // 여기서 로그인 체크하고,

		if (result) { // true일경우 세션에 등록
			vo = viewMember(vo); // 여기서 정보 가져오기.
			session.setAttribute("user_num", vo.getUser_num());
			session.setAttribute("name", vo.getName());
			session.setAttribute("ilju", vo.getIlju());
			session.setAttribute("gender", vo.getSex());
			session.setAttribute("user_img", vo.getUser_img());
			session.setAttribute("user_id", vo.getUser_id());
			session.setAttribute("nickname", vo.getNickname());
			try {
				//채팅개수
				session.setAttribute("chatcount", payDao.chatCount(vo.getUser_num()));
				//등급.
				session.setAttribute("grade_name", payDao.gradeName(vo.getUser_num()));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		return result;
	}

	// 회원로그인정보
	public MemberVO viewMember(MemberVO vo) {
		return memberDao.viewUser(vo);
	}

	// 회원로그아웃
	public void logout(HttpSession session) {
		session.invalidate();
	}
	
	
	@Autowired
	UserInfoDao userinfodao;
		public void pwdChange(MemberVO vo) throws Exception{
			userinfodao.pwdChange(vo);
	}
	
}





