<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/sharebridge/css/mypage/mypage_common.css">
<link rel="stylesheet" href="/sharebridge/css/mypage/mypage_update.css">
<link rel="stylesheet" href="/sharebridge/css/login/regi.css">

<main class="container">
	<h1 id="page_title">회원가입</h1>

	<div class="container">
		<form action="regiAf.do" method="post" enctype="multipart/form-data">
			<div class="mb-3">
				<label for="id" class="form-label">아이디(이메일)</label>
				<input type="email" class="form-control" id="regi_id" name="email">
				<button type="button" class="btn light_gray_btn" id="emailChkBtn">중복확인</button>
				<div class="alert alert-danger" role="alert" id="no_email">이미 사용중인 아이디입니다</div>
				<div class="alert alert-primary" role="alert" id="yes_email">사용할 수 있는 아이디입니다</div>
			</div>
			<div class="mb-3">
				<label for="pwd" class="form-label">비밀번호</label>
				<input type="password" class="form-control" id="pwd" name="pwd">
			</div>
			<div class="mb-3">
				<label for="pwdchk" class="form-label">비밀번호 확인</label>
				<input type="password" class="form-control" id="pwdchk" name="pwdchk">
				<div class="alert alert-danger" role="alert" id="no_pwdchk">비밀번호와 비밀번호 확인이 일치하지 않습니다.</div>
			</div>
			<div class="mb-3">
				<label for="nickname" class="form-label">닉네임</label>
				<input type="text" class="form-control" id="nickname" name="nickname">
				<button type="button" class="btn light_gray_btn" id="nickChkBtn">중복확인</button>
				<div class="alert alert-danger" role="alert" id="no_nickname">이미 사용중인 닉네임입니다</div>
				<div class="alert alert-primary" role="alert" id="yes_nickname">사용할 수 있는 닉네임입니다</div>
			</div>
			<div class="mb-3">
				<label for="name" class="form-label">이름</label>
				<input type="text" class="form-control" id="name" name="name">
			</div>
			<div class="mb-3">
				<label for="phone_number" class="form-label">휴대전화</label>
				<input type="tel" class="form-control" id="phone_number" name="phone_number">
			</div>
			<div class="mb-3">
				<label for="profile" class="form-label">프로필 이미지</label>
				<input type="file" class="form-control" id="profile" name="fileload">
			</div>
			
			<div class="mb-3">
				<button type="button" id="join_btn" class="btn btn-secondary">회원가입</button>
			</div>
		</form>
	</div>
</main>

<script type="text/javascript">
	$("#emailChkBtn").click(function() {
		$.ajax({
			url:"emailcheck.do",
			type:"post",
			data:{ "email":$("#regi_id").val() },
			success:function(msg){
				if(msg == "YES"){
					$("#yes_email").css("display", "block");
					$("#no_email").css("display", "none");
				}else{
					$("#yes_email").css("display", "none");
					$("#no_email").css("display", "block");
					$("#regi_id").val("");
				}
			},
			error:function(){
				alert('error');
			}
		});
	});
	
	$("#nickChkBtn").click(function() {
		$.ajax({
			url:"nickcheck.do",
			type:"post",
			data:{ "nickname":$("#nickname").val() },
			success:function(msg){
				if(msg == "YES"){
					$("#yes_nickname").css("display", "block");
					$("#no_nickname").css("display", "none");
				}else{
					$("#yes_nickname").css("display", "none");
					$("#no_nickname").css("display", "block");
					$("#nickname").val("");
				}
			},
			error:function(){
				alert('error');
			}
		});
	});
	
	$("#join_btn").on("click", function(e) {
		e.preventDefault();
		
		let pwd = $('#pwd').val();
		let pwdChk = $('#pwdchk').val();
		
		if(pwd == pwdChk) {
			$("#no_pwdchk").css("display", "none");
			$(".container form").submit();
		} else {
			$("#no_pwdchk").css("display", "block");
			$('#pwdchk').focus();
		}
	});
</script>