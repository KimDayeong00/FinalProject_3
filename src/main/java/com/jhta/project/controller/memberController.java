package com.jhta.project.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.json.XML;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.project.service.memberService;
import com.jhta.project.utils.Utils;
import com.jhta.project.vo.PetSitterVo;
import com.jhta.project.vo.memberVO;

@Controller
public class memberController {
   private static final String mydomain = "http://192.168.0.2:8090/project/callback";

   private static final String clientId = "MfMVXKoyjlrxFxb21n3w";

   private static final String clientSecret = "4z1VMqC6I_";

   private static final String requestUrl = "https://nid.naver.com/oauth2.0/authorize?client_id=" + clientId
         + "&response_type=code&redirect_uri=" + mydomain + "&state=";

   private static final String userProfileUrl = "https://apis.naver.com/nidlogin/nid/getUserProfile.xml";

   @Autowired
   private memberService service;

   @RequestMapping("/login")
   public String login() {
      // ���ㅽ�몄�⑹�쇰� ���� 諛�轅�
      return "/members/login";
   }

   @RequestMapping("/logout")
   public String logout(HttpSession session) {
      // ���ㅽ�몄�⑹�쇰� ���� 諛�轅�
      System.out.println("濡�洹몄������湲�");
      session.removeAttribute("login");
      session.removeAttribute("login_type");

      return ".main";
   }

   @RequestMapping("/n_login")
   public String n_login(String email, String pwd, HttpSession session) {
      System.out.println(email);
      System.out.println(pwd);
      String returnV = "";
      if (email.equals("admin") && pwd.equals("admin")) {
         session.setAttribute("login", "admin");
         returnV = ".admin";
      } else {

         int mc = service.emailc_m(email);
         int pc = service.emailc_p(email);
         if (mc == 0 && pc == 0) {
            returnV = "/members/login";
         } else if (mc != 0) {
            System.out.println("留대�濡�洹몄��");
            session.setAttribute("login", email);
            session.setAttribute("login_type", 1);
            returnV = ".main";
         } else if (pc != 0) {
            System.out.println("�レ���곕�洹몄��");
            session.setAttribute("login", email);
            session.setAttribute("login_type", 2);
            returnV = ".main";
         }
      }
      return returnV;
   }

   @RequestMapping("/register1")
   public String register1() {
      return ".members.join";
   }

   @RequestMapping("/register2")
   public String register2() {
      return ".members.join2";
   }

   /*
    * type�� ���� ����(�쇰�,�レ����) type1�� 媛��� ����(�쇰�媛���=1, 移댁뭅��=2, 援ш�=3, �ㅼ�대�=4)
    */
   @RequestMapping("/register")
   public String register(int type, int type1, HttpSession session) {
      System.out.println("������" + type);
      System.out.println("����1��" + type1);
      session.setAttribute("email", "");
      session.setAttribute("type", type);
      session.setAttribute("type1", type1);
      return ".members.terms";
   }

   @RequestMapping("/socialJ")
   public String register(int type, int type1, String email, HttpSession session) {
      System.out.println("������" + type);
      System.out.println("����1��" + type1);
      System.out.println("�대��� : " + email);
      session.setAttribute("type", type);
      session.setAttribute("type1", type1);
      session.setAttribute("email", email);
      return ".members.terms";
   }

   @RequestMapping("/joinForm")
   public String joinForm(HttpSession session) {
      String result = "";
      int a = (Integer) session.getAttribute("type");
      if (a == 1) {

         result = ".members.joinForm";
      } else if (a == 2) {
         result = ".members.joinForm2";
      }
      return result;
   }

   @RequestMapping("/joinM")
   public String join(memberVO vo, HttpSession session) {
      System.out.println(vo.toString());
      int a = (Integer) session.getAttribute("type");
      int b = (Integer) session.getAttribute("type1");
      String returnV = "";
      vo.setM_gubun(b);
      int row = service.insertM(vo);
      if (row > 0) {
         returnV = ".main";
      } else {
         returnV = "/error";
      }
      return returnV;
   }

