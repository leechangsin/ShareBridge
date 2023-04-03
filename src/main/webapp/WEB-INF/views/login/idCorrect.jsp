<%@page import="com.sharebridge.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/sharebridge/css/login/id_correct.css">

<%
MemberDto mem = (MemberDto)request.getAttribute("mem");

if(mem == null){
	%>
	<div>
		<h3>입력하신 전화번호와 일치하는 계정이 없습니다.</h3>
		
		<button type="button" class="btn light_gray_btn" onclick="search()">아이디 찾기로 돌아가기</button>
	</div>
	<script type="text/javascript">
	function search() {
		history.back();
	}
	</script>
	<%
}else{
	%>
	<div>
		<h3><%=mem.getNickname() %>님의 이메일은 <strong><%=mem.getEmail() %></strong>입니다.</h3>
	
		<button type="button" class="btn light_gray_btn" onclick="login()">로그인 화면으로 돌아가기</button>
	</div>
	
	<script type="text/javascript">
	function login() {
		location.href = "login.do";
	}
	</script>
	<%
}
%>