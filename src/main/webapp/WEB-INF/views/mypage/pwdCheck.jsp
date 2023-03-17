<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/sharebridge/css/mypage/mypage_common.css">
<link rel="stylesheet" href="/sharebridge/css/mypage/mypage_pwd_chk.css">

<main>
	<h1 id="page_title">비밀번호를 입력해주세요</h1>
	
	<form action="go_from.do" method="POST">
		<input type="password" class="form-control" id="inputPassword">
		<button type="button" class="btn light_gray_btn mb-3">확인</button>
	</form>
</main>

<script src="/sharebridge/js/public/common.js"></script>
<script>
		$("button").on("click", function() {
			let pwd = $("input[type=password]").val();
			pwd = pwd.trim();
			
			if(pwd.length == 0) {
				alert("비밀번호를 입력해주세요");
				$("input[type=password]").focus();
				
				return ;
			}
			
			$.ajax({
				url: $("form").attr("action"),
				type: $("form").attr("method"),
				data: {"pwd": pwd},
				error: function(xhr) {
					if(xhr.status == 300) {
						goTo(xhr.getResponseHeader("Location"));
					} else if(xhr.status == 403) {
						alert("잘못된 접근입니다.\n첫 페이지로 돌아갑니다.");
						goTo("/index.do");
					} else {
						alert("비밀번호가 일치하지 않습니다.\n비밀번호를 다시 입력해주세요");
						$("input[type=password]").focus();
					}
				}
			});
		});
	</script>