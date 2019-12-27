package test.app.project.service.Y;



import java.sql.Date;
import java.util.HashMap;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import test.app.project.dao.Y.AdminDao;
import test.app.project.vo.AmenitiesVo;
import test.app.project.vo.EventVo;
import test.app.project.vo.EventimagesVo;
import test.app.project.vo.FaqVo;
import test.app.project.vo.NoticeVo;
import test.app.project.vo.QnaboardVo;
import test.app.project.vo.RoomsImgVo;
import test.app.project.vo.RoomsVo;

@Service
public class AdminService {
	
	@Autowired 
	private AdminDao dao;
	
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
	public int appfail(int house_Num){
		return dao.appfail(house_Num);
	}
	@Transactional(rollbackFor=Exception.class)
	public int appdelete(int house_Num) throws Exception{
		dao.himgdelete(house_Num);
		dao.hintrodelete(house_Num);
		dao.appdelete(house_Num);
		 return 1;
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
	public List<String> imginfo(int event_Num) {		
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
	//편의시설
	public int writeamenities(AmenitiesVo vo) {		
		return dao.inamenities(vo);	
	}
	public List<HashMap<String, Object>> selamenities(){
		return dao.selamenities();
	}
	//FAQ
	public List<FaqVo> flistAll(){
		return dao.flistAll();
	}
	public int wfaq(HashMap<String,Object> map){
		return dao.wfaq(map);
	}
	public int faqdelete(int fnum){
		return dao.faqdelete(fnum);
	}
	//QNA
		public List<QnaboardVo> qlistAll(){
			return dao.qlistAll();
		}
		public List<QnaboardVo> selqnalist(int qna_num){
			return dao.selqnalist(qna_num);
		}
		public int wqna(QnaboardVo vo){
			return dao.wqna(vo);
		}
}






