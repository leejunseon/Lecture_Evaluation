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
<title> �¶��� ������ </title>
<style>
	ul.h { list-style-type: none; margin: 0; padding: 0; width: 100%; overflow: hidden; background-color: DeepSkyBlue;}
	li.h { float: left; box-shadow: 0 0 0 1px black inset; width: 25%;}
	li.h a.h { display: block; color: white; text-align: center; padding: 14px 16px; text-decoration: none;}
	li.h a.h:hover:not(.active) { background-color: midnightblue; }
	.active { background-color: midnightblue; /*border-bottom: 2px solid #f00;*/}
	#insidecontent{ background-color: lightgrey; }
</style>
</head>
<body>
	<h1><a href="main.jsp" style="text-decoration:none;"><font face="���� ���" color="royalblue" >�¶��� ������</font></a></h1>
	<div id="navi">
		<ul class="h">
		<li class="h"><a class="h" href="login.jsp">�α���</a></li>
		<li class="h"><a class="h active" href="signup.jsp">ȸ������</a></li>
		<li class="h"><a class="h" href="addEvaluation.jsp">������ ���</a></li>
		<li class="h"><a class="h" href="searchEvaluation.jsp">������ ��ȸ</a></li>
		</ul>
	</div>
	<div id="insidecontent">
		<form action="javascript:signup()">
			�̸���:<input type="text" id="Email"/><br>
			��й�ȣ:<input type="text" id="Passwd"/><br>
			�̸�:<input type="text" id="Name"/><br>
			���б�:<input type="text" id="University"/><br>
			����:<input type="text" id="Major"/><br>
			<input type="submit">
		</form>
	</div>
</body>
</html>