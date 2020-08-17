package mvc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mvc.service.ChatService;

@Controller //�ۼ��� ����
public class ChatControllor {

	@Autowired
	private ChatService chatservice;

	@RequestMapping(value = "/chat.do")
	public ModelAndView chatview(ModelAndView mav, HttpSession session) throws Exception {
		int user_num = Integer.parseInt(session.getAttribute("user_num").toString());
		System.out.println(user_num);
		mav.addObject("sessionid", user_num);
		mav.setViewName("chat");
		return mav;
	}
	
	//ä�� ���� �α�
	@RequestMapping(value = "/chatList", method = RequestMethod.POST)
	@ResponseBody
	public List<HashMap<String, Object>> messageList(@RequestBody String param) throws Exception {
		String subStr = param.substring(6);
		int roomNum = Integer.parseInt(subStr);
		System.out.println("roomNum"+roomNum);
		List<HashMap<String, Object>> resultMap = chatservice.chatList(roomNum);
		return resultMap;
	}
	//ä�÷α� Insert
	@ResponseBody
	@RequestMapping(value = "/chatInsert", method = RequestMethod.POST)
	public Map<String, Object> insertChat(@RequestBody HashMap<String, Object> params ,HttpSession session) throws Exception{
		int chatRoom = 2; //�ӽ� �׽�Ʈ�� ä�ù� ��ȣ
		String result = "fail";
		Map<String, Object> resultMap = new HashMap<String, Object>();
		params.put("chatroom", chatRoom); // �ӽ� �׽�Ʈ�� ä�ù��ȣ
		int messageInsert = chatservice.insertChat(params);
		if(messageInsert == 1) {
			result = "success";
		}
		resultMap.put("result", result);
		return resultMap;
	}
}