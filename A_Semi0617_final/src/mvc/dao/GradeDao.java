package mvc.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GradeDao {
	
	@Autowired
	private SqlSession ss;
	
	
	//���üũ
	public String GradeChk(String user_id) {
		return ss.selectOne(user_id);
	}
	
	//ä�� Ƚ�� üũ
	public void chatChk() {
		
	}
	
}
