package dao;

/* 스타일정보 */

public class StyleInfo {
	private int stl_id;  			/* 스타일ID */
	private int cc_id_outer;  		/* 겉옷ID */
	private int cc_id_top;  		/* 상의ID */
	private int cc_id_bottom;  		/* 하의ID */
	private int cc_id_acc;  		/* 장식품ID */
	private String  stl_pic_url;  	/* 사진주소 */
	private String stl_desc;  		/* 설명 */
	private int stl_gender;  		/* 스타일 성별 */
	
	public int getStl_id() {
		return stl_id;
	}
	public void setStl_id(int stl_id) {
		this.stl_id = stl_id;
	}
	public int getCc_id_top() {
		return cc_id_top;
	}
	public void setCc_id_top(int cc_id_top) {
		this.cc_id_top = cc_id_top;
	}
	public int getCc_id_bottom() {
		return cc_id_bottom;
	}
	public void setCc_id_bottom(int cc_id_bottom) {
		this.cc_id_bottom = cc_id_bottom;
	}
	public int getCc_id_acc() {
		return cc_id_acc;
	}
	public void setCc_id_acc(int cc_id_acc) {
		this.cc_id_acc = cc_id_acc;
	}
	public int getCc_id_outer() {
		return cc_id_outer;
	}
	public void setCc_id_outer(int cc_id_outer) {
		this.cc_id_outer = cc_id_outer;
	}
	public String getStl_pic_url() {
		return stl_pic_url;
	}
	public void setStl_pic_url(String stl_pic_url) {
		this.stl_pic_url = stl_pic_url;
	}
	public String getStl_desc() {
		return stl_desc;
	}
	public void setStl_desc(String stl_desc) {
		this.stl_desc = stl_desc;
	}
	public int getStl_gender() {
		return stl_gender;
	}
	public void setStl_gender(int stl_gender) {
		this.stl_gender = stl_gender;
	}
}
