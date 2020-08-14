package mvc.controller;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FindloveController {

	// 네이버 얼굴인식 API 예제 ( 성현, 수연 )

	@RequestMapping(value = "/findlove")
	public ModelAndView findlove(HttpSession session) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("findlove");
		
		return mav;
		
		
		
	}
	
	
	
}
