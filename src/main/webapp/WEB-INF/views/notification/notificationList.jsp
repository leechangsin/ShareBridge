<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="/sharebridge/css/notification/notification_list.css">

<main>
	<div id="title_wrap">
		<h1 id="page_title">알림</h1>
	</div>
	
	<div id="list_wrap">
<%-- 		<c:if test="${empty notificationList }"> --%>
<!-- 			<p id="no_notification">내개 온 알림이 없습니다</p> -->
<%-- 		</c:if> --%>
<%-- 		<c:if test="${not empty notificationList }"> --%>
			
<%-- 		</c:if> --%>
		<div class="list noread" notification_id="1">
			<h3>대여신청</h3>
			<p>2023-03-08</p>
			<div id="text_button_wrap">
				<p>'닉네임'님이 '상품명' 대여를 희망합니다</p>
				<div id="button_wrap">
					<span>안읽음</span>
					<span>X</span>
				</div>
			</div>
		</div>
		
		<div class="list noread" notification_id="2">
			<h3>대여신청</h3>
			<p>2023-03-08</p>
			<div id="text_button_wrap">
				<p>'닉네임'님이 '상품명' 대여를 희망합니다</p>
				<div id="button_wrap">
					<span>안읽음</span>
					<span>X</span>
				</div>
			</div>
		</div>
		
		<div class="list">
			<h3>대여신청</h3>
			<p>2023-03-08</p>
			<div id="text_button_wrap">
				<p>'닉네임'님이 '상품명' 대여를 희망합니다</p>
				<div id="button_wrap">
					<span>읽음</span>
					<span>X</span>
				</div>
			</div>
		</div>
		
		<div class="list">
			<h3>대여신청</h3>
			<p>2023-03-08</p>
			<div id="text_button_wrap">
				<p>'닉네임'님이 '상품명' 대여를 희망합니다</p>
				<div id="button_wrap">
					<span>읽음</span>
					<span>X</span>
				</div>
			</div>
		</div>
		
		<div class="list">
			<h3>대여신청</h3>
			<p>2023-03-08</p>
			<div id="text_button_wrap">
				<p>'닉네임'님이 '상품명' 대여를 희망합니다</p>
				<div id="button_wrap">
					<span>읽음</span>
					<span>X</span>
				</div>
			</div>
		</div>
		
		<div class="list">
			<h3>대여신청</h3>
			<p>2023-03-08</p>
			<div id="text_button_wrap">
				<p>'닉네임'님이 '상품명' 대여를 희망합니다</p>
				<div id="button_wrap">
					<span>읽음</span>
					<span>X</span>
				</div>
			</div>
		</div>
		
		<div class="list">
			<h3>대여신청</h3>
			<p>2023-03-08</p>
			<div id="text_button_wrap">
				<p>'닉네임'님이 '상품명' 대여를 희망합니다</p>
				<div id="button_wrap">
					<span>읽음</span>
					<span>X</span>
				</div>
			</div>
		</div>
		
		<div class="list">
			<h3>대여신청</h3>
			<p>2023-03-08</p>
			<div id="text_button_wrap">
				<p>'닉네임'님이 '상품명' 대여를 희망합니다</p>
				<div id="button_wrap">
					<span>읽음</span>
					<span>X</span>
				</div>
			</div>
		</div>
		
		<div class="list">
			<h3>대여신청</h3>
			<p>2023-03-08</p>
			<div id="text_button_wrap">
				<p>'닉네임'님이 '상품명' 대여를 희망합니다</p>
				<div id="button_wrap">
					<span>읽음</span>
					<span>X</span>
				</div>
			</div>
		</div>
		
		<div class="list">
			<h3>대여신청</h3>
			<p>2023-03-08</p>
			<div id="text_button_wrap">
				<p>'닉네임'님이 '상품명' 대여를 희망합니다</p>
				<div id="button_wrap">
					<span>읽음</span>
					<span>X</span>
				</div>
			</div>
		</div>
	</div>
</main>

<script src="/sharebridge/js/public/common.js"></script>
<script>
	$(".noread").on("click", function() {
		let notification_id = $(this).attr("notification_id");
		
		$.ajax({
			url: "/sharebridge/notification/read_notification.do",
			type: "POST",
			data: "notification_id="+notification_id,
			success: function() {
				$(this).removeClass("noread");
			},
			error: function(xhr){
				if(xhr.status == 300) {
					goTo(xhr.responseHeader("Location"));
				}
			}
		});
	});
</script>