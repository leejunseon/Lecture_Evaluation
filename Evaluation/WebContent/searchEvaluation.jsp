<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="https://code.jquery.com/jquery-3.0.0.min.js?ver=1"></script>
<script>
	var userN;
	var evaluationN;

	$(document).ready(function() {
		getParticipation();	
	});
	
	function getParticipation(){
		$.ajax({  
		    type: "GET",  
		    url: "getParticipation",  
		   	datatype:"json",
		    success: function(data){  
		    	userN=data.user;
		    	evaluationN=data.evaluation;
		    	$("#user").append(userN);
		    	$("#evaluation").append(evaluationN);
		    },
		    error : function(request,status,error) {  
		    	alert("code:"+request.status+"\n"+"error:"+error);
		    }
		});
	}
	
	function searchEvaluation(){
		var search=$('#search').val();
		$.ajax({  
		    type: "GET",  
		    url: "searchEvaluation", 
		    data:"search="+search,
		   	datatype:"json",
		    success: function(data){  
		    	var num=data.length;
		    	var innerHtml="";
		    	for(var i=0;i<num;i++){
		    		innerHtml+=data[i].Lecture+" ";
		    		innerHtml+=data[i].Professor+" ";
		    		innerHtml+=data[i].Grade+" ";
		    		innerHtml+=data[i].Interest+" ";
		    		innerHtml+=data[i].Clarity+" ";
		    		innerHtml+=data[i].Kindness+" ";
		    		innerHtml+=data[i].RecommendationYN+"<br>";
		    	}
		    	$("#Result").empty().append(innerHtml);
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
		<li class="h"><a class="h active" href="searchEvaluation.jsp">강의평가 조회</a></li>
		</ul>
	</div>
	<div id="insidecontent">
		<form action="javascript:searchEvaluation()">
			<input type="text"id="search">
			<input type="submit"value="검색">
		</form>
		<div id="user"></div> 명이
		<div id="evaluation"></div>	번 참여하였습니다.
		<div id="Result"></div>
	</div>
</body>
</html>