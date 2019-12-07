package test.app.project.service.Y;



import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import test.app.project.dao.Y.AdminDao;
import test.app.project.vo.EventVo;
import test.app.project.vo.EventimagesVo;
import test.app.project.vo.HouseVo;
import test.app.project.vo.NoticeVo;


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
	public int eventdelete(int event_Num){
		return dao.eventdelete(event_Num);
	}
	@Transactional(rollbackFor=Exception.class)
		public int writeevent(HashMap<String, Object> map) throws Exception{
		
			return 1;
		}
		
	/*
	public int insert(MembersVo vo){
		 membersDao.insert(vo);
		 PointsVo pvo=new PointsVo(0,vo.getNum(),1000000, null);
		 pointsDao.insert(pvo);
		 return 1;
	}
	*/
}






