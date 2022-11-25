<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, kr.co.myshop.vo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>배송 처리</title>
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
			<h2 class="title">배송 정보 등록 및 수정</h2>
			<form name="frm1" id="frm1" action="<%=request.getContextPath() %>/UpdateParselProCtrl" method="post" onsubmit="return postCheck(this)">
				<table class="table">
					<tbody>
						<tr>
							<th style="max-width:200px;width:200px;">배송 코드</th>
							<td>
								<p><%=pro.getParselNo() %></p>
								<input type="hidden" name="parselNo" id="parselNo" value="<%=pro.getParselNo() %>">
							</td>
						</tr>
						<tr>
							<th>배송 업체 선택</th>
							<td>
								<% if(pro.getParselState()!=0) { %>
								<p><%=pro.getParselCompany() %></p>
								<% } %>
								<select name="parselCompany" id="parselCompany" placeholder="배송업체 선택" class="form-control" required>
									<option value="CJ대한통운">CJ대한통운</option>
									<option value="롯데택배">롯데택배</option>
									<option value="우체국택배">우체국택배</option>
									<option value="로젠택배">로젠택배</option>
									<option value="한진택배">한진택배</option>
									<option value="CU 편의점택배">CU 편의점택배</option>
									<option value="EMS 택배">EMS 택배</option>
									<option value="경동택배">경동택배</option>
								</select>
								
							</td>
						</tr>
						<tr>
							<th>화물 코드</th>
							<td>
								<% if(pro.getParselState()!=0) { %>
								<input type="text" name="baleCode" id="baleCode" placeholder="배송회사의 화물코드를 숫자만 입력" class="form-control" value="<%=pro.getBaleCode() %>" required />
								<% } else { %>
								<input type="text" name="baleCode" id="baleCode" placeholder="배송회사의 화물코드를 숫자만 입력" class="form-control" required />
								<% } %>								
							</td>
						</tr>
						<tr>
							<th>배송 기사 연락처</th>
							<td>
								<% if(pro.getParselState()!=0) { %>
								<input type="text" name="parselTel" id="parselTel" placeholder="배송회사의 화물코드를 숫자만 입력" class="form-control" value="<%=pro.getParselTel() %>" required />
								<% } else { %>
								<input type="tel" name="parselTel" id="parselTel" placeholder="배송기사 연락처 입력" class="form-control" required />
								<% } %>
							</td>
						</tr>
						<tr>
							<th>배송상태</th>
							<td>
								<% if(pro.getParselState()==0) { %>
								<p value="0">현재 상태 : <strong>배송전</strong></p>
								<% } else if(pro.getParselState()==1) { %>
								<p value="1">현재 상태 : <strong>배송중</strong></p>
								<% } else if(pro.getParselState()==2) { %>
								<p value="2">현재 상태 : <strong>도착</strong></p>
								<% } else if(pro.getParselState()==3) { %>
								<p value="3">현재 상태 : <strong>구매결정 완료</strong></p>
								<% } else { %>
								<p value="4">현재 상태 : <strong>점검중</strong></p>
								<% } %>
								<select name="parselState" id="parselState" class="form-control">
									<option value="0">배송전</option>
									<option value="1">배송중</option>
									<option value="2">도착</option>
									<option value="3">구매결정 완료</option>
									<option value="4">점검중</option>
								</select>
								<% if(pro.getParselState()!=0) { 
									if(pro.getParselCompany()=="CJ대한통운") {
								%>
									<p><a href="http://nplus.doortodoor.co.kr/web/detail.jsp?slipno=<%=pro.getBaleCode() %>">배송 추적</a></p>
									<% } else if(pro.getParselCompany()=="롯데택배") { %>	
									<p><a href="https://www.lotteglogis.com/mobile/reservation/tracking/linkView?InvNo=<%=pro.getBaleCode() %>">배송 추적</a></p>
									<% } else if(pro.getParselCompany()=="우체국택배") { %>	
									<p><a href="http://service.epost.go.kr/trace.RetrieveRegiPrclDeliv.postal?sid1=<%=pro.getBaleCode() %>">배송 추적</a></p>
									<% } else if(pro.getParselCompany()=="로젠택배") { %>	
									<p><a href="https://www.ilogen.com/m/personal/trace/<%=pro.getBaleCode() %>">배송 추적</a></p>
									<% } else if(pro.getParselCompany()=="한진택배") { %>	
									<p><a href="https://www.hanjin.co.kr/kor/CMS/DeliveryMgr/WaybillResult.do?mCode=MN038&schLang=KR&wblnumText2=<%=pro.getBaleCode() %>">배송 추적</a></p>
									<% } else if(pro.getParselCompany()=="CU 편의점택배") { %>	
									<p><a href="https://www.cupost.co.kr/postbox/delivery/localResult.cupost?invoice_no<%=pro.getBaleCode() %>">배송 추적</a></p>
									<% } else if(pro.getParselCompany()=="EMS 택배") { %>	
									<p><a href="http://service.epost.go.kr/trace.RetrieveEmsTrace.postal?ems_gubun=E&POST_CODE=<%=pro.getBaleCode() %>">배송 추적</a></p>
									<% } else if(pro.getParselCompany()=="경동택배") { %>	
									<p><a href="http://kdexp.com/basicNewDelivery.kd?barcode=<%=pro.getBaleCode() %>">배송 추적</a></p>
									<% } %>
								<% } %>	
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
			function postCheck(f){
				var code = [10,12,13,11,12,13,13,11];
				var com = ["CJ대한통운","롯데택배","우체국택배","로젠택배","한진택배","CU 편의점택배","EMS 택배","경동택배"];
				var baleCode = f.baleCode.value;
				baleCode = baleCode.trim();
				var parselCompany = f.parselCompany.value;
				for(var i=0;i<8;i++){
					if(parselCompany==com[i]){
						if(baleCode.length!=code[i]){
							alert("해당 택배사와 화물코드의 형식이 일치하지 않습니다.");
							f.baleCode.focus();
							return false;
						}
						//return false;
					}				
				}
			}
			</script>	
		</main>
	</div>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>