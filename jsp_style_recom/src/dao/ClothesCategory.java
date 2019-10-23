package dao;

/* 옷종류 */

public class ClothesCategory {
	private int cc_id; 				/* 옷종류ID */
	private int cc_type; 			/* 옷의 타입 */
	private String cc_desc;  		/* 설명 */
	private String cc_name; 		/* 이름 */
	private String cc_pic_url;  	/* 사진주소 */
	
	public int getCc_id() {
		return cc_id;
	}
	public void setCc_id(int cc_id) {
		this.cc_id = cc_id;
	}
	public int getCc_type() {
		return cc_type;
	}
	public void setCc_type(int cc_type) {
		this.cc_type = cc_type;
	}
	public String getCc_desc() {
		return cc_desc;
	}
	public void setCc_desc(String cc_desc) {
		this.cc_desc = cc_desc;
	}
	public String getCc_name() {
		return cc_name;
	}
	public void setCc_name(String cc_name) {
		this.cc_name = cc_name;
	}
	public String getCc_pic_url() {
		return cc_pic_url;
	}
	public void setCc_pic_url(String cc_pic_url) {
		this.cc_pic_url = cc_pic_url;
	}
}
