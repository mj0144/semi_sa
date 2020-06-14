
package mvc.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mvc.dao.ProfileDao;
import mvc.vo.BoardVO;
import mvc.vo.MemberVO;

@Service
public class FriendService {

	@Autowired
	private ProfileDao profileDao;

	public BoardVO Boardnum(HttpSession session) throws Exception{
		BoardVO vo = new BoardVO();
		int num = (int) session.getAttribute("user_num");
		vo=profileDao.board_maxnum(num);
		return vo;
	}
	public List<BoardVO> Board(int num) throws Exception {
	      BoardVO vo = new BoardVO();
	    //  int num = (int) session.getAttribute("user_num");
	      return profileDao.board_imglist(num);
	   }
}

