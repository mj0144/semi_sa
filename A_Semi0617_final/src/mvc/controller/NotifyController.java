package mvc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mvc.service.NotifyService;
import mvc.vo.NotifyVO;

@Controller //송성근 제작
public class NotifyController {
	@Autowired
	private NotifyService notifyservice;

	//알람
	@ResponseBody
	@RequestMapping(value = "/notifycations", method = RequestMethod.POST)
	public Map<String, Object> buttonNotify(@RequestBody HashMap<String, Object> params,HttpSession session) throws Exception {
		String result = "";
		int notifyuser;
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		notifyuser = (int) session.getAttribute("user_num");
		params.put("notifyuser", notifyuser);
		HashMap<String, Object> selectcnt = notifyservice.buttonNotify(params);
		List<HashMap<String, Object>> list = notifyservice.selectNotify(params);
		for(int i=0; i<list.size(); i++) {
			String sqldate = list.get(i).get("NOTIFYDATE").toString();
			String date = sqldate.substring(0, 19);
			list.get(i).put("NOTIFYDATE", date);
		}
		String cnt = selectcnt.get("COUNT(*)").toString();
		if(params.size() == 1) {
			result = "success";
		}
		resultMap.put("result", result);
		resultMap.put("cnt", cnt);
		resultMap.put("list", list);
		return resultMap;
	}
	
	//알람내용 insert
	@ResponseBody
	@RequestMapping(value ="notifyin", method = RequestMethod.POST)
	public Map<String, Object> notifyIn(@RequestBody Map<String, Object> params , NotifyVO vo) throws Exception {
		int responeUser = Integer.parseInt(params.get("notifyuser").toString());
		int requestUser = Integer.parseInt(params.get("notifyusernum").toString());
		String result = "fail";
		Map<String, Object> resultMap = new HashMap<String, Object>();
		vo.setNotifycontent(params.get("notifycontent").toString());
		vo.setNotifylink(params.get("notifyLink").toString());
		vo.setNotifyuser(responeUser);
		vo.setNotifyusernum(requestUser);
		System.out.println("알람보내기성공! 알람보낸자 : "+ vo.getNotifyusernum() + " 알람 받은자 : " + vo.getNotifyuser() + " 알람내용 : " + vo.getNotifycontent());
		int re = notifyservice.Notifyinsert(vo);
		if(re == 1) {
			result = "success";
		}
		resultMap.put("result", result);
		return resultMap;
	}
	@RequestMapping(value = "/chatRequest")
	public String chatRequest() {
		return "chatRequest";
	}
	
}
