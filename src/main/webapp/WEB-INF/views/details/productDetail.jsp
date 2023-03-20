<%@page import="com.sharebridge.util.HtmlUtil"%>
<%@page import="com.sharebridge.dto.QuestionDto"%>
<%@page import="com.sharebridge.dto.ReviewDto"%>
<%@page import="java.util.List"%>
<%@page import="com.sharebridge.dto.MemberDto"%>
<%@page import="com.sharebridge.dto.CategoryDto"%>
<%@page import="com.sharebridge.dto.ProductDto"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/sharebridge/css/details/productDetail.css">

<%
HtmlUtil hu = new HtmlUtil();

ProductDto getProduct = (ProductDto)request.getAttribute("detail");
CategoryDto getCate = (CategoryDto)request.getAttribute("getCate");
MemberDto login = (MemberDto)session.getAttribute("login");
MemberDto renter = (MemberDto)request.getAttribute("renter");
List<ReviewDto> reviewList = (List<ReviewDto>)request.getAttribute("review");
List<String> r_renteeNickList = (List<String>)request.getAttribute("r_renteeNick");
int questionCount = (int) request.getAttribute("questionCount");

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
				<tr id="category">
					<td><%=getCate.getName() %></td>
				</tr>
				<tr id="title">
					<td><%=getProduct.getTitle() %></td>
				</tr>
				<tr id="s_e_date">
					<td>
						<span><%=sdate.substring(0, 10)%></span>
						~
						<span><%=edate.substring(0, 10)%></span>
					</td>
				</tr>
				<tr id="price">
					<td><%=getProduct.getPrice() %><span>원 / 일</span></td>
					<td><i class="fa-regular fa-heart"></i></td>
				</tr>
			</table>
			<div id="btn_wrap">
			<%
				if(login == null || login.getMember_id() != getProduct.getMember_id()) { 
			%>					
					<a href="goUpdate.do?product_id=<%=pid%>&category_id=<%=cid%>">수정</a>
					<a href="delProduct.do?product_id=<%=pid%>">삭제</a>
			<%
				} else {
			%>
					<button type="button" class="btn btn-secondary" id="requestFrmBtn">대여신청</button>
			<%					
				}
			%>
			</div>
		</div>
	</div>
	
	<%-- 렌터 정보(프로필, 후기) --%>
	<div class="renter_info">
		<div class="renter_profile">
			<img src="/sharebridge/upload/profile/temp.png" alt="profile">
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
							<div class="reviewlist_item">
								<div class="review_rentee_info">
									<span><%=r_nick %></span>
									<span><%=r.getRating() %></span>
									<span><%=r.getRdate() %></span>
								</div>
								<p class="review_contents"><%=r.getContent() %></p>
							</div>
						</div>
						<%
					}
				} else {
					%>
					<span id="no_review_wrap">**작성된 리뷰가 없습니다.</span>
					<%
				}
			%>
		</div>
	</div>
	
	<%-- 상품 내용, 문의 --%>
	<div class="content_and_question">
		<div id="tap_wrap">
			<div class="tap active">상품정보</div>
			<div class="tap">문의</div>
		</div>
		
		<div id="contents_container">
			<%= hu.strToHtml(getProduct.getContent()) %>
		</div>
		
		<div class="question_container" load="<%= questionCount == 0%>">
			<table class="question_list_wrap">
				<%
					if(questionCount == 0) {
				%>
					<tr class="no_question">
						<td><span>**문의 내역이 없습니다</span></td>
					</tr>
				<%
					}
				%>
			</table>
			
			<nav id="question_pagination">
				<ul class="pagination">
					<%
						if(questionCount != 0) {
							int roofAmount = questionCount / 10;
							if(questionCount % 10 != 0) {
								roofAmount += 1;
							}
							
							for(int i=1; i<=roofAmount; i++) {
					%>
								<li class="page-item <%= i== 1 ? "active" : "" %>"><a class="page-link"><%=i %></a></li>
					<%
							}
						}
					%>
				</ul>
			</nav>
			
			<div id="question_btn_wrap">
				<button type="button" class="btn" id="goWriteBtn">문의하기</button>
			</div>
		</div>
	</div>
