package mvc.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import mvc.dao.IljuDao;
import mvc.dao.ListDao;
import mvc.vo.IljuVO;

@Controller
public class SajuController {
   @Autowired
   private IljuDao iljudao;
   @Autowired
   private ListDao listDao;
   
   
   @RequestMapping(value="/error")
    public String loginerr(Model m) {
      m.addAttribute("msg", "에러");
         return "error";
      }
   
//   @RequestMapping(value = "/login")
//   public String login() {
//      return "login";
//   }

   @RequestMapping(value="/signin")
   public String viewsignin() {
      return "signin";
   }

   @RequestMapping(value="/memberchange")
   public String membershipchange() {
      return "membershipchange";
   }
//   @RequestMapping(value="/mypage")
//   public String mypage() {
//      return "mypage";
//   }
   @RequestMapping(value="/profile")
   public String profile() {
      return "profile";
   }
   @RequestMapping(value="/chat")
   public String chat() {
      return "chat";
   }
   @RequestMapping(value="/boardwrite")
   public String boardwrite() {
      return "boardwrite";
   }
   @RequestMapping(value="/viewsaju")
   public String viewsaju() {
      return "viewsaju";
   }
   @RequestMapping(value="/resultsajutwo")
   public String viewresultsaju2() {
      return "resultsajutwo";
   }
   @RequestMapping(value="/resultsajuthree")
   public String viewresultsaju3() {
      return "resultsajuthree";
   }
   
   @RequestMapping(value="/resultsaju1")//사주보기
   public ModelAndView resultsaju1(IljuVO vo,HttpSession session) {
      ModelAndView m = new ModelAndView();
      char gender =  (char) session.getAttribute("gender");
      if(gender=='f') { m.setViewName("resultsaju1F");}
      else {m.setViewName("resultsaju1M");}
      String ilju= (String) session.getAttribute("ilju");
      vo.setIlju(ilju);
      vo = iljudao.setIlju(vo);
      m.addObject("ilju", vo);
      return m;
   }
   
