<%@page import="com.sharebridge.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="/sharebridge/css/mypage/mypage_common.css">
<link rel="stylesheet" href="/sharebridge/css/mypage/mypage_main.css">

<%
MemberDto mem = (MemberDto)session.getAttribute("login");
%>

<main>
	<h1 id="page_title">마이페이지</h1>
	
	<!-- 회원 정보 -->
	<div id="mrnp_wrap">
		<div id="member_wrap">
			<div id="member_wrap_1">
				<div>
					<img alt="test" src="/sharebridge/upload/profile/temp.png">
				</div>
				<div class="member_button">
					<a href="pwd_check/update.do">회원정보 수정</a>
				</div>
			</div>
			<div id="member_wrap_2">
				<div>
					<p><span id="nickname">${memberInfo.nickname }</span> 님</p>
					<p>${memberInfo.email }</p>
					<p>별점 ${memberInfo.rating } / 5</p>
				</div>
				<div class="member_button">
					<a href="pwd_check/delete.do">회원탈퇴</a>
				</div>
			</div>
		</div>
		<div id="review_wrap">
			<div>
				<a href="reviewList.do?member_id=<%=mem.getMember_id() %>"><i class="fa-solid fa-pen-to-square"></i></a>
			</div>
			<h1>후기</h1>
			<p><span>${reviewCount }</span>건</p>
		</div>
		<div class="vertical_line"></div>
		<div id="noti_wrap">
			<div>
				<a href="/sharebridge/notification/notification_list.do"><i class="fa-regular fa-bell"></i></a>
			</div>
			<h1>알림</h1>
			<p><span>${notiCount }</span>건</p>
		</div>
		<div class="vertical_line"></div>
		<div id="product_wrap">
			<div>
				<a href="#"><i class="fa-solid fa-inbox"></i></a>
			</div>
			<h1>등록상품</h1>
			<p><span>${productCount }</span>건</p>
		</div>
	</div>
	
	<!-- 대여 신청 목록 -->
	<div id="rentee" class="request_list">
		<h2 class="sub_title">대여 신청 목록</h2>
		<table class="table">
			<thead>
				<tr class="table-secondary">
					<th scope="col" class="col-3 text_align">상품명</th>
					<th scope="col" class="col-3 text_align">대여기간</th>
					<th scope="col" class="col-2">대여금액</th>
					<th scope="col" class="col-1 text_align">대여현황</th>
					<th scope="col" class="col-1 text_align">대여취소</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty requestSnedList }">
						<tr><th scope="row" colspan="5" class="text_align">대여 신청 내역이 없습니다</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${requestSendList }" var="request">
							<tr request_id="${request.request_id }">
								<th scope="row">${request.name }</th>
								<td>${request.sdate } ~ ${request.edate }</td>
								<td>10,000원/일</td>
								<td>
									<c:choose>
<!-- 									신청한 상태(request.is_cancel eq 0)이고 -->
										<c:when test="${request.is_cancel eq 0}">
											<c:choose>
<!-- 											렌터가 요청서 수락 또는 거절하기 전(request._is_accept eq 0)이라면 -->
												<c:when test="${request.is_accept eq 0 }">
													<span class="alert alert-secondary" role="alert">신청 대기</span>
												</c:when>
<!-- 											렌터가 요청서를 수락했다면 -->
												<c:when test="${request.is_accept eq 1 }">
													<span class="alert alert-secondary" role="alert">대여 수락</span>
												</c:when>
<!-- 											렌터가 요청서를 거절했다면 -->
												<c:when test="${request.is_accept eq -1 }">
													<span class="alert alert-secondary" role="alert">대여 거절</span>
												</c:when>
											</c:choose>
										</c:when>
