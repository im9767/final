package test.app.project.controller.p;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HouseDetailController {
	
	
	// 업소 상세페이지 이동
	@RequestMapping(value="/house/detail")
	public String product_detail(){
		return ".house_p.detail3";
	}
	
}
