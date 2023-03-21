<%@page import="com.sharebridge.dto.ReviewDto"%>
<%@page import="com.sharebridge.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>후기 수정 : sharebridge</title>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<!-- js -->
<script src="js/productRegi.js" defer></script>
<!-- css -->
<link rel="stylesheet" href="css/details/productRegi.css">

<style type="text/css">
.star-rating {
  display: flex;
  flex-direction: row-reverse;
  font-size: 2.25rem;
  line-height: 2.5rem;
  justify-content: space-around;
  padding: 0 0.2em;
  text-align: center;
  width: 5em;
}
 
.star-rating input {
  display: none;
}
 
.star-rating label {
  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
  -webkit-text-stroke-width: 2.3px;
  -webkit-text-stroke-color: #2b2a29;
  cursor: pointer;
}
 
.star-rating :checked ~ label {
  -webkit-text-fill-color: gold;
}
 
.star-rating label:hover,
.star-rating label:hover ~ label {
  -webkit-text-fill-color: #fff58c;
}
</style>



<%
MemberDto login = (MemberDto)session.getAttribute("login");
ReviewDto revCont = (ReviewDto)request.getAttribute("revCont");
String title = (String)request.getAttribute("title");
%>

<div align="center">
<h1>후기 작성</h1>
<hr><br>

<form action="updateReviewAf.do" method="post" enctype="multipart/form-data">
<input type="hidden" name="review_id" value="<%=revCont.getReview_id() %>">
<table>
<tr>
	<th>별점</th>
	<td>
		<div class="star-rating space-x-4 mx-auto">
		<%
			if(revCont.getRating() == 1) {
				%>
				<input type="radio" id="5-stars" name="rating" value="5" />
				<label for="5-stars" class="star pr-4">★</label>
				<input type="radio" id="4-stars" name="rating" value="4" />
				<label for="4-stars" class="star">★</label>
				<input type="radio" id="3-stars" name="rating" value="3" />
				<label for="3-stars" class="star">★</label>
				<input type="radio" id="2-stars" name="rating" value="2" />
				<label for="2-stars" class="star">★</label>
				<input type="radio" id="1-star" name="rating" value="1" checked="checked" />
				<label for="1-star" class="star">★</label>
				<%
			}else if(revCont.getRating() == 2) {
				%>
				<input type="radio" id="5-stars" name="rating" value="5" />
				<label for="5-stars" class="star pr-4">★</label>
				<input type="radio" id="4-stars" name="rating" value="4" />
				<label for="4-stars" class="star">★</label>
				<input type="radio" id="3-stars" name="rating" value="3" />
				<label for="3-stars" class="star">★</label>
				<input type="radio" id="2-stars" name="rating" value="2" checked="checked" />
				<label for="2-stars" class="star">★</label>
				<input type="radio" id="1-star" name="rating" value="1" />
				<label for="1-star" class="star">★</label>
				<%
			}else if(revCont.getRating() == 3) {
				%>
				<input type="radio" id="5-stars" name="rating" value="5" />
				<label for="5-stars" class="star pr-4">★</label>
				<input type="radio" id="4-stars" name="rating" value="4" />
				<label for="4-stars" class="star">★</label>
				<input type="radio" id="3-stars" name="rating" value="3" checked="checked" />
				<label for="3-stars" class="star">★</label>
				<input type="radio" id="2-stars" name="rating" value="2" />
				<label for="2-stars" class="star">★</label>
				<input type="radio" id="1-star" name="rating" value="1" />
				<label for="1-star" class="star">★</label>
				<%
			}else if(revCont.getRating() == 4) {
				%>
				<input type="radio" id="5-stars" name="rating" value="5" />
				<label for="5-stars" class="star pr-4">★</label>
				<input type="radio" id="4-stars" name="rating" value="4" checked="checked" />
				<label for="4-stars" class="star">★</label>
				<input type="radio" id="3-stars" name="rating" value="3" />
				<label for="3-stars" class="star">★</label>
				<input type="radio" id="2-stars" name="rating" value="2" />
				<label for="2-stars" class="star">★</label>
				<input type="radio" id="1-star" name="rating" value="1" />
				<label for="1-star" class="star">★</label>
				<%
			}else if(revCont.getRating() == 5) {
				%>
				<input type="radio" id="5-stars" name="rating" value="5" checked="checked" />
				<label for="5-stars" class="star pr-4">★</label>
				<input type="radio" id="4-stars" name="rating" value="4" />
				<label for="4-stars" class="star">★</label>
				<input type="radio" id="3-stars" name="rating" value="3" />
				<label for="3-stars" class="star">★</label>
				<input type="radio" id="2-stars" name="rating" value="2" />
				<label for="2-stars" class="star">★</label>
				<input type="radio" id="1-star" name="rating" value="1" />
				<label for="1-star" class="star">★</label>
				<%
			}
		%>
			
		</div>
	</td>
</tr>
<tr>
	<th><br>상품명</th>
	<td>
		<br><input type="text" value="<%=title %>" readonly="readonly">
	</td>
</tr>
<tr>
	<th><br>내용</th>
	<td><br>
		<textarea rows="10" cols="50" name="content"><%=revCont.getContent() %></textarea>
	</td>
</tr>
<tr>
	<th><br>사진등록</th>
	<td class="photo_regi">
		<label for="file" class="upload-btn">
			<input id="file" type="file" name="fileload" onchange="changeImg()" value="<%=revCont.getPhoto() %>"/>
    		<span>+</span>
		</label>
		<img src="/sharebridge/upload/review/<%=revCont.getPhoto() %>" id="preview" class="image-box" />
	    <button type="button" class="deleteBtn" onclick="deleteImg()">
	    	<img src="images/delete_icon.png" />
	    </button>
	</td>
</tr>
</table>
<br><br>
<button type="submit">작성완료</button>
</form>

</div>
