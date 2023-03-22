<%@page import="com.sharebridge.util.HtmlUtil"%>
<%@page import="com.sharebridge.dto.QuestionDto"%>
<%@page import="com.sharebridge.dto.ReviewDto"%>
<%@page import="java.util.List"%>
<%@page import="com.sharebridge.dto.MemberDto"%>
<%@page import="com.sharebridge.dto.CategoryDto"%>
<%@page import="com.sharebridge.dto.ProductDto"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

// 상품을 등록한 사용자 아이디
int renter_id = getProduct.getMember_id();
// 현재 페이지를 보고 있는 사용자 아이디
int user_id = login.getMember_id();
%>

<div>
	<%-- 상품 정보(이미지, 카테고리, 상품명, 기간 등등) --%>
	<div class="product_info">
		<div class="product_photo">
			<img src="/sharebridge/upload/product/<%=getProduct.getPhoto() %>" alt="상품이미지" class="preview">                    
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
					<td>
						<c:choose>
							<c:when test="${isWish}">
								<img onclick="clickWish(false)" id="wish" src="/sharebridge/images/has_wish_icon.png" alt="wish">
							</c:when>
							<c:otherwise>
								<img onclick="clickWish(true)" id="wish" src="/sharebridge/images/nohas_wish_icon.png" alt="wish">
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</table>
			<div id="btn_wrap">
			<%
				if(login.getMember_id() != getProduct.getMember_id()) { 
			%>					
					<button type="button" class="btn btn-secondary" id="requestFrmBtn">대여신청</button>
			<%
				} else {
			%>
					<a href="goUpdate.do?product_id=<%=pid%>&category_id=<%=cid%>">수정</a>
					<a href="delProduct.do?product_id=<%=pid%>">삭제</a>
			<%					
				}
			%>
			</div>
		</div>
	</div>
	
	<%-- 렌터 정보(프로필, 후기) --%>
	<div class="renter_container">
	<div class="renter_info">
		<div class="renter_profile">
			<a href="sellerInfo.do?renterId=<%=renter.getMember_id() %>">
				<img src="/sharebridge/upload/profile/temp.png" alt="profile">
				<span><%=renter.getNickname() %></span>
			</a>
		</div>
		<div class="renter_review">
			<%	
				if(reviewList.size() != 0) {
					for(int i=0; i<reviewList.size(); i++) {
						ReviewDto r = reviewList.get(i);
						String r_nick = r_renteeNickList.get(i);
						%>
						<div class="reviewlist">
							<div class="reviewlist_item">
								<div class="review_rentee_info">
									<span><%=r_nick %></span>
									<span><%=r.getRdate().toString().substring(0, 10) %></span>
									<span><%=r.getRating() %></span>
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
			
			<%
				if(renter_id != user_id) {
			%>
				<div id="question_btn_wrap">
					<button type="button" class="btn" id="goWriteBtn">문의하기</button>
				</div>
			<%
				}
			%>
		</div>
	</div>
</div>

<script src="/sharebridge/js/public/common.js"></script>
<script type="text/javascript">
let product_id = <%= pid %>;
let category_id = <%= cid %>;
let renter_id = <%= renter_id %>;
let user_id = <%= user_id %>;

function clickWish(hasWish){
	$.ajax({
		type:"post",
		url: hasWish ? "addWish.do" : "removeWish.do",
		data:{ "member_id":user_id, "product_id":product_id },
		success:function(msg){
			location.reload();
		},
		error:function(e){
			alert('error',e);
		}
	});
}

$("#goWriteBtn").click(function() {
	let link = "goWriteQuestion.do?product_id=<%=pid%>&category_id=<%=cid%>";
	loginChk(link);
});

$("#requestFrmBtn").click(function() {
	let link = "goRequestFrm.do?product_id=<%=pid%>"
	loginChk(link);		
});

function loginChk(link) {
	if(<%=login.getMember_id()%> == null) {
		alert("로그인이 필요한 서비스입니다.");
		location.href="login.do";
	} else {
		location.href=link;
	}
}

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
				
				let qstate = question.qstate;
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
				content = content.replace(/\r\n/gi, "<br>");
				
				// 질문을 한 사용자 아이디
				let rentee_id = question.member_id;
				let question_id = question.question_id;
				
				let qstateHtml = "<td>";
				if(qstate) {
					qstateHtml += "답변완료";
				} else {
					qstateHtml += "미답변"
				}
				qstateHtml += "</td>";
				
				let privateQuestionHtml = "<td>";
				if(private_question) {
					privateQuestionHtml += "<img src='/sharebridge/images/lock_icon.png' alt='private_question'>";
				}
				privateQuestionHtml += "</td>";
				
				let titleHtml = "<td>" + title + "</td>";
				let rdateHtml = "<td>" + rdate + "</td>";
				let renteeNicknameHtml = "<td>" + renteeNickname + "</td>";
				
				let fullHtml = "<tr class='question_list'>";
				fullHtml += qstateHtml;
				fullHtml += privateQuestionHtml;
				fullHtml += titleHtml;
				fullHtml += rdateHtml;
				fullHtml += renteeNicknameHtml;
				fullHtml += "</tr>";
				fullHtml += "<tr class='question_con' style='display:none' question_id='" + question_id + "' reply_load='"+!qstate+"'>";
				fullHtml += "<td colspan='5'>";
				fullHtml += "<p>"+content+"</p>";
				fullHtml += "<div class='btn_wrap'>";
				if((renter_id == user_id) && !qstate) {
					fullHtml += "<button class='btn question_reply_btn'>답변하기</button>";
				}
				if(user_id == rentee_id) {
					fullHtml += "<button class='btn question_update_btn'>수정</button><button class='btn question_delete_btn'>삭제</button>";
				}
				fullHtml += "</div>";
				fullHtml += "</td>";
				fullHtml += "</tr>";
				
				question_list_wrap.append(fullHtml);
			}
			
			// 문의글 내용
			$(".question_list").click(function() {
				let $question_con = $(this).next();
				
				showQuestion($question_con);
				loadReply($question_con);
			});
			
			let showQuestion = ($now) => {
				$(".question_con").removeClass("on");
				
				$now.show();
				$now.addClass("on");
				
				$(".question_con:not(.on)").hide();
			}
			
			let loadReply = ($now) => {
				let reply_load = $now.attr("reply_load");
				
				if(reply_load == "false") {
					let question_id = $now.attr("question_id");
						
					$.ajax({
						url: "/sharebridge/reply.do",
						type: "GET",
						data: "question_id="+question_id,
						success: function(reply) {
							$now.attr("reply_load", true);
							$now.children().children("p").after("<div class='reply_wrap'><img src='/sharebridge/images/arrow_icon.png'><div class='reply_title_content_wrap'><p class='reply_title'>"+reply.title+"</p><p class='reply_content'>"+reply.content+"</p><div></div>");
						},
						error: function() {
							
						}
					});
				}
			}
			
			$(".question_container > .question_list_wrap > .question_con > td > div > .question_reply_btn").on("click", function() {
				let question_id = $(this).parent().parent().parent().attr("question_id");
				
				goTo("/sharebridge/goWriteQuestion.do?product_id="+product_id+"&category_id="+category_id+"&question_id="+question_id+"&status=reply");
			});
			
			$(".question_container > .question_list_wrap > .question_con > td > div > .question_update_btn").on("click", function() {
				let question_id = $(this).parent().parent().parent().attr("question_id");
				
				goTo("/sharebridge/goWriteQuestion.do?product_id="+product_id+"&category_id="+category_id+"&question_id="+question_id+"&status=update");
			});
			
			$(".question_container > .question_list_wrap > .question_con > td > div > .question_delete_btn").on("click", function() {
				let question_id = $(this).parent().parent().parent().attr("question_id");
				
				if(confirm("문의를 삭제하시겠습니까?\n삭제된 문의는 복구할 수 없습니다")) {
					$.ajax({
						url: "/sharebridge/question/delete.do",
						type: "POST",
						data: "question_id="+question_id,
						success: function() {
							alert("문의가 삭제됐습니다\n페이지를 새로고침합니다.");
							
							location.reload();
						}
					});
				}
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