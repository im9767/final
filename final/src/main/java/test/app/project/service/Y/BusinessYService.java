package test.app.project.service.Y;

import java.util.HashMap;
import java.util.List;

import org.apache.taglibs.standard.lang.jstl.test.beans.PublicInterface2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import test.app.project.dao.Y.BusinessYDao;
import test.app.project.vo.AmenitiesVo;
import test.app.project.vo.RoomsImgVo;
import test.app.project.vo.RoomsVo;

@Service
public class BusinessYService {

	@Autowired
	private BusinessYDao dao;

	public BusinessYService(BusinessYDao dao) {
		this.dao = dao;
	}

	// ?��?��?��?��
	public int writeamenities(AmenitiesVo vo) {
		return dao.inamenities(vo);
	}

	public List<HashMap<String, Object>> selamenities() {
		return dao.selamenities();
	}

	// 객실?���?
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

	// ?��?��?�� 개인?��보조?��
	public List<HashMap<String, Object>> biflist(String id) {
		return dao.biflist(id);
	}

	@Transactional(rollbackFor = Exception.class)
	public int inupbinfo(HashMap<String, Object> map) {
		dao.inupbjinfo(map);
		dao.inupbinfo(map);
		return 1;
	}

}