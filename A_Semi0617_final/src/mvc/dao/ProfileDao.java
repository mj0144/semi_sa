package mvc.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import mvc.vo.BoardVO;
import mvc.vo.MemberVO;

//(성현)

@Repository
public class ProfileDao {

	@Autowired
	private SqlSessionTemplate ss;
	//이름 , 이미지, 자기소개
	public MemberVO result_basic(int num) {
		MemberVO vo = ss.selectOne("profile.sajuBasic", num);
		 return vo;
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
	public int board_maxnum(int num) throws Exception {
		int count =ss.selectOne("profile.boardmaxnum", num);
		 return  count;
	}		
	
	//회원탈퇴
	public MemberVO delete(int num) {
		MemberVO vo = ss.selectOne("profile.delete", num);
		 return vo;
	}
	
	//비밀번호 및 탈퇴사유입력후, 회원탈퇴버튼 누를시 
	//Transaction 처리
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
