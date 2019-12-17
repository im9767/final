package test.app.project.dao.md;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import test.app.project.vo.AmenitiesVo;
import test.app.project.vo.RoomsImgVo;
import test.app.project.vo.RoomsVo;

@Repository
public class BusinessDao {

	@Autowired 
	private SqlSessionTemplate sqlSessionTemplate;
	private final String NAMESPACE="test.app.mybatis.mapper.MD.BusinessMapper";
	
	public HashMap<String,Object> login(HashMap<String,Object> map){
		System.out.println("businessdao");
		return sqlSessionTemplate.selectOne(NAMESPACE+".login",map);
	}
	
	public HashMap<String,Object> insert(HashMap<String,Object> map){
		return sqlSessionTemplate.selectOne(NAMESPACE+".insert",map);
	}

	//���� ���ε�� 
	public int insert(AmenitiesVo vo){
		return sqlSessionTemplate.insert(NAMESPACE +".Amenitiesinsert",vo);
	}
	
	//���� ���� ���ε�
	public int inroom(RoomsVo vo){
		return 
		sqlSessionTemplate.insert(NAMESPACE+".inroom",vo);
	}
	
	public int selrnum(String rname){
		return 
		sqlSessionTemplate.selectOne(NAMESPACE+".selrnum",rname);
	}
	
	public int inroomimg(RoomsImgVo vo){
		return 
		sqlSessionTemplate.insert(NAMESPACE+".inroomimg",vo);
	}
	public int roomimgdel(int room_num){
		return sqlSessionTemplate.delete(NAMESPACE+".roomimgdel",room_num);
	}
	public int roomdel(int room_num){
		return sqlSessionTemplate.delete(NAMESPACE+".roomdel",room_num);
	}
	public List<HashMap<String, Object>> selroominfo(int room_num){
		return sqlSessionTemplate.selectList(NAMESPACE+".selroominfo",room_num);
	}
	public int updateroom(RoomsVo vo){
		return 
		sqlSessionTemplate.update(NAMESPACE+".updateroom",vo);
	}
	
	public int inamenities(AmenitiesVo vo){
		return 
		sqlSessionTemplate.insert(NAMESPACE+".inamenities",vo);
	}
	public List<HashMap<String, Object>> roomlistAll(int house_num){
		return sqlSessionTemplate.selectList(NAMESPACE+".roomlistAll",house_num);
	}
	
	//사업자 아이디로 해당 업체의 수 구하기
	public int houseCount(HashMap<String, Object> map){
		return sqlSessionTemplate.selectOne(NAMESPACE+".housecnt",map);
	}
	
}






