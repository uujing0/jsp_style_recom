package dao;

/* 태그목록 */

public class TagCategory {
	private int tc_id; 			/* 태그ID */
	private int tc_type; 		/* 태그타입 */
	private String tc_name; 	/* 태그이름 */
	private int tc_order; 		/* Ref내의 순서 */
	
	public int getTc_id() {
		return tc_id;
	}
	public void setTc_id(int tc_id) {
		this.tc_id = tc_id;
	}
	public int getTc_type() {
		return tc_type;
	}
	public void setTc_type(int tc_type) {
		this.tc_type = tc_type;
	}
	public String getTc_name() {
		return tc_name;
	}
	public void setTc_name(String tc_name) {
		this.tc_name = tc_name;
	}
	public int getTc_order() {
		return tc_order;
	}
	public void setTc_order(int tc_order) {
		this.tc_order = tc_order;
	}
}
