<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="https://code.jquery.com/jquery-3.0.0.min.js?ver=7"></script>
<link href="http://13.209.161.83:8080/Evaluation/CSS/commonStyle.css?ver=7" rel="stylesheet" type="text/css">
<script>
	var userN;
	var evaluationN;

	$(document).ready(function() {
		getLoginInfo();	
		getParticipation();	
		$('#insidecontent').css('height',  $(window).height ()-150);
	});
	
	function getLoginInfo(){
		$.ajax({  
		    type: "POST",  
		    url: "loginCheck",  
		   	datatype:"json",
		    success: function(data){  
		    	if(data.result=="true"){
		    		
		    	}else{
		    		alert("로그인이 필요한 항목입니다.")
		    		location.href="login.jsp"
		    	}
		    },
		    error : function(request,status,error) {  
		    	alert("code:"+request.status+"\n"+"error:"+error);
		    }
		});  
	}
	
	function getParticipation(){
		$.ajax({  
		    type: "POST",  
		    url: "getParticipation",  
		   	datatype:"json",
		    success: function(data){  
		    	userN=data.user;
		    	evaluationN=data.evaluation;
		    	$("#user").text(userN);
		    	$("#evaluation").text(evaluationN);
		    },
		    error : function(request,status,error) {  
		    	alert("code:"+request.status+"\n"+"error:"+error);
		    }
		});
	}
	
	function searchEvaluation(){
		var search=$('#search').val();
		$.ajax({  
		    type: "POST",  
		    url: "searchEvaluation", 
		    data:"search="+search,
		   	datatype:"json",
		    success: function(data){  
		    	var num=data.length;
		    	var innerHtml="";
		    	for(var i=0;i<num;i++){
		    		innerHtml+="<table style='width:90%;'><tr><td colspan='3'><hr></td></tr><tr><td align='right'>"
			    		if(data[i].RecommendationYN==1)
			    			innerHtml+="추천!!!";
			    		else if(data[i].RecommendationYN==2)
			    			innerHtml+="비추천....";
			    		else
			    			innerHtml+="애매함..";
			    		innerHtml+="</td><td></td><td>"+data[i].University+" "+data[i].Lecture+" "+data[i].Professor+"</td></tr>";
			    		innerHtml+="<tr><td style='width:70px;'>성적</td><td style='width:100px;'>";
			    		for(var j=0;j<data[i].Grade;j++)
			    			innerHtml+="★";
			    		innerHtml+="</td><td rowspan='4'>";
			    		innerHtml+=data[i].comment+"</td></tr><tr><td>명확성</td><td>";
			    		for(var j=0;j<data[i].Clarity;j++)
			    			innerHtml+="★";
			    		innerHtml+="</td></tr><tr><td>친철함</td><td>";
			    		for(var j=0;j<data[i].Kindness;j++)
			    			innerHtml+="★";
			    		innerHtml+="</td></tr><tr><td>흥미</td><td>";
			    		for(var j=0;j<data[i].Interest;j++)
			    			innerHtml+="★";
			    		innerHtml+="</td></tr><tr><td colspan='3'><hr></td></tr></table><br>"
		    	}
		    	$("#Result").empty().append(innerHtml);
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
		<li class="h"><a class="h" href="signup.jsp">회원가입</a></li>
		<li class="h"><a class="h" href="addEvaluation.jsp">강의평가 등록</a></li>
		<li class="h"><a class="h active" href="searchEvaluation.jsp">강의평가 조회</a></li>
		<li class="h"><a class="h" href="javascript:logout();">로그아웃</a></li>
		</ul>
	</div>
	<div id="insidecontent">
	<div id="edge"></div>
		<form action="javascript:searchEvaluation()">
			<div id="table"align="center">
				<table>
					<tr>
						<td><input type="text"id="search"></td>
						<td><input type="submit"value="검색"></td>
					</tr>
					<tr style="height:10px;"></tr>
					<tr>
						<td colspan="2">
							<span id="user"></span>명이
							<span id="evaluation"></span>번 참여하였습니다.
							<hr style="width:100%;">
						</td>
					</tr>
					<tr style="height:30px;"></tr>
				</table>
				<div id="Result"></div>
			</div>
		</form> 
	</div>
</body>
</html>