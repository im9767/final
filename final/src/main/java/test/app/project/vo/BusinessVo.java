package test.app.project.vo;



public class BusinessVo {
	/*사업자 아이디*/
	private String bId;
	/*사업자 비밀번호*/
	private String bPwd;
	/*사업자 이메일*/
	private String bEmail;
	
	
	public BusinessVo(){}


	public BusinessVo(String bId, String bPwd, String bEmail) {
		super();
		this.bId = bId;
		this.bPwd = bPwd;
		this.bEmail = bEmail;
	}


	public String getbId() {
		return bId;
	}


	public void setbId(String bId) {
		this.bId = bId;
	}


	public String getbPwd() {
		return bPwd;
	}


	public void setbPwd(String bPwd) {
		this.bPwd = bPwd;
	}


	public String getbEmail() {
		return bEmail;
	}


	public void setbEmail(String bEmail) {
		this.bEmail = bEmail;
	}


	
}
