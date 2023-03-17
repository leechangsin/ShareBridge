<%@page import="com.sharebridge.dto.CategoryDto"%>
<%@page import="java.util.List"%>
<%@page import="com.sharebridge.dto.ProductDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<!-- flatpickr -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<!-- js -->
<script src="js/productRegi.js" defer></script>
<!-- css -->
<link rel="stylesheet" href="css/details/productRegi.css">

<% 	
	// MemberDto login = (MemberDto)session.getAttribute("login");
	List<CategoryDto> cateList = (List<CategoryDto>)request.getAttribute("allCategory");
	ProductDto getProduct = (ProductDto)request.getAttribute("detail");
	
	int pid = getProduct.getProduct_id();
	int cid = Integer.parseInt(request.getAttribute("cid").toString());
%>

<div class="regi_container">
<h2 class="regi_title">상품 등록 수정</h2>
	<form action="updateProduct.do" method="post" id="frm" enctype="multipart/form-data">
	<input type="hidden" value="<%=pid%>" name="product_id" />
		<table>
			<tr>
				<th>카테고리</th>
				<td>
					<select id="choice" name="category_id">
						<option value="">카테고리</option>
						<%
							for(int i = 0;i < cateList.size();i++) {
								CategoryDto cate = cateList.get(i);
								if(cate.getParent_id() != 0) {
									if(cate.getCategory_id() == cid) {
										%>
										<option value="<%=cate.getCategory_id()%>" selected><%=cate.getName() %></option>
										<%
									} else {
										%>
										<option value="<%=cate.getCategory_id()%>" ><%=cate.getName() %></option>									
										<%
									}
								}
							}
						%>
					</select>
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" id="title" name="title" value="<%=getProduct.getTitle()%>">
				</td>
			</tr>
			<tr>
				<th>대여기간</th>
				<td>
					<input class="selector" id="start" placeholder="시작 날짜" name="sdate" value="<%=getProduct.getSdate() %>"/>
					<input class="selector" id="end" placeholder="마지막 날짜" name="edate" value="<%=getProduct.getEdate() %>"/>
				</td>
			</tr>
			<tr>
				<th>가격</th>
				<td>
					<input type="text" id="price" name="price" value="<%=getProduct.getPrice() %>">
					<span>원 / 일</span>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea rows="30" cols="50" name="content" id="content"><%=getProduct.getContent() %></textarea>	
				</td>
			</tr>
			<tr>
				<th>사진등록</th>
				<td class="photo_regi">
				    <label for="file" class="upload-btn">
				    	<input id="file" type="file" accept="image/*" name="file" onchange="changeImg()"/>
				    	<span>+</span>
				    </label>
				    <img src="<%=getProduct.getPhoto() %>" id="preview" class="image-box" />
				    <button type="button" class="deleteBtn" onclick="deleteImg()">
				    	<img src="images/delete_icon.png" />
				    </button>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="돌아가기" id="backBtn">
					<input type="submit" value="수정하기" id="regiBtn">
				</td>
			</tr>
		</table>
	</form>
</div> 

<script>
$(document).ready(function() {
	$("#backBtn").click(function() {
		location.href="productDetail.do?product_id=" + <%=pid%> + "&category_id=" + <%=cid%>
	});	
});
</script>