<!-- 									신청을 취소한 상태라면 -->
										<c:when test="${request.is_cancel eq 1 }">
											<span class="alert alert-secondary" role="alert">신청 취소</span>
										</c:when>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${request.is_cancel eq 0 and request.is_accept eq 0 }">
											<button type="button" class="btn btn-secondary cancel_btn">취소하기</button>
										</c:when>
										<c:otherwise>
											<span class="alert alert-secondary" role="alert">취소 불가</span>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	
	<!-- 대여 요청 목록 -->
	<div id="renter" class="request_list">
		<h2 class="sub_title">대여 요청 목록</h2>
		
		<table class="table">
			<thead>
				<tr class="table-secondary">
					<th scope="col" class="col-3 text_align">상품명</th>
					<th scope="col" class="col-3 text_align">대여기간</th>
					<th scope="col" class="col-2">대여금액</th>
					<th scope="col" class="col-2 text_align">대여현황</th>
					<th scope="col" class="col-2 text_align">대여결정</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty requestReceiveList }">
						<tr><th scope="row" colspan="5" class="text_align">대여 요청 내역이 없습니다</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${requestReceiveList }" var="request" >
							<tr request_id="${request.request_id }">
								<th scope="row">${request.name }</th>
								<td>${request.sdate } ~ ${request.edate }</td>
								<td>10,000원/일</td>
									<c:choose>
<!-- 									신청한 상태(request.is_cancel eq 0)이고 -->
										<c:when test="${request.is_cancel eq 0}">
											<c:choose>
<!-- 											렌터가 요청서 수락 또는 거절하기 전(request._is_accept eq 0)이라면 -->
												<c:when test="${request.is_accept eq 0 }">
													<span class="alert alert-secondary" role="alert">신청 대기</span>
												</c:when>
<!-- 											렌터가 요청서를 수락했다면 -->
												<c:when test="${request.is_accept eq 1 }">
													<span class="alert alert-secondary" role="alert">대여 수락</span>
												</c:when>
<!-- 											렌터가 요청서를 거절했다면 -->
												<c:when test="${request.is_accept eq -1 }">
													<span class="alert alert-secondary" role="alert">대여 거절</span>
												</c:when>
											</c:choose>
										</c:when>
<!-- 									신청을 취소한 상태라면 -->
										<c:when test="${request.is_cancel eq 1 }">
											<span class="alert alert-secondary" role="alert">신청 취소</span>
										</c:when>
									</c:choose>
								<td>
									<c:if test="${request.is_cancel eq 0 and request.is_accept eq 0 }">
										<button type="button" class="btn btn-secondary accept_btn">수락</button>
										<button type="button" class="btn btn-secondary reject_btn">거절</button>
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
</main>

<script src="/sharebridge/js/public/common.js"></script>
<script>
	$(".cancel_btn").on("click", function() {
		let request_id = $(this).parent().parent().attr("request_id");
		
		$.ajax({
			url: "request/cancel.do",
			type: "POST",
			data: "request_id="+request_id,
			success: function(data, xhr) {
				if(xhr.status == 208) {
					alert("이미 신청을 취소했습니다");
				} else {
					alert("신청이 취소됐습니다");
				}
				
				$(this).parent().html("<span class=\"alert alert-secondary\" role=\"alert\">신청 취소</span>");
			},
			error: function(xhr) {
				if(xhr.status == 300) {
					goTo(xhr.getResponseHeader("Location"));
				} else if(xhr.status == 409) {
					alert("렌터가 신청을 수락 또는 거절했습니다\n페이지를 새로고침해 요청서의 상태를 갱신하세요");
				}
			}
		});
	});

	$(".accept_btn").on("click", function() {
		let reuqest_id = $(this).parent().parent().attr("request_id");
		
		$.ajax({
			url: "request/accept.do",
			type: "POST",
			data: "request_id="+request_id,
			success: function(data, xhr) {
				if(xhr.status == 208) {
					alert("이미 신청을 수락했습니다");
				} else {
					alert("신청을 수락했습니다");
				}
				
				$(this).parent().prev().html("<span class=\"alert alert-secondary\" role=\"alert\">대여 수락</span>");
				$(this).parent().empty();
			},
			error: function(xhr) {
				if(xhr.status == 300) {
					goTo(xhr.getResponseHeader("Location"));
				} else if(xhr.status == 409) {
					alert("렌티가 신청을 취소했습니다\n페이지를 새로고침해 요청서의 상태를 갱신하세요");
				}
			}
		});
	});
</script>