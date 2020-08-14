package mvc.api;

import java.util.Map;

//네이버 얼굴인식 API 예제 ( 성현, 수연 )
public class Main {
public static void main(String[] args) {
   
   String image="WebContent/images/people.jpg";

   APIExamFace aa = new APIExamFace();
   aa.face(image);
   Map<String, String> map = aa.face(image);
   System.out.println("최종MAP:"+map);

}

}