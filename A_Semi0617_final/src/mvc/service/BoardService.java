
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
	//board_img��
	public List<BoardVO> Board(HttpSession session) throws Exception {
		BoardVO vo = new BoardVO();
		int num = (int) session.getAttribute("user_num");
		return profileDao.board_imglist(num);
	}
	
	//board �Խñۼ�
		public int Boardmax(HttpSession session) throws Exception {
			int num = (int) session.getAttribute("user_num");
			int count= profileDao.board_maxnum(num);
			return count;
		}
}
