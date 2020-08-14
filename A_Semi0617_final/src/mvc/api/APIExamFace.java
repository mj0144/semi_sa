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

// 네이버 얼굴인식 API 예제
public class APIExamFace {
   static String img;
   HashMap<String, String> map = new HashMap<String, String>();
   String result="false";
   

   public Map<String, String> face(String image) {
	   
	   
      img = image;

      StringBuffer reqStr = new StringBuffer();
      String clientId = "GHq3KxFLF79bat89HETI";// 애플리케이션 클라이언트 아이디값";
      String clientSecret = "aTkQgAa1sB";// 애플리케이션 클라이언트 시크릿값";

      try {

         String paramName = "image"; // 파라미터명은 image로 지정
         String imgFile = img;
         File uploadFile = new File(imgFile);
         String apiURL = "https://openapi.naver.com/v1/vision/celebrity"; // 유명인 얼굴 인식
         // String apiURL = "https://openapi.naver.com/v1/vision/face"; // 얼굴 감지
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
         // file 추가
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
         if (responseCode == 200) { // 정상 호출
            br = new BufferedReader(new InputStreamReader(con.getInputStream()));
         } else { // 에러 발생
            System.out.println("error!!!!!!! responseCode= " + responseCode);
            br = new BufferedReader(new InputStreamReader(con.getInputStream()));
         }
         String inputLine;
         if (br != null) {
            String response="";
            //StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
               //response.append(inputLine);   
               response = response + inputLine;
            }
            br.close();
            //System.out.println("===========response===============");

            //System.out.println(response);
            //System.out.println(response.getClass());
            //System.out.println("==========jsonParser================");
            
            JSONParser jsonParser = new JSONParser();
          
              //System.out.println(jsonParser);
              //System.out.println(jsonParser.getClass());
              //System.out.println("-------jsonObj---------------------");
              JSONObject jsonObj = (JSONObject) jsonParser.parse(response);
              //System.out.println(jsonObj);
              //System.out.println(jsonObj.getClass());
            
              //System.out.println("-------jsonArray---------------------");
              JSONArray facesArray = (JSONArray) jsonObj.get("faces");
              //System.out.println(facesArray);
              //System.out.println(facesArray.getClass());
            //String m = (response.faces.celebrity.value[0]);
              
              //System.out.println("-------celebrity들---------------------");
              
             // for (int i = 0; i < facesArray.size(); i++) {
              
              
               JSONObject celebrities = (JSONObject)facesArray.get(0);
               
               //System.out.println(celebrities);
               
               JSONObject celebrity = (JSONObject)celebrities.get("celebrity");
               System.out.println(celebrity);
               String name=(String)celebrity.get("value");
               //System.out.println(name);
               String percent=String.valueOf(celebrity.get("confidence"));
               //System.out.println(percent);
               percent= percent.substring(2, 4);
               if (percent.equals("00")) {
                  percent="100";
               }
               
               System.out.println(name+"/"+percent);
               
               map.put("name", name);
               map.put("percent", percent);
               
            //}
            
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
   
   
   
//   {"faces":[{"celebrity":{"confidence":0.754994,"value":"김태희"}}],
//      "info":{"size":{"width":512,"height":512},"faceCount":1}}
   
//   public APIExamFace(String image) {
//      img = image;
//
//      StringBuffer reqStr = new StringBuffer();
//      String clientId = "GHq3KxFLF79bat89HETI";// 애플리케이션 클라이언트 아이디값";
//      String clientSecret = "aTkQgAa1sB";// 애플리케이션 클라이언트 시크릿값";
//
//      try {
//
//         String paramName = "image"; // 파라미터명은 image로 지정
//         String imgFile = img;
//         File uploadFile = new File(imgFile);
//         String apiURL = "https://openapi.naver.com/v1/vision/celebrity"; // 유명인 얼굴 인식
//         // String apiURL = "https://openapi.naver.com/v1/vision/face"; // 얼굴 감지
//         URL url = new URL(apiURL);
//         HttpURLConnection con = (HttpURLConnection) url.openConnection();
//         con.setUseCaches(false);
//         con.setDoOutput(true);
//         con.setDoInput(true);
//         // multipart request
//         String boundary = "---" + System.currentTimeMillis() + "---";
//         con.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
//         con.setRequestProperty("X-Naver-Client-Id", clientId);
//         con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
//         OutputStream outputStream = con.getOutputStream();
//         PrintWriter writer = new PrintWriter(new OutputStreamWriter(outputStream, "UTF-8"), true);
//         String LINE_FEED = "\r\n";
//         // file 추가
//         String fileName = uploadFile.getName();
//         writer.append("--" + boundary).append(LINE_FEED);
//         writer.append("Content-Disposition: form-data; name=\"" + paramName + "\"; filename=\"" + fileName + "\"")
//               .append(LINE_FEED);
//         writer.append("Content-Type: " + URLConnection.guessContentTypeFromName(fileName)).append(LINE_FEED);
//         writer.append(LINE_FEED);
//         writer.flush();
//         FileInputStream inputStream = new FileInputStream(uploadFile);
//         byte[] buffer = new byte[4096];
//         int bytesRead = -1;
//         while ((bytesRead = inputStream.read(buffer)) != -1) {
//            outputStream.write(buffer, 0, bytesRead);
//         }
//         outputStream.flush();
//         inputStream.close();
//         writer.append(LINE_FEED).flush();
//         writer.append("--" + boundary + "--").append(LINE_FEED);
//         writer.close();
//         BufferedReader br = null;
//         int responseCode = con.getResponseCode();
//         if (responseCode == 200) { // 정상 호출
//            br = new BufferedReader(new InputStreamReader(con.getInputStream()));
//         } else { // 에러 발생
//            System.out.println("error!!!!!!! responseCode= " + responseCode);
//            br = new BufferedReader(new InputStreamReader(con.getInputStream()));
//         }
//         String inputLine;
//         if (br != null) {
//            StringBuffer response = new StringBuffer();
//            while ((inputLine = br.readLine()) != null) {
//               response.append(inputLine);   
//            }
//            br.close();
//            System.out.println(response.toString());
//      } else {
//            System.out.println("error !!!");
//         }
//      } catch (Exception e) {
//         System.out.println(e);
//      }
//   }
}