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
   private static final String mydomain = "http://localhost:8090/project/callback";

   private static final String clientId = "MfMVXKoyjlrxFxb21n3w";

   private static final String clientSecret = "4z1VMqC6I_";

   private static final String requestUrl = "https://nid.naver.com/oauth2.0/authorize?client_id=" + clientId
         + "&response_type=code&redirect_uri=" + mydomain + "&state=";

   private static final String userProfileUrl = "https://apis.naver.com/nidlogin/nid/getUserProfile.xml";

   @Autowired
   private memberService service;

   @RequestMapping("/login")
   public String login() {
      // 테스트용으로 잠시 바꿈
      return "/members/login";
   }

   @RequestMapping("/logout")
   public String logout(HttpSession session) {
      // 테스트용으로 잠시 바꿈
      System.out.println("로그아웃하기");
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
            System.out.println("맴버로그인");
            session.setAttribute("login", email);
            session.setAttribute("login_type", 1);
            returnV = ".main";
         } else if (pc != 0) {
            System.out.println("펫시터로그인");
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
    * type은 회원 유형(일반,펫시터) type1은 가입 유형(일반가입=1, 카카오=2, 구글=3, 네이버=4)
    */
   @RequestMapping("/register")
   public String register(int type, int type1, HttpSession session) {
      System.out.println("타입은" + type);
      System.out.println("타입1은" + type1);
      session.setAttribute("email", "");
      session.setAttribute("type", type);
      session.setAttribute("type1", type1);
      return ".members.terms";
   }

   @RequestMapping("/socialJ")
   public String register(int type, int type1, String email, HttpSession session) {
      System.out.println("타입은" + type);
      System.out.println("타입1은" + type1);
      System.out.println("이메일 : " + email);
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
         System.out.println("우레카!");
      }

      return ".main";
   }

   @RequestMapping("/jusoPopup")
   public String popup() {
      System.out.println("주소 들어옴");
      return "/members/jusoPopup";
   }

   @RequestMapping(value = "/callback")
   public String callback(@RequestParam String state, @RequestParam String code, HttpServletRequest request,
         HttpSession session) throws UnsupportedEncodingException {

      String storedState = (String) request.getSession().getAttribute("state"); // 세션에 저장된 토큰을 받아옵니다.

      if (!state.equals(storedState)) { // 세션에 저장된 토큰과 인증을 요청해서 받은 토큰이 일치하는지 검증합니다.

         System.out.println("401 unauthorized"); // 인증이 실패했을 때의 처리 부분입니다.

         return "/error";

      }
      // AccessToken 요청 및 파싱할 부분
      String data = Utils.getHtml(getAccessUrl(state, code), null); // AccessToken을 요청하고 그 값을 가져옵니다.

      Map<String, String> map = Utils.JSONStringToMap(data); // JSON의 형태로 받아온 값을 Map으로 저장합니다.
      System.out.println("준비");
      String accessToken = map.get("access_token");
      System.out.println(accessToken);
      String tokenType = map.get("token_type");
      System.out.println(tokenType);

      String profileDataXml = Utils.getHtml(userProfileUrl, tokenType + " " + accessToken);

      // tokentype 와 accessToken을 조합한 값을 해더의 Authorization에 넣어 전송합니다. 결과 값은 xml로
      // 출력됩니다.

      JSONObject jsonObject = XML.toJSONObject(profileDataXml); // xml을 json으로 파싱합니다.

      JSONObject responseData = jsonObject.getJSONObject("data");

      // json의 구조가 data 아래에 자식이 둘인 형태여서 map으로 파싱이 안됩니다. 따라서 자식 노드로 접근합니다.
      String returnV = "";
      Map<String, String> userMap = Utils.JSONStringToMap(responseData.get("response").toString());
      System.out.println(userMap.get("email"));
      int a = (int) session.getAttribute("type");
      if (a == 3) {
         System.out.println("네이버 로그인시");
         int mc = service.emailc_m(userMap.get("email"));
         int pc = service.emailc_p(userMap.get("email"));
         if (mc == 0 && pc == 0) {
            returnV = ".members.join";
         } else if (mc != 0) {
            System.out.println("네이버 맴버로그인");
            session.setAttribute("login", userMap.get("email"));
            session.setAttribute("login_type", 1);
            returnV = ".main";
         } else if (pc != 0) {
            System.out.println("네이버 펫시터로그인");
            session.setAttribute("login", userMap.get("email"));
            session.setAttribute("login_type", 2);
            returnV = ".main";
         }

      } else {
         System.out.println("네이버 회원가입시");
         session.setAttribute("email", userMap.get("email"));
         // 사용자 정보 값은 자식노드 중에 response에 저장되어 있습니다. response로 접근하여 그 값들은 map으로 파싱합니다.

         returnV = ".members.terms";
      }
      return returnV;
   }

   @RequestMapping(value = "/personalInfo")
   public void personalInfo(HttpServletRequest request) throws Exception {
      String token = "AAAAOMXEXCTHSoBwSNqMs0QhpLgUD6iXl9tm2TWauM1/8wPe+X61+rXjtcTwmxB69FLFNIwOwLCfO6fiLdQRv7CYXkI=";// 네이버
                                                                                          // 로그인
                                                                                          // 접근
                                                                                          // 토큰;
                                                                                          // 여기에
                                                                                          // 복사한
                                                                                          // 토큰값을
                                                                                          // 넣어줍니다.
      String header = "Bearer " + token; // Bearer 다음에 공백 추가
      try {
         String apiURL = "https://openapi.naver.com/v1/nid/me";
         URL url = new URL(apiURL);
         HttpURLConnection con = (HttpURLConnection) url.openConnection();
         con.setRequestMethod("GET");
         con.setRequestProperty("Authorization", header);
         int responseCode = con.getResponseCode();
         BufferedReader br;
         if (responseCode == 200) { // 정상 호출
            br = new BufferedReader(new InputStreamReader(con.getInputStream()));
         } else { // 에러 발생
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

   // 소셜로그인 처리부분
   @RequestMapping(value = "/sociallogin")
   public String naverLogin(int type1, String email, HttpSession session) {
      System.out.println("타입1은" + type1);
      System.out.println("이메일은 : " + email);

      String returnV = "";
      // 네이버일때는 별개로 처리
      if (type1 == 4) {
         String state = Utils.generateState(); // 토큰을 생성합니다.
         session.setAttribute("type", 3);
         session.setAttribute("type1", type1);
         session.setAttribute("state", state); // 세션에 토큰을 저장합니다.
         returnV = "redirect:" + requestUrl + state; // 만들어진 URL로 인증을 요청합니다.
      } else {

         // 카카오나 구글 로그인 처리
         int mc = service.emailc_m(email);
         int pc = service.emailc_p(email);
         if (mc == 0 && pc == 0) {
            returnV = ".members.join";
         } else if (mc != 0) {
            System.out.println("소셜 맴버로그인");
            session.setAttribute("login", email);
            session.setAttribute("login_type", 1);
            returnV = ".main";
         } else if (pc != 0) {
            System.out.println("소셜 펫시터로그인");
            session.setAttribute("login", email);
            session.setAttribute("login_type", 2);
            returnV = ".main";
         }

      }
      return returnV;
   }

   // 회원가입시 로그인
   @RequestMapping(value = "/naverlogin")
   public String naverLogin(int type, int type1, HttpSession session) {
      String state = Utils.generateState(); // 토큰을 생성합니다.
      System.out.println("타입은" + type);
      System.out.println("타입1은" + type1);
      session.setAttribute("type", type);
      session.setAttribute("type1", type1);
      session.setAttribute("state", state); // 세션에 토큰을 저장합니다.
      return "redirect:" + requestUrl + state; // 만들어진 URL로 인증을 요청합니다.

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