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

<<<<<<< HEAD
// ³×ÀÌ¹ö ¾ó±¼ÀÎ½Ä API ¿¹Á¦ ( ¼ºÇö, ¼ö¿¬ )
=======
// ë„¤ì´ë²„ ì–¼êµ´ì¸ì‹ API ì˜ˆì œ ( ì„±í˜„, ìˆ˜ì—° )
>>>>>>> branch 'master' of https://github.com/mj0144/semi_sa.git
@Repository
public class APIExamFace {
	static String img;
	Map<String, Object> map = new HashMap<String, Object>();
	String result = "false";

	public Map<String, Object> face(String image) {

		img = image;

		StringBuffer reqStr = new StringBuffer();
<<<<<<< HEAD
		String clientId = "GHq3KxFLF79bat89HETI";// ¾ÖÇÃ¸®ÄÉÀÌ¼Ç Å¬¶óÀÌ¾ðÆ® ¾ÆÀÌµð°ª";
		String clientSecret = "aTkQgAa1sB";// ¾ÖÇÃ¸®ÄÉÀÌ¼Ç Å¬¶óÀÌ¾ðÆ® ½ÃÅ©¸´°ª";
=======
		String clientId = "GHq3KxFLF79bat89HETI";// ì• í”Œë¦¬ì¼€ì´ì…˜ í´ë¼ì´ì–¸íŠ¸ ì•„ì´ë””ê°’";
		String clientSecret = "aTkQgAa1sB";// ì• í”Œë¦¬ì¼€ì´ì…˜ í´ë¼ì´ì–¸íŠ¸ ì‹œí¬ë¦¿ê°’";
>>>>>>> branch 'master' of https://github.com/mj0144/semi_sa.git

		try {

<<<<<<< HEAD
			String paramName = "image"; // ÆÄ¶ó¹ÌÅÍ¸íÀº image·Î ÁöÁ¤
			String imgFile = img;
			File uploadFile = new File(imgFile);
			String apiURL = "https://openapi.naver.com/v1/vision/celebrity"; // À¯¸íÀÎ ¾ó±¼ ÀÎ½Ä
			// String apiURL = "https://openapi.naver.com/v1/vision/face"; // ¾ó±¼ °¨Áö
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
			// file Ãß°¡
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
			if (responseCode == 200) { // Á¤»ó È£Ãâ
				br = new BufferedReader(new InputStreamReader(con.getInputStream(), "utf-8"));
			} else { // ¿¡·¯ ¹ß»ý
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
				JSONArray facesArray = (JSONArray) jsonObj.get("faces");
				JSONObject celebrities = (JSONObject) facesArray.get(0);

				JSONObject celebrity = (JSONObject) celebrities.get("celebrity");

				System.out.println("dd:" + JSONObject.toJSONString(celebrity));

				String name = (String) celebrity.get("value");
				String percent = String.valueOf(celebrity.get("confidence"));
				percent = percent.substring(2, 4);
				if (percent.equals("00")) {
					percent = "100";
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
=======
			String paramName = "image"; // íŒŒë¼ë¯¸í„°ëª…ì€ imageë¡œ ì§€ì •
			String imgFile = img;
			File uploadFile = new File(imgFile);
			String apiURL = "https://openapi.naver.com/v1/vision/celebrity"; // ìœ ëª…ì¸ ì–¼êµ´ ì¸ì‹
			// String apiURL = "https://openapi.naver.com/v1/vision/face"; // ì–¼êµ´ ê°ì§€
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
			// file ì¶”ê°€
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
			if (responseCode == 200) { // ì •ìƒ í˜¸ì¶œ
				br = new BufferedReader(new InputStreamReader(con.getInputStream(), "utf-8"));
			} else { // ì—ëŸ¬ ë°œìƒ
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
				JSONArray facesArray = (JSONArray) jsonObj.get("faces");
				JSONObject celebrities = (JSONObject) facesArray.get(0);

				JSONObject celebrity = (JSONObject) celebrities.get("celebrity");

				System.out.println("dd:" + JSONObject.toJSONString(celebrity));

				String name = (String) celebrity.get("value");
				String percent = String.valueOf(celebrity.get("confidence"));
				percent = percent.substring(2, 4);
				if (percent.equals("00")) {
					percent = "100";
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
>>>>>>> branch 'master' of https://github.com/mj0144/semi_sa.git
