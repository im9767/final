package test.app.project.controller.l;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import test.app.project.service.L.MembersService1;
import test.app.project.vo.MembersVo;

@Controller
public class MembersListController {
	@Autowired private MembersService1 service;
	
	@RequestMapping(value="/admin/members",method=RequestMethod.GET)
	public String memberslist(Model model){
		List<MembersVo> list=service.memberslist();
		model.addAttribute("list",list);
		return ".table";
	}
}








