package mvc.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import mvc.vo.PaymentVO;
import mvc.vo.ProductVO;

@Repository
public class PayDao {
	@Autowired
	SqlSession ss;
	
	@Transactional
	public void paySingleListInsert(PaymentVO vo) {
		ss.insert("pay.paylistInsert", vo); //paylist에 결제정보 저장.
		ss.insert("pay.singleInsert", vo); //상품에 따른 단/세트 제품 현황테이블에 정보 저장
	}
	@Transactional
	public void paySetListInsert(PaymentVO vo) {
		ss.insert("pay.paylistInsert", vo); //paylist에 결제정보 저장.
		ss.insert("pay.setInsert", vo); //상품에 따른 단/세트 제품 현황테이블에 정보 저장
	}
	
	
	public ProductVO selectProduct_Info(int product_num) {
		ProductVO vo = ss.selectOne("pay.selectproduct_info", product_num);
		return vo;
	}
	
}
