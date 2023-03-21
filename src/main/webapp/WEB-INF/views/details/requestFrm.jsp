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

<!-- address -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- css -->
<link rel="stylesheet" href="css/details/requestCommon.css">

<% 	
MemberDto login = (MemberDto)session.getAttribute("login");
ProductDto getProduct = (ProductDto)request.getAttribute("detail");

String sdate = getProduct.getSdate().toString().substring(0,10);
String edate = getProduct.getEdate().toString().substring(0,10);
%>

<div class="request_form">
<h2 class="request_title">대여 신청서 작성</h2>
	<form action="requestFrmAf.do" method="post" id="frm">
	<input type="hidden" value="<%=getProduct.getProduct_id() %>" name="product_id">
	<input type="hidden" value="1" name="member_id">
		<!-- rentee_info -->
		<div class="container">
			<h3>대여자 정보</h3>
			<table class="rentee_info">
				<tr class="form-group row">
					<th class="col-sm-4 col-form-label">이름</th>
					<td class="col-sm-4">
						<input type="text" class="form-control" id="name" name="name" value="<%=login.getName() %>">
					</td>
				</tr>
				<tr class="form-group row">
					<th class="col-sm-4 col-form-label">이메일</th>
					<td class="col-sm-4">
						<input type="email" class="form-control" id="email" name="email" value="<%=login.getEmail() %>">
					</td>
				</tr>
				<tr class="form-group row">
					<td class="col-sm-4 col-form-label">휴대전화</td>
					<td class="col-sm-4">
						<input type="tel" maxlength="11" placeholder="-를 제외하고 입력하세요" class="form-control" id="phone_number" name="phone_number" value="<%=login.getPhone_number()%>">
					</td>
				</tr>
				<tr class="form-group row">
					<th class="col-sm-4 col-form-label">대여기간</th>
					<td class="col-sm-8 rentalDate">
						<input class="selector form-control" id="start" placeholder="<%=sdate %>" />
						<input class="selector form-control" id="end" placeholder="<%=edate %>" />
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
						<input type="text" class="form-control" id="receiver" name="receiver" value="">
					</td>
				</tr>
				<tr class="form-group row">
					<th class="col-sm-4 col-form-label">휴대전화</th>
					<td class="col-sm-4">
						<input type="tel" maxlength="11" placeholder="-를 제외하고 입력하세요" class="form-control" id="receiver_phone" name="receiver_phone" value="">	
					</td>
				</tr>
				<tr class="form-group row">
					<th class="col-sm-4 col-form-label">주소</th>
					<td class="col-sm-8">
						<div>
							<div class="postcode">
								<input type="text" class="addAddress form-control" id="postcode" placeholder="우편번호">
								<input type="button" class="postcodeBtn" onclick="findPostcode()" value="우편번호 찾기"><br>
							</div>
							<span>
							</span>
							<div> 	
								<input type="text" class="addAddress form-control" id="address" placeholder="주소"><br>
							</div>
							<div>
								<input type="text" class="addAddress form-control" id="detailAddress" placeholder="상세주소">
								<input type="hidden" id="saveAddress" name="address"> 
							</div>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<!-- payment -->
		<div class="container payment form-check">
			<h3>결제수단</h3>
			<div class="form-check form-check-inline">
				<label class="form-check-label"><input class="form-check-input" type="radio" name="payment" value="card" checked>신용카드</label>
			</div>
			<div class="form-check form-check-inline">
				<label class="form-check-label"><input class="form-check-input" type="radio" name="payment" value="account">가상계좌</label>
			</div>	
		</div>
		<!-- total price -->
		<div class="container total_price">
			<div class="form-group total_price">
				<input type="hidden" id="price" value="<%=getProduct.getPrice() %>">
				<span class="col-4 col-form-label">총금액</span>
				<div class="col-5">
					<input type="number" class="form-control" id="total" name="total_price" readonly="readonly">
				</div>
				<span class="col-2">원</span>
			</div>
		</div>
		<div class="center">
			<button type="button" class="btn-lg text-white" id="shopping_cart">장바구니</button>
			<button type="submit" class="btn-lg btn-primary" id="regiBtn">대여신청</button>
		</div>
	</form>
</div> 

