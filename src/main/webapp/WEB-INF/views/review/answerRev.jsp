<%@page import="com.sharebridge.dto.ProductDto"%>
<%@page import="com.sharebridge.dto.MemberDto"%>
<%@page import="com.sharebridge.dto.ReviewDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>후기 답글 : sharebridge</title>

<main>
<%
MemberDto login = (MemberDto)session.getAttribute("login");
ReviewDto dto = (ReviewDto)request.getAttribute("dto");
ProductDto prodInfo = (ProductDto)request.getAttribute("prodInfo");
%>
<div align="center">
<form action="answerRevAf.do" method="post">
<input type="hidden" name="review_id" value="<%=dto.getReview_id() %>">
<input type="hidden" name="request_id" value="<%=dto.getRequest_id() %>">
<input type="hidden" name="product_id" value="<%=dto.getProduct_id() %>">
<input type="hidden" name="renter_id" value="<%=dto.getRenter_id() %>">
<input type="hidden" name="rentee_id" value="<%=dto.getRentee_id() %>">
<input type="hidden" name="rating" value="<%=dto.getRating() %>">
<input type="hidden" name="photo" value="">
<table border="1">
<tr>
	<th>상품명</th>
	<td>
		<%=prodInfo.getTitle() %>
	</td>
</tr>
<tr>
	<th>별점</th>
	<td><%=dto.getRating() %>/5</td>
</tr>
<tr>
	<th>후기 내용</th>
	<td><%=dto.getContent() %></td>
</tr>
<tr>
	<th>답글</th>
	<td><textarea rows="10" cols="50" name="content"></textarea>
	</td>
</tr>
</table>
<button type="submit">답글 작성</button>
</form>
</div>
</main>