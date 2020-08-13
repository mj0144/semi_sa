package mvc.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class PageListDao {
	
	@Autowired
	private SqlSessionTemplate ss;

	
	// 랜덤추천인 뽑기 
	public HashMap<String, Object> getRProfile(HashMap<String, Object> map) {
		return ss.selectOne("pagelist.recProfile", map);
	}
	
	//이전에 추천받았던 인물 출력 
	public HashMap<String, Object> getReProfile(HashMap<String, Object> map){
		return ss.selectOne("pagelist.reProfile", map);
	}
	
	//추천인 사주 
	public HashMap<String, Object> getilju(int user_num) {
		return ss.selectOne("pagelist.profileilju", user_num);
	}
	
	//추천인 mbti 
	public HashMap<String, Object> getmbti(int user_num) {
		return ss.selectOne("pagelist.profilembti", user_num);
	}
	
	//차트 출력 
	public int getChartCount(HashMap<String, Object> map) {
		return ss.selectOne("pagelist.ChartCount", map);
	}
	
	//90점 이상이 몇 퍼센트인지 출력
	public int getover90(HashMap<String, Object> map) {
		if (ss.selectOne("pagelist.over90", map) == null) {
			return 0;
		}else {
			return ss.selectOne("pagelist.over90", map);			
		}
	}

	//추천인 리스트에 넣기 
	public void setRecInsert(HashMap<String, Object> map) {
		ss.insert("pagelist.recinsert", map);
	}
	
	//저장된 추천인이 몇 명인지 출력
	public int getaMaxnum(int user_num) {
		if (ss.selectOne("pagelist.maxnum", user_num) == null) {
			return 0;
		}else {
			return ss.selectOne("pagelist.maxnum", user_num);
		}		
	}
	
	// 매일 0시가 되면 추천인 저장한 DB 삭제
	public void delRprofile() {
		ss.delete("pagelist.delRprofile");
	}		
	
}
