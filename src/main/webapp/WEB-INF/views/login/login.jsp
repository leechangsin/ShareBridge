<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	if(session.getAttribute("required") != null) {
		session.removeAttribute("required");
%>
	<script>
		alert("로그인이 필요한 기능입니다\n로그인 페이지로 이동합니다");
	</script>
<%
	}
%>

<link rel="stylesheet" href="/sharebridge/css/login/login.css">

<div id="main_contents_wrap" align="center">
	<h1>로그인</h1>
	<br>

	<form action="loginAf.do" method="post">
		<table>
			<tr>
				<td>
					<input type="email" class="form-control" id="id" name="email" placeholder="아이디(이메일)">
				</td>
				<td>
					<a href="idSearch.do">Forget?</a>
				</td>
			</tr>
			<tr>
				<td>
					<input type="password" class="form-control" id="pwd" name="pwd" placeholder="비밀번호">
				</td>
				<td>
					<a href="pwdSearch.do">Forget?</a>
				</td>
			</tr>
			<tr>
				<td>
					<input type="checkbox" id="id_save"> 아이디(이메일) 기억하기
				</td>
				<td>
					<a href="regi.do">회원가입</a>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn light_gray_btn">로그인</button>
				</td>
			</tr>
		</table>
	</form>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		// 쿠키에 저장된 user_id를 user_id라는 변수에 대입
		let user_id = $.cookie("user_id");
		
		// user_id라는 변수에 쿠키값이 들어가있을 경우 if문 실행
		if(user_id != null){
			$("#id").val(user_id);
			$("#id_save").prop("checked", true);
		}
	});
	
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