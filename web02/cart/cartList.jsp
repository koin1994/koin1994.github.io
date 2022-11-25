<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, kr.co.myshop.vo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>장바구니 목록</title>
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
	List<CartListVO> cartList = (ArrayList<CartListVO>) request.getAttribute("cartList");
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
						<th>연번</th><th>제품명</th><th>제품사진</th><th>구매</th>
					</tr>
				</thead>
				<tbody>
				<% if(cartList.size()!=0) { %>
					<% for(int i=0;i<cartList.size();i++){
						CartListVO vo = cartList.get(i);
					%>
					<tr>
						<td><%=cartList.size()-i %></td>
						<td><%=vo.getProName() %> (구매가격 : <%=vo.getProPrice() %>)</td>
						<td><img src="upload/<%=vo.getProPic() %>" alt="<%=vo.getProName() %>" style="max-height:80px; width:auto;"></td>
						<td><a href="<%=request.getContextPath() %>/CartToSaleCtrl?proNo=<%=vo.getProNo() %>&cartNo=<%=vo.getCartNo() %>" class="btn btn-primary">구매하기</a></td>
					</tr>
					<% } %>
				<% } else { %>
					<tr><td colspan="4">장바구니에 담긴 데이터가 없습니다.</td></tr>
				<% } %>		
				</tbody>
			</table>
		</main>
	</div>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>