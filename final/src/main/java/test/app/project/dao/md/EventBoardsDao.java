package test.app.project.dao.md;

import java.util.HashMap;
import java.util.List;

import test.app.project.vo.EventImgVo;
import test.app.project.vo.EventVo;
import test.app.project.vo.EventimagesVo;

public interface EventBoardsDao {

	public List<EventImgVo> eventList(HashMap<String, Object> map);
	
	
	public int eventBoardsCount();


	List<EventImgVo> eventdetailList(HashMap<String, Object> map);
	
}
