package mvc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mvc.service.SettingService;
import mvc.vo.PaymentVO;

//설정페이지 (성현) 

@Controller
public class SettingController {
	
	@Autowired
	private SettingService settingService;
	

	@RequestMapping(value = "/setting")
	public ModelAndView settingpage(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("setting");
		return mav;
	}
	
	@RequestMapping(value="/payListModal", method=RequestMethod.GET)
	@ResponseBody
	public List<PaymentVO> payListModal(int user_num){
		List<PaymentVO> list = settingService.payListModal(user_num);
		for(PaymentVO e : list) {
			System.out.println(e.getProduct_num());
		}
		
		return list;
	}

}
