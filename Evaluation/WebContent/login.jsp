<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="https://code.jquery.com/jquery-3.0.0.min.js?ver=1"></script>
<script>
	function login(){
		var Email=$('#Email').val();
		var Passwd=$('#Passwd').val();
		var Name;
		
		$.ajax({  
		    type: "GET",  
		    url: "login",  
		    data: "Email="+Email+
		    "&Passwd="+Passwd,
		   	datatype:"json",
		    success: function(data){  
		    	if(data.result=="success"){
		    		Name=data.Name;
		    		alert(Name+"님 환영합니다.");
		    		location.href="main.jsp";
		    	}else{
		    		alert("이메일 혹은 비밀번호를 확인하십시오.");
		    	}
		    },
		    error : function(request,status,error) {  
		    	alert("code:"+request.status+"\n"+"error:"+error);
		    }
		});  
	}
</script>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="javascript:login()">
		이메일:<input type="text" id="Email"/><br>
		비밀번호:<input type="text" id="Passwd"/><br>
		<input type="submit"value="로그인">
	</form>
	
	<input type="button" value="회원가입" onclick="location. href='signup.jsp'"/>
</body>
</html>