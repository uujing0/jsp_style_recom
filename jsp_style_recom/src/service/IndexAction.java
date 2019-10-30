package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bbs.BbsDAO;

public class IndexAction implements CommandProcess{

	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {return "/bbs.jsp";
	}

}
