<%@page import="com.sharebridge.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	MemberDto login = (MemberDto)session.getAttribute("login");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<title>Navbar Template · Bootstrap v5.3</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/navbars/">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>

<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.b-example-divider {
	height: 3rem;
	background-color: rgba(0, 0, 0, .1);
	border: solid rgba(0, 0, 0, .15);
	border-width: 1px 0;
	box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em
		rgba(0, 0, 0, .15);
}

.b-example-vr {
	flex-shrink: 0;
	width: 1.5rem;
	height: 100vh;
}

.bi {
	vertical-align: -.125em;
	fill: currentColor;
}

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden;
}

.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch;
}
</style>

</head>
<script type="text/javascript">

function onClickWish(productId, hasWish){
	
	if("${login == null}" === 'false'){
		$.ajax({
			type:"post",
			url: hasWish ? "addWish.do" : "removeWish.do",
			data:{ "member_id":"${login.member_id}", "product_id": productId },
			success:function(msg){
				location.reload();
			},
			error:function(e){
				alert('error',e);
			}
		});
	}else{
		alert('로그인을 해주세요.');
	}
	
}
</script>
<body>
	<div class="album py-5 bg-light">
		<div class="container">
			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
				<c:forEach items="${products }" var="product">
					<div class="col">
						<div class="card shadow-sm">
							<svg class="bd-placeholder-img card-img-top" width="100%"
								height="225" xmlns="http://www.w3.org/2000/svg" role="img"
								aria-label="Placeholder: Thumbnail"
								preserveAspectRatio="xMidYMid slice" focusable="false">
							<title>Placeholder</title><rect width="100%" height="100%"
									fill="#55595c"></rect>
							<text x="50%" y="50%" fill="#eceeef" dy=".3em">상품사진</text></svg>

							<div class="card-body">
								<div class="d-flex justify-content-between align-items-center">
									<p class="card-text">${product.title}</p>
									<div>
										<c:choose>
											<c:when test="${product.wish_member_id > 0}">
												<img onclick="onClickWish(${product.product_id}, false)"
											id="wish_${product.product_id}"
											src="/sharebridge/images/has_wish_icon.png" alt="cart">
											</c:when>
											<c:otherwise>
												<img onclick="onClickWish(${product.product_id}, true)"
											id="wish_${product.product_id}"
											src="/sharebridge/images/nohas_wish_icon.png" alt="cart">
											</c:otherwise>
										</c:choose>
									</div>
								</div>
								<p class="card-text">${product.price}원/일</p>

								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<button type="button" class="btn btn-sm btn-outline-secondary">대여가능</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>