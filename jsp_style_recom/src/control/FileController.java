package control;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.Objects;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class FileController
 */
@WebServlet("/FileController")
public class FileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String fileName = "";
		File file = null;
		
		//���� ������ ���
        String realPath = "C:\\jsp\\borad\\WebContent\\upload";
		
		System.out.println(realPath);
		MultipartRequest multi = new MultipartRequest(request, realPath,
			1024 * 1024 * 5, "utf-8", new DefaultFileRenamePolicy());
		Enumeration efiles = multi.getFileNames();
		        
		if(!Objects.isNull(efiles)) {
			while(efiles.hasMoreElements()){
				String name = (String)efiles.nextElement();                 
				file = multi.getFile(name);                       
				String imgName = file.getName();
				fileName +=imgName;
			}
		}
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset-utf-8");
		String fullpath = fileName;
		
		//path.jsp�� ���� ����
		request.setAttribute("fileName", file.getName());
		request.setAttribute("url", "/upload/"+fullpath);
		
		//path.jsp�� �ִ� ���ڿ����� ��Ƽ� ���� ��ȯ���ش�.
	    RequestDispatcher dispatcher = request.getRequestDispatcher("/path.jsp");
		dispatcher.forward(request, response);
	}

}
