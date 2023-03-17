<%@page import="com.sharebridge.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
// 웹에 메세지를 띄우는 작업은 컨트롤러가 아닌 jsp로
MemberDto login = (MemberDto)session.getAttribute("login");

String writeRev = (String)request.getAttribute("writeRev");
if(writeRev != null && !writeRev.equals("")){
	if(writeRev.equals("REVIEW_OK")) {
		int renteeId = login.getMember_id();
		%>
		<script type="text/javascript">
		alert("후기가 작성되었습니다.");
		location.href = "reviewList.do?renteeId=" + renteeId;
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
		alert("후기가 작성되지 않았습니다.");
		location.href = "reviewList.do?renteeId=" + renteeId;
		</script>
		<%
	}
}

%>