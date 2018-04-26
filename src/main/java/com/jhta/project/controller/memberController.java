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
		// �׽�Ʈ������ ��� �ٲ�
		return "/members/login";
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
	 * type�� ȸ�� ����(�Ϲ�,�����) type1�� ���� ����(�Ϲݰ���=1, īī��=2, ����=3, ���̹�=4)
	 */
	@RequestMapping("/register")
	public String register(int type, int type1, HttpSession session) {
		System.out.println("Ÿ����" + type);
		System.out.println("Ÿ��1��" + type1);
		session.setAttribute("email", "");
		session.setAttribute("type", type);
		session.setAttribute("type1", type1);
		return ".members.terms";
	}
	
	
	@RequestMapping("/socialJ")
	public String register(int type, int type1,String email, HttpSession session) {
		System.out.println("Ÿ����" + type);
		System.out.println("Ÿ��1��" + type1);
		System.out.println("�̸��� : "+email);
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

		vo.setM_gubun(b);
		int row = service.insertM(vo);
		if (row > 0) {
			System.out.println("�췹ī!");
		}

		return ".main";
	}

	@RequestMapping("/joinP")
	public String join(PetSitterVo vo, HttpSession session) {
		int a = (Integer) session.getAttribute("type");
		int b = (Integer) session.getAttribute("type1");

		vo.setPs_gubun(b);
		System.out.println(vo.toString());
		int row = service.insertP(vo);
		if (row > 0) {
			System.out.println("�췹ī!");
		}

		return ".main";
	}

	@RequestMapping("/jusoPopup")
	public String popup() {
		System.out.println("�ּ� ����");
		return "/members/jusoPopup";
	}

	@RequestMapping(value = "/callback")
	public String callback(@RequestParam String state, @RequestParam String code, HttpServletRequest request,HttpSession session)
			throws UnsupportedEncodingException {

		String storedState = (String) request.getSession().getAttribute("state"); // ���ǿ� ����� ��ū�� �޾ƿɴϴ�.

		if (!state.equals(storedState)) { // ���ǿ� ����� ��ū�� ������ ��û�ؼ� ���� ��ū�� ��ġ�ϴ��� �����մϴ�.

			System.out.println("401 unauthorized"); // ������ �������� ���� ó�� �κ��Դϴ�.

			return "redirect:/";

		}
		// AccessToken ��û �� �Ľ��� �κ�
		String data = Utils.getHtml(getAccessUrl(state, code), null); // AccessToken�� ��û�ϰ� �� ���� �����ɴϴ�.

		Map<String, String> map = Utils.JSONStringToMap(data); // JSON�� ���·� �޾ƿ� ���� Map���� �����մϴ�.
		System.out.println("�غ�");
		String accessToken = map.get("access_token");
		System.out.println(accessToken);
		String tokenType = map.get("token_type");
		System.out.println(tokenType);

		String profileDataXml = Utils.getHtml(userProfileUrl, tokenType + " " + accessToken);

		// tokentype �� accessToken�� ������ ���� �ش��� Authorization�� �־� �����մϴ�. ��� ���� xml��
		// ��µ˴ϴ�.

		JSONObject jsonObject = XML.toJSONObject(profileDataXml); // xml�� json���� �Ľ��մϴ�.

		JSONObject responseData = jsonObject.getJSONObject("data");

		// json�� ������ data �Ʒ��� �ڽ��� ���� ���¿��� map���� �Ľ��� �ȵ˴ϴ�. ���� �ڽ� ���� �����մϴ�.

		Map<String, String> userMap = Utils.JSONStringToMap(responseData.get("response").toString());
		System.out.println(userMap.get("email"));
		session.setAttribute("email", userMap.get("email"));
		// ����� ���� ���� �ڽĳ�� �߿� response�� ����Ǿ� �ֽ��ϴ�. response�� �����Ͽ� �� ������ map���� �Ľ��մϴ�.

		return ".members.terms";

	}

	@RequestMapping(value = "/personalInfo")
	public void personalInfo(HttpServletRequest request) throws Exception {
		String token = "AAAAOMXEXCTHSoBwSNqMs0QhpLgUD6iXl9tm2TWauM1/8wPe+X61+rXjtcTwmxB69FLFNIwOwLCfO6fiLdQRv7CYXkI=";// ���̹�
																														// �α���
																														// ����
																														// ��ū;
																														// ���⿡
																														// ������
																														// ��ū����
																														// �־��ݴϴ�.
		String header = "Bearer " + token; // Bearer ������ ���� �߰�
		try {
			String apiURL = "https://openapi.naver.com/v1/nid/me";
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("Authorization", header);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // ���� ȣ��
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // ���� �߻�
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

	@RequestMapping(value = "/naverlogin")
	public String naverLogin(int type, int type1,HttpSession session) {
		String state = Utils.generateState(); // ��ū�� �����մϴ�.
		System.out.println("Ÿ����"+type);
		System.out.println("Ÿ��1��"+type1);
		session.setAttribute("type", type);
		session.setAttribute("type1", type1);
		session.setAttribute("state", state); // ���ǿ� ��ū�� �����մϴ�.
		return "redirect:" + requestUrl + state; // ������� URL�� ������ ��û�մϴ�.

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

}
