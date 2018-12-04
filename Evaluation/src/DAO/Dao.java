package DAO;

import java.sql.*;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import DTO.Dto;

public class Dao {
	Connection conn;
	Statement stmt;
	PreparedStatement pstmt;
	String sql;
	ResultSet rs;
	
	public Dao(){//생성자 -> DB 연동
		 conn = null;
		 stmt=null;
		 pstmt = null;
		 sql = null;
		
		 try {
			 Class.forName("com.mysql.jdbc.Driver");
			 String url = "jdbc:mysql://localhost:3306/evaluation_db";
			 conn = DriverManager.getConnection(url, "root", "airquay1!");
			 stmt = conn.createStatement();
		}catch(Exception e){
			System.out.println("DB 연동 오류입니다. : " + e.getMessage());
		}	
	}
	
	// -----------------login---------------------
	public String login(HttpSession session,String Email,String passwd) {
		 rs = null;
		 String result=null;
		 
		 try {
			 if(session.getAttribute("login") != null ){
				 session.removeAttribute("login");
			 }

			 sql="select name from user where email='"+Email+"'and passwd='"+passwd+"'";
			 rs=stmt.executeQuery(sql);
			 rs.last();
			 
			 if(rs.getRow()==0)
				 result=null;
			 else {
				 session.setAttribute("login", true);
				 result=rs.getString("Name");
				 session.setAttribute("Name",result);
			 }
			 
		 }catch(Exception e) {
			 System.out.println("DB 연동 오류입니다. : "+e.getMessage());
		 }finally {
			 if (rs != null) try { rs.close(); } catch(SQLException ex1) {}
			 if (stmt != null) try { stmt.close(); } catch(SQLException ex1) {}
			 if (conn != null) try { conn.close(); } catch(SQLException ex1) {}
		 }		
		 
		 return result;
	}
	
	// -----------------------------------sign up---------------------------------------------
	public String signup(String Email,String Passwd,String Name,String University,String Major) {
		String result="";
		
		try {
			sql="select * from user where email='"+Email+"'";
			rs=stmt.executeQuery(sql);
			rs.last();
			if(rs.getRow()==0){//겹치는 email이 없다면
				pstmt=conn.prepareStatement("insert into user (Email,Passwd,Name,University,Major)values (?,?,?,?,?)");
				pstmt.setString(1,Email);
		   		pstmt.setString(2,Passwd);
		   		pstmt.setString(3,Name);
		   		pstmt.setString(4,University);
		   		pstmt.setString(5,Major);
		   		pstmt.executeUpdate();
		   		result="success";
			}else {//겹치는 email이 있다면
				result="fail";
			}
		}catch(Exception e) {
			System.out.println("DB 연동 오류입니다. : "+e.getMessage());
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex1) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex1) {}
			if (stmt != null) try { stmt.close(); } catch(SQLException ex1) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex1) {}
		}		
		return result;
	}
	
	//---------------------------get Numbers on main---------------------------------
	public String[] getNumbers() {
		String[] result=new String[3];
		try {
			sql="select" + 
					" (select count(user.User_key) from user) user," + 
					" (select distinct count(user.University) from user) university," + 
					" (select count(evaluation.Evaluation_key) from evaluation) evaluation" + 
					" from dual";
			rs=stmt.executeQuery(sql);
			rs.next();
			result[0]=rs.getString("user");
			result[1]=rs.getString("university");
			result[2]=rs.getString("evaluation");
		}catch(Exception e) {
			System.out.println("DB 연동 오류입니다. : "+e.getMessage());
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex1) {}
			if (stmt != null) try { stmt.close(); } catch(SQLException ex1) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex1) {}
		}		
		return result;
	}
	
	//-----------------------get Participation on search--------------------------
	public String[] getParticipation() {
		String[] result=new String[2];
		try {
			sql="select"+ 
					" (select distinct count(user.User_key) from user where exists(select evaluation.User_key from evaluation)) user,"+
					" (select count(evaluation.Evaluation_key) from evaluation) evaluation"+
				" from dual";
			rs=stmt.executeQuery(sql);
			rs.next();
			result[0]=rs.getString("user");
			result[1]=rs.getString("evaluation");
		}catch(Exception e) {
			System.out.println("DB 연동 오류입니다. : "+e.getMessage());
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex1) {}
			if (stmt != null) try { stmt.close(); } catch(SQLException ex1) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex1) {}
		}		
		return result;
	}
	
	//------------------------------addEvaluation------------------------------------
	public void addEvaluation(String[] data) {
		try {
			sql="select user_key from user where name='"+data[7]+"'";
			rs=stmt.executeQuery(sql);
			rs.next();
			String user_key=rs.getString("user_key");
			
			pstmt=conn.prepareStatement("insert into evaluation (lecture,professor,grade,interest,clarity,kindness,recommendationyn,user_key)values (?,?,?,?,?,?,?,?)");
			pstmt.setString(1,data[0]);
	   		pstmt.setString(2,data[1]);
	   		pstmt.setString(3,data[2]);
	   		pstmt.setString(4,data[3]);
	   		pstmt.setString(5,data[4]);
	   		pstmt.setString(6,data[5]);
	   		pstmt.setString(7,data[6]);
	   		pstmt.setString(8, user_key);
	   		pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("DB 연동 오류입니다. : "+e.getMessage());
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex1) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex1) {}
			if (stmt != null) try { stmt.close(); } catch(SQLException ex1) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex1) {}
		}		
	}
	
	//------------------------------search Evaluation-------------------------------
	public ArrayList<Dto> searchEvaluation(String search) {
		int rownum;
		ArrayList<Dto> result=new ArrayList<Dto>();
		Dto dto;
		
		try {
			sql="SELECT * FROM evaluation"+ 
				" WHERE lecture LIKE '%"+search+"%' or professor like '%"+search+"%'";
			rs=stmt.executeQuery(sql);
			rs.last();
			rownum=rs.getRow();
			rs.first();
			for(int i=0;i<rownum;i++) {
				dto=new Dto();
				dto.setLecture(rs.getString("Lecture"));
				dto.setProfessor(rs.getString("Professor"));
				dto.setGrade(rs.getString("Grade"));
				dto.setInterest(rs.getString("Interest"));
				dto.setClarity(rs.getString("Clarity"));
				dto.setKindness(rs.getString("Kindness"));
				dto.setRecommendationYN(rs.getString("RecommendationYN"));
				result.add(dto);
				rs.next();
			}
		}catch(Exception e) {
			System.out.println("DB 연동 오류입니다. : "+e.getMessage());
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex1) {}
			if (stmt != null) try { stmt.close(); } catch(SQLException ex1) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex1) {}
		}		
		return result;
	}
	
	public String[] find(String Email) {
		String result[]=new String[2];
		try {
			sql="select user.Passwd,user.Name from user where user.Email='"+Email+"'";
			rs=stmt.executeQuery(sql);
			rs.next();
			result[0]=rs.getString("Passwd");
			result[1]=rs.getString("Name");
		}catch(Exception e) {
			System.out.println("DB 연동 오류입니다. : "+e.getMessage());
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex1) {}
			if (stmt != null) try { stmt.close(); } catch(SQLException ex1) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex1) {}
		}		
		return result;
	}
}
