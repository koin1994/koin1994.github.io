<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, java.text.*, kr.co.myshop.vo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>질문 및 답변 목록</title>
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
	List<Qna> qnaList = (ArrayList<Qna>) request.getAttribute("qnaList");
	int cnt = 0;
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
			<h2 class="title">질문 및 답변 목록</h2>
			<table class="table">
				<thead>
					<tr>
						<th>연번</th><th>제목</th><th>작성자</th><th>작성일</th>
					</tr>
				</thead>
				<tbody>
				<% for(int i=0;i<qnaList.size();i++){
					Qna vo = qnaList.get(i);
				
					SimpleDateFormat yymmdd = new SimpleDateFormat("yyyy-MM-dd");
					String date = yymmdd.format(vo.getResDate());
				%>
				<tr>
					<td>
						<%
							if(vo.getLev()==0) {
								cnt++;
								out.println("<span>"+cnt+"</span>");
							}
						%>
					</td>
					<td>
					<% 
						if(vo.getLev()==0) {
							if(vo.getSec().equals("Y")) {
								if(sid.equals(vo.getAuthor()) || sid.equals("admin")){
					%>
									<a href="<%=request.getContextPath() %>/GetQnaDetailCtrl?no=<%=vo.getNo() %>"><%=vo.getTitle() %></a>
					<%
								} else {
					%>	
									<span><%=vo.getTitle() %></span>
					<%
								}
							} else if(vo.getSec().equals("N") && sid!="guest"){
					%>	
									<a href="<%=request.getContextPath() %>/GetQnaDetailCtrl?no=<%=vo.getNo() %>"><%=vo.getTitle() %></a>
					<%
							} else {
					%>	
									<span><%=vo.getTitle() %></span>
					<%
							}
					%>
					<% 
						} else {
							if(vo.getSec().equals("Y")) {
								if(sid.equals(vo.getAuthor()) || sid.equals("admin")){
					%>
									<a href="<%=request.getContextPath() %>/GetQnaDetailCtrl?no=<%=vo.getNo() %>"><%=vo.getTitle() %></a>
					<%
								} else {
					%>
									<span style="padding-left:60px;"><%=vo.getTitle() %></span>				
					<%
								}		
							} else if(vo.getSec().equals("N") && sid!="guest"){
					%>
								<a href="<%=request.getContextPath() %>/GetQnaDetailCtrl?no=<%=vo.getNo() %>" style="padding-left:60px;"><%=vo.getTitle() %></a>						
					<%
							} else {
					%>
						 		<span style="padding-left:60px;"><%=vo.getTitle() %></span>
					<%
							}
						} 
					%>
					</td>
					<td><%=vo.getAuthor() %></td>
					<td><%=date %></td>
				</tr>
				<% } %>	
				</tbody>
			</table>
			<% if(sid!=null || sid.equals("admin")) { %>
			<div class="btn-group">
				<a href="<%=request.getContextPath() %>/qna/qnaWrite.jsp" class="btn btn-danger">글 등록</a>
			</div>
			<% } %>
		</main>
	</div>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>