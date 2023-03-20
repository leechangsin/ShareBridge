<%@page import="com.sharebridge.dto.RequestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	RequestDto req = (RequestDto)request.getAttribute("req");

	String sdate = req.getSdate().toString().substring(0,10);
	String edate = req.getEdate().toString().substring(0,10);
%>

<div class="request_from">
<h2 class="request_title">대여 신청서 작성 완료</h2>
	<form action="requestFrmAf.do" method="post" id="frm">
		<!-- rentee_info -->
		<div class="rentee_info_container">
			<h3>대여자 정보</h3>
			<table class="rentee_info">
				<tr>
					<th>이름</th>
					<td><%=req.getName() %>"</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><%=req.getEmail() %></td>
				</tr>
				<tr>
					<td>휴대전화</td>
					<td><%=req.getPhone_number() %></td>
				</tr>
				<tr>
					<th>대여기간</th>
					<td>
						<%=sdate %> ~ <%=edate %>
					</td>
				</tr>
			</table>
		</div>
		<!-- address_info -->
		<div class="address_info_container">
		<h3>배송지 정보</h3>
		<table class="adderss_info">
				<tr>
					<th>수령자</th>
					<td><%=req.getReceiver() %></td>
				</tr>
				<tr>
					<th>휴대전화</th>
					<td><%=req.getReceiver_phone() %></td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<%
							String[] address = req.getAddress().split("/");	
						
							for(String a : address) {
								%>
								<span><%=a %></span><br>
								<%
							}
						%>
					</td>
				</tr>
			</table>
		</div>
		<!-- payment -->
		<div class="payment">
			<h3>결제수단</h3>
			<p><%=req.getPayment() %></p>
		</div>
		<!-- total price -->
		<div class="total_price">
			<span>총금액</span>
			<span><%=req.getTotal_price() %>원</span>
		</div>
		<button type="button" id="backToDetail">돌아가기</button>
		<button type="submit" id="updateBtn">수정하기</button>
	</form>
</div> 

<script>
$(document).ready(function() {
	$("#backToDetail").click(function() {		
		location.href="productDetail?product_id=<%=req.getProduct_id()%>";
	});
	
	$("#updateBtn").click(function() {
		location.href="goRequestUpdate.do?request_id=<%=req.getRequest_id()%>";
	});
});
</script>