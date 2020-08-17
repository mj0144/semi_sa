package mvc.service;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import mvc.dao.JoinDao;
import mvc.dao.UserInfoDao;
import mvc.utils.ImgUtils;
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
	private LookLikeService lookLikeService;
	
	@Autowired
	private BoardService boardService;

	//�ٲ� ȸ������ ����
	public void userInfoSetting(HttpSession session, MemberVO vo, HttpServletRequest request, MultipartFile file) {
		JoinService iljusetting = new JoinService();
		
		String img = (String) session.getAttribute("user_img");
		vo.setUser_img(imgUtils.imgSave(request, file, "change", img)); // ���� ����.

		String new_img = imgUtils.root_path(request, vo.getUser_img());
		lookLikeService.updateLooklike(session,new_img, vo);
		
		vo.setUser_num((int) session.getAttribute("user_num"));
				
		// ���� ����.
		iljusetting.yunYeon(vo);
		vo.setIlju(joinDao.ilju(vo));

		try {
			userInfoDao.infoUpdate(vo); //ȸ������ ������Ʈ

		} catch (Exception e) {
			e.printStackTrace();
			// db���� ��, ���ε��� ���� ����
			imgUtils.deleteimg();
		}

		// �ٲﰪ���� ���� ������Ʈ.
		session.setAttribute("name", vo.getName());
		session.setAttribute("ilju", vo.getIlju());
		session.setAttribute("gender", vo.getSex());
		session.setAttribute("user_img", vo.getUser_img());
	}
	

	
	
}
