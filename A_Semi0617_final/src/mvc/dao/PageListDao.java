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
		return ss.selectOne("pagelist.totalListCount",vo);
	}
	public List<HashMap<String, Object>> getTotalList(PageVO vo) {
		return ss.selectList("pagelist.totalList", vo);
	}
	
	public int getChartCount(HashMap<String, Object> map) {
		return ss.selectOne("pagelist.ChartCount", map);
	}
	
}
