<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&family=Noto+Sans:wght@300;400;500;600;700;800&family=PT+Serif:ital@1&family=Roboto&family=Source+Sans+Pro:wght@600;700&display=swap" rel="stylesheet">
<style type="text/css">
body {
	margin: 0;
}

header {
	position : relative;
}

.header_logo {
	margin: auto;
    display: block;
}
  
.lnb_wrap {
  list-style:none;
  margin:0;
  position: absolute;
  top: 36px;
  right : 72px;
}

li {
  float:left;
}

li:not(:last-child) {
  margin-right: 26px;
}

a {
  color: #474747; 
  text-decoration: none; 
  outline: none
  
}




</style>
</head>
<body>
  <header>
    <img src="./images/header_logo.png" class="header_logo" alt="logo">
    <div>
    <ul class="lnb_wrap">
      <li>
        <a href="#login">로그인</a>
      </li>
      <li>
      <a href="#regi">회원가입</a>
      </li>
      <li>
      <a href="#mypage">마이페이지</a>
      </li>
      <li>
      <a href="#noti">
        <img src="./images/notification_icon.png" alt="notification">
      </a>
      </li>
      <li>
      <a href="#wish">
        <img src="./images/shoopingcart_icon.png" alt="wish">
      </a>
      </li>
      <li>
        <a href="#cart">
          <img src="./images/wish_icon.png" alt="cart">
        </a>
      </li>
    </ul>
  </header>
</body>
</html>