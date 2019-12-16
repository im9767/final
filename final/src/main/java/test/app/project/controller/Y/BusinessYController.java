package test.app.project.controller.Y;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import test.app.project.service.Y.BusinessYService;
import test.app.project.vo.NoticeVo;

@Controller
public class BusinessYController {
	@Autowired
	private BusinessYService service;
	public void setService(BusinessYService service) {
		this.service = service;
	}
	//사업자정보 수정페이지 이동
	@RequestMapping(value="business_view/updatebusinessinfo",method=RequestMethod.GET)
	public ModelAndView upinfo(HttpSession session){
		String bid=(String)session.getAttribute("bid");
		List<HashMap<String,Object>> list = service.biflist(bid);
		System.out.println(list);
		ModelAndView mv = new ModelAndView("business_view/ac/updatebusinessinfo");
		mv.addObject("businessinfolist", list);
		return mv;
	
	}
	//사업자 정보 수정 체크
	@RequestMapping(value="business_view/updatebusinessinfook",method=RequestMethod.POST)
	public String ubinfook(HttpSession session,String bname,String bcompany,String blicense,String bworkplace,String bcom_tel,String bemail){
		String bid=(String)session.getAttribute("bid");
		HashMap<String, Object> map= new HashMap<String, Object>();
		map.put("bname", bname);
		map.put("bcompany", bcompany);
		map.put("blicense", blicense);
		map.put("bworkplace", bworkplace);
		map.put("bcom_tel", bcom_tel);
		map.put("bemail", bemail);
		map.put("bid", bid);
		try {
			service.inupbinfo(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ".business";
	}
	
	//사업자 업체 편의시설
		@RequestMapping(value = "business_view/updatehouseamenities", method = RequestMethod.GET)
		public ModelAndView selham() {
			List<HashMap<String,Object>> list = service.selamenities();
			ModelAndView mv = new ModelAndView("business_view/ac/updatehouseamenities");
			mv.addObject("selam", list);
			return mv;
		}
	//사업자 업체 편의시설 수정체크
		@RequestMapping(value="business_view/updateamenitiesok",method=RequestMethod.POST)
		public String upamok(String[] sublist,HttpSession sesson){
			int hnum=(Integer) sesson.getAttribute("house_num");
			HashMap<String, Object> map= new HashMap<String, Object>();
			for (int i = 0; i < sublist.length; i++) {
				System.out.println(sublist[i]);
				map.put("baname"+i,sublist[i]);
			}
			try {
				service.upba(map,hnum);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return ".business";
		}
		
}
	
	