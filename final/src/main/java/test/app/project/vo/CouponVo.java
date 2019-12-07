package test.app.project.vo;


/**
 * 쿠폰 모델 클래스.
 * 
 * @author generated by ERMaster
 * @version $Id$
 */
public class CouponVo {

	/** 쿠폰번호. */
	private int coupon_num;

	/** 회원테이블. */
	private String mid;

	/** 쿠폰명. */
	private String coupon_name;

	/** 쿠폰유형. */
	private String coupon_type;

	/** 쿠폰사용여부. */
	private String coupon_status;

	/** 발행일. */
	private java.sql.Date making_date;


	/**
	 * 생성자.
	 */
	public CouponVo() {
	}


	public CouponVo(int coupon_num, String mid, String coupon_name, String coupon_type, String coupon_status,
			java.sql.Date making_date) {
		super();
		this.coupon_num = coupon_num;
		this.mid = mid;
		this.coupon_name = coupon_name;
		this.coupon_type = coupon_type;
		this.coupon_status = coupon_status;
		this.making_date = making_date;
	}


	public int getCoupon_num() {
		return coupon_num;
	}


	public void setCoupon_num(int coupon_num) {
		this.coupon_num = coupon_num;
	}


	public String getMid() {
		return mid;
	}


	public void setMid(String mid) {
		this.mid = mid;
	}


	public String getCoupon_name() {
		return coupon_name;
	}


	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}


	public String getCoupon_type() {
		return coupon_type;
	}


	public void setCoupon_type(String coupon_type) {
		this.coupon_type = coupon_type;
	}


	public String getCoupon_status() {
		return coupon_status;
	}


	public void setCoupon_status(String coupon_status) {
		this.coupon_status = coupon_status;
	}


	public java.sql.Date getMaking_date() {
		return making_date;
	}


	public void setMaking_date(java.sql.Date making_date) {
		this.making_date = making_date;
	}


}