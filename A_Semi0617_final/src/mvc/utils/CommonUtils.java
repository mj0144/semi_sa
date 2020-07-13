package mvc.utils;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

@Service
public class CommonUtils extends StringUtils{


	public boolean isEmptyCstm(String param) {
		boolean result = false;
		if(param == null || param.length() == 0) {
			result = true;
		}
		String temp = String.valueOf(param).trim();
		if(temp.equals("") || temp.equalsIgnoreCase("null")) {
			result = true;
		}
		return result;
	}
	
}
