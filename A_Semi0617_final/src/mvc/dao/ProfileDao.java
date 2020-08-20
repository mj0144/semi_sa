package mvc.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import mvc.vo.BoardVO;
import mvc.vo.MemberVO;

//(����)

@Repository
public class ProfileDao {

	@Autowired
	private SqlSessionTemplate ss;
	//�̸� , �̹���, �ڱ�Ұ�
	public MemberVO result_basic(int num) {
		MemberVO vo = ss.selectOne("profile.sajuBasic", num);
		 return vo;
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
	public int board_maxnum(int num) throws Exception {
		int count =ss.selectOne("profile.boardmaxnum", num);
		 return  count;
	}		
	
	//ȸ��Ż��
	public MemberVO delete(int num) {
		MemberVO vo = ss.selectOne("profile.delete", num);
		 return vo;
	}
	
	//��й�ȣ �� Ż������Է���, ȸ��Ż���ư ������ 
	//Transaction ó��
		@Transactional
		public void deleteconfirm(MemberVO vo) {
			ss.insert("profile.withdrawalInsert", vo);
			ss.delete("profile.deletereason", vo.getUser_id());
		}
		
	//follow List
      public List<HashMap<String, Object>> followlist(int num) {
         return ss.selectList("profile.followlist", num);
      }
	      
	     //follower List
	     public List<HashMap<String, Object>> followerlist(int num){
	        return ss.selectList("profile.followerlist", num);
	     }
}
