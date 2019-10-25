package dao;

/* 인기검색어 */

public class HotTag {
	private String ht_keyword; 	/* 검색어 */
	private int ht_count; 		/* 검색수 */
	private int ht_gender_type; /* 검색어의 성별 타입 */
	
	public String getHt_keyword() {
		return ht_keyword;
	}
	public void setHt_keyword(String ht_keyword) {
		this.ht_keyword = ht_keyword;
	}
	public int getHt_count() {
		return ht_count;
	}
	public void setHt_count(int ht_count) {
		this.ht_count = ht_count;
	}
	public int getHt_gender_type() {
		return ht_gender_type;
	}
	public void setHt_gender_type(int ht_gender_type) {
		this.ht_gender_type = ht_gender_type;
	}
}
