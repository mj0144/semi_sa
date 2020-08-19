package mvc.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import mvc.vo.IdealVO;
import mvc.vo.MemberVO;

@Repository
public class JoinDao {
	@Autowired
	private SqlSessionTemplate ss;
	
	
	// ���ֻ̱�
	public String ilju(MemberVO vo) {
		return ss.selectOne("join.ilju", vo);
	}
	// ȸ������
	public void join(MemberVO vo) {
		ss.insert("join.join", vo);
	}
	
	//�̻��� ������ ����.
	public void idealjoing(IdealVO ivo) {
		ss.insert("join.idaelinsert", ivo);
	}
	//�̻����ʿ��� user_num�� �ʿ�
	public int user_num(String user_id) {
		return ss.selectOne("join.selc_user_num", user_id);
	}
	
	//����ʱ�ȭ && ä�� �⺻�� �ο�
	@Transactional
	public void gradeInit(Map<String, Object> map) {
		try {
			ss.insert("join.gradeInit", map);
			ss.insert("join.chatTicket", map);//ä�� �⺻�� �ο�
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}
	

	
	
	
	// ���̵� üũ
	public int idChk(String id) {
		return ss.selectOne("join.idchk", id);
	}

	// ����üũ
	public int nickChk(String nickname) {
		return ss.selectOne("join.nickchk", nickname);

	}

	// �̸���üũ
	public int emailChk(String email) {
		return ss.selectOne("join.emailchk", email);

	}

	
	//���������� �߰� (����)
	   public void looklike(Map<String, Object> params) {
	      ss.insert("join.looklike", params);
	   }

}
