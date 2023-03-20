<%@page import="com.sharebridge.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="/sharebridge/css/question/writeForm.css">

<%
	MemberDto login = (MemberDto)session.getAttribute("login");
	int pid = (Integer)request.getAttribute("pid");
	int cid = (Integer)request.getAttribute("cid");
	
	String status = "question";
	if(request.getAttribute("status") != null) {
		status = (String) request.getAttribute("status");
	}
%>

<c:set var="title" value="문의하기" />
<c:set var="action" value="writeQuestionAf.do?category_id=${category_id }" />

<c:if test="${param.status eq 'reply' }">
	<c:set var="title" value="답변하기" />
	<c:set var="action" value="writeReplyAf.do" />
</c:if>


<div class="question_container">
	<h3 class="title">${title }</h3>
	<form action="${action }" method="post" id="frm">
		<input type="hidden" value="<%=pid%>" name="product_id"> 
		<input type="hidden" value="<%=login.getMember_id()%>" name="member_id"> 
		<table>
			<c:if test="${param.status ne 'reply' }">
			<tr class="private_btn_wrap">
				<th>
					<label class="form-check-label" for="flexRadioDefault1">비밀글</label>
				</th>
				<td>
					<input class="form-check-input" type="checkbox" name="private_question" id="private_question" value="1">
				</td>
			</tr>
			</c:if>
			<tr>
				<th>
					<label for="title" class="form-label">제목</label>
				</th>
				<td>
					<input type="text" class="form-control" id="title" name="title">
				</td>
			</tr>
			<tr>
				<th><label for="content" class="form-label">내용</label></th>
				<td>
					<textarea rows="20" cols="30" class="form-control" id="content" name="content"></textarea>
				</td>
			</tr>
		</table>
		<div id="btn_wrap">
			<button type="submit" id="writeBtn" class="btn">작성완료</button>
		</div>
	</form>
</div>

<script>
$(document).ready(function(){
	// 빈칸검사
	$("#writeBtn").click(function(e) {
		e.preventDefault();
		if($("#title").val() == undefined || $("#title").val().trim() == "") {
			alert("제목을 입력해주세요");
			return;
		} else if($("#content").val() == undefined || $("#content").val().trim() == "") {
			alert("내용을 입력해주세요");
			return;
		} else {
			$("#frm").submit();
		}
	});
});
</script>