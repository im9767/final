package test.app.project.controller.Y;

import java.util.HashMap;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import test.app.project.service.Y.BusinessYService;
import test.app.project.util.Email;
import test.app.project.util.EmailSender;
import test.app.project.vo.BusinessVo;


@Controller
public class BemailController {
	@Autowired
	private EmailSender emailSender;

	@Autowired
	private Email email;

	@Autowired
	private BusinessYService service;
	
	@RequestMapping(value = "business_view/findpassword", method = RequestMethod.GET)
	public String findpassword() {
		return "business_view/ac/findpassword";
	}
	
	@RequestMapping(value="business_view/sendemail",method=RequestMethod.POST)
	public String sendEmailAction(String bid, String bemail) throws Exception {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("bid", bid);
		map.put("bemail", bemail);
		
		BusinessVo vo =service.findpwdy(map);
		
		if (vo != null) {
			
			UUID uuid = UUID.randomUUID();
			String uid = uuid.toString().replaceAll("-", "");
			String pwd = uid.substring(0, 10);
			System.out.println("pwd:"+pwd);
			
			
			vo.setBpwd(pwd);
			service.changepwdy(vo);
			
			email.setContent("비밀번호는 " + pwd + " 입니다.");
			email.setReceiver(vo.getBemail());
			email.setSubject(bid + "님 비밀번호 찾기 메일입니다.");
			emailSender.SendEmail(email);
			return "business_view/ac/login";
			
		}
		return "business_view/ac/login";
	}

}
