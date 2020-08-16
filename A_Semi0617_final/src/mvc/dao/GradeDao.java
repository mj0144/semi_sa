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
	
	
	//등급체크
	public List<String> gradeChk(int user_num) {

		return ss.selectList("grade.gradeChk", user_num);
	}
	
	//채팅권 사용 -> 업데이트
	public void leftCountUpdate(int user_num) {
		ss.update("grade.leftCountUpdate", user_num);			
	}
	
	
		
		
		
		
		
		
		//채팅 횟수 체크
		public int basicChatChk(String user_id) {
			return ss.selectOne("grade.basicChatChk", user_id);
		}
		
		//채팅 횟수 체크
			public int payChatChk(String user_id) {
				return ss.selectOne("grade.basicChatChk", user_id);
			}

}
