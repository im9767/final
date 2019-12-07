package test.app.project.controller.p;

import java.util.HashMap;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import test.app.project.service.p.MembersService;
import test.app.project.util.Email;
import test.app.project.util.EmailSender;
import test.app.project.vo.MembersVo;

@Controller
public class EmailController {
	@Autowired
	private EmailSender emailSender;

	@Autowired
	private Email email;

	@Autowired
	private MembersService membersService;

	@RequestMapping(value="/members/sendpw",method=RequestMethod.POST)
	public String sendEmailAction(String id, String email1, Model model) throws Exception {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("mid", id);
		map.put("memail", email1);
		
		System.out.println(map.get("mid"));
		System.out.println(map.get("memail"));
		
		MembersVo vo = membersService.findPwd(map);
		
		if (vo != null) {
			
			UUID uuid = UUID.randomUUID();
			System.out.println("uuid:"+uuid.toString());
			String uid = uuid.toString().replaceAll("-", "");
			System.out.println("uid:"+uid);
			String pwd = uid.substring(0, 10);
			System.out.println("pwd:"+pwd);
			
			
			vo.setMpwd(pwd);
			membersService.changePwd(vo);
			
			email.setContent("비밀번호는 " + pwd + " 입니다.");
			email.setReceiver(vo.getMemail());
			email.setSubject(id + "님 비밀번호 찾기 메일입니다.");
			emailSender.SendEmail(email);
			model.addAttribute("code","success");
			return "members_p/result";
			
		} else {
			model.addAttribute("code","fail");
			return "members_p/result";
			
		}
	}

}
