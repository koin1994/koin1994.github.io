<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, kr.co.myshop.vo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>로그인</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="../common.css">

<style>
.title { padding-top:36px; padding-bottom:20px; }

</style>
</head>
<body>
<%@ include file="../header.jsp" %>
<div class="content container-sm" id="content" >
	<h2 class="title">로그인</h2>
	<form name="frm1" id="frm1" action="<%=request.getContextPath() %>/CustomLoginCtrl" method="post" >
		<table class="table">
			<tbody>
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="cusId" id="cusId" placeholder="아이디 입력" class="d-inline-flex p-2"" autofocus required  />
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="cusPw" id="cusPw" placeholder="비밀번호 입력" class="d-inline-flex p-2"" required /></td>
				</tr>
			</tbody>
		</table>
		<div class="btn-group">
			<input type="submit" name="submit-btn" class="btn btn-secondary" style="border-radius:4em; margin-right:30px;" value="로그인">
			
			<a href="<%=request.getContextPath() %>/custom/membership.jsp" class="btn btn-secondary" style="border-radius:4em;" >회원가입</a>
		</div>
	</form>	
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>