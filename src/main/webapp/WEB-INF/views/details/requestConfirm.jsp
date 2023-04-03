<%@page import="com.sharebridge.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="com.sharebridge.dto.RequestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- css -->
<link rel="stylesheet" href="css/details/requestCommon.css">

<%
	MemberDto login = (MemberDto)session.getAttribute("login");
	RequestDto req = (RequestDto)request.getAttribute("req");
	int price = (Integer)request.getAttribute("price");
	int cid = (Integer)request.getAttribute("cid");

	String sdate = req.getSdate().toString().substring(0,10);
	String edate = req.getEdate().toString().substring(0,10);
	
	pageContext.setAttribute("mine", login.getMember_id() == req.getMember_id());
%>

<c:set var="title" value="대여 신청서 작성 완료" />
<c:if test="${status eq 'check' }">
	<c:set var="title" value="대여 신청서 확인" />
</c:if>

<div class="request_form">
<h2 class="request_title">${title }</h2>
	<div>
		<!-- rentee_info -->
		<div class="container">
			<h3>대여자 정보</h3>
			<table class="rentee_info">
				<tr class="form-group row">
					<th class="col-sm-4 col-form-label">이름</th>
					<td class="col-sm-4"><%=req.getName() %></td>
				</tr>
				<tr class="form-group row">
					<th class="col-sm-4 col-form-label">이메일</th>
					<td class="col-sm-4"><%=req.getEmail() %></td>
				</tr>
				<tr class="form-group row">
					<td class="col-sm-4 col-form-label">휴대전화</td>
					<td class="col-sm-4"><%=req.getPhone_number() %></td>
				</tr>
				<tr class="form-group row">
					<th class="col-sm-4 col-form-label">대여기간</th>
					<td class="col-sm-8">
						<%=sdate %> ~ <%=edate %>
					</td>
				</tr>
			</table>
		</div>
		<!-- address_info -->
		<div class="container">
		<h3>배송지 정보</h3>
		<table class="adderss_info">
				<tr class="form-group row">
					<th class="col-sm-4 col-form-label">수령자</th>
					<td class="col-sm-4"><%=req.getReceiver() %></td>
				</tr>
				<tr class="form-group row">
					<th class="col-sm-4 col-form-label">휴대전화</th>
					<td class="col-sm-4"><%=req.getReceiver_phone() %></td>
				</tr>
				<tr class="form-group row">
					<th class="col-sm-4 col-form-label">주소</th>
					<td class="col-sm-8" style="line-height:2.0">
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
		<div class="container">
			<h3>결제수단</h3>
			<p class="col-sm-4"><%=req.getPayment().equals("card")?"신용카드":"가상계좌" %></p>
		</div>
		<!-- total price -->
		<div class="container total_price">
			<span class="col-3 col-form-label">총금액</span>
			<span class="col-4" style="line-height:38px"><%=req.getTotal_price() %>원</span>
		</div>
		<div class="center">
			<button type="button" class="btn-lg text-white" id="backToDetail">돌아가기</button>
		<c:if test="${mine }">
			<button type="submit" class="btn-lg text-white" id="updateBtn">수정하기</button>
		</c:if>
		</div>
	</div>
</div> 

<script>
$(document).ready(function() {
	let status = "${status}";
	
	$("#backToDetail").click(function() {
		if(status == "") {
			location.href="productDetail.do?product_id=<%=req.getProduct_id()%>&category_id=<%=cid%>";
		} else {
			location.href = "/sharebridge/mypage/mypage.do";
		}
	});
	
	$("#updateBtn").click(function() {
		location.href="goRequestUpdate.do?request_id=<%=req.getRequest_id()%>&category_id=<%=cid%>&price=<%=price%>";
	});
});
</script>