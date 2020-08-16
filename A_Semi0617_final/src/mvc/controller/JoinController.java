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
	// È¸¿ø°¡ÀÔ
	@RequestMapping(value = "/joinaction", method = RequestMethod.POST)
	public String join(MemberVO vo, HttpServletRequest request, MultipartFile file, IdealVO ivo) {
=======
	// íšŒì›ê°€ìž…
		@RequestMapping(value="/joinaction", method = RequestMethod.POST)
		public String join(MemberVO vo, HttpServletRequest request, MultipartFile file, IdealVO ivo) {
>>>>>>> branch 'master' of https://github.com/mj0144/semi_sa.git

<<<<<<< HEAD
		vo = joinService.yunYeon(vo); // »ý³â¿ùÀÏ °¡°ø.
		String ilju = joinDao.ilju(vo);
		vo.setIlju(ilju); // ÀÏÁÖ ¼¼ÆÃ.
=======
			vo = joinService.yunYeon(vo); // ìƒë…„ì›”ì¼ ê°€ê³µ.
			String ilju = joinDao.ilju(vo);
			vo.setIlju(ilju); // ì¼ì£¼ ì„¸íŒ….
>>>>>>> branch 'master' of https://github.com/mj0144/semi_sa.git

<<<<<<< HEAD
		vo.setUser_img(imgUtils.imgSave(request, file, "in", null)); // ÆÄÀÏ ÀúÀå.
=======
			vo.setUser_img(imgUtils.imgSave(request, file, "in", null)); // íŒŒì¼ ì €ìž¥.
>>>>>>> branch 'master' of https://github.com/mj0144/semi_sa.git

<<<<<<< HEAD
		if (vo.getUser_intro().equals("")) { // ÀÚ±â¼Ò°³¸¦ ÀÔ·ÂÇÏÁö ¾Ê¾ÒÀ¸¸é, ±âº»°ª ³Ö¾îÁÖ±â.
			vo.setUser_intro("ÀÚ±â¼Ò°³¸¦ ÀÔ·ÂÇØÁÖ¼¼¿ä");
=======
			if (vo.getUser_intro().equals("")) { // ìžê¸°ì†Œê°œë¥¼ ìž…ë ¥í•˜ì§€ ì•Šì•˜ìœ¼ë©´, ê¸°ë³¸ê°’ ë„£ì–´ì£¼ê¸°.
				vo.setUser_intro("ìžê¸°ì†Œê°œë¥¼ ìž…ë ¥í•´ì£¼ì„¸ìš”");
			}

			try {
				joinService.join(vo, ivo); // íšŒì›ì •ë³´,ì´ìƒí˜•ì •ë³´ ì €ìž¥.
			} catch (Exception e) {
				e.printStackTrace();
			}		
			return "login";
>>>>>>> branch 'master' of https://github.com/mj0144/semi_sa.git
		}

		try {
			String images = imgUtils.root_path(request, vo.getUser_img());
			System.out.println("ÄÁÆ®·Ñ·¯¿¡¼­ ÀÌ¹ÌÁö°æ·Î" + images);
			joinService.join(vo, ivo); // È¸¿øÁ¤º¸,ÀÌ»óÇüÁ¤º¸ ÀúÀå.
			lookLikeService.insertLooklike(images, vo ,ivo);

<<<<<<< HEAD
		} catch (Exception e) {
			e.printStackTrace();
=======
		// ì•„ì´ë”” ì¤‘ë³µí™•ì¸
		@RequestMapping("/idchk")
		@ResponseBody
		public int idChk(String id) {
			int res = joinDao.idChk(id);
			return res;
	// íšŒì›ê°€ìž…
	@RequestMapping(value = "/joinaction", method = RequestMethod.POST)
	public String join(MemberVO vo, HttpServletRequest request, MultipartFile file, IdealVO ivo) {

>>>>>>> branch 'master' of https://github.com/mj0144/semi_sa.git
		}
<<<<<<< HEAD
		return "login";
	}
=======
		vo = joinService.yunYeon(vo); // ìƒë…„ì›”ì¼ ê°€ê³µ.
		String ilju = joinDao.ilju(vo);
		vo.setIlju(ilju); // ì¼ì£¼ ì„¸íŒ….
>>>>>>> branch 'master' of https://github.com/mj0144/semi_sa.git

<<<<<<< HEAD
	// ¾ÆÀÌµð Áßº¹È®ÀÎ
	@RequestMapping("/idchk")
	@ResponseBody
	public int idChk(String id) {
		int res = joinDao.idChk(id);
		return res;
=======
		// ë³„ëª… ì¤‘ë³µí™•ì¸.
		@RequestMapping("/nickchk")
		@ResponseBody
		public int nickChk(String nickname) {
			int res = joinDao.nickChk(nickname);
			return res;
		vo.setUser_img(imgUtils.imgSave(request, file, "in", null)); // íŒŒì¼ ì €ìž¥.
>>>>>>> branch 'master' of https://github.com/mj0144/semi_sa.git

<<<<<<< HEAD
	}
=======
		if (vo.getUser_intro().equals("")) { // ìžê¸°ì†Œê°œë¥¼ ìž…ë ¥í•˜ì§€ ì•Šì•˜ìœ¼ë©´, ê¸°ë³¸ê°’ ë„£ì–´ì£¼ê¸°.
			vo.setUser_intro("ìžê¸°ì†Œê°œë¥¼ ìž…ë ¥í•´ì£¼ì„¸ìš”");
		}
>>>>>>> branch 'master' of https://github.com/mj0144/semi_sa.git

<<<<<<< HEAD
	// º°¸í Áßº¹È®ÀÎ.
	@RequestMapping("/nickchk")
	@ResponseBody
	public int nickChk(String nickname) {
		int res = joinDao.nickChk(nickname);
		return res;
=======
	//ì´ë©”ì¼ ì¤‘ë³µí™•ì¸.
		@RequestMapping("/emailchk")
		@ResponseBody
		public int emailchk(String email) {
			int res = joinDao.emailChk(email);
			return res;
		try {
			String images = imgUtils.root_path(request, vo.getUser_img());
			System.out.println("ì»¨íŠ¸ë¡¤ëŸ¬ì—ì„œ ì´ë¯¸ì§€ê²½ë¡œ" + images);
			joinService.join(vo, ivo); // íšŒì›ì •ë³´,ì´ìƒí˜•ì •ë³´ ì €ìž¥.
			lookLikeService.insertLooklike(images, vo ,ivo);
>>>>>>> branch 'master' of https://github.com/mj0144/semi_sa.git

<<<<<<< HEAD
	}

	// ÀÌ¸ÞÀÏ Áßº¹È®ÀÎ.
=======
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "login";
	}

	// ì•„ì´ë”” ì¤‘ë³µí™•ì¸
	@RequestMapping("/idchk")
	@ResponseBody
	public int idChk(String id) {
		int res = joinDao.idChk(id);
		return res;

	}

	// ë³„ëª… ì¤‘ë³µí™•ì¸.
	@RequestMapping("/nickchk")
	@ResponseBody
	public int nickChk(String nickname) {
		int res = joinDao.nickChk(nickname);
		return res;

	}

	// ì´ë©”ì¼ ì¤‘ë³µí™•ì¸.
>>>>>>> branch 'master' of https://github.com/mj0144/semi_sa.git
	@RequestMapping("/emailchk")
	@ResponseBody
	public int emailchk(String email) {
		int res = joinDao.emailChk(email);
		return res;

	}
}
