package mvc.dao;

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
	
	//skynum, landnum 받기
	public IljuVO sajuilju(int user_num) {
		return ss.selectOne("pagelist.iljuselect", user_num);
	}
	
	//사용자 성별
	public String sexdt(int user_num) {
		return ss.selectOne("pagelist.sexdt", user_num);
	}
	
	public IljuVO getListResult1(PageVO vo) {
		return ss.selectOne("pagelist.listResult1", vo);
	}

	public List<IljuVO> getListResult2(PageVO vo) {
		return ss.selectList("pagelist.listResult2", vo);
	}
	
	public List<IljuVO> getListResult3(PageVO vo) {
		return ss.selectList("pagelist.listResult3", vo);
	}
	
	public IljuVO getListWhole1(PageVO vo) {
		return ss.selectOne("pagelist.listWhole1", vo);
	}
	
	public List<IljuVO> getListWhole2(PageVO vo) {
		return ss.selectList("pagelist.listWhole2", vo);
	}
	
	public List<IljuVO> getListWhole3(PageVO vo) {
		return ss.selectList("pagelist.listWhole3", vo);
	}
	
	public List<IljuVO> getSearchlist(PageVO vo) {
		return ss.selectList("pagelist.searchlist", vo);
	}
	
	public int getTotalCount1(PageVO vo) {
		return ss.selectOne("pagelist.totalCount1",vo);
		
	}
	
	public int getTotalCount2(PageVO vo) {
		return ss.selectOne("pagelist.totalCount2",vo);
	}

	public int getTotalCount3(PageVO vo) {
		return ss.selectOne("pagelist.totalCount3",vo);
	}
	
	public int getTotalCountWhole1(PageVO vo) {
		return ss.selectOne("pagelist.totalCountWhoel1",vo);
	}
	
	public int getTotalCountWhole2(PageVO vo) {
		return ss.selectOne("pagelist.totalCountWhole2",vo);
	}
	
	public int getTotalCountWhole3(PageVO vo) {
		return ss.selectOne("pagelist.totalCountWhole3",vo);
	}
	
	public int getTotalCountSearch(PageVO vo) {
		return ss.selectOne("pagelist.totalCountSearch", vo);
	}
}
