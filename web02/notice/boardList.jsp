<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, kr.co.myshop.vo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>공지사항 목록</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="common.css">
<style>
.title { padding-top:36px; padding-bottom:20px; }
</style>
</head>
<body>
<%@ include file="../header.jsp" %>
<%
	List<Notice> notiList = (ArrayList<Notice>) request.getAttribute("notiList");
%>
<div class="container-fluid" id="content">
	<div class="row" id="content_row">
		<% if(sid!=null && sid.equals("admin")) { %>
		<%@ include file="../admin/admin_sidebar.jsp" %>
		<% } %>
		<% if(sid!=null && sid.equals("admin")) { %>
		<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
		<% } else { %>
		<main class="content container">
		<% } %>
			<h2 class="title">공지사항 목록</h2>
			<table class="table">
				<thead>
					<tr>
						<th>연번</th><th>제목</th><th>작성일</th>
					</tr>
				</thead>
				<tbody>
				<% for(int i=0;i<notiList.size();i++){
					Notice vo = notiList.get(i);
				%>
				<tr>
					<td><%=notiList.size()-i %></td>
					<td><a href="<%=request.getContextPath() %>/GetBoardDetailCtrl?notiNo=<%=vo.getNotiNo() %>"><%=vo.getTitle() %></a></td>
					<td><%=vo.getResDate() %></td>
				</tr>
				<% } %>	
				</tbody>
			</table>
			<% if(sid!=null && sid.equals("admin")) { %>
			<div class="btn-group">
				<a href="<%=request.getContextPath() %>/notice/insertBoard.jsp" class="btn btn-danger">글 등록</a>
			</div>
			<% } %>
		</main>
	</div>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>