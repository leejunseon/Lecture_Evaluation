<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="https://code.jquery.com/jquery-3.0.0.min.js?ver=7"></script>
<link href="http://13.209.161.83:8080/Evaluation/CSS/commonStyle.css?ver=7" rel="stylesheet" type="text/css">
<script>
$(document).ready(function() {
	$('#insidecontent').css('height',  $(window).height ()-150);
});

function signup(){
	var Email = $('#Email').val();
	var Passwd = $('#Passwd').val();
	var Name = $('#Name').val();
	var University = $('#University').val();
	var Major = $('#Major').val();
	
	$.ajax({  
	    type: "POST",  
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

function logout(){
	$.ajax({  
	    type: "POST",  
	    url: "logout",  
	   	datatype:"json",
	    success: function(data){  
	    	alert("로그아웃 되었습니다.");
	    	location.href="login.jsp"
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
		<li class="h"><a class="h" href="javascript:logout();">로그아웃</a></li>
		</ul>
	</div>
	<div id="insidecontent">
	<div id="edge"></div>
		<form id="form"action="javascript:signup()">
			<div id="table"align="center">
				<table  style="border-spacing:0 10px; width:60%;">
					<tr>
						<td>이메일:</td><td><input type="text" id="Email"/></td>
					</tr>
					<tr>
						<td>비밀번호:</td><td><input type="password" id="Passwd"/></td>
					</tr>
					<tr>
						<td>이름:</td><td><input type="text" id="Name"/></td>
					</tr>
					<tr>
						<td>대학교:</td><td><input type="text" id="University"/></td>
					</tr>
					<tr>
						<td>전공:</td><td><input type="text" id="Major"/></td>
					</tr>
				</table>
				<div align="right"style="margin-right:10px;">
					<input type="submit"value="등록"/>
					<input type="reset"value="취소"/>
				</div>
				<div style="height:10px"></div>
			</div>
		</form>
	</div>
</body>
</html>