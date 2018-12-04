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
<title>Insert title here</title>
</head>
<body>
	<form action="javascript:searchEvaluation()">
		<input type="text"id="search">
		<input type="submit"value="검색">
	</form>
	<div id="user"></div>
	명이 
	<div id="evaluation"></div>
	번 참여하였습니다.
	<div id="Result"></div>
</body>
</html>