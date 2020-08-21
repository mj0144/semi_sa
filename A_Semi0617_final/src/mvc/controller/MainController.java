package mvc.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import mvc.service.MainService;

// ���������� ����Ʈ ��õ (���� )
@Controller
public class MainController {

	@Autowired
	private MainService mainService;


	
	
	@RequestMapping(value = "/index")
	public ModelAndView main(HttpSession session) {
		ModelAndView mav = new ModelAndView("index");
		
		int user_num = (int) session.getAttribute("user_num");
		
		//��õ�� ����Ʈ
		mav = mainService.calIlju(user_num , mav);
		
		//��ü ȸ�� ��.
		int usercount = mainService.userCount();		
		mav.addObject("usercount", usercount);
		
		//��Ī��
		int chatroomCount = mainService.chatRoomCount();
		
		mav.addObject("matavg", String.format("%.2f", Float.valueOf("0.112")));
			// �츮 ������ �ڷ����� String ���빰�� float ������ String 
		return mav;
	}

	@RequestMapping(value = "/", method = RequestMethod.POST)
	public ModelAndView Login(String msg) {
		ModelAndView mav = new ModelAndView("login");
		mav.addObject("msg", msg);

		return mav;
	}
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView LoginGet(String msg, HttpSession session, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("login");
		if(session.getAttribute("user_num") != null) {
			session.invalidate();
			mav.addObject("msg", "logout");
		}
		return mav;
	}
	
	
	
	
	

}
