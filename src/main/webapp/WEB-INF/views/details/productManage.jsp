<%@page import="com.sharebridge.dto.ProductDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- https://bbbootstrap.com/snippets/bootstrap-hoverable-table-font-awesome-icons-12773333 --%>
<link rel="stylesheet" href="/sharebridge/css/details/productManage.css">

<%
	List<ProductDto> productList = (List<ProductDto>)request.getAttribute("productList");
	
%>
<body>
	<div class="container d-flex justify-content-center mt-50 mb-50">
	   	<div class="card w-100">
	       	<div class="card-header header-elements-inline">
	       	<h5 class="card-title">상품관리</h5>
	       		<div class="header-elements">
	       			<div class="list-icons text-muted font-weight-light"> <a class="list-icons-item" data-action="collapse" data-abc="true"><i class="fa fa-minus font-weight-light"></i></a> <a class="list-icons-item" data-action="reload" data-abc="true"><i class="fa fa-refresh"></i></a> <a class="list-icons-item" data-action="remove" data-abc="true"><i class="fa fa-close"></i></a> </div>
	       		</div>
	       	</div>
	       	<div class="table-responsive">
	           <table class="table table-hover">
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
			    		<span>**등록된 상품이 없습니다</span>
			    		<%
			    	}else {
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
					            	<a href="goUpdate.do?product_id=<%=p.getProduct_id()%>&category_id=<%=p.getCategory_id()%>">수정</a>
									<a href="delProduct.do?product_id=<%=p.getProduct_id()%>">삭제</a>
					            </td>
					        </tr>
					        <%
				    	}
			    	}
			    	%>
			    </tbody>
	           </table>
	       </div>
	   </div>
	 </div>
 </body>