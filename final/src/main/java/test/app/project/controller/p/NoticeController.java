package test.app.project.controller.p;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import test.app.project.service.p.NoticeService;
import test.app.project.util.PageUtil;
import test.app.project.vo.NoticeVo;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping(value="/public/noticeList")
	public String noticeList(@RequestParam(value="pageNum",defaultValue="1")int pageNum,Model model){
		
		int totalRowCount = noticeService.noticeCount();
		
		PageUtil pagination = new PageUtil(pageNum, totalRowCount, 10, 5);
		
		HashMap<String , Object> map = new HashMap<String, Object>();
		
		map.put("startRow", pagination.getStartRow());
		map.put("endRow", pagination.getEndRow());
		
		List<NoticeVo> notice = noticeService.noticeList(map);
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("notice", notice);
		
		return ".public.notice";
	}
	
}
