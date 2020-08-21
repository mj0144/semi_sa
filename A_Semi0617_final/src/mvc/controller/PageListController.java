package mvc.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.security.KeyStore.Entry;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.javassist.expr.NewArray;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import mvc.dao.BlockDao;
import mvc.dao.LikeDao;
import mvc.dao.PageListDao;
import mvc.vo.LikeVO;


//�̵���
@Controller
public class PageListController {
	
	@Autowired
	private PageListDao pagelistDao;
	
	@Autowired
	private LikeDao likeDao;
	
	@Autowired
	private BlockDao blockDao;

	@RequestMapping(value="/listWholeGet", method=RequestMethod.GET)
	public String listWholeGet(String paymember, RedirectAttributes ar) {
		System.out.println("listwolget");
		ar.addAttribute("sex", "");
		ar.addAttribute("samb", "");
		ar.addAttribute("num", "");
		ar.addAttribute("paymember", paymember);
		return "redirect:/listWhole";
	}
	
	
	//����Ʈ �̱�
	@RequestMapping(value= "/listWhole")
	public String listWhole3(Model model, HttpSession session, 
			@RequestParam(value = "sex", required = false, defaultValue = "m,f,a") String sex,
			@RequestParam(value = "samb", required = false, defaultValue = "all") String samb,
			@RequestParam(value = "num", required = false, defaultValue = "1") int num,
			HttpServletRequest request) {
		
		//����� ��ȣ �������� �޾ƿ�
		int user_num=(int)session.getAttribute("user_num");	
		
		//������� ��������/ 10:����x 20:����o
		int paymember = (int) request.getAttribute("paymember");
		System.out.println("paymember : " + paymember);
		// ���� ���� male, female �� ���ÿ� ���� �� null������ ó��
		if (sex.length() > 1) {
			sex = null;
		}
		
		// ������ ������ ��� ��� ��������
		List<Integer> blist = blockDao.blockList(user_num);
		
		// ������ ���ƿ� ���� ��� ����Ʈ ��������
		List<LikeVO> listheart = likeDao.likeornot(user_num);
		
		//���� db�� ����� �� �� ���� ū ���� ������.
		int maxNum = pagelistDao.getaMaxnum(user_num);
		
		// ���� ���� ��������
		char sex2 = (char) session.getAttribute("gender");
		String sex3 = String.valueOf(sex2);
		
		//��õ�� �̱� ���� �Ķ���� hashmap
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("user_num", user_num);
		map.put("sex2", sex3);
		map.put("blist", blist);
		map.put("sex", sex);
		map.put("samb", samb);
		map.put("num", num);
		
		//��õ�� ���� ���� HashMap ����
		HashMap<String, Object> profile = null;;
		
		//��õ�� ��ȣ�� ���� int ���� ����
		int user_num2=0;
		
		// ���ο� ���� ��õ�� �� ���
		if (num > maxNum) {
			
			System.out.println("���� ��õ�� �̱�");
			System.out.println(user_num);
			
			// ��õ�� �������� �̱�
			profile = pagelistDao.getRProfile(map);
		
			// �������� ��µ� ��õ�� DB�� ����
			HashMap<String, Object> map2 = new HashMap<String, Object>();
			
			System.out.println(profile.get("USER_NUM"));
			
			user_num2 = ((BigDecimal)profile.get("USER_NUM")).intValue();
			
			map2.put("num", num);
			map2.put("user_num", user_num);
			map2.put("rec_num", user_num2);
			pagelistDao.setRecInsert(map2);
			
		}else if (num <= maxNum) { // ���� ��õ ����� ������ ���
			
			System.out.println("���� ��õ�� ��������");
			
			//���� ��õ�� ��������
			profile = pagelistDao.getReProfile(map);
			System.out.println(profile);
			
			user_num2 = ((BigDecimal)profile.get("USER_NUM")).intValue();
		
		}
		
		
		// ��õ�� ���� ��������
		HashMap<String, Object> ilju = pagelistDao.getilju(user_num2);
		
		// ��õ�� MBTI ��������
		HashMap<String, Object> mbti = pagelistDao.getmbti(user_num2);

		// 90�� �̻��� ����� ��ü���� �� �ۼ�Ʈ���� ��������
		int over90 = pagelistDao.getover90(map);
		
		//
		
		model.addAttribute("paymember", paymember);
		model.addAttribute("heart", listheart);
		model.addAttribute("profile", profile);
		model.addAttribute("ilju", ilju);
		model.addAttribute("mbti", mbti); 
		model.addAttribute("over90", over90);
		model.addAttribute("set", map);
		model.addAttribute("num", num);
		
		return "dailyRecommand";
		
	}

	
	//���� ��� �̱�
	@RequestMapping(value = "/sajumodal", method = RequestMethod.GET)
	public ModelAndView sajumodal(int user_num) {
		
		System.out.println(user_num);
		ModelAndView mav = new ModelAndView("sajumodal");
		
		HashMap<String,Object> map = pagelistDao.getilju(user_num);
		
		mav.addObject("result", map);
		
		return mav;
		
	}
	
	//mbti��� ��������
	@RequestMapping(value = "/mbtimodal", method = RequestMethod.GET)
	public ModelAndView mbtimodal(int user_num) {
		
		System.out.println("mbti"+user_num);
		ModelAndView mav = new ModelAndView("mbtimodal");
		
		HashMap<String,Object> map = pagelistDao.getmbti(user_num);
		
		mav.addObject("result", map);
		
		return mav;
		
	}
	
	
	@ResponseBody
	@RequestMapping(value= "/listChart")
	public HashMap<String, Object> listChart(HttpSession session, 
			@RequestParam(value = "sex", required = false, defaultValue = "m,f,a") String sex,
			@RequestParam(value = "samb", required = false, defaultValue = "all") String samb,
			int rec_num
			
			) {
		
		System.out.println("��õ�� ��ȣ: " + rec_num);
		
		//���� ���� male, female �� ���ÿ� ���� �� null������ ó��
		if (sex.length() > 1) {
			sex = null;
		}
		
		// ���� ��ȣ �������� �޾ƿ�
		int user_num=(int)session.getAttribute("user_num");	
		
		// ���� ���� ��������
		char sex2 = (char) session.getAttribute("gender");
		String sex3 = String.valueOf(sex2);
		
		// ��Ʈ �̱�
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("user_num", user_num);
		map.put("sex2", sex3);
		map.put("sex", sex);
		map.put("samb", samb);
		map.put("rec_num", rec_num);
		
		HashMap<String, Object> map2 = pagelistDao.getChart(map);
		
		System.out.println(map2);
		
		return map2;	
		
	}
	

	

}
