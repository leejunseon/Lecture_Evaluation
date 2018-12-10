<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="https://code.jquery.com/jquery-3.0.0.min.js?ver=1"></script>
<link href="http://localhost:8080/Evaluation/CSS/commonStyle.css" rel="stylesheet" type="text/css">
<script>
function addEvaluation(){
	var lecture=$('#lecture').val();
	var professor=$('#professor').val();
	var grade=$(":input:radio[name=grade]:checked").val();
	var interest=$(":input:radio[name=interest]:checked").val();
	var clarity=$(":input:radio[name=clarity]:checked").val();
	var kindness=$(":input:radio[name=kindness]:checked").val();
	var recommendationYN=$(":input:radio[name=RecommendationYN]:checked").val();
	var Name = "<%=session.getAttribute("Name") %>"
	
	$.ajax({  
	    type: "GET",  
	    url: "addEvaluation",  
	    data: "lecture="+lecture+
	    "&professor="+professor+
	   	"&grade="+grade+
	   	"&interest="+interest+
	   	"&clarity="+clarity+
	   	"&interest="+interest+
	   	"&kindness="+kindness+
	   	"&recommendationYN="+recommendationYN+
	   	"&Name="+Name,
	   	datatype:"json",
	    success: function(data){  
	    	if(data.result=="success"){
	    		alert("등록이 완료되었습니다.");
	    		location.href="main.jsp";
	    	}else{
	    		alert("모든 항목을 입력하셔야 합니다.");
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
		<li class="h"><a class="h" href="signup.jsp">회원가입</a></li>
		<li class="h"><a class="h active" href="addEvaluation.jsp">강의평가 등록</a></li>
		<li class="h"><a class="h" href="searchEvaluation.jsp">강의평가 조회</a></li>
		</ul>
	</div>
	<div id="insidecontent">
		<form action="javascript:addEvaluation()">
			강의명 : <input type="text"id="lecture"><br>
			교수명 : <input type="text"id="professor"><br>
			성적 : 
			<input type="radio"name="grade"value="1">낮게 줌
			<input type="radio"name="grade"value="2">낮게 줌
			<input type="radio"name="grade"value="3">낮게 줌
			<input type="radio"name="grade"value="4">낮게 줌
			<input type="radio"name="grade"value="5">낮게 줌
			<br>
			흥미 : 
			<input type="radio"name="interest"value="1">매우 지루함
			<input type="radio"name="interest"value="2">약간 지루함
			<input type="radio"name="interest"value="3">보통
			<input type="radio"name="interest"value="4">약간 재미있음
			<input type="radio"name="interest"value="5">매우 재미있음
			<br>
			강의 명확성 : 
			<input type="radio"name="clarity"value="1">아주 어려움
			<input type="radio"name="clarity"value="2">약간 어려움
			<input type="radio"name="clarity"value="3">보통
			<input type="radio"name="clarity"value="4">명확한 편
			<input type="radio"name="clarity"value="5">매우 친절함
			<br>
			친절함 : 
			<input type="radio"name="kindness"value="1">전혀 아님
			<input type="radio"name="kindness"value="2">약간 어려움
			<input type="radio"name="kindness"value="3">보통
			<input type="radio"name="kindness"value="4">명확한 편
			<input type="radio"name="kindness"value="5">매우 친절함
			<br>
			추천/비추천
			<input type="radio"name="RecommendationYN"value="1">추천해요
			<input type="radio"name="RecommendationYN"value="2">비추천이요
			<input type="radio"name="RecommendationYN"value="3">글쎄요
			<br>
			<input type="submit"value="강의평가 쓰기">
		</form>
	</div>
</body>
</html>