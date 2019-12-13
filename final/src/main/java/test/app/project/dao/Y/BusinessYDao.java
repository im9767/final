package test.app.project.dao.Y;

import java.util.List;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import test.app.project.vo.AmenitiesVo;
import test.app.project.vo.RoomsImgVo;
import test.app.project.vo.RoomsVo;

@Repository
public class BusinessYDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	public BusinessYDao(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate=sqlSessionTemplate;
	}
	//?��?��?��?��
	public int inamenities(AmenitiesVo vo){
		return 
		sqlSessionTemplate.insert("test.app.mybatis.mapperY.BusinessMapper.inamenities",vo);
	}
	public List<HashMap<String, Object>> selamenities(){
		return sqlSessionTemplate.selectList("test.app.mybatis.mapperY.BusinessMapper.allamenities");
	}
	//객실
	public List<HashMap<String, Object>> roomlistAll(int house_num){
		return sqlSessionTemplate.selectList("test.app.mybatis.mapperY.BusinessMapper.roomlistAll",house_num);
	}
	public List<String> rimginfo(int room_num){
		return sqlSessionTemplate.selectList("test.app.mybatis.mapperY.BusinessMapper.rimginfo",room_num);
	}
	public int inroom(RoomsVo vo){
		return 
		sqlSessionTemplate.insert("test.app.mybatis.mapperY.BusinessMapper.inroom",vo);
	}
	public int selrnum(RoomsVo vo){
		return 
		sqlSessionTemplate.selectOne("test.app.mybatis.mapperY.BusinessMapper.selrnum",vo);
	}
	public int inroomimg(RoomsImgVo vo){
		return 
		sqlSessionTemplate.insert("test.app.mybatis.mapperY.BusinessMapper.inroomimg",vo);
	}
	public int roomimgdel(int room_num){
		return sqlSessionTemplate.delete("test.app.mybatis.mapperY.BusinessMapper.roomimgdel",room_num);
	}
	public int roomdel(int room_num){
		return sqlSessionTemplate.delete("test.app.mybatis.mapperY.BusinessMapper.roomdel",room_num);
	}
	public List<HashMap<String, Object>> selroominfo(int room_num){
		return sqlSessionTemplate.selectList("test.app.mybatis.mapperY.BusinessMapper.selroominfo",room_num);
	}
	public int updateroom(RoomsVo vo){
		return 
		sqlSessionTemplate.update("test.app.mybatis.mapperY.BusinessMapper.updateroom",vo);
	}
	//?��?��?�� ?��보조?��
	public List<HashMap<String, Object>> biflist(String id){
		return sqlSessionTemplate.selectList("test.app.mybatis.mapperY.BusinessMapper.biflist",id);
	}
	public int inupbinfo(HashMap<String,Object> map){
		return sqlSessionTemplate.update("test.app.mybatis.mapperY.BusinessMapper.inupbinfo",map);
	}
	public int inupbjinfo(HashMap<String,Object> map){
		return sqlSessionTemplate.update("test.app.mybatis.mapperY.BusinessMapper.inupbjinfo",map);
	}
}







