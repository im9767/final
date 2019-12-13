package test.app.project.controller.p;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import test.app.project.service.p.HouseService;
import test.app.project.vo.HouseVo;
import test.app.project.vo.ReviewJoinVo;
import test.app.project.vo.RoomsImgVo;
import test.app.project.vo.RoomsVo;

@Controller
public class HouseDetailController {
	
	@Autowired
	private HouseService houseService;
	
	// 업소 상세페이지 이동
	@RequestMapping(value="/house/detail")
	public String product_detail(@RequestParam(value="house_num",defaultValue="82")int house_num,String sdt,String edt,Model model){

		sdt = "2019/12/01";
		edt = "2019/12/10";
		
		HashMap<String , Object> roomMap = new HashMap<String, Object>();
		roomMap.put("house_num", house_num);
		roomMap.put("sdt", sdt);
		roomMap.put("edt", edt);
		
		List<HashMap<String, Object>> houseAmen = houseService.houseAmen(house_num);
		
		List<RoomsVo> foundRoom = houseService.foundRoom(roomMap);
		
		HashMap<String, Object> room_img_map = new HashMap<String, Object>();
		
		List<Integer> i = new ArrayList<Integer>();
		
		for(RoomsVo vo : foundRoom){
			i.add(vo.getRoom_num());
		}
		room_img_map.put("room_list", i);
		
		List<RoomsImgVo> room_images = houseService.room_images(room_img_map);
		
		List<ReviewJoinVo> review = houseService.reviewList(house_num);
		
		HouseVo houseinfo = houseService.houseInfo(house_num);
		
		model.addAttribute("houseAmen", houseAmen);
		model.addAttribute("foundRoom", foundRoom);
		model.addAttribute("room_images", room_images);
		model.addAttribute("review", review);
		model.addAttribute("houseinfo", houseinfo);
		
		return ".house_p.detail";
	}
	
}
