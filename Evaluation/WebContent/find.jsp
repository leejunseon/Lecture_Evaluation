<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="https://code.jquery.com/jquery-3.0.0.min.js?ver=1"></script>
<link href="http://localhost:8080/Evaluation/CSS/commonStyle.css" rel="stylesheet" type="text/css">
<script>
function find(){
	var email=$("#email").val();
	if(email==""){
    	alert("이메일을 입력하세요");
	}else{
		$.ajax({  
		    type: "GET",  
		    url: "find",  
		    data: "Email="+email,
		   	datatype:"json",
		    success: function(data){  
		    	var Name=data.Name;
		    	var Passwd=data.Passwd;
		    	alert(Name+" 님의 패스워드는 "+Passwd+"입니다.");
		    },
		    error : function(request,status,error) {  
		    	alert("code:"+request.status+"\n"+"error:"+error);
		    }
		});  
	}	
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
		<form id="form" action="javascript:find()">
			이메일을 입력하세요<input type="text"id="email"><br>
			<input type="submit"value="아이디/비밀번호 찾기">
		</form>
	</div>
</body>
</html>