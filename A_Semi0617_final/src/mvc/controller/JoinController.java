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


//민정
@Controller
public class JoinController {
	
	@Autowired
	private JoinDao joinDao;

	@Autowired
	private JoinService joinService;

	@Autowired
	private ImgUtils imgUtils;
	
		// 회원가입
		@RequestMapping(value="/joinaction", method = RequestMethod.POST)
		public String join(MemberVO vo, HttpServletRequest request, MultipartFile file, IdealVO ivo) {

			vo = joinService.yunYeon(vo); // 생년월일 가공.
			String ilju = joinDao.ilju(vo);
			vo.setIlju(ilju); // 일주 세팅.

			vo.setUser_img(imgUtils.imgSave(request, file, "in", null)); // 파일 저장.

			if (vo.getUser_intro().equals("")) { // 자기소개를 입력하지 않았으면, 기본값 넣어주기.
				vo.setUser_intro("자기소개를 입력해주세요");
			}

			try {
				joinService.join(vo, ivo); // 회원정보, 이상형정보 저장.
				joinService.gradeInit(vo); //등급 초기화.
			} catch (Exception e) {
				e.printStackTrace();
			}		
			return "login";
		}


		// 아이디 중복확인
		@RequestMapping("/idchk")
		@ResponseBody
		public int idChk(String id) {
			int res = joinDao.idChk(id);
			return res;

		}

		// 별명 중복확인.
		@RequestMapping("/nickchk")
		@ResponseBody
		public int nickChk(String nickname) {
			int res = joinDao.nickChk(nickname);
			return res;

		}

	//이메일 중복확인.
		@RequestMapping("/emailchk")
		@ResponseBody
		public int emailchk(String email) {
			int res = joinDao.emailChk(email);
			return res;

		}
}
