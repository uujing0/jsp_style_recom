package service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
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

public class StyleListAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("------------- StyleListAction -------------");
		
		JW_StyleInfoDao styleDao = JW_StyleInfoDao.getInstance();
		UJ_TagCategoryDao tagDao = UJ_TagCategoryDao.getInstance();
		
		try {
			String strPageNum = request.getParameter("pageNum");
			if (strPageNum == null || strPageNum.equals("")) {
				strPageNum = "1";
			}
			
			// TODO: Set Default tagId
			String strTagId = request.getParameter("tagId");
			if (strTagId == null || strTagId.equals("")) {
				strTagId = "1";
			}
			
			String strTagType = request.getParameter("tagType");
			if (strTagType == null || strTagType.equals("")) {
				strTagType = "1";
			}
			
			// session에서 gender type get
			HttpSession session = request.getSession();
			String strGender = (String)session.getAttribute("gender");
			if (strGender == null || strGender.equals("")) {
				strGender = "1";
			}
			
			int tagId = Integer.parseInt(strTagId);	
			int gender = Integer.parseInt(strGender);
			int tagType = Integer.parseInt(strTagType);
			int totCnt = styleDao.getStyleInfoCntFromTag(tagId, gender);
	
			int currentPage = Integer.parseInt(strPageNum);
			int boardRowSize = 5;
			int startRow = (currentPage - 1) * boardRowSize + 1; 	// 1
			int endRow = startRow + boardRowSize - 1;				// 10
			
			ArrayList<StyleInfo> styleInfos = styleDao.getStyleInfosFromTag(tagId, gender, startRow, endRow);
			int columnSize = 3, rowSize = (int) Math.ceil((double)totCnt / columnSize);
			
			ArrayList<TagCategory> sitTags = new ArrayList<>();
			ArrayList<TagCategory> bodyTags = new ArrayList<>();
			ArrayList<TagCategory> moodTags = new ArrayList<>();
			
			sitTags = tagDao.getCategoryListFromTagType(1);
			bodyTags = tagDao.getCategoryListFromTagType(2);
			moodTags = tagDao.getCategoryListFromTagType(3);
			
			request.setAttribute("styleInfos", styleInfos);
			request.setAttribute("tagId", tagId);
			request.setAttribute("tagType", tagType);
			request.setAttribute("locMap", Common.getInstance().locationMap());
			
			/* table 그려줄 때 필요한 변수 세팅 */
			// totCnt == 0일 경우 emptyView 띄어줌.
			request.setAttribute("totCnt", totCnt);
			request.setAttribute("list", styleInfos);
			
			request.setAttribute("rowSize", rowSize);
			request.setAttribute("columnSize", columnSize);
			
			request.setAttribute("sitTags", sitTags);
			request.setAttribute("bodyTags", bodyTags);
			request.setAttribute("moodTags", moodTags);
			
			// 날씨 상세 뷰를 위한 데이터 세팅 (tagType:4 - 날씨)
			if (tagType == 4) {
				setWeatherData(request, response);
				setStyleDetailData(request, response);
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		
		return "styleList.jsp";
	}
	
	public void setWeatherData(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		HttpSession session = request.getSession();
		
		String loc = (String) session.getAttribute("loc");
		if (loc == null || loc.equals("")) {
			loc = "서울특별시";
		}
		
		Map<String, String> locationMap = Common.getInstance().locationMap();
		String strLocCode = locationMap.get(loc);
		int locCode = 0;
		
		if (strLocCode != null) {
			locCode = Integer.parseInt(strLocCode);
		}
	
		/* get weather 기온, 강수확률
		 * style filter
		 * 1. 기온 별 level 세팅
		 * 2. 레벨 별로 style 나오고 - random하게 하나 추출
		 * 3. accessory 
		 *  	- 나머지 level별 엑셀 참고
		 * 		- 강수확률 별 
		 * */
	}
	
	/* Ref: StyleDetailAction */
	public void setStyleDetailData(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		
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

		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
		
		String strGender = (String) session.getAttribute("strGender");
		if (strGender == null || strGender.equals("")) {
			strGender = "1";
		}
		
		int gender = Integer.parseInt(strGender);
		System.out.println("gender->" + gender);
		
		
		// TODO: 해당 style id set
		int stl_id = Integer.parseInt(request.getParameter("stl_id"));
		System.out.println("stl_id->" + stl_id);
		
		// bookmark
		JW_BookMarkDao bmDao = JW_BookMarkDao.getInstance();

		int onoff = Integer.parseInt(request.getParameter("onoff"));

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
			System.out.println("-------- al->"+al.get(i));
		}
		// product id
		// outer
		
		if (al.get(1) != null) {

			p_cc1 = cpmDao.styleIdFind(Integer.parseInt(al.get(1)), gender);

			for (int i = 0; i < p_cc1.size(); i++) {

				p_cc1_id.add(p_cc1.get(i));
				p_cc1.set(i, pDao.productFind(p_cc1.get(i)));
				System.out.println("p_cc1_id -> "+p_cc1_id.get(i));

			}
		}
		System.out.println("너되냐?1");
		System.out.println("al : " + al.get(2));

		
		
		if (al.get(2) != null) {

			p_cc2 = cpmDao.styleIdFind(Integer.parseInt(al.get(2)), gender);
			
			System.out.println("p_cc2->" + p_cc2.get(0));

			for (int i = 0; i < p_cc2.size(); i++) {

				p_cc2_id.add(p_cc2.get(i));
				p_cc2.set(i, pDao.productFind(p_cc2.get(i)));
				System.out.println("p_cc2_id -> "+p_cc2_id.get(i));
			}
		}

		System.out.println("너되냐?2");

		System.out.println("al.get(3)->" + al.get(3));
		if (al.get(3) != null) {
			p_cc3 = cpmDao.styleIdFind(Integer.parseInt(al.get(3)), gender);
			System.out.println("p_cc3->" + p_cc3.get(0));
		
			for (int i = 0; i < p_cc3.size(); i++) {
				p_cc3_id.add(p_cc3.get(i));
				p_cc3.set(i, pDao.productFind(p_cc3.get(i)));
			}

		}

		al.set(1, ccDao.clothesCategoryFind(al.get(1))); // outer
		al.set(2, ccDao.clothesCategoryFind(al.get(2))); // top
		al.set(3, ccDao.clothesCategoryFind(al.get(3))); // bottom
		al.set(4, ccDao.clothesCategoryFind(al.get(4))); // acc

		System.out.println("styleDetailAction.java");
		System.out.println(al.get(0));
		System.out.println(al.get(1));
		System.out.println(al.get(2));
		System.out.println(al.get(3));

		/*
		 * System.out.println("p_id_cc1.get(3)->"+p_cc1_id.get(3));
		 * System.out.println("p_id_cc2.get(3)->"+p_cc2_id.get(3));
		 * System.out.println("p_id_cc3.get(3)->"+p_cc3_id.get(3));
		 */

		String img_path = request.getSession().getServletContext().getRealPath("/");
		System.out.println(img_path);
		System.out.println("이건되니?");
		
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

		System.out.println("StyleDetailAction end...");
		
	}

}
