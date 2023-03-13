<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Share Bridge</title>
	
	<!-- Public(공용) CSS -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&family=Noto+Sans:wght@300;400;500;600;700;800&family=PT+Serif:ital@1&family=Roboto&family=Source+Sans+Pro:wght@600;700&display=swap" rel="stylesheet">
	
	<!-- Header CSS -->
	<link rel="stylesheet" href="css/public/header.css">
	
	<!-- Footer CSS -->
	<link rel="stylesheet" href="css/public/footer.css">
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