package mvc.dao;

<<<<<<< HEAD
=======
import java.util.HashMap;
>>>>>>> branch 'master' of https://github.com/mj0144/semi_sa.git
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
<<<<<<< HEAD

	// ���ֻ̱�
=======
	
	
	// 일주뽑기
>>>>>>> branch 'master' of https://github.com/mj0144/semi_sa.git
	public String ilju(MemberVO vo) {
		return ss.selectOne("join.ilju", vo);
	}
<<<<<<< HEAD

	// ȸ������
=======
	// 회원가입
>>>>>>> branch 'master' of https://github.com/mj0144/semi_sa.git
	public void join(MemberVO vo) {
		ss.insert("join.join", vo);
	}
<<<<<<< HEAD

	// �̻��� ������ ����.
=======
	
	//이상형 데이터 저장.
>>>>>>> branch 'master' of https://github.com/mj0144/semi_sa.git
	public void idealjoing(IdealVO ivo) {
		ss.insert("join.idaelinsert", ivo);
	}
<<<<<<< HEAD

	// �̻����ʿ��� user_num�� �ʿ�
=======
	//이상형쪽에서 user_num이 필요
>>>>>>> branch 'master' of https://github.com/mj0144/semi_sa.git
	public int user_num(String user_id) {
		return ss.selectOne("join.selc_user_num", user_id);
	}
<<<<<<< HEAD

	// ���̵� üũ
=======
	
	//등급초기화 && 채팅 기본권 부여
	@Transactional
	public void gradeInit(Map<String, Object> map) {
		try {
			ss.insert("join.gradeInit", map);
			ss.insert("join.chatTicket", map);//채팅 기본권 부여
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}
	

	
	
	
	// 아이디 체크
>>>>>>> branch 'master' of https://github.com/mj0144/semi_sa.git
	public int idChk(String id) {
		return ss.selectOne("join.idchk", id);
	}

	// 별명체크
	public int nickChk(String nickname) {
		return ss.selectOne("join.nickchk", nickname);

	}

	// 이메일체크
	public int emailChk(String email) {
		return ss.selectOne("join.emailchk", email);

	}
<<<<<<< HEAD

	// ���Խ� ������ �Է�
=======
	
	//가입시 프로필 입력
>>>>>>> branch 'master' of https://github.com/mj0144/semi_sa.git
//		public void joinprofile(MemberVO vo) {
//			ss.update("member.joinprofile", vo);
//		}

	
	//닮은연예인 추가 (수연)
	   public void looklike(Map<String, Object> params) {
	      ss.insert("join.looklike", params);
	   }
	
	//���������� �߰� (����)
	   public void looklike(Map<String, Object> params) {
	      ss.insert("join.looklike", params);
	   }

}
