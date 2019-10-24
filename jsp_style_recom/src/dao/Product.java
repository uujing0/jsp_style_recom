package dao;

/* 상품 */

public class Product {
	private int prd_id;  			/* 상품ID */
	private int prd_type; 			/* 상품 타입 */
	private String prd_name; 		/* 상품명 */
	private String prd_url; 		/* 상품URL */
	private String prd_point;  		/* 상품 이미지 좌표 */
	private int prd_gender; 		/* 상품 성별 */
	private String prd_thumbnail;  	/* 대표사진 */
	
	public int getPrd_id() {
		return prd_id;
	}
	public void setPrd_id(int prd_id) {
		this.prd_id = prd_id;
	}
	public int getPrd_type() {
		return prd_type;
	}
	public void setPrd_type(int prd_type) {
		this.prd_type = prd_type;
	}
	public String getPrd_name() {
		return prd_name;
	}
	public void setPrd_name(String prd_name) {
		this.prd_name = prd_name;
	}
	public String getPrd_url() {
		return prd_url;
	}
	public void setPrd_url(String prd_url) {
		this.prd_url = prd_url;
	}
	public String getPrd_point() {
		return prd_point;
	}
	public void setPrd_point(String prd_point) {
		this.prd_point = prd_point;
	}
	public int getPrd_gender() {
		return prd_gender;
	}
	public void setPrd_gender(int prd_gender) {
		this.prd_gender = prd_gender;
	}
	public String getPrd_thumbnail() {
		return prd_thumbnail;
	}
	public void setPrd_thumbnail(String prd_thumbnail) {
		this.prd_thumbnail = prd_thumbnail;
	}
}
