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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mvc.service.ChatService;
import mvc.utils.CommonUtils;
import mvc.vo.ChatVO;

@Controller //�ۼ��� ����
public class ChatControllor {

	@Autowired
	private ChatService chatservice;
	
	@RequestMapping(value = "/chat.do")
	public ModelAndView chatview(ModelAndView mav, HttpSession session) throws Exception {
		int user_num = Integer.parseInt(session.getAttribute("user_num").toString());
		System.out.println(user_num);
		mav.addObject("sessionid", user_num);
		mav.setViewName("chat/chat");
		return mav;
	}
	//ä�ù� ����Ʈ
	@ResponseBody
	@RequestMapping(value = "/roomList" , method = RequestMethod.POST)
	public List<HashMap<String, Object>> roomList(@RequestBody String param) throws Exception{
		System.out.println(param);
		String subStr = param.substring(6);
		int user_num = Integer.parseInt(subStr);
		List<HashMap<String, Object>> resultMap = chatservice.roomSelect(user_num);
		return resultMap;
	}
	
	
	//ä�ù� ����
	@RequestMapping(value="/chatmessage", method = RequestMethod.GET)
	public ModelAndView selectUser(@RequestParam HashMap<String, Object> params, ModelAndView mav) throws Exception{
		int roomNum = Integer.parseInt(params.get("room").toString());
		List<HashMap<String, Object>> resultMap = chatservice.chatList(roomNum);
		for(int i=0; i<resultMap.size(); i++) {
			System.out.println("ä�ù泻�� : " + resultMap.get(i));
		}
		mav.addObject("roomNum", roomNum);
		mav.addObject("map", resultMap);
		mav.setViewName("chat/chatmessage");
		return mav;
	}
	//ä�÷α� Insert or request
	@ResponseBody
	@RequestMapping(value = "/chatInsert", method = RequestMethod.POST)
	public Map<String, Object> insertChat(@RequestBody HashMap<String, Object> params ,HttpSession session) throws Exception{
		if(params.get("chatcontent") == null || params.get("chatcontent") == "" ) {
			String putContent = " ";
			params.put("chatcontent", putContent);
		}
		System.out.println("insert params" + params.toString());
		int chatRoom = Integer.parseInt(params.get("chatroom").toString());
		String result = "fail";
		Map<String, Object> resultMap = new HashMap<String, Object>();
		params.put("chatroom", chatRoom); // �ӽ� �׽�Ʈ�� ä�ù��ȣ
		int messageInsert = chatservice.insertChat(params);
		HashMap<String, Object> inTo = chatservice.inToSelect(params);
		if(inTo.toString() == "" || inTo.toString() == null) {
			resultMap.put("result", result);
			return resultMap;
		}
		System.out.println(inTo.get("CHATDATE").toString());
		String sqldate = inTo.get("CHATDATE").toString();
		String date = sqldate.substring(0, 19);
		inTo.put("CHATDATE", date);
		if(messageInsert == 1) {
			result = "success";
		}
		resultMap.put("result", result);
		resultMap.put("inTo", inTo);
		System.out.println("RESULTMAP" + resultMap.toString());
		return resultMap;
	}
	//ä�� 1�� respone
	@ResponseBody
	@RequestMapping(value = "responeSelect", method = RequestMethod.POST )
	public HashMap<String, Object> responeSelect(@RequestBody String param) throws Exception{
		String subStr = param.substring(6);
		System.out.println("subStr"+subStr);
		int roomNum = Integer.parseInt(subStr);
		HashMap<String, Object> result = chatservice.responeSelect(roomNum);
		String sqldate = result.get("CHATDATE").toString();
		String date = sqldate.substring(0, 19);
		result.put("CHATDATE", date);
		System.out.println("responeSelect : " + result.toString());
		return result;
	}
	
	//ä�ù��û
	@ResponseBody
	@RequestMapping(value = "/chRequest", method = RequestMethod.POST)
	public String roomInsert(@RequestBody String user1, HttpSession session) throws Exception{
		System.out.println("ä�ù��û�Ϸ�"+user1);
		String result = "success";
		String substr = user1.substring(6);
		int user = Integer.parseInt(substr);
		chatservice.roomInsert(user);
		return result;
	}
	
	//ä�ý�û�� ���� ����
	@ResponseBody
	@RequestMapping(value = "responeChatList", method = RequestMethod.GET)
	public List<HashMap<String, Object>> responeChatList(String user)throws Exception{
		int usernum = Integer.parseInt(user);
		List<HashMap<String, Object>> resultMap = chatservice.responeChatList(usernum);
		return resultMap;
	}
	@ResponseBody
	@RequestMapping(value= "/updateRoom", method = RequestMethod.POST)
	public String reqChatupdate (@RequestBody HashMap<String, Object> params) throws Exception{
		String result = "success";
		System.out.println("������Ʈ" + params.toString());
		chatservice.reqChatOK(params);
		return result;
	}
}