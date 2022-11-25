<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, kr.co.myshop.vo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>공지사항 등록</title>
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
<%
	Notice vo = (Notice) request.getAttribute("notice");
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
			<h2 class="title">공지사항 등록</h2>
			<form name="frm1" id="frm1" action="<%=request.getContextPath() %>/InsertBoardProCtrl" method="post">
				<table class="table">
					<tbody>
						<tr>
							<th>제목</th>
							<td><input type="text" name="title" id="title" placeholder="제목 입력" class="form-control" autofocus required /></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea cols="80" rows="6" name="content" id="content" class="form-control" required></textarea></td>
						</tr>
						<tr>
							<th>작성자</th>
							<td><input type="text" name="author" id="author" value="admin" class="form-control" readonly></td>
						</tr>
					</tbody>
				</table>
				<div class="btn-group">
					<input type="submit" name="submit-btn" class="btn btn-info" value="글 등록">
					<input type="reset" name="reset-btn" class="btn btn-info" value="취소">
					<a href="<%=request.getContextPath() %>/GetBoardListCtrl" class="btn btn-danger">목록으로</a>
				</div>
			</form>	
		</main>
	</div>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>