<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div align="center">
	<table style="width:1000px; height:600px; border-color: gray;">
		
		<!-- header -->
		<tr align="center" style="background-color: black; color: white;">
			<td style="height: 10%">
				<tiles:insertAttribute name="header"/>
			</td>
		</tr>
		
		<!-- nav -->
		<tr>
			<td align="center" valign="top" style="background-color: rgb(204,204,204); width: 20%">
				<tiles:insertAttribute name="nav"/>
			</td>		
		</tr>
		
		<!-- main -->
		<tr>
			<td align="center">
				<tiles:insertAttribute name="content"/>
			</td>
		</tr>
		
		<!-- footer -->	
		<tr align="center" style="background-color: black;color: white;">
			<td style="height: 10%">
				<tiles:insertAttribute name="footer"/>
			</td>
		</tr>
		
	</table>
</div>

</body>
</html>