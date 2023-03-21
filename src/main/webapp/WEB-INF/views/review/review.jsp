<%@page import="com.sharebridge.dto.RequestDto"%>
<%@page import="java.util.List"%>
<%@page import="com.sharebridge.dto.MemberDto"%>
<%@page import="com.sharebridge.dto.ProductDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>후기 관리 : sharebridge</title>

<style type="text/css">
.margin {
	padding-bottom: 200px;
	padding-top: 200px;
}
</style>

<%
MemberDto mem = (MemberDto)session.getAttribute("login");
List<RequestDto> rentalDate = (List<RequestDto>)request.getAttribute("rentalDate");
List<ProductDto> product = (List<ProductDto>)request.getAttribute("product");
List<String> nickname = (List<String>)request.getAttribute("nickname");
%>
<main class="margin">
	<h1>후기 관리</h1>
	
	<div align="center">
	<br>
	
	<table class="table table-hover table-sm" style="width: 1000px">
	<col width="100"><col width="100"><col width="100"><col width="100">
	<thead class="thead-dark">
	<tr>
		<th>상품명</th><th>대여기간</th><th>대여금액</th><th>후기</th>
	</tr>
	</thead>
	<tbody>
	
	<%
	if(rentalDate == null || rentalDate.size() == 0){
		%>
		<tr>
			<td colspan="4">작성할 후기가 없습니다</td>
		</tr>
		<%
	}else{
		
		for(int i = 0;i < rentalDate.size(); i++)
		{
			RequestDto dto = rentalDate.get(i);
			String sdate = dto.getSdate().toString();
			String edate = dto.getEdate().toString();
			ProductDto prod = product.get(i);
			String name = nickname.get(i);
			 
			%>
			<tr>
				<td>
					<a href="sellerInfo.do?renterId=<%=prod.getMember_id() %>"><%=name %></a><br>
					<%=prod.getTitle() %>
				</td>
				
				<td><%=sdate.substring(0, 10) %> ~ <%=edate.substring(0, 10) %></td>
				<td><%=prod.getPrice() %></td>
				
				<%
				if(dto.getIs_review() == 0){
					%>			
					<td>
						<button type="button" onclick="writeReview(<%=prod.getProduct_id() %>, <%=dto.getRequest_id() %>)">후기작성</button>
					</td>			
					<%
				}else if(dto.getIs_review() == 1){
					%>
					<td>
						<button type="button" onclick="updateReview(<%=dto.getRequest_id() %>)">후기수정</button>
						<button type="button" onclick="deleteReview(<%=dto.getRequest_id() %>)">후기삭제</button>
					</td>
					<%
				}	
				%>
				
			</tr>
			<%
		}
	}
	%>
	
	</tbody>
	</table>
	
	</div>
	
	<script type="text/javascript">
	function writeReview(product_id, request_id) {
		location.href="writeReview.do?product_id=" + product_id + "&request_id=" + request_id;
	}
	
	function updateReview(request_id) {	// 후기 수정
		location.href="updateReview.do?request_id=" + request_id;
	}
	
	function deleteReview(request_id) {	// 후기 삭제
		location.href="deleteReview.do?request_id=" + request_id;
	}
	</script>
</main>