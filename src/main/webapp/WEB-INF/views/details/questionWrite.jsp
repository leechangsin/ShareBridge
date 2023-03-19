<%@page import="com.sharebridge.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	MemberDto login = (MemberDto)session.getAttribute("login");
	int pid = (Integer)request.getAttribute("pid");
	int cid = (Integer)request.getAttribute("cid");
%>

<div class="question_container">
	<h3 class="title">문의하기</h3>
	<form action="writeQuestionAf.do?category_id=<%=cid %>" method="post" id="frm">
	<input type="hidden" value="<%=pid%>" name="product_id"> 
	<input type="hidden" value="<%=login.getMember_id()%>" name="member_id"> 
		<table>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" id="title" name="title" />
				</td>
			</tr>
			<tr>
				<td clospan="2">
					<label><input type="radio" value="1" name="private_question" />비밀글</label>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea rows="20" cols="30" id="content" name="content"></textarea>
				</td>
			</tr>
		</table>
		<button type="submit" id="writeBtn">작성완료</button>
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