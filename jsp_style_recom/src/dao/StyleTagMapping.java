package dao;

/* 스타일과 태그 매핑 */

public class StyleTagMapping {
	private int stl_id; /* 스타일ID */
	private int tc_id;  /* 태그ID */
	
	public int getStl_id() {
		return stl_id;
	}
	public void setStl_id(int stl_id) {
		this.stl_id = stl_id;
	}
	public int getTc_id() {
		return tc_id;
	}
	public void setTc_id(int tc_id) {
		this.tc_id = tc_id;
	}
}
