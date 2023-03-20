<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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

if(updateProduct != null && !updateProduct.equals("")) {
	int pid = Integer.parseInt(request.getAttribute("pid").toString());
	int cid = Integer.parseInt(request.getAttribute("cid").toString());
	
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

String insertReq = (String)request.getAttribute("insertReq");

if(insertReq != null && !insertReq.equals("")) {
	int rid = Integer.parseInt(request.getAttribute("rid").toString());
	
	if(insertReq.equals("REQUEST_INSERT_OK")) {
		%>
		<script type="text/javascript">
			alert("대여 신청이 완료되었습니다");
			location.href = "successReq.do?request_id=<%=rid%>";
		</script>
		<%
	} else {
		%>
		<script type="text/javascript">	
			alert("대여 신청이 되지 않았습니다");
			location.href = "rentalFrm.do";
		</script>	
		<%
	}
}

String writeQuestion = (String)request.getAttribute("writeQuestion");

if(writeQuestion != null && !writeQuestion.equals("")) {
	int q_pid = (Integer)request.getAttribute("q_pid");
	int q_cid = (Integer)request.getAttribute("q_cid");
	
	if(writeQuestion.equals("QUESTION_INSERT_OK")) {
		%>
		<script type="text/javascript">
			alert("문의가 성공적으로 등록되었습니다");
			location.href = "productDetail.do?product_id=<%=q_pid%>&category_id=<%=q_cid%>";
		</script>
		<%
	} else {
		%>
		<script type="text/javascript">
			alert("문의가 등록되지 않았습니다");
			location.href = "goWriteQuestion.do?product_id=<%=q_pid%>&category_id=<%=q_cid%>";
		</script>
		<%
	}
}
%>