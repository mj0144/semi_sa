
package mvc.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mvc.dao.ProfileDao;
import mvc.vo.BoardVO;
import mvc.vo.MemberVO;

@Service
public class BoardService {

	
	@Autowired
	private ProfileDao profileDao;
	//board_img들
	public List<BoardVO> Board(HttpSession session) throws Exception {
		BoardVO vo = new BoardVO();
		int num = (int) session.getAttribute("user_num");
		return profileDao.board_imglist(num);
	}
	
	//board 게시글수
	public BoardVO Boardmax(HttpSession session) throws Exception {
		int num = (int) session.getAttribute("user_num");
		BoardVO vo = new BoardVO();
		vo= profileDao.board_maxnum(num);
		return vo;
	}
}
