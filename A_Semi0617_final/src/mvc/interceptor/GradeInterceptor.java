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
		String url = request.getRequestURI(); // ��û�� url
		HttpSession session = request.getSession();
		int user_num = (int) session.getAttribute("user_num");

		// �ش� ������ ������ �ִ� ���� �ڵ��.
		List<String> code_list = new ArrayList<String>();

		code_list = gradeService.gradeChk(user_num);
		int code_sum = 0;
		for (String e : code_list) {
			code_sum += Integer.parseInt(e, 2);
		}

		try {
			// ��û�� url�� ä���� ��.
			if (url.equals("/AFinal/chatting")) {
				try {
					// ä�� ������ 1(0000001)�� �ƴϸ� ä�ÿ� ���ٰ���.
					if (code_sum != 1) {
						// ��, code_sum�� 3(00000011)�� ���� ä�� Ƚ�� ����.
						if (code_sum == 3) {
							gradeService.leftCountUpdate(user_num);
						}

					} else {
						ModelAndView mav = new ModelAndView("redirect:/pay");
						mav.addObject("msg", "������ �ʿ��մϴ�");
						throw new ModelAndViewDefiningException(mav);
					}

				} catch (Exception e) {
					e.printStackTrace();
					ModelAndView mav = new ModelAndView("redirect:/pay");
					mav.addObject("msg", "������ �ʿ��մϴ�");
					throw new ModelAndViewDefiningException(mav);
				}
			}

			// ��û�� url�� ����Ʈ �϶�.
			if (url.equals("/AFinal/listWhole")) {
				// �Ϸ� 10ȸ �߰� ����(00001000)�� ���� �����.(gold)
				if(code_sum==13) {
					request.setAttribute("paymember", 20);
					return true;
				}else {
					request.setAttribute("paymember", 10);
					return true;
				}

			} else {
				return false;
			}

		} catch (Exception e) {
			e.printStackTrace();
			ModelAndView mav = new ModelAndView("redirect:/pay");
			mav.addObject("msg", "������ �ʿ��մϴ�");
			throw new ModelAndViewDefiningException(mav);
		}
	
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
