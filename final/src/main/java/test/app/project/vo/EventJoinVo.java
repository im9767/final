package test.app.project.vo;

import java.sql.Date;
import java.util.List;

public class EventJoinVo {

	private int event_num;

	/** 이벤트제목. */
	private String etitle;

	/** 이벤트등록일. */
	private java.sql.Date eregdate;

	/** 이벤트조회수. */
	private int ehit;

	/** 이벤트 시작일. */
	private java.sql.Date estartdate;

	/** 이벤트종료일. */
	private java.sql.Date eenddate;
	
	List<EventimagesVo> eventImg;

	public EventJoinVo(){
		
	}

	public EventJoinVo(int event_num, String etitle, Date eregdate, int ehit, Date estartdate, Date eenddate,
			List<EventimagesVo> eventImg) {
		super();
		this.event_num = event_num;
		this.etitle = etitle;
		this.eregdate = eregdate;
		this.ehit = ehit;
		this.estartdate = estartdate;
		this.eenddate = eenddate;
		this.eventImg = eventImg;
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

	public java.sql.Date getEregdate() {
		return eregdate;
	}

	public void setEregdate(java.sql.Date eregdate) {
		this.eregdate = eregdate;
	}

	public int getEhit() {
		return ehit;
	}

	public void setEhit(int ehit) {
		this.ehit = ehit;
	}

	public java.sql.Date getEstartdate() {
		return estartdate;
	}

	public void setEstartdate(java.sql.Date estartdate) {
		this.estartdate = estartdate;
	}

	public java.sql.Date getEenddate() {
		return eenddate;
	}

	public void setEenddate(java.sql.Date eenddate) {
		this.eenddate = eenddate;
	}

	public List<EventimagesVo> getEventImg() {
		return eventImg;
	}

	public void setEventImg(List<EventimagesVo> eventImg) {
		this.eventImg = eventImg;
	}
	
	
}
