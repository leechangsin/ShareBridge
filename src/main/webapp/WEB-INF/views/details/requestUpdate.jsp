<%@page import="com.sharebridge.dto.RequestDto"%>
<%@page import="com.sharebridge.dto.MemberDto"%>
<%@page import="com.sharebridge.dto.ProductDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- flatpickr -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<!-- js -->
<script src="js/requestFrm.js" defer></script>
<script src="js/updateRegiAndReq.js" defer></script>

<!-- address -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- css -->
<link rel="stylesheet" href="css/details/requestCommon.css">

<% 	
RequestDto req = (RequestDto)request.getAttribute("req");
ProductDto getProduct = (ProductDto)request.getAttribute("getProduct");
int price = (Integer)request.getAttribute("price");
int cid = (Integer)request.getAttribute("cid");

String p_sdate = getProduct.getSdate().toString().substring(0,10);
String p_edate = getProduct.getEdate().toString().substring(0,10);

String sdate = req.getSdate().toString().substring(0,10);
String edate = req.getEdate().toString().substring(0,10);

String[] address = req.getAddress().split("/");
%>

<div class="request_form">
<h2 class="request_title">대여 신청서 수정</h2>
	<form action="updateReqAf.do" method="post" id="frm">
	<input type="hidden" value="<%=req.getProduct_id() %>" name="product_id">
	<input type="hidden" value="<%=req.getRequest_id() %>" name="request_id">
	<input type="hidden" value="<%=cid %>" name="cid">
		<!-- rentee_info -->
		<div class="container">
			<h3>대여자 정보</h3>
			<table class="rentee_info">
				<tr class="form-group row">
					<th class="col-sm-4 col-form-label">이름</th>
					<td class="col-sm-4">
						<input type="text" class="form-control" id="name" name="name" value="<%=req.getName() %>">
					</td>
				</tr>
				<tr class="form-group row">
					<th class="col-sm-4 col-form-label">이메일</th>
					<td class="col-sm-4">
						<input type="email" class="form-control" id="email" name="email" value="<%=req.getEmail() %>">
					</td>
				</tr>
				<tr class="form-group row">
					<td class="col-sm-4 col-form-label">휴대전화</td>
					<td class="col-sm-4">
						<input type="number" class="form-control" id="phone_number" name="phone_number" value="<%=req.getPhone_number()%>">
					</td>
				</tr>
				<tr class="form-group row">
					<th class="col-sm-4 col-form-label">대여기간</th>
					<td class="col-sm-4">
						<input class="selector form-control" id="start" placeholder="<%=p_sdate %>" value="<%=sdate %>" />
						<input class="selector form-control" id="end" placeholder="<%=p_edate %>" value="<%=edate %>" />
						<input type="hidden" id="startDate" name="start" />
						<input type="hidden" id="endDate" name="end" />
					</td>
				</tr>
			</table>
		</div>
		<!-- address_info -->
		<div class="container address">
		<div>
			<lable class="form-check-label same_chk"><input type="checkbox" class="form-check-input" id="same_chk">대여자 정보와 동일</lable>
			<h3>배송지 정보</h3>
		</div>
		<table class="adderss_info">
				<tr class="form-group row">
					<th class="col-sm-4 col-form-label">수령자</th>
					<td class="col-sm-4">
						<input type="text" id="receiver" name="receiver" value="<%=req.getReceiver() %>">
					</td>
				</tr>
				<tr class="form-group row">
					<th class="col-sm-4 col-form-label">휴대전화</th>
					<td class="col-sm-4">
						<input type="tel" maxlength="11" class="form-control" id="receiver_phone" name="receiver_phone" value="<%=req.getReceiver_phone() %>">	
					</td>
				</tr>
				<tr class="form-group row">
					<th class="col-sm-4 col-form-label">주소</th>
					<td class="col-sm-8">
						<div>
							<div class="postcode">
								<input type="text" class="addAddress form-control" id="postcode" placeholder="우편번호" value="<%=address[0] %>">
								<input type="button" class="postcodeBtn" onclick="findPostcode()" value="우편번호 찾기"><br>
							</div>
							<div>	
								<input type="text" class="addAddress form-control" id="address" placeholder="주소" value="<%=address[1] %>>"><br>
							</div>
							<div>
								<input type="text" class="addAddress form-control" id="detailAddress" placeholder="상세주소" value=<%=address[2] %>>
								<input type="hidden" id="saveAddress" name="address"> 
							</div>
					</td>
				</tr>
			</table>
		</div>
		<!-- payment -->
		<div class="container payment form-check">
			<h3>결제수단</h3>
			<div class="form-check form-check-inline">
				<label class="form-check-label">
					<input class="form-check-input" type="radio" name="payment" value="card" checked=<%=req.getPayment().equals("card")?"checked":"" %>>신용카드
				</label>
			</div>
			<div class="form-check form-check-inline">
				<label class="form-check-label">
					<input class="form-check-input" type="radio" name="payment" value="account" checked=<%=req.getPayment().equals("account")?"checked":"" %>>가상계좌
				</label>
			</div>	
		</div>
		<!-- total price -->
		<div class="container total_price">
			<div class="form-group total_price">
				<span class="col-4 col-form-label">총금액</span>
				<input type="hidden" id="price" value="<%=price %>">
				<div class="col-5">
					<input type="number" id="total" name="total_price" class="form-control" readonly="readonly" value="<%=req.getTotal_price() %>">
				</div>
				<span class="col-2">원</span>
			</div>
		</div>
		<div class="center">
			<button type="button" class="btn-lg text-white" id="backToDetail">뒤로가기</button>
			<button type="submit" class="btn-lg btn-primary" id="regiBtn">수정완료</button>
		</div>	
	</form>
</div> 

<script>
$(document).ready(function() {
	$("#backToDetail").click(function() {		
		location.href="productDetail?product_id=<%=req.getProduct_id()%>&category_id=<%=cid%>";
	});
});
</script>
