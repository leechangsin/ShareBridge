<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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
<body>
	<div class="album py-5 bg-light">
		<div class="container">
		<h2>위시 리스트</h2>
			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
				<c:forEach items="${wishes}" var="wish">
					<div class="col" onclick="onClickProduct(${wish.product_id}, ${wish.category_id})">
						<div class="card shadow-sm">
							<svg class="bd-placeholder-img card-img-top" width="100%"
								height="225" xmlns="http://www.w3.org/2000/svg" role="img"
								aria-label="Placeholder: 상품사진"
								preserveAspectRatio="xMidYMid slice" focusable="false">
								<title>Placeholder</title><rect width="100%" height="100%"
									fill="#55595c"></rect>
								<text x="50%" y="50%" fill="#eceeef" dy=".3em">상품사진</text></svg>

							<div class="card-body">
								<div class="d-flex justify-content-between align-items-center">
									<p class="card-text">${wish.title}</p>
									<div>
										<img onclick="event.stopPropagation(); onClickWish(${wish.product_id})"
											id="wish_${product.product_id}"
											src="/sharebridge/images/has_wish_icon.png" alt="cart">
									</div>
								</div>
								<p class="card-text">${wish.price}원/일</p>

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