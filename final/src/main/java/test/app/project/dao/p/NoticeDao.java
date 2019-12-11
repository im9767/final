package test.app.project.dao.p;

import java.util.HashMap;
import java.util.List;

import test.app.project.vo.NoticeVo;

public interface NoticeDao {
	
	// 공지사항 리스트 얻어오기
	public List<NoticeVo> noticeList(HashMap<String, Object> map);
	
	// 전체 공지사항 갯수 리턴
	public int noticeCount();
}
