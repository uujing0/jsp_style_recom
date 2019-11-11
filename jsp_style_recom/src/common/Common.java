package common;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import java.text.SimpleDateFormat;
import org.w3c.dom.*;

import dao.TH_TownDao;

import javax.xml.parsers.*;
import java.util.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Common {
	private static Common instance;

	private Common() {
	}

	public static Common getInstance() {
		if (instance == null) {
			instance = new Common();
		}
		return instance;
	}

	public Map<String, String> locationMap() {
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

	public int weatherLevelByTmp(double tmp) {
		int level = 0;
		
		if (tmp >= 27) {
			level = 1;
		} else if (tmp <= 23 && tmp > 27) {
			level = 2;
		} else if (tmp <= 20 && tmp > 23) {
			level = 3;
		} else if (tmp <= 17 && tmp > 20) {
			level = 4;
		} else if (tmp <= 12 && tmp > 17) {
			level = 5;
		} else if (tmp <= 8 && tmp > 12) {
			level = 6;
		} else if (tmp <= 3 && tmp > 8) {
			level = 7;	
		} else if (tmp <= -2 && tmp > 3) {
			level = 8;
		} else {
			level = 9;
		}
		
		return level;
	}
	
	public int tagIdByWeatherLevel(int level) {
		int tagId = 0;
		
		switch (level) {
		case 1:
			tagId = 15;
			break;
		case 2:
			tagId = 16;
			break;
		case 3:
			tagId = 17;
			break;
		case 4:
			tagId = 18;
			break;
		case 5:
			tagId = 19;
			break;
		case 6:
			tagId = 20;
			break;
		case 7:
			tagId = 21;
			break;
		case 8:
			tagId = 22;
			break;
		case 9:
			tagId = 23;
			break;
		default:
			break;
		}
		
		return tagId;
	}

	public Map<String,String > getWeatherTmp(String addr) {
		String urlStr = "http://www.kma.go.kr/wid/queryDFSRSS.jsp?zone=" + addr;
		ArrayList<HashMap<String, String>> pubList = new ArrayList<HashMap<String, String>>();
		String[] fieldNames = { "temp", "hour", "day", "r12" };
		Map<String, String> map = new HashMap<String, String>();
		int result = 0;
		double Temp1 = -100.0;
		double rs = 0.0;
		try {
			// XML파싱 준비
			DocumentBuilderFactory f = DocumentBuilderFactory.newInstance();
			DocumentBuilder b = f.newDocumentBuilder();

			// 위에서 구성한 URL을 통해 XMl 파싱 시작
			Document doc = b.parse(urlStr);
			// System.out.println("doc->" + doc);
			doc.getDocumentElement().normalize();

			// 서버에서 응답한 XML데이터를 data(발행문서 1개 해당)태그로 각각 나눔(파라미터로 요청한 size항목의 수만큼)
			NodeList items = doc.getElementsByTagName("data");

			// for 루프시작
			for (int i = 0; i < items.getLength(); i++) {
				// i번째 publication 태그를 가져와서
				Node n = items.item(i);

				Element e = (Element) n;
				HashMap<String, String> pub = new HashMap<String, String>();

				// for 루프 시작
				for (String name : fieldNames) {
					// "hour", "day", "temp", "tmx", "tmn", "sky", "pty", "wfKor"....에 해당하는 값을 XML
					// 노드에서 가져옴
					NodeList titleList = e.getElementsByTagName(name);
					Element titleElem = (Element) titleList.item(0);

					Node titleNode = titleElem.getChildNodes().item(0);
					// 가져온 XML 값을 맵에 엘리먼트 이름 - 값 쌍으로 넣음
					pub.put(name, titleNode.getNodeValue());
				}
				// 데이터가 전부 들어간 맵을 리스트에 넣고 화면에 뿌릴 준비.
				pubList.add(pub);
				// System.out.println(pub);

			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		for (int i = 0; i < pubList.size(); i++) {
			HashMap<String, String> pub = pubList.get(i);

			String tmpWfDay = pub.get("day");
			String tmpWfHour = pub.get("hour");
			String rsWfRS = pub.get("r12");
			// System.out.println("rsWfRS->" + rsWfRS);
			if (rsWfRS == null)
				break;
			Double Rs = Double.parseDouble(rsWfRS);// 받아온 강수량
			String tmpWfTemp = pub.get("temp");
			tmpWfTemp = tmpWfTemp.replace('"', ' ');
			Double Temp = Double.parseDouble(tmpWfTemp);// 받아온 온도
			if (tmpWfDay.equals("0")) {
				switch (tmpWfHour) {
				case ("3"): {
					if (result == 1)
						break;
					rs = Rs;
					Temp1 = Temp;
					result = 1;
					// System.out.println(tmpWfDay);
				}
				case ("6"): {
					if (result == 1)
						break;

					rs = Rs;
					if (Temp1 == -100.0)
						Temp1 = Temp;
					else
						break;
					result = 1;
					// System.out.println(tmpWfDay);

				}
				case ("9"): {
					if (result == 1)
						break;

					rs = Rs;
					if (Temp1 == -100.0)
						Temp1 = Temp;
					else
						break;
					result = 1;
					// System.out.println(tmpWfDay);

				}
				case ("12"): {
					if (result == 1)
						break;

					rs = Rs;
					if (Temp1 == -100.0)
						Temp1 = Temp;
					else
						break;
					result = 1;
					// System.out.println(tmpWfDay);

				}
				case ("15"): {
					if (result == 1)
						break;

					rs = Rs;
					if (Temp1 == -100.0)
						Temp1 = Temp;
					else
						break;
					result = 1;
					// System.out.println(tmpWfDay);

				}
				case ("18"): {
					if (result == 1)
						break;

					rs = Rs;
					if (Temp1 == -100.0)
						Temp1 = Temp;
					else
						break;
					result = 1;
					// System.out.println(tmpWfDay);

				}
				case ("21"): {
					if (result == 1)
						break;

					rs = Rs;
					if (Temp1 == -100.0)
						Temp1 = Temp;
					else
						break;
					result = 1;
					// System.out.println(tmpWfDay);

				}
				}
			}
		}
		String Temp = Double.toString(Temp1);
		String Rs = Double.toString(rs);
		map.put("Temp", Temp);
		map.put("Rs", Rs);
		return map;
	}
}
