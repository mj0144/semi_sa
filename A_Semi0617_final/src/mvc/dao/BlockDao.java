package mvc.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mvc.vo.LikeVO;
// 이동현
@Repository
public class BlockDao {

   @Autowired private SqlSessionTemplate ss;
   
   //블락 추가
   public void blockPush(HashMap<String, Integer> map) {
	   ss.insert("block.addblock", map);
   }
   
   //블락 취소
   public void blockDel(HashMap<String, Integer> map) {
	   ss.delete("block.delblock", map);
   }

   //블락 리스트 출력
   public List<Integer> blockList(int user_num){
	   return ss.selectList("block.blocklist", user_num);	  
   }
   
   //블락 리스트 출력2
   public List<HashMap<String, Object>> blockListProfile(int user_num){
	   return ss.selectList("block.blocklistprofile", user_num);	  
   }
   

   
	   

   

}