package test.app.project.controller.md;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import test.app.project.service.md.BusinessService;

@Controller
public class BusinessLoginController {
	@Autowired
	private BusinessService service;
	public void setServcie(BusinessService service){
		this.service = service;
	}
	@RequestMapping(value="business_view/login",method=RequestMethod.GET)
	public String loginForm(){
		return "business_view/ac/login";
	}
	@RequestMapping(value="business_view/loginok",method=RequestMethod.POST)
	public String loginOk(String bid,String bpwd,HttpSession session){
		HashMap<String,Object> map=new HashMap<String, Object>();
		map.put("bid",bid);
		map.put("bpwd",bpwd);
	
		HashMap<String,Object> business=service.login(map);
	
		if(business!=null){
			session.setAttribute("bid",bid);
			session.setAttribute("bpwd",bpwd);
			return ".business";
		}else{
			return "business_view/ac/login";
		}
	}
	
}


