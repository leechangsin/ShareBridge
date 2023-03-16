<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sharebridge : 회원가입</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<style type="text/css">
div {
	padding-top: 20px;
	padding-bottom: 20px;
}
table {
    border: 1px solid #444444;
}
.top_padding {
	padding-top : 1em;
}
.left_padding {
	padding-left: 1em;
}
.btm_padding {
	padding-right: 1em;
	padding-bottom: 1em;
}
</style>

</head>
<body>

<div align="center">

<h2>회원가입</h2>
<br>

<form action="regiAf.do" method="post">
<table>
<tr>
	<td class="top_padding" colspan="2">아이디(이메일)</td>
</tr>
<tr>
	<td class="left_padding">
		<br><input type="text" id="email" name="email" size="30px"><br>
		<p id="emailcheck" style="font-size: 8px"></p>
	</td>
	<td><br><button type="button" id="emailChkBtn">중복확인</button></td>
</tr>
<tr>
	<td colspan="2"><br>비밀번호</td>
</tr>
<tr>
	<td colspan="2">
		<br><input type="password" id='pwd' size="30px">
	</td>
</tr>
<tr>
	<td colspan="2"><br>비밀번호 확인</td>
</tr>
<tr>
	<td colspan="2">
		<br><input type="password" id='pwdChk' name="pwd" size="30px"><br>
		<p id="pwdcheck" style="font-size: 8px"></p>
	</td>
</tr>
<tr>
	<td colspan="2"><br>닉네임</td>
</tr>
<tr>
	<td>
		<br><input type="text" id="nickname" name="nickname" size="30px"><br>
		<p id="nickcheck" style="font-size: 8px"></p>
	</td>
	<td><br><button type="button" id="nickChkBtn">중복확인</button></td>
</tr>
<tr>
	<td colspan="2"><br>이름</td>
</tr>
<tr>
	<td colspan="2">
		<br><input type="text" name="name" size="30px">
	</td>
</tr>
<tr>
	<td colspan="2"><br>휴대전화</td>
</tr>
<tr>
	<td class="btm_padding" colspan="2">
		<br><input type="text" name="phone_number" size="30px">
	</td>
</tr>
</table>
<br>

<button type="submit">회원가입</button>
</form>

</div>

<script type="text/javascript">
$(document).ready(function() {
	
	$("#emailChkBtn").click(function() {
		
		$.ajax({
			type:"post",
			url:"emailcheck.do",
			data:{ "email":$("#email").val() },
			success:function(msg){
				
				if(msg == "YES"){
					$("#emailcheck").css("color", "#0000ff");
					$("#emailcheck").text("사용할 수 있는 아이디입니다");
				}else{
					$("#emailcheck").css("color", "#ff0000");
					$("#emailcheck").text("사용중인 아이디입니다");
					$("#email").val("");
				}
			},
			error:function(){
				alert('error');
			}
		});
	});
	
	$("#nickChkBtn").click(function() {
		
		$.ajax({
			type:"post",
			url:"nickcheck.do",
			data:{ "nickname":$("#nickname").val() },
			success:function(msg){
				
				if(msg == "YES"){
					$("#nickcheck").css("color", "#0000ff");
					$("#nickcheck").text("사용할 수 있는 닉네임입니다");
				}else{
					$("#nickcheck").css("color", "#ff0000");
					$("#nickcheck").text("사용중인 닉네임입니다");
					$("#nickname").val("");
				}
			},
			error:function(){
				alert('error');
			}
		});
	});
	
	$("#pwdChk").on("change", function() {
		let pwd = $('#pwd').val();
		let pwdChk = $('#pwdChk').val();
		// console.log(pwd);
		// console.log(pwdChk);
		
		if(pwd == pwdChk) {
			$("#pwdcheck").css("color", "#0000ff");
			$("#pwdcheck").text("비밀번호가 일치합니다.");
		}else {
			$("#pwdcheck").css("color", "#ff0000");
			$("#pwdcheck").text("비밀번호가 일치하지 않습니다.");
		}
	});
});
</script>

</body>
</html>