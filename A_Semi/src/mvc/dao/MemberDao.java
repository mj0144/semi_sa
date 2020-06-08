package mvc.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mvc.vo.MemberVO;

@Repository
public class MemberDao {

   @Autowired
   private SqlSessionTemplate ss;
   
   public MemberVO logindo(MemberVO vo) {
      return ss.selectOne("member.login", vo);
   }
}
