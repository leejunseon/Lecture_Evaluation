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
<title>Insert title here</title>
</head>
<body>
	ȸ�� : <div id="member"></div>
	��ϵ� ������ : <div id="evaluation"></div>
	��ϵ� �б� : <div id="university"></div>
</body>
</html>