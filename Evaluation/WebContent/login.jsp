<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="https://code.jquery.com/jquery-3.0.0.min.js?ver=1"></script>
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
<style>
	ul.h { list-style-type: none; margin: 0; padding: 0; width: 100%; overflow: hidden; background-color: DeepSkyBlue;}
	li.h { float: left; box-shadow: 0 0 0 1px black inset; width: 25%;}
	li.h a.h { display: block; color: white; text-align: center; padding: 14px 16px; text-decoration: none;}
	li.h a.h:hover:not(.active) { background-color: midnightblue; }
	.active { background-color: midnightblue; /*border-bottom: 2px solid #f00;*/}
	#insidecontent{ background-color: lightgrey; }
</style>
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
		<form action="javascript:login()">
			이메일:<input type="text" id="Email"/><br>
			비밀번호:<input type="text" id="Passwd"/><br>
			<input type="submit"value="로그인">
			<input type="button" value="회원가입" onclick="location. href='signup.jsp'"/>
		</form>
	</div>
</body>
</html>