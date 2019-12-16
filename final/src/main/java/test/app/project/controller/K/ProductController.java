package test.app.project.controller.K;



import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import test.app.project.service.K.ProductService;
import test.app.project.vo.RoomsVo;

@Controller
public class ProductController {
	@Autowired private ProductService service;

	@RequestMapping(value="/product/accommodationList", method=RequestMethod.GET)
	public String accomlist(Model model,String sort, Date startday, Date endday, Date start_date, Date end_date, String date){
		HashMap<String, Object> map = new HashMap<String, Object>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
	
		Date today = new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(today);
		cal.add(Calendar.DATE, 1);
		
		if(date!=null && startday==null){
			
			map.put("sort", sort);
			map.put("date", date);
			map.put("start_date", sdf.format(start_date));
			map.put("end_date",  sdf.format(end_date));
			System.out.println("sort"+sort);
			System.out.println("date"+date);
			System.out.println("1");
			model.addAttribute("start_date",sdf.format(start_date));
			model.addAttribute("end_date",sdf.format(end_date));
			System.out.println("1");
		}else if(date==null && startday!=null){
			map.put("sort", sort);
			map.put("date", date);
			System.out.println("2");
			model.addAttribute("start_date",sdf.format(today));
			model.addAttribute("end_date", sdf.format(cal.getTime()));
			System.out.println("2");
		}else if(date==null && sort == null){
			System.out.println("11");
			map.put("sort", sort);
			map.put("date", date);
			model.addAttribute("start_date",sdf.format(today));
			model.addAttribute("end_date", sdf.format(cal.getTime()));
			System.out.println();
		}
		List<RoomsVo> list=service.list(map);
		System.out.println("list:" + list);
		model.addAttribute("list",list);
	
		
		
		return ".product.accommodationList";
	}
}
