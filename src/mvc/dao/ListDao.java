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
	
	//õ������ dao ����
	public IljuVO listResultM(IljuVO vo){
		return ss.selectOne("list.listResultm", vo);		
	}
	
	//õ������ dao ����
	public IljuVO listResultF(IljuVO vo){
		return ss.selectOne("list.listResultf", vo);		
	}
	
	//���� �����ִ� ��� dao ����
	public List<IljuVO> listResultm2(Map<String, Integer> map){
		return ss.selectList("list.listResultm2", map);		
	}
	
	//���� �����ִ� ��� dao ����
	public List<IljuVO> listResultf2(Map<String, Integer> map){
		return ss.selectList("list.listResultf2", map);		
	}
	
	//��ü ����
	public List<IljuVO> listResultmf(){
		return ss.selectList("list.listfullm");
	}
	
	//��ü ����
	public List<IljuVO> listResultff(){
		return ss.selectList("list.listfullf");
	}
	
	//����� ����
	public String sexdt(int user_num) {
		return ss.selectOne("list.sexdt", user_num);
	}
	


}
