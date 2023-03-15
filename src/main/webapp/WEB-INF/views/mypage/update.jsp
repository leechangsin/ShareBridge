<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/sharebridge/css/mypage/mypage_common.css">
<link rel="stylesheet" href="/sharebridge/css/mypage/mypage_update.css">

<style>
	#id {
		border: none;
	}
</style>

<main class="container">
	<h1 id="page_title">회원 정보 수정</h1>
	
	<div class="container">
		<form action="upldateAf.do" method="POST">
			<div class="mb-3">
				<label for="id" class="form-label">아이디(이메일)</label>
				<input type="email" class="form-control" id="id" name="email" value="${member.name }" readonly="readonly" disabled="disabled">
			</div>
			
			<div class="mb-3">
				<label for="pwd" class="form-label">비밀번호</label>
				<input type="password" class="form-control" id="pwd" name="pwd" value="${member.pwd }">
			</div>
			
			<div class="mb-3">
				<label for="pwdchk" class="form-label">비밀번호 확인</label>
				<input type="password" class="form-control" id="pwdchk" name="pwdchk">
			</div>
			
			<div class="mb-3">
				<label for="nickname" class="form-label">닉네임</label>
				<input type="text" class="form-control" id="nickname" name="nickname" value="${member.nickname }">
			</div>
			
			<div class="mb-3">
				<label for="name" class="form-label">이름</label>
				<input type="text" class="form-control" id="name" name="name" value="${member.name }">
			</div>
			
			<div class="mb-3">
				<label for="tel" class="form-label">휴대전화</label>
				<input type="tel" class="form-control" id="tel" name="tel" value="${member.phone_number }">
			</div>
			
			<div class="mb-3">
				<button type="button" class="btn btn-secondary">수정 완료</button>
			</div>
		</form>
	</div>
</main>

<script>
	$("#main_contents > main > div > div:nth-child(7) > button").on("click", function() {
		let pwd = $("#pwd").val().trim();
		let pwdchk = $("#pwdchk").val().trim();
		let nickname = $("#nickname").val().trim();
		let name = $("#name").val().trim();
		let tel = $("#tel").val().trim();
		
		if(pwdchk.length != 0 && (pwd != pwdchk)) {
			alert("비밀번호를 변경하려면 비밀번호와 비밀번호 확인이 일치해야합니다.\n비밀번호와 비밀번호 확인이 일치하지 않습니다.");
			return ;
		} else if(nickname.length == 0) {
			alert("닉네임을 입력하세요");
			$("#nickname").focus();
			return ;
		} else if(name.length == 0) {
			alert("이름을 입력하세요");
			$("#name").focus();
			return ;
		} else if(tel.length == 0) {
			alert("휴대전화를 입력하세요");
			$("#tel").focus();
			return ;
		}
		
		$.ajax({
			url: $("form").attr("action"),
			type: $("form").attr("method"),
			data: {"pwd": pwd, "nickname": nickname, "name": name, "tel": tel},
			success: function() {
				alert("회원 정보를 수정했습니다.");
			},
			error: function() {
				alert("알 수 없는 문제가 생겼습니다.");
			}
		});
	});

</script>