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

<div class="request_from">
<h2 class="request_title">대여 신청서 작성</h2>
	<form action="updateReqAf.do" method="post" id="frm">
	<input type="hidden" value="<%=req.getProduct_id() %>" name="product_id">
	<input type="hidden" value="<%=req.getRequest_id() %>" name="request_id">
	<input type="hidden" value="<%=cid %>" name="cid">
		<!-- rentee_info -->
		<div class="rentee_info_container">
			<h3>대여자 정보</h3>
			<table class="rentee_info">
				<tr>
					<th>이름</th>
					<td>
						<input type="text" id="name" name="name" value="<%=req.getName() %>">
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="email" id="email" name="email" value="<%=req.getEmail() %>">
					</td>
				</tr>
				<tr>
					<td>휴대전화</td>
					<td>
						<input type="number" id="phone_number" name="phone_number" value="<%=req.getPhone_number()%>">
					</td>
				</tr>
				<tr>
					<th>대여기간</th>
					<td>
						<input class="selector" id="start" placeholder="<%=p_sdate %>" value="<%=sdate %>" />
						<input class="selector" id="end" placeholder="<%=p_edate %>" value="<%=edate %>" />
						<input type="hidden" id="startDate" name="start" />
						<input type="hidden" id="endDate" name="end" />
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
						<input type="text" id="receiver" name="receiver" value="<%=req.getReceiver() %>">
					</td>
				</tr>
				<tr>
					<th>휴대전화</th>
					<td>
						<input type="number" id="receiver_phone" name="receiver_phone" value="<%=req.getReceiver_phone() %>">	
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<input type="text" class="addAddress" id="postcode" placeholder="우편번호" value="<%=address[0] %>">
						<input type="button" onclick="findPostcode()" value="우편번호 찾기"><br>
						<input type="text" class="addAddress" id="address" placeholder="주소" value="<%=address[1] %>>"><br>
						<input type="text" class="addAddress" id="detailAddress" placeholder="상세주소" value=<%=address[2] %>>
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
			<input type="hidden" id="price" value="<%=price %>">
			<input type="number" id="total" name="total_price" readonly="readonly" value="<%=req.getTotal_price() %>">
			<span>원</span>
		</div>
		<button type="button" id="backToDetail">뒤로가기</button>
		<button type="submit" id="regiBtn">수정완료</button>
	</form>
</div> 

<script>
$(document).ready(function() {
	$("#backToDetail").click(function() {		
		location.href="productDetail?product_id=<%=req.getProduct_id()%>&category_id=<%=cid%>";
	});
});
</script>
