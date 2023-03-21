<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/sharebridge/css/login/id_pw_search.css">

<table>
	<tr id="tap_wrap">
		<td class="non_active">
			<a href="idSearch.do">아이디 찾기</a>
		</td>
		<td>비밀번호 찾기</td>
	</tr>
	<tr>
		<td colspan="2"><label for="email" class="form-label">이메일 입력</label></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="email" id="email" class="form-control">
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="button" id="find" class="btn light_gray_btn">조회</button>
		</td>
	</tr>
</table>

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