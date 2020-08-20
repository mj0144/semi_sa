package mvc.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

@Repository
public class MainDao {

	@Autowired
	private SqlSession ss;
	
	public int userCount() {
		return ss.selectOne("main.userCount");
	}
	
	public int chatRoomCount() {
		return ss.selectOne("main.chatRoomCount");
	}
}
