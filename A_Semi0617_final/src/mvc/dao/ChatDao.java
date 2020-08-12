package mvc.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import mvc.service.FeedAbstract;

@Repository
public class ChatDao extends FeedAbstract{
	private String nameSpace = "chat.";
	
	//ä��â��ȸ
	@SuppressWarnings("unchecked")
	public Map<Object, Object> chatList(int user_num) throws Exception{
		return (Map<Object, Object>) selectList(nameSpace+"chat");
	}
}
