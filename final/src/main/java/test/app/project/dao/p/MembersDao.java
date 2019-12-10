package test.app.project.dao.p;


import java.util.HashMap;
import java.util.List;

import test.app.project.vo.CouponVo;
import test.app.project.vo.MembersVo;
import test.app.project.vo.QnaboardVo;

public interface MembersDao {
	
	public boolean isMember(MembersVo vo);
	
	public int join(MembersVo vo);
	
	public MembersVo idCheck(String mid);
	
	public MembersVo findPwd(HashMap<String, String> map);
	
	public int changePwd(MembersVo vo);
	
	public HashMap<String, Object> myinfo(String mid);
	
	public int cntCoupon(String mid);
	
	public int myinfoupdate(MembersVo vo);
	
	public int qnainsert(QnaboardVo vo);
	
	public java.util.List<HashMap<String, Object>> qnalist(HashMap<String, Object> parameter);
	
	public HashMap<String, Object> qnaDetail(int qna_num);
	
	public List<CouponVo> couponList(String mid);
	
	public int qnaListCount(String mid);
	
}
