package test.app.project.service.md;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import test.app.project.daoimpl.md.EventBoardsDaoImpl;
import test.app.project.vo.EventImgVo;
import test.app.project.vo.EventVo;
import test.app.project.vo.EventimagesVo;
import test.app.project.vo.NoticeVo;

@Service
public class EventBoardsService {

	@Autowired
	private EventBoardsDaoImpl eventBoardsDaoImpl;
	
	
	//여기서 이벤트테이블 리스트 받아서 그 번호를 각 이미지 테이블에서 이미지 가져올것
	//뒤에 1번 이라고 번호 달린 이미지만 가져올려는거
	public List<EventImgVo> eventList(HashMap<String, Object> map){
		
		
		return eventBoardsDaoImpl.eventList(map);
	}
	
	
	public int eventCount(){
		return eventBoardsDaoImpl.eventBoardsCount();
	}
	
	public int hitup(int event_Num){
		return eventBoardsDaoImpl.hitup(event_Num);
	}

	
	//이게 이벤트 테이블 세부내용 가져다 쓰게 하는거
	
	public List<EventImgVo> eventDetailList(HashMap<String, Object> map){
		
		
		return eventBoardsDaoImpl.eventdetailList(map);
	}
	
}
