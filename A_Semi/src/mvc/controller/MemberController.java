package mvc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mvc.dao.MemberDao;
import mvc.vo.MemberVO;

@Controller
public class MemberController {
   
      @Autowired
      private MemberDao memberDao;
      
      @Autowired
      private MemberService memberService;
      
  
      @RequestMapping(value = "/logindo")
      public ModelAndView login(@ModelAttribute MemberVO vo, HttpSession session) {
    	  boolean result = memberService.loginCheck(vo, session);
    	  ModelAndView mav = new ModelAndView();
    	  if (result == true) { //로그인 성공
    		  mav.setViewName("index");
    		  mav.addObject("msg", "success");
			
		}else { //로그인 실패
			mav.setViewName("login");
			mav.addObject("msg", "failure");
		}
    	  return mav;
      }
      
      //로그아웃처리
      @RequestMapping(value = "/logoutdo")
      public ModelAndView logout(HttpSession session) {
    	  memberService.logout(session);
    	  ModelAndView mav = new ModelAndView();
    	  mav.setViewName("login");
    	  mav.addObject("msg", "logout");
    	  return mav;
      }
    
   }




