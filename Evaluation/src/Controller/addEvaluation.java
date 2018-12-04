package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import DAO.Dao;

/**
 * Servlet implementation class addEvaluation
 */
public class addEvaluation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addEvaluation() {
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
		String[] data=new String[8];
		int flag=1;
		String result="";
		
		data[0]=request.getParameter("lecture");
		data[1]=request.getParameter("professor");
		data[2]=request.getParameter("grade");
		data[3]=request.getParameter("interest");
		data[4]=request.getParameter("clarity");
		data[5]=request.getParameter("kindness");
		data[6]=request.getParameter("recommendationYN");
		data[7]=request.getParameter("Name");
		
		for(int i=0;i<8;i++) {
			if(data[i]==null) {
				flag=0;
				break;
			}
		}
			
		if(flag==1) {			
			dao.addEvaluation(data);			
			result="success";
		}else {
			result="fail";
		}
		
		JSONObject json = new JSONObject();
		json.put("result", result);
			
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
