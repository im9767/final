package test.app.project.vo;

public class CoupontypeVo {
	private int coupon_typenum;
	private String type_name;
	public CoupontypeVo(int coupon_typenum, String type_name) {
		super();
		this.coupon_typenum = coupon_typenum;
		this.type_name = type_name;
	}
	public int getCoupon_typenum() {
		return coupon_typenum;
	}
	public void setCoupon_typenum(int coupon_typenum) {
		this.coupon_typenum = coupon_typenum;
	}
	public String getType_name() {
		return type_name;
	}
	public void setType_name(String type_name) {
		this.type_name = type_name;
	}
	
}
