package mvc.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	//���� ���ƿ並 ���� ���� ī��Ʈ
	public int friendlike(int num) {
		return ss.selectOne("friend.like",num );
	}
	
	
	//���� ���ƿ� ������ ���� ī��Ʈ
	public int friendliked(int num) {
		return ss.selectOne("friend.liked",num );
	}
	
	public BoardVO boardlike(int num) {
		BoardVO vo = new BoardVO();
		vo=ss.selectOne("profile.boardmaxnum", num);
		return vo;
	}
	
	//���ƿ� ���� Ȯ��
	public int heartChk(Map<String,Integer> map) {
		return ss.selectOne("friend.heartchk", map);
	}
	
	public List<BoardVO> board_info(int user_num){
		return ss.selectList("friend.board_info", user_num);
	}
	
	//��� ���� Ȯ��
	public int blockChk(Map<String,Integer> map) {
		return ss.selectOne("friend.blockchk", map);
	}
	
	//유저 신고
		public void reportUser(HashMap<String, Object> params) throws Exception{
			ss.insert("friend.reportUser", params);
		}
	
}
