package mvc.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import mvc.service.FeedAbstract;

@Repository
public class ChatDao extends FeedAbstract{
	private String nameSpace = "chat.";
	
	//ä�ø޼��� insert
	public int chatInsert(HashMap<String,Object> params) throws Exception{
		return (int) insert(nameSpace+"chatIn", params);
	}
	//ä��room Number insert
	public int roomInsert() throws Exception {
		return (int) insert(nameSpace+"roomIn");
	}
	//1:1 ä�� ����
	@SuppressWarnings("unchecked")
	public List<HashMap<String, Object>> chatList(int roomNum) throws Exception{
		return (List<HashMap<String, Object>>) selectList(nameSpace+"meList", roomNum);
	}
}
