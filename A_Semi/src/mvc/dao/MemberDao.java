package mvc.dao;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mvc.vo.MemberVO;

@Repository
public class MemberDao {

	//로그인체크
   @Autowired
   private SqlSessionTemplate ss;
   
   public boolean loginCheck(MemberVO vo) {
	   String name = ss.selectOne("member.login",vo);
	   return (name == null)? false : true;
   }
   
   //회원 로그인 정보
   public MemberVO viewUser(MemberVO vo) {
	   return ss.selectOne("member.viewUser", vo);
   }
   
   //로그아웃
   public void logout(HttpSession session) {
	   
   }
   
   
}
