<%@page import="com.sharebridge.dto.CategoryDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Registration</title>
<title>Bootstrap datepicket demo</title>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
<script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
<script type='text/javascript'>
$(function(){
$('.input-daterange').datepicker({
    autoclose: true
});
});

</script>

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
	<form action="productRegiAf.do" method="post">
		<table>
			<tr>
				<th>카테고리</th>
				<td>
					<select>
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
				<td  class="input-daterange input-group" id="datepicker">
					<input type="text" class="input-sm form-control" name="sdate" placeholder="From date"/>
    				<span class="input-group-addon">to</span>
    				<input type="text" class="input-sm form-control" name="edate" placeholder="To date"/>
				</td>
			</tr>
			<tr>
				<th>가격</th>
				<td>
					<input type="text" id="price" name="price">
					<span>원 / 일</span>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea rows="30" cols="50" name="content"></textarea>	
				</td>
			</tr>
			<tr>
				<th>사진등록</th>
				<td class="photo_regi">
				    <label for="file" class="upload-btn">
				    	<input id="file" type="file" accept="image/*" name="file" onchange="changeImg()"/>
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
				</td>
			</tr>
		</table>
	</form>
</div>
<script type="text/javascript">
	
	// 사진 미리보기
    const fileInput = document.getElementById("file");
    const preview = document.getElementById("preview");
    var prevURL, currentURL;

    function changeImg() {
      URL.revokeObjectURL(prevURL);
      const selectedFile = fileInput.files[0];
      if (selectedFile) {
        currentURL = URL.createObjectURL(selectedFile);
        preview.src = currentURL;
        prevURL = currentURL;
      }
    };
    
    function deleteImg() {
    	const selectedFile = fileInput.files[0];
        if (selectedFile) {
        	currentURL = URL.createObjectURL(selectedFile);
	    	URL.revokeObjectURL(currentURL);
			
	    	preview.src="https://i0.wp.com/adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg";
        }  
    }
    
    // 빈칸검사
    
    
   
</script>
</body>
</html>