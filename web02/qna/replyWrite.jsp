<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, kr.co.myshop.vo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>답변 쓰기</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="common.css">
<style>
.title { padding-top:36px; padding-bottom:20px; }
</style>
</head>
<body>
<%
	Qna qna = (Qna) request.getAttribute("qna");
%>
<%@ include file="../header.jsp" %>
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
			<h2 class="title">답변 쓰기</h2>
			<form name="frm1" id="frm1" action="<%=request.getContextPath() %>/QnaReplyWriteProCtrl" method="post">
				<table class="table">
					<tbody>
						<tr>
							<th>문의 제목</th>
							<td><%=qna.getTitle() %></td>
						</tr>
						<tr>
							<th><label for="title">답변 제목</label></th>
							<td><input type="text" name="title" id="title" placeholder="제목 입력" class="form-control" required></td>
						</tr>
						<tr>
							<th><label for="content">답변 내용</label></th>
							<td>
								<textarea cols="100" rows="6" name="content" id="content" class="form-control"></textarea>
							</td>
						</tr>
						<tr>
							<th><label for="author">작성자</label></th>
							<td>
								<input type="text" name="author" id="author" class="form-control" value='admin' readonly required>
								<input type="hidden" name="lev" id="lev" value="1">
								<input type="hidden" name="parno" id="parno" value='<%=qna.getNo() %>'>
							</td>
						</tr>
						<tr>
							<th><label for="sec1">비밀글 여부</label></th>
							<td>
								<input type="radio" name="sec" id="sec1" value="N" checked>
								<label for="">공개</label>
								<input type="radio" name="sec" id="sec2" value="Y">
								<label for="">비밀글</label>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="btn-group">
					<button type="submit" class="btn btn-primary">답글 쓰기</button>
					<a href="<%=request.getContextPath() %>/GetQnaListCtrl" class="btn btn-info">목록으로</a>
				</div>
			</form>
		</main>
	</div>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>