   @RequestMapping("/joinP")
   public String join(PetSitterVo vo, HttpSession session) {
      int a = (Integer) session.getAttribute("type");
      int b = (Integer) session.getAttribute("type1");

      vo.setPs_gubun(b);
      System.out.println(vo.toString());
      int row = service.insertP(vo);
      if (row > 0) {
         System.out.println("�곕��移�!");
      }

      return ".main";
   }

   @RequestMapping("/jusoPopup")
   public String popup() {
      System.out.println("二쇱�� �ㅼ�댁��");
      return "/members/jusoPopup";
   }

   @RequestMapping(value = "/callback")
   public String callback(@RequestParam String state, @RequestParam String code, HttpServletRequest request,
         HttpSession session) throws UnsupportedEncodingException {

      String storedState = (String) request.getSession().getAttribute("state"); // �몄���� ���λ�� ���곗�� 諛����듬����.

      if (!state.equals(storedState)) { // �몄���� ���λ�� ���곌낵 �몄��� ��泥��댁�� 諛��� ���곗�� �쇱�����吏� 寃�利��⑸����.

         System.out.println("401 unauthorized"); // �몄��� �ㅽ�⑦���� ���� 泥�由� 遺�遺�������.

         return "/error";

      }
      // AccessToken ��泥� 諛� ���깊�� 遺�遺�
      String data = Utils.getHtml(getAccessUrl(state, code), null); // AccessToken�� ��泥���怨� 洹� 媛��� 媛��몄�듬����.

      Map<String, String> map = Utils.JSONStringToMap(data); // JSON�� ����濡� 諛����� 媛��� Map�쇰� ���ν�⑸����.
      System.out.println("以�鍮�");
      String accessToken = map.get("access_token");
      System.out.println(accessToken);
      String tokenType = map.get("token_type");
      System.out.println(tokenType);

      String profileDataXml = Utils.getHtml(userProfileUrl, tokenType + " " + accessToken);

      // tokentype �� accessToken�� 議고�⑺�� 媛��� �대���� Authorization�� �ｌ�� ���≫�⑸����. 寃곌낵 媛��� xml濡�
      // 異��λ�⑸����.

      JSONObject jsonObject = XML.toJSONObject(profileDataXml); // xml�� json�쇰� ���깊�⑸����.

      JSONObject responseData = jsonObject.getJSONObject("data");

      // json�� 援ъ“媛� data ������ ������ ���� �����ъ�� map�쇰� ���깆�� ���⑸����. �곕�쇱�� ���� �몃��濡� ��洹쇳�⑸����.
      String returnV = "";
      Map<String, String> userMap = Utils.JSONStringToMap(responseData.get("response").toString());
      System.out.println(userMap.get("email"));
      int a = (int) session.getAttribute("type");
      if (a == 3) {
         System.out.println("�ㅼ�대� 濡�洹몄�몄��");
         int mc = service.emailc_m(userMap.get("email"));
         int pc = service.emailc_p(userMap.get("email"));
         if (mc == 0 && pc == 0) {
            returnV = ".members.join";
         } else if (mc != 0) {
            System.out.println("�ㅼ�대� 留대�濡�洹몄��");
            session.setAttribute("login", userMap.get("email"));
            session.setAttribute("login_type", 1);
            returnV = ".main";
         } else if (pc != 0) {
            System.out.println("�ㅼ�대� �レ���곕�洹몄��");
            session.setAttribute("login", userMap.get("email"));
            session.setAttribute("login_type", 2);
            returnV = ".main";
         }

      } else {
         System.out.println("�ㅼ�대� ����媛�����");
         session.setAttribute("email", userMap.get("email"));
         // �ъ�⑹�� ��蹂� 媛��� �����몃�� 以��� response�� ���λ���� ���듬����. response濡� ��洹쇳���� 洹� 媛��ㅼ�� map�쇰� ���깊�⑸����.

         returnV = ".members.terms";
      }
      return returnV;
   }

