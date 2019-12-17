package test.app.project.controller.md;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import test.app.project.service.Y.BusinessYService;
import test.app.project.service.md.BusinessService;

@Controller
public class BusinessLoginController {
	@Autowired
	private BusinessService service;
	@Autowired
	private BusinessYService servicey;
	public void setServcie(BusinessService service){
		this.service = service;
	}
	public void setServcieY(BusinessYService servicey){
		this.servicey = servicey;
	}
	@RequestMapping(value="business_view/login",method=RequestMethod.GET)
	public String loginForm(){
		return "business_view/ac/login";
	}
	@RequestMapping(value="business_view/loginok",method=RequestMethod.POST)
	public String loginOk(String bid,String bpwd,HttpSession session,Model model){
		HashMap<String,Object> map=new HashMap<String, Object>();
		HashMap<String,Object> housemap=new HashMap<String, Object>();
		map.put("bid",bid);
		map.put("bpwd",bpwd);
		housemap.put("bbid", bid);
		//사업자 아이디로 조회한 업체수
		int houseCnt=service.houseCnt(housemap);
		System.out.println("등록된 업체 수: " + houseCnt);
		
		HashMap<String,Object> business=service.login(map);
	
		if(business!=null){
			session.setAttribute("bid",bid);
			session.setAttribute("bpwd",bpwd);
			//int a=servicey.selhnum(bid);
			//session.setAttribute("house_num", a);
			session.setAttribute("houseCnt", houseCnt);
			if(houseCnt>0){
				int a=servicey.selhnum(bid);
				session.setAttribute("house_num", a);
				return ".business";
			}else{
				return ".business_view.ac.main_sub";
			}
		}else{
			return "business_view/ac/login";
		}
	}
	@RequestMapping(value="business/loginok",method=RequestMethod.GET)
	public String gomyBesiness(){
		return ".business_view.ac.main_sub";
	}
}







