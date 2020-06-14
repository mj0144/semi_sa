package mvc.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mvc.controller.SajuController;
import mvc.vo.IljuVO;
import mvc.vo.MemberVO;
import mvc.vo.IljuVO;

@Repository
public class ListDao {
	
	@Autowired
	private SqlSessionTemplate ss;
	
	public IljuVO sajuilju(int user_num) {
		return ss.selectOne("list.iljuselect", user_num);
	}
	
	//천생연분 dao 남자
	public IljuVO listResultM(IljuVO vo){
		return ss.selectOne("list.listResultm", vo);		
	}
	
	//천생연분 dao 여자
	public IljuVO listResultF(IljuVO vo){
		return ss.selectOne("list.listResultf", vo);		
	}
	
	//나를 도와주는 사람 dao 남자
	public List<IljuVO> listResultm2(Map<String, Integer> map){
		return ss.selectList("list.listResultm2", map);		
	}
	
	//나를 도와주는 사람 dao 여자
	public List<IljuVO> listResultf2(Map<String, Integer> map){
		return ss.selectList("list.listResultf2", map);		
	}
	
	//전체 남자
	public List<IljuVO> listResultmf(){
		return ss.selectList("list.listfullm");
	}
	
	//전체 여자
	public List<IljuVO> listResultff(){
		return ss.selectList("list.listfullf");
	}
	
	//사용자 성별
	public String sexdt(int user_num) {
		return ss.selectOne("list.sexdt", user_num);
	}
	


}
