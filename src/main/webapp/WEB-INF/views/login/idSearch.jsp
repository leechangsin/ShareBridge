<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 : sharebridge</title>

<style type="text/css">
a {
  text-decoration: none;
  color: gray;
}
</style>

</head>
<body>

<div align="center">

<form action="idSearchAf.do" method="post">
<table>
<tr>
	<th style="border-bottom: 2px solid black;">아이디 찾기</th>
	<th style="border-bottom: 2px solid gray;">
		<a href="pwdSearch.do">비밀번호 찾기</a>
	</th>
</tr>
<tr>
	<td colspan="2"><br>연락처 입력</td>
</tr>
<tr>
	<td colspan="2">
		<input type="text" name="phone_number" size="35px">
	</td>
</tr>
<tr>
	<td colspan="2" align="center">
		<br>
		<button type="submit">조회</button>
	</td>
</tr>
</table>
</form>

</div>



</body>
</html>