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
	
	
	//등급체크
	public List<String> gradeChk(int user_num) {
		return ss.selectList("grade.gradeChk", user_num);
	}
	
	//채팅권 사용 -> 업데이트
	@Transactional
	public void leftCountUpdate(int user_num) {
		ss.update("grade.leftCountUpdate", user_num);
		//ss.update("grade.chatcountUpdate", user_num);
	}
	
	
		//채팅권 횟수 체크
		public int ChatChk(int user_num) {
			return ss.selectOne("grade.ChatChk", user_num);
		}
		



}
