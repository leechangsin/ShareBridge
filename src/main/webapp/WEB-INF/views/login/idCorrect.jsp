<%@page import="com.sharebridge.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 : sharebridge</title>
</head>
<body>

<%
MemberDto mem = (MemberDto)request.getAttribute("mem");
if(mem.getEmail() != null && !mem.getEmail().equals("")){
	%>
	<p>nickname</p>
	<script type="text/javascript">
	location.href = "login.do";
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
	alert("가입되지 않았습니다 다시 가입해주세요");
	location.href = "regi.do";
	</script>
	<%
	
}
%>

</body>
</html>