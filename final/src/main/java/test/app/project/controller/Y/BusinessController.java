package test.app.project.controller.Y;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import test.app.project.service.Y.BusinessService;

@Controller
public class BusinessController {
	@Autowired
	private BusinessService service;
	public void setService(BusinessService service) {
		this.service = service;
	}
	
	@RequestMapping(value="/admin_view/updatebusinessinfo",method=RequestMethod.GET)
	public ModelAndView upinfo(HttpSession session){
		String bid=(String)session.getAttribute("aid");
		List<HashMap<String,Object>> list = service.biflist(bid);
		System.out.println(list);
		ModelAndView mv = new ModelAndView("admin_view/updatebusinessinfo");
		mv.addObject("businessinfolist", list);
		return mv;
	
	}
	@RequestMapping(value="/admin_view/updatebusinessinfook",method=RequestMethod.POST)
	public String ubinfook(HttpSession session,String bname,String bcompany,String blicense,String bworkplace,String bcom_tel,String bemail){
		String bid=(String)session.getAttribute("aid");
		HashMap<String, Object> map= new HashMap<String, Object>();
		map.put("bname", bname);
		map.put("bcompany", bcompany);
		map.put("blicense", blicense);
		map.put("bworkplace", bworkplace);
		map.put("bcom_tel", bcom_tel);
		map.put("bemail", bemail);
		map.put("bid", bid);
		service.inupbinfo(map);
		return ".admin";
	}
}
	
	