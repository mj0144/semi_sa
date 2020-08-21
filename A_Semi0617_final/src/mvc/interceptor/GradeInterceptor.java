package mvc.interceptor;

import java.net.URLEncoder;
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

		// response ���ڵ�.
		response.setContentType("text/html;charset=EUC_KR");
		String msg = URLEncoder.encode("������ �ʿ��մϴ�", "EUC-KR");

		HttpSession session = request.getSession();
		int user_num = (int) session.getAttribute("user_num");

		// ������������ �̵��� url
		String payUrl = "/AFinal/pay";
		// �ش� ������ ������ �ִ� ���� �ڵ��.
		List<String> code_list = new ArrayList<String>();
		code_list = gradeService.gradeChk(user_num);

		int code_sum = 0;
		for (String e : code_list) {
			code_sum += Integer.parseInt(e, 2);
		}

		try {
			// ��û�� url�� ä���� ��.
			/* if (url.equals("/AFinal/chRequest")) { */
			if (isAjaxRequest(request)) {
				try {
					// ä�� ������ 1(0000001)�� �ƴϸ� ä�ÿ� ���ٰ���.
					if (code_sum != 1) {
						// ��, code_sum�� 3(00000011)�� ���� ä�� Ƚ�� ����.
						if (code_sum == 3) {
							gradeService.leftCountUpdate(user_num, session);
						}
						return true;
					} else {
						response.sendRedirect(payUrl + "?msg=" + msg);
						return false;
					}

				} catch (Exception e) {
					e.printStackTrace();
					response.sendRedirect(payUrl + "?msg=" + msg);
				}
			}

			// ��û�� url�� ����Ʈ �϶�.
			if (url.equals("/AFinal/listWhole")) {
				// �Ϸ� 10ȸ �߰� ����(00001000)�� ���� �����.(vvip)
				if (code_sum == 29) {
					request.setAttribute("paymember", 20);
					return true;
				} else {
					request.setAttribute("paymember", 10);
					return true;
				}

			}

			if (url.equals("/AFinal/findlove")) {
				if (code_sum >= 5) {
					return true;
				} else {
					response.sendRedirect(payUrl + "?msg=" + msg);
				}
			}
			return false;

		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect(payUrl + "?msg=" + msg);
		}
		return false;

	}

	// ���� ��û�� header�� x-requested-with�� �ִ��� Ȯ��.
	private boolean isAjaxRequest(HttpServletRequest req) {
		return "XMLHttpRequest".equals(req.getHeader("x-requested-with"));
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

}
