package mvc.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import mvc.vo.MemberVO;

@Repository
public class MemberDao {

	@Autowired
	private SqlSessionTemplate ss;
	
	public int join(MemberVO vo) {
		return ss.insert("member.join", vo);
	}
	
	public int idchk(String id) {
		return ss.selectOne("member.idchk", id);
	}

	public int nickchk(String nickname) {
		return ss.selectOne("member.nickchk", nickname);

	}
}
