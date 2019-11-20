package service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Common;
import dao.JW_BookMarkDao;
import dao.JW_ClothesCategoryDao;
import dao.JW_ClothesProductMappingDao;
import dao.JW_ProductDao;
import dao.JW_StyleInfoDao;
import dao.Member;
import dao.StyleInfo;
import dao.TagCategory;
import dao.UJ_MemberDao;
import dao.UJ_TagCategoryDao;


/*
 * tagId       : tagId가 있을 경우 그에 맞는 stylelist 세팅
 * gender      : session에 값 존재
 * tagType     : tagId가 어느 tagType에 존재하는가 (tagType=4일 경우 날씨 데이터 세팅)
 * search_word : 검색일 경우 키워드 
 * */


public class StyleListAction implements CommandProcess {
	private int tagId;
	private int gender;
	private int tagType;
	private int stl_id;

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("------------- StyleListAction -------------");
		
		
		UJ_TagCategoryDao tagDao = UJ_TagCategoryDao.getInstance();

		try {
			/*
			 * SETTING COMMON DATA - click tag, weather, search
			 * 
			 * */
			String strTagId = request.getParameter("tagId");
			if (strTagId == null || strTagId.equals("")) {
				strTagId = "0";
			}
			
			String strTagType = request.getParameter("tagType");
			if (strTagType == null || strTagType.equals("")) {
				strTagType = "0";
			}
			
			String search_word = (String)request.getAttribute("search_word");
			boolean isSearch = search_word == null || search_word.equals("") ? false : true;
			
	
			// session에서 gender type get
			HttpSession session = request.getSession();
			String strGender = (String)session.getAttribute("gender");
			if (strGender == null || strGender.equals("")) {
				strGender = "1";
			}
			
			this.tagId = Integer.parseInt(strTagId);	
			this.gender = Integer.parseInt(strGender);
			this.tagType = Integer.parseInt(strTagType);

			System.out.println("===> tagType : " + this.tagType);
		
			ArrayList<TagCategory> sitTags = new ArrayList<>();
			ArrayList<TagCategory> bodyTags = new ArrayList<>();
			ArrayList<TagCategory> moodTags = new ArrayList<>();
			
			sitTags = tagDao.getCategoryListFromTagType(1);
			bodyTags = tagDao.getCategoryListFromTagType(2);
			moodTags = tagDao.getCategoryListFromTagType(3);
			
			request.setAttribute("tagId", tagId);
			request.setAttribute("tagType", tagType);
			request.setAttribute("locMap", Common.getInstance().locationMap());
			
			request.setAttribute("sitTags", sitTags);
			request.setAttribute("bodyTags", bodyTags);
			request.setAttribute("moodTags", moodTags);
			
			
			/* 기능에 따른 분기 */
			// table 그려줄 때 필요한 변수 세팅
			if (isSearch) {

			} else {
				// 날씨 상세 뷰를 위한 데이터 세팅 (tagType:4 - 날씨)
				System.out.println("tag_type-> "+this.tagType);
				
				if (this.tagType == 4) {
					setStyleDetailData(request, response);
				} else {
					setDataByTagId(request, response);
				}
			}
			
			setDataOfTableView(request, response);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		
		return "styleList.jsp";
	}

	public void setDataOfTableView(HttpServletRequest request, HttpServletResponse response) {
		int totCnt = 0, columnSize = 3, rowSize = 0;
		
		ArrayList<StyleInfo> list = (ArrayList<StyleInfo>)request.getAttribute("list");
		
		totCnt = list == null ? 0 : list.size();
		rowSize = (int) Math.ceil((double)totCnt / columnSize);
		
		request.setAttribute("totCnt", totCnt);
        request.setAttribute("rowSize", rowSize);
        request.setAttribute("columnSize", columnSize);
	}
	
	public void setDataByTagId(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		JW_StyleInfoDao styleDao = JW_StyleInfoDao.getInstance();
		ArrayList<StyleInfo> styleInfos = styleDao.getStyleInfosFromTag(tagId, gender);
		request.setAttribute("list", styleInfos);
	}
	
