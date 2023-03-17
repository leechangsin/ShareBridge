<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
String insertProduct = (String)request.getAttribute("insertProduct");
if(insertProduct != null && !insertProduct.equals("")) {
	if(insertProduct.equals("PRODUCT_INSERT_OK")) {
		%>
		<script type="text/javascript">
			alert("상품이 성공적으로 등록되었습니다");
			location.href = "baseLayout.do";
		</script>
		<%
	} else {
		%>
		<script type="text/javascript">
			alert("상품이 등록되지 않았습니다");
			location.href = "productRegi.do";
		</script>		
		<%
	}
}

String delProduct = (String)request.getAttribute("delProduct");
if(delProduct != null && !delProduct.equals("")) {
	if(delProduct.equals("PRODUCT_DELETE_OK")) {
		%>
		<script type="text/javascript">
			alert("상품이 성공적으로 삭제되었습니다");
			location.href = "baseLayout.do";
		</script>
		<%
	} else {
		%>
		<script type="text/javascript">
			alert("상품이 삭제되지 않았습니다");
			location.href = "productDetail.do";
		</script>		
		<%
	}
}

String updateProduct = (String)request.getAttribute("updateProduct");
int pid = Integer.parseInt(request.getAttribute("pid").toString());
int cid = Integer.parseInt(request.getAttribute("cid").toString());

if(updateProduct != null && !updateProduct.equals("")) {
	if(updateProduct.equals("PRODUCT_UPDATE_OK")) {
		%>
		<script type="text/javascript">
			alert("상품이 성공적으로 수정되었습니다");
			location.href = "productDetail.do?product_id=<%=pid%>&category_id=<%=cid%>";
		</script>
		<%
	} else {
		%>
		<script type="text/javascript">
			alert("상품이 수정되지 않았습니다");
			location.href = "productDetail.do";
		</script>		
		<%
	}
}
%>