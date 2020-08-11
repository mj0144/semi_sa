package mvc.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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
}
