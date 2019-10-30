package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import bbs.BbsDAO;

/**
 * Servlet implementation class BbsController
 */
@WebServlet(
		urlPatterns = { 
				"/BbsController", 
				"*.do"
		}, 
		initParams = { 
				@WebInitParam(name = "property", value = "web.properties")
		})
public class BbsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HashMap<String, Object> commandMap = new HashMap<String, Object>();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BbsController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		//1. web.xml에 정의 되어 있는 <welcome-file>인 index.jsp를 view로 출력한다.
		//2. index.jsp 내부에는 /borad/index.do로 forward요청을 보내는 코드가 있다.
		//3. 그렇게 요청을 보내면 여기 init함수가 실행된다.
		//4. init함수가 하는 일은 view단에서 보내는 .do형식으로 오는 모든 요청들을 처리할때 필요한 정보들을 담은
		//commandMap에 web.properties 정보를 <key,value> 형식으로 담는다. 예) <'/borad/view.do', action.ViewAction>
		//5. init함수의 모든 코드가 실행되고 나면 하단에 있는 process 함수가 실행된다.
		
		String props = config.getInitParameter("property");
		String realFolder = "/property";
	      
	      //웹 애플리케이션 루트 경로
	      ServletContext context = config.getServletContext();
	      //realFolder를 웹 애플리케이션 시스템상의 절대 경로로 변경 
	      String realPath = context.getRealPath(realFolder) + "\\" + props;

	      //명령어와 처리클래스의 매핑 정보를 저장할 Properties 객체 생성 
	      Properties pr = new Properties();
	      FileInputStream f = null;
	      try {
	         //command.properties 파일의 내용을 읽어옴
	         f = new FileInputStream(realPath);
	         //command.properties의 내용을 Properties 객체 pr에 저장 
	         pr.load(f);
	      }catch(IOException e) {
	         e.printStackTrace();
	      }finally {
	         if(f !=null) try {f.close();}catch(IOException ex) {}
	      }
	      
	      //Set객체의 iterator() 메소드를 사용해 Iterator 객체를 얻어냄 
	      Iterator<?> keyIter = pr.keySet().iterator();
	      //Iterator 객체에 저장된 명령어와 처리 클래스를 commandMap에 저장 
	      while(keyIter.hasNext()) {
	         String command = (String)keyIter.next();
	         String className = pr.getProperty(command);
	         try {
	            Class<?> commandClass = Class.forName(className);
	            Object commandInstance = commandClass.newInstance();
	            commandMap.put(command, commandInstance);
	            
	           
	         }catch(ClassNotFoundException e) {
	            throw new ServletException(e);
	         }catch(InstantiationException e) {
	            throw new ServletException(e);
	         }catch(IllegalAccessException e) {
	            throw new ServletException(e);
	         }
	      }
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		process(request,response);
	


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		process(request,response);
	}

	private void process (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		//process함수는 요청이 들어온 url에서 /borad/*.do만 추출한다.
		//그리고 commandMap에서 요청이 들어온 url에 해당하는 action패키지안 클래스 내부의 process 함수를 실행한다.
		
	
		String view = null;
		Action action=null;
		try {
			//요청이 들어온 url에서 필요한 부분 /borad/*.do만 추출하는 과정
			String command = request.getRequestURI();
	        if(command.indexOf(request.getContextPath()) != 0) 
	           command = command.substring(request.getContextPath().length());
	        action = (Action)commandMap.get(command);  
	        
	        //만약 null이라면 IndexAction클래스를 불러온다.
	        if(action == null)
	        	action = (Action)commandMap.get("/borad/index.do");
	        
	        //view란 문자열 변수에 view로 반환해줄 jsp파일 이름을 가져온다. 예) main.jsp
	        view = action.process(request, response);
	        
	        //만약 view반환값이 *.do형식이라면 해당 process를 다시 실행시킨다.
	        if(view.contains(".do")) {
				//요청이 들어온 url에서 필요한 부분 /borad/*.do만 추출하는 과정	   
	        	action = (Action)commandMap.get(view);
	        	view = action.process(request, response);
	        }
		}catch(Throwable e) {
			e.printStackTrace();
		}
		
		//만약 view가 빈값이 아니라면 정상적으로 작동시킨다.
		/*if(view.equals("")) {
			
		}else {*/
			//요청을 보낸 사용자에게 해당 jsp파일을  view화면으로 전환하는 응답을 보낸다.
		    RequestDispatcher dispatcher = request.getRequestDispatcher(view);
			dispatcher.forward(request, response);
		}
	
	}


