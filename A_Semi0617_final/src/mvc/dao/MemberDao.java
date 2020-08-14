package mvc.dao;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mvc.vo.MemberVO;

//(����)


@Repository
public class MemberDao {

	// �α���üũ
	@Autowired
	private SqlSessionTemplate ss;

	public boolean loginCheck(MemberVO vo) {
		int num = ss.selectOne("member.login", vo);
		return (num == 0) ? false : true;
	}

	// ���̵� �ļ� ȸ������ �˱�
	public MemberVO idLogin(String string) {
		return ss.selectOne("member.idlogin", string);
	}

	// ȸ�� �α��� ����
	public MemberVO viewUser(MemberVO vo) {
		return ss.selectOne("member.viewUser", vo);
	}

	// ���̵� ã��
	public String findId(String email) throws Exception {
		return ss.selectOne("email.find_id", email);
	}

	// ��й�ȣ ���� �̸��� �Է�

	public int idEmail(MemberVO vo) throws Exception {
		return ss.selectOne("email.login", vo);
	}

	// ��й�ȣ����
	public void updatePw(Map<String, Object> map, MemberVO vo) throws Exception {
		map.get("pwd");
		map.get("email");

		ss.update("email.update_pw", map);
	}

	// �α׾ƿ�
	public void logout(HttpSession session) {

	}

	// �̸��� ����
	public int approval_member(MemberVO vo) throws Exception {
		return ss.update("email.approval_member", vo);
	}

	// �����ѹ� ���
	public int userNumber(MemberVO vo) {
		return ss.selectOne("member.usernumber", vo);
	}

}
