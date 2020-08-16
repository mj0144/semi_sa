package mvc.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GradeDao {
	
	@Autowired
	private SqlSession ss;
	
	
	//���üũ
	public List<String> gradeChk(int user_num) {

		return ss.selectList("grade.gradeChk", user_num);
	}
	
	//ä�ñ� ��� -> ������Ʈ
	public void leftCountUpdate(int user_num) {
		ss.update("grade.leftCountUpdate", user_num);			
	}
	
	
		
		
		
		
		
		
		//ä�� Ƚ�� üũ
		public int basicChatChk(String user_id) {
			return ss.selectOne("grade.basicChatChk", user_id);
		}
		
		//ä�� Ƚ�� üũ
			public int payChatChk(String user_id) {
				return ss.selectOne("grade.basicChatChk", user_id);
			}

}
