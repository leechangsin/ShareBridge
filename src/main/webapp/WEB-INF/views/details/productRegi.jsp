<%@page import="com.sharebridge.dto.MemberDto"%>
<%@page import="com.sharebridge.dto.CategoryDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- css -->
<link rel="stylesheet" href="/sharebridge/css/details/productRegi.css">

<!-- js -->
<script src="js/productRegi.js" defer></script>

<%
	MemberDto login = (MemberDto) session.getAttribute("login");
	List<CategoryDto> cateList = (List<CategoryDto>) session.getAttribute("categories");
%>

<div class="regi_container">
	<h3 class="title">상품등록</h3>
	<form action="productRegiAf.do" method="post" id="frm" enctype="multipart/form-data">
		<input type="hidden" value="<%=login.getMember_id() %>" name="member_id" />
		<table>
			<tr>
				<th><label for="category" class="form-label">카테고리</label></th>
				<td>
					<select id="choice" name="category_id" class="custom-select">
						<option value="">카테고리를 선택하세요.</option>
						<%
							for(int i = 0;i < cateList.size();i++) {
								CategoryDto cate = cateList.get(i);
								if(cate.getParent_id() != 0) {
								%>
								<option value="<%=cate.getCategory_id()%>"><%=cate.getName() %></option>
								<%
								}
							}
						%>
					</select>
				</td>
			</tr>
			<tr>
				<th><label for="title" class="form-label">제목</label></th>
				<td>
					<input type="text" maxlength="200" class="form-control" id="title" name="title">
				</td>
			</tr>
			<tr>
				<th><label class="form-label">대여기간</label></th>
				<td>
					<input class="selector form-control" id="start" placeholder="시작 날짜" />
					<input class="selector form-control" id="end" placeholder="마지막 날짜" />
					<input type="hidden" id="startDate" name="start" />
					<input type="hidden" id="endDate" name="end" />
				</td>	
			</tr>
			<tr>
				<th><label for="price" class="form-label">가격</label></th>
				<td>
					<input type="number" class="form-control" id="price" name="price">
					<span>원 / 일</span>
				</td>
			</tr>
			<tr>
				<th><label for="content" class="form-label">내용</label></th>
				<td>
					<textarea maxlength="1000" rows="30" cols="50" class="form-control" name="content" id="content"></textarea>
				</td>
			</tr>
			<tr>
				<th><label for="file" class="form-label">사진 등록</label></th>
				<td class="photo_regi">
					<div>
						<label for="file" class="upload-btn">
					    	<input id="file" type="file" accept="image/*" name="fileload" onchange="changeImg()"/>
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
			<button type="submit" id="writeBtn" class="btn">등록하기</button>
		</div>
	</form>
</div> 