</div>

<script src="/sharebridge/js/public/common.js"></script>
<script type="text/javascript">
$("#goWriteBtn").click(function() {
	location.href="goWriteQuestion.do?product_id=<%=pid%>&category_id=<%=cid%>";
});

let loadNewData = (product_id, page) => {
	$.ajax({
		url: "/sharebridge/question/question_list.do",
		type: "GET",
		data: "product_id="+product_id+"&page="+page,
		success: function(questionList) {
			$(".question_container .question_list_wrap").empty();
			
			let question_list_wrap = $(".question_container > .question_list_wrap");
			
			for(let i=0; i<questionList.length; i++) {
				let question = questionList[i];
				
				let state = question.qstate;
				let private_question = question.private_question;
				let title = question.title;
				let rdate = question.rdate;
				if(rdate[1] < 10) {
					rdate[1] = "0" + rdate[1];
				}
				if(rdate[2] < 10) {
					rdate[2] = "0" + rdate[2];
				}
				rdate = rdate[0] + "-" + rdate[1] + "-" + rdate[2];
				
				let renteeNickname = question.renteeNickname.substring(0, 1) + "***";
				let content = question.content;
				content = content.replace("\r\n", "<br>");
				
				let stateHtml = "<td>";
				if(state) {
					stateHtml += "답변완료";
				} else {
					stateHtml += "미답변"
				}
				stateHtml += "</td>";
				
				let privateQuestionHtml = "<td>";
				if(private_question) {
					privateQuestionHtml += "<img src='/sharebridge/images/lock_icon.png' alt='private_question'>";
				}
				privateQuestionHtml += "</td>";
				
				let titleHtml = "<td>" + title + "</td>";
				let rdateHtml = "<td>" + rdate + "</td>";
				let renteeNicknameHtml = "<td>" + renteeNickname + "</td>";
				
				let fullHtml = "<tr class='question_list'>";
				fullHtml += stateHtml;
				fullHtml += privateQuestionHtml;
				fullHtml += titleHtml;
				fullHtml += rdateHtml;
				fullHtml += renteeNicknameHtml;
				fullHtml += "</tr>";
				fullHtml += "<tr class='question_con' style='display:none'>";
				fullHtml += "<td colspan='5'><p>"+content+"</p></td>";
				fullHtml += "</tr>";
				
				question_list_wrap.append(fullHtml);
			}
			
			// 문의글 내용
			$(".question_list").click(function() {
				$(this).next(".question_con").stop().slideToggle(300);
				$(this).toggleClass("on").siblings().removeClass("on");
				$(this).next(".question_con").siblings(".question_con").slideUp(300);
			});
		},
		error: function() {
			
		}
	});
}

let transTap = () => {
	let $this = $("#tap_wrap > .tap:not(.active)");
	let $other = $("#tap_wrap > .tap.active");
	
	$this.addClass("active");
	$this.off("click");
	
	$other.removeClass("active");
	$other.on("click", activeTap);
}

let loadTapData = () => {
	let $this = $("#tap_wrap > .tap.active");
	let tapTitle = $this.text();
	
	if(tapTitle == "상품정보") {
		$("#contents_container").css("display", "block");
		$(".question_container").css("display", "none");
	} else {
		$("#contents_container").css("display", "none");
		$(".question_container").css("display", "block");
		
		let load = $(".question_container").attr("load");
		if(load == "false") {
			let product_id = getParameter("product_id");
			
			loadNewData(product_id, 1);
			
			$(".question_container").attr("load", "true");
		}
	}
}

let activeTap = () => {
	transTap();
	loadTapData();
}

$("#tap_wrap > .tap:not(.active)").on("click", activeTap);

$("#question_pagination > .pagination .page-item").on("click", function() {
	if(!$(this).hasClass("active")) {
		let product_id = getParameter("product_id");
		let page = $(this).text();
		
		loadNewData(product_id, page);
		
		$("#question_pagination > .pagination .page-item").removeClass("active");
		$(this).addClass("active");
	}
});
</script>