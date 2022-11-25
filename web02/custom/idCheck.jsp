<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String cusId = request.getParameter("cusId");
	if(cusId==null || cusId=="") cusId="";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 확인</title>
</head>
<body>
<div class="wrap">
	<h3>아이디 중복 확인</h3>
	<form action="../IdCheckCtrl" method="post" onsubmit="return invalidCheck(this)">
		<label for="cusId">아이디</label>
		<input type="text" name="cusId" id="cusId" placeholder="아이디 입력" value="<%=cusId %>" />
		<input type="submit" value="중복확인"> 
	</form>
	<script>
	function invalidCheck(f) {
		var cusId= f.cusId.value;
		cusId = cusId.trim();
		if(cusId.length<5){
			alert("아이디는 글자수가 5자 이상 이어야 합니다.");
			return false;
		}
	}
	</script>
</div>
</body>
</html>