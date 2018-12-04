package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import DAO.Dao;

/**
 * Servlet implementation class get_memberN
 */
public class getNumbers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getNumbers() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Dao dao=new Dao();
		String result[];
		
		result=dao.getNumbers();
		
		JSONObject json = new JSONObject();
		json.put("member", result[0]);
		json.put("evaluation", result[1]);
		json.put("university", result[2]);
			
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
