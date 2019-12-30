package test.app.project.dao.p;


import java.util.HashMap;
import java.util.List;

import test.app.project.vo.CouponVo;
import test.app.project.vo.MembersVo;
import test.app.project.vo.QnaboardVo;
import test.app.project.vo.ReviewVo;

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
	
	public List<HashMap<String, Object>> qnaListAll();
	
	public List<HashMap<String, Object>> bookingList(HashMap<String, Object> map);
	
	public int bookingCount(String mid);
	
	public List<HashMap<String, Object>> paymentList(HashMap<String, Object> map);
	
	public int paymentCount(String mid);
	
	public int reviewInsert(ReviewVo vo,HashMap<String, Object> map);
	
	public int reviewImgInsert(HashMap<String, Object> map);
	
	public List<HashMap<String, Object>> reviewList(HashMap<String, Object> map);
	
	public int reviewCount(String mid);
	
	public boolean naverLogin(MembersVo vo);
	
	public int naverLoginInsert(MembersVo vo);
	
	public HashMap<String, Object> reviewParameter(HashMap<String, Object> parameter);
	
}
