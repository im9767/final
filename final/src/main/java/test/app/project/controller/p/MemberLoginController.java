package test.app.project.controller.p;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;

import test.app.project.service.p.MembersService;
import test.app.project.vo.MembersVo;

@Controller
public class MemberLoginController {

	@Autowired
	private MembersService membersService;
	@Autowired
	private NaverLoginBo naverLoginBo;

	private String apiResult = null;

	@RequestMapping(value = "/members/login", method = RequestMethod.GET)
	public String loginForm(Model model, HttpSession session) {

		/*
		 * 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출
		 */
		String naverAuthUrl = naverLoginBo.getAuthorizationUrl(session);

		// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		// redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);

		// 네이버
		model.addAttribute("url", naverAuthUrl);

		return "/members_p/login";
	}

	@RequestMapping(value = "/members/login", method = RequestMethod.POST)
	public String login(String id, String pwd, Model model, HttpSession session) {
		MembersVo vo = new MembersVo();
		vo.setMid(id);
		vo.setMpwd(pwd);
		boolean vo1 = membersService.isMember(vo);

		if (!vo1) {
			model.addAttribute("msg", "아이디 또는 비밀번호가 틀렸습니다");
			return "/members_p/login";
		} else {
			session.setAttribute("id", id);
			return "redirect:/";
		}

	}

	@RequestMapping(value = "/members/naverLogin.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException {
		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBo.getAccessToken(session, code, state);
		// 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBo.getUserProfile(oauthToken);
		System.out.println(naverLoginBo.getUserProfile(oauthToken).toString());
		model.addAttribute("result", apiResult);
		System.out.println("result" + apiResult);
		
		/* 네이버 로그인 성공 페이지 View 호출 */
		
		JSONObject jsonObj = null;
		jsonObj = new JSONObject(apiResult);
		String snsId = (String) ((JSONObject) jsonObj.get("response")).get("id");
		String name = (String) ((JSONObject) jsonObj.get("response")).get("name");
		String email = (String) ((JSONObject) jsonObj.get("response")).get("email");

		MembersVo vo = new MembersVo();
		vo.setMid(snsId);
		vo.setMname(name);
		vo.setMemail(email);
		
		vo.setLogin_type(2);
		
		boolean find = membersService.naverLogin(vo);
		
		if(find){
			int n = membersService.naverLoginInsert(vo);
			
			System.out.println("네이버 로그인 최초 1회 회원 등록 :"+n);
		}
		
		System.out.println(snsId);
		System.out.println(name);
		
		session.setAttribute("id", snsId);

		return "redirect:/";
	}

	@RequestMapping(value = "/members/findPwd")
	public String findPwd() {
		return "/members_p/findPwd";
	}

}
