<%@page import="com.sharebridge.dto.MemberDto"%>
<%@page import="com.sharebridge.dto.CategoryDto"%>
<%@page import="com.sharebridge.dto.ProductDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.product_info {
	display: flex;
}

.preview {
	width: 400px;
}
</style>
</head>
<body>

<% 
ProductDto getProduct = (ProductDto)request.getAttribute("detail");
CategoryDto getCate = (CategoryDto)request.getAttribute("getCate");
// MemberDto login = (MemberDto)session.getAttribute("login");

String sdate = getProduct.getSdate();
String edate = getProduct.getEdate();

int pid = getProduct.getProduct_id();
int cid = getProduct.getCategory_id();
%>

<div>
	<%-- 상품 정보(이미지, 카테고리, 상품명, 기간 등등) --%>
	<div class="product_info">
		<div class="product_photo">
			<%
				if(getProduct.getPhoto() == null || getProduct.getPhoto().equals("")) {
					%>
					<img src="https://i0.wp.com/adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg" alt="상품이미지" class="preview">
					<%
				} else {
					%>
					<img src="<%=getProduct.getPhoto() %>" alt="상품이미지" class="preview">					
					<%
				}
			%>
		</div>
		<div class="product_desc">
			<table>
				<tr>
					<td><%=getCate.getName() %></td>
				</tr>
				<tr>
					<td><%=getProduct.getTitle() %></td>
				</tr>
				<tr>
					<td>
						<span><%=sdate.substring(0, 10)%></span>
						~
						<span><%=edate.substring(0, 10)%></span>
					</td>
				</tr>
				<tr>
					<td><%=getProduct.getPrice() %><span>원 / 일</span></td>
				</tr>
			</table>
			<%--
				if(getProduct.getMember_id() == login.getMember_id()) { 
					--%>					
					<div>
						<a href="goUpdate.do?product_id=<%=pid%>&category_id=<%=cid%>">수정</a>
						<a href="delProduct.do?product_id=<%=pid%>">삭제</a>
					</div>
					<%--
				} else {
					--%>
					<button type="button">대여신청</button>
					<%--					
				}
			--%>
		</div>
	</div>
	
	<%-- 렌터 정보(프로필, 후기) --%>
	<div class="renter_info">
		<div class="renter_profile"></div>
		<div class="renter_review"></div>
	</div>
	
	<%-- 상품 내용, 문의 --%>
	<div class="content_and_question"></div>
</div>
</body>
</html>