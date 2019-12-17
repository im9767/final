package test.app.project.dao.Y;

import java.util.List;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import test.app.project.vo.AmenitiesVo;
import test.app.project.vo.BusinessVo;
import test.app.project.vo.HouseVo;
import test.app.project.vo.HouseintroVo;
import test.app.project.vo.RoomsImgVo;
import test.app.project.vo.RoomsVo;

@Repository
public class BusinessYDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	public BusinessYDao(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate=sqlSessionTemplate;
	}
	//업체 이미지 저장이름
	public String himgsavename(int house_num){
		return 
		sqlSessionTemplate.selectOne("test.app.mybatis.mapperY.BusinessMapper.himgsavename",house_num);
	}
	//업체 이미지 삭제
		public int houseImgdelete(int house_num){
			return 
			sqlSessionTemplate.delete("test.app.mybatis.mapperY.BusinessMapper.houseImgdelete",house_num);
		}
	//편의시설등록
	public int inamenities(AmenitiesVo vo){
		return 
		sqlSessionTemplate.insert("test.app.mybatis.mapperY.BusinessMapper.inamenities",vo);
	}
	public List<HashMap<String, Object>> selamenities(){
		return sqlSessionTemplate.selectList("test.app.mybatis.mapperY.BusinessMapper.allamenities");
	}
	public int delha(int hnum){
		return sqlSessionTemplate.delete("test.app.mybatis.mapperY.BusinessMapper.delha",hnum);
	}
	public int selanum(String baname){
		return 
		sqlSessionTemplate.selectOne("test.app.mybatis.mapperY.BusinessMapper.selanum",baname);
	}
	public int inha(HouseintroVo vo){
		return 
		sqlSessionTemplate.insert("test.app.mybatis.mapperY.BusinessMapper.inserthouseintro",vo);
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
	//사업자
	public List<HashMap<String, Object>> biflist(String id){
		return sqlSessionTemplate.selectList("test.app.mybatis.mapperY.BusinessMapper.biflist",id);
	}
	public int inupbinfo(HashMap<String,Object> map){
		return sqlSessionTemplate.update("test.app.mybatis.mapperY.BusinessMapper.inupbinfo",map);
	}
	public int inupbjinfo(HashMap<String,Object> map){
		return sqlSessionTemplate.update("test.app.mybatis.mapperY.BusinessMapper.inupbjinfo",map);
	}
	public int inupbimg(HashMap<String,Object> map){
		return sqlSessionTemplate.update("test.app.mybatis.mapperY.BusinessMapper.inupbimg",map);
	}
	//업체
	public int selhnum(String bid){
		return 
		sqlSessionTemplate.selectOne("test.app.mybatis.mapperY.BusinessMapper.selhnum",bid);
	}
	//사업자 가입 아이디체크
	public String bidCheck(String bid){
		return 
		sqlSessionTemplate.selectOne("test.app.mybatis.mapperY.BusinessMapper.selbid",bid);
	}
	//사업자 가입 체크
		public int joinbusiness(HashMap<String,Object> map){
			return 
			sqlSessionTemplate.insert("test.app.mybatis.mapperY.BusinessMapper.joinbusiness",map);
		}
	//업체등록
		public int inh(HouseVo vo){
			return 
			sqlSessionTemplate.insert("test.app.mybatis.mapperY.BusinessMapper.inh",vo);
		}
	//업채재등록
		public int uph(HouseVo vo){
			return 
			sqlSessionTemplate.update("test.app.mybatis.mapperY.BusinessMapper.uph",vo);
		}
		//사업자 비밀번호 찾기
		public BusinessVo findpwdy(HashMap<String,String> map){
			return sqlSessionTemplate.selectOne("test.app.mybatis.mapperY.BusinessMapper.findpwdy",map);
		}
		public int changepwdy(BusinessVo vo){
			return sqlSessionTemplate.update("test.app.mybatis.mapperY.BusinessMapper.changepwdy",vo);
		}
}








