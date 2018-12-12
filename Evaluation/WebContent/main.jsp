<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="https://code.jquery.com/jquery-3.0.0.min.js?ver=7"></script>
<link href="http://13.209.161.83:8080/Evaluation/CSS/commonStyle.css?ver=7" rel="stylesheet" type="text/css">
<script>
	var memberN;
	var evaluationN;
	var universityN;
	
	$(document).ready(function() {
		getNumbers();	
		$('#insidecontent').css('height', $(window).height ()-150);
	});
	
	function getNumbers(){
		$.ajax({  
		    type: "POST",  
		    url: "getNumbers",  
		   	datatype:"json",
		    success: function(data){  
		    	memberN=data.member;
		    	$("#member").append(memberN);
		    	evaluationN=data.evaluation;
		    	$("#evaluation").append(evaluationN);
		    	universityN=data.university;
		    	$("#university").append(universityN);
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
		});	}

</script>
<title> 온라인 강의평가 </title>
</head>
<body>
	<h1><a href="main.jsp" style="text-decoration:none;"><font face="맑은 고딕" color="royalblue" >온라인 강의평가</font></a></h1>
	<div id="navi">
		<ul class="h">
		<li class="h"><a class="h" href="login.jsp">로그인</a></li>
		<li class="h"><a class="h" href="signup.jsp">회원가입</a></li>
		<li class="h"><a class="h" href="addEvaluation.jsp">강의평가 등록</a></li>
		<li class="h"><a class="h" href="searchEvaluation.jsp">강의평가 조회</a></li>
		<li class="h"><a class="h" href="javascript:logout();">로그아웃</a></li>
		</ul>
	</div>
	<div id="insidecontent">
		<div id="edge"></div>
		<div id="table" align="center">
			<table style="border-spacing:0 10px;">
				<tr>
					<td align="center">회원  <span id="member"></span>명</td>
				</tr>
				<tr>
					<td align="center">등록된 강의평가  <span id="evaluation"></span>건</td>
				</tr>
				<tr>
					<td align="center">등록된 학교 <span id="university"></span>개</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>