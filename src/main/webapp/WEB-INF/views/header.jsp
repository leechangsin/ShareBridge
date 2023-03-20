<%@page import="com.sharebridge.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
MemberDto login = (MemberDto)session.getAttribute("login");
%>

<header>
	<div id="logo_wrap">
		<a href="/sharebridge/baseLayout.do"><img src="/sharebridge/images/header_logo.png" id="header_logo" alt="logo"></a>
	</div>
	<div>
		<ul id="lnb_wrap">
			<li><a href="/sharebridge/login.do" id="login">로그인</a></li>
			<li><a href="/sharebridge/logout.do" id="logout">로그아웃</a></li>
			<li><a href="/sharebridge/regi.do" id="regi">회원가입</a></li>
			<li><a href="/sharebridge/mypage/mypage.do">마이페이지</a></li>
			<li><a href="/sharebridge/notification/notification_list.do"> <img src="/sharebridge/images/notification_icon.png" alt="notification"></a></li>
			<li><a href="wish.do"> <img src="/sharebridge/images/wish_icon.png" alt="wish"></a></li>
			<li><a href="cart.do"> <img src="/sharebridge/images/shoopingcart_icon.png" alt="cart"></a></li>
		</ul>
	</div>
</header>

<%
if(login == null) {
	%>
	<script type="text/javascript">
	document.getElementById("logout").style.display ='none';
	document.getElementById("login").style.display ='';
	document.getElementById("regi").style.display ='';
	</script>
	<%
}else {
	%>
	<script type="text/javascript">
	document.getElementById("login").style.display ='none';
	document.getElementById("regi").style.display ='none';
	document.getElementById("logout").style.display ='';
	</script>
	<%
}
%>