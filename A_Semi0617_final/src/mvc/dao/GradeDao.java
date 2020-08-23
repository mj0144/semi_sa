package mvc.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class GradeDao {
	
	@Autowired
	private SqlSession ss;
	
	
	//����ڵ� üũ
	public List<String> gradeCodeChk(int user_num) {
		return ss.selectList("grade.gradeCodeChk", user_num);
	}
	
	//ä�ñ� ��� -> ������Ʈ
	@Transactional
	public void leftCountUpdate(int user_num) {
		int update = ss.update("grade.leftCountUpdate", user_num);
		if(update==0 ) {
			ss.update("grade.chatcountUpdate", user_num);
		}
	}
	
	
		//ä�ñ� Ƚ�� üũ
		public int chatChk(int user_num) {
			return ss.selectOne("grade.ChatChk", user_num);
		}
		public String gradeChk(int user_num) {
			return ss.selectOne("grade.gradeChk", user_num);
		}
		



}
