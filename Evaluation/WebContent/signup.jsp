<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script src="https://code.jquery.com/jquery-3.0.0.min.js?ver=1"></script>
<script>
function signup(){
	var Email = $('#Email').val();
	var Passwd = $('#Passwd').val();
	var Name = $('#Name').val();
	var University = $('#University').val();
	var Major = $('#Major').val();
	
	$.ajax({  
	    type: "GET",  
	    url: "signup",  
	    data: "Email="+Email+
	    "&Passwd="+Passwd+
	   	"&Name="+Name+
	   	"&University="+University+
	   	"&Major="+Major,
	   	datatype:"json",
	    success: function(data){  
	    	if(data.result=="success"){
	    		alert("ȸ�������� �Ϸ�Ǿ����ϴ�.");
	    		location.href="login.jsp";
	    	}else{
	    		alert("�̸����� �ߺ��˴ϴ�. �ٸ� �̸����� ����Ͻʽÿ�.");
	    	}
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
	<form action="javascript:signup()">
		�̸���:<input type="text" id="Email"/><br>
		��й�ȣ:<input type="text" id="Passwd"/><br>
		�̸�:<input type="text" id="Name"/><br>
		���б�:<input type="text" id="University"/><br>
		����:<input type="text" id="Major"/><br>
		<input type="submit">
	</form>
</body>
</html>