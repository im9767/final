package test.app.project.vo;

import java.sql.Date;
import java.util.List;

public class ReviewJoinVo {
	
	/** 후기식별키. */
	private int review_num;

	/** 객실정보. */
	private int room_num;

	/** 회원테이블. */
	private String mid;

	/** 리뷰제목. */
	private String review_title;

	/** 리뷰내용. */
	private String review_content;

	/** 후기작성일. */
	private Date review_date;

	/** 친절도. */
	private int kindness;

	/** 청결도. */
	private int clean;

	/** 편의성. */
	private int convenience;
	
	private List<ReiewImgVo> review_img;
	
	public ReviewJoinVo(){
		
	}

	public ReviewJoinVo(int review_num, int room_num, String mid, String review_title, String review_content,
			Date review_date, int kindness, int clean, int convenience, List<ReiewImgVo> review_img) {
		super();
		this.review_num = review_num;
		this.room_num = room_num;
		this.mid = mid;
		this.review_title = review_title;
		this.review_content = review_content;
		this.review_date = review_date;
		this.kindness = kindness;
		this.clean = clean;
		this.convenience = convenience;
		this.review_img = review_img;
	}

	public int getReview_num() {
		return review_num;
	}

	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}

	public int getRoom_num() {
		return room_num;
	}

	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getReview_title() {
		return review_title;
	}

	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public Date getReview_date() {
		return review_date;
	}

	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}

	public int getKindness() {
		return kindness;
	}

	public void setKindness(int kindness) {
		this.kindness = kindness;
	}

	public int getClean() {
		return clean;
	}

	public void setClean(int clean) {
		this.clean = clean;
	}

	public int getConvenience() {
		return convenience;
	}

	public void setConvenience(int convenience) {
		this.convenience = convenience;
	}

	public List<ReiewImgVo> getReview_img() {
		return review_img;
	}

	public void setReview_img(List<ReiewImgVo> review_img) {
		this.review_img = review_img;
	}
	
	
}
