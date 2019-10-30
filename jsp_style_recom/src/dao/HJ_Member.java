package dao;

import java.util.Date;

/* 회원 */ 

public class HJ_Member {
	private String mem_id; 			/* 회원ID */
	private String mem_pw; 			/* 비밀번호 */
	private String mem_name; 		/* 이름 */
	private String mem_phone; 		/* 전화번호 */
	private String mem_email; 		/* 이메일 */
	private int  mem_body_type; 	/* 체형 */
	private String mem_addr; 		/* 주소 */
	private int mem_gender; 		/* 성별 */
	private Date mem_join_date; 	/* 가입날짜 */
	private int mem_status; 		/* 회원상태 */
	private String mem_fav_loc; 	/* 관심지역 */
	
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pw() {
		return mem_pw;
	}
	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_phone() {
		return mem_phone;
	}
	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public int getMem_body_type() {
		return mem_body_type;
	}
	public void setMem_body_type(int mem_body_type) {
		this.mem_body_type = mem_body_type;
	}
	public String getMem_addr() {
		return mem_addr;
	}
	public void setMem_addr(String mem_addr) {
		this.mem_addr = mem_addr;
	}
	public int getMem_gender() {
		return mem_gender;
	}
	public void setMem_gender(int mem_gender) {
		this.mem_gender = mem_gender;
	}
	public Date getMem_join_date() {
		return mem_join_date;
	}
	public void setMem_join_date(Date mem_join_date) {
		this.mem_join_date = mem_join_date;
	}
	public int getMem_status() {
		return mem_status;
	}
	public void setMem_status(int mem_status) {
		this.mem_status = mem_status;
	}
	public String getMem_fav_loc() {
		return mem_fav_loc;
	}
	public void setMem_fav_loc(String mem_fav_loc) {
		this.mem_fav_loc = mem_fav_loc;
	}
}
