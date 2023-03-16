<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 : sharebridge</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<style type="text/css">
a {
  text-decoration: none;
  color: gray;
}
div {
	padding-top: 40px;
	padding-bottom: 40px;
}
</style>

</head>
<body>

<div align="center">

<table>
<tr>
	<th style="border-bottom: 2px solid gray;">
		<a href="idSearch.do">아이디 찾기</a>
	</th>
	<th style="border-bottom: 2px solid black;">비밀번호 찾기</th>
</tr>
<tr>
	<td colspan="2"><br>이메일 입력</td>
</tr>
<tr>
	<td colspan="2">
		<input type="text" id="email" size="35px">
	</td>
</tr>
<tr>
	<td colspan="2" align="center">
		<br>
		<button type="button" id="find">조회</button>
	</td>
</tr>
</table>

</div>

<script>
$(document).ready(function() {
	$("#find").click(function() {
		$.ajax({
			url : "pwdSearchAf.do",
			type : "POST",
			data : { "email" : $("#email").val() },
			success : function(result) {
				alert(result);
			},
			error:function() {
				alert('error');
			}
		});
	});
});
</script>

</body>
</html>