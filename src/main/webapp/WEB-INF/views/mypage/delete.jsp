<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/sharebridge/css/mypage/mypage_common.css">
<link rel="stylesheet" href="/sharebridge/css/mypage/mypage_delete.css">

<main>
	<div id="title_wrap">
		<h1 id="page_title">회원 탈퇴</h1>
		<p>탈퇴하시는 이유를 알려주세요</p>
	</div>
	
	<div id="contents_wrap">
		<form action="deleteAf.do" method="POST">
			<div id="select_wrap">
				<select class="form-select">
					<option value="">선택해주세요</option>
					<option value="사유1">사유1</option>
					<option value="사유2">사유2</option>
					<option value="사유3">사유3</option>
					<option value="직접 입력">직접 입력</option>
				</select>
			</div>
			<div id="input_wrap">
				<input type="text" id="direct" placeholder="소중한 의견을 입력해주세요">
			</div>
			<div id="button_wrap">
				<button type="button" class="btn light_gray_btn mb-3">탈퇴 완료</button>
			</div>
		</form>
	</div>
</main>

<script src="/sharebridge/js/public/common.js"></script>
<script>
	$("#select_wrap > select").on("change", function() {
		let value = this.value;
		if(value == "직접 입력") {
			$("#input_wrap").css("display", "block");
		} else {
			$("#input_wrap").css("display", "none");
		}
	});
	
	$("#button_wrap > button").on("click", function() {
		let reason = $("#select_wrap > select").val();
		
		if(reason == "") {
			alert("탈퇴 사유를 선택해주세요.");
			$("#select_wrap > select").focus();
			return ;
		} else if(reason == "직접 입력") {
			reason = $("#input_wrap > input").val();
			reason = reason.trim();
			
			if(reason == "") {
				alert("탈퇴 사유를 선택해주세요.");
				$("#select_wrap > select").focus();
				return ;
			}
		}
			
		$.ajax({
			url: $("form").attr("action"),
			type: $("form").attr("method"),
			data: {"reason": reason},
			success: function() {
				alert("탈퇴 처리가 완료 되었습니다\n첫 화면으로 돌아갑니다");
				goTo("/main.do");
			},
			error: function() {
				alert("알 수 없는 문제가 생겼습니다.");
			}
		});
	});
</script>