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
	
	
	//����� �̺�Ʈ ������ ��ó���� 1�� �̸� �޸� �̹��� �Ѱ��� �ѷ��ִ°�
	@Override
	public List<EventImgVo> eventList(HashMap<String, Object> map){
		return sqlSessionTemplate.selectList(NAMESPACE+".eventList",map);
		
	}
	
	//����� �̺�Ʈ ���� ������ ���
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
