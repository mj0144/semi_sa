package mvc.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

   // ȸ������
   @RequestMapping(value = "/joinaction", method = RequestMethod.POST)
   public String join(MemberVO vo, HttpServletRequest request, MultipartFile file, IdealVO ivo, RedirectAttributes ra) {

      vo = joinService.yunYeon(vo); // ������� ����.
      String ilju = joinDao.ilju(vo);
      vo.setIlju(ilju); // ���� ����.

      vo.setUser_img(imgUtils.imgSave(request, file, "in", null)); // ���� ����.

      if (vo.getUser_intro().equals("")) { // �ڱ�Ұ��� �Է����� �ʾ�����, �⺻�� �־��ֱ�.
         vo.setUser_intro("�ڱ�Ұ��� �Է����ּ���");
      }

      try {
         String images = imgUtils.root_path(request, vo.getUser_img());
         joinService.join(vo, ivo); // ȸ������,�̻������� ����.
         joinService.gradeInit(vo); //��� �ʱ�ȭ
         lookLikeService.insertLooklike(images, vo, ivo);
         //ra.addAttribute("msg", "������ �Ϸ�Ǿ����ϴ�");
         ra.addFlashAttribute("msg", "������ �Ϸ�Ǿ����ϴ�");


         
      } catch (Exception e) {
         e.printStackTrace();
      }
     
      return "redirect:/";
   }

   //���� ������� ����
   @RequestMapping(value = "/imgchk", method = RequestMethod.POST)
   @ResponseBody
   public int imgchk(MultipartFile[] uploadFile,HttpServletRequest request, MemberVO vo) {
      int result=0;
      for (MultipartFile file : uploadFile) {   
         vo.setUser_img(imgUtils.imgSave(request, file, "in", null));
         String images = imgUtils.root_path(request, vo.getUser_img());
         Map<String, Object> map = apiExamFace.face(images);
          System.out.println("����MAP:" + map);
          if (map.containsKey("looklike")) {
             result=1;
           }else {
              result=0;
           }
      }
         return result;
   }
   
   // ���̵� �ߺ�Ȯ��
   @RequestMapping("/idchk")
   @ResponseBody
   public int idChk(String id) {
      int res = joinDao.idChk(id);
      return res;

   }

   // ���� �ߺ�Ȯ��.
   @RequestMapping("/nickchk")
   @ResponseBody
   public int nickChk(String nickname) {
      int res = joinDao.nickChk(nickname);
      return res;

   }

   // �̸��� �ߺ�Ȯ��.
   @RequestMapping("/emailchk")
   @ResponseBody
   public int emailchk(String email) {
      int res = joinDao.emailChk(email);
      return res;

   }
}