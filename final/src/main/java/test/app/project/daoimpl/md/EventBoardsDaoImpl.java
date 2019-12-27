package test.app.project.daoimpl.md;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import test.app.project.dao.md.EventBoardsDao;
import test.app.project.vo.EventImgVo;
import test.app.project.vo.EventVo;
import test.app.project.vo.EventimagesVo;

@Repository
public class EventBoardsDaoImpl implements EventBoardsDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private final String NAMESPACE="test.app.mybatis.mapper.MD.EventBoardsMapper";
	
	
	//여기는 이벤트 페이지 맨처음에 1번 이름 달린 이미지 한개만 뿌려주는거
	@Override
	public List<EventImgVo> eventList(HashMap<String, Object> map){
		return sqlSessionTemplate.selectList(NAMESPACE+".eventList",map);
		
	}
	
	//여기는 이벤트 세부 페이지 들어
	@Override
	public List<EventImgVo> eventdetailList(HashMap<String, Object> map){
		return sqlSessionTemplate.selectList(NAMESPACE+".eventList2",map);
		
	}
	
	public int eventBoardsCount(){
		return sqlSessionTemplate.selectOne(NAMESPACE+".eventBoardsCount");
	}
	
	public int hitup(int event_Num){
		return sqlSessionTemplate.update("test.app.mybatis.mapperY.AdminMapper.hitup",event_Num);
	}


	

	
}
