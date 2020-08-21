package mvc.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mvc.dao.ChatDao;

@Service //송성근제작
public class ChatService{
	
	@Autowired
	ChatDao chatdao;
	
	//채팅 입력처리
	public int insertChat(HashMap<String,Object> params) throws Exception{
		int result = 0;
		try {
			result = chatdao.chatInsert(params);
			for(int i=0; i<result; i++) {
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	//채팅 내역
	public List<HashMap<String, Object>> chatList(int roomNum) throws Exception{
		return chatdao.chatList(roomNum);
	}
	//채팅방 목록
	public List<HashMap<String, Object>> roomSelect(int user_num) throws Exception{
		return chatdao.roomSelect(user_num);
	}
	//채팅내용 1개 request
	public HashMap<String, Object> inToSelect (HashMap<String, Object> params) throws Exception{
		return chatdao.inToSelect(params);
	}
	//채팅내용 1개 respone
	public HashMap<String, Object> responeSelect (int roomNum) throws Exception{
		return chatdao.responeSelect(roomNum);
	}
	//채팅 신청
	public int roomInsert(int user1) throws Exception{
		return chatdao.roomInsert(user1);
	}
	//채팅신청한 유저정보
	public List<HashMap<String, Object>> responeChatList (int usernum) throws Exception{
		return chatdao.responeChatList(usernum);
	}
	public void reqChatOK (HashMap<String, Object> params) throws Exception{
		chatdao.reqChatOK(params);
	}
	
}