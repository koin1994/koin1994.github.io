<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, kr.co.myshop.vo.*, kr.co.myshop.util.*"%>
<%
	Custom custom = (Custom) request.getAttribute("custom");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>회원 상세 정보</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="common.css">

<style>
.title { padding-top:36px; padding-bottom:20px; }
#cusPw { width:780px; float:left; margin-right:30px; margin-left:6px; }
</style>
</head>
<body>
<%@ include file="../header.jsp" %>
<div class="container-fluid" id="content">
<div class="row" id="content_row">
	<%@ include file="admin_sidebar.jsp" %>
    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
		<h2 class="title">회원 상세 정보 확인 및 수정</h2>
		<form name="frm1" id="frm1" action="<%=request.getContextPath() %>/DirectUpdateCustomCtrl" method="post">
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
						<%
/* 						String cusPw = "";
				        String key = "%02x";
						cusPw = AES256.decryptAES256(custom.getCusPw(), key); */
						%>
							<input type="text" name="cusPw" id="cusPw" placeholder="비밀번호 입력" value="<%=custom.getCusPw() %>" class="form-control" readonly /><button type="button" class="btn btn-primary" onclick="defaultPass()">비밀번호 초기화</button>
							<input type="hidden" name="changePw" id="changePw" value="no">
						</td>
					</tr>
					<tr>
						<th>고객이름</th>
						<td><input type="text" name="cusName" id="cusName" placeholder="이름 입력" class="form-control" value="<%=custom.getCusName() %>" required /></td>
					</tr>
					<tr>
						<th>주소</th>
						<td>
							<p><%=custom.getAddress() %></p>
						</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><input type="tel" name="tel" id="tel" placeholder="전화번호 입력 000-0000-0000" class="form-control" value="<%=custom.getTel() %>" required></td>
					</tr>
					<tr>
						<th>회원 포인트</th>
						<td><input type="number" name="point" id="point" class="form-control" value="<%=custom.getPoint() %>" required></td>
					</tr>
					<tr>
						<th>회원 등급</th>
						<td>
							<select name="level">
					<%
						if(custom.getLevel()==0) {
							out.println("<option value='0' selected>준회원</option>");
							out.println("<option value='1'>정회원</option>");
							out.println("<option value='2'>우수회원</option>");
							out.println("<option value='3'>VIP회원</option>");
							out.println("<option value='9'>관리자</option>");
						} else if(custom.getLevel()==1){
							out.println("<option value='0'>준회원</option>");
							out.println("<option value='1' selected>정회원</option>");
							out.println("<option value='2'>우수회원</option>");
							out.println("<option value='3'>VIP회원</option>");
							out.println("<option value='9'>관리자</option>");
						} else if(custom.getLevel()==2){
							out.println("<option value='0'>준회원</option>");
							out.println("<option value='1'>정회원</option>");
							out.println("<option value='2' selected>우수회원</option>");
							out.println("<option value='3'>VIP회원</option>");
							out.println("<option value='9'>관리자</option>");
						} else if(custom.getLevel()==3){
							out.println("<option value='0'>준회원</option>");
							out.println("<option value='1'>정회원</option>");
							out.println("<option value='2'>우수회원</option>");
							out.println("<option value='3' selected>VIP회원</option>");
							out.println("<option value='9'>관리자</option>");
						} else {
							out.println("<option value='0'>준회원</option>");
							out.println("<option value='1'>정회원</option>");
							out.println("<option value='2'>우수회원</option>");
							out.println("<option value='3'>VIP회원</option>");
							out.println("<option value='9' selected>관리자</option>");
						}
					%>					
							</select>
						</td>
					</tr>
					<tr>
						<th>방문횟수</th>
						<td><input type="number" name="visited" id="visited" class="form-control" value="<%=custom.getVisited() %>" required></td>
					</tr>
				</tbody>
			</table>
			<div class="btn-group">
				<input type="submit" name="submit-btn" class="btn btn-info" value="정보수정">
				<input type="reset" name="reset-btn" class="btn btn-info" value="취소">
			</div>
		</form>	
		<script>
		function defaultPass(){
			var tel = document.frm1.tel.value; 
			var conf = tel.substring(tel.length - 4, tel.length);
			document.frm1.cusPw.value = conf;
			document.frm1.changePw.value = "yes";
			alert("전화번호 뒷자리 4글자 : "+conf+"로 초기화 됩니다.");
		}
		</script>
    </main>
  </div>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>