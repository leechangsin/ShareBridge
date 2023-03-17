<%@page import="com.sharebridge.dto.ProductDto"%>
<%@page import="com.sharebridge.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="js/rentalFrm.js" defer></script>

<%
	MemberDto login = (MemberDto)session.getAttribute("login");
	ProductDto getProduct = (ProductDto)request.getAttribute("detail");
	
	String sdate = getProduct.getSdate();
	String edate = getProduct.getEdate();
%>

<div class="rental_from">
	<h2>대여 신청서 작성</h2>
	<form action="rentalFrmAf.do" method="post" name="frm" id="frm">
	<input type="hidden" value="" name="member_id">
		<!-- rentee_info -->
		<div class="rentee_info_container">
			<h3>대여자 정보</h3>
			<table class="rentee_info">
				<tr>
					<td>이름</td>
					<td>
						<input type="text" id="name" name="name" value="<%=login.getName() %>">
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>
						<input type="email" id="email" name="email" value="<%=login.getEmail() %>">
					</td>
				</tr>
				<tr>
					<td>휴대전화</td>
					<td>
						<input type="number" id="phone_number" name="phone_number" value="<%=login.getPhone_number()%>">
					</td>
				</tr>
				<tr>
					<td>대여기간</td>
					<td>
						<input class="selector" id="start" placeholder="시작 날짜" name="sdate" />
						<input class="selector" id="end" placeholder="마지막 날짜" name="edate" />
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
				<td>수령자</td>
				<td>
					<input type="text" id="receiver" name="receiver" value="">
				</td>
			</tr>
			<tr>
				<td>휴대전화</td>
				<td>
					<input type="number" id="receiver_phone" name="receiver_phone" value="">
				</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>
					<input type="text" id="postcode" placeholder="우편번호">
					<input type="button" onclick="findPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="address" placeholder="주소"><br>
					<input type="text" id="detailAddress" placeholder="상세주소">
					<input type="hidden" id="saveAddress" name="address"> 
				</td>
			</tr>
		</table>
		</div>
		<!-- payment -->
		<div class="payment">
			<label><input type="radio" name="patmenr" value="card" checked>신용카드</label>
			<label><input type="radio" name="payment" value="account">가상계좌</label>
		</div>
		<!-- total price -->
		<div class="total_price">
			<span>총금액</span>
			<span></span>
			<span>원</span>
		</div>
		<button type="button" id="shopping_cart">장바구니</button>
		<button type="submit" id="regiBtn">대여신청</button>
	</form>
</div>

<<script type="text/javascript">
	range(<%=sdate%>, <%=edate%>);
</script>
