package dao;

import java.util.Date;

/* 野껊슣�뻻占쎈솇 */

public class Board {
	private int bd_id; /* 野껊슣�뻻疫뀐옙ID */
	private String bd_date; /* 野껊슣�뻻占쎄텊筌욑옙 */
	private String bd_title; /* 占쎌젫筌륅옙 */
	private String bd_file_url; /* 占쎈솁占쎌뵬雅뚯눘�꺖 */
	private String bd_content; /* 占쎄땀占쎌뒠 */
	private int bd_readcount; /* 鈺곌퀬�돳占쎈땾 */
	private String bd_notice; /* �⑤벊占쏙옙肉ч겫占� */
	private int bbsNO;
	private String mem_id;
	private int commentCount;
	private int staravg;
	private int star1;


	public int getStar1() {
		return star1;
	}

	public void setStar1(int star1) {
		this.star1 = star1;
	}

	public int getStaravg() {
		return staravg;
	}

	public void setStaravg(int staravg) {
		this.staravg = staravg;
	}

	public String getMem_id() {
		return mem_id;
	}

	public int getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}


	public String getBd_date() {
		return bd_date;
	}

	public void setBd_date(String bd_date) {
		this.bd_date = bd_date;
	}

	public int getBbsNO() {
		return bbsNO;
	}

	public void setBbsNO(int bbsNO) {
		this.bbsNO = bbsNO;
	}


	public int getBd_id() {
		return bd_id;
	}

	public void setBd_id(int bd_id) {
		this.bd_id = bd_id;
	}

	public String getBd_title() {
		return bd_title;
	}

	public void setBd_title(String bd_title) {
		this.bd_title = bd_title;
	}

	public String getBd_file_url() {
		return bd_file_url;
	}

	public void setBd_file_url(String bd_file_url) {
		this.bd_file_url = bd_file_url;
	}

	public String getBd_content() {
		return bd_content;
	}

	public void setBd_content(String bd_content) {
		this.bd_content = bd_content;
	}

	public int getBd_readcount() {
		return bd_readcount;
	}

	public void setBd_readcount(int bd_readcount) {
		this.bd_readcount = bd_readcount;
	}

	
	public String getBd_notice() {
		return bd_notice;
	}

	public void setBd_notice(String bd_notice) {
		this.bd_notice = bd_notice;
	}



}
