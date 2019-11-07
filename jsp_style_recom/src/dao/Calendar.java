package dao;

import java.util.Date;

/* 일정 */

public class Calendar {
	private int cal_id; 			/* 일정ID */
	private String mem_id; 			/* 회원ID */
	private int tc_id; 				/* 태그ID */
	private Date cal_date; 			/* 날짜 */
	private String cal_contents;	/* 내용 */
	private String cal_title;
	
	public String getCal_title() {
		return cal_title;
	}
	public void setCal_title(String cal_title) {
		this.cal_title = cal_title;
	}
	public int getCal_id() {
		return cal_id;
	}
	public void setCal_id(int cal_id) {
		this.cal_id = cal_id;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getTc_id() {
		return tc_id;
	}
	public void setTc_id(int tc_id) {
		this.tc_id = tc_id;
	}
	public Date getCal_date() {
		return cal_date;
	}
	public void setCal_date(Date cal_date) {
		this.cal_date = cal_date;
	}
	public String getCal_contents() {
		return cal_contents;
	}
	public void setCal_contents(String cal_contents) {
		this.cal_contents = cal_contents;
	}
}
