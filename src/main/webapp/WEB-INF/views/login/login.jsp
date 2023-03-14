<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sharebridge : 로그인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>

<style type="text/css">
a {
  text-decoration: none;
  color: black;
}

div {
	padding-top: 40px;
	padding-bottom: 40px;
}
</style>

</head>
<body>

<div align="center">
<h1>로그인</h1>
<br>

<form action="loginAf.do" method="post">
<table>
<tr>
	<td>
		<input type="text" id="id" name="email" size="35px" placeholder="Email Address">
	</td>
	<td align="right">
		<a href="idSearch.do">Forget?</a>
	</td>
</tr>

<tr>
	<td>
		<br><input type="text" name="pwd" size="35px" placeholder="Password">
	</td>
	<td align="right">
		<br><a href="pwdSearch.do">Forget?</a>
	</td>
</tr>
<tr>
	<td>
		<br><input type="checkbox" id="id_save"> Remember me
	</td>
	<td align="right">
		<br><a href="regi.do">회원가입</a>
	</td>
</tr>
<tr>
	<td colspan="2" align="center">
		<br>
		<button type="submit">로그인</button><br>
	</td>
</tr>
</table>
</form>

</div>

<script type="text/javascript">
// 쿠키에 저장된 user_id를 user_id라는 변수에 대입
let user_id = $.cookie("user_id");

// user_id라는 변수에 쿠키값이 들어가있을 경우 if문 실행
if(user_id != null){
	$("#id").val(user_id);
	$("#id_save").prop("checked", true);
}

// id 저장이라는 체크박스를 클릭했을 때 실행
$("#id_save").click(function(){
	if($("#id_save").is(":checked")){
		
		if($("#id").val().trim() == ""){
			alert('id를 입력해주세요');
			$("#id_save").prop("checked", false);
		}else{
			// cookie를 저장
			$.cookie("user_id", $("#id").val().trim(), {expires:7, path:'./'})
		}
	}else{
		
		$.removeCookie("user_id", {path:'./'});
	}
});
</script>

</body>
</html>