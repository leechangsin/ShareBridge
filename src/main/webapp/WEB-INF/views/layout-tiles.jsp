<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Share Bridge</title>
	
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	
	<!-- Public(공용) CSS -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&family=Noto+Sans:wght@300;400;500;600;700;800&family=PT+Serif:ital@1&family=Roboto&family=Source+Sans+Pro:wght@600;700&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="/sharebridge/css/public/reset.css">
	<link rel="stylesheet" href="/sharebridge/css/public/common.css">
	
	<!-- Header CSS -->
	<link rel="stylesheet" href="/sharebridge/css/public/header.css">
	<link rel="stylesheet" href="/sharebridge/css/main/nav.css">
	
	<!-- Footer CSS -->
	<link rel="stylesheet" href="/sharebridge/css/public/footer.css">
	
	<!-- jquery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>
	<script src="https://kit.fontawesome.com/7ad71aac2c.js" crossorigin="anonymous"></script>
	
	<!-- flatpickr -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
</head>
<body>
	<div align="center" class="tiles_container">
		<table width="100%" class="tiles_table">
			<!-- header -->
			<tr class="tiles_header">
				<td>
					<tiles:insertAttribute name="header"/>
				</td>
			</tr>
			
			<!-- nav -->
			<tr>
				<td>
					<tiles:insertAttribute name="nav"/>
				</td>		
			</tr>
			
			<!-- main -->
			<tr>
				<td id="main_contents">
					<tiles:insertAttribute name="content"/>
				</td>
			</tr>
			
			<!-- footer -->	
			<tr class="tiles_footer">
				<td>
					<tiles:insertAttribute name="footer"/>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>