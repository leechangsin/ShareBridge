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
	<div align="center">
	<h3>입력하신 전화번호와 일치하는 계정이 없습니다.</h3>
	<br>
	
	<button type="button" onclick="search()">아이디 찾기로 돌아가기</button>
	</div>
	<script type="text/javascript">
	function search() {
		location.href = "idSearch.do";
	}
	</script>
	<%
}else{
	%>
	<div align="center">
	<h3><%=mem.getNickname() %>님의 이메일은 <%=mem.getEmail() %>입니다.</h3>
	<br>
	
	<button type="button" onclick="login()">로그인 화면으로 돌아가기</button>
	</div>
	<script type="text/javascript">
	function login() {
		location.href = "login.do";
	}
	</script>
	<%
	
}
%>

</body>
</html>