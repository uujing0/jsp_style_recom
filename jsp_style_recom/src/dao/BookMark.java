package dao;

import java.util.Date;

/* 즐겨찾기 */

public class BookMark {
	private String mem_id; 	/* 회원ID */
	private int stl_id; 	/* 스타일ID */
	private Date bm_date;
	
	public Date getBm_date() {
		return bm_date;
	}
	public void setBm_date(Date bm_date) {
		this.bm_date = bm_date;
	}
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
}
