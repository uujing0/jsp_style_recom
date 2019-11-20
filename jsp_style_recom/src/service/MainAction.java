package service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Common;
import dao.JM_HotTagDao;
import dao.JW_StyleInfoDao;
import dao.Member;
import dao.StyleInfo;
import dao.UJ_MemberDao;
import dao.WY_StyleInfoDao;
import dao.YJ_BbsDAO;

public class MainAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		try {
			WY_StyleInfoDao msiDao = WY_StyleInfoDao.getInstance();
			JW_StyleInfoDao styleDao = JW_StyleInfoDao.getInstance();

			HttpSession session = request.getSession();
			String mem_id = (String) session.getAttribute("mem_id");
			System.out.println("멤버 아이디:::::::" + mem_id);
			UJ_MemberDao memberdao = UJ_MemberDao.getInstance();
			int gender = 0;
			if (mem_id != null) {
				Member mem = memberdao.getMemberDate(mem_id);
				gender = mem.getMem_gender();
				System.out.println("gender->" + gender);
			}
			String mem_loc = (String) session.getAttribute("loc");
			
			ArrayList<StyleInfo> styleInfos = styleDao.getStyleMain();

			JM_HotTagDao ht = JM_HotTagDao.getInstance();
			ArrayList<String> list = ht.tagList();
			request.setAttribute("tagList", list);
			YJ_BbsDAO bd = new YJ_BbsDAO();
			request.setAttribute("bbsList", bd.boardgetList());
			YJ_BbsDAO bd1 = new YJ_BbsDAO();
			request.setAttribute("bbsList2", bd1.noticelist());

			// 로그인시 스타일
			int[] stl_id = new int[4];
			String[] msi = new String[4];
			Map<String, String> map = new HashMap<String, String>();
			map = Common.getInstance().getWeatherTmp(mem_loc);
			double temp = Double.parseDouble(map.get("Temp"));
			if (mem_id != null) {
				System.out.println("start----------" + gender);
				
				System.out.println("temp----->" + temp);
				for (int i = 0; i < 4; i++) {
					stl_id[i] = Common.getInstance().getWeatherStyleIdByTmp(temp, gender);
					for (int j = 0; j < i; j++) {
						if (stl_id[i] == stl_id[j]) {
							i--;
							break;
						}	
					}
					System.out.println("stl_id" + i + "은????" + stl_id[i]);
				}
				

			} else {
				for (int i = 0; i < 4; i++) {
					gender=i%2+1;
					System.out.println("gender->"+gender);
					stl_id[i] = Common.getInstance().getWeatherStyleIdByTmp(temp, gender);
					for (int j = 0; j < i; j++) {
						if (stl_id[i] == stl_id[j]) {
							i--;
							break;
						}
					}
				}
				
			}
			for (int i = 0; i < 4; i++) {
				msi[i] = msiDao.styleFind(stl_id[i]);
				System.out.println("마지막stl_id" + i + "은????" + stl_id[i]);
				System.out.println("~~~~~~~~^^~~" + msi[i]);
				request.setAttribute("stl_id" + i, stl_id[i]); 
				request.setAttribute("msi" + i, msi[i]);
			}

		} catch (Exception e) {
			System.out.println("MainAction error : " + e.getMessage());
		}

		return "main.jsp";
	}

}
