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
	<link rel="stylesheet" href="css/public/resset.css">
	
	<!-- Header CSS -->
	<link rel="stylesheet" href="css/public/header.css">
	
	<!-- Footer CSS -->
	<link rel="stylesheet" href="css/public/footer.css">
</head>
<body>
	<div align="center">
		<table width="100%">
			<!-- header -->
			<tr>
				<td>
					<tiles:insertAttribute name="header"/>
				</td>
			</tr>
			
			<!-- nav -->
			<tr height="83px" style="background-color:#969F95">
				<td>
					<tiles:insertAttribute name="nav"/>
				</td>		
			</tr>
			
			<!-- main -->
			<tr>
				<td>
					<tiles:insertAttribute name="content"/>
				</td>
			</tr>
			
			<!-- footer -->	
			<tr>
				<td>
					<tiles:insertAttribute name="footer"/>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>