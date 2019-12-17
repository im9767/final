package test.app.project.service.Y;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import test.app.project.dao.L.AdminMembersDao;
import test.app.project.dao.Y.BusinessYDao;
import test.app.project.vo.AmenitiesVo;
import test.app.project.vo.HouseImgVo;
import test.app.project.vo.HouseVo;
import test.app.project.vo.HouseintroVo;
import test.app.project.vo.RoomsImgVo;
import test.app.project.vo.RoomsVo;

@Service
public class BusinessYService {

	@Autowired
	private BusinessYDao dao;

	@Autowired
	private AdminMembersDao dao1;
	
	//편의시설
	public int writeamenities(AmenitiesVo vo) {
		return dao.inamenities(vo);
	}

	public List<HashMap<String, Object>> selamenities() {
		return dao.selamenities();
	}

	//방
	public List<HashMap<String, Object>> roomlistAll(int house_num) {
		return dao.roomlistAll(house_num);
	}

	public List<String> rimginfo(int room_num) {
		return dao.rimginfo(room_num);
	}

	@Transactional(rollbackFor = Exception.class)
	public int writeroom(HashMap<String, Object> irlist, int house_num) throws Exception {
		RoomsVo vo = new RoomsVo(0, house_num, (String) irlist.get("rname"), (Integer) irlist.get("price"),
				(String) irlist.get("rcontent"), 0, (Integer) irlist.get("max"));
		dao.inroom(vo);
		int a = dao.selrnum(vo);
		for (int i = 0; i < (Integer) irlist.get("imgcnt"); i++) {
			String savefilename = (String) irlist.get("savefilename" + i + 1);
			String orgfilename = (String) irlist.get("orgfilename" + i + 1);
			RoomsImgVo vo1 = new RoomsImgVo(0, a, orgfilename, savefilename);
			dao.inroomimg(vo1);
		}
		return 1;
	}

	@Transactional(rollbackFor = Exception.class)
	public int roomdelete(int room_num) {
		dao.roomimgdel(room_num);
		dao.roomdel(room_num);
		return 1;
	}

	public List<HashMap<String, Object>> selroominfo(int room_num) {
		return dao.selroominfo(room_num);
	}

	@Transactional(rollbackFor = Exception.class)
	public int uproom(HashMap<String, Object> irlist, int room_num) throws Exception {
		RoomsVo vo = new RoomsVo(room_num, 0, (String) irlist.get("rname"), (Integer) irlist.get("price"),
				(String) irlist.get("rcontent"), 0, (Integer) irlist.get("max"));
		dao.updateroom(vo);
		dao.roomimgdel(room_num);
		for (int i = 0; i < (Integer) irlist.get("imgcnt"); i++) {
			String savefilename = (String) irlist.get("savefilename" + i + 1);
			String orgfilename = (String) irlist.get("orgfilename" + i + 1);
			RoomsImgVo vo1 = new RoomsImgVo(0, room_num, orgfilename, savefilename);
			dao.inroomimg(vo1);
		}
		return 1;
	}
	
	// 사업자
	public List<HashMap<String, Object>> biflist(String id) {
		return dao.biflist(id);
	}

	@Transactional(rollbackFor = Exception.class)
	public int inupbinfo(HashMap<String, Object> map)throws Exception {
		dao.inupbjinfo(map);
		dao.inupbinfo(map);
		return 1;
	}
	@Transactional(rollbackFor = Exception.class)
	public int upba(HashMap<String,Object> map,int hnum) throws Exception{
		dao.delha(hnum);
		for(int i=0;i<map.size();i++){
		int a=dao.selanum((String)map.get("baname"+i));
		HouseintroVo vo=new HouseintroVo(0,hnum,a);
		dao.inha(vo);
		}
		return 1;
	}
	//업체번호
	public int selhnum(String hnum) {
		return dao.selhnum(hnum);
	}
	//사업자 가입 아이디체크
	public String bidCheck(String bid){
		return dao.bidCheck(bid);
		
	}
	
	//사업자 가입체크
		public int joinbusiness(HashMap<String,Object> map){
			return dao.joinbusiness(map);
			
		}
	//업체등록
		
		@Transactional(rollbackFor = Exception.class)
		public int inhouse(HashMap<String, Object> map) throws Exception {			
			HouseVo vo = new HouseVo(0, (Integer)map.get("bnum"), (String)map.get("intro"), (String)map.get("checkintime"),
					(String) map.get("checkouttime"),(String) map.get("company"),(String) map.get("license"),
					(String) map.get("ceo"),(String) map.get("orgaddr"),(String) map.get("workplace"),
					(String) map.get("com_tel"),0,(String) map.get("bid"));
			int b=dao.inh(vo);
			System.out.println(b);
			int house_num=selhnum((String)map.get("bid"));
			for (int i = 0; i < (Integer)map.get("anum"); i++) {
				int amenities_num=dao.selanum((String)map.get("sl"+i));
				HouseintroVo vo1 = new HouseintroVo(0,house_num,amenities_num );
				int c= dao.inha(vo1);
				System.out.println(c);
			}
			HouseImgVo vo3=new HouseImgVo(0, house_num,(String) map.get("house_org_name"),(String) map.get("house_save_name"));
			int d=dao1.houseImgInsert(vo3);
			System.out.println(d);
			return 1;
		}
}
