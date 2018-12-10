<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script src="https://code.jquery.com/jquery-3.0.0.min.js?ver=1"></script>
<script>
	var memberN;
	var evaluationN;
	var universityN;
	
	$(document).ready(function() {
		getNumbers();	
	});
	
	function getNumbers(){
		$.ajax({  
		    type: "GET",  
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

</script>
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
		<li class="h"><a class="h" href="login.jsp">로그인</a></li>
		<li class="h"><a class="h" href="signup.jsp">회원가입</a></li>
		<li class="h"><a class="h" href="addEvaluation.jsp">강의평가 등록</a></li>
		<li class="h"><a class="h" href="searchEvaluation.jsp">강의평가 조회</a></li>
		</ul>
	</div>
	<div id="insidecontent">
		회원 : <div id="member"></div>
		등록된 강의평가 : <div id="evaluation"></div>
		등록된 학교 : <div id="university"></div>
	</div>
</body>
</html>