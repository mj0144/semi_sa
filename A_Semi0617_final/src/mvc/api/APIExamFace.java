package mvc.api;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Repository;

// ���̹� ���ν� API ���� ( ����, ���� )
@Repository
public class APIExamFace {
	static String img;
	
	String result = "false";

	public Map<String, Object> face(String image) {
		Map<String, Object> map = new HashMap<String, Object>();
		img = image;

		StringBuffer reqStr = new StringBuffer();
		String clientId = "GHq3KxFLF79bat89HETI";// ���ø����̼� Ŭ���̾�Ʈ ���̵�";
		String clientSecret = "aTkQgAa1sB";// ���ø����̼� Ŭ���̾�Ʈ ��ũ����";

		try {

			String paramName = "image"; // �Ķ���͸��� image�� ����
			String imgFile = img;
			File uploadFile = new File(imgFile);
			String apiURL = "https://openapi.naver.com/v1/vision/celebrity"; // ������ �� �ν�
			// String apiURL = "https://openapi.naver.com/v1/vision/face"; // �� ����
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setUseCaches(false);
			con.setDoOutput(true);
			con.setDoInput(true);
			// multipart request
			String boundary = "---" + System.currentTimeMillis() + "---";
			con.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			OutputStream outputStream = con.getOutputStream();
			PrintWriter writer = new PrintWriter(new OutputStreamWriter(outputStream, "UTF-8"), true);
			String LINE_FEED = "\r\n";
			// file �߰�
			String fileName = uploadFile.getName();
			writer.append("--" + boundary).append(LINE_FEED);
			writer.append("Content-Disposition: form-data; name=\"" + paramName + "\"; filename=\"" + fileName + "\"")
					.append(LINE_FEED);
			writer.append("Content-Type: " + URLConnection.guessContentTypeFromName(fileName)).append(LINE_FEED);
			writer.append(LINE_FEED);
			writer.flush();
			FileInputStream inputStream = new FileInputStream(uploadFile);

			byte[] buffer = new byte[4096];
			int bytesRead = -1;
			while ((bytesRead = inputStream.read(buffer)) != -1) {
				outputStream.write(buffer, 0, bytesRead);
			}
			outputStream.flush();
			inputStream.close();
			writer.append(LINE_FEED).flush();
			writer.append("--" + boundary + "--").append(LINE_FEED);
			writer.close();
			BufferedReader br = null;
			int responseCode = con.getResponseCode();
			if (responseCode == 200) { // ���� ȣ��
				br = new BufferedReader(new InputStreamReader(con.getInputStream(), "utf-8"));
			} else { // ���� �߻�
				System.out.println("error!!!!!!! responseCode= " + responseCode);
				br = new BufferedReader(new InputStreamReader(con.getInputStream(), "utf-8"));
			}
			String inputLine;

			if (br != null) {
				String response = "";
				while ((inputLine = br.readLine()) != null) {
					response = response + inputLine;
				}
				br.close();
				
				JSONParser jsonParser = new JSONParser();

				JSONObject jsonObj = (JSONObject) jsonParser.parse(response);
				System.out.println("json����Ÿ"+jsonObj);
				JSONArray facesArray = (JSONArray) jsonObj.get("faces");
				//
				JSONObject infoArray = (JSONObject) jsonObj.get("info");
				System.out.println("infoArray:"+infoArray);
				Long faceCount =  (Long) infoArray.get("faceCount");
				System.out.println("faceCount:"+faceCount);
				//
				JSONObject celebrities = (JSONObject) facesArray.get(0);

				JSONObject celebrity = (JSONObject) celebrities.get("celebrity");

				System.out.println("dd:" + JSONObject.toJSONString(celebrity));

				String name = (String) celebrity.get("value");
				String percent = String.valueOf(celebrity.get("confidence"));
				
				if (percent.equals("1.0")) {
					percent = "100";
				}else {
					percent = percent.substring(2, 4);
				}
				
				System.out.println(name + "/" + percent);

				map.put("looklike", name);
				map.put("percent", percent);
				return map;
			} else {
				System.out.println("error !!!");
				return map;
			}
		} catch (Exception e) {
			System.out.println(e);
			return map;
		}

	}

}