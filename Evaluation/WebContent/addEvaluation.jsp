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
		getLoginInfo();	
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
	
	function addEvaluation(){
		var lecture=$('#lecture').val();
		var professor=$('#professor').val();
		var grade=$(":input:radio[name=grade]:checked").val();
		var interest=$(":input:radio[name=interest]:checked").val();
		var clarity=$(":input:radio[name=clarity]:checked").val();
		var kindness=$(":input:radio[name=kindness]:checked").val();
		var recommendationYN=$(":input:radio[name=RecommendationYN]:checked").val();
		var comment=$('#comment').val();
		var Name = "<%=session.getAttribute("Name") %>"
		
		$.ajax({  
		    type: "POST",  
		    url: "addEvaluation",  
		    data: "lecture="+lecture+
		    "&professor="+professor+
		   	"&grade="+grade+
		   	"&interest="+interest+
		   	"&clarity="+clarity+
		   	"&interest="+interest+
		   	"&kindness="+kindness+
		   	"&recommendationYN="+recommendationYN+
		   	"&comment="+comment+
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
		<li class="h"><a class="h active" href="addEvaluation.jsp">강의평가 등록</a></li>
		<li class="h"><a class="h" href="searchEvaluation.jsp">강의평가 조회</a></li>
		<li class="h"><a class="h" href="javascript:logout();">로그아웃</a></li>
		</ul>
	</div>
	<div id="insidecontent">
	<div id="edge"></div>
		<form action="javascript:addEvaluation()">
			<div id="table"align="center"style="width:60%;margin-left:20%;margin-top:0px;">
				<table style="border-spacing:0 10px;">
					<tr>
						<td>강의명 : </td><td><input type="text"id="lecture"></td>
					</tr>
					<tr>
						<td>교수명 : </td><td><input type="text"id="professor"></td>
					</tr>
					<tr>
						<td>성적 : </td>
						<td> 
						<input type="radio"name="grade"value="1">낮게 줌
						<input type="radio"name="grade"value="2">낮게 주는 편
						<input type="radio"name="grade"value="3">보통
						<input type="radio"name="grade"value="4">높게 주는 편
						<input type="radio"name="grade"value="5">높게 줌
						</td>
					</tr>
					<tr>
						<td>흥미 : </td>
						<td> 
						<input type="radio"name="interest"value="1">매우 지루함
						<input type="radio"name="interest"value="2">약간 지루함
						<input type="radio"name="interest"value="3">보통
						<input type="radio"name="interest"value="4">약간 재미있음
						<input type="radio"name="interest"value="5">매우 재미있음
						</td>
					</tr>
					<tr>
						<td>강의 명확성 : </td>
						<td> 
						<input type="radio"name="clarity"value="1">아주 어려움
						<input type="radio"name="clarity"value="2">약간 어려움
						<input type="radio"name="clarity"value="3">보통
						<input type="radio"name="clarity"value="4">명확한 편
						<input type="radio"name="clarity"value="5">매우 친절함
						</td>
					</tr>
					<tr>
						<td>친절함 :</td>
						<td> 
						<input type="radio"name="kindness"value="1">전혀 아님
						<input type="radio"name="kindness"value="2">약간 어려움
						<input type="radio"name="kindness"value="3">보통
						<input type="radio"name="kindness"value="4">명확한 편
						<input type="radio"name="kindness"value="5">매우 친절함
						</td>
					</tr>
					<tr>
						<td>추천/비추천</td>
						<td>
						<input type="radio"name="RecommendationYN"value="1">추천해요
						<input type="radio"name="RecommendationYN"value="2">비추천이요
						<input type="radio"name="RecommendationYN"value="3">글쎄요
						</td>
					</tr>
					<tr>
						<td>강평 :</td>
						<td><input type="text"id="comment" style="height:100px;width:100%;"></td>
					</tr>
				</table>
				<div align="center">
					<input type="submit"value="강의평가 쓰기">
				</div>
				<div style="height:10px"></div>
			</div>
		</form>
	</div>
</body>
</html>