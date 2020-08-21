package mvc.interceptor;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;
import org.springframework.web.servlet.view.RedirectView;

import mvc.service.GradeService;

public class GradeInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	private GradeService gradeService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String url = request.getRequestURI(); // 요청된 url
		HttpSession session = request.getSession();
		int user_num = (int) session.getAttribute("user_num");

		// 해당 유저가 가지고 있는 권한 코드들.
		List<String> code_list = new ArrayList<String>();

		code_list = gradeService.gradeChk(user_num);
		int code_sum = 0;
		for (String e : code_list) {
			code_sum += Integer.parseInt(e, 2);
		}

		try {
			// 요청된 url이 채팅일 때.
			/*if (url.equals("/AFinal/chRequest")) {*/
			if(isAjaxRequest(request)) {
				try {
					// 채팅 권한은 1(0000001)만 아니면 채팅에 접근가능.
					if (code_sum != 1) {
						// 단, code_sum이 3(00000011)일 떄는 채팅 횟수 감소.
						if (code_sum == 3) {
							gradeService.leftCountUpdate(user_num, session);
						}
						return true;
					} else {
						ModelAndView mav = new ModelAndView("redirect:/pay");
						mav.addObject("msg", "결제가 필요합니다");
						throw new ModelAndViewDefiningException(mav);
					}

				} catch (Exception e) {
					e.printStackTrace();
					ModelAndView mav = new ModelAndView("redirect:/pay");
					mav.addObject("msg", "결제가 필요합니다");
					throw new ModelAndViewDefiningException(mav);
				}
			}

			// 요청된 url이 리스트 일때.
			if (url.equals("/AFinal/listWhole")) {
				// 하루 10회 추가 권한(00001000)을 가진 사용자.(vvip)
				if(code_sum==29) {
					request.setAttribute("paymember", 20);
					return true;
				}else {
					request.setAttribute("paymember", 10);
					return true;
				}

			} 
			
			if (url.equals("/AFinal/findlove")){
				if(code_sum >= 5) {
					return true;
				}else {
					ModelAndView mav = new ModelAndView("redirect:/pay");
					mav.addObject("msg", "결제가 필요합니다");
					throw new ModelAndViewDefiningException(mav);
				}
			}
			return false;
			
		} catch (Exception e) {
			e.printStackTrace();
			ModelAndView mav = new ModelAndView("redirect:/pay");
			mav.addObject("msg", "결제가 필요합니다");
			throw new ModelAndViewDefiningException(mav);
		}
	
	}
	
	
	
	private boolean isAjaxRequest(HttpServletRequest req) {
       // String ajaxHeader = "AJAX";
        
         //return req.getHeader(ajaxHeader) != null && req.getHeader(ajaxHeader).equals(Boolean.TRUE.toString());
        return "XMLHttpRequest".equals(req.getHeader("x-requested-with"));
    }


	

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		
	}


	public ModelAndView flash(int code_sum) {
		ModelAndView mav = new ModelAndView();

		if(code_sum == 8) {					
			mav.setViewName("redirect:/listWholeGet?paymember=true");				
		}else {
			mav.setViewName("redirect:/listWholeGet?paymember=false");		
		}
		return mav;
	}
}
