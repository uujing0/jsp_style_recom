package dao;



public class TH_TownDao {
	private static TH_TownDao instance;
	private TH_TownDao() {}
	public static TH_TownDao getInstance() {
		if (instance == null) {	instance = new TH_TownDao();		}
		return instance;
	}
	public String citycode(String addr) {
		String city = "";

		if (addr.equals( "4281025000"))
			city = "강릉";
		else if (addr.equals( "4125053500"))
			city = "파주";
		else if (addr.equals( "4111759600"))
			city = "수원";
		else if (addr.equals( "4817074000"))
			city = "진주";
		else if (addr.equals( "4717069000"))
			city = "안동";
		else if (addr.equals( "2920054000"))
			city = "광주";
		else if (addr.equals( "2720065000"))
			city = "대구";
		else if (addr.equals( "3023052000"))
			city = "대전";
		else if (addr.equals("2644058000"))
			city = "부산";
		else if (addr.equals( "1168066000"))
			city = "서울";
		else if (addr.equals( "3611055000"))
			city = "세종";
		else if (addr.equals( "3114056000"))
			city = "울산";
		else if (addr.equals( "2871025000"))
			city = "인천";
		else if (addr.equals( "4681025000"))
			city = "목포";
		else if (addr.equals( "4579031000"))
			city = "군산";
		else if (addr.equals( "5013025300"))
			city = "제주";
		else if (addr.equals( "4480038000"))
			city = "홍성";
		else if (addr.equals( "4311133000"))
			city = "청주";
		return city;
	}
	public String location(String addr) {
		String city = "";
		if (addr.equals( "4281025000"))
			city = "강원도";
		else if (addr.equals( "4125053500"))
			city = "경기북부";
		else if (addr.equals( "4111759600"))
			city = "경기남부";
		else if (addr.equals( "4817074000"))
			city = "경상남도";
		else if (addr.equals( "4717069000"))
			city = "경상북도";
		else if (addr.equals( "2920054000"))
			city = "광주광역시";
		else if (addr.equals( "2720065000"))
			city = "대구광역시";
		else if (addr.equals( "3023052000"))
			city = "대전광역시";
		else if (addr.equals("2644058000"))
			city = "부산광역시";
		else if (addr.equals( "1168066000"))
			city = "서울특별시";
		else if (addr.equals( "3611055000"))
			city = "세종특별자치시";
		else if (addr.equals( "3114056000"))
			city = "울산광역시";
		else if (addr.equals( "2871025000"))
			city = "인천광역시";
		else if (addr.equals( "4681025000"))
			city = "전라남도";
		else if (addr.equals( "4579031000"))
			city = "전라북도";
		else if (addr.equals( "5013025300"))
			city = "제주특별자치도";
		else if (addr.equals( "4480038000"))
			city = "충청남도";
		else if (addr.equals( "4311133000"))
			city = "충청북도";
		return city;
	}
}
