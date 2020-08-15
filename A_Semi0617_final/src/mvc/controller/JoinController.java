package mvc.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import mvc.dao.JoinDao;
import mvc.service.JoinService;
import mvc.utils.ImgUtils;
import mvc.vo.IdealVO;
import mvc.vo.MemberVO;


//����
@Controller
public class JoinController {
	
	@Autowired
	private JoinDao joinDao;

	@Autowired
	private JoinService joinService;

	@Autowired
	private ImgUtils imgUtils;
	
		// ȸ������
		@RequestMapping(value="/joinaction", method = RequestMethod.POST)
		public String join(MemberVO vo, HttpServletRequest request, MultipartFile file, IdealVO ivo) {

			vo = joinService.yunYeon(vo); // ������� ����.
			String ilju = joinDao.ilju(vo);
			vo.setIlju(ilju); // ���� ����.

			vo.setUser_img(imgUtils.imgSave(request, file, "in", null)); // ���� ����.

			if (vo.getUser_intro().equals("")) { // �ڱ�Ұ��� �Է����� �ʾ�����, �⺻�� �־��ֱ�.
				vo.setUser_intro("�ڱ�Ұ��� �Է����ּ���");
			}

			try {
				joinService.join(vo, ivo); // ȸ������, �̻������� ����.
				joinService.gradeInit(vo); //��� �ʱ�ȭ.
			} catch (Exception e) {
				e.printStackTrace();
			}		
			return "login";
		}


		// ���̵� �ߺ�Ȯ��
		@RequestMapping("/idchk")
		@ResponseBody
		public int idChk(String id) {
			int res = joinDao.idChk(id);
			return res;

		}

		// ���� �ߺ�Ȯ��.
		@RequestMapping("/nickchk")
		@ResponseBody
		public int nickChk(String nickname) {
			int res = joinDao.nickChk(nickname);
			return res;

		}

	//�̸��� �ߺ�Ȯ��.
		@RequestMapping("/emailchk")
		@ResponseBody
		public int emailchk(String email) {
			int res = joinDao.emailChk(email);
			return res;

		}
}
