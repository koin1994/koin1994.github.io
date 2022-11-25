<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, kr.co.myshop.vo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>배송 정보 수정</title>
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
	Parsel pro = (Parsel) request.getAttribute("parsel");
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
			<h2 class="title">배송 정보 수정</h2>
			<form name="frm1" id="frm1" action="<%=request.getContextPath() %>/UpdateSalesProCtrl" method="post">
				<table class="table">
					<tbody>
						<tr>
							<th>배송지 주소</th>
							<td>
								<input type="hidden" name="parselNo" id="parselNo" value="<%=pro.getParselNo() %>"><br>
								<p><%=pro.getParselAddr() %></p>
								<input type="hidden" name="parselAddr" id="parselAddr" value="<%=pro.getParselAddr() %>"><br>
								변경할 주소 :<br>
								<input type="text" name="address1" id="address1" placeholder="기본 주소 입력" class="form-control" /><br>
								<input type="text" name="address2" id="address2" placeholder="상세 주소 입력" class="form-control" /><br>
								<input type="text" name="postcode" id="postcode" style="width:160px;float:left;margin-right:20px;" placeholder="우편번호" class="form-control">
								<button type="button" id="post_btn" onclick="findAddr()" class="btn btn-primary" style="margin-bottom:36px;">우편번호 검색</button>
							</td>
						</tr>
						<tr>
							<th>연락처</th>
							<td>
								<input type="tel" name="cusTel" id="cusTel" placeholder="상품명 입력" class="form-control" value="<%=pro.getCusTel() %>" required />
							</td>
						</tr>
					</tbody>
				</table>
				<div class="btn-group">
					<input type="submit" name="submit-btn" class="btn btn-info" value="배송 정보 변경">
					<input type="reset" name="reset-btn" class="btn btn-info" value="취소">
					<a href="<%=request.getContextPath() %>/GetMemberSalesInfoCtrl" class="btn btn-danger">목록으로</a>
				</div>
			</form>	
			<script>
			function findAddr() {
				new daum.Postcode({
					oncomplete: function(data) {
						console.log(data);
						var roadAddr = data.roadAddress;
						var jibunAddr = data.jibunAddress;
						document.getElementById("postcode").value = data.zonecode;
						if(roadAddr !== '') {
							document.getElementById("address1").value = roadAddr;				
						} else if(jibunAddr !== ''){
							document.getElementById("address1").value = jibunAddr;
						}
						document.getElementById("address2").focus();
					}
				}).open();
			}
			</script>
			<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		</main>
	</div>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>