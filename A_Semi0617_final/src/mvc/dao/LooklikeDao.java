package mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mvc.vo.LoveTypeVO;
import mvc.vo.MemberVO;


@Repository
public class LooklikeDao {
	
	@Autowired
	private SqlSessionTemplate ss;
	
	//최신게시글
	public List<MemberVO> lovelist(LoveTypeVO vo) throws Exception {
		 return ss.selectList("lovetype.list", vo);
	}	
}
