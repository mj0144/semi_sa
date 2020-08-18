package mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import mvc.dao.MemberDao;
import mvc.service.MailService;
import mvc.vo.MemberVO;


		//비밀번호찾기, 인증번호 메일발송 , 회원가입축하메일 (수연) 

@Controller
public class MailController {

	@Autowired
	private MemberDao memberDao;

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private MailService mailService;

	// 비밀번호 찾기폼
	@RequestMapping(value = "/findpwdform")
	public String findPwdForm() throws Exception {
		return "findpwdForm";
	}

	// 비밀번호찾기
	@RequestMapping(value = "/passemail", method = RequestMethod.POST)
	public ModelAndView passEmail(HttpServletRequest request, MemberVO vo, HttpServletResponse response)
			throws Exception {
		response.setContentType("text/html;charset=utf-8");

		// 아이디가 없으면
		if (memberDao.idEmail(vo) == 0) {
			PrintWriter out = response.getWriter();
			out.print("아이디나 이메일을 잘못입력했습니다.");
			out.close();
			return null;
		} else {
			Random r = new Random();
			int dice = r.nextInt(157211) + 48271;

			String setfrom = "soulmatch64@gmail.com";
			String tomail = vo.getEmail(); // 받는 사람의 이메일
			String title = "비밀번호 찾기 인증 이메일 입니다."; // 제목
			String content =

					System.getProperty("line.separator") + System.getProperty("line.separator")
							+ "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다" + System.getProperty("line.separator")
							+ System.getProperty("line.separator") + "비밀번호 찾기 인증번호는 " + dice + " 입니다. "
							+ System.getProperty("line.separator") + System.getProperty("line.separator")
							+ "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

				messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
				messageHelper.setTo(tomail); // 받는사람 이메일
				messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
				messageHelper.setText(content); // 메일 내용

				mailSender.send(message);

			} catch (Exception e) {
				System.out.println(e);
			}

			ModelAndView mv = new ModelAndView(); // ModelAndView로 보낼 페이지를 지정하고, 보낼 값을 지정한다.
			mv.setViewName("chekNum"); // 뷰의이름
			mv.addObject("dice", dice);
			mv.addObject("email", tomail);

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
			out.flush();

			return mv;

		}

	}

	// 인증번호를 입력한 후에 확인 버튼을 누르면 자료가 넘어오는 컨트롤러
	@RequestMapping(value = "/passinjeung", method = RequestMethod.POST)
	public ModelAndView pass_injeung(String pass_injeung, @RequestParam(value = "dice", required = false) String dice,
			@RequestParam(value = "email", required = false) String email, HttpServletResponse response)
			throws IOException {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("pass_change");
		mv.addObject("email", email);
		if (pass_injeung.equals(dice)) {
			// 인증번호가 일치할 경우 인증번호가 맞다는 창을 출력하고 비밀번호 변경창으로 이동시킨다
			mv.setViewName("pass_change");
			mv.addObject("email", email);
			// 만약 인증번호가 같다면 이메일을 비밀번호 변경 페이지로 넘기고, 활용할 수 있도록 한다.
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('인증번호가 일치하였습니다. 비밀번호 변경창으로 이동합니다.');</script>");
			out.flush();

			return mv;

		} else if (pass_injeung != dice) {
			ModelAndView mv2 = new ModelAndView();
			mv2.setViewName("chekNum");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('인증번호가 일치하지않습니다. 인증번호를 다시 입력해주세요.'); </script>");
			out.flush();
			return mv2;
		}
		return mv;
	}

	// 변경할 비밀번호를 입력한 후에 확인 버튼을 누르면 넘어오는 컨트롤러
	@RequestMapping(value = "passchange", method = RequestMethod.POST)
	public ModelAndView pass_change(@RequestParam(value = "email", required = false) String email,
			HttpServletRequest request, MemberVO vo, HttpServletResponse response) throws Exception {
		String pwd = request.getParameter("pwd");
		String pemail = email;
		vo.setEmail(pemail);
		vo.setPwd(pwd);

		// 값을 여러개 담아야 하므로 해쉬맵을 사용해서 값을 저장함
		Map<String, Object> map = new HashMap<>();
		map.put("email", vo.getEmail());
		map.put("pwd", vo.getPwd());
		mailService.pass_change(map, vo);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('비밀번호 변경 성공했습니다!'); </script>");
		out.flush();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("login");
		return mv;
	}

	// 아이디찾기폼
	@RequestMapping(value = "/findidform")
	public String findIdForm() throws Exception {
		return "findidForm";
	}

	// 아이디찾기
	@RequestMapping(value = "/findId", method = RequestMethod.POST)
	public String findid(HttpServletResponse response, @RequestParam("email") String email, Model md) throws Exception {
		md.addAttribute("id", mailService.find_id(response, email));
		return "findId";
	}
}
