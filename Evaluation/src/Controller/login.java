package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import DAO.Dao;

/**
 * Servlet implementation class login
 */
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		Dao dao=new Dao();
		String Name="";
		String result="";
		HttpSession session = request.getSession();
		
		String Email=request.getParameter("Email");
		String Passwd=request.getParameter("Passwd");
		
		Name=dao.login(session,Email, Passwd);	
		
		JSONObject json = new JSONObject();
				
		if(Name!=null) {//로그인 성공
			result="success";
			json.put("result", result);
			json.put("Name", Name);
		}else {//로그인 실패
			result="fail";
			json.put("result", result);
		}
		
		response.setContentType("application/json");
		PrintWriter out;
		try{
			out = response.getWriter();
			out.print(json);
		}catch(IOException e){
			e.printStackTrace();
		}
	}

}
