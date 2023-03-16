<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/sharebridge/css/mypage/mypage_common.css">
<link rel="stylesheet" href="/sharebridge/css/mypage/mypage_pwd_chk.css">

<style>
	main {
		width: 300px;
		display: flex;
    	flex-direction: column;
	}
	
	#title_wrap {
		margin-bottom: 50px;
	    text-align: center;
	}
	
	#page_title {
		margin-bottom: 10px;
	}
	
	#select_wrap, #button_wrap {
		display: flex;
    	justify-content: center;
	}
	
	#input_wrap {
		display: none;
	}
	
	#select_wrap > select, #input_wrap > input, #button_wrap > button {
		width: 100%;
	}
	
	#button_wrap > button {
		background: lightgray;
    	border: none;
    	color: black;
	}
	
	#button_wrap > button:hover {
		background: #5a6268;
		color: white;
	}
</style>

<main>
	<div id="title_wrap">
		<h1 id="page_title">회원 탈퇴</h1>
		<p>탈퇴하시는 이유를 알려주세요</p>
	</div>
	
	<div id="contents_wrap">
		<form action="go_from.do" method="POST">
			<div id="select_wrap">
				<select class="form-select">
					<option>선택해주세요</option>
					<option>사유1</option>
					<option>사유2</option>
					<option>사유3</option>
					<option>직접 입력</option>
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