	/* Ref: StyleDetailAction */
	public void setStyleDetailData(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		System.out.println("request.getParameter(\"stl_id\")->"+request.getParameter("stl_id"));

		JW_StyleInfoDao styleDao = JW_StyleInfoDao.getInstance();

		HttpSession session = request.getSession();
		String strLocCode = request.getParameter("locCode");
		
		if (strLocCode == null) {
			return;
		}
		
		Map<String, String> map = Common.getInstance().getWeatherTmp(strLocCode);
		
		double tmp = Double.parseDouble(map.get("Temp"));
		double rs = Double.parseDouble(map.get("Rs"));
		int level = Common.getInstance().weatherLevelByTmp(tmp);
		this.tagId = Common.getInstance().tagIdByWeatherLevel(level);
		String imgWfKor = map.get("imgWfKor");
		String wfKor = map.get("wfKor");
		
		System.out.println("--------------");
		System.out.println("level->"+level);
		System.out.println("rs->"+rs);
		System.out.println("imgWfKor->"+imgWfKor);
		
		ArrayList<StyleInfo> styleInfos = styleDao.getStyleInfosFromTag(this.tagId, this.gender);
	
		int randomIndex = (int)(Math.random()*styleInfos.size());
		
		this.stl_id = styleInfos.get(randomIndex).getStl_id();
		
		System.out.println("tmp : " + tmp);
		System.out.println("rs : " + rs);
		System.out.println("level : " + level);
		System.out.println("tagId : " + this.tagId);
		System.out.println("stl_id : " + this.stl_id);
		
		request.setAttribute("lc", strLocCode);
		
		JW_StyleInfoDao siDao = JW_StyleInfoDao.getInstance();
		JW_ClothesCategoryDao ccDao = JW_ClothesCategoryDao.getInstance();
		ArrayList<String> al = new ArrayList<String>();
		JW_ClothesProductMappingDao cpmDao = JW_ClothesProductMappingDao.getInstance();
		JW_ProductDao pDao = JW_ProductDao.getInstance();

		// product_image
		ArrayList<String> p_cc1 = new ArrayList<String>();
		ArrayList<String> p_cc2 = new ArrayList<String>();
		ArrayList<String> p_cc3 = new ArrayList<String>();

		ArrayList<String> p_cc1_id = new ArrayList<String>();
		ArrayList<String> p_cc2_id = new ArrayList<String>();
		ArrayList<String> p_cc3_id = new ArrayList<String>();

		String mem_id = (String) session.getAttribute("mem_id");
		System.out.println("memid->" + mem_id);
		String strGender = (String) session.getAttribute("gender");
		if (strGender == null || strGender.equals("")) {
			strGender = "1";
		}
		int gender = Integer.parseInt(strGender);
		System.out.println("gender->" + gender);
		System.out.println("stl_id->" + stl_id);
		// bookmark
		JW_BookMarkDao bmDao = JW_BookMarkDao.getInstance();

		int onoff = 0;
		/*
		 * Integer.parseInt(request.getParameter("onoff"));
		 */
		
		System.out.println("onoff->" + onoff);
		if (onoff == 1) {
			bmDao.insert(mem_id, stl_id);
		}
		if (onoff == 2) {
			bmDao.delete(mem_id, stl_id);
		}
		int status = bmDao.check(mem_id, stl_id);
		al = siDao.styleFind(stl_id);
		String std_desc = siDao.styleDesc(stl_id);
		System.out.println("std_desc->" + std_desc);
		System.out.println("al.size()->" + al.size());

		for(int i=0; i<al.size(); i++) {
			System.out.println("al->"+al.get(i));
		}
		// product id
		// outer
		
		if (al.get(1) != null) {
			System.out.println("겉옷 들어오니?");

			p_cc1 = cpmDao.styleIdFind(Integer.parseInt(al.get(1)), gender);
			for (int i = 0; i < p_cc1.size(); i++) {
				p_cc1_id.add(p_cc1.get(i));
				p_cc1.set(i, pDao.productFind(p_cc1.get(i)));
				System.out.println("p_cc1_id -> "+p_cc1_id.get(i));
			}
		}

		
		if (al.get(2) != null) {
			System.out.println("상의 들어오니?");

			p_cc2 = cpmDao.styleIdFind(Integer.parseInt(al.get(2)), gender);
			for (int i = 0; i < p_cc2.size(); i++) {
				p_cc2_id.add(p_cc2.get(i));
				p_cc2.set(i, pDao.productFind(p_cc2.get(i)));
			}
		}

		if (al.get(3) != null) {
			System.out.println("하의 들어오니?");

			p_cc3 = cpmDao.styleIdFind(Integer.parseInt(al.get(3)), gender);
			for (int i = 0; i < p_cc3.size(); i++) {
				p_cc3_id.add(p_cc3.get(i));
				p_cc3.set(i, pDao.productFind(p_cc3.get(i)));
			}
		}

		al.set(1, ccDao.clothesCategoryFind(al.get(1))); // outer
		al.set(2, ccDao.clothesCategoryFind(al.get(2))); // top
		al.set(3, ccDao.clothesCategoryFind(al.get(3))); // bottom

		al.set(4, ccDao.clothesCategoryFind(al.get(4))); 


		System.out.println("al.get(0)"+al.get(0));
		System.out.println("al.get(1)"+al.get(1));
		System.out.println("al.get(2)"+al.get(2));
		System.out.println("al.get(3)"+al.get(3));
		System.out.println("al.get(4)"+al.get(4));

		String acc_desc = null;
		int weatherAcc = Common.getInstance().getWeatherAccId(level, rs);
		String weatheAccString = Integer.toString(weatherAcc);
		if(weatherAcc != 0) {
			al.set(4, ccDao.clothesCategoryFind(weatheAccString)); // acc
			acc_desc = ccDao.clothesCategoryDescFind(weatheAccString);
		} 
		


		System.out.println("al.get(0)"+al.get(0));
		System.out.println("al.get(1)"+al.get(1));
		System.out.println("al.get(2)"+al.get(2));
		System.out.println("al.get(3)"+al.get(3));
		System.out.println("al.get(4)"+al.get(4));

		request.setAttribute("stl_id", stl_id);
		request.setAttribute("al", al);
		request.setAttribute("std_desc", std_desc);
		request.setAttribute("p_cc1", p_cc1);
		request.setAttribute("p_cc2", p_cc2);
		request.setAttribute("p_cc3", p_cc3);

		request.setAttribute("p_cc1_id", p_cc1_id);
		request.setAttribute("p_cc2_id", p_cc2_id);
		request.setAttribute("p_cc3_id", p_cc3_id);
		request.setAttribute("p_cc1.size", p_cc1.size());

		request.setAttribute("gender", gender);
		request.setAttribute("mem_id", mem_id);
		request.setAttribute("status", status);
		System.out.println("acc_desc->"+acc_desc);
		request.setAttribute("acc_desc", acc_desc);
		
		request.setAttribute("tmp", tmp); //temp
		request.setAttribute("rs", rs); //rain_probability
		request.setAttribute("imgWfKor", imgWfKor); //weather_image 
		request.setAttribute("wfKor", wfKor);
		
		System.out.println("StyleWeatherDetailAction end...");
		
	}



	private int al(int i) {
		// TODO Auto-generated method stub
		return 0;
	}

}
