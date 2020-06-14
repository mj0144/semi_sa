package mvc.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mvc.vo.IljuVO;
import mvc.vo.MemberVO;

@Repository
public class MemberDao {

	// 로그인체크
	@Autowired
	private SqlSessionTemplate ss;

	public boolean loginCheck(MemberVO vo) {
		int num = ss.selectOne("member.login", vo);
		return (num == 0) ? false : true;
	}

	// 아이디만 쳐서 회원정보 알기
	public MemberVO idLogin(String string) {
		return ss.selectOne("member.idlogin", string);
	}

	// 회원 로그인 정보
	public MemberVO viewUser(MemberVO vo) {
		return ss.selectOne("member.viewUser", vo);
	}

	// 아이디 찾기
	public String findId(String email) throws Exception {
		return ss.selectOne("email.find_id", email);
	}

	// 비밀번호 변경

	public int idEmail(MemberVO vo) throws Exception {
		return ss.selectOne("email.login", vo);
	}

	public void updatePw(Map<String, Object> map, MemberVO vo) throws Exception {
		map.get("pwd");
		map.get("email");

		ss.update("email.update_pw", map);
	}

	// 로그아웃
	public void logout(HttpSession session) {

	}

	// 회원가입
	public int join(MemberVO vo) {
		return ss.insert("member.join", vo);
	}

	// 일주뽑기
	public String ilju(MemberVO vo) {
		return ss.selectOne("member.ilju", vo);
	}

	// 아이디 체크
	public int idChk(String id) {
		return ss.selectOne("member.idchk", id);
	}

	// 별명체크
	public int nickChk(String nickname) {
		return ss.selectOne("member.nickchk", nickname);

	}

	// 이메일체크
	public int emailChk(String email) {
		System.out.println(" dlapdd");
		return ss.selectOne("member.emailchk", email);

	}

	// 이메일 인증
	public int approval_member(MemberVO vo) throws Exception {
		return ss.update("email.approval_member", vo);
	}
	
	//가입시 프로필 입력
		public void joinprofile(MemberVO vo) {
			ss.update("member.joinprofile", vo);
		}
		
		//유저넘버 출력
		public int userNumber(MemberVO vo) {
			return ss.selectOne("member.usernumber", vo);
		}

}
