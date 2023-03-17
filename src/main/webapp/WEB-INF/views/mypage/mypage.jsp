<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="/sharebridge/css/mypage/mypage_common.css">
<link rel="stylesheet" href="/sharebridge/css/mypage/mypage_main.css">

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
				<a href="#"><i class="fa-solid fa-pen-to-square"></i></a>
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
							<tr>
								<th scope="row">${request.name }</th>
								<td>${request.sdate } ~ ${request.edate }</td>
								<td>10,000원/일</td>
								<td>
									<c:choose>
										<c:when test="${request.is_cancel eq 0 }">
											신청 취소
										</c:when>
										<c:when test="${request.is_accept eq 0 }">
											신청 대기
										</c:when>
										<c:when test="${request.is_accept eq 1 }">
											대여 수락
										</c:when>
										<c:when test="${request.is_accept eq 2 }">
											대여 거절
										</c:when>
									</c:choose>
								</td>
								<td><button type="button" class="btn btn-secondary">취소</button></td>
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
							<tr>
								<th scope="row">${request.name }</th>
								<td>${request.sdate } ~ ${request.edate }</td>
								<td>10,000원/일</td>
								<c:choose>
									<c:when test="${request.is_cancel eq 0 }">
										신청 취소
									</c:when>
									<c:when test="${request.is_accept eq 0 }">
										신청 대기
									</c:when>
									<c:when test="${request.is_accept eq 1 }">
										대여 수락
									</c:when>
									<c:when test="${request.is_accept eq 2 }">
										대여 거절
									</c:when>
								</c:choose>
								<td>
									<button type="button" class="btn btn-secondary">수락</button>
									<button type="button" class="btn btn-secondary">거절</button>
								</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
</main>
