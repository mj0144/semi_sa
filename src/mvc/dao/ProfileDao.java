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
	//�̸� , �̹���, �ڱ�Ұ�
	public MemberVO result_basic(int num) {
		MemberVO vo = new MemberVO();
		vo=ss.selectOne("profile.sajuBasic", num);
		 return  vo;
	}
	//�ȷο�
	public int cnt1(int num) {
		int cnt = ss.selectOne("profile.follow", num);
		return cnt;
	}
	//�ȷο�
	public int cnt2(int num) {
		int cnt = ss.selectOne("profile.follower", num);
		return cnt;
	}
	//�ֽŰԽñ�
	public List<BoardVO> board_imglist(int num) throws Exception {
		 return ss.selectList("profile.board", num);
	}		
	//�Խñۼ���
	public BoardVO board_maxnum(int num) throws Exception {
		BoardVO vo = new BoardVO();
		vo=ss.selectOne("profile.boardmaxnum", num);
		 return  vo;
	}
	
}
