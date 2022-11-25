<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, kr.co.myshop.vo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>질문 및 답변 상세보기</title>
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
	Qna vo = (Qna) request.getAttribute("qna");
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
			<h2 class="title">질문 및 답변 상세 내용</h2>
			<table class="table">
				<tbody>
					<tr>
						<th>구분</th>
						<td>
						<%
						if(vo.getLev()==0){
							out.println("<span>질문</span>");
						} else {
							out.println("<span>답변</span>");
						}
						%>
						</td>
					</tr>
					<tr>
						<th>공개여부</th>
						<td>
						<%
						if(vo.getSec().equals("Y")){
							out.println("<span>비공개</span>");
						} else {
							out.println("<span>공개</span>");
						}
						%>
						</td>
					</tr>
					<tr>
						<th>번호</th>
						<td><%=vo.getNo() %></td>
					</tr>
					<tr>
						<th>제목</th>
						<td><%=vo.getTitle() %></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><%=vo.getContent() %></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><%=vo.getAuthor() %></td>
					</tr>
					<tr>
						<th>작성일시</th>
						<td><%=vo.getResDate() %></td>
					</tr>
					<tr>
						<th>읽은 횟수</th>
						<td><%=vo.getVisited() %></td>
					</tr>
				</tbody>
			</table>
			<div class="btn-group">
				<a href="<%=request.getContextPath() %>/GetQnaListCtrl" class="btn btn-danger">목록으로</a>
				<%
					if(sid.equals("admin")) {
						if(vo.getLev()==0){
				%>
					<a href='QnaReplyWriteCtrl?parno=<%=vo.getNo() %>' class="btn btn-primary">답변 하기</a>
					<a href='UpdateQnaCtrl?no=<%=vo.getNo() %>' class="btn btn-info">글 수정</a>
					<a href='DeleteQnaCtrl?parno=<%=vo.getNo() %>' class="btn btn-danger">글 삭제</a>
				<%
						} else {
				%>
					<a href='UpdateQnaCtrl?no=<%=vo.getNo() %>' class="btn btn-info">답글 수정</a>
					<a href='DeleteQnaCtrl?no=<%=vo.getNo() %>' class="btn btn-danger">답글 삭제</a>
				<%
						}
					} else if(sid.equals(vo.getAuthor())){
				%>
					<a href='UpdateQnaCtrl?no=<%=vo.getNo() %>' class="btn btn-info">글 수정</a>
					<a href='DeleteQnaCtrl?parno=<%=vo.getNo() %>' class="btn btn-danger">글 삭제</a>
				<%		
					} else {
				%>
					<p style="clear:both">글 작성자가 아닙니다.</p>
				<%
					}
				%>
			</div>
		</main>
	</main>		
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>