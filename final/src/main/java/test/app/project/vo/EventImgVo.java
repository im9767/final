package test.app.project.vo;

import java.sql.Date;


//이벤트 페이지에 뿌리는 이미지랑 내용 나오는거 담기 위한 이미지
public class EventImgVo {

	private int event_num ;
	private String	etitle ;
	private Date eregdate;
	private int	ehit;
	private Date estartdate;
 	private	Date eenddate;
	private String	savefilename;
	
	public EventImgVo(){}

	public EventImgVo(int event_num, String etitle, Date eregdate, int ehit, Date estartdate, Date eenddate,
			String savefilename) {
		super();
		this.event_num = event_num;
		this.etitle = etitle;
		this.eregdate = eregdate;
		this.ehit = ehit;
		this.estartdate = estartdate;
		this.eenddate = eenddate;
		this.savefilename = savefilename;
	}

	public int getEvent_num() {
		return event_num;
	}

	public void setEvent_num(int event_num) {
		this.event_num = event_num;
	}

	public String getEtitle() {
		return etitle;
	}

	public void setEtitle(String etitle) {
		this.etitle = etitle;
	}

	public Date getEregdate() {
		return eregdate;
	}

	public void setEregdate(Date eregdate) {
		this.eregdate = eregdate;
	}

	public int getEhit() {
		return ehit;
	}

	public void setEhit(int ehit) {
		this.ehit = ehit;
	}

	public Date getEstartdate() {
		return estartdate;
	}

	public void setEstartdate(Date estartdate) {
		this.estartdate = estartdate;
	}

	public Date getEenddate() {
		return eenddate;
	}

	public void setEenddate(Date eenddate) {
		this.eenddate = eenddate;
	}

	public String getSavefilename() {
		return savefilename;
	}

	public void setSavefilename(String savefilename) {
		this.savefilename = savefilename;
	}

	
	
 
}
