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
	
	public IljuVO getListResult1(PageVO vo) {//nowpage 등으로 연산된 start, end
		return ss.selectOne("pagelist.listResult1", vo);
	}

	public List<IljuVO> getListResult2(PageVO vo) {//nowpage 등으로 연산된 start, end
		return ss.selectList("pagelist.listResult2", vo);
	}
	
	public List<IljuVO> getListResult3(PageVO vo) {//nowpage 등으로 연산된 start, end
		return ss.selectList("pagelist.listResult3", vo);
	}
	
	public int getTotalCount1(PageVO vo) {//전체 데이터를 기준으로 페이지를 나눌 것이기 때문...
		return ss.selectOne("pagelist.totalCount1",vo);
	}
	
	public int getTotalCount2(PageVO vo) {//전체 데이터를 기준으로 페이지를 나눌 것이기 때문...
		return ss.selectOne("pagelist.totalCount2",vo);
	}

	public int getTotalCount3(PageVO vo) {//전체 데이터를 기준으로 페이지를 나눌 것이기 때문...
		return ss.selectOne("pagelist.totalCount3",vo);
	}
}
