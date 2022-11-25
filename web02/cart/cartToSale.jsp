<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, kr.co.myshop.vo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>제품 구매하기</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link rel="stylesheet" href="common.css">

<style>
.title { padding-top:36px; padding-bottom:20px; }
.table tr td img { max-width:400px; height:auto; }
</style>
</head>
<body>
<%@ include file="../header.jsp" %>
<%
	Product vo = (Product) request.getAttribute("pro");
	int cartNo = (int) (request.getAttribute("cartNo"));
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
			<h2 class="title">제품 구매하기</h2>
			<form name="frm1" id="frm1" action="<%=request.getContextPath() %>/CartToInsertSaleCtrl" method="post" onsubmit="return payCheck(this)">
				<h3>제품 정보</h3>
				<input type="hidden" name="cusId" id="cusId" value="<%=sid %>" />
				<input type="hidden" name="proNo" id="proNo" value="<%=vo.getProNo() %>" />		
				<input type="hidden" name="cartNo" id="cartNo" value="<%=cartNo %>" />
				<table class="table">
					<tbody>
						<tr>
							<th>제품이미지</th>
							<td><img src="<%=request.getContextPath() %>/upload/<%=vo.getProPic() %>" alt="<%=vo.getProName() %>"></td>
						</tr>
						<tr>
							<th>제품번호</th>
							<td></td>
						</tr>
						<tr>
							<th>카테고리 번호</th>
							<td><%=vo.getCateNo() %></td>
						</tr>
						<tr>
							<th>제품명</th>
							<td><%=vo.getProName() %>
								<input type="hidden" name="proName" id="proName" value="<%=vo.getProName() %>"/>
							</td>
						</tr>
						<tr>
							<th>제품 설명</th>
							<td><%=vo.getProSpec() %></td>
						</tr>
						<tr>
							<th>제품가격</th>
							<td>
								판매가격 : <strong style="color:red"><%=vo.getProPrice() %></strong> <br>
								세일전 가격 : (<del><%=vo.getOriPrice() %></del>)
								<input type="hidden" name="proPrice" id="proPrice" value="<%=vo.getProPrice() %>"> 
							</td>
						</tr>
						<tr>
							<th>구매 수량</th>
							<td>			
								<input type="number" name="amount" id="amount" step="1" min="1" max="<%=vo.getAmount() %>" class="form-control" required>
							</td>
						</tr>
					</tbody>
				</table>
				<hr>
				<h3>배송 정보</h3>	
				<table class="table">
					<tbody>
						<tr>
							<th>배송지 주소</th>
							<td><input type="text" name="address1" id="address1" placeholder="기본 주소 입력" class="form-control" required /><br>
							<input type="text" name="address2" id="address2" placeholder="상세 주소 입력" class="form-control" required /><br>
							<input type="text" name="postcode" id="postcode" style="width:160px;float:left;margin-right:20px;" placeholder="우편번호" class="form-control" required>
							<button type="button" id="post_btn" onclick="findAddr()" class="btn btn-primary" style="margin-bottom:36px;">우편번호 검색</button>
							</td>
						</tr>
						<tr>
							<th>받는 사람 연락처</th>
							<td>			
								<input type="tel" name="parselTel" id="parselTel" step="1" min="1" max="<%=vo.getAmount() %>" class="form-control" required>
							</td>
						</tr>
					</tbody>
				</table>
				<hr>
				<h3>결제 정보</h3>
				<div class="btn-group" style="margin-bottom:36px;">
					<button type="button" id="pay" class="btn btn-primary">결제하기</button>
				</div>
				<table class="table">
					<tbody>
						<tr>
							<th>결제 수단</th>
							<td>
								<input type="text" name="payMethod" id="payMethod" class="form-control" required>
							</td>
						</tr>
						<tr>
							<th>결제사</th>
							<td>			
								<input type="text" name="payCom" id="payCom" class="form-control" required>
							</td>
						</tr>
						<tr>
							<th>결제 번호</th>
							<td>			
								<input type="text" name="cardNum" id="cardNum" class="form-control" required>
								<input type="hidden" name="payAmount" id="payAmount">
								<input type="hidden" name="payCk" id="payCk" value="no">
							</td>
						</tr>
					</tbody>
				</table>
				<div class="btn-group" style="margin-bottom:36px;">
				<% if(vo.getAmount()!=0) { %>
				<input type="submit" class="btn btn-primary" value="제품 구매">
				<% } %>
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
			<script>
			//결제모듈 연동
			$(document).ready(function(){
				var totalPay=0;
				var proName;
				$("#pay").click(function(){
					proName = $("#proName").val();
					if($("#amount").val()!="") {
						totalPay = parseInt($("#proPrice").val()) * parseInt($("#amount").val());
					} else {
						alert("구매할 수량을 입력하지 않으셨습니다.");
						$("#amount").focus();
						return;
					}
					alert("결제할 금액 : "+totalPay);
					//상품명_현재시간
		 			var d = new Date();
					var date = d.getFullYear()+''+(d.getMonth()+1)+''+d.getDate()+''+d.getHours()+''+d.getMinutes()+''+d.getSeconds();
					IMP.init('imp31083748'); // 결제 API를 사용하기 위한 코드 입력!
					IMP.request_pay({		//결제 요청
						merchant_uid : '상품명_' + date, //상점 거래 ID
						name : proName,				// 결제 명
						amount : totalPay,					// 결제금액
						buyer_email : 'xxxxxxx@naver.com', // 구매자 email
						buyer_name : '구매자',				// 구매자 이름
						buyer_tel : '010-1234-4567',		// 구매자 전화번호
						buyer_addr : '서울특별시 영등포구',		// 구매자 주소
						buyer_postcode : '123-456'			// 구매자 우편번호
						
						//지정 가능한 속성
						//https://docs.iamport.kr/sdk/javascript-sdk 참조
						//pg : 결제 프로그램 코드
						//pay_method : 결제 방법
						//escrow : 에스크로 결제창 호출 여부
						//merchant_uid : 상점 거래 ID
						//name : 주문명
						//amount : 결제 금액
						//custom_data : 가맹점 임의 지정 데이터
						//tax_free : 면세공급가액
						//currency : 거래 통화
						//language : 결제창 화면의 언어
						//buyer_name : 주문자명
						//buyer_tel : 주문자 연락처
						//buyer_email : 주문자 이메일
						//buyer_addr : 주문자 주소
						//buyer_postcode : 주문자 우편번호
						//display : 결제 화면 구성 설정
						//display.card_quota : 50,000원 이상 금액 결제시 할부 개월 수 옵션
						//digital : 결제 상품이 컨텐츠인지 여부(휴대폰 소액 결제시 필수)
						//v_bank_due : 가상계좌 입금기한
						//m_redirect_url : 리다이렉션 방식으로 호출된 결제창에서 결제 후 이동 될 주소
						//app_scheme : 모바일 앱 결제 중 앱 복귀를 위한 URL
						//biz_num : 계약된 사업자등록번호 10자리
						
					}, function(rsp){
						if(rsp.success){
							console.log(rsp);
							var msg = '결제가 완료 되었습니다.';
							var r1 = '고유 아이디 : ' +rsp.imp_uid;
							var r2 = '상점 거래 아이디 : ' +rsp.merchant_uid;
							var r3 = '결제 금액 : ' +rsp.paid_amount;
							var r4 = '카드 승인 번호 : '+rsp.apply_num;
							
							//반환 가능한 속성
							//https://docs.iamport.kr/sdk/javascript-sdk 참조
							//rsp.success : 결제 성공 여부
							//rsp.error_code : 결제 실패시 에러 코드
							//rsp.error_msg : 결제 실패시 에러 메시지
							//rsp.imp_uid : 아임포트 고유 결제번호
							//rsp.merchant_uid : 가맹점 고유 주문번호
							//rsp.pay_method : 결제 방법
							//rsp.paid_amount : 결제 금액
							//rsp.status : 결제 상태
							//rsp.name : 주문명
							//rsp.pg_provider : 일반 결제 승인된 PG사
							//rsp.emb_pg_provider : 간편 결제 승인된 PG사 
							//rsp.pg_tid : PG사 거래고유번호
							//rsp.buyer_name : 주문자 이름
							//rsp.buyer_email : 주문자 Email
							//rsp.buyer_tel : 주문자 연락처
							//rsp.buyer_addr : 주문자 주소
							//rsp.buyer_postcode : 주문자 우편번호
							//rsp.custom_data : 가맹점 임의 지정 데이터
							//rsp.paid_at : 결제승인시각
							//rsp.receipt_url : PG사에서 발행되는 거래 매출전표 URL
							//rsp.apply_num : 카드사 승인번호
							//rsp.vbank_num : 가상계좌 입금계좌번호
							//rsp.vbank_name : 가상계좌 은행명
							//rsp.vbank_holder : 가상계좌 예금주
							//rsp.vbank_date : 가상계좌 입금기한
							
							//$("#payCk").val("yes");
							//$("#payAmount").val(rsp.paid_amount);
							//$("#payMethod").val(rsp.pay_method);
							//$("#payCom").val(rsp.pg_provider);
							//$("#cardNum").val(rsp.apply_num);
							//alert(msg);
							//$("#paymentResult").html(r1+"<br>"+r2+"<br>"+r3+"<br>"+r4);
						} else{
							//$("#paymentResult").html('결제실패<br>'+'에러내용 : ' +rsp.error_msg);
						}
						//테스트용이므로 실패시에도 그냥 통과시킴
						$("#payCk").val("yes");
						$("#payAmount").val(totalPay);
						$("#payMethod").val("카드");
						$("#payCom").val("삼성카드");
						$("#cardNum").val("123-1234-1234-1278");
					});
		 		});
			});
			</script>
			<script>
			function payCheck(f){
				var payCk = f.payCk.value;
				if(payCk!="yes"){
					alert("아직 결제 전 입니다.");
					return;
				}
			}
			</script>
			<div class="btn-group">
				<a href="<%=request.getContextPath() %>/GetProductListCtrl" class="btn btn-danger">목록으로</a>
				<% if(sid.equals("admin")) { %>
				<a href="<%=request.getContextPath() %>/DeleteProductCtrl?proNo=<%=vo.getProNo() %>" class="btn btn-primary">제품 삭제</a>
				<a href="<%=request.getContextPath() %>/UpdateProductCtrl?proNo=<%=vo.getProNo() %>" class="btn btn-danger">제품 정보 수정</a>
				<a href="<%=request.getContextPath() %>/GetProductWearingCtrl?proNo=<%=vo.getProNo() %>" class="btn btn-danger">제품 입고</a>
				<% } %>
			</div>
		</main>
	</div>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>