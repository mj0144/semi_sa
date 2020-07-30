package mvc.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BlockDao {

   @Autowired private SqlSessionTemplate ss;
   
   //��� ������ ��
   public void blockPush(HashMap<String, Integer> map) {
	   ss.insert("block.block", map);
   }

   //��� ����Ʈ ���
   public List<Integer> blockList(int user_num){
	   return ss.selectList("block.blocklist", user_num);	  
   }
	   

   

}