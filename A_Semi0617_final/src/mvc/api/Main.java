package mvc.api;

import java.util.Map;

//���̹� ���ν� API ���� ( ����, ���� )
public class Main {
public static void main(String[] args) {
   
   String image="WebContent/images/people.jpg";

   APIExamFace aa = new APIExamFace();
   aa.face(image);
   Map<String, String> map = aa.face(image);
   System.out.println("����MAP:"+map);

}

}