<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
// 웹에 메세지를 띄우는 작업은 컨트롤러가 아닌 jsp로
String message = (String)request.getAttribute("msg");
if(message != null && !message.equals("")){
	if(message.equals("MEM_ADD_OK")) {
		%>
		<script type="text/javascript">
		alert("가입되었습니다.");
		location.href = "login.do";
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
		alert("회원정보를 빠짐없이 입력해주세요.");
		location.href = "regi.do";
		</script>
		<%
	}
}
String log = (String)request.getAttribute("log");
if(log != null && !log.equals("")){
	if(log.equals("LOGIN_OK")) {
		%>
		<script type="text/javascript">
		location.href = "baseLayout.do";
		</script>
		<%
	}else if(log.equals("DELETE")){
		%>
		<script type="text/javascript">
		alert("탈퇴한 회원입니다!");
		location.href = "login.do";
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
		alert("로그인 실패!");
		location.href = "login.do";
		</script>
		<%
	}
}
String logout = (String)request.getAttribute("logout");
if(logout != null && !logout.equals("")) {
	%>
	<script type="text/javascript">
	location.href = "baseLayout.do";
	</script>
	<%
}
%>