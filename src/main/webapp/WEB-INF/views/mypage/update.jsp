<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/sharebridge/css/mypage/mypage_common.css">
<link rel="stylesheet" href="/sharebridge/css/mypage/mypage_update.css">

<style>
	
</style>

<main class="container">
	<h1 id="page_title">회원 정보 수정</h1>
	
	<div class="container">
		<form action="updateAf.do" method="POST">
			<div class="mb-3">
				<label for="id" class="form-label">아이디(이메일)</label>
				<input type="email" class="form-control" id="id" name="email" value="${memberInfo.email }" readonly="readonly" disabled="disabled">
			</div>
			
			<div class="mb-3">
				<label for="pwd" class="form-label">비밀번호</label>
				<input type="password" class="form-control" id="pwd" name="pwd" value="${memberInfo.pwd }">
			</div>
			
			<div class="mb-3">
				<label for="pwdchk" class="form-label">비밀번호 확인</label>
				<input type="password" class="form-control" id="pwdchk" name="pwdchk">
			</div>
			
			<div class="mb-3">
				<label for="nickname" class="form-label">닉네임</label>
				<input type="text" class="form-control" id="nickname" name="nickname" value="${memberInfo.nickname }">
			</div>
			
			<div class="mb-3">
				<label for="name" class="form-label">이름</label>
				<input type="text" class="form-control" id="name" name="name" value="${memberInfo.name }">
			</div>
			
			<div class="mb-3">
				<label for="phone_number" class="form-label">휴대전화</label>
				<input type="tel" class="form-control" id="phone_number" name="phone_number" value="${memberInfo.phone_number }">
			</div>
			
			<div class="mb-3">
				<button type="button" class="btn btn-secondary">수정 완료</button>
			</div>
		</form>
	</div>
</main>

<script src="/sharebridge/js/public/common.js"></script>
<script>
	$("#main_contents > main > div > form > div:nth-child(7) > button").on("click", function() {
		let pwd = $("#pwd").val().trim();
		let pwdchk = $("#pwdchk").val().trim();
		let nickname = $("#nickname").val().trim();
		let name = $("#name").val().trim();
		let phone_number = $("#phone_number").val().trim();
		
		if(pwdchk.length != 0 && (pwd != pwdchk)) {
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.\n비밀번호를 변경하려면 비밀번호와 비밀번호 확인이 일치해야합니다.");
			$("#pwdchk").focus();
			return ;
		} else if(nickname.length == 0) {
			alert("닉네임을 입력하세요");
			$("#nickname").focus();
			return ;
		} else if(name.length == 0) {
			alert("이름을 입력하세요");
			$("#name").focus();
			return ;
		} else if(phone_number.length == 0) {
			alert("휴대전화를 입력하세요");
			$("#phone_number").focus();
			return ;
		}
		
		$.ajax({
			url: $("div.container > form").attr("action"),
			type: $("div.container > form").attr("method"),
			data: {"pwd": pwd, "nickname": nickname, "name": name, "phone_number": phone_number},
			success: function() {
				alert("회원 정보를 수정했습니다.");
			},
			error: function(xhr) {
				if(xhr.status == 409) {
					if(xhr.responseText == "nickname") {
						alert("이미 사용중인 닉네임입니다.");
						$("#nickname").focus();
					} else if(xhr.responseText = "phone_number") {
						alert("이미 사용중인 휴대전화번호입니다.");
						$("#phone_number").focus();
					}
				} else if(xhr.status == 300) {
					goTo(xhr.getResponseHeader("Location"));
				} else if(xhr.status == 400) {
					
				} else {
					alert("알 수 없는 문제가 생겼습니다.");
				}
			}
		});
	});

</script>