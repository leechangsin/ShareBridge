<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/sharebridge/css/login/id_pw_search.css">

<form action="idSearchAf.do" method="post">
	<table>
		<tr id="tap_wrap">
			<td>아이디 찾기</td>
			<td class="non_active">
				<a href="pwdSearch.do">비밀번호 찾기</a>
			</td>
		</tr>
		<tr>
			<td colspan="2"><label for="phone_number" class="form-label">연락처 입력</label></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="text" name="phone_number" class="form-control" id="phone_number">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<button type="submit" class="btn light_gray_btn">조회</button>
			</td>
		</tr>
	</table>
</form>