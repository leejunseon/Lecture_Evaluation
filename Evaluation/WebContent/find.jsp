<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.0.0.min.js?ver=1"></script>
<script>
function find(){
	var email=$("#email").val();
	if(email==""){
    	alert("�̸����� �Է��ϼ���");
	}else{
		$.ajax({  
		    type: "GET",  
		    url: "find",  
		    data: "Email="+email,
		   	datatype:"json",
		    success: function(data){  
		    
		    },
		    error : function(request,status,error) {  
		    	alert("code:"+request.status+"\n"+"error:"+error);
		    }
		});  
	}	
}
</script>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="javascript:find()">
		�̸����� �Է��ϼ���<input type="text"id="email"><br>
		<input type="submit"value="���̵�/��й�ȣ ã��">
	</form>
</body>
</html>