package mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mvc.vo.LikeVO;


@Repository
public class LikeDao {

   @Autowired private SqlSessionTemplate ss;
   
   //좋아요 눌렀을 때
   public void likePush(LikeVO vo) {
	   System.out.println("dao");
      ss.insert("like.follow", vo);
   }
   
   //좋아요 취소할 때
   public void likeCancel(LikeVO vo) {
      ss.delete("like.delete", vo);
   }
   
   public List<LikeVO> likeornot(int user_num) {
	  return ss.selectList("like.LikeorNot", user_num);
   }
}