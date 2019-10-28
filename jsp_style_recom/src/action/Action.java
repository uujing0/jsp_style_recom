package action;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public interface Action {
	public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
}
