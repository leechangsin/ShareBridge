<%@page import="com.sharebridge.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	MemberDto login = (MemberDto)session.getAttribute("login");
%>

<style>
	#floating_btn {
		position: absolute;
		right: 425px;
	}
</style>

<div class="album py-5 bg-light">
	<div class="container">
		<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
			<c:forEach items="${products }" var="product">
				<div class="col" onclick="onClickProduct(${product.product_id}, ${product.category_id})">
					<div class="card shadow-sm">
						<svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
						<title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"></rect>
						<text x="50%" y="50%" fill="#eceeef" dy=".3em">상품사진</text></svg>

						<div class="card-body">
							<div class="d-flex justify-content-between align-items-center">
								<p class="card-text">${product.title}</p>
								<div>
									<c:choose>
										<c:when test="${product.wish_member_id > 0}">
											<img onclick="event.stopPropagation(); onClickWish(${product.product_id}, false)"
										id="wish_${product.product_id}"
										src="/sharebridge/images/has_wish_icon.png" alt="cart">
										</c:when>
										<c:otherwise>
											<img onclick="event.stopPropagation(); onClickWish(${product.product_id}, true)"
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
	
	<div id="floating_btn">
		<button type="button" class="btn btn-warning" onclick="goProductWrite()">상품 등록</button>
	</div>
</div>

<script src="/sharebridge/js/public/common.js"></script>
<script type="text/javascript">

let goProductWrite = () => {
	goTo("/sharebridge/productRegi.do");
}

function onClickProduct(pid,cid){
	location.href = "productDetail.do?product_id="+pid+"&category_id="+cid;
}

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