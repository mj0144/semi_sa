
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

public int Boardnum(int user_num) throws Exception{
		
		int cnt=profileDao.board_maxnum(user_num);
		return cnt;
	}

	public List<BoardVO> Board(int num) throws Exception {
	      BoardVO vo = new BoardVO();
	      return profileDao.board_imglist(num);
	   }
}

