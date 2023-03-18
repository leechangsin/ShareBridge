<%--@page import="com.sharebridge.dto.MemberDto"--%>
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

<% 	
// MemberDto login = (MemberDto)session.getAttribute("login");
ProductDto getProduct = (ProductDto)request.getAttribute("detail");

String sdate = getProduct.getSdate().substring(0,10);
String edate = getProduct.getEdate().substring(0,10);
%>

<div class="request_from">
<h2 class="request_title">대여 신청서 작성</h2>
	<form action="requestFrmAf.do" method="post" id="frm">
	<input type="hidden" value="<%=getProduct.getProduct_id() %>" name="product_id">
	<input type="hidden" value="1" name="member_id">
		<!-- rentee_info -->
		<div class="rentee_info_container">
			<h3>대여자 정보</h3>
			<table class="rentee_info">
				<tr>
					<th>이름</th>
					<td>
						<%-- <input type="text" id="name" name="name" value="<%=login.getName() %>"> --%>
						<input type="text" id="name" name="name" value="에비씨">
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<%-- <input type="email" id="email" name="email" value="<%=login.getEmail() %>"> --%>
						<input type="email" id="email" name="email" value="abc@naver.com">
					</td>
				</tr>
				<tr>
					<td>휴대전화</td>
					<td>
						<%-- <input type="number" id="phone_number" name="phone_number" value="<%=login.getPhone_number()%>"> --%>
						<input type="number" id="phone_number" name="phone_number" value="01012345678">
					</td>
				</tr>
				<tr>
					<th>대여기간</th>
					<td>
						<input class="selector" id="start" placeholder="<%=sdate %>" name="sdate" />
						<input class="selector" id="end" placeholder="<%=edate %>" name="edate" />
					</td>
				</tr>
			</table>
		</div>
		<!-- address_info -->
		<div class="address_info_container">
		<div>
			<h3>배송지 정보</h3>
			<lable><input type="checkbox" id="same_chk">대여자 정보와 동일</lable>
		</div>
		<table class="adderss_info">
				<tr>
					<th>수령자</th>
					<td>
						<input type="text" id="receiver" name="receiver" value="">
					</td>
				</tr>
				<tr>
					<th>휴대전화</th>
					<td>
						<input type="number" id="receiver_phone" name="receiver_phone" value="">	
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<input type="text" class="addAddress" id="postcode" placeholder="우편번호">
						<input type="button" onclick="findPostcode()" value="우편번호 찾기"><br>
						<input type="text" class="addAddress" id="address" placeholder="주소"><br>
						<input type="text" class="addAddress" id="detailAddress" placeholder="상세주소">
						<input type="hidden" id="saveAddress" name="address"> 
					</td>
				</tr>
			</table>
		</div>
		<!-- payment -->
		<div class="payment">
			<label><input type="radio" name="payment" value="card" checked>신용카드</label>
			<label><input type="radio" name="payment" value="account">가상계좌</label>
		</div>
		<!-- total price -->
		<div class="total_price">
			<span>총금액</span>
			<input type="hidden" id="price" value="<%=getProduct.getPrice() %>">
			<input type="number" id="total" readonly="readonly">
			<span>원</span>
		</div>
		<button type="button" id="shopping_cart">장바구니</button>
		<button type="submit" id="regiBtn">대여신청</button>
	</form>
</div> 

