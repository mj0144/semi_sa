package mvc.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

//�̵���
@Repository
public class PageListDao {
   
   @Autowired
   private SqlSessionTemplate ss;

   
   // ������õ�� �̱� 
   public HashMap<String, Object> getRProfile(HashMap<String, Object> map) {
      return ss.selectOne("pagelist.recProfile", map);
   }
   
   //������ ��õ�޾Ҵ� �ι� ��� 
   public HashMap<String, Object> getReProfile(HashMap<String, Object> map){
      return ss.selectOne("pagelist.reProfile", map);
   }
   
   //��õ�� ���� 
   public HashMap<String, Object> getilju(int user_num) {
      return ss.selectOne("pagelist.profileilju", user_num);
   }
   
   //��õ�� mbti 
   public HashMap<String, Object> getmbti(int user_num) {
      return ss.selectOne("pagelist.profilembti", user_num);
   }
   
   //90�� �̻��� �� �ۼ�Ʈ���� ���
   public int getover90(HashMap<String, Object> map) {
      if (ss.selectOne("pagelist.over90", map) == null) {
         return 0;
      }else {
         return ss.selectOne("pagelist.over90", map);         
      }
   }

   //��õ�� ����Ʈ�� �ֱ� 
   public void setRecInsert(HashMap<String, Object> map) {
      ss.insert("pagelist.recinsert", map);
   }
   
   //����� ��õ���� �� ������ ���
   public int getaMaxnum(int user_num) {
      if (ss.selectOne("pagelist.maxnum", user_num) == null) {
         return 0;
      }else {
         return ss.selectOne("pagelist.maxnum", user_num);
      }      
   }
   
   // ���� 0�ð� �Ǹ� ��õ�� ������ DB ����
   public void delRprofile() {
      ss.delete("pagelist.delRprofile");
   }
   
   // ��Ʈ �̱�
   public HashMap<String, Object> getChart(HashMap<String, Object> map){
      return ss.selectOne("pagelist.score_chart", map);
   }
   
   // ���� �̱�
   public HashMap<String, Object> getrecScore(HashMap<String, Object> map){
      return ss.selectOne("pagelist.recScore", map);
   }
   
}