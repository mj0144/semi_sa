package mvc.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GradeDao {
	
	@Autowired
	private SqlSession ss;
	
	
	//등급체크
	public String GradeChk(String user_id) {
		return ss.selectOne(user_id);
	}
	
	//채팅 횟수 체크
	public void chatChk() {
		
	}
	
}
