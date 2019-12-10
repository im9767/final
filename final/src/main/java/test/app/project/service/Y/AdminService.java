package test.app.project.service.Y;


import static org.hamcrest.CoreMatchers.equalTo;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import test.app.project.dao.Y.AdminDao;
import test.app.project.vo.AmenitiesVo;
import test.app.project.vo.EventVo;
import test.app.project.vo.EventimagesVo;
import test.app.project.vo.HouseVo;
import test.app.project.vo.NoticeVo;
import test.app.project.vo.RoomsImgVo;
import test.app.project.vo.RoomsVo;

@Service
public class AdminService {
	
	@Autowired 
	private AdminDao dao;
	public AdminService(AdminDao dao) {
		this.dao = dao;
	}
	//관리자 로그인
	public HashMap<String,Object> login(HashMap<String,Object> map){
		return dao.login(map);
	}
	//업체관련
	public List<HashMap<String, Object>> listAll(){
		return dao.listAll();
	}
	public int deletehouse(int house_Num){
		return dao.deletehouse(house_Num);
	}
	public List<HashMap<String, Object>> applistAll(){
		return dao.applistAll();
	}
	public int appupdate(int house_Num){
		return dao.appupdate(house_Num);
	}
	public int appdelete(int house_Num){
		return dao.appdelete(house_Num);
	}
	//공지사항
	public List<NoticeVo> nlistAll(){
		return dao.nlistAll();
	}
	public int wnotice(HashMap<String,Object> map){
		return dao.wnotice(map);
	}
	public int noticedelete(int nnum){
		return dao.noticedelete(nnum);
	}
	public List<NoticeVo> nlist(int nnum){
		return dao.nlist(nnum);
	}
	public int upnotice(NoticeVo vo){
		System.out.println(vo.getNregdate());
		return dao.upnotice(vo);
	}
	//이벤트
	public List<EventVo> elistAll(){
		return dao.elistAll();
	}
	@Transactional(rollbackFor=Exception.class)
	public int eventdelete(int event_Num){
		dao.eventimgdelete(event_Num);
		dao.eventdelete(event_Num);
		return 1;
	}
	@Transactional(rollbackFor=Exception.class)
		public int writeevent(HashMap<String, Object> elist) throws Exception{
		EventVo vo=new EventVo(0,(String)elist.get("etitle"),null,0,(Date)elist.get("sdate"),(Date)elist.get("edate"));	
		dao.inevent(vo);
		int a=dao.selenum((String)elist.get("etitle"));
		for(int i=0;i<(Integer)elist.get("imgcnt");i++){
			String savefilename=(String)elist.get("savefilename"+i+1);
			String orgfilename=(String)elist.get("orgfilename"+i+1);
		EventimagesVo vo1=new EventimagesVo(0,orgfilename,savefilename,a);
		dao.ineventimg(vo1);
		}
		return 1;
		}
	public List<HashMap<String, Object>> selevent(int event_Num) {		
			return dao.selevent(event_Num);	
	}
	public EventimagesVo imginfo(int event_Num) {		
		return dao.imginfo(event_Num);	
}
	@Transactional(rollbackFor=Exception.class)
	public List<HashMap<String, Object>> seleventinfo(int event_Num) {
		dao.hitup(event_Num);
		return dao.seleventinfo(event_Num);	
	}
	@Transactional(rollbackFor=Exception.class)
	public int updateevent(HashMap<String, Object> elist,int event_Num) throws Exception{
	EventVo vo=new EventVo(event_Num,(String)elist.get("etitle"),null,0,(Date)elist.get("sdate"),(Date)elist.get("edate"));	
	dao.eventimgdelete(event_Num);
	dao.upevent(vo);
	for(int i=0;i<(Integer)elist.get("imgcnt");i++){
		String savefilename=(String)elist.get("savefilename"+i+1);
		String orgfilename=(String)elist.get("orgfilename"+i+1);
	EventimagesVo vo1=new EventimagesVo(0,orgfilename,savefilename,event_Num);
	dao.ineventimg(vo1);
	}
	return 1;
	}
	//편의시설등록
	public int writeamenities(AmenitiesVo vo) {		
		return dao.inamenities(vo);	
	}
	public List<HashMap<String, Object>> roomlistAll(int house_num){
		return dao.roomlistAll(house_num);
	}
	
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
}






