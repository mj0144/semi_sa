package mvc.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mvc.vo.BoardVO;
import mvc.vo.IljuVO;
import mvc.vo.LikeVO;
import mvc.vo.MemberVO;

@Repository
public class FriendDao {
	
	@Autowired
	private SqlSessionTemplate ss;
	
	
	public IljuVO friendprofile(int num) {
		return ss.selectOne("friend.sajuBasic", num);
	}
	
	public int friendlike(int num) {
		return ss.selectOne("friend.follow",num );
	}
	
	public int friendlike1(int num) {
		return ss.selectOne("friend.follower",num );
	}
	
	public BoardVO boardlike(int num) {
		BoardVO vo = new BoardVO();
		vo=ss.selectOne("profile.boardmaxnum", num);
		return vo;
	}
}
