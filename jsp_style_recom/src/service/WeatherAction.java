package service;

import java.text.SimpleDateFormat;
import org.w3c.dom.*;

import dao.BookMark;
import dao.JW_BookMarkDao;
import dao.JW_StyleInfoDao;
import dao.TH_TownDao;

import javax.xml.parsers.*;
import java.util.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class WeatherAction implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("start");
		try {
			String addr = request.getParameter("sido");
			System.out.println("addr->" + addr);
			TH_TownDao TD = TH_TownDao.getInstance();
			String city = TD.citycode(addr);
			System.out.println("city->" + city);
			String urlStr = "http://www.kma.go.kr/wid/queryDFSRSS.jsp?zone=" + addr;
			String urlStrW = "http://www.kma.go.kr/weather/forecast/mid-term-rss3.jsp?stnId=108";
			// 서버에서리턴될 XML데이터의 엘리먼트 이름 배열
			String[] fieldNames = { "temp", "wfKor", "wfEn", "pop", "hour", "day", "tmx", "tmn", "r12" };
			String[] fieldNames1 = { "tmEf", "wf", "tmx", "tmn", "rnSt" };
			String[] citys = { "서울", "인천", "수원", "파주", "이천", "평택", "춘천", "원주", "강릉", "대전", "세종", "홍성", "청주", "충주", "영동",
					"광주", "목포", "여수", "순천", "광양", "나주", "전주", "군산", "정읍", "남원", "고창", "무주", "부산", "울산", "창원", "진주",
					"거창", "통영", "대구", "안동", "포항", "경주", "운진", "울릉도", "제주", "서귀포" };
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

			Calendar c1 = Calendar.getInstance();
			Calendar c2 = Calendar.getInstance();
			Calendar c3 = Calendar.getInstance();
			Calendar c4 = Calendar.getInstance();
			Calendar c5 = Calendar.getInstance();
			Calendar c6 = Calendar.getInstance();
			Calendar c7 = Calendar.getInstance();

			String day1 = df.format(c1.getTime());
			c2.add(Calendar.DATE, 1);
			String day2 = df.format(c2.getTime());
			c3.add(Calendar.DATE, 2);
			String day3 = df.format(c3.getTime());
			c4.add(Calendar.DATE, 3);
			String day4 = df.format(c4.getTime());
			c5.add(Calendar.DATE, 4);
			String day5 = df.format(c5.getTime());
			c6.add(Calendar.DATE, 5);
			String day6 = df.format(c6.getTime());
			c7.add(Calendar.DATE, 6);
			String day7 = df.format(c7.getTime());
			System.out.println("day들" + day3 + day4 + day5 + day6 + day7);
			// 각 게시물하나에 해당하는 XML 노드를 담을 리스트
			ArrayList<HashMap<String, String>> pubList = new ArrayList<HashMap<String, String>>();
			ArrayList<HashMap<String, String>> pubList1 = new ArrayList<HashMap<String, String>>();

			String[] wfKor = new String[7];
			String[] imgWfKor = new String[7];
			double Temp1 = -100.0;
			double[] rs = new double[7];

			double[] Tmx = new double[6] ;

			double[] Tmn = new double[6];
			int result = 0;
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
			try {
				// XML파싱 준비
				DocumentBuilderFactory f = DocumentBuilderFactory.newInstance();
				DocumentBuilder b = f.newDocumentBuilder();

				// 위에서 구성한 URL을 통해 XMl 파싱 시작
				Document doc = b.parse(urlStrW);
				// System.out.println("doc->" + doc);
				doc.getDocumentElement().normalize();

				// 서버에서 응답한 XML데이터를 data(발행문서 1개 해당)태그로 각각 나눔(파라미터로 요청한 size항목의 수만큼)
				NodeList items = doc.getElementsByTagName("data");
				// System.out.println("items->" + items);
				// for 루프시작
				for (int i = 0; i < items.getLength(); i++) {
					// i번째 publication 태그를 가져와서

					Node n1 = items.item(i);

					Element e1 = (Element) n1;
					HashMap<String, String> pub1 = new HashMap<String, String>();

					// for 루프 시작
					for (String name : fieldNames1) {
						// "hour", "day", "temp", "tmx", "tmn", "sky", "pty", "wfKor"....에 해당하는 값을 XML
						// 노드에서 가져옴
						NodeList titleList = e1.getElementsByTagName(name);
						Element titleElem1 = (Element) titleList.item(0);
						Node titleNode1 = titleElem1.getChildNodes().item(0);

						// 가져온 XML 값을 맵에 엘리먼트 이름 - 값 쌍으로 넣음
						pub1.put(name, titleNode1.getNodeValue());
						int j = i / 13;
						pub1.put("city", citys[j]);

					}
					// 데이터가 전부 들어간 맵을 리스트에 넣고 화면에 뿌릴 준비.
					pubList1.add(pub1);
					// System.out.println("pub1->" + pub1);
				}

			} catch (Exception e) {
				System.out.println("error" + e.getMessage());
			}

			for (int i = 0; i < pubList.size(); i++) {
				HashMap<String, String> pub = pubList.get(i);

				String tmpWfKor = pub.get("wfKor");
				if (tmpWfKor == null)
					tmpWfKor = "";

				String tmpImgWfKor = "images/ico01.png";
				String tmpWfDay = pub.get("day");
				String tmpWfHour = pub.get("hour");

				if (tmpWfKor.equals("구름 조금"))
					tmpImgWfKor = "images/ico02.png";
				else if (tmpWfKor.equals("구름 많음"))
					tmpImgWfKor = "images/ico03.png";
				else if (tmpWfKor.equals("흐림"))
					tmpImgWfKor = "images/ico04.png";
				else if (tmpWfKor.equals("비"))
					tmpImgWfKor = "images/ico05.png";
				else if (tmpWfKor.equals("눈/비"))
					tmpImgWfKor = "images/ico06.png";
				else if (tmpWfKor.equals("눈"))
					tmpImgWfKor = "images/ico07.png";

				String pop = pub.get("pop");
				// System.out.println("rsWfRS->" + rsWfRS);
				if (pop == null)
					break;
				Double Rs = Double.parseDouble(pop);// 받아온 강수량

				String tmpWfTemp = pub.get("temp");
				tmpWfTemp = tmpWfTemp.replace('"', ' ');
				Double Temp = Double.parseDouble(tmpWfTemp);// 받아온 온도
				// 최고온도
				String tmx = pub.get("tmx");
				// System.out.println(tmx);
				tmx = tmx.replace('"', ' ');
				Double TempM = Double.parseDouble(tmx);// 받아온 온도
				// 최저온도
				String tmn = pub.get("tmn");
				tmn = tmn.replace('"', ' ');
				Double TempN = Double.parseDouble(tmn);// 받아온 온도

				if (tmpWfDay.equals("0")) {
					switch (tmpWfHour) {
					case ("3"): {
						if (result == 1)
							break;
						wfKor[0] = tmpWfKor;
						System.out.println("wfKor[0]->" + wfKor[0]);
						imgWfKor[0] = tmpImgWfKor;
						rs[0] = Rs;
						Temp1 = Temp;
						result = 1;
						// System.out.println(tmpWfDay);
					}
					case ("6"): {
						if (result == 1)
							break;
						wfKor[0] = tmpWfKor;
						System.out.println("wfKor[0]->" + wfKor[0]);
						imgWfKor[0] = tmpImgWfKor;
						rs[0] = Rs;
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
						wfKor[0] = tmpWfKor;
						System.out.println("wfKor[0]->" + wfKor[0]);
						imgWfKor[0] = tmpImgWfKor;
						rs[0] = Rs;
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
						wfKor[0] = tmpWfKor;
						System.out.println("wfKor[0]->" + wfKor[0]);
						imgWfKor[0] = tmpImgWfKor;
						rs[0] = Rs;
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
						wfKor[0] = tmpWfKor;
						System.out.println("wfKor[0]->" + wfKor[0]);
						imgWfKor[0] = tmpImgWfKor;
						rs[0] = Rs;
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
						wfKor[0] = tmpWfKor;
						System.out.println("wfKor[0]->" + wfKor[0]);
						imgWfKor[0] = tmpImgWfKor;
						rs[0] = Rs;
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
						wfKor[0] = tmpWfKor;
						System.out.println("wfKor[0]->" + wfKor[0]);
						imgWfKor[0] = tmpImgWfKor;
						rs[0] = Rs;
						if (Temp1 == -100.0)
							Temp1 = Temp;
						else
							break;
						result = 1;
						// System.out.println(tmpWfDay);

					}
					}
				}
				// 내일날씨정보받기
				if (tmpWfDay.equals("1")) {
					wfKor[1] = tmpWfKor;
					imgWfKor[1] = tmpImgWfKor;
					rs[1] = Rs;
					Tmx[0] = TempM;
					Tmn[0] = TempN;
					// System.out.println(tmpWfDay);

				}

				// 모레 날씨 정보 받기
				if (!tmpWfKor.equals("") && tmpWfDay.equals("2")) {
					wfKor[2] = tmpWfKor;
					imgWfKor[2] = tmpImgWfKor;
					rs[2] = Rs;
					Tmx[1] = TempM;
					Tmn[1] = TempN;
					// System.out.println(tmpWfDay);

				}

			}

			// 주간날씨정보
			for (int i = 0; i < pubList1.size(); i++) {
				HashMap<String, String> pub1 = pubList1.get(i);
				// "tmEf", "wf","tmx","tmn","rnSt"

				String tmpWf = pub1.get("wf");
				tmpWf = tmpWf.replace('"', ' ');
				if (tmpWf == null)
					tmpWf = "";

				String tmpImgWfKor1 = "images/ico01.png";

				if (tmpWf.equals("구름조금"))
					tmpImgWfKor1 = "images/ico02.png";
				else if (tmpWf.equals("구름많음"))
					tmpImgWfKor1 = "images/ico03.png";
				else if (tmpWf.equals("흐림"))
					tmpImgWfKor1 = "images/ico04.png";
				else if (tmpWf.equals("비"))
					tmpImgWfKor1 = "images/ico05.png";
				else if (tmpWf.equals("눈/비"))
					tmpImgWfKor1 = "images/ico06.png";
				else if (tmpWf.equals("눈"))
					tmpImgWfKor1 = "images/ico07.png";

				String tmEf = pub1.get("tmEf");
				// System.out.println(tmEf);
				int idx = tmEf.indexOf(" ");
				String day = tmEf.substring(0, idx);
				System.out.println("tmEf1 : " + day);

				// System.out.println("날짜검사1->" + day5);
				// System.out.println("날짜검사2->" + day6);

				String rsWfRS = pub1.get("rnSt");
				// System.out.println("rsWfRS->" + rsWfRS);
				Double Rs = Double.parseDouble(rsWfRS);// 받아온 강수량

				// 최고온도
				String tmx = pub1.get("tmx");
				// System.out.println(tmx);
				tmx = tmx.replace('"', ' ');
				Double TempM = Double.parseDouble(tmx);// 받아온 온도
				// 최저온도
				String tmn = pub1.get("tmn");
				tmn = tmn.replace('"', ' ');
				Double TempN = Double.parseDouble(tmn);// 받아온 온도

				String ct = pub1.get("city");

				if (day.compareTo(day4) == 0 && city.equals(ct)) {
					wfKor[3] = tmpWf;
					imgWfKor[3] = tmpImgWfKor1;
					rs[3] = Rs;
					Tmx[2] = TempM;
					Tmn[2] = TempN;
			//		System.out.println("------------------------------------------------4"+wfKor[3]+imgWfKor[3]+rs[3]+Tmx[2]+Tmn[2]);
					result++;
				}
				if (day.compareTo(day5) == 0 && city.equals(ct)) {
					wfKor[4] = tmpWf;
					imgWfKor[4] = tmpImgWfKor1;
					rs[4] = Rs;
					Tmx[3] = TempM;
					Tmn[3] = TempN;
			//		System.out.println("------------------------------------------------5"+wfKor[4]+imgWfKor[4]+rs[4]+Tmx[3]+Tmn[3]);
					result++;
				}
				if (day.compareTo(day6) == 0 && city.equals(ct)) {
					wfKor[5] = tmpWf;
					imgWfKor[5] = tmpImgWfKor1;
					rs[5] = Rs;
					/// System.out.println("온도들1" + TempM + " " + TempN);
					Tmx[4] = TempM;
					Tmn[4] = TempN;
			//		System.out.println("------------------------------------------------6"+wfKor[5]+imgWfKor[5]+rs[5]+Tmx[4]+Tmn[4]);
					result++;
				}
				if (day.compareTo(day7) == 0 && city.equals(ct)) {
					wfKor[6] = tmpWf;
					imgWfKor[6] = tmpImgWfKor1;
					rs[6] = Rs;
					// System.out.println("온도들2" + TempM + " " + TempN);
					Tmx[5] = TempM;
					Tmn[5] = TempN;
				//	System.out.println("------------------------------------------------7"+wfKor[6]+imgWfKor[6]+rs[6]+Tmx[5]+Tmn[5]);
					result++;
				}
				if(result==9) {
					break;
				}

			}
			HttpSession session = request.getSession();
			String mem_id = (String)session.getAttribute("mem_id");
			JW_BookMarkDao bd = JW_BookMarkDao.getInstance();
			ArrayList<Integer> stl_id=bd.select(mem_id);
			request.setAttribute("mem_id", mem_id);
			JW_StyleInfoDao sl = JW_StyleInfoDao.getInstance();
			
			Map<String, String> Bmap = new HashMap<String, String>();
			for(int a : stl_id) {
				String stl_pic_url=sl.pic_url(a);
				Bmap.put(""+a, stl_pic_url);
				System.out.println("--------------------------------------------------------map실험->"+Bmap);
			}
			request.setAttribute("BookMap", Bmap);
			SimpleDateFormat sdf = new SimpleDateFormat("MM/dd E요일");
			day1 = sdf.format(c1.getTime());
			day2 = sdf.format(c2.getTime());
			day3 = sdf.format(c3.getTime());
			day4 = sdf.format(c4.getTime());
			day5 = sdf.format(c5.getTime());
			day6 = sdf.format(c6.getTime());
			day7 = sdf.format(c7.getTime());
			request.setAttribute("city", city);

			request.setAttribute("wfKor0", wfKor[0]);
			request.setAttribute("wfKor1", wfKor[1]);
			request.setAttribute("wfKor2", wfKor[2]);
			request.setAttribute("wfKor3", wfKor[3]);
			request.setAttribute("wfKor4", wfKor[4]);
			request.setAttribute("wfKor5", wfKor[5]);
			request.setAttribute("wfKor6", wfKor[6]);

			request.setAttribute("rs0", rs[0]);
			request.setAttribute("rs1", rs[1]);
			request.setAttribute("rs2", rs[2]);
			request.setAttribute("rs3", rs[3]);
			request.setAttribute("rs4", rs[4]);
			request.setAttribute("rs5", rs[5]);
			request.setAttribute("rs6", rs[6]);

			request.setAttribute("Temp1", Temp1);
			request.setAttribute("Tmx0", Tmx[0]);
			request.setAttribute("Tmn0", Tmn[0]);
			request.setAttribute("Tmx1", Tmx[1]);
			request.setAttribute("Tmn1", Tmn[1]);
			request.setAttribute("Tmx2", Tmx[2]);
			request.setAttribute("Tmn2", Tmn[2]);
			request.setAttribute("Tmx3", Tmx[3]);
			request.setAttribute("Tmn3", Tmn[3]);
			request.setAttribute("Tmx4", Tmx[4]);
			request.setAttribute("Tmn4", Tmn[4]);
			request.setAttribute("Tmx5", Tmx[5]);
			request.setAttribute("Tmn5", Tmn[5]);
			request.setAttribute("day1", day1);
			request.setAttribute("day2", day2);
			request.setAttribute("day3", day3);
			request.setAttribute("day4", day4);
			request.setAttribute("day5", day5);
			request.setAttribute("day6", day6);
			request.setAttribute("day7", day7);

			request.setAttribute("wfKor0", wfKor[0]);
			request.setAttribute("wfKor1", wfKor[1]);
			request.setAttribute("wfKor2", wfKor[2]);
			request.setAttribute("wfKor3", wfKor[3]);
			request.setAttribute("wfKor4", wfKor[4]);
			request.setAttribute("wfKor5", wfKor[5]);
			request.setAttribute("wfKor6", wfKor[6]);

			request.setAttribute("imgWfKor0", imgWfKor[0]);
			request.setAttribute("imgWfKor1", imgWfKor[1]);
			request.setAttribute("imgWfKor2", imgWfKor[2]);
			request.setAttribute("imgWfKor3", imgWfKor[3]);
			request.setAttribute("imgWfKor4", imgWfKor[4]);
			request.setAttribute("imgWfKor5", imgWfKor[5]);
			request.setAttribute("imgWfKor6", imgWfKor[6]);
			city=TD.location(addr);
			request.setAttribute("city", city);
			/*for(int i = 0;i<6;i++)
				System.out.println("온도Tmx"+i+" "+Tmx[i]);
*/

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "mypagemain.jsp";
	}

}
