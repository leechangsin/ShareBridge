<%@page import="com.sharebridge.dto.RequestDto"%>
<%@page import="java.util.List"%>
<%@page import="com.sharebridge.dto.MemberDto"%>
<%@page import="com.sharebridge.dto.ProductDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 관리 : sharebridge</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>

<%
MemberDto mem = (MemberDto)session.getAttribute("login");
List<RequestDto> rentalDate = (List<RequestDto>)request.getAttribute("rentalDate");
List<ProductDto> product = (List<ProductDto>)request.getAttribute("product");
List<String> nickname = (List<String>)request.getAttribute("nickname");
%>

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
		ProductDto prod = product.get(i);
		String name = nickname.get(i);
		 
		%>
		<tr>
			<td>
				<%=name %><br>
				<%=prod.getTitle() %>
			</td>
			
			<td><%-- <%=dto.getSdate() + "~" + dto.getEdate() %> --%>임시</td>
			<td><%=prod.getPrice() %></td>
			<td><button type="button" onclick="writeReview(<%=prod %>)">후기작성</button></td>
			
			<%-- <%
			if(dto.getDel() == 0){
				%>			
				<td>
					<%=Utility.arrow(dto.getDepth()) %>
					<a href="bbsdetail.do?seq=<%=dto.getSeq() %>">
						<%=dto.getTitle() %>
					</a>
				</td>			
				<%
			}else if(dto.getDel() == 1){
				%>
				<td>
					<%=Utility.arrow(dto.getDepth()) %>
					<font color="#ff0000">*** 이 글은 작성자에 의해서 삭제되었습니다 ***</font>	
				</td>
				<%
			}	
			%> --%>
			
		</tr>
		<%
	}
}
%>

</tbody>
</table>

</div>

<script type="text/javascript">
function writeReview(prod) {
	location.href="writeReview.do?prod=" + prod;
}
</script>

</body>
</html>