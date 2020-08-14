package mvc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mvc.service.ChatService;
import mvc.utils.CommonUtils;

@Controller
public class ChatControllor {

//	@Autowired
//	private ChatService chatservice;

	@Autowired
	private CommonUtils commonUtils;

	// 채팅창 화면
	@RequestMapping(value = "/chat.do")
	public ModelAndView chatview(ModelAndView mav, HttpSession session) throws Exception {
		int user_num = Integer.parseInt(session.getAttribute("user_num").toString());
		System.out.println(user_num);
		mav.addObject("sessionid", user_num);
		mav.setViewName("chat");
		return mav;
	}
	
	
	
	
}