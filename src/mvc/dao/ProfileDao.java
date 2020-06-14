package mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mvc.vo.BoardVO;
import mvc.vo.LikeVO;
import mvc.vo.MemberVO;

@Repository
public class ProfileDao {

	@Autowired
	private SqlSessionTemplate ss;
	//이름 , 이미지, 자기소개
	public MemberVO result_basic(int num) {
		MemberVO vo = new MemberVO();
		vo=ss.selectOne("profile.sajuBasic", num);
		 return  vo;
	}
	//팔로우
	public int cnt1(int num) {
		int cnt = ss.selectOne("profile.follow", num);
		return cnt;
	}
	//팔로워
	public int cnt2(int num) {
		int cnt = ss.selectOne("profile.follower", num);
		return cnt;
	}
	//최신게시글
	public List<BoardVO> board_imglist(int num) throws Exception {
		 return ss.selectList("profile.board", num);
	}		
	//게시글숫자
	public BoardVO board_maxnum(int num) throws Exception {
		BoardVO vo = new BoardVO();
		vo=ss.selectOne("profile.boardmaxnum", num);
		 return  vo;
	}
	
}
