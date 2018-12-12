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

function find(){
	var email=$("#email").val();
	if(email==""){
    	alert("이메일을 입력하세요");
	}else{
		$.ajax({  
		    type: "POST",  
		    url: "find",  
		    data: "Email="+email,
		   	datatype:"json",
		    success: function(data){  
		    	var Name=data.Name;
		    	var Passwd=data.Passwd;
		    	alert(Name+" 님의 패스워드는 "+Passwd+"입니다.");
		    	location.href="login.jsp"
		    },
		    error : function(request,status,error) {  
		    	alert("code:"+request.status+"\n"+"error:"+error);
		    }
		});  
	}	
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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
		<li class="h"><a class="h" href="javascript:logout();">로그아웃</a></li>
		</ul>
	</div>
	<div id="insidecontent">
	<div id="edge"></div>
		<form id="form" action="javascript:find()">
			<div id="table"align="center">
				<table>
					<tr>
						<td>
							<h3>아이디/비밀번호 찾기</h3>
						</td>
					</tr>
					<tr>
						<td>이메일을 입력하세요</td>
					</tr>
					<tr>
						<td><input type="text"id="email"style="width:100%;"></td>
					</tr>
				</table>
				<div align="center"style="margin-top:20px;">
					<input type="submit"value="아이디/비밀번호 찾기">
				</div>
				<div style="height:10px"></div>
			</div>
		</form>
	</div>
</body>
</html>