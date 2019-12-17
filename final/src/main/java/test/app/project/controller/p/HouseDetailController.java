package test.app.project.controller.p;

import java.text.DecimalFormat;
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
import test.app.project.vo.RoomsJoinVo;
import test.app.project.vo.RoomsVo;

@Controller
public class HouseDetailController {
	
	@Autowired
	private HouseService houseService;
	
	// 업소 상세페이지 이동
	@RequestMapping(value="/house/detail")
	public String product_detail(@RequestParam(value="house_num",defaultValue="82")int house_num,String sdt,String edt,Model model){
		
		
		if(sdt == null){
			sdt = "2019/12/01";
			edt = "2019/12/10";
		}
		HashMap<String , Object> roomMap = new HashMap<String, Object>();
		roomMap.put("house_num", house_num);
		roomMap.put("sdt", sdt);
		roomMap.put("edt", edt);
		
		List<HashMap<String, Object>> houseAmen = houseService.houseAmen(house_num);
		
		//List<RoomsVo> foundRoom = houseService.foundRoom(roomMap);
		
		//System.out.println("foundRoom:"+foundRoom.toString());
		
		HashMap<String, Object> room_img_map = new HashMap<String, Object>();
		
		/*
		List<Integer> i = new ArrayList<Integer>();
		
		for(RoomsVo vo : foundRoom){
			i.add(vo.getRoom_num());
			System.out.println("vo.getnum:"+vo.getRoom_num());
		}
		room_img_map.put("room_list", i);
		
		List<RoomsImgVo> room_images = houseService.room_images(room_img_map);
		*/
		//System.out.println("room_images:"+room_images.toString());
		//System.out.println("room_images.size:"+room_images.size());
		
		List<RoomsJoinVo> roomsJoin = houseService.roomsJoin(roomMap);
		
		System.out.println("roomJoin.size():"+roomsJoin.size());
		
		List<ReviewJoinVo> review = houseService.reviewList(house_num);
		
		HouseVo houseinfo = houseService.houseInfo(house_num);
		
		DecimalFormat dc = new DecimalFormat("###,###,###,###");
		
		model.addAttribute("houseAmen", houseAmen);
		//model.addAttribute("foundRoom", foundRoom);
		//model.addAttribute("room_images", room_images);
		model.addAttribute("review", review);
		model.addAttribute("houseinfo", houseinfo);
		model.addAttribute("sdt", sdt);
		model.addAttribute("edt", edt);
		model.addAttribute("dc", dc);
		
		model.addAttribute("roomsJoin", roomsJoin);
		
		double reviewScore = houseService.reviewScore(house_num);
		
		model.addAttribute("reviewScore",reviewScore);
		
		int reviewCount = houseService.reviewCount(house_num);
		
		model.addAttribute("reviewCount", reviewCount);
		
		return ".house_p.detail";
	}
	
}
