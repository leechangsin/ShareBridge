<%@page import="com.sharebridge.dto.ProductDto"%>
<%@page import="com.sharebridge.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- js -->
<script src="js/productRegi.js" defer></script>

<!-- css -->
<link rel="stylesheet" href="css/details/productRegi.css">
<link rel="stylesheet" href="css/review/review_form.css">

<%
MemberDto login = (MemberDto)session.getAttribute("login");
ProductDto prod = (ProductDto)request.getAttribute("prod");
int requestId = (Integer)request.getAttribute("requestId");
%>

<div id="review_container">
	<h1 id="page_title">후기 작성</h1>

	<form action="reviewWriteAf.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="renter_id" value="<%=prod.getMember_id() %>">
		<input type="hidden" name="rentee_id" value="<%=login.getMember_id() %>">
		<input type="hidden" name="request_id" value="<%=requestId %>">
		
		<table>
			<tr>
				<th><label class="form-check-label">별점</label></th>
				<td>
					<div class="star-rating space-x-4">
						<input type="radio" id="5-stars" name="rating" value="5" />
						<label for="5-stars" class="star pr-4">★</label>
						<input type="radio" id="4-stars" name="rating" value="4" />
						<label for="4-stars" class="star">★</label>
						<input type="radio" id="3-stars" name="rating" value="3" />
						<label for="3-stars" class="star">★</label>
						<input type="radio" id="2-stars" name="rating" value="2" />
						<label for="2-stars" class="star">★</label>
						<input type="radio" id="1-star" name="rating" value="1" />
						<label for="1-star" class="star">★</label>
					</div>
				</td>
			</tr>
			<tr>
				<th><label class="form-check-label">상품명</label></th>
				<td>
					<input type="text" class="form-control" value="<%=prod.getTitle() %>" readonly="readonly" disabled="disabled">
					<input type="hidden" name="product_id" id="product" value="<%=prod.getProduct_id() %>">
				</td>
			</tr>
			<tr>
				<th><label class="form-check-label" for="content">상품명</label></th>
				<td>
					<textarea class="form-control" rows="10" cols="50" name="content" id="content"></textarea>
				</td>
			</tr>
			<tr>
				<th><label class="form-check-label" for="file">사진등록</label></th>
				<td class="photo_regi">
					<div>
						<label for="file" class="upload-btn">
							<input id="file" type="file" name="fileload" onchange="changeImg()">
							<span>+</span>
						</label>
					</div>
					<div>
						<img src="https://i0.wp.com/adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg" id="preview" class="image-box" />
						<button type="button" class="deleteBtn" onclick="deleteImg()">
					    	<img src="images/delete_icon.png" />
					    </button>
					</div>
				</td>
			</tr>
		</table>
		
		<div id="btn_wrap">
			<button type="submit" id="writeBtn" class="btn">작성완료</button>
		</div>
	</form>
</div>