<%@page import="com.sharebridge.dto.ProductDto"%>
<%@page import="com.sharebridge.dto.MemberDto"%>
<%@page import="com.sharebridge.dto.ReviewDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/sharebridge/css/question/writeForm.css">
<link rel="stylesheet" href="/sharebridge/css/review/answerRev.css">

<%
MemberDto login = (MemberDto)session.getAttribute("login");
ReviewDto dto = (ReviewDto)request.getAttribute("dto");
ProductDto prodInfo = (ProductDto)request.getAttribute("prodInfo");
%>


<div class="review_reply_conatiner">
	<h3 class="title">후기 답글 작성</h3>
	
	<form action="answerRevAf.do" method="post" id="frm">
		<input type="hidden" name="review_id" value="<%=dto.getReview_id() %>">
		<input type="hidden" name="request_id" value="<%=dto.getRequest_id() %>">
		<input type="hidden" name="product_id" value="<%=dto.getProduct_id() %>">
		<input type="hidden" name="renter_id" value="<%=dto.getRenter_id() %>">
		<input type="hidden" name="rentee_id" value="<%=dto.getRentee_id() %>">
		<input type="hidden" name="rating" value="<%=dto.getRating() %>">
		<input type="hidden" name="photo" value="">
		
		<table>
			<tr>
				<th><label for="title" class="form-label">상품명</label></th>
				<td>
					<input type="text" maxlength="200" class="form-control" id="title" value="<%=prodInfo.getTitle() %>" readonly="readonly" disabled="disabled">
				</td>
			</tr>
			<tr>
				<th><label for="rating" class="form-label">별점</label></th>
				<td><input type="text" class="form-control" id="rating" value="<%=dto.getRating() %>/5" readonly="readonly" disabled="disabled"></td>
			</tr>
			<tr>
				<th><label for="content" class="form-label">후기 내용</label></th>
				<td><textarea rows="10" cols="50" class="form-control" id="content" readonly="readonly" disabled="disabled"><%=dto.getContent() %></textarea></td>
			</tr>
			<tr>
				<th><label for="reply_content" class="form-label">답글</label></th>
				<td><textarea rows="10" cols="50" class="form-control" id="reply_content" name="content"></textarea>
				</td>
			</tr>
		</table>
		
		<div id="btn_wrap">
			<button type="submit" id="writeBtn" class="btn">작성완료</button>
		</div>
	</form>

</div>
