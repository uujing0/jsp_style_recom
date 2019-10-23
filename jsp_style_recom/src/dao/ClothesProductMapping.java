package dao;

/* 옷과 상품매핑 */

public class ClothesProductMapping {
	private int cc_id;  	/* 옷종류ID */
	private int prd_id; 	/* 상품ID */
	
	public int getCc_id() {
		return cc_id;
	}
	public void setCc_id(int cc_id) {
		this.cc_id = cc_id;
	}
	public int getPrd_id() {
		return prd_id;
	}
	public void setPrd_id(int prd_id) {
		this.prd_id = prd_id;
	}
}