   @RequestMapping(value="/resultsaju2")//천생연분 궁합 가져오기
   public ModelAndView resultsaju2(IljuVO vo, HttpSession session) {
      ModelAndView m = new ModelAndView("resultsaju2");
      String ilju= (String) session.getAttribute("ilju");
      String name = (String) session.getAttribute("name");
      vo.setIlju(ilju);
      vo = iljudao.setIlju(vo);
      int sky_num = (vo.getIlju_sky_num()+5)%10;
      if(sky_num== 0) {
         sky_num = 10;
      }
      int land_num = 1;
      int aa = vo.getIlju_land_num();
      //천생연분 계산
      if (aa==1) {land_num =vo.getIlju_land_num()+1;}
      else if(aa==2) {land_num =vo.getIlju_land_num()-1;}
      else if(aa==3) {land_num =(vo.getIlju_land_num()-3)+12;}
      else if(aa==4) {land_num =(vo.getIlju_land_num()-5)+12;}
      else if(aa==5) {land_num =(vo.getIlju_land_num()-7)+12;}
      else if(aa==6) {land_num =(vo.getIlju_land_num()-9)+12;}
      else if(aa==7) {land_num =vo.getIlju_land_num()+1;}
      else if(aa==8) {land_num =vo.getIlju_land_num()-1;}
      else if(aa==9) {land_num =vo.getIlju_land_num()+9-12;}
      else if(aa==10) {land_num =vo.getIlju_land_num()+7-12;}
      else if(aa==11) {land_num =(vo.getIlju_land_num()+5)-12;}
      else if(aa==12) {land_num =vo.getIlju_land_num()+3-12;}
      else {land_num =vo.getIlju_land_num();}
      
      vo.setIlju_sky_num(sky_num);
      vo.setIlju_land_num(land_num);
      vo = iljudao.viewIlju(vo);
      m.addObject("ilju", vo);
      m.addObject("name",name);
      
      vo.setIlju_sky_num(sky_num);
      vo.setIlju_land_num(land_num);
      vo = iljudao.viewIlju(vo);
      m.addObject("minus",vo);
      //예외처리
      try {
         IljuVO sav = null;
         int user_num=(int)session.getAttribute("user_num");
         if (listDao.sexdt(user_num).equals("m")) {
            sav = listDao.listResultF(vo);
            }else {
            sav = listDao.listResultM(vo);
            }   
         m.addObject("list", sav);
      } catch (NullPointerException e) {
         m.setViewName("resulterr02");
      }catch (Exception e) {
         m.setViewName("resulterr02");
      }
      return m;
   }
   @RequestMapping(value="/resultsaju3")//귀인 가져오기
   public ModelAndView resultsaju3(IljuVO vo,HttpSession session) {
      ModelAndView m = new ModelAndView("resultsaju3");
      String ilju= (String) session.getAttribute("ilju");
      vo.setIlju(ilju);
      vo = iljudao.setIlju(vo);
         int sky_num = 0;
         int land_num = 0;
         int aa = vo.getIlju_sky_num();
         if (aa==1) {sky_num=10;   land_num =2;}
         else if(aa==2) {sky_num =9;   land_num =9;}
         else if(aa==3) {sky_num =2;   land_num =12;}
         else if(aa==4) {sky_num =2;   land_num =10;}
         else if(aa==5) {sky_num =4;   land_num =8;}
         else if(aa==6) {sky_num =3;   land_num =1;}
         else if(aa==7) {sky_num =6;   land_num =8;}
         else if(aa==8) {sky_num =5;   land_num =7;}
         else if(aa==9) {sky_num =8;   land_num =4;}
         else if(aa==10) {sky_num =7;land_num =5;}
         else{land_num =vo.getIlju_land_num();}      
         
         vo.setIlju_sky_num(sky_num);
         vo.setIlju_land_num(land_num);
         vo = iljudao.viewIlju(vo);
         m.addObject("plus",vo);
         
         IljuVO sav = null;
         int user_num=(int)session.getAttribute("user_num");
         try {
            if (listDao.sexdt(user_num).equals("m")) {
               sav = listDao.listResultF(vo);
               }else {
               sav = listDao.listResultM(vo);
               }   
            m.addObject("list1", sav);
         } catch (Exception e) {
            m.setViewName("resulterr03");
         }
         
         //궁합 구하기 /희진
         if (aa==1) {sky_num=10;   land_num =8;}
         else if(aa==2) {sky_num =9;   land_num =1;}
         else if(aa==3) {sky_num =2;   land_num =10;}
         else if(aa==4) {sky_num =2;   land_num =12;}
         else if(aa==5) {sky_num =4;   land_num =2;}
         else if(aa==6) {sky_num =3;   land_num =9;}
         else if(aa==7) {sky_num =6;   land_num =2;}
         else if(aa==8) {sky_num =5;   land_num =3;}
         else if(aa==9) {sky_num =7; land_num =5;}
         else if(aa==10) {sky_num =8;land_num =4;}
         else{land_num =vo.getIlju_land_num();}
         vo.setIlju_sky_num(sky_num);
         vo.setIlju_land_num(land_num);
         vo = iljudao.viewIlju(vo);
         m.addObject("minus",vo);
         IljuVO sav2 = null;
         user_num=(int)session.getAttribute("user_num");
         try {
            if (listDao.sexdt(user_num).equals("m")) {
               sav2 = listDao.listResultF(vo);
               }else {
               sav2 = listDao.listResultM(vo);
               }   
            m.addObject("list2", sav2);
         } catch (Exception e) {
            m.setViewName("resulterr03");
         } 
         
      return m;
   }


   @RequestMapping(value="/resultsaju")
   public String viewresultsaju() {
      return "resultsaju";
   }
   
   @RequestMapping(value = "/sajudown", method = RequestMethod.POST)
   public void download(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) {
           try {
               String imgData = request.getParameter("imgData");
               System.out.println("imgData : " + imgData);
               imgData = imgData.replaceAll("data:image/png;base64,", "");
    
               byte[] file = Base64.decodeBase64(imgData);
               ByteArrayInputStream is = new ByteArrayInputStream(file);
    
               response.setContentType("image/png");
               response.setHeader("Content-Disposition", "attachment; filename=report.png");
    
               IOUtils.copy(is, response.getOutputStream());
               response.flushBuffer();
           } catch (IOException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
           }
    
    }



}