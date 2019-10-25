package dao;

import java.util.Date;

/* 댓글 */

public class BoardComment {
	private String mem_id;  	/* 회원ID */
	private int cm_id; 			/* 댓글ID */
	private int bd_id; 			/* 게시글ID */
	private String cm_contents; /* 내용 */
	private Date cm_date; 		/* 게시날짜 */
	
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getCm_id() {
		return cm_id;
	}
	public void setCm_id(int cm_id) {
		this.cm_id = cm_id;
	}
	public int getBd_id() {
		return bd_id;
	}
	public void setBd_id(int bd_id) {
		this.bd_id = bd_id;
	}
	public String getCm_contents() {
		return cm_contents;
	}
	public void setCm_contents(String cm_contents) {
		this.cm_contents = cm_contents;
	}
	public Date getCm_date() {
		return cm_date;
	}
	public void setCm_date(Date cm_date) {
		this.cm_date = cm_date;
	}
}
