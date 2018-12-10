<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="https://code.jquery.com/jquery-3.0.0.min.js?ver=1"></script>
<link href="http://localhost:8080/Evaluation/CSS/commonStyle.css" rel="stylesheet" type="text/css">
<script>
	function login(){
		var Email=$('#Email').val();
		var Passwd=$('#Passwd').val();
		var Name;
		
		$.ajax({  
		    type: "GET",  
		    url: "login",  
		    data: "Email="+Email+
		    "&Passwd="+Passwd,
		   	datatype:"json",
		    success: function(data){  
		    	if(data.result=="success"){
		    		Name=data.Name;
		    		alert(Name+"님 환영합니다.");
		    		location.href="main.jsp";
		    	}else{
		    		alert("이메일 혹은 비밀번호를 확인하십시오.");
		    	}
		    },
		    error : function(request,status,error) {  
		    	alert("code:"+request.status+"\n"+"error:"+error);
		    }
		});  
	}
</script>
<meta charset="EUC-KR">
<title> 온라인 강의평가 </title>
</head>
<body>
	<h1><a href="main.jsp" style="text-decoration:none;"><font face="맑은 고딕" color="royalblue" >온라인 강의평가</font></a></h1>
	<div id="navi">
		<ul class="h">
		<li class="h"><a class="h active" href="login.jsp">로그인</a></li>
		<li class="h"><a class="h" href="signup.jsp">회원가입</a></li>
		<li class="h"><a class="h" href="addEvaluation.jsp">강의평가 등록</a></li>
		<li class="h"><a class="h" href="searchEvaluation.jsp">강의평가 조회</a></li>
		</ul>
	</div>
	<div id="insidecontent">
	<div id="edge"></div>
		<form action="javascript:login()">
		<div align="center"style="background-color:white;margin-left:30%;margin-right:30%;margin-top:50px;">
			<table style="border-spacing:0 10px; width:60%;">
				<tr>
					<td>이메일:</td><td><input style="width:100%;"type="text" id="Email"/><br></td>
				</tr>
				<tr>
					<td>비밀번호: </td><td><input style="width:100%;"type="text" id="Passwd"/><br></td>
				</tr>
				<tr style="height:5px;"></tr>
				<tr>
					<td colspan="2"><input type="submit"value="로그인"style="width:100%;height:40px;"><br></td>
				</tr>
				<tr style="height:50px;"></tr>
			</table>
			<div align="left"style="margin-left:10px;">
				<input type="button" value="회원가입" onclick="location. href='signup.jsp'"/>
				<input type="button" value="아이디 / 비밀번호 찾기" onclick="location. href='find.jsp'"/>
			</div>
			<div style="height:10px"></div>
		</div>
		</form>
	</div>
</body>
</html>