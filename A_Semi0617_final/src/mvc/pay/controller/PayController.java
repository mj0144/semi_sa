package mvc.pay.controller;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.annotation.After;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mvc.dao.PayDao;
import mvc.service.PayService;
import mvc.vo.PaymentVO;
import mvc.vo.ProductVO;

@Controller
public class PayController {
	
	@Autowired
	private PayDao payDao;
	@Autowired
	private PayService payService;
	
	
	
	@RequestMapping("/pay")
	public ModelAndView pay(String msg) {
		ModelAndView mav = new ModelAndView("payment/pay_productList");
		mav.addObject("msg", msg);
		return mav;
	}
	@RequestMapping(value="/pay_productcart", method=RequestMethod.GET)
	public ModelAndView pay_productcart(int product_num) {
		ModelAndView mv = new ModelAndView("payment/pay_productcart");
		
		//��ǰ ���� ������ select
		ProductVO vo = payDao.selectProduct_Info(product_num);
		
		mv.addObject("vo", vo);


		return mv;
	}
	
	
	 
	@RequestMapping("/pay_compelte")
	@ResponseBody
	public boolean pay_compelte(PaymentVO vo, HttpSession session) {
		//���� �Ϸ� ���� insert
		payService.payListInsert(vo, session);

		return true;
	}
}
