import mvc.dao.JoinDao;
import mvc.service.JoinService;
import mvc.service.LookLikeService;
import mvc.utils.ImgUtils;
import mvc.vo.IdealVO;
import mvc.vo.MemberVO;

@Controller
public class JoinController {
<<<<<<< HEAD
=======

>>>>>>> branch 'master' of https://github.com/mj0144/semi_sa.git
	@Autowired
	private LookLikeService lookLikeService;
	@Autowired
	private JoinDao joinDao;

	@Autowired
	private ImgUtils imgUtils;

<<<<<<< HEAD
	// ȸ������
	@RequestMapping(value = "/joinaction", method = RequestMethod.POST)
	public String join(MemberVO vo, HttpServletRequest request, MultipartFile file, IdealVO ivo) {
=======
	// 회원가입
		@RequestMapping(value="/joinaction", method = RequestMethod.POST)
		public String join(MemberVO vo, HttpServletRequest request, MultipartFile file, IdealVO ivo) {
>>>>>>> branch 'master' of https://github.com/mj0144/semi_sa.git

<<<<<<< HEAD
		vo = joinService.yunYeon(vo); // ������� ����.
		String ilju = joinDao.ilju(vo);
		vo.setIlju(ilju); // ���� ����.
=======
			vo = joinService.yunYeon(vo); // 생년월일 가공.
			String ilju = joinDao.ilju(vo);
			vo.setIlju(ilju); // 일주 세팅.
>>>>>>> branch 'master' of https://github.com/mj0144/semi_sa.git

<<<<<<< HEAD
		vo.setUser_img(imgUtils.imgSave(request, file, "in", null)); // ���� ����.
=======
			vo.setUser_img(imgUtils.imgSave(request, file, "in", null)); // 파일 저장.
>>>>>>> branch 'master' of https://github.com/mj0144/semi_sa.git

<<<<<<< HEAD
		if (vo.getUser_intro().equals("")) { // �ڱ�Ұ��� �Է����� �ʾ�����, �⺻�� �־��ֱ�.
			vo.setUser_intro("�ڱ�Ұ��� �Է����ּ���");
=======
			if (vo.getUser_intro().equals("")) { // 자기소개를 입력하지 않았으면, 기본값 넣어주기.
				vo.setUser_intro("자기소개를 입력해주세요");
			}

			try {
				joinService.join(vo, ivo); // 회원정보,이상형정보 저장.
			} catch (Exception e) {
				e.printStackTrace();
			}		
			return "login";
>>>>>>> branch 'master' of https://github.com/mj0144/semi_sa.git
		}

		try {
			String images = imgUtils.root_path(request, vo.getUser_img());
			System.out.println("��Ʈ�ѷ����� �̹������" + images);
			joinService.join(vo, ivo); // ȸ������,�̻������� ����.
			lookLikeService.insertLooklike(images, vo ,ivo);

<<<<<<< HEAD
		} catch (Exception e) {
			e.printStackTrace();
=======
		// 아이디 중복확인
		@RequestMapping("/idchk")
		@ResponseBody
		public int idChk(String id) {
			int res = joinDao.idChk(id);
			return res;
	// 회원가입
	@RequestMapping(value = "/joinaction", method = RequestMethod.POST)
	public String join(MemberVO vo, HttpServletRequest request, MultipartFile file, IdealVO ivo) {

>>>>>>> branch 'master' of https://github.com/mj0144/semi_sa.git
		}
<<<<<<< HEAD
		return "login";
	}
=======
		vo = joinService.yunYeon(vo); // 생년월일 가공.
		String ilju = joinDao.ilju(vo);
		vo.setIlju(ilju); // 일주 세팅.
>>>>>>> branch 'master' of https://github.com/mj0144/semi_sa.git

<<<<<<< HEAD
	// ���̵� �ߺ�Ȯ��
	@RequestMapping("/idchk")
	@ResponseBody
	public int idChk(String id) {
		int res = joinDao.idChk(id);
		return res;
=======
		// 별명 중복확인.
		@RequestMapping("/nickchk")
		@ResponseBody
		public int nickChk(String nickname) {
			int res = joinDao.nickChk(nickname);
			return res;
		vo.setUser_img(imgUtils.imgSave(request, file, "in", null)); // 파일 저장.
>>>>>>> branch 'master' of https://github.com/mj0144/semi_sa.git

<<<<<<< HEAD
	}
=======
		if (vo.getUser_intro().equals("")) { // 자기소개를 입력하지 않았으면, 기본값 넣어주기.
			vo.setUser_intro("자기소개를 입력해주세요");
		}
>>>>>>> branch 'master' of https://github.com/mj0144/semi_sa.git

<<<<<<< HEAD
	// ���� �ߺ�Ȯ��.
	@RequestMapping("/nickchk")
	@ResponseBody
	public int nickChk(String nickname) {
		int res = joinDao.nickChk(nickname);
		return res;
=======
	//이메일 중복확인.
		@RequestMapping("/emailchk")
		@ResponseBody
		public int emailchk(String email) {
			int res = joinDao.emailChk(email);
			return res;
		try {
			String images = imgUtils.root_path(request, vo.getUser_img());
			System.out.println("컨트롤러에서 이미지경로" + images);
			joinService.join(vo, ivo); // 회원정보,이상형정보 저장.
			lookLikeService.insertLooklike(images, vo ,ivo);
>>>>>>> branch 'master' of https://github.com/mj0144/semi_sa.git

<<<<<<< HEAD
	}

	// �̸��� �ߺ�Ȯ��.
=======
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

	// 이메일 중복확인.
>>>>>>> branch 'master' of https://github.com/mj0144/semi_sa.git
	@RequestMapping("/emailchk")
	@ResponseBody
	public int emailchk(String email) {
		int res = joinDao.emailChk(email);
		return res;

	}
}
