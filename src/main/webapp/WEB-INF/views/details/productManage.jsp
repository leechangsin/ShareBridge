<%@page import="com.sharebridge.dto.ProductDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/sharebridge/css/review/review.css">
<link rel="stylesheet" href="/sharebridge/css/details/productManage.css">

<%
	List<ProductDto> productList = (List<ProductDto>)request.getAttribute("productList");
%>

<main>
	<h1 id="page_title">상품 관리</h1>
	
	<div>
		<table class="table table-hover table-sm">
			<thead>
				<tr>
					<th>상품명</th>
					<th>대여기간</th>
					<th>대여금액</th>
					<th></th>
				</tr>
			</thead>
			
			<tbody>
		    	<%
		    	if(productList.size() == 0) {
		    		%>
		    		<tr><td colspan="4" style="text-align: center;"><span>**등록된 상품이 없습니다</span></td></tr>
		    		<%
		    	} else {
			    	for(int i=0; i<productList.size(); i++) {
			    		ProductDto p = productList.get(i);
			    		
			    		String sdate = p.getSdate().toString().substring(0,10);
			    		String edate = p.getEdate().toString().substring(0,10);
				    	%>
				        <tr>
				            <td><%=p.getTitle()%></td>
				            <td><%=sdate %>~<%=edate %></td>
				            <td><%=p.getPrice() %>원 / 일</td>
				            <td>
				            	<button type="button" class="btn light_gray_btn" onclick="updateProduct(<%=p.getProduct_id()%>, <%=p.getCategory_id()%>)">수정</button>
								<button type="button" class="btn light_gray_btn" onclick="deleteProduct(<%=p.getProduct_id()%>)">삭제</button>
				            </td>
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
<script>
	function updateProduct(product_id, category_id) {
		goTo("/sharebridge/goUpdate.do?product_id="+product_id+"&category_id="+category_id);
	}
	
	function deleteProduct(product_id) {
		goTo("/sharebridge/delProduct.do?product_id="+product_id);
	}
</script>