   @RequestMapping(value = "/personalInfo")
   public void personalInfo(HttpServletRequest request) throws Exception {
      String token = "AAAAOMXEXCTHSoBwSNqMs0QhpLgUD6iXl9tm2TWauM1/8wPe+X61+rXjtcTwmxB69FLFNIwOwLCfO6fiLdQRv7CYXkI=";// �ㅼ�대�
                                                                                          // 濡�洹몄��
                                                                                          // ��洹�
                                                                                          // ����;
                                                                                          // �ш린��
                                                                                          // 蹂듭�ы��
                                                                                          // ���곌���
                                                                                          // �ｌ�댁�����.
      String header = "Bearer " + token; // Bearer �ㅼ���� 怨듬갚 異�媛�
      try {
         String apiURL = "https://openapi.naver.com/v1/nid/me";
         URL url = new URL(apiURL);
         HttpURLConnection con = (HttpURLConnection) url.openConnection();
         con.setRequestMethod("GET");
         con.setRequestProperty("Authorization", header);
         int responseCode = con.getResponseCode();
         BufferedReader br;
         if (responseCode == 200) { // ���� �몄�
            br = new BufferedReader(new InputStreamReader(con.getInputStream()));
         } else { // ���� 諛���
            br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
         }
         String inputLine;
         StringBuffer response = new StringBuffer();
         while ((inputLine = br.readLine()) != null) {
            response.append(inputLine);
         }
         br.close();
         System.out.println(response.toString());
      } catch (Exception e) {
         System.out.println(e);
      }
   }

   // ����濡�洹몄�� 泥�由щ�遺�
   @RequestMapping(value = "/sociallogin")
   public String naverLogin(int type1, String email, HttpSession session) {
      System.out.println("����1��" + type1);
      System.out.println("�대��쇱�� : " + email);

      String returnV = "";
      // �ㅼ�대��쇰���� 蹂�媛�濡� 泥�由�
      if (type1 == 4) {
         String state = Utils.generateState(); // ���곗�� ���깊�⑸����.
         session.setAttribute("type", 3);
         session.setAttribute("type1", type1);
         session.setAttribute("state", state); // �몄���� ���곗�� ���ν�⑸����.
         returnV = "redirect:" + requestUrl + state; // 留��ㅼ�댁� URL濡� �몄��� ��泥��⑸����.
      } else {

         // 移댁뭅�ㅻ�� 援ш� 濡�洹몄�� 泥�由�
         int mc = service.emailc_m(email);
         int pc = service.emailc_p(email);
         if (mc == 0 && pc == 0) {
            returnV = ".members.join";
         } else if (mc != 0) {
            System.out.println("���� 留대�濡�洹몄��");
            session.setAttribute("login", email);
            session.setAttribute("login_type", 1);
            returnV = ".main";
         } else if (pc != 0) {
            System.out.println("���� �レ���곕�洹몄��");
            session.setAttribute("login", email);
            session.setAttribute("login_type", 2);
            returnV = ".main";
         }

      }
      return returnV;
   }

   // ����媛����� 濡�洹몄��
   @RequestMapping(value = "/naverlogin")
   public String naverLogin(int type, int type1, HttpSession session) {
      String state = Utils.generateState(); // ���곗�� ���깊�⑸����.
      System.out.println("������" + type);
      System.out.println("����1��" + type1);
      session.setAttribute("type", type);
      session.setAttribute("type1", type1);
      session.setAttribute("state", state); // �몄���� ���곗�� ���ν�⑸����.
      return "redirect:" + requestUrl + state; // 留��ㅼ�댁� URL濡� �몄��� ��泥��⑸����.

   }

   private String getAccessUrl(String state, String code) {

      String accessUrl = "https://nid.naver.com/oauth2.0/token?client_id=" + clientId + "&client_secret="
            + clientSecret

            + "&grant_type=authorization_code" + "&state=" + state + "&code=" + code;

      return accessUrl;

   }

   @RequestMapping(value = "/emailC")
   @ResponseBody
   public String emailC(String email) {
      int row = service.emailc(email);
      JSONObject ob = new JSONObject();

      if (row > 0) {
         ob.put("result", false);

      } else {
         ob.put("result", true);
      }
      return ob.toString();
   }
   
   @RequestMapping("/mypage/order")
   public ModelAndView order() {
   ModelAndView mv=new ModelAndView(".members.order");
   return mv;
   }
   
 
}