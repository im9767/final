package test.app.project.controller.p;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import test.app.project.service.p.MembersService;
import test.app.project.vo.MembersVo;

@Controller
public class MembersJoinController {
	
	@Autowired
	private MembersService membersService;
	
	@RequestMapping(value="/members/join",method=RequestMethod.GET)
	public String joinForm(){
		
		return "/members_p/join";
		
	}
	@RequestMapping(value="/members/join",method=RequestMethod.POST)
	public String join(String name,String id, String pwd1, String email, String phone){
		
		System.out.println("name:"+name);
		System.out.println("id:"+id);
		System.out.println("pwd:"+pwd1);
		System.out.println("email:"+email);
		System.out.println("phone:"+phone);
		
		MembersVo vo = new MembersVo(id, 1, pwd1, name, phone, email, null, 0);
		
		int n = membersService.join(vo);
		
		return ".main";
		
	}
	@RequestMapping(value="/members/idCheck",produces="application/json;charset=utf-8")
	@ResponseBody
	public String idCheck(String mid){
		
		MembersVo using = membersService.idCheck(mid);
		
		JSONObject json = new JSONObject();
		
		if(using!=null){
			json.put("using",true);
		}else{
			json.put("using", false);
		}
		
		System.out.println("using:"+json.toString());

		return json.toString();
		
	}
	
}
