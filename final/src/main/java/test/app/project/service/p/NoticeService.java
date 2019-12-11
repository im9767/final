package test.app.project.service.p;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import test.app.project.daoimpl.p.NoticeDaoImpl;
import test.app.project.vo.NoticeVo;

@Service
public class NoticeService {

	@Autowired
	private NoticeDaoImpl noticeDaoImpl;
	
	// 공지사항 리스트 리턴
	public List<NoticeVo> noticeList(HashMap<String, Object> map){
		return noticeDaoImpl.noticeList(map);
	}
	
	// 전체 공지사항 갯수 리턴
	public int noticeCount(){
		return noticeDaoImpl.noticeCount();
	}
}
