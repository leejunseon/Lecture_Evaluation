package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.*;

import DAO.Dao;
import DTO.Dto;

/**
 * Servlet implementation class searchEvaluation
 */
public class searchEvaluation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public searchEvaluation() {
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
		Dto dto=new Dto();
		ArrayList<Dto> result=new ArrayList<Dto>();
		JSONObject json;
		JSONArray jsonResult=new JSONArray();
		int jsonNum;
		
		String search=request.getParameter("search");		
		result=dao.searchEvaluation(search);		
		jsonNum=result.size();
		for(int i=0;i<jsonNum;i++) {
			json=new JSONObject();
			json.put("Lecture", result.get(i).getLecture());
			json.put("Professor", result.get(i).getProfessor());
			json.put("Grade", result.get(i).getGrade());
			json.put("Interest", result.get(i).getInterest());
			json.put("Clarity", result.get(i).getClarity());
			json.put("Kindness", result.get(i).getKindness());
			json.put("RecommendationYN", result.get(i).getRecommendationYN());
			jsonResult.add(json);
		}
		
		response.setContentType("application/json");
		PrintWriter out;
		try{
			out = response.getWriter();
			out.print(jsonResult);
		}catch(IOException e){
			e.printStackTrace();
		}
	}
}
