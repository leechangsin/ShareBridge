<%@page import="com.sharebridge.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
// 웹에 메세지를 띄우는 작업은 컨트롤러가 아닌 jsp로
MemberDto login = (MemberDto)session.getAttribute("login");

String writeRev = (String)request.getAttribute("writeRev");
if(writeRev != null && !writeRev.equals("")){
	int memberId = login.getMember_id();
	if(writeRev.equals("REVIEW_OK")) {
		%>
		<script type="text/javascript">
		let member_id = "<%=memberId %>";
		alert("후기가 작성되었습니다.");
		location.href = "reviewList.do?member_id=" + member_id;
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
		let member_id = "<%=memberId %>";
		alert("후기가 작성되지 않았습니다.");
		location.href = "reviewList.do?member_id=" + member_id;
		</script>
		<%
	}
}

String revUp = (String)request.getAttribute("revUp");
if(revUp != null && !revUp.equals("")){
	int memberId = login.getMember_id();
	if(revUp.equals("REV_UP_OK")) {
		%>
		<script type="text/javascript">
		let member_id = "<%=memberId %>";
		alert("후기가 수정되었습니다.");
		location.href = "reviewList.do?member_id=" + member_id;
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
		let member_id = "<%=memberId %>";
		alert("후기가 수정되지 않았습니다.");
		location.href = "reviewList.do?member_id=" + member_id;
		</script>
		<%
	}
}

String revDel = (String)request.getAttribute("revDel");
if(revDel != null && !revDel.equals("")){
	int memberId = login.getMember_id();
	if(revDel.equals("REV_DEL_OK")) {
		%>
		<script type="text/javascript">
		let member_id = "<%=memberId %>";
		alert("후기가 삭제되었습니다.");
		location.href = "reviewList.do?member_id=" + member_id;
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
		let member_id = "<%=memberId %>";
		alert("후기가 삭제되지 않았습니다.");
		location.href = "reviewList.do?member_id=" + member_id;
		</script>
		<%
	}
}
%>