<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
.form-control {
	border: none;
	padding-left: 32px;
}

.form-control:focus {
	border: none;
	box-shadow: none;
}

.green {
	color: green;
}

.form-check-input {
	position: absolute;
	margin-left: 1.75rem;
}
</style>
<script type="text/javascript">
	function onClickDeletes() {
		var checkboxes = document.querySelectorAll('input[name=check-cart]:checked');
		var checkboxesChecked = [];
		for (var i = 0; i < checkboxes.length; i++) {
			if (checkboxes[i].checked) {
				checkboxesChecked.push({
					"cart_id" : Number(checkboxes[i].id.replace('cart_', ''))
				});
			}
		}
		
		deleteCarts(checkboxesChecked);
	}
	
	function onClickDelete(id) {
		deleteCarts([{"cart_id" : id}]);
	}
	
	function deleteCarts(deleteItems){
		$.ajax({
			type : "post",
			url : "removeCart.do",
			data : JSON.stringify(deleteItems),
			contentType : "application/json; charset=UTF-8",
			success : function(msg) {
				location.reload();
			},
			error : function(e) {
				alert('error', e);
			}
		});
	}
	

	function onClickProduct(pid, cid){
		location.href = "productDetail.do?product_id="+pid+"&category_id="+cid;
	}
</script>

</head>
<body>
	<div class="container mt-5 px-2">
		<h2>장바구니</h2>
		<div class="table-responsive">
			<table class="table table-responsive table-borderless">

				<thead>
					<tr class="bg-light">
						<th scope="col" width="5%"><input class="form-check-input"
							type="checkbox" style="margin-top: -1.1em;"></th>
						<th scope="col" width="10%"></th>
						<th scope="col" width="30%">상품명</th>
						<th scope="col" width="10%">대여기간</th>
						<th scope="col" width="10%">대여금액</th>
						<th scope="col" width="10%">선택</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${carts}" var="cart">
						<tr>
							<td><input class="form-check-input" type="checkbox"
								name="check-cart" id="cart_${cart.cart_id}"></td>
							<td><svg class="bd-placeholder-img card-img-top"
									width="100%" height="100" xmlns="http://www.w3.org/2000/svg"
									role="img" aria-label="Placeholder: 상품사진"
									preserveAspectRatio="xMidYMid slice" focusable="false">
								<title>Placeholder</title><rect width="100%" height="100%"
										fill="#55595c"></rect>
								<text x="50%" y="50%" fill="#eceeef" dy=".3em">상품사진</text></svg></td>
							<td><p>판매자</p>
								<h3>${cart.title}</h3>
								<p
									style="border-radius: 14px; border: 1px solid; width: 75px; padding: 4px;">대여가능</p></td>
							<td>${cart.sdate} ~ ${cart.edate}</td>
							<td>${cart.price} 원 / 일</td>
							<td><div class="btn-group-vertical">
									<button type="button" class="btn btn-sm btn-outline-secondary" onclick="event.stopPropagation();">대여신청</button>
									<button type="button" class="btn btn-sm btn-outline-secondary" onclick="event.stopPropagation(); onClickDelete(${cart.cart_id})">삭제하기</button>
								</div></td>
						</tr>
					</c:forEach>

				</tbody>
			</table>

			<button type="button" class="btn btn-sm btn-outline-secondary"
				onclick="onClickDeletes()">선택 삭제</button>
			<button type="button" class="btn btn-sm btn-outline-secondary">선택
				상품 대여 신청</button>
			<button type="button" class="btn btn-sm btn-outline-secondary">전체
				상품 대여 신청</button>
		</div>

	</div>
</body>
</html>