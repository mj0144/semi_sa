package mvc.dao;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mvc.vo.MemberVO;

@Repository
public class MemberDao {

	//�α���üũ
   @Autowired
   private SqlSessionTemplate ss;
   
   public boolean loginCheck(MemberVO vo) {
	   String name = ss.selectOne("member.login",vo);
	   return (name == null)? false : true;
   }
   
   //ȸ�� �α��� ����
   public MemberVO viewUser(MemberVO vo) {
	   return ss.selectOne("member.viewUser", vo);
   }
   
   //�α׾ƿ�
   public void logout(HttpSession session) {
	   
   }
   
   
}
