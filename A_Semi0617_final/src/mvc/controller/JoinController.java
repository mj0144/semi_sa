import mvc.dao.JoinDao;
import mvc.service.JoinService;
import mvc.service.LookLikeService;
import mvc.utils.ImgUtils;
import mvc.vo.IdealVO;
import mvc.vo.MemberVO;

@Controller
public class JoinController {

	@Autowired
	private LookLikeService lookLikeService;
	@Autowired
	private JoinDao joinDao;

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
				joinService.join(vo, ivo); // 회원정보,이상형정보 저장.
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
	// 회원가입
	@RequestMapping(value = "/joinaction", method = RequestMethod.POST)
	public String join(MemberVO vo, HttpServletRequest request, MultipartFile file, IdealVO ivo) {

		}
		vo = joinService.yunYeon(vo); // 생년월일 가공.
		String ilju = joinDao.ilju(vo);
		vo.setIlju(ilju); // 일주 세팅.

		// 별명 중복확인.
		@RequestMapping("/nickchk")
		@ResponseBody
		public int nickChk(String nickname) {
			int res = joinDao.nickChk(nickname);
			return res;
		vo.setUser_img(imgUtils.imgSave(request, file, "in", null)); // 파일 저장.

		if (vo.getUser_intro().equals("")) { // 자기소개를 입력하지 않았으면, 기본값 넣어주기.
			vo.setUser_intro("자기소개를 입력해주세요");
		}

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
	@RequestMapping("/emailchk")
	@ResponseBody
	public int emailchk(String email) {
		int res = joinDao.emailChk(email);
		return res;

	}
}
