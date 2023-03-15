<%@page import="com.sharebridge.dto.CategoryDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Registration</title>

<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<!-- flatpickr -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

<!-- js -->
<script src="js/productRegi.js" defer></script>

<style type="text/css">
.regi_container {
/* 	margin: 0 412px; */
}
.regi_title {
	font-size: 24px;
	font-weight: bold;
}

input[type='date']::before {
  content: attr(data-placeholder);
  width: 100%;
}

input[type='date']:focus::before,
input[type='date']:valid::before {
  display: none;
}

.image-box {
   width: 200px;
   height: 200px;
   object-fit: cover;
   display: block;
 }

.upload-btn {
   border: 1px solid #ddd;
   padding: 6px 12px;
   display: inline-block;
   cursor: pointer;
}

input[type=file] {
  display: none;
} 
</style>
</head>
<body>

<% 
	List<CategoryDto> cateList = (List<CategoryDto>)request.getAttribute("allCategory");
%>

<div class="regi_container">
<h2 class="regi_title">상품등록</h2>
	<form action="productRegiAf.do" method="post" id="frm" enctype="multipart/form-data">
		<table>
			<tr>
				<th>카테고리</th>
				<td>
					<select id="choice" name="choice">
						<option value="">카테고리</option>
						<%
							for(int i = 0;i < cateList.size();i++) {
								CategoryDto cate = cateList.get(i);
								if(cate.getParent_id() != 0) {
								%>
								<option value="<%=cate.getCategory_id()%>" name="category_id" ><%=cate.getName() %></option>
								<%
								}
							}
						%>
					</select>
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" id="title" name="title">
				</td>
			</tr>
			<tr>
				<th>대여기간</th>
				<td>
					<input class="selector" id="start" placeholder="시작 날짜" readonly="readonly" />
					<input class="selector" id="end" placeholder="마지막 날짜" readonly="readonly" />
				</td>	
			</tr>
			<tr>
				<th>가격</th>
				<td>
					<input type="number" id="price" name="price">
					<span>원 / 일</span>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea rows="30" cols="50" name="content" id="content"></textarea>	
				</td>
			</tr>
			<tr>
				<th>사진등록</th>
				<td class="photo_regi">
				    <label for="file" class="upload-btn">
				    	<input id="file" type="file" accept="image/*" name="fileload" onchange="changeImg()"/>
				    	<span>+</span>
				    </label>
				    <img src="https://i0.wp.com/adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg" id="preview" class="image-box" />
				    <button type="button" class="deleteBtn" onclick="deleteImg()">
				    	<img src="images/delete_icon.png" />
				    </button>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="등록하기" id="regiBtn">
					<input type="button" value="test" id="test">
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>