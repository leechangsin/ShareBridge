<%@page import="com.sharebridge.util.Utility"%>
<%@page import="com.sharebridge.dto.ProductDto"%>
<%@page import="com.sharebridge.dto.ReviewDto"%>
<%@page import="java.util.List"%>
<%@page import="com.sharebridge.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/sharebridge/css/review/sellerInfo.css">

<%
MemberDto login = (MemberDto)session.getAttribute("login");
MemberDto mem = (MemberDto)request.getAttribute("mem");
List<ReviewDto> list = (List<ReviewDto>)request.getAttribute("list");
List<MemberDto> renteeList = (List<MemberDto>)request.getAttribute("renteeList");
List<ProductDto> prodList = (List<ProductDto>)request.getAttribute("prodList");
%>
<main>
	<h1 id="renter_info_title">렌터정보</h1>
	
	<!-- 회원 정보 -->
	<div id="renter_outter_wrap">
		<div id="renter_innter_wrap">
			<div id="renter_profile_wrap">
				<img alt="test" src="/sharebridge/upload/profile/temp.png">
			</div>
			<div id="renter_text_wrap">
				<p><span id="nickname"><%=mem.getNickname() %></span> 님</p>
				<p><%=mem.getEmail() %></p>
				<p>별점 <%=mem.getRating() %> / 5</p>
			</div>
		</div>
	</div>
	
	<!-- 렌터에게 작성된 후기 목록 -->
	<div id="review" class="request_list">
		<h2 id="review_title">후기 <%=list.size() %></h2>
		<table class="table">
			<tbody>
			<%
				if(list == null || list.size() == 0) {
					%>
					<tr>
						<td scope="row" colspan="4" class="text_align">작성된 후기가 없습니다</td>
					</tr>
					<%
				}else {
					for(int i=0; i < list.size(); i++) {
						if(list.get(i).getDepth() == 0) {
							%>
							<tr>
								<th scope="row">
									<%=renteeList.get(i).getNickname() %>&nbsp;<%=list.get(i).getRating() %>/5
									<br><%=list.get(i).getRdate().toString().substring(0, 10) %>
								</th>
								<td>
									<%=prodList.get(i).getTitle() %>
								</td>
								<td colspan="2">
									<img alt="등록된 이미지 없음" src="/sharebridge/upload/review/<%=list.get(i).getPhoto() %>">
								</td>
							</tr>
							<tr>
								<th colspan="2">
									<%=list.get(i).getContent() %>
								</th>
								<td colspan="2">
									<%
									if(login.getMember_id() == mem.getMember_id()) {
										%>
										<a href="answerReview.do?reviewId=<%=list.get(i).getReview_id() %>">답글달기</a>
										<%
									}else if(login.getMember_id() == list.get(i).getRentee_id()) {
										%>
										<a href="updateReview.do?request_id=<%=list.get(i).getRequest_id() %>">수정</a>&nbsp;
										<a href="deleteReview.do?request_id=<%=list.get(i).getRequest_id() %>">삭제</a>
										<%
									}
									%>
									
								</td>
							</tr>
							<%
						}else {
							%>
							<tr>
								<th scope="row">
									<%=Utility.arrow(list.get(i).getDepth()) %>
									<%=mem.getNickname() %>
									
								</th>
								<td><%=list.get(i).getContent() %></td>
								<td colspan="2" align="right">
									<%=list.get(i).getRdate().toString().substring(0, 10) %>&nbsp;
									<%
									if(login.getMember_id() == mem.getMember_id()) {
										%>
										<a href="upDateReview.do?review_id=<%=list.get(i).getReview_id() %>">수정</a>&nbsp;
										<a href="deLeteReview.do?review_id=<%=list.get(i).getReview_id() %>">삭제</a>
										<%
									}
									%>
									
								</td>
							</tr>
							<%
						}
						
					}
				}
			%>
			
			</tbody>
		</table>
	</div>
</main>