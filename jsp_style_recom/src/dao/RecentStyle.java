package dao;

import java.util.Date;

/* 최근본 스타일 */

public class RecentStyle {
	private String mem_id; 	/* 회원ID */
	private int stl_id; 	/* 스타일ID */
	private Date rs_date;	/* 본 날짜 */
	
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getStl_id() {
		return stl_id;
	}
	public void setStl_id(int stl_id) {
		this.stl_id = stl_id;
	}
	public Date getRs_date() {
		return rs_date;
	}
	public void setRs_date(Date rs_date) {
		this.rs_date = rs_date;
	}
}
