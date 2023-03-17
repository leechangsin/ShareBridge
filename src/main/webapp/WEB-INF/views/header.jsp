<%@page import="com.sharebridge.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
MemberDto login = (MemberDto)session.getAttribute("login");
%>

<header>
	<img src="/sharebridge/images/header_logo.png" id="header_logo" alt="logo">
	<div>
		<ul id="lnb_wrap">
			<li><a href="login.do" id="login">로그인</a></li>
			<li><a href="logout.do" id="logout">로그아웃</a></li>
			<li><a href="regi.do">회원가입</a></li>
			<li><a href="mypage.do">마이페이지</a></li>
			<li><a href="#noti"> <img src="./images/notification_icon.png" alt="notification"></a></li>
			<li><a href="#wish"> <img src="./images/shoopingcart_icon.png" alt="wish"></a></li>
			<li><a href="#cart"> <img src="./images/wish_icon.png" alt="cart"></a></li>
		</ul>
	</div>
</header>

<%
if(login == null) {
	%>
	<script type="text/javascript">
	document.getElementById("logout").style.display ='none';
	document.getElementById("login").style.display ='';
	</script>
	<%
}else {
	%>
	<script type="text/javascript">
	document.getElementById("login").style.display ='none';
	document.getElementById("logout").style.display ='';
	</script>
	<%
}
%>