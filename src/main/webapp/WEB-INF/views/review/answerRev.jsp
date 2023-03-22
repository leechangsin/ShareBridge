<%@page import="com.sharebridge.dto.ProductDto"%>
<%@page import="com.sharebridge.dto.MemberDto"%>
<%@page import="com.sharebridge.dto.ReviewDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>후기 답글 : sharebridge</title>

<main>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<%
MemberDto login = (MemberDto)session.getAttribute("login");
ReviewDto dto = (ReviewDto)request.getAttribute("dto");
ProductDto prodInfo = (ProductDto)request.getAttribute("prodInfo");
%>
<div class="container">
<form action="answerRevAf.do" method="post">
<input type="hidden" name="review_id" value="<%=dto.getReview_id() %>">
<input type="hidden" name="request_id" value="<%=dto.getRequest_id() %>">
<input type="hidden" name="product_id" value="<%=dto.getProduct_id() %>">
<input type="hidden" name="renter_id" value="<%=dto.getRenter_id() %>">
<input type="hidden" name="rentee_id" value="<%=dto.getRentee_id() %>">
<input type="hidden" name="rating" value="<%=dto.getRating() %>">
<input type="hidden" name="photo" value="">
<table border="1" class="table table-bordered">

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

</table>
<div class="form-outline">
  <textarea class="form-control" id="textAreaExample" rows="4" name="content"></textarea>
  <label class="form-label" for="textAreaExample">Message</label>
</div>
<button type="submit" class="btn btn-secondary">답글 작성</button>
</form>
</div>
</main>