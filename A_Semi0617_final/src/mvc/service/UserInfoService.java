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
	private UserInfoDao userInfoDao;

	@Autowired
	private ImgUtils imgUtils;

	@Autowired
	private JoinDao joinDao;

	@Autowired
	private LikeService likeService;
	
	@Autowired
	private BoardService boardService;
	//�ٲ� ȸ������ ����
	public MemberVO userInfoSetting(HttpSession session, MemberVO vo, HttpServletRequest request, MultipartFile file) {
		JoinService iljusetting = new JoinService();

		
		String img = (String) session.getAttribute("user_img");
		vo.setUser_img(imgUtils.imgSave(request, file, "change", img)); // ���� ����.
		vo.setUser_num((int) session.getAttribute("user_num"));
		
		
		// ���� ����.
		iljusetting.yunYeon(vo);
		vo.setIlju(joinDao.ilju(vo));

		try {
			userInfoDao.infoUpdate(vo); //ȸ������ ������Ʈ

		} catch (Exception e) {
			System.out.println("db����"); // db���� ��, ���ε��� ���� ����.
			imgUtils.deleteimg();
		}

		// �ٲﰪ���� ���� ������Ʈ.
		session.setAttribute("name", vo.getName());
		session.setAttribute("ilju", vo.getIlju());
		session.setAttribute("gender", vo.getSex());

		session.setAttribute("user_img", vo.getUser_img());
		
		
		return vo;
	}
	
	
	//������������ �ٽ� �Ѿ�� ���� �� ����
	public ModelAndView mypageSetting(HttpSession session, MemberVO vo, ModelAndView mav) {
		
		int boadcount=0; //�ø� �Խù� ��
		int cnt1 =likeService.like1(session); //�ȷο� ��
		int cnt2 =likeService.like2(session); //�ȷο� ��
		
		List<BoardVO> list = new ArrayList<BoardVO>();
		try {
			list = boardService.Board(session); //�ø� �Խù� ���
			boadcount=boardService.Boardmax(session);//�ø� �Խù� ��
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
