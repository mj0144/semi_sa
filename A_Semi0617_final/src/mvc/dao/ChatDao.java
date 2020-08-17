package mvc.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import mvc.service.FeedAbstract;

@Repository
public class ChatDao extends FeedAbstract{
	private String nameSpace = "chat.";
	
	//채팅메세지 insert
	public int chatInsert(HashMap<String,Object> params) throws Exception{
		return (int) insert(nameSpace+"chatIn", params);
	}
	//채팅room Number insert
	public int roomInsert() throws Exception {
		return (int) insert(nameSpace+"roomIn");
	}
	//1:1 채팅 내역
	@SuppressWarnings("unchecked")
	public List<HashMap<String, Object>> chatList(int roomNum) throws Exception{
		return (List<HashMap<String, Object>>) selectList(nameSpace+"meList", roomNum);
	}
}
