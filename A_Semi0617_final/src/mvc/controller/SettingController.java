package mvc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SettingController {

	@RequestMapping(value = "/setting")
	public ModelAndView settingpage(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("setting");
		return mav;
	}
}
