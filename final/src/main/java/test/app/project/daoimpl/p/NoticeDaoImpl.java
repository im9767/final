package test.app.project.daoimpl.p;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import test.app.project.dao.p.NoticeDao;
import test.app.project.vo.NoticeVo;

@Repository
public class NoticeDaoImpl implements NoticeDao{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private final String NAMESPACE = "test.app.mybatis.mapper.p.NoticeMapper";
	
	
	// 공지사항 리스트 리턴
	@Override
	public List<NoticeVo> noticeList(HashMap<String, Object> map) {
		return sqlSessionTemplate.selectList(NAMESPACE+".noticeList", map);
	}
	
	// 전체 공지사항 갯수 리턴
	public int noticeCount(){
		return sqlSessionTemplate.selectOne(NAMESPACE+".noticeCount");			
	}
	
}
