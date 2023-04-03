<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="/sharebridge/css/main/product_list.css">
<link rel="stylesheet" href="/sharebridge/css/main/wish.css">

<div class="album py-5">
	<h2 id="page_title">위시 리스트</h2>
	
	<div class="container">
		<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
			<c:forEach items="${wishes}" var="wish">
				<div class="col" onclick="onClickProduct(${wish.product_id}, ${wish.category_id})">
					<div class="card shadow-sm">
						<div class="bd-placeholder-img card-img-top">
							<img alt="${wish.title }" src="/sharebridge/upload/product/${wish.photo }">
						</div>

						<div class="card-body">
							<div class="d-flex justify-content-between align-items-center">
								<p class="card-text">${wish.title}</p>
								<div>
									<img onclick="event.stopPropagation(); onClickWish(${wish.product_id})" id="wish_${product.product_id}" src="/sharebridge/images/has_wish_icon.png" alt="cart">
								</div>
							</div>
							<div class="card-text">
								<p>${wish.price}원/일</p>
								<p>
									<c:set var="state" value="대여 가능" />
									<c:if test="${wish.state eq 1 }">
										<c:set var="state" value="대여 불가" />
									</c:if>
									
									${state }
								</p>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<script type="text/javascript">

function onClickProduct(pid,cid){
	location.href = "productDetail.do?product_id="+pid+"&category_id="+cid;
}

function onClickWish(productId){
	if("${login == null}" === 'false'){
		$.ajax({
			type:"post",
			url: "removeWish.do",
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
</head>