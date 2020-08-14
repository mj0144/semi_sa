package mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mvc.vo.LikeVO;

//  ���ƿ� (����)
@Repository
public class LikeDao {

   @Autowired private SqlSessionTemplate ss;
   
   //���ƿ� ������ ��
   public void likePush(LikeVO vo) {
      ss.insert("like.follow", vo);
   }
   
   //���ƿ� ����� ��
   public void likeCancel(LikeVO vo) {
      ss.delete("like.delete", vo);
   }
   
   public List<LikeVO> likeornot(int user_num) {
	  return ss.selectList("like.LikeorNot", user_num);
   }
}