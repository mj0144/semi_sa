package mvc.interceptor;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import mvc.service.GradeService;

public class GradeInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	private GradeService gradeService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		return super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		String url = request.getRequestURI(); // 요청된 url
		HttpSession session = request.getSession();
		int user_num = (int) session.getAttribute("user_num");
		
		//해당 유저가 가지고 있는 권한 코드들.
		List<String> code_list = new ArrayList<String>();

		code_list = gradeService.gradeChk(user_num);
		int code_sum =0;
		for (String e : code_list) {
			code_sum+=Integer.parseInt(e, 2);
		}
		
		try {
			//요청된 url이 채팅일 때.
			if (url.equals("/AFinal/chatting")) {			
				try {
					// 채팅 권한은 1(0000001)만 아니면 채팅에 접근가능.
					if (code_sum != 1) {
						// 단, code_sum이 3(00000011)일 떄는 채팅 횟수 감소.
						if (code_sum == 3) {
							gradeService.leftCountUpdate(user_num);
						}

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
			
			//요청된 url이 리스트 일때.
			if(url.equals("")) {
			
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			ModelAndView mav = new ModelAndView("redirect:/pay");
			mav.addObject("msg", "결제가 필요합니다");
			throw new ModelAndViewDefiningException(mav);
		}
		
		
	}

}
