package test.app.project.controller.p;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import test.app.project.service.p.HouseService;
import test.app.project.vo.HouseImgVo;
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
	public String product_detail(@RequestParam(value="house_num",defaultValue="83")int house_num,String sdt,String edt,Model model){
		
		if(sdt == null){
			HashMap<String, Object> date = houseService.getDate();
			sdt = (String)date.get("SDT");
			edt = (String)date.get("EDT");
		}
		
		HashMap<String , Object> roomMap = new HashMap<String, Object>();
		roomMap.put("house_num", house_num);
		roomMap.put("sdt", sdt);
		roomMap.put("edt", edt);
		
		List<HashMap<String, Object>> houseAmen = houseService.houseAmen(house_num);
		
		
		HashMap<String, Object> room_img_map = new HashMap<String, Object>();
		
		List<RoomsJoinVo> roomsJoin = houseService.roomsJoin(roomMap);
		
		System.out.println("roomJoin.size():"+roomsJoin.size());
		
		List<ReviewJoinVo> review = houseService.reviewList(house_num);
		
		HouseVo houseinfo = houseService.houseInfo(house_num);
		
		DecimalFormat dc = new DecimalFormat("###,###,###,###");
		
		model.addAttribute("houseAmen", houseAmen);

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
		
		HouseImgVo houseImg = houseService.houseImg(house_num);
		
		model.addAttribute("houseImg", houseImg);
		
		return ".house_p.detail";
	}
	
}
