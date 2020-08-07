package mvc.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String listWhole3(PageVO vo, Model model, HttpSession session, 
			@RequestParam(value = "nowPage", required = false, defaultValue = "1") String nowPage,
			@RequestParam(value = "cntPerPage", required = false, defaultValue = "10") String cntPerPage,
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
		
		// ���� ����Ʈ ��������
		List<IljuVO> list = null;
		
		PageVO svo = new PageVO();
		svo.setUser_num(user_num);
		svo.setBlist(blist);
		svo.setSex(sex);
		svo.setSamb(samb);
		svo.setSex2(sex3);
		
		int total2 = pagelistDao.getTotalListCount(svo);
		System.out.println("number"+total2);
		
		//int total = pagelistDao.getTotalCountWhole3(svo);
		
		vo = new PageVO(total2, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		vo.setUser_num(user_num);
		vo.setBlist(blist);
		vo.setSex(sex);
		vo.setSamb(samb);
		vo.setSex2(sex3);
		
		//list = pagelistDao.getListWhole3(vo);
		List<HashMap<String, Object>> list3 = pagelistDao.getTotalList(vo);
		
		System.out.println(list3);
		System.out.println(list3.size());
		System.out.println(list3.get(0).get("USER_NUM"));
		
		// ������ ���ƿ� ���� ��� ����Ʈ ��������
		List<LikeVO> list2 = likeDao.likeornot(user_num);
		
		
		model.addAttribute("heart", list2);
		model.addAttribute("pm", "listWhole");
		model.addAttribute("paging", vo);			
		model.addAttribute("list", list3);
		
		return "listTypeC";
		
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
		
		// jquery�� ����¡ ó���� ���� ���
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
		
		System.out.println("90����:"+num90);
		System.out.println("80����:"+num80);
		System.out.println("70����:"+num70);
		System.out.println("�� ����:"+num60);

		
		
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
	
	
//	@RequestMapping(value= "/listSearch", params = "code=1")
//	public String listSearch(PageVO vo, Model model, HttpSession session, String code,
//			@RequestParam(value = "nowPage", required = false, defaultValue = "1") String nowPage,
//			@RequestParam(value = "cntPerPage", required = false, defaultValue = "10") String cntPerPage) {
//	 
//		System.out.println("���� �ϴ�?");
//	 
//		String searchType = vo.getSearchType(); String searchValue = vo.getSearchValue();
//		System.out.println(searchType); 
//		System.out.println(searchValue);
//	 
//		int user_num=(int)session.getAttribute("user_num");
//		System.out.println(user_num);
//	 
//		String sex = pagelistDao.sexdt(user_num).trim(); 
//		System.out.println(sex);
//	 
//		List<IljuVO> list = null;
//		
//		List<Integer> blist = blockDao.blockList(user_num);
//	 
//		PageVO svo = new PageVO(); 
//		svo.setUser_num(user_num);
//	 
//		if (searchType.equals("2")) { 
//			System.out.println("2�϶�");
//			sex = pagelistDao.sexdt(user_num).trim(); 
//			}
//		else if (searchType.equals("1")) { 
//			if (sex.equals("m")) { 
//				System.out.println("1�� f");
//				sex = "f"; 
//				} else { 
//					System.out.println("1�� m");
//				sex = "m"; 
//				}
//		}else {
//			System.out.println("�ȵ���");
//		}
//		System.out.println(sex);
//	 
//		svo.setSex(sex.charAt(0)); 
//		svo.setSearchType(vo.getSearchType());
//		svo.setSearchValue(vo.getSearchValue());
//		svo.setBlist(blist);
//	  
//		int total = pagelistDao.getTotalCountSearch(svo); System.out.println(total);
//	 
//		vo = new PageVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
//		vo.setUser_num(user_num);
//		vo.setSex(sex.charAt(0)); vo.setSearchType(searchType);
//		vo.setSearchValue(searchValue);
//		vo.setBlist(blist);
//	 
//		System.out.println("user_num: "+ user_num);
//		System.out.println(vo.toString()); System.out.println("searchType: "+ vo.getSearchType()); 
//		System.out.println("searchValue: "+ vo.getSearchValue());
//		list = pagelistDao.getSearchlist(vo);
//	  
//		List<LikeVO> list2 = likeDao.likeornot(user_num);
//	  
//		model.addAttribute("heart", list2); 
//		model.addAttribute("pm", "listSearch");
//		model.addAttribute("code", code); 
//		model.addAttribute("paging", vo);
//		model.addAttribute("list", list);
//		model.addAttribute("searchType", searchType);
//		model.addAttribute("searchValue", searchValue);
//	  
//		return "listSearch";
//	  
//	  }

	

}
