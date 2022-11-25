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
#content_row { min-height:calc(100vh - 84px); }
</style>
</head>
<body>
<%
	List<Custom> cusList = (ArrayList<Custom>) request.getAttribute("cusList");
%>
<%@ include file="../header.jsp" %>
<div class="container-fluid" id="content">
<div class="row" id="content_row">
    <%@ include file="admin_sidebar.jsp" %>
    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
		<h2 class="title">공지사항 목록</h2>
		<table class="table">
			<thead>
				<tr>
					<th>연번</th><th>아이디</th><th>이름</th><th>가입일</th><th>회원등급</th>
				</tr>
			</thead>
			<tbody>
			<% for(int i=0;i<cusList.size();i++){
				Custom vo = cusList.get(i);
			%>
			<tr>
				<td><%=cusList.size()-i %></td>
				<td><a href="<%=request.getContextPath() %>/GetCustomDetailCtrl?cusId=<%=vo.getCusId() %>"><%=vo.getCusId() %></a></td>
				<td><%=vo.getCusName() %></td>
				<td><%=vo.getRegDate() %></td>
				<td><%
				if(vo.getLevel()==0) {
					out.println("<span>준회원</span>");
				} else if(vo.getLevel()==1){
					out.println("<span>정회원</span>");
				} else if(vo.getLevel()==2){
					out.println("<span>우수회원</span>");
				} else if(vo.getLevel()==3){
					out.println("<span>VIP회원</span>");
				} else {
					out.println("<span>관리자</span>");
				}
				%></td>
			</tr>
			<% } %>	
			</tbody>
		</table>
    </main>
  </div>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>