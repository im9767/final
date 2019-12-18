package test.app.project.controller.md;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import test.app.project.util.PageUtil;
import test.app.project.vo.EventImgVo;
import test.app.project.vo.EventVo;
import test.app.project.vo.EventimagesVo;

//�̺�Ʈ ������ �ѷ��ִ� ����
@Controller
public class eventboardsController {
	
	@Autowired 
	private test.app.project.service.md.EventBoardsService EventBoardsService; 
	
	@RequestMapping(value="/public/eventboards")
	public String eventlist(@RequestParam(value="pageNum",defaultValue="1")int pageNum,Model model){
		
		int totalRowCount= EventBoardsService.eventCount();
		PageUtil pagination = new PageUtil(pageNum, totalRowCount, 10, 5);
		
		
		
		//����¡ ó��
		HashMap<String , Object> map = new HashMap<String, Object>();
		
		map.put("startRow", pagination.getStartRow());
		map.put("endRow", pagination.getEndRow());
		
		//�̺�Ʈ �����̶� ��ȸ���� �̾ƿ��°�
		List<EventImgVo> event = EventBoardsService.eventList(map);
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("event", event);

	
		
		return ".public.eventboards";
	}
	
	
	
}
