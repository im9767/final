package test.app.project.controller.md;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import test.app.project.service.md.BusinessService;

@Controller
public class BusinessHouseInsertController {
	 @Autowired
		private BusinessService service;
		public void setServcie(BusinessService service){
			this.service = service;
		}
	 
	 @RequestMapping(value="business_view/houseInformation_insert",method=RequestMethod.GET)
	 public String insertForm(){
		 return "/business_view/ac/houseInformation_insert";
	 }
	
	 @RequestMapping(value="/business_view/houseInformation_insertok",method=RequestMethod.POST)
	public String insertOk(int house_num,int bnum,String intro,String checkintime,String checkouttime,String company,String license,String ceo,String orgaddr,
			String workplace,String com_tel,HttpSession session){
		 
	
		 HashMap<String, Object> map=new HashMap<String, Object>();
		 map.put("house_num", house_num);
		 map.put("bnum", bnum);
		 map.put("intro", intro);
		 map.put("checkintime", checkintime);
		 map.put("checkouttime", checkouttime);
		 map.put("company", company);
		 map.put("license", license);
		 map.put("ceo", ceo);
		 map.put("orgaddr", orgaddr);
		 map.put("workplace", workplace);
		 map.put("com_tel", com_tel);
	
		 HashMap<String,Object> business=service.insert(map);
		 
		 
		 if (business != null) {
			 session.setAttribute("house_num", house_num);
			 session.setAttribute("bnum", bnum);
			 session.setAttribute("intro", intro);
			 session.setAttribute("checkintime", checkintime);
			 session.setAttribute("checkouttime", checkouttime);
			 session.setAttribute("company", company);
			 session.setAttribute("license", license);
			 session.setAttribute("ceo", ceo);
			 session.setAttribute("orgaddr", orgaddr);
			 session.setAttribute("workplace", workplace);
			 session.setAttribute("com_tel", com_tel);
			 
			 
			 return ".business";
		}else{
			return "/business_view/ac/houseInformation_insert";
		}
		 
		 
		 
	 } 
 }
