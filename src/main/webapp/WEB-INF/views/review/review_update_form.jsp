<%@page import="com.sharebridge.dto.ReviewDto"%>
<%@page import="com.sharebridge.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- js -->
<script src="js/productRegi.js"></script>

<!-- css -->
<link rel="stylesheet" href="css/details/productRegi.css">
<link rel="stylesheet" href="css/review/review_form.css">

<%
MemberDto login = (MemberDto)session.getAttribute("login");
ReviewDto revCont = (ReviewDto)request.getAttribute("revCont");
String title = (String)request.getAttribute("title");
%>

<div id="review_container">
	<h1 id="page_title">후기 수정</h1>

	<form action="updateReviewAf.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="review_id" value="<%=revCont.getReview_id() %>">
		
		<table>
			<tr>
				<th><label class="form-check-label">별점</label></th>
				<td>
					<div class="star-rating space-x-4">
						<input type="radio" id="5-stars" name="rating" value="5" <%= revCont.getRating() == 5 ? "checked=\"checked\"" : "" %> />
						<label for="5-stars" class="star pr-4">★</label>
						<input type="radio" id="4-stars" name="rating" value="4" <%= revCont.getRating() == 4 ? "checked=\"checked\"" : "" %> />
						<label for="4-stars" class="star">★</label>
						<input type="radio" id="3-stars" name="rating" value="3" <%= revCont.getRating() == 3 ? "checked=\"checked\"" : "" %> />
						<label for="3-stars" class="star">★</label>
						<input type="radio" id="2-stars" name="rating" value="2" <%= revCont.getRating() == 2 ? "checked=\"checked\"" : "" %> />
						<label for="2-stars" class="star">★</label>
						<input type="radio" id="1-star" name="rating" value="1" <%= revCont.getRating() == 1 ? "checked=\"checked\"" : "" %> />
						<label for="1-star" class="star">★</label>
					</div>
				</td>
			</tr>
			<tr>
				<th><label class="form-check-label">상품명</label></th>
				<td>
					<input type="text" class="form-control" value="<%=title %>" readonly="readonly" disabled="disabled">
				</td>
			</tr>
			<tr>
				<th><label class="form-check-label" for="content">내용</label></th>
				<td>
					<textarea class="form-control" rows="10" cols="50" name="content" id="content"><%=revCont.getContent() %></textarea>
				</td>
			</tr>
			<tr>
				<th><label class="form-check-label" for="file">사진등록</label></th>
				<td class="photo_regi">
					<div>
						<label for="file" class="upload-btn">
							<input id="file" type="file" name="fileload" onchange="changeImg()" value="<%=revCont.getPhoto() %>"/>
				    		<span>+</span>
						</label>
					</div>
					<div>
						<img src="/sharebridge/upload/review/<%=revCont.getPhoto() %>" id="preview" class="image-box" />
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