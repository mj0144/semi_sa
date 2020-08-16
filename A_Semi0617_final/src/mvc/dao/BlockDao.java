package mvc.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mvc.vo.LikeVO;
// �̵���
@Repository
public class BlockDao {

   @Autowired private SqlSessionTemplate ss;
   
   //��� �߰�
   public void blockPush(HashMap<String, Integer> map) {
	   ss.insert("block.addblock", map);
   }
   
   //��� ���
   public void blockDel(HashMap<String, Integer> map) {
	   ss.delete("block.delblock", map);
   }

   //��� ����Ʈ ���
   public List<Integer> blockList(int user_num){
	   return ss.selectList("block.blocklist", user_num);	  
   }
   
   //��� ����Ʈ ���2
   public List<HashMap<String, Object>> blockListProfile(int user_num){
	   return ss.selectList("block.blocklistprofile", user_num);	  
   }
   

   
	   

   

}