package test.app.project.daoimpl.p;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import test.app.project.dao.p.MainDao;
import test.app.project.vo.EventJoinVo;
@Repository
public class MainDaoImpl implements MainDao{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private final String NAMESPACE = "test.app.mybatis.mapper.p.MainMapper";
	
	@Override
	public List<EventJoinVo> event() {
		return sqlSessionTemplate.selectList(NAMESPACE+".event");
	}

}
