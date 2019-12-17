package test.app.project.vo;

public class BusinessVo {
	private String bid;
	private String bpwd;
	private String bemail;
	public BusinessVo(String bid, String bpwd, String bemail) {
		super();
		this.bid = bid;
		this.bpwd = bpwd;
		this.bemail = bemail;
	}
	public String getBid() {
		return bid;
	}
	public void setBid(String bid) {
		this.bid = bid;
	}
	public String getBpwd() {
		return bpwd;
	}
	public void setBpwd(String bpwd) {
		this.bpwd = bpwd;
	}
	public String getBemail() {
		return bemail;
	}
	public void setBemail(String bemail) {
		this.bemail = bemail;
	}
}
