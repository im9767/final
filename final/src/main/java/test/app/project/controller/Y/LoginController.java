package test.app.project.controller.Y;
import java.util.HashMap;
import java.awt.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import test.app.project.service.L.PaymentService;
import test.app.project.service.Y.AdminService;
import test.app.project.vo.EventVo;

@Controller
public class LoginController {
	@Autowired
	private AdminService service;
	public void setService(AdminService service) {
		this.service = service;
	}

	@Autowired private PaymentService service1;
	
	@RequestMapping(value="/admin_view/login",method=RequestMethod.GET)
	public String loginForm(){
		return "admin_view/login";
	}
	//관리자 로그인 체크
	@RequestMapping(value="/loginok",method=RequestMethod.POST)
	public String loginok(@RequestParam(value="year",defaultValue="2019")int year,String aid,String apwd,HttpSession session,Model model){
		HashMap<String,Object> map=new HashMap<String, Object>();
		HashMap<String,Object> map1=new HashMap<String, Object>();
		session.setAttribute("aid", aid);
		
		map.put("aid",aid);
		map.put("apwd",apwd);
		
		int years=year+1;
		map1.put("year", year);
		map1.put("years", years);
		java.util.List<EventVo> elist=service.elistAll();
		
		HashMap<String,Object> admin=service.login(map);
		java.util.List<HashMap<String, Object>> piechart=service1.piechart();
		java.util.List<HashMap<String, Object>> slist=service1.statics(map1);
		if(admin!=null){
			session.setAttribute("aid",aid);
			session.setAttribute("apwd",apwd);
			model.addAttribute("list",piechart);
			model.addAttribute("slist",slist);
			session.setAttribute("eelist",elist);
			model.addAttribute("year",year);
			return ".admin";
		}else{
			return "admin_view/login";
		}
	}
	//회원이보는 페이지로 이동
	@RequestMapping(value="/admin_view/gohome",method=RequestMethod.GET)
	public String gohome(String aid,String apwd,Model model){
		try{
			List alist=new List();
			alist.add(aid);
			alist.add(apwd);
			model.addAttribute("code","success");
		}catch(Exception e){
			model.addAttribute("code","null");
			e.printStackTrace();
		}
		return ".main";		
	}
	//로그아웃 하는 컨트롤러
	@RequestMapping(value="/admin/logout")
	public String adminLogout(HttpSession session){
		session.removeAttribute("aid");
		session.removeAttribute("apwd");
		return ".main";
	}
	//사업자 홈
		@RequestMapping(value="business/view")
		public String bhome(HttpSession session){		
			return ".business";
		}
}
	
	