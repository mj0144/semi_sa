package mvc.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
import mvc.vo.IljuVO;
import mvc.vo.LikeVO;
import mvc.vo.PageVO;


@Controller
public class PageListController {
	
	@Autowired
	private PageListDao pagelistDao;
	
	@Autowired
	private LikeDao likeDao;
	
	@Autowired
	private BlockDao blockDao;


	@RequestMapping(value= "/listWhole")
	public String listWhole3(Model model, HttpSession session, 
			@RequestParam(value = "sex", required = false, defaultValue = "m,f,a") String sex,
			@RequestParam(value = "samb", required = false, defaultValue = "all") String samb,
			@RequestParam(value = "num", required = false, defaultValue = "1") int num) {
		
		
		System.out.println("num: "+num);
		System.out.println("sex: "+sex);
		System.out.println("samb: "+samb);
		
		//case 1,2
		
		//����� ��ȣ �������� �޾ƿ�
		int user_num=(int)session.getAttribute("user_num");	
		
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
		
		if (num > maxNum) {
			
			System.out.println("���� ��õ�� �̱�");
			
			// ��õ�� �������� �̱�
			profile = pagelistDao.getRProfile(map);
			
			// �������� ��µ� ��õ�� DB�� ����
			HashMap<String, Object> map2 = new HashMap<String, Object>();
			
			user_num2 = ((BigDecimal)profile.get("USER_NUM")).intValue();
			
			map2.put("num", num);
			map2.put("user_num", user_num);
			map2.put("rec_num", user_num2);
			pagelistDao.setRecInsert(map2);
			
		}else if (num <= maxNum) {
			
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
		
		model.addAttribute("heart", listheart);
		model.addAttribute("profile", profile);
		model.addAttribute("ilju", ilju);
		model.addAttribute("mbti", mbti); 
		model.addAttribute("over90", over90);
		model.addAttribute("set", map);
		model.addAttribute("num", num);
		
		return "dailyRecommand";
		
	}
	
	@RequestMapping(value = "/listchk")
	public String listChk(RedirectAttributes rd, HttpSession session, String sex, String samb) {
		
		int user_num = (int) session.getAttribute("user_num");
		int num = pagelistDao.getaMaxnum(user_num)+1;
		
		System.out.println(num);
		
		rd.addAttribute("sex", sex);
		rd.addAttribute("samb", samb);
		rd.addAttribute("num", num);
		
		return "redirect:listWhole";		
	}
	
		
	@ResponseBody
	@RequestMapping(value= "/listChart", produces = "application/json; charset=euc-kr")
	public String listChart(HttpSession session, 
			@RequestParam(value = "sex", required = false, defaultValue = "m,f,a") String sex,
			@RequestParam(value = "samb", required = false, defaultValue = "all") String samb) {
		
		// ���� ���� male, female �� ���ÿ� ���� �� null������ ó��
		if (sex.length() > 1) {
			sex = null;
		}
		
		// ���� ��ȣ �������� �޾ƿ�
		int user_num=(int)session.getAttribute("user_num");	
		
		// ���� ���� ��������
		char sex2 = (char) session.getAttribute("gender");
		String sex3 = String.valueOf(sex2);
		
		// ������ ������ ��� ��� ��������
		List<Integer> blist = blockDao.blockList(user_num);
		
		// ��Ʈ �̱�
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("user_num", user_num);
		map.put("sex2", sex3);
		map.put("blist", blist);
		map.put("sex", sex);
		map.put("samb", samb);
		map.put("score", 90);
		
		int num90 = pagelistDao.getChartCount(map);
		
		map.put("score", 80);
		
		int num80 = pagelistDao.getChartCount(map);
		
		map.put("score", 70);
		
		int num70 = pagelistDao.getChartCount(map);
		
		map.put("score", 60);
		
		int num60 = pagelistDao.getChartCount(map);
		
		Map<String, Integer> map2 = new HashMap<>();
		map2.put("90����", num90);
		map2.put("80����", num80);
		map2.put("70����", num70);
		map2.put("�� ����", num60);
		
		String result = null;
		ObjectMapper mapper = new ObjectMapper();

		try {
			result = mapper.writeValueAsString(map2);
		} catch (JsonMappingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (JsonGenerationException e2) {
			// TODO: handle exception
			e2.printStackTrace();
		} catch (IOException e3) {
			e3.printStackTrace();
		}

		System.out.println(result);
		return result;	
		
	}
	
	@RequestMapping(value = "/sajumodal", method = RequestMethod.GET)
	public ModelAndView sajumodal(int user_num) {
		
		System.out.println(user_num);
		ModelAndView mav = new ModelAndView("sajumodal");
		
		HashMap<String,Object> map = pagelistDao.getilju(user_num);
		
		mav.addObject("result", map);
		
		return mav;
		
	}
	
	@RequestMapping(value = "/mbtimodal", method = RequestMethod.GET)
	public ModelAndView mbtimodal(int user_num) {
		
		System.out.println("mbti"+user_num);
		ModelAndView mav = new ModelAndView("mbtimodal");
		
		HashMap<String,Object> map = pagelistDao.getmbti(user_num);
		
		mav.addObject("result", map);
		
		return mav;
		
	}
	

	

}
