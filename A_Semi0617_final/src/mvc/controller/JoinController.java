package mvc.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import mvc.api.APIExamFace;
import mvc.dao.JoinDao;
import mvc.service.JoinService;
import mvc.service.LookLikeService;
import mvc.utils.ImgUtils;
import mvc.vo.IdealVO;
import mvc.vo.MemberVO;

@Controller
public class JoinController {
   @Autowired
   private LookLikeService lookLikeService;
   @Autowired
   private JoinDao joinDao;

   @Autowired
   private JoinService joinService;

   @Autowired
   private ImgUtils imgUtils;
   
   @Autowired
   private APIExamFace apiExamFace;

   // 회원가입
   @RequestMapping(value = "/joinaction", method = RequestMethod.POST)
   public String join(MemberVO vo, HttpServletRequest request, MultipartFile file, IdealVO ivo) {

      vo = joinService.yunYeon(vo); // 생년월일 가공.
      String ilju = joinDao.ilju(vo);
      vo.setIlju(ilju); // 일주 세팅.

      vo.setUser_img(imgUtils.imgSave(request, file, "in", null)); // 파일 저장.

      if (vo.getUser_intro().equals("")) { // 자기소개를 입력하지 않았으면, 기본값 넣어주기.
         vo.setUser_intro("자기소개를 입력해주세요");
      }

      try {
         String images = imgUtils.root_path(request, vo.getUser_img());
         joinService.join(vo, ivo); // 회원정보,이상형정보 저장.
         joinService.gradeInit(vo); //등급 초기화
         lookLikeService.insertLooklike(images, vo, ivo);
         
         
      } catch (Exception e) {
         e.printStackTrace();
      }
      return "login";
   }

   //사진 사람인지 구별
   @RequestMapping(value = "/imgchk", method = RequestMethod.POST)
   @ResponseBody
   public int imgchk(MultipartFile[] uploadFile,HttpServletRequest request, MemberVO vo) {
      System.out.println("컨트롤러왔니?");
      int result=0;
      for (MultipartFile file : uploadFile) {   
         vo.setUser_img(imgUtils.imgSave(request, file, "in", null));
         System.out.println("vo에들어갔니?"+vo.getUser_img());
         String images = imgUtils.root_path(request, vo.getUser_img());
         System.out.println("이미지 rootpath됐니??"+images);
         Map<String, Object> map = apiExamFace.face(images);
         System.out.println("됐니?");
          System.out.println("최종MAP:" + map);
          if (map.containsKey("looklike")) {
             result=1;
           }else {
              result=0;
           }
      }
         return result;
   }
   
   // 아이디 중복확인
   @RequestMapping("/idchk")
   @ResponseBody
   public int idChk(String id) {
      int res = joinDao.idChk(id);
      return res;

   }

   // 별명 중복확인.
   @RequestMapping("/nickchk")
   @ResponseBody
   public int nickChk(String nickname) {
      int res = joinDao.nickChk(nickname);
      return res;

   }

   // 이메일 중복확인.
   @RequestMapping("/emailchk")
   @ResponseBody
   public int emailchk(String email) {
      int res = joinDao.emailChk(email);
      return res;

   }
}