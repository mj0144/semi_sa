package mvc.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mvc.dao.ProfileDao;
import mvc.service.SettingService;
import mvc.vo.PaymentVO;

//설정페이지 (성현) 

@Controller
public class SettingController {
	
	@Autowired
	private SettingService settingService;
	
	@Autowired
	   private ProfileDao profileDao;

	@RequestMapping(value = "/setting")
	public ModelAndView settingpage(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		int user_num= (int) session.getAttribute("user_num");
		//follower list
	    List<HashMap<String, Object>> follower = profileDao.followerlist(user_num);
	    System.out.println(follower);
	      
	    //follow list      
	    List<HashMap<String, Object>> follow = profileDao.followlist(user_num);
	    System.out.println(follow);
		mav.addObject("user_num", user_num);
		
		mav.addObject("follower", follower);
	    mav.addObject("follow", follow);
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
