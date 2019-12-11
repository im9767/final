package test.app.project.controller.l;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import test.app.project.service.L.MembersService1;
import test.app.project.vo.CouponVo;
import test.app.project.vo.MembersVo;

@Controller
public class CouponController1 {
	@Autowired MembersService1 service;
	
	@RequestMapping(value="/admin/coupon",produces="application/xml;charset=utf-8")
	@ResponseBody
	public String couponInfo(String gnum,String coupon_type,String coupon_name){
		HashMap<String, Object> map=new HashMap<String, Object>();
		System.out.println("gnum: " + gnum);
		map.put("gnum", gnum);
		//등급에 해당하는 인원수 구함
		int membersCnt=service.countMembers(map);
		System.out.println("membersCnt: " + membersCnt);
		List<MembersVo> mlist=service.membersId(map);
		for(MembersVo vo:mlist){
			System.out.println(vo.getMid());
			CouponVo cvo=new CouponVo(0, vo.getMid(), coupon_name, coupon_type, null, null);
			service.couponInsert(cvo);
		}
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version='1.0' encoding='utf-8'?>");
		sb.append("<result>");
		sb.append("<user>");
		for(MembersVo vo:mlist){
			sb.append("'"+vo.getMid()+"'  ");
		}
		sb.append("</user>");
		sb.append("<msg>님에게 쿠폰 발송 완료!!</msg>");
		sb.append("</result>");
		return sb.toString();
	}
}





