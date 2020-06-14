package mvc.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public abstract class FeedAbstract {
	
	@Autowired
	SqlSessionTemplate ss;

	public Object selectList(String nameSpace, Object param) throws Exception {
		return ss.selectList(nameSpace, param);
	}
	
	public Object selectList(String nameSpace) throws Exception {
		return ss.selectList(nameSpace);
	}
	
	public Object selectOne(String nameSpace, Object param) throws Exception {
		return ss.selectOne(nameSpace, param);
	}
	
	public int insert(String nameSpace, Object param) throws Exception {
		return ss.insert(nameSpace, param);
	}
	
	public int update(String nameSpace, Object param) throws Exception {
		return ss.update(nameSpace, param);
	}
	
	public void delete(String nameSpace, Object param) throws Exception {
		delete(nameSpace, param);
	}
	
}
