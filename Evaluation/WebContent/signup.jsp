<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script src="https://code.jquery.com/jquery-3.0.0.min.js?ver=1"></script>
<link href="http://localhost:8080/Evaluation/CSS/commonStyle.css" rel="stylesheet" type="text/css">
<script>
function signup(){
	var Email = $('#Email').val();
	var Passwd = $('#Passwd').val();
	var Name = $('#Name').val();
	var University = $('#University').val();
	var Major = $('#Major').val();
	
	$.ajax({  
	    type: "GET",  
	    url: "signup",  
	    data: "Email="+Email+
	    "&Passwd="+Passwd+
	   	"&Name="+Name+
	   	"&University="+University+
	   	"&Major="+Major,
	   	datatype:"json",
	    success: function(data){  
	    	if(data.result=="success"){
	    		alert("회원가입이 완료되었습니다.");
	    		location.href="login.jsp";
	    	}else{
	    		alert("이메일이 중복됩니다. 다른 이메일을 사용하십시오.");
	    	}
	    },
	    error : function(request,status,error) {  
	    	alert("code:"+request.status+"\n"+"error:"+error);
	    }
	});  
}	
</script>
<title> 온라인 강의평가 </title>
</head>
<body>
	<h1><a href="main.jsp" style="text-decoration:none;"><font face="맑은 고딕" color="royalblue" >온라인 강의평가</font></a></h1>
	<div id="navi">
		<ul class="h">
		<li class="h"><a class="h" href="login.jsp">로그인</a></li>
		<li class="h"><a class="h active" href="signup.jsp">회원가입</a></li>
		<li class="h"><a class="h" href="addEvaluation.jsp">강의평가 등록</a></li>
		<li class="h"><a class="h" href="searchEvaluation.jsp">강의평가 조회</a></li>
		</ul>
	</div>
	<div id="insidecontent">
		<form id="form"action="javascript:signup()">
			이메일:<input type="text" id="Email"/><br>
			비밀번호:<input type="text" id="Passwd"/><br>
			이름:<input type="text" id="Name"/><br>
			대학교:<input type="text" id="University"/><br>
			전공:<input type="text" id="Major"/><br>
			<input type="submit">
		</form>
	</div>
</body>
</html>