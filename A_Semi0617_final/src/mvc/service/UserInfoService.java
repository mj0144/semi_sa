package mvc.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import mvc.dao.JoinDao;
import mvc.dao.UserInfoDao;
import mvc.utils.ImgUtils;
import mvc.vo.BoardVO;
import mvc.vo.MemberVO;

@Service
public class UserInfoService {
	
	@Autowired
	private LookLikeService lookLikeService;
	
	@Autowired
	private UserInfoDao userInfoDao;

	@Autowired
	private ImgUtils imgUtils;

	@Autowired
	private JoinDao joinDao;

	@Autowired
	private LikeService likeService;
	
	@Autowired
	private LookLikeService lookLikeService;
	
	@Autowired
	private BoardService boardService;
	//바뀐 회원정보 세팅
	public MemberVO userInfoSetting(HttpSession session, MemberVO vo, HttpServletRequest request, MultipartFile file) {
		JoinService iljusetting = new JoinService();

		
		String img = (String) session.getAttribute("user_img");
<<<<<<< HEAD
		vo.setUser_img(imgUtils.imgSave(request, file, "change", img)); // ���� ����.

		String new_img = imgUtils.root_path(request, vo.getUser_img());
		lookLikeService.updateLooklike(session,new_img, vo);
		
=======
		vo.setUser_img(imgUtils.imgSave(request, file, "change", img)); // 파일 저장.
>>>>>>> branch 'master' of https://github.com/mj0144/semi_sa.git
		vo.setUser_num((int) session.getAttribute("user_num"));
		
		String new_img = imgUtils.root_path(request, vo.getUser_img()); //닮은꼴 새로 
		lookLikeService.updateLooklike(session,new_img, vo);
		
		// 일주 세팅.
		iljusetting.yunYeon(vo);
		vo.setIlju(joinDao.ilju(vo));

		try {
			userInfoDao.infoUpdate(vo); //회원정보 업데이트

		} catch (Exception e) {
			System.out.println("db오류"); // db오류 시, 업로드한 파일 삭제.
			e.printStackTrace();
			imgUtils.deleteimg();
		}

		// 바뀐값으로 세션 업데이트.
		session.setAttribute("name", vo.getName());
		session.setAttribute("ilju", vo.getIlju());
		session.setAttribute("gender", vo.getSex());

		session.setAttribute("user_img", vo.getUser_img());
		
		
		return vo;
	}
	
	
	//마이페이지로 다시 넘어가기 위한 값 세팅
	public ModelAndView mypageSetting(HttpSession session, MemberVO vo, ModelAndView mav) {
		
		int boadcount=0; //올린 게시물 수
		int cnt1 =likeService.like1(session); //팔로우 수
		int cnt2 =likeService.like2(session); //팔로워 수
		
		List<BoardVO> list = new ArrayList<BoardVO>();
		try {
			list = boardService.Board(session); //올린 게시물 목록
			boadcount=boardService.Boardmax(session);//올린 게시물 수
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mav.setViewName("mypage");
		
		mav.addObject("member", vo);
		mav.addObject("cnt2", cnt2);
		mav.addObject("cnt1", cnt1);
		mav.addObject("boardlist", list);
		mav.addObject("maxnum", boadcount);
		
		return mav;
		
	}
	
	
}
