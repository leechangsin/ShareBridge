<%@page import="com.sharebridge.dto.RequestDto"%>
<%@page import="java.util.List"%>
<%@page import="com.sharebridge.dto.MemberDto"%>
<%@page import="com.sharebridge.dto.ProductDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/sharebridge/css/review/review.css">

<%
MemberDto mem = (MemberDto)session.getAttribute("login");
List<RequestDto> rentalDate = (List<RequestDto>)request.getAttribute("rentalDate");
List<ProductDto> product = (List<ProductDto>)request.getAttribute("product");
List<String> nickname = (List<String>)request.getAttribute("nickname");
%>
<main>
	<h1 id="page_title">후기 관리</h1>
	
	<div align="center">
		<table class="table table-hover table-sm">
			<thead>
				<tr>
					<th>상품명</th>
					<th>대여기간</th>
					<th>대여금액</th>
					<th>후기</th>
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
					<tr renter_id="<%=prod.getMember_id() %>">
						<td>
							<span id="nickname"><%=name %></span>
							<span id="product_name"><%=prod.getTitle() %></span>
						</td>
						
						<td><%=sdate.substring(0, 10) %> ~ <%=edate.substring(0, 10) %></td>
						<td><%=prod.getPrice() %>원 / 일</td>
						
						<%
						if(dto.getIs_review() == 0){
							%>			
							<td onclick="event.cancelBubble = true;">
								<button type="button" class="btn light_gray_btn" onclick="writeReview(<%=prod.getProduct_id() %>, <%=dto.getRequest_id() %>)">후기작성</button>
							</td>			
							<%
						}else if(dto.getIs_review() == 1){
							%>
							<td onclick="event.cancelBubble = true;">
								<button type="button" class="btn light_gray_btn" onclick="updateReview(<%=dto.getRequest_id() %>)">후기수정</button>
								<button type="button" class="btn light_gray_btn" onclick="deleteReview(<%=dto.getRequest_id() %>)">후기삭제</button>
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
</main>

<script src="/sharebridge/js/public/common.js"></script>
<script type="text/javascript">
	$("#main_contents > main > div > table > tbody > tr").on("click", function() {
		let renter_id = $(this).attr("renter_id");
		
		goTo("/sharebridge/sellerInfo.do?renterId="+renter_id);
	});

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