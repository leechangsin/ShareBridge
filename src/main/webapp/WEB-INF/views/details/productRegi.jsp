<%@page import="com.sharebridge.dto.MemberDto"%>
<%@page import="com.sharebridge.dto.CategoryDto"%>
<%@page import="java.util.List"%>
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
	MemberDto login = (MemberDto)session.getAttribute("login");
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
					<input type="hidden" value="<%=login.getMember_id() %>" name="member_id" />
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
</script>
</body>
</html>
</div>
