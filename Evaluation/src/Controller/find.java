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
 * Servlet implementation class find
 */
public class find extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public find() {
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
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		Dao dao=new Dao();
		String Email=request.getParameter("Email");
		String result[]=dao.find(Email);
		
		JSONObject json = new JSONObject();
		json.put("Passwd", result[0]);
		json.put("Name", result[1]);
			
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
