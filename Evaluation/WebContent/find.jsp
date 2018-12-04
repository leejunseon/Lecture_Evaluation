<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="https://code.jquery.com/jquery-3.0.0.min.js?ver=1"></script>
<script>
function find(){
	var email=$("#email").val();
	if(email==""){
    	alert("이메일을 입력하세요");
	}else{
		$.ajax({  
		    type: "GET",  
		    url: "find",  
		    data: "Email="+email,
		   	datatype:"json",
		    success: function(data){  
		    	var Name=data.Name;
		    	var Passwd=data.Passwd;
		    	alert(Name+" 님의 패스워드는 "+Passwd+"입니다.");
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
		이메일을 입력하세요<input type="text"id="email"><br>
		<input type="submit"value="아이디/비밀번호 찾기">
	</form>
</body>
</html>