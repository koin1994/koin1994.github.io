<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, kr.co.myshop.vo.*"%>
<%
	Custom custom = (Custom) request.getAttribute("custom");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>회원정보 확인 및 수정</title>
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
<div class="content container" id="content">
	<h2 class="title">회원정보 확인 및 수정</h2>
	<form name="frm1" id="frm1" action="<%=request.getContextPath() %>/UpdateCustomCtrl" method="post" onsubmit="return updateCheck(this)">
		<table class="table">
			<tbody>
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="cusId" id="cusId" placeholder="아이디 입력" class="form-control" value="<%=custom.getCusId() %>" readonly required />
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<p>비밀번호 변경시에만 입력하시기 바랍니다.</p>
						<input type="hidden" name="cusPw" id="cusPw" value="<%=custom.getCusPw() %>">
						<input type="password" name="edit_cusPw" id="edit_cusPw" placeholder="비밀번호 입력" class="form-control" />
					</td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password" name="edit_cusPw2" id="edit_cusPw2" placeholder="비밀번호 입력" class="form-control" /></td>
				</tr>
				<tr>
					<th>고객이름</th>
					<td><input type="text" name="cusName" id="cusName" placeholder="이름 입력" class="form-control" value="<%=custom.getCusName() %>" required /></td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<p><%=custom.getAddress() %></p>
						<input type="hidden" name="address" id="address">
						<p>주소 변경시에만 입력하시기 바랍니다.</p>
						<input type="text" name="editaddress1" id="editaddress1" placeholder="기본 주소 입력" class="form-control" /><br>
						<input type="text" name="editaddress2" id="editaddress2" placeholder="상세 주소 입력" class="form-control" /><br>
						<input type="text" name="editpostcode" id="editpostcode" style="width:160px;float:left;margin-right:20px;" placeholder="우편번호" class="form-control">
						<button type="button" id="post_btn" onclick="findAddr()" class="btn btn-primary">우편번호 검색</button>
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="tel" name="tel" id="tel" placeholder="전화번호 입력 000-0000-0000" class="form-control" value="<%=custom.getTel() %>" required></td>
				</tr>
				<tr>
					<th>등급</th>
					<td><%
				if(custom.getLevel()==0) {
					out.println("<span>준회원</span>");
				} else if(custom.getLevel()==1){
					out.println("<span>정회원</span>");
				} else if(custom.getLevel()==2){
					out.println("<span>우수회원</span>");
				} else if(custom.getLevel()==3){
					out.println("<span>VIP회원</span>");
				} else {
					out.println("<span>관리자</span>");
				}
				%></td>
				</tr>
				<tr>
					<th>회원 포인트</th>
					<td><%=custom.getPoint() %></td>
				</tr>
				<tr>
					<th>방문횟수</th>
					<td><%=custom.getVisited() %></td>
				</tr>
			</tbody>
		</table>
		<div class="btn-group">
			<input type="submit" name="submit-btn" class="btn btn-info" value="정보수정">
			<input type="reset" name="reset-btn" class="btn btn-info" value="취소">
		</div>
	</form>	
	<script>
	function updateCheck(f){
		if(f.edit_cusPw.value!=f.edit_cusPw2.value){
			alert("비밀번호와 비밀번호 확인이 서로 다릅니다.");
			f.edit_cusPw.focus();
			return false;
		}
	}
	</script>
	<script>
	function findAddr() {
		new daum.Postcode({
			oncomplete: function(data) {
				console.log(data);
				var roadAddr = data.roadAddress;
				var jibunAddr = data.jibunAddress;
				document.getElementById("editpostcode").value = data.zonecode;
				if(roadAddr !== '') {
					document.getElementById("editaddress1").value = roadAddr;				
				} else if(jibunAddr !== ''){
					document.getElementById("editaddress1").value = jibunAddr;
				}
			}
		}).open();
	}
	</script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>