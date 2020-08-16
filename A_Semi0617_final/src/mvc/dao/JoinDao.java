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

	// ÀÏÁÖ»Ì±â
=======
	
	
	// ì¼ì£¼ë½‘ê¸°
>>>>>>> branch 'master' of https://github.com/mj0144/semi_sa.git
	public String ilju(MemberVO vo) {
		return ss.selectOne("join.ilju", vo);
	}
<<<<<<< HEAD

	// È¸¿ø°¡ÀÔ
=======
	// íšŒì›ê°€ì…
>>>>>>> branch 'master' of https://github.com/mj0144/semi_sa.git
	public void join(MemberVO vo) {
		ss.insert("join.join", vo);
	}
<<<<<<< HEAD

	// ÀÌ»óÇü µ¥ÀÌÅÍ ÀúÀå.
=======
	
	//ì´ìƒí˜• ë°ì´í„° ì €ì¥.
>>>>>>> branch 'master' of https://github.com/mj0144/semi_sa.git
	public void idealjoing(IdealVO ivo) {
		ss.insert("join.idaelinsert", ivo);
	}
<<<<<<< HEAD

	// ÀÌ»óÇüÂÊ¿¡¼­ user_numÀÌ ÇÊ¿ä
=======
	//ì´ìƒí˜•ìª½ì—ì„œ user_numì´ í•„ìš”
>>>>>>> branch 'master' of https://github.com/mj0144/semi_sa.git
	public int user_num(String user_id) {
		return ss.selectOne("join.selc_user_num", user_id);
	}
<<<<<<< HEAD

	// ¾ÆÀÌµğ Ã¼Å©
=======
	
	//ë“±ê¸‰ì´ˆê¸°í™” && ì±„íŒ… ê¸°ë³¸ê¶Œ ë¶€ì—¬
	@Transactional
	public void gradeInit(Map<String, Object> map) {
		try {
			ss.insert("join.gradeInit", map);
			ss.insert("join.chatTicket", map);//ì±„íŒ… ê¸°ë³¸ê¶Œ ë¶€ì—¬
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}
	

	
	
	
	// ì•„ì´ë”” ì²´í¬
>>>>>>> branch 'master' of https://github.com/mj0144/semi_sa.git
	public int idChk(String id) {
		return ss.selectOne("join.idchk", id);
	}

	// ë³„ëª…ì²´í¬
	public int nickChk(String nickname) {
		return ss.selectOne("join.nickchk", nickname);

	}

	// ì´ë©”ì¼ì²´í¬
	public int emailChk(String email) {
		return ss.selectOne("join.emailchk", email);

	}
<<<<<<< HEAD

	// °¡ÀÔ½Ã ÇÁ·ÎÇÊ ÀÔ·Â
=======
	
	//ê°€ì…ì‹œ í”„ë¡œí•„ ì…ë ¥
>>>>>>> branch 'master' of https://github.com/mj0144/semi_sa.git
//		public void joinprofile(MemberVO vo) {
//			ss.update("member.joinprofile", vo);
//		}

	
	//ë‹®ì€ì—°ì˜ˆì¸ ì¶”ê°€ (ìˆ˜ì—°)
	   public void looklike(Map<String, Object> params) {
	      ss.insert("join.looklike", params);
	   }
	
	//´àÀº¿¬¿¹ÀÎ Ãß°¡ (¼ö¿¬)
	   public void looklike(Map<String, Object> params) {
	      ss.insert("join.looklike", params);
	   }

}
