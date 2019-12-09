package test.app.project.controller.K;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import test.app.project.service.K.ProductService;
import test.app.project.vo.RoomsVo;

@Controller
public class ProductController {
	@Autowired private ProductService service;

	@RequestMapping(value="/product/accommodationList")
	public String accomlist(Model model){
		List<RoomsVo> list=service.list();
		model.addAttribute("list",list);
		return ".product.accommodationList";
	}
}
