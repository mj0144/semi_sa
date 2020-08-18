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


		//��й�ȣã��, ������ȣ ���Ϲ߼� , ȸ���������ϸ��� (����) 

@Controller
public class MailController {

	@Autowired
	private MemberDao memberDao;

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private MailService mailService;

	// ��й�ȣ ã����
	@RequestMapping(value = "/findpwdform")
	public String findPwdForm() throws Exception {
		return "findpwdForm";
	}

	// ��й�ȣã��
	@RequestMapping(value = "/passemail", method = RequestMethod.POST)
	public ModelAndView passEmail(HttpServletRequest request, MemberVO vo, HttpServletResponse response)
			throws Exception {
		response.setContentType("text/html;charset=utf-8");

		// ���̵� ������
		if (memberDao.idEmail(vo) == 0) {
			PrintWriter out = response.getWriter();
			out.print("���̵� �̸����� �߸��Է��߽��ϴ�.");
			out.close();
			return null;
		} else {
			Random r = new Random();
			int dice = r.nextInt(157211) + 48271;

			String setfrom = "soulmatch64@gmail.com";
			String tomail = vo.getEmail(); // �޴� ����� �̸���
			String title = "��й�ȣ ã�� ���� �̸��� �Դϴ�."; // ����
			String content =

					System.getProperty("line.separator") + System.getProperty("line.separator")
							+ "�ȳ��ϼ��� ȸ���� ���� Ȩ�������� ã���ּż� �����մϴ�" + System.getProperty("line.separator")
							+ System.getProperty("line.separator") + "��й�ȣ ã�� ������ȣ�� " + dice + " �Դϴ�. "
							+ System.getProperty("line.separator") + System.getProperty("line.separator")
							+ "������ ������ȣ�� Ȩ�������� �Է��� �ֽø� �������� �Ѿ�ϴ�."; // ����
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

				messageHelper.setFrom(setfrom); // �����»�� �����ϸ� �����۵��� ����
				messageHelper.setTo(tomail); // �޴»�� �̸���
				messageHelper.setSubject(title); // ���������� ������ �����ϴ�
				messageHelper.setText(content); // ���� ����

				mailSender.send(message);

			} catch (Exception e) {
				System.out.println(e);
			}

			ModelAndView mv = new ModelAndView(); // ModelAndView�� ���� �������� �����ϰ�, ���� ���� �����Ѵ�.
			mv.setViewName("chekNum"); // �����̸�
			mv.addObject("dice", dice);
			mv.addObject("email", tomail);

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('�̸����� �߼۵Ǿ����ϴ�. ������ȣ�� �Է����ּ���.');</script>");
			out.flush();

			return mv;

		}

	}

	// ������ȣ�� �Է��� �Ŀ� Ȯ�� ��ư�� ������ �ڷᰡ �Ѿ���� ��Ʈ�ѷ�
	@RequestMapping(value = "/passinjeung", method = RequestMethod.POST)
	public ModelAndView pass_injeung(String pass_injeung, @RequestParam(value = "dice", required = false) String dice,
			@RequestParam(value = "email", required = false) String email, HttpServletResponse response)
			throws IOException {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("pass_change");
		mv.addObject("email", email);
		if (pass_injeung.equals(dice)) {
			// ������ȣ�� ��ġ�� ��� ������ȣ�� �´ٴ� â�� ����ϰ� ��й�ȣ ����â���� �̵���Ų��
			mv.setViewName("pass_change");
			mv.addObject("email", email);
			// ���� ������ȣ�� ���ٸ� �̸����� ��й�ȣ ���� �������� �ѱ��, Ȱ���� �� �ֵ��� �Ѵ�.
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('������ȣ�� ��ġ�Ͽ����ϴ�. ��й�ȣ ����â���� �̵��մϴ�.');</script>");
			out.flush();

			return mv;

		} else if (pass_injeung != dice) {
			ModelAndView mv2 = new ModelAndView();
			mv2.setViewName("chekNum");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('������ȣ�� ��ġ�����ʽ��ϴ�. ������ȣ�� �ٽ� �Է����ּ���.'); </script>");
			out.flush();
			return mv2;
		}
		return mv;
	}

	// ������ ��й�ȣ�� �Է��� �Ŀ� Ȯ�� ��ư�� ������ �Ѿ���� ��Ʈ�ѷ�
	@RequestMapping(value = "passchange", method = RequestMethod.POST)
	public ModelAndView pass_change(@RequestParam(value = "email", required = false) String email,
			HttpServletRequest request, MemberVO vo, HttpServletResponse response) throws Exception {
		String pwd = request.getParameter("pwd");
		String pemail = email;
		vo.setEmail(pemail);
		vo.setPwd(pwd);

		// ���� ������ ��ƾ� �ϹǷ� �ؽ����� ����ؼ� ���� ������
		Map<String, Object> map = new HashMap<>();
		map.put("email", vo.getEmail());
		map.put("pwd", vo.getPwd());
		mailService.pass_change(map, vo);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('��й�ȣ ���� �����߽��ϴ�!'); </script>");
		out.flush();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("login");
		return mv;
	}

	// ���̵�ã����
	@RequestMapping(value = "/findidform")
	public String findIdForm() throws Exception {
		return "findidForm";
	}

	// ���̵�ã��
	@RequestMapping(value = "/findId", method = RequestMethod.POST)
	public String findid(HttpServletResponse response, @RequestParam("email") String email, Model md) throws Exception {
		md.addAttribute("id", mailService.find_id(response, email));
		return "findId";
	}
}
