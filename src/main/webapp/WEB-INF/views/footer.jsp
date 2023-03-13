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

footer {
	display: flex;
	background-color: #505D58;
}

.footer_logo {
}

.footer_wrap {
	width : 67.30%;
	display: flex;
	flex-direction: column;
	justify-content: end;
}

.fnb_wrap {
  list-style:none;
  padding : 0;
  margin-bottom: 17px;
}

li {
  float:left;
}

a {
  text-decoration: none; 
  outline: none
  font-size: 14px;
}

li:not(:last-child) {
	margin-right: 79px;
}

li:nth-child(3) {
	font-weight: 700;
}

a, span, .copy {
  color: #F9F9F9; 
}

.info {
	display:block;
	margin-top: 10px;
	font-size: 12px;
}

b {
	padding-right: 9px;
}

.footer_info {
	margin: 0;
	padding-bottom: 34px;
	border-bottom: 1px solid #F9F9F9;
}

.copy {
	margin: 27px 0 45px auto;
	font-size: 14px;
}
</style>
</head>
<body>
<footer>
    <img src="./images/footer_logo.png" class="footer_logo" alt="logo">
    <div class="footer_wrap">
      <ul class="fnb_wrap">
        <li>
          <a href="#">서비스 소개</a>
        </li>
        <li>
          <a href="#">이용약관</a>
        </li>
        <li>
          <a href="#">개인정보 처리방침</a>
        </li>
        <li>
          <a href="#">고객센터</a>
        </li>
      </ul>
      <p class="footer_info">
	      <span class="info">
	      	<b>프로젝트명</b> 
	      	<span>ShareBridge<span></span>
	      </span>
	      <span class="info">
	      	<b>1팀</b> 
	      	<span>안선정, 차민재, 고은아, 이창신</span>
	      </span>
      </p>
      <p class="copy">
      	Copyright © ShareBridge All rights reserved
      </p>
    </div>
  <footer>
</body>
</html>