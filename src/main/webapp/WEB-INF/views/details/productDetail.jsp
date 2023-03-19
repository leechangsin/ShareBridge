<%@page import="com.sharebridge.dto.QuestionDto"%>
<%@page import="com.sharebridge.dto.ReviewDto"%>
<%@page import="java.util.List"%>
<%@page import="com.sharebridge.dto.MemberDto"%>
<%@page import="com.sharebridge.dto.CategoryDto"%>
<%@page import="com.sharebridge.dto.ProductDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
.product_info {
	display: flex;
}

.preview {
	width: 400px;
}
.trans {
	transition: max-height 0.5s ease-out;
}
</style>
</head>
<body>

<% 
ProductDto getProduct = (ProductDto)request.getAttribute("detail");
CategoryDto getCate = (CategoryDto)request.getAttribute("getCate");
MemberDto login = (MemberDto)session.getAttribute("login");
MemberDto renter = (MemberDto)request.getAttribute("renter");
List<ReviewDto> reviewList = (List<ReviewDto>)request.getAttribute("review");
List<String> r_renteeNickList = (List<String>)request.getAttribute("r_renteeNick");
List<String> q_renteeNickList = (List<String>)request.getAttribute("q_renteeNick");
List<QuestionDto> questionList = (List<QuestionDto>)request.getAttribute("question");

String sdate = getProduct.getSdate().toString();
String edate = getProduct.getEdate().toString();

int pid = getProduct.getProduct_id();
int cid = getProduct.getCategory_id();
%>

<div>
	<%-- 상품 정보(이미지, 카테고리, 상품명, 기간 등등) --%>
	<div class="product_info">
		<div class="product_photo">
			<img src="<%=getProduct.getPhoto() %>" alt="상품이미지" class="preview">					
		</div>
		<div class="product_desc">
			<table>
				<tr>
					<td><%=getCate.getName() %></td>
				</tr>
				<tr>
					<td><%=getProduct.getTitle() %></td>
				</tr>
				<tr>
					<td>
						<span><%=sdate.substring(0, 10)%></span>
						~
						<span><%=edate.substring(0, 10)%></span>
					</td>
				</tr>
				<tr>
					<td><%=getProduct.getPrice() %><span>원 / 일</span></td>
				</tr>
			</table>
			<%
				if(getProduct.getMember_id() == login.getMember_id()) { 
					%>					
					<div>
						<a href="goUpdate.do?product_id=<%=pid%>&category_id=<%=cid%>">수정</a>
						<a href="delProduct.do?product_id=<%=pid%>">삭제</a>
					</div>
					<%
				} else {
					%>
					<button type="button" id="requestFrmBtn">대여신청</button>
					<%					
				}
			%>
		</div>
	</div>
	
	<%-- 렌터 정보(프로필, 후기) --%>
	<div class="renter_info">
		<div class="renter_profile">
			<img scr="" alt="profile">
			<span><%=renter.getNickname() %></span>
		</div>
		<div class="renter_review">
			<%	
				if(reviewList.size() != 0) {
					for(int i=0; i<=4; i++) {
						ReviewDto r = reviewList.get(i);
						String r_nick = r_renteeNickList.get(i);
						%>
						<div class="reviewlist">
							<span><%=r_nick %></span>
							<span><%=r.getRdate() %></span>
							<span><%=r.getRating() %></span>
							<p><%=r.getContent() %></p>
						</div>
						<%
					}
				} else {
					%>
					<span>**작성된 리뷰가 없습니다.</span>
					<%
				}
			%>
		</div>
	</div>
	
	<%-- 상품 내용, 문의 --%>
	<div class="content_and_question">
		<div class="question_container">
			<table class="question">
				<%
					if(questionList.size() == 0) {
						%>
						<span>**문의 내역이 없습니다<span>
						<%
					} else {
						for(int i=0; i<questionList.size(); i++) {
							QuestionDto q = questionList.get(i);
							String q_nick = q_renteeNickList.get(i);
							%>
							<tr class="question_list">
								<td><%
									if(q.isQstate()) {
										%>
										답변완료
										<%
									} else {
										%>
										미답변
										<%
									}
								%></td>
								<td>
									<%
										if(q.isPrivate_question()) {
											%>											
											<img src="images/lock_icon.png" alt="private_question">
											<%
										}
									%>
								</td>
								<td><%=q.getTitle() %></td>
								<td><%=q.getRdate().toString().substring(0,10) %></td>
								<td><%=q_nick.substring(0,1)%>***</td>
							</tr>
							<tr class="question_con" style="display:none">
								<td colspan="4">
									<p><%=q.getContent() %></p>
								</td>
							</tr>
							<%
						}
					}
				%>
			</table>
		</div>
		<button type="button" id="goWriteBtn">문의하기</button>
	</div>
</div>

<script type="text/javascript">
$(document).ready(function(){
	// 문의글 내용
	$(".question_list").click(function() {
		$(this).next(".question_con").stop().slideToggle(300);
		$(this).toggleClass("on").siblings().removeClass("on");
		$(this).next(".question_con").siblings(".question_con").slideUp(300);
	});
	
	$("#goWriteBtn").click(function() {
		location.href="goWriteQuestion.do?product_id=<%=pid%>&category_id=<%=cid%>";
	});
});
</script>