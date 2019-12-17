package test.app.project.service.md;
 
import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import test.app.project.dao.md.BusinessDao;
import test.app.project.vo.AmenitiesVo;
import test.app.project.vo.EventVo;
import test.app.project.vo.EventimagesVo;
import test.app.project.vo.RoomsImgVo;
import test.app.project.vo.RoomsVo;

@Service
public class BusinessService {

	@Autowired 
	private BusinessDao dao;
	public BusinessService(BusinessDao dao) {
		this.dao = dao;
	}
	
	//사업자 등록용 구문
	public HashMap<String,Object> login(HashMap<String,Object> map){
		System.out.println(map);
		return dao.login(map);
	}
	
	//업체정보 등록용 구문
	public HashMap<String,Object> insert(HashMap<String,Object> map){
		System.out.println(map);
		return dao.insert(map);
	}

	//파일 업로드 용 구문
	public int insert(AmenitiesVo vo){
		return dao.insert(vo);
	}
	
	//방등록 및 이미지 등록
	@Transactional(rollbackFor=Exception.class)
	public int writeroom(HashMap<String, Object> irlist,int house_num) throws Exception{
	RoomsVo vo=new RoomsVo(0,house_num,(String)irlist.get("rname"),(Integer)irlist.get("price"),(String)irlist.get("rcontent"),0,(Integer)irlist.get("max"));	
	dao.inroom(vo);
	int a=dao.selrnum((String)irlist.get("rname"));
	for(int i=0;i<(Integer)irlist.get("imgcnt");i++){
		String savefilename=(String)irlist.get("savefilename"+i+1);
		String orgfilename=(String)irlist.get("orgfilename"+i+1);
	RoomsImgVo vo1=new RoomsImgVo(0,a,orgfilename,savefilename);
	dao.inroomimg(vo1);
	}
	return 1;
	}
	
	//편의시설 작성?
	public int writeamenities(AmenitiesVo vo) {		
		return dao.inamenities(vo);	
	}
	public List<HashMap<String, Object>> roomlistAll(int house_num){
		return dao.roomlistAll(house_num);
	}
	
	@Transactional(rollbackFor=Exception.class)
	public int roomdelete(int room_num){
		dao.roomimgdel(room_num);
		dao.roomdel(room_num);
		return 1;
	}
	public List<HashMap<String, Object>> selroominfo(int room_num) {
		return dao.selroominfo(room_num);
	}
	@Transactional(rollbackFor=Exception.class)
	public int uproom(HashMap<String, Object> irlist,int room_num) throws Exception{
	RoomsVo vo=new RoomsVo(room_num,0,(String)irlist.get("rname"),(Integer)irlist.get("price"),(String)irlist.get("rcontent"),0,(Integer)irlist.get("max"));	
	dao.updateroom(vo);
	dao.roomimgdel(room_num);
	for(int i=0;i<(Integer)irlist.get("imgcnt");i++){
		String savefilename=(String)irlist.get("savefilename"+i+1);
		String orgfilename=(String)irlist.get("orgfilename"+i+1);
	RoomsImgVo vo1=new RoomsImgVo(0,room_num,orgfilename,savefilename);
	dao.inroomimg(vo1);
	}
	return 1;
	}
	
	// 사업자 아이디로 조회해서 업체수 구하기
	public int houseCnt(HashMap<String, Object> map){
		return dao.houseCount(map);
	}
}














