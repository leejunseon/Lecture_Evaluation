<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script src="https://code.jquery.com/jquery-3.0.0.min.js?ver=1"></script>
<link href="http://localhost:8080/Evaluation/CSS/commonStyle.css" rel="stylesheet" type="text/css">
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
<title> �¶��� ������ </title>
</head>
<body>
	<h1><a href="main.jsp" style="text-decoration:none;"><font face="���� ���" color="royalblue" >�¶��� ������</font></a></h1>
	<div id="navi">
		<ul class="h">
		<li class="h"><a class="h" href="login.jsp">�α���</a></li>
		<li class="h"><a class="h" href="signup.jsp">ȸ������</a></li>
		<li class="h"><a class="h" href="addEvaluation.jsp">������ ���</a></li>
		<li class="h"><a class="h" href="searchEvaluation.jsp">������ ��ȸ</a></li>
		</ul>
	</div>
	<div id="insidecontent">
		ȸ�� : <div id="member"></div>
		��ϵ� ������ : <div id="evaluation"></div>
		��ϵ� �б� : <div id="university"></div>
	</div>
</body>
</html>