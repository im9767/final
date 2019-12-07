package test.app.project.controller.Y;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import test.app.project.service.Y.AdminService;

@Controller
public class LoginController {
	@Autowired
	private AdminService service;
	public void setService(AdminService service) {
		this.service = service;
	}
	@RequestMapping(value="/admin_view/login",method=RequestMethod.GET)
	public String loginForm(){
		return "admin_view/login";
	}
	@RequestMapping(value="/loginok",method=RequestMethod.POST)
	public String loginok(String aid,String apwd,HttpSession session){
		HashMap<String,Object> map=new HashMap<String, Object>();
		map.put("aid",aid);
		map.put("apwd",apwd);
		HashMap<String,Object> admin=service.login(map);
		if(admin!=null){
			session.setAttribute("aid",aid);
			return ".admin";
		}else{
			return "admin_view/login";
		}
	}
}
	
	