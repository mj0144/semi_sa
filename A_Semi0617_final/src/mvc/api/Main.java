package mvc.api;

import java.util.HashMap;
import java.util.Map;

import mvc.api.APIExamFace;
;

public class Main {
public static void main(String[] args) {
   
   String image="WebContent/images/people.jpg";

   APIExamFace aa = new APIExamFace();
   aa.face(image);
   Map<String, String> map = aa.face(image);
   System.out.println("√÷¡æMAP:"+map);

}

}