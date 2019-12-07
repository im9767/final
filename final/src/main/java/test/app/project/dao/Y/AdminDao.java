package test.app.project.dao.Y;

import java.util.List;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import test.app.project.vo.EventVo;
import test.app.project.vo.HouseVo;
import test.app.project.vo.NoticeVo;

@Repository
public class AdminDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	public AdminDao(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate=sqlSessionTemplate;
	}
	//관리자 로그인
	public HashMap<String,Object> login(HashMap<String,Object> map){
		return 
		sqlSessionTemplate.selectOne("test.app.mybatis.mapperY.AdminMapper.login",map);
	}
	//업체관련
	public List<HashMap<String, Object>> listAll(){
		return sqlSessionTemplate.selectList("test.app.mybatis.mapperY.AdminMapper.listAll");
	}
	public int deletehouse(int house_Num){
		return sqlSessionTemplate.delete("test.app.mybatis.mapperY.AdminMapper.deletehouse",house_Num);
	}
	public List<HashMap<String, Object>> applistAll(){
		return sqlSessionTemplate.selectList("test.app.mybatis.mapperY.AdminMapper.applistAll");
	}
	public int appupdate(int house_Num){
		return sqlSessionTemplate.update("test.app.mybatis.mapperY.AdminMapper.appupdate",house_Num);
	}
	public int appdelete(int house_Num){
		return sqlSessionTemplate.delete("test.app.mybatis.mapperY.AdminMapper.appdelete",house_Num);
	}
	//공지사항
	public List<NoticeVo> nlistAll(){
		return sqlSessionTemplate.selectList("test.app.mybatis.mapperY.AdminMapper.nlistAll");
	}
	public int wnotice(HashMap<String,Object> map){
		return 
		sqlSessionTemplate.insert("test.app.mybatis.mapperY.AdminMapper.wnotice",map);
	}
	public int noticedelete(int nnum){
		return sqlSessionTemplate.delete("test.app.mybatis.mapperY.AdminMapper.noticedelete",nnum);
	}
	public List<NoticeVo> nlist(int nnum){
		return sqlSessionTemplate.selectList("test.app.mybatis.mapperY.AdminMapper.nlist",nnum);
	}
	public int upnotice(NoticeVo vo){
		return 
		sqlSessionTemplate.update("test.app.mybatis.mapperY.AdminMapper.upnotice",vo);
	}
	//이벤트
	public List<EventVo> elistAll(){
		return sqlSessionTemplate.selectList("test.app.mybatis.mapperY.AdminMapper.elistAll");
	}
	public int eventdelete(int event_Num){
		return sqlSessionTemplate.delete("test.app.mybatis.mapperY.AdminMapper.eventdelete",event_Num);
	}
	public int writeevent(HashMap<String, Object> map){
		return 
		sqlSessionTemplate.insert("test.app.mybatis.mapperY.AdminMapper.writeevent",map);
	}
	
}








