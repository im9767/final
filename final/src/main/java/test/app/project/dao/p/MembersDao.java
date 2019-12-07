package test.app.project.dao.p;


import java.util.HashMap;

import test.app.project.vo.MembersVo;
import test.app.project.vo.QnaboardVo;

public interface MembersDao {
	
	public MembersVo isMember(MembersVo vo);
	
	public int join(MembersVo vo);
	
	public MembersVo idCheck(String mid);
	
	public MembersVo findPwd(HashMap<String, String> map);
	
	public int changePwd(MembersVo vo);
	
	public HashMap<String, Object> myinfo(String mid);
	
	public int cntCoupon(String mid);
	
	public int myinfoupdate(MembersVo vo);
	
	public int qnainsert(QnaboardVo vo);
	
	public java.util.List<HashMap<String, Object>> qnalist(String mid);
	
	public HashMap<String, Object> qnaDetail(int qna_num);
	
}
