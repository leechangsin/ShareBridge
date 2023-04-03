<%@page import="com.sharebridge.dto.CategoryDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	List<CategoryDto> categories = (List<CategoryDto>) session.getAttribute("categories");
%>

<nav class="navbar navbar-expand-sm navbar-dark" aria-label="Third navbar example" style="background-color:#969F95"> 
	<div class="navbar-toggler" id="navbarDropdown"  role="button" data-toggle="dropdown" aria-haspopup="true"  aria-expanded="false" style ="display:block">
		<span class="navbar-toggler-icon"></span>
	</div>
	
	<div class="dropdown-menu" aria-labelledby="navbarDropdown">
<%
	int i = 0;
	
	while(true) {
		CategoryDto category1 = categories.get(i);
		if(category1.getParent_id() != 0) {
			break;
		}
%>
		<a class="dropdown-item" href="/sharebridge/baseLayout.do?category_id=<%= category1.getCategory_id() %>"><%= category1.getName()%></a>
<%
	
		i++;
		int j = i;
		
		while(true) {
			CategoryDto category2 = categories.get(j);
			
			boolean isCategory2 = category1.getCategory_id() == category2.getParent_id();
			if(isCategory2) {
%>
			<a class="dropdown-item" href="/sharebridge/baseLayout.do?category_id=<%= category2.getCategory_id() %>">&nbsp;&nbsp;<%= category2.getName()%></a>
<%
			}
			
			j++;
			
			boolean isOverFlow = j >= categories.size();
			if(isOverFlow){
				break;
			}
		}
%>
		<hr class="dropdown-divider">
<%
	}
%>
	</div>

	<div class="collapse navbar-collapse" id="navbarsExample03">
		<ul class="navbar-nav me-auto mb-2 mb-sm-0">
			<c:forEach items="${categories}" var="category">
				<c:if test="${category.parent_id eq 0 }">
					<li class="nav-item">
						<a class="nav-link active" aria-current="page" href="/sharebridge/baseLayout.do?category_id=${category.category_id}">${category.name}</a>
					</li>
				</c:if>
			</c:forEach>
		</ul>
		<form role="search">
			<input class="form-control" type="search" name="term" placeholder="검색어를 입력해 주세요" aria-label="Search" value="${param.term }">
		</form>
	</div>
</nav>