package mvc.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mvc.vo.IljuVO;
import mvc.vo.PageVO;


@Repository
public class PageListDao {
	
	@Autowired
	private SqlSessionTemplate ss;
	
	public List<IljuVO> getSearchlist(PageVO vo) {
		return ss.selectList("pagelist.searchlist", vo);
	}
	
	public int getTotalCountSearch(PageVO vo) {
		return ss.selectOne("pagelist.totalCountSearch", vo);
	}
	
	public int getTotalListCount(PageVO vo) {
		System.out.println(vo.getSex2());
		System.out.println(vo.getSex2().getClass().getName());
		return ss.selectOne("pagelist.totalListCount",vo);
	}
	public List<HashMap<String, Object>> getTotalList(PageVO vo) {
		return ss.selectList("pagelist.totalList", vo);
	}
	
	public String getUserSex(int user_num) {
		return ss.selectOne("pagelist.usersex", user_num);
	}
	
}
