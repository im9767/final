package test.app.project.controller.l;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import test.app.project.service.L.MembersService1;
import test.app.project.vo.RoomsVo;

@Controller
public class AdminRooms {
	@Autowired MembersService1 service;
	
	@RequestMapping(value="/company/roominfo",method=RequestMethod.GET)
	public String roomsList(String house_num, Model model){
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("house_num", house_num);
		List<RoomsVo> rlist=service.roomsList(map);
		model.addAttribute("rlist",rlist);
		return null;
	}
}
