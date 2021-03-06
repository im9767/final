package test.app.project.controller.K;



import java.text.DecimalFormat;
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
	public String accomlist(Model model,String sort, Date startday, Date endday, Date start_date, Date end_date, String date,
							String t,String p,String s){
		HashMap<String, Object> map = new HashMap<String, Object>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		DecimalFormat dc = new DecimalFormat("###,###,###");
		Date today = new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(today);
		cal.add(Calendar.DATE, 1);

		System.out.println(t);
		if(date!=null && startday==null){
			//start_date만 있을때
			map.put("sort", sort);
			map.put("date", date);
			map.put("start_date", sdf.format(start_date));
			map.put("end_date",  sdf.format(end_date));
			map.put("p", p);
			map.put("t",t);
			map.put("s", s);
			System.out.println("sort"+sort);
			System.out.println("date"+date);
			model.addAttribute("start_date",sdf.format(start_date));
			model.addAttribute("end_date",sdf.format(end_date));
			System.out.println("1");
		}else if(date==null && startday!=null){
			//startday만 있을때
			map.put("sort", sort);
			map.put("date", date);
			map.put("p", p);
			map.put("t",t);
			map.put("s", s);
			model.addAttribute("start_date",sdf.format(today));
			model.addAttribute("end_date", sdf.format(cal.getTime()));
			System.out.println("2");
		}else if(date==null && sort == null){
			System.out.println("11");
			//startday, start_date 둘 다 없을때 
			map.put("sort", sort);
			map.put("date", date);
			map.put("p", p);
			map.put("t",t);
			map.put("s", s);
			model.addAttribute("start_date",sdf.format(today));
			model.addAttribute("end_date", sdf.format(cal.getTime()));
		}
		List<RoomsVo> list=service.list(map);
		System.out.println("list:" + list);
		model.addAttribute("t",t);
		model.addAttribute("p",p);
		model.addAttribute("s",s);
		model.addAttribute("list",list);
		model.addAttribute("dc",dc);
		
		return ".product.accommodationList";
	}
}
