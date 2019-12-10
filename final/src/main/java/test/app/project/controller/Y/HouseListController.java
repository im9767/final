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

import test.app.project.service.Y.AdminService;
import test.app.project.vo.HouseVo;

@Controller
public class HouseListController {
	@Autowired
	private AdminService service;

	public void setService(AdminService service) {
		this.service = service;
	}
	//관리자 로그인페이지 이동
	@RequestMapping(value="/admin_view/table",method=RequestMethod.GET)
	public String loginForm(){
		return ".table";
	}
	//승인완료된 업체정보 조회
	@RequestMapping(value = "/admin_view/housetable", method = RequestMethod.GET)
	public String okapplist(Model model) {
		List<HashMap<String, Object>> mlist = service.listAll();
		model.addAttribute("okapplist",mlist);
		return ".housetable";
	}
	//승인완료된 등록업체삭제
	@RequestMapping(value = "/admin_view/deletehouse", method = RequestMethod.GET)
	public String deletehouse(int house_Num, HttpSession session) {
		int n = service.deletehouse(house_Num);
		if (n > 0) {
			return "redirect:/admin_view/housetable";
		} else {
			return "admin_view/housetable";
		}
	}
	//승인대기 업체조회
	@RequestMapping(value = "/admin_view/apphouse", method = RequestMethod.GET)
	public String noapplist(Model model) {
		List<HashMap<String,Object>> alist = service.applistAll();
		model.addAttribute("noapplist",alist);
		return ".apphouse";
	}
	//승인대기중인 업체 삭제
		@RequestMapping(value = "/admin_view/delhouse", method = RequestMethod.GET)
		public String delhouse(int house_Num, HttpSession session) {
			int n = service.appdelete(house_Num);
			if (n > 0) {
				return "redirect:/admin_view/apphouse";
			} else {
				return "admin_view/apphouse";
			}
		}
	//승인해주기
	@RequestMapping(value = "/admin_view/uphouse", method = RequestMethod.GET)
	public String uphouse(int house_Num, HttpSession session) {
		int n = service.appupdate(house_Num);
		if (n > 0) {
			return "redirect:/admin_view/apphouse";
		} else {
			return "admin_view/apphouse";
		}
	}
	
}
