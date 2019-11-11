package common;

import java.util.HashMap;
import java.util.Map;

public class Common {
	private static Common instance;
	private Common() {}
	
	public static Common getInstance() {
		if (instance == null) {
			instance = new Common();
		}
		return instance;
	}
	
	public Map<String, String>locationMap() {
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("서울특별시", "1168066000");
		map.put("강원도", "4281025000");
		map.put("경기북부", "4125053500");
		map.put("경기남부", "4111759600");
		map.put("경상남도", "4817074000");
		map.put("경상북도", "4717069000");
		map.put("광주광역시", "2920054000");
		map.put("대구광역시", "2720065000");
		map.put("대전광역시", "3023052000");
		map.put("부산광역시", "2644058000");
		map.put("세종특별자치시", "3611055000");
		map.put("울산광역시", "3114056000");
		map.put("인천광역시", "2871025000");
		map.put("전라남도", "4681025000");
		map.put("전라북도", "4579031000");
		map.put("제주특별자치도", "5013025300");
		map.put("충청남도", "4480038000");
		map.put("충청북도", "4376031000");
		
		return map;
	}
	
	// TODO:
	public int weatherLevelRelatedTmp(int tmp) {
		return 1;
		
	}
	
	
